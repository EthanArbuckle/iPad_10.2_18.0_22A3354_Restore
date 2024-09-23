@implementation REMEventKitBridgingDataView

- (REMEventKitBridgingDataView)initWithStore:(id)a3
{
  id v5;
  REMEventKitBridgingDataView *v6;
  REMEventKitBridgingDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMEventKitBridgingDataView;
  v6 = -[REMEventKitBridgingDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchListsWithError:(id *)a3
{
  REMEventKitBridgingDataViewInvocation_fetchLists *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc_init(REMEventKitBridgingDataViewInvocation_fetchLists);
  -[REMEventKitBridgingDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listStorages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMEventKitBridgingDataView store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fetchRemindersWithListIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMEventKitBridgingDataViewInvocation_fetchReminders *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = -[REMEventKitBridgingDataViewInvocation_fetchReminders initWithListIDs:]([REMEventKitBridgingDataViewInvocation_fetchReminders alloc], "initWithListIDs:", v6);

  -[REMEventKitBridgingDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listStorages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reminderStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMEventKitBridgingDataView store](self, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchIncompleteRemindersWithDueDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate initWithListIDs:startDate:endDate:]([REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate alloc], "initWithListIDs:startDate:endDate:", v10, v12, v11);

  -[REMEventKitBridgingDataView store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resultFromPerformingInvocation:error:", v13, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  REMDynamicCast(v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "listStorages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reminderStorages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMEventKitBridgingDataView store](self, "store");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)fetchCompletedRemindersWithCompletionDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate initWithListIDs:startDate:endDate:]([REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate alloc], "initWithListIDs:startDate:endDate:", v10, v12, v11);

  -[REMEventKitBridgingDataView store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resultFromPerformingInvocation:error:", v13, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  REMDynamicCast(v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "listStorages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reminderStorages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMEventKitBridgingDataView store](self, "store");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
