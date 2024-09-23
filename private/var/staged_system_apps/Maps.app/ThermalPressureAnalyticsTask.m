@implementation ThermalPressureAnalyticsTask

- (ThermalPressureAnalyticsTask)initWithPlatformController:(id)a3 thermalPressureController:(id)a4 navigationService:(id)a5 powerSourceController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ThermalPressureAnalyticsTask *v14;
  id v15;
  NSObject *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *isolationQueue;
  id WeakRetained;
  unsigned int v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  id v33;
  objc_super v35;
  uint8_t buf[4];
  ThermalPressureAnalyticsTask *v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)ThermalPressureAnalyticsTask;
  v14 = -[ThermalPressureAnalyticsTask init](&v35, "init");
  if (v14)
  {
    v15 = sub_100847E70();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UTILITY, 0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create("com.apple.Maps.ThermalPressureAnalyticsTask.isolation", v20);
    isolationQueue = v14->_isolationQueue;
    v14->_isolationQueue = (OS_dispatch_queue *)v21;

    objc_storeWeak((id *)&v14->_platformController, v10);
    objc_storeWeak((id *)&v14->_thermalPressureController, v11);
    WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v24 = objc_msgSend(WeakRetained, "isPrimary");

    if (v24)
    {
      v25 = sub_100847E70();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v37 = v14;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}p] Observing thermal pressure changes", buf, 0xCu);
      }

      v27 = objc_loadWeakRetained((id *)&v14->_thermalPressureController);
      objc_msgSend(v27, "addThermalPressureObserver:", v14);

    }
    v28 = objc_storeWeak((id *)&v14->_navigationService, v12);
    objc_msgSend(v12, "registerObserver:", v14);

    objc_storeWeak((id *)&v14->_powerSourceController, v13);
    v29 = objc_loadWeakRetained((id *)&v14->_platformController);
    v30 = objc_msgSend(v29, "isPrimary");

    if (v30)
    {
      v31 = sub_100847E70();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v37 = v14;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Observing power source changes", buf, 0xCu);
      }

      v33 = objc_loadWeakRetained((id *)&v14->_powerSourceController);
      objc_msgSend(v33, "registerObserver:", v14);

    }
  }

  return v14;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  ThermalPressureAnalyticsTask *v10;

  v3 = sub_100847E70();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_thermalPressureController);
  objc_msgSend(WeakRetained, "removeThermalPressureObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_navigationService);
  objc_msgSend(v6, "unregisterObserver:", self);

  v7 = objc_loadWeakRetained((id *)&self->_powerSourceController);
  objc_msgSend(v7, "unregisterObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)ThermalPressureAnalyticsTask;
  -[ThermalPressureAnalyticsTask dealloc](&v8, "dealloc");
}

- (int)_mapType
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100848044;
  v4[3] = &unk_1011AD318;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)_chargingState
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ThermalPressureAnalyticsTask powerSourceController](self, "powerSourceController"));
  v3 = (char *)objc_msgSend(v2, "chargingState");

  if ((unint64_t)(v3 - 1) < 3)
    return (int)v3;
  else
    return 0;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  NSObject *v5;
  _QWORD block[4];
  id v7;
  int v8;
  id location;

  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[ThermalPressureAnalyticsTask isolationQueue](self, "isolationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100848298;
  block[3] = &unk_1011B6E80;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11[3];
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  v9 = objc_claimAutoreleasedReturnValue(-[ThermalPressureAnalyticsTask isolationQueue](self, "isolationQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100848494;
  v10[3] = &unk_1011AEE38;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  v11[2] = (id)a5;
  dispatch_async(v9, v10);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)powerSourceController:(id)a3 didUpdateChargingState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_claimAutoreleasedReturnValue(-[ThermalPressureAnalyticsTask isolationQueue](self, "isolationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100848724;
  block[3] = &unk_1011B72B0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  dispatch_async(v7, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (MapsThermalPressureController)thermalPressureController
{
  return (MapsThermalPressureController *)objc_loadWeakRetained((id *)&self->_thermalPressureController);
}

- (void)setThermalPressureController:(id)a3
{
  objc_storeWeak((id *)&self->_thermalPressureController, a3);
}

- (MNNavigationService)navigationService
{
  return (MNNavigationService *)objc_loadWeakRetained((id *)&self->_navigationService);
}

- (void)setNavigationService:(id)a3
{
  objc_storeWeak((id *)&self->_navigationService, a3);
}

- (MapsPowerSourceController)powerSourceController
{
  return (MapsPowerSourceController *)objc_loadWeakRetained((id *)&self->_powerSourceController);
}

- (void)setPowerSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_powerSourceController, a3);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_destroyWeak((id *)&self->_powerSourceController);
  objc_destroyWeak((id *)&self->_navigationService);
  objc_destroyWeak((id *)&self->_thermalPressureController);
  objc_destroyWeak((id *)&self->_platformController);
}

@end
