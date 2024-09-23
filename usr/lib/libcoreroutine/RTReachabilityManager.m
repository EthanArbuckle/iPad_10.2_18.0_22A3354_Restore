@implementation RTReachabilityManager

- (RTReachabilityManager)init
{
  void *v3;
  RTReachabilityManager *v4;

  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTReachabilityManager initWithPathEvaluator:](self, "initWithPathEvaluator:", v3);

  return v4;
}

- (RTReachabilityManager)initWithPathEvaluator:(id)a3
{
  id v5;
  RTReachabilityManager *v6;
  RTReachabilityManager *v7;
  RTReachabilityManager *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTReachabilityManager;
    v6 = -[RTNotifier init](&v11, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_pathEvaluator, a3);
      v7->_currentReachability = 0;
      -[NWPathEvaluator addObserver:forKeyPath:options:context:](v7->_pathEvaluator, "addObserver:forKeyPath:options:context:", v7, CFSTR("path"), 5, 0);
      v7->_observingReachabilityChanges = 1;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pathEvaluator", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  RTReachabilityMonitorNotificationReachabilityChanged *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = -[RTReachabilityMonitorNotificationReachabilityChanged initWithReachability:]([RTReachabilityMonitorNotificationReachabilityChanged alloc], "initWithReachability:", self->_currentReachability);
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v10, v6);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityReachability);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v13, 0xCu);
    }

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = v7;
      v15 = 2080;
      v16 = "-[RTReachabilityManager internalAddObserver:name:]";
      v17 = 1024;
      v18 = 75;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[RTNotification notificationName](RTReachabilityMonitorNotificationReachabilityChanged, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityReachability);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412802;
      v10 = v4;
      v11 = 2080;
      v12 = "-[RTReachabilityManager internalRemoveObserver:name:]";
      v13 = 1024;
      v14 = 87;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_observingReachabilityChanges)
  {
    -[NWPathEvaluator removeObserver:forKeyPath:context:](self->_pathEvaluator, "removeObserver:forKeyPath:context:", self, CFSTR("path"), 0);
    self->_observingReachabilityChanges = 0;
  }
  self->_currentReachability = 0;
  v3.receiver = self;
  v3.super_class = (Class)RTReachabilityManager;
  -[RTReachabilityManager dealloc](&v3, sel_dealloc);
}

- (void)_shutdownWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_observingReachabilityChanges)
  {
    -[NWPathEvaluator removeObserver:forKeyPath:context:](self->_pathEvaluator, "removeObserver:forKeyPath:context:", self, CFSTR("path"), 0);
    v4 = v5;
    self->_observingReachabilityChanges = 0;
  }
  self->_currentReachability = 0;
  if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)_processReachabilityChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  unint64_t currentReachability;
  RTReachabilityMonitorNotificationReachabilityChanged *v21;
  NSObject *v22;
  char *v23;
  void *v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  v7 = v6 & 0xFFFFFFFFFFFFFFFDLL;
  if ((v6 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (v7 != 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "unhandled reachability case", (uint8_t *)&v26, 2u);
      }

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = (RTReachabilityMonitorNotificationReachabilityChanged *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v21->super.super, OS_LOG_TYPE_ERROR))
      {
        v26 = 136315394;
        v27 = "-[RTReachabilityManager _processReachabilityChange:]";
        v28 = 1024;
        LODWORD(v29) = 149;
        _os_log_error_impl(&dword_1D1A22000, &v21->super.super, OS_LOG_TYPE_ERROR, "unhandled reachability case (in %s:%d)", (uint8_t *)&v26, 0x12u);
      }
      goto LABEL_17;
    }
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "usesInterfaceType:", 1);

    v10 = v9;
    objc_msgSend(v4, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "usesInterfaceType:", 2);

    if (v12)
      v13 = v10 | 2;
    else
      v13 = v10;
    objc_msgSend(v4, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "usesInterfaceType:", 0);

    objc_msgSend(v4, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "usesInterfaceType:", 3);

    objc_msgSend(v4, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "usesInterfaceType:", 4);

    if (v19 | v17 | v15)
      v7 = v13 | 4;
    else
      v7 = v13;
  }
  currentReachability = self->_currentReachability;
  if (currentReachability != v7)
  {
    self->_currentReachability = v7;
    v21 = -[RTReachabilityMonitorNotificationReachabilityChanged initWithReachability:]([RTReachabilityMonitorNotificationReachabilityChanged alloc], "initWithReachability:", self->_currentReachability);
    -[RTNotifier postNotification:](self, "postNotification:", v21);
    _rt_log_facility_get_os_log(RTLogFacilityReachability);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "reachabilityToString:", v7);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "reachabilityToString:", currentReachability);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v23;
      v28 = 2112;
      v29 = v24;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "reachability changed to, %@, from, %@", (uint8_t *)&v26, 0x16u);

    }
LABEL_17:

  }
}

+ (id)reachabilityToString:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (!a3)
  {
    v6 = CFSTR("No Connection");
    return v6;
  }
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(v5, "addObject:", CFSTR("Cellular"));
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v4, "addObject:", CFSTR("WiFi"));
  if ((v3 & 2) != 0)
    goto LABEL_10;
LABEL_4:
  if ((v3 & 4) != 0)
LABEL_5:
    objc_msgSend(v5, "addObject:", CFSTR("Other"));
LABEL_6:
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentReachabilityString
{
  return +[RTReachabilityManager reachabilityToString:](RTReachabilityManager, "reachabilityToString:", self->_currentReachability);
}

- (void)fetchCurrentReachability:(id)a3
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
    v6[2] = __50__RTReachabilityManager_fetchCurrentReachability___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __50__RTReachabilityManager_fetchCurrentReachability___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentReachability:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchCurrentReachability:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (v4)
  {
    if (self->_pathEvaluator)
    {
      (*((void (**)(id, unint64_t))v4 + 2))(v4, self->_currentReachability);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "attempted to fetch current reachability with nil path evaluator", (uint8_t *)&v9, 2u);
      }

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "-[RTReachabilityManager _fetchCurrentReachability:]";
        v11 = 1024;
        v12 = 212;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "attempted to fetch current reachability with nil path evaluator (in %s:%d)", (uint8_t *)&v9, 0x12u);
      }

      v5[2](v5, 0);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v9, 2u);
    }

  }
}

- (unint64_t)reachability
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__RTReachabilityManager_reachability__block_invoke;
  v6[3] = &unk_1E929A690;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __37__RTReachabilityManager_reachability__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__RTReachabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E92978E8;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __72__RTReachabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;

  v8 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("path"))
    && -[NWPathEvaluator isEqual:](self->_pathEvaluator, "isEqual:", v8))
  {
    -[RTReachabilityManager _processReachabilityChange:](self, "_processReachabilityChange:", v8);
  }

}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_pathEvaluator, a3);
}

- (unint64_t)currentReachability
{
  return self->_currentReachability;
}

- (void)setCurrentReachability:(unint64_t)a3
{
  self->_currentReachability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

@end
