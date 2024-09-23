@implementation SearchHomeDataDownloader

- (SearchHomeDataDownloader)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  id v6;
  SearchHomeDataDownloader *v7;
  SearchHomeDataDownloader *v8;
  SearchHomeDataDownloaderCache *v9;
  SearchHomeDataDownloaderCache *cache;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *parsingQueue;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchHomeDataDownloader;
  v7 = -[SearchHomeDataDownloader init](&v16, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_searchAlongRoute = a4;
    v9 = objc_alloc_init(SearchHomeDataDownloaderCache);
    cache = v8->_cache;
    v8->_cache = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.Maps.Search.SearchHomeParsingResponse", v12);
    parsingQueue = v8->_parsingQueue;
    v8->_parsingQueue = (OS_dispatch_queue *)v13;

  }
  return v8;
}

- (void)fetchContent
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *lprPowerType;
  SearchHomeDataDownloaderCacheKey *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  uint64_t v24;
  SearchHomeDataDownloaderCacheKey *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  char *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t IsEnabled_HikingiOS;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  OS_dispatch_queue *parsingQueue;
  _QWORD v46[4];
  SearchHomeDataDownloaderCacheKey *v47;
  SearchHomeDataDownloader *v48;
  id v49[2];
  id location;
  uint8_t buf[4];
  uint64_t v52;

  self->_isFetchingDataComplete = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "newTraits");

  if (!v4)
  {
    v5 = sub_10043230C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "The defaultTraits are being used because the delegate was found nil, hence the traits were nil", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultTraits"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "virtualGarage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedVehicle"));

  if (v10)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lprPowerType"));
    lprPowerType = self->_lprPowerType;
    self->_lprPowerType = v11;

  }
  v13 = [SearchHomeDataDownloaderCacheKey alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
  v16 = GEOMapRectForMapRegion(v14, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = objc_msgSend(v4, "mode") - 1;
  if (v23 > 3)
    v24 = 103;
  else
    v24 = qword_100E3EEA8[v23];
  v25 = -[SearchHomeDataDownloaderCacheKey initWithMapRect:mapType:time:lprPowerType:](v13, "initWithMapRect:mapType:time:lprPowerType:", v24, self->_lprPowerType, v16, v18, v20, v22, CFAbsoluteTimeGetCurrent());

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader cache](self, "cache"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v25));

  if (v27)
  {
    -[SearchHomeDataDownloader parseResponse:](self, "parseResponse:", v27);
  }
  else
  {
    objc_initWeak(&location, self);
    v28 = sub_100B2DCB8();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v30 = (char *)os_signpost_id_generate(v29);

    v31 = sub_100B2DCB8();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v30, "FetchingSearchHome", ", buf, 2u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader delegate](self, "delegate"));
    objc_msgSend(v34, "isTouristHereValue");
    objc_msgSend(v4, "setIsTourist:");

    objc_msgSend(v4, "setSearchOriginationType:", 0);
    if (-[SearchHomeDataDownloader searchAlongRoute](self, "searchAlongRoute"))
    {
      objc_msgSend(v4, "setNavigating:", -[SearchHomeDataDownloader searchAlongRoute](self, "searchAlongRoute"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      if (objc_msgSend(v35, "isInNavigatingState"))
        v36 = objc_msgSend(v35, "navigationTransportType");
      else
        v36 = objc_msgSend(v35, "desiredTransportType");
      objc_msgSend(v4, "setNavigationTransportType:", v36);
      objc_msgSend(v4, "setSearchOriginationType:", 2);
      IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();
      if ((IsEnabled_HikingiOS & 1) != 0)
      {
        v38 = 35;
      }
      else if (MapsFeature_IsEnabled_SearchAndDiscovery(IsEnabled_HikingiOS))
      {
        v38 = 31;
      }
      else
      {
        v38 = 28;
      }
      objc_msgSend(v4, "setPlaceSummaryRevision:", v38);
      objc_msgSend(v4, "addSupportedPlaceSummaryFormatType:", 1);
      objc_msgSend(v4, "addSupportedPlaceSummaryFormatType:", 2);
      objc_msgSend(v4, "addSupportedPlaceSummaryFormatType:", 3);

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "updatedTraitsForCurrentGarageState:", v4));

    v41 = sub_10043230C();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v40;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "The category request is made with the traits: %@", buf, 0xCu);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "ticketForSearchHomeWithTraits:", v40));

    parsingQueue = self->_parsingQueue;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100B2DCF8;
    v46[3] = &unk_1011E34F0;
    v49[1] = v30;
    objc_copyWeak(v49, &location);
    v47 = v25;
    v48 = self;
    objc_msgSend(v44, "submitWithCallbackQueue:handler:networkActivity:", parsingQueue, v46, 0);

    objc_destroyWeak(v49);
    objc_destroyWeak(&location);
    v4 = (id)v40;
  }

}

- (void)parseResponse:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  unsigned __int8 v36;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  unint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[16];
  _BYTE v46[128];

  v4 = a3;
  v5 = sub_100B2DCB8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_signpost_id_generate(v6);

  v8 = sub_100B2DCB8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  v39 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "BuildingDataProviders", ", buf, 2u);
  }
  spid = v7;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v11, "count")));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v14)
  {
    v15 = v14;
    v40 = 0;
    v16 = *(_QWORD *)v42;
LABEL_6:
    v17 = 0;
    while (2)
    {
      if (*(_QWORD *)v42 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v17);
      v19 = objc_msgSend(v18, "sectionType", spid);
      switch((unint64_t)v19)
      {
        case 1uLL:
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "searchCategories"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          v23 = objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader browseCategoriesDataProviderWithSearchCategories:title:](self, "browseCategoriesDataProviderWithSearchCategories:title:", v21, v22));

          objc_msgSend(v12, "addObject:", v23);
          v40 = (void *)v23;
          goto LABEL_16;
        case 2uLL:
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "collectionSuggestions"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          v26 = objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader curatedCollectionsDataProviderWithCollectionSuggestions:title:](self, "curatedCollectionsDataProviderWithCollectionSuggestions:title:", v24, v25));
          goto LABEL_15;
        case 3uLL:
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "publisherSuggestions"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          v26 = objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader publishersDataProviderWithPublisherSuggestions:title:](self, "publishersDataProviderWithPublisherSuggestions:title:", v24, v25));
          goto LABEL_15;
        case 4uLL:
          if (!MapsFeature_IsEnabled_Maps269(v19, v20))
            goto LABEL_16;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "guideLocationSuggestsions"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          v26 = objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader citiesNearYouDataProviderWithSuggestions:title:](self, "citiesNearYouDataProviderWithSuggestions:title:", v24, v25));
LABEL_15:
          v27 = (void *)v26;
          objc_msgSend(v12, "addObject:", v26);

LABEL_16:
          if (v15 != (id)++v17)
            continue;
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          if (!v15)
            goto LABEL_20;
          goto LABEL_6;
        default:
          goto LABEL_16;
      }
    }
  }
  v40 = 0;
LABEL_20:

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v28, "isUsingOfflineMaps")
    && !-[SearchHomeDataDownloader searchAlongRoute](self, "searchAlongRoute"))
  {
    v36 = -[SearchHomeDataDownloader supportsFullTextSearch](self, "supportsFullTextSearch");

    v29 = v40;
    if ((v36 & 1) == 0)
    {
      v30 = 0;
      goto LABEL_24;
    }
  }
  else
  {

    v29 = v40;
  }
  v30 = objc_msgSend(v12, "count", spid) == (id)1;
LABEL_24:
  objc_msgSend(v29, "setWantsOneColumnLayout:", v30, spid);
  self->_isFetchingDataComplete = 1;
  v31 = objc_msgSend(v12, "copy");
  -[SearchHomeDataDownloader setDataProviders:](self, "setDataProviders:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataDownloader delegate](self, "delegate"));
  objc_msgSend(v32, "didUpdateDataFetcher:", self);

  v33 = sub_100B2DCB8();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_END, spida, "BuildingDataProviders", ", buf, 2u);
  }

}

- (id)browseCategoriesDataProviderWithSearchCategories:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BrowseCategory *v14;
  BrowseCategory *v15;
  id v16;
  NSObject *v17;
  SearchHomeBrowseCategoriesDataProvider *v18;
  id v19;
  SearchHomeBrowseCategoriesDataProvider *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
        v14 = [BrowseCategory alloc];
        v15 = -[BrowseCategory initWithCategory:](v14, "initWithCategory:", v13, (_QWORD)v22);
        if (v15)
          objc_msgSend(v7, "addObject:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

  v16 = sub_10043230C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "The Search Browse Categories in the response are : %@", buf, 0xCu);
  }

  v18 = [SearchHomeBrowseCategoriesDataProvider alloc];
  v19 = objc_msgSend(v7, "copy");
  v20 = -[SearchHomeBrowseCategoriesDataProvider initWithObjects:type:identifier:title:](v18, "initWithObjects:type:identifier:title:", v19, 2, CFSTR("SearchHomeBrowseCategories"), v6);

  return v20;
}

- (id)curatedCollectionsDataProviderWithCollectionSuggestions:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SearchHomeCollectionsDataProvider *v15;
  id v16;
  SearchHomeCollectionsDataProvider *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collections", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13), "collection"));
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v15 = [SearchHomeCollectionsDataProvider alloc];
  v16 = objc_msgSend(v8, "copy");
  v17 = -[SearchHomeCollectionsDataProvider initWithObjects:type:identifier:title:](v15, "initWithObjects:type:identifier:title:", v16, 3, CFSTR("SearchHomeCuratedCollections"), v6);

  if (MapsFeature_IsEnabled_Maps269(v18, v19))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exploreGuides"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "exploreGuides"));
      -[SearchHomeCollectionsDataProvider configureWithExploreGuides:](v17, "configureWithExploreGuides:", v21);

    }
  }

  return v17;
}

- (id)publishersDataProviderWithPublisherSuggestions:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SearchHomePublishersDataProvider *v15;
  id v16;
  SearchHomePublishersDataProvider *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publishers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publishers", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13), "publisher"));
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v15 = [SearchHomePublishersDataProvider alloc];
  v16 = objc_msgSend(v8, "copy");
  v17 = -[SearchHomePublishersDataProvider initWithObjects:type:identifier:title:](v15, "initWithObjects:type:identifier:title:", v16, 4, CFSTR("SearchHomePublishers"), v6);

  return v17;
}

- (id)citiesNearYouDataProviderWithSuggestions:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  SearchHomeCitiesDataProvider *v8;
  void *v9;
  SearchHomeCitiesDataProvider *v10;

  v5 = a3;
  v6 = a4;
  if (MapsFeature_IsEnabled_Maps269(v6, v7))
  {
    v8 = [SearchHomeCitiesDataProvider alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guideLocations"));
    v10 = -[SearchHomeCitiesDataProvider initWithObjects:type:identifier:title:](v8, "initWithObjects:type:identifier:title:", v9, 5, CFSTR("SearchHomeCitiesNearYou"), v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SearchHomeDataFetcherDelegate)delegate
{
  return (SearchHomeDataFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
  objc_storeStrong((id *)&self->_dataProviders, a3);
}

- (BOOL)isFetchingDataComplete
{
  return self->_isFetchingDataComplete;
}

- (BOOL)supportsFullTextSearch
{
  return self->_supportsFullTextSearch;
}

- (void)setSupportsFullTextSearch:(BOOL)a3
{
  self->_supportsFullTextSearch = a3;
}

- (SearchHomeDataDownloaderCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_dataProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_lprPowerType, 0);
  objc_storeStrong((id *)&self->_parsingQueue, 0);
}

@end
