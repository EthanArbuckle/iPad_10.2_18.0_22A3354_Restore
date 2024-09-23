@implementation MSUUpdateBrainAssetLoader(SUCoreBorderMSUUpdateBrainAssetLoader)

- (void)SUCoreBorder_loadUpdateBrainWithMAOptions:()SUCoreBorderMSUUpdateBrainAssetLoader clientOptionsFromPolicy:progressHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _SUCoreBorder_MSUFunctionAtBegin(CFSTR("loadUpdateBrainWithMAOptions"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "simAction");
    if (v13 == 3)
    {
      v32 = *MEMORY[0x1E0D4DF90];
      v33[0] = *MEMORY[0x1E0D4DF68];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13 == 1)
      {
        objc_msgSend(v12, "buildErrorWithDescription:", CFSTR("SUCoreError created by SUCoreBorder_loadUpdateBrainWithMAOptions"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        if (!v10)
          goto LABEL_5;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported simulated event action, event: %@"), v12);
      objc_msgSend(v18, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreBorder_loadUpdateBrainWithMAOptions"), v19, 8113, 0);

      v15 = 0;
    }
    v14 = 0;
    if (!v10)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "oslog");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@", buf, 0x16u);
      }
      goto LABEL_12;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "completionQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_253;
    block[3] = &unk_1EA877E80;
    v25 = v10;
    v23 = v15;
    v24 = v14;
    dispatch_async(v21, block);

    v17 = v25;
LABEL_12:

    goto LABEL_13;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke;
  v26[3] = &unk_1EA877EA8;
  v27 = v10;
  objc_msgSend(a1, "loadUpdateBrainWithMAOptions:clientOptionsFromPolicy:progressHandler:", v8, v9, v26);
  v15 = v27;
LABEL_13:

}

@end
