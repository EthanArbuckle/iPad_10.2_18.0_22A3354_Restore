@implementation PedestrianARSessionThermalStateMonitor

- (PedestrianARSessionThermalStateMonitor)initWithObserver:(id)a3 thermalPressureController:(id)a4
{
  id v6;
  id v7;
  PedestrianARSessionThermalStateMonitor *v8;
  id v9;
  NSObject *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PedestrianARSessionThermalStateMonitor initWithObserver:thermalPressureController:]";
      v20 = 2080;
      v21 = "PedestrianARSessionThermalStateMonitor.m";
      v22 = 1024;
      v23 = 35;
      v24 = 2080;
      v25 = "thermalPressureController != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PedestrianARSessionThermalStateMonitor;
  v8 = -[PedestrianARSessionMonitor initWithObserver:](&v17, "initWithObserver:", v6);
  if (v8)
  {
    v9 = sub_1005BAF2C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v19 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_thermalPressureController, a4);
    -[MapsThermalPressureController addThermalPressureObserver:](v8->_thermalPressureController, "addThermalPressureObserver:", v8);
    -[PedestrianARSessionThermalStateMonitor updateState](v8, "updateState");
  }

  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARSessionThermalStateMonitor *v7;

  v3 = sub_1005BAF2C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[MapsThermalPressureController removeThermalPressureObserver:](self->_thermalPressureController, "removeThermalPressureObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARSessionThermalStateMonitor;
  -[PedestrianARSessionMonitor dealloc](&v5, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionThermalStateMonitorEnabled;
  v3 = off_1014B3FD8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (void)updateState
{
  void *v3;
  unsigned int v4;
  unsigned int Integer;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  int v11;
  PedestrianARSessionThermalStateMonitor *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  unsigned int v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionThermalStateMonitor thermalPressureController](self, "thermalPressureController"));
  v4 = objc_msgSend(v3, "currentThermalPressureLevel");

  Integer = GEOConfigGetInteger(MapsConfig_PedestrianARSessionThermalStateMonitorThreshold, off_1014B45E8);
  v6 = sub_1005BAF2C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4 >= Integer)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionThermalStateMonitor thermalPressureController](self, "thermalPressureController"));
      v11 = 134349568;
      v12 = self;
      v13 = 1024;
      v14 = objc_msgSend(v9, "currentThermalPressureLevel");
      v15 = 1024;
      v16 = Integer;
      v10 = "[%{public}p] Detected thermal state is too high (%d >= %d); updating state";
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionThermalStateMonitor thermalPressureController](self, "thermalPressureController"));
    v11 = 134349568;
    v12 = self;
    v13 = 1024;
    v14 = objc_msgSend(v9, "currentThermalPressureLevel");
    v15 = 1024;
    v16 = Integer;
    v10 = "[%{public}p] Detected thermal state is sufficiently low (%d < %d); updating state";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0x18u);

  }
  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v4 < Integer);
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionThermalStateMonitor thermalPressureController](self, "thermalPressureController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nthermal state: %d\n"), v4, objc_msgSend(v5, "currentThermalPressureLevel")));

  return v6;
}

+ (id)friendlyName
{
  return CFSTR("Thermal State Monitor");
}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  PedestrianARSessionThermalStateMonitor *v10;
  __int16 v11;
  int v12;

  v5 = sub_1005BAF2C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v10 = self;
    v11 = 1024;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got thermal pressure update: %d", buf, 0x12u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005BB370;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (MapsThermalPressureController)thermalPressureController
{
  return self->_thermalPressureController;
}

- (void)setThermalPressureController:(id)a3
{
  objc_storeStrong((id *)&self->_thermalPressureController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalPressureController, 0);
}

@end
