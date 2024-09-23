@implementation VUIPreflightManager

+ (id)defaultPreflightManager
{
  if (defaultPreflightManager_onceToken != -1)
    dispatch_once(&defaultPreflightManager_onceToken, &__block_literal_global_90);
  return (id)defaultPreflightManager_defaultPreflightManager;
}

void __46__VUIPreflightManager_defaultPreflightManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultPreflightManager_defaultPreflightManager;
  defaultPreflightManager_defaultPreflightManager = v0;

}

- (VUIPreflightManager)init
{
  VUIPreflightManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIPreflightManager;
  result = -[VUIPreflightManager init](&v3, sel_init);
  if (result)
  {
    result->_restrictionsCheckType = 0;
    result->_contentAllowsCellularDownload = 1;
  }
  return result;
}

- (void)setVideosPlayable:(id)a3
{
  VUIVideosPlayable *v5;
  TVPMediaItem *mediaItem;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = (VUIVideosPlayable *)a3;
  if (self->_videosPlayable != v5)
  {
    objc_storeStrong((id *)&self->_videosPlayable, a3);
    mediaItem = self->_mediaItem;
    self->_mediaItem = 0;

    if (v5)
    {
      -[VUIVideosPlayable metadata](v5, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        VUIDefaultLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[VUIPreflightManager setVideosPlayable:].cold.1(v5, v8);

      }
      if (sFrequencyOfConfirmation == -1)
      {
        -[VUIVideosPlayable frequencyOfAgeConfirmation](v5, "frequencyOfAgeConfirmation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          sFrequencyOfConfirmation = objc_msgSend(v9, "integerValue");

      }
    }
  }

}

- (void)setMediaItem:(id)a3
{
  TVPMediaItem *v5;
  VUIVideosPlayable *videosPlayable;
  void *v7;
  void *v8;
  TVPMediaItem *v9;

  v5 = (TVPMediaItem *)a3;
  if (self->_mediaItem != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_mediaItem, a3);
    videosPlayable = self->_videosPlayable;
    self->_videosPlayable = 0;

    v5 = v9;
    if (v9)
    {
      if (sFrequencyOfConfirmation == -1)
      {
        -[TVPMediaItem mediaItemMetadataForProperty:](v9, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AF0]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          sFrequencyOfConfirmation = objc_msgSend(v7, "integerValue");

        v5 = v9;
      }
    }
  }

}

- (void)preflightWithOptions:(int64_t)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[VUIPreflightManager presentingController](self, "presentingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VUIPreflightManager _preflightWithOptions:userInfo:completion:](self, "_preflightWithOptions:userInfo:completion:", a3, 0, v7);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)setRestrictionsState:(int64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;

  if (a3 == 2)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to VUIRestrictionsStateWaitingForUIDismissal";
      v7 = (uint8_t *)&v9;
      goto LABEL_12;
    }
  }
  else if (a3 == 1)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to VUIRestrictionsStatePerformingValidation";
      v7 = (uint8_t *)&v10;
      goto LABEL_12;
    }
  }
  else if (a3)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to unknown value";
      v7 = (uint8_t *)&v8;
      goto LABEL_12;
    }
  }
  else
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to VUIRestrictionsStateIdle";
      v7 = (uint8_t *)&v11;
LABEL_12:
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }

  self->_restrictionsState = a3;
}

- (void)_preflightWithOptions:(int64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id location;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int64_t v41;

  v8 = a4;
  v9 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = a3;
  objc_initWeak(&location, self);
  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke;
  aBlock[3] = &unk_1E9F9F8B8;
  objc_copyWeak(&v36, &location);
  v11 = v9;
  v35 = v11;
  v12 = v8;
  v34 = v12;
  v13 = _Block_copy(aBlock);
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_10;
  v27[3] = &unk_1E9F9F8E0;
  objc_copyWeak(&v32, &location);
  v31 = &v38;
  v14 = v13;
  v29 = v14;
  v15 = v12;
  v28 = v15;
  v16 = v11;
  v30 = v16;
  v17 = _Block_copy(v27);
  v18 = v17;
  v19 = v39[3];
  if ((v19 & 1) != 0)
  {
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_2;
    v26[3] = &unk_1E9F98E18;
    v21 = v26;
    v26[4] = v17;
    -[VUIPreflightManager _performRestrictionsCheckWithCompletion:](self, "_performRestrictionsCheckWithCompletion:", v26);
LABEL_9:
    v20 = (id *)(v21 + 4);
    goto LABEL_10;
  }
  if ((v19 & 2) != 0)
  {
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_3;
    v25[3] = &unk_1E9F98E18;
    v21 = v25;
    v25[4] = v17;
    -[VUIPreflightManager _performAgeGateVerificationWithCompletion:](self, "_performAgeGateVerificationWithCompletion:", v25);
    goto LABEL_9;
  }
  if ((v19 & 8) != 0)
  {
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_4;
    v22[3] = &unk_1E9F9F908;
    v23 = v15;
    v24 = v18;
    -[VUIPreflightManager _preflightDownloadWithCompletion:](self, "_preflightDownloadWithCompletion:", v22);
    v20 = &v23;

LABEL_10:
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v38, 8);

}

void __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "savedRestrictionsCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::not resetting params to nil because they will be used for pending restrictions check", (uint8_t *)&v8, 2u);
    }

  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::setting params to nil", (uint8_t *)&v8, 2u);
    }

    objc_msgSend(WeakRetained, "setVideosPlayable:", 0);
    objc_msgSend(WeakRetained, "setMediaItem:", 0);
    objc_msgSend(WeakRetained, "setMediaEntity:", 0);
    objc_msgSend(WeakRetained, "setExtrasInfo:", 0);
    objc_msgSend(WeakRetained, "setContentRating:", 0);
    objc_msgSend(WeakRetained, "setIsSubscriptionPurchaseWithoutPlayback:", 0);
    objc_msgSend(WeakRetained, "setContentAllowsCellularDownload:", 1);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      VUIBoolLogString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::finished preflighting with result: %@", (uint8_t *)&v8, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_msgSend(WeakRetained, "setPresentingController:", 0);

}

void __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_10(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v7;
  void (*v8)(void);
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (!a2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_6:
    v8();
    goto LABEL_7;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) &= ~a3;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (!v7)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "_preflightWithOptions:userInfo:completion:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_7:

}

uint64_t __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, VUIPreflightCellularAllowedKey[0]);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, VUIPreflightDownloadQualityKey);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_logRatingsInfo:(id)a3 maxAllowedRank:(id)a4 ratingValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0DB1A30];
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DB1A30]))
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v28 = 138412290;
    v29 = v10;
LABEL_7:
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::restriction validation for domain : %@", (uint8_t *)&v28, 0xCu);
    goto LABEL_10;
  }
  v12 = *MEMORY[0x1E0DB1A38];
  v13 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DB1A38]);
  VUIDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v28 = 138412290;
    v29 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[VUIPreflightManager _logRatingsInfo:maxAllowedRank:ratingValue:].cold.1((uint64_t)v7, v11, v15);
LABEL_10:

  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v17)
      goto LABEL_16;
    v18 = objc_msgSend(v9, "integerValue");
    v28 = 134217984;
    v29 = v18;
    v19 = "VUIPreflightManager::restriction validation with value : %ld";
    v20 = v16;
    v21 = 12;
  }
  else
  {
    if (!v17)
      goto LABEL_16;
    LOWORD(v28) = 0;
    v19 = "VUIPreflightManager::no ratingValue for content";
    v20 = v16;
    v21 = 2;
  }
  _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, v21);
LABEL_16:

  VUIDefaultLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v23)
    {
      v24 = objc_msgSend(v8, "integerValue");
      v28 = 134217984;
      v29 = v24;
      v25 = "VUIPreflightManager::restriction validation max allowed rank : %ld";
      v26 = v22;
      v27 = 12;
LABEL_21:
      _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v28, v27);
    }
  }
  else if (v23)
  {
    LOWORD(v28) = 0;
    v25 = "VUIPreflightManager::Most permissive restriction";
    v26 = v22;
    v27 = 2;
    goto LABEL_21;
  }

}

- (id)_ratingDomain
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  -[VUIPreflightManager mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIPreflightManager mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A28]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v12 = v5;
    goto LABEL_21;
  }
  -[VUIPreflightManager videosPlayable](self, "videosPlayable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VUIPreflightManager videosPlayable](self, "videosPlayable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ratingDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "length"))
    {
      v12 = 0;
LABEL_21:

      return v12;
    }
    v9 = objc_msgSend(v4, "isEqualToString:", CFSTR("Show"));
    v10 = (id *)MEMORY[0x1E0DB1A38];
    if (!v9)
      v10 = (id *)MEMORY[0x1E0DB1A30];
    goto LABEL_19;
  }
  -[VUIPreflightManager extrasInfo](self, "extrasInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[VUIPreflightManager mediaEntity](self, "mediaEntity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      -[VUIPreflightManager contentRating](self, "contentRating");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
        return v12;
    }
    -[VUIPreflightManager mediaEntity](self, "mediaEntity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[VUIPreflightManager mediaEntity](self, "mediaEntity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentRating");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[VUIPreflightManager contentRating](self, "contentRating");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v16 = objc_msgSend(v4, "ratingSystemKind");
    v10 = (id *)MEMORY[0x1E0DB1A38];
    if (v16 != 2)
      v10 = (id *)MEMORY[0x1E0DB1A30];
LABEL_19:
    v5 = *v10;
    goto LABEL_20;
  }
  v12 = (id)*MEMORY[0x1E0DB1A30];
  return v12;
}

- (BOOL)_isTrailer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VUIPreflightManager mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIPreflightManager mediaItem](self, "mediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v5) = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DC8]);
LABEL_5:

    return (char)v5;
  }
  -[VUIPreflightManager videosPlayable](self, "videosPlayable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIPreflightManager videosPlayable](self, "videosPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("Trailer"));

    goto LABEL_5;
  }
  return (char)v5;
}

- (BOOL)_isSportingEvent
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;

  -[VUIPreflightManager mediaItem](self, "mediaItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VUIPreflightManager mediaItem](self, "mediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[VUIPreflightManager mediaItem](self, "mediaItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v7, "isSportingEvent");
LABEL_6:

      return (char)v8;
    }
  }
  -[VUIPreflightManager videosPlayable](self, "videosPlayable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VUIPreflightManager videosPlayable](self, "videosPlayable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", CFSTR("SportingEvent"));

    goto LABEL_6;
  }
  return (char)v8;
}

- (id)_ratingValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[VUIPreflightManager mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIPreflightManager mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A40]);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIPreflightManager videosPlayable](self, "videosPlayable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIPreflightManager videosPlayable](self, "videosPlayable");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ratingValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    -[VUIPreflightManager extrasInfo](self, "extrasInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VUIPreflightManager extrasInfo](self, "extrasInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentRating");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VUIPreflightManager mediaEntity](self, "mediaEntity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

      }
      else
      {
        -[VUIPreflightManager contentRating](self, "contentRating");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
          return v6;
      }
      -[VUIPreflightManager mediaEntity](self, "mediaEntity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[VUIPreflightManager mediaEntity](self, "mediaEntity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentRating");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[VUIPreflightManager contentRating](self, "contentRating");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v4, "rank"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = (void *)v5;
LABEL_6:

  return v6;
}

- (void)_performRestrictionsCheckWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t))a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::will perform restrictions check", buf, 2u);
  }

  if (v4)
  {
    if (-[VUIPreflightManager _isSportingEvent](self, "_isSportingEvent"))
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::isSportingEvent – skipping validation", v8, 2u);
      }

    }
    else if (!-[VUIPreflightManager _isAllowedToPlayOrPurchase](self, "_isAllowedToPlayOrPurchase"))
    {
      -[VUIPreflightManager _ratingDomain](self, "_ratingDomain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPreflightManager _showRestrictionsAlertForRatingDomain:completion:](self, "_showRestrictionsAlertForRatingDomain:completion:", v7, v4);

      goto LABEL_11;
    }
    v4[2](v4, 1);
  }
LABEL_11:

}

- (void)_showRestrictionsAlertForRatingDomain:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::media is not allowed by restrictions, showing alert.", buf, 2u);
  }

  if (-[VUIPreflightManager _isTrailer](self, "_isTrailer"))
  {
    v9 = CFSTR("TRANSACTION_RESTRICTED_TRAILER");
  }
  else
  {
    v9 = CFSTR("TRANSACTION_RESTRICTED_MOVIE");
    if (objc_msgSend(v6, "length") && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DB1A38]))
      v9 = CFSTR("TRANSACTION_RESTRICTED_TVSHOW");
  }
  if (-[VUIPreflightManager restrictionsCheckType](self, "restrictionsCheckType") == 1)
  {
    v9 = CFSTR("DOWNLOAD_RESTRICTED_TVSHOW");
    if (objc_msgSend(v6, "length"))
    {
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DB1A30]))
        v9 = CFSTR("DOWNLOAD_RESTRICTED_MOVIE");
    }
  }
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", 0, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:", CFSTR("SETTINGS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke;
  v25[3] = &unk_1E9F9F930;
  v16 = v7;
  v26 = v16;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v14, 0, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vui_addAction:", v17);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:", CFSTR("OK"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke_2;
  v23[3] = &unk_1E9F9F930;
  v24 = v16;
  v20 = v16;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v19, 0, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vui_addAction:", v21);

  -[VUIPreflightManager presentingController](self, "presentingController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vui_presentAlertFromPresentingController:animated:completion:", v22, 1, 0);

}

void __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v4, 0);

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

}

uint64_t __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (BOOL)_isAllowedToPlayOrPurchase
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v22;
  BOOL v23;

  -[VUIPreflightManager _ratingDomain](self, "_ratingDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPreflightManager _ratingValue](self, "_ratingValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DB1A30]))
    {
      +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "maxMovieRank");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DB1A38]))
    {
      +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "maxTVShowRank");
      v18 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v18;
    }
    -[VUIPreflightManager _logRatingsInfo:maxAllowedRank:ratingValue:](self, "_logRatingsInfo:maxAllowedRank:ratingValue:", v3, v6, v4);
    v19 = objc_msgSend(v4, "integerValue");
    v20 = objc_msgSend(v6, "integerValue");
    v22 = v19 > 0 && v20 >= v19;
    if (v4)
      v23 = v22;
    else
      v23 = 0;
    if (v6)
      v15 = v6;
    else
      v15 = 0;
    if (v6)
      v16 = v23;
    else
      v16 = 1;
  }
  else
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VUIPreflightManager _isAllowedToPlayOrPurchase].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
    v16 = 1;
  }

  return v16;
}

- (int64_t)_requiredAgeForPlayback
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[VUIPreflightManager mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIPreflightManager mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C10]);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIPreflightManager videosPlayable](self, "videosPlayable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return -1;
    -[VUIPreflightManager videosPlayable](self, "videosPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requiredAgeForPlayback");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");

    return v8;
  }
  return -1;
}

- (void)_performAgeGateVerificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id buf[2];

  v4 = a3;
  +[VUIAgeVerification sharedInstance](VUIAgeVerification, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAgeVerificationEnabled");

  if (v6)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager:: isAgeVerificationEnabled=YES. Calling VUIAgeVerification", (uint8_t *)buf, 2u);
    }

    +[VUIAgeVerification sharedInstance](VUIAgeVerification, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPreflightManager _ratingValue](self, "_ratingValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPreflightManager _ratingDomain](self, "_ratingDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performAgeGateVerificationWithRatingValue:ratingDomain:completion:", v9, v10, v4);

  }
  else if (-[VUIPreflightManager _shouldShowAgeConfirmationAlert](self, "_shouldShowAgeConfirmationAlert"))
  {
    objc_initWeak(buf, self);
    -[VUIPreflightManager presentingController](self, "presentingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__VUIPreflightManager__performAgeGateVerificationWithCompletion___block_invoke;
    v12[3] = &unk_1E9F99650;
    objc_copyWeak(&v14, buf);
    v13 = v4;
    -[VUIPreflightManager _showAgeConfirmationWithPresentingViewController:completion:](self, "_showAgeConfirmationWithPresentingViewController:completion:", v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __65__VUIPreflightManager__performAgeGateVerificationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((_DWORD)a2)
  {
    v4 = objc_msgSend(WeakRetained, "_requiredAgeForPlayback");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setLastAgeConfirmationPrompted:", v5);

    objc_msgSend(WeakRetained, "_setLastConfirmedAge:", v4);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);

}

- (int64_t)_lastConfirmedAge
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("lastConfirmedAge"));

  return v3;
}

- (void)_setLastConfirmedAge:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("lastConfirmedAge"));

}

- (id)_lastAgeConfirmationPrompted
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ageConfirmationLastPrompted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setLastAgeConfirmationPrompted:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("ageConfirmationLastPrompted"));

}

- (BOOL)_shouldShowAgeConfirmationAlert
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v10;

  if (-[VUIPreflightManager _isTrailer](self, "_isTrailer"))
    return 0;
  v3 = -[VUIPreflightManager _requiredAgeForPlayback](self, "_requiredAgeForPlayback");
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = -[VUIPreflightManager _lastConfirmedAge](self, "_lastConfirmedAge");
  -[VUIPreflightManager _lastAgeConfirmationPrompted](self, "_lastAgeConfirmationPrompted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  if (v6)
    v10 = sFrequencyOfConfirmation < (uint64_t)(v8 / 60.0) || v4 > v5;
  else
    v10 = 1;

  return v10;
}

- (void)_showAgeConfirmationWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v5 = a4;
  v6 = -[VUIPreflightManager _requiredAgeForPlayback](self, "_requiredAgeForPlayback");
  v7 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("AGE_GATE_CONFIRMATION_MESSAGE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%d %d"), 0, v6, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", 0, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:", CFSTR("YES"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke;
  v24[3] = &unk_1E9F9F930;
  v15 = v5;
  v25 = v15;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v13, 0, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_addAction:", v16);

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:", CFSTR("NO"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke_2;
  v22[3] = &unk_1E9F9F930;
  v23 = v15;
  v19 = v15;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v18, 1, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_addAction:", v20);

  -[VUIPreflightManager presentingController](self, "presentingController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vui_presentAlertFromPresentingController:animated:completion:", v21, 1, 0);

}

uint64_t __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_preflightDownloadWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  _QWORD v8[4];
  void (**v9)(_QWORD);
  id v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke;
  aBlock[3] = &unk_1E9F9A060;
  objc_copyWeak(&v13, &location);
  v6 = v4;
  v12 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
  {
    v7[2](v7);
  }
  else
  {
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_78;
    v8[3] = &unk_1E9F9F958;
    v9 = v7;
    v10 = v6;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:withCompletionHandler:](VUIAuthenticationManager, "requestAuthenticationAlwaysPrompt:withCompletionHandler:", 1, v8);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "networkType");

  if (ICEnvironmentNetworkTypeIsCellular())
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Network type is cellular", buf, 2u);
    }

    if (objc_msgSend(WeakRetained, "contentAllowsCellularDownload"))
    {
      +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "cellularDataDownloadEnabled");

      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 32);
        +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, 1, 1, objc_msgSend(v9, "preferredCellularDownloadQuality"));
      }
      else
      {
        v41 = MGGetBoolAnswer();
        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("ASK_TO_USE_CELLULAR_DATA_FOR_DOWNLOADS_MESSAGE_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v41)
          v45 = CFSTR("ASK_TO_USE_CELLULAR_DATA_FOR_DOWNLOADS_MESSAGE_WLAN");
        else
          v45 = CFSTR("ASK_TO_USE_CELLULAR_DATA_FOR_DOWNLOADS_MESSAGE_WIFI");
        objc_msgSend(v43, "localizedStringForKey:value:table:", v45, 0, CFSTR("VideosUIEmbedded"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("ALWAYS_USE_CELLULAR_DATA_FOR_DOWNLOADS_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("USE_CELLULAR_DATA_JUST_FOR_THIS_DOWNLOAD_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("DONT_USE_CELLULAR_DATA_FOR_DOWNLOADS_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = MEMORY[0x1E0C809B0];
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_67;
        v71[3] = &unk_1E9F9F930;
        v72 = *(id *)(a1 + 32);
        +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v63, 0, v71);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v49;
        v69[1] = 3221225472;
        v69[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_2;
        v69[3] = &unk_1E9F9F930;
        v70 = *(id *)(a1 + 32);
        +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v62, 0, v69);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v49;
        v67[1] = 3221225472;
        v67[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_3;
        v67[3] = &unk_1E9F9F930;
        v68 = *(id *)(a1 + 32);
        +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v61, 0, v67);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v9, v64, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "vui_addAction:isPreferred:", v50, 1);
        objc_msgSend(v53, "vui_addAction:", v51);
        objc_msgSend(v53, "vui_addAction:", v52);
        objc_msgSend(WeakRetained, "presentingController");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "vui_presentAlertFromPresentingController:animated:completion:", v54, 1, 0);

      }
    }
    else
    {
      VUIDefaultLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);

      v27 = MGGetBoolAnswer();
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if ((v27 & 1) != 0)
      {
        objc_msgSend(v28, "localizedStringForKey:", CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_TITLE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_MESSAGE");
      }
      else
      {
        objc_msgSend(v28, "localizedStringForKey:", CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_TITLE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v32 = CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_MESSAGE");
      }
      objc_msgSend(v30, "localizedStringForKey:", v32);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v9, v55, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localizedStringForKey:", CFSTR("OK"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_76;
      v65[3] = &unk_1E9F9F930;
      v66 = *(id *)(a1 + 32);
      +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v58, 0, v65);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "vui_addAction:", v59);
      objc_msgSend(WeakRetained, "presentingController");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "vui_presentAlertFromPresentingController:animated:completion:", v60, 1, 0);

    }
  }
  else
  {
    VUIDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v4)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Network type is non-cellular", buf, 2u);
      }

      +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "cellularDataDownloadEnabled");

      if ((_DWORD)v13)
      {
        +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "preferredWifiDownloadQuality");

        +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "preferredCellularDownloadQuality");

        if (v15 == v17 || (v13 = 0, v15 == 1) && !v17)
          v13 = 1;
      }
      v18 = *(_QWORD *)(a1 + 32);
      +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, 1, v13, objc_msgSend(v9, "preferredWifiDownloadQuality"));
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_2(v11, v33, v34, v35, v36, v37, v38, v39);

      v40 = *(_QWORD *)(a1 + 32);
      +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v40 + 16))(v40, 0, 0, objc_msgSend(v9, "preferredWifiDownloadQuality"));
    }
  }

}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_67(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCellularDataDownloadEnabled:", 1);

  v3 = *(_QWORD *)(a1 + 32);
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, 1, 1, objc_msgSend(v4, "preferredCellularDownloadQuality"));

}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 16))(v1, 1, 1, objc_msgSend(v2, "preferredCellularDownloadQuality"));

}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v1 + 16))(v1, 0, 0, objc_msgSend(v2, "preferredCellularDownloadQuality"));

}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_76(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v1 + 16))(v1, 0, 0, objc_msgSend(v2, "preferredCellularDownloadQuality"));

}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_78(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Not starting download since user was unable to sign in", v6, 2u);
    }

    v4 = *(_QWORD *)(a1 + 40);
    +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v4 + 16))(v4, 0, 0, objc_msgSend(v5, "preferredCellularDownloadQuality"));

  }
}

- (VUIVideosPlayable)videosPlayable
{
  return self->_videosPlayable;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (VUIMediaEntity)mediaEntity
{
  return self->_mediaEntity;
}

- (void)setMediaEntity:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntity, a3);
}

- (VUIExtrasInfo)extrasInfo
{
  return self->_extrasInfo;
}

- (void)setExtrasInfo:(id)a3
{
  objc_storeStrong((id *)&self->_extrasInfo, a3);
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
  objc_storeStrong((id *)&self->_contentRating, a3);
}

- (BOOL)contentAllowsCellularDownload
{
  return self->_contentAllowsCellularDownload;
}

- (void)setContentAllowsCellularDownload:(BOOL)a3
{
  self->_contentAllowsCellularDownload = a3;
}

- (unint64_t)restrictionsCheckType
{
  return self->_restrictionsCheckType;
}

- (void)setRestrictionsCheckType:(unint64_t)a3
{
  self->_restrictionsCheckType = a3;
}

- (VUIControllerPresenter)presentingController
{
  return self->_presentingController;
}

- (void)setPresentingController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingController, a3);
}

- (BOOL)isSubscriptionPurchaseWithoutPlayback
{
  return self->_isSubscriptionPurchaseWithoutPlayback;
}

- (void)setIsSubscriptionPurchaseWithoutPlayback:(BOOL)a3
{
  self->_isSubscriptionPurchaseWithoutPlayback = a3;
}

- (id)savedRestrictionsCompletion
{
  return self->_savedRestrictionsCompletion;
}

- (void)setSavedRestrictionsCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)restrictionsState
{
  return self->_restrictionsState;
}

- (id)restrictionsValidationToken
{
  return self->_restrictionsValidationToken;
}

- (void)setRestrictionsValidationToken:(id)a3
{
  objc_storeStrong(&self->_restrictionsValidationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_restrictionsValidationToken, 0);
  objc_storeStrong(&self->_savedRestrictionsCompletion, 0);
  objc_storeStrong((id *)&self->_presentingController, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_extrasInfo, 0);
  objc_storeStrong((id *)&self->_mediaEntity, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
}

- (void)setVideosPlayable:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "canonicalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_22(&dword_1D96EE000, a2, v4, "VUIPreflightManager::videosPlayable missing metadata for ratings preflight for canonicalId %@", (uint8_t *)&v5);

}

- (void)_logRatingsInfo:(uint64_t)a1 maxAllowedRank:(NSObject *)a2 ratingValue:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_22(&dword_1D96EE000, a2, a3, "VUIPreflightManager:: unrecognized rating domain %@", (uint8_t *)&v3);
}

- (void)_isAllowedToPlayOrPurchase
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIPreflightManager::rating domain not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Not allowing download because content does not allow download over cellular", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Not allowing download because no network is available", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_14();
}

@end
