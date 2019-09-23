package my.bookshop;

import java.util.ArrayList;
import java.util.List;

import com.sap.cloud.sdk.service.prov.api.*;
import com.sap.cloud.sdk.service.prov.api.annotations.*;
import com.sap.cloud.sdk.service.prov.api.exits.*;
import com.sap.cloud.sdk.service.prov.api.request.*;
import com.sap.cloud.sdk.service.prov.api.response.*;
import org.slf4j.*;

public class BookService {
	
	private static final Logger LOG = LoggerFactory.getLogger (OrdersService.class.getName());

	  @AfterRead (entity = "Books", serviceName="CatalogService")
	  public ReadResponse afterReadOrders (ReadRequest req, ReadResponseAccessor res, ExtensionHelper h) {
	  	LOG.info ("##### Books - beforeReadBooks ########");
	    EntityData ed = res.getEntityData();
	    Integer stock = 0;
	    EntityData ex = EntityData.getBuilder(ed).addElement("stock", stock).buildEntityData("Books");
	    return ReadResponse.setSuccess().setData(ex).response();
	  }
}
