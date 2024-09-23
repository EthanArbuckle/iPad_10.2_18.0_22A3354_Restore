@implementation VUIHomeSharingMediaItem

void __41__VUIHomeSharingMediaItem_iOS_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIHomeSharingMediaItem_iOS");
  v1 = (void *)sLogObject_11;
  sLogObject_11 = (uint64_t)v0;

}

void __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (!v10)
      goto LABEL_8;
    v11 = *(void (**)(void))(v10 + 16);
LABEL_7:
    v11();
    goto LABEL_8;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "needsKeyBagSyncPriorToPlayback"))
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "setNeedsKeyBagSyncPriorToPlayback:", 0);
  objc_msgSend(*(id *)(a1 + 32), "ml3Track");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51058]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "loadingContext");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2;
  v12[3] = &unk_1E9F9F328;
  objc_copyWeak(v14, &location);
  v14[1] = v8;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v9, "_fetchKeybagForDSID:isFamilyAccount:completion:", v7, 0, v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

LABEL_8:
}

void __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "ml3Track");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D510C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && objc_msgSend(v4, "unsignedLongLongValue")
    && (objc_msgSend(WeakRetained, "_loadingCancelled:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_3;
    v5[3] = &unk_1E9F98E68;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_fetchKeybagForDSID:isFamilyAccount:completion:", v4, 1, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke()
{
  return TVPPerformBlockOnMainThreadIfNeeded();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v3 = a2;
  v4 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Token request complete", buf, 2u);
  }
  objc_msgSend(v3, "tokenData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", *(_QWORD *)(a1 + 32));

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v23 = 0;
      v10 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v23);
      v11 = v23;

      if ((v10 & 1) == 0)
      {
        v12 = sLogObject_11;
        if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
          __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_2((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF498]), "initWithAuthorizationToken:accountIdentifier:", v5, *(_QWORD *)(a1 + 40));
    objc_msgSend(v19, "setKeybagPath:", *(_QWORD *)(a1 + 32));
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v19, "setReason:", CFSTR("family"));
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35;
    v20[3] = &unk_1E9F9F350;
    v21 = *(id *)(a1 + 32);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v19, "startWithAuthorizationResponseBlock:", v20);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
      __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[12];
  int v31;
  uint8_t buf[8];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Authorization request complete", buf, 2u);
  }
  objc_msgSend(v5, "bodyData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("keybag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      *(_QWORD *)buf = 0;
      v33 = 0;
      v34 = 0;
      if (SSVFairPlayGetHardwareInfo())
      {
        v31 = 0;
        v11 = XtCqEf5X(0, (uint64_t)buf, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), (uint64_t)&v31);
        if ((_DWORD)v11)
        {
          v12 = v11;
          v13 = sLogObject_11;
          if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
            __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_4(v12, v13, v14, v15, v16, v17, v18, v19);
        }
        else
        {
          v20 = objc_retainAutorelease(v10);
          objc_msgSend(v20, "bytes");
          objc_msgSend(v20, "length");
          lCUad();
          v22 = sLogObject_11;
          if ((_DWORD)v21)
          {
            v23 = v21;
            if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
              __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_3(v23, v22, v24, v25, v26, v27, v28, v29);
          }
          else if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Successfully imported key bag", v30, 2u);
          }
          VLxCLgDpiF(v31);
        }
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
      {
        __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_5();
      }
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
    {
      __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_2();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
      __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Token data has zero length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "Unable to create keybag directory: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_9();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Store auth request response has zero length body data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Store auth request response has no keybag entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "Unable to import keybag %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_9();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "FP context could not be created %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_9();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_35_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "FP hardware info is unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

@end
