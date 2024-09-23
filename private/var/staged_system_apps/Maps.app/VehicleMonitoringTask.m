@implementation VehicleMonitoringTask

- (VehicleMonitoringTask)init
{
  VehicleMonitoringTask *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VehicleMonitoringTask;
  v2 = -[VehicleMonitoringTask init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("VehicleMonitoringTask", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *routePlanningSession;
  RoutePlanningSession *v7;

  v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  v7 = v5;
  if (routePlanningSession != v5)
  {
    -[RoutePlanningSession removeObserver:](routePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
    self->_hasReportedRoutePlanningSession = 0;
    if (self->_routePlanningSession)
      -[VehicleMonitoringTask _syncSelectedVehicleStateWithGarage:](self, "_syncSelectedVehicleStateWithGarage:", 0);
  }

}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v7 = a4;
  v8 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004A7074;
  v12[3] = &unk_1011AFF10;
  objc_copyWeak(&v15, &location);
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5 == 1 && !self->_hasReportedRoutePlanningSession)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1004A745C;
    v23 = sub_1004A746C;
    v24 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1004A7474;
    v18[3] = &unk_1011B58C0;
    v18[4] = &v19;
    objc_msgSend(v9, "withValue:orError:", v18, &stru_1011B8798);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "currentRoute"));
    if ((objc_msgSend(v11, "isEVRoute") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeVehicleIdentifier"));

      if (v13)
      {
        objc_initWeak(&location, self);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1004A7488;
        v14[3] = &unk_1011B87E8;
        objc_copyWeak(&v16, &location);
        v15 = v13;
        -[VehicleMonitoringTask _loadGarageWithCompletion:](self, "_loadGarageWithCompletion:", v14);

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }

    }
    _Block_object_dispose(&v19, 8);

  }
}

- (void)_loadGarageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004A7728;
  v7[3] = &unk_1011B8810;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "virtualGarageGetGarageWithReply:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004A7938;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_syncSelectedVehicleStateWithGarage:(id)a3
{
  id v3;
  _QWORD v4[4];
  Block_layout *v5;

  if (a3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectedVehicle"));
    sub_1004A7A04(v3, (VGVehicle *)v3);

  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1004A7B78;
    v4[3] = &unk_1011B88B8;
    v5 = &stru_1011B8850;
    -[VehicleMonitoringTask _loadGarageWithCompletion:](self, "_loadGarageWithCompletion:", v4);

  }
}

- (void)_checkBatteryStateWithGarage:(id)a3
{
  void *v4;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectedVehicle"));
  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVehicleState"));

  if (self->_hasReportedBatteryState || v24 == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v6, "unregisterObserver:", self);

  }
  else if (self->_isNavigating)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "maxBatteryCapacity"));
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "minBatteryCapacity"));
    objc_msgSend(v10, "doubleValue");
    v12 = vabdd_f64(v9, v11);

    if (v12 > 2.22044605e-16)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentBatteryCapacity"));
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "maxBatteryCapacity"));
      objc_msgSend(v16, "doubleValue");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "minBatteryCapacity"));
      objc_msgSend(v19, "doubleValue");
      v21 = v15 / (v18 - v20);

      if (v21 < GEOConfigGetDouble(MapsConfig_EVRoutingAnalyticsStrandedBatteryPercentage, off_1014B39F8))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        objc_msgSend(v22, "captureUserAction:onTarget:eventValue:", 6091, 0, 0);

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
        objc_msgSend(v23, "vehicleBatteryDied");

        self->_hasReportedBatteryState = 1;
      }
    }
  }

}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
