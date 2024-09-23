@implementation PDSEntryStore

- (PDSEntryStore)initWithCache:(id)a3
{
  id v6;
  PDSEntryStore *v7;
  PDSEntryStore *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSEntryStore.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cache"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PDSEntryStore;
  v7 = -[PDSEntryStore init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_cache, a3);

  return v8;
}

- (BOOL)storeEntry:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PDSEntryStore cache](self, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__PDSEntryStore_storeEntry_withError___block_invoke;
  v14[3] = &unk_24D4A71A8;
  v14[4] = self;
  v8 = objc_msgSend(v7, "storeEntry:transitionBlock:withError:", v6, v14, a4);

  if (v8)
  {
    -[PDSEntryStore delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topicString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryStore:didUpdatePendingTopics:forceImmediateUpdate:", self, v12, 0);

  }
  return v8;
}

uint64_t __38__PDSEntryStore_storeEntry_withError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_permitTransitionFromState:toState:", a2, a3);
}

- (BOOL)updateEntryState:(unsigned __int8)a3 forUser:(id)a4 clientID:(id)a5 withError:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  -[PDSEntryStore cache](self, "cache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "updateEntryState:forUser:clientID:withError:", v8, v10, v11, a6);

  if ((_DWORD)v8 != 3)
  {
    if (v13)
    {
      -[PDSEntryStore delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[PDSEntryStore cache](self, "cache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "loadAllEntriesUser:withClientID:", v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "__imArrayByApplyingBlock:", &__block_literal_global_2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[PDSEntryStore delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "entryStore:didUpdatePendingTopics:forceImmediateUpdate:", self, v17, 1);

      }
    }
  }

  return v13;
}

id __61__PDSEntryStore_updateEntryState_forUser_clientID_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "registration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topicString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)updateAllEntriesWithState:(unsigned __int8)a3 toState:(unsigned __int8)a4 withError:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[PDSEntryStore cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "updateAllEntriesWithState:toState:withError:", v7, v6, a5);

  if (v10)
  {
    -[PDSEntryStore delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PDSEntryStore cache](self, "cache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loadAllEntries");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "__imArrayByApplyingBlock:", &__block_literal_global_8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PDSEntryStore delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "entryStore:didUpdatePendingTopics:forceImmediateUpdate:", self, v14, 1);

    }
  }
  return v10;
}

id __61__PDSEntryStore_updateAllEntriesWithState_toState_withError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "registration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topicString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)deleteEntry:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PDSEntryStore cache](self, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "deleteEntry:withError:", v6, a4);

  return (char)a4;
}

- (BOOL)deleteEntriesForUser:(id)a3 withState:(unsigned __int8)a4 withError:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = a4;
  v8 = a3;
  -[PDSEntryStore cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "deleteEntriesForUser:withState:withError:", v8, v6, a5);

  return (char)a5;
}

- (BOOL)storeEntries:(id)a3 deleteEntries:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[PDSEntryStore cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __54__PDSEntryStore_storeEntries_deleteEntries_withError___block_invoke;
  v39[3] = &unk_24D4A71A8;
  v39[4] = self;
  v11 = objc_msgSend(v10, "storeEntries:transitionBlock:deleteEntries:withError:", v8, v39, v9, a5);

  if (v11)
  {
    v30 = v11;
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "registration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "topicString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v15);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "registration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "topicString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v22);
    }

    -[PDSEntryStore delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v27, "entryStore:didUpdatePendingTopics:forceImmediateUpdate:", self, v28, 0);

    LOBYTE(v11) = v30;
  }

  return v11;
}

uint64_t __54__PDSEntryStore_storeEntries_deleteEntries_withError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_permitTransitionFromState:toState:", a2, a3);
}

- (BOOL)hasPendingEntries
{
  void *v2;
  char v3;

  -[PDSEntryStore cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPendingEntries");

  return v3;
}

- (BOOL)hasActiveEntries
{
  void *v2;
  char v3;

  -[PDSEntryStore cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveEntries");

  return v3;
}

- (id)entries
{
  void *v2;
  void *v3;

  -[PDSEntryStore cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadAllEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)entriesForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PDSEntryStore cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadAllEntriesUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)entriesForUser:(id)a3 withClientID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PDSEntryStore cache](self, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadAllEntriesUser:withClientID:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)entriesWithClientID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PDSEntryStore cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadAllEntriesForClientID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)users
{
  void *v2;
  void *v3;

  -[PDSEntryStore cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadAllUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeUsers
{
  void *v2;
  void *v3;

  -[PDSEntryStore cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadAllActiveUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)usersWithClientID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PDSEntryStore cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadAllUsersForClientID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activeUsersWithClientID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PDSEntryStore cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadAllActiveUsersForClientID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_permitTransitionFromState:(unsigned __int8)a3 toState:(unsigned __int8)a4
{
  _BOOL4 v4;
  unsigned __int8 v5;
  unsigned int v6;

  LOBYTE(v4) = 1;
  switch(a3)
  {
    case 0u:
      return v4;
    case 1u:
      if (a4 >= 4u)
        goto LABEL_9;
      v5 = a4;
      v6 = 14;
      goto LABEL_8;
    case 2u:
      if (a4 >= 4u)
        goto LABEL_9;
      v5 = a4;
      v6 = 6;
      goto LABEL_8;
    case 3u:
      if (a4 >= 4u)
        goto LABEL_9;
      v5 = a4;
      v6 = 12;
LABEL_8:
      v4 = (v6 >> v5) & 1;
      break;
    default:
LABEL_9:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (PDSEntryStoreDelegate)delegate
{
  return (PDSEntryStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PDSCDCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
