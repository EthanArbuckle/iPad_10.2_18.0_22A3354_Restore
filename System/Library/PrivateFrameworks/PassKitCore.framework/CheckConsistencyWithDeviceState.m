@implementation CheckConsistencyWithDeviceState

void __CheckConsistencyWithDeviceState_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD aBlock[4];
  id v46;
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAddCleanupActionsToResultsSummary:", a3);
  v6 = *(id *)(a1 + 40);
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = v5;
  v9 = objc_alloc_init(v7);
  v10 = objc_msgSend(v8, "paymentMethod");
  v11 = objc_msgSend(v8, "type");
  v12 = v11;
  if (v11)
    v13 = v10 == 1002;
  else
    v13 = 1;
  v14 = !v13;
  if (v11)
    v16 = v10 == 1004 || (v10 & 0xFFFFFFFFFFFFFFFELL) == 1002;
  else
    v16 = 0;
  objc_msgSend(v8, "address");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "mostSpecificIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __GetExpectedDeviceCredentialsForPassCredential_block_invoke;
  aBlock[3] = &unk_1E2AD8BC8;
  v46 = v6;
  v47 = v18;
  v48 = v9;
  v19 = v6;
  v20 = v18;
  v21 = v9;
  v22 = _Block_copy(aBlock);
  v23 = (void (**)(_QWORD, _QWORD))v22;
  if (v12)
  {
    if (!v14)
      goto LABEL_17;
  }
  else
  {
    (*((void (**)(void *, _QWORD))v22 + 2))(v22, 0);
    if (!v14)
    {
LABEL_17:
      if (!v16)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  v23[2](v23, 1);
  if (v16)
LABEL_18:
    v23[2](v23, 2);
LABEL_19:
  v24 = (void *)objc_msgSend(v21, "copy");

  v25 = *(void **)(a1 + 32);
  v26 = v8;
  v27 = v24;
  v28 = v25;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, aBlock, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v34 = objc_msgSend(v33, "integerValue");
        objc_msgSend(v27, "objectForKey:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v36 = v35;
        else
          v36 = 0;
        v40 = 0;
        v37 = v36;
        v38 = CleanupActionsForCredentialPair(v26, v37, v34, &v40);
        v39 = v40;
        objc_msgSend(v28, "addCleanupActions:cleanupReason:forDeviceCredential:passCredential:", v38, v39, v37, v26);

      }
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, aBlock, 16);
    }
    while (v30);
  }

}

void __CheckConsistencyWithDeviceState_block_invoke_186(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __CheckConsistencyWithDeviceState_block_invoke_2;
  v3[3] = &unk_1E2AD8AF0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __CheckConsistencyWithDeviceState_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAddCleanupActionsToResultsSummary:", objc_msgSend(v4, "credentialType") != 133);
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  v10 = 0;
  v8 = CleanupActionsForCredentialPair(0, v6, objc_msgSend(v6, "type"), &v10);
  v9 = v10;
  objc_msgSend(v7, "addCleanupActions:cleanupReason:forDeviceCredential:passCredential:", v8, v9, v6, 0);

}

@end
