@implementation MapsBaseLightMonitor

- (MapsBaseLightMonitor)init
{
  MapsBaseLightMonitor *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsBaseLightMonitor;
  v2 = -[MapsBaseLightMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MapsLightMonitorObserver, &_dispatch_main_q);
    observers = v2->_observers;
    v2->_observers = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsBaseLightMonitor _setMonitoring:](self, "_setMonitoring:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsBaseLightMonitor;
  -[MapsBaseLightMonitor dealloc](&v3, "dealloc");
}

- (void)startMonitoringWithObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
  -[MapsBaseLightMonitor _setMonitoring:](self, "_setMonitoring:", 1);
}

- (void)stopMonitoringWithObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
  -[MapsBaseLightMonitor _setMonitoring:](self, "_setMonitoring:", -[GEOObserverHashTable hasObservers](self->_observers, "hasObservers"));
}

- (void)_setMonitoring:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  MapsBaseLightMonitor *v10;

  if (self->_monitoring != a3)
  {
    v3 = a3;
    self->_monitoring = a3;
    v5 = sub_1004317AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v7)
      {
        v9 = 138412290;
        v10 = self;
        v8 = "%@: started monitoring";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
      }
    }
    else if (v7)
    {
      v9 = 138412290;
      v10 = self;
      v8 = "%@: stopped monitoring";
      goto LABEL_7;
    }

  }
}

- (void)_notifyDidChange
{
  id v3;
  NSObject *v4;
  int v5;
  MapsBaseLightMonitor *v6;

  v3 = sub_1004317AC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: notifying observers", (uint8_t *)&v5, 0xCu);
  }

  -[GEOObserverHashTable lightMonitorDidUpdate:](self->_observers, "lightMonitorDidUpdate:", self);
}

- (BOOL)_isMonitoring
{
  return self->_monitoring;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
