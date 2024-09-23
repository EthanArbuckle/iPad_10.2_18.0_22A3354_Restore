@implementation VLFSessionChromeStackMonitor

- (VLFSessionChromeStackMonitor)initWithObserver:(id)a3 platformController:(id)a4
{
  id v6;
  id v7;
  VLFSessionChromeStackMonitor *v8;
  VLFSessionChromeStackMonitor *v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  char *v13;
  id v14;
  void *v15;
  id v16;
  NSString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  char *v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[VLFSessionChromeStackMonitor initWithObserver:platformController:]";
      v36 = 2080;
      v37 = "VLFSessionChromeStackMonitor.m";
      v38 = 1024;
      v39 = 38;
      v40 = 2080;
      v41 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v28 = sub_1004318FC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[VLFSessionChromeStackMonitor initWithObserver:platformController:]";
      v36 = 2080;
      v37 = "VLFSessionChromeStackMonitor.m";
      v38 = 1024;
      v39 = 39;
      v40 = 2080;
      v41 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v30 = sub_1004318FC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)VLFSessionChromeStackMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v33, "initWithObserver:", v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_platformController, v7);
    v10 = sub_1006155C8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v9->_platformController);
      v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
      *(_DWORD *)buf = 138412290;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Registering for chrome VC stack changes: %@", buf, 0xCu);

    }
    v14 = objc_loadWeakRetained((id *)&v9->_platformController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chromeViewController"));
    objc_msgSend(v15, "addContextStackObserver:", v9);

    v16 = objc_loadWeakRetained((id *)&v9->_platformController);
    v17 = NSStringFromSelector("chromeViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "addObserver:forKeyPath:options:context:", v9, v18, 3, 0);

    v19 = objc_loadWeakRetained((id *)&v9->_platformController);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chromeViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topContext"));
    -[VLFSessionChromeStackMonitor _updateStateForTopMode:](v9, "_updateStateForTopMode:", v21);

  }
  return v9;
}

- (void)dealloc
{
  PlatformController **p_platformController;
  id WeakRetained;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  p_platformController = &self->_platformController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  v5 = NSStringFromSelector("chromeViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, v6);

  v7 = objc_loadWeakRetained((id *)p_platformController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  objc_msgSend(v8, "removeContextStackObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)VLFSessionChromeStackMonitor;
  -[VLFSessionChromeStackMonitor dealloc](&v9, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionChromeStackMonitorEnabled, off_1014B3D58);
}

- (void)_updateStateForTopMode:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionChromeStackMonitor allowedModeClasses](self, "allowedModeClasses"));
    v6 = objc_msgSend(v5, "containsObject:", objc_opt_class(v4));

    v7 = sub_1006155C8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if ((v6 & 1) != 0)
    {
      if (v9)
      {
        v10 = (objc_class *)objc_opt_class(v4);
        v11 = NSStringFromClass(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionChromeStackMonitor allowedModeClasses](self, "allowedModeClasses"));
        v19 = 138412546;
        v20 = v12;
        v21 = 2112;
        v22 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Top mode (%@) is in the allowed set (%@); updating state",
          (uint8_t *)&v19,
          0x16u);

      }
      v14 = 2;
    }
    else
    {
      if (v9)
      {
        v15 = (objc_class *)objc_opt_class(v4);
        v16 = NSStringFromClass(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionChromeStackMonitor allowedModeClasses](self, "allowedModeClasses"));
        v19 = 138412546;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Top mode (%@) is NOT in the allowed set (%@); updating state",
          (uint8_t *)&v19,
          0x16u);

      }
      v14 = 0;
    }

    -[VLFSessionMonitor setState:](self, "setState:", v14);
  }

}

- (NSSet)allowedModeClasses
{
  NSSet *allowedModeClasses;
  uint64_t v4;
  uint64_t v5;
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;

  allowedModeClasses = self->_allowedModeClasses;
  if (!allowedModeClasses)
  {
    v4 = objc_opt_class(BaseModeController);
    v5 = objc_opt_class(NavModeController);
    v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(StepModeController), 0);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_allowedModeClasses;
    self->_allowedModeClasses = v7;

    allowedModeClasses = self->_allowedModeClasses;
  }
  return allowedModeClasses;
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionChromeStackMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionChromeStackMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (NSString)debugDescription
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  int64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v23;
  __CFString *v24;
  uint64_t v25;

  v25 = objc_opt_class(self);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v24 = v3;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = v4;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  v8 = -[VLFSessionMonitor state](self, "state");
  v9 = CFSTR("Hide");
  if (v8 == 1)
    v9 = CFSTR("EnablePuck");
  if (v8 == 2)
    v10 = CFSTR("EnablePuckAndBanner");
  else
    v10 = v9;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionChromeStackMonitor platformController](self, "platformController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "chromeViewController"));
  v12 = (objc_class *)objc_opt_class(v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionChromeStackMonitor platformController](self, "platformController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chromeViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topContext"));
  v18 = (objc_class *)objc_opt_class(v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, currentChromeVC: %@, currentMode: %@"), v25, v24, v5, v7, v10, v14, v20));

  return (NSString *)v21;
}

- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v7 = a4;
  v8 = a5;
  v9 = sub_1006155C8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Top mode changed from %@ to %@", (uint8_t *)&v14, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  -[VLFSessionChromeStackMonitor _updateStateForTopMode:](self, "_updateStateForTopMode:", v13);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  NSString *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  if (WeakRetained != v11)
  {

LABEL_15:
    v30.receiver = self;
    v30.super_class = (Class)VLFSessionChromeStackMonitor;
    -[VLFSessionChromeStackMonitor observeValueForKeyPath:ofObject:change:context:](&v30, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_16;
  }
  v14 = NSStringFromSelector("chromeViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v10, "isEqualToString:", v15);

  if (!v16)
    goto LABEL_15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
  v18 = objc_opt_class(ChromeViewController);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    v19 = v17;
  else
    v19 = 0;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
  v22 = objc_opt_class(ChromeViewController);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
    v23 = v21;
  else
    v23 = 0;
  v24 = v23;

  v25 = sub_1006155C8();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v20;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "De-registering from old chrome VC stack changes: %@", buf, 0xCu);
  }

  objc_msgSend(v20, "removeContextStackObserver:", self);
  v27 = sub_1006155C8();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v24;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Registering for new chrome VC stack changes: %@", buf, 0xCu);
  }

  objc_msgSend(v24, "addContextStackObserver:", self);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topContext"));
  -[VLFSessionChromeStackMonitor _updateStateForTopMode:](self, "_updateStateForTopMode:", v29);

LABEL_16:
}

- (void)setAllowedModeClasses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedModeClasses, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_allowedModeClasses, 0);
}

@end
