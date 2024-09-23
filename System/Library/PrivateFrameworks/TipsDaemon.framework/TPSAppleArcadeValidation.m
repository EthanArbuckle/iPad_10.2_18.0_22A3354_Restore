@implementation TPSAppleArcadeValidation

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
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  v27 = getASDSubscriptionEntitlementsClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __getASDSubscriptionEntitlementsClass_block_invoke;
    v23[3] = &unk_1EA1DF510;
    v23[4] = &v24;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)v23);
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
  v11[2] = __51__TPSAppleArcadeValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1EA1E0F50;
  v13 = v21;
  v11[4] = self;
  v10 = v4;
  v12 = v10;
  v14 = &v15;
  objc_msgSend(v8, "getSubscriptionEntitlementsForSegment:ignoreCaches:withResultHandler:", 1, 0, v11);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

}

void __51__TPSAppleArcadeValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
      objc_msgSend(v8, "offerID", (_QWORD)v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.arcade.")))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        objc_msgSend(v8, "familyID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "isEqual:", &unk_1EA1F09E8);

      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v11 == v12, v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

}

@end
