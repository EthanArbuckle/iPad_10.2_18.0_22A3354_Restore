@implementation BrowseManager

+ (id)sharedContentCache:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  BrowseManagerContentCache *v6;

  v3 = (__CFString *)a3;
  if (qword_1014D3350 != -1)
    dispatch_once(&qword_1014D3350, &stru_1011C6E60);
  v4 = CFSTR("BrowseManagerDefaultContentCache");
  if (v3)
    v4 = v3;
  v5 = v4;
  v6 = (BrowseManagerContentCache *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3348, "objectForKeyedSubscript:", v5));
  if (!v6)
  {
    v6 = objc_opt_new(BrowseManagerContentCache);
    -[BrowseManagerContentCache setNeedsRefresh:](v6, "setNeedsRefresh:", 1);
    -[BrowseManagerContentCache setDiskCachingKey:](v6, "setDiskCachingKey:", v3);
    objc_msgSend((id)qword_1014D3348, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

- (void)imageForCategory:(id)a3 scale:(double)a4 resultHandler:(id)a5
{
  -[BrowseManager imageForCategory:scale:isCarplay:resultHandler:](self, "imageForCategory:scale:isCarplay:resultHandler:", a3, 0, a5, a4);
}

- (void)imageForCategory:(id)a3 scale:(double)a4 isCarplay:(BOOL)a5 resultHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManager imageManager](self, "imageManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
  objc_msgSend(v13, "imageForCategory:scale:traits:isCarplay:resultHandler:", v11, v12, v6, v10, a4);

}

- (id)synchronousImageForCategory:(id)a3 scale:(double)a4 isCarplay:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager imageManager](self, "imageManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "synchronousImageForCategory:scale:traits:isCarplay:", v8, v10, v5, a4));

  return v11;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007B3584;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D3360 != -1)
    dispatch_once(&qword_1014D3360, block);
  return (id)qword_1014D3358;
}

- (BrowseManager)init
{
  return -[BrowseManager initWithCacheKey:](self, "initWithCacheKey:", 0);
}

- (BrowseManager)initWithCacheKey:(id)a3
{
  id v5;
  BrowseManager *v6;
  BrowseManager *v7;
  id v8;
  uint64_t v9;
  BrowseManagerContentCache *contentCache;
  uint64_t v11;
  GEOMapServiceTraits *traits;
  uint64_t v13;
  NSHashTable *observers;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BrowseManager;
  v6 = -[BrowseManager init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cacheKey, a3);
    v8 = objc_msgSend((id)objc_opt_class(v7), "sharedContentCache:", v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    contentCache = v7->_contentCache;
    v7->_contentCache = (BrowseManagerContentCache *)v9;

    v11 = objc_claimAutoreleasedReturnValue(-[BrowseManagerContentCache latestTraits](v7->_contentCache, "latestTraits"));
    traits = v7->_traits;
    v7->_traits = (GEOMapServiceTraits *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v13;

  }
  return v7;
}

- (BOOL)sharesCacheWithManager:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cacheKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager cacheKey](self, "cacheKey"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (void)setCacheKey:(id)a3
{
  id v4;
  NSString *v5;
  NSString *cacheKey;
  id v7;
  BrowseManagerContentCache *v8;
  BrowseManagerContentCache *contentCache;
  GEOMapServiceTraits *v10;
  GEOMapServiceTraits *traits;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  cacheKey = self->_cacheKey;
  self->_cacheKey = v5;

  v7 = objc_msgSend((id)objc_opt_class(self), "sharedContentCache:", v4);
  v8 = (BrowseManagerContentCache *)objc_claimAutoreleasedReturnValue(v7);

  contentCache = self->_contentCache;
  self->_contentCache = v8;

  v10 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(-[BrowseManagerContentCache latestTraits](self->_contentCache, "latestTraits"));
  traits = self->_traits;
  self->_traits = v10;

}

+ (void)setCacheKey:(id)a3 writesToDisk:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(a1), "sharedContentCache:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  objc_msgSend(v8, "setWritesToDisk:", v4);
}

- (BrowseImageManager)imageManager
{
  BrowseImageManager *imageManager;
  BrowseImageManager *v4;
  BrowseImageManager *v5;
  id WeakRetained;

  imageManager = self->_imageManager;
  if (!imageManager)
  {
    v4 = objc_opt_new(BrowseImageManager);
    v5 = self->_imageManager;
    self->_imageManager = v4;

    -[BrowseImageManager setBrowseManager:](self->_imageManager, "setBrowseManager:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
    -[BrowseImageManager setUserInterfaceDelegate:](self->_imageManager, "setUserInterfaceDelegate:", WeakRetained);

    imageManager = self->_imageManager;
  }
  return imageManager;
}

- (void)setImageManager:(id)a3
{
  BrowseImageManager *v5;
  BrowseImageManager *v6;

  v5 = (BrowseImageManager *)a3;
  if (self->_imageManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_imageManager, a3);
    -[BrowseImageManager setBrowseManager:](self->_imageManager, "setBrowseManager:", self);
    v5 = v6;
  }

}

+ (BOOL)traitsIsForCurrentLocationOnly:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapRegion"));
  v4 = v3 == 0;

  return v4;
}

+ (id)nearbyCacheKeyForTraits:(id)a3
{
  return 0;
}

+ (BOOL)alreadyHasCategoriesForTraits:(id)a3
{
  id v4;
  BrowseManager *v5;
  void *v6;
  BrowseManager *v7;
  void *v8;

  v4 = a3;
  v5 = [BrowseManager alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "nearbyCacheKeyForTraits:", v4));
  v7 = -[BrowseManager initWithCacheKey:](v5, "initWithCacheKey:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager cachedCategoriesForTraits:](v7, "cachedCategoriesForTraits:", v4));
  LOBYTE(v4) = objc_msgSend(v8, "count") != 0;

  return (char)v4;
}

+ (void)checkIfNearbyIsAvailableForTraits:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1007B3AE8;
  v20[3] = &unk_1011B2188;
  v23 = a1;
  v8 = v6;
  v21 = v8;
  v9 = v7;
  v22 = v9;
  v10 = objc_retainBlock(v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapRegion"));
  if (v11)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceLocation"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1007B3CD8;
      v15[3] = &unk_1011C6E88;
      v17 = v9;
      v19 = a1;
      v16 = v8;
      v18 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "singleLocationUpdateWithDesiredAccuracy:handler:timeout:", v15, kCLLocationAccuracyThreeKilometers, 30.0));

      objc_msgSend(v14, "start");
      goto LABEL_5;
    }
  }
  ((void (*)(_QWORD *))v10[2])(v10);
LABEL_5:

}

+ (void)updateMapRegionInTraits:(id)a3 withLocation:(id)a4
{
  id v5;
  id v6;
  MKMapPoint v7;
  double v8;
  double v9;
  double height;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  CLLocationCoordinate2D v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "coordinate");
  v7 = MKMapPointForCoordinate(v16);
  v8 = v7.y + -75.0;
  v9 = v7.y + 75.0;
  if (v7.y + -75.0 >= 0.0)
  {
    height = MKMapSizeWorld.height;
    if (v9 > height)
      v8 = v8 + height - v9;
  }
  else
  {
    v9 = v9 - v8;
    height = MKMapSizeWorld.height;
  }
  v12 = fmax(v8, 0.0);
  if (v9 >= height)
    v13 = height;
  else
    v13 = v9;
  v11 = v7.x + 75.0;
  v15 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v7.x + -75.0, v12, v11 - (v7.x + -75.0), v13 - v12);
  objc_msgSend(v6, "setMapRegion:", v15);
  v14 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v5);

  objc_msgSend(v6, "setDeviceLocation:", v14);
}

- (id)searchForCategory:(id)a3 source:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (a5)
  {
    v9 = a5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
    objc_msgSend(v10, "setSource:", v6);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1007B3FD4;
    v18[3] = &unk_1011C6EB0;
    v12 = v8;
    v19 = v12;
    objc_msgSend(v11, "updateCacheWithBlock:", v18);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "updatedTraitsForCurrentGarageState:", v14));
    -[BrowseManager setTraits:](self, "setTraits:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager submitTicketForSearchForCategory:source:completion:](self, "submitTicketForSearchForCategory:source:completion:", v12, v6, v9));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)submitTicketForSearchForCategory:(id)a3 source:(int)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  NavigationRouteHistoryInfoProvider *v11;
  void *v12;
  NavigationRouteHistoryInfoProvider *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v30;
  id v31;
  BrowseManager *v32;
  _QWORD v33[4];
  id v34;
  BrowseManager *v35;
  id v36;
  id v37;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
  v10 = objc_msgSend(v9, "navigating");

  if (v10)
  {
    v11 = [NavigationRouteHistoryInfoProvider alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v13 = -[NavigationRouteHistoryInfoProvider initWithNavigationService:](v11, "initWithNavigationService:", v12);

    v31 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider originalWaypointRouteRepresentation](v13, "originalWaypointRouteRepresentation"));
    v32 = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider legacyRouteRepresentation](v13, "legacyRouteRepresentation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider sessionState](v13, "sessionState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider routeId](v13, "routeId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider routeAttributes](v13, "routeAttributes"));
    v20 = +[MKMapService searchMaxResults](MKMapService, "searchMaxResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](v32, "traits"));
    LODWORD(v30) = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ticketForSearchAlongRouteWithCategory:searchQuery:completionItem:originalWaypointRouteData:zilchData:sessionState:routeId:routeAttributes:maxResults:traits:searchSessionData:", v7, 0, 0, v15, v16, v17, v18, v19, v30, v21, 0));

    v8 = v31;
    self = v32;

  }
  else
  {
    v13 = (NavigationRouteHistoryInfoProvider *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v23 = +[MKMapService searchMaxResults](MKMapService, "searchMaxResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider ticketForCategory:maxResults:traits:searchSessionData:](v13, "ticketForCategory:maxResults:traits:searchSessionData:", v7, v23, v14, 0));
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1007B4290;
  v33[3] = &unk_1011C6ED8;
  v37 = v8;
  v24 = v22;
  v34 = v24;
  v35 = self;
  v36 = v7;
  v25 = v7;
  v26 = v8;
  objc_msgSend(v24, "submitWithRefinedHandler:networkActivity:", v33, 0);
  v27 = v36;
  v28 = v24;

  return v28;
}

- (BOOL)needsRefresh
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  v3 = objc_msgSend(v2, "needsRefresh");

  return v3;
}

- (id)cellImageForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager imageManager](self, "imageManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transparentImageForCategory:", v4));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setTraits:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GEOMapServiceTraits *v7;
  GEOMapServiceTraits *traits;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  objc_msgSend(v5, "setLatestTraits:", v4);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "latestTraits"));
  v7 = (GEOMapServiceTraits *)objc_msgSend(v6, "copy");
  traits = self->_traits;
  self->_traits = v7;

}

- (void)setUserInterfaceDelegate:(id)a3
{
  MapsUIImageCacheUserInterfaceDelegate **p_userInterfaceDelegate;
  id v5;

  p_userInterfaceDelegate = &self->_userInterfaceDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_userInterfaceDelegate, v5);
  -[BrowseImageManager setUserInterfaceDelegate:](self->_imageManager, "setUserInterfaceDelegate:", v5);

}

- (void)readCategoriesFromDiskIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  objc_msgSend(v2, "readCategoriesFromDiskIfNeeded");

}

+ (void)prepareImagesForCacheKey:(id)a3 traits:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BrowseImageManager *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  BrowseImageManager *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD block[4];
  BrowseImageManager *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = v9;
  v11 = objc_msgSend(v9, "hasCarHeadunitInteractionModel");
  v12 = 0.0;
  if ((_DWORD)v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "screenTraitCollection"));
    objc_msgSend(v14, "displayScale");
    v12 = v15;

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedContentCache:", v8));
  objc_msgSend(v16, "readCategoriesFromDiskIfNeeded");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "categories"));
  if (objc_msgSend(v17, "count"))
  {
    v28 = v10;
    v29 = v8;
    v18 = dispatch_group_create();
    v19 = objc_alloc_init(BrowseImageManager);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v27 = v17;
    v20 = v17;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v18);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1007B48D4;
          v34[3] = &unk_1011BAA70;
          v35 = v18;
          -[BrowseImageManager imageForCategory:scale:traits:isCarplay:resultHandler:](v19, "imageForCategory:scale:traits:isCarplay:resultHandler:", v25, v30, v11, v34, v12);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v22);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007B48DC;
    block[3] = &unk_1011AE240;
    v32 = v19;
    v10 = v28;
    v33 = v28;
    v26 = v19;
    dispatch_group_notify(v18, (dispatch_queue_t)&_dispatch_main_q, block);

    v8 = v29;
    v17 = v27;
  }

}

+ (void)precacheCategoriesForCacheKey:(id)a3 withTraits:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  id v13;
  BrowseManager *v14;
  _QWORD v15[4];
  void (**v16)(id, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedContentCache:", v8));
  objc_msgSend(v11, "readCategoriesFromDiskIfNeeded");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "categories"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    if (v10)
      v10[2](v10, 1);
  }
  else
  {
    v14 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", v8);
    -[BrowseManager setTraits:](v14, "setTraits:", v9);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007B4A10;
    v15[3] = &unk_1011AE268;
    v16 = v10;
    -[BrowseManager getCategoriesWithCompletion:](v14, "getCategoriesWithCompletion:", v15);

  }
}

- (void)preCacheWithTraits:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007B4B70;
  v13[3] = &unk_1011AD238;
  v13[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManager cacheKey](self, "cacheKey"));
  v14 = v5;
  v6 = v4;
  v15 = v6;
  v7 = objc_retainBlock(v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager cachedCategories](self, "cachedCategories"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    ((void (*)(_QWORD *))v7[2])(v7);
  }
  else
  {
    v10 = (void *)objc_opt_class(self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1007B4B9C;
    v11[3] = &unk_1011B1B90;
    v12 = v7;
    objc_msgSend(v10, "precacheCategoriesForCacheKey:withTraits:completion:", v5, v6, v11);

  }
}

- (void)getCategoriesWithCompletion:(id)a3
{
  -[BrowseManager getCategoriesFromSearchHome:completion:](self, "getCategoriesFromSearchHome:completion:", 0, a3);
}

- (void)getCategoriesFromSearchHome:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  _QWORD block[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v6 = a4;
  self->_needToSendDisplayedUsage = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  if (objc_msgSend(v7, "needsRefresh"))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager cachedCategories](self, "cachedCategories"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1007B4E80;
      block[3] = &unk_1011ACAD0;
      block[4] = self;
      v25 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_8;
    }
  }
  v10 = self->_requestCount + 1;
  self->_requestCount = v10;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updatedTraitsForCurrentGarageState:", v12));
  -[BrowseManager setTraits:](self, "setTraits:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ticketForCategoryListWithTraits:isFromNoQueryState:", v15, v4));

  v17 = sub_1007B158C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager traits](self, "traits"));
    *(_DWORD *)buf = 138412546;
    v27 = v19;
    v28 = 2112;
    v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "The category request is made with the traits: %@ and ticket: %@", buf, 0x16u);

  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1007B4EC8;
  v20[3] = &unk_1011C6F00;
  v22 = v23;
  v20[4] = self;
  v21 = v6;
  objc_msgSend(v16, "submitWithHandler:networkActivity:", v20, 0);

  _Block_object_dispose(v23, 8);
LABEL_8:

}

- (id)cachedCategoriesForTraits:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;

  -[BrowseManager setTraits:](self, "setTraits:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  v5 = objc_msgSend(v4, "needsRefresh");

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager cachedCategories](self, "cachedCategories"));
  return v6;
}

- (void)getBatchNearby
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  v4 = objc_msgSend(v3, "needsRefresh");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
    objc_msgSend(v5, "setNeedsRefresh:", 0);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
    objc_msgSend(v6, "updateCacheWithBlock:", &stru_1011C6F40);

  }
}

- (NSArray)cachedCategories
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager contentCache](self, "contentCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "categories"));

  return (NSArray *)v3;
}

- (void)submitBrowseUsageIfNeeded
{
  unsigned int v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BrowseManager cachedCategories](self, "cachedCategories"));
  if (objc_msgSend(v4, "count"))
  {
    v3 = -[BrowseManager needToSendDisplayedUsage](self, "needToSendDisplayedUsage");

    if (v3)
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 17010, 0, 0);
      -[BrowseManager setNeedToSendDisplayedUsage:](self, "setNeedToSendDisplayedUsage:", 0);
    }
  }
  else
  {

  }
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)needToSendDisplayedUsage
{
  return self->_needToSendDisplayedUsage;
}

- (void)setNeedToSendDisplayedUsage:(BOOL)a3
{
  self->_needToSendDisplayedUsage = a3;
}

- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate
{
  return (MapsUIImageCacheUserInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
}

- (BrowseManagerContentCache)contentCache
{
  return self->_contentCache;
}

- (void)setContentCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCache, 0);
  objc_destroyWeak((id *)&self->_userInterfaceDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
}

@end
