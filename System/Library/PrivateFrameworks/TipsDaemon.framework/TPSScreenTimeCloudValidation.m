@implementation TPSScreenTimeCloudValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)getSTManagementStateClass_softClass_0;
  v27 = getSTManagementStateClass_softClass_0;
  v6 = MEMORY[0x1E0C809B0];
  if (!getSTManagementStateClass_softClass_0)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __getSTManagementStateClass_block_invoke_0;
    v23[3] = &unk_1EA1DF510;
    v23[4] = &v24;
    __getSTManagementStateClass_block_invoke_0((uint64_t)v23);
    v5 = (void *)v25[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v24, 8);
  v20 = objc_alloc_init(v7);
  v8 = (void *)v16[5];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

    v8 = (void *)v16[5];
  }
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__TPSScreenTimeCloudValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1EA1E0AF8;
  v13 = v21;
  v11[4] = self;
  v10 = v4;
  v12 = v10;
  v14 = &v15;
  objc_msgSend(v8, "screenTimeSyncStateWithCompletionHandler:", v11);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

}

void __55__TPSScreenTimeCloudValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  id *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 == 2;
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = (id *)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1(v4, v3 == v5, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

@end
