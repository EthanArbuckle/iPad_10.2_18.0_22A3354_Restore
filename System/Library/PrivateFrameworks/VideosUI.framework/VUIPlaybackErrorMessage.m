@implementation VUIPlaybackErrorMessage

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_28 != -1)
    dispatch_once(&sharedInstance_onceToken_28, &__block_literal_global_130);
  return (id)sharedInstance_sharedInstance_10;
}

void __41__VUIPlaybackErrorMessage_sharedInstance__block_invoke()
{
  VUIPlaybackErrorMessage *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPlaybackErrorMessage);
  v1 = (void *)sharedInstance_sharedInstance_10;
  sharedInstance_sharedInstance_10 = (uint64_t)v0;

}

- (void)getLocalizedErrorMessageFor:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VUIPlaybackErrorMessage _getLanguageCode](self, "_getLanguageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackErrorMessage _getSessionInfoFor:](self, "_getSessionInfoFor:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D831A8]), "initWithAppTarget:locale:", 0, v11);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D831B0]), "initWithConfig:logger:metricsRecorder:defaultAlert:", v13, &__block_literal_global_17_1, &__block_literal_global_21_0, &__block_literal_global_24_0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_3;
  v16[3] = &unk_1E9FA2730;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "fetchLocalizedErrorMessageForItems:usingError:completionHandler:", v12, v9, v16);

}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!a2)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "VUIPlaybackErrorMessage [%@] - emitting message:%@", (uint8_t *)&v7, 0x16u);

    }
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_cold_1((uint64_t)v4, v5);
LABEL_7:

  }
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordDialog:", v2);

}

id __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0D831A0]);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:", CFSTR("AV_PLAYBACK_ERROR"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "initWithTitle:body:", &stru_1E9FF3598, v2);

  return v3;
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_4;
  v6[3] = &unk_1E9F99420;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (id)_getLanguageCode
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("AppleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_getSessionInfoFor:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (v4)
  {
    v6 = objc_msgSend(v4, "hasTrait:", *MEMORY[0x1E0DB1D60]);
    v7 = CFSTR("VOD");
    if (v6)
      v7 = CFSTR("LIVE");
    v8 = v7;
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("contentType"));

    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "vui_stringForKey:", CFSTR("MediaIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
      {
        v24 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("mediaIdentifier"));

      }
    }
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v23 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("brandId"));

    }
    -[VUIPlaybackErrorMessage _getLanguageCode](self, "_getLanguageCode");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v22 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("locale"));

    }
  }

  return v5;
}

void __76__VUIPlaybackErrorMessage_getLocalizedErrorMessageFor_withError_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIPlaybackErrorMessage [%@] - emitting message:%@", (uint8_t *)&v5, 0x16u);

}

@end
