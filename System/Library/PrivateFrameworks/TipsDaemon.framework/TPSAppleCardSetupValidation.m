@implementation TPSAppleCardSetupValidation

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
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)getPKAccountServiceClass_softClass;
  v27 = getPKAccountServiceClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getPKAccountServiceClass_softClass)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __getPKAccountServiceClass_block_invoke;
    v23[3] = &unk_1EA1DF510;
    v23[4] = &v24;
    __getPKAccountServiceClass_block_invoke((uint64_t)v23);
    v5 = (void *)v25[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v7, "sharedInstance");
  v20 = (id)objc_claimAutoreleasedReturnValue();
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
  v11[2] = __54__TPSAppleCardSetupValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1EA1E07D8;
  v13 = v21;
  v11[4] = self;
  v10 = v4;
  v12 = v10;
  v14 = &v15;
  objc_msgSend(v8, "accountsWithPassLocallyProvisionedWithCompletion:", v11);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

}

void __54__TPSAppleCardSetupValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (_QWORD)v14) == 1 && objc_msgSend(v8, "feature") == 2)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v10 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v9 == v10, v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

@end
