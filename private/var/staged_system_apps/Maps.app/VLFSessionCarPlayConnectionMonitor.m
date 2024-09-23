@implementation VLFSessionCarPlayConnectionMonitor

- (VLFSessionCarPlayConnectionMonitor)initWithObserver:(id)a3
{
  VLFSessionCarPlayConnectionMonitor *v3;
  void *v4;
  NSString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VLFSessionCarPlayConnectionMonitor;
  v3 = -[VLFSessionMonitor initWithObserver:](&v8, "initWithObserver:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v5 = NSStringFromSelector("state");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, v6, 0, 0);

    -[VLFSessionCarPlayConnectionMonitor updateState](v3, "updateState");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  NSString *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = NSStringFromSelector("state");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v5, 0);

  v6.receiver = self;
  v6.super_class = (Class)VLFSessionCarPlayConnectionMonitor;
  -[VLFSessionCarPlayConnectionMonitor dealloc](&v6, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionCarPlayConnectionMonitorEnabled, off_1014B3788);
}

- (void)updateState
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = objc_msgSend(v3, "state");

  v5 = sub_100BE2B60();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 == (id)2)
  {
    if (v7)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Detected that carplay is connected; updating state",
        v9,
        2u);
    }
    v8 = 0;
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    v8 = 2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Detected that carplay is not connected; updating state",
      buf,
      2u);
  }
  else
  {
    v8 = 2;
  }

  -[VLFSessionMonitor setState:](self, "setState:", v8);
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionCarPlayConnectionMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionCarPlayConnectionMonitorAffectsBannerVisibilityKey"));

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
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = objc_msgSend(v10, "state");
  v12 = -[VLFSessionMonitor state](self, "state");
  v13 = CFSTR("Hide");
  if (v12 == 1)
    v13 = CFSTR("EnablePuck");
  if (v12 == 2)
    v13 = CFSTR("EnablePuckAndBanner");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %lu, currentState: %@>"), v3, v5, v7, v9, v11, v13));

  return v14;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = NSStringFromSelector("state");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if ((objc_msgSend(v10, "isEqualToString:", v14) & 1) == 0)
  {

    goto LABEL_7;
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));

  if (v15 != v11)
  {
LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)VLFSessionCarPlayConnectionMonitor;
    -[VLFSessionCarPlayConnectionMonitor observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_8;
  }
  v16 = sub_100BE2B60();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Detected carplay connectivity state changed; updating state",
      buf,
      2u);
  }

  -[VLFSessionCarPlayConnectionMonitor updateState](self, "updateState");
LABEL_8:

}

@end
