@implementation REMSmartListChangeItem

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_2;
    __sKeysToObserve_2 = (uint64_t)&unk_1E6836EE0;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836EF8);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__resolutionTokenKeyDenylist_2;
    __resolutionTokenKeyDenylist_2 = v3;

  }
}

- (REMSmartListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 changedKeysObserver:(id)a5
{
  id v10;
  id v11;
  id v12;
  REMSmartListChangeItem *v13;
  id *p_isa;
  REMSmartListChangeItem *v15;
  NSObject *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)REMSmartListChangeItem;
    v13 = -[REMSmartListChangeItem init](&v18, sel_init);
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_saveRequest, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[REMSmartListChangeItem initWithSaveRequest:storage:changedKeysObserver:].cold.1((uint64_t)self, a2);

    NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
    v15 = 0;
  }

  return v15;
}

- (REMSmartListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 observeInitialValues:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  REMChangedKeysObserver *v10;
  REMChangedKeysObserver *v11;
  REMSmartListChangeItem *v12;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "copy");
  v10 = [REMChangedKeysObserver alloc];
  v11 = -[REMChangedKeysObserver initWithTarget:keysToObserve:includeInitial:](v10, "initWithTarget:keysToObserve:includeInitial:", v9, __sKeysToObserve_2, v5);
  v12 = -[REMSmartListChangeItem initWithSaveRequest:storage:changedKeysObserver:](self, "initWithSaveRequest:storage:changedKeysObserver:", v8, v9, v11);

  return v12;
}

- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoAccountChangeItem:(id)a4
{
  return -[REMSmartListChangeItem initWithCustomSmartListObjectID:insertIntoAccountChangeItem:withParentListChangeItem:](self, "initWithCustomSmartListObjectID:insertIntoAccountChangeItem:withParentListChangeItem:", a3, a4, 0);
}

- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoAccountChangeItem:(id)a4 withParentListChangeItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  REMSmartListStorage *v13;
  void *v14;
  REMSmartListStorage *v15;
  void *v16;
  id v17;
  REMManualOrdering *v18;
  void *v19;
  void *v20;
  void *v21;
  REMManualOrdering *v22;
  void *v23;
  void *v24;
  REMSmartListChangeItem *v25;
  NSObject *v27;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsCustomSmartLists");

  if ((v12 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[REMSmartListChangeItem initWithCustomSmartListObjectID:insertIntoAccountChangeItem:withParentListChangeItem:].cold.1(v8);

  }
  v13 = [REMSmartListStorage alloc];
  objc_msgSend(v8, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[REMSmartListStorage initWithObjectID:accountID:smartListType:](v13, "initWithObjectID:accountID:smartListType:", v10, v14, CFSTR("com.apple.reminders.smartlist.custom"));

  objc_msgSend(v8, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setParentAccountID:](v15, "setParentAccountID:", v16);

  v17 = +[REMManualOrdering newObjectID](REMManualOrdering, "newObjectID");
  v18 = [REMManualOrdering alloc];
  objc_msgSend(v10, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v22 = -[REMManualOrdering initWithObjectID:listType:listID:modifiedDate:](v18, "initWithObjectID:listType:listID:modifiedDate:", v17, 2, v20, v21);

  -[REMSmartListStorage setManualOrdering:](v15, "setManualOrdering:", v22);
  objc_msgSend(v9, "objectID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListStorage setParentListID:](v15, "setParentListID:", v23);

  objc_msgSend(v8, "lowLevelAddMergeableOrderingNodeIDToOrdering:withParentMergeableOrderingNode:", v10, v9);
  objc_msgSend(v8, "saveRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[REMSmartListChangeItem initWithSaveRequest:storage:observeInitialValues:](self, "initWithSaveRequest:storage:observeInitialValues:", v24, v15, 1);

  return v25;
}

- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoListSublistContextChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  REMSmartListChangeItem *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "listChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_updateAccountWithListChangeItem:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "listChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[REMSmartListChangeItem initWithCustomSmartListObjectID:insertIntoAccountChangeItem:withParentListChangeItem:](self, "initWithCustomSmartListObjectID:insertIntoAccountChangeItem:withParentListChangeItem:", v7, v10, v11);
  return v12;
}

- (id)changedKeys
{
  void *v2;
  void *v3;

  -[REMSmartListChangeItem changedKeysObserver](self, "changedKeysObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)__resolutionTokenKeyDenylist_2;
  v4 = a3;
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5;
  void *v6;
  REMSmartListChangeItem *v7;
  void *v8;
  void *v9;
  REMSmartListChangeItem *v10;
  NSObject *v11;

  v5 = a3;
  -[REMSmartListChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [REMSmartListChangeItem alloc];
    -[REMSmartListChangeItem storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListChangeItem changedKeysObserver](self, "changedKeysObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[REMSmartListChangeItem initWithSaveRequest:storage:changedKeysObserver:](v7, "initWithSaveRequest:storage:changedKeysObserver:", v5, v8, v9);

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMSmartListChangeItem shallowCopyWithSaveRequest:].cold.1((uint64_t)self, a2);

    -[REMSmartListChangeItem storage](self, "storage");
    v10 = (REMSmartListChangeItem *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v10 = 0;
    else
      NSLog(CFSTR("'%s' is unexpectedly nil"), "self.storage");
  }

  return v10;
}

- (void)assertIsCustomSmartListWithAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[REMSmartListChangeItem smartListType](self, "smartListType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.reminders.smartlist.custom"), "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMSmartListChangeItem assertIsCustomSmartListWithAction:].cold.1((uint64_t)v4, self);

    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    -[REMSmartListChangeItem remObjectID](self, "remObjectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Action is only applicable to CSL {action: %@, smartList: %@}"), v4, v10);

  }
}

- (REMAccountCapabilities)accountCapabilities
{
  void *v2;
  void *v3;

  -[REMSmartListChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMAccountCapabilities *)v3;
}

- (BOOL)isPinned
{
  void *v2;
  BOOL v3;

  -[REMSmartListChangeItem pinnedDate](self, "pinnedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setIsPinned:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;

  v3 = a3;
  -[REMSmartListChangeItem accountCapabilities](self, "accountCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsPinnedLists");

  if ((v6 & 1) != 0)
  {
    if (-[REMSmartListChangeItem isPinned](self, "isPinned") != v3)
    {
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[REMSmartListChangeItem setPinnedDate:](self, "setPinnedDate:", v8);

      }
      else
      {
        -[REMSmartListChangeItem setPinnedDate:](self, "setPinnedDate:", 0);
      }
    }
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMSmartListChangeItem setIsPinned:].cold.1(self);

  }
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMSmartListChangeItem storage](self, "storage");
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
  v7.super_class = (Class)REMSmartListChangeItem;
  if (-[REMSmartListChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMSmartListChangeItem storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  -[REMSmartListChangeItem saveRequest](self, "saveRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSaved");

  if (v9)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v12, 2u);
    }

  }
  -[REMSmartListChangeItem storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v7, v6);

}

- (BOOL)isSubContainer
{
  return 0;
}

- (void)removeFromParentWithAccountChangeItem:(id)a3
{
  id v3;

  v3 = -[REMSmartListChangeItem removeFromParentAllowingUndoWithAccountChangeItem:](self, "removeFromParentAllowingUndoWithAccountChangeItem:", a3);
}

+ (id)newObjectID
{
  return +[REMSmartListStorage newObjectID](REMSmartListStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMSmartListStorage objectIDWithUUID:](REMSmartListStorage, "objectIDWithUUID:", a3);
}

+ (NSString)cdEntityName
{
  return +[REMSmartListStorage cdEntityName](REMSmartListStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMSmartListChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (id)removeFromParentAllowingUndoWithAccountChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[REMSmartListChangeItem parentAccountID](self, "parentAccountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[REMSmartListChangeItem saveRequest](self, "saveRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListChangeItem parentAccountID](self, "parentAccountID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_trackedAccountChangeItemForObjectID:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8 || v8 != v4)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      -[REMSmartListChangeItem parentAccountID](self, "parentAccountID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("REMSmartListChangeItem tries to remove itself from an untracked or unknown account change item {parentAccountID: %@, accountChangeItem.objectID: %@}"), v11, v12);

    }
    -[REMSmartListChangeItem objectID](self, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowLevelRemoveMergeableOrderingNodeIDFromOrdering:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  -[REMSmartListChangeItem setParentAccountID:](self, "setParentAccountID:", 0);
  -[REMSmartListChangeItem setParentListID:](self, "setParentListID:", 0);

  return v14;
}

- (REMSmartListCustomContextChangeItem)customContext
{
  void *v3;
  int v4;
  REMSmartListCustomContextChangeItem *v5;

  -[REMSmartListChangeItem smartListType](self, "smartListType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.reminders.smartlist.custom"));

  if (v4)
    v5 = -[REMSmartListCustomContextChangeItem initWithSmartListChangeItem:]([REMSmartListCustomContextChangeItem alloc], "initWithSmartListChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMSmartListSectionContextChangeItem)sectionsContextChangeItem
{
  void *v3;
  int v4;
  REMSmartListSectionContextChangeItem *v5;

  -[REMSmartListChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSections");

  if (v4)
    v5 = -[REMSmartListSectionContextChangeItem initWithSmartListChangeItem:]([REMSmartListSectionContextChangeItem alloc], "initWithSmartListChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMSmartListStorage)storage
{
  return self->_storage;
}

- (REMChangedKeysObserver)changedKeysObserver
{
  return self->_changedKeysObserver;
}

- (void)setChangedKeysObserver:(id)a3
{
  objc_storeStrong((id *)&self->_changedKeysObserver, a3);
}

- (REMAccount)parentAccount
{
  return self->_parentAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAccount, 0);
  objc_storeStrong((id *)&self->_changedKeysObserver, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_saveRequest, 0);
}

- (void)initWithSaveRequest:(uint64_t)a1 storage:(const char *)a2 changedKeysObserver:.cold.1(uint64_t a1, const char *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10[14];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v11 = "storage";
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v8, v9, "[%{public}@] Passing in nil '%s'", v10);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCustomSmartListObjectID:(void *)a1 insertIntoAccountChangeItem:withParentListChangeItem:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "remObjectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "rem_log_fault_if (!accountChangeItem.capabilities.supportsCustomSmartLists) -- Attempt to create REMSmartListChangeItem into account not supporting CSL {account: %{public}@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10[14];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v11 = "self.storage";
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v8, v9, "[%{public}@] Passing in nil '%s'", v10);

  OUTLINED_FUNCTION_1();
}

- (void)assertIsCustomSmartListWithAction:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "remObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v4, v5, "Action is only applicable to CSL {action: %{public}@, smartList: %{public}@}", (uint8_t *)&v6);

}

- (void)setIsPinned:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "'- [REMSmartListChangeItem setIsPinned:]' should not be called because account does not support pinned lists {objectID: %@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
