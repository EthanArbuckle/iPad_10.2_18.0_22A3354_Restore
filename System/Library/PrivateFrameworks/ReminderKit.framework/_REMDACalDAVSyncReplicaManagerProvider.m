@implementation _REMDACalDAVSyncReplicaManagerProvider

+ (id)replicaManagerForAccountID:(id)a3 withStore:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79___REMDACalDAVSyncReplicaManagerProvider_replicaManagerForAccountID_withStore___block_invoke;
  v12[3] = &unk_1E67F8D78;
  v7 = v5;
  v13 = v7;
  v15 = &v16;
  v8 = v6;
  v14 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x1B5E3E098](v12);
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v9[2](v9);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

+ (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&managerByAccountIDLock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78___REMDACalDAVSyncReplicaManagerProvider_unsavedReplicaManagersForAccountIDs___block_invoke;
  v7[3] = &unk_1E67F8DA0;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  __78___REMDACalDAVSyncReplicaManagerProvider_unsavedReplicaManagersForAccountIDs___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&managerByAccountIDLock);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (_REMDACalDAVSyncReplicaManagerProvider)initWithStore:(id)a3
{
  id v5;
  _REMDACalDAVSyncReplicaManagerProvider *v6;
  _REMDACalDAVSyncReplicaManagerProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMDACalDAVSyncReplicaManagerProvider;
  v6 = -[_REMDACalDAVSyncReplicaManagerProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)replicaManagerForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_REMDACalDAVSyncReplicaManagerProvider store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_REMDACalDAVSyncReplicaManagerProvider replicaManagerForAccountID:withStore:](_REMDACalDAVSyncReplicaManagerProvider, "replicaManagerForAccountID:withStore:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unsavedReplicaManagersForAccountIDs:(id)a3
{
  return +[_REMDACalDAVSyncReplicaManagerProvider unsavedReplicaManagersForAccountIDs:](_REMDACalDAVSyncReplicaManagerProvider, "unsavedReplicaManagersForAccountIDs:", a3);
}

- (REMStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
