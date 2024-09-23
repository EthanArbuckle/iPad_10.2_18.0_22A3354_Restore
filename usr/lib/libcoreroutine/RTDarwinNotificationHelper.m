@implementation RTDarwinNotificationHelper

void __69__RTDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleDarwinNotificationCallback:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_handleDarwinNotificationCallback:(id)a3
{
  id v4;
  RTDarwinNotificationHelper *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "darwin notification received, %@", (uint8_t *)&v11, 0xCu);
    }

    -[NSMutableDictionary objectForKey:](v5->_registrations, "objectForKey:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      -[NSObject handler](v8, "handler");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "failed call darwin notification handler, record nil", (uint8_t *)&v11, 2u);
      }
    }

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11) = 0;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", (uint8_t *)&v11, 2u);
  }

  objc_sync_exit(v5);
}

- (unint64_t)stateForNotificationName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t state64;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state64 = 0;
  -[NSMutableDictionary objectForKey:](self->_registrations, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_registrations, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registrationToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if (notify_get_state(v8, &state64))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Could not get state for %@", buf, 0xCu);
      }

    }
  }
  v10 = state64;

  return v10;
}

- (RTDarwinNotificationHelper)init
{
  RTDarwinNotificationHelper *v2;
  uint64_t v3;
  NSMutableDictionary *registrations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTDarwinNotificationHelper;
  v2 = -[RTDarwinNotificationHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_registrations, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "notificationName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTDarwinNotificationHelper removeObserverForNotificationName:](self, "removeObserverForNotificationName:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)RTDarwinNotificationHelper;
  -[RTDarwinNotificationHelper dealloc](&v9, sel_dealloc);
}

- (void)addObserverForNotificationName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  RTDarwinNotificationHelper *v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  id v13;
  id v14;
  uint32_t v15;
  RTDarwinNotificationRecord *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 is_valid_token;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  int out_token;
  id location;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  _BYTE v35[10];
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", buf, 2u);
    }
    goto LABEL_12;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_12;
  }
  -[NSMutableDictionary objectForKey:](v8->_registrations, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "registration already exists for notification name %@, returning", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_22;
  }
  objc_initWeak(&location, v8);
  out_token = -1;
  v11 = objc_retainAutorelease(v6);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  v13 = MEMORY[0x1E0C80D38];
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __69__RTDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke;
  v27 = &unk_1E9298AA8;
  objc_copyWeak(&v29, &location);
  v14 = v11;
  v28 = v14;
  v15 = notify_register_dispatch(v12, &out_token, MEMORY[0x1E0C80D38], &v24);

  if (v15 || out_token == -1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v14;
      v34 = 1024;
      *(_DWORD *)v35 = v15;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = out_token;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "failed to register for darwin notification, %@, status, %d, registration token, %d", buf, 0x18u);
    }
  }
  else
  {
    v16 = [RTDarwinNotificationRecord alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token, v24, v25, v26, v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[RTDarwinNotificationRecord initWithNotificationName:registrationToken:handler:](v16, "initWithNotificationName:registrationToken:handler:", v14, v17, v7);

    if (v18)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject notificationName](v18, "notificationName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject registrationToken](v18, "registrationToken");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject registrationToken](v18, "registrationToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        is_valid_token = notify_is_valid_token(objc_msgSend(v22, "intValue"));
        *(_DWORD *)buf = 138412802;
        v33 = v20;
        v34 = 2112;
        *(_QWORD *)v35 = v21;
        *(_WORD *)&v35[8] = 1024;
        v36 = is_valid_token;
        _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "added registration for for notification name, %@, token, %@, valid, %d", buf, 0x1Cu);

      }
      -[NSMutableDictionary setObject:forKey:](v8->_registrations, "setObject:forKey:", v18, v14);
    }
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
LABEL_22:
  objc_sync_exit(v8);

}

- (void)removeObserverForNotificationName:(id)a3
{
  id v4;
  RTDarwinNotificationHelper *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint32_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  uint32_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](v5->_registrations, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "registration doesn't exist for notification %@, returning", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_10;
    }
    -[NSObject registrationToken](v6, "registrationToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    v10 = notify_cancel(v9);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[NSObject notificationName](v7, "notificationName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v13;
        v17 = 1024;
        v18 = v10;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "failed to cancel registration for darwin notification, %@, status, %u", (uint8_t *)&v15, 0x12u);

      }
LABEL_10:

      goto LABEL_14;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject notificationName](v7, "notificationName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "removing registration for for notification name, %@", (uint8_t *)&v15, 0xCu);

    }
    -[NSMutableDictionary removeObjectForKey:](v5->_registrations, "removeObjectForKey:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", (uint8_t *)&v15, 2u);
    }
  }
LABEL_14:

  objc_sync_exit(v5);
}

- (void)postNotification:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    notify_post((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName", v4, 2u);
    }

  }
}

- (void)addObserver:(id)a3 center:(__CFNotificationCenter *)a4 key:(id)a5 callback:(void *)a6 info:(void *)a7 suspensionBehavior:(int64_t)a8
{
  CFNotificationCenterAddObserver(a4, a3, (CFNotificationCallback)a6, (CFStringRef)a5, a7, (CFNotificationSuspensionBehavior)a8);
}

- (void)removeObserver:(id)a3 center:(__CFNotificationCenter *)a4 key:(id)a5 info:(void *)a6
{
  CFNotificationCenterRemoveObserver(a4, a3, (CFNotificationName)a5, a6);
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
}

@end
