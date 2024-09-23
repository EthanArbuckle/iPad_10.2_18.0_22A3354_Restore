@implementation RidesharingAnalyticsBookedSession

- (RidesharingAnalyticsBookedSession)init
{
  RidesharingAnalyticsBookedSession *v2;
  NSMutableArray *v3;
  NSMutableArray *intentResponseFailures;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RidesharingAnalyticsBookedSession;
  v2 = -[RidesharingAnalyticsBookedSession init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    intentResponseFailures = v2->_intentResponseFailures;
    v2->_intentResponseFailures = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "mapsBackgrounded", UIApplicationDidEnterBackgroundNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "mapsForegrounded", UIApplicationWillEnterForegroundNotification, 0);

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

- (void)captureStatusIssue:(int64_t)a3
{
  self->_statusIssue = a3;
}

- (void)captureIntent:(int)a3 withFailure:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  RidesharingAnalyticsBookedSession *v7;
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

- (void)endSession
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *sessionId;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  id v22;

  if (!self->_sessionEnded)
  {
    self->_sessionEnded = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processName"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("destinationd"));

    if (v5)
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
      v7 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/Shared/Rides/Internal/RidesharingAnalyticsBookedSession.m");
        v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("endSession was called from destinationd, not capturing ride booking analytics"));
        *(_DWORD *)buf = 136315394;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

      }
    }
    else
    {
      sessionId = self->_sessionId;
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_bookedUsingMaps));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_cancelled));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_contactedDriver));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_viewedInProactiveTray));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_tappedProactiveTrayItem));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_viewedDetails));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_invalidVehicleLocation));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_missingVehicleLocation));
      +[GEOAPPortal captureRideBookedWithRideBookedSessionId:bookedUsingMaps:cancelled:contactedDriver:viewedInProactiveTray:tappedProactiveTrayItem:viewedDetails:invalidVehicleLocation:missingVehicleLocation:rideAppId:rideAppVersion:intentResponseFailures:](GEOAPPortal, "captureRideBookedWithRideBookedSessionId:bookedUsingMaps:cancelled:contactedDriver:viewedInProactiveTray:tappedProactiveTrayItem:viewedDetails:invalidVehicleLocation:missingVehicleLocation:rideAppId:rideAppVersion:intentResponseFailures:", sessionId, v18, v11, v12, v13, v14, v15, v16, v17, self->_appIdentifier, self->_appVersion, self->_intentResponseFailures);

    }
  }
}

- (void)mapsForegrounded
{
  self->_sessionEnded = 0;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)bookedUsingMaps
{
  return self->_bookedUsingMaps;
}

- (void)setBookedUsingMaps:(BOOL)a3
{
  self->_bookedUsingMaps = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)contactedDriver
{
  return self->_contactedDriver;
}

- (void)setContactedDriver:(BOOL)a3
{
  self->_contactedDriver = a3;
}

- (BOOL)viewedInProactiveTray
{
  return self->_viewedInProactiveTray;
}

- (void)setViewedInProactiveTray:(BOOL)a3
{
  self->_viewedInProactiveTray = a3;
}

- (BOOL)tappedProactiveTrayItem
{
  return self->_tappedProactiveTrayItem;
}

- (void)setTappedProactiveTrayItem:(BOOL)a3
{
  self->_tappedProactiveTrayItem = a3;
}

- (BOOL)viewedDetails
{
  return self->_viewedDetails;
}

- (void)setViewedDetails:(BOOL)a3
{
  self->_viewedDetails = a3;
}

- (BOOL)invalidVehicleLocation
{
  return self->_invalidVehicleLocation;
}

- (void)setInvalidVehicleLocation:(BOOL)a3
{
  self->_invalidVehicleLocation = a3;
}

- (BOOL)missingVehicleLocation
{
  return self->_missingVehicleLocation;
}

- (void)setMissingVehicleLocation:(BOOL)a3
{
  self->_missingVehicleLocation = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_intentResponseFailures, 0);
}

@end
