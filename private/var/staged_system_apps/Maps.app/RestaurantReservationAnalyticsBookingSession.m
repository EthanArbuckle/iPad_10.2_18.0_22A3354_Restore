@implementation RestaurantReservationAnalyticsBookingSession

- (RestaurantReservationAnalyticsBookingSession)init
{
  RestaurantReservationAnalyticsBookingSession *v2;
  NSMutableArray *v3;
  NSMutableArray *errorMessages;
  void *v5;
  uint64_t v6;
  NSString *sessionID;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RestaurantReservationAnalyticsBookingSession;
  v2 = -[RestaurantReservationAnalyticsBookingSession init](&v11, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    errorMessages = v2->_errorMessages;
    v2->_errorMessages = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSString *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_mapsBackgrounded", UIApplicationDidEnterBackgroundNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "_mapsForegrounded", UIApplicationWillEnterForegroundNotification, 0);

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
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  id v14;
  objc_super v16;

  v3 = objc_alloc((Class)NSMutableString);
  v16.receiver = self;
  v16.super_class = (Class)RestaurantReservationAnalyticsBookingSession;
  v4 = -[RestaurantReservationAnalyticsBookingSession description](&v16, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n"), v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession sessionID](self, "sessionID"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" sessionID: %@\n"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession appID](self, "appID"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" appID: %@\n"), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(" muid: %llu\n"), -[RestaurantReservationAnalyticsBookingSession muid](self, "muid"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" blurredReservationTimestamp: %lld\n"), -[RestaurantReservationAnalyticsBookingSession blurredBookingTimestamp](self, "blurredBookingTimestamp"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" blurredBookingTimestamp: %lld\n"), -[RestaurantReservationAnalyticsBookingSession blurredReservationTimestamp](self, "blurredReservationTimestamp"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" installNeeded: %d\n"), -[RestaurantReservationAnalyticsBookingSession installNeeded](self, "installNeeded"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession installNeededTappedAppId](self, "installNeededTappedAppId"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" installNeededTappedAppId: %@\n"), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR(" installCompleted: %d\n"), -[RestaurantReservationAnalyticsBookingSession installCompleted](self, "installCompleted"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" tableSize: %lu\n"), -[RestaurantReservationAnalyticsBookingSession tableSize](self, "tableSize"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" addedSpecialRequest: %d\n"), -[RestaurantReservationAnalyticsBookingSession addedSpecialRequest](self, "addedSpecialRequest"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" swipedAvailableTimes: %d\n"), -[RestaurantReservationAnalyticsBookingSession swipedAvailableTimes](self, "swipedAvailableTimes"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" tappedDatePicker: %d\n"), -[RestaurantReservationAnalyticsBookingSession tappedDatePicker](self, "tappedDatePicker"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" hasAppsInstalled: %d\n"), -[RestaurantReservationAnalyticsBookingSession hasAppsInstalled](self, "hasAppsInstalled"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" hasAppsEnabled: %d\n"), -[RestaurantReservationAnalyticsBookingSession hasAppsEnabled](self, "hasAppsEnabled"));
  v10 = -[RestaurantReservationAnalyticsBookingSession currentView](self, "currentView");
  if (v10 > 7)
    v11 = CFSTR("UNKNOWN");
  else
    v11 = *(&off_1011D9B80 + v10);
  objc_msgSend(v6, "appendFormat:", CFSTR(" currentView: %@\n"), v11);
  v12 = -[RestaurantReservationAnalyticsBookingSession currentState](self, "currentState");
  if (v12 > 5)
    v13 = CFSTR("UNKNOWN");
  else
    v13 = *(&off_1011D9BC0 + v12);
  objc_msgSend(v6, "appendFormat:", CFSTR(" currentState: %@\n"), v13);
  v14 = objc_msgSend(v6, "copy");

  return v14;
}

- (void)_mapsBackgrounded
{
  -[RestaurantReservationAnalyticsBookingSession endSessionWithState:](self, "endSessionWithState:", 3);
}

- (void)_mapsForegrounded
{
  uint64_t v3;
  void *v4;
  unsigned int v5;

  v3 = objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession startDate](self, "startDate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[RestaurantReservationAnalyticsBookingSession sessionEnded](self, "sessionEnded");

    if (v5)
      -[RestaurantReservationAnalyticsBookingSession _restartSession](self, "_restartSession");
  }
}

- (void)_restartSession
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession errorMessages](self, "errorMessages"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession errorMessages](self, "errorMessages"));
  objc_msgSend(v4, "removeAllObjects");

  objc_sync_exit(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[RestaurantReservationAnalyticsBookingSession setStartDate:](self, "setStartDate:", v5);

  -[RestaurantReservationAnalyticsBookingSession setSessionEnded:](self, "setSessionEnded:", 0);
}

- (void)addErrorMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession errorMessages](self, "errorMessages"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession errorMessages](self, "errorMessages"));
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)beginSessionIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession startDate](self, "startDate"));

  if (!v3)
    -[RestaurantReservationAnalyticsBookingSession _restartSession](self, "_restartSession");
}

- (void)endSession
{
  -[RestaurantReservationAnalyticsBookingSession endSessionWithState:](self, "endSessionWithState:", -[RestaurantReservationAnalyticsBookingSession currentState](self, "currentState"));
}

- (void)endSessionWithState:(int64_t)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  unsigned int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v3 = a3;
  if (!-[RestaurantReservationAnalyticsBookingSession sessionEnded](self, "sessionEnded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession startDate](self, "startDate"));

    if (v5)
    {
      -[RestaurantReservationAnalyticsBookingSession setSessionEnded:](self, "setSessionEnded:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession errorMessages](self, "errorMessages"));
      objc_sync_enter(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession errorMessages](self, "errorMessages"));
      v31 = objc_msgSend(v7, "copy");

      objc_sync_exit(v6);
      v8 = -[RestaurantReservationAnalyticsBookingSession currentState](self, "currentState");
      if ((id)-[RestaurantReservationAnalyticsBookingSession currentState](self, "currentState") != (id)1)
        v8 = v3;
      v9 = -[RestaurantReservationAnalyticsBookingSession currentView](self, "currentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession startDate](self, "startDate"));
      objc_msgSend(v10, "timeIntervalSinceNow");
      v12 = -v11;

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession sessionID](self, "sessionID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession appID](self, "appID"));
      v24 = -[RestaurantReservationAnalyticsBookingSession muid](self, "muid");
      v23 = v8;
      v22 = v9;
      if (v24)
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[RestaurantReservationAnalyticsBookingSession muid](self, "muid")));
      else
        v26 = 0;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[RestaurantReservationAnalyticsBookingSession blurredReservationTimestamp](self, "blurredReservationTimestamp")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[RestaurantReservationAnalyticsBookingSession blurredBookingTimestamp](self, "blurredBookingTimestamp")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RestaurantReservationAnalyticsBookingSession installNeeded](self, "installNeeded")));
      v14 = -[RestaurantReservationAnalyticsBookingSession installNeeded](self, "installNeeded");
      if (v14)
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RestaurantReservationAnalyticsBookingSession installNeededTappedAppId](self, "installNeededTappedAppId"));
      else
        v15 = 0;
      v16 = -[RestaurantReservationAnalyticsBookingSession installNeeded](self, "installNeeded");
      if (v16)
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RestaurantReservationAnalyticsBookingSession installCompleted](self, "installCompleted")));
      else
        v17 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[RestaurantReservationAnalyticsBookingSession tableSize](self, "tableSize")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RestaurantReservationAnalyticsBookingSession addedSpecialRequest](self, "addedSpecialRequest")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RestaurantReservationAnalyticsBookingSession swipedAvailableTimes](self, "swipedAvailableTimes")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[RestaurantReservationAnalyticsBookingSession tappedDatePicker](self, "tappedDatePicker")));
      +[GEOAPPortal captureTableBookingWithBookTableSessionId:endState:endView:bookTableAppId:muid:blurredReservationTimestamp:blurredBookingTimestamp:durationOfSessionInSeconds:installNeeded:installNeededTappedAppId:installCompleted:tableSize:addedSpecialRequest:swipedAvailableTimes:tappedDatePicker:errorMessages:](GEOAPPortal, "captureTableBookingWithBookTableSessionId:endState:endView:bookTableAppId:muid:blurredReservationTimestamp:blurredBookingTimestamp:durationOfSessionInSeconds:installNeeded:installNeededTappedAppId:installCompleted:tableSize:addedSpecialRequest:swipedAvailableTimes:tappedDatePicker:errorMessages:", v25, v23, v22, v30, v26, v29, v28, v27, v13, v15, v17, v18, v19, v20, v21,
        v31);

      if (v16)
      if (v14)

      if (v24)
    }
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

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int64_t)blurredReservationTimestamp
{
  return self->_blurredReservationTimestamp;
}

- (void)setBlurredReservationTimestamp:(int64_t)a3
{
  self->_blurredReservationTimestamp = a3;
}

- (int64_t)blurredBookingTimestamp
{
  return self->_blurredBookingTimestamp;
}

- (void)setBlurredBookingTimestamp:(int64_t)a3
{
  self->_blurredBookingTimestamp = a3;
}

- (BOOL)installNeeded
{
  return self->_installNeeded;
}

- (void)setInstallNeeded:(BOOL)a3
{
  self->_installNeeded = a3;
}

- (NSString)installNeededTappedAppId
{
  return self->_installNeededTappedAppId;
}

- (void)setInstallNeededTappedAppId:(id)a3
{
  objc_storeStrong((id *)&self->_installNeededTappedAppId, a3);
}

- (BOOL)installCompleted
{
  return self->_installCompleted;
}

- (void)setInstallCompleted:(BOOL)a3
{
  self->_installCompleted = a3;
}

- (unint64_t)tableSize
{
  return self->_tableSize;
}

- (void)setTableSize:(unint64_t)a3
{
  self->_tableSize = a3;
}

- (BOOL)addedSpecialRequest
{
  return self->_addedSpecialRequest;
}

- (void)setAddedSpecialRequest:(BOOL)a3
{
  self->_addedSpecialRequest = a3;
}

- (BOOL)swipedAvailableTimes
{
  return self->_swipedAvailableTimes;
}

- (void)setSwipedAvailableTimes:(BOOL)a3
{
  self->_swipedAvailableTimes = a3;
}

- (BOOL)tappedDatePicker
{
  return self->_tappedDatePicker;
}

- (void)setTappedDatePicker:(BOOL)a3
{
  self->_tappedDatePicker = a3;
}

- (BOOL)hasAppsInstalled
{
  return self->_hasAppsInstalled;
}

- (void)setHasAppsInstalled:(BOOL)a3
{
  self->_hasAppsInstalled = a3;
}

- (BOOL)hasAppsEnabled
{
  return self->_hasAppsEnabled;
}

- (void)setHasAppsEnabled:(BOOL)a3
{
  self->_hasAppsEnabled = a3;
}

- (int64_t)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(int64_t)a3
{
  self->_currentView = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (NSMutableArray)errorMessages
{
  return self->_errorMessages;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
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
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_installNeededTappedAppId, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
