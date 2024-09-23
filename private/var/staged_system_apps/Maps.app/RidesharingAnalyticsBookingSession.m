@implementation RidesharingAnalyticsBookingSession

- (RidesharingAnalyticsBookingSession)init
{
  RidesharingAnalyticsBookingSession *v2;
  void *v3;
  uint64_t v4;
  NSString *sessionId;
  void *v6;
  uint64_t v7;
  NSString *initiallySelectedApp;
  uint64_t v9;
  NSDate *sessionStartDate;
  NSMutableArray *v11;
  NSMutableArray *errorMessages;
  NSMutableArray *v13;
  NSMutableArray *intentResponseFailures;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RidesharingAnalyticsBookingSession;
  v2 = -[RidesharingAnalyticsBookingSession init](&v18, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    sessionId = v2->_sessionId;
    v2->_sessionId = (NSString *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingAppPreferenceManager mostRecentSelectedAppIdentifers](RidesharingAppPreferenceManager, "mostRecentSelectedAppIdentifers"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    initiallySelectedApp = v2->_initiallySelectedApp;
    v2->_initiallySelectedApp = (NSString *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    sessionStartDate = v2->_sessionStartDate;
    v2->_sessionStartDate = (NSDate *)v9;

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    errorMessages = v2->_errorMessages;
    v2->_errorMessages = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    intentResponseFailures = v2->_intentResponseFailures;
    v2->_intentResponseFailures = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, "mapsBackgrounded", UIApplicationDidEnterBackgroundNotification, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, "mapsForegrounded", UIApplicationWillEnterForegroundNotification, 0);

  }
  return v2;
}

- (unint64_t)numberOfInstalledExtensions
{
  return self->_numberOfInstalledExtensions;
}

- (void)setNumberOfInstalledExtensions:(unint64_t)a3
{
  self->_numberOfInstalledExtensions = a3;
}

- (unint64_t)numberOfEnabledExtensions
{
  return self->_numberOfEnabledExtensions;
}

- (void)setNumberOfEnabledExtensions:(unint64_t)a3
{
  self->_numberOfEnabledExtensions = a3;
}

- (void)mapsBackgrounded
{
  -[RidesharingAnalyticsBookingSession endSessionOnView:state:](self, "endSessionOnView:state:", self->_endView, 3);
}

- (void)mapsForegrounded
{
  self->_sessionEnded = 0;
}

- (void)captureRideOptionCount:(unint64_t)a3
{
  unint64_t maximumCountOfRideOptionsReturned;

  maximumCountOfRideOptionsReturned = self->_maximumCountOfRideOptionsReturned;
  if (maximumCountOfRideOptionsReturned <= a3)
    maximumCountOfRideOptionsReturned = a3;
  self->_maximumCountOfRideOptionsReturned = maximumCountOfRideOptionsReturned;
}

- (void)captureBookedApp:(id)a3 version:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
  objc_storeStrong((id *)&self->_appVersion, a4);
  if (!self->_initiallySelectedApp || (objc_msgSend(v8, "isEqualToString:") & 1) == 0)
    self->_switchedApp = 1;

}

- (void)captureErrorMessage:(id)a3
{
  RidesharingAnalyticsBookingSession *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_errorMessages, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)captureIntent:(int)a3 withFailure:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  RidesharingAnalyticsBookingSession *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v8 = objc_alloc_init((Class)GEORideBookingIntentResponseFailure);
  objc_msgSend(v8, "setIntent:", v5);
  objc_msgSend(v8, "setFailure:", v4);
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableArray addObject:](v7->_intentResponseFailures, "addObject:", v8);
  objc_sync_exit(v7);

}

- (void)captureBookedRideOptionName:(id)a3
{
  objc_storeStrong((id *)&self->_rideType, a3);
}

- (void)captureView:(int64_t)a3
{
  self->_endView = a3;
}

- (void)captureStatusIssue:(int64_t)a3
{
  self->_statusIssue = a3;
}

- (void)endSessionOnView:(int64_t)a3 state:(int64_t)a4
{
  NSDate *v5;
  NSDate *bookingDate;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  RidesharingAnalyticsBookingSession *v17;
  uint64_t v18;
  double v19;
  double v20;
  id v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t Log;
  NSObject *v29;
  char *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *sessionId;
  NSString *appVersion;
  NSString *appIdentifier;
  unsigned int endView;
  unsigned int endState;
  unsigned int statusIssue;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint8_t buf[4];
  char *v52;
  __int16 v53;
  id v54;

  if (!self->_sessionEnded)
  {
    self->_sessionEnded = 1;
    self->_endState = a4;
    self->_endView = a3;
    if (!self->_maximumCountOfRideOptionsReturned)
      self->_noRidesAvailable = 1;
    if (a4 == 1)
    {
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      bookingDate = self->_bookingDate;
      self->_bookingDate = v5;

    }
    -[NSDate timeIntervalSinceNow](self->_sessionStartDate, "timeIntervalSinceNow");
    v8 = v7;
    -[CLLocation coordinate](self->_origin, "coordinate");
    v10 = v9;
    -[CLLocation coordinate](self->_origin, "coordinate");
    v12 = v11;
    -[CLLocation coordinate](self->_destination, "coordinate");
    v14 = v13;
    -[CLLocation coordinate](self->_destination, "coordinate");
    v16 = v15;
    v17 = self;
    objc_sync_enter(v17);
    v50 = -[NSMutableArray copy](v17->_errorMessages, "copy");
    v18 = (uint64_t)(v12 * 100.0);
    v19 = (float)((float)(uint64_t)(v14 * 100.0) / 100.0);
    v20 = (float)((float)v18 / 100.0);
    objc_sync_exit(v17);

    v21 = objc_alloc_init((Class)GEOLatLng);
    objc_msgSend(v21, "setLat:", (float)((float)(uint64_t)(v10 * 100.0) / 100.0));
    objc_msgSend(v21, "setLng:", v20);
    v22 = objc_alloc_init((Class)GEOLatLng);
    objc_msgSend(v22, "setLat:", v19);
    objc_msgSend(v22, "setLng:", (float)((float)(uint64_t)(v16 * 100.0) / 100.0));
    -[NSDate timeIntervalSince1970](v17->_bookingDate, "timeIntervalSince1970");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "processName"));
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("destinationd"));

    if (v27)
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
      v29 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/Shared/Rides/Internal/RidesharingAnalyticsBookingSession.m");
        v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("endSessionOnView: was called from destinationd, not capturing ride booking analytics"));
        *(_DWORD *)buf = 136315394;
        v52 = v30;
        v53 = 2112;
        v54 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

      }
    }
    else
    {
      endState = self->_endState;
      statusIssue = v17->_statusIssue;
      endView = self->_endView;
      sessionId = v17->_sessionId;
      appVersion = v17->_appVersion;
      appIdentifier = v17->_appIdentifier;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_exploredOtherOptions));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17->_distanceToPickup));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_paymentIsApplePay));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17->_numberOfInstalledExtensions));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_switchedApp));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_comparedRideOptions));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_showedSurgePricingAlert));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v8));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_installedApp));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (float)((float)(uint64_t)(v24 * 3600.0) / 3600.0)));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_noRidesAvailable));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v17->_movedPickupLocation));
      +[GEOAPPortal captureRideBookingWithRideBookingSessionId:statusIssue:endState:endView:rideAppId:rideAppVersion:originBlurred:destinationBlurred:exploredOtherOptions:distanceToPickupInMeters:paymentIsApplePay:numberOfAvailableExtensions:switchedApp:comparedRideOptions:showedSurgePricingAlert:durationOfSessionInSeconds:installedApp:timestamp:unavailable:movedPickupLocation:errorMessages:intentResponseFailures:](GEOAPPortal, "captureRideBookingWithRideBookingSessionId:statusIssue:endState:endView:rideAppId:rideAppVersion:originBlurred:destinationBlurred:exploredOtherOptions:distanceToPickupInMeters:paymentIsApplePay:numberOfAvailableExtensions:switchedApp:comparedRideOptions:showedSurgePricingAlert:durationOfSessionInSeconds:installedApp:timestamp:unavailable:movedPickupLocation:errorMessages:intentResponseFailures:", sessionId, statusIssue, endState, endView, appIdentifier, appVersion, v21, v22, v46, v39, v49, v48, v47, v32,
        v38,
        v33,
        v34,
        v35,
        v36,
        v37,
        v50,
        v17->_intentResponseFailures);

    }
  }
}

- (BOOL)sessionEnded
{
  return self->_sessionEnded;
}

- (void)setSessionEnded:(BOOL)a3
{
  self->_sessionEnded = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CLLocation)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (CLLocation)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (BOOL)showedSurgePricingAlert
{
  return self->_showedSurgePricingAlert;
}

- (void)setShowedSurgePricingAlert:(BOOL)a3
{
  self->_showedSurgePricingAlert = a3;
}

- (BOOL)installedApp
{
  return self->_installedApp;
}

- (void)setInstalledApp:(BOOL)a3
{
  self->_installedApp = a3;
}

- (BOOL)exploredOtherOptions
{
  return self->_exploredOtherOptions;
}

- (void)setExploredOtherOptions:(BOOL)a3
{
  self->_exploredOtherOptions = a3;
}

- (BOOL)paymentIsApplePay
{
  return self->_paymentIsApplePay;
}

- (void)setPaymentIsApplePay:(BOOL)a3
{
  self->_paymentIsApplePay = a3;
}

- (double)distanceToPickup
{
  return self->_distanceToPickup;
}

- (void)setDistanceToPickup:(double)a3
{
  self->_distanceToPickup = a3;
}

- (NSDate)bookingDate
{
  return self->_bookingDate;
}

- (void)setBookingDate:(id)a3
{
  objc_storeStrong((id *)&self->_bookingDate, a3);
}

- (BOOL)movedPickupLocation
{
  return self->_movedPickupLocation;
}

- (void)setMovedPickupLocation:(BOOL)a3
{
  self->_movedPickupLocation = a3;
}

- (BOOL)comparedRideOptions
{
  return self->_comparedRideOptions;
}

- (void)setComparedRideOptions:(BOOL)a3
{
  self->_comparedRideOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookingDate, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_intentResponseFailures, 0);
  objc_storeStrong((id *)&self->_rideType, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_initiallySelectedApp, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
}

@end
