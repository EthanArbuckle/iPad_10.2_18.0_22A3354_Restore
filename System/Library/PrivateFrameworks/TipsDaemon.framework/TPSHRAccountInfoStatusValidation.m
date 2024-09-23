@implementation TPSHRAccountInfoStatusValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void (**v11)(id, _QWORD, void *);
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = (void (**)(id, _QWORD, void *))a3;
  +[TPSHealthKitDefines sharedHealthStore](TPSHealthKitDefines, "sharedHealthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v6 = (void *)getHKHealthRecordsAccountInfoStoreClass_softClass;
  v25 = getHKHealthRecordsAccountInfoStoreClass_softClass;
  v7 = MEMORY[0x1E0C809B0];
  if (!getHKHealthRecordsAccountInfoStoreClass_softClass)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getHKHealthRecordsAccountInfoStoreClass_block_invoke;
    v21[3] = &unk_1EA1DF510;
    v21[4] = &v22;
    __getHKHealthRecordsAccountInfoStoreClass_block_invoke((uint64_t)v21);
    v6 = (void *)v23[3];
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v22, 8);
  v20 = (id)objc_msgSend([v8 alloc], "initWithHealthStore:", v5);
  v9 = (void *)v16[5];
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v10);

    v9 = (void *)v16[5];
  }
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke;
  v12[3] = &unk_1EA1E0F90;
  v12[4] = self;
  v11 = v4;
  v13 = v11;
  v14 = &v15;
  objc_msgSend(v9, "determineMedicalRecordsAccountInfoStatusWithCompletion:", v12);

  _Block_object_dispose(&v15, 8);
}

void __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_2(a1, (uint64_t)v5, v6);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v8 == a2, v9);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

void __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_1(id *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);

  OUTLINED_FUNCTION_0_3();
}

void __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = 0;
  v14 = 2112;
  v15 = a2;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v8, 0x26u);

  OUTLINED_FUNCTION_0_3();
}

@end
