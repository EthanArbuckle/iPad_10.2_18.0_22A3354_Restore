@implementation NavSARAPIController

- (void)fetchSARCategoriesOnCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  char *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  uint8_t buf[8];
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSARAPIController fetchCategoriesTicket](self, "fetchCategoriesTicket"));
  -[NavSARAPIController setTicket:](self, "setTicket:", v5);

  objc_initWeak(&location, self);
  v6 = sub_1003F411C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (char *)os_signpost_id_generate(v7);

  v9 = sub_1003F411C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v8, "FetchingSARCategories", ", buf, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavSARAPIController ticket](self, "ticket"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003F415C;
  v14[3] = &unk_1011ADD38;
  objc_copyWeak(v16, &location);
  v16[1] = v8;
  v13 = v4;
  v15 = v13;
  objc_msgSend(v12, "submitWithHandler:networkActivity:", v14, 0);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

- (void)cancelFetchingSARCategories
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavSARAPIController ticket](self, "ticket"));
  objc_msgSend(v2, "cancel");

}

- (NSArray)categories
{
  return self->_categories;
}

- (id)fetchCategoriesTicket
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultTraits"));

  objc_msgSend(v3, "setNavigating:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v4, "isInNavigatingState"))
    v5 = objc_msgSend(v4, "navigationTransportType");
  else
    v5 = objc_msgSend(v4, "desiredTransportType");
  objc_msgSend(v3, "setNavigationTransportType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedTraitsForCurrentGarageState:", v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForCategoryListWithTraits:isFromNoQueryState:", v7, 0));

  return v9;
}

- (MKMapServiceCategoriesTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
