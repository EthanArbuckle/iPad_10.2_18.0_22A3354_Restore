@implementation NavigationIdleTimerProvider

- (NavigationIdleTimerProvider)initWithIdleStateHandler:(id)a3 undimHandler:(id)a4
{
  id v6;
  id v7;
  NavigationIdleTimerProvider *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id idleStateChangeHandler;
  id v15;
  id undimHandler;
  MapsPocketStateProvider *v17;
  MapsPocketStateProvider *pocketStateManager;
  void *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NavigationIdleTimerProvider *v26;
  __int16 v27;
  const char *v28;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NavigationIdleTimerProvider;
  v8 = -[NavigationIdleTimerProvider init](&v22, "init");
  if (v8)
  {
    v9 = sub_1004338EC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_opt_class(v8);
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2048;
      v26 = v8;
      v27 = 2080;
      v28 = "-[NavigationIdleTimerProvider initWithIdleStateHandler:undimHandler:]";
      v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "<%@:%p> %s", buf, 0x20u);

    }
    v13 = objc_retainBlock(v6);
    idleStateChangeHandler = v8->_idleStateChangeHandler;
    v8->_idleStateChangeHandler = v13;

    v15 = objc_retainBlock(v7);
    undimHandler = v8->_undimHandler;
    v8->_undimHandler = v15;

    v8->_pocketStateType = 4;
    v17 = -[MapsPocketStateProvider initWithDelegate:]([MapsPocketStateProvider alloc], "initWithDelegate:", v8);
    pocketStateManager = v8->_pocketStateManager;
    v8->_pocketStateManager = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
    objc_msgSend(v19, "startMonitoringWithObserver:", v8);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v20, "registerObserver:", v8);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  NavigationIdleTimerProvider *v12;
  __int16 v13;
  const char *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  objc_msgSend(v3, "stopMonitoringWithObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v4, "unregisterObserver:", self);

  -[NavigationIdleTimerProvider setShouldDisableIdleTimer:](self, "setShouldDisableIdleTimer:", 0);
  v5 = sub_1004338EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v10 = (id)objc_opt_class(self);
    v11 = 2048;
    v12 = self;
    v13 = 2080;
    v14 = "-[NavigationIdleTimerProvider dealloc]";
    v7 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "<%@:%p> %s", buf, 0x20u);

  }
  v8.receiver = self;
  v8.super_class = (Class)NavigationIdleTimerProvider;
  -[NavigationIdleTimerProvider dealloc](&v8, "dealloc");
}

- (void)screenLayoutDidChangeWithReason:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  uint8_t v10[16];
  uint8_t buf[16];

  self->_hasReceivedScreenLayout = 1;
  if (a3 == 3)
  {
    v6 = sub_1004338EC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Lock button pressed", v10, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
    v9 = objc_msgSend(v8, "isScreenOn");

    if ((v9 & 1) == 0)
      objc_storeStrong((id *)&self->_screenLockedGuidanceUpdate, self->_lastGuidanceUpdate);
    goto LABEL_10;
  }
  if (a3)
  {
LABEL_10:
    -[NavigationIdleTimerProvider _updateIdleTimerState](self, "_updateIdleTimerState");
    return;
  }
  v4 = sub_1004338EC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ignoring layout change", buf, 2u);
  }

}

- (void)didUpdatePocketStateType:(int64_t)a3
{
  -[NavigationIdleTimerProvider setPocketStateType:](self, "setPocketStateType:", a3);
}

- (void)setShouldDisableIdleTimer:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _BOOL4 shouldDisableIdleTimer;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;

  if (self->_shouldDisableIdleTimer != a3)
  {
    v3 = a3;
    v5 = sub_1004338EC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      shouldDisableIdleTimer = self->_shouldDisableIdleTimer;
      v10[0] = 67109376;
      v10[1] = shouldDisableIdleTimer;
      v11 = 1024;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changing idle timer disabled from %d to %d", (uint8_t *)v10, 0xEu);
    }

    self->_shouldDisableIdleTimer = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIdleTimerProvider idleStateChangeHandler](self, "idleStateChangeHandler"));

    if (v8)
    {
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NavigationIdleTimerProvider idleStateChangeHandler](self, "idleStateChangeHandler"));
      v9[2](v9, v3);

    }
  }
}

- (void)setPocketStateType:(int64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t pocketStateType;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;

  if (self->_pocketStateType != a3)
  {
    v5 = sub_1004338EC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      pocketStateType = self->_pocketStateType;
      if (pocketStateType > 4)
        v8 = CFSTR("Unknown");
      else
        v8 = *(&off_1011E3260 + pocketStateType);
      if ((unint64_t)a3 > 4)
        v9 = CFSTR("Unknown");
      else
        v9 = *(&off_1011E3260 + a3);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changing pocket state type from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
    }

    self->_pocketStateType = a3;
    if (-[NavigationIdleTimerProvider _isInPocket](self, "_isInPocket"))
      -[NavigationIdleTimerProvider _updateIdleTimerState](self, "_updateIdleTimerState");
  }
}

- (void)updateGuidanceState:(id)a3
{
  IPCGuidanceStateReply *v4;
  unint64_t v5;
  void *v6;
  id v7;
  IPCGuidanceStateReply *screenLockedGuidanceUpdate;
  const char *v9;
  NSObject *p_super;
  uint32_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  IPCGuidanceStateReply *lastGuidanceUpdate;
  id v23;
  id v24;
  id v25;
  const __CFString *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;

  v4 = (IPCGuidanceStateReply *)a3;
  v5 = -[NavigationIdleTimerProvider _guidanceUpdate:isDifferentFromGuidanceUpdate:](self, "_guidanceUpdate:isDifferentFromGuidanceUpdate:", v4, self->_lastGuidanceUpdate);
  if (!GEOConfigGetBOOL(MapsConfig_NavigationPromptsUndimScreen, off_1014B3A08)
    || !-[IPCGuidanceStateReply affectsDimming](v4, "affectsDimming"))
  {
    goto LABEL_22;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply alightMessage](v4, "alightMessage"));

  if (v6)
  {
    v7 = sub_1004338EC();
    screenLockedGuidanceUpdate = (IPCGuidanceStateReply *)objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(&screenLockedGuidanceUpdate->super.super, OS_LOG_TYPE_INFO))
    {
LABEL_8:

      v12 = sub_1004338EC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateReply shortDescription](v4, "shortDescription"));
        v15 = (void *)v14;
        if (v5 > 9)
          v16 = CFSTR("Unknown");
        else
          v16 = *(&off_1011E3210 + v5);
        v27 = 138412546;
        v28 = v14;
        v29 = 2112;
        v30 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "guidance update: %@, did change due to %@", (uint8_t *)&v27, 0x16u);

      }
      if (!-[NavigationIdleTimerProvider _isInPocket](self, "_isInPocket"))
        -[NavigationIdleTimerProvider _notifyShouldUndim](self, "_notifyShouldUndim");
      goto LABEL_22;
    }
    LOWORD(v27) = 0;
    v9 = "Undim due to alight message";
    goto LABEL_6;
  }
  if (!self->_lastGuidanceUpdate)
  {
    v23 = sub_1004338EC();
    screenLockedGuidanceUpdate = (IPCGuidanceStateReply *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(&screenLockedGuidanceUpdate->super.super, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    LOWORD(v27) = 0;
    v9 = "Undim due to first guidance update";
    goto LABEL_6;
  }
  if (!self->_screenLockedGuidanceUpdate)
  {
    if (!-[NavigationIdleTimerProvider _shouldGuidanceUpdateDisplayPersistently:](self, "_shouldGuidanceUpdateDisplayPersistently:", v4))
    {
      if (!v5)
        goto LABEL_24;
      v25 = sub_1004338EC();
      screenLockedGuidanceUpdate = (IPCGuidanceStateReply *)objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(&screenLockedGuidanceUpdate->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_8;
      if (v5 > 9)
        v26 = CFSTR("Unknown");
      else
        v26 = *(&off_1011E31C8 + v5 - 1);
      v27 = 138412290;
      v28 = (uint64_t)v26;
      v9 = "Undim from guidance update due to %@";
      p_super = &screenLockedGuidanceUpdate->super.super;
      v11 = 12;
      goto LABEL_7;
    }
    v24 = sub_1004338EC();
    screenLockedGuidanceUpdate = (IPCGuidanceStateReply *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(&screenLockedGuidanceUpdate->super.super, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    LOWORD(v27) = 0;
    v9 = "Undim from guidance update due to being persistently displayed";
LABEL_6:
    p_super = &screenLockedGuidanceUpdate->super.super;
    v11 = 2;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v27, v11);
    goto LABEL_8;
  }
  v17 = -[NavigationIdleTimerProvider _guidanceUpdate:isDifferentFromGuidanceUpdate:](self, "_guidanceUpdate:isDifferentFromGuidanceUpdate:", v4);
  if (v5)
  {
    v18 = v17;
    if (v17)
    {
      v19 = sub_1004338EC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        if (v18 > 9)
          v21 = CFSTR("Unknown");
        else
          v21 = *(&off_1011E31C8 + v18 - 1);
        v27 = 138412290;
        v28 = (uint64_t)v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Undim after locked due to %@", (uint8_t *)&v27, 0xCu);
      }

      screenLockedGuidanceUpdate = self->_screenLockedGuidanceUpdate;
      self->_screenLockedGuidanceUpdate = 0;
      goto LABEL_8;
    }
  }
LABEL_22:
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    -[NavigationIdleTimerProvider _updateIdleTimerState](self, "_updateIdleTimerState");
LABEL_24:
  lastGuidanceUpdate = self->_lastGuidanceUpdate;
  self->_lastGuidanceUpdate = v4;

}

- (BOOL)_isInPocket
{
  return (id)-[NavigationIdleTimerProvider pocketStateType](self, "pocketStateType") == (id)3
      || (id)-[NavigationIdleTimerProvider pocketStateType](self, "pocketStateType") == (id)2
      || (id)-[NavigationIdleTimerProvider pocketStateType](self, "pocketStateType") == (id)1;
}

- (void)_notifyShouldUndim
{
  _BOOL4 hasReceivedScreenLayout;
  unsigned int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  const __CFString *v16;

  hasReceivedScreenLayout = self->_hasReceivedScreenLayout;
  v4 = -[NavigationIdleTimerProvider _isInPocket](self, "_isInPocket");
  v5 = sub_1004338EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (uint64_t)v6;
  if (!hasReceivedScreenLayout || (v4 & 1) != 0)
  {
    if (v4)
    {
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v9 = -[NavigationIdleTimerProvider pocketStateType](self, "pocketStateType");
      if (v9 > 4)
        v10 = CFSTR("Unknown");
      else
        v10 = *(&off_1011E3260 + v9);
      v15 = 138543362;
      v16 = v10;
      v11 = "Not undimming the screen due to CMPocketStateManager state: %{public}@";
      v12 = v7;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      LOWORD(v15) = 0;
      v11 = "Can't safely undim as we haven't determined the current screen state";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v15, v14);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_INFO, "Notifying undim handler to undim the screen", (uint8_t *)&v15, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationIdleTimerProvider undimHandler](self, "undimHandler"));
  if (v8)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[NavigationIdleTimerProvider undimHandler](self, "undimHandler"));
    (*(void (**)(void))(v7 + 16))();
LABEL_16:

  }
}

- (void)_updateIdleTimerState
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  _BOOL4 navdRequestingIdleTimerEnabled;
  unint64_t v15;
  const __CFString *v16;
  NavigationIdleTimerProvider *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  _DWORD v21[2];
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  const __CFString *v29;

  v3 = -[NavigationIdleTimerProvider _isInPocket](self, "_isInPocket");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  if (!objc_msgSend(v4, "isOurAppActive"))
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  if (!objc_msgSend(v5, "isScreenOn")
    || +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay))
  {

LABEL_5:
LABEL_6:
    v6 = sub_1004338EC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
      v9 = objc_msgSend(v8, "isOurAppActive");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
      v11 = objc_msgSend(v10, "isScreenOn");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v13 = objc_msgSend(v12, "isCurrentlyConnectedToAnyCarScene");
      navdRequestingIdleTimerEnabled = self->_navdRequestingIdleTimerEnabled;
      v15 = -[NavigationIdleTimerProvider pocketStateType](self, "pocketStateType");
      if (v15 > 4)
        v16 = CFSTR("Unknown");
      else
        v16 = *(&off_1011E3260 + v15);
      v21[0] = 67110146;
      v21[1] = v9;
      v22 = 1024;
      v23 = v11;
      v24 = 1024;
      v25 = v13;
      v26 = 1024;
      v27 = navdRequestingIdleTimerEnabled;
      v28 = 2114;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "enabling idle timer due to: isForeground: %d isScreenOn: %d connectedToCarPlay: %d navdIdleTimer: %d pocketState: %{public}@", (uint8_t *)v21, 0x24u);

    }
    v17 = self;
    v18 = 0;
    goto LABEL_12;
  }
  if (self->_navdRequestingIdleTimerEnabled)
    v3 = 1;

  if ((v3 & 1) != 0)
    goto LABEL_6;
  v19 = sub_1004338EC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "disabling idle timer", (uint8_t *)v21, 2u);
  }

  v17 = self;
  v18 = 1;
LABEL_12:
  -[NavigationIdleTimerProvider setShouldDisableIdleTimer:](v17, "setShouldDisableIdleTimer:", v18);
}

- (BOOL)_shouldGuidanceUpdateDisplayPersistently:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isSticky") & 1) != 0
    || objc_msgSend(v3, "guidanceState") == (id)3
    || objc_msgSend(v3, "guidanceState") == (id)2;

  return v4;
}

- (unint64_t)_guidanceUpdate:(id)a3 isDifferentFromGuidanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "guidanceState");
  if (objc_msgSend(v7, "guidanceState") != v8)
  {
    if (!objc_msgSend(v7, "guidanceState"))
    {
      v17 = 1;
      goto LABEL_27;
    }
    if (v8 == (id)1)
    {
      v17 = 2;
      goto LABEL_27;
    }
    if (objc_msgSend(v7, "guidanceState") == (id)1)
    {
      v17 = 3;
      goto LABEL_27;
    }
  }
  if (!v8)
    goto LABEL_6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maneuverID"));
  v11 = v9;
  v12 = v10;
  if (v11 | v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend((id)v11, "isEqual:", v12);

    if (!v14)
    {
      v17 = 5;
      goto LABEL_27;
    }
  }
  v15 = -[IPCGuidanceStateReply maneuver](self->_lastGuidanceUpdate, "maneuver");
  if (v15 != objc_msgSend(v6, "maneuver"))
  {
    v17 = 4;
  }
  else
  {
LABEL_6:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alightMessage"));

    if (v16)
    {
      v17 = 6;
    }
    else if ((objc_msgSend(v6, "isAlerting") & 1) != 0)
    {
      v17 = 7;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laneGuidanceInfo"));
      if (v18)
      {

      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "laneGuidanceInfo"));

        if (v20)
        {
          v17 = 8;
          goto LABEL_27;
        }
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trafficIncidentAlert"));
      if (v19)
      {

        v17 = 0;
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trafficIncidentAlert"));

        if (v21)
          v17 = 9;
        else
          v17 = 0;
      }
    }
  }
LABEL_27:

  return v17;
}

- (void)navigationService:(id)a3 shouldEnableIdleTimer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;

  v4 = a4;
  v6 = sub_1004338EC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[NavigationIdleTimerProvider navigationService:shouldEnableIdleTimer:]";
    v10 = 1024;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: %d", (uint8_t *)&v8, 0x12u);
  }

  self->_navdRequestingIdleTimerEnabled = v4;
  -[NavigationIdleTimerProvider _updateIdleTimerState](self, "_updateIdleTimerState");
}

- (id)idleStateChangeHandler
{
  return self->_idleStateChangeHandler;
}

- (id)undimHandler
{
  return self->_undimHandler;
}

- (BOOL)shouldDisableIdleTimer
{
  return self->_shouldDisableIdleTimer;
}

- (int64_t)pocketStateType
{
  return self->_pocketStateType;
}

- (BOOL)navdRequestingIdleTimerEnabled
{
  return self->_navdRequestingIdleTimerEnabled;
}

- (void)setNavdRequestingIdleTimerEnabled:(BOOL)a3
{
  self->_navdRequestingIdleTimerEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_undimHandler, 0);
  objc_storeStrong(&self->_idleStateChangeHandler, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_lastGuidanceUpdate, 0);
  objc_storeStrong((id *)&self->_screenLockedGuidanceUpdate, 0);
}

@end
