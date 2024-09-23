@implementation REMReminderChangeItem

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve;
    __sKeysToObserve = (uint64_t)&unk_1E6836D30;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836D48);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)__resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDReminder;
    __resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDReminder = v3;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6836D60);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDSavedReminder;
    __resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDSavedReminder = v5;

  }
}

- (REMReminderChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REMReminderChangeItem *v15;
  REMReminderChangeItem *v16;
  REMSaveRequest *saveRequest;
  void *v18;
  REMReminderChangeItem *v19;
  NSObject *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    v22.receiver = self;
    v22.super_class = (Class)REMReminderChangeItem;
    v15 = -[REMReminderChangeItem init](&v22, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_saveRequest, a3);
      objc_storeStrong((id *)&v16->_storage, a4);
      objc_storeStrong((id *)&v16->_changedKeysObserver, a6);
      saveRequest = v16->_saveRequest;
      -[REMReminderStorage objectID](v16->_storage, "objectID");
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

- (REMReminderChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  REMChangedKeysObserver *v13;
  REMChangedKeysObserver *v14;
  REMReminderChangeItem *v15;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(a4, "copy");
  v13 = [REMChangedKeysObserver alloc];
  v14 = -[REMChangedKeysObserver initWithTarget:keysToObserve:includeInitial:](v13, "initWithTarget:keysToObserve:includeInitial:", v12, __sKeysToObserve, v6);
  v15 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:](self, "initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:", v11, v12, v10, v14);

  return v15;
}

- (REMReminderChangeItem)initWithObjectID:(id)a3 title:(id)a4 insertIntoListChangeItem:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  REMReminderStorage *v12;
  void *v13;
  REMReminderStorage *v14;
  REMCRMergeableStringDocument *v15;
  void *v16;
  REMCRMergeableStringDocument *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  REMReminderChangeItem *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  objc_msgSend(v10, "accountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [REMReminderStorage alloc];
  objc_msgSend(v10, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[REMReminderStorage initWithObjectID:listID:accountID:](v12, "initWithObjectID:listID:accountID:", v8, v13, v11);

  if (!v9)
    v9 = &stru_1E67FB1F0;
  v15 = [REMCRMergeableStringDocument alloc];
  -[REMReminderStorage titleReplicaIDSource](v14, "titleReplicaIDSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[REMCRMergeableStringDocument initWithReplicaIDSource:string:](v15, "initWithReplicaIDSource:string:", v16, v9);

  -[REMReminderStorage setTitleDocument:](v14, "setTitleDocument:", v17);
  objc_msgSend(v10, "lowLevelAddReminderIDToOrdering:withParentReminderChangeItem:", v8, 0);
  objc_msgSend(v10, "groceryContextChangeItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldCategorizeGroceryItems");

  if (v19)
  {
    objc_msgSend(v10, "groceryContextChangeItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "categorizeGroceryItemsWithReminderIDs:", v21);

  }
  objc_msgSend(v10, "saveRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountCapabilities");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](self, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", v22, v14, v23, 1);

  return v24;
}

- (REMReminderChangeItem)initWithObjectID:(id)a3 title:(id)a4 insertIntoParentReminderSubtaskContextChangeItem:(id)a5
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  REMReminderStorage *v11;
  void *v12;
  REMReminderStorage *v13;
  void *v14;
  REMCRMergeableStringDocument *v15;
  void *v16;
  REMCRMergeableStringDocument *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  REMReminderChangeItem *v25;
  NSObject *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  objc_msgSend(a5, "reminderChangeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [REMReminderStorage alloc];
  objc_msgSend(v9, "listID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REMReminderStorage initWithObjectID:listID:accountID:](v11, "initWithObjectID:listID:accountID:", v7, v12, v10);

  objc_msgSend(v9, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setParentReminderID:](v13, "setParentReminderID:", v14);

  if (!v8)
    v8 = &stru_1E67FB1F0;
  v15 = [REMCRMergeableStringDocument alloc];
  -[REMReminderStorage titleReplicaIDSource](v13, "titleReplicaIDSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[REMCRMergeableStringDocument initWithReplicaIDSource:string:](v15, "initWithReplicaIDSource:string:", v16, v8);

  -[REMReminderStorage setTitleDocument:](v13, "setTitleDocument:", v17);
  objc_msgSend(v9, "saveRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_updateListWithReminderChangeItem:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[REMLogStore write](REMLogStore, "write");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[REMReminderChangeItem initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:].cold.1();

  }
  objc_msgSend(v19, "lowLevelAddReminderIDToOrdering:withParentReminderChangeItem:", v7, v9);
  objc_msgSend(v19, "groceryContextChangeItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "shouldCategorizeGroceryItems");

  if (v21)
  {
    objc_msgSend(v19, "groceryContextChangeItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "categorizeGroceryItemsWithReminderIDs:", v23);

  }
  objc_msgSend(v9, "accountCapabilities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](self, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", v18, v13, v24, 1);

  return v25;
}

- (REMReminderChangeItem)initWithReminderChangeItem:(id)a3 insertIntoListChangeItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  REMReminderStorage *v9;
  void *v10;
  void *v11;
  REMReminderStorage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REMReminderChangeItem *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = +[REMReminder newObjectID](REMReminder, "newObjectID");
  v9 = [REMReminderStorage alloc];
  objc_msgSend(v6, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[REMReminderStorage initWithObjectID:listID:accountID:](v9, "initWithObjectID:listID:accountID:", v8, v10, v11);

  objc_msgSend(v6, "lowLevelAddReminderIDToOrdering:withParentReminderChangeItem:", v8, 0);
  objc_msgSend(v6, "groceryContextChangeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "shouldCategorizeGroceryItems");

  if ((_DWORD)v11)
  {
    objc_msgSend(v6, "groceryContextChangeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "categorizeGroceryItemsWithReminderIDs:", v15);

  }
  objc_msgSend(v7, "saveRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountCapabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](self, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", v16, v12, v17, 1);

  objc_msgSend(v7, "copyInto:", v18);
  return v18;
}

- (REMReminderChangeItem)initWithReminderChangeItem:(id)a3 insertIntoParentReminderSubtaskContextChangeItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  REMReminderStorage *v11;
  void *v12;
  REMReminderStorage *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  REMReminderChangeItem *v23;
  NSObject *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = +[REMReminder newObjectID](REMReminder, "newObjectID");
  objc_msgSend(v6, "reminderChangeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [REMReminderStorage alloc];
  objc_msgSend(v9, "listID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REMReminderStorage initWithObjectID:listID:accountID:](v11, "initWithObjectID:listID:accountID:", v8, v12, v10);

  objc_msgSend(v9, "objectID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderStorage setParentReminderID:](v13, "setParentReminderID:", v14);

  objc_msgSend(v9, "saveRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_updateListWithReminderChangeItem:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[REMLogStore write](REMLogStore, "write");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[REMReminderChangeItem initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:].cold.1();

  }
  objc_msgSend(v16, "lowLevelAddReminderIDToOrdering:withParentReminderChangeItem:", v8, v9);
  objc_msgSend(v16, "groceryContextChangeItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldCategorizeGroceryItems");

  if (v18)
  {
    objc_msgSend(v16, "groceryContextChangeItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "categorizeGroceryItemsWithReminderIDs:", v20);

  }
  objc_msgSend(v7, "saveRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountCapabilities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](self, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", v21, v13, v22, 1);

  objc_msgSend(v7, "copyInto:", v23);
  return v23;
}

- (REMAccountCapabilities)accountCapabilities
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  REMAccountCapabilities *v7;
  NSObject *v8;

  -[REMReminderChangeItem storage](self, "storage");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[REMReminderChangeItem saveRequest](self, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_trackedAccountCapabilitiesForObjectID:", v6);
  v7 = (REMAccountCapabilities *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMReminderChangeItem accountCapabilities].cold.1(self);

    v7 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 0);
  }
  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)datesDebugDescriptionInTimeZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "datesDebugDescriptionInTimeZone:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)duplicateForRecurrenceUsingReminderID:(id)a3
{
  id v4;
  REMReminderChangeItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v32;

  v4 = a3;
  v5 = self;
  -[REMReminderChangeItem saveRequest](v5, "saveRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem titleAsString](v5, "titleAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v8;
  v10 = &stru_1E67FB1F0;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  -[REMReminderChangeItem accountCapabilities](v5, "accountCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "insertsCompletedRecurrentCloneAtTail");

  -[REMReminderChangeItem parentReminderID](v5, "parentReminderID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[REMReminderChangeItem parentReminderID](v5, "parentReminderID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_trackedReminderChangeItemForObjectID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "subtaskContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v6, "addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:", v11, v17, v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertReminderChangeItem:beforeReminderChangeItem:", v18, v5);
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem duplicateForRecurrenceUsingReminderID:].cold.3(v5);

      v18 = 0;
    }

  }
  else
  {
    -[REMReminderChangeItem listID](v5, "listID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      +[REMLogStore write](REMLogStore, "write");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem duplicateForRecurrenceUsingReminderID:].cold.1();
      v18 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v6, "_updateListWithReminderChangeItem:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "addReminderWithTitle:toListChangeItem:reminderObjectID:", v11, v16, v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v16, "insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:", v18, 0, 1, 0);
      else
        objc_msgSend(v16, "insertReminderChangeItem:beforeReminderChangeItem:", v18, v5);
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem duplicateForRecurrenceUsingReminderID:].cold.2(v5);

      v18 = 0;
    }
  }

  if (v18)
  {
    -[REMReminderChangeItem copyInto:](v5, "copyInto:", v18);
    -[REMReminderChangeItem assignmentContext](v5, "assignmentContext");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v18, "assignmentContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[REMReminderChangeItem assignmentContext](v5, "assignmentContext");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "currentAssignment");
        v25 = objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v18, "assignmentContext");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject assigneeID](v25, "assigneeID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject originatorID](v25, "originatorID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addAssignmentWithAssigneeID:originatorID:status:", v27, v28, -[NSObject status](v25, "status"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject assignedDate](v25, "assignedDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setAssignedDate:", v30);

        }
LABEL_22:

      }
    }
  }

  return v18;
}

- (void)copyInto:(id)a3
{
  id v4;
  REMReminderChangeItem *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  REMRecurrenceRule *v32;
  id v33;
  void *v34;
  void *v35;
  REMRecurrenceRule *v36;
  REMReminderChangeItem *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  REMAttachment *v49;
  void *v50;
  void *v51;
  void *v52;
  REMAttachment *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *k;
  void *v69;
  void *v70;
  REMHashtag *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  REMHashtag *v77;
  void *v78;
  TTREMHashtag *v79;
  void *v80;
  TTREMHashtag *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t m;
  uint64_t v101;
  void *v102;
  id v103;
  REMReminderChangeItem *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  id obj;
  id obja;
  id objb;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
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
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  -[REMReminderChangeItem title](v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setTitle:", v7);

  -[REMReminderChangeItem notes](v5, "notes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "setNotes:", v9);

  -[REMReminderChangeItem creationDate](v5, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v4, "setCreationDate:", v11);

  -[REMReminderChangeItem lastModifiedDate](v5, "lastModifiedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v4, "setLastModifiedDate:", v13);

  objc_msgSend(v4, "setCompleted:", -[REMReminderChangeItem isCompleted](v5, "isCompleted"));
  -[REMReminderChangeItem completionDate](v5, "completionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v4, "setCompletionDate:", v15);

  objc_msgSend(v4, "setPriority:", -[REMReminderChangeItem priority](v5, "priority"));
  -[REMReminderChangeItem startDateComponents](v5, "startDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v4, "setStartDateComponents:", v17);

  -[REMReminderChangeItem dueDateComponents](v5, "dueDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v4, "setDueDateComponents:", v19);

  -[REMReminderChangeItem lastBannerPresentationDate](v5, "lastBannerPresentationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v4, "setLastBannerPresentationDate:", v21);

  -[REMReminderChangeItem userActivity](v5, "userActivity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v4, "setUserActivity:", v23);

  -[REMReminderChangeItem icsUrl](v5, "icsUrl");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v4, "setIcsUrl:", v25);

  -[REMReminderChangeItem alternativeDisplayDateDate_forCalendar](v5, "alternativeDisplayDateDate_forCalendar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlternativeDisplayDateDate_forCalendar:", v26);

  objc_msgSend(v4, "removeAllRecurrenceRules");
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v104 = v5;
  -[REMReminderChangeItem recurrenceRules](v5, "recurrenceRules");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v125 != v29)
          objc_enumerationMutation(obj);
        v31 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * i);
        v32 = [REMRecurrenceRule alloc];
        v33 = +[REMRecurrenceRule newObjectID](REMRecurrenceRule, "newObjectID");
        objc_msgSend(v4, "accountID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[REMRecurrenceRule initWithRecurrenceRule:objectID:accountID:reminderID:](v32, "initWithRecurrenceRule:objectID:accountID:reminderID:", v31, v33, v34, v35);

        objc_msgSend(v4, "addRecurrenceRule:", v36);
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v131, 16);
    }
    while (v28);
  }

  v37 = v104;
  -[REMReminderChangeItem _copyAlarmsInto:](v104, "_copyAlarmsInto:", v4);
  -[REMReminderChangeItem subtaskContext](v104, "subtaskContext");

  -[REMReminderChangeItem attachmentContext](v104, "attachmentContext");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    objc_msgSend(v4, "attachmentContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "attachmentContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removeAllAttachments");

      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      -[REMReminderChangeItem attachmentContext](v104, "attachmentContext");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "attachments");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      obja = v43;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v121;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v121 != v46)
              objc_enumerationMutation(obja);
            v48 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * j);
            v49 = [REMAttachment alloc];
            v50 = (void *)objc_msgSend((id)objc_opt_class(), "newObjectID");
            objc_msgSend(v4, "accountID");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = -[REMAttachment initWithAttachment:objectID:accountID:reminderID:](v49, "initWithAttachment:objectID:accountID:reminderID:", v48, v50, v51, v52);

            objc_msgSend(v4, "attachmentContext");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "addAttachment:", v53);

          }
          v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
        }
        while (v45);
      }

      v37 = v104;
    }
  }
  -[REMReminderChangeItem flaggedContext](v37, "flaggedContext");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    objc_msgSend(v4, "flaggedContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      -[REMReminderChangeItem flaggedContext](v37, "flaggedContext");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "flagged");
      objc_msgSend(v4, "flaggedContext");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setFlagged:", v59);

    }
  }
  objc_msgSend(v4, "assignmentContext");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v4, "assignmentContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "removeAllAssignments");

  }
  objc_msgSend(v4, "hashtagContext");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
    goto LABEL_51;
  objc_msgSend(v4, "hashtagContext");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "removeAllHashtags");

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  -[REMReminderChangeItem hashtagContext](v37, "hashtagContext");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "hashtags");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objb = (id)objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
  if (!objb)
  {

    v67 = 0;
    v92 = 0;
    goto LABEL_50;
  }
  v67 = 0;
  v107 = 0;
  v108 = 0;
  v105 = v66;
  v106 = *(_QWORD *)v117;
  do
  {
    for (k = 0; k != objb; k = (char *)k + 1)
    {
      v69 = v67;
      if (*(_QWORD *)v117 != v106)
        objc_enumerationMutation(v105);
      v70 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)k);
      v71 = [REMHashtag alloc];
      v72 = (void *)objc_msgSend((id)objc_opt_class(), "newObjectID");
      objc_msgSend(v4, "accountID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v70, "type");
      objc_msgSend(v70, "name");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[REMHashtag initWithObjectID:accountID:reminderID:type:name:](v71, "initWithObjectID:accountID:reminderID:type:name:", v72, v73, v74, v75, v76);

      objc_msgSend(v4, "hashtagContext");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "addHashtag:", v77);

      if (objc_msgSend(v70, "type") != 1)
      {
        v67 = v69;
        goto LABEL_42;
      }
      v79 = objc_alloc_init(TTREMHashtag);
      objc_msgSend(v70, "objectIdentifier");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTREMHashtag setObjectIdentifier:](v79, "setObjectIdentifier:", v80);

      v81 = objc_alloc_init(TTREMHashtag);
      -[REMHashtag objectIdentifier](v77, "objectIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTREMHashtag setObjectIdentifier:](v81, "setObjectIdentifier:", v82);

      v83 = v108;
      v67 = v69;
      if (v108)
        goto LABEL_33;
      objc_msgSend(v4, "title");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84)
      {
        v85 = objc_alloc(MEMORY[0x1E0CB3778]);
        objc_msgSend(v4, "title");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v85, "initWithAttributedString:", v86);

        v83 = (void *)v87;
LABEL_33:
        if (!v69)
          goto LABEL_34;
        goto LABEL_41;
      }
      v83 = 0;
      if (!v69)
      {
LABEL_34:
        v88 = v83;
        objc_msgSend(v4, "notes");
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        if (v89)
        {
          v90 = objc_alloc(MEMORY[0x1E0CB3778]);
          objc_msgSend(v4, "notes");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (void *)objc_msgSend(v90, "initWithAttributedString:", v91);

        }
        else
        {
          v67 = 0;
        }
        v83 = v88;
      }
LABEL_41:
      v108 = v83;
      LODWORD(v107) = objc_msgSend(v83, "rem_replaceTTREMHashtag:withTTREMHashtag:", v79, v81) | v107;
      HIDWORD(v107) |= objc_msgSend(v67, "rem_replaceTTREMHashtag:withTTREMHashtag:", v79, v81);

LABEL_42:
    }
    objb = (id)objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
  }
  while (objb);

  if ((v107 & 1) != 0)
    objc_msgSend(v4, "setTitle:", v108);
  v37 = v104;
  if ((v107 & 0x100000000) != 0)
    objc_msgSend(v4, "setNotes:", v67);
  v92 = v108;
LABEL_50:

LABEL_51:
  objc_msgSend(v4, "dueDateDeltaAlertContext");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    objc_msgSend((id)objc_opt_class(), "_ensureDueDateDeltaAlertsAreFetchedIfNecessary:", v4);
    objc_msgSend(v4, "dueDateDeltaAlertContext");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "removeAllFetchedDueDateDeltaAlerts");

    objc_msgSend((id)objc_opt_class(), "_ensureDueDateDeltaAlertsAreFetchedIfNecessary:", v37);
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    -[REMReminderChangeItem storage](v37, "storage");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "fetchedDueDateDeltaAlerts");
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
    if (v97)
    {
      v98 = v97;
      v99 = *(_QWORD *)v113;
      do
      {
        for (m = 0; m != v98; ++m)
        {
          if (*(_QWORD *)v113 != v99)
            objc_enumerationMutation(v96);
          v101 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * m);
          objc_msgSend(v4, "dueDateDeltaAlertContext");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = (id)objc_msgSend(v102, "addDueDateDeltaAlertWithDueDateDeltaAlert:", v101);

        }
        v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
      }
      while (v98);
    }

    v37 = v104;
  }

}

+ (void)_ensureDueDateDeltaAlertsAreFetchedIfNecessary:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasUnfetchedDueDateDeltaAlerts");

  if (v5)
  {
    objc_msgSend(v3, "saveRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "remObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMReminderFetchOptions fetchOptionsIncludingDueDateDeltaAlerts](REMReminderFetchOptions, "fetchOptionsIncludingDueDateDeltaAlerts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "fetchReminderWithObjectID:fetchOptions:error:", v8, v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;

    if (v11)
    {
      +[REMLogStore write](REMLogStore, "write");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[REMReminderChangeItem _ensureDueDateDeltaAlertsAreFetchedIfNecessary:].cold.1();
    }
    else
    {
      objc_msgSend(v10, "storage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchedDueDateDeltaAlerts");
      v12 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v12, "count"))
      {
        objc_msgSend(v3, "storage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setFetchedDueDateDeltaAlerts:", v12);

      }
    }

  }
}

- (void)_copyAlarmsInto:(id)a3
{
  id v4;
  REMReminderChangeItem *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  REMAlarm *v17;
  id v18;
  REMAlarm *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  REMReminderChangeItem *v34;
  void *v35;
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

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  v35 = v4;
  objc_msgSend(v4, "removeAllAlarms");
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[REMReminderChangeItem alarms](v5, "alarms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[REMReminderChangeItem alarms](v5, "alarms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v34 = v5;
  -[REMReminderChangeItem alarms](v5, "alarms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
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
        v17 = [REMAlarm alloc];
        v18 = +[REMAlarm newObjectID](REMAlarm, "newObjectID");
        v19 = -[REMAlarm initWithAlarm:objectID:](v17, "initWithAlarm:objectID:", v16, v18);

        objc_msgSend(v10, "addObject:", v19);
        objc_msgSend(v16, "alarmUID");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          -[REMAlarm alarmUID](v19, "alarmUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[REMAlarm alarmUID](v19, "alarmUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "alarmUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v23, v24);

          }
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
  v25 = v10;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v30, "originalAlarmUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v30, "originalAlarmUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setOriginalAlarmUID:", v33);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v27);
  }

  objc_msgSend(v35, "setAlarms:", v25);
}

- (id)dedupedAndFilteredNonSnoozeAlarms:(id)a3
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
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v47 = (void *)objc_opt_new();
  v50 = (void *)objc_opt_new();
  v46 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  v51 = v4;
  if (!v6)
  {
    v48 = 0;
    goto LABEL_31;
  }
  v7 = v6;
  v48 = 0;
  v8 = *(_QWORD *)v53;
  v49 = v5;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v53 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      if ((objc_msgSend(v10, "isSnooze") & 1) == 0)
      {
        objc_msgSend(v10, "trigger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isTemporal");

        if (!v12)
        {
          objc_msgSend(v4, "addObject:", v10);
          continue;
        }
        v13 = objc_opt_class();
        objc_msgSend(v10, "trigger");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        REMDynamicCast(v13, (uint64_t)v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "timeInterval");
          if (v16 >= 3153600000.0)
          {
LABEL_26:

            continue;
          }
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "timeInterval");
          objc_msgSend(v17, "numberWithDouble:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v50, "containsObject:", v18);

          if ((v19 & 1) != 0)
          {
            v5 = v49;
            goto LABEL_26;
          }
          objc_msgSend(v4, "addObject:", v10);
          v34 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "timeInterval");
          objc_msgSend(v34, "numberWithDouble:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v23);
          v5 = v49;
LABEL_25:

          goto LABEL_26;
        }
        v20 = v5;
        v21 = objc_opt_class();
        objc_msgSend(v10, "trigger");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        REMDynamicCast(v21, (uint64_t)v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23
          || (objc_msgSend(v23, "dateComponents"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              v24,
              !v24))
        {
          v5 = v20;
          v4 = v51;
          goto LABEL_25;
        }
        objc_msgSend(v23, "dateComponents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "rem_stringRepresentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v47, "containsObject:", v26) & 1) == 0)
        {
          objc_msgSend(v46, "addObject:", v10);
          objc_msgSend(v47, "addObject:", v26);
          if (v48)
          {
            v44 = v26;
            v27 = objc_opt_class();
            objc_msgSend(v48, "trigger");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            REMDynamicCast(v27, (uint64_t)v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "dateComponents");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v29;
            objc_msgSend(v29, "dateComponents");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "rem_compare:", v31);

            if (v32 == -1)
            {
              v33 = v10;

              v48 = v33;
            }
            v5 = v20;

            v4 = v51;
            v26 = v44;
            goto LABEL_24;
          }
          v48 = v10;
        }
        v5 = v20;
        v4 = v51;
LABEL_24:

        goto LABEL_25;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  }
  while (v7);
LABEL_31:

  v35 = v50;
  if (objc_msgSend(v46, "count"))
  {
    -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "supportsMultipleDateAlarmsOnRecurrence");

    if (v37)
    {
      v4 = v51;
      objc_msgSend(v51, "addObjectsFromArray:", v46);
      v35 = v50;
    }
    else
    {
      v35 = v50;
      v4 = v51;
      if (v48)
      {
        objc_msgSend(v51, "addObject:", v48);
        +[REMLogStore write](REMLogStore, "write");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          -[REMReminderChangeItem objectID](self, "objectID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v46, "count");
          *(_DWORD *)buf = 138543618;
          v57 = v39;
          v58 = 2048;
          v59 = v40;
          _os_log_impl(&dword_1B4A39000, v38, OS_LOG_TYPE_INFO, "Only keeping earliest date alarm of reminder {reminderID: %{public}@, supportsMultipleDateAlarmsOnRecurrence: false, dateAlarms count:%lu}", buf, 0x16u);

          v35 = v50;
          v4 = v51;
        }

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (void)cleanupDuplicate:(id)a3 markAsCompleted:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  objc_msgSend(v12, "setCompleted:", v4);
  objc_msgSend(v12, "removeAllRecurrenceRules");
  objc_msgSend(v12, "alarms");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v12, "dedupedAndFilteredNonSnoozeAlarms:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlarms:", v9);

  -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "insertsCompletedRecurrentCloneAtTail");

  if ((_DWORD)v9)
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
  else
    -[REMReminderChangeItem creationDate](self, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCreationDate:", v11);

}

- (void)advanceForwardRecurrenceAfterNow
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v2, v3, "advanceForwardRecurrenceAfterNow: Unable to advance recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", v4);

  OUTLINED_FUNCTION_8();
}

- (void)advanceForwardToNextRecurrenceAfterDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  -[REMReminderChangeItem dueDateComponents](self, "dueDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem nextRecurrentAdvanceAmountForDateComponents:afterDate:](self, "nextRecurrentAdvanceAmountForDateComponents:afterDate:", v5, v4);
  v7 = v6;

  if (v7 <= 0.0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[REMReminderChangeItem advanceForwardToNextRecurrenceAfterDate:].cold.1(self);

  }
  else
  {
    -[REMReminderChangeItem dueDateComponents](self, "dueDateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[REMReminderChangeItem dueDateComponents](self, "dueDateComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rem_dateComponentsByAddingTimeInterval:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[REMReminderChangeItem setDueDateComponents:](self, "setDueDateComponents:", v10);
    }
    -[REMReminderChangeItem startDateComponents](self, "startDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[REMReminderChangeItem startDateComponents](self, "startDateComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rem_dateComponentsByAddingTimeInterval:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[REMReminderChangeItem setStartDateComponents:](self, "setStartDateComponents:", v13);
    }
    -[REMReminderChangeItem advanceForwardDateAlarmsAfterDate:](self, "advanceForwardDateAlarmsAfterDate:", v4);
    -[REMReminderChangeItem decrementRecurrenceRuleEndCount](self, "decrementRecurrenceRuleEndCount");
  }

}

- (void)advanceForwardDateAlarmsAfterDate:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  REMAlarm *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  REMAlarmDateTrigger *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  _BOOL4 v56;
  REMAlarmDateTrigger *v57;
  void *v58;
  void *v59;
  void *v60;
  REMAlarmDateTrigger *v61;
  REMAlarm *v62;
  NSObject *v63;
  REMAlarmDateTrigger *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  void *v70;
  void *v71;
  NSObject *v72;
  REMAlarmDateTrigger *v73;
  id v74;
  REMAlarm *v75;
  void *v76;
  void *v77;
  void *v78;
  char v79;
  REMAlarmDateTrigger *v80;
  REMReminderChangeItem *v81;
  id v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  REMAlarmDateTrigger *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  uint64_t v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  -[REMReminderChangeItem alarms](self, "alarms");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  -[REMReminderChangeItem dedupedAndFilteredNonSnoozeAlarms:](self, "dedupedAndFilteredNonSnoozeAlarms:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = (void *)objc_opt_new();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
  if (!v9)
  {

    v49 = 0;
    goto LABEL_48;
  }
  v11 = v9;
  v81 = self;
  v78 = 0;
  v79 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v85;
  v14 = 0x1E67F4000uLL;
  *(_QWORD *)&v10 = 138543618;
  v69 = v10;
  v82 = v8;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v85 != v13)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
      objc_msgSend(v16, "trigger", v69);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isTemporal");

      if (!v18)
      {
        objc_msgSend(v83, "addObject:", v16);
        continue;
      }
      v19 = objc_opt_class();
      objc_msgSend(v16, "trigger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      REMDynamicCast(v19, (uint64_t)v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_alloc(*(Class *)(v14 + 2936));
        objc_msgSend(v21, "timeInterval");
        v23 = (void *)objc_msgSend(v22, "initWithTimeInterval:");
        v24 = -[REMAlarm initWithTrigger:]([REMAlarm alloc], "initWithTrigger:", v23);
        objc_msgSend(v83, "addObject:", v24);
LABEL_27:

        v8 = v82;
        goto LABEL_28;
      }
      v25 = objc_opt_class();
      objc_msgSend(v16, "trigger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      REMDynamicCast(v25, (uint64_t)v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeZone");
        v24 = (REMAlarm *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v24 = v24;
          v28 = (void *)MEMORY[0x1E0C99D78];
          objc_msgSend(v23, "dateComponents");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "rem_dateWithDateComponents:timeZone:", v29, v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateComponentsWithDate:timeZone:isAllDay:", v30, v24, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderChangeItem nextRecurrentAdvanceAmountForDateComponents:afterDate:](v81, "nextRecurrentAdvanceAmountForDateComponents:afterDate:", v31, v74);
          if (v32 != 0.0)
          {
            v33 = v32;
            v76 = v31;
            v77 = v30;
            objc_msgSend(v23, "dateComponents");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "rem_dateComponentsByAddingTimeInterval:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v80 = -[REMAlarmDateTrigger initWithDateComponents:]([REMAlarmDateTrigger alloc], "initWithDateComponents:", v35);
            v75 = -[REMAlarm initWithTrigger:]([REMAlarm alloc], "initWithTrigger:", v80);
            objc_msgSend(v83, "addObject:");
            +[REMLogStore write](REMLogStore, "write");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              -[REMReminderChangeItem objectID](v81, "objectID");
              v71 = v35;
              v73 = (REMAlarmDateTrigger *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "dateComponents");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[REMAlarmDateTrigger dateComponents](v80, "dateComponents");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
              v72 = v36;
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
              v40 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v89 = v73;
              v90 = 2114;
              v91 = v37;
              v92 = 2114;
              v93 = v38;
              v94 = 2114;
              v95 = v70;
              v96 = 2114;
              v97 = v39;
              v98 = 2114;
              v99 = v40;
              v41 = (void *)v40;
              _os_log_impl(&dword_1B4A39000, v72, OS_LOG_TYPE_DEFAULT, "AdvanceRecurrence: Advancing forward alarm of reminder with new date trigger {reminderID: %{public}@, oldDateTrigger: %{public}@, newDateTrigger: %{public}@, defaultTimeZone: %{public}@}, systemTimeZone: %{public}@, localTimeZone: %{public}@};",
                buf,
                0x3Eu);

              v35 = v71;
              v36 = v72;
            }

            v42 = v78;
            if (!v78 || objc_msgSend(v35, "rem_compare:", v78) == -1)
            {
              v43 = v35;

              v42 = v43;
            }
            v31 = v76;
            v78 = v42;

            v79 = 1;
            v30 = v77;
          }

        }
        else
        {
          +[REMLogStore write](REMLogStore, "write");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            -[REMReminderChangeItem objectID](v81, "objectID");
            v45 = (REMAlarmDateTrigger *)objc_claimAutoreleasedReturnValue();
            -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v69;
            v89 = v45;
            v90 = 2114;
            v91 = v46;
            _os_log_fault_impl(&dword_1B4A39000, v44, OS_LOG_TYPE_FAULT, "AdvanceRecurrence: Unable to advance forward date alarm for reminder with dueDate missing timezone {reminderID: %{public}@, dueDate: %{public}@}", buf, 0x16u);

          }
        }
        v12 = 1;
        goto LABEL_27;
      }
LABEL_28:

      v14 = 0x1E67F4000;
    }
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
  }
  while (v11);

  if ((v12 & 1) == 0)
  {
LABEL_46:
    self = v81;
LABEL_47:
    v49 = v78;
    goto LABEL_48;
  }
  if ((v79 & 1) == 0)
  {
    -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
    v55 = objc_claimAutoreleasedReturnValue();
    v61 = -[REMAlarmDateTrigger initWithDateComponents:]([REMAlarmDateTrigger alloc], "initWithDateComponents:", v55);
    v62 = -[REMAlarm initWithTrigger:]([REMAlarm alloc], "initWithTrigger:", v61);
    objc_msgSend(v83, "addObject:", v62);
    +[REMLogStore write](REMLogStore, "write");
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      -[REMReminderChangeItem objectID](v81, "objectID");
      v64 = (REMAlarmDateTrigger *)objc_claimAutoreleasedReturnValue();
      -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v69;
      v89 = v64;
      v90 = 2114;
      v91 = v65;
      _os_log_impl(&dword_1B4A39000, v63, OS_LOG_TYPE_INFO, "AdvanceRecurrence: Adding new date alarm of reminder with dueDate {reminderID: %{public}@, dueDate: %{public}@};"
        " failed to advance forward any previous date alarms",
        buf,
        0x16u);

    }
    goto LABEL_44;
  }
  self = v81;
  -[REMReminderChangeItem accountCapabilities](v81, "accountCapabilities");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v47, "supportsMultipleDateAlarmsOnRecurrence") & 1) != 0 || !v78)
  {

    goto LABEL_47;
  }
  -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v78;
  v50 = objc_msgSend(v48, "isEqual:", v78);

  if ((v50 & 1) != 0)
    goto LABEL_48;
  -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "timeZone");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "timeZone");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v52, "isEqual:", v53);

  +[REMLogStore write](REMLogStore, "write");
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
  if (!v54)
  {
    if (!v56)
      goto LABEL_45;
    -[REMReminderChangeItem objectID](v81, "objectID");
    v61 = (REMAlarmDateTrigger *)objc_claimAutoreleasedReturnValue();
    -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "rem_stringRepresentation");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "rem_stringRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v89 = v61;
    v90 = 2114;
    v91 = v67;
    v92 = 2114;
    v93 = v68;
    _os_log_impl(&dword_1B4A39000, v55, OS_LOG_TYPE_DEFAULT, "AdvanceRecurrence: Skipped fixing dueDate drift to match displayDate since timezone does not match {reminderID: %{public}@, dueDate: %{public}@, displayDate: %{public}@};",
      buf,
      0x20u);

LABEL_44:
LABEL_45:

    goto LABEL_46;
  }
  if (v56)
  {
    -[REMReminderChangeItem objectID](v81, "objectID");
    v57 = (REMAlarmDateTrigger *)objc_claimAutoreleasedReturnValue();
    -[REMReminderChangeItem dueDateComponents](v81, "dueDateComponents");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "rem_stringRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "rem_stringRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v89 = v57;
    v90 = 2114;
    v91 = v59;
    v92 = 2114;
    v93 = v60;
    _os_log_impl(&dword_1B4A39000, v55, OS_LOG_TYPE_DEFAULT, "AdvanceRecurrence: Fixing dueDate drift to match displayDate {reminderID: %{public}@, dueDate: %{public}@, displayDate: %{public}@};",
      buf,
      0x20u);

  }
  self = v81;
  v49 = v78;
  -[REMReminderChangeItem setDueDateComponents:](v81, "setDueDateComponents:", v78);
LABEL_48:
  -[REMReminderChangeItem setAlarms:](self, "setAlarms:", v83);

}

- (void)decrementRecurrenceRuleEndCount
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  REMRecurrenceRule *v15;
  id v16;
  REMRecurrenceRule *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[REMReminderChangeItem recurrenceRules](self, "recurrenceRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem removeAllRecurrenceRules](self, "removeAllRecurrenceRules");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v28;
    v8 = 0x1E67F4000uLL;
    *(_QWORD *)&v5 = 138543874;
    v25 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "recurrenceEnd", v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "occurrenceCount");

        if (v12 < 2)
        {
          -[REMReminderChangeItem addRecurrenceRule:](self, "addRecurrenceRule:", v10);
          objc_msgSend(*(id *)(v8 + 3888), "write");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            -[REMReminderChangeItem objectID](self, "objectID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "iCalendarDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v32 = v22;
            v33 = 2114;
            v34 = v23;
            v35 = 2114;
            v36 = v24;
            _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_INFO, "AdvanceRecurrence: Keep old recurrence rule of reminder {reminderID: %{public}@, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@};",
              buf,
              0x20u);

            v8 = 0x1E67F4000;
          }
        }
        else
        {
          objc_msgSend(v10, "recurrenceEnd");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[REMRecurrenceEnd recurrenceEndWithOccurrenceCount:](REMRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", objc_msgSend(v13, "occurrenceCount") - 1);
          v14 = objc_claimAutoreleasedReturnValue();

          v15 = [REMRecurrenceRule alloc];
          v16 = +[REMRecurrenceRule newObjectID](REMRecurrenceRule, "newObjectID");
          v17 = -[REMRecurrenceRule initWithRecurrenceRule:objectID:end:](v15, "initWithRecurrenceRule:objectID:end:", v10, v16, v14);

          -[REMReminderChangeItem addRecurrenceRule:](self, "addRecurrenceRule:", v17);
          objc_msgSend(*(id *)(v8 + 3888), "write");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            -[REMReminderChangeItem objectID](self, "objectID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMRecurrenceRule objectID](v17, "objectID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[REMRecurrenceRule iCalendarDescription](v17, "iCalendarDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v32 = v19;
            v33 = 2114;
            v34 = v20;
            v35 = 2114;
            v36 = v21;
            _os_log_impl(&dword_1B4A39000, v18, OS_LOG_TYPE_INFO, "AdvanceRecurrence: New recurrence rules of reminder {reminderID: %{public}@, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@};",
              buf,
              0x20u);

            v8 = 0x1E67F4000;
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v6);
  }

}

- (BOOL)canSetAlternativeDisplayDateDateForCalendar
{
  void *v3;
  int v4;

  -[REMReminderChangeItem displayDate](self, "displayDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((-[REMReminderChangeItem isCompleted](self, "isCompleted") & 1) != 0)
      LOBYTE(v4) = 1;
    else
      v4 = -[REMReminderChangeItem isRecurrent](self, "isRecurrent") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)clearAlternativeDisplayDateDateForCalendarIfInvalid
{
  uint64_t v3;
  void *v4;
  BOOL v5;

  -[REMReminderChangeItem alternativeDisplayDateDate_forCalendar](self, "alternativeDisplayDateDate_forCalendar");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[REMReminderChangeItem canSetAlternativeDisplayDateDateForCalendar](self, "canSetAlternativeDisplayDateDateForCalendar");

    if (!v5)
      -[REMReminderChangeItem clearAlternativeDisplayDateDateForCalendarWithReason:](self, "clearAlternativeDisplayDateDateForCalendarWithReason:", CFSTR("incomplete & recurrent"));
  }
}

- (void)clearAlternativeDisplayDateDateForCalendarWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[REMReminderChangeItem objectID](self, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "setCompleted: clear alternativeDisplayDateDate_forCalendar {reason: \"%{public}@\", reminderID: %{public}@}", (uint8_t *)&v7, 0x16u);

  }
  -[REMReminderChangeItem setAlternativeDisplayDateDate_forCalendar:](self, "setAlternativeDisplayDateDate_forCalendar:", 0);

}

- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (v4
    && !-[REMReminderChangeItem canSetAlternativeDisplayDateDateForCalendar](self, "canSetAlternativeDisplayDateDateForCalendar"))
  {
    +[REMLogStore write](REMLogStore, "write");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REMReminderChangeItem setAlternativeDisplayDateDateForCalendarWithDateComponents:].cold.1(self);

  }
  else
  {
    -[REMReminderChangeItem storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlternativeDisplayDateDateForCalendarWithDateComponents:", v4);

  }
}

- (void)setAlternativeDisplayDateDateForCalendarWithNormalizedDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (v4
    && !-[REMReminderChangeItem canSetAlternativeDisplayDateDateForCalendar](self, "canSetAlternativeDisplayDateDateForCalendar"))
  {
    +[REMLogStore write](REMLogStore, "write");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REMReminderChangeItem setAlternativeDisplayDateDateForCalendarWithDateComponents:].cold.1(self);

  }
  else
  {
    -[REMReminderChangeItem storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlternativeDisplayDateDate_forCalendar:", v4);

  }
}

- (void)setAlternativeDisplayDateDateForCalendarToPreviousRecurrentDateBefore:(id)a3 recurrenceRules:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  REMDisplayDate *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[REMReminderChangeItem canSetAlternativeDisplayDateDateForCalendar](self, "canSetAlternativeDisplayDateDateForCalendar"))
  {
    -[REMReminderChangeItem displayDate](self, "displayDate");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      -[NSObject timeZone](v8, "timeZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;

      -[NSObject date](v9, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[REMRecurrenceRule previousRecurrentDueDateBefore:dueDate:timeZone:allDay:recurrenceRules:](REMRecurrenceRule, "previousRecurrentDueDateBefore:dueDate:timeZone:allDay:recurrenceRules:", v6, v14, v13, -[NSObject isAllDay](v9, "isAllDay"), v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = [REMDisplayDate alloc];
        v17 = -[NSObject isAllDay](v9, "isAllDay");
        -[NSObject timeZone](v9, "timeZone");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[REMDisplayDate initWithDate:allDay:timeZone:](v16, "initWithDate:allDay:timeZone:", v15, v17, v18);

        +[REMLogStore write](REMLogStore, "write");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[REMReminderChangeItem objectID](self, "objectID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v19;
          v27 = 2114;
          v28 = v21;
          _os_log_impl(&dword_1B4A39000, v20, OS_LOG_TYPE_DEFAULT, "setAlternativeDisplayDate: set previousRecurrentDueDate {displayDate: %{public}@, reminderID: %{public}@}", (uint8_t *)&v25, 0x16u);

        }
        -[NSObject dateComponentsRepresentation](v19, "dateComponentsRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderChangeItem storage](self, "storage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAlternativeDisplayDateDateForCalendarWithDateComponents:", v22);

      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          -[REMReminderChangeItem objectID](self, "objectID");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v24;
          _os_log_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_INFO, "setAlternativeDisplayDate: previousRecurrentDueDateBefore is nil {reminderID: %{public}@}", (uint8_t *)&v25, 0xCu);

        }
      }

    }
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[REMReminderChangeItem setAlternativeDisplayDateDateForCalendarWithDateComponents:].cold.1(self);
  }

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
  REMReminderChangeItem *v12;
  REMReminderChangeItem *v13;
  void *v14;
  void *v15;

  v5 = a3;
  -[REMReminderChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[REMReminderChangeItem objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_trackedAccountCapabilitiesForObjectID:", v7);
    v8 = (REMAccountCapabilities *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_16:
      v13 = [REMReminderChangeItem alloc];
      -[REMReminderChangeItem storage](self, "storage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:](v13, "initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:", v5, v14, v8, v15);

      goto LABEL_17;
    }
    -[REMReminderChangeItem objectID](self, "objectID");
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
        -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.3(self, a2, v10);
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.2();
    }

    goto LABEL_15;
  }
  +[REMLogStore write](REMLogStore, "write");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[REMReminderChangeItem shallowCopyWithSaveRequest:].cold.1();

  -[REMReminderChangeItem storage](self, "storage");
  v12 = (REMReminderChangeItem *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12 = 0;
  else
    NSLog(CFSTR("'%s' is unexpectedly nil"), "self.storage");
LABEL_17:

  return v12;
}

- (REMListChangeItem)listChangeItem
{
  void *v3;
  void *v4;
  void *v5;

  -[REMReminderChangeItem listID](self, "listID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[REMReminderChangeItem saveRequest](self, "saveRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_trackedListChangeItemForObjectID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (REMListChangeItem *)v5;
}

- (NSAttributedString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (NSString)titleAsString
{
  void *v2;
  void *v3;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_editDocument:(id)a3 replicaIDSource:(id)a4 newString:(id)a5
{
  unint64_t v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  REMMutableCRMergeableStringDocument *v15;
  REMMutableCRMergeableStringDocument *v16;
  void *v17;
  void *v18;

  v8 = (unint64_t)a3;
  v9 = a4;
  v10 = (unint64_t)a5;
  if (v8 | v10)
  {
    v11 = (id)v10;
    if (v10)
    {
      if (v8)
      {
LABEL_4:
        objc_msgSend((id)v8, "attributedString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToAttributedString:", v12);

        if (v13)
        {
          v14 = (id)v8;
LABEL_11:

          goto LABEL_12;
        }
        objc_msgSend((id)v8, "mutableDocument");
        v15 = (REMMutableCRMergeableStringDocument *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v16 = v15;
        -[REMReminderChangeItem saveRequest](self, "saveRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "replicaManagerProvider");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMMutableCRMergeableStringDocument setReplicaManagerProvider:](v16, "setReplicaManagerProvider:", v18);

        -[REMMutableCRMergeableStringDocument wipeAndReplaceWithString:](v16, "wipeAndReplaceWithString:", v11);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB3498]);
      if (v8)
        goto LABEL_4;
    }
    v15 = -[REMMutableCRMergeableStringDocument initWithReplicaIDSource:]([REMMutableCRMergeableStringDocument alloc], "initWithReplicaIDSource:", v9);
    goto LABEL_10;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)setPrimaryLocaleInferredFromLastUsedKeyboard:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryLocaleInferredFromLastUsedKeyboard:", v4);

}

- (NSString)primaryLocaleInferredFromLastUsedKeyboard
{
  void *v2;
  void *v3;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryLocaleInferredFromLastUsedKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleReplicaIDSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem _editDocument:replicaIDSource:newString:](self, "_editDocument:replicaIDSource:newString:", v7, v12, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleDocument:", v8);

  -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyDidChange:", CFSTR("titleDocument"));

  -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyDidChange:", CFSTR("titleDocumentData"));

}

- (void)setTitleAsString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3498];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[REMReminderChangeItem setTitle:](self, "setTitle:", v6);

}

- (void)setCompleted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompleted:", v3);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderChangeItem setCompletionDate:](self, "setCompletionDate:", v6);

  }
  else
  {
    -[REMReminderChangeItem setCompletionDate:](self, "setCompletionDate:", 0);
  }
  -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyDidChange:", CFSTR("completed"));

  -[REMReminderChangeItem clearAlternativeDisplayDateDateForCalendarIfInvalid](self, "clearAlternativeDisplayDateDateForCalendarIfInvalid");
}

- (NSAttributedString)notes
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notesDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (NSString)notesAsString
{
  void *v2;
  void *v3;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notesAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setNotes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notesReplicaIDSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notesDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem _editDocument:replicaIDSource:newString:](self, "_editDocument:replicaIDSource:newString:", v7, v12, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNotesDocument:", v8);

  -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyDidChange:", CFSTR("notesDocument"));

  -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyDidChange:", CFSTR("notesDocumentData"));

}

- (void)setNotesAsString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3498];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[REMReminderChangeItem setNotes:](self, "setNotes:", v6);

}

- (void)setDueDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[REMReminderChangeItem dueDateComponents](self, "dueDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rem_gregorianEquivalent");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDueDateComponents:", v12);

  -[REMReminderChangeItem storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateDisplayDate");

  if (!v12)
  {
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v8 = objc_msgSend(v12, "rem_isAllDayDateComponents");
  -[REMReminderChangeItem storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllDay:", v8);

  if ((v8 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v12, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[REMReminderChangeItem storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v10);

  if ((v8 & 1) == 0)
  {

  }
  if (!v5 || (objc_msgSend(v5, "isEqual:", v12) & 1) == 0)
LABEL_11:
    -[REMReminderChangeItem clearAlternativeDisplayDateDateForCalendarWithReason:](self, "clearAlternativeDisplayDateDateForCalendarWithReason:", CFSTR("Due date changed"));
LABEL_12:

}

- (void)setDueDateComponentsWithAlarmsIfNeeded:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  REMAlarmDateTrigger *v17;
  id v18;
  void *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "rem_gregorianEquivalent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rem_isAllDayDateComponents");
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "setTimeZone:", 0);
    }
    else
    {
      objc_msgSend(v4, "timeZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setTimeZone:", v7);

      }
    }
  }
  -[REMReminderChangeItem setDueDateComponents:](self, "setDueDateComponents:", v4);
  -[REMReminderChangeItem removeAllSnoozeAlarms](self, "removeAllSnoozeAlarms");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[REMReminderChangeItem alarms](self, "alarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v20 = v5;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "trigger");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isTemporal");

        if (v16)
        {
          -[REMReminderChangeItem removeAlarm:updateDisplayDate:](self, "removeAlarm:updateDisplayDate:", v14, 0);
          v11 = 1;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);

    LOBYTE(v5) = v20;
    if ((v11 & 1) != 0)
      -[REMReminderChangeItem updateDisplayDate](self, "updateDisplayDate");
    if (v4)
    {
LABEL_18:
      if ((v5 & 1) == 0)
      {
        v17 = -[REMAlarmDateTrigger initWithDateComponents:]([REMAlarmDateTrigger alloc], "initWithDateComponents:", v4);
        v18 = -[REMReminderChangeItem addAlarmWithTrigger:](self, "addAlarmWithTrigger:", v17);
LABEL_23:

        goto LABEL_24;
      }
      goto LABEL_24;
    }
  }
  else
  {

    if (v4)
      goto LABEL_18;
  }
  -[REMReminderChangeItem removeAllRecurrenceRules](self, "removeAllRecurrenceRules");
  -[REMReminderChangeItem dueDateDeltaAlertContext](self, "dueDateDeltaAlertContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend((id)objc_opt_class(), "_ensureDueDateDeltaAlertsAreFetchedIfNecessary:", self);
    -[REMReminderChangeItem dueDateDeltaAlertContext](self, "dueDateDeltaAlertContext");
    v17 = (REMAlarmDateTrigger *)objc_claimAutoreleasedReturnValue();
    -[REMAlarmDateTrigger removeAllFetchedDueDateDeltaAlerts](v17, "removeAllFetchedDueDateDeltaAlerts");
    goto LABEL_23;
  }
LABEL_24:

}

- (void)setIcsDisplayOrder:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "icsDisplayOrder");

  if (v6 != a3)
  {
    -[REMReminderChangeItem saveRequest](self, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateListWithReminderChangeItem:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "setRemindersICSDisplayOrderChanged:", 1);
      -[REMReminderChangeItem storage](self, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIcsDisplayOrder:", a3);

      -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject keyDidChange:](v10, "keyDidChange:", CFSTR("icsDisplayOrder"));
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem setIcsDisplayOrder:].cold.1();
    }

  }
}

- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 end:(id)a5
{
  id v8;
  id v9;
  REMRecurrenceRule *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = +[REMRecurrenceRule newObjectID](REMRecurrenceRule, "newObjectID");
  v10 = [REMRecurrenceRule alloc];
  -[REMReminderChangeItem accountID](self, "accountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem objectID](self, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[REMRecurrenceRule initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:end:](v10, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:end:", v9, v11, v12, a3, a4, v8);

  -[REMReminderChangeItem addRecurrenceRule:](self, "addRecurrenceRule:", v13);
  return v13;
}

- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11
{
  return -[REMReminderChangeItem addRecurrenceRuleWithFrequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](self, "addRecurrenceRuleWithFrequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", a3, a4, 0, a5, a6, a7, a8, a9, a10, a11);
}

- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 firstDayOfTheWeek:(int64_t)a5 daysOfTheWeek:(id)a6 daysOfTheMonth:(id)a7 monthsOfTheYear:(id)a8 weeksOfTheYear:(id)a9 daysOfTheYear:(id)a10 setPositions:(id)a11 end:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  REMRecurrenceRule *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v16 = a12;
  v28 = a11;
  v27 = a10;
  v26 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v29 = +[REMRecurrenceRule newObjectID](REMRecurrenceRule, "newObjectID");
  v25 = [REMRecurrenceRule alloc];
  -[REMReminderChangeItem accountID](self, "accountID");
  v20 = objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem objectID](self, "objectID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v20;
  v23 = -[REMRecurrenceRule initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v25, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v29, v20, v21, a3, a4, a5, v19, v18, v17, v26, v27, v28, v16);

  -[REMReminderChangeItem addRecurrenceRule:](self, "addRecurrenceRule:", v23);
  return v23;
}

- (void)addRecurrenceRule:(id)a3
{
  -[REMReminderChangeItem insertRecurrenceRule:afterRecurrenceRule:](self, "insertRecurrenceRule:afterRecurrenceRule:", a3, 0);
}

- (void)insertRecurrenceRule:(id)a3 beforeRecurrenceRule:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  REMReminderChangeItem *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Adding recurrenceRule before recurrenceRule {reminderChangeItem: %@, recurrenceRule: %@, siblisngRecurrenceRule: %@}", (uint8_t *)&v12, 0x20u);
  }

  -[REMReminderChangeItem recurrenceRules](self, "recurrenceRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v7)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
  }
  v11 = objc_msgSend(v10, "indexOfObject:", v7);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
LABEL_9:
  objc_msgSend(v10, "insertObject:atIndex:", v6, v11);
  -[REMReminderChangeItem setRecurrenceRules:](self, "setRecurrenceRules:", v10);

}

- (void)insertRecurrenceRule:(id)a3 afterRecurrenceRule:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  REMReminderChangeItem *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Adding recurrenceRule after recurrenceRule {reminderChangeItem: %@, recurrenceRule: %@, siblisngRecurrenceRule: %@}", (uint8_t *)&v12, 0x20u);
  }

  -[REMReminderChangeItem recurrenceRules](self, "recurrenceRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v7)
      goto LABEL_8;
  }
  v11 = objc_msgSend(v10, "indexOfObject:", v7);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "insertObject:atIndex:", v6, v11 + 1);
    goto LABEL_10;
  }
LABEL_8:
  objc_msgSend(v10, "addObject:", v6);
LABEL_10:
  -[REMReminderChangeItem setRecurrenceRules:](self, "setRecurrenceRules:", v10);

}

- (void)removeRecurrenceRule:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  REMReminderChangeItem *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Removing recurrenceRule {reminderChangeItem: %@, recurrenceRule: %@}", (uint8_t *)&v8, 0x16u);
  }

  -[REMReminderChangeItem recurrenceRules](self, "recurrenceRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  -[REMReminderChangeItem setRecurrenceRules:](self, "setRecurrenceRules:", v7);

}

- (void)removeAllRecurrenceRules
{
  NSObject *v3;
  int v4;
  REMReminderChangeItem *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[REMLogStore write](REMLogStore, "write");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_INFO, "Removing all recurrenceRules {reminderChangeItem: %@}", (uint8_t *)&v4, 0xCu);
  }

  -[REMReminderChangeItem setRecurrenceRules:](self, "setRecurrenceRules:", MEMORY[0x1E0C9AA60]);
}

- (void)setRecurrenceRules:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecurrenceRules:", v4);

  -[REMReminderChangeItem clearAlternativeDisplayDateDateForCalendarIfInvalid](self, "clearAlternativeDisplayDateDateForCalendarIfInvalid");
}

- (double)nextRecurrentAdvanceAmountForDateComponents:(id)a3 afterDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;

  v6 = a3;
  if (v6)
  {
    v7 = a4;
    objc_msgSend(v6, "timeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateWithDateComponents:timeZone:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "rem_isAllDayDateComponents");
    objc_msgSend(v7, "laterDate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMReminderChangeItem recurrenceRules](self, "recurrenceRules");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = v16;
    else
      v18 = MEMORY[0x1E0C9AA60];
    +[REMRecurrenceRule nextRecurrentDueDateAfter:dueDate:timeZone:allDay:recurrenceRules:](REMRecurrenceRule, "nextRecurrentDueDateAfter:dueDate:timeZone:allDay:recurrenceRules:", v15, v13, v12, v14, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "timeIntervalSinceDate:", v13);
      v11 = v20;
    }
    else
    {
      v11 = 0.0;
    }

  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (id)nextRecurrentDueDateComponentsAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  -[REMReminderChangeItem dueDateComponents](self, "dueDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateWithDateComponents:timeZone:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "rem_isAllDayDateComponents");
  objc_msgSend(v4, "laterDate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem recurrenceRules](self, "recurrenceRules");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = MEMORY[0x1E0C9AA60];
  +[REMRecurrenceRule nextRecurrentDueDateAfter:dueDate:timeZone:allDay:recurrenceRules:](REMRecurrenceRule, "nextRecurrentDueDateAfter:dueDate:timeZone:allDay:recurrenceRules:", v12, v10, v9, v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateComponentsWithDate:timeZone:isAllDay:", v16, v9, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(v17, "rem_strippingTimeZone");
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v19;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)addAlarmWithTrigger:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  REMAlarm *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMReminderChangeItem dueDateComponents](self, "dueDateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      +[REMLogStore write](REMLogStore, "write");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[REMReminderChangeItem addAlarmWithTrigger:].cold.1();

    }
  }
  v7 = -[REMAlarm initWithTrigger:]([REMAlarm alloc], "initWithTrigger:", v4);
  -[REMReminderChangeItem addAlarm:](self, "addAlarm:", v7);

  return v7;
}

- (void)addAlarm:(id)a3
{
  -[REMReminderChangeItem addAlarm:updateDisplayDate:](self, "addAlarm:updateDisplayDate:", a3, 1);
}

- (void)addAlarm:(id)a3 updateDisplayDate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  REMReminderChangeItem *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_INFO, "Adding alarm  {reminderChangeItem: %@, alarm: %@}", (uint8_t *)&v12, 0x16u);
  }

  -[REMReminderChangeItem alarms](self, "alarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "addObject:", v6);
  -[REMReminderChangeItem storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlarms:", v9);

  if (v4)
  {
    -[REMReminderChangeItem storage](self, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateDisplayDate");

  }
}

- (void)setAlarms:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[REMReminderChangeItem storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlarms:", v4);

  -[REMReminderChangeItem storage](self, "storage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateDisplayDate");

}

- (void)setAlarms:(id)a3 updateDisplayDate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  -[REMReminderChangeItem storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlarms:", v6);

  if (v4)
  {
    -[REMReminderChangeItem storage](self, "storage");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateDisplayDate");

  }
}

- (void)removeAlarm:(id)a3
{
  -[REMReminderChangeItem removeAlarm:updateDisplayDate:](self, "removeAlarm:updateDisplayDate:", a3, 1);
}

- (void)removeAlarm:(id)a3 updateDisplayDate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  -[REMReminderChangeItem alarms](self, "alarms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v6);
  -[REMReminderChangeItem storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlarms:", v10);

  if (v4)
  {
    -[REMReminderChangeItem storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateDisplayDate");

  }
}

- (void)removeAllAlarms
{
  void *v3;
  id v4;

  -[REMReminderChangeItem storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlarms:", MEMORY[0x1E0C9AA60]);

  -[REMReminderChangeItem storage](self, "storage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDisplayDate");

}

- (void)updateDisplayDate
{
  id v2;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDisplayDate");

}

- (BOOL)isSubtask
{
  void *v2;
  BOOL v3;

  -[REMReminderChangeItem parentReminderID](self, "parentReminderID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (REMReminderSubtaskContextChangeItem)subtaskContext
{
  void *v3;
  BOOL v4;
  REMReminderSubtaskContextChangeItem *v5;

  -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "supportsSubtasks"))
  {

    goto LABEL_5;
  }
  v4 = -[REMReminderChangeItem isSubtask](self, "isSubtask");

  if (v4)
  {
LABEL_5:
    v5 = 0;
    return v5;
  }
  v5 = -[REMReminderSubtaskContextChangeItem initWithReminderChangeItem:]([REMReminderSubtaskContextChangeItem alloc], "initWithReminderChangeItem:", self);
  return v5;
}

- (REMReminderAttachmentContextChangeItem)attachmentContext
{
  void *v3;
  int v4;
  REMReminderAttachmentContextChangeItem *v5;

  -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAttachments");

  if (v4)
    v5 = -[REMReminderAttachmentContextChangeItem initWithReminderChangeItem:]([REMReminderAttachmentContextChangeItem alloc], "initWithReminderChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMReminderFlaggedContextChangeItem)flaggedContext
{
  void *v3;
  int v4;
  REMReminderFlaggedContextChangeItem *v5;

  -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsFlagged");

  if (v4)
    v5 = -[REMReminderFlaggedContextChangeItem initWithReminderChangeItem:]([REMReminderFlaggedContextChangeItem alloc], "initWithReminderChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMReminderAssignmentContextChangeItem)assignmentContext
{
  void *v3;
  int v4;
  REMReminderAssignmentContextChangeItem *v5;

  -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAssignments");

  if (v4)
    v5 = -[REMReminderAssignmentContextChangeItem initWithReminderChangeItem:]([REMReminderAssignmentContextChangeItem alloc], "initWithReminderChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMReminderHashtagContextChangeItem)hashtagContext
{
  void *v3;
  int v4;
  REMReminderHashtagContextChangeItem *v5;

  -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsHashtags");

  if (v4)
    v5 = -[REMReminderHashtagContextChangeItem initWithReminderChangeItem:]([REMReminderHashtagContextChangeItem alloc], "initWithReminderChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMReminderDueDateDeltaAlertContextChangeItem)dueDateDeltaAlertContext
{
  void *v3;
  int v4;
  REMReminderDueDateDeltaAlertContextChangeItem *v5;

  -[REMReminderChangeItem accountCapabilities](self, "accountCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsDueDateDeltaAlerts");

  if (v4)
    v5 = -[REMReminderDueDateDeltaAlertContextChangeItem initWithReminderChangeItem:]([REMReminderDueDateDeltaAlertContextChangeItem alloc], "initWithReminderChangeItem:", self);
  else
    v5 = 0;
  return v5;
}

- (REMDueDateDeltaAlert)fetchedCurrentDueDateDeltaAlert
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedDueDateDeltaAlerts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMDueDateDeltaAlert *)v4;
}

- (id)removeFromListAllowingUndo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMReminderChangeItem listID](self, "listID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[REMReminderChangeItem saveRequest](self, "saveRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateListWithReminderChangeItem:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMReminderChangeItem objectID](self, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowLevelRemoveReminderIDFromOrdering:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[REMReminderChangeItem setListID:](self, "setListID:", 0);
  -[REMReminderChangeItem setParentReminderID:](self, "setParentReminderID:", 0);
  return v3;
}

- (void)removeFromList
{
  id v2;

  v2 = -[REMReminderChangeItem removeFromListAllowingUndo](self, "removeFromListAllowingUndo");
}

- (void)updateAccountCapabilities:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMReminderChangeItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("accountCapabilities"));
  -[REMReminderChangeItem saveRequest](self, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_trackAccountCapabilities:forObjectID:", v4, v6);

  -[REMReminderChangeItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("accountCapabilities"));
}

- (void)removeFromParentReminder
{
  id v2;

  v2 = -[REMReminderChangeItem removeFromParentReminderAllowingUndo](self, "removeFromParentReminderAllowingUndo");
}

- (id)changedKeys
{
  void *v2;
  void *v3;

  -[REMReminderChangeItem changedKeysObserver](self, "changedKeysObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMReminderChangeItem storage](self, "storage");
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
  v7.super_class = (Class)REMReminderChangeItem;
  if (-[REMReminderChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[REMReminderChangeItem storage](self, "storage");
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
  -[REMReminderChangeItem saveRequest](self, "saveRequest");
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
  -[REMReminderChangeItem storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v7, v6);

}

+ (id)resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDReminder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)__resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDReminder;
  v4 = a3;
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

+ (id)resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDSavedReminder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)__resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDSavedReminder;
  v4 = a3;
  if (objc_msgSend(v3, "containsObject:", v4))
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  -[REMReminderChangeItem objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    +[REMReminderChangeItem resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDSavedReminder:](REMReminderChangeItem, "resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDSavedReminder:", v4);
  else
    +[REMReminderChangeItem resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDReminder:](REMReminderChangeItem, "resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDReminder:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isUnsupported
{
  void *v2;
  char v3;

  -[REMReminderChangeItem storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnsupported");

  return v3;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMReminderStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
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

- (id)confirmForSiriFoundInAppsAppendingToList:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMReminderChangeItem saveRequest](self, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addReminderWithTitle:toListChangeItem:", &stru_1E67FB1F0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem copyInto:](self, "copyInto:", v6);
  -[REMReminderChangeItem setCompleted:](self, "setCompleted:", 1);
  -[REMReminderChangeItem setSiriFoundInAppsUserConfirmation:](self, "setSiriFoundInAppsUserConfirmation:", 1);

  return v6;
}

- (void)rejectForSiriFoundInApps
{
  -[REMReminderChangeItem setCompleted:](self, "setCompleted:", 1);
  -[REMReminderChangeItem setSiriFoundInAppsUserConfirmation:](self, "setSiriFoundInAppsUserConfirmation:", 2);
}

- (void)removeAllSnoozeAlarms
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[REMReminderChangeItem alarms](self, "alarms");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSnooze", (_QWORD)v14))
        {
          -[REMReminderChangeItem removeAlarm:updateDisplayDate:](self, "removeAlarm:updateDisplayDate:", v13, 0);
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[REMReminderChangeItem updateDisplayDate](self, "updateDisplayDate");
  }
  else
  {

  }
}

- (void)snoozeFromNowForTimeInterval:(double)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem snoozeToDate:](self, "snoozeToDate:", v6);
}

- (void)snoozeToDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99D78];
  v5 = (void *)MEMORY[0x1E0C99E80];
  v6 = a3;
  objc_msgSend(v5, "defaultTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rem_dateComponentsWithDate:timeZone:isAllDay:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[REMReminderChangeItem _createSnoozeAlarmWithDateComponents:](self, "_createSnoozeAlarmWithDateComponents:", v8);
}

- (void)snoozeToNextThirds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rem_dateComponentsWithDate:timeZone:isAllDay:", v4, v5, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_class();
  objc_msgSend(v7, "setHour:", objc_msgSend(v6, "nextThirdsHour:", objc_msgSend((id)objc_opt_class(), "nextThirdsHourFromHour:", objc_msgSend(v7, "hour"))));
  objc_msgSend(v7, "setMinute:", 0);
  objc_msgSend(v7, "setSecond:", 0);
  -[REMReminderChangeItem _createSnoozeAlarmWithDateComponents:](self, "_createSnoozeAlarmWithDateComponents:", v7);

}

- (void)snoozeForever
{
  id v2;

  v2 = -[REMReminderChangeItem _cleanupOriginalAlarmsForSnoozing](self, "_cleanupOriginalAlarmsForSnoozing");
}

- (void)snoozeFromDueDateForFutureIntegralMultipleOfTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  -[REMReminderChangeItem dueDateComponents](self, "dueDateComponents");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D78], "rem_dateWithDateComponents:timeZone:", v15, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderChangeItem _timeIntervalToAddSinceStartDate:withNow:step:](self, "_timeIntervalToAddSinceStartDate:withNow:step:", v6, v7, a3);
    v9 = v8;

    objc_msgSend(v15, "rem_dateComponentsByAddingTimeInterval:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderChangeItem _createSnoozeAlarmWithDateComponents:](self, "_createSnoozeAlarmWithDateComponents:", v10);

  }
  else
  {
    -[REMReminderChangeItem displayDate](self, "displayDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderChangeItem _timeIntervalToAddSinceStartDate:withNow:step:](self, "_timeIntervalToAddSinceStartDate:withNow:step:", v5, v12, a3);
      v14 = v13;

      objc_msgSend(v5, "dateByAddingTimeInterval:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderChangeItem snoozeToDate:](self, "snoozeToDate:", v6);
  }

}

- (double)_timeIntervalToAddSinceStartDate:(id)a3 withNow:(id)a4 step:(double)a5
{
  double v6;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  return (double)(uint64_t)fmax(ceil(v6 / a5), 1.0) * a5;
}

- (void)_createSnoozeAlarmWithDateComponents:(id)a3
{
  id v4;
  void *v5;
  REMAlarmDateTrigger *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[REMReminderChangeItem _cleanupOriginalAlarmsForSnoozing](self, "_cleanupOriginalAlarmsForSnoozing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[REMAlarmDateTrigger initWithDateComponents:]([REMAlarmDateTrigger alloc], "initWithDateComponents:", v4);

    -[REMReminderChangeItem addAlarmWithTrigger:](self, "addAlarmWithTrigger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOriginalAlarmUID:", v5);
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Adding snooze alarm: %@", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (id)_cleanupOriginalAlarmsForSnoozing
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  REMAlarm *v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  BOOL v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[REMReminderChangeItem alarms](self, "alarms");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderChangeItem dedupedAndFilteredNonSnoozeAlarms:](self, "dedupedAndFilteredNonSnoozeAlarms:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  v32 = v8 != objc_msgSend(v7, "count");
  -[REMReminderChangeItem setAlarms:updateDisplayDate:](self, "setAlarms:updateDisplayDate:", v7, 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v15, "isOriginal"))
        {
          +[REMLogStore write](REMLogStore, "write");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "description");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v39 = v17;
            _os_log_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_INFO, "Acknowledging original alarm: %@", buf, 0xCu);

          }
          if (!v12
            || (objc_msgSend(v15, "trigger"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v18, "isTemporal"),
                v18,
                v19))
          {
            objc_msgSend(v15, "alarmUID");
            v20 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v20;
          }
          objc_msgSend(v15, "trigger");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isTemporal");

          if (v22)
          {
            -[REMReminderChangeItem removeAlarm:updateDisplayDate:](self, "removeAlarm:updateDisplayDate:", v15, 0);
            v23 = [REMAlarm alloc];
            v24 = +[REMAlarm newObjectID](REMAlarm, "newObjectID");
            v25 = -[REMAlarm initWithAlarm:objectID:](v23, "initWithAlarm:objectID:", v15, v24);

            -[REMReminderChangeItem addAlarm:updateDisplayDate:](self, "addAlarm:updateDisplayDate:", v25, 0);
            -[NSObject setAcknowledgedDate:](v25, "setAcknowledgedDate:", v33);
            objc_msgSend(v15, "alarmUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setAlarmUID:](v25, "setAlarmUID:", v26);

            +[REMLogStore write](REMLogStore, "write");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              -[NSObject description](v25, "description");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v39 = v28;
              _os_log_impl(&dword_1B4A39000, v27, OS_LOG_TYPE_INFO, "Replacing alarm with acknowledged version: %@", buf, 0xCu);

            }
            v32 = 1;
          }
          else
          {
            +[REMLogStore write](REMLogStore, "write");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v15, "description");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v39 = v29;
              _os_log_impl(&dword_1B4A39000, v25, OS_LOG_TYPE_INFO, "Not replacing non-temporal alarm: %@", buf, 0xCu);

            }
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  if (v32)
    -[REMReminderChangeItem updateDisplayDate](self, "updateDisplayDate");
  v30 = v12;

  return v30;
}

- (void)initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:.cold.1()
{
  const char *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[14];
  const char *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12();
  v10 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v9 = "storage";
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "rem_log_fault_if (listChangeItem == nil) -- listChangeItem is nil. Unable to insert ordering info to the list.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)accountCapabilities
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "trackedAccountCapabilities is unexpectedly nil when getting reminderChangeItem.accountCapabilities {objectID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)duplicateForRecurrenceUsingReminderID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "Malformed original reminder - either parentReminderID or listID must be non-nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)duplicateForRecurrenceUsingReminderID:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "listID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "Unable to duplicate. Cannot find list with listID {listID: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)duplicateForRecurrenceUsingReminderID:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "parentReminderID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "Unable to duplicate. parentReminderID is present but parentReminder.subtaskContext is nil. {parentReminderID: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

+ (void)_ensureDueDateDeltaAlertsAreFetchedIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "remObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v5 = 2114;
  v6 = v1;
  _os_log_error_impl(&dword_1B4A39000, v0, OS_LOG_TYPE_ERROR, "_ensureDueDateDeltaAlertsAreFetchedIfNecessary - Error fetching dueDateDeltaAlerts {reminder: %{public}@, error: %{public}@}", v4, 0x16u);

}

- (void)advanceForwardToNextRecurrenceAfterDate:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v2, v3, "AdvanceRecurrence: Unable to advance recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", v4);

  OUTLINED_FUNCTION_8();
}

- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1B4A39000, v2, v3, "setAlternativeDisplayDate: cannot set date on reminder {reminderID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)shallowCopyWithSaveRequest:.cold.1()
{
  const char *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[14];
  const char *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12();
  v10 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v9 = "self.storage";
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8);

  OUTLINED_FUNCTION_1();
}

- (void)shallowCopyWithSaveRequest:.cold.2()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_12();
  v2 = v1;
  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543618;
  v11 = v7;
  v12 = 2112;
  v13 = v2;
  OUTLINED_FUNCTION_0_2(&dword_1B4A39000, v8, v9, "[%{public}@] self.objectID should not be nil when copying this change item {self: %@}", (uint8_t *)&v10);

  OUTLINED_FUNCTION_6();
}

- (void)shallowCopyWithSaveRequest:(NSObject *)a3 .cold.3(void *a1, const char *a2, NSObject *a3)
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
  *(_DWORD *)buf = 138543618;
  v13 = v10;
  v14 = 2114;
  v15 = v11;
  _os_log_fault_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_FAULT, "[%{public}@] _trackedAccountCapabilitiesForObjectID should NOT yield nil result when copying this change item with a non-nil save request {objectID: %{public}@}", buf, 0x16u);

  OUTLINED_FUNCTION_6();
}

- (void)setIcsDisplayOrder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "rem_log_fault_if (listChangeItem == nil) -- listChangeItem is nil. Unable to update list when setting icsDisplayOrder.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)addAlarmWithTrigger:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "Behavior is undefined if you set a time interval (duration) alarm trigger without a due date on the reminder!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
