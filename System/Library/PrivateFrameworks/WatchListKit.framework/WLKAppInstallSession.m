@implementation WLKAppInstallSession

void __53___WLKAppInstallSession_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 40), "installProgress");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fractionCompleted");
    (*(void (**)(uint64_t))(v1 + 16))(v1);

  }
}

void __54___WLKAppInstallSession_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 40), "installProgress");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fractionCompleted");
    (*(void (**)(uint64_t))(v1 + 16))(v1);

  }
}

void __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v8, "appAdamIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Installing app for installable: %@, adam IDs: %@"), v8, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "appAdamIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD **)(a1 + 32);
  v13 = (void *)v12[5];
  if (v13)
  {
    objc_msgSend(v13, "buyParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_doPurchaseWithAppAdamID:offerBuyParams:", v11, v14);

  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CFDB48]);
    objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.tv.videosui"), CFSTR("1"), v16);

    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setItemIdentifiers:", v18);

    objc_msgSend(v17, "perform");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke_2;
    v20[3] = &unk_1E68A8F10;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v11;
    objc_msgSend(v19, "addFinishBlock:", v20);

  }
}

void __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  WLKAMSMediaProxy *v7;
  void *v8;
  WLKAMSMediaProxy *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    NSLog(CFSTR("WLKAppInstaller - failed to lookup item: %@"), v5);
    objc_msgSend(*(id *)(a1 + 32), "_sendCompletionWithError:", v6);
  }
  v7 = [WLKAMSMediaProxy alloc];
  objc_msgSend(v17, "responseDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WLKAMSMediaProxy initWithDictionary:](v7, "initWithDictionary:", v8);

  -[WLKAMSMediaProxy buyParameters](v9, "buyParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    NSLog(CFSTR("WLKAppInstaller - Lookup succeeded."));
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    -[WLKAMSMediaProxy buyParameters](v9, "buyParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_doPurchaseWithAppAdamID:offerBuyParams:", v13, v15);

  }
  else
  {
    NSLog(CFSTR("WLKAppInstaller - Lookup response did not contain default offer"));
    v16 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKAppInstallerErrorDomain"), -1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_sendCompletionWithError:", v14);
  }

}

void __65___WLKAppInstallSession__doPurchaseWithAppAdamID_offerBuyParams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    NSLog(CFSTR("Redownload failed for adam ID '%@': %@"), *(_QWORD *)(a1 + 32), v6);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB3388];
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("WLKAppInstallerErrorDomain"), -1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_sendCompletionWithError:", v10);
  }
  else
  {
    if (!objc_msgSend(v5, "success"))
    {
      NSLog(CFSTR("Redownload cancelled for adam ID '%@'"), *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_sendCompletionWithError:", 0);
      goto LABEL_4;
    }
    objc_msgSend(v5, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v5, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && (objc_msgSend(v10, "success") & 1) == 0)
      {
        objc_msgSend(v10, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKAppInstallerErrorDomain"), -1, 0);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

        NSLog(CFSTR("Redownload failed for adam ID '%@': %@"), *(_QWORD *)(a1 + 32), v16);
        objc_msgSend(*(id *)(a1 + 40), "_sendCompletionWithError:", v16);

        goto LABEL_3;
      }
    }
    else
    {

      v10 = 0;
    }
    NSLog(CFSTR("Redownload completed for adam ID '%@'"), *(_QWORD *)(a1 + 32));
  }
LABEL_3:

LABEL_4:
}

void __50___WLKAppInstallSession__sendCompletionWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = (void *)MEMORY[0x1B5E47FF4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  if (v2)
  {
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50___WLKAppInstallSession__sendCompletionWithError___block_invoke_2;
    v8[3] = &unk_1E68A8930;
    v10 = v2;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v3, v8);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = 0;

}

uint64_t __50___WLKAppInstallSession__sendCompletionWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
