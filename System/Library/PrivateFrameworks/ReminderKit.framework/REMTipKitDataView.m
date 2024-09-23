@implementation REMTipKitDataView

- (id)fetchCustomSmartListsCountWithError:(id *)a3
{
  REMTipKitDataViewInvocation_fetchCustomSmartListsCount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v12;

  v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchCustomSmartListsCount);
  -[REMTipKitDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v7, "storedPropertyForKey:", CFSTR("CustomSmartListsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMTipKitDataView fetchCustomSmartListsCountWithError:].cold.1();

    if (a3 && !*a3)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (id)fetchCompletedRemindersCountWithError:(id *)a3
{
  REMTipKitDataViewInvocation_fetchCompletedRemindersCount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v12;

  v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchCompletedRemindersCount);
  -[REMTipKitDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v7, "storedPropertyForKey:", CFSTR("CompletedRemindersCountInList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMTipKitDataView fetchCompletedRemindersCountWithError:].cold.1();

    if (a3 && !*a3)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (id)fetchListsWithCustomBadgeCountWithError:(id *)a3
{
  REMTipKitDataViewInvocation_fetchListsWithCustomBadgeCount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v12;

  v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchListsWithCustomBadgeCount);
  -[REMTipKitDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v7, "storedPropertyForKey:", CFSTR("ListsWithCustomBadgeCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMTipKitDataView fetchListsWithCustomBadgeCountWithError:].cold.1();

    if (a3 && !*a3)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (REMTipKitDataView)initWithStore:(id)a3
{
  id v5;
  REMTipKitDataView *v6;
  REMTipKitDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTipKitDataView;
  v6 = -[REMTipKitDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchHashtagsCountWithError:(id *)a3
{
  REMTipKitDataViewInvocation_fetchHashtagsCount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v12;

  v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchHashtagsCount);
  -[REMTipKitDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v7, "storedPropertyForKey:", CFSTR("HashtagsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMTipKitDataView fetchHashtagsCountWithError:].cold.1();

    if (a3 && !*a3)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (id)fetchListsCountWithError:(id *)a3
{
  REMTipKitDataViewInvocation_fetchListsCount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v12;

  v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchListsCount);
  -[REMTipKitDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v7, "storedPropertyForKey:", CFSTR("ListsCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMTipKitDataView fetchListsCountWithError:].cold.1();

    if (a3 && !*a3)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (id)fetchUncompletedRemindersCountWithError:(id *)a3
{
  REMTipKitDataViewInvocation_fetchUncompletedRemindersCount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v12;

  v5 = objc_alloc_init(REMTipKitDataViewInvocation_fetchUncompletedRemindersCount);
  -[REMTipKitDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  objc_msgSend(v7, "storedPropertyForKey:", CFSTR("UncompletedRemindersCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMTipKitDataView fetchUncompletedRemindersCountWithError:].cold.1();

    if (a3 && !*a3)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (id)fetchCompletedRemindersCountInList:(id)a3 error:(id *)a4
{
  id v6;
  REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v14;

  v6 = a3;
  v7 = -[REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList initWithListID:]([REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList alloc], "initWithListID:", v6);

  -[REMTipKitDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  objc_msgSend(v9, "storedPropertyForKey:", CFSTR("CompletedRemindersCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v10, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[REMLogStore read](REMLogStore, "read");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[REMTipKitDataView fetchCompletedRemindersCountInList:error:].cold.1();

    if (a4 && !*a4)
    {
      +[REMError unexpectedError](REMError, "unexpectedError");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (void)fetchListsCountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "REMTipKit: Failed to fetch lists count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchListsWithCustomBadgeCountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "REMTipKit: Failed to fetch lists with custom badge count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchUncompletedRemindersCountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "REMTipKit: Failed to fetch uncompleted reminders count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchCompletedRemindersCountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "REMTipKit: Failed to fetch completed reminders count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchCompletedRemindersCountInList:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "REMTipKit: Failed to fetch completed reminders in list count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchCustomSmartListsCountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "REMTipKit: Failed to fetch custom smart lists count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)fetchHashtagsCountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, v0, v1, "REMTipKit: Failed to fetch hashtags count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
