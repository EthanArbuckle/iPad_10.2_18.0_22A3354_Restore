@implementation GuidanceSearchResultsCategoryDataProvider

- (GuidanceSearchResultsCategoryDataProvider)initWithSearchItem:(id)a3 mapService:(id)a4 chromeViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  GuidanceSearchResultsCategoryDataProvider *v12;
  GuidanceSearchResultsCategoryDataProvider *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workerQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GuidanceSearchResultsCategoryDataProvider;
  v12 = -[GuidanceSearchResultsCategoryDataProvider init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchItem, a3);
    objc_storeStrong((id *)&v13->_mapService, a4);
    objc_storeStrong((id *)&v13->_chromeViewController, a5);
    v14 = dispatch_queue_create("GuidanceSearchResultsCategoryDataProvider.workerQueue", 0);
    workerQueue = v13->_workerQueue;
    v13->_workerQueue = (OS_dispatch_queue *)v14;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[MKMapServiceTicket cancel](self->_searchTicket, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)GuidanceSearchResultsCategoryDataProvider;
  -[GuidanceSearchResultsCategoryDataProvider dealloc](&v3, "dealloc");
}

- (void)_submitTicket:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider searchTicket](self, "searchTicket"));
  objc_msgSend(v8, "cancel");

  -[GuidanceSearchResultsCategoryDataProvider setSearchTicket:](self, "setSearchTicket:", v6);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100536FAC;
  v11[3] = &unk_1011BAA28;
  v11[4] = self;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "submitWithHandler:networkActivity:", v11, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_handleResponseForTicket:(id)a3 mapItems:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider searchTicket](self, "searchTicket"));

  if (v14 == v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider searchTicket](self, "searchTicket"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "categorySearchResultSection"));
    -[GuidanceSearchResultsCategoryDataProvider setCategorySearchResultSection:](self, "setCategorySearchResultSection:", v16);

    -[GuidanceSearchResultsCategoryDataProvider setSearchTicket:](self, "setSearchTicket:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100537224;
    block[3] = &unk_1011B5ED8;
    v20 = v12;
    v18 = v10;
    v19 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider searchItem](self, "searchItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider categorySearchResultSection](self, "categorySearchResultSection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subHeaderDisplayName"));

  return (NSString *)v3;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider searchItem](self, "searchItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "styleAttributes"));

  return (GEOFeatureStyleAttributes *)v4;
}

- (void)loadSearchResultsWithRouteInfo:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  GuidanceSearchResultsCategoryDataProvider *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;

  v27 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentTraits"));

  objc_msgSend(v8, "setNavigating:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v28 = v9;
  if (objc_msgSend(v9, "isInNavigatingState"))
    v10 = objc_msgSend(v9, "navigationTransportType");
  else
    v10 = objc_msgSend(v9, "desiredTransportType");
  objc_msgSend(v8, "setNavigationTransportType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updatedTraitsForCurrentGarageState:", v8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider mapService](self, "mapService"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider searchItem](self, "searchItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "searchCategory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalWaypointRouteRepresentation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyRouteRepresentation"));
  v25 = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeAttributes"));

  LODWORD(v24) = 10;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ticketForSearchAlongRouteWithCategory:searchQuery:completionItem:originalWaypointRouteData:zilchData:sessionState:routeId:routeAttributes:maxResults:traits:searchSessionData:", v14, 0, 0, v15, v16, v17, v18, v19, v24, v26, 0));

  v21 = objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsCategoryDataProvider workerQueue](v25, "workerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10053755C;
  block[3] = &unk_1011AECC0;
  block[4] = v25;
  v30 = v20;
  v31 = v27;
  v22 = v27;
  v23 = v20;
  dispatch_async(v21, block);

}

- (SearchFieldItem)searchItem
{
  return self->_searchItem;
}

- (MKMapService)mapService
{
  return self->_mapService;
}

- (IOSBasedChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (MKMapServiceTicket)searchTicket
{
  return self->_searchTicket;
}

- (void)setSearchTicket:(id)a3
{
  objc_storeStrong((id *)&self->_searchTicket, a3);
}

- (GEOCategorySearchResultSection)categorySearchResultSection
{
  return self->_categorySearchResultSection;
}

- (void)setCategorySearchResultSection:(id)a3
{
  objc_storeStrong((id *)&self->_categorySearchResultSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorySearchResultSection, 0);
  objc_storeStrong((id *)&self->_searchTicket, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->_mapService, 0);
  objc_storeStrong((id *)&self->_searchItem, 0);
}

@end
