@implementation _MapsActivityRestoreHandlingTask

- (void)performTask
{
  void *v3;
  void *v4;
  void *v5;
  MapsActivity *v6;
  MapsActivity *v7;
  void *v8;
  uint64_t Integer;
  double v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  const char *v14;
  id v15;
  _BOOL4 v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  NSObject *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MapsActivity *v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  unsigned int v45;
  RestorationAction *v46;
  id v47;
  NSObject *v48;
  void *v49;
  RichMapsActivity *v50;
  unsigned int v51;
  uint64_t v52;
  _BOOL4 v53;
  uint64_t v54;
  int v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityHandlingTask userActivity](self, "userActivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MapsActivity")));
  if (v5)
  {
    v6 = -[MapsActivity initWithData:]([MapsActivity alloc], "initWithData:", v5);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MapsActivityTimestamp")));
      Integer = GEOConfigGetInteger(MapsConfig_MapsActivityTTL, off_1014B30E8);
      if (v8)
      {
        objc_msgSend(v8, "timeIntervalSinceNow");
        v11 = v10 < (double)-Integer;
      }
      else
      {
        v11 = 0;
      }
      if (-[MapsActivity hasDirectionsPlan](v7, "hasDirectionsPlan"))
      {
        v52 = Integer;
        v16 = v11;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](v7, "directionsPlan"));
        v18 = objc_msgSend(v17, "hasExpiryTime");

        if (v18
          && (v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](v7, "directionsPlan")),
              objc_msgSend(v19, "expiryTime"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:")), v19, objc_msgSend(v20, "timeIntervalSinceNow"), v22 = v21, v20, v22 < 0.0))
        {
          v23 = sub_100431A4C();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          v11 = v16;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "_MapsActivityRestoreHandlingTask directionsHaveExpired", buf, 2u);
          }

          Integer = v52;
          if (-[MapsActivity hasDirectionsPlan](v7, "hasDirectionsPlan"))
          {
            -[MapsActivity setDirectionsPlan:](v7, "setDirectionsPlan:", 0);
            v25 = 0;
            v55 = 1;
          }
          else
          {
            v55 = 0;
            v25 = 1;
          }
        }
        else
        {
          v55 = 0;
          v25 = 1;
          v11 = v16;
          Integer = v52;
        }
      }
      else
      {
        v25 = 0;
        v55 = 0;
      }
      if (-[MapsActivity hasDirectionsPlan](v7, "hasDirectionsPlan"))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](v7, "directionsPlan"));
        if (objc_msgSend(v26, "displayMethod") != 1)
        {
LABEL_25:

          goto LABEL_26;
        }
        v53 = v11;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](v7, "directionsPlan"));
        v28 = v5;
        v29 = v4;
        v30 = Integer;
        v31 = v8;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "routeRequestStorage"));
        v51 = objc_msgSend(v32, "transportType");

        v8 = v31;
        Integer = v30;
        v4 = v29;
        v5 = v28;

        v11 = v53;
        if (v51 != 1)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity directionsPlan](v7, "directionsPlan"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "routeRequestStorage"));
          objc_msgSend(v33, "setRouteHandle:", 0);

          v11 = v53;
          goto LABEL_25;
        }
      }
LABEL_26:
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v35 = v34;
      if (((v25 | !v11) & 1) != 0
        || (objc_msgSend(v34, "BOOLForKey:", CFSTR("__internal__MapsDebugDontResetUserLocation")) & 1) != 0)
      {
        v36 = v7;
        v37 = v55;
        if (!v8)
          goto LABEL_36;
      }
      else
      {
        v36 = (MapsActivity *)objc_claimAutoreleasedReturnValue(+[MapsActivity mapsActivityPerDefault](MapsActivity, "mapsActivityPerDefault"));
        if (-[MapsActivity hasDisplayOptions](v7, "hasDisplayOptions"))
        {
          v54 = Integer;
          v38 = v8;
          v39 = objc_alloc_init((Class)GEOURLOptions);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v7, "displayOptions"));
          objc_msgSend(v39, "setMapType:", objc_msgSend(v40, "mapType"));

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v7, "displayOptions"));
          v42 = objc_msgSend(v41, "hasEnableTraffic");

          if (v42)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v7, "displayOptions"));
            objc_msgSend(v39, "setEnableTraffic:", objc_msgSend(v43, "enableTraffic"));

          }
          -[MapsActivity setDisplayOptions:](v36, "setDisplayOptions:", v39);

          v8 = v38;
          Integer = v54;
        }

        v37 = 1;
        if (!v8)
          goto LABEL_36;
      }
      if (((v37 | -[_MapsActivityRestoreHandlingTask coldLaunch](self, "coldLaunch")) & 1) == 0)
      {
        v47 = sub_100431A4C();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v57 = v8;
          v58 = 2048;
          v59 = Integer;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "no need to restore : storage date : %@ TTL: %ld", buf, 0x16u);
        }

        -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");
        goto LABEL_47;
      }
LABEL_36:
      if (-[MapsActivity hasDisplayOptions](v36, "hasDisplayOptions"))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v36, "displayOptions"));
        if ((objc_msgSend(v44, "hasCamera") & 1) != 0)
        {
          v45 = 0;
        }
        else
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v36, "displayOptions"));
          v45 = objc_msgSend(v49, "hasCenterSpan") ^ 1;

        }
        v46 = objc_alloc_init(RestorationAction);
        if (!v45)
          goto LABEL_46;
      }
      else
      {
        v46 = objc_alloc_init(RestorationAction);
      }
      -[MapsAction setUserLocationAccuracy:](v46, "setUserLocationAccuracy:", kCLLocationAccuracyBest);
LABEL_46:
      v50 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", v36, v46);
      -[UserActivityHandlingTask taskFinished:](self, "taskFinished:", v50);

LABEL_47:
      goto LABEL_48;
    }
    v15 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "_MapsActivityRestoreHandlingTask no mapsActivity from data";
      goto LABEL_9;
    }
  }
  else
  {
    v12 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "_MapsActivityRestoreHandlingTask no data";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    }
  }

  -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");
LABEL_48:

}

- (BOOL)coldLaunch
{
  return self->_coldLaunch;
}

- (void)setColdLaunch:(BOOL)a3
{
  self->_coldLaunch = a3;
}

@end
