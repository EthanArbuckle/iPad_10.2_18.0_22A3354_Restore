@implementation RideBookingApplicationFinder

- (RideBookingApplicationFinder)init
{
  RideBookingApplicationFinder *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  id v7;
  void *v8;
  uint64_t v9;
  MapsSuggestionsAppGuardian *appGuardian;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RideBookingApplicationFinder;
  v2 = -[RideBookingApplicationFinder init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("RideBookingApplicationFinderQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[RideBookingApplicationFinder _setupExtensionManager](v2, "_setupExtensionManager");
    v7 = sub_100B3A5D4();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "oneAppGuardian"));
    appGuardian = v2->_appGuardian;
    v2->_appGuardian = (MapsSuggestionsAppGuardian *)v9;

  }
  return v2;
}

- (void)_setupExtensionManager
{
  _MXExtensionManager *v3;
  _MXExtensionManager *extensionManager;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[_MXExtensionManager _lookupPolicyWithBlock:](_MXExtensionManager, "_lookupPolicyWithBlock:", &stru_1011E1DA8));
  self->_waitingForExtensionManagerToLoad = 1;
  v3 = (_MXExtensionManager *)objc_claimAutoreleasedReturnValue(+[_MXExtensionManager managerWithLookupPolicy:delegate:](_MXExtensionManager, "managerWithLookupPolicy:delegate:", v5, self));
  extensionManager = self->_extensionManager;
  self->_extensionManager = v3;

}

- (void)extensionManager:(id)a3 didUpdateAvailableExtensions:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *queue;
  _QWORD block[5];
  id v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  id v20;

  v5 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplicationFinder.m");
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Updated extensions: %@"), v5);
    *(_DWORD *)buf = 136315394;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[RideBookingApplicationFinder delegate](self, "delegate"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplicationFinder delegate](self, "delegate"));
    v13 = objc_opt_respondsToSelector(v12, "rideBookingApplicationsDidChange:");

    if ((v13 & 1) != 0)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100ACFB78;
      block[3] = &unk_1011AC8B0;
      block[4] = self;
      v16 = v5;
      dispatch_async(queue, block);

    }
  }

}

- (void)extensionManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  RideBookingApplicationFinder *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100ACFF50;
  v8[3] = &unk_1011AC8B0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (BOOL)readyToLoadApps
{
  return !self->_waitingForExtensionManagerToLoad;
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  _MXExtensionManager *extensionManager;

  extensionManager = self->_extensionManager;
  self->_extensionManager = 0;

  -[RideBookingApplicationFinder _setupExtensionManager](self, "_setupExtensionManager");
}

- (void)dealloc
{
  objc_super v3;

  -[MapsSuggestionsAppGuardian unregisterAppTracker:](self->_appGuardian, "unregisterAppTracker:", self);
  v3.receiver = self;
  v3.super_class = (Class)RideBookingApplicationFinder;
  -[RideBookingApplicationFinder dealloc](&v3, "dealloc");
}

- (RideBookingApplicationFinderDelegate)delegate
{
  return (RideBookingApplicationFinderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (_MXExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
  objc_storeStrong((id *)&self->_extensionManager, a3);
}

- (BOOL)waitingForExtensionManagerToLoad
{
  return self->_waitingForExtensionManagerToLoad;
}

- (void)setWaitingForExtensionManagerToLoad:(BOOL)a3
{
  self->_waitingForExtensionManagerToLoad = a3;
}

- (NSArray)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_storeStrong((id *)&self->_applications, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (MapsSuggestionsAppGuardian)appGuardian
{
  return self->_appGuardian;
}

- (void)setAppGuardian:(id)a3
{
  objc_storeStrong((id *)&self->_appGuardian, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appGuardian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
