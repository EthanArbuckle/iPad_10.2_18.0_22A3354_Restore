@implementation RTNavigationManager

- (RTNavigationManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_mapServiceManager_);
}

- (RTNavigationManager)initWithAuthorizationManager:(id)a3 mapServiceManager:(id)a4
{
  id v7;
  id v8;
  RTNavigationManager *v9;
  id v10;
  void *v11;
  uint64_t v12;
  GEONavigationListener *navigationListener;
  RTNavigationManager *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTNavigationManager;
    v9 = -[RTNotifier init](&v17, sel_init);
    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0D27278]);
      -[RTNotifier queue](v9, "queue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithQueue:", v11);
      navigationListener = v9->_navigationListener;
      v9->_navigationListener = (GEONavigationListener *)v12;

      objc_storeStrong((id *)&v9->_authorizationManager, a3);
      objc_storeStrong((id *)&v9->_mapServiceManager, a4);
      v9->_monitorRouteSummary = 0;
      v9->_monitorNavigationState = 0;
      v9->_routineEnabled = 1;
      -[RTNavigationManager setup](v9, "setup");
    }
    self = v9;
    v14 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTNavigationManager initWithAuthorizationManager:mapServiceManager:]";
      v20 = 1024;
      v21 = 137;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", buf, 0x12u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__RTNavigationManager_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __28__RTNavigationManager_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  RTAuthorizationManager *authorizationManager;
  id v4;

  authorizationManager = self->_authorizationManager;
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTNotifier addObserver:selector:name:](authorizationManager, "addObserver:selector:name:", self, sel_onAuthorizationNotification_, v4);

}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEONavigationListener setDelegate:](self->_navigationListener, "setDelegate:", 0);
  -[RTNotifier removeObserver:](self->_authorizationManager, "removeObserver:", self);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[GEONavigationListener setDelegate:](self->_navigationListener, "setDelegate:", 0);
  -[RTNotifier removeObserver:](self->_authorizationManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RTNavigationManager;
  -[RTNavigationManager dealloc](&v3, sel_dealloc);
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    -[RTNavigationManager _shouldSetMonitorRouteSummary](self, "_shouldSetMonitorRouteSummary");
  }
  else
  {
    +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if (v12)
    {
      -[RTNavigationManager _shouldSetMonitorNavigationState](self, "_shouldSetMonitorNavigationState");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityNavigation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v14;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v17, 0x20u);

      }
    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    -[RTNavigationManager _shouldSetMonitorRouteSummary](self, "_shouldSetMonitorRouteSummary");
  }
  else
  {
    +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if (v12)
    {
      -[RTNavigationManager _shouldSetMonitorNavigationState](self, "_shouldSetMonitorNavigationState");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityNavigation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v14;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v17, 0x20u);

      }
    }
  }

}

+ (id)RTGEOTransportTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("Automobile");
  else
    return off_1E92A4040[a3 - 1];
}

- (void)_shouldSetMonitorRouteSummary
{
  void *v3;
  _BOOL8 v4;

  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3) != 0;

  -[RTNavigationManager setMonitorRouteSummary:](self, "setMonitorRouteSummary:", v4);
}

- (void)_shouldSetMonitorNavigationState
{
  void *v3;
  _BOOL8 v4;

  +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3) != 0;

  -[RTNavigationManager setMonitorNavigationState:](self, "setMonitorNavigationState:", v4);
}

- (void)_shouldSetNavigationListenerDelegate
{
  void *v3;
  void *v4;
  void *v5;
  RTNavigationManager *v6;
  id v7;

  if (!self->_routineEnabled || !self->_monitorRouteSummary && !self->_monitorNavigationState)
  {
    -[RTNavigationManager navigationListener](self, "navigationListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = 0;
LABEL_8:
    objc_msgSend(v5, "setDelegate:", v6);

    return;
  }
  -[RTNavigationManager navigationListener](self, "navigationListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[RTNavigationManager navigationListener](self, "navigationListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = self;
    goto LABEL_8;
  }
}

- (void)setMonitorRouteSummary:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_monitorRouteSummary != a3)
  {
    self->_monitorRouteSummary = a3;
    -[RTNavigationManager _shouldSetNavigationListenerDelegate](self, "_shouldSetNavigationListenerDelegate");
    _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_monitorRouteSummary)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, monitor navigation route summary, %@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (void)setMonitorNavigationState:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_monitorNavigationState != a3)
  {
    self->_monitorNavigationState = a3;
    -[RTNavigationManager _shouldSetNavigationListenerDelegate](self, "_shouldSetNavigationListenerDelegate");
    _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_monitorRouteSummary)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, monitor navigation state, %@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (void)setRoutineEnabled:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_routineEnabled != a3)
  {
    self->_routineEnabled = a3;
    -[RTNavigationManager _shouldSetNavigationListenerDelegate](self, "_shouldSetNavigationListenerDelegate");
    _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_routineEnabled)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, routine enabled, %@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (void)setRouteSummary:(id)a3
{
  id v6;
  GEONavigationRouteSummary **p_routeSummary;
  RTNavigationManagerRouteSummaryNotification *v8;
  void *v9;
  GEONavigationRouteSummary *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  GEONavigationRouteSummary *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_routeSummary = &self->_routeSummary;
  if (-[GEONavigationRouteSummary isEqual:](self->_routeSummary, "isEqual:", v6))
  {
    _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    v8 = (RTNavigationManagerRouteSummaryNotification *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *p_routeSummary;
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1D1A22000, &v8->super.super, OS_LOG_TYPE_INFO, "%@, self.routeSummary, %@, routeSummary, %@", (uint8_t *)&v13, 0x20u);

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_routeSummary, a3);
    _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = (GEONavigationRouteSummary *)v6;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, route summary, %@", (uint8_t *)&v13, 0x16u);

    }
    v8 = -[RTNavigationManagerRouteSummaryNotification initWithRouteSummary:]([RTNavigationManagerRouteSummaryNotification alloc], "initWithRouteSummary:", v6);
    if (v8)
      -[RTNotifier postNotification:](self, "postNotification:", v8);
  }

}

- (void)onAuthorizationNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTNavigationManager *v10;
  SEL v11;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RTNavigationManager_onAuthorizationNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v10 = self;
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __51__RTNavigationManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityNavigation);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, received authorization notification, %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = *(id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "setRoutineEnabled:", objc_msgSend(v8, "enabled"));

  }
}

- (void)_updateNavigationState:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  RTNavigationManagerNavigationStateNotification *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityNavigation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, navigation state, %@", (uint8_t *)&v9, 0x16u);

  }
  if (objc_msgSend(v5, "hasNavigationState"))
  {
    v8 = -[RTNavigationManagerNavigationStateNotification initWithNavigationState:]([RTNavigationManagerNavigationStateNotification alloc], "initWithNavigationState:", objc_msgSend(v5, "navigationState"));
    if (v8)
      -[RTNotifier postNotification:](self, "postNotification:", v8);

  }
}

- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4
{
  -[RTNavigationManager setRouteSummary:](self, "setRouteSummary:", a4);
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  -[RTNavigationManager _updateNavigationState:](self, "_updateNavigationState:", a4);
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  if (!a4)
    -[RTNavigationManager setRouteSummary:](self, "setRouteSummary:", 0, 0, *(_QWORD *)&a5);
}

- (void)fetchNavigationRouteSummaryWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__RTNavigationManager_fetchNavigationRouteSummaryWithHandler___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __62__RTNavigationManager_fetchNavigationRouteSummaryWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNavigationRouteSummaryWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchNavigationRouteSummaryWithHandler:(id)a3
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  RTNavigationRouteSummary *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *aSelector;
  uint64_t v30;
  id v31;
  id v32;
  RTNavigationRouteSummary *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  RTNavigationRouteSummary *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, id))a3;
  if (v5)
  {
    -[RTNavigationManager routeSummary](self, "routeSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      aSelector = a2;
      -[RTNavigationManager mapServiceManager](self, "mapServiceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNavigationManager routeSummary](self, "routeSummary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "origin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mapItemStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v7, "mapItemWithIdentifier:geoMapItemStorage:source:creationDate:error:", v8, v11, 64, v12, &v32);
      v30 = objc_claimAutoreleasedReturnValue();
      v13 = v32;

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v5[2](v5, v14, v13);
        v15 = (void *)v30;
      }
      else
      {
        -[RTNavigationManager mapServiceManager](self, "mapServiceManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTNavigationManager routeSummary](self, "routeSummary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "destination");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mapItemStorage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(v17, "mapItemWithIdentifier:geoMapItemStorage:source:creationDate:error:", v18, v21, 64, v22, &v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v31;

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "array");
          v23 = (RTNavigationRouteSummary *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, v23, v13);
          v15 = (void *)v30;
        }
        else
        {
          v15 = (void *)v30;
          v23 = -[RTNavigationRouteSummary initWithOriginMapItem:destinationMapItem:]([RTNavigationRouteSummary alloc], "initWithOriginMapItem:destinationMapItem:", v30, v14);
          _rt_log_facility_get_os_log(RTLogFacilityNavigation);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v35 = v26;
            v36 = 2112;
            v37 = v27;
            v38 = 2112;
            v39 = v23;
            _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, navigation route summary, %@", buf, 0x20u);

          }
          v33 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, v28, 0);

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v16, 0);

    }
  }

}

- (GEONavigationListener)navigationListener
{
  return self->_navigationListener;
}

- (void)setNavigationListener:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListener, a3);
}

- (BOOL)monitorRouteSummary
{
  return self->_monitorRouteSummary;
}

- (BOOL)monitorNavigationState
{
  return self->_monitorNavigationState;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (GEONavigationRouteSummary)routeSummary
{
  return self->_routeSummary;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_routeSummary, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
}

@end
