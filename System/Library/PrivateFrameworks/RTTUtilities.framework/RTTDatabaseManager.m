@implementation RTTDatabaseManager

void __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TTYContactList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("contactID = %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  a1 += 56;
  v6 = *(_QWORD *)(v5 + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40))
  {
    AXLogRTT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke_cold_1();

  }
}

- (BOOL)contactPathWasUsedForTTY:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  RTTDatabaseManager *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke;
  v12 = &unk_24D204410;
  v6 = v4;
  v13 = v6;
  v14 = self;
  v15 = &v17;
  v16 = &v23;
  objc_msgSend(v5, "performBlockAndWait:", &v9);

  if (objc_msgSend((id)v18[5], "count", v9, v10, v11, v12))
    v7 = v24[5] == 0;
  else
    v7 = 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v7;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_5);
  return (id)sharedManager_Manager;
}

void __35__RTTDatabaseManager_sharedManager__block_invoke()
{
  RTTDatabaseManager *v0;
  void *v1;

  v0 = objc_alloc_init(RTTDatabaseManager);
  v1 = (void *)sharedManager_Manager;
  sharedManager_Manager = (uint64_t)v0;

}

- (RTTDatabaseManager)init
{
  RTTDatabaseManager *v2;
  void *v3;
  CHManager *v4;
  CHManager *callHistoryManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTTDatabaseManager;
  v2 = -[HCDatabaseManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_callHistoryDBDidChange_, *MEMORY[0x24BE149E0], 0);

    v4 = (CHManager *)objc_alloc_init(MEMORY[0x24BE14930]);
    callHistoryManager = v2->_callHistoryManager;
    v2->_callHistoryManager = v4;

    -[RTTDatabaseManager callHistoryDBDidChange:](v2, "callHistoryDBDidChange:", 0);
  }
  return v2;
}

- (id)managedObjectModelName
{
  return CFSTR("TTYDBModel");
}

- (id)cloudKitContainer
{
  return CFSTR("com.apple.RTTTranscripts");
}

- (id)containerIdentifier
{
  return CFSTR("com.apple.accessibility.RTTTranscripts");
}

- (void)logMessage:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)callHistoryDBDidChange:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t __45__RTTDatabaseManager_callHistoryDBDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callHistoryDBDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)_callHistoryDBDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  RTTDatabaseManager *v17;
  id v18;
  _QWORD v19[6];
  uint8_t v20[4];
  id v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_21473C000, v5, OS_LOG_TYPE_INFO, "Call history changed: %@", (uint8_t *)&buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x2199D46B8]();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke;
  v19[3] = &unk_24D2043C0;
  v19[4] = self;
  v19[5] = &buf;
  objc_msgSend(v7, "performBlockAndWait:", v19);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v13 = v8;
  v14 = 3221225472;
  v15 = __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_2;
  v16 = &unk_24D2043E8;
  v17 = self;
  v11 = v9;
  v18 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v13);
  AXLogRTT();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v20 = 138412290;
    v21 = v11;
    _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Deleting %@", v20, 0xCu);
  }

  -[RTTDatabaseManager deleteConversationsWithCallUIDs:](self, "deleteConversationsWithCallUIDs:", v11, v13, v14, v15, v16, v17);
  _Block_object_dispose(&buf, 8);

  objc_autoreleasePoolPop(v6);
}

void __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TTYContactList"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeFetchRequest:error:", v6, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  BOOL v14;
  int v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v5 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v3, "callUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("uniqueId == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentCallsWithPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_3;
  v19[3] = &unk_24D2043C0;
  v21 = &v22;
  v9 = v3;
  v20 = v9;
  +[RTTTelephonyUtilities performCallCenterTask:](RTTTelephonyUtilities, "performCallCenterTask:", v19);
  AXLogRTT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v23[5];
    *(_DWORD *)buf = 138412546;
    v29 = v8;
    v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_21473C000, v10, OS_LOG_TYPE_INFO, "Recent calls: %@/TU Call %@", buf, 0x16u);
  }

  v12 = objc_msgSend((id)v23[5], "status");
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "callUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
      v14 = v12 == 1;
    else
      v14 = 1;
    v16 = !v14 && v12 != 2;

    if (v16)
    {
      v17 = *(void **)(a1 + 40);
      objc_msgSend(v9, "callUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

    }
  }

  _Block_object_dispose(&v22, 8);
}

void __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[RTTTelephonyUtilities sharedCallCenter](RTTTelephonyUtilities, "sharedCallCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callWithCallUUID:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)conversationForCallUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  id obj;
  _QWORD v26[4];
  id v27;
  RTTDatabaseManager *v28;
  _BYTE *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  v5 = (void *)MEMORY[0x2199D46B8]();
  *(_QWORD *)v41 = 0;
  *(_QWORD *)&v41[8] = v41;
  *(_QWORD *)&v41[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__2;
  v43 = __Block_byref_object_dispose__2;
  v44 = 0;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __45__RTTDatabaseManager_conversationForCallUID___block_invoke;
  v26[3] = &unk_24D204410;
  v7 = v4;
  v27 = v7;
  v28 = self;
  v29 = v41;
  v30 = &v31;
  objc_msgSend(v6, "performBlockAndWait:", v26);

  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(*(_QWORD *)&v41[8] + 40);
    v10 = v32[5];
    *(_DWORD *)buf = 138412546;
    v38 = v9;
    v39 = 2112;
    v40 = v10;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Conversation for call UID result: %@/%@", buf, 0x16u);
  }

  if (v32[5])
  {
    AXLogRTT();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RTTDatabaseManager conversationForCallUID:].cold.4();
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "count") >= 2)
  {
    AXLogRTT();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[RTTDatabaseManager conversationForCallUID:].cold.3();

  }
  objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "lastObject");
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSObject data](v11, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_16;
  -[NSObject version](v11, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToNumber:", &unk_24D209D58);

  if (!v15)
    goto LABEL_16;
  v16 = objc_alloc(MEMORY[0x24BDD1620]);
  -[NSObject data](v11, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id *)(v32 + 5);
  obj = (id)v32[5];
  v19 = (void *)objc_msgSend(v16, "initForReadingFromData:error:", v17, &obj);
  objc_storeStrong(v18, obj);

  if (v32[5])
  {
    AXLogRTT();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[RTTDatabaseManager conversationForCallUID:].cold.2();

    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "decodeObjectOfClasses:forKey:", v24, *MEMORY[0x24BDD0E88]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_17:

  _Block_object_dispose(v41, 8);
  objc_autoreleasePoolPop(v5);
  AXLogRTT();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v41 = 138412546;
    *(_QWORD *)&v41[4] = v7;
    *(_WORD *)&v41[12] = 2112;
    *(_QWORD *)&v41[14] = v21;
    _os_log_impl(&dword_21473C000, v22, OS_LOG_TYPE_INFO, "Found conversation for id [%@] - %@", v41, 0x16u);
  }

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __45__RTTDatabaseManager_conversationForCallUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TTYHistory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("callUID = %@"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)saveConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v29[4];
  id v30;
  RTTDatabaseManager *v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  RTTDatabaseManager *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__2;
    v48 = __Block_byref_object_dispose__2;
    v49 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "encodeObject:forKey:", v4, *MEMORY[0x24BDD0E88]);
    objc_msgSend(v6, "finishEncoding");
    objc_msgSend(v6, "encodedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__2;
      v42 = __Block_byref_object_dispose__2;
      v43 = 0;
      -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __39__RTTDatabaseManager_saveConversation___block_invoke;
      v33[3] = &unk_24D204410;
      v9 = v4;
      v34 = v9;
      v35 = self;
      v36 = &v38;
      v37 = &v44;
      objc_msgSend(v8, "performBlockAndWait:", v33);

      objc_msgSend((id)v39[5], "lastObject");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10 && !v45[5])
      {
        v14 = (void *)v10;
      }
      else
      {
        v12 = (void *)MEMORY[0x24BDBB658];
        -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("TTYHistory"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "callIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCallUID:", v15);

      }
      objc_msgSend(v14, "setVersion:", &unk_24D209D58);
      objc_msgSend(v14, "setData:", v7);
      objc_msgSend(v14, "setNeedsCloudKitUpload:", MEMORY[0x24BDBD1C8]);

      _Block_object_dispose(&v38, 8);
      v38 = 0;
      v39 = &v38;
      v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__2;
      v42 = __Block_byref_object_dispose__2;
      v43 = 0;
      -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __39__RTTDatabaseManager_saveConversation___block_invoke_34;
      v29[3] = &unk_24D204438;
      v18 = v9;
      v31 = self;
      v32 = &v38;
      v30 = v18;
      objc_msgSend(v17, "performBlockAndWait:", v29);

      objc_msgSend((id)v39[5], "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        objc_msgSend(v18, "otherContactPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length") == 0;

        if (!v21)
        {
          v22 = (void *)MEMORY[0x24BDBB658];
          -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("TTYContactList"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "callIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setCallUID:", v25);

          objc_msgSend(v18, "otherContactPath");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setContactID:", v26);

        }
      }
      LODWORD(self) = -[HCDatabaseManager saveIfPossible](self, "saveIfPossible");
      AXLogRTT();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v51 = (int)self;
        v52 = 2112;
        v53 = v18;
        _os_log_impl(&dword_21473C000, v27, OS_LOG_TYPE_INFO, "Saved to database[%d]: %@", buf, 0x12u);
      }

      _Block_object_dispose(&v38, 8);
    }
    else
    {
      AXLogRTT();
      self = (RTTDatabaseManager *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR))
        -[RTTDatabaseManager saveConversation:].cold.2();

      LOBYTE(self) = 0;
    }

    _Block_object_dispose(&v44, 8);
  }
  else
  {
    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[RTTDatabaseManager saveConversation:].cold.1();

    LOBYTE(self) = 0;
  }

  return (char)self;
}

void __39__RTTDatabaseManager_saveConversation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TTYHistory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(*(id *)(a1 + 32), "callIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("callUID = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __39__RTTDatabaseManager_saveConversation___block_invoke_34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TTYContactList"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(*(id *)(a1 + 32), "callIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("callUID = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v4);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeFetchRequest:error:", v9, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)deleteConversationsWithCallUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  RTTDatabaseManager *v13;

  v4 = a3;
  -[HCDatabaseManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke;
  v11 = &unk_24D203A08;
  v12 = v4;
  v13 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", &v8);

  LOBYTE(self) = -[HCDatabaseManager saveIfPossible](self, "saveIfPossible", v8, v9, v10, v11);
  return (char)self;
}

void __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[6];
  _QWORD v3[5];
  id v4;

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy__2;
  v3[4] = __Block_byref_object_dispose__2;
  v4 = 0;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke_2;
  v2[3] = &unk_24D204460;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v2[5] = v3;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);
  _Block_object_dispose(v3, 8);

}

void __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TTYHistory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("callUID = %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);

  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteObject:", v9);

  }
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TTYContactList"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("callUID = %@"), v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(id *)(v14 + 40);
  objc_msgSend(v13, "executeFetchRequest:error:", v11, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v14 + 40), v18);

  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deleteObject:", v16);

  }
}

- (BOOL)deleteConversationWithCallUID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[RTTDatabaseManager deleteConversationsWithCallUIDs:](self, "deleteConversationsWithCallUIDs:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)contactIDIsTTYContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBACA0];
  v19[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForContactsWithIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDBA348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke;
  v13[3] = &unk_24D2044B0;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

  LOBYTE(v5) = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return (char)v5;
}

void __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  objc_msgSend(a2, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke_2;
  v7[3] = &unk_24D204488;
  v8 = *(_OWORD *)(a1 + 32);
  v9 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  _BYTE *v9;

  v6 = (void *)a1[4];
  objc_msgSend(a2, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "contactPathWasUsedForTTY:", v8);

  if ((_DWORD)v6)
  {
    v9 = (_BYTE *)a1[6];
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
    *v9 = 1;
  }
}

- (BOOL)contactIsTTYContact:(id)a3
{
  void *v4;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RTTDatabaseManager contactIDIsTTYContact:](self, "contactIDIsTTYContact:", v4);

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
}

- (void)conversationForCallUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Failed to create unarchiver with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)conversationForCallUID:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_2_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_21473C000, v0, OS_LOG_TYPE_FAULT, "We had two callUID results, %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)conversationForCallUID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Failed TTYHistory fetch %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveConversation:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_21473C000, v1, OS_LOG_TYPE_ERROR, "Not saving convo because no object: %@, %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)saveConversation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Not saving conversation because dataBlock was empty: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveConversation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Exception encoding data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_21473C000, v0, v1, "Contact path TTY error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
