namespace my.bookshop;
using { Country, managed } from '@sap/cds/common';

using API_BUSINESS_PARTNER as bp from '../srv/external/csn/ODataServiceforBusinessPartner';

@cds.persistence.skip
entity CustomersRemote as SELECT from bp.A_BusinessPartnerType {
  key BusinessPartner                                                                   as ID,
  BusinessPartnerFullName                                                               as Name,
  to_BusinessPartnerAddress[0].to_EmailAddress[IsDefaultEmailAddress=true].EmailAddress as Email
}where IsNaturalPerson = 'X';

@cds.persistence: { skip: false, table: true }  // make the entity a table on DB
entity Customers as projection on CustomersRemote;

entity Books {
  key ID : Integer;
  title  : localized String;
  author : Association to Authors;
  stock  : Integer;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders : managed {
  key ID  : UUID;
  book    : Association to Books;
  buyer   : String;
  date   : DateTime;
  amount : Integer;
  country : Country;
}