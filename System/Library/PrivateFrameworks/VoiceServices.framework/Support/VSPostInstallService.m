@implementation VSPostInstallService

- (void)registerPostInstallActivity
{
  void *v2;
  _QWORD handler[5];

  v2 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __51__VSPostInstallService_registerPostInstallActivity__block_invoke;
  handler[3] = &unk_24DD8E508;
  handler[4] = self;
  xpc_activity_register("com.apple.voiced.postInstall", v2, handler);
}

- (void)resetMobileAssetDefaults
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableMobileAssetURLReset");

  VSGetLogEvent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEFAULT, "Defaults disables reset, skip resetting MobileAsset default URL", buf, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEFAULT, "Resetting MobileAsset default URL", v6, 2u);
    }

    MEMORY[0x2207508B8](CFSTR("com.apple.MobileAsset.VoiceServicesVocalizerVoice"), 0);
    MEMORY[0x2207508B8](CFSTR("com.apple.MobileAsset.VoiceServices.CustomVoice"), 0);
    MEMORY[0x2207508B8](CFSTR("com.apple.MobileAsset.VoiceServices.GryphonVoice"), 0);
    MEMORY[0x2207508B8](CFSTR("com.apple.MobileAsset.VoiceServices.VoiceResources"), 0);
    ASSetAssetServerURLForAssetType();
    ASSetAssetServerURLForAssetType();
    ASSetAssetServerURLForAssetType();
    ASSetAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
    ASSetDefaultAssetServerURLForAssetType();
  }
}

- (void)clearSynthesisCache
{
  id v2;

  +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteCache");

}

void __51__VSPostInstallService_registerPostInstallActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  int v5;
  xpc_object_t v6;
  NSObject *v7;
  uint64_t v8;
  _xpc_activity_s *v9;
  void (**v10)(_QWORD);
  void *v11;
  _xpc_activity_s *v12;
  VSDownloadService *v13;
  VSDownloadService *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL (*v23)(uint64_t, _BYTE *, float);
  void *v24;
  _xpc_activity_s *v25;
  _QWORD v26[4];
  _xpc_activity_s *v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    v5 = state;
    if (state)
    {
      VSGetLogEvent();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v29 = v5;
        _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected xpc activity state %d for 'com.apple.voiced.postInstall'", buf, 8u);
      }
    }
    else
    {
      v6 = xpc_activity_copy_criteria(v3);
      if (v6)
      {

        goto LABEL_17;
      }
      v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x24BDAC680], 1);
      xpc_activity_set_criteria(v3, v15);
      VSGetLogEvent();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_DEFAULT, "Registered xpc activity com.apple.voiced.postInstall", buf, 2u);
      }

    }
    goto LABEL_17;
  }
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_DEFAULT, "Running activity com.apple.voiced.postInstall", buf, 2u);
  }

  v8 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __51__VSPostInstallService_registerPostInstallActivity__block_invoke_182;
  v26[3] = &unk_24DD8EBB0;
  v9 = v3;
  v27 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x220750D8C](v26);
  objc_msgSend(*(id *)(a1 + 32), "resetMobileAssetDefaults");
  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v8;
  v22 = 3221225472;
  v23 = __51__VSPostInstallService_registerPostInstallActivity__block_invoke_184;
  v24 = &unk_24DD8E4C0;
  v12 = v9;
  v25 = v12;
  LOBYTE(v8) = objc_msgSend(v11, "migrateAssetsWithProgress:", &v21);

  if ((v8 & 1) != 0
    || (v13 = [VSDownloadService alloc],
        v14 = -[VSDownloadService initWithType:](v13, "initWithType:", 2, v21, v22, v23, v24),
        -[VSDownloadService updateVoicesAndVoiceResources](v14, "updateVoicesAndVoiceResources"),
        v14,
        xpc_activity_should_defer(v12)))
  {
    v10[2](v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clearSynthesisCache");
    if (objc_msgSend(MEMORY[0x24BEC0DA8], "isANECompilationPlatform")
      && (objc_msgSend(MEMORY[0x24BEC0E18], "isWatch") & 1) == 0)
    {
      VSGetLogDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA84000, v17, OS_LOG_TYPE_DEFAULT, "Re-triggering neural compiling afer OS upgrade.", buf, 2u);
      }

      dispatch_get_global_queue(9, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v18, &__block_literal_global_882);

    }
    VSGetLogEvent();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v19, OS_LOG_TYPE_DEFAULT, "Migration service finished.", buf, 2u);
    }

    if (!xpc_activity_set_state(v12, 5))
    {
      VSGetLogDefault();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v20, OS_LOG_TYPE_ERROR, "xpc activity com.apple.voiced.postInstall, failed to set state to done.", buf, 2u);
      }

    }
  }

LABEL_17:
}

void __51__VSPostInstallService_registerPostInstallActivity__block_invoke_182(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21AA84000, v2, OS_LOG_TYPE_ERROR, "com.apple.voiced.postInstall is requested to be deferred.", buf, 2u);
  }

  if (xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_21AA84000, v3, OS_LOG_TYPE_ERROR, "Unable to set defer state for com.apple.voiced.postInstall", v4, 2u);
    }

  }
}

BOOL __51__VSPostInstallService_registerPostInstallActivity__block_invoke_184(uint64_t a1, _BYTE *a2, float a3)
{
  NSObject *v6;
  _BOOL8 result;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, "Assets migration progress: %f", (uint8_t *)&v8, 0xCu);
  }

  result = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (result)
    *a2 = 1;
  return result;
}

uint64_t __51__VSPostInstallService_registerPostInstallActivity__block_invoke_189()
{
  return +[VSDownloadService triggerNeuralCompiling](VSDownloadService, "triggerNeuralCompiling");
}

@end
