@implementation REMSiriSearchLimitedDataView

- (REMSiriSearchLimitedDataView)initWithStore:(id)a3
{
  id v5;
  REMSiriSearchLimitedDataView *v6;
  REMSiriSearchLimitedDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSiriSearchLimitedDataView;
  v6 = -[REMSiriSearchLimitedDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchRemindersMatchingTitle:(id)a3 dueAfter:(id)a4 dueBefore:(id)a5 isCompleted:(id)a6 hasLocation:(id)a7 location:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  REMSiriSearchLimitedDataViewInvocation_fetchReminders *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[REMSiriSearchLimitedDataViewInvocation_fetchReminders initWithTitle:dueAfter:dueBefore:isCompleted:hasLocation:location:]([REMSiriSearchLimitedDataViewInvocation_fetchReminders alloc], "initWithTitle:dueAfter:dueBefore:isCompleted:hasLocation:location:", v20, v19, v18, v17, v16, v15);

  -[REMSiriSearchLimitedDataView store](self, "store");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resultFromPerformingInvocation:error:", v21, a9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_opt_class();
  REMDynamicCast(v24, (uint64_t)v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accountStorages");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "listStorages");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "reminderStorages");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSiriSearchLimitedDataView store](self, "store");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
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
