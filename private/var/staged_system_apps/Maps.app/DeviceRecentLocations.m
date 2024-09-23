@implementation DeviceRecentLocations

+ (id)sharedInstance
{
  if (qword_1014D3D40 != -1)
    dispatch_once(&qword_1014D3D40, &stru_1011E0B88);
  return (id)qword_1014D3D38;
}

- (DeviceRecentLocations)init
{
  DeviceRecentLocations *v2;
  NSLock *v3;
  NSLock *locationsLock;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DeviceRecentLocations;
  v2 = -[DeviceRecentLocations init](&v7, "init");
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    locationsLock = v2->locationsLock;
    v2->locationsLock = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_locationManagerApprovalDidChange", MKLocationManagerApprovalDidChangeNotification, 0);

    -[DeviceRecentLocations updateLocationsWithCompletionHandler:](v2, "updateLocationsWithCompletionHandler:", 0);
  }
  return v2;
}

- (void)_locationManagerApprovalDidChange
{
  -[DeviceRecentLocations updateLocationsWithCompletionHandler:](self, "updateLocationsWithCompletionHandler:", 0);
}

- (void)updateLocationsWithCompletionHandler:(id)a3
{
  id v4;
  GEORecentLocations *v5;
  GEORecentLocations *deviceLocations;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (!self->deviceLocations)
  {
    v5 = (GEORecentLocations *)objc_alloc_init((Class)GEORecentLocations);
    deviceLocations = self->deviceLocations;
    self->deviceLocations = v5;

  }
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A5DC18;
  v10[3] = &unk_1011AE240;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (NSArray)recentLocations
{
  return self->_recentLocations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentLocations, 0);
  objc_storeStrong((id *)&self->deviceLocations, 0);
  objc_storeStrong((id *)&self->locationsLock, 0);
}

@end
