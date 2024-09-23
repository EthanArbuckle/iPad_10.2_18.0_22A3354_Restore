@implementation VLFVIOSessionAppBackgroundMonitor

- (VLFVIOSessionAppBackgroundMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VLFVIOSessionAppBackgroundMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  id v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  const char *v21;
  id v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  VLFVIOSessionAppBackgroundMonitor *v29;
  __int16 v30;
  void *v31;

  v27.receiver = self;
  v27.super_class = (Class)VLFVIOSessionAppBackgroundMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v27, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_1003CFF58();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v29 = v4;
      v30 = 2112;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor configuration](v4, "configuration"));
    v11 = objc_msgSend(v10, "isVLF");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](v4, "platformController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSession"));
      v14 = objc_opt_class(NavigationSession);
      isKindOfClass = objc_opt_isKindOfClass(v13, v14);

      if ((isKindOfClass & 1) == 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](v4, "platformController"));
        objc_msgSend(v25, "addObserver:", v4);

        v17 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        -[NSObject addObserver:selector:name:object:](v17, "addObserver:selector:name:object:", v4, "applicationWillResignActiveNotification:", UIApplicationWillResignActiveNotification, 0);
        goto LABEL_12;
      }
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v16 = sub_1003CFF58();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class(v4);
        v19 = NSStringFromClass(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 134349314;
        v29 = v4;
        v30 = 2112;
        v31 = v20;
        v21 = "[%{public}p] %@ will not run because we are currently navigating";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

      }
    }
    else
    {
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v22 = sub_1003CFF58();
      v17 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v23 = (objc_class *)objc_opt_class(v4);
        v24 = NSStringFromClass(v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 134349314;
        v29 = v4;
        v30 = 2112;
        v31 = v20;
        v21 = "[%{public}p] %@ will not run because the session is not configured for VLF";
        goto LABEL_10;
      }
    }
LABEL_12:

  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  VLFVIOSessionAppBackgroundMonitor *v10;
  __int16 v11;
  void *v12;

  v3 = sub_1003CFF58();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)VLFVIOSessionAppBackgroundMonitor;
  -[VLFVIOSessionAppBackgroundMonitor dealloc](&v8, "dealloc");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[VIOSessionMonitor isEnabled](self, "isEnabled");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p enabled: %@>"), v5, self, v7));

  return (NSString *)v8;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_VLFVIOTeardownAppBackgroundEnabled, off_1014B3C68);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  VLFVIOSessionAppBackgroundMonitor *v14;

  v6 = a5;
  v7 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = sub_1003CFF58();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 134349056;
      v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Navigation started; stop monitoring app background notification",
        (uint8_t *)&v13,
        0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](self, "platformController"));
    objc_msgSend(v11, "removeObserver:", self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "removeObserver:name:object:", self, UIApplicationWillResignActiveNotification, 0);

    -[VIOSessionMonitor setEnabled:](self, "setEnabled:", 0);
  }
}

- (void)applicationWillResignActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  VLFVIOSessionAppBackgroundMonitor *v9;

  v4 = sub_1003CFF58();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] App backgrounded; disabling VIO",
      (uint8_t *)&v8,
      0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
  objc_msgSend(v6, "recordSessionDisableEvent:", 10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, UIApplicationWillResignActiveNotification, 0);

}

@end
