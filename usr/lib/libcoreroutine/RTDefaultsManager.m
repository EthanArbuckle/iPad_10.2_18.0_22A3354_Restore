@implementation RTDefaultsManager

- (id)objectForKey:(id)a3
{
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[RTUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[RTDefaultsManager objectForKey:]";
      v8 = 1024;
      v9 = 165;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    v3 = 0;
  }
  return v3;
}

void __39__RTDefaultsManager_notifyUpdatedKeys___block_invoke(uint64_t a1)
{
  RTDefaultsManagerNotificationDefaultsChanged *v2;

  v2 = -[RTDefaultsManagerNotificationDefaultsChanged initWithUpdatedKeys:]([RTDefaultsManagerNotificationDefaultsChanged alloc], "initWithUpdatedKeys:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "postNotification:", v2);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[RTUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, v6);
    -[RTUserDefaults rt_synchronize](self->_userDefaults, "rt_synchronize");
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    -[RTDefaultsManager notifyUpdatedKeys:](self, "notifyUpdatedKeys:", v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTDefaultsManager setObject:forKey:]";
      v11 = 1024;
      v12 = 177;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", buf, 0x12u);
    }
  }

}

- (void)notifyUpdatedKeys:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  RTDefaultsManager *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__RTDefaultsManager_notifyUpdatedKeys___block_invoke;
    v6[3] = &unk_1E9297540;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (RTDefaultsManager)init
{
  void *v3;
  void *v4;
  RTDefaultsManager *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", CFSTR("defaults.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTDefaultsManager initWithUserDefaults:customDomain:](self, "initWithUserDefaults:customDomain:", v3, v4);

  return v5;
}

- (RTDefaultsManager)initWithUserDefaults:(id)a3 customDomain:(id)a4
{
  id v7;
  id v8;
  RTDefaultsManager *v9;
  id *p_isa;
  RTDefaultsManager *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTDefaultsManager;
    v9 = -[RTNotifier init](&v13, sel_init);
    p_isa = (id *)&v9->super.super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_userDefaults, a3);
      if (v8)
        objc_msgSend(p_isa[4], "addSuiteNamed:", v8);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)registerDefaults:(id)a3
{
  -[RTUserDefaults registerDefaults:](self->_userDefaults, "registerDefaults:", a3);
}

- (void)registerDefault:(id)a3 forKey:(id)a4
{
  RTUserDefaults *userDefaults;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  userDefaults = self->_userDefaults;
  v10 = a4;
  v11[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTUserDefaults registerDefaults:](userDefaults, "registerDefaults:", v9);

}

- (void)addDomain:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTUserDefaults addSuiteNamed:](self->_userDefaults, "addSuiteNamed:", v4);
    -[RTUserDefaults rt_refreshDomain:](self->_userDefaults, "rt_refreshDomain:", v4);
    -[RTUserDefaults rt_copyKeyListForDomain:](self->_userDefaults, "rt_copyKeyListForDomain:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDefaultsManager notifyUpdatedKeys:](self, "notifyUpdatedKeys:", v5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[RTDefaultsManager addDomain:]";
      v9 = 1024;
      v10 = 150;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: domain (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }

  }
}

- (id)objectForKey:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[RTDefaultsManager objectForKey:domain:]";
      v15 = 1024;
      v16 = 192;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[RTDefaultsManager objectForKey:domain:]";
      v15 = 1024;
      v16 = 193;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: domain (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  -[RTUserDefaults rt_objectForKey:domain:](self->_userDefaults, "rt_objectForKey:domain:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      -[RTUserDefaults rt_setObject:forKey:domain:](self->_userDefaults, "rt_setObject:forKey:domain:", v8, v9, v10);
      -[RTUserDefaults rt_synchronizeDomain:](self->_userDefaults, "rt_synchronizeDomain:", v11);
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 136315394;
    v15 = "-[RTDefaultsManager setObject:forKey:domain:]";
    v16 = 1024;
    v17 = 208;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v14, 0x12u);
  }

  if (!v11)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[RTDefaultsManager setObject:forKey:domain:]";
      v16 = 1024;
      v17 = 209;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: domain (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

  }
LABEL_10:

}

- (id)copyKeyListContainingString:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTUserDefaults dictionaryRepresentation](self->_userDefaults, "dictionaryRepresentation");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject allKeys](v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "containsString:", v4, (_QWORD)v15))
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keySubstring", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)objectForKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[RTDefaultsManager objectForKey:](self, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = v8;
  _rt_log_facility_get_os_log(RTLogFacilityDefaults);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v11;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, key, %@, value, %@", (uint8_t *)&v13, 0x20u);

  }
  return v9;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDefaults);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDefaults);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (BOOL)_generateDiagnosticFilesAtURL:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  BOOL v20;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "routinePreferencesPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  if ((v12 & 1) != 0)
    goto LABEL_6;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@ %@, creating destination directory, %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v26);
  v19 = v26;

  if (v18 && !v19)
  {
LABEL_6:
    -[RTUserDefaults dictionaryRepresentation](self->_userDefaults, "dictionaryRepresentation");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "writeToFile:atomically:", v9, 0);
    v20 = 1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v28 = v24;
      v29 = 2112;
      v30 = v25;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      v34 = v19;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@ %@, failed to create directory, %@, error, %@", buf, 0x2Au);

    }
    if (a4)
    {
      v19 = objc_retainAutorelease(v19);
      v20 = 0;
      *a4 = v19;
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTDefaultsManager_sendDiagnosticsToURL_options_handler___block_invoke;
  block[3] = &unk_1E9298750;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v10;
  v18 = v9;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  dispatch_async(v12, block);

}

void __58__RTDefaultsManager_sendDiagnosticsToURL_options_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v20 = v4;
    v21 = 2112;
    v22 = (uint64_t)v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@ %@, options, %@", buf, 0x20u);

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "hasMask:", 1) & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v18 = 0;
    v9 = objc_msgSend(v7, "_generateDiagnosticFilesAtURL:error:", v8, &v18);
    v10 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v20 = v13;
      v21 = 2112;
      if (v9)
        v16 = CFSTR("YES");
      v22 = v14;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@ %@, success, %@, error, %@", buf, 0x2Au);

    }
    v17 = *(_QWORD *)(a1 + 56);
    if (v17)
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)fetchDiagnosticLogsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__RTDefaultsManager_fetchDiagnosticLogsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__RTDefaultsManager_fetchDiagnosticLogsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastImportDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Last Import Date, %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("RTDefaultsPersistenceMirroringManagerBackgroundLastExportDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Last Export Date, %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
