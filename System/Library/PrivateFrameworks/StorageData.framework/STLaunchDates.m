@implementation STLaunchDates

+ (id)sharedDates
{
  if (sharedDates_onceToken != -1)
    dispatch_once(&sharedDates_onceToken, &__block_literal_global_13);
  return (id)sharedDates__gSharedDates;
}

uint64_t __28__STLaunchDates_sharedDates__block_invoke()
{
  STLaunchDates *v0;
  void *v1;

  v0 = objc_alloc_init(STLaunchDates);
  v1 = (void *)sharedDates__gSharedDates;
  sharedDates__gSharedDates = (uint64_t)v0;

  return objc_msgSend((id)sharedDates__gSharedDates, "load");
}

- (STLaunchDates)init
{
  STLaunchDates *v2;
  uint64_t v3;
  NSMutableDictionary *launchDatesByApp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STLaunchDates;
  v2 = -[STLaunchDates init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    launchDatesByApp = v2->_launchDatesByApp;
    v2->_launchDatesByApp = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)launchDateForApp:(id)a3
{
  id v4;
  STLaunchDates *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_launchDatesByApp, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)_writeDatesPref:(id)a3
{
  id v4;
  STLaunchDates *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[NSMutableDictionary copy](v5->_launchDatesByApp, "copy");
  dispatch_get_global_queue(9, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__STLaunchDates__writeDatesPref___block_invoke;
  block[3] = &unk_24C75F658;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

  objc_sync_exit(v5);
}

uint64_t __33__STLaunchDates__writeDatesPref___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;

  v1 = (const __CFString *)*MEMORY[0x24BDBD590];
  v2 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSetValue(CFSTR("LaunchTimes"), *(CFPropertyListRef *)(a1 + 32), CFSTR("com.apple.settings.storage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  return CFPreferencesSynchronize(CFSTR("com.apple.settings.storage"), v1, v2);
}

- (void)writeDatesPref
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__writeDatesPref_, 0);
  -[STLaunchDates performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__writeDatesPref_, 0, 5.0);
}

- (void)readDatesPref
{
  id v3;

  v3 = (id)CFPreferencesCopyValue(CFSTR("LaunchTimes"), CFSTR("com.apple.settings.storage"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  -[STLaunchDates updateDates:](self, "updateDates:", v3);

}

- (void)updateDates:(id)a3
{
  id v4;
  STLaunchDates *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSDate *v13;
  NSDate *v14;
  NSDate *latestDate;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __29__STLaunchDates_updateDates___block_invoke;
  v20[3] = &unk_24C75FFE0;
  v20[4] = v5;
  v20[5] = &v21;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v20);
  if (*((_BYTE *)v22 + 24))
  {
    -[NSMutableDictionary allValues](v5->_launchDatesByApp, "allValues");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v8)
          {
            objc_msgSend(v8, "laterDate:", v11, (_QWORD)v16);
            v12 = objc_claimAutoreleasedReturnValue();

            v8 = (id)v12;
          }
          else
          {
            v8 = v11;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
      }
      while (v7);

      if (v8)
      {
        v13 = (NSDate *)v8;
        v14 = v13;
LABEL_16:
        latestDate = v5->_latestDate;
        v5->_latestDate = v13;

        -[STLaunchDates writeDatesPref](v5, "writeDatesPref");
        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now", (_QWORD)v16);
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_16;
  }
LABEL_17:
  _Block_object_dispose(&v21, 8);
  objc_sync_exit(v5);

}

void __29__STLaunchDates_updateDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6
    || (objc_msgSend(v6, "laterDate:", v5), v8 = (id)objc_claimAutoreleasedReturnValue(), v8, v8 == v5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v5, v9);
  }

}

- (void)addSpotlightDates
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  dispatch_semaphore_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  dispatch_semaphore_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v4 = (void *)getCSSearchQueryContextClass_softClass;
  v28 = getCSSearchQueryContextClass_softClass;
  v5 = MEMORY[0x24BDAC760];
  if (!getCSSearchQueryContextClass_softClass)
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __getCSSearchQueryContextClass_block_invoke;
    v23 = &unk_24C75FBC0;
    v24 = &v25;
    __getCSSearchQueryContextClass_block_invoke((uint64_t)&v20);
    v4 = (void *)v26[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v25, 8);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setBundleIDs:", &unk_24C768DA0);
  v30[0] = CFSTR("_kMDItemExternalID");
  v30[1] = CFSTR("_kMDItemApplicationLastLaunchedDate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchAttributes:", v8);

  v29 = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtectionClasses:", v9);

  objc_msgSend(v7, "setInternal:", 1);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v10 = (void *)getCSSearchQueryClass_softClass;
  v28 = getCSSearchQueryClass_softClass;
  if (!getCSSearchQueryClass_softClass)
  {
    v20 = v5;
    v21 = 3221225472;
    v22 = __getCSSearchQueryClass_block_invoke;
    v23 = &unk_24C75FBC0;
    v24 = &v25;
    __getCSSearchQueryClass_block_invoke((uint64_t)&v20);
    v10 = (void *)v26[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v25, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "initWithQueryString:context:", CFSTR("true"), v7);
  v13 = dispatch_semaphore_create(0);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __34__STLaunchDates_addSpotlightDates__block_invoke;
  v18[3] = &unk_24C760008;
  v19 = v3;
  v14 = v3;
  objc_msgSend(v12, "setFoundItemsHandler:", v18);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __34__STLaunchDates_addSpotlightDates__block_invoke_2;
  v16[3] = &unk_24C760030;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v12, "setCompletionHandler:", v16);
  objc_msgSend(v12, "start");
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  -[STLaunchDates updateDates:](self, "updateDates:", v14);

}

void __34__STLaunchDates_addSpotlightDates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "attributeSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attributeForKey:", CFSTR("_kMDItemExternalID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attributeForKey:", CFSTR("_kMDItemApplicationLastLaunchedDate"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v9)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (!v12)
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

intptr_t __34__STLaunchDates_addSpotlightDates__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addBiomeDates
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  dispatch_time_t v11;
  _QWORD v12[5];
  _QWORD v13[4];
  dispatch_semaphore_t v14;

  objc_msgSend(MEMORY[0x24BE0CDB0], "appLaunch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_latestDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "publisherFromStartTime:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  objc_msgSend(v4, "filterWithIsIncluded:", &__block_literal_global_19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "reduceWithInitial:nextPartialResult:", v7, &__block_literal_global_21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = self;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __30__STLaunchDates_addBiomeDates__block_invoke_3;
  v13[3] = &unk_24C7600D8;
  v14 = v5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__STLaunchDates_addBiomeDates__block_invoke_4;
  v12[3] = &unk_24C760100;
  v9 = v5;
  v10 = (id)objc_msgSend(v8, "sinkWithCompletion:shouldContinue:", v13, v12);

  v11 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v9, v11);

}

uint64_t __30__STLaunchDates_addBiomeDates__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStarting");

  return v3;
}

id __30__STLaunchDates_addBiomeDates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v10);

  return v4;
}

intptr_t __30__STLaunchDates_addBiomeDates__block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __30__STLaunchDates_addBiomeDates__block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updateDates:", a2);
  return 0;
}

- (void)load
{
  -[STLaunchDates readDatesPref](self, "readDatesPref");
  -[STLaunchDates addSpotlightDates](self, "addSpotlightDates");
}

- (NSMutableDictionary)launchDatesByApp
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLaunchDatesByApp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)latestDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatestDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDate, 0);
  objc_storeStrong((id *)&self->_launchDatesByApp, 0);
}

@end
