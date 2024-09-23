@implementation REMAccount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (BOOL)supportsSharingLists
{
  unint64_t v3;
  BOOL result;

  v3 = -[REMAccount type](self, "type");
  result = 1;
  if (v3 <= 7)
  {
    if (((1 << v3) & 0xB3) != 0)
    {
      return 0;
    }
    else if (v3 == 3)
    {
      return -[REMAccount daSupportsSharedCalendars](self, "daSupportsSharedCalendars");
    }
  }
  return result;
}

- (REMAccount)initWithStore:(id)a3 storage:(id)a4
{
  id v7;
  id v8;
  REMAccount *v9;
  REMAccount *v10;
  REMAccountCapabilities *v11;
  REMAccountCapabilities *capabilities;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMAccount;
  v9 = -[REMAccount init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a4);
    objc_storeStrong((id *)&v10->_store, a3);
    v11 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", objc_msgSend(v8, "type"));
    capabilities = v10->_capabilities;
    v10->_capabilities = v11;

    -[REMAccountStorage setStoreGenerationIfNeeded:](v10->_storage, "setStoreGenerationIfNeeded:", objc_msgSend(v7, "storeGeneration"));
  }

  return v10;
}

- (REMAccountCapabilities)capabilities
{
  return self->_capabilities;
}

+ (REMObjectID)localInternalAccountID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("5d18e4d0-8a71-406c-899d-6ff8e3e94c37"));
  +[REMAccount objectIDWithUUID:](REMAccount, "objectIDWithUUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMObjectID *)v3;
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMAccountStorage objectIDWithUUID:](REMAccountStorage, "objectIDWithUUID:", a3);
}

- (REMStore)store
{
  return self->_store;
}

- (id)accountTypeHost
{
  void *v2;
  void *v3;

  -[REMAccount storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)optionalObjectID
{
  void *v2;
  void *v3;

  -[REMAccount storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionalObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (REMAccountStorage)storage
{
  return self->_storage;
}

+ (REMObjectID)localAccountID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("3B242529-8F5D-47A1-9351-444101218C30"));
  +[REMAccount objectIDWithUUID:](REMAccount, "objectIDWithUUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMObjectID *)v3;
}

- (BOOL)isEqual:(id)a3
{
  REMAccount *v4;
  REMAccount *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (REMAccount *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[REMAccount store](v5, "store");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccount store](self, "store");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        -[REMAccount storage](v5, "storage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAccount storage](self, "storage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAccount storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMAccount storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMAccount storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (REMAccountGroupContext)groupContext
{
  void *v3;
  int v4;
  REMAccountGroupContext *v5;

  -[REMAccount capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsGroups");

  if (v4)
    v5 = -[REMAccountGroupContext initWithAccount:]([REMAccountGroupContext alloc], "initWithAccount:", self);
  else
    v5 = 0;
  return v5;
}

- (REMAccountTemplatesContext)templatesContext
{
  void *v3;
  int v4;
  REMAccountTemplatesContext *v5;

  -[REMAccount capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsTemplates");

  if (v4)
    v5 = -[REMAccountTemplatesContext initWithAccount:]([REMAccountTemplatesContext alloc], "initWithAccount:", self);
  else
    v5 = 0;
  return v5;
}

- (id)fetchListsWithError:(id *)a3
{
  REMListsDataView *v5;
  void *v6;
  REMListsDataView *v7;
  void *v8;

  v5 = [REMListsDataView alloc];
  -[REMAccount store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMListsDataView initWithStore:](v5, "initWithStore:", v6);

  -[REMListsDataView fetchListsInAccount:error:](v7, "fetchListsInAccount:error:", self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListsAndSublistsWithError:(id *)a3
{
  REMListsDataView *v5;
  void *v6;
  REMListsDataView *v7;
  void *v8;

  v5 = [REMListsDataView alloc];
  -[REMAccount store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMListsDataView initWithStore:](v5, "initWithStore:", v6);

  -[REMListsDataView fetchListsAndSublistsInAccount:error:](v7, "fetchListsAndSublistsInAccount:error:", self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchCustomSmartListsWithError:(id *)a3
{
  REMSmartListsDataView *v5;
  void *v6;
  REMSmartListsDataView *v7;
  void *v8;

  v5 = [REMSmartListsDataView alloc];
  -[REMAccount store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMSmartListsDataView initWithStore:](v5, "initWithStore:", v6);

  -[REMSmartListsDataView fetchCustomSmartListsInAccount:error:](v7, "fetchCustomSmartListsInAccount:error:", self, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)canCopyReminderLosslesslyFromAccountWithType:(int64_t)a3 toAccountWithType:(int64_t)a4 accountTypeHost:(id)a5
{
  if (a3 == a4)
    return 1;
  else
    return objc_msgSend(a5, "isCloudKit");
}

- (BOOL)canCopyReminderLosslesslyToAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = -[REMAccount type](self, "type");
  v7 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "accountTypeHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v5, "canCopyReminderLosslesslyFromAccountWithType:toAccountWithType:accountTypeHost:", v6, v7, v8);
  return v6;
}

- (BOOL)isConsideredEmptyWithResultPtr:(BOOL *)a3 withError:(id *)a4
{
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  REMRemindersDataView *v13;
  void *v14;
  REMRemindersDataView *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  id v24;
  id v25;

  v25 = 0;
  -[REMAccount fetchListsWithError:](self, "fetchListsWithError:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  v9 = v8;
  if (!v7 || v8)
  {
    +[REMLogStore read](REMLogStore, "read");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.1();

  }
  else if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = [REMRemindersDataView alloc];
      -[REMAccount store](self, "store");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[REMRemindersDataView initWithStore:](v13, "initWithStore:", v14);

      objc_msgSend(v12, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      -[REMRemindersDataView fetchRemindersCountWithListID:error:](v15, "fetchRemindersCountWithListID:error:", v16, &v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v24;

      if (v9)
      {
        +[REMLogStore read](REMLogStore, "read");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.6(v12, (uint64_t)v9, v18);

      }
      else
      {
        v20 = objc_msgSend(v17, "intValue");
        +[REMLogStore read](REMLogStore, "read");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22)
            -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.5();

          *a3 = 0;
        }
        else
        {
          if (v22)
            -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.4();

          *a3 = 1;
        }
      }

    }
    else
    {
      +[REMLogStore read](REMLogStore, "read");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.3();

      v9 = 0;
      *a3 = 1;
    }

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.2();

    v9 = 0;
    *a3 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v9 == 0;
}

- (id)fetchListsIncludingSpecialContainersWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[REMAccount store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchListsIncludingSpecialContainersInAccount:error:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchListIncludingSpecialContainerWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;
  REMListsDataView *v9;
  void *v10;

  v6 = a3;
  v7 = [REMListsDataView alloc];
  -[REMAccount store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMListsDataView initWithStore:](v7, "initWithStore:", v8);

  -[REMListsDataView fetchListIncludingSpecialContainerWithExternalIdentifier:inAccount:error:](v9, "fetchListIncludingSpecialContainerWithExternalIdentifier:inAccount:error:", v6, self, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)MCIsManagedWithResultPtr:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  REMAccount *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[REMAccount store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccount objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "MCIsManagedAccountWithObjectID:error:", v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  if (v9 || !v10)
  {
    *a3 = objc_msgSend(v9, "BOOLValue");
    +[REMLogStore read](REMLogStore, "read");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_INFO, "Performed XPC -MCIsManagedAccountWithObjectID: successful {account: %@, result: %@}", buf, 0x16u);
    }
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[REMAccount MCIsManagedWithResultPtr:error:].cold.1();
  }

  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v10 == 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMAccount storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMAccount;
  if (-[REMAccount respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMAccount storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[REMAccount storage](self, "storage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (NSOrderedSet)listIDsOrdering
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v7;

  -[REMAccount storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listIDsMergeableOrdering");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[REMLogStore read](REMLogStore, "read");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMAccount listIDsOrdering].cold.1(self, v7);

  }
  objc_msgSend(v4, "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v5;
}

- (BOOL)daSupportsPhoneNumbers
{
  return 0;
}

+ (id)newObjectID
{
  return +[REMAccountStorage newObjectID](REMAccountStorage, "newObjectID");
}

+ (NSString)cdEntityName
{
  return +[REMAccountStorage cdEntityName](REMAccountStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMAccount storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (id)externalIdentifierForMarkedForDeletionObject
{
  void *v2;
  void *v3;

  -[REMAccount externalIdentifier](self, "externalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:](REMExternalSyncMetadataUtils, "decodeExternalIdentifierForMarkedForDeletionObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldUseExternalIdentifierAsDeletionKey
{
  return +[REMExternalSyncMetadataUtils shouldUseExternalIdentifierAsDeletionKeyWithAccountType:](REMExternalSyncMetadataUtils, "shouldUseExternalIdentifierAsDeletionKeyWithAccountType:", -[REMAccount type](self, "type"));
}

+ (id)_accountTypeMaskWithBitMask:(int64_t)a3
{
  int v3;
  void *v4;
  uint64_t i;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 7; ++i)
  {
    if (((1 << i) & v3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  return v4;
}

+ (BOOL)isCloudBasedAccountType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
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
  cloudBasedAccountTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "integerValue", (_QWORD)v11) == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BOOL)markedForRemoval
{
  return self->_markedForRemoval;
}

- (void)setMarkedForRemoval:(BOOL)a3
{
  self->_markedForRemoval = a3;
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1B4A39000, v0, OS_LOG_TYPE_ERROR, "isConsideredEmpty: Error fetching lists from local account {error: %@}.", v1, 0xCu);
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B4A39000, v0, v1, "isConsideredEmpty: Account thas more than 1 lists. Treating as non-empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B4A39000, v0, v1, "isConsideredEmpty: Account has no lists. Treating as empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B4A39000, v0, v1, "isConsideredEmpty: Account has no reminders. Treating as empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_7(&dword_1B4A39000, v0, v1, "isConsideredEmpty: Account has reminders. Treating as non-empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)isConsideredEmptyWithResultPtr:(NSObject *)a3 withError:.cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  v8 = a2;
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, a3, v6, "isConsideredEmpty: Error fetching reminders from list in local account {listID: %@, error: %@}.", v7);

}

- (void)MCIsManagedWithResultPtr:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_2();
  v3 = v0;
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v1, (uint64_t)v1, "Performed XPC -MCIsManagedAccountWithObjectID: failed {account: %@, error: %@}", v2);
}

- (void)listIDsOrdering
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (listIDsMergeableOrdering == nil) -- account.storage.listIDsMergeableOrdering should not be nil {objectID: %{public}@}", v4, 0xCu);

  OUTLINED_FUNCTION_2_2();
}

@end
