@implementation SKADatabaseManager

- (SKADatabaseManager)initWithDatabaseProvider:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SKADatabaseManager *v9;
  SKADatabaseManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKADatabaseManager;
  v9 = -[SKADatabaseManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseProvider, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (id)newBackgroundContext
{
  return (id)-[SKADatabaseProviding newBackgroundContext](self->_databaseProvider, "newBackgroundContext");
}

- (void)hasInitialCloudKitImportOccurred:(id)a3
{
  -[SKADatabaseProviding hasInitialCloudKitImportOccurred:](self->_databaseProvider, "hasInitialCloudKitImportOccurred:", a3);
}

- (id)existingPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__SKADatabaseManager_existingPersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke;
  v12[3] = &unk_24D977B50;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __85__SKADatabaseManager_existingPersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  SKADatabaseChannel *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForStatusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [SKADatabaseChannel alloc];
    v8[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SKADatabaseChannel initWithCoreDataChannels:](v3, "initWithCoreDataChannels:", v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)_existingPersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  void *v32;
  _QWORD v33[6];

  v33[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26 = a4;
  +[Channel fetchRequest](Channel, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD14C0];
  v25 = v5;
  +[Channel predicateForStatusTypeIdentifier:](Channel, "predicateForStatusTypeIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v8;
  +[Channel predicateForPersonal:](Channel, "predicateForPersonal:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v9;
  +[Channel predicateForDecomissioned:](Channel, "predicateForDecomissioned:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v10;
  +[Channel predicateForChannelTypeStatus](Channel, "predicateForChannelTypeStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v11;
  +[Channel predicateForCreationDateNotNil](Channel, "predicateForCreationDateNotNil");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v14);

  +[Channel sortDescriptorForCreationDateAscending:](Channel, "sortDescriptorForCreationDateAscending:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v16);

  objc_msgSend(v6, "setFetchLimit:", 1);
  v27 = 0;
  objc_msgSend(v26, "executeFetchRequest:error:", v6, &v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v27;
  if (v18)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingPersonalChannelForStatusTypeIdentifier:databaseContext:].cold.1();
    v20 = 0;
    v21 = v25;
  }
  else
  {
    objc_msgSend(v17, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    v21 = v25;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject identifier](v19, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v25;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Fetch request for personal status channel type \"%@\" completed with result: %@", buf, 0x16u);

    }
    if (v19)
    {
      v19 = v19;
      v20 = v19;
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (id)_existingDecomissionedPersonalChannelsWithDatabaseContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[Channel fetchRequest](Channel, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD14C0];
  +[Channel predicateForPersonal:](Channel, "predicateForPersonal:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  +[Channel predicateForDecomissioned:](Channel, "predicateForDecomissioned:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  +[Channel predicateForChannelTypeStatus](Channel, "predicateForChannelTypeStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v10);

  +[Channel sortDescriptorForCreationDateAscending:](Channel, "sortDescriptorForCreationDateAscending:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v12);

  v20 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v20;
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingDecomissionedPersonalChannelsWithDatabaseContext:].cold.1();

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v22 = v18;
      _os_log_impl(&dword_2188DF000, v16, OS_LOG_TYPE_DEFAULT, "Fetch request for decomissioned personal channels completed with %lu results", buf, 0xCu);
    }

    if (v13)
    {
      v17 = v13;
      goto LABEL_10;
    }
  }
  v17 = 0;
LABEL_10:

  return v17;
}

- (id)_existingPersonalChannelsForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  void *v32;
  _QWORD v33[6];

  v33[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[Channel fetchRequest](Channel, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD14C0];
  v26 = v5;
  +[Channel predicateForStatusTypeIdentifier:](Channel, "predicateForStatusTypeIdentifier:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v9;
  +[Channel predicateForPersonal:](Channel, "predicateForPersonal:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v10;
  +[Channel predicateForDecomissioned:](Channel, "predicateForDecomissioned:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v11;
  +[Channel predicateForChannelTypeStatus](Channel, "predicateForChannelTypeStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v12;
  +[Channel predicateForCreationDateNotNil](Channel, "predicateForCreationDateNotNil");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v15);

  +[Channel sortDescriptorForCreationDateAscending:](Channel, "sortDescriptorForCreationDateAscending:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v17);

  v27 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v27;
  if (v19)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingPersonalChannelForStatusTypeIdentifier:databaseContext:].cold.1();
    v21 = 0;
    v22 = v26;
  }
  else
  {
    objc_msgSend(v18, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    v22 = v26;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject identifier](v20, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v26;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_2188DF000, v23, OS_LOG_TYPE_DEFAULT, "Fetch request for personal status channel type \"%@\" completed with result: %@", buf, 0x16u);

    }
    if (v20)
      v21 = (void *)objc_msgSend(v18, "copy");
    else
      v21 = 0;
  }

  return v21;
}

- (BOOL)deletePersonalChannelForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_24D977B50;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  char v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForStatusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v2);
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Deleted existing channel.", v5, 2u);
    }
    v4 = 1;
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke_cold_1();
    v4 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
}

- (id)existingChannelForSubscriptionIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__SKADatabaseManager_existingChannelForSubscriptionIdentifier_databaseContext___block_invoke;
  v12[3] = &unk_24D977B50;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __79__SKADatabaseManager_existingChannelForSubscriptionIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  SKADatabaseChannel *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_existingChannelsForChannelIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v2 = -[SKADatabaseChannel initWithCoreDataChannels:]([SKADatabaseChannel alloc], "initWithCoreDataChannels:", v5);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)existingChannelForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__SKADatabaseManager_existingChannelForPresenceIdentifier_isPersonal_databaseContext___block_invoke;
  v14[3] = &unk_24D977B78;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  v18 = a4;
  v11 = v9;
  v16 = v11;
  v17 = &v19;
  objc_msgSend(v11, "performBlockAndWait:", v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __86__SKADatabaseManager_existingChannelForPresenceIdentifier_isPersonal_databaseContext___block_invoke(uint64_t a1)
{
  SKADatabaseChannel *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_existingChannelsForPresenceIdentifier:isPersonal:databaseContext:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v2 = -[SKADatabaseChannel initWithCoreDataChannels:]([SKADatabaseChannel alloc], "initWithCoreDataChannels:", v5);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)_existingChannelsForDatabaseChannel:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isPersonal");

  -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:](self, "_existingChannelsForChannelIdentifier:isPersonal:databaseContext:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_existingPersonalChannelForDatabaseChannel:(id)a3 databaseContext:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  -[SKADatabaseManager _existingChannelsForDatabaseChannel:databaseContext:](self, "_existingChannelsForDatabaseChannel:databaseContext:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[SKADatabaseManager _existingPersonalChannelForDatabaseChannel:databaseContext:].cold.1(v6, v8);

  }
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_existingChannelsForChannelIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  _QWORD v23[3];

  v6 = a4;
  v23[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  +[Channel fetchRequest](Channel, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD14C0];
  +[Channel predicateForChannelIdentifier:](Channel, "predicateForChannelIdentifier:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  +[Channel predicateForPersonal:](Channel, "predicateForPersonal:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v14);

  v20 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v20;
  if (v16)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:].cold.2();

  }
  if (!v15)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:].cold.1();
    v15 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_12;
  }
  if (!objc_msgSend(v15, "count"))
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by identifier %@ found no match.", buf, 0xCu);
    }
LABEL_12:

  }
  return v15;
}

- (id)_existingChannelsForChannelIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[Channel fetchRequest](Channel, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD14C0];
  +[Channel predicateForChannelIdentifier:](Channel, "predicateForChannelIdentifier:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v11);

  v17 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v17;
  if (v13)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:].cold.2();

  }
  if (!v12)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:databaseContext:].cold.1();
    v12 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_12;
  }
  if (!objc_msgSend(v12, "count"))
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by identifier %@ found no match.", buf, 0xCu);
    }
LABEL_12:

  }
  return v12;
}

- (id)_existingChannelsForPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4 databaseContext:(id)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  void *v37;
  _QWORD v38[6];

  v6 = a4;
  v38[5] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v33 = a5;
  +[Channel fetchRequest](Channel, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD14C0];
  +[Channel predicateForPresenceIdentifier:](Channel, "predicateForPresenceIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v10;
  +[Channel predicateForDecomissioned:](Channel, "predicateForDecomissioned:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v11;
  +[Channel predicateForChannelTypePresence](Channel, "predicateForChannelTypePresence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v12;
  +[Channel predicateForPersonal:](Channel, "predicateForPersonal:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v13;
  +[Channel predicateForCreationDateNotNil](Channel, "predicateForCreationDateNotNil");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v16);

  v17 = v8;
  +[Channel sortDescriptorForCreationDateAscending:](Channel, "sortDescriptorForCreationDateAscending:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v18;
  v19 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSortDescriptors:", v20);

  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = (uint64_t)v7;
    _os_log_impl(&dword_2188DF000, v21, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for channels with presence identifier: %@", buf, 0xCu);
  }

  v34 = 0;
  objc_msgSend(v33, "executeFetchRequest:error:", v17, &v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v34;
  if (v23)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:].cold.2();

  }
  if (v22)
  {
    v25 = objc_msgSend(v22, "count");
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        v28 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 134217984;
        v36 = v28;
        v29 = "Fetch request for channel by identifier completed with %ld result(s)";
        v30 = v26;
        v31 = 12;
LABEL_16:
        _os_log_impl(&dword_2188DF000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
    else if (v27)
    {
      *(_WORD *)buf = 0;
      v29 = "Fetch request for channel by identifier found no match.";
      v30 = v26;
      v31 = 2;
      goto LABEL_16;
    }
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelsForChannelIdentifier:isPersonal:databaseContext:].cold.1();
    v22 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v22;
}

- (id)existingChannelForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  SKADatabaseChannel *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingReceivedInvitationsForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "invitationIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senderHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412802;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      v21 = 2048;
      v22 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Preferring invitation %@ from %@ among %ld result(s)", (uint8_t *)&v17, 0x20u);
    }

    objc_msgSend(v4, "channel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = -[NSObject length](v9, "length");
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412546;
        v18 = v5;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Invitation %@ corresponds to channelIdentifier: %@", (uint8_t *)&v17, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_existingChannelsForChannelIdentifier:databaseContext:", v9, *(_QWORD *)(a1 + 56));
      v12 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v12, "count"))
      {
        v13 = -[SKADatabaseChannel initWithCoreDataChannels:]([SKADatabaseChannel alloc], "initWithCoreDataChannels:", v12);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v15 = *(NSObject **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;
      }
      else
      {
        +[SKADatabaseManager logger](SKADatabaseManager, "logger");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2();
      }

    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1();
    }

    goto LABEL_17;
  }
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "handleString");
    v6 = objc_claimAutoreleasedReturnValue();
    v16 = *(NSObject **)(a1 + 48);
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "No received invitation found matching handle %@ statusTypeIdentifier: %@", (uint8_t *)&v17, 0x16u);
LABEL_17:

  }
}

- (id)allExistingChannelsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __88__SKADatabaseManager_allExistingChannelsForHandle_statusTypeIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (void *)objc_msgSend((id)v22[5], "copy");

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __88__SKADatabaseManager_allExistingChannelsForHandle_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  SKADatabaseChannel *v21;
  void *context;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingReceivedInvitationsForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  context = (void *)MEMORY[0x219A1D444]();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "channel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "refreshObject:mergeChanges:", v9, 0);
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v3, "addObject:", v11);
        }
        else
        {
          +[SKADatabaseManager logger](SKADatabaseManager, "logger");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v33 = v9;
            v34 = 2112;
            v35 = v13;
            _os_log_error_impl(&dword_2188DF000, v12, OS_LOG_TYPE_ERROR, "Invitation does not correspond to any channel. ReceivedInvitation: %@ handle: %@", buf, 0x16u);
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "_existingChannelsForChannelIdentifier:databaseContext:", v19, *(_QWORD *)(a1 + 56));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          v21 = -[SKADatabaseChannel initWithCoreDataChannels:]([SKADatabaseChannel alloc], "initWithCoreDataChannels:", v20);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v21);
        }
        else
        {
          +[SKADatabaseManager logger](SKADatabaseManager, "logger");
          v21 = (SKADatabaseChannel *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v19;
            _os_log_error_impl(&dword_2188DF000, &v21->super, OS_LOG_TYPE_ERROR, "Channel not found for channel identifier: %@", buf, 0xCu);
          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(context);
}

- (id)allExistingChannelsForStatusTypeIdentifier:(id)a3 includingPersonalChannel:(BOOL)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke;
  v16 = &unk_24D977BC8;
  v9 = v7;
  v17 = v9;
  v20 = a4;
  v10 = v8;
  v18 = v10;
  v19 = &v21;
  objc_msgSend(v10, "performBlockAndWait:", &v13);
  v11 = (void *)objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  SKADatabaseChannel *v32;
  void *context;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  _QWORD v51[5];

  v51[3] = *MEMORY[0x24BDAC8D0];
  +[Channel fetchRequest](Channel, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[Channel predicateForStatusTypeIdentifier:](Channel, "predicateForStatusTypeIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (!*(_BYTE *)(a1 + 56))
  {
    +[Channel predicateForPersonal:](Channel, "predicateForPersonal:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
    objc_msgSend(v3, "firstObject");
  else
    objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v6);
  +[Channel sortDescriptorForStatusTypeIdentifierOrderedAscending:](Channel, "sortDescriptorForStatusTypeIdentifierOrderedAscending:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v7;
  +[Channel sortDescriptorForPersonalOrderedAscending:](Channel, "sortDescriptorForPersonalOrderedAscending:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v8;
  +[Channel sortDescriptorForChannelIdentifierOrderedAscending:](Channel, "sortDescriptorForChannelIdentifierOrderedAscending:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v10);

  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for channel by handle", buf, 2u);
  }

  v12 = *(void **)(a1 + 40);
  v46 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v2, &v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v46;
  if (v14)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke_cold_1();
  }
  else
  {
    v16 = objc_msgSend(v13, "count");
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      v35 = v6;
      v36 = v3;
      v37 = v2;
      if (v17)
      {
        v18 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 134217984;
        v50 = v18;
        _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by handle completed with %ld result(s)", buf, 0xCu);
      }

      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      context = (void *)MEMORY[0x219A1D444]();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v34 = v13;
      v19 = v13;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v43 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v24, "identifier", context);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "length"))
            {
              -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v25);
              v26 = (id)objc_claimAutoreleasedReturnValue();
              if (!v26)
              {
                v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v26, v25);
              }
              objc_msgSend(v26, "addObject:", v24);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v21);
      }

      objc_autoreleasePoolPop(context);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[NSObject allValues](v15, "allValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      v6 = v35;
      v14 = 0;
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(v27);
            v32 = -[SKADatabaseChannel initWithCoreDataChannels:]([SKADatabaseChannel alloc], "initWithCoreDataChannels:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v29);
      }

      v3 = v36;
      v2 = v37;
      v13 = v34;
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v15, OS_LOG_TYPE_DEFAULT, "Fetch request for channel by handle found no match.", buf, 2u);
    }
  }

}

- (id)createPersonalChannelForStatusTypeIdentifier:(id)a3 channelIdentifier:(id)a4 channelToken:(id)a5 databaseContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v32 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke;
  v21[3] = &unk_24D977BA0;
  v14 = v13;
  v22 = v14;
  v15 = v10;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  v17 = v12;
  v25 = v17;
  v26 = &v27;
  objc_msgSend(v14, "performBlockAndWait:", v21);
  -[SKADatabaseManager delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "databaseManager:didCreateChannel:", self, v28[5]);

  v19 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v19;
}

void __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke(_QWORD *a1)
{
  Channel *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  SKADatabaseChannel *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[Channel initWithContext:]([Channel alloc], "initWithContext:", a1[4]);
  -[Channel setStatusType:](v2, "setStatusType:", a1[5]);
  -[Channel setChannelType:](v2, "setChannelType:", 0);
  -[Channel setDecomissioned:](v2, "setDecomissioned:", 0);
  -[Channel setPersonal:](v2, "setPersonal:", 1);
  -[Channel setIdentifier:](v2, "setIdentifier:", a1[6]);
  -[Channel setChannelToken:](v2, "setChannelToken:", a1[7]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[Channel setDateChannelCreated:](v2, "setDateChannelCreated:", v3);
  v4 = (void *)a1[4];
  v12 = 0;
  objc_msgSend(v4, "save:", &v12);
  v5 = v12;
  if (v5)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke_cold_1();

  }
  v7 = [SKADatabaseChannel alloc];
  v13[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKADatabaseChannel initWithCoreDataChannels:](v7, "initWithCoreDataChannels:", v8);
  v10 = *(_QWORD *)(a1[8] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)createPresenceChannelForPresenceIdentifier:(id)a3 channelIdentifier:(id)a4 channelToken:(id)a5 peerKey:(id)a6 serverKey:(id)a7 membershipKey:(id)a8 creationDate:(id)a9 options:(id)a10 databaseContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SKADatabaseManager *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v37 = a7;
  v38 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = self;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__2;
  v54 = __Block_byref_object_dispose__2;
  v55 = 0;
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke;
  v39[3] = &unk_24D977BF0;
  v25 = v23;
  v40 = v25;
  v36 = v17;
  v41 = v36;
  v26 = v18;
  v42 = v26;
  v27 = v19;
  v43 = v27;
  v28 = v21;
  v44 = v28;
  v29 = v20;
  v45 = v29;
  v30 = v37;
  v46 = v30;
  v31 = v38;
  v47 = v31;
  v32 = v22;
  v48 = v32;
  v49 = &v50;
  objc_msgSend(v25, "performBlockAndWait:", v39);
  -[SKADatabaseManager delegate](v24, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "databaseManager:didCreateChannel:", v24, v51[5]);

  v34 = (id)v51[5];
  _Block_object_dispose(&v50, 8);

  return v34;
}

void __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke(uint64_t a1)
{
  Channel *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  SKADatabaseChannel *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[Channel initWithContext:]([Channel alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  -[Channel setPresenceIdentifier:](v2, "setPresenceIdentifier:", *(_QWORD *)(a1 + 40));
  -[Channel setChannelType:](v2, "setChannelType:", 1);
  -[Channel setDecomissioned:](v2, "setDecomissioned:", 0);
  -[Channel setIdentifier:](v2, "setIdentifier:", *(_QWORD *)(a1 + 48));
  -[Channel setChannelToken:](v2, "setChannelToken:", *(_QWORD *)(a1 + 56));
  -[Channel setDateChannelCreated:](v2, "setDateChannelCreated:", *(_QWORD *)(a1 + 64));
  -[Channel setPeerKey:](v2, "setPeerKey:", *(_QWORD *)(a1 + 72));
  -[Channel setServerKey:](v2, "setServerKey:", *(_QWORD *)(a1 + 80));
  -[Channel setMembershipKey:](v2, "setMembershipKey:", *(_QWORD *)(a1 + 88));
  -[Channel setPersonal:](v2, "setPersonal:", objc_msgSend(*(id *)(a1 + 96), "isPersonal"));
  objc_msgSend(*(id *)(a1 + 96), "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[Channel setServiceIdentifier:](v2, "setServiceIdentifier:", v3);

  v4 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v4, "save:", &v12);
  v5 = v12;
  if (v5)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke_cold_1();

  }
  v7 = [SKADatabaseChannel alloc];
  v13[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKADatabaseChannel initWithCoreDataChannels:](v7, "initWithCoreDataChannels:", v8);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)createChannelForStatusTypeIdentifier:(id)a3 channelIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *);
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke;
  v20 = &unk_24D977B50;
  v11 = v10;
  v21 = v11;
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  v24 = &v25;
  objc_msgSend(v11, "performBlockAndWait:", &v17);
  -[SKADatabaseManager delegate](self, "delegate", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseManager:didCreateChannel:", self, v26[5]);

  v15 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke(_QWORD *a1)
{
  Channel *v2;
  void *v3;
  id v4;
  NSObject *v5;
  SKADatabaseChannel *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[Channel initWithContext:]([Channel alloc], "initWithContext:", a1[4]);
  -[Channel setStatusType:](v2, "setStatusType:", a1[5]);
  -[Channel setChannelType:](v2, "setChannelType:", 0);
  -[Channel setPersonal:](v2, "setPersonal:", 0);
  -[Channel setDecomissioned:](v2, "setDecomissioned:", 0);
  -[Channel setIdentifier:](v2, "setIdentifier:", a1[6]);
  v3 = (void *)a1[4];
  v11 = 0;
  objc_msgSend(v3, "save:", &v11);
  v4 = v11;
  if (v4)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke_cold_1();

  }
  v6 = [SKADatabaseChannel alloc];
  v12[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SKADatabaseChannel initWithCoreDataChannels:](v6, "initWithCoreDataChannels:", v7);
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)updatePersonalChannel:(id)a3 withCurrentOutgoingRatchetState:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  SKADatabaseChannel *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentOutgoingRatchetState:", *(_QWORD *)(a1 + 56));
  v3 = *(void **)(a1 + 48);
  v11 = 0;
  objc_msgSend(v3, "save:", &v11);
  v4 = v11;
  if (v4)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke_cold_1();

  }
  v6 = [SKADatabaseChannel alloc];
  v12[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SKADatabaseChannel initWithCoreDataChannels:](v6, "initWithCoreDataChannels:", v7);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (BOOL)decomissionAllPersonalChannelsWithStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_24D977B50;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelsForStatusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "setDecomissioned:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  v7 = *(void **)(a1 + 48);
  v10 = 0;
  objc_msgSend(v7, "save:", &v10);
  v8 = v10;
  if (v8)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (BOOL)decomissionChannelWithIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__SKADatabaseManager_decomissionChannelWithIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_24D977B50;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __71__SKADatabaseManager_decomissionChannelWithIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingChannelsForChannelIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "setDecomissioned:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  v7 = *(void **)(a1 + 48);
  v10 = 0;
  objc_msgSend(v7, "save:", &v10);
  v8 = v10;
  if (v8)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (id)createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState:(id)a3 personalChannel:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __115__SKADatabaseManager_createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState_personalChannel_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v8;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __115__SKADatabaseManager_createGeneratedEncryptionKeyWithOriginalOutgoingRatchetState_personalChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  GeneratedEncryptionKey *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  SKAGeneratedEncryptionKey *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentOutgoingRatchetState:", *(_QWORD *)(a1 + 56));
  v3 = -[GeneratedEncryptionKey initWithContext:]([GeneratedEncryptionKey alloc], "initWithContext:", *(_QWORD *)(a1 + 48));
  -[GeneratedEncryptionKey setOriginalOutgoingRatchetState:](v3, "setOriginalOutgoingRatchetState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GeneratedEncryptionKey setDateGenerated:](v3, "setDateGenerated:", v4);

  objc_msgSend(v2, "addGeneratedEncryptionKeysObject:", v3);
  v5 = *(void **)(a1 + 48);
  v11 = 0;
  objc_msgSend(v5, "save:", &v11);
  v6 = v11;
  if (v6)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke_cold_1();

  }
  v8 = -[SKAGeneratedEncryptionKey initWithCoreDataGeneratedEncryptionKey:]([SKAGeneratedEncryptionKey alloc], "initWithCoreDataGeneratedEncryptionKey:", v3);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)generatedEncryptionKeysForPersonalChannel:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SKADatabaseManager *v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke;
  v17 = &unk_24D977C18;
  v18 = self;
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v10, "performBlockAndWait:", &v14);
  v12 = (void *)objc_msgSend(v9, "copy", v14, v15, v16, v17, v18);

  return v12;
}

void __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  SKAGeneratedEncryptionKey *v16;
  SKAGeneratedEncryptionKey *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "generatedEncryptionKeys");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD17C0];
    +[GeneratedEncryptionKey dateGeneratedKeyPath](GeneratedEncryptionKey, "dateGeneratedKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortDescriptorWithKey:ascending:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sortedArrayUsingDescriptors:](v4, "sortedArrayUsingDescriptors:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v16 = [SKAGeneratedEncryptionKey alloc];
          v17 = -[SKAGeneratedEncryptionKey initWithCoreDataGeneratedEncryptionKey:](v16, "initWithCoreDataGeneratedEncryptionKey:", v15, (_QWORD)v18);
          if (v17)
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke_cold_1();
  }

}

- (id)allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke;
  v12 = &unk_24D9774E8;
  v13 = v3;
  v14 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v6, "performBlockAndWait:", &v9);
  v7 = (void *)objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

void __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[SubscriptionAssertion fetchRequest](SubscriptionAssertion, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for active subscription assertions", buf, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v20 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v20;
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Fetch request for active subscription assertions completed", buf, 2u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v14, "channelIdentifier", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v14, 0);
        if (objc_msgSend(v15, "length"))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

}

- (id)_existingSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SubscriptionAssertion fetchRequest](SubscriptionAssertion, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD14C0];
  +[SubscriptionAssertion predicateForChannelIdentifier:](SubscriptionAssertion, "predicateForChannelIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  +[SubscriptionAssertion predicateForApplicationIdentifier:](SubscriptionAssertion, "predicateForApplicationIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  objc_msgSend(v10, "setFetchLimit:", 1);
  v21 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v10, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v21;
  if (v17)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1();

  }
  objc_msgSend(v16, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)existingSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __115__SKADatabaseManager_existingSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __115__SKADatabaseManager_existingSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  SKADatabaseSubscriptionAssertion *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_existingSubscriptionAssertionForSubscriptionIdentifier:applicationIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v2 = -[SKADatabaseSubscriptionAssertion initWithCoreDataSubscriptionAssertion:]([SKADatabaseSubscriptionAssertion alloc], "initWithCoreDataSubscriptionAssertion:", v5);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)existingSubscriptionAssertionsForStatusTypeIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __114__SKADatabaseManager_existingSubscriptionAssertionsForStatusTypeIdentifier_applicationIdentifier_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __114__SKADatabaseManager_existingSubscriptionAssertionsForStatusTypeIdentifier_applicationIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SKADatabaseSubscriptionAssertion *v10;
  SKADatabaseSubscriptionAssertion *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingSubscriptionAssertionsForStatusTypeIdentifier:applicationIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = [SKADatabaseSubscriptionAssertion alloc];
        v11 = -[SKADatabaseSubscriptionAssertion initWithCoreDataSubscriptionAssertion:](v10, "initWithCoreDataSubscriptionAssertion:", v9, (_QWORD)v15);
        objc_msgSend(*(id *)(a1 + 56), "refreshObject:mergeChanges:", v9, 0);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v3, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)_existingSubscriptionAssertionsForStatusTypeIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[SubscriptionAssertion fetchRequest](SubscriptionAssertion, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD14C0];
  +[SubscriptionAssertion predicateForStatusTypeIdentifier:](SubscriptionAssertion, "predicateForStatusTypeIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v12;
  +[SubscriptionAssertion predicateForApplicationIdentifier:](SubscriptionAssertion, "predicateForApplicationIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  objc_msgSend(v10, "setFetchLimit:", 1);
  v20 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v10, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v20;
  if (v17)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1();

  }
  return v16;
}

- (id)createSubscriptionAssertionForSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 statusTypeIdentifier:(id)a5 databaseContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke;
  v19[3] = &unk_24D977BA0;
  v13 = v12;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v24 = &v25;
  objc_msgSend(v13, "performBlockAndWait:", v19);
  v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke(_QWORD *a1)
{
  SubscriptionAssertion *v2;
  void *v3;
  id v4;
  NSObject *v5;
  SKADatabaseSubscriptionAssertion *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = -[SubscriptionAssertion initWithContext:]([SubscriptionAssertion alloc], "initWithContext:", a1[4]);
  -[SubscriptionAssertion setChannelIdentifier:](v2, "setChannelIdentifier:", a1[5]);
  -[SubscriptionAssertion setApplicationIdentifier:](v2, "setApplicationIdentifier:", a1[6]);
  -[SubscriptionAssertion setStatusTypeIdentifier:](v2, "setStatusTypeIdentifier:", a1[7]);
  v3 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v3, "save:", &v9);
  v4 = v9;
  if (v4)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke_cold_1();

  }
  v6 = -[SKADatabaseSubscriptionAssertion initWithCoreDataSubscriptionAssertion:]([SKADatabaseSubscriptionAssertion alloc], "initWithCoreDataSubscriptionAssertion:", v2);
  v7 = *(_QWORD *)(a1[8] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)deleteSubscriptionAssertionWithSubscriptionIdentifier:(id)a3 applicationIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke;
  v15[3] = &unk_24D977BA0;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v13, "performBlockAndWait:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  char v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "_existingSubscriptionAssertionForSubscriptionIdentifier:applicationIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 56), "deleteObject:", v2);
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Deleted existing assertion.", v5, 2u);
    }
    v4 = 1;
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke_cold_1();
    v4 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v4;
}

- (id)_existingTransientSubscriptionHistoryForChannelIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  +[TransientSubscriptionHistory fetchRequest](TransientSubscriptionHistory, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD14C0];
  +[TransientSubscriptionHistory predicateForChannelIdentifier:](TransientSubscriptionHistory, "predicateForChannelIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v11);

  objc_msgSend(v7, "setFetchLimit:", 1);
  v17 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v17;
  if (v13)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingTransientSubscriptionHistoryForChannelIdentifier:databaseContext:].cold.1();

  }
  objc_msgSend(v12, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_existingTransientSubscriptionHistoryWithLimit:(int64_t)a3 orderedByLastSubscriptionDateAscending:(BOOL)a4 databaseContext:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  _QWORD v16[2];

  v5 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  +[TransientSubscriptionHistory fetchRequest](TransientSubscriptionHistory, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TransientSubscriptionHistory sortDescriptorForLastSubscriptionDateAscending:](TransientSubscriptionHistory, "sortDescriptorForLastSubscriptionDateAscending:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v10);

  objc_msgSend(v8, "setFetchLimit:", a3);
  v15 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v15;
  if (v12)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingTransientSubscriptionHistoryWithLimit:orderedByLastSubscriptionDateAscending:databaseContext:].cold.1();

  }
  return v11;
}

- (id)createOrUpdateTransientSubscriptionHistoryForChannelIdentifier:(id)a3 lastSubscriptionDate:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  TransientSubscriptionHistory *v6;
  NSObject *v7;
  SKADatabaseTransientSubscriptionHistory *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  SKADatabaseTransientSubscriptionHistory *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_existingTransientSubscriptionHistoryForChannelIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Found existing transient subscription history. Updating lastSubscrionDate.", buf, 2u);
    }

    objc_msgSend(v2, "setLastSubscriptionDate:", *(_QWORD *)(a1 + 56));
    v5 = *(void **)(a1 + 48);
    v17 = 0;
    objc_msgSend(v5, "save:", &v17);
    v6 = (TransientSubscriptionHistory *)v17;
    if (v6)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke_cold_1();

    }
    v8 = -[SKADatabaseTransientSubscriptionHistory initWithCoreDataTransientSubscriptionHistory:]([SKADatabaseTransientSubscriptionHistory alloc], "initWithCoreDataTransientSubscriptionHistory:", v2);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(id *)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Could not find existing transient subscription history. Creating a new one.", buf, 2u);
    }

    v6 = -[TransientSubscriptionHistory initWithContext:]([TransientSubscriptionHistory alloc], "initWithContext:", *(_QWORD *)(a1 + 48));
    -[TransientSubscriptionHistory setChannelIdentifier:](v6, "setChannelIdentifier:", *(_QWORD *)(a1 + 40));
    -[TransientSubscriptionHistory setLastSubscriptionDate:](v6, "setLastSubscriptionDate:", *(_QWORD *)(a1 + 56));
    v11 = *(void **)(a1 + 48);
    v16 = 0;
    objc_msgSend(v11, "save:", &v16);
    v10 = v16;
    if (v10)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke_cold_1();

    }
    v13 = -[SKADatabaseTransientSubscriptionHistory initWithCoreDataTransientSubscriptionHistory:]([SKADatabaseTransientSubscriptionHistory alloc], "initWithCoreDataTransientSubscriptionHistory:", v6);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (id)existingRecentTransientSubscriptionHistoriesWithLimit:(int64_t)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__SKADatabaseManager_existingRecentTransientSubscriptionHistoriesWithLimit_databaseContext___block_invoke;
  v10[3] = &unk_24D977C40;
  v10[4] = self;
  v13 = a3;
  v7 = v6;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __92__SKADatabaseManager_existingRecentTransientSubscriptionHistoriesWithLimit_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SKADatabaseTransientSubscriptionHistory *v10;
  SKADatabaseTransientSubscriptionHistory *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingTransientSubscriptionHistoryWithLimit:orderedByLastSubscriptionDateAscending:databaseContext:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = [SKADatabaseTransientSubscriptionHistory alloc];
        v11 = -[SKADatabaseTransientSubscriptionHistory initWithCoreDataTransientSubscriptionHistory:](v10, "initWithCoreDataTransientSubscriptionHistory:", v9, (_QWORD)v15);
        objc_msgSend(*(id *)(a1 + 40), "refreshObject:mergeChanges:", v9, 0);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v3, "copy");
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)createInvitedUserWithHandle:(id)a3 senderHandle:(id)a4 invitationPayload:(id)a5 channel:(id)a6 databaseContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  SKADatabaseManager *v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke;
  v24[3] = &unk_24D977C68;
  v17 = v13;
  v25 = v17;
  v18 = v12;
  v26 = v18;
  v27 = self;
  v19 = v15;
  v28 = v19;
  v20 = v16;
  v29 = v20;
  v21 = v14;
  v30 = v21;
  v31 = &v32;
  objc_msgSend(v20, "performBlockAndWait:", v24);
  v22 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  InvitedUser *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  SKADatabaseInvitedUser *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "normalizedHandleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "normalizedHandleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[InvitedUser initWithContext:]([InvitedUser alloc], "initWithContext:", *(_QWORD *)(a1 + 64));
    -[InvitedUser setInvitedHandle:](v5, "setInvitedHandle:", v3);
    objc_msgSend(*(id *)(a1 + 72), "payloadData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[InvitedUser setInvitationPayload:](v5, "setInvitationPayload:", v6);

    objc_msgSend(*(id *)(a1 + 72), "dateCreated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[InvitedUser setDateInvitationPayloadCreated:](v5, "setDateInvitationPayloadCreated:", v7);

    -[InvitedUser setSenderHandle:](v5, "setSenderHandle:", v2);
    objc_msgSend(v4, "addInvitedUsersObject:", v5);
    v8 = *(void **)(a1 + 64);
    v14 = 0;
    objc_msgSend(v8, "save:", &v14);
    v9 = v14;
    if (v9)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke_cold_1();

    }
    v11 = -[SKADatabaseInvitedUser initWithCoreDataInvitedUser:]([SKADatabaseInvitedUser alloc], "initWithCoreDataInvitedUser:", v5);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (BOOL)copyInvitedUsersFromChannel:(id)a3 toChannel:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke;
  v15[3] = &unk_24D977BA0;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v12, "performBlockAndWait:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  InvitedUser *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    v21 = v2;
    objc_msgSend(v2, "invitedUsers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v12 = -[InvitedUser initWithContext:]([InvitedUser alloc], "initWithContext:", *(_QWORD *)(a1 + 48));
          objc_msgSend(v11, "invitedHandle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[InvitedUser setInvitedHandle:](v12, "setInvitedHandle:", v13);

          objc_msgSend(v11, "invitationPayload");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[InvitedUser setInvitationPayload:](v12, "setInvitationPayload:", v14);

          objc_msgSend(v11, "dateInvitationPayloadCreated");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[InvitedUser setDateInvitationPayloadCreated:](v12, "setDateInvitationPayloadCreated:", v15);

          objc_msgSend(v11, "senderHandle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[InvitedUser setSenderHandle:](v12, "setSenderHandle:", v16);

          objc_msgSend(v4, "addInvitedUsersObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }
    v17 = *(void **)(a1 + 48);
    v22 = 0;
    objc_msgSend(v17, "save:", &v22);
    v18 = v22;
    if (v18)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke_cold_1();

      v20 = 0;
    }
    else
    {
      v20 = 1;
    }
    v2 = v21;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v20;

  }
}

- (id)updateInvitationPayload:(id)a3 onExistingInvitedUser:(id)a4 channel:(id)a5 databaseContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke;
  v20[3] = &unk_24D977C90;
  v20[4] = self;
  v14 = v11;
  v21 = v14;
  v15 = v12;
  v22 = v15;
  v16 = v13;
  v23 = v16;
  v17 = v10;
  v24 = v17;
  v25 = &v26;
  objc_msgSend(v16, "performBlockAndWait:", v20);
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  SKADatabaseInvitedUser *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "_existingInvitedUsersForDatabaseInvitedUser:databaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_3(v3, v2, v4);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
          objc_msgSend(*(id *)(a1 + 64), "payloadData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setInvitationPayload:", v11);

          objc_msgSend(*(id *)(a1 + 64), "dateCreated");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setDateInvitationPayloadCreated:", v12);

          v13 = -[SKADatabaseInvitedUser initWithCoreDataInvitedUser:]([SKADatabaseInvitedUser alloc], "initWithCoreDataInvitedUser:", v10);
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v13;

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    v16 = *(void **)(a1 + 56);
    v19 = 0;
    objc_msgSend(v16, "save:", &v19);
    v17 = v19;
    if (v17)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_2();

    }
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_1();
  }

}

- (id)existingInvitedUsersForInvitedHandle:(id)a3 onChannel:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __85__SKADatabaseManager_existingInvitedUsersForInvitedHandle_onChannel_databaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v8;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __85__SKADatabaseManager_existingInvitedUsersForInvitedHandle_onChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKADatabaseInvitedUser *v11;
  SKADatabaseInvitedUser *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_existingInvitedUsersForInvitedHandle:channel:databaseContext:", *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = [SKADatabaseInvitedUser alloc];
          v12 = -[SKADatabaseInvitedUser initWithCoreDataInvitedUser:](v11, "initWithCoreDataInvitedUser:", v10, (_QWORD)v16);
          objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v10, 0);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v13 = objc_msgSend(v4, "copy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (id)existingInvitedUsersForPersonalChannel:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke;
  v12[3] = &unk_24D977B50;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  SKADatabaseInvitedUser *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v2, "invitedUsers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = -[SKADatabaseInvitedUser initWithCoreDataInvitedUser:]([SKADatabaseInvitedUser alloc], "initWithCoreDataInvitedUser:", v9);
          objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v9, 0);
          -[NSObject addObject:](v3, "addObject:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
    v11 = -[NSObject copy](v3, "copy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_1();
  }

}

- (id)_existingInvitedUsersForDatabaseInvitedUser:(id)a3 databaseChannel:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  -[SKADatabaseManager _existingPersonalChannelForDatabaseChannel:databaseContext:](self, "_existingPersonalChannelForDatabaseChannel:databaseContext:", a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invitedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "senderHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[InvitedUser fetchRequest](InvitedUser, "fetchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD14C0];
  +[InvitedUser predicateForInvitedHandle:](InvitedUser, "predicateForInvitedHandle:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  +[InvitedUser predicateForSenderHandle:](InvitedUser, "predicateForSenderHandle:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  +[InvitedUser predicateForChannel:](InvitedUser, "predicateForChannel:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v19);

  v25 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v13, &v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v25;
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingInvitedUsersForDatabaseInvitedUser:databaseChannel:databaseContext:].cold.1();
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v20;
    _os_log_impl(&dword_2188DF000, v23, OS_LOG_TYPE_DEFAULT, "Fetch request for invited user executed with results: %@", buf, 0xCu);
  }

  return v20;
}

- (id)_existingInvitedUsersForInvitedHandle:(id)a3 channel:(id)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "normalizedHandleString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    +[InvitedUser fetchRequest](InvitedUser, "fetchRequest");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD14C0];
    +[InvitedUser predicateForInvitedHandle:](InvitedUser, "predicateForInvitedHandle:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    +[InvitedUser predicateForChannel:](InvitedUser, "predicateForChannel:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v11, "setPredicate:", v16);

    v22 = 0;
    objc_msgSend(v9, "executeFetchRequest:error:", v11, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SKADatabaseManager _existingInvitedUsersForDatabaseInvitedUser:databaseChannel:databaseContext:].cold.1();
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_2188DF000, v20, OS_LOG_TYPE_DEFAULT, "Fetch request for invited user executed with results: %@", buf, 0xCu);
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingInvitedUsersForInvitedHandle:channel:databaseContext:].cold.1(v7, v11);
    v17 = 0;
  }

  return v17;
}

- (BOOL)deleteInvitedUserForHandle:(id)a3 personalChannel:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke;
  v15[3] = &unk_24D977BA0;
  v15[4] = self;
  v11 = v9;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v12, "performBlockAndWait:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_existingInvitedUsersForInvitedHandle:channel:databaseContext:", *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v18 = v3;
      v19 = v2;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v22 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            +[SKADatabaseManager logger](SKADatabaseManager, "logger", v18, v19);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              v11 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138412290;
              v26 = v11;
              _os_log_impl(&dword_2188DF000, v10, OS_LOG_TYPE_DEFAULT, "Deleting existing invited user with handle: %@", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v9);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v6);
      }

      v12 = *(void **)(a1 + 48);
      v20 = 0;
      objc_msgSend(v12, "save:", &v20);
      v13 = v20;
      if (v13)
      {
        +[SKADatabaseManager logger](SKADatabaseManager, "logger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_3();

        v15 = 0;
      }
      else
      {
        v15 = 1;
      }
      v3 = v18;
      v2 = v19;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v15;

    }
    else
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_2();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

- (BOOL)deleteInvitedUserForHandle:(id)a3 presenceChannel:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__SKADatabaseManager_deleteInvitedUserForHandle_presenceChannel_databaseContext___block_invoke;
  v15[3] = &unk_24D977BA0;
  v15[4] = self;
  v11 = v9;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v12, "performBlockAndWait:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_presenceChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingChannelsForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_existingInvitedUsersForInvitedHandle:channel:databaseContext:", *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v20 = v2;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v19 = v4;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v23 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            +[SKADatabaseManager logger](SKADatabaseManager, "logger");
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v12 = *(_QWORD *)(a1 + 56);
              *(_DWORD *)buf = 138412290;
              v27 = v12;
              _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Deleting existing invited user with handle: %@", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v10);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        }
        while (v7);
      }

      v13 = *(void **)(a1 + 48);
      v21 = 0;
      objc_msgSend(v13, "save:", &v21);
      v14 = v21;
      if (v14)
      {
        +[SKADatabaseManager logger](SKADatabaseManager, "logger");
        v15 = objc_claimAutoreleasedReturnValue();
        v4 = v19;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_3();

        v16 = 0;
        v2 = v20;
      }
      else
      {
        v16 = 1;
        v2 = v20;
        v4 = v19;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v16;

    }
    else
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_2();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

- (BOOL)deleteAllInvitedUsersForPersonalChannel:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke;
  v11[3] = &unk_24D977B50;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  NSObject *v17;
  char v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPersonalChannelForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "invitedUsers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(v4, "count");
        objc_msgSend(v3, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v27 = v8;
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Deleting all %ld existing invited users for channel %@", buf, 0x16u);

      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v4;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(a1 + 48), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }

      v15 = *(void **)(a1 + 48);
      v20 = 0;
      objc_msgSend(v15, "save:", &v20);
      v16 = v20;
      if (v16)
      {
        +[SKADatabaseManager logger](SKADatabaseManager, "logger");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_3();

        v18 = 0;
      }
      else
      {
        v18 = 1;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v18;

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_2();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (id)createStatusWithUniqueIdentifier:(id)a3 dateCreated:(id)a4 datePublished:(id)a5 dateReceived:(id)a6 dateExpired:(id)a7 rawData:(id)a8 channelIdentifier:(id)a9 databaseContext:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__2;
  v47 = __Block_byref_object_dispose__2;
  v48 = 0;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke;
  v33[3] = &unk_24D977CB8;
  v23 = v22;
  v34 = v23;
  v24 = v15;
  v35 = v24;
  v25 = v21;
  v36 = v25;
  v26 = v16;
  v37 = v26;
  v27 = v17;
  v38 = v27;
  v28 = v18;
  v39 = v28;
  v29 = v20;
  v40 = v29;
  v30 = v19;
  v41 = v30;
  v42 = &v43;
  objc_msgSend(v23, "performBlockAndWait:", v33);
  v31 = (id)v44[5];

  _Block_object_dispose(&v43, 8);
  return v31;
}

void __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke(_QWORD *a1)
{
  Status *v2;
  void *v3;
  id v4;
  NSObject *v5;
  SKADatabaseStatus *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = -[Status initWithContext:]([Status alloc], "initWithContext:", a1[4]);
  -[Status setUniqueIdentifier:](v2, "setUniqueIdentifier:", a1[5]);
  -[Status setChannelIdentifier:](v2, "setChannelIdentifier:", a1[6]);
  -[Status setDateCreated:](v2, "setDateCreated:", a1[7]);
  -[Status setDatePublished:](v2, "setDatePublished:", a1[8]);
  -[Status setDateReceived:](v2, "setDateReceived:", a1[9]);
  -[Status setRawData:](v2, "setRawData:", a1[10]);
  -[Status setDateExpired:](v2, "setDateExpired:", a1[11]);
  v3 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v3, "save:", &v9);
  v4 = v9;
  if (v4)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke_cold_1();

  }
  v6 = -[SKADatabaseStatus initWithCoreDataStatus:]([SKADatabaseStatus alloc], "initWithCoreDataStatus:", v2);
  v7 = *(_QWORD *)(a1[12] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)existingStatusForChannel:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke;
  v11[3] = &unk_24D977CE0;
  v7 = v5;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  SKADatabaseStatus *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  +[Status fetchRequest](Status, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[Status predicateForChannelIdentifier:](Status, "predicateForChannelIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);

  +[Status sortDescriptorForDateCreatedAscending:](Status, "sortDescriptorForDateCreatedAscending:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v6);

  objc_msgSend(v2, "setFetchLimit:", 1);
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Beginning lookup of most recent status for channel", buf, 2u);
  }

  v8 = *(void **)(a1 + 40);
  v20 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v2, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v10)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke_cold_1();
LABEL_6:

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;
    goto LABEL_11;
  }
  v14 = objc_msgSend(v9, "count");
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for status by channel found no match.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v15)
  {
    v16 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v22 = v16;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for status by channel completed with %ld result(s)", buf, 0xCu);
  }

  objc_msgSend(v9, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SKADatabaseStatus initWithCoreDataStatus:]([SKADatabaseStatus alloc], "initWithCoreDataStatus:", v13);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

LABEL_11:
}

- (id)existingStatusForUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_24D977CE0;
  v7 = v5;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  SKADatabaseStatus *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[Status fetchRequest](Status, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[Status predicateForStatusUniqueIdentifier:](Status, "predicateForStatusUniqueIdentifier:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setFetchLimit:", 1);
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v4, OS_LOG_TYPE_DEFAULT, "Beginning lookup of most recent status for unique id", buf, 2u);
  }

  v5 = (void *)a1[5];
  v17 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v2, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v7)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke_cold_1();
LABEL_6:

    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;
    goto LABEL_11;
  }
  v11 = objc_msgSend(v6, "count");
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Fetch request for status by unique id found no match.", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v12)
  {
    v13 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v19 = v13;
    _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Fetch request for status by unique id completed with %ld result(s)", buf, 0xCu);
  }

  objc_msgSend(v6, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SKADatabaseStatus initWithCoreDataStatus:]([SKADatabaseStatus alloc], "initWithCoreDataStatus:", v10);
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

LABEL_11:
}

- (unint64_t)currentCheckpointForChannel:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__SKADatabaseManager_currentCheckpointForChannel_databaseContext___block_invoke;
  v12[3] = &unk_24D977B50;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __66__SKADatabaseManager_currentCheckpointForChannel_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_existingChannelCheckpointForChannelIdentifier:databaseContext:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = objc_msgSend(v4, "checkpoint");
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Found existing checkpoint %lld for channel %@", (uint8_t *)&v10, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "checkpoint");
  }
  else
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = (uint64_t)v9;
      _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "No existing checkpoint for channel: %@. Creating a new checkpoint", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (BOOL)setCurrentCheckpointForChannel:(id)a3 checkpoint:(unint64_t)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke;
  v13[3] = &unk_24D977D08;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v11 = v9;
  v16 = &v18;
  v17 = a4;
  v15 = v11;
  objc_msgSend(v11, "performBlockAndWait:", v13);
  LOBYTE(a4) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return a4;
}

void __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  ChannelCheckpoint *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_existingChannelCheckpointForChannelIdentifier:databaseContext:", v3, *(_QWORD *)(a1 + 48));
  v4 = (ChannelCheckpoint *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ChannelCheckpoint setCheckpoint:](v4, "setCheckpoint:", *(_QWORD *)(a1 + 64));
    v5 = *(void **)(a1 + 48);
    v17 = 0;
    objc_msgSend(v5, "save:", &v17);
    v6 = v17;
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_2();

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v15;
        _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Updated checkpoint for channel: %@", buf, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "No existing checkpoint for channel: %@. Creating a new checkpoint", buf, 0xCu);

    }
    v4 = -[ChannelCheckpoint initWithContext:]([ChannelCheckpoint alloc], "initWithContext:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChannelCheckpoint setChannelID:](v4, "setChannelID:", v11);

    -[ChannelCheckpoint setCheckpoint:](v4, "setCheckpoint:", *(_QWORD *)(a1 + 64));
    v12 = *(void **)(a1 + 48);
    v16 = 0;
    objc_msgSend(v12, "save:", &v16);
    v6 = v16;
    if (v6)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_1();

      v14 = 0;
    }
    else
    {
      v14 = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;
  }

}

- (id)_existingChannelCheckpointForChannelIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v5 = a4;
  v6 = a3;
  +[ChannelCheckpoint fetchRequest](ChannelCheckpoint, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ChannelCheckpoint predicateForChannelIdentifier:](ChannelCheckpoint, "predicateForChannelIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v7, "setFetchLimit:", 1);
  v14 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v10)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:].cold.1();

  }
  objc_msgSend(v9, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)cleanupOldStatusUpdatesForChannelIdentifier:(id)a3 excludingStatusUniqueIdentifier:(id)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke;
  v13[3] = &unk_24D977538;
  v14 = v7;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v11, "performBlockAndWait:", v13);

}

void __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x24BDAC8D0];
  +[Status fetchRequest](Status, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[Status predicateForChannelIdentifier:](Status, "predicateForChannelIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  +[Status sortDescriptorForDateCreatedAscending:](Status, "sortDescriptorForDateCreatedAscending:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(v2, "setFetchLimit:", 20);
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v42 = v7;
    _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "Beginning database cleanup of statuses on channel identifier: %@", buf, 0xCu);
  }

  v8 = *(void **)(a1 + 40);
  v39 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v2, &v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;
  if (v10)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_2();
    goto LABEL_6;
  }
  v12 = objc_msgSend(v9, "count");
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v11 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    v33 = v2;
    if (v13)
    {
      v14 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134217984;
      v42 = v14;
      _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for status cleanup completed with %ld result(s)", buf, 0xCu);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v9;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      v19 = 1;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((v19 & 1) != 0)
          {
            +[SKADatabaseManager logger](SKADatabaseManager, "logger");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v21, "uniqueIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v42 = (uint64_t)v23;
              _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Keeping status %@ because it is our most recent status", buf, 0xCu);

            }
LABEL_21:

            goto LABEL_25;
          }
          v24 = *(void **)(a1 + 48);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "uniqueIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          +[SKADatabaseManager logger](SKADatabaseManager, "logger");
          v22 = objc_claimAutoreleasedReturnValue();
          v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v26)
          {
            if (v27)
            {
              objc_msgSend(v21, "uniqueIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v42 = (uint64_t)v28;
              _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Keeping status %@ because it is excluded from this cleanup request", buf, 0xCu);

            }
            goto LABEL_21;
          }
          if (v27)
          {
            objc_msgSend(v21, "uniqueIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v42 = (uint64_t)v29;
            _os_log_impl(&dword_2188DF000, v22, OS_LOG_TYPE_DEFAULT, "Deleting status %@ as it is no longer the most recent", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v21);
LABEL_25:
          v19 = 0;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        v19 = 0;
      }
      while (v17);
    }

    v30 = *(void **)(a1 + 40);
    v34 = 0;
    objc_msgSend(v30, "save:", &v34);
    v11 = v34;
    if (v11)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v31 = objc_claimAutoreleasedReturnValue();
      v2 = v33;
      v10 = 0;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_1();

      v9 = v32;
    }
    else
    {
      v9 = v32;
      v2 = v33;
      v10 = 0;
    }
  }
  else if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v11, OS_LOG_TYPE_DEFAULT, "Fetch request for cleanup of statuses found no matches.", buf, 2u);
  }
LABEL_6:

}

- (id)_existingPendingPublishRequestForUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v5 = a4;
  v6 = a3;
  +[PendingPublishRequest fetchRequest](PendingPublishRequest, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PendingPublishRequest predicateForStatusUniqueIdentifier:](PendingPublishRequest, "predicateForStatusUniqueIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v7, "setFetchLimit:", 1);
  v14 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v14;
  if (v10)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:].cold.1();

  }
  objc_msgSend(v9, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_existingPendingPublishRequestsForStatusTypeIdentifier:(id)a3 databaseContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v5 = a4;
  v6 = a3;
  +[PendingPublishRequest fetchRequest](PendingPublishRequest, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PendingPublishRequest predicateForStatusTypeIdentifier:](PendingPublishRequest, "predicateForStatusTypeIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  v13 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v10)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:].cold.1();

  }
  return v9;
}

- (id)_existingPendingPublishRequestsWithDatabaseContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  +[PendingPublishRequest fetchRequest](PendingPublishRequest, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v6)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingChannelCheckpointForChannelIdentifier:databaseContext:].cold.1();

  }
  return v5;
}

- (id)createPendingPublishRequestWithUniqueIdentifier:(id)a3 dateCreated:(id)a4 payloadData:(id)a5 statusTypeIdentifier:(id)a6 databaseContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke;
  v23[3] = &unk_24D977C90;
  v16 = v15;
  v24 = v16;
  v17 = v12;
  v25 = v17;
  v18 = v11;
  v26 = v18;
  v19 = v13;
  v27 = v19;
  v20 = v14;
  v28 = v20;
  v29 = &v30;
  objc_msgSend(v16, "performBlockAndWait:", v23);
  v21 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v21;
}

void __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke(_QWORD *a1)
{
  PendingPublishRequest *v2;
  void *v3;
  id v4;
  NSObject *v5;
  SKADatabasePendingPublishRequest *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = -[PendingPublishRequest initWithContext:]([PendingPublishRequest alloc], "initWithContext:", a1[4]);
  -[PendingPublishRequest setDateCreated:](v2, "setDateCreated:", a1[5]);
  -[PendingPublishRequest setStatusUniqueIdentifier:](v2, "setStatusUniqueIdentifier:", a1[6]);
  -[PendingPublishRequest setPayloadData:](v2, "setPayloadData:", a1[7]);
  -[PendingPublishRequest setStatusTypeIdentifier:](v2, "setStatusTypeIdentifier:", a1[8]);
  -[PendingPublishRequest setRetryCount:](v2, "setRetryCount:", 0);
  v3 = (void *)a1[4];
  v9 = 0;
  objc_msgSend(v3, "save:", &v9);
  v4 = v9;
  if (v4)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke_cold_1();

  }
  v6 = -[SKADatabasePendingPublishRequest initWithCoreDataPendingPublishRequest:]([SKADatabasePendingPublishRequest alloc], "initWithCoreDataPendingPublishRequest:", v2);
  v7 = *(_QWORD *)(a1[9] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)existingPendingPublishRequestForUniqueIdentifier:(id)a3 withDatabaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__SKADatabaseManager_existingPendingPublishRequestForUniqueIdentifier_withDatabaseContext___block_invoke;
  v12[3] = &unk_24D977B50;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __91__SKADatabaseManager_existingPendingPublishRequestForUniqueIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  SKADatabasePendingPublishRequest *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_existingPendingPublishRequestForUniqueIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v2 = -[SKADatabasePendingPublishRequest initWithCoreDataPendingPublishRequest:]([SKADatabasePendingPublishRequest alloc], "initWithCoreDataPendingPublishRequest:", v5);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (id)existingPendingPublishRequestsForStatusTypeIdentifier:(id)a3 withDatabaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__SKADatabaseManager_existingPendingPublishRequestsForStatusTypeIdentifier_withDatabaseContext___block_invoke;
  v12[3] = &unk_24D977B50;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v9, "performBlockAndWait:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __96__SKADatabaseManager_existingPendingPublishRequestsForStatusTypeIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SKADatabasePendingPublishRequest *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPendingPublishRequestsForStatusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = -[SKADatabasePendingPublishRequest initWithCoreDataPendingPublishRequest:]([SKADatabasePendingPublishRequest alloc], "initWithCoreDataPendingPublishRequest:", v7);
        objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v7, 0);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)existingPendingPublishRequestsWithDatabaseContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__SKADatabaseManager_existingPendingPublishRequestsWithDatabaseContext___block_invoke;
  v8[3] = &unk_24D977CE0;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __72__SKADatabaseManager_existingPendingPublishRequestsWithDatabaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SKADatabasePendingPublishRequest *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_existingPendingPublishRequestsWithDatabaseContext:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = -[SKADatabasePendingPublishRequest initWithCoreDataPendingPublishRequest:]([SKADatabasePendingPublishRequest alloc], "initWithCoreDataPendingPublishRequest:", v7);
        objc_msgSend(*(id *)(a1 + 40), "refreshObject:mergeChanges:", v7, 0);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (BOOL)deletePendingPublishRequestWithWithUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_24D977B50;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_existingPendingPublishRequestForUniqueIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v3);
    v4 = *(void **)(a1 + 48);
    v10 = 0;
    objc_msgSend(v4, "save:", &v10);
    v5 = v10;
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_2();

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *v2;
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Deleted existing pending publish request with identifier: %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (BOOL)incrementPendingPublishRequestRetryCountWithUniqueIdentifier:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke;
  v11[3] = &unk_24D977B50;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_existingPendingPublishRequestForUniqueIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setRetryCount:", objc_msgSend(v3, "retryCount") + 1);
    v5 = *(void **)(a1 + 48);
    v11 = 0;
    objc_msgSend(v5, "save:", &v11);
    v6 = v11;
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke_cold_2();

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *v2;
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "Incremented pending publish request rc with identifier: %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (id)createRemovedUserWithHandle:(id)a3 dateRemoved:(id)a4 statusTypeIdentifier:(id)a5 databaseContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke;
  v19[3] = &unk_24D977BA0;
  v13 = v12;
  v20 = v13;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v16 = v9;
  v23 = v16;
  v24 = &v25;
  objc_msgSend(v13, "performBlockAndWait:", v19);
  v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  RemovedUser *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  SKADatabaseRemovedUser *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = -[RemovedUser initWithContext:]([RemovedUser alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  -[RemovedUser setDateRemoved:](v2, "setDateRemoved:", *(_QWORD *)(a1 + 40));
  -[RemovedUser setStatusTypeIdentifier:](v2, "setStatusTypeIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "normalizedHandleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemovedUser setRemovedHandle:](v2, "setRemovedHandle:", v3);

  v4 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v4, "save:", &v10);
  v5 = v10;
  if (v5)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke_cold_1();

  }
  v7 = -[SKADatabaseRemovedUser initWithCoreDataRemovedUser:]([SKADatabaseRemovedUser alloc], "initWithCoreDataRemovedUser:", v2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)existingRemovedUserWithHandle:(id)a3 statusTypeIdentifier:(id)a4 withDatabaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __93__SKADatabaseManager_existingRemovedUserWithHandle_statusTypeIdentifier_withDatabaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __93__SKADatabaseManager_existingRemovedUserWithHandle_statusTypeIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  SKADatabaseRemovedUser *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[SKADatabaseRemovedUser initWithCoreDataRemovedUser:]([SKADatabaseRemovedUser alloc], "initWithCoreDataRemovedUser:", v2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (BOOL)deleteRemovedUserWithHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke;
  v15[3] = &unk_24D977BA0;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v13, "performBlockAndWait:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 56), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v6);
    }

    v9 = *(void **)(a1 + 56);
    v15 = 0;
    objc_msgSend(v9, "save:", &v15);
    v10 = v15;
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2();

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *v2;
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Deleted existing removed user with handle: %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

- (id)_existingRemovedUsersForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[RemovedUser fetchRequest](RemovedUser, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD14C0];
  +[RemovedUser predicateForHandle:](RemovedUser, "predicateForHandle:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v12;
  +[RemovedUser predicateForStatusTypeIdentifier:](RemovedUser, "predicateForStatusTypeIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  objc_msgSend(v10, "setFetchLimit:", 1);
  v20 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v10, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v20;
  if (v17)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:].cold.1();

  }
  return v16;
}

- (id)createRemovedUserWithHandle:(id)a3 dateRemoved:(id)a4 presenceIdentifier:(id)a5 databaseContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __97__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_presenceIdentifier_databaseContext___block_invoke;
  v19[3] = &unk_24D977BA0;
  v13 = v12;
  v20 = v13;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v16 = v9;
  v23 = v16;
  v24 = &v25;
  objc_msgSend(v13, "performBlockAndWait:", v19);
  v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v17;
}

void __97__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_presenceIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  RemovedUser *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  SKADatabaseRemovedUser *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = -[RemovedUser initWithContext:]([RemovedUser alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  -[RemovedUser setDateRemoved:](v2, "setDateRemoved:", *(_QWORD *)(a1 + 40));
  -[RemovedUser setPresenceIdentifier:](v2, "setPresenceIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "normalizedHandleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RemovedUser setRemovedHandle:](v2, "setRemovedHandle:", v3);

  v4 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v4, "save:", &v10);
  v5 = v10;
  if (v5)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke_cold_1();

  }
  v7 = -[SKADatabaseRemovedUser initWithCoreDataRemovedUser:]([SKADatabaseRemovedUser alloc], "initWithCoreDataRemovedUser:", v2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)existingRemovedUserWithHandle:(id)a3 presenceIdentifier:(id)a4 withDatabaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __91__SKADatabaseManager_existingRemovedUserWithHandle_presenceIdentifier_withDatabaseContext___block_invoke;
  v16[3] = &unk_24D977BA0;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __91__SKADatabaseManager_existingRemovedUserWithHandle_presenceIdentifier_withDatabaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  SKADatabaseRemovedUser *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_existingRemovedUsersForHandle:presenceIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[SKADatabaseRemovedUser initWithCoreDataRemovedUser:]([SKADatabaseRemovedUser alloc], "initWithCoreDataRemovedUser:", v2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (BOOL)deleteRemovedUserWithHandle:(id)a3 presenceIdentifier:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__SKADatabaseManager_deleteRemovedUserWithHandle_presenceIdentifier_databaseContext___block_invoke;
  v15[3] = &unk_24D977BA0;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v13, "performBlockAndWait:", v15);
  LOBYTE(v8) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __85__SKADatabaseManager_deleteRemovedUserWithHandle_presenceIdentifier_databaseContext___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_existingRemovedUsersForHandle:presenceIdentifier:databaseContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 56), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v6);
    }

    v9 = *(void **)(a1 + 56);
    v15 = 0;
    objc_msgSend(v9, "save:", &v15);
    v10 = v15;
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2();

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *v2;
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_2188DF000, v12, OS_LOG_TYPE_DEFAULT, "Deleted existing removed user with handle: %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

- (id)_existingRemovedUsersForHandle:(id)a3 presenceIdentifier:(id)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[RemovedUser fetchRequest](RemovedUser, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD14C0];
  +[RemovedUser predicateForHandle:](RemovedUser, "predicateForHandle:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v12;
  +[RemovedUser predicateForPresenceIdentifier:](RemovedUser, "predicateForPresenceIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  objc_msgSend(v10, "setFetchLimit:", 1);
  v20 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v10, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v20;
  if (v17)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:].cold.1();

  }
  return v16;
}

- (id)_existingReceivedInvitationsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[ReceivedInvitation fetchRequest](ReceivedInvitation, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD14C0];
  +[ReceivedInvitation predicateForSenderHandle:](ReceivedInvitation, "predicateForSenderHandle:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v12;
  +[ReceivedInvitation predicateForStatusTypeIdentifier:](ReceivedInvitation, "predicateForStatusTypeIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v15);

  +[ReceivedInvitation sortDescriptorForDateInvitationCreatedOrderedAscending:](ReceivedInvitation, "sortDescriptorForDateInvitationCreatedOrderedAscending:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v17);

  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "handleString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = (uint64_t)v19;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for ReceivedInvitation from handle %@ statusTypeIdentifier: %@", buf, 0x16u);

  }
  v30 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v10, &v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v30;
  if (!v21)
  {
    v23 = objc_msgSend(v20, "count");
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v24)
        goto LABEL_12;
      v25 = objc_msgSend(v20, "count");
      *(_DWORD *)buf = 134217984;
      v32 = v25;
      v26 = "Fetch request for ReceivedInvitation by handle completed with %ld result(s)";
      v27 = v22;
      v28 = 12;
    }
    else
    {
      if (!v24)
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v26 = "Fetch request for ReceivedInvitation by handle found no match.";
      v27 = v22;
      v28 = 2;
    }
    _os_log_impl(&dword_2188DF000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_12;
  }
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[SKADatabaseManager _existingReceivedInvitationsForHandle:statusTypeIdentifier:databaseContext:].cold.1();
LABEL_12:

  return v20;
}

- (id)createReceivedInvitationForChannel:(id)a3 senderHandle:(id)a4 invitedHandle:(id)a5 invitationIdentifier:(id)a6 dateInvitationCreated:(id)a7 incomingRatchetState:(id)a8 presenceIdentifier:(id)a9 channelToken:(id)a10 serverKey:(id)a11 peerKey:(id)a12 invitationPayload:(id)a13 databaseContext:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  SKADatabaseManager *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;

  v35 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v37 = a7;
  v38 = a8;
  v44 = a9;
  v39 = a10;
  v42 = a11;
  v43 = a12;
  v22 = a13;
  v23 = a14;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__2;
  v65 = __Block_byref_object_dispose__2;
  v66 = 0;
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke;
  v46[3] = &unk_24D977D30;
  v36 = v35;
  v47 = v36;
  v48 = self;
  v24 = v23;
  v49 = v24;
  v25 = v19;
  v50 = v25;
  v41 = v20;
  v51 = v41;
  v26 = v21;
  v52 = v26;
  v27 = v37;
  v53 = v27;
  v28 = v38;
  v54 = v28;
  v29 = v22;
  v55 = v29;
  v30 = v39;
  v56 = v30;
  v31 = v44;
  v57 = v31;
  v32 = v42;
  v58 = v32;
  v33 = v43;
  v59 = v33;
  v60 = &v61;
  objc_msgSend(v24, "performBlockAndWait:", v46);
  v45 = (id)v62[5];

  _Block_object_dispose(&v61, 8);
  return v45;
}

void __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ReceivedInvitation *v9;
  void *v10;
  id v11;
  NSObject *v12;
  SKADatabaseReceivedInvitation *v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_existingChannelsForDatabaseChannel:databaseContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_2();

  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "normalizedHandleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "normalizedHandleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statusType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ReceivedInvitation initWithContext:]([ReceivedInvitation alloc], "initWithContext:", *(_QWORD *)(a1 + 48));
  -[ReceivedInvitation setSenderHandle:](v9, "setSenderHandle:", v6);
  -[ReceivedInvitation setInvitedHandle:](v9, "setInvitedHandle:", v7);
  -[ReceivedInvitation setStatusTypeIdentifier:](v9, "setStatusTypeIdentifier:", v8);
  -[ReceivedInvitation setInvitationIdentifier:](v9, "setInvitationIdentifier:", *(_QWORD *)(a1 + 72));
  -[ReceivedInvitation setDateInvitationCreated:](v9, "setDateInvitationCreated:", *(_QWORD *)(a1 + 80));
  -[ReceivedInvitation setIncomingRatchetState:](v9, "setIncomingRatchetState:", *(_QWORD *)(a1 + 88));
  -[ReceivedInvitation setInvitationPayload:](v9, "setInvitationPayload:", *(_QWORD *)(a1 + 96));
  -[ReceivedInvitation setChannelToken:](v9, "setChannelToken:", *(_QWORD *)(a1 + 104));
  -[ReceivedInvitation setPresenceIdentifier:](v9, "setPresenceIdentifier:", *(_QWORD *)(a1 + 112));
  -[ReceivedInvitation setServerKey:](v9, "setServerKey:", *(_QWORD *)(a1 + 120));
  -[ReceivedInvitation setPeerKey:](v9, "setPeerKey:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v5, "addReceivedInvitationsObject:", v9);
  v10 = *(void **)(a1 + 48);
  v16 = 0;
  objc_msgSend(v10, "save:", &v16);
  v11 = v16;
  if (v11)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_1();

  }
  v13 = -[SKADatabaseReceivedInvitation initWithCoreDataReceivedInvitation:]([SKADatabaseReceivedInvitation alloc], "initWithCoreDataReceivedInvitation:", v9);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

- (id)_existingReceivedInvitationsForChannelIdentifier:(id)a3 sortedByDateReceived:(BOOL)a4 databaseContect:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _BOOL4 v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v31 = a5;
  -[SKADatabaseManager _existingChannelsForChannelIdentifier:databaseContext:](self, "_existingChannelsForChannelIdentifier:databaseContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v28 = v6;
    v30 = v8;
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v29 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v16, "receivedInvitations");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v33 != v20)
                  objc_enumerationMutation(v17);
                -[NSObject addObject:](v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v19);
          }
          objc_msgSend(v31, "refreshObject:mergeChanges:", v16, 0);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v13);
    }

    if (v28)
    {
      v22 = (void *)MEMORY[0x24BDD17C0];
      +[ReceivedInvitation dateInvitationCreatedKeyPath](ReceivedInvitation, "dateInvitationCreatedKeyPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sortDescriptorWithKey:ascending:", v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sortedArrayUsingDescriptors:](v10, "sortedArrayUsingDescriptors:", v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = -[NSObject copy](v10, "copy");
    }
    v9 = v29;
    v8 = v30;
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SKADatabaseManager _existingReceivedInvitationsForChannelIdentifier:sortedByDateReceived:databaseContect:].cold.1();
    v26 = (id)MEMORY[0x24BDBD1A8];
  }

  return v26;
}

- (id)receivedInvitationsForChannel:(id)a3 databaseContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *);
  void *v17;
  id v18;
  SKADatabaseManager *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __68__SKADatabaseManager_receivedInvitationsForChannel_databaseContext___block_invoke;
  v17 = &unk_24D977C18;
  v18 = v6;
  v19 = self;
  v20 = v7;
  v21 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v10, "performBlockAndWait:", &v14);
  v12 = (void *)objc_msgSend(v9, "copy", v14, v15, v16, v17);

  return v12;
}

void __68__SKADatabaseManager_receivedInvitationsForChannel_databaseContext___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SKADatabaseReceivedInvitation *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_existingReceivedInvitationsForChannelIdentifier:sortedByDateReceived:databaseContect:", v2, 1, a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = -[SKADatabaseReceivedInvitation initWithCoreDataReceivedInvitation:]([SKADatabaseReceivedInvitation alloc], "initWithCoreDataReceivedInvitation:", v8);
        objc_msgSend(a1[6], "refreshObject:mergeChanges:", v8, 0);
        if (v9)
          objc_msgSend(a1[7], "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)cleanupOldReceivedInvitationsForChannelIdentifier:(id)a3 excludingInvitation:(id)a4 databaseContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke;
  v14[3] = &unk_24D977C18;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  objc_msgSend(v12, "performBlockAndWait:", v14);

}

void __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_existingReceivedInvitationsForChannelIdentifier:sortedByDateReceived:databaseContect:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_2;
  v9[3] = &unk_24D977D58;
  v10 = *(id *)(a1 + 56);
  v4 = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  v5 = *(void **)(a1 + 48);
  v8 = 0;
  objc_msgSend(v5, "save:", &v8);
  v6 = v8;
  if (v6)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_cold_1();

  }
}

void __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_2(id *a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "senderHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 5)
  {
    objc_msgSend(v5, "invitationIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(a1[4], "invitationIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v5, "invitationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "invitationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
    }
    if (!objc_msgSend(v6, "length") || objc_msgSend(a1[5], "containsObject:", v6))
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "invitationIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_2188DF000, v14, OS_LOG_TYPE_DEFAULT, "Deleting invitation %@ as it is no longer the most recent", (uint8_t *)&v16, 0xCu);

      }
      objc_msgSend(a1[6], "deleteObject:", v5);
    }
  }
LABEL_12:
  if (objc_msgSend(v6, "length"))
    objc_msgSend(a1[5], "addObject:", v6);

}

- (void)cleanupDecommisionedChannelsWithDatabaseContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke;
  v6[3] = &unk_24D9774E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

void __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[8];
  id v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_existingDecomissionedPersonalChannelsWithDatabaseContext:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_2;
    v9[3] = &unk_24D977D80;
    v10 = v2;
    v11 = *(id *)(a1 + 40);
    -[NSObject enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v9);
    v3 = *(void **)(a1 + 40);
    v8 = 0;
    objc_msgSend(v3, "save:", &v8);
    v4 = v8;
    if (v4)
    {
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_cold_1();

    }
    v6 = v10;
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2188DF000, v6, OS_LOG_TYPE_DEFAULT, "No decomissioned channel to clean up", v7, 2u);
    }
  }

}

void __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a3 > 5 || v6 - a3 >= 6)
  {
    if (v8)
    {
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Deleting channel %@ as it is decomissioned and not recent or old", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v5);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_2188DF000, v7, OS_LOG_TYPE_DEFAULT, "Not deleting channel %@ as it is in our most recent and old decomissioned channels", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (void)cleanupOldChannelsForHandle:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  NSObject *v5;
  uint8_t v6[16];

  +[SKADatabaseManager logger](SKADatabaseManager, "logger", a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Channel cleanup is disabled.", v6, 2u);
  }

}

- (void)deviceToDeviceEncryptedDatabaseCapableWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SKADatabaseManager databaseProvider](self, "databaseProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__SKADatabaseManager_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke;
  v7[3] = &unk_24D976270;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "deviceToDeviceEncryptedDatabaseCapableWithCompletion:", v7);

}

uint64_t __75__SKADatabaseManager_deviceToDeviceEncryptedDatabaseCapableWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)allPublishedLocalStatusesInDatabaseContext:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke;
  v10[3] = &unk_24D977DA8;
  v6 = v5;
  v11 = v6;
  v12 = &v14;
  v13 = &v20;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v7 = (void *)v21[5];
  if (v7)
  {
    v8 = v7;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v15[5]);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  SKADatabasePublishedLocalStatus *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t buf[16];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  +[PublishedLocalStatus fetchRequest](PublishedLocalStatus, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Beginning fetch request for all published local statuses", buf, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v22 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  v7 = v22;
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(id *)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v9, OS_LOG_TYPE_DEFAULT, "Fetch request for all published local statuses completed", buf, 2u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v16, 0, (_QWORD)v18);
          v17 = -[SKADatabasePublishedLocalStatus initWithCoreDataPublishedLocalStatus:]([SKADatabasePublishedLocalStatus alloc], "initWithCoreDataPublishedLocalStatus:", v16);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v13);
    }
  }

}

- (BOOL)createOrUpdatePublishedLocalStatuses:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke;
  v13[3] = &unk_24D977DD0;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v16 = &v24;
  v17 = &v18;
  objc_msgSend(v10, "performBlockAndWait:", v13);
  v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((_BYTE *)v25 + 24))
    *a5 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  PublishedLocalStatus *v32;
  PublishedLocalStatus *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  id v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v62 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v5);
  }

  +[PublishedLocalStatus fetchRequest](PublishedLocalStatus, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PublishedLocalStatus predicateForPublishedLocalStatusIdentifiers:](PublishedLocalStatus, "predicateForPublishedLocalStatusIdentifiers:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v11 = *(void **)(a1 + 40);
  v60 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v9, &v60);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v60;
  v14 = v60;
  v15 = v14;
  if (v12)
  {
    v47 = v14;
    v49 = v9;
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v48 = v12;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v57 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v22, v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v19);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v24 = *(id *)(a1 + 32);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    if (v25)
    {
      v26 = v25;
      v50 = a1;
      v27 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
            v32 = v31;
          else
            v32 = -[PublishedLocalStatus initWithContext:]([PublishedLocalStatus alloc], "initWithContext:", *(_QWORD *)(v50 + 40));
          v33 = v32;
          objc_msgSend(v29, "creationDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PublishedLocalStatus setCreationDate:](v33, "setCreationDate:", v34);

          objc_msgSend(v29, "keyDomain");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[PublishedLocalStatus setKeyDomain:](v33, "setKeyDomain:", v35);

          objc_msgSend(v29, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PublishedLocalStatus setIdentifier:](v33, "setIdentifier:", v36);

          objc_msgSend(v29, "keyName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PublishedLocalStatus setKeyName:](v33, "setKeyName:", v37);

          objc_msgSend(v29, "modificationDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PublishedLocalStatus setModificationDate:](v33, "setModificationDate:", v38);

          objc_msgSend(v29, "payload");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PublishedLocalStatus setPayload:](v33, "setPayload:", v39);

          -[PublishedLocalStatus setTargetDevicesFlags:](v33, "setTargetDevicesFlags:", objc_msgSend(v29, "targetDevicesFlags"));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
      }
      while (v26);

      v40 = *(void **)(v50 + 40);
      v51 = 0;
      v41 = objc_msgSend(v40, "save:", &v51);
      v42 = v51;
      v43 = v51;
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v41)
      {
        v12 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v50 + 32), "count"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v66 = v46;
          _os_log_impl(&dword_2188DF000, v45, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatuses saved {statuses.count: %@}", buf, 0xCu);

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v50 + 48) + 8) + 24) = 1;
      }
      else
      {
        v12 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_2();

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v50 + 48) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v50 + 56) + 8) + 40), v42);
      }

      v9 = v49;
    }
    else
    {

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v12 = v48;
      v9 = v49;
    }
    v15 = v47;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_1();
  }

}

- (id)allPublishedLocalStatusDevicesInDatabaseContext:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke;
  v10[3] = &unk_24D977DA8;
  v6 = v5;
  v11 = v6;
  v12 = &v14;
  v13 = &v20;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v7 = (void *)v21[5];
  if (v7)
  {
    v8 = v7;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v15[5]);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKADatabasePublishedLocalStatusDevice *v17;
  SKADatabasePublishedLocalStatusDevice *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  +[PublishedLocalStatusDevice fetchRequest](PublishedLocalStatusDevice, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[4];
  v23 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v23;
  v6 = v23;
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v5);
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(id *)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_2188DF000, v8, OS_LOG_TYPE_DEFAULT, "allPublishedLocalStatusDevicesInDatabaseContext fetch success {devices.count: %@}", buf, 0xCu);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v4;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
          v17 = [SKADatabasePublishedLocalStatusDevice alloc];
          v18 = -[SKADatabasePublishedLocalStatusDevice initWithCoreDataPulishedLocalStatusDevice:](v17, "initWithCoreDataPulishedLocalStatusDevice:", v16, (_QWORD)v19);
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }
  }

}

- (BOOL)createOrUpdatePublishedLocalStatusDevices:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke;
  v13[3] = &unk_24D977DD0;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v16 = &v24;
  v17 = &v18;
  objc_msgSend(v10, "performBlockAndWait:", v13);
  v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((_BYTE *)v25 + 24))
    *a5 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  PublishedLocalStatusDevice *v26;
  PublishedLocalStatusDevice *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ii;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t jj;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  PublishedLocalStatusDevice *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  uint64_t v78;
  id v79;
  void *v80;
  int v81;
  id v82;
  id v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  NSObject *v91;
  uint64_t v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  PublishedLocalStatusDevice *v101;
  void *v102;
  void *v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t buf[4];
  id v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v136 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * i), "idsIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v135, v148, 16);
    }
    while (v5);
  }

  +[PublishedLocalStatusDevice fetchRequest](PublishedLocalStatusDevice, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PublishedLocalStatusDevice predicateForPublishedLocalStatusDeviceIdentifiers:](PublishedLocalStatusDevice, "predicateForPublishedLocalStatusDeviceIdentifiers:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v11 = *(void **)(a1 + 40);
  v134 = 0;
  v90 = v9;
  objc_msgSend(v11, "executeFetchRequest:error:", v9, &v134);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v134;
  v89 = v134;
  if (v12)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v88 = v12;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v130, v147, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v131;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v131 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
          objc_msgSend(v20, "idsIdentifier", v88);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v20, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v130, v147, 16);
      }
      while (v17);
    }

    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v22 = *(id *)(a1 + 32);
    v96 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v126, v146, 16);
    if (!v96)
    {

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_83:
      v9 = v90;
      v12 = v88;
      goto LABEL_84;
    }
    v95 = *(_QWORD *)v127;
    v94 = v22;
    v92 = a1;
    v93 = v2;
    v91 = v14;
    while (2)
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v127 != v95)
          objc_enumerationMutation(v22);
        v103 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v23);
        objc_msgSend(v103, "idsIdentifier", v88);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = v23;
        v102 = v25;
        if (v25)
          v26 = v25;
        else
          v26 = -[PublishedLocalStatusDevice initWithContext:]([PublishedLocalStatusDevice alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
        v27 = v26;
        objc_msgSend(v103, "idsIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v27;
        -[PublishedLocalStatusDevice setIdsIdentifier:](v27, "setIdsIdentifier:", v28);

        v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        objc_msgSend(v103, "pendingStatuses");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v122, v145, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v123;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v123 != v33)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * k), "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v35);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v122, v145, 16);
          }
          while (v32);
        }

        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        objc_msgSend(v103, "deliveredStatuses");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v118, v144, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v119;
          do
          {
            for (m = 0; m != v38; ++m)
            {
              if (*(_QWORD *)v119 != v39)
                objc_enumerationMutation(v36);
              objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * m), "identifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v41);

            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v118, v144, 16);
          }
          while (v38);
        }

        +[PublishedLocalStatus fetchRequest](PublishedLocalStatus, "fetchRequest");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[PublishedLocalStatus predicateForPublishedLocalStatusIdentifiers:](PublishedLocalStatus, "predicateForPublishedLocalStatusIdentifiers:", v29);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setPredicate:", v43);

        v44 = *(void **)(a1 + 40);
        v117 = 0;
        objc_msgSend(v44, "executeFetchRequest:error:", v42, &v117);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v117;
        v47 = v46;
        v100 = v45;
        if (v45)
        {
          v97 = v46;
          v98 = v42;
          v48 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v113 = 0u;
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v49 = v45;
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v114;
            do
            {
              for (n = 0; n != v51; ++n)
              {
                if (*(_QWORD *)v114 != v52)
                  objc_enumerationMutation(v49);
                v54 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * n);
                objc_msgSend(v54, "identifier");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setObject:forKeyedSubscript:", v54, v55);

              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
            }
            while (v51);
          }

          v56 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          objc_msgSend(v103, "pendingStatuses");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
          if (v58)
          {
            v59 = v58;
            v60 = *(_QWORD *)v110;
            do
            {
              for (ii = 0; ii != v59; ++ii)
              {
                if (*(_QWORD *)v110 != v60)
                  objc_enumerationMutation(v57);
                objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * ii), "identifier");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectForKeyedSubscript:", v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                if (v63)
                  objc_msgSend(v56, "addObject:", v63);

              }
              v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
            }
            while (v59);
          }

          v64 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          objc_msgSend(v103, "deliveredStatuses");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v105, v141, 16);
          if (v66)
          {
            v67 = v66;
            v68 = *(_QWORD *)v106;
            do
            {
              for (jj = 0; jj != v67; ++jj)
              {
                if (*(_QWORD *)v106 != v68)
                  objc_enumerationMutation(v65);
                objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * jj), "identifier");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectForKeyedSubscript:", v70);
                v71 = (void *)objc_claimAutoreleasedReturnValue();

                if (v71)
                  objc_msgSend(v64, "addObject:", v71);

              }
              v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v105, v141, 16);
            }
            while (v67);
          }

          +[SKADatabaseManager logger](SKADatabaseManager, "logger");
          v72 = objc_claimAutoreleasedReturnValue();
          v42 = v98;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v140 = v56;
            _os_log_impl(&dword_2188DF000, v72, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatusDevices setting devices. {pendingStatuses: %@}", buf, 0xCu);
          }

          +[SKADatabaseManager logger](SKADatabaseManager, "logger");
          v73 = objc_claimAutoreleasedReturnValue();
          v14 = v91;
          v22 = v94;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v140 = v56;
            _os_log_impl(&dword_2188DF000, v73, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatusDevices setting devices. {deliveredStatuses: %@}", buf, 0xCu);
          }

          v74 = v101;
          -[PublishedLocalStatusDevice setPendingStatuses:](v101, "setPendingStatuses:", v56);
          -[PublishedLocalStatusDevice setDeliveredStatuses:](v101, "setDeliveredStatuses:", v64);

          a1 = v92;
          v2 = v93;
          v75 = v102;
          v76 = v97;
        }
        else
        {
          +[SKADatabaseManager logger](SKADatabaseManager, "logger");
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v140 = v47;
            _os_log_error_impl(&dword_2188DF000, v77, OS_LOG_TYPE_ERROR, "createOrUpdatePublishedLocalStatusDevices failed to fetch PublishedLocalStatusDevice {error: %@}", buf, 0xCu);
          }

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          v78 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v79 = v47;
          v48 = *(id *)(v78 + 40);
          *(_QWORD *)(v78 + 40) = v79;
          v22 = v94;
          v76 = v47;
          v74 = v101;
          v75 = v102;
        }

        if (!v100)
        {

          goto LABEL_83;
        }
        v23 = v99 + 1;
      }
      while (v99 + 1 != v96);
      v96 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v126, v146, 16);
      if (v96)
        continue;
      break;
    }

    v80 = *(void **)(a1 + 40);
    v104 = 0;
    v81 = objc_msgSend(v80, "save:", &v104);
    v82 = v104;
    v83 = v104;
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v84 = objc_claimAutoreleasedReturnValue();
    v85 = v84;
    if (v81)
    {
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v140 = v86;
        _os_log_impl(&dword_2188DF000, v85, OS_LOG_TYPE_DEFAULT, "createOrUpdatePublishedLocalStatusDevices saved {devices.count: %@}", buf, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2();

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v82);
    }
    v12 = v88;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v87 = v89;
      __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1();
      goto LABEL_85;
    }
  }
  v9 = v90;
LABEL_84:
  v87 = v89;
LABEL_85:

}

- (BOOL)deletePublishedLocalStatusDevices:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke;
  v13[3] = &unk_24D977DD0;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v16 = &v24;
  v17 = &v18;
  objc_msgSend(v10, "performBlockAndWait:", v13);
  v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((_BYTE *)v25 + 24))
    *a5 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  +[PublishedLocalStatusDevice fetchRequest](PublishedLocalStatusDevice, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PublishedLocalStatusDevice predicateForPublishedLocalStatusDeviceIdentifiers:](PublishedLocalStatusDevice, "predicateForPublishedLocalStatusDeviceIdentifiers:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v4 = *(void **)(a1 + 40);
  v26 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v26;
  v7 = v26;
  if (v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 40), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v10);

      v13 = *(void **)(a1 + 40);
      v21 = 0;
      v14 = objc_msgSend(v13, "save:", &v21);
      v15 = v21;
      v16 = v21;
      +[SKADatabaseManager logger](SKADatabaseManager, "logger");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v19;
          _os_log_impl(&dword_2188DF000, v18, OS_LOG_TYPE_DEFAULT, "deletePublishedLocalStatusDevices saved {deviceIdentifiers.count: %@}", buf, 0xCu);

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        objc_msgSend(*(id *)(a1 + 40), "reset");
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2();

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v15);
      }

    }
    else
    {

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (BOOL)createOrUpdateOrDeleteSubscribedLocalStatus:(id)a3 databaseContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke;
  v13[3] = &unk_24D977DD0;
  v9 = v7;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v16 = &v24;
  v17 = &v18;
  objc_msgSend(v10, "performBlockAndWait:", v13);
  v11 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((_BYTE *)v25 + 24))
    *a5 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11 != 0;
}

void __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  SubscribedLocalStatus *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  uint8_t buf[8];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  +[SubscribedLocalStatus fetchRequest](SubscribedLocalStatus, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SubscribedLocalStatus predicateForSubscribedLocalStatusIdentifier:](SubscribedLocalStatus, "predicateForSubscribedLocalStatusIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);

  v5 = *(void **)(a1 + 40);
  v47 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v2, &v47);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v47;
  v8 = v47;
  if (!v6)
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_33;
  }
  v40 = v2;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "payload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_28;
    v25 = -[SubscribedLocalStatus initWithContext:]([SubscribedLocalStatus alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "creationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SubscribedLocalStatus setCreationDate:](v25, "setCreationDate:", v26);

    objc_msgSend(*(id *)(a1 + 32), "modificationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SubscribedLocalStatus setModificationDate:](v25, "setModificationDate:", v27);

    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SubscribedLocalStatus setIdentifier:](v25, "setIdentifier:", v28);

    objc_msgSend(*(id *)(a1 + 32), "idsIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SubscribedLocalStatus setIdsIdentifier:](v25, "setIdsIdentifier:", v29);

    objc_msgSend(*(id *)(a1 + 32), "payload");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SubscribedLocalStatus setPayload:](v25, "setPayload:", v30);

    objc_msgSend(*(id *)(a1 + 32), "keyName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SubscribedLocalStatus setKeyName:](v25, "setKeyName:", v31);

    objc_msgSend(*(id *)(a1 + 32), "keyDomain");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SubscribedLocalStatus setKeyDomain:](v25, "setKeyDomain:", v32);

    goto LABEL_23;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (!v10)
  {

    goto LABEL_28;
  }
  v11 = v10;
  v39 = v8;
  v12 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v44 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(*(id *)(a1 + 32), "payload", v39);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "payload");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "payload");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToData:", v17);

        if ((v18 & 1) != 0)
        {
          v19 = 0;
          continue;
        }
        objc_msgSend(*(id *)(a1 + 32), "payload");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPayload:", v20);

        objc_msgSend(*(id *)(a1 + 32), "idsIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIdsIdentifier:", v21);

        objc_msgSend(*(id *)(a1 + 32), "modificationDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setModificationDate:", v22);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v14);
      }
      v19 = 1;
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  }
  while (v11);

  v8 = v39;
  if (!v19)
  {
LABEL_28:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v2 = v40;
    goto LABEL_33;
  }
LABEL_23:
  v33 = *(void **)(a1 + 40);
  v42 = 0;
  v34 = objc_msgSend(v33, "save:", &v42);
  v35 = v42;
  v36 = v42;
  +[SKADatabaseManager logger](SKADatabaseManager, "logger");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v34)
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188DF000, v38, OS_LOG_TYPE_DEFAULT, "createOrUpdateOrDeleteSubscribedLocalStatus saved", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_2();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v35);
  }
  v2 = v40;
  objc_msgSend(*(id *)(a1 + 40), "reset");

LABEL_33:
}

- (id)allSubscribedLocalStatusesInDatabaseContext:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke;
  v10[3] = &unk_24D977DA8;
  v6 = v5;
  v11 = v6;
  v12 = &v20;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v7 = (void *)v21[5];
  if (v7)
  {
    v8 = v7;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v15[5]);
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKADatabaseSubscribedLocalStatus *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[SubscribedLocalStatus fetchRequest](SubscribedLocalStatus, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[4];
  v24 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  v6 = v24;
  v7 = v6;
  if (v4)
  {
    v19 = v6;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = -[SKADatabaseSubscribedLocalStatus initWithCoreDataSubscirbedLocalStatus:]([SKADatabaseSubscribedLocalStatus alloc], "initWithCoreDataSubscirbedLocalStatus:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    v15 = *(_QWORD *)(a1[5] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v8;
    v7 = v19;
  }
  else
  {
    +[SKADatabaseManager logger](SKADatabaseManager, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
    v18 = *(_QWORD *)(a1[5] + 8);
    v16 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;
  }

}

+ (id)logger
{
  if (logger_onceToken_25 != -1)
    dispatch_once(&logger_onceToken_25, &__block_literal_global_25);
  return (id)logger__logger_25;
}

void __28__SKADatabaseManager_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKADatabaseManager");
  v1 = (void *)logger__logger_25;
  logger__logger_25 = (uint64_t)v0;

}

- (SKADatabaseProviding)databaseProvider
{
  return self->_databaseProvider;
}

- (SKADatabaseManagingDelegate)delegate
{
  return (SKADatabaseManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (void)_existingPersonalChannelForStatusTypeIdentifier:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching personal status channel. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingDecomissionedPersonalChannelsWithDatabaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching decomissioned channel. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __83__SKADatabaseManager_deletePersonalChannelForStatusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find existing channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_existingPersonalChannelForDatabaseChannel:(void *)a1 databaseContext:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_2188DF000, a2, OS_LOG_TYPE_FAULT, "More than one personal channel exists for channel identifier: %@", v4, 0xCu);

  OUTLINED_FUNCTION_12_0();
}

- (void)_existingChannelsForChannelIdentifier:isPersonal:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Fetch request for channels by identifier returned a nil result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_existingChannelsForChannelIdentifier:isPersonal:databaseContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error executing fetch for subscription validation. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingChannelsForChannelIdentifier:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Fetch request for channels by identifier %@ returned a nil result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Invitation does not correspond to any channel. InvitationIdentifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __84__SKADatabaseManager_existingChannelForHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find any channels associated with channel identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __106__SKADatabaseManager_allExistingChannelsForStatusTypeIdentifier_includingPersonalChannel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error executing fetch for channel by handle. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __114__SKADatabaseManager_createPersonalChannelForStatusTypeIdentifier_channelIdentifier_channelToken_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing new personal channel. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __165__SKADatabaseManager_createPresenceChannelForPresenceIdentifier_channelIdentifier_channelToken_peerKey_serverKey_membershipKey_creationDate_options_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing new presence channel. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __93__SKADatabaseManager_createChannelForStatusTypeIdentifier_channelIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing channel invitation. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __92__SKADatabaseManager_updatePersonalChannel_withCurrentOutgoingRatchetState_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for updated outgoing ratchet state. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __93__SKADatabaseManager_decomissionAllPersonalChannelsWithStatusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for decomissioning. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__SKADatabaseManager_generatedEncryptionKeysForPersonalChannel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find generated ratchet keys matching database channel. Channel: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __94__SKADatabaseManager_allPersistentSubscriptionAssertionChannelIdentifiersWithDatabaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching subscription assertions. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __134__SKADatabaseManager_createSubscriptionAssertionForSubscriptionIdentifier_applicationIdentifier_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing persistent subscription assertion. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __114__SKADatabaseManager_deleteSubscriptionAssertionWithSubscriptionIdentifier_applicationIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find existing assertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_existingTransientSubscriptionHistoryForChannelIdentifier:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching transientSubscriptionHistory. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingTransientSubscriptionHistoryWithLimit:orderedByLastSubscriptionDateAscending:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching transientSubscriptionHistories. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __122__SKADatabaseManager_createOrUpdateTransientSubscriptionHistoryForChannelIdentifier_lastSubscriptionDate_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing transient subscription history. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __105__SKADatabaseManager_createInvitedUserWithHandle_senderHandle_invitationPayload_channel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing invited user. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __76__SKADatabaseManager_copyInvitedUsersFromChannel_toChannel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for copyinh invited users. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error finding core data invited user to update invitation. No match for SKADatabaseInvitedUser: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for updating invitation payload on invited user. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __92__SKADatabaseManager_updateInvitationPayload_onExistingInvitedUser_channel_databaseContext___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  v6 = 2112;
  v7 = v4;
  _os_log_error_impl(&dword_2188DF000, a3, OS_LOG_TYPE_ERROR, "Multiple (%ld) entries in the database match a single invited user, updating all of them. InvitedUser: %@", v5, 0x16u);
  OUTLINED_FUNCTION_12_0();
}

void __77__SKADatabaseManager_existingInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error finding core data channel matching SKADatabaseChannel: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingInvitedUsersForDatabaseInvitedUser:databaseChannel:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching invited user. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingInvitedUsersForInvitedHandle:(void *)a1 channel:(NSObject *)a2 databaseContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "handleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2188DF000, a2, OS_LOG_TYPE_ERROR, "Failed to normalize handle: \"%@\", returning nil existing invited user", v4, 0xCu);

  OUTLINED_FUNCTION_12_0();
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find existing database channel matching channel %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find existing invited user matching handle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__SKADatabaseManager_deleteInvitedUserForHandle_personalChannel_databaseContext___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for deleting invited users by handle. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2188DF000, v0, v1, "Could not find any existing invited users to delete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__SKADatabaseManager_deleteAllInvitedUsersForPersonalChannel_databaseContext___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for deleting all invited users. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __148__SKADatabaseManager_createStatusWithUniqueIdentifier_dateCreated_datePublished_dateReceived_dateExpired_rawData_channelIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing status. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__SKADatabaseManager_existingStatusForChannel_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error executing fetch for status by channel. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __72__SKADatabaseManager_existingStatusForUniqueIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error executing fetch for status by unique id. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing checkpoint. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __80__SKADatabaseManager_setCurrentCheckpointForChannel_checkpoint_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for channel checkpoint. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingChannelCheckpointForChannelIdentifier:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching pending requests. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for status cleanup. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __114__SKADatabaseManager_cleanupOldStatusUpdatesForChannelIdentifier_excludingStatusUniqueIdentifier_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error executing fetch for status cleanup. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __131__SKADatabaseManager_createPendingPublishRequestWithUniqueIdentifier_dateCreated_payloadData_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing pending publish request. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find existing pending publish request with identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __90__SKADatabaseManager_deletePendingPublishRequestWithWithUniqueIdentifier_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for deleting pending publish request. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __99__SKADatabaseManager_incrementPendingPublishRequestRetryCountWithUniqueIdentifier_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for incrementing pending publish request. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __99__SKADatabaseManager_createRemovedUserWithHandle_dateRemoved_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing removed user. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find existing removed user with handle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__SKADatabaseManager_deleteRemovedUserWithHandle_statusTypeIdentifier_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for deleting removed user. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingRemovedUsersForHandle:statusTypeIdentifier:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching removed users. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingReceivedInvitationsForHandle:statusTypeIdentifier:databaseContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error executing fetch for ReceivedInvitation by handle. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for storing received invitation. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __232__SKADatabaseManager_createReceivedInvitationForChannel_senderHandle_invitedHandle_invitationIdentifier_dateInvitationCreated_incomingRatchetState_presenceIdentifier_channelToken_serverKey_peerKey_invitationPayload_databaseContext___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find core data channel to match channel identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_existingReceivedInvitationsForChannelIdentifier:sortedByDateReceived:databaseContect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Could not find any existing channels matching channel identifier. Returning no received invitations. Channel identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __108__SKADatabaseManager_cleanupOldReceivedInvitationsForChannelIdentifier_excludingInvitation_databaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for invitation cleanup. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __70__SKADatabaseManager_cleanupDecommisionedChannelsWithDatabaseContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error saving managed object context for decomissioned channel cleanup. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71__SKADatabaseManager_allPublishedLocalStatusesInDatabaseContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "Error fetching all published local statuses. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "createOrUpdatePublishedLocalStatuses failed to fetch local statuses {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__SKADatabaseManager_createOrUpdatePublishedLocalStatuses_databaseContext_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "createOrUpdatePublishedLocalStatuses save failed {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __76__SKADatabaseManager_allPublishedLocalStatusDevicesInDatabaseContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "allPublishedLocalStatusDevicesInDatabaseContext failed to fetch PublishedLocalStatusDevice. {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "createOrUpdatePublishedLocalStatusDevices failed to fetch published local status devices {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__SKADatabaseManager_createOrUpdatePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "createOrUpdatePublishedLocalStatusDevices save failed {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "deletePublishedLocalStatusDevices failed to PublishedLocalStatusDevice {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __78__SKADatabaseManager_deletePublishedLocalStatusDevices_databaseContext_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "deletePublishedLocalStatusDevices save failed {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "createOrUpdateOrDeleteSubscribedLocalStatus failed to SubscribedLocalStatus {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __88__SKADatabaseManager_createOrUpdateOrDeleteSubscribedLocalStatus_databaseContext_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "createOrUpdateOrDeleteSubscribedLocalStatus save failed {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __72__SKADatabaseManager_allSubscribedLocalStatusesInDatabaseContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2188DF000, v0, v1, "allSubscribedLocalStatusesInDatabaseContext failed to fetch SKADatabaseSubscribedLocalStatus. {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
