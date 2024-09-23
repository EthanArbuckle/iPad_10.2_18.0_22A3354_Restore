@implementation REMRemindersDataView

- (REMRemindersDataView)initWithStore:(id)a3
{
  id v5;
  REMRemindersDataView *v6;
  REMRemindersDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMRemindersDataView;
  v6 = -[REMRemindersDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchRemindersWithListID:(id)a3 includingSubtasks:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  REMRemindersDataViewInvocation_fetchByListID *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v8 = a3;
  v9 = -[REMRemindersDataViewInvocation_fetchByListID initWithListID:includingSubtasks:]([REMRemindersDataViewInvocation_fetchByListID alloc], "initWithListID:includingSubtasks:", v8, v6);

  -[REMRemindersDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listStorages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reminderStorages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView store](self, "store");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)fetchRemindersWithParentReminderID:(id)a3 accountID:(id)a4 fetchOption:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  REMRemindersDataViewInvocation_fetchByParentReminderID *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a4;
  v11 = a3;
  v12 = -[REMRemindersDataViewInvocation_fetchByParentReminderID initWithParentReminderID:accountID:fetchOption:]([REMRemindersDataViewInvocation_fetchByParentReminderID alloc], "initWithParentReminderID:accountID:fetchOption:", v11, v10, a5);

  -[REMRemindersDataView store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultFromPerformingInvocation:error:", v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  REMDynamicCast(v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountStorages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "listStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reminderStorages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView store](self, "store");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)fetchSubtasksOfParentReminder:(id)a3 fetchOption:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMRemindersDataView fetchRemindersWithParentReminderID:accountID:fetchOption:error:](self, "fetchRemindersWithParentReminderID:accountID:fetchOption:error:", v9, v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchSubtasksOfParentReminderChangeItem:(id)a3 fetchOption:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMRemindersDataView fetchRemindersWithParentReminderID:accountID:fetchOption:error:](self, "fetchRemindersWithParentReminderID:accountID:fetchOption:error:", v9, v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchReminderWithObjectID:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18[0] = v8;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchRemindersWithObjectIDs:fetchOptions:error:](self, "fetchRemindersWithObjectIDs:fetchOptions:error:", v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_7;
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[REMLogStore read](REMLogStore, "read");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_DEFAULT, "REMRemindersDataView: Requested to fetch non-existent reminder {objectID: %{public}@}", (uint8_t *)&v16, 0xCu);
    }

    if (a5)
    {
      +[REMError noSuchObjectErrorWithObjectID:](REMError, "noSuchObjectErrorWithObjectID:", v8);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)fetchRemindersWithObjectIDs:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  REMRemindersDataViewInvocation_fetchByObjectID *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  REMRemindersDataViewInvocation_fetchByObjectID *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_msgSend(v9, "includeConcealed");
    v11 = -[REMRemindersDataViewInvocation_fetchByObjectID initWithObjectIDs:fetchOptions:]([REMRemindersDataViewInvocation_fetchByObjectID alloc], "initWithObjectIDs:fetchOptions:", v8, v9);
    -[REMRemindersDataView store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v11;
    objc_msgSend(v12, "resultFromPerformingInvocation:error:", v11, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    REMDynamicCast(v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountStorages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "listStorages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reminderStorages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMRemindersDataView store](self, "store");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:showMarkedForDeleteObjects:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:showMarkedForDeleteObjects:", v16, v17, v18, v19, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v31 = v13;
      v32 = v9;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v22 = v8;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v35;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v26));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27)
            {
              objc_msgSend(v27, "objectID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, v29);

            }
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v24);
      }

      v13 = v31;
      v9 = v32;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v21;
}

- (id)fetchRemindersIncludingUnsupportedWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[REMReminderFetchOptions fetchOptionsIncludingConcealed](REMReminderFetchOptions, "fetchOptionsIncludingConcealed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchRemindersWithObjectIDs:fetchOptions:error:](self, "fetchRemindersWithObjectIDs:fetchOptions:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchRemindersMatchingPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  REMRemindersDataViewInvocation_fetchByPredicateDescriptor *v13;
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
  v13 = -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor initWithPredicateDescriptor:sortDescriptors:options:]([REMRemindersDataViewInvocation_fetchByPredicateDescriptor alloc], "initWithPredicateDescriptor:sortDescriptors:options:", v12, v11, v10);

  -[REMRemindersDataView store](self, "store");
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
  -[REMRemindersDataView store](self, "store");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)fetchRemindersWithParentReminderIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataViewInvocation_fetchByParentReminderIDs *v7;
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
  v7 = -[REMRemindersDataViewInvocation_fetchByParentReminderIDs initWithParentReminderIDs:]([REMRemindersDataViewInvocation_fetchByParentReminderIDs alloc], "initWithParentReminderIDs:", v6);

  -[REMRemindersDataView store](self, "store");
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
  -[REMRemindersDataView store](self, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedReminderIDs:", v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchObjectIDsOfRemindersWithParentReminderID:(id)a3 includeIncomplete:(BOOL)a4 includeCompleted:(BOOL)a5 isUnsupported:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID initWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:]([REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID alloc], "initWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:", v12, v10, v9, v8);

  -[REMRemindersDataView store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resultFromPerformingInvocation:error:", v13, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  REMDynamicCast(v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)fetchRemindersCountWithListID:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataViewInvocation_fetchRemindersCountByListID *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = -[REMRemindersDataViewInvocation_fetchRemindersCountByListID initWithListID:]([REMRemindersDataViewInvocation_fetchRemindersCountByListID alloc], "initWithListID:", v6);
  -[REMRemindersDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  objc_msgSend(v9, "storedPropertyForKey:", CFSTR("RemindersCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v10, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[REMLogStore read](REMLogStore, "read");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[REMRemindersDataView fetchRemindersCountWithListID:error:].cold.1((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);

    if (a4 && !*a4)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)fetchRemindersCountWithParentReminderID:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = -[REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID initWithParentReminderID:]([REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID alloc], "initWithParentReminderID:", v6);
  -[REMRemindersDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  objc_msgSend(v9, "storedPropertyForKey:", CFSTR("RemindersCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v10, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[REMLogStore read](REMLogStore, "read");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[REMRemindersDataView fetchRemindersCountWithParentReminderID:error:].cold.1((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);

    if (a4 && !*a4)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (int64_t)fetchSubtasksMasksWithParentReminderID:(id)a3 includingConcealed:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a4;
  v8 = a3;
  v9 = -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID initWithParentReminderID:includingConcealed:]([REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID alloc], "initWithParentReminderID:includingConcealed:", v8, v6);
  -[REMRemindersDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  objc_msgSend(v11, "storedPropertyForKey:", CFSTR("ReminderSubtasksMasks"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v12, (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    +[REMLogStore read](REMLogStore, "read");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[REMRemindersDataView fetchSubtasksMasksWithParentReminderID:includingConcealed:error:].cold.1((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);

    if (a5 && !*a5)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  return v15;
}

- (id)fetchReminderWithExternalIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v19[0] = v8;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = a4;
    objc_msgSend(v10, "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMRemindersDataView fetchRemindersWithExternalIdentifiers:inList:error:](self, "fetchRemindersWithExternalIdentifiers:inList:error:", v12, v11, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
LABEL_10:

        goto LABEL_11;
      }
      +[REMLogStore read](REMLogStore, "read");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1B4A39000, v15, OS_LOG_TYPE_DEFAULT, "Requested non-existent reminder {externalIdentifier: %@}", (uint8_t *)&v17, 0xCu);
      }

      if (a5)
      {
        +[REMError noSuchObjectErrorWithExternalIdentifier:](REMError, "noSuchObjectErrorWithExternalIdentifier:", v9);
        v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    v14 = 0;
    goto LABEL_10;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)fetchRemindersWithExternalIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v10;
  void *v11;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v31;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = [REMRemindersDataViewInvocation_fetchByExternalIdentifier alloc];
  v33 = v9;
  objc_msgSend(v9, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[REMRemindersDataViewInvocation_fetchByExternalIdentifier initWithExternalIdentifiers:listObjectID:](v10, "initWithExternalIdentifiers:listObjectID:", v8, v11);

  -[REMRemindersDataView store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultFromPerformingInvocation:error:", v12, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  REMDynamicCast(v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountStorages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "listStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reminderStorages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView store](self, "store");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedStringIdentifiers:identifierSelector:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedStringIdentifiers:identifierSelector:", v17, v18, v19, v20, v8, sel_externalIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v31 = v14;
    v32 = v12;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v21, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v28, "externalIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v25);
    }

    v14 = v31;
    v12 = v32;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)fetchAllRemindersWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v7;
  void *v8;
  REMRemindersDataViewInvocation_fetchByExternalIdentifier *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id *v24;
  uint8_t buf[4];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [REMRemindersDataViewInvocation_fetchByExternalIdentifier alloc];
  v27[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMRemindersDataViewInvocation_fetchByExternalIdentifier initWithExternalIdentifiers:listObjectID:](v7, "initWithExternalIdentifiers:listObjectID:", v8, 0);

  -[REMRemindersDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a4;
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listStorages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reminderStorages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView store](self, "store");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 && objc_msgSend(v19, "count"))
  {
    v21 = v20;
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v6;
      _os_log_impl(&dword_1B4A39000, v22, OS_LOG_TYPE_DEFAULT, "REMRemindersDataView: Requested to fetch non-existent reminders {externalIdentifier: %{public}@}", buf, 0xCu);
    }

    if (v24)
    {
      +[REMError noSuchObjectErrorWithExternalIdentifier:](REMError, "noSuchObjectErrorWithExternalIdentifier:", v6);
      v21 = 0;
      *v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (id)fetchReminderWithDACalendarItemUniqueIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18[0] = v8;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchRemindersWithDACalendarItemUniqueIdentifiers:inList:error:](self, "fetchRemindersWithDACalendarItemUniqueIdentifiers:inList:error:", v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_7;
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[REMLogStore read](REMLogStore, "read");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_DEFAULT, "REMRemindersDataView: Requested to fetch non-existent reminder {daCalendarItemUniqueIdentifier: %{public}@}", (uint8_t *)&v16, 0xCu);
    }

    if (a5)
    {
      +[REMError noSuchObjectErrorWithDACalendarItemUniqueIdentifier:](REMError, "noSuchObjectErrorWithDACalendarItemUniqueIdentifier:", v8);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)fetchRemindersWithDACalendarItemUniqueIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMRemindersDataViewInvocation_fetchByDACalendarItemUniqueIdentifier *v10;
  void *v11;
  REMRemindersDataViewInvocation_fetchByDACalendarItemUniqueIdentifier *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v31;
  REMRemindersDataViewInvocation_fetchByDACalendarItemUniqueIdentifier *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = [REMRemindersDataViewInvocation_fetchByDACalendarItemUniqueIdentifier alloc];
  v33 = v9;
  objc_msgSend(v9, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[REMRemindersDataViewInvocation_fetchByDACalendarItemUniqueIdentifier initWithDACalendarItemUniqueIdentifiers:listObjectID:](v10, "initWithDACalendarItemUniqueIdentifiers:listObjectID:", v8, v11);

  -[REMRemindersDataView store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultFromPerformingInvocation:error:", v12, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  REMDynamicCast(v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountStorages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "listStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reminderStorages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView store](self, "store");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRemindersDataView remindersFromAccountStorages:listStorages:reminderStorages:store:requestedStringIdentifiers:identifierSelector:](REMRemindersDataView, "remindersFromAccountStorages:listStorages:reminderStorages:store:requestedStringIdentifiers:identifierSelector:", v17, v18, v19, v20, v8, sel_daCalendarItemUniqueIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v31 = v14;
    v32 = v12;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v21, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v28, "daCalendarItemUniqueIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v25);
    }

    v14 = v31;
    v12 = v32;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 requestedReminderIDs:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  objc_msgSend(a1, "remindersFromAccountStorages:listStorages:reminderStorages:store:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 requestedStringIdentifiers:(id)a7 identifierSelector:(SEL)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  objc_msgSend(a1, "remindersFromAccountStorages:listStorages:reminderStorages:store:", a3, a4, a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v35 = v14;
    objc_msgSend(v15, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          NSStringFromSelector(a8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "valueForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v26);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v21);
    }

    v14 = v35;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v35;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
            objc_msgSend(v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v30);
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6
{
  return (id)objc_msgSend(a1, "remindersFromAccountStorages:listStorages:reminderStorages:store:showMarkedForDeleteObjects:", a3, a4, a5, a6, 0);
}

+ (id)remindersFromAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 store:(id)a6 showMarkedForDeleteObjects:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  REMReminder *v23;
  void *v24;
  NSObject *v25;
  REMReminder *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v43 = a7;
  v59 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    v13 = 0;
    goto LABEL_29;
  }
  +[REMAccountsDataView accountsFromAccountStorages:store:](REMAccountsDataView, "accountsFromAccountStorages:store:", a3, v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  +[REMListsDataView listsFromAccounts:listStorages:store:](REMListsDataView, "listsFromAccounts:listStorages:store:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v38 = v11;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (!v15)
    goto LABEL_18;
  v16 = v15;
  v17 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v50 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      objc_msgSend(v19, "listID", v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v19, "listID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = -[REMReminder initWithStore:list:storage:]([REMReminder alloc], "initWithStore:list:storage:", v12, v22, v19);
      }
      else
      {
        if (!v43)
          continue;
        objc_msgSend(v19, "accountID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          +[REMLogStore read](REMLogStore, "read");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v19, "objectID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "accountID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v41;
            v56 = 2114;
            v57 = v40;
            _os_log_fault_impl(&dword_1B4A39000, v25, OS_LOG_TYPE_FAULT, "REMRemindersDataView: Could not map an account for the fetched reminder {reminderID: %{public}@, accountID: %{public}@}", buf, 0x16u);

          }
        }
        v23 = -[REMReminder initWithStore:account:storage:]([REMReminder alloc], "initWithStore:account:storage:", v12, v22, v19);
      }
      v26 = v23;
      -[REMReminder objectID](v23, "objectID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v27);

    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  }
  while (v16);
LABEL_18:

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v13, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v33, "storage", v38);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "parentReminderID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setParentReminder:", v36);

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v30);
  }

  v11 = v38;
  v10 = v39;
LABEL_29:

  return v13;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchRemindersCountWithListID:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "Failed to fetch reminders count of list {listID: %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)fetchRemindersCountWithParentReminderID:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "Failed to fetch reminders count with parentReminderID {parentReminderID: %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)fetchSubtasksMasksWithParentReminderID:(uint64_t)a3 includingConcealed:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "Failed to fetch reminder subtasks masks with parentReminderID {parentReminderID: %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

@end
