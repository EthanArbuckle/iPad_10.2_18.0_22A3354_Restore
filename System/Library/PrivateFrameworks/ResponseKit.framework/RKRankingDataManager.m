@implementation RKRankingDataManager

- (RKRankingDataManager)initWithLanguageID:(id)a3
{
  id v4;
  RKRankingDataManager *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RKRankingDataManager;
  v5 = -[RKRankingDataManager init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/ResponseKit/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-learned.db"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[RKRankingDataManager initWithDatabaseFilename:](v5, "initWithDatabaseFilename:", v8);

  }
  return v5;
}

- (RKRankingDataManager)initWithDatabaseFilename:(id)a3
{
  id v4;
  RKRankingDataManager *v5;
  uint64_t v6;
  NSManagedObjectContext *managedObjectContext;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSPersistentStoreCoordinator *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSPersistentStore *persistentStore;
  RKRankingDataManager *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  objc_super v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)RKRankingDataManager;
  v5 = -[RKRankingDataManager init](&v27, sel_init);
  if (!v5)
    goto LABEL_8;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 2);
  managedObjectContext = v5->_managedObjectContext;
  v5->_managedObjectContext = (NSManagedObjectContext *)v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("RankingModel"), CFSTR("momd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      -[RKRankingDataManager initWithDatabaseFilename:].cold.1(v22, v23, v24);
    goto LABEL_14;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v9);
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[RKRankingDataManager initWithDatabaseFilename:].cold.3((uint64_t)v9, v11, v12);
  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", v10);
  persistentStoreCoordinator = v5->_persistentStoreCoordinator;
  v5->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v13;

  -[NSManagedObjectContext setPersistentStoreCoordinator:](v5->_managedObjectContext, "setPersistentStoreCoordinator:", v5->_persistentStoreCoordinator);
  v15 = v5->_persistentStoreCoordinator;
  v16 = *MEMORY[0x24BDBB580];
  v28 = *MEMORY[0x24BDBB550];
  v29[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v15, "addPersistentStoreWithType:configuration:URL:options:error:", v16, 0, v4, v17, &v26);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v26;
  persistentStore = v5->_persistentStore;
  v5->_persistentStore = (NSPersistentStore *)v18;

  if (!v5->_persistentStore)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RKRankingDataManager initWithDatabaseFilename:].cold.2(v19);

LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }

LABEL_8:
  v21 = v5;
LABEL_15:

  return v21;
}

- (void)insertRankingInfoFromDictionary:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[RKRankingDataManager insertRankingInfoFromDictionary:withDate:](self, "insertRankingInfoFromDictionary:withDate:", v5, v6);

}

- (void)insertRankingInfoFromDictionary:(id)a3 withDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = (void *)MEMORY[0x24BDBB658];
  v7 = a4;
  v8 = a3;
  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("RankingInfo"), v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMessage:", v10);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("response"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setResponse:", v11);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("source"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSource:", objc_msgSend(v12, "integerValue"));

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recipient"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRecipientId:", v13);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inputmethod"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInputMethod:", objc_msgSend(v14, "integerValue"));

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rankedlist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRankedList:", v15);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("category"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setCategory:", v16);
  objc_msgSend(v17, "setTimestamp:", v7);

  -[RKRankingDataManager flushRankingData](self, "flushRankingData");
}

- (id)fetchRankingInfoFromDB
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v9;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("RankingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v5)
  {
    v7 = v5;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RKRankingDataManager fetchRankingInfoFromDB].cold.1(v6);
  }

  return v5;
}

- (id)fetchRankingInfoForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Unknown")))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[RKRankingDataManager fetchRankingInfoForCategory:].cold.1();
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("RankingInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("category == %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);

    -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = 0;
    objc_msgSend(v8, "executeFetchRequest:error:", v6, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11[0];

    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[RKRankingDataManager fetchRankingInfoForCategory:].cold.2(v9);
      v5 = 0;
    }

  }
  return v5;
}

- (unint64_t)getNumberOfEntriesInDB
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  id v8;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("RankingInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "countForFetchRequest:error:", v3, &v8);
  v6 = v8;

  if (v5 == 0x7FFFFFFFFFFFFFFFLL && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[RKRankingDataManager fetchRankingInfoFromDB].cold.1(v6);

  return v5;
}

- (void)pruneUserDatabase
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
  id v13;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -7776000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("RankingInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("timestamp < %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v5);
  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = (id)objc_msgSend(v9, "executeRequest:withContext:error:", v7, v10, &v13);
  v12 = v13;

  if (v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[RKRankingDataManager fetchRankingInfoFromDB].cold.1(v12);

}

- (void)resetRankingData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("RankingInfo"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v3);
  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = (id)objc_msgSend(v6, "executeRequest:withContext:error:", v4, v7, &v10);
  v9 = v10;

  if (v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[RKRankingDataManager fetchRankingInfoFromDB].cold.1(v9);

}

- (void)flushRankingData
{
  void *v2;
  uint64_t v3;

  -[RKRankingDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  objc_msgSend(v2, "save:", &v3);

}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (NSPersistentStore)persistentStore
{
  return self->_persistentStore;
}

- (void)setPersistentStore:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (void)initWithDatabaseFilename:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_3(&dword_20D3BA000, MEMORY[0x24BDACB70], a3, "Failed to locate momd bundle in application : %@", (uint8_t *)&v3);
}

- (void)initWithDatabaseFilename:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20D3BA000, MEMORY[0x24BDACB70], v3, "Failed to initalize persistent store: %@\n%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDatabaseFilename:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_20D3BA000, MEMORY[0x24BDACB70], a3, "Failed to initialize mom from URL: %@", (uint8_t *)&v3);
}

- (void)fetchRankingInfoFromDB
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20D3BA000, MEMORY[0x24BDACB70], v3, "Error fetching RankingInfo objects: %@\n%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)fetchRankingInfoForCategory:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_20D3BA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Category is marked as Unknown, cannot fetch messages", v0, 2u);
}

- (void)fetchRankingInfoForCategory:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_20D3BA000, MEMORY[0x24BDACB70], v3, "Error fetching RankingInfo objects: %@\n%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)fetchRankingInfoForCategory:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_20D3BA000, MEMORY[0x24BDACB70], a3, "Exception on fetching RankingInfo objects: %@\n", (uint8_t *)a2);

}

@end
