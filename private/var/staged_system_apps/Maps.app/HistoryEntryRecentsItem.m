@implementation HistoryEntryRecentsItem

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  __CFString *v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10049E82C;
  v22 = sub_10049E83C;
  v23 = &stru_1011EB268;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10049E844;
  v15[3] = &unk_1011B8468;
  v16 = v4;
  v17 = &v18;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10049E900;
  v12[3] = &unk_1011B8490;
  v13 = v16;
  v14 = &v18;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10049EA6C;
  v9[3] = &unk_1011B84B8;
  v6 = v13;
  v10 = v6;
  v11 = &v18;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10049EAE8;
  v8[3] = &unk_1011B84E0;
  v8[4] = &v18;
  objc_msgSend(v5, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v15, v12, v9, v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[History %@]"), v19[5]));
  objc_msgSend(v6, "setDebugSubtitle:", v7);

  _Block_object_dispose(&v18, 8);
}

- (id)entryWithTicket:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10066F1EC;
  v15 = sub_10066F1FC;
  v16 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v9[5] = &v11;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10066F204;
  v10[3] = &unk_1011B1458;
  v10[4] = self;
  v10[5] = &v11;
  v8[5] = &v11;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10066F240;
  v9[3] = &unk_1011BF4D8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10066F27C;
  v8[3] = &unk_1011BF500;
  v8[4] = self;
  objc_msgSend(v5, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v10, v9, v8, 0);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)entryForHistorySearch:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "query"));
  objc_msgSend(v4, "safeAddDisplayLine:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationDisplayString"));
  objc_msgSend(v4, "safeAddDisplayLine:", v6);

  return v4;
}

- (id)entryForHistoryRoute:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", 4);
  v19 = 0;
  v20 = 0;
  +[SearchResult newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:](SearchResult, "newStartWaypointSearchResult:endWaypointSearchResult:forRouteHistoryEntry:", &v20, &v19, v3);

  v5 = v20;
  v6 = v19;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

  if (objc_msgSend(v5, "isDynamicCurrentLocation"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "place"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "address"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "structuredAddress"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fullThoroughfare"));
    if (!objc_msgSend(v13, "length"))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "thoroughfare"));

      v13 = (void *)v14;
    }
    if (!objc_msgSend(v13, "length"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_addressFormattedAsCity"));

      v13 = (void *)v16;
    }

    v9 = v13;
  }
  if (!objc_msgSend(v9, "length"))
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));

    v9 = (void *)v17;
  }
  objc_msgSend(v4, "safeAddDisplayLine:", v7);
  objc_msgSend(v4, "safeAddDisplayLine:", v9);

  return v4;
}

- (id)entryForHistoryPlace:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  SearchResult *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v5));
  v7 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult title](v7, "title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_placeTitleWithDefaultTitle:", v8));

  if (objc_msgSend(v6, "_hasMUID"))
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SearchResult singleLineAddress](v7, "singleLineAddress"));
  }
  else if (objc_msgSend(v6, "_maps_isLargeAreaPlace"))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_placeAreaNameWithDefaultName:", v9));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_addressFormattedAsCity"));
  }
  v11 = (void *)v10;
  objc_msgSend(v4, "safeAddDisplayLine:", v9);
  objc_msgSend(v4, "safeAddDisplayLine:", v11);

  return v4;
}

+ (void)fetchHistoryItemsMatchingMapItem:(id)a3 completion:(id)a4
{
  +[HistoryRecentItemOperationUtilities fetchHistoryItemsMatchingMapItem:completion:](HistoryRecentItemOperationUtilities, "fetchHistoryItemsMatchingMapItem:completion:", a3, a4);
}

+ (void)fetchHistoryItemsMatchingWaypoints:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = objc_alloc_init((Class)MSHistoryItemRequest);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100765F7C;
  v12[3] = &unk_1011B7580;
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v5;
  objc_msgSend(v8, "fetchWithCompletionHandler:", v12);

}

+ (void)fetchHistoryItemMatchingIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync13MapsSyncRange), "initWithOffset:limit:", 0, 1);
  v15 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("identifier == %@"), v8));

  v10 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v9, 0, v7);
  v11 = objc_alloc_init((Class)MSHistoryItemRequest);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100766848;
  v13[3] = &unk_1011AE268;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "fetchWithOptions:completionHandler:", v10, v13);

}

+ (id)historyItemForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1007669B8;
  v16 = sub_1007669C8;
  v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007669D0;
  v9[3] = &unk_1011C5D80;
  v11 = &v12;
  v5 = dispatch_semaphore_create(0);
  v10 = v5;
  objc_msgSend(a1, "fetchHistoryItemMatchingIdentifier:completionHandler:", v4, v9);
  v6 = dispatch_time(0, 1000000000);
  v7 = 0;
  if (!dispatch_semaphore_wait(v5, v6))
    v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4
{
  return objc_msgSend(a1, "saveRoute:withOriginalHistoryIdentifier:editBlock:", a3, a4, 0);
}

+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4 editBlock:(id)a5
{
  return objc_msgSend(a1, "saveRoute:withOriginalHistoryIdentifier:editBlock:completionBlock:", a3, a4, a5, 0);
}

+ (id)saveRoute:(id)a3 withOriginalHistoryIdentifier:(id)a4 editBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  _UNKNOWN **v27;
  objc_class *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  HistoryEntryRecentsItem *v52;
  id v53;
  id v54;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  BOOL v60;
  unsigned int v61;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  NSObject *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  _BYTE *v73;
  char v74;
  BOOL v75;
  char v76;
  uint8_t v77[4];
  id v78;
  __int16 v79;
  objc_class *v80;
  _BYTE buf[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "origin"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destination"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userRequestedWaypoints"));
        v17 = objc_msgSend(v16, "count");
        v60 = (unint64_t)v17 > 2;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeVehicleIdentifier"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chargingStationInfos"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

        v20 = objc_msgSend(v10, "isEVRoute");
        if (v62)
          v21 = v20;
        else
          v21 = 0;
        if (!v63)
          v21 = 0;
        v61 = v21;
        v22 = sub_100431C0C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2048;
          v82 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v16, "count");
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Will try to save a route: %@,\noriginalHistoryIdentifier: %@, \nuserRequestedWaypoints: %lu", buf, 0x20u);

        }
        v26 = MSHistoryMultiPointRoute_ptr;
        v27 = MSHistoryEvDirectionsItem_ptr;
        if (!v61)
          v27 = MSHistoryDirectionsItem_ptr;
        if ((unint64_t)v17 <= 2)
          v26 = v27;
        v28 = (objc_class *)objc_opt_class(*v26);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v82 = sub_1007669B8;
        v83 = sub_1007669C8;
        v84 = 0;
        if (!v11)
          goto LABEL_30;
        v29 = sub_100431C0C();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 138412290;
          v78 = v11;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Finding historyItem for identifier: %@", v77, 0xCu);
        }

        v31 = objc_msgSend((id)objc_opt_class(a1), "historyItemForIdentifier:", v11);
        v32 = (id)objc_claimAutoreleasedReturnValue(v31);
        if (!v32)
          goto LABEL_30;
        v33 = sub_100431C0C();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 138412290;
          v78 = v11;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Found historyItem matching identifier: %@", v77, 0xCu);
        }

        if ((objc_msgSend((id)objc_opt_class(v32), "isEqual:", v28) & 1) != 0)
          goto LABEL_42;
        v35 = sub_100431C0C();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
LABEL_29:

          v44 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v32;

LABEL_30:
          v32 = objc_alloc_init(v28);
          if ((objc_opt_respondsToSelector(*(_QWORD *)(*(_QWORD *)&buf[8] + 40), "sharedETAData") & 1) != 0
            && (objc_opt_respondsToSelector(v32, "sharedETAData") & 1) != 0)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "sharedETAData"));
            if (v45 && (objc_opt_respondsToSelector(v32, "setSharedETAData:") & 1) != 0)
            {
              v46 = sub_100431C0C();
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v77 = 0;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Migrating sharedETAData from original item to new item", v77, 2u);
              }

              objc_msgSend(v32, "setSharedETAData:", v45);
            }
          }
          else
          {
            v45 = 0;
          }

LABEL_42:
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_100767164;
          v65[3] = &unk_1011C5DF0;
          v53 = v32;
          v66 = v53;
          v67 = v10;
          v73 = buf;
          v49 = v16;
          v68 = v49;
          v74 = v61 & !v60;
          v54 = v62;
          v69 = v54;
          v64 = v63;
          v70 = v64;
          v75 = v60;
          v76 = v61;
          v71 = v12;
          v72 = v13;
          objc_msgSend(a1, "fetchHistoryItemsMatchingWaypoints:completion:", v49, v65);
          v52 = -[HistoryEntryRecentsItem initWithHistoryEntry:]([HistoryEntryRecentsItem alloc], "initWithHistoryEntry:", v53);

          _Block_object_dispose(buf, 8);
          goto LABEL_43;
        }
        v59 = v32;
        v37 = (objc_class *)objc_opt_class(v59);
        v38 = NSStringFromClass(v37);
        v58 = (void *)objc_claimAutoreleasedReturnValue(v38);
        if ((objc_opt_respondsToSelector(v59, "accessibilityIdentifier") & 1) != 0)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "performSelector:", "accessibilityIdentifier"));
          v40 = v39;
          if (v39)
          {
            v41 = v39;
            v42 = objc_msgSend(v39, "isEqualToString:", v58);
            v40 = v41;
            if ((v42 & 1) == 0)
            {
              v56 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v58, v59, v41));
              v57 = v41;
              v43 = (void *)v56;

              goto LABEL_28;
            }
          }

        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v58, v59));
LABEL_28:

        *(_DWORD *)v77 = 138412546;
        v78 = v43;
        v79 = 2112;
        v80 = v28;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Existing directionItem %@ is not of correct type for saving %@, will create a new one", v77, 0x16u);

        goto LABEL_29;
      }
    }
  }
  v48 = sub_100431C0C();
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "origin"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destination"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v51;
    *(_WORD *)&buf[22] = 2112;
    v82 = (uint64_t (*)(uint64_t, uint64_t))v10;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, "Will not save route as required properties are missing (origin: %@, destination: %@, route: %@)", buf, 0x20u);

  }
  v52 = 0;
LABEL_43:

  return v52;
}

+ (id)saveCustomRoute:(id)a3 asWaypoint:(id)a4 withOriginalHistoryIdentifier:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  MSHistoryDirectionsItem *v17;
  id v18;
  NSObject *v19;
  HistoryEntryRecentsItem *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  MSHistoryDirectionsItem *v24;
  MSHistoryDirectionsItem *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  _BYTE *v45;
  _QWORD v46[2];
  uint8_t v47[4];
  __CFString *v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v11 = sub_100431C0C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortDescription"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will try to save a waypoint-to-route: %@, originalHistoryIdentifier: %@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v50 = sub_1007669B8;
    v51 = sub_1007669C8;
    v52 = 0;
    if (v10)
    {
      v15 = sub_100431C0C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v47 = 138412290;
        v48 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Finding historyItem for identifier: %@", v47, 0xCu);
      }

      v17 = (MSHistoryDirectionsItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "historyItemForIdentifier:", v10));
      if (v17)
      {
        v18 = sub_100431C0C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v47 = 138412290;
          v48 = v10;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Found historyItem matching identifier: %@", v47, 0xCu);
        }

      }
    }
    else
    {
      v17 = 0;
    }
    v21 = objc_opt_class(MSHistoryDirectionsItem);
    if ((objc_opt_isKindOfClass(v17, v21) & 1) != 0)
    {
      if (v17)
      {
LABEL_30:
        v32 = objc_alloc((Class)GEOComposedWaypoint);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_geoMapItem"));
        v35 = objc_msgSend(v32, "initWithMapItem:", v34);

        v46[0] = v35;
        v46[1] = v9;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1007682F8;
        v40[3] = &unk_1011C5E58;
        v13 = v17;
        v41 = v13;
        v45 = buf;
        v37 = v35;
        v42 = v37;
        v43 = v9;
        v44 = v8;
        objc_msgSend(a1, "fetchHistoryItemsMatchingWaypoints:completion:", v36, v40);

        v20 = -[HistoryEntryRecentsItem initWithHistoryEntry:]([HistoryEntryRecentsItem alloc], "initWithHistoryEntry:", v13);
        _Block_object_dispose(buf, 8);

        goto LABEL_31;
      }
LABEL_29:
      v17 = objc_opt_new(MSHistoryDirectionsItem);
      goto LABEL_30;
    }
    v22 = sub_100431C0C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
LABEL_28:

      v31 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v17;

      goto LABEL_29;
    }
    v24 = v17;
    v25 = v24;
    if (!v24)
    {
      v30 = CFSTR("<nil>");
      goto LABEL_27;
    }
    v26 = (objc_class *)objc_opt_class(v24);
    v27 = NSStringFromClass(v26);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSHistoryDirectionsItem performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v29 = v28;
      if (v28 && (objc_msgSend(v28, "isEqualToString:", v39) & 1) == 0)
      {
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v39, v25, v29));

        goto LABEL_25;
      }

    }
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v39, v25));
LABEL_25:

LABEL_27:
    *(_DWORD *)v47 = 138412290;
    v48 = v30;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Existing directionItem %@ is not of correct type MSHistoryDirectionsItem, will create a new one", v47, 0xCu);

    goto LABEL_28;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Will not save route as required property is missing (waypoint: %@)", buf, 0xCu);
  }
  v20 = 0;
LABEL_31:

  return v20;
}

+ (void)markRouteAsComplete:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userRequestedWaypoints"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100768BA0;
  v7[3] = &unk_1011B7B30;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "fetchHistoryItemsMatchingWaypoints:completion:", v5, v7);

}

+ (void)saveWaypoints:(id)a3 transportType:(int)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  int v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100768F78;
  v7[3] = &unk_1011C5EA0;
  v8 = a3;
  v9 = a4;
  v6 = v8;
  objc_msgSend(a1, "fetchHistoryItemsMatchingWaypoints:completion:", v6, v7);

}

+ (void)saveGeoMapItem:(id)a3
{
  +[HistoryRecentItemOperationUtilities saveGeoMapItem:](HistoryRecentItemOperationUtilities, "saveGeoMapItem:", a3);
}

+ (void)saveMapItem:(id)a3 superseedUUID:(id)a4
{
  objc_msgSend(a1, "saveMapItem:superseedUUID:tracksRAPReportingOnly:", a3, a4, 0);
}

+ (void)saveMapItem:(id)a3 superseedUUID:(id)a4 tracksRAPReportingOnly:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100769200;
  v12[3] = &unk_1011B41D0;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(a1, "fetchHistoryItemsMatchingMapItem:completion:", v9, v12);

}

+ (void)saveLineItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)MSHistoryItemRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007693F0;
  v10[3] = &unk_1011ADA50;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "fetchWithCompletionHandler:", v10);

}

+ (void)saveSearch:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)MSHistoryItemRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007697B4;
  v10[3] = &unk_1011ADA50;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "fetchWithCompletionHandler:", v10);

}

+ (void)saveCuratedCollection:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)MSHistoryItemRequest);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100769CF0;
  v10[3] = &unk_1011ADA50;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "fetchWithCompletionHandler:", v10);

}

+ (void)removeEntries:(id)a3
{
  _objc_msgSend(a1, "removeEntries:completion:", a3, 0);
}

+ (void)removeEntries:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12), "historyEntry"));
        objc_msgSend(v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10076A264;
  v16[3] = &unk_1011AE218;
  v17 = v6;
  v15 = v6;
  objc_msgSend(v14, "deleteWithObjects:completionHandler:", v7, v16);

}

- (void)updateResumeRouteHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v9 = objc_opt_class(MSHistoryItem);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
    if ((objc_opt_respondsToSelector(v11, "routeRequestStorage") & 1) != 0
      && (objc_opt_respondsToSelector(v11, "setRouteRequestStorage:") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeRequestStorage"));
      objc_msgSend(v12, "setResumeRouteHandleStorage:", v6);
      objc_msgSend(v11, "setRouteRequestStorage:", v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v17 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10076A4A8;
    v15[3] = &unk_1011AE218;
    v16 = v7;
    objc_msgSend(v13, "saveWithObjects:completionHandler:", v14, v15);

  }
}

- (void)setNavigationInterrupted:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  _QWORD *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  void *v23;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v8 = objc_opt_class(MSHistoryDirectionsItem);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v11 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "setNavigationInterrupted:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v23 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10076A6C4;
    v20[3] = &unk_1011AE218;
    v14 = &v21;
    v21 = v6;
    v15 = v20;
LABEL_5:
    objc_msgSend(v12, "saveWithObjects:completionHandler:", v13, v15);

    goto LABEL_6;
  }
  v16 = objc_opt_class(MSHistoryMultiPointRoute);
  v17 = objc_opt_isKindOfClass(v11, v16);

  if ((v17 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
    objc_msgSend(v11, "setNavigationInterrupted:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    v22 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10076A6D8;
    v18[3] = &unk_1011AE218;
    v14 = &v19;
    v19 = v6;
    v15 = v18;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setSharedETAData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v9 = objc_opt_class(MSHistoryDirectionsItem);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sharedETAData"));
    v14 = (unint64_t)v6;
    v15 = v13;
    if (v14 | v15)
    {
      v16 = (void *)v15;
      v17 = objc_msgSend((id)v14, "isEqual:", v15);

      if (!v17)
      {
        objc_msgSend(v12, "setSharedETAData:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
        v35 = v12;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10076A9B0;
        v32[3] = &unk_1011AE218;
        v33 = v7;
        objc_msgSend(v18, "saveWithObjects:completionHandler:", v19, v32);

        v20 = v33;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
    }
    goto LABEL_8;
  }
  v21 = objc_opt_class(MSHistoryMultiPointRoute);
  v22 = objc_opt_isKindOfClass(v12, v21);

  if ((v22 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sharedETAData"));
    v24 = (unint64_t)v6;
    v25 = v23;
    if (v24 | v25)
    {
      v26 = (void *)v25;
      v27 = objc_msgSend((id)v24, "isEqual:", v25);

      if (!v27)
      {
        objc_msgSend(v12, "setSharedETAData:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
        v34 = v12;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10076A9C4;
        v30[3] = &unk_1011AE218;
        v31 = v7;
        objc_msgSend(v28, "saveWithObjects:completionHandler:", v29, v30);

        v20 = v31;
        goto LABEL_11;
      }
    }
LABEL_8:
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    goto LABEL_12;
  }
LABEL_13:

}

- (HistoryEntryRecentsItem)initWithHistoryEntry:(id)a3
{
  id v5;
  HistoryEntryRecentsItem *v6;
  HistoryEntryRecentsItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HistoryEntryRecentsItem;
  v6 = -[HistoryEntryRecentsItem init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_historyEntry, a3);

  return v7;
}

- (double)timestamp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "usageDate"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return v5;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HistoryEntryRecentsItem <%p %@"), self, self->_historyEntry);
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  HistoryEntryRecentsItem *v4;
  uint64_t v5;
  HistoryEntryRecentsItem *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (HistoryEntryRecentsItem *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v6, "historyEntry"));

      v9 = objc_msgSend(v7, "isEqual:", v8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (MSPHistoryEntry)historyEntry
{
  return self->_historyEntry;
}

- (HistoryEntryRecentsItem)linkedRecentRoute
{
  return self->_linkedRecentRoute;
}

- (void)setLinkedRecentRoute:(id)a3
{
  objc_storeStrong((id *)&self->_linkedRecentRoute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedRecentRoute, 0);
  objc_storeStrong((id *)&self->_historyEntry, 0);
}

- (BOOL)isNavigationInterrupted
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  char v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v4 = objc_opt_class(MSHistoryDirectionsItem);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
  v7 = objc_opt_class(MSHistoryMultiPointRoute);
  v8 = objc_opt_isKindOfClass(v6, v7);

  if ((v8 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
LABEL_4:
    v9 = objc_msgSend(v6, "navigationInterrupted");

    return v9;
  }
  return 0;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](self, "historyEntry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storageIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  return (NSString *)v4;
}

@end
