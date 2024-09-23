@implementation NavigationTrackingTask

+ (int64_t)creationPreference
{
  return 2;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  dispatch_group_t v33;
  uint64_t v34;
  uint64_t Log;
  NSObject *v36;
  id v37;
  NSObject *v38;
  _BYTE *v39;
  double Double;
  double v41;
  uint64_t Integer;
  _BYTE *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  _BYTE *v49;
  double v50;
  double v51;
  uint64_t v52;
  _BYTE *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  id v59;
  int v60;
  void **block;
  uint64_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD v68[3];
  int v69;
  _QWORD v70[3];
  int v71;
  _BYTE v72[24];
  void *v73;
  NSObject *v74;
  id v75;
  double v76;
  _BYTE buf[24];
  void *v78;
  _QWORD *v79;
  void *v80;
  double v81;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((+[GEOAPPortal directionsRequestDetailsAreDisabled](GEOAPPortal, "directionsRequestDetailsAreDisabled") & 1) == 0)
  {
    v11 = v9;
    v12 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      v13 = v11;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v15 = v10;
      v16 = objc_opt_class(RoutePlanningSession);
      isKindOfClass = objc_opt_isKindOfClass(v15, v16);

      if (!v15 || (isKindOfClass & 1) == 0)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configuration"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "originWaypointRequest"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "waypointRequest"));
        objc_msgSend(v19, "coordinate");
        v21 = v20;
        v23 = v22;

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "destinationWaypointRequest"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "waypointRequest"));
        objc_msgSend(v25, "coordinate");
        v27 = v26;
        v29 = v28;

        v30 = sub_100B3A5D4();
        v56 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "oneUser"));
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100AF8CE4;
        v58[3] = &unk_1011E2718;
        v58[4] = self;
        v59 = v15;
        v60 = 4;
        v32 = v31;
        v55 = v58;
        v33 = dispatch_group_create();
        v34 = MapsSuggestionsLoggingSubsystem;
        Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavigationTrackingTask");
        v36 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v23;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Checking origin <%+.6f,%+.6f>", buf, 0x16u);
        }

        v70[0] = 0;
        v70[1] = v70;
        v70[2] = 0x2020000000;
        v71 = 4;
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_100AF8FDC;
        v78 = &unk_1011E2740;
        v80 = v21;
        v81 = v23;
        v79 = v70;
        v37 = v32;
        v38 = v33;
        v39 = buf;
        dispatch_group_enter(v38);
        Double = GEOConfigGetDouble(GEOConfigMapsSuggestionsNavigationTrackingTaskMaxDistance[0], GEOConfigMapsSuggestionsNavigationTrackingTaskMaxDistance[1]);
        v41 = GEOConfigGetDouble(GEOConfigMapsSuggestionsNavigationTrackingTaskMaxAge[0], GEOConfigMapsSuggestionsNavigationTrackingTaskMaxAge[1]);
        Integer = GEOConfigGetInteger(GEOConfigMapsSuggestionsNavigationTrackingTaskMinVisits[0], GEOConfigMapsSuggestionsNavigationTrackingTaskMinVisits[1]);
        *(_QWORD *)v72 = _NSConcreteStackBlock;
        *(_QWORD *)&v72[8] = 3221225472;
        *(_QWORD *)&v72[16] = sub_100AF95A8;
        v73 = &unk_1011E2790;
        v43 = v39;
        v75 = v43;
        v44 = v38;
        v74 = v44;
        objc_msgSend(v37, "meCardForProminentPlacesAroundCoordinate:maxDistance:maxAge:minVisits:handler:", Integer, v72, *(double *)&v21, v23, Double, v41);

        v45 = GEOFindOrCreateLog(v34, "NavigationTrackingTask");
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v72 = 134218240;
          *(double *)&v72[4] = v27;
          *(_WORD *)&v72[12] = 2048;
          *(double *)&v72[14] = v29;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Checking destination <%+.6f,%+.6f>", v72, 0x16u);
        }

        v68[0] = 0;
        v68[1] = v68;
        v68[2] = 0x2020000000;
        v69 = 4;
        *(_QWORD *)v72 = _NSConcreteStackBlock;
        *(_QWORD *)&v72[8] = 3221225472;
        *(_QWORD *)&v72[16] = sub_100AF9184;
        v73 = &unk_1011E2740;
        v75 = v21;
        v76 = v23;
        v74 = v68;
        v47 = v37;
        v48 = v44;
        v49 = v72;
        dispatch_group_enter(v48);
        v50 = GEOConfigGetDouble(GEOConfigMapsSuggestionsNavigationTrackingTaskMaxDistance[0], GEOConfigMapsSuggestionsNavigationTrackingTaskMaxDistance[1]);
        v51 = GEOConfigGetDouble(GEOConfigMapsSuggestionsNavigationTrackingTaskMaxAge[0], GEOConfigMapsSuggestionsNavigationTrackingTaskMaxAge[1]);
        v52 = GEOConfigGetInteger(GEOConfigMapsSuggestionsNavigationTrackingTaskMinVisits[0], GEOConfigMapsSuggestionsNavigationTrackingTaskMinVisits[1]);
        block = _NSConcreteStackBlock;
        v62 = 3221225472;
        v63 = sub_100AF95A8;
        v64 = &unk_1011E2790;
        v53 = v49;
        v66 = v53;
        v54 = v48;
        v65 = v54;
        objc_msgSend(v47, "meCardForProminentPlacesAroundCoordinate:maxDistance:maxAge:minVisits:handler:", v52, &block, v27, v29, v50, v51);

        block = _NSConcreteStackBlock;
        v62 = 3221225472;
        v63 = sub_100AF932C;
        v64 = &unk_1011E2768;
        v66 = v70;
        v67 = v68;
        v65 = v55;
        dispatch_group_notify(v54, (dispatch_queue_t)&_dispatch_main_q, &block);

        _Block_object_dispose(v68, 8);
        _Block_object_dispose(v70, 8);

      }
    }

  }
}

- (void)trackNavigationStarted:(BOOL)a3 purpose:(int)a4 originResolvedType:(int)a5 destinationResolvedType:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t Log;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  _BYTE v23[14];
  __int16 v24;
  const char *v25;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = MapsSuggestionsLoggingSubsystem;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavigationTrackingTask");
  v12 = (id)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v7 >= 5)
    {
      v14 = GEOFindOrCreateLog(v10, "NavigationTrackingTask");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v20 = 136446978;
        v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/AuxiliaryTasks/NavigationTrackingTask.m";
        v22 = 1024;
        *(_DWORD *)v23 = 94;
        *(_WORD *)&v23[4] = 2082;
        *(_QWORD *)&v23[6] = "NSString *_stringForType(GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation)";
        v24 = 2082;
        v25 = "YES";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. An unhandled GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation?", (uint8_t *)&v20, 0x26u);
      }

      v13 = CFSTR("?");
    }
    else
    {
      v13 = off_1011E27B0[(int)v7];
    }
    if (v6 >= 5)
    {
      v17 = GEOFindOrCreateLog(v10, "NavigationTrackingTask");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v20 = 136446978;
        v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/AuxiliaryTasks/NavigationTrackingTask.m";
        v22 = 1024;
        *(_DWORD *)v23 = 94;
        *(_WORD *)&v23[4] = 2082;
        *(_QWORD *)&v23[6] = "NSString *_stringForType(GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation)";
        v24 = 2082;
        v25 = "YES";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. An unhandled GEOLogMsgEventDirectionsRequestDetails_DirectionsRequestLocation?", (uint8_t *)&v20, 0x26u);
      }

      v16 = CFSTR("?");
    }
    else
    {
      v16 = off_1011E27B0[(int)v6];
    }
    v20 = 138412546;
    v21 = (const char *)v13;
    v22 = 2112;
    *(_QWORD *)v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending Analytics [%@, %@]", (uint8_t *)&v20, 0x16u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
  +[GEOAPPortal captureDirectionsRequestDetailsWithNavStarted:purpose:origin:destination:](GEOAPPortal, "captureDirectionsRequestDetailsWithNavStarted:purpose:origin:destination:", v19, v8, v7, v6);

}

@end
