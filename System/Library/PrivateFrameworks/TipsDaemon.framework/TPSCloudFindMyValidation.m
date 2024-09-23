@implementation TPSCloudFindMyValidation

void __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  id *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 == 1;
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = (id *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3 == objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke_cold_1(v4, a1 + 56, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v5 = (void *)getFMDFMIPManagerClass_softClass;
  v30 = getFMDFMIPManagerClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getFMDFMIPManagerClass_softClass)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __getFMDFMIPManagerClass_block_invoke;
    v26[3] = &unk_1EA1DF510;
    v26[4] = &v27;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)v26);
    v5 = (void *)v28[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v27, 8);
  objc_msgSend(v7, "sharedInstance");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v17[5];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

    v8 = (void *)v17[5];
  }
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1EA1E0EA8;
  v13 = v24;
  v14 = v22;
  v11[4] = self;
  v10 = v4;
  v12 = v10;
  v15 = &v16;
  objc_msgSend(v8, "fmipStateWithCompletion:", v11);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

void __51__TPSCloudFindMyValidation_validateWithCompletion___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 24);
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 1024;
  v14 = v8;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v9, 0x1Cu);

}

@end
