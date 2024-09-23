@implementation REMAccountChangeItem

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_0;
    __sKeysToObserve_0 = (uint64_t)&unk_1E6836DA8;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836DC0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__resolutionTokenKeyDenylist;
    __resolutionTokenKeyDenylist = v3;

  }
}

- (REMAccountChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 capabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REMAccountChangeItem *v15;
  REMAccountChangeItem *v16;
  REMSaveRequest *saveRequest;
  void *v18;
  REMAccountChangeItem *v19;
  NSObject *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    v22.receiver = self;
    v22.super_class = (Class)REMAccountChangeItem;
    v15 = -[REMAccountChangeItem init](&v22, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_saveRequest, a3);
      objc_storeStrong((id *)&v16->_storage, a4);
      objc_storeStrong((id *)&v16->_changedKeysObserver, a6);
      saveRequest = v16->_saveRequest;
      -[REMAccountStorage objectID](v16->_storage, "objectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSaveRequest _trackAccountCapabilities:forObjectID:](saveRequest, "_trackAccountCapabilities:forObjectID:", v13, v18);

    }
    self = v16;
    v19 = self;
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
    v19 = 0;
  }

  return v19;
}

- (REMAccountChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 capabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  REMChangedKeysObserver *v13;
  REMChangedKeysObserver *v14;
  REMAccountChangeItem *v15;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(a4, "copy");
  v13 = [REMChangedKeysObserver alloc];
  v14 = -[REMChangedKeysObserver initWithTarget:keysToObserve:includeInitial:](v13, "initWithTarget:keysToObserve:includeInitial:", v12, __sKeysToObserve_0, v6);
  v15 = -[REMAccountChangeItem initWithSaveRequest:storage:capabilities:changedKeysObserver:](self, "initWithSaveRequest:storage:capabilities:changedKeysObserver:", v11, v12, v10, v14);

  return v15;
}

- (REMAccountChangeItem)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5 insertIntoSaveRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  REMAccountStorage *v14;
  REMAccountCapabilities *v15;
  REMAccountChangeItem *v16;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[REMAccountChangeItem _emptyListIDsOrderingWithAccountID:](REMAccountChangeItem, "_emptyListIDsOrderingWithAccountID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[REMAccountStorage initWithObjectID:type:name:listIDsMergeableOrdering:]([REMAccountStorage alloc], "initWithObjectID:type:name:listIDsMergeableOrdering:", v12, a4, v11, v13);

  v15 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", a4);
  v16 = -[REMAccountChangeItem initWithSaveRequest:storage:capabilities:observeInitialValues:](self, "initWithSaveRequest:storage:capabilities:observeInitialValues:", v10, v14, v15, 1);

  return v16;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  REMAccountChangeItem *v12;
  REMAccountCapabilities *v13;
  void *v14;
  REMAccountChangeItem *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  -[REMAccountChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[REMAccountChangeItem objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_trackedAccountCapabilitiesForObjectID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_16;
    -[REMAccountChangeItem objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!v5)
        goto LABEL_15;
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMAccountChangeItem shallowCopyWithSaveRequest:].cold.4(self, a2, v10);
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.2();
    }

LABEL_15:
    v13 = [REMAccountCapabilities alloc];
    -[REMAccountChangeItem storage](self, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[REMAccountCapabilities initWithAccountType:](v13, "initWithAccountType:", objc_msgSend(v14, "type"));

    if (!v8)
    {
      +[REMLogStore write](REMLogStore, "write");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[REMAccountChangeItem shallowCopyWithSaveRequest:].cold.2(v8, v19, v20);
      v12 = 0;
      goto LABEL_17;
    }
LABEL_16:
    v15 = [REMAccountChangeItem alloc];
    -[REMAccountChangeItem storage](self, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAccountChangeItem changedKeysObserver](self, "changedKeysObserver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[REMAccountChangeItem initWithSaveRequest:storage:capabilities:changedKeysObserver:](v15, "initWithSaveRequest:storage:capabilities:changedKeysObserver:", v5, v16, v8, v17);

LABEL_17:
    goto LABEL_18;
  }
  +[REMLogStore write](REMLogStore, "write");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.1();

  -[REMAccountChangeItem storage](self, "storage");
  v12 = (REMAccountChangeItem *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12 = 0;
  else
    NSLog(CFSTR("'%s' is unexpectedly nil"), "self.storage");
LABEL_18:

  return v12;
}

- (REMAccountCapabilities)capabilities
{
  void *v3;
  void *v4;
  void *v5;
  REMAccountCapabilities *v6;
  NSObject *v7;
  REMAccountCapabilities *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;

  -[REMAccountChangeItem storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[REMLogStore write](REMLogStore, "write");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.1();

    -[REMAccountChangeItem storage](self, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      NSLog(CFSTR("'%s' is unexpectedly nil"), "self.storage");
    goto LABEL_13;
  }
  -[REMAccountChangeItem saveRequest](self, "saveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountChangeItem objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_trackedAccountCapabilitiesForObjectID:", v5);
  v6 = (REMAccountCapabilities *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMAccountChangeItem capabilities].cold.3(self, v7);

    v8 = [REMAccountCapabilities alloc];
    -[REMAccountChangeItem storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[REMAccountCapabilities initWithAccountType:](v8, "initWithAccountType:", objc_msgSend(v9, "type"));

    if (!v6)
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMAccountChangeItem shallowCopyWithSaveRequest:].cold.2(v10, v11, v12);

LABEL_13:
      v6 = 0;
    }
  }
  return v6;
}

- (REMAccountGroupContextChangeItem)groupContext
{
  void *v3;
  int v4;
  REMAccountGroupContextChangeItem *v5;

  -[REMAccountChangeItem capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsGroups");

  if (v4)
    v5 = -[REMAccountGroupContextChangeItem initWithAccountChangeItem:]([REMAccountGroupContextChangeItem alloc], "initWithAccountChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMAccountPinnedListsContextChangeItem)pinnedListsContext
{
  void *v3;
  int v4;
  REMAccountPinnedListsContextChangeItem *v5;

  -[REMAccountChangeItem capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsPinnedLists");

  if (v4)
    v5 = -[REMAccountPinnedListsContextChangeItem initWithAccountChangeItem:]([REMAccountPinnedListsContextChangeItem alloc], "initWithAccountChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (id)templatesContextChangeItem
{
  void *v3;
  int v4;
  REMAccountTemplatesContextChangeItem *v5;

  -[REMAccountChangeItem capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsTemplates");

  if (v4)
    v5 = -[REMAccountTemplatesContextChangeItem initWithAccountChangeItem:]([REMAccountTemplatesContextChangeItem alloc], "initWithAccountChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMAccountChangeItem storage](self, "storage");
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
  v7.super_class = (Class)REMAccountChangeItem;
  if (-[REMAccountChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMAccountChangeItem storage](self, "storage");
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
  -[REMAccountChangeItem saveRequest](self, "saveRequest");
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
  -[REMAccountChangeItem storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v7, v6);

}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)__resolutionTokenKeyDenylist;
  v4 = a3;
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)changedKeys
{
  void *v2;
  void *v3;

  -[REMAccountChangeItem changedKeysObserver](self, "changedKeysObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accountTypeHost
{
  void *v2;
  void *v3;

  -[REMAccountChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMAccountChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (void)addSmartListChangeItem:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem addSmartListChangeItem:]"));
  -[REMAccountChangeItem insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:](self, "insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:", v4, 0, 1, 0);

}

- (void)insertSmartListChangeItem:(id)a3 beforeSmartListChangeItem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:]"));
  objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:] (sibling)"));
  -[REMAccountChangeItem insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:](self, "insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:", v7, v6, 0, 0);

}

- (void)insertSmartListChangeItem:(id)a3 afterSmartListChangeItem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertSmartListChangeItem:afterSmartListChangeItem:]"));
  objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertSmartListChangeItem:afterSmartListChangeItem:] (sibling)"));
  -[REMAccountChangeItem insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:](self, "insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:", v7, v6, 1, 0);

}

- (void)addMergeableOrderingNode:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem addMergeableOrderingNode:]"));
  -[REMAccountChangeItem insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:](self, "insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:", v4, 0, 1, 0);

}

- (void)insertMergeableOrderingNode:(id)a3 beforeMergeableOrderingNode:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:]"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:] (sibling)"));
  -[REMAccountChangeItem insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:](self, "insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:", v7, v6, 0, 0);

}

- (void)insertMergeableOrderingNode:(id)a3 afterMergeableOrderingNode:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertMergeableOrderingNode:afterMergeableOrderingNode:]"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "assertIsCustomSmartListWithAction:", CFSTR("-[REMAccountChangeItem insertMergeableOrderingNode:afterMergeableOrderingNode:] (sibling)"));
  -[REMAccountChangeItem insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:](self, "insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:withParentMergeableOrderingNode:", v7, v6, 1, 0);

}

- (void)undeleteListWithID:(id)a3 usingUndo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[REMAccountChangeItem listIDsToUndelete](self, "listIDsToUndelete");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMAccountChangeItem setListIDsToUndelete:](self, "setListIDsToUndelete:", v8);
  -[REMAccountChangeItem _lowLevelApplyUndoToOrdering:](self, "_lowLevelApplyUndoToOrdering:", v9);

}

- (void)undeleteSmartListWithID:(id)a3 usingUndo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[REMAccountChangeItem smartListIDsToUndelete](self, "smartListIDsToUndelete");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMAccountChangeItem setSmartListIDsToUndelete:](self, "setSmartListIDsToUndelete:", v8);
  -[REMAccountChangeItem _lowLevelApplyUndoToOrdering:](self, "_lowLevelApplyUndoToOrdering:", v9);

}

- (void)removeFromStore
{
  -[REMAccountChangeItem setMarkedForRemoval:](self, "setMarkedForRemoval:", 1);
}

- (id)mergeableOrderingNodesByOrderingMergeableOrderingNodes:(id)a3
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
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "remObjectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "length"))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__REMAccountChangeItem_mergeableOrderingNodesByOrderingMergeableOrderingNodes___block_invoke;
  v23[3] = &unk_1E67F9190;
  v16 = v5;
  v24 = v16;
  v17 = v4;
  v25 = v17;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);

  if (objc_msgSend(v16, "count"))
  {
    +[REMLogStore write](REMLogStore, "write");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[REMAccountChangeItem mergeableOrderingNodesByOrderingMergeableOrderingNodes:].cold.1(v16, v18);

  }
  v19 = v25;
  v20 = v17;

  return v20;
}

void __79__REMAccountChangeItem_mergeableOrderingNodesByOrderingMergeableOrderingNodes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v4);
  }

}

- (BOOL)canCopyReminderLosslesslyToAccountChangeItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = -[REMAccountChangeItem type](self, "type");
  v7 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "accountTypeHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v5, "canCopyReminderLosslesslyFromAccountWithType:toAccountWithType:accountTypeHost:", v6, v7, v8);
  return v6;
}

- (void)lowLevelAddMergeableOrderingNodeIDToOrdering:(id)a3 withParentMergeableOrderingNode:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__REMAccountChangeItem_lowLevelAddMergeableOrderingNodeIDToOrdering_withParentMergeableOrderingNode___block_invoke;
  v7[3] = &unk_1E67F91B8;
  v8 = v5;
  v6 = v5;
  -[REMAccountChangeItem _editListIDsOrderingUsingBlock:](self, "_editListIDsOrderingUsingBlock:", v7);

}

void __101__REMAccountChangeItem_lowLevelAddMergeableOrderingNodeIDToOrdering_withParentMergeableOrderingNode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "addObject:", v4);

}

- (id)lowLevelRemoveMergeableOrderingNodeIDFromOrdering:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfEqualObject:", v7);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[REMLogStore write](REMLogStore, "write");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAccountChangeItem lowLevelRemoveMergeableOrderingNodeIDFromOrdering:].cold.1((uint64_t)v4, v10, (uint64_t)v20, v9);
    }

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__REMAccountChangeItem_lowLevelRemoveMergeableOrderingNodeIDFromOrdering___block_invoke;
    v13[3] = &unk_1E67F91E0;
    v13[4] = &v14;
    v13[5] = v8;
    -[REMAccountChangeItem _editListIDsOrderingUsingBlock:](self, "_editListIDsOrderingUsingBlock:", v13);
  }
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __74__REMAccountChangeItem_lowLevelRemoveMergeableOrderingNodeIDFromOrdering___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "removeObjectAtIndex:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)test_lowLevelEditOrderingByMovingListObjectID:(id)a3 toTarget:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  _QWORD v14[6];

  v6 = a3;
  -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "indexOfEqualObject:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMAccountChangeItem test_lowLevelEditOrderingByMovingListObjectID:toTarget:].cold.1((uint64_t)v6, self);
LABEL_8:

    goto LABEL_9;
  }
  -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 <= a4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMAccountChangeItem test_lowLevelEditOrderingByMovingListObjectID:toTarget:].cold.2((uint64_t)v6, self);
    goto LABEL_8;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__REMAccountChangeItem_test_lowLevelEditOrderingByMovingListObjectID_toTarget___block_invoke;
  v14[3] = &__block_descriptor_48_e41_v16__0__REMMutableCRMergeableOrderedSet_8l;
  v14[4] = a4;
  v14[5] = v10;
  -[REMAccountChangeItem _editListIDsOrderingUsingBlock:](self, "_editListIDsOrderingUsingBlock:", v14);
LABEL_9:

}

_QWORD *__79__REMAccountChangeItem_test_lowLevelEditOrderingByMovingListObjectID_toTarget___block_invoke(_QWORD *result, void *a2)
{
  if (result[5] != result[4])
    return (id)objc_msgSend(a2, "moveObjectFromIndex:toIndex:");
  return result;
}

+ (id)_emptyListIDsOrderingWithAccountID:(id)a3
{
  void *v3;
  REMCRMergeableOrderedSet *v4;
  void *v5;
  REMCRMergeableOrderedSet *v6;

  +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:](REMAccountStorage, "listIDsMergeableOrderingReplicaIDSourceWithAccountID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [REMCRMergeableOrderedSet alloc];
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:orderedSet:](v4, "initWithReplicaIDSource:orderedSet:", v3, v5);

  return v6;
}

- (void)insertMergeableOrderingNode:(id)a3 adjacentToMergeableOrderingNode:(id)a4 isAfter:(BOOL)a5 withParentMergeableOrderingNode:(id)a6
{
  _BOOL8 v7;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;

  v7 = a5;
  v23 = a3;
  v10 = a4;
  v11 = (unint64_t)a6;
  objc_msgSend(v23, "saveRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountChangeItem saveRequest](self, "saveRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v13)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99768];
    objc_msgSend(v23, "saveRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAccountChangeItem saveRequest](self, "saveRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", v15, CFSTR("mergeableOrderingNode (%@) has incorrect saveRequest (%@). Expected %@"), v23, v16, v17);

  }
  if (v23 != v10)
    goto LABEL_4;
  objc_msgSend(v23, "parentSubContainerID");
  v18 = objc_claimAutoreleasedReturnValue();
  v10 = v23;
  if (v11 | v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v23, "parentSubContainerID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "remObjectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    v10 = v23;
    if ((v22 & 1) == 0)
    {

      v10 = 0;
LABEL_4:
      -[REMAccountChangeItem _reassignMergeableOrderingNode:withParentListChangeItem:](self, "_reassignMergeableOrderingNode:withParentListChangeItem:", v23, v11);
      -[REMAccountChangeItem _lowLevelAddMergeableOrderingNodeToOrdering:atIndexOfSibling:isAfter:withParentMergeableOrderingNode:](self, "_lowLevelAddMergeableOrderingNodeToOrdering:atIndexOfSibling:isAfter:withParentMergeableOrderingNode:", v23, v10, v7, v11);
    }
  }

}

- (void)_reassignMergeableOrderingNode:(id)a3 withParentListChangeItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "removeFromParentWithAccountChangeItem:", self);
  -[REMAccountChangeItem objectID](self, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setParentOwnerID:", v7);

  -[REMAccountChangeItem objectID](self, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountID:", v8);

  if (v6)
  {
    objc_msgSend(v6, "remObjectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setParentSubContainerID:", v9);

  }
}

- (void)_lowLevelAddMergeableOrderingNodeToOrdering:(id)a3 atIndexOfSibling:(id)a4 isAfter:(BOOL)a5 withParentMergeableOrderingNode:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD v41[4];
  id v42;
  id v43;
  REMAccountChangeItem *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  BOOL v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  v9 = a3;
  v10 = a4;
  v39 = a6;
  objc_msgSend(v9, "accountID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_3;
  v12 = (void *)v11;
  objc_msgSend(v9, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountChangeItem objectID](self, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
LABEL_3:
    +[REMLogStore write](REMLogStore, "write");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[REMAccountChangeItem _lowLevelAddMergeableOrderingNodeToOrdering:atIndexOfSibling:isAfter:withParentMergeableOrderingNode:].cold.1(v16);

  }
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v9, "remObjectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v18, "indexOfEqualObject:", v20);

  -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v21, "count");

  if (!v10)
    goto LABEL_15;
  objc_msgSend(v9, "accountID");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqual:", v23) & 1) == 0)
  {

    v28 = 0;
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v9, "parentSubContainerID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(v10, "parentSubContainerID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {

LABEL_17:
      v22 = v10;
      -[REMAccountChangeItem listIDsMergeableOrdering](self, "listIDsMergeableOrdering");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "remObjectID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v29, "indexOfEqualObject:", v32);
      v51[3] = v33;

      v28 = v51[3] == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_18;
    }
  }
  objc_msgSend(v9, "parentSubContainerID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parentSubContainerID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  if (v24)
  else

  if ((v27 & 1) != 0)
    goto LABEL_17;
LABEL_15:
  v28 = 0;
LABEL_19:
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke;
  v41[3] = &unk_1E67F9228;
  v48 = a5;
  v45 = &v50;
  v46 = v38;
  v34 = v17;
  v42 = v34;
  v49 = v28;
  v35 = v39;
  v43 = v35;
  v44 = self;
  v47 = v37;
  -[REMAccountChangeItem _editListIDsOrderingUsingBlock:](self, "_editListIDsOrderingUsingBlock:", v41);

  _Block_object_dispose(&v50, 8);
}

void __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  id v25;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(_BYTE *)(a1 + 81))
    {
      +[REMLogStore write](REMLogStore, "write");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke_cold_1(a1, v6, v7);

    }
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(*(id *)(a1 + 48), "listIDsMergeableOrdering");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remObjectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "indexOfEqualObject:", v13);

      if (v14 != 0x7FFFFFFFFFFFFFFFLL && !*(_BYTE *)(a1 + 80))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14 + 1;

    }
    v15 = *(_QWORD *)(a1 + 64);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_BYTE *)(a1 + 80))
        v18 = (id)objc_msgSend(v3, "addObject:", v17);
      else
        v24 = (id)objc_msgSend(v3, "insertObject:atIndex:", v17, 0);
      goto LABEL_24;
    }
    if (!*(_BYTE *)(a1 + 80))
    {
      if (!v15)
        goto LABEL_28;
      v23 = v3;
LABEL_27:
      v25 = (id)objc_msgSend(v23, "moveObjectFromIndex:toIndex:");
      goto LABEL_28;
    }
    v21 = *(_QWORD *)(a1 + 72) - 1;
  }
  else
  {
    if (*(_BYTE *)(a1 + 80))
      *(_QWORD *)(v4 + 24) = v5 + 1;
    v15 = *(_QWORD *)(a1 + 64);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v3, "insertObject:atIndex:", v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

LABEL_24:
      goto LABEL_28;
    }
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v21 = (__PAIR128__(v22, v15) - v22) >> 64;
  }
  if (v15 != v21)
  {
    v23 = v3;
    goto LABEL_27;
  }
LABEL_28:

}

- (void)_lowLevelApplyUndoToOrdering:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__REMAccountChangeItem__lowLevelApplyUndoToOrdering___block_invoke;
  v6[3] = &unk_1E67F91B8;
  v7 = v4;
  v5 = v4;
  -[REMAccountChangeItem _editListIDsOrderingUsingBlock:](self, "_editListIDsOrderingUsingBlock:", v6);

}

uint64_t __53__REMAccountChangeItem__lowLevelApplyUndoToOrdering___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "undo:", *(_QWORD *)(a1 + 32));
}

- (void)_editListIDsOrderingUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v4 = (void (**)(id, void *))a3;
  -[REMAccountChangeItem saveRequest](self, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSaved");

  if (v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v16, 2u);
    }

  }
  -[REMAccountChangeItem storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "listIDsMergeableOrdering");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mutableOrderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountChangeItem saveRequest](self, "saveRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replicaManagerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReplicaManagerProvider:", v12);

  v4[2](v4, v10);
  objc_msgSend(v10, "immutableOrderedSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountChangeItem storage](self, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setListIDsMergeableOrdering:", v13);

  -[REMAccountChangeItem changedKeysObserver](self, "changedKeysObserver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyDidChange:", CFSTR("listIDsMergeableOrdering"));

}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMAccountStorage)storage
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedKeysObserver, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_saveRequest, 0);
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "trackedAccountCapabilities";
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a1, a3, "rem_log_fault_if (!trackedAccountCapabilities) -- invalid nil value for '%s'", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_1();
}

- (void)shallowCopyWithSaveRequest:(NSObject *)a3 .cold.4(void *a1, const char *a2, NSObject *a3)
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 138543618;
  v14 = v10;
  v15 = 2114;
  v16 = v11;
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, a3, v12, "[%{public}@] _trackedAccountCapabilitiesForObjectID should NOT yield nil result when copying this change item with a non-nil save request {objectID: %{public}@}", (uint8_t *)&v13);

  OUTLINED_FUNCTION_6();
}

- (void)capabilities
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v4, "trackedAccountCapabilities is unexpectedly nil when getting accountChangeItem.capabilities {objectID: %{public}@}", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)mergeableOrderingNodesByOrderingMergeableOrderingNodes:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v4, "Attemped to get ordering of lists not belonging to the provided account {objectIDs: %@}", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)lowLevelRemoveMergeableOrderingNodeIDFromOrdering:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, a4, a3, "Tried to remove node not present in ordering list {objectID: %{public}@, ordering: %{public}@}", (uint8_t *)a3);

}

- (void)test_lowLevelEditOrderingByMovingListObjectID:(uint64_t)a1 toTarget:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "listIDsMergeableOrdering");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v3, v4, "Tried to move list ID not present in ordering list {objectID: %@, ordering: %@}", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)test_lowLevelEditOrderingByMovingListObjectID:(uint64_t)a1 toTarget:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "listIDsMergeableOrdering");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v5, v6, "Tried to move list ID beyond bounds of ordering list {objectID: %@, count: %@}", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_lowLevelAddMergeableOrderingNodeToOrdering:(os_log_t)log atIndexOfSibling:isAfter:withParentMergeableOrderingNode:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (mergeableOrderingNode.accountID == nil || ![mergeableOrderingNode.accountID isEqual:self.objectID]) -- mergeableOrderingNode must have been assigned to this account change item at this point", v1, 2u);
}

void __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, a3, "Failed to find the insert after index of the given sibling list -- Appending to the end {objectID: %@}.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_1();
}

@end
