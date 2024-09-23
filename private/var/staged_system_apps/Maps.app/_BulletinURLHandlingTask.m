@implementation _BulletinURLHandlingTask

- (BOOL)_validParameters:(id)a3 data:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MapsPushNotificationType")));
  if (v6)
  {
    v15[0] = CFSTR("ParkedCar");
    v15[1] = CFSTR("CommuteDetails");
    v15[2] = CFSTR("LowFuel");
    v15[3] = CFSTR("MapsPushNotificationTypeUGCPhotoCreditCleared");
    v15[4] = CFSTR("MapsPushNotificationTypeOfflineMapsManagement");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

    if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MapsPushNotificationPushData")));
      if (!v11
        || (v12 = (void *)v11,
            v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v11, 1),
            v12,
            !v9))
      {
        v10 = 0;
        goto LABEL_9;
      }
    }
    v13 = objc_retainAutorelease(v9);
    *a4 = v13;

    v10 = 1;
LABEL_9:

    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (void)performTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BulletinURLHandlingTask *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  SyncedBookmarkRepr *v20;
  SyncedBookmarkRepr *v21;
  void *v22;
  id v23;
  NSObject *v24;
  PresentRAPAction *v25;
  SharedTripAction *v26;
  RichMapsActivity *v27;
  id v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  unsigned __int8 v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  void *v45;
  unsigned int v46;
  PresentParkedCarAction *v47;
  RichMapsActivity *v48;
  void *v49;
  id v50;
  LowFuelAction *v51;
  RichMapsActivity *v52;
  void *v53;
  OpenCommuteEntryAction *v54;
  RichMapsActivity *v55;
  id v56;
  NSObject *v57;
  SyncedBookmarkRepr *v58;
  RichMapsActivity *v59;
  RichMapsActivity *v60;
  RichMapsActivity *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  OpenOfflineMapsManagementAction *v66;
  RichMapsActivity *v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  _BulletinURLHandlingTask *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  id v86;
  _BYTE v87[128];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v73 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "query"));
  v74 = v3;
  if (!objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resourceSpecifier"));

    v4 = (void *)v5;
  }
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v72 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&")));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v81 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR("=")));
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", 1, (char *)objc_msgSend(v12, "count") - 1));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR("=")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v9);
  }

  v79 = 0;
  v16 = v73;
  v17 = -[_BulletinURLHandlingTask _validParameters:data:](v73, "_validParameters:data:", v6, &v79);
  v18 = v79;
  if ((v17 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MapsPushNotificationType")));
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("MapsPushNotifcationTypePushToPhone")))
    {
      v20 = -[SyncedBookmarkRepr initWithData:]([SyncedBookmarkRepr alloc], "initWithData:", v18);
      v21 = v20;
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SyncedBookmarkRepr richMapsActivity](v20, "richMapsActivity"));
        if (v22)
        {
          -[URLHandlingTask taskFinished:](v73, "taskFinished:", v22);
LABEL_81:

          goto LABEL_82;
        }
        goto LABEL_80;
      }
      v28 = sub_100431A4C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v30 = "_BulletinURLHandlingTask SyncedBookmarkRepr nil from data";
      goto LABEL_47;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("MapsPushNotifcationTypeProblemResolved")))
    {
      v21 = (SyncedBookmarkRepr *)objc_msgSend(objc_alloc((Class)GEORPProblemStatusResponse), "initWithData:", v18);
      if (v21)
      {
        v25 = -[PresentRAPAction initWithResponse:]([PresentRAPAction alloc], "initWithResponse:", v21);
LABEL_26:
        v26 = (SharedTripAction *)v25;
        v27 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v25);
        -[URLHandlingTask taskFinished:](v73, "taskFinished:", v27);

LABEL_27:
LABEL_82:

        goto LABEL_83;
      }
      v34 = sub_100431A4C();
      v29 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v30 = "_BulletinURLHandlingTask GEORPProblemStatusResponse nil from data";
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
        goto LABEL_48;
      }
      goto LABEL_48;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("MapsPushNotifcationTypeProblemStatusChange")))
    {
      v21 = (SyncedBookmarkRepr *)objc_msgSend(objc_alloc((Class)GEORPRapInfo), "initWithData:", v18);
      if (v21)
      {
        v25 = -[PresentRAPAction initWithRapInfo:]([PresentRAPAction alloc], "initWithRapInfo:", v21);
        goto LABEL_26;
      }
      v44 = sub_100431A4C();
      v29 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v30 = "_BulletinURLHandlingTask GEORPRapInfo nil from data";
        goto LABEL_47;
      }
LABEL_48:

      -[URLHandlingTask taskFailed](v73, "taskFailed");
      goto LABEL_82;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("ParkedCar")))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("action")));
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("photo"));

      if ((v32 & 1) != 0)
      {
        v33 = 2;
      }
      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("action")));
        v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("editlocation"));

        if (v46)
          v33 = 3;
        else
          v33 = 0;
      }
      v47 = -[PresentParkedCarAction initWithParkedCarAction:]([PresentParkedCarAction alloc], "initWithParkedCarAction:", v33);
      v48 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v47);
      -[URLHandlingTask taskFinished:](v73, "taskFinished:", v48);

      goto LABEL_53;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("CommuteDetails")))
    {
      v71 = v19;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v35, "captureUserAction:onTarget:eventValue:", 9003, 711, 0);

      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v74, 1));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "queryItems"));
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v76;
LABEL_38:
        v40 = 0;
        while (1)
        {
          if (*(_QWORD *)v76 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "name"));
          v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("uniqueID"));

          if ((v43 & 1) != 0)
            break;
          if (v38 == (id)++v40)
          {
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
            if (v38)
              goto LABEL_38;
            goto LABEL_44;
          }
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "value"));

        if (!v53)
          goto LABEL_59;
        v54 = -[OpenCommuteEntryAction initWithEntry:]([OpenCommuteEntryAction alloc], "initWithEntry:", v53);
        v55 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v54);
        -[URLHandlingTask taskFinished:](v73, "taskFinished:", v55);

        v19 = v71;
        goto LABEL_83;
      }
LABEL_44:

LABEL_59:
      v16 = v73;
      v49 = v70;
      v19 = v71;
LABEL_60:

      goto LABEL_61;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("LowFuel")))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("engineType")));
      v50 = objc_msgSend(v49, "integerValue");
      if ((_DWORD)v50)
      {
        v51 = -[LowFuelAction initWithEngineType:]([LowFuelAction alloc], "initWithEngineType:", v50);
        -[MapsAction setUserLocationAccuracy:](v51, "setUserLocationAccuracy:", kCLLocationAccuracyKilometer);
        v52 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v51);
        -[URLHandlingTask taskFinished:](v73, "taskFinished:", v52);

        goto LABEL_83;
      }
      goto LABEL_60;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("MapsPushNotificationTypeSharedTrip")))
    {
      v58 = (SyncedBookmarkRepr *)objc_msgSend(objc_alloc((Class)GEOSharedNavState), "initWithData:", v18);
      if (v58)
      {
        v21 = v58;
        v26 = -[SharedTripAction initWithSharedTrip:]([SharedTripAction alloc], "initWithSharedTrip:", v58);
        v59 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v26);
        -[URLHandlingTask taskFinished:](v73, "taskFinished:", v59);

        goto LABEL_27;
      }
LABEL_61:
      v56 = sub_100431A4C();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v86 = v19;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "_BulletinURLHandlingTask type not handled %@", buf, 0xCu);
      }

      -[URLHandlingTask taskFailed](v16, "taskFailed");
      goto LABEL_83;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("MapsPushNotificationTypeUGCPhotoCreditCleared")))
    {
      v47 = objc_alloc_init(OpenPhotoAttributionSettingsAction);
      v60 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v47);
      -[URLHandlingTask taskFinished:](v73, "taskFinished:", v60);
    }
    else
    {
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("MapsPushNotificationTypeOfflineMapsManagement")))
      {
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("MapsPushNotificationTypeOfflineMapsSuggestion")))
        {
          v21 = (SyncedBookmarkRepr *)objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithData:", v18);
          v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MapsPushNotificationTypeOfflineMapsSuggestionRegionName")));
          v22 = (void *)v62;
          if (v21)
          {
            if (v62)
            {
              v63 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v22, v63) & 1) != 0)
              {
                v64 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v22, 1);
                v65 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v64, 4);
                v66 = objc_alloc_init(OpenOfflineMapsManagementAction);
                -[OpenOfflineMapsManagementAction setDownloadRegion:](v66, "setDownloadRegion:", v21);
                -[OpenOfflineMapsManagementAction setDownloadRegionName:](v66, "setDownloadRegionName:", v65);
                v67 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v66);
                -[URLHandlingTask taskFinished:](v73, "taskFinished:", v67);

                goto LABEL_81;
              }
            }
          }
          v68 = sub_100431A4C();
          v69 = objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "_BulletinURLHandlingTask mapRegion nil from data", buf, 2u);
          }

LABEL_80:
          -[URLHandlingTask taskFailed](v73, "taskFailed");
          goto LABEL_81;
        }
        goto LABEL_61;
      }
      v47 = objc_alloc_init(OpenOfflineMapsManagementAction);
      v60 = (RichMapsActivity *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("path")));
      -[PresentParkedCarAction setPath:](v47, "setPath:", -[RichMapsActivity isEqualToString:](v60, "isEqualToString:", CFSTR("EXPIRED_MAPS")));
      v61 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v47);
      -[URLHandlingTask taskFinished:](v73, "taskFinished:", v61);

    }
LABEL_53:

LABEL_83:
    goto LABEL_84;
  }
  v23 = sub_100431A4C();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "_BulletinURLHandlingTask invalid parameters %@", buf, 0xCu);
  }

  -[URLHandlingTask taskFailed](v73, "taskFailed");
LABEL_84:

}

@end
