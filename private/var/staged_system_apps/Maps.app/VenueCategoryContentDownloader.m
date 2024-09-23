@implementation VenueCategoryContentDownloader

- (VenueCategoryContentDownloader)initWithDelegate:(id)a3 venueCategoryCardItem:(id)a4
{
  id v6;
  id v7;
  VenueCategoryContentDownloader *v8;
  VenueCategoryContentDownloader *v9;
  uint64_t v10;
  MKMapItem *mapItem;
  id WeakRetained;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VenueCategoryContentDownloader;
  v8 = -[VenueCategoryContentDownloader init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueMapItem"));
    mapItem = v9->_mapItem;
    v9->_mapItem = (MKMapItem *)v10;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
    objc_msgSend(WeakRetained, "venueCategoryContentDownloader:didChangeMapItem:", v9, v9->_mapItem);

  }
  return v9;
}

- (VenueCategoryContentDownloader)initWithDelegate:(id)a3 venueAutoCompleteCategoryCardItem:(id)a4
{
  id v6;
  id v7;
  VenueCategoryContentDownloader *v8;
  VenueCategoryContentDownloader *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  VenueCategoryContentDownloader *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VenueCategoryContentDownloader;
  v8 = -[VenueCategoryContentDownloader init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueIdentifier"));
    v11 = objc_msgSend(v10, "businessID");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10060A938;
    v13[3] = &unk_1011AF308;
    v14 = v9;
    -[VenueCategoryContentDownloader fetchVenueMapItemWithBusinessID:completion:](v14, "fetchVenueMapItemWithBusinessID:completion:", v11, v13);

  }
  return v9;
}

- (void)fetchVenueMapItemWithBusinessID:(unint64_t)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = objc_alloc((Class)MKMapItemIdentifier);
  v7 = objc_msgSend(v6, "initWithMUID:resultProviderID:coordinate:", a3, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v13 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForIdentifiers:traits:", v9, 0));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10060AB18;
    v11[3] = &unk_1011AE268;
    v12 = v5;
    objc_msgSend(v10, "submitWithHandler:networkActivity:", v11, 0);

  }
}

- (void)performSearchWithSearchCategory:(id)a3 subcategoriesType:(int)a4 filter:(id)a5 shouldFrameMapViewport:(BOOL)a6 actionCoordination:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  VenueCategoryItem *v22;
  id v23;

  v8 = a6;
  v23 = a3;
  v12 = a5;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader mapItem](self, "mapItem"));

  if (v14)
  {
    -[VenueCategoryContentDownloader setCurrentSearchShouldFrameMapViewport:](self, "setCurrentSearchShouldFrameMapViewport:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader mapItem](self, "mapItem"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_venueInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "venueIdentifier"));

    if (a4 == 2)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filterID"));
      v19 = (void *)v18;
      if (v18)
        v20 = (void *)v18;
      else
        v20 = v17;
      v21 = v20;

      v17 = v21;
    }
    v22 = -[VenueCategoryItem initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:]([VenueCategoryItem alloc], "initWithSearchCategory:venueIdentifier:displayMode:isAutoCompleteCategory:shouldFrameMapViewport:", v23, v17, objc_msgSend(v23, "displayMode"), 0, -[VenueCategoryContentDownloader currentSearchShouldFrameMapViewport](self, "currentSearchShouldFrameMapViewport"));
    -[VenueCategoryContentDownloader performSearchWithVenueCategoryItem:actionCoordination:](self, "performSearchWithVenueCategoryItem:actionCoordination:", v22, v13);

  }
}

- (void)performSearchWithVenueCategoryItem:(id)a3 actionCoordination:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
  v8 = objc_opt_class(UIViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v6, "viewController:doSearchItem:withUserInfo:", v10, v11, 0);
}

- (void)searchWillStart
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
  objc_msgSend(v3, "venueCategoryContentDownloaderDidStart:", self);

}

- (void)searchDidFail
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
  objc_msgSend(v3, "venueCategoryContentDownloaderDidFail:", self);

}

- (void)searchDidCancel
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
  objc_msgSend(v3, "venueCategoryContentDownloaderDidCancel:", self);

}

- (void)searchDidReceiveEVChargerUpdates:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "venueDidReceiveEVChargerUpdates:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
    objc_msgSend(v6, "venueDidReceiveEVChargerUpdates:", v7);

  }
}

- (void)searchDidReceiveResults:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
  objc_msgSend(v5, "venueCategoryContentDownloader:didReceiveSearchResults:shouldSwitchToBestFloor:", self, v4, -[VenueCategoryContentDownloader currentSearchShouldFrameMapViewport](self, "currentSearchShouldFrameMapViewport"));

}

- (void)searchDidReceiveAutoCompleteSubcategories:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryContentDownloader delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subcategories"));
  objc_msgSend(v4, "venueCategoryContentDownloader:didReceiveAutoCompleteSubcategories:subcategoriesType:", self, v5, objc_msgSend(v6, "subCategoryType"));

}

- (VenueCategoryContentDownloaderDelegate)delegate
{
  return (VenueCategoryContentDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
  objc_storeStrong((id *)&self->_searchCategory, a3);
}

- (BOOL)currentSearchShouldFrameMapViewport
{
  return self->_currentSearchShouldFrameMapViewport;
}

- (void)setCurrentSearchShouldFrameMapViewport:(BOOL)a3
{
  self->_currentSearchShouldFrameMapViewport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
