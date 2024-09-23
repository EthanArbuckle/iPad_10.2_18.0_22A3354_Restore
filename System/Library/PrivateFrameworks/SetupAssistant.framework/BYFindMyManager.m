@implementation BYFindMyManager

- (BOOL)isFindMyEnabled
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[8];
  uint64_t v20;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v2 = dispatch_semaphore_create(0);
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Will fetch Find My state.", buf, 2u);
  }

  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v4 = (void *)getFMDFMIPManagerClass_softClass;
  v27 = getFMDFMIPManagerClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getFMDFMIPManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __getFMDFMIPManagerClass_block_invoke;
    v22 = &unk_1E4E26900;
    v23 = &v24;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)buf);
    v4 = (void *)v25[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __34__BYFindMyManager_isFindMyEnabled__block_invoke;
  v12[3] = &unk_1E4E26AA0;
  v14 = &v15;
  v8 = v2;
  v13 = v8;
  objc_msgSend(v7, "fmipStateWithCompletion:", v12);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  _BYLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Did finish waiting for Find My state.", buf, 2u);
  }

  v10 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v10;
}

void __34__BYFindMyManager_isFindMyEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;

  v5 = a3;
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
      __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_2(v5, v6);

  }
  else
  {
    if (v7)
      __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_1(a2, v6, v8);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A4E92000, a2, a3, "Did fetch Find My state %lu", (uint8_t *)&v3);
}

void __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v2;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = _BYIsInternalInstall();
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(a1, "code"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = 138543362;
  v9 = a1;
  OUTLINED_FUNCTION_0(&dword_1A4E92000, a2, v5, "Failed to fetch Find My state: %{public}@", (uint8_t *)&v8);
  if (!v6)
  {

  }
}

@end
