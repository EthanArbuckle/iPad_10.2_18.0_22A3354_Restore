@implementation RestaurantReservationAnalyticsBookedSession

- (RestaurantReservationAnalyticsBookedSession)init
{
  RestaurantReservationAnalyticsBookedSession *v2;
  void *v3;
  uint64_t v4;
  NSString *sessionID;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RestaurantReservationAnalyticsBookedSession;
  v2 = -[RestaurantReservationAnalyticsBookedSession init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSString *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "_mapsBackgrounded", UIApplicationDidEnterBackgroundNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_mapsForegrounded", UIApplicationWillEnterForegroundNotification, 0);

  }
  return v2;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v3 = objc_alloc((Class)NSMutableString);
  v11.receiver = self;
  v11.super_class = (Class)RestaurantReservationAnalyticsBookedSession;
  v4 = -[RestaurantReservationAnalyticsBookedSession description](&v11, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookedSession sessionID](self, "sessionID"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" sessionID: %@\n"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookedSession appID](self, "appID"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" appID: %@\n"), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(" muid: %llu\n"), -[RestaurantReservationAnalyticsBookedSession muid](self, "muid"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" tappedChangeReservation: %d\n"), -[RestaurantReservationAnalyticsBookedSession tappedChangeReservation](self, "tappedChangeReservation"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" bookedUsingMaps: %d\n"), -[RestaurantReservationAnalyticsBookedSession bookedUsingMaps](self, "bookedUsingMaps"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" viewedInProactiveTray: %d\n"), -[RestaurantReservationAnalyticsBookedSession viewedInProactiveTray](self, "viewedInProactiveTray"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" tappedProactiveTrayItem: %d\n"), -[RestaurantReservationAnalyticsBookedSession tappedProactiveTrayItem](self, "tappedProactiveTrayItem"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" viewedInPlacecard: %d\n"), -[RestaurantReservationAnalyticsBookedSession viewedInPlacecard](self, "viewedInPlacecard"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" viewedDetailsFromPlacecard: %d\n"), -[RestaurantReservationAnalyticsBookedSession viewedDetailsFromPlacecard](self, "viewedDetailsFromPlacecard"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" hasAppsInstalled: %d\n"), -[RestaurantReservationAnalyticsBookedSession hasAppsInstalled](self, "hasAppsInstalled"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" hasAppsEnabled: %d\n"), -[RestaurantReservationAnalyticsBookedSession hasAppsEnabled](self, "hasAppsEnabled"));
  v9 = objc_msgSend(v6, "copy");

  return v9;
}

+ (id)currentAnalyticsBookedSessionForMuid:(unint64_t)a3 createIfNotPresent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  RestaurantReservationAnalyticsBookedSession *v7;
  uint64_t v8;
  RestaurantReservationAnalyticsBookedSession *i;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a4;
  if (qword_1014D3FB0 != -1)
    dispatch_once(&qword_1014D3FB0, &stru_1011E2D10);
  objc_msgSend((id)qword_1014D3FB8, "lock");
  if (qword_1014D3FC0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (id)qword_1014D3FC0;
    v7 = (RestaurantReservationAnalyticsBookedSession *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (RestaurantReservationAnalyticsBookedSession *)((char *)i + 1))
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "muid", (_QWORD)v15) == (id)a3)
          {
            v7 = v10;
            goto LABEL_14;
          }
        }
        v7 = (RestaurantReservationAnalyticsBookedSession *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)qword_1014D3FC0;
    qword_1014D3FC0 = (uint64_t)v11;

    v7 = 0;
  }
  if (v7)
    v13 = 1;
  else
    v13 = !v4;
  if (!v13)
  {
    v7 = objc_alloc_init(RestaurantReservationAnalyticsBookedSession);
    -[RestaurantReservationAnalyticsBookedSession setMuid:](v7, "setMuid:", a3);
    objc_msgSend((id)qword_1014D3FC0, "addObject:", v7);
  }
  objc_msgSend((id)qword_1014D3FB8, "unlock", (_QWORD)v15);
  return v7;
}

+ (void)removeAnalyticsBookedSession:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = qword_1014D3FC8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D3FC8, &stru_1011E2D30);
  objc_msgSend((id)qword_1014D3FB8, "lock");
  objc_msgSend((id)qword_1014D3FC0, "removeObject:", v4);

  objc_msgSend((id)qword_1014D3FB8, "unlock");
}

+ (void)removeAnalyticsBookedSessionsFromProactiveTrayIfNotInListOfMuids:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];

  v24 = a3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)qword_1014D3FC0;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    v21 = *(_QWORD *)v35;
    do
    {
      v6 = 0;
      v22 = v4;
      do
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v6);
        if (objc_msgSend(v7, "viewedInProactiveTray"))
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v8 = v24;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (!v9)
          {

LABEL_19:
            objc_msgSend(v23, "addObject:", v7);
            goto LABEL_20;
          }
          v10 = v9;
          v11 = *(_QWORD *)v31;
          v12 = 1;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v11)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "muid")));
              LODWORD(v14) = objc_msgSend(v14, "isEqualToNumber:", v15);

              if ((_DWORD)v14)
                v12 = 0;
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v10);

          v5 = v21;
          v4 = v22;
          if ((v12 & 1) != 0)
            goto LABEL_19;
        }
LABEL_20:
        v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v4);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v23;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j), "endSession");
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v18);
  }

}

- (void)_mapsForegrounded
{
  *(_WORD *)&self->_viewedInPlacecard = 0;
  *(_DWORD *)&self->_tappedChangeReservation = 0;
}

- (void)_restartSession
{
  self->_sessionEnded = 0;
}

- (void)_captureSession
{
  _BOOL8 v3;
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v6;
  unsigned __int8 v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookedSession sessionID](self, "sessionID"));
  v3 = -[RestaurantReservationAnalyticsBookedSession bookedUsingMaps](self, "bookedUsingMaps");
  v4 = -[RestaurantReservationAnalyticsBookedSession viewedInProactiveTray](self, "viewedInProactiveTray");
  v5 = -[RestaurantReservationAnalyticsBookedSession tappedProactiveTrayItem](self, "tappedProactiveTrayItem");
  v6 = -[RestaurantReservationAnalyticsBookedSession viewedInPlacecard](self, "viewedInPlacecard");
  v7 = -[RestaurantReservationAnalyticsBookedSession viewedDetailsFromPlacecard](self, "viewedDetailsFromPlacecard");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookedSession appID](self, "appID"));
  v9 = -[RestaurantReservationAnalyticsBookedSession muid](self, "muid");
  BYTE3(v11) = 0;
  BYTE2(v11) = -[RestaurantReservationAnalyticsBookedSession tappedChangeReservation](self, "tappedChangeReservation");
  LOWORD(v11) = 0;
  LOWORD(v10) = v7;
  +[GEOAPPortal captureTableBookedEventWithSessionId:bookedUsingMaps:cancelled:viewedInProactiveTray:tappedProactiveTrayItem:viewedInPlacecard:viewedDetailsInPlacecard:isAsync:bookedAppId:muid:called:routed:tappedChangeReservation:tappedCancelReservation:](GEOAPPortal, "captureTableBookedEventWithSessionId:bookedUsingMaps:cancelled:viewedInProactiveTray:tappedProactiveTrayItem:viewedInPlacecard:viewedDetailsInPlacecard:isAsync:bookedAppId:muid:called:routed:tappedChangeReservation:tappedCancelReservation:", v12, v3, 0, v4, v5, v6, v10, v8, v9, v11);

}

- (void)setHasAppsInstalled:(BOOL)a3
{
  -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_hasAppsInstalled = a3;
}

- (void)setHasAppsEnabled:(BOOL)a3
{
  -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_hasAppsEnabled = a3;
}

- (void)setAppID:(id)a3
{
  NSString *v4;
  NSString *appID;

  v4 = (NSString *)a3;
  if (v4)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  appID = self->_appID;
  self->_appID = v4;

}

- (void)setMuid:(unint64_t)a3
{
  if (a3)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_muid = a3;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  if (a3)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_bookedUsingMaps = a3;
}

- (void)setViewedInPlacecard:(BOOL)a3
{
  if (a3)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_viewedInPlacecard = a3;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  if (a3)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_viewedInProactiveTray = a3;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  if (a3)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_tappedProactiveTrayItem = a3;
}

- (void)setTappedChangeReservation:(BOOL)a3
{
  if (a3)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_tappedChangeReservation = a3;
}

- (void)setViewedDetailsFromPlacecard:(BOOL)a3
{
  if (a3)
    -[RestaurantReservationAnalyticsBookedSession _restartSession](self, "_restartSession");
  self->_viewedDetailsFromPlacecard = a3;
}

- (void)endSession
{
  if (!-[RestaurantReservationAnalyticsBookedSession sessionEnded](self, "sessionEnded"))
  {
    -[RestaurantReservationAnalyticsBookedSession setSessionEnded:](self, "setSessionEnded:", 1);
    -[RestaurantReservationAnalyticsBookedSession _captureSession](self, "_captureSession");
    +[RestaurantReservationAnalyticsBookedSession removeAnalyticsBookedSession:](RestaurantReservationAnalyticsBookedSession, "removeAnalyticsBookedSession:", self);
  }
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSString)appID
{
  return self->_appID;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (BOOL)tappedChangeReservation
{
  return self->_tappedChangeReservation;
}

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (BOOL)viewedInPlacecard
{
  return self->_viewedInPlacecard;
}

- (BOOL)viewedDetailsFromPlacecard
{
  return self->_viewedDetailsFromPlacecard;
}

- (BOOL)hasAppsInstalled
{
  return self->_hasAppsInstalled;
}

- (BOOL)hasAppsEnabled
{
  return self->_hasAppsEnabled;
}

- (BOOL)sessionEnded
{
  return self->_sessionEnded;
}

- (void)setSessionEnded:(BOOL)a3
{
  self->_sessionEnded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
