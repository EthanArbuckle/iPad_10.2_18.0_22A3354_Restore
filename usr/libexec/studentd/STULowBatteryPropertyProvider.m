@implementation STULowBatteryPropertyProvider

- (STULowBatteryPropertyProvider)init
{
  STULowBatteryPropertyProvider *v2;
  STULowBatteryPropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STULowBatteryPropertyProvider;
  v2 = -[STULowBatteryPropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &__kCFBooleanFalse);
    v3->mBatteryPercentageStateNotificationToken = -1;
  }
  return v3;
}

- (id)key
{
  return CRKDeviceLowBatteryKey;
}

- (BOOL)isLowBattery
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setLowBattery:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[STULowBatteryPropertyProvider isLowBattery](self, "isLowBattery") != a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    -[STUDevicePropertyProvider setValue:](self, "setValue:", v5);

  }
}

- (void)beginUpdating
{
  int *p_mBatteryPercentageStateNotificationToken;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  uint8_t buf[24];

  p_mBatteryPercentageStateNotificationToken = &self->mBatteryPercentageStateNotificationToken;
  if (self->mBatteryPercentageStateNotificationToken == -1)
  {
    objc_initWeak(&location, self);
    v4 = &_dispatch_main_q;
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100008024;
    v12 = &unk_1000C9928;
    objc_copyWeak(&v13, &location);
    v5 = notify_register_dispatch("com.apple.system.powersources.percent", p_mBatteryPercentageStateNotificationToken, (dispatch_queue_t)&_dispatch_main_q, &v9);

    if ((_DWORD)v5)
    {
      *p_mBatteryPercentageStateNotificationToken = -1;
      v6 = sub_100008050();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5, v9, v10, v11, v12));
        sub_10007A6A0(v8, buf, v7);
      }

    }
    else
    {
      -[STULowBatteryPropertyProvider batteryLevelDidChange](self, "batteryLevelDidChange", v9, v10, v11, v12);
    }
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)endUpdating
{
  int mBatteryPercentageStateNotificationToken;

  mBatteryPercentageStateNotificationToken = self->mBatteryPercentageStateNotificationToken;
  if (mBatteryPercentageStateNotificationToken != -1)
  {
    notify_cancel(mBatteryPercentageStateNotificationToken);
    self->mBatteryPercentageStateNotificationToken = -1;
  }
}

- (void)batteryLevelDidChange
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  const void *active;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  id v15;
  NSObject *v16;
  id v17;
  _BOOL8 v18;
  CFTypeRef blob;
  uint8_t buf[4];
  void *v21;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[STULowBatteryPropertyProvider performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
    return;
  }
  if (self->mBatteryPercentageStateNotificationToken == -1)
    return;
  blob = 0;
  v4 = IOPSCopyPowerSourcesInfoPrecise(&blob);
  if ((_DWORD)v4)
  {
    v5 = sub_100008050();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to copy power source info: %{public}@", buf, 0xCu);

    }
LABEL_18:

LABEL_19:
    v14 = -1.0;
    goto LABEL_20;
  }
  active = (const void *)IOPSGetActiveBattery(blob);
  v9 = IOPSGetPowerSourceDescription(blob, active);
  v10 = v9;
  if (!v9)
  {
    v17 = sub_100008050();
    v6 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to find battery values for this device", buf, 2u);
    }
    goto LABEL_18;
  }
  objc_msgSend((id)CFDictionaryGetValue(v9, CFSTR("Current Capacity")), "floatValue");
  v12 = v11;
  objc_msgSend((id)CFDictionaryGetValue(v10, CFSTR("Max Capacity")), "floatValue");
  if (v13 <= 0.0 || v12 < 0.0 || v13 < v12)
  {
    v15 = sub_100008050();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10007A708((uint64_t)v10, v16);

    goto LABEL_19;
  }
  v14 = v12 / v13;
LABEL_20:
  v18 = v14 >= 0.0 && v14 <= 0.1;
  if (-[STULowBatteryPropertyProvider isLowBattery](self, "isLowBattery") != v18)
    -[STULowBatteryPropertyProvider setLowBattery:](self, "setLowBattery:", v18);
  if (blob)
    CFRelease(blob);
}

@end
