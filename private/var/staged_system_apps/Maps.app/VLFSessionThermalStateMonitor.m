@implementation VLFSessionThermalStateMonitor

- (VLFSessionThermalStateMonitor)initWithObserver:(id)a3
{
  VLFSessionThermalStateMonitor *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VLFSessionThermalStateMonitor;
  v3 = -[VLFSessionMonitor initWithObserver:](&v6, "initWithObserver:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "processInfoThermalStateDidChangeNotification:", NSProcessInfoThermalStateDidChangeNotification, 0);

    -[VLFSessionThermalStateMonitor updateState](v3, "updateState");
  }
  return v3;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionThermalStateMonitorEnabled, off_1014B37C8);
}

- (void)updateState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = objc_msgSend(v3, "thermalState");

  if ((unint64_t)v4 >= 3)
  {
    if (v4 != (id)3)
      return;
    v11 = sub_10074ED18();
    v6 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v13 = sub_1009AF070((uint64_t)objc_msgSend(v12, "thermalState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = 138412290;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Detected thermal state is too high (%@); updating state",
        (uint8_t *)&v15,
        0xCu);

    }
    v10 = 0;
  }
  else
  {
    v5 = sub_10074ED18();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v8 = sub_1009AF070((uint64_t)objc_msgSend(v7, "thermalState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v15 = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Detected thermal state is sufficiently low (%@); updating state",
        (uint8_t *)&v15,
        0xCu);

    }
    v10 = 2;
  }

  -[VLFSessionMonitor setState:](self, "setState:", v10);
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionThermalStateMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionThermalStateMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (id)debugDescription
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  id v11;
  int64_t v12;
  const __CFString *v13;
  void *v14;

  v3 = objc_opt_class(self);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = v4;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v11 = objc_msgSend(v10, "thermalState");
  v12 = -[VLFSessionMonitor state](self, "state");
  v13 = CFSTR("Hide");
  if (v12 == 1)
    v13 = CFSTR("EnablePuck");
  if (v12 == 2)
    v13 = CFSTR("EnablePuckAndBanner");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %ld, currentState: %@>"), v3, v5, v7, v9, v11, v13));

  return v14;
}

- (void)processInfoThermalStateDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10074EF70;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end
