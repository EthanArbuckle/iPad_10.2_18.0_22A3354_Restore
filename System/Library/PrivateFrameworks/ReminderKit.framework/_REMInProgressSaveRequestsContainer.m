@implementation _REMInProgressSaveRequestsContainer

- (_REMInProgressSaveRequestsContainer)init
{
  _REMInProgressSaveRequestsContainer *v2;
  NSMutableArray *v3;
  NSMutableArray *inProgressSaveRequests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_REMInProgressSaveRequestsContainer;
  v2 = -[_REMInProgressSaveRequestsContainer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inProgressSaveRequests = v2->_inProgressSaveRequests;
    v2->_inProgressSaveRequests = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressSaveRequests, 0);
}

- (void)saveRequestSaveDidStart:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  -[_REMInProgressSaveRequestsContainer inProgressSaveRequests](self, "inProgressSaveRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_REMInProgressSaveRequestsContainer saveRequestSaveDidStart:].cold.1();

  }
  if ((objc_msgSend(v4, "isSaved") & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be TRUE", v10, 2u);
    }

  }
  -[_REMInProgressSaveRequestsContainer inProgressSaveRequests](self, "inProgressSaveRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (void)saveRequestSaveDidFinish:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  -[_REMInProgressSaveRequestsContainer inProgressSaveRequests](self, "inProgressSaveRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[_REMInProgressSaveRequestsContainer saveRequestSaveDidFinish:].cold.1();

  }
  else
  {
    -[_REMInProgressSaveRequestsContainer inProgressSaveRequests](self, "inProgressSaveRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", v6);

  }
}

- (id)latestSaveInProgressAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___REMInProgressSaveRequestsContainer_latestSaveInProgressAccount___block_invoke;
  v8[3] = &unk_1E67F9D90;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[_REMInProgressSaveRequestsContainer _firstMatchInSaveRequests:](self, "_firstMatchInSaveRequests:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)latestSaveInProgressList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64___REMInProgressSaveRequestsContainer_latestSaveInProgressList___block_invoke;
  v13[3] = &unk_1E67F9DB8;
  v13[4] = self;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  -[_REMInProgressSaveRequestsContainer _firstMatchInSaveRequests:](self, "_firstMatchInSaveRequests:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)latestSaveInProgressReminder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "list");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentReminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68___REMInProgressSaveRequestsContainer_latestSaveInProgressReminder___block_invoke;
  v17[3] = &unk_1E67F9DE0;
  v17[4] = self;
  v18 = v5;
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v22 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  v14 = v5;
  -[_REMInProgressSaveRequestsContainer _firstMatchInSaveRequests:](self, "_firstMatchInSaveRequests:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)latestSaveInProgressReminderForReminderChangeItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "saveRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSaved");

  if ((v6 & 1) == 0)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be TRUE", buf, 2u);
    }

  }
  objc_msgSend(v4, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89___REMInProgressSaveRequestsContainer_latestSaveInProgressReminderForReminderChangeItem___block_invoke;
  v12[3] = &unk_1E67F9E08;
  v12[4] = self;
  v13 = v8;
  v9 = v8;
  -[_REMInProgressSaveRequestsContainer _firstMatchInSaveRequests:](self, "_firstMatchInSaveRequests:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_latestSaveInProgressAccountForObjectID:(id)a3 saveRequest:(id)a4
{
  id v5;
  void *v6;
  REMAccount *v7;
  void *v8;
  void *v9;
  REMAccount *v10;

  v5 = a4;
  objc_msgSend(v5, "_trackedAccountChangeItemForObjectID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [REMAccount alloc];
    objc_msgSend(v5, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[REMAccount initWithStore:storage:](v7, "initWithStore:storage:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_latestSaveInProgressListForObjectID:(id)a3 fallbackAccount:(id)a4 fallbackParentList:(id)a5 saveRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  REMList *v27;
  REMList *v28;
  void *v29;
  void *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "_trackedListChangeItemForObjectID:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "accountID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_REMInProgressSaveRequestsContainer _latestSaveInProgressAccountForObjectID:saveRequest:](self, "_latestSaveInProgressAccountForObjectID:saveRequest:", v16, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = v11;
    v20 = v19;

    if (v20)
    {
      objc_msgSend(v15, "parentListID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v15, "parentListID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMInProgressSaveRequestsContainer _latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:](self, "_latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:", v22, v20, 0, v13);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (void *)v23;
        else
          v25 = v12;
        v26 = v25;

        if (!v26)
        {
          +[REMLogStore write](REMLogStore, "write");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[_REMInProgressSaveRequestsContainer _latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:].cold.2();
LABEL_16:
          v27 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {
        v26 = 0;
      }
      v28 = [REMList alloc];
      objc_msgSend(v13, "store");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[REMList initWithStore:account:storage:](v28, "initWithStore:account:storage:", v29, v20, v30);

      if (v26)
        -[REMList setParentList:](v27, "setParentList:", v26);
      goto LABEL_20;
    }
    +[REMLogStore write](REMLogStore, "write");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[_REMInProgressSaveRequestsContainer _latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:].cold.1();
    goto LABEL_16;
  }
  v27 = 0;
LABEL_21:

  return v27;
}

- (id)_latestSaveInProgressReminderForObjectID:(id)a3 fallbackAccount:(id)a4 fallbackList:(id)a5 fallbackParentList:(id)a6 fallbackParentReminder:(id)a7 saveRequest:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  REMReminder *v28;
  void *v29;
  void *v30;
  REMReminder *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  REMReminder *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id v43;
  id v44;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v19, "_trackedReminderChangeItemForObjectID:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "listID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v43 = v18;
      objc_msgSend(v21, "listID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMInProgressSaveRequestsContainer _latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:](self, "_latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:", v23, v15, v17, v19);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (void *)v24;
      else
        v26 = v16;
      v27 = v26;

      if (v27)
      {
        v28 = [REMReminder alloc];
        objc_msgSend(v19, "store");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "storage");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[REMReminder initWithStore:list:storage:](v28, "initWithStore:list:storage:", v29, v27, v30);

      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[_REMInProgressSaveRequestsContainer _latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:].cold.3();

        v31 = 0;
      }
      v18 = v43;
      goto LABEL_25;
    }
    objc_msgSend(v21, "parentReminderID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v21, "parentReminderID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMInProgressSaveRequestsContainer _latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:](self, "_latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:", v33, v15, v16, v17, 0, v19);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (void *)v34;
      else
        v36 = v18;
      v27 = v36;

      if (v27)
      {
        v37 = [REMReminder alloc];
        objc_msgSend(v19, "store");
        v44 = v18;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "storage");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[REMReminder initWithStore:storage:](v37, "initWithStore:storage:", v38, v39);

        v18 = v44;
        -[REMReminder setParentReminder:](v31, "setParentReminder:", v27);
LABEL_25:

        goto LABEL_26;
      }
      +[REMLogStore write](REMLogStore, "write");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[_REMInProgressSaveRequestsContainer _latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:].cold.2();

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[_REMInProgressSaveRequestsContainer _latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:].cold.1((uint64_t)v14, v27);
    }
    v31 = 0;
    goto LABEL_25;
  }
  v31 = 0;
LABEL_26:

  return v31;
}

- (id)_firstMatchInSaveRequests:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_REMInProgressSaveRequestsContainer inProgressSaveRequests](self, "inProgressSaveRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isSaved") & 1) == 0)
        {
          +[REMLogStore write](REMLogStore, "write");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be TRUE", v16, 2u);
          }

        }
        v4[2](v4, v11);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (NSMutableArray)inProgressSaveRequests
{
  return self->_inProgressSaveRequests;
}

- (void)setInProgressSaveRequests:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressSaveRequests, a3);
}

- (void)saveRequestSaveDidStart:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "inProgressSaveRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_1(&dword_1B4A39000, v3, v4, "rem_log_fault_if ([self.inProgressSaveRequests containsObject:saveRequest]) -- SaveRequest save already in progress {saveRequest: %@, inProgressSaveRequests: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)saveRequestSaveDidFinish:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "inProgressSaveRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_1(&dword_1B4A39000, v3, v4, "SaveRequest is not in progress. Ignoring. {saveRequest: %@, inProgressSaveRequests: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "accountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Failed to get account for inProgressList. Returning nil {listObjectID: %@, accountID: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "parentListID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Failed to get parentlist for inProgressList. Returning nil {listObjectID: %@, trackedListChangeItem.parentListID: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_latestSaveInProgressReminderForObjectID:(uint64_t)a1 fallbackAccount:(NSObject *)a2 fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "ReminderChangeItem missing both listID and parentReminderID. Returning nil {reminderObjectID: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)_latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "parentReminderID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Failed to get parent reminder for inProgressReminder. Returning nil {reminderObjectID: %@, parentReminderID: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "listID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Failed to get list for inProgressReminder. Returning nil {reminderObjectID: %@, listID: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

@end
