@implementation MSUUpdateBrainAssetLoader

void __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  NSObject *v24;
  _QWORD block[4];
  NSObject *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  NSObject *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _SUCoreBorder_MSUFunctionAtEnd(CFSTR("loadUpdateBrainWithMAOptions"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "simAction");
    if (v9 == 3)
    {
      v29 = *MEMORY[0x1E0D4DF90];
      v30 = *MEMORY[0x1E0D4DF68];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == 1)
      {
        objc_msgSend(v8, "buildErrorWithDescription:", CFSTR("SUCoreError created by SUCoreBorder_loadUpdateBrainWithMAOptions"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
LABEL_10:
        if (*(_QWORD *)(a1 + 32))
        {
          objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "completionQueue");
          v17 = objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_251;
          v21[3] = &unk_1EA877E80;
          v24 = *(id *)(a1 + 32);
          v22 = v11;
          v23 = v10;
          dispatch_async(v17, v21);

          v18 = v24;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "oslog");
          v18 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v32 = v11;
            v33 = 2114;
            v34 = v10;
            _os_log_impl(&dword_1DDFDD000, v18, OS_LOG_TYPE_DEFAULT, "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@", buf, 0x16u);
          }
        }

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v8);
      objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_loadUpdateBrainWithMAOptions"), v15, 8113, 0);

      v11 = 0;
    }
    v10 = 0;
    goto LABEL_10;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completionQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_2;
    block[3] = &unk_1EA877E80;
    v28 = *(id *)(a1 + 32);
    v26 = v5;
    v27 = v6;
    dispatch_async(v13, block);

    v11 = v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v5;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@", buf, 0x16u);
    }
  }
LABEL_15:

}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_251(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_253(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
