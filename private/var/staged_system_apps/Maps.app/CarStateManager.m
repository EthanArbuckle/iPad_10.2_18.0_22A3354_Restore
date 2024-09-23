@implementation CarStateManager

- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t Log;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  SearchResult *v21;
  SearchResult *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  SearchResult *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  SearchResult *v44;
  void *v45;
  void *v46;
  _QWORD block[4];
  id v48;
  id v49;
  int64_t v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  int64_t v54;
  __int16 v55;
  id v56;

  v6 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

    v9 = sub_100431A4C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v54 = (int64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "setting Maps activity (tag %@)", buf, 0xCu);
    }

    global_queue = dispatch_get_global_queue(-2, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B87A40;
    block[3] = &unk_1011B15B0;
    v13 = v8;
    v48 = v13;
    v50 = a5;
    v14 = v6;
    v49 = v14;
    dispatch_async(v12, block);

    if (!v14)
      goto LABEL_37;
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "AppStateManager");
    v16 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v54 = a5;
      v55 = 2112;
      v56 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "setting Maps activity from source: %ld : state: %@", buf, 0x16u);
    }

    if (!objc_msgSend(v14, "hasDirectionsPlan"))
      goto LABEL_37;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsPlan"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeRequestStorage"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "waypoints"));
    v20 = objc_msgSend(v19, "count");

    v21 = (SearchResult *)objc_alloc_init((Class)NSMutableDictionary);
    v22 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "originString"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "destinationString"));
    v24 = (unint64_t)v23;
    if (v22 && !v23 && v20)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeRequestStorage"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "waypoints"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));

      if (objc_msgSend(v27, "isCurrentLocation"))
        v28 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      else
        v28 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v27);
      v29 = (unint64_t)v28;
    }
    else
    {
      if (!v22 && v23 && v20)
      {
        if (objc_msgSend(v23, "_maps_isEqualToSearchStringForCurrentLocationSearchResult"))
          v29 = objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
        else
          v29 = 0;
        goto LABEL_30;
      }
      if ((unint64_t)v20 < 2)
      {
        if (v20 != (id)1)
        {
          v29 = 0;
LABEL_27:
          if (!(v29 | v24))
          {
            v29 = (unint64_t)v21;
LABEL_36:

LABEL_37:
            goto LABEL_38;
          }
LABEL_30:
          v33 = 0.0;
          if (a5 == 5)
          {
            v34 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 5.0));
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("NavigationAutoLaunchDelayKey")));

            if (v36)
              v37 = v36;
            else
              v37 = v34;
            v38 = v37;

            objc_msgSend(v38, "doubleValue");
            v33 = v39;

          }
          v51[0] = CFSTR("DirectionsNavigationAutoLaunchDelayKey");
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v33));
          v51[1] = CFSTR("DirectionsShouldRestoreLowGuidanceKey");
          v52[0] = v40;
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v17, "shouldRestoreLowGuidance")));
          v52[1] = v41;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
          objc_msgSend(v43, "displayRoutePlanningForDestination:userInfo:", v29, v42);

          v22 = v21;
          goto LABEL_36;
        }
        v44 = [SearchResult alloc];
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeRequestStorage"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "waypoints"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstObject"));
        v29 = -[SearchResult initWithComposedWaypoint:](v44, "initWithComposedWaypoint:", v45);

      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeRequestStorage"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "waypoints"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastObject"));

        v29 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v27);
        if ((unint64_t)a5 <= 4 && ((1 << a5) & 0x15) != 0)
        {
          if (objc_msgSend(v27, "isCurrentLocation"))
          {
            v32 = objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));

            v29 = v32;
          }
        }
        else
        {
          -[SearchResult setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("DirectionsAttemptCachedRouteKey"));
        }
      }
    }

    goto LABEL_27;
  }
LABEL_38:

}

@end
