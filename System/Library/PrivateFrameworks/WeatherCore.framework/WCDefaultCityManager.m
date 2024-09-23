@implementation WCDefaultCityManager

- (WCDefaultCityManager)init
{
  WCDefaultCityManager *v2;
  WCDefaultCityManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *reloadQueue;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  WCDefaultCityManager *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WCDefaultCityManager;
  v2 = -[WCDefaultCityManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.weathercore.defaultcitymanager", v4);
    reloadQueue = v3->_reloadQueue;
    v3->_reloadQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_reloadDefaultCities, *MEMORY[0x1E0C99720], 0);

    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__WCDefaultCityManager_init__block_invoke;
    block[3] = &unk_1E60A6FB0;
    v11 = v3;
    dispatch_async(v8, block);

  }
  return v3;
}

id __28__WCDefaultCityManager_init__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "reloadDefaultCities");
}

- (id)reloadDefaultCities
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  __CFString *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (isChineseSKU())
  {
    WCLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1B00C3000, v7, OS_LOG_TYPE_DEFAULT, "Previous localeCode=%@, overriding localeCode to the countryCode CN", buf, 0xCu);
    }

    v6 = CFSTR("CN");
  }
  if (isJapaneseSKU())
  {
    WCLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_1B00C3000, v8, OS_LOG_TYPE_DEFAULT, "Previous localeCode=%@, overriding localeCode to the countryCode JP", buf, 0xCu);
    }

    v6 = CFSTR("JP");
  }
  WCLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v38 = v6;
    v39 = 2112;
    v40 = v5;
    v41 = 2112;
    v42 = v4;
    _os_log_impl(&dword_1B00C3000, v9, OS_LOG_TYPE_DEFAULT, "About to ask the ALCityManager for our default cities. LocaleCode=%@, countryCode=%@, currentLocale=%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultCitiesForLocaleCode:", v6);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = -[__CFString count](v11, "count");
  WCLogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1B00C3000, v13, OS_LOG_TYPE_DEFAULT, "[ALCityManager.defaultCitiesForLocaleCode:%@] returned the following cities:%@", buf, 0x16u);
    }
    v15 = v11;
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_1B00C3000, v13, OS_LOG_TYPE_DEFAULT, "[ALCityManager.defaultCitiesForLocaleCode:%@] returned NO cities.  Trying [ALCityManager.defaultCitiesForLocaleCode:%@]", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultCitiesForLocaleCode:", v5);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v17 = -[__CFString count](v15, "count");
    WCLogForCategory(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (!v18)
        goto LABEL_23;
      *(_DWORD *)buf = 138412546;
      v38 = v5;
      v39 = 2112;
      v40 = v15;
      v19 = "[ALCityManager.defaultCitiesForLocaleCode:%@] returned the following cities:%@";
      v20 = v13;
      v21 = 22;
    }
    else
    {
      if (!v18)
        goto LABEL_23;
      *(_DWORD *)buf = 138412290;
      v38 = v5;
      v19 = "[ALCityManager.defaultCitiesForLocaleCode:%@] returned NO cities.  We are out of luck";
      v20 = v13;
      v21 = 12;
    }
    _os_log_impl(&dword_1B00C3000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
  }
LABEL_23:

  if (-[__CFString count](v15, "count"))
  {
    v30 = v5;
    v31 = v4;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = v15;
    v23 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v22);
          +[WCDefaultCity cityFromAlCity:](WCDefaultCity, "cityFromAlCity:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v30, v31, (_QWORD)v32);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            -[__CFString addObject:](v3, "addObject:", v27);

        }
        v24 = -[__CFString countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v24);
    }

    v5 = v30;
    v4 = v31;
  }
  WCLogForCategory(1uLL);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v3;
    _os_log_impl(&dword_1B00C3000, v28, OS_LOG_TYPE_DEFAULT, "Built and returning the following WCDefaultCities:%@", buf, 0xCu);
  }

  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_defaultCities, v3);
  os_unfair_lock_unlock(&self->_dataSynchronizationLock);

  return v3;
}

- (NSArray)defaultCities
{
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v4;

  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_defaultCities, "copy");
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  if (!v4)
  {
    -[WCDefaultCityManager reloadDefaultCities](self, "reloadDefaultCities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v4;
}

- (id)defaultCityForLocalTimeZone
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WCLogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1B00C3000, v2, OS_LOG_TYPE_DEFAULT, "About to ask the ALCityManager for our defaultCityForTimeZone:localTimeZone", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultCityForTimeZone:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WCLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B00C3000, v6, OS_LOG_TYPE_DEFAULT, "Obtained default ALCity for local timezone=%@", (uint8_t *)&v9, 0xCu);
  }

  +[WCDefaultCity cityFromAlCity:](WCDefaultCity, "cityFromAlCity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDefaultCities:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCities, a3);
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setReloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reloadQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_defaultCities, 0);
}

@end
