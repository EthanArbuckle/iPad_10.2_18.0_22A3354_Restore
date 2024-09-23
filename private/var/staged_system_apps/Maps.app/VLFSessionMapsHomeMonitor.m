@implementation VLFSessionMapsHomeMonitor

- (VLFSessionMapsHomeMonitor)initWithObserver:(id)a3 platformController:(id)a4
{
  id v6;
  id v7;
  VLFSessionMapsHomeMonitor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v37 = "-[VLFSessionMapsHomeMonitor initWithObserver:platformController:]";
      v38 = 2080;
      v39 = "VLFSessionMapsHomeMonitor.m";
      v40 = 1024;
      v41 = 38;
      v42 = 2080;
      v43 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v37 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)VLFSessionMapsHomeMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v35, "initWithObserver:", v6);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, "searchWillBecomeCurrentNotification:", CFSTR("SearchWillBecomeCurrentNotification"), 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v8, "searchWillResignCurrentNotification:", CFSTR("SearchWillResignCurrentNotification"), 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, "searchTextFieldDidBeginEditingNotification:", CFSTR("SearchTextFieldDidBeginEditingNotification"), 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, "searchTextFieldDidEndEditingNotification:", CFSTR("SearchTextFieldDidEndEditingNotification"), 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, "settingsViewControllerWillAppearNotification:", CFSTR("SettingsViewControllerWillAppearNotification"), 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, "settingsViewControllerDidDisappearNotification:", CFSTR("SettingsViewControllerDidDisappearNotification"), 0);

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15, "_maps_mapsSceneDelegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topMostPresentedViewController"));

    v18 = objc_opt_class(SettingsViewController);
    LOBYTE(v15) = objc_opt_isKindOfClass(v17, v18);

    if ((v15 & 1) != 0 && v17)
      -[VLFSessionMapsHomeMonitor setSettingsIsPresent:](v8, "setSettingsIsPresent:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topContext"));

    if ((objc_opt_respondsToSelector(v20, "fullscreenViewController") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fullscreenViewController"));
      v22 = objc_opt_class(ContainerViewController);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
        v23 = v21;
      else
        v23 = 0;
      v24 = v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentViewController"));
      v26 = objc_opt_class(SearchViewController);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
        v27 = v25;
      else
        v27 = 0;
      v28 = v27;

      if (v28)
      {
        -[VLFSessionMapsHomeMonitor setSearchIsCurrent:](v8, "setSearchIsCurrent:", 1);
        -[VLFSessionMapsHomeMonitor setUserIsSearching:](v8, "setUserIsSearching:", objc_msgSend(v28, "_containsFirstResponder"));
      }

    }
    -[VLFSessionMapsHomeMonitor updateState](v8, "updateState");

  }
  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionMapsHomeMonitorEnabled, off_1014B3818);
}

- (void)updateState
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  unsigned int v7;
  id v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  __int16 v12;
  uint8_t buf[16];
  __int16 v14;
  __int16 v15;

  if (-[VLFSessionMapsHomeMonitor isSettingsPresent](self, "isSettingsPresent"))
  {
    v3 = sub_100B97CC8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v15 = 0;
      v5 = "Settings is present; setting state to .Default";
      v6 = (uint8_t *)&v15;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v5, v6, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!-[VLFSessionMapsHomeMonitor isSearchCurrent](self, "isSearchCurrent"))
  {
    v10 = sub_100B97CC8();
    v4 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v12 = 0;
      v5 = "Search is not current; setting state to .Default";
      v6 = (uint8_t *)&v12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v7 = -[VLFSessionMapsHomeMonitor isUserSearching](self, "isUserSearching");
  v8 = sub_100B97CC8();
  v4 = objc_claimAutoreleasedReturnValue(v8);
  v9 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      v14 = 0;
      v5 = "Search is current and settings is not present, but user is searching; setting state to .Default";
      v6 = (uint8_t *)&v14;
      goto LABEL_10;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    v11 = 2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Search is current, settings is not present, and user is not searching; setting state to .HighThreshold",
      buf,
      2u);
  }
  else
  {
    v11 = 2;
  }
LABEL_12:

  -[VLFSessionMonitor setState:](self, "setState:", v11);
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionMapsHomeMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionMapsHomeMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  v12 = -[VLFSessionMonitor state](self, "state");
  v13 = CFSTR("Hide");
  if (v12 == 1)
    v13 = CFSTR("EnablePuck");
  if (v12 == 2)
    v14 = CFSTR("EnablePuckAndBanner");
  else
    v14 = v13;
  if (-[VLFSessionMapsHomeMonitor isSettingsPresent](self, "isSettingsPresent"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = v15;
  if (-[VLFSessionMapsHomeMonitor isSearchCurrent](self, "isSearchCurrent"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = v17;
  if (-[VLFSessionMapsHomeMonitor isUserSearching](self, "isUserSearching"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, isSettingsPresent: %@, isSearchCurrent: %@, isUserSearching: %@>"), v5, v7, v9, v11, v14, v16, v18, v19));

  return v20;
}

- (void)searchWillBecomeCurrentNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  -[VLFSessionMapsHomeMonitor setSearchIsCurrent:](self, "setSearchIsCurrent:", 1);
  v4 = sub_100B97CC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Search will become current; updating state",
      v6,
      2u);
  }

  -[VLFSessionMapsHomeMonitor updateState](self, "updateState");
}

- (void)searchWillResignCurrentNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  -[VLFSessionMapsHomeMonitor setSearchIsCurrent:](self, "setSearchIsCurrent:", 0);
  v4 = sub_100B97CC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Search will resign current; updating state",
      v6,
      2u);
  }

  -[VLFSessionMapsHomeMonitor updateState](self, "updateState");
}

- (void)searchTextFieldDidBeginEditingNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100B97CC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User started searching; updating state", v6, 2u);
  }

  -[VLFSessionMapsHomeMonitor setUserIsSearching:](self, "setUserIsSearching:", 1);
  -[VLFSessionMapsHomeMonitor updateState](self, "updateState");
}

- (void)searchTextFieldDidEndEditingNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100B97CC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User stopped searching; updating state", v6, 2u);
  }

  -[VLFSessionMapsHomeMonitor setUserIsSearching:](self, "setUserIsSearching:", 0);
  -[VLFSessionMapsHomeMonitor updateState](self, "updateState");
}

- (void)settingsViewControllerWillAppearNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  -[VLFSessionMapsHomeMonitor setSettingsIsPresent:](self, "setSettingsIsPresent:", 1);
  v4 = sub_100B97CC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Settings VC will appear; updating state", v6, 2u);
  }

  -[VLFSessionMapsHomeMonitor updateState](self, "updateState");
}

- (void)settingsViewControllerDidDisappearNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  -[VLFSessionMapsHomeMonitor setSettingsIsPresent:](self, "setSettingsIsPresent:", 0);
  v4 = sub_100B97CC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Settings VC will disappear; updating state",
      v6,
      2u);
  }

  -[VLFSessionMapsHomeMonitor updateState](self, "updateState");
}

- (BOOL)isSearchCurrent
{
  return self->_searchIsCurrent;
}

- (void)setSearchIsCurrent:(BOOL)a3
{
  self->_searchIsCurrent = a3;
}

- (BOOL)isUserSearching
{
  return self->_userIsSearching;
}

- (void)setUserIsSearching:(BOOL)a3
{
  self->_userIsSearching = a3;
}

- (BOOL)isSettingsPresent
{
  return self->_settingsIsPresent;
}

- (void)setSettingsIsPresent:(BOOL)a3
{
  self->_settingsIsPresent = a3;
}

@end
