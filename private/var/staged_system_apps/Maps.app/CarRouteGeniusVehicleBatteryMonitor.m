@implementation CarRouteGeniusVehicleBatteryMonitor

- (CarRouteGeniusVehicleBatteryMonitor)initWithRouteGeniusService:(id)a3 virtualGarageService:(id)a4 callbackQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CarRouteGeniusVehicleBatteryMonitor *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CarRouteGeniusVehicleBatteryMonitor;
  v12 = -[CarRouteGeniusVehicleBatteryMonitor init](&v18, "init");
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("CarRouteGeniusVehicleBatteryMonitor", v14);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_callbackQueue, a5);
    objc_storeStrong((id *)&v12->_routeGeniusService, a3);
    objc_storeStrong((id *)&v12->_garageService, a4);
  }

  return v12;
}

- (void)setActive:(BOOL)a3
{
  CarRouteGeniusService *routeGeniusService;

  if (self->_active != a3)
  {
    self->_active = a3;
    routeGeniusService = self->_routeGeniusService;
    if (a3)
    {
      -[CarRouteGeniusService registerObserver:](routeGeniusService, "registerObserver:", self);
      -[VGVirtualGarageService registerObserver:](self->_garageService, "registerObserver:", self);
    }
    else
    {
      -[CarRouteGeniusService unregisterObserver:](routeGeniusService, "unregisterObserver:", self);
      -[VGVirtualGarageService unregisterObserver:](self->_garageService, "unregisterObserver:", self);
    }
    -[CarRouteGeniusVehicleBatteryMonitor _updateState](self, "_updateState");
  }
}

- (void)setCurrentVehicleState:(id)a3
{
  unint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  VGVehicleState *currentVehicleState;
  int v10;
  VGVehicleState *v11;
  __int16 v12;
  void *v13;

  v5 = (unint64_t)a3;
  v6 = (void *)v5;
  if (v5 | (unint64_t)self->_currentVehicleState
    && objc_msgSend((id)v5, "isSignificantlyDifferentFromVehicleState:"))
  {
    v7 = sub_100C351A4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      currentVehicleState = self->_currentVehicleState;
      v10 = 138412546;
      v11 = currentVehicleState;
      v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "setCurrentVehicleState: from: %@ to: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentVehicleState, a3);
    -[CarRouteGeniusVehicleBatteryMonitor _setNeedsCheckBattery](self, "_setNeedsCheckBattery");
  }

}

- (void)setCurrentRouteAttributes:(id)a3
{
  id v5;
  GEORouteAttributes *currentRouteAttributes;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  GEORouteAttributes *v13;
  int v14;
  GEORouteAttributes *v15;
  __int16 v16;
  unint64_t v17;

  v5 = a3;
  currentRouteAttributes = self->_currentRouteAttributes;
  v7 = (unint64_t)v5;
  v8 = currentRouteAttributes;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      v11 = sub_100C351A4();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_currentRouteAttributes;
        v14 = 138412546;
        v15 = v13;
        v16 = 2112;
        v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "setCurrentRouteAttributes: from: %@ to: %@", (uint8_t *)&v14, 0x16u);
      }

      objc_storeStrong((id *)&self->_currentRouteAttributes, a3);
      -[CarRouteGeniusVehicleBatteryMonitor _setNeedsCheckBattery](self, "_setNeedsCheckBattery");
    }
  }

}

- (void)_updateState
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C35390;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setNeedsCheckBattery
{
  NSObject *workQueue;
  _QWORD block[5];

  if (!self->_needsCheckBattery)
  {
    self->_needsCheckBattery = 1;
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C357DC;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)_checkBattery
{
  GEORouteAttributes *currentRouteAttributes;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  double v16;
  double v17;
  unsigned int v18;
  double v19;
  void *v20;
  double v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  unsigned int v32;
  unsigned int v33;
  double Double;
  NSObject *callbackQueue;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[4];
  id v41[4];
  int location;
  double location_4;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;

  if (self->_needsCheckBattery)
  {
    self->_needsCheckBattery = 0;
    currentRouteAttributes = self->_currentRouteAttributes;
    if (currentRouteAttributes)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORouteAttributes automobileOptions](currentRouteAttributes, "automobileOptions"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleSpecifications"));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "evInfo"));

      if ((uint64_t)self->_currentVehicleState | v6)
      {
        v13 = objc_msgSend((id)v6, "minBatteryCharge");
        v14 = objc_msgSend((id)v6, "maxBatteryCharge");
        v15 = objc_msgSend((id)v6, "currentBatteryCharge");
        v16 = 0.0;
        v17 = 0.0;
        v18 = v14 - v13;
        if (v14 != v13)
        {
          v19 = fmin(fmax((double)(v15 - v13) / (double)v18, 0.0), 1.0);
          if ((double)(v15 - v13) <= (double)v18)
            v17 = v19;
          else
            v17 = 0.0;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicleState minBatteryCapacity](self->_currentVehicleState, "minBatteryCapacity"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitEnergy kilowattHours](NSUnitEnergy, "kilowattHours"));
        v39 = v20;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "measurementByConvertingToUnit:", v38));
        objc_msgSend(v37, "doubleValue");
        v22 = (v21 * 1000.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicleState maxBatteryCapacity](self->_currentVehicleState, "maxBatteryCapacity"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitEnergy kilowattHours](NSUnitEnergy, "kilowattHours"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "measurementByConvertingToUnit:", v24));
        objc_msgSend(v25, "doubleValue");
        v27 = (v26 * 1000.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicleState currentBatteryCapacity](self->_currentVehicleState, "currentBatteryCapacity"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitEnergy kilowattHours](NSUnitEnergy, "kilowattHours"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "measurementByConvertingToUnit:", v29));
        objc_msgSend(v30, "doubleValue");
        v32 = v27 - v22;
        if (v27 != v22)
        {
          v33 = (v31 * 1000.0) - v22;
          if ((double)v33 <= (double)v32)
            v16 = fmin(fmax((double)v33 / (double)v32, 0.0), 1.0);
        }

        Double = GEOConfigGetDouble(MapsConfig_EVRoutingRouteGeniusForceRerouteThreshold, off_1014B5178);
        if (vabdd_f64(v17, v16) > Double)
        {
          objc_initWeak((id *)&location, self);
          callbackQueue = self->_callbackQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100C35B84;
          block[3] = &unk_1011B8BD8;
          objc_copyWeak(v41, (id *)&location);
          v41[1] = *(id *)&v17;
          v41[2] = *(id *)&v16;
          v41[3] = *(id *)&Double;
          dispatch_async(callbackQueue, block);
          objc_destroyWeak(v41);
          objc_destroyWeak((id *)&location);
LABEL_19:

          return;
        }
        v36 = sub_100C351A4();
        v8 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          location = 134218496;
          location_4 = v17 * 100.0;
          v44 = 2048;
          v45 = v16 * 100.0;
          v46 = 2048;
          v47 = Double * 100.0;
          v9 = "_checkBattery: batteryPercentage changed from: %.2lf (RG) to: %.2lf (VG), which is less than threshold: %"
               ".2lf -> ignoring";
          v10 = v8;
          v11 = OS_LOG_TYPE_INFO;
          v12 = 32;
          goto LABEL_17;
        }
      }
      else
      {
        v7 = sub_100C351A4();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(location) = 0;
          v9 = "_checkBattery: user is not driving an EV -> ignoring.";
          v10 = v8;
          v11 = OS_LOG_TYPE_DEBUG;
          v12 = 2;
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&location, v12);
        }
      }

      goto LABEL_19;
    }
  }
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *workQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = sub_100C351A4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didUpdateRouteGenius: %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C35D8C;
  v9[3] = &unk_1011AC8B0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(workQueue, v9);

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *workQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = sub_100C351A4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "virtualGarageDidUpdate: %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C35EE4;
  v9[3] = &unk_1011AC8B0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(workQueue, v9);

}

- (CarRouteGeniusVehicleBatteryMonitorDelegate)delegate
{
  return (CarRouteGeniusVehicleBatteryMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (CarRouteGeniusService)routeGeniusService
{
  return self->_routeGeniusService;
}

- (void)setRouteGeniusService:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeniusService, a3);
}

- (VGVirtualGarageService)garageService
{
  return self->_garageService;
}

- (void)setGarageService:(id)a3
{
  objc_storeStrong((id *)&self->_garageService, a3);
}

- (GEORouteAttributes)currentRouteAttributes
{
  return self->_currentRouteAttributes;
}

- (VGVehicleState)currentVehicleState
{
  return self->_currentVehicleState;
}

- (BOOL)needsCheckBattery
{
  return self->_needsCheckBattery;
}

- (void)setNeedsCheckBattery:(BOOL)a3
{
  self->_needsCheckBattery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_currentRouteAttributes, 0);
  objc_storeStrong((id *)&self->_garageService, 0);
  objc_storeStrong((id *)&self->_routeGeniusService, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
