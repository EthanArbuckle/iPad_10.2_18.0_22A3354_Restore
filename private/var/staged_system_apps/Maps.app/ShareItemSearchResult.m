@implementation ShareItemSearchResult

- (ShareItemSearchResult)initWithSearchResult:(id)a3 contact:(id)a4 includePrintActivity:(BOOL)a5 applicationActivities:(id)a6
{
  id v10;
  id v11;
  id v12;
  ShareItemSearchResult *v13;
  ShareItemSearchResult *v14;
  SearchResult *v15;
  SearchResult *searchResult;
  ShareItemSearchResult *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ShareItemSearchResult;
  v13 = -[ShareItemSearchResult init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extraAppActivities, a6);
    v15 = (SearchResult *)objc_msgSend(v10, "copy");
    searchResult = v14->_searchResult;
    v14->_searchResult = v15;

    objc_storeStrong((id *)&v14->_contact, a4);
    v14->_includePrintActivity = a5;
    objc_storeStrong((id *)&v14->_extraAppActivities, a6);
    v17 = v14;
  }

  return v14;
}

- (NSArray)activityProviders
{
  NSArray *activityProviders;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[4];

  activityProviders = self->_activityProviders;
  if (!activityProviders)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemSearchResult mapItem](self, "mapItem"));
    v5 = objc_msgSend(objc_alloc((Class)MUPlaceTextActivityProvider), "initWithMapItem:", v4);
    v6 = objc_msgSend(objc_alloc((Class)MUPlaceURLActivityProvider), "initWithMapItem:", v4);
    v7 = objc_msgSend(objc_alloc((Class)MUPlaceMapItemActivityProvider), "initWithMapItem:", v4);
    v8 = objc_msgSend(objc_alloc((Class)MUPlaceLinkPresentationActivityProvider), "initWithMapItem:", v4);
    v12[0] = v5;
    v12[1] = v6;
    v12[2] = v7;
    v12[3] = v8;
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
    v10 = self->_activityProviders;
    self->_activityProviders = v9;

    activityProviders = self->_activityProviders;
  }
  return activityProviders;
}

- (void)setActivityProviderDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemSearchResult activityProviders](self, "activityProviders", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setDelegate:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)applicationActivities
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  PushToDeviceActivity *v13;
  MapsPrintActivity *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemSearchResult pushSubmissionData](self, "pushSubmissionData"));
    if (v6)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsPushManager defaultManager](MapsPushManager, "defaultManager", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "devices"));

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = -[PushToDeviceActivity initWithDevice:place:]([PushToDeviceActivity alloc], "initWithDevice:place:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12), self);
            objc_msgSend(v3, "addObject:", v13);

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

    }
  }
  if (-[ShareItemSearchResult includePrintActivity](self, "includePrintActivity"))
  {
    v14 = objc_alloc_init(MapsPrintActivity);
    objc_msgSend(v3, "addObject:", v14);

  }
  if (-[NSArray count](self->_extraAppActivities, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_extraAppActivities);
  v15 = objc_msgSend(v3, "copy");

  return (NSArray *)v15;
}

- (NSArray)excludedActivityTypes
{
  UIActivityType v3;

  v3 = UIActivityTypeAddToReadingList;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (NSArray)includedActivityTypes
{
  return 0;
}

- (id)mapItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemSearchResult searchResult](self, "searchResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));

  return v3;
}

- (void)_setupCustomFeatureStore
{
  _MKCustomFeatureStore *v3;
  _MKCustomFeatureStore *customFeatureStore;

  v3 = (_MKCustomFeatureStore *)objc_msgSend(objc_alloc((Class)_MKCustomFeatureStore), "initWithClustering:", 0);
  customFeatureStore = self->_customFeatureStore;
  self->_customFeatureStore = v3;

}

- (void)_setupCustomFeatureForMapItem
{
  void *v3;
  _ShareCustomFeature *v4;
  _ShareCustomFeature *shareCustomFeature;
  _MKCustomFeatureStore *customFeatureStore;
  void *v7;
  _ShareCustomFeature *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareItemSearchResult mapItem](self, "mapItem"));
  v4 = (_ShareCustomFeature *)objc_claimAutoreleasedReturnValue(+[_ShareCustomFeature customFeatureForMapItem:](_ShareCustomFeature, "customFeatureForMapItem:", v3));
  shareCustomFeature = self->_shareCustomFeature;
  self->_shareCustomFeature = v4;

  customFeatureStore = self->_customFeatureStore;
  v8 = self->_shareCustomFeature;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  -[_MKCustomFeatureStore addAnnotations:](customFeatureStore, "addAnnotations:", v7);

}

- (GEOComposedRoute)route
{
  return 0;
}

- (NSData)pushSubmissionData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult bookmarkRepresentation](self->_searchResult, "bookmarkRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return (NSData *)v3;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)includePrintActivity
{
  return self->_includePrintActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_activityProviders, 0);
  objc_storeStrong((id *)&self->_extraAppActivities, 0);
  objc_storeStrong((id *)&self->_shareCustomFeature, 0);
  objc_storeStrong((id *)&self->_customFeatureStore, 0);
}

@end
