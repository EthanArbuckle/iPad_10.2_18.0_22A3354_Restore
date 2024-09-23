@implementation TIUserModelDataStoreMock

- (TIUserModelDataStoreMock)init
{
  TIUserModelDataStoreMock *v2;
  uint64_t v3;
  NSMutableArray *database;
  uint64_t v5;
  NSMutableDictionary *durableDatabase;
  uint64_t v7;
  NSDate *propertiesLastMigrationDate;
  uint64_t v9;
  NSDate *durableLastMigrationDate;
  uint64_t v11;
  NSDate *transientLastMigrationDate;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TIUserModelDataStoreMock;
  v2 = -[TIUserModelDataStoreMock init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    database = v2->_database;
    v2->_database = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    durableDatabase = v2->_durableDatabase;
    v2->_durableDatabase = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v7 = objc_claimAutoreleasedReturnValue();
    propertiesLastMigrationDate = v2->_propertiesLastMigrationDate;
    v2->_propertiesLastMigrationDate = (NSDate *)v7;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v9 = objc_claimAutoreleasedReturnValue();
    durableLastMigrationDate = v2->_durableLastMigrationDate;
    v2->_durableLastMigrationDate = (NSDate *)v9;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
    transientLastMigrationDate = v2->_transientLastMigrationDate;
    v2->_transientLastMigrationDate = (NSDate *)v11;

  }
  return v2;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)addValue:(id)a3 andSecondaryValue:(id)a4 andRealValue:(id)a5 andProperties:(id)a6 forKey:(id)a7 forInputMode:(id)a8 forDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  TIUserModelDataStoreMock *v22;
  NSMutableArray *database;
  TIMockUserModelDatabaseRow *v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = self;
  objc_sync_enter(v22);
  database = v22->_database;
  v24 = -[TIMockUserModelDatabaseRow initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:]([TIMockUserModelDatabaseRow alloc], "initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:", v19, v20, v15, v16, v17, v18, v21, v21);
  -[NSMutableArray addObject:](database, "addObject:", v24);

  objc_sync_exit(v22);
  return 1;
}

- (BOOL)purgeDataForKey:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TIUserModelDataStoreMock *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  NSMutableArray *database;
  TIUserModelDataStoreMock *v22;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v22 = v11;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v11->_database;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "isMatchForKey:forInputMode:sinceDate:", v8, v9, 0) ^ 1;
        if (!v10)
          LOBYTE(v17) = 1;
        if ((v17 & 1) == 0)
        {
          objc_msgSend(v16, "lastUpdateDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "compare:", v10) == 1;

          if (!v19)
            continue;
        }
        -[NSMutableArray addObject:](v12, "addObject:", v16);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  database = v22->_database;
  v22->_database = v12;

  objc_sync_exit(v22);
  return 1;
}

- (BOOL)purgeDataForKeyPrefix:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TIUserModelDataStoreMock *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  NSMutableArray *database;
  TIUserModelDataStoreMock *v22;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v22 = v11;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v11->_database;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "isMatchForKeyPrefix:forInputMode:sinceDate:", v8, v9, 0) ^ 1;
        if (!v10)
          LOBYTE(v17) = 1;
        if ((v17 & 1) == 0)
        {
          objc_msgSend(v16, "lastUpdateDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "compare:", v10) == 1;

          if (!v19)
            continue;
        }
        -[NSMutableArray addObject:](v12, "addObject:", v16);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  database = v22->_database;
  v22->_database = v12;

  objc_sync_exit(v22);
  return 1;
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  id v22;
  TIUserModelDataStoreMock *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *obj;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v30 = a4;
  v29 = a5;
  v24 = self;
  objc_sync_enter(v24);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v24->_database;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v26 = (void *)v8;
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    v25 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        if (objc_msgSend(v12, "isMatchForKey:forInputMode:sinceDate:", v31, v30, v29))
        {
          v13 = objc_alloc(MEMORY[0x24BEB4ED0]);
          objc_msgSend(v12, "lastUpdateDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "key");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "inputMode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "secondaryValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "realValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "properties");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v13, "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v14, v15, v16, v17, v18, v19, v20);

          objc_msgSend(v26, "addObject:", v21);
          v9 = v27;
          v10 = v25;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v26, "count"))
    v22 = v26;
  else
    v22 = 0;

  objc_sync_exit(v24);
  return v22;
}

- (id)getDailyAndWeeklyValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  TIUserModelDataStoreMock *v25;
  void *v26;
  NSMutableArray *obj;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v25 = self;
  objc_sync_enter(v25);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v25->_database;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v26 = (void *)v10;
  if (v11)
  {
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v13, "isMatchForKeyPrefix:forInputMode:weeklyKeySuffixes:endDate:", v32, v31, v30, v29))
        {
          v14 = objc_alloc(MEMORY[0x24BEB4ED0]);
          objc_msgSend(v13, "lastUpdateDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "key");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "inputMode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "secondaryValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "realValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "properties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v14, "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v15, v16, v17, v18, v19, v20, v21);

          objc_msgSend(v26, "addObject:", v22);
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v26, "count"))
    v23 = v26;
  else
    v23 = 0;

  objc_sync_exit(v25);
  return v23;
}

- (id)getInputModesForKey:(id)a3
{
  id v4;
  TIUserModelDataStoreMock *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5->_database;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isMatchForKey:forInputMode:sinceDate:", v4, 0, 0, (_QWORD)v15))
        {
          objc_msgSend(v11, "inputMode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  objc_sync_exit(v5);
  return v13;
}

- (id)getAllKnownInputModes
{
  return -[TIUserModelDataStoreMock getAllKnownInputModesSinceDate:](self, "getAllKnownInputModesSinceDate:", 0);
}

- (id)getAllKnownInputModesSinceDate:(id)a3
{
  id v4;
  TIUserModelDataStoreMock *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5->_database;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isMatchSinceDate:", v4, (_QWORD)v15))
        {
          objc_msgSend(v11, "inputMode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  objc_sync_exit(v5);
  return v13;
}

- (id)getDurableValueForKey:(id)a3
{
  id v4;
  TIUserModelDataStoreMock *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_durableDatabase, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BEB4EC8]);
    objc_msgSend(v6, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastUpdateDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithCreationDate:withLastUpdateDate:withKey:withValue:", v8, v9, v4, v10);

  }
  else
  {
    v11 = 0;
  }

  objc_sync_exit(v5);
  return v11;
}

- (BOOL)setDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TIUserModelDataStoreMock *v11;
  TIMockUserModelDatabaseRow *v12;
  TIMockUserModelDatabaseRow *v13;
  TIMockUserModelDatabaseRow *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  -[NSMutableDictionary objectForKey:](v11->_durableDatabase, "objectForKey:", v9);
  v12 = (TIMockUserModelDatabaseRow *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    -[TIMockUserModelDatabaseRow setValue:](v12, "setValue:", v8);
    -[TIMockUserModelDatabaseRow setLastUpdateDate:](v13, "setLastUpdateDate:", v10);
  }
  else
  {
    v14 = [TIMockUserModelDatabaseRow alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TIMockUserModelDatabaseRow initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:](v14, "initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:", v9, CFSTR("foo"), v8, v15, v16, 0, v10, v10);

  }
  -[NSMutableDictionary setObject:forKey:](v11->_durableDatabase, "setObject:forKey:", v13, v9);

  objc_sync_exit(v11);
  return 1;
}

- (BOOL)updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TIUserModelDataStoreMock *v11;
  TIMockUserModelDatabaseRow *v12;
  TIMockUserModelDatabaseRow *v13;
  void *v14;
  void *v15;
  void *v16;
  TIMockUserModelDatabaseRow *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  -[NSMutableDictionary objectForKey:](v11->_durableDatabase, "objectForKey:", v9);
  v12 = (TIMockUserModelDatabaseRow *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[TIMockUserModelDatabaseRow value](v12, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v8, "intValue") + objc_msgSend(v15, "intValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMockUserModelDatabaseRow setValue:](v13, "setValue:", v16);

    -[TIMockUserModelDatabaseRow setLastUpdateDate:](v13, "setLastUpdateDate:", v10);
  }
  else
  {
    v17 = [TIMockUserModelDatabaseRow alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TIMockUserModelDatabaseRow initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:](v17, "initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:", v9, CFSTR("foo"), v8, v18, v19, 0, v10, v10);

  }
  -[NSMutableDictionary setObject:forKey:](v11->_durableDatabase, "setObject:forKey:", v13, v9);

  objc_sync_exit(v11);
  return 1;
}

- (id)getAllValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  TIUserModelDataStoreMock *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  TIUserModelDataStoreMock *v25;
  id v26;
  id v27;
  NSMutableArray *obj;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v24 = a4;
  v27 = a5;
  v8 = self;
  objc_sync_enter(v8);
  v25 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8->_database;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v29 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "hasPrefix:", v30))
        {
          objc_msgSend(v11, "creationDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "compare:", v27) == 1;

          if (!v14)
            continue;
          v15 = objc_alloc(MEMORY[0x24BEB4ED0]);
          objc_msgSend(v11, "lastUpdateDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "key");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "inputMode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "secondaryValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "realValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "properties");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v15, "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v16, v17, v18, v19, v20, v21, v22, v24);

          objc_msgSend(v26, "addObject:", v12);
        }

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v9);
  }

  objc_sync_exit(v25);
  return v26;
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 fromDate:(id)a5 toDate:(id)a6
{
  TIUserModelDataStoreMock *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  TIUserModelDataStoreMock *v31;
  id v32;
  NSMutableArray *obj;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v30 = a4;
  v37 = a5;
  v36 = a6;
  v10 = self;
  objc_sync_enter(v10);
  v31 = v10;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v10->_database;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v34 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "creationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "compare:", v37);

        objc_msgSend(v13, "creationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "compare:", v36);

        objc_msgSend(v13, "key");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v35);
        if (v15 == 1)
          v20 = v19;
        else
          v20 = 0;
        if (v20 == 1)
        {

          if ((unint64_t)(v17 + 1) >= 2)
            continue;
          v21 = objc_alloc(MEMORY[0x24BEB4ED0]);
          objc_msgSend(v13, "lastUpdateDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "key");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "inputMode");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "secondaryValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "realValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "properties");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v21, "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v22, v23, v24, v25, v26, v27, v28);

          objc_msgSend(v32, "addObject:", v18);
        }

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v11);
  }

  objc_sync_exit(v31);
  return v32;
}

- (void)clear
{
  NSMutableArray *v3;
  NSMutableArray *database;
  NSMutableDictionary *v5;
  NSMutableDictionary *durableDatabase;
  NSDate *v7;
  NSDate *propertiesLastMigrationDate;
  NSDate *v9;
  NSDate *durableLastMigrationDate;
  NSDate *v11;
  NSDate *transientLastMigrationDate;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  self->_database = v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  durableDatabase = self->_durableDatabase;
  self->_durableDatabase = v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  propertiesLastMigrationDate = self->_propertiesLastMigrationDate;
  self->_propertiesLastMigrationDate = v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  durableLastMigrationDate = self->_durableLastMigrationDate;
  self->_durableLastMigrationDate = v9;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  transientLastMigrationDate = self->_transientLastMigrationDate;
  self->_transientLastMigrationDate = v11;

}

- (NSDate)durableLastMigrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDurableLastMigrationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)durableVersion
{
  return self->_durableVersion;
}

- (NSDate)propertiesLastMigrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPropertiesLastMigrationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)propertiesVersion
{
  return self->_propertiesVersion;
}

- (NSDate)transientLastMigrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransientLastMigrationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int)transientVersion
{
  return self->_transientVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientLastMigrationDate, 0);
  objc_storeStrong((id *)&self->_propertiesLastMigrationDate, 0);
  objc_storeStrong((id *)&self->_durableLastMigrationDate, 0);
  objc_storeStrong((id *)&self->_durableDatabase, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
