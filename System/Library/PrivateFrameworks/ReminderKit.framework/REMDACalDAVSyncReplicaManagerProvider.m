@implementation REMDACalDAVSyncReplicaManagerProvider

void __79___REMDACalDAVSyncReplicaManagerProvider_replicaManagerForAccountID_withStore___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  REMReplicaManager *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)managerByAccountID, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v25 = 0;
    objc_msgSend(v6, "fetchReplicaManagerForAccountID:error:", v7, &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    if (v8)
    {
      +[REMLog dataAccess](REMLog, "dataAccess");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "managerData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");
        *(_DWORD *)buf = 138412546;
        v27 = v2;
        v28 = 2048;
        v29 = v12;
        _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "_REMDACalDAVSyncReplicaManagerProvider: Deserializing existing replica manager {account = %@, size = %lu}", buf, 0x16u);

      }
      v24 = v9;
      +[REMReplicaManager replicaManagerWithSerializedData:error:](REMReplicaManager, "replicaManagerWithSerializedData:error:", v8, &v24);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v24;

      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v13;

      v9 = v14;
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      +[REMLog dataAccess](REMLog, "dataAccess");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v2;
        _os_log_impl(&dword_1B4A39000, v17, OS_LOG_TYPE_DEFAULT, "_REMDACalDAVSyncReplicaManagerProvider: Creating a new replica manager {account = %@}", buf, 0xCu);
      }

      v18 = objc_alloc_init(REMReplicaManager);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
    v21 = (void *)managerByAccountID;
    if (!managerByAccountID)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)managerByAccountID;
      managerByAccountID = v22;

      v21 = (void *)managerByAccountID;
    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);

  }
}

void __78___REMDACalDAVSyncReplicaManagerProvider_unsavedReplicaManagersForAccountIDs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = (void *)managerByAccountID;
        objc_msgSend(v7, "uuid", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "hasUnsavedChanges"))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v10, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

@end
