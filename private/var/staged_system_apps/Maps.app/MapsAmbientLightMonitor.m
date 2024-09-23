@implementation MapsAmbientLightMonitor

- (MapsAmbientLightMonitor)init
{
  char *v2;
  uint64_t v3;
  MapsRingBuffer *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsAmbientLightMonitor;
  v2 = -[MapsBaseLightMonitor init](&v7, "init");
  if (v2)
  {
    if (MGGetBoolAnswer(CFSTR("DeviceSupportsPeriodicALSUpdates")))
      v3 = 5;
    else
      v3 = 1;
    v4 = -[MapsRingBuffer initWithLength:]([MapsRingBuffer alloc], "initWithLength:", v3);
    v5 = *(void **)(v2 + 57);
    *(_QWORD *)(v2 + 57) = v4;

  }
  return (MapsAmbientLightMonitor *)v2;
}

- (void)_setMonitoring:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  __IOHIDEventSystemClient *v6;
  CFRunLoopRef Main;
  objc_super v8;

  v3 = a3;
  v5 = -[MapsBaseLightMonitor _isMonitoring](self, "_isMonitoring");
  v8.receiver = self;
  v8.super_class = (Class)MapsAmbientLightMonitor;
  -[MapsBaseLightMonitor _setMonitoring:](&v8, "_setMonitoring:", v3);
  if (v5 != v3)
  {
    v6 = -[MapsAmbientLightMonitor client](self, "client");
    Main = CFRunLoopGetMain();
    if (v3)
    {
      IOHIDEventSystemClientScheduleWithRunLoop(v6, Main, kCFRunLoopDefaultMode);
      IOHIDEventSystemClientRegisterEventCallback(-[MapsAmbientLightMonitor client](self, "client"), sub_1002654F8, self, 0);
    }
    else
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop(v6, Main, kCFRunLoopDefaultMode);
      IOHIDEventSystemClientUnregisterEventCallback(-[MapsAmbientLightMonitor client](self, "client"), sub_1002654F8, self, 0);
      -[MapsAmbientLightMonitor setAmbientLightLevel:](self, "setAmbientLightLevel:", 0);
      -[MapsAmbientLightMonitor setClient:](self, "setClient:", 0);
      -[MapsAmbientLightMonitor setLightUpdateTimer:](self, "setLightUpdateTimer:", 0);
      -[MapsAmbientLightMonitor setDarkUpdateTimer:](self, "setDarkUpdateTimer:", 0);
    }
  }
}

- (int64_t)ambientLightLevel
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MapsDebugAmbientLightLevelKey")));

  if ((objc_opt_respondsToSelector(v4, "integerValue") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "integerValue");
    v6 = sub_1004317AC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)v5 >= 3)
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v5));
      else
        v8 = *(&off_1011AE1B0 + (_QWORD)v5);
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using override ambient light level: %@", buf, 0xCu);

    }
  }
  else
  {
    v5 = *(id *)(&self->_isBeforeSolarTransit + 1);
  }

  return (int64_t)v5;
}

- (void)setAmbientLightLevel:(int64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;

  if (*(_QWORD *)(&self->_isBeforeSolarTransit + 1) != a3)
  {
    v5 = sub_1004317AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(&self->_isBeforeSolarTransit + 1);
      if (v7 >= 3)
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), *(_QWORD *)(&self->_isBeforeSolarTransit + 1)));
      else
        v8 = *(&off_1011AE1B0 + v7);
      v9 = v8;
      if ((unint64_t)a3 >= 3)
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a3));
      else
        v10 = *(&off_1011AE1B0 + a3);
      -[MapsAmbientLightMonitor _calculateAverageSample](self, "_calculateAverageSample");
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changing ambient light level from %@ to %@ (average: %f)", buf, 0x20u);

    }
    *(_QWORD *)(&self->_isBeforeSolarTransit + 1) = a3;
    -[MapsBaseLightMonitor _notifyDidChange](self, "_notifyDidChange");
  }
}

- (__IOHIDEventSystemClient)client
{
  __IOHIDEventSystemClient *result;
  int64_t v4;
  id v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[2];
  _QWORD v9[2];

  result = *(__IOHIDEventSystemClient **)((char *)&self->_ambientLightLevel + 1);
  if (!result)
  {
    v4 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
    *(int64_t *)((char *)&self->_ambientLightLevel + 1) = v4;
    if (v4)
    {
      v8[0] = CFSTR("PrimaryUsagePage");
      v8[1] = CFSTR("PrimaryUsage");
      v9[0] = &off_10126C868;
      v9[1] = &off_10126C880;
      IOHIDEventSystemClientSetMatching(v4, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
      return *(__IOHIDEventSystemClient **)((char *)&self->_ambientLightLevel + 1);
    }
    else
    {
      v5 = sub_1004317AC();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Couldn't allocate client to monitor", v7, 2u);
      }

      return 0;
    }
  }
  return result;
}

- (void)setClient:(__IOHIDEventSystemClient *)a3
{
  __IOHIDEventSystemClient *v4;

  v4 = *(__IOHIDEventSystemClient **)((char *)&self->_ambientLightLevel + 1);
  if (v4 != a3)
  {
    if (v4)
      CFRelease(v4);
    *(int64_t *)((char *)&self->_ambientLightLevel + 1) = (int64_t)a3;
  }
}

- (void)initializeWithLightLevel:(int64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;

  v5 = sub_1004317AC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 >= 3)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a3));
    else
      v7 = *(&off_1011AE1B0 + a3);
    v8 = v7;
    v9 = *(_QWORD *)(&self->_isBeforeSolarTransit + 1);
    if (v9 >= 3)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), *(_QWORD *)(&self->_isBeforeSolarTransit + 1)));
    else
      v10 = *(&off_1011AE1B0 + v9);
    *(_DWORD *)buf = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Pre-populating light level to %@ from %@", buf, 0x16u);

  }
  *(_QWORD *)(&self->_isBeforeSolarTransit + 1) = a3;
}

- (void)_addSample:(double)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsAmbientLightMonitor lightLevels](self, "lightLevels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_msgSend(v5, "push:", v4);

}

- (double)_calculateAverageSample
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  double v9;
  void *v10;
  double v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAmbientLightMonitor lightLevels](self, "lightLevels", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "doubleValue");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAmbientLightMonitor lightLevels](self, "lightLevels"));
  v11 = 1.0;
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAmbientLightMonitor lightLevels](self, "lightLevels"));
    v11 = (double)(unint64_t)objc_msgSend(v12, "count");

  }
  return v7 / v11;
}

- (int64_t)_computedLightLevel
{
  double v2;

  -[MapsAmbientLightMonitor _calculateAverageSample](self, "_calculateAverageSample");
  if (v2 >= 25.0)
    return 1;
  else
    return 2;
}

- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3
{
  IOHIDEventGetFloatValue(a3, 786432);
  -[MapsAmbientLightMonitor _addSample:](self, "_addSample:");
  -[MapsAmbientLightMonitor _scheduleLightLevelUpdate](self, "_scheduleLightLevelUpdate");
}

- (void)_scheduleLightLevelUpdate
{
  int64_t v3;
  int64_t v4;
  void *v5;
  unsigned int v6;
  _QWORD *v7;
  _QWORD *v8;
  double v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  _QWORD *v16;
  _QWORD *v17;
  double Double;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  double v31;

  v3 = -[MapsAmbientLightMonitor ambientLightLevel](self, "ambientLightLevel");
  v4 = -[MapsAmbientLightMonitor _computedLightLevel](self, "_computedLightLevel");
  if (v3 == v4)
  {
    -[MapsAmbientLightMonitor setLightUpdateTimer:](self, "setLightUpdateTimer:", 0);
    -[MapsAmbientLightMonitor setDarkUpdateTimer:](self, "setDarkUpdateTimer:", 0);
  }
  else if (v4 == 1)
  {
    -[MapsAmbientLightMonitor setDarkUpdateTimer:](self, "setDarkUpdateTimer:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAmbientLightMonitor lightUpdateTimer](self, "lightUpdateTimer"));

    if (!v14)
    {
      v15 = -[MapsAmbientLightMonitor isBeforeSolarTransit](self, "isBeforeSolarTransit");
      if (v15)
        v16 = &MapsConfig_AmbientLightForwardStickTime;
      else
        v16 = &MapsConfig_AmbientLightBackwardStickTime;
      v17 = &off_1014B3648;
      if (!v15)
        v17 = &off_1014B41F8;
      Double = GEOConfigGetDouble(*v16, *v17);
      v19 = sub_1004317AC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v31 = Double;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Scheduling regular light level update in %f", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v21 = &_dispatch_main_q;
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_10026611C;
      v26 = &unk_1011AE190;
      objc_copyWeak(&v27, (id *)buf);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v23, Double));
      -[MapsAmbientLightMonitor setLightUpdateTimer:](self, "setLightUpdateTimer:", v22, v23, v24, v25, v26);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (v4 == 2)
  {
    -[MapsAmbientLightMonitor setLightUpdateTimer:](self, "setLightUpdateTimer:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAmbientLightMonitor darkUpdateTimer](self, "darkUpdateTimer"));

    if (!v5)
    {
      v6 = -[MapsAmbientLightMonitor isBeforeSolarTransit](self, "isBeforeSolarTransit");
      if (v6)
        v7 = &MapsConfig_AmbientLightBackwardStickTime;
      else
        v7 = &MapsConfig_AmbientLightForwardStickTime;
      v8 = &off_1014B41F8;
      if (!v6)
        v8 = &off_1014B3648;
      v9 = GEOConfigGetDouble(*v7, *v8);
      v10 = sub_1004317AC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Scheduling low light level update in %f", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v12 = &_dispatch_main_q;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100266088;
      v28[3] = &unk_1011AE190;
      objc_copyWeak(&v29, (id *)buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v28, v9));
      -[MapsAmbientLightMonitor setDarkUpdateTimer:](self, "setDarkUpdateTimer:", v13);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)isBeforeSolarTransit
{
  return *(&self->super._monitoring + 1);
}

- (void)setIsBeforeSolarTransit:(BOOL)a3
{
  *(&self->super._monitoring + 1) = a3;
}

- (GCDTimer)darkUpdateTimer
{
  return *(GCDTimer **)((char *)&self->_client + 1);
}

- (void)setDarkUpdateTimer:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_client + 1), a3);
}

- (GCDTimer)lightUpdateTimer
{
  return *(GCDTimer **)((char *)&self->_darkUpdateTimer + 1);
}

- (void)setLightUpdateTimer:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_darkUpdateTimer + 1), a3);
}

- (MapsRingBuffer)lightLevels
{
  return *(MapsRingBuffer **)((char *)&self->_lightUpdateTimer + 1);
}

- (void)setLightLevels:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_lightUpdateTimer + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_lightUpdateTimer + 1), 0);
  objc_storeStrong((id *)((char *)&self->_darkUpdateTimer + 1), 0);
  objc_storeStrong((id *)((char *)&self->_client + 1), 0);
}

@end
