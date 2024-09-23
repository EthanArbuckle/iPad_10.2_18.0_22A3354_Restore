@implementation CuratedCollectionResolver

- (CuratedCollectionResolver)initWithCuratedCollectionIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CuratedCollectionResolver *v8;
  CuratedCollectionResolver *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionResolver;
  v8 = -[CuratedCollectionResolver init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    -[CuratedCollectionResolver _commonInitWithCuratedCollectionIdentifier:](v9, "_commonInitWithCuratedCollectionIdentifier:", v6);
  }

  return v9;
}

- (CuratedCollectionResolver)initWithCuratedCollectionIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  CuratedCollectionResolver *v8;
  id v9;
  id handler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionResolver;
  v8 = -[CuratedCollectionResolver init](&v12, "init");
  if (v8)
  {
    v9 = objc_retainBlock(v7);
    handler = v8->_handler;
    v8->_handler = v9;

    -[CuratedCollectionResolver _commonInitWithCuratedCollectionIdentifier:](v8, "_commonInitWithCuratedCollectionIdentifier:", v6);
  }

  return v8;
}

- (CuratedCollectionResolver)initWithFullyClientizedCuratedCollection:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CuratedCollectionResolver *v9;
  CuratedCollectionResolver *v10;
  id v11;
  void *v12;
  id v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CuratedCollectionResolver;
  v9 = -[CuratedCollectionResolver init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_curatedCollection, a3);
    v11 = objc_alloc((Class)MKMapItemIdentifier);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIdentifier"));
    v13 = objc_msgSend(v11, "initWithGEOMapItemIdentifier:", v12);

    -[CuratedCollectionResolver _commonInitWithCuratedCollectionIdentifier:](v10, "_commonInitWithCuratedCollectionIdentifier:", v13);
  }

  return v10;
}

- (void)_commonInitWithCuratedCollectionIdentifier:(id)a3
{
  NSMutableArray *v5;
  NSMutableArray *tickets;
  id v7;

  objc_storeStrong((id *)&self->_collectionIdentifier, a3);
  v7 = a3;
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  tickets = self->_tickets;
  self->_tickets = v5;

}

- (void)resolveCollection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21[2];
  uint8_t buf[8];
  id location;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));

  if (v3)
  {
    -[CuratedCollectionResolver _resolveCollectionDetails](self, "_resolveCollectionDetails");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver collectionIdentifier](self, "collectionIdentifier"));
    v6 = MKMapItemIdentifiersToGEOMapItemIdentifier(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v4, "collectionIsSavedWithIdentifier:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver collectionIdentifier](self, "collectionIdentifier"));
    v24 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForCuratedCollections:isBatchLookup:overrideSuppress:traits:", v11, 0, v8, 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver tickets](self, "tickets"));
    objc_msgSend(v13, "addObject:", v12);

    objc_initWeak(&location, self);
    v14 = sub_100470B28();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (char *)os_signpost_id_generate(v15);

    v17 = sub_100470B28();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v16, "ResolvingCollection", ", buf, 2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100470B68;
    v20[3] = &unk_1011B79C0;
    v21[1] = v16;
    objc_copyWeak(v21, &location);
    objc_msgSend(v12, "submitWithHandler:networkActivity:", v20, 0);
    objc_destroyWeak(v21);
    objc_destroyWeak(&location);

  }
}

- (void)cancel
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver tickets](self, "tickets", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "cancel") & 1) != 0)
          objc_msgSend(v7, "cancel");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_resolveCollectionDetails
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int IsEnabled_GuidesMediaIntegrationThirdPartyLinks;
  id v33;
  _QWORD block[7];
  _QWORD v35[4];
  NSObject *v36;
  uint8_t *v37;
  id v38;
  id location;
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
  if (objc_msgSend(v3, "isSuppressed"))
  {

LABEL_4:
    v7 = GEOErrorDomain(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v33 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, -6, 0));

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
    objc_msgSend(WeakRetained, "didFailToResolveCollectionWithError:withFetchedCollection:", v33, v10);

    return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
  v6 = objc_msgSend(v5, "isBlocked");

  if (v6)
    goto LABEL_4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CuratedCollectionResolver setPlaceCollectionItems:](self, "setPlaceCollectionItems:", v11);

  v12 = sub_100470B28();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_signpost_id_generate(v13);

  v15 = sub_100470B28();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ResolvingCollectionItems", ", buf, 2u);
  }

  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "itemIds"));
  v22 = MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver collectionIdentifier](self, "collectionIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ticketForCuratedCollectionItems:collection:traits:", v23, v24, 0));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver tickets](self, "tickets"));
  objc_msgSend(v26, "addObject:", v25);

  *(_QWORD *)buf = 0;
  v41 = buf;
  v42 = 0x3032000000;
  v43 = sub_10047120C;
  v44 = sub_10047121C;
  v45 = 0;
  objc_initWeak(&location, self);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100471224;
  v35[3] = &unk_1011B79E8;
  objc_copyWeak(&v38, &location);
  v37 = buf;
  v27 = v18;
  v36 = v27;
  objc_msgSend(v25, "submitWithHandler:networkActivity:", v35, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mediaLinks"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstObject"));

  if (v30)
  {
    if (MapsFeature_IsEnabled_GuidesMediaIntegration())
      -[CuratedCollectionResolver _resolveMediaLink:withGroup:](self, "_resolveMediaLink:withGroup:", v30, v27);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "thirdPartyLinks"));
  if (!objc_msgSend(v31, "count"))
    goto LABEL_14;
  IsEnabled_GuidesMediaIntegrationThirdPartyLinks = MapsFeature_IsEnabled_GuidesMediaIntegrationThirdPartyLinks();

  if (IsEnabled_GuidesMediaIntegrationThirdPartyLinks)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "thirdPartyLinks"));
    -[CuratedCollectionResolver _resolveThirdPartyLinks:withGroup:](self, "_resolveThirdPartyLinks:withGroup:", v31, v27);
LABEL_14:

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004712B8;
  block[3] = &unk_1011B3B40;
  block[5] = buf;
  block[6] = v14;
  block[4] = self;
  dispatch_group_notify(v27, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (void)_resolveMediaLink:(id)a3 withGroup:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24[2];
  id buf[2];
  void *v26;

  v6 = a3;
  v7 = a4;
  dispatch_group_enter(v7);
  v8 = sub_100470B28();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (char *)os_signpost_id_generate(v9);

  v11 = sub_100470B28();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "ResolvingMediaLink", ", (uint8_t *)buf, 2u);
  }

  v14 = GEOAppleMediaServicesMediaTypeForGeoSubtype(objc_msgSend(v6, "mediaSubType"));
  objc_initWeak(buf, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppleMediaServices sharedInstance](MKAppleMediaServices, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adamID"));
  v26 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v18, "scale");
  v20 = v19;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100471628;
  v22[3] = &unk_1011B7A10;
  objc_copyWeak(v24, buf);
  v24[1] = v10;
  v21 = v7;
  v23 = v21;
  objc_msgSend(v15, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v17, v14, 8, v22, 64.0, 64.0, v20);

  objc_destroyWeak(v24);
  objc_destroyWeak(buf);

}

- (void)_resolveThirdPartyLinks:(id)a3 withGroup:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  id v25[2];
  id buf[2];

  v6 = a3;
  v7 = a4;
  dispatch_group_enter(v7);
  v8 = sub_100470B28();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (char *)os_signpost_id_generate(v9);

  v11 = sub_100470B28();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "ResolvingThirdPartyMediaLink", ", (uint8_t *)buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_map:", &stru_1011B7A50));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v6, v14));
  objc_initWeak(buf, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppleMediaServices sharedInstance](MKAppleMediaServices, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v17, "scale");
  v19 = v18;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1004719B4;
  v22[3] = &unk_1011B7AA0;
  objc_copyWeak(v25, buf);
  v20 = v15;
  v23 = v20;
  v25[1] = v10;
  v21 = v7;
  v24 = v21;
  objc_msgSend(v16, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v14, 1, 8, v22, 64.0, 64.0, v19);

  objc_destroyWeak(v25);
  objc_destroyWeak(buf);

}

- (void)_resolveAppClips
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  CuratedCollectionResolver *v20;
  _QWORD block[5];
  id v22;
  os_signpost_id_t v23;
  uint8_t buf[8];
  _QWORD v25[4];
  id v26;
  void *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = dispatch_group_create();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver placeCollectionItems](self, "placeCollectionItems"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appClip"));
        if (v11)
        {
          dispatch_group_enter(v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKClipServices sharedInstance](MKClipServices, "sharedInstance"));
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100471F14;
          v25[3] = &unk_1011B7AC8;
          v26 = v4;
          v27 = v10;
          v28 = v3;
          objc_msgSend(v12, "appClipWithQuickLink:completion:", v11, v25);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  v13 = sub_100470B28();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_signpost_id_generate(v14);

  v16 = sub_100470B28();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v15, "ResolvingAppClips", ", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100471F90;
  block[3] = &unk_1011B15B0;
  v22 = v4;
  v23 = v15;
  block[4] = v20;
  v19 = v4;
  dispatch_group_notify(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_finishedResolvingItems
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CuratedCollectionResolverInfo *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  CuratedCollectionResolverInfo *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
  v5 = objc_msgSend(v3, "collectionIsSaved:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
    objc_msgSend(v6, "updateSavedCuratedCollection:completion:", v7, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver placeCollectionItems](self, "placeCollectionItems"));
  v25 = objc_msgSend(v8, "copy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver delegate](self, "delegate"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaLinks"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v13 = [CuratedCollectionResolverInfo alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver mediaIntegration](self, "mediaIntegration"));
    v15 = objc_msgSend(v12, "relatedCollectionItemIndex");
    v16 = objc_msgSend(v12, "position");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver thirdPartyLinks](self, "thirdPartyLinks"));
    v18 = -[CuratedCollectionResolverInfo initWithCollectionItems:mediaIntegration:mediaIntegrationCollectionItemIndex:mediaIntegrationPosition:thirdPartyLinks:](v13, "initWithCollectionItems:mediaIntegration:mediaIntegrationCollectionItemIndex:mediaIntegrationPosition:thirdPartyLinks:", v25, v14, v15, v16, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver delegate](self, "delegate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
    objc_msgSend(v19, "didResolveCollection:resolverInfo:", v20, v18);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver handler](self, "handler"));

  if (v21)
  {
    v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver handler](self, "handler"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver curatedCollection](self, "curatedCollection"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionResolver error](self, "error"));
    ((void (**)(_QWORD, void *, id, void *))v22)[2](v22, v23, v25, v24);

  }
}

- (BOOL)shouldResolveAppClips
{
  return self->_shouldResolveAppClips;
}

- (void)setShouldResolveAppClips:(BOOL)a3
{
  self->_shouldResolveAppClips = a3;
}

- (NSDictionary)appClips
{
  return self->_appClips;
}

- (CuratedCollectionResolverDelegate)delegate
{
  return (CuratedCollectionResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapItemIdentifier)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIdentifier, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)tickets
{
  return self->_tickets;
}

- (void)setTickets:(id)a3
{
  objc_storeStrong((id *)&self->_tickets, a3);
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollection, a3);
}

- (NSMutableArray)placeCollectionItems
{
  return self->_placeCollectionItems;
}

- (void)setPlaceCollectionItems:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollectionItems, a3);
}

- (GEOAppleMediaServicesResult)mediaIntegration
{
  return self->_mediaIntegration;
}

- (void)setMediaIntegration:(id)a3
{
  objc_storeStrong((id *)&self->_mediaIntegration, a3);
}

- (NSArray)thirdPartyLinks
{
  return self->_thirdPartyLinks;
}

- (void)setThirdPartyLinks:(id)a3
{
  objc_storeStrong((id *)&self->_thirdPartyLinks, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_thirdPartyLinks, 0);
  objc_storeStrong((id *)&self->_mediaIntegration, 0);
  objc_storeStrong((id *)&self->_placeCollectionItems, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_tickets, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appClips, 0);
}

@end
