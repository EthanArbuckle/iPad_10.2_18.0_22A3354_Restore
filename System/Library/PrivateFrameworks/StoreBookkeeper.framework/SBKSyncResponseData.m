@implementation SBKSyncResponseData

- (SBKSyncResponseData)initWithTransaction:(id)a3 responseDictionary:(id)a4 response:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBKSyncResponseData *v12;
  SBKSyncResponseData *v13;
  uint64_t v14;
  NSMutableDictionary *responseOpEntiesByKey;
  uint64_t v16;
  NSArray *updatedKeys;
  uint64_t v18;
  NSArray *deletedKeys;
  uint64_t v20;
  NSArray *conflictedKeys;
  uint64_t v22;
  NSArray *successfullyUpdatedKeys;
  uint64_t v24;
  NSArray *successfullyDeletedKeys;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SBKSyncResponseData;
  v12 = -[SBKSyncResponseData init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transaction, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    responseOpEntiesByKey = v13->_responseOpEntiesByKey;
    v13->_responseOpEntiesByKey = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    updatedKeys = v13->_updatedKeys;
    v13->_updatedKeys = (NSArray *)v16;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    deletedKeys = v13->_deletedKeys;
    v13->_deletedKeys = (NSArray *)v18;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    conflictedKeys = v13->_conflictedKeys;
    v13->_conflictedKeys = (NSArray *)v20;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    successfullyUpdatedKeys = v13->_successfullyUpdatedKeys;
    v13->_successfullyUpdatedKeys = (NSArray *)v22;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    successfullyDeletedKeys = v13->_successfullyDeletedKeys;
    v13->_successfullyDeletedKeys = (NSArray *)v24;

    -[SBKSyncResponseData _deserializeResponseDictionary:response:](v13, "_deserializeResponseDictionary:response:", v10, v11);
  }

  return v13;
}

- (id)description
{
  void *v3;
  NSString *syncAnchor;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v16.receiver = self;
  v16.super_class = (Class)SBKSyncResponseData;
  -[SBKSyncResponseData description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncAnchor = self->_syncAnchor;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_successfullyUpdatedKeys, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_successfullyDeletedKeys, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_updatedKeys, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  shortArrayDescription(self->_updatedKeys);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_conflictedKeys, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  shortArrayDescription(self->_conflictedKeys);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_deletedKeys, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  shortArrayDescription(self->_deletedKeys);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ response: syncAnchor = %@\n\nput-oks(%@), delete-oks(%@), updatedKeys(%@) = %@\n\nconflictedKeys(%@) = %@\n\ndeletedKeys(%@) = %@\n\n"), v3, syncAnchor, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)payloadDataForUpdateResponseKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKey:](self->_responseOpEntiesByKey, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "SBKDataByInflatingWithNoZipHeader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = v4;

  return v5;
}

- (void)_deserializeResponseDictionary:(id)a3 response:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *updatedKeys;
  NSArray *successfullyUpdatedKeys;
  NSArray *successfullyDeletedKeys;
  NSString *v13;
  NSString *syncAnchor;
  char v15;
  NSString *v16;
  NSString *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke;
    v21[3] = &unk_24E2A7870;
    v8 = v5;
    v22 = v8;
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2207AF7FC](v21);
    ((void (**)(_QWORD, NSArray *, const __CFString *, const __CFString *, void *))v9)[2](v9, self->_deletedKeys, CFSTR("peer-ops"), CFSTR("deletes"), &__block_literal_global_202);
    updatedKeys = self->_updatedKeys;
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_4;
    v20[3] = &unk_24E2A78D8;
    v20[4] = self;
    ((void (**)(_QWORD, NSArray *, const __CFString *, const __CFString *, _QWORD *))v9)[2](v9, updatedKeys, CFSTR("peer-ops"), CFSTR("puts"), v20);
    ((void (**)(_QWORD, NSArray *, const __CFString *, const __CFString *, void *))v9)[2](v9, self->_conflictedKeys, CFSTR("ops"), CFSTR("rejected"), &__block_literal_global_38);
    successfullyUpdatedKeys = self->_successfullyUpdatedKeys;
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_39;
    v19[3] = &unk_24E2A78D8;
    v19[4] = self;
    ((void (**)(_QWORD, NSArray *, const __CFString *, const __CFString *, _QWORD *))v9)[2](v9, successfullyUpdatedKeys, CFSTR("ops"), CFSTR("put-ok"), v19);
    successfullyDeletedKeys = self->_successfullyDeletedKeys;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2_40;
    v18[3] = &unk_24E2A78D8;
    v18[4] = self;
    ((void (**)(_QWORD, NSArray *, const __CFString *, const __CFString *, _QWORD *))v9)[2](v9, successfullyDeletedKeys, CFSTR("ops"), CFSTR("deleted-ok"), v18);
    objc_msgSend(v8, "valueForKey:", CFSTR("version"));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    syncAnchor = self->_syncAnchor;
    self->_syncAnchor = v13;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = objc_opt_respondsToSelector();
      v16 = self->_syncAnchor;
      if ((v15 & 1) != 0)
      {
        -[NSString stringValue](v16, "stringValue");
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        v16 = self->_syncAnchor;
      }
      else
      {
        v17 = 0;
      }
      self->_syncAnchor = v17;

    }
  }

}

- (SBKSyncTransaction)transaction
{
  return self->_transaction;
}

- (NSString)syncAnchor
{
  return self->_syncAnchor;
}

- (NSArray)updatedKeys
{
  return self->_updatedKeys;
}

- (NSArray)conflictedKeys
{
  return self->_conflictedKeys;
}

- (NSArray)deletedKeys
{
  return self->_deletedKeys;
}

- (NSArray)successfullyUpdatedKeys
{
  return self->_successfullyUpdatedKeys;
}

- (NSArray)successfullyDeletedKeys
{
  return self->_successfullyDeletedKeys;
}

- (NSMutableDictionary)responseOpEntiesByKey
{
  return self->_responseOpEntiesByKey;
}

- (void)setResponseOpEntiesByKey:(id)a3
{
  objc_storeStrong((id *)&self->_responseOpEntiesByKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseOpEntiesByKey, 0);
  objc_storeStrong((id *)&self->_successfullyDeletedKeys, 0);
  objc_storeStrong((id *)&self->_successfullyUpdatedKeys, 0);
  objc_storeStrong((id *)&self->_deletedKeys, 0);
  objc_storeStrong((id *)&self->_conflictedKeys, 0);
  objc_storeStrong((id *)&self->_updatedKeys, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  unsigned int (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v27 = a4;
  v11 = a5;
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2;
  v38[3] = &unk_24E2A7848;
  v23 = v11;
  v39 = v23;
  v12 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2207AF7FC](v38);
  v24 = v10;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v13;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v29 = v15;
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v15), "objectForKey:", v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v21, "objectForKey:", CFSTR("key"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend(v22, "length")
                && ((unsigned int (**)(_QWORD, void *, void *))v12)[2](v12, v21, v22))
              {
                objc_msgSend(v9, "addObject:", v22);
              }

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          }
          while (v18);
        }

        v15 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v28);
  }

}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", a2, a3);
  return 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_39(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:") ^ 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:") ^ 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("oversize"));

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_21E4FD000, v8, OS_LOG_TYPE_ERROR, "ERROR: server rejected %@ because the payload was too big.", (uint8_t *)&v12, 0xCu);
    }

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("conflicted"));

  return v10;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_3()
{
  return 1;
}

uint64_t __63__SBKSyncResponseData__deserializeResponseDictionary_response___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return (*(uint64_t (**)(void))(v1 + 16))();
  else
    return 1;
}

+ (id)deserializedResponseBodyWithTransaction:(id)a3 responseDictionary:(id)a4 response:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTransaction:responseDictionary:response:", v9, v8, v7);

  return v10;
}

@end
