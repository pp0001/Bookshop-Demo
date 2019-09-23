using my.bookshop as bookshop from '../db/data-model';


service CatalogService {
    entity Books @readonly as projection on bookshop.Books;
	entity Authors @readonly as projection on bookshop.Authors;
	entity Orders @insertonly as projection on bookshop.Orders;
}

service BusinessService {
    entity CustomersRemote as projection on bookshop.CustomersRemote;
	entity Customers as projection on bookshop.Customers;
	function fetchCustomers() returns Integer; // number of customers fetched
}
