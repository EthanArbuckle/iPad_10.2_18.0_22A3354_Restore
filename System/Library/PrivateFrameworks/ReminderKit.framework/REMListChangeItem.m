@implementation REMListChangeItem

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_3;
    __sKeysToObserve_3 = (uint64_t)&unk_1E6836F10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836F28);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__resolutionTokenKeyDenylist_3;
    __resolutionTokenKeyDenylist_3 = v3;

  }
}

- (REMListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REMListChangeItem *v15;
  REMListChangeItem *v16;
  REMSaveRequest *saveRequest;
  void *v18;
  REMListChangeItem *v19;
  NSObject *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    v22.receiver = self;
    v22.super_class = (Class)REMListChangeItem;
    v15 = -[REMListChangeItem init](&v22, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_saveRequest, a3);
      objc_storeStrong((id *)&v16->_storage, a4);
      objc_storeStrong((id *)&v16->_changedKeysObserver, a6);
      saveRequest = v16->_saveRequest;
      -[REMListStorage objectID](v16->_storage, "objectID");
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

- (REMListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  REMChangedKeysObserver *v13;
  REMChangedKeysObserver *v14;
  REMListChangeItem *v15;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(a4, "copy");
  v13 = [REMChangedKeysObserver alloc];
  v14 = -[REMChangedKeysObserver initWithTarget:keysToObserve:includeInitial:](v13, "initWithTarget:keysToObserve:includeInitial:", v12, __sKeysToObserve_3, v6);
  v15 = -[REMListChangeItem initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:](self, "initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:", v11, v12, v10, v14);

  return v15;
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5
{
  return -[REMListChangeItem initWithObjectID:name:insertIntoAccountChangeItem:isGroup:](self, "initWithObjectID:name:insertIntoAccountChangeItem:isGroup:", a3, a4, a5, 0);
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5 isGroup:(BOOL)a6 withParentList:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  REMListStorage *v17;
  void *v18;
  void *v19;
  REMListStorage *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  REMListChangeItem *v25;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v15 && v8)
  {
    +[REMLogStore write](REMLogStore, "write");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[REMListChangeItem initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:].cold.1();

  }
  v17 = [REMListStorage alloc];
  objc_msgSend(v14, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[REMListStorage initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:](v17, "initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:", v12, v18, v13, v8, v19);

  objc_msgSend(v14, "objectID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setParentAccountID:](v20, "setParentAccountID:", v21);

  objc_msgSend(v15, "objectID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListStorage setParentListID:](v20, "setParentListID:", v22);

  -[REMListStorage setDaDisplayOrder:](v20, "setDaDisplayOrder:", 0);
  objc_msgSend(v14, "lowLevelAddMergeableOrderingNodeIDToOrdering:withParentMergeableOrderingNode:", v12, v15);
  objc_msgSend(v14, "saveRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "capabilities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[REMListChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](self, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", v23, v20, v24, 1);

  return v25;
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5 isGroup:(BOOL)a6
{
  return -[REMListChangeItem initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:](self, "initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:", a3, a4, a5, a6, 0);
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoListSublistContextChangeItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  REMListChangeItem *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "listChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_updateAccountWithListChangeItem:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "listChangeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[REMListChangeItem initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:](self, "initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:", v10, v9, v13, 0, v14);
  return v15;
}

- (REMAccountCapabilities)accountCapabilities
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  REMAccountCapabilities *v7;
  NSObject *v8;

  -[REMListChangeItem storage](self, "storage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[REMListChangeItem saveRequest](self, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_trackedAccountCapabilitiesForObjectID:", v6);
  v7 = (REMAccountCapabilities *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListChangeItem accountCapabilities].cold.1(self, v8);

    v7 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 0);
  }
  return v7;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  REMAccountCapabilities *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  REMListChangeItem *v12;
  REMListChangeItem *v13;
  void *v14;
  void *v15;

  v5 = a3;
  -[REMListChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[REMListChangeItem objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_trackedAccountCapabilitiesForObjectID:", v7);
    v8 = (REMAccountCapabilities *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_16:
      v13 = [REMListChangeItem alloc];
      -[REMListChangeItem storage](self, "storage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListChangeItem changedKeysObserver](self, "changedKeysObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[REMListChangeItem initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:](v13, "initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:", v5, v14, v8, v15);

      goto LABEL_17;
    }
    -[REMListChangeItem objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!v5)
      {
LABEL_15:
        v8 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 0);
        goto LABEL_16;
      }
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
        -[REMListChangeItem shallowCopyWithSaveRequest:].cold.2((uint64_t)self, a2);
    }

    goto LABEL_15;
  }
  +[REMLogStore write](REMLogStore, "write");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.1();

  -[REMListChangeItem storage](self, "storage");
  v12 = (REMListChangeItem *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12 = 0;
  else
    NSLog(CFSTR("'%s' is unexpectedly nil"), "self.storage");
LABEL_17:

  return v12;
}

- (REMListAppearanceContextChangeItem)appearanceContext
{
  void *v3;
  int v4;
  REMListAppearanceContextChangeItem *v5;

  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsListAppearance");

  if (v4)
    v5 = -[REMListAppearanceContextChangeItem initWithListChangeItem:]([REMListAppearanceContextChangeItem alloc], "initWithListChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMListSublistContextChangeItem)sublistContext
{
  REMListSublistContextChangeItem *v3;

  if (-[REMListChangeItem isGroup](self, "isGroup"))
    v3 = -[REMListSublistContextChangeItem initWithListChangeItem:]([REMListSublistContextChangeItem alloc], "initWithListChangeItem:", self);
  else
    v3 = 0;
  return v3;
}

- (REMListCalDAVNotificationContextChangeItem)calDAVNotificationContext
{
  void *v3;
  int v4;
  REMListCalDAVNotificationContextChangeItem *v5;

  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCalDAVNotifications");

  if (v4)
    v5 = -[REMListCalDAVNotificationContextChangeItem initWithListChangeItem:]([REMListCalDAVNotificationContextChangeItem alloc], "initWithListChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMListShareeContextChangeItem)shareeContext
{
  void *v3;
  int v4;
  REMListShareeContextChangeItem *v5;

  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsListShareesMutation");

  if (v4)
    v5 = -[REMListShareeContextChangeItem initWithListChangeItem:]([REMListShareeContextChangeItem alloc], "initWithListChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMListChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)removeFromParent
{
  id v2;

  v2 = -[REMListChangeItem removeFromAccountAllowingUndo](self, "removeFromAccountAllowingUndo");
}

- (id)removeFromAccountAllowingUndo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMListChangeItem parentAccountID](self, "parentAccountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[REMListChangeItem saveRequest](self, "saveRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateAccountWithListChangeItem:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMListChangeItem objectID](self, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowLevelRemoveMergeableOrderingNodeIDFromOrdering:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[REMListChangeItem setParentAccountID:](self, "setParentAccountID:", 0);
  -[REMListChangeItem setParentListID:](self, "setParentListID:", 0);
  return v3;
}

- (void)undeleteReminderWithID:(id)a3 usingUndo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[REMListChangeItem reminderIDsToUndelete](self, "reminderIDsToUndelete");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListChangeItem setReminderIDsToUndelete:](self, "setReminderIDsToUndelete:", v8);
  -[REMListChangeItem _lowLevelApplyUndoToOrdering:](self, "_lowLevelApplyUndoToOrdering:", v9);

}

- (void)addReminderChangeItem:(id)a3
{
  -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:](self, "insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:", a3, 0, 1, 0);
}

- (void)insertReminderChangeItem:(id)a3 afterReminderChangeItem:(id)a4
{
  -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:](self, "insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:", a3, a4, 1, 0);
}

- (void)insertReminderChangeItem:(id)a3 beforeReminderChangeItem:(id)a4
{
  -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:](self, "insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:", a3, a4, 0, 0);
}

- (BOOL)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  char v14;
  void *v15;
  uint64_t v16;
  REMListChangeItem *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(v4, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem saveRequest](self, "saveRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMListChangeItem optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:].cold.1(self, v7);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectID");
    v7 = objc_claimAutoreleasedReturnValue();
    -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v7);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "listChangeItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reminderIDsMergeableOrdering");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "indexOfObject:", v7);
      if (v12)
      {
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[REMLogStore write](REMLogStore, "write");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            -[REMListChangeItem optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:].cold.3();
LABEL_20:

          v14 = 0;
          goto LABEL_21;
        }
        v16 = v12 - 1;
        if (v12 < 1)
        {
          +[REMLogStore write](REMLogStore, "write", v16);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            -[REMListChangeItem optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:].cold.2();
          goto LABEL_20;
        }
        objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self;
        v18 = v7;
        v19 = v15;
        v20 = 1;
      }
      else
      {
        if ((unint64_t)objc_msgSend(v11, "count") < 2)
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = self;
        v18 = v7;
        v19 = v15;
        v20 = 0;
      }
      v14 = -[REMListChangeItem _lowLevelAddReminderIDToOrdering:relativeToSiblingID:isAfter:](v17, "_lowLevelAddReminderIDToOrdering:relativeToSiblingID:isAfter:", v18, v19, v20);

LABEL_21:
      goto LABEL_22;
    }
    v14 = 1;
  }
LABEL_22:

  return v14;
}

- (REMListSectionContextChangeItem)sectionsContextChangeItem
{
  void *v3;
  int v4;
  REMListSectionContextChangeItem *v5;

  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSections");

  if (v4)
    v5 = -[REMListSectionContextChangeItem initWithListChangeItem:]([REMListSectionContextChangeItem alloc], "initWithListChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMListGroceryContextChangeItem)groceryContextChangeItem
{
  void *v3;
  int v4;
  REMListGroceryContextChangeItem *v5;

  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSections");

  if (v4)
    v5 = -[REMListGroceryContextChangeItem initWithListChangeItem:]([REMListGroceryContextChangeItem alloc], "initWithListChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (void)undeleteRemindersWithoutUndoWithIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[REMListChangeItem reminderIDsToUndelete](self, "reminderIDsToUndelete");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setByAddingObjectsFromArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListChangeItem setReminderIDsToUndelete:](self, "setReminderIDsToUndelete:", v6);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__REMListChangeItem_undeleteRemindersWithoutUndoWithIDs___block_invoke;
    v7[3] = &unk_1E67FA598;
    v8 = v4;
    -[REMListChangeItem _editReminderIDsOrderingUsingBlock:](self, "_editReminderIDsOrderingUsingBlock:", v7);

  }
}

void __57__REMListChangeItem_undeleteRemindersWithoutUndoWithIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)undeleteRemindersWithoutUndoWithIDs:(id)a3 isCalDAV:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[REMListChangeItem undeleteRemindersWithoutUndoWithIDs:](self, "undeleteRemindersWithoutUndoWithIDs:", a3);
  if (v4)
    -[REMListChangeItem setRemindersICSDisplayOrderChanged:](self, "setRemindersICSDisplayOrderChanged:", 1);
}

- (void)insertReminderChangeItem:(id)a3 adjacentToReminderChangeItem:(id)a4 isAfter:(BOOL)a5 withParentReminderChangeItem:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  BOOL v40;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (unint64_t)a6;
  objc_msgSend(v10, "saveRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem saveRequest](self, "saveRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v14)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    objc_msgSend(v10, "saveRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListChangeItem saveRequest](self, "saveRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("Original reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}"), v10, v17, v18);

  }
  objc_msgSend(v10, "accountID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem accountID](self, "accountID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:].cold.3(v10, self, v22);

  }
  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v23 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject supportsMoveAcrossLists](v23, "supportsMoveAcrossLists") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(v10, "listID");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_12;
  v25 = (void *)v24;
  objc_msgSend(v10, "listID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem objectID](self, "objectID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqual:", v27);

  if ((v28 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:].cold.2((uint64_t)v10, self);
LABEL_12:

  }
  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v29 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject supportsMoveAcrossSharedLists](v29, "supportsMoveAcrossSharedLists") & 1) == 0)
  {
    objc_msgSend(v10, "listID");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      objc_msgSend(v10, "listID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListChangeItem objectID](self, "objectID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isEqual:", v33) & 1) != 0)
      {

      }
      else
      {
        objc_msgSend(v10, "listChangeItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "isShared") & 1) != 0)
        {

        }
        else
        {
          v40 = -[REMListChangeItem isShared](self, "isShared");

          if (!v40)
            goto LABEL_23;
        }
        +[REMLogStore write](REMLogStore, "write");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:].cold.1((uint64_t)v10, self);
      }
    }
  }

LABEL_23:
  if (v10 != v11)
  {
LABEL_24:
    -[REMListChangeItem _reassignReminderChangeItem:withParentReminderChangeItem:](self, "_reassignReminderChangeItem:withParentReminderChangeItem:", v10, v12);
    -[REMListChangeItem _lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:](self, "_lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:", v10, v11, v7, v12);
    goto LABEL_27;
  }
  objc_msgSend(v10, "parentReminderID");
  v35 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v12 | v35)
  {
    v36 = (void *)v35;
    objc_msgSend(v10, "parentReminderID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "objectID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    v11 = v10;
    if ((v39 & 1) == 0)
    {

      v11 = 0;
      goto LABEL_24;
    }
  }
LABEL_27:

}

- (void)lowLevelAddReminderIDToOrdering:(id)a3 withParentReminderChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7)
  {
    v10 = v7;
    -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:", v12);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[REMLogStore write](REMLogStore, "write");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        -[REMListChangeItem objectID](self, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v16;
        v23 = 2112;
        v24 = v6;
        v25 = 2112;
        v26 = v17;
        _os_log_fault_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_FAULT, "Tried to add a new subtask with a parent reminder but could not find the parent reminder in the list's reminder IDs ordering {listID: %@, reminderID: %@, parentReminderID: %@}.", buf, 0x20u);

      }
    }
    else
    {
      v9 = v13 + 1;
    }

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__REMListChangeItem_lowLevelAddReminderIDToOrdering_withParentReminderChangeItem___block_invoke;
  v18[3] = &unk_1E67FA5C0;
  v19 = v6;
  v20 = v9;
  v15 = v6;
  -[REMListChangeItem _editReminderIDsOrderingUsingBlock:](self, "_editReminderIDsOrderingUsingBlock:", v18);

}

void __82__REMListChangeItem_lowLevelAddReminderIDToOrdering_withParentReminderChangeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = a3;
    v8 = a2;
    v6 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = a3;
    objc_msgSend(a2, "insertObject:atIndex:", v9, v6);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));

}

- (id)lowLevelRemoveReminderIDFromOrdering:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v20 = 0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListChangeItem lowLevelRemoveReminderIDFromOrdering:].cold.1((uint64_t)v4, v8, (uint64_t)v21, v7);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke;
    v11[3] = &unk_1E67FA610;
    v14 = v6;
    v12 = v4;
    v13 = &v15;
    -[REMListChangeItem _editReminderIDsOrderingUsingBlock:](self, "_editReminderIDsOrderingUsingBlock:", v11);
    v7 = v12;
  }

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  REMMutableCRUndo *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_alloc_init(REMMutableCRUndo);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke_2;
  v11 = &unk_1E67FA5E8;
  v13 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  -[REMMutableCRUndo addUndoBlock:](v4, "addUndoBlock:", &v8);
  objc_msgSend(v3, "removeObjectAtIndex:", *(_QWORD *)(a1 + 48), v8, v9, v10, v11);

  -[REMMutableCRUndo immutableCopy](v4, "immutableCopy");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "count");
  if (v3 >= *(_QWORD *)(a1 + 40))
    v4 = *(_QWORD *)(a1 + 40);
  else
    v4 = v3;
  objc_msgSend(v5, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), v4);

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
  v6[2] = __50__REMListChangeItem__lowLevelApplyUndoToOrdering___block_invoke;
  v6[3] = &unk_1E67FA598;
  v7 = v4;
  v5 = v4;
  -[REMListChangeItem _editReminderIDsOrderingUsingBlock:](self, "_editReminderIDsOrderingUsingBlock:", v6);

}

void __50__REMListChangeItem__lowLevelApplyUndoToOrdering___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "undoBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_lowLevelAddReminderIDToOrdering:(id)a3 relativeToSiblingID:(id)a4 isAfter:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    if (v5)
    {
      -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    else
    {
      v14 = 0;
    }
    goto LABEL_8;
  }
  -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v9);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v11 + v5;
LABEL_8:
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__REMListChangeItem__lowLevelAddReminderIDToOrdering_relativeToSiblingID_isAfter___block_invoke;
    v16[3] = &unk_1E67FA5C0;
    v17 = v8;
    v18 = v14;
    -[REMListChangeItem _editReminderIDsOrderingUsingBlock:](self, "_editReminderIDsOrderingUsingBlock:", v16);

    v12 = 1;
    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

void __82__REMListChangeItem__lowLevelAddReminderIDToOrdering_relativeToSiblingID_isAfter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(a2, "insertObject:atIndex:", v5, v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, *(_QWORD *)(a1 + 32));

}

- (id)changedKeys
{
  void *v2;
  void *v3;

  -[REMListChangeItem changedKeysObserver](self, "changedKeysObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ekColor
{
  void *v2;
  void *v3;

  -[REMListChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ekColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDaDisplayOrder:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  -[REMListChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "daDisplayOrder");

  if (v6 != a3)
  {
    -[REMListChangeItem saveRequest](self, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateAccountWithListChangeItem:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "setListsDADisplayOrderChanged:", 1);
      -[REMListChangeItem storage](self, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDaDisplayOrder:", a3);

      -[REMListChangeItem changedKeysObserver](self, "changedKeysObserver");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject keyDidChange:](v10, "keyDidChange:", CFSTR("daDisplayOrder"));
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMListChangeItem setDaDisplayOrder:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

  }
}

- (void)setDaIsNotificationsCollection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  -[REMListChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "daIsNotificationsCollection");

  if (v6 != v3)
  {
    -[REMListChangeItem saveRequest](self, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateAccountWithListChangeItem:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[REMLogStore write](REMLogStore, "write");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[REMListChangeItem setDaIsNotificationsCollection:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    }
    objc_msgSend(v8, "setListsDADisplayOrderChanged:", 1);
    -[REMListChangeItem storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDaIsNotificationsCollection:", v3);

    -[REMListChangeItem changedKeysObserver](self, "changedKeysObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyDidChange:", CFSTR("daIsNotificationsCollection"));

  }
}

- (BOOL)isPinned
{
  void *v2;
  BOOL v3;

  -[REMListChangeItem pinnedDate](self, "pinnedDate");
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
  -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsPinnedLists");

  if ((v6 & 1) != 0)
  {
    if (-[REMListChangeItem isPinned](self, "isPinned") != v3)
    {
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[REMListChangeItem setPinnedDate:](self, "setPinnedDate:", v8);

      }
      else
      {
        -[REMListChangeItem setPinnedDate:](self, "setPinnedDate:", 0);
      }
    }
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMListChangeItem setIsPinned:].cold.1(self, v7);

  }
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMListChangeItem storage](self, "storage");
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
  v7.super_class = (Class)REMListChangeItem;
  if (-[REMListChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMListChangeItem storage](self, "storage");
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
  -[REMListChangeItem saveRequest](self, "saveRequest");
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
  -[REMListChangeItem storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v7, v6);

}

- (void)_reassignReminderChangeItem:(id)a3 withParentReminderChangeItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "removeFromList");
  -[REMListChangeItem objectID](self, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setListID:", v7);

  -[REMListChangeItem accountID](self, "accountID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountID:", v8);

  if (v6)
  {
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setParentReminderID:", v9);

  }
}

- (void)_lowLevelAddReminderChangeItemToOrdering:(id)a3 atIndexOfSibling:(id)a4 isAfter:(BOOL)a5 withParent:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  BOOL v50;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "listID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_3;
  v14 = (void *)v13;
  objc_msgSend(v10, "listID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem objectID](self, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if ((v17 & 1) == 0)
  {
LABEL_3:
    +[REMLogStore write](REMLogStore, "write");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[REMListChangeItem _lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

  }
  objc_msgSend(v10, "objectID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  if (!v27)
    goto LABEL_18;
  objc_msgSend(v10, "listID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "listID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if (!v30)
    goto LABEL_18;
  objc_msgSend(v10, "parentReminderID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31 || (objc_msgSend(v27, "parentReminderID"), (v46 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v10, "parentReminderID", v46);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "parentReminderID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (v31)
    {

      if (!v34)
        goto LABEL_18;
    }
    else
    {

      if ((v34 & 1) == 0)
        goto LABEL_18;
    }
  }
  -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering", v46);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v35, "indexOfObject:", v36);

  if (v37 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v39 = v37 + v7;
    goto LABEL_24;
  }
  +[REMLogStore write](REMLogStore, "write");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    -[REMListChangeItem _lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:].cold.1();

LABEL_18:
  v39 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
  {
    v40 = v12;
    -[REMListChangeItem reminderIDsMergeableOrdering](self, "reminderIDsMergeableOrdering");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v41, "indexOfObject:", v42);
    if (v43 != 0x7FFFFFFFFFFFFFFFLL && !v7)
      v39 = v43 + 1;
  }
LABEL_24:
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __98__REMListChangeItem__lowLevelAddReminderChangeItemToOrdering_atIndexOfSibling_isAfter_withParent___block_invoke;
  v47[3] = &unk_1E67FA638;
  v48 = v26;
  v49 = v39;
  v50 = v7;
  v45 = v26;
  -[REMListChangeItem _editReminderIDsOrderingUsingBlock:](self, "_editReminderIDsOrderingUsingBlock:", v47);

}

void __98__REMListChangeItem__lowLevelAddReminderChangeItemToOrdering_atIndexOfSibling_isAfter_withParent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v6 = objc_msgSend(v8, "count");
      objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(v8, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), 0);
      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v8, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, *(_QWORD *)(a1 + 32));

}

- (void)_editReminderIDsOrderingUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  -[REMListChangeItem saveRequest](self, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSaved");

  if (v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", (uint8_t *)&v23, 2u);
    }

  }
  -[REMListChangeItem saveRequest](self, "saveRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "applyCRDTsWithoutMerging");

  if ((v9 & 1) == 0)
  {
    -[REMListChangeItem storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reminderIDsMergeableOrdering");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v12, v13);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListChangeItem storage](self, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setReminderIDsMergeableOrdering:", v14);

    +[REMLogStore write](REMLogStore, "write");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[REMListChangeItem objectID](self, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListChangeItem saveRequest](self, "saveRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_INFO, "REMListChangeItem updated storage.reminderIDsMergeableOrdering {objectID: %@, saveReq: %@, ordering.count: %@}", (uint8_t *)&v23, 0x20u);

    }
    if (objc_msgSend(v13, "count"))
    {
      -[REMListChangeItem reminderIDsOrderingHints](self, "reminderIDsOrderingHints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");

      objc_msgSend(v21, "addEntriesFromDictionary:", v13);
      -[REMListChangeItem setReminderIDsOrderingHints:](self, "setReminderIDsOrderingHints:", v21);

    }
    -[REMListChangeItem changedKeysObserver](self, "changedKeysObserver");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "keyDidChange:", CFSTR("reminderIDsMergeableOrdering"));

  }
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)__resolutionTokenKeyDenylist_3;
  v4 = a3;
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (BOOL)isShared
{
  REMListChangeItem *v2;
  void *v3;

  v2 = self;
  -[REMListChangeItem sharees](self, "sharees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", objc_msgSend(v3, "count"), -[REMListChangeItem sharingStatus](v2, "sharingStatus"));

  return (char)v2;
}

- (BOOL)isOwnedByMe
{
  return +[REMList isOwnedByMeWithSharingStatus:](REMList, "isOwnedByMeWithSharingStatus:", -[REMListChangeItem sharingStatus](self, "sharingStatus"));
}

- (BOOL)isSharedToMe
{
  return -[REMListChangeItem sharingStatus](self, "sharingStatus") == 2;
}

- (BOOL)canBeIncludedInGroup
{
  return !-[REMListChangeItem isSharedToMe](self, "isSharedToMe");
}

+ (id)newObjectID
{
  return +[REMListStorage newObjectID](REMListStorage, "newObjectID");
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMListStorage objectIDWithUUID:](REMListStorage, "objectIDWithUUID:", a3);
}

+ (NSString)cdEntityName
{
  return +[REMListStorage cdEntityName](REMListStorage, "cdEntityName");
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMListChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMListStorage)storage
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

- (void)copyListDataFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem setName:](self, "setName:", v5);

  objc_msgSend(v4, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem setColor:](self, "setColor:", v6);

  -[REMListChangeItem setDaDisplayOrder:](self, "setDaDisplayOrder:", objc_msgSend(v4, "daDisplayOrder"));
  objc_msgSend(v4, "lastUserAccessDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem setLastUserAccessDate:](self, "setLastUserAccessDate:", v7);

  objc_msgSend(v4, "sortingStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem setSortingStyle:](self, "setSortingStyle:", v8);

  objc_msgSend(v4, "pinnedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem setPinnedDate:](self, "setPinnedDate:", v9);

  if (objc_msgSend(v4, "isGroup"))
  {
    -[REMListChangeItem accountCapabilities](self, "accountCapabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsGroups");

    if ((v11 & 1) == 0)
    {
      +[REMLogStore write](REMLogStore, "write");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[REMListChangeItem(AccountDataMoving) copyListDataFrom:].cold.1(v4, v12);

    }
  }

}

- (void)_testingOnly_setReminderIDsMergeableOrder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReminderIDsMergeableOrdering:", v4);

  -[REMListChangeItem changedKeysObserver](self, "changedKeysObserver");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyDidChange:", CFSTR("reminderIDsMergeableOrdering"));

}

- (id)_testingOnly_listShareeContextChangeItem
{
  return -[REMListShareeContextChangeItem initWithListChangeItem:]([REMListShareeContextChangeItem alloc], "initWithListChangeItem:", self);
}

- (void)initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "Tried to initialize a nested group {listChangeItem: %@}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)accountCapabilities
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v4, "trackedAccountCapabilities is unexpectedly nil when getting listChangeItem.accountCapabilities {objectID: %{public}@}", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.2(uint64_t a1, const char *a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543618;
  v12 = v8;
  v13 = 2112;
  v14 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v9, v10, "[%{public}@] self.objectID should not be nil when copying this change item {self: %@}", (uint8_t *)&v11);

  OUTLINED_FUNCTION_6();
}

- (void)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "saveRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v4, "Trying to optimistically insert reminderID to the ordering of a REMListChangeItem for a REMReminderChangeItem tracked by the same REMSaveRequest {saveRequest: %@}", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "Unexpected index of objectID in reminderIDsMergeableOrdering {index: %ld}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "objectID of reminderChangeItem does not exist in its listChangeItem.reminderIDsMergeableOrdering {objectID: %@}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)insertReminderChangeItem:(uint64_t)a1 adjacentToReminderChangeItem:(void *)a2 isAfter:withParentReminderChangeItem:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "accountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v3, v4, "Cannot move reminder across shared lists for account {original: %@, accountID: %@}", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)insertReminderChangeItem:(uint64_t)a1 adjacentToReminderChangeItem:(void *)a2 isAfter:withParentReminderChangeItem:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "accountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v3, v4, "Cannot move reminder across lists for account {original: %@, accountID: %@}", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)insertReminderChangeItem:(NSObject *)a3 adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:.cold.3(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_fault_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_FAULT, "Cannot move reminders across accounts {original: %@, accountID: %@, expectedAccountID: %@}", (uint8_t *)&v8, 0x20u);

  OUTLINED_FUNCTION_1();
}

- (void)lowLevelRemoveReminderIDFromOrdering:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B4A39000, a4, a3, "Tried to remove reminder not present in ordering list {objectID: %@, ordering: %@}", (uint8_t *)a3);

}

- (void)setDaDisplayOrder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "rem_log_fault_if (accountChangeItem == nil) -- accountChangeItem is nil. Unable to update account when setting daDisplayOrder.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)setDaIsNotificationsCollection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "rem_log_fault_if (accountChangeItem == nil) -- accountChangeItem is nil. Unable to update account when setting daIsNotificationsCollection.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)setIsPinned:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, a2, v4, "'- [REMListChangeItem setIsPinned:]' should not be called because account does not support pinned lists {objectID: %@}", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)_lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1B4A39000, v0, v1, "Failed to find the insert after index of the given sibling reminder -- Appending to the end {objectID: %@}.", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)_lowLevelAddReminderChangeItemToOrdering:(uint64_t)a3 atIndexOfSibling:(uint64_t)a4 isAfter:(uint64_t)a5 withParent:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, a1, a3, "rem_log_fault_if (reminderChangeItem.listID == nil || ![reminderChangeItem.listID isEqual:self.objectID]) -- reminderChangeItem must have been assigned to this list change item at this point", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

@end
