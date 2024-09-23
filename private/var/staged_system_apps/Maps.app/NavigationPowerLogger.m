@implementation NavigationPowerLogger

- (NavigationPowerLogger)init
{
  NavigationPowerLogger *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavigationPowerLogger;
  v2 = -[NavigationPowerLogger init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v3, "registerObserver:", v2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
    objc_msgSend(v4, "startMonitoringWithObserver:", v2);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v6 = objc_msgSend(v5, "isInNavigatingState");

    if (v6)
      -[NavigationPowerLogger _navigationStarted](v2, "_navigationStarted");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  objc_msgSend(v4, "stopMonitoringWithObserver:", self);

  if (self->_trackedState)
    -[NavigationPowerLogger _logCurrentNavState:](self, "_logCurrentNavState:", 1);
  v5.receiver = self;
  v5.super_class = (Class)NavigationPowerLogger;
  -[NavigationPowerLogger dealloc](&v5, "dealloc");
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  -[NavigationPowerLogger _logCurrentNavStateIfNeeded](self, "_logCurrentNavStateIfNeeded", a3, a4);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, a3))
  {
    -[NavigationPowerLogger _navigationStarted](self, "_navigationStarted");
  }
  else if (!a5)
  {
    -[NavigationPowerLogger _navigationEnded](self, "_navigationEnded");
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[NavigationPowerLogger _logCurrentNavStateIfNeeded](self, "_logCurrentNavStateIfNeeded", a3, a4, a5);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  -[NavigationPowerLogger _logCurrentNavStateIfNeeded](self, "_logCurrentNavStateIfNeeded", a3, *(_QWORD *)&a4, a5, a6);
}

- (void)setDisplayingNavOnLockScreen:(BOOL)a3
{
  if (self->_displayingNavOnLockScreen != a3)
  {
    self->_displayingNavOnLockScreen = a3;
    -[NavigationPowerLogger _logCurrentNavStateIfNeeded](self, "_logCurrentNavStateIfNeeded");
  }
}

- (void)setMapType:(unint64_t)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    -[NavigationPowerLogger _logCurrentNavStateIfNeeded](self, "_logCurrentNavStateIfNeeded");
  }
}

- (void)startLogging
{
  if (!self->_shouldLog)
  {
    self->_shouldLog = 1;
    -[NavigationPowerLogger _logCurrentNavStateIfNeeded](self, "_logCurrentNavStateIfNeeded");
  }
}

- (void)stopLogging
{
  if (self->_shouldLog)
  {
    -[NavigationPowerLogger _logCurrentNavState:](self, "_logCurrentNavState:", 1);
    -[NavigationPowerLogger _resetLogEvent](self, "_resetLogEvent");
    self->_shouldLog = 0;
  }
}

- (void)_navigationStarted
{
  void *v3;
  id v4;

  -[NavigationPowerLogger _resetLogEvent](self, "_resetLogEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  self->_screenIsLocked = objc_msgSend(v3, "isLocked");

  -[NavigationPowerLogger _logCurrentNavState:](self, "_logCurrentNavState:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  objc_msgSend(v4, "startMonitoringWithObserver:", self);

}

- (void)_navigationEnded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  objc_msgSend(v3, "stopMonitoringWithObserver:", self);

  -[NavigationPowerLogger _logCurrentNavState:](self, "_logCurrentNavState:", 1);
  -[NavigationPowerLogger _resetLogEvent](self, "_resetLogEvent");
}

- (void)_logCurrentNavStateIfNeeded
{
  -[NavigationPowerLogger _logCurrentNavState:](self, "_logCurrentNavState:", 0);
}

- (void)_resetLogEvent
{
  NSDictionary *trackedState;
  NSDate *eventStartDate;

  trackedState = self->_trackedState;
  self->_trackedState = 0;

  eventStartDate = self->_eventStartDate;
  self->_eventStartDate = 0;

}

- (void)_logCurrentNavState:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  NSDate *v8;
  NSDictionary **p_trackedState;
  __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  NSDate *eventStartDate;
  NSDate *v15;
  id obj;

  if (self->_shouldLog)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NavigationPowerLogger _currentNavStateDictionary](self, "_currentNavStateDictionary"));
    obj = (id)v5;
    if (a3
      || (v7 = -[NSDictionary isEqualToDictionary:](self->_trackedState, "isEqualToDictionary:", v5),
          v6 = obj,
          (v7 & 1) == 0))
    {
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", v6));
      p_trackedState = &self->_trackedState;
      if (self->_trackedState)
      {
        v10 = (__CFString *)objc_msgSend(obj, "mutableCopy");
        -[NSDate timeIntervalSince1970](self->_eventStartDate, "timeIntervalSince1970");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[__CFString setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, CFSTR("StartUnix"));

        -[NSDate timeIntervalSince1970](v8, "timeIntervalSince1970");
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[__CFString setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, CFSTR("EndUnix"));

        CFRetain(CFSTR("MapsNavigationStateEvent"));
        if (v10)
        {
          CFRetain(v10);
          PLLogRegisteredEvent(55, CFSTR("MapsNavigationStateEvent"), v10, 0);
          CFRelease(CFSTR("MapsNavigationStateEvent"));
          v13 = v10;
        }
        else
        {
          v13 = CFSTR("MapsNavigationStateEvent");
          PLLogRegisteredEvent(55, CFSTR("MapsNavigationStateEvent"), 0, 0);
        }
        CFRelease(v13);

      }
      eventStartDate = self->_eventStartDate;
      self->_eventStartDate = v8;
      v15 = v8;

      objc_storeStrong((id *)p_trackedState, obj);
      v6 = obj;
    }

  }
}

- (id)_currentNavStateDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v9[0] = CFSTR("NavigationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationPowerLogger _powerLogNavTransportTypeValue](self, "_powerLogNavTransportTypeValue"));
  v10[0] = v3;
  v9[1] = CFSTR("NavigationAppState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationPowerLogger _powerLogNavAppStateValue](self, "_powerLogNavAppStateValue"));
  v10[1] = v4;
  v9[2] = CFSTR("NightMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationPowerLogger _powerLogLightLevelValue](self, "_powerLogLightLevelValue"));
  v10[2] = v5;
  v9[3] = CFSTR("NavigationMapType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavigationPowerLogger mapType](self, "mapType")));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  return v7;
}

- (id)_powerLogNavAppStateValue
{
  _UNKNOWN **v3;
  void *v4;

  if (-[NavigationPowerLogger displayingNavOnLockScreen](self, "displayingNavOnLockScreen") && self->_screenIsLocked)
    return &off_10126CF70;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance"));
  if (objc_msgSend(v4, "isInBackground"))
    v3 = &off_10126CF88;
  else
    v3 = &off_10126CFA0;

  return v3;
}

- (id)_powerLogNavTransportTypeValue
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "navigationTransportType");

  if (v3 > 6)
    return &off_10126CFA0;
  else
    return (&off_1011B4460)[v3];
}

- (id)_powerLogLightLevelValue
{
  void *v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  if (objc_msgSend(v2, "shouldUseNightMode"))
    v3 = &off_10126CFA0;
  else
    v3 = &off_10126CFD0;
  v4 = v3;

  return v4;
}

- (void)screenLayoutDidChangeWithReason:(unint64_t)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor", a3));
  v5 = objc_msgSend(v4, "isLocked");

  if (self->_screenIsLocked != v5)
  {
    self->_screenIsLocked = v5;
    -[NavigationPowerLogger _logCurrentNavStateIfNeeded](self, "_logCurrentNavStateIfNeeded");
  }
}

- (BOOL)displayingNavOnLockScreen
{
  return self->_displayingNavOnLockScreen;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedState, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);
}

@end
