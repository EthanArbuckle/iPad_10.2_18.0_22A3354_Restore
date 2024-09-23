@implementation PDSCDCacheContainer

- (PDSCDCacheContainer)initWithContainingPath:(id)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  PDSCDCacheContainer *v9;
  PDSCDCacheContainer *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSCDCache.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containingPath"));

  }
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSCDCache.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containingPath.absoluteString.length > 0"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PDSCDCacheContainer;
  v9 = -[PDSCDCacheContainer init](&v14, sel_init);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_containingPath, a3);

  return v10;
}

- (id)loadWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PDSCDCacheReferenceProxy *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  -[PDSCDCacheContainer container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x24BDBB6B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergedModelFromBundles:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "entities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v10, "count") == 0;

    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E518], -404, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v13 = (void *)v22[5];
      v22[5] = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBB700], "persistentContainerWithName:managedObjectModel:", CFSTR("PDSCDCache"), v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSCDCacheContainer containingPath](self, "containingPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBB740], "persistentStoreDescriptionWithURL:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setType:", *MEMORY[0x24BDBB580]);
      v27 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPersistentStoreDescriptions:", v15);

      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __37__PDSCDCacheContainer_loadWithError___block_invoke;
      v20[3] = &unk_24D4A7280;
      v20[4] = &v21;
      objc_msgSend(v5, "loadPersistentStoresWithCompletionHandler:", v20);
      -[PDSCDCacheContainer setContainer:](self, "setContainer:", v5);

    }
  }
  v17 = (void *)v22[5];
  if (v17)
  {
    v18 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v17);
  }
  else
  {
    v18 = -[PDSCDCacheReferenceProxy initWithCacheContainer:persistentContainer:]([PDSCDCacheReferenceProxy alloc], "initWithCacheContainer:persistentContainer:", self, v5);
  }

  _Block_object_dispose(&v21, 8);
  return v18;
}

void __37__PDSCDCacheContainer_loadWithError___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (id)loadAllEntriesUser:(id)a3
{
  id v4;
  id v5;
  void *v6;
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
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__PDSCDCacheContainer_loadAllEntriesUser___block_invoke;
  v8[3] = &unk_24D4A72A8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v8);
  v6 = (void *)objc_msgSend((id)v12[5], "copy");

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __42__PDSCDCacheContainer_loadAllEntriesUser___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_cdRegistrationsMatchingUser:withClientID:inContext:", v4, 0, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_entriesFromRegistrations:inContext:", v9, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)loadAllEntriesUser:(id)a3 withClientID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  PDSCDCacheContainer *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __55__PDSCDCacheContainer_loadAllEntriesUser_withClientID___block_invoke;
  v15 = &unk_24D4A72D0;
  v16 = self;
  v8 = v6;
  v17 = v8;
  v9 = v7;
  v18 = v9;
  v19 = &v20;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", &v12);
  v10 = (void *)objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15, v16);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __55__PDSCDCacheContainer_loadAllEntriesUser_withClientID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a2;
  objc_msgSend(v3, "_cdRegistrationsMatchingUser:withClientID:inContext:", v4, v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_entriesFromRegistrations:inContext:", v10, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)loadAllEntriesForClientID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  PDSCDCacheContainer *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__PDSCDCacheContainer_loadAllEntriesForClientID___block_invoke;
  v8[3] = &unk_24D4A72F8;
  v5 = v4;
  v10 = self;
  v11 = &v12;
  v9 = v5;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v8);
  v6 = (void *)objc_msgSend((id)v13[5], "copy");

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __49__PDSCDCacheContainer_loadAllEntriesForClientID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[PDSCDRegistration registrationsForClientID:](PDSCDRegistration, "registrationsForClientID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v4);

  objc_msgSend(v3, "executeFetchRequest:error:", v9, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_entriesFromRegistrations:inContext:", v5, v3);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)loadAllActiveUsersForClientID:(id)a3
{
  return -[PDSCDCacheContainer _usersForClientID:activeOnly:](self, "_usersForClientID:activeOnly:", a3, 1);
}

- (id)loadAllUsersForClientID:(id)a3
{
  return -[PDSCDCacheContainer _usersForClientID:activeOnly:](self, "_usersForClientID:activeOnly:", a3, 0);
}

- (id)loadAllActiveUsers
{
  return -[PDSCDCacheContainer _usersForClientID:activeOnly:](self, "_usersForClientID:activeOnly:", 0, 1);
}

- (id)loadAllUsers
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__PDSCDCacheContainer_loadAllUsers__block_invoke;
  v4[3] = &unk_24D4A7320;
  v4[4] = &v5;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v4);
  v2 = (void *)objc_msgSend((id)v6[5], "copy");
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__PDSCDCacheContainer_loadAllUsers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[PDSCDUser fetchRequest](PDSCDUser, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v15, "user");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v18 = v16;
        }
        else
        {
          v17 = v9;
          v18 = v15;
        }
        objc_msgSend(v17, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v21);
    }

    v24 = 0;
    objc_msgSend(v3, "save:", &v24);
  }

}

- (id)loadAllEntries
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__PDSCDCacheContainer_loadAllEntries__block_invoke;
  v4[3] = &unk_24D4A7348;
  v4[4] = self;
  v4[5] = &v5;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v4);
  v2 = (void *)objc_msgSend((id)v6[5], "copy");
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __37__PDSCDCacheContainer_loadAllEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_entriesFromRegistrations:inContext:", v8, v3);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)loadPendingEntries
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__PDSCDCacheContainer_loadPendingEntries__block_invoke;
  v4[3] = &unk_24D4A7348;
  v4[4] = self;
  v4[5] = &v5;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v4);
  v2 = (void *)objc_msgSend((id)v6[5], "copy");
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__PDSCDCacheContainer_loadPendingEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[PDSCDRegistration pendingRegistrations](PDSCDRegistration, "pendingRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v4);

  objc_msgSend(v3, "executeFetchRequest:error:", v9, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_entriesFromRegistrations:inContext:", v5, v3);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)hasPendingEntries
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__PDSCDCacheContainer_hasPendingEntries__block_invoke;
  v4[3] = &unk_24D4A7320;
  v4[4] = &v5;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v4);
  v2 = v6[3] != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__PDSCDCacheContainer_hasPendingEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PDSCDRegistration pendingRegistrations](PDSCDRegistration, "pendingRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v4);

  objc_msgSend(v6, "setResultType:", 4);
  v5 = objc_msgSend(v3, "countForFetchRequest:error:", v6, 0);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
}

- (BOOL)hasActiveEntries
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__PDSCDCacheContainer_hasActiveEntries__block_invoke;
  v4[3] = &unk_24D4A7320;
  v4[4] = &v5;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v4);
  v2 = v6[3] != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__PDSCDCacheContainer_hasActiveEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PDSCDRegistration activeRegistrations](PDSCDRegistration, "activeRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v4);

  objc_msgSend(v6, "setResultType:", 4);
  v5 = objc_msgSend(v3, "countForFetchRequest:error:", v6, 0);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
}

- (BOOL)storeEntry:(id)a3 withError:(id *)a4
{
  return -[PDSCDCacheContainer storeEntry:transitionBlock:withError:](self, "storeEntry:transitionBlock:withError:", a3, &__block_literal_global_3, a4);
}

uint64_t __44__PDSCDCacheContainer_storeEntry_withError___block_invoke()
{
  return 0;
}

- (BOOL)storeEntry:(id)a3 transitionBlock:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__PDSCDCacheContainer_storeEntry_transitionBlock_withError___block_invoke;
  v15[3] = &unk_24D4A73B0;
  v15[4] = self;
  v10 = v8;
  v16 = v10;
  v11 = v9;
  v17 = v11;
  v18 = &v20;
  v19 = &v26;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v15);
  if (a5)
  {
    v12 = (void *)v21[5];
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
  if (*((_BYTE *)v27 + 24))
    v13 = v21[5] == 0;
  else
    v13 = 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __60__PDSCDCacheContainer_storeEntry_transitionBlock_withError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  id v11;
  id obj;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v4, "_storeEntry:transitionBlock:context:withError:", v5, v6, v3, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    v9 = *(_QWORD *)(a1[7] + 8);
    v11 = *(id *)(v9 + 40);
    v10 = objc_msgSend(v3, "save:", &v11);
    objc_storeStrong((id *)(v9 + 40), v11);
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v10;
  }

}

- (BOOL)storeEntries:(id)a3 transitionBlock:(id)a4 deleteEntries:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  PDSCDCacheContainer *v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__PDSCDCacheContainer_storeEntries_transitionBlock_deleteEntries_withError___block_invoke;
  v19[3] = &unk_24D4A73D8;
  v13 = v10;
  v20 = v13;
  v21 = self;
  v14 = v11;
  v23 = v14;
  v24 = &v26;
  v15 = v12;
  v22 = v15;
  v25 = &v32;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v19);
  if (a6)
  {
    v16 = (void *)v27[5];
    if (v16)
      *a6 = objc_retainAutorelease(v16);
  }
  if (*((_BYTE *)v33 + 24))
    v17 = v27[5] == 0;
  else
    v17 = 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

void __76__PDSCDCacheContainer_storeEntries_transitionBlock_deleteEntries_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v8);
      v10 = *(void **)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v12 + 40);
      v13 = objc_msgSend(v10, "_storeEntry:transitionBlock:context:withError:", v9, v11, v3, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      if (!v13)
        goto LABEL_18;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(a1 + 48);
  v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
LABEL_11:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v16)
        objc_enumerationMutation(v4);
      v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v17);
      v19 = *(void **)(a1 + 40);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v25 = *(id *)(v20 + 40);
      v21 = objc_msgSend(v19, "_deleteEntry:context:withError:", v18, v3, &v25);
      objc_storeStrong((id *)(v20 + 40), v25);
      if (!v21)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v15)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:

    objc_msgSend(v3, "rollback");
    goto LABEL_19;
  }
LABEL_17:

  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v24 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v3, "save:", &v24);
  objc_storeStrong((id *)(v22 + 40), v24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v23;
LABEL_19:

}

- (BOOL)deleteEntry:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__PDSCDCacheContainer_deleteEntry_withError___block_invoke;
  v11[3] = &unk_24D4A7400;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  v13 = &v15;
  v14 = &v21;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v11);
  if (a4)
  {
    v8 = (void *)v16[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  if (*((_BYTE *)v22 + 24))
    v9 = v16[5] == 0;
  else
    v9 = 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __45__PDSCDCacheContainer_deleteEntry_withError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  id v10;
  id obj;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "_deleteEntry:context:withError:", v5, v3, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    v8 = *(_QWORD *)(a1[6] + 8);
    v10 = *(id *)(v8 + 40);
    v9 = objc_msgSend(v3, "save:", &v10);
    objc_storeStrong((id *)(v8 + 40), v10);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
  }

}

- (BOOL)deleteEntriesForUser:(id)a3 withState:(unsigned __int8)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  unsigned __int8 v17;
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

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__PDSCDCacheContainer_deleteEntriesForUser_withState_withError___block_invoke;
  v13[3] = &unk_24D4A7428;
  v13[4] = self;
  v9 = v8;
  v17 = a4;
  v14 = v9;
  v15 = &v18;
  v16 = &v24;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v13);
  if (a5)
  {
    v10 = (void *)v19[5];
    if (v10)
      *a5 = objc_retainAutorelease(v10);
  }
  if (*((_BYTE *)v25 + 24))
    v11 = v19[5] == 0;
  else
    v11 = 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __64__PDSCDCacheContainer_deleteEntriesForUser_withState_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_cdRegistrationsMatchingUser:withClientID:inContext:", *(_QWORD *)(a1 + 40), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_entriesFromRegistrations:inContext:", v4, v3);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "state") == *(unsigned __int8 *)(a1 + 64))
        {
          v11 = *(void **)(a1 + 32);
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          obj = *(id *)(v12 + 40);
          v13 = objc_msgSend(v11, "_deleteEntry:context:withError:", v10, v3, &obj);
          objc_storeStrong((id *)(v12 + 40), obj);
          if ((v13 & 1) == 0)
          {

            objc_msgSend(v3, "rollback");
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v3, "save:", &v16);
  objc_storeStrong((id *)(v14 + 40), v16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;
LABEL_12:

}

- (void)deleteCache
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PDSCDCacheContainer container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    pds_defaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E64000, v3, OS_LOG_TYPE_DEFAULT, "Deleting PDS Core data stores!", buf, 2u);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v2, "persistentStoreDescriptions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          objc_msgSend(v2, "persistentStoreCoordinator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "URL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "destroyPersistentStoreAtURL:withType:options:error:", v11, v12, 0, 0);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_storeEntry:(id)a3 transitionBlock:(id)a4 context:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  id v28;
  id *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id *v45;
  id v46;
  PDSCDCacheContainer *v47;
  id v48;
  id v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v47 = self;
  v48 = a5;
  -[PDSCDCacheContainer _cdRegistrationsMatchingEntry:inContext:](self, "_cdRegistrationsMatchingEntry:inContext:", v10);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v12)
  {
    v13 = v12;
    v45 = a6;
    v46 = v11;
    v14 = 0;
    v49 = 0;
    v15 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v17, "user", v45);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "user");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "user");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToUser:", v20);

        if (v21)
        {
          v22 = objc_msgSend(v17, "entryState");
          if (v22 == objc_msgSend(v10, "state"))
          {
            v23 = v17;

            v14 = v23;
          }
          else if (v49)
          {
            objc_msgSend(v17, "setUser:", 0);
            objc_msgSend(v48, "deleteObject:", v17);
          }
          else
          {
            v49 = v17;
          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v13);
    if (v14)
    {
      objc_msgSend(v14, "clientID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (v26)
        v27 = -400;
      else
        v27 = -401;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E518], v27, 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v45;
      if (v49)
        objc_msgSend(v48, "deleteObject:");
      else
        v49 = 0;
      v11 = v46;
LABEL_33:
      v34 = v28 != 0;
      if (v29 && v28)
      {
        v28 = objc_retainAutorelease(v28);
        *v29 = v28;
        v34 = 1;
      }
      v33 = v49;
      goto LABEL_37;
    }
    v29 = v45;
    v11 = v46;
    if (v49)
    {
      objc_msgSend(v49, "clientID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if (v32)
      {
        if (v46
          && (*((unsigned int (**)(id, _QWORD, uint64_t))v46 + 2))(v46, objc_msgSend(v49, "entryState"), objc_msgSend(v10, "state")))
        {
          objc_msgSend(v49, "setEntryState:", objc_msgSend(v10, "state"));
          v33 = v49;
          v34 = 0;
          v28 = 0;
          v14 = 0;
          goto LABEL_37;
        }
        v41 = (void *)MEMORY[0x24BDD1540];
        v42 = *MEMORY[0x24BE6E518];
        v43 = -402;
      }
      else
      {
        v41 = (void *)MEMORY[0x24BDD1540];
        v42 = *MEMORY[0x24BE6E518];
        v43 = -401;
      }
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, v43, 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  +[PDSCDRegistration registrationFromEntry:insertIntoManagedObjectContext:](PDSCDRegistration, "registrationFromEntry:insertIntoManagedObjectContext:", v10, v48);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "user");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "userID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "user");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSCDCacheContainer _cdUsersMatchingUserID:userType:inContext:](v47, "_cdUsersMatchingUserID:userType:inContext:", v37, objc_msgSend(v38, "userType"), v48);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    objc_msgSend(v10, "user");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDSCDUser userFromUser:insertIntoManagedObjectContext:](PDSCDUser, "userFromUser:insertIntoManagedObjectContext:", v40, v48);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v35, "setUser:", v39);

  v34 = 0;
  v28 = 0;
  v14 = 0;
  v33 = 0;
LABEL_37:

  return !v34;
}

- (BOOL)_deleteEntry:(id)a3 context:(id)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  BOOL v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v35 = a4;
  v36 = v8;
  -[PDSCDCacheContainer _cdRegistrationsMatchingEntry:inContext:](self, "_cdRegistrationsMatchingEntry:inContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count")
    || (objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E518], -403, 0),
        (v33 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v16, "user");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "user");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "user");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (v20)
          {
            objc_msgSend(v16, "user");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v21);

            objc_msgSend(v16, "setUser:", 0);
            objc_msgSend(v35, "deleteObject:", v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v13);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v27, "registrations");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          if (!v29)
            objc_msgSend(v35, "deleteObject:", v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v24);
    }

    v30 = 0;
    v31 = 1;
    v9 = v34;
  }
  else
  {
    v30 = v33;
    if (a5)
    {
      v30 = objc_retainAutorelease(v33);
      v31 = 0;
      *a5 = v30;
    }
    else
    {
      v31 = 0;
    }
  }

  return v31;
}

- (BOOL)updateEntryState:(unsigned __int8)a3 forUser:(id)a4 withError:(id *)a5
{
  return -[PDSCDCacheContainer _updateEntryState:forUser:clientID:withError:](self, "_updateEntryState:forUser:clientID:withError:", a3, a4, 0, a5);
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__PDSCDCacheContainer_setNumber_forKey___block_invoke;
  v8[3] = &unk_24D4A7450;
  v9 = v6;
  v7 = v6;
  -[PDSCDCacheContainer _KVEntryForKey:withBlock:](self, "_KVEntryForKey:withBlock:", a4, v8);

}

void __40__PDSCDCacheContainer_setNumber_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setNumValue:", v2);
  objc_msgSend(v3, "setStringValue:", 0);
  objc_msgSend(v3, "setDataValue:", 0);

}

- (id)numberForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__PDSCDCacheContainer_numberForKey___block_invoke;
  v7[3] = &unk_24D4A7478;
  v7[4] = &v8;
  -[PDSCDCacheContainer _KVEntryForKey:withBlock:](self, "_KVEntryForKey:withBlock:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __36__PDSCDCacheContainer_numberForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "numValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__PDSCDCacheContainer_setString_forKey___block_invoke;
  v8[3] = &unk_24D4A7450;
  v9 = v6;
  v7 = v6;
  -[PDSCDCacheContainer _KVEntryForKey:withBlock:](self, "_KVEntryForKey:withBlock:", a4, v8);

}

void __40__PDSCDCacheContainer_setString_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setNumValue:", 0);
  objc_msgSend(v3, "setStringValue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setDataValue:", 0);

}

- (id)stringForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__PDSCDCacheContainer_stringForKey___block_invoke;
  v7[3] = &unk_24D4A7478;
  v7[4] = &v8;
  -[PDSCDCacheContainer _KVEntryForKey:withBlock:](self, "_KVEntryForKey:withBlock:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __36__PDSCDCacheContainer_stringForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stringValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__PDSCDCacheContainer_setData_forKey___block_invoke;
  v8[3] = &unk_24D4A7450;
  v9 = v6;
  v7 = v6;
  -[PDSCDCacheContainer _KVEntryForKey:withBlock:](self, "_KVEntryForKey:withBlock:", a4, v8);

}

void __38__PDSCDCacheContainer_setData_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setNumValue:", 0);
  objc_msgSend(v3, "setStringValue:", 0);
  objc_msgSend(v3, "setDataValue:", *(_QWORD *)(a1 + 32));

}

- (id)dataForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__PDSCDCacheContainer_dataForKey___block_invoke;
  v7[3] = &unk_24D4A7478;
  v7[4] = &v8;
  -[PDSCDCacheContainer _KVEntryForKey:withBlock:](self, "_KVEntryForKey:withBlock:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __34__PDSCDCacheContainer_dataForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "dataValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)allStoredValues
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = (id)0xAAAAAAAAAAAAAAAALL;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__PDSCDCacheContainer_allStoredValues__block_invoke;
  v5[3] = &unk_24D4A7320;
  v5[4] = &v6;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v5);
  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__PDSCDCacheContainer_allStoredValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[PDSCDKV fetchRequest](PDSCDKV, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13
            || (objc_msgSend(v11, "dataValue"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            || (objc_msgSend(v11, "numValue"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
            objc_msgSend(v11, "key");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

}

- (id)_entriesFromRegistrations:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v15, "entryWithUserCache:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v7;
          v18 = v16;
        }
        else
        {
          v17 = v8;
          v18 = v15;
        }
        objc_msgSend(v17, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v8;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v6, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v21);
    }

    v25 = 0;
    objc_msgSend(v6, "save:", &v25);
  }

  return v7;
}

- (BOOL)_updateEntryState:(unsigned __int8)a3 forUser:(id)a4 clientID:(id)a5 withError:(id *)a6
{
  unsigned int v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v11 = a4;
  v12 = a5;
  if (v8 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSCDCache.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state <= PDSEntryStateHeartbeat"));

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __68__PDSCDCacheContainer__updateEntryState_forUser_clientID_withError___block_invoke;
  v19[3] = &unk_24D4A74A0;
  v19[4] = self;
  v13 = v11;
  v20 = v13;
  v14 = v12;
  v24 = v8;
  v21 = v14;
  v22 = &v31;
  v23 = &v25;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v19);
  if (a6)
  {
    v15 = (void *)v26[5];
    if (v15)
      *a6 = objc_retainAutorelease(v15);
  }
  if (*((_BYTE *)v32 + 24))
    v16 = v26[5] == 0;
  else
    v16 = 0;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __68__PDSCDCacheContainer__updateEntryState_forUser_clientID_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_cdRegistrationsMatchingUser:withClientID:inContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "setEntryState:", *(unsigned __int8 *)(a1 + 72));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v3, "save:", &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;

}

- (BOOL)_updateAllEntriesWithState:(unsigned __int8)a3 toState:(unsigned __int8)a4 withError:(id *)a5
{
  unsigned int v6;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  _QWORD v15[6];
  unsigned __int8 v16;
  char v17;
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

  v6 = a4;
  if (a3 >= 4u)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSCDCache.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state <= PDSEntryStateHeartbeat"));

  }
  if (v6 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSCDCache.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newState <= PDSEntryStateHeartbeat"));

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__PDSCDCacheContainer__updateAllEntriesWithState_toState_withError___block_invoke;
  v15[3] = &unk_24D4A74C8;
  v16 = a3;
  v17 = v6;
  v15[4] = &v24;
  v15[5] = &v18;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v15);
  if (a5)
  {
    v10 = (void *)v19[5];
    if (v10)
      *a5 = objc_retainAutorelease(v10);
  }
  if (*((_BYTE *)v25 + 24))
    v11 = v19[5] == 0;
  else
    v11 = 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __68__PDSCDCacheContainer__updateAllEntriesWithState_toState_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDSCDRegistration registrationsWithState:](PDSCDRegistration, "registrationsWithState:", *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "setEntryState:", *(unsigned __int8 *)(a1 + 49));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v3, "save:", &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;

}

- (id)_cdRegistrationsMatchingUser:(id)a3 withClientID:(id)a4 inContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  int v24;
  BOOL v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[PDSCDRegistration registrationsForClientID:](PDSCDRegistration, "registrationsForClientID:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v11);

  }
  v28 = v9;
  v29 = v8;
  objc_msgSend(v9, "executeFetchRequest:error:", v10, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      v16 = 0;
      v31 = v14;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
        objc_msgSend(v17, "user");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "userID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "userID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) != 0)
        {
          objc_msgSend(v17, "user");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "userType");
          v23 = v7;
          v24 = objc_msgSend(v7, "userType");

          v25 = v22 == v24;
          v14 = v31;
          v7 = v23;
          if (v25)
            objc_msgSend(v30, "addObject:", v17);
        }
        else
        {

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  return v30;
}

- (id)_loadUsersIncludingOnlyActive:(BOOL)a3
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__PDSCDCacheContainer__loadUsersIncludingOnlyActive___block_invoke;
  v5[3] = &unk_24D4A7320;
  v5[4] = &v6;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v5);
  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__PDSCDCacheContainer__loadUsersIncludingOnlyActive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[PDSCDUser fetchRequest](PDSCDUser, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeFetchRequest:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v15, "user");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v18 = v16;
        }
        else
        {
          v17 = v9;
          v18 = v15;
        }
        objc_msgSend(v17, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v21);
    }

    v24 = 0;
    objc_msgSend(v3, "save:", &v24);
  }

}

- (id)_usersForClientID:(id)a3 activeOnly:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__PDSCDCacheContainer__usersForClientID_activeOnly___block_invoke;
  v10[3] = &unk_24D4A74F0;
  v7 = v6;
  v13 = a4;
  v11 = v7;
  v12 = &v14;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v10);
  objc_msgSend((id)v15[5], "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __52__PDSCDCacheContainer__usersForClientID_activeOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 48))
      +[PDSCDRegistration activeRegistrationsForClientID:](PDSCDRegistration, "activeRegistrationsForClientID:");
    else
      +[PDSCDRegistration registrationsForClientID:](PDSCDRegistration, "registrationsForClientID:");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    +[PDSCDRegistration activeRegistrations](PDSCDRegistration, "activeRegistrations");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v7 = (void *)v6;
    objc_msgSend(v5, "setPredicate:", v6);

    goto LABEL_9;
  }
  objc_msgSend(v4, "setPredicate:", 0);
LABEL_9:
  objc_msgSend(v3, "executeFetchRequest:error:", v5, 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v18, "user");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "user");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v22 = v20;
        }
        else
        {
          v21 = v12;
          v22 = v18;
        }
        objc_msgSend(v21, "addObject:", v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v12, "count"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v12;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v25);
    }

    v29 = 0;
    objc_msgSend(v3, "save:", &v29);
  }

}

- (id)_cdUsersMatchingUserID:(id)a3 userType:(signed __int16)a4 inContext:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[PDSCDUser fetchRequest](PDSCDUser, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDSCDUser predicateForUserID:userType:](PDSCDUser, "predicateForUserID:userType:", v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v7, "executeFetchRequest:error:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_cdRegistrationsMatchingEntry:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[PDSCDRegistration fetchRequest](PDSCDRegistration, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDSCDRegistration uniquenessPredicateForEntry:](PDSCDRegistration, "uniquenessPredicateForEntry:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v5, "executeFetchRequest:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_KVEntryForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__PDSCDCacheContainer__KVEntryForKey_withBlock___block_invoke;
  v10[3] = &unk_24D4A7518;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PDSCDCacheContainer _syncBlockWithContext:](self, "_syncBlockWithContext:", v10);

}

void __48__PDSCDCacheContainer__KVEntryForKey_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = 0x253E64000uLL;
  +[PDSCDKV fetchRequest](PDSCDKV, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDSCDKV predicateForKey:](PDSCDKV, "predicateForKey:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v26 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v5, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v10)
  {

    v13 = 0;
    goto LABEL_14;
  }
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v23 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      if (v12)
      {
        objc_msgSend(v3, "deleteObject:", v16);
        v13 = 1;
      }
      else
      {
        v12 = v16;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  }
  while (v11);

  if (!v12)
  {
    v4 = 0x253E64000;
LABEL_14:
    objc_msgSend((id)(v4 + 3104), "insertIntoManagedObjectContext:", v3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKey:", *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((v13 & 1) != 0)
    v17 = 1;
  else
    v17 = objc_msgSend(v12, "hasChanges");
  objc_msgSend(v12, "dataValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 || (objc_msgSend(v12, "stringValue"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v12, "numValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      objc_msgSend(v3, "deleteObject:", v12);
  }
  if (v17)
  {
    v21 = v8;
    objc_msgSend(v3, "save:", &v21);
    v19 = v21;

    v8 = v19;
  }

}

- (void)_syncBlockWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PDSCDCacheContainer container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newBackgroundContext");

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__PDSCDCacheContainer__syncBlockWithContext___block_invoke;
  v9[3] = &unk_24D4A7540;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  v8 = v4;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

uint64_t __45__PDSCDCacheContainer__syncBlockWithContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (NSURL)containingPath
{
  return self->_containingPath;
}

- (void)setContainingPath:(id)a3
{
  objc_storeStrong((id *)&self->_containingPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingPath, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
