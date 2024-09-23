@implementation SCLUnlockHistoryPersistentStore

- (SCLUnlockHistoryPersistentStore)initWithURL:(id)a3
{
  id v5;
  SCLUnlockHistoryPersistentStore *v6;
  SCLUnlockHistoryPersistentStore *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSPersistentContainer *persistentContainer;
  void *v13;
  NSPersistentContainer *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLUnlockHistoryPersistentStore;
  v6 = -[SCLUnlockHistoryPersistentStore init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("SchoolTime"), CFSTR("momd"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v9);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB700]), "initWithName:managedObjectModel:", CFSTR("SchoolTime"), v10);
    persistentContainer = v7->_persistentContainer;
    v7->_persistentContainer = (NSPersistentContainer *)v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB740]), "initWithURL:", v5);
    objc_msgSend(v13, "setType:", *MEMORY[0x24BDBB580]);
    v14 = v7->_persistentContainer;
    v18[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersistentContainer setPersistentStoreDescriptions:](v14, "setPersistentStoreDescriptions:", v15);

  }
  return v7;
}

- (void)loadStore
{
  NSPersistentContainer *persistentContainer;
  _QWORD v3[5];

  persistentContainer = self->_persistentContainer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke;
  v3[3] = &unk_24E29C0D0;
  v3[4] = self;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](persistentContainer, "loadPersistentStoresWithCompletionHandler:", v3);
}

void __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  scl_persistence_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_21E4AD000, v8, OS_LOG_TYPE_DEFAULT, "Loaded description %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "newBackgroundContext");

    -[NSObject setName:](v8, "setName:", CFSTR("SCLUnlockHistoryPersistentStore context"));
    objc_msgSend(*(id *)(a1 + 32), "setStoreContext:", v8);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSManagedObjectContext refreshAllObjects](self->_storeContext, "refreshAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)SCLUnlockHistoryPersistentStore;
  -[SCLUnlockHistoryPersistentStore dealloc](&v3, sel_dealloc);
}

- (BOOL)insertItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[SCLUnlockHistoryPersistentStore storeContext](self, "storeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke;
  v10[3] = &unk_24E29C0F8;
  v6 = v5;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke(uint64_t a1)
{
  SCLUnlockEvent *v2;
  uint64_t *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;

  v2 = -[SCLUnlockEvent initWithContext:]([SCLUnlockEvent alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setCalendarIdentifier:](v2, "setCalendarIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setTimeZoneName:](v2, "setTimeZoneName:", v7);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setIdentifier:](v2, "setIdentifier:", v8);

  objc_msgSend(*(id *)(a1 + 40), "unlockedInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setStartDate:](v2, "setStartDate:", v10);

  objc_msgSend(*(id *)(a1 + 40), "unlockedInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "duration");
  -[SCLUnlockEvent setDuration:](v2, "setDuration:", (int)v12);

  objc_msgSend(*(id *)(a1 + 40), "scheduleStartTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setScheduleStartHour:](v2, "setScheduleStartHour:", (__int16)objc_msgSend(v13, "hour"));

  objc_msgSend(*(id *)(a1 + 40), "scheduleStartTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setScheduleStartMinute:](v2, "setScheduleStartMinute:", (__int16)objc_msgSend(v14, "minute"));

  objc_msgSend(*(id *)(a1 + 40), "scheduleEndTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setScheduleEndHour:](v2, "setScheduleEndHour:", (__int16)objc_msgSend(v15, "hour"));

  objc_msgSend(*(id *)(a1 + 40), "scheduleEndTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockEvent setScheduleEndMinute:](v2, "setScheduleEndMinute:", (__int16)objc_msgSend(v16, "minute"));

  v17 = *(void **)(a1 + 32);
  v20 = 0;
  LOBYTE(v16) = objc_msgSend(v17, "save:", &v20);
  v18 = v20;
  *(_BYTE *)(*(_QWORD *)(v3[1] + 8) + 24) = (_BYTE)v16;
  if (!*(_BYTE *)(*(_QWORD *)(v3[1] + 8) + 24))
  {
    scl_persistence_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke_cold_1(v3, (uint64_t)v18, v19);

  }
}

- (BOOL)deleteHistory:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  id *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[SCLUnlockHistoryPersistentStore storeContext](self, "storeContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SCLUnlockHistoryPersistentStore_deleteHistory___block_invoke;
  v7[3] = &unk_24E29C120;
  v5 = v4;
  v9 = &v11;
  v10 = a3;
  v8 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v7);
  LOBYTE(a3) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __49__SCLUnlockHistoryPersistentStore_deleteHistory___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BDBB5E8]);
  +[SCLUnlockEvent fetchRequest](SCLUnlockEvent, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "initWithFetchRequest:", v3);

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "executeRequest:error:", v6, *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD **)(a1 + 48);
  if (v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *v5 == 0;

}

- (id)recentHistoryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  +[SCLUnlockEvent fetchRequest](SCLUnlockEvent, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockHistoryPersistentStore persistentContainer](self, "persistentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAffectedStores:", v6);

  -[SCLUnlockHistoryPersistentStore recentItemsThresholdDate](self, "recentItemsThresholdDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("startDate >= %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v8);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v10);

  -[SCLUnlockHistoryPersistentStore storeContext](self, "storeContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke;
  v19[3] = &unk_24E29C148;
  v20 = v11;
  v21 = v3;
  v13 = v12;
  v22 = v13;
  v14 = v3;
  v15 = v11;
  objc_msgSend(v15, "performBlockAndWait:", v19);
  v16 = v22;
  v17 = v13;

  return v17;
}

void __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  SCLScheduleTime *v19;
  SCLScheduleTime *v20;
  SCLUnlockHistoryItem *v21;
  void *v22;
  void *v23;
  NSObject *obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v30 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  if (v5)
  {
    scl_persistence_log();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke_cold_1();
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v22 = 0;
      v23 = v4;
      v25 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v25)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x24BDBCE48];
          objc_msgSend(v9, "calendarIdentifier", v22, v23);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "calendarWithIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x24BDBCF38];
          objc_msgSend(v9, "timeZoneName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeZoneWithName:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_alloc(MEMORY[0x24BDD1508]);
          objc_msgSend(v9, "startDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithStartDate:duration:", v17, (double)(int)objc_msgSend(v9, "duration"));

          v19 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", (int)objc_msgSend(v9, "scheduleStartHour"), (int)objc_msgSend(v9, "scheduleStartMinute"));
          v20 = -[SCLScheduleTime initWithHour:minute:]([SCLScheduleTime alloc], "initWithHour:minute:", (int)objc_msgSend(v9, "scheduleEndHour"), (int)objc_msgSend(v9, "scheduleEndMinute"));
          v21 = -[SCLUnlockHistoryItem initWithInterval:calendar:timeZone:startTime:endTime:]([SCLUnlockHistoryItem alloc], "initWithInterval:calendar:timeZone:startTime:endTime:", v18, v12, v15, v19, v20);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
      v5 = v22;
      v4 = v23;
    }
  }

}

- (BOOL)purgeOldItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  +[SCLUnlockEvent fetchRequest](SCLUnlockEvent, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockHistoryPersistentStore persistentContainer](self, "persistentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAffectedStores:", v6);

  -[SCLUnlockHistoryPersistentStore recentItemsThresholdDate](self, "recentItemsThresholdDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("startDate < %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v3);
  objc_msgSend(v9, "setResultType:", 2);
  -[SCLUnlockHistoryPersistentStore storeContext](self, "storeContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke;
  v15[3] = &unk_24E29C0F8;
  v11 = v10;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = &v19;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  v13 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v8 = 0;
  objc_msgSend(v2, "executeRequest:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    scl_persistence_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_2();
  }
  else
  {
    objc_msgSend(v4, "result");
    v6 = objc_claimAutoreleasedReturnValue();
    scl_persistence_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (id)recentItemsThresholdDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 16, -7, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSManagedObjectContext)storeContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStoreContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

void __44__SCLUnlockHistoryPersistentStore_loadStore__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Couldn't load description %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __46__SCLUnlockHistoryPersistentStore_insertItem___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_21E4AD000, log, OS_LOG_TYPE_ERROR, "Failed to save item %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __53__SCLUnlockHistoryPersistentStore_recentHistoryItems__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Could not retrieve recent history items: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_21E4AD000, v0, OS_LOG_TYPE_DEBUG, "Deleted %@ items", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __48__SCLUnlockHistoryPersistentStore_purgeOldItems__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E4AD000, v0, v1, "Failed to purge old items: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
