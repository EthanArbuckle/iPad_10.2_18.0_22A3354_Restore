@implementation TPSCloudMusicCatalogPlaybackValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v5 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentity:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBFF8]), "initWithStoreRequestContext:", v7);
  objc_msgSend(v8, "setShouldReturnLastKnownStatusOnly:", 1);
  objc_msgSend(MEMORY[0x1E0DDBFE8], "sharedStatusController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__TPSCloudMusicCatalogPlaybackValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1EA1E12B0;
  v13 = v14;
  v11[4] = self;
  v10 = v4;
  v12 = v10;
  objc_msgSend(v9, "performSubscriptionStatusRequest:withCompletionHandler:", v8, v11);

  _Block_object_dispose(v14, 8);
}

void __65__TPSCloudMusicCatalogPlaybackValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend(v5, "subscriptionStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "statusType") == 1;

  }
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v9 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v8 == v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
