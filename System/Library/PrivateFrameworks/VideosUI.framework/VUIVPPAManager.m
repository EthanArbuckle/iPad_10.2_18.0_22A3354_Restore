@implementation VUIVPPAManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_7 != -1)
    dispatch_once(&sharedInstance___onceToken_7, &__block_literal_global_151);
  return (id)sharedInstance___instance_6;
}

void __32__VUIVPPAManager_sharedInstance__block_invoke()
{
  VUIVPPAManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIVPPAManager);
  v1 = (void *)sharedInstance___instance_6;
  sharedInstance___instance_6 = (uint64_t)v0;

}

- (VUIVPPAManager)init
{
  VUIVPPAManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIVPPAManager;
  result = -[VUIVPPAManager init](&v3, sel_init);
  if (result)
    result->_alreadyInProgress = 0;
  return result;
}

- (void)startVPPAConsentFlow:(id)a3 consentCancelButtonType:(unint64_t)a4 shouldForceVPPAPrompt:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  VUIVPPAManager *v22;
  id v23;
  id v24;
  BOOL v25;
  id location[2];

  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_activeiTunesAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_DSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v18 = "VUIVPPAManager - User not logged in. Cannot continue.";
LABEL_8:
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)location, 2u);
    }
LABEL_9:

    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    goto LABEL_10;
  }
  if (!v10)
  {
    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v18 = "VUIVPPAManager - No channel.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  self->_consentCancelButtonType = a4;
  objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstanceFiltered");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__VUIVPPAManager_startVPPAConsentFlow_consentCancelButtonType_shouldForceVPPAPrompt_completion___block_invoke;
  v19[3] = &unk_1E9FA4600;
  objc_copyWeak(&v24, location);
  v20 = v10;
  v16 = v15;
  v21 = v16;
  v22 = self;
  v23 = v11;
  v25 = a5;
  objc_msgSend(v16, "loadIfNeededWithCompletion:", v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(location);

LABEL_10:
}

void __96__VUIVPPAManager_startVPPAConsentFlow_consentCancelButtonType_shouldForceVPPAPrompt_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!a2
    || (objc_msgSend(*(id *)(a1 + 32), "channelID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 40), "channelForID:", v5),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v6 = *(id *)(a1 + 32);
  }
  if ((objc_msgSend(WeakRetained, "_isChannelVPPAPromptEligible:", v6) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "_fetchConfigurationAndPresentVPPAIfRequired:shouldForceConsentPrompt:completion:", v6, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));
  }
  else
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - %@ does not required vppa prompt.", (uint8_t *)&v9, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)startVPPAConsentFlowForDeeplink:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  VUIVPPAManager *v18;
  id v19;
  uint8_t *v20;
  id v21;
  id location;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_activeiTunesAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "VUIVPPAManager - User not logged in. Cannot continue.";
LABEL_8:
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_9:

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_10;
  }
  if (!v6)
  {
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "VUIVPPAManager - No channel ID.";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__32;
  v27 = __Block_byref_object_dispose__32;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstanceFiltered");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__VUIVPPAManager_startVPPAConsentFlowForDeeplink_completion___block_invoke;
  v15[3] = &unk_1E9FA4628;
  objc_copyWeak(&v21, &location);
  v20 = buf;
  v12 = v11;
  v16 = v12;
  v17 = v6;
  v18 = self;
  v19 = v7;
  objc_msgSend(v12, "loadIfNeededWithCompletion:", v15);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
LABEL_10:

}

void __61__VUIVPPAManager_startVPPAConsentFlowForDeeplink_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "channelForID:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - No channel.", (uint8_t *)&v10, 2u);
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(WeakRetained, "_isChannelVPPAPromptEligible:") & 1) == 0)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - %@ does not required vppa prompt.", (uint8_t *)&v10, 0xCu);

    }
LABEL_11:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 48), "_fetchConfigurationAndPresentVPPAIfRequired:shouldForceConsentPrompt:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 0, *(_QWORD *)(a1 + 56));
LABEL_12:

}

- (void)reloadConfigurationAfterVPPAChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, &__block_literal_global_13_0);

}

void __52__VUIVPPAManager_reloadConfigurationAfterVPPAChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Failed to fetch init config: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", CFSTR("VUIVPPADidChangeNotification"), 0, 0);
  }

}

- (BOOL)lightweightCheckToSeeIfChannelRequiresConsent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstanceFiltered");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channelForID:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settingsForChannelID:externalID:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v3;
  if ((objc_msgSend(v6, "isConsented") & 1) != 0)
  {
    v10 = 0;
  }
  else if (v9)
  {
    v10 = objc_msgSend(v9, "accessStatus") == 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_fetchConfigurationAndPresentVPPAIfRequired:(id)a3 shouldForceConsentPrompt:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  VUIVPPAManager *v15;
  id v16;
  id v17;
  BOOL v18;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC8788], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke;
  v13[3] = &unk_1E9FA4698;
  objc_copyWeak(&v17, &location);
  v11 = v8;
  v14 = v11;
  v18 = a4;
  v12 = v9;
  v15 = self;
  v16 = v12;
  objc_msgSend(v10, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 0, 0, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke_2;
    v12[3] = &unk_1E9FA4670;
    v13 = v5;
    v9 = *(id *)(a1 + 32);
    v18 = *(_BYTE *)(a1 + 64);
    v14 = v9;
    v15 = WeakRetained;
    v10 = *(id *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = v10;
    dispatch_async(v8, v12);

    v11 = v13;
  }
  else
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Failed to fetch init config: %@", buf, 0xCu);
    }
  }

}

void __98__VUIVPPAManager__fetchConfigurationAndPresentVPPAIfRequired_shouldForceConsentPrompt_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _BOOL4 v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  _BYTE v23[24];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "vppaStatus");
  objc_msgSend(*(id *)(a1 + 32), "vppaStatusString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingsForChannelID:externalID:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "accessStatus") == 1;
    v8 = objc_msgSend(v6, "accessStatus") == 2;
    v9 = objc_msgSend(v6, "accessStatus") == 0;
  }
  else
  {
    v8 = 0;
    v7 = 0;
    v9 = 1;
  }
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v11 = v3;
    else
      v11 = CFSTR("not found");
    objc_msgSend(*(id *)(a1 + 40), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(*(id *)(a1 + 40), "isConsented");
    v14 = CFSTR("not consented");
    if (v13)
      v14 = CFSTR("consented");
    v15 = CFSTR("unknown");
    if (v8)
      v15 = CFSTR("denied");
    *(_DWORD *)v23 = 138413058;
    *(_QWORD *)&v23[4] = v11;
    *(_WORD *)&v23[12] = 2112;
    *(_QWORD *)&v23[14] = v12;
    *(_WORD *)&v23[22] = 2112;
    v24 = v14;
    if (v7)
      v16 = CFSTR("granted");
    else
      v16 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - VPPA state is %@. '%@' cached state: %@, access in settings: %@", v23, 0x2Au);

  }
  if (!v3)
  {
    if (v9)
    {
      if (!v8)
        goto LABEL_32;
    }
    else if (!v8 || !*(_BYTE *)(a1 + 72))
    {
      VUIDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412290;
      *(_QWORD *)&v23[4] = v19;
      v20 = "VUIVPPAManager - No vppaStatus found. %@ is consented or has explicitly denied";
LABEL_35:
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, v20, v23, 0xCu);

      goto LABEL_36;
    }
    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_31:

LABEL_32:
      objc_msgSend(*(id *)(a1 + 48), "_presentVPPAConsentScreen:vppaState:completion:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 64), *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
      goto LABEL_39;
    }
LABEL_30:
    objc_msgSend(*(id *)(a1 + 40), "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138412290;
    *(_QWORD *)&v23[4] = v21;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Forcing consent prompt for explicitly denied channel %@", v23, 0xCu);

    goto LABEL_31;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "_isVPPAPromptDueForConfig:", *(_QWORD *)(a1 + 32)))
  {
    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - bulk consent is due", v23, 2u);
    }
    goto LABEL_31;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isConsented") ^ 1 | v8) == 1)
  {
    if (!v7)
    {
      if (!v8)
        goto LABEL_32;
      if (*(_BYTE *)(a1 + 72))
      {
        VUIDefaultLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    VUIDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    objc_msgSend(*(id *)(a1 + 40), "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138412290;
    *(_QWORD *)&v23[4] = v19;
    v20 = "VUIVPPAManager - User has explicitly specified consent for %@";
    goto LABEL_35;
  }
LABEL_37:
  v22 = *(_QWORD *)(a1 + 64);
  if (v22)
    (*(void (**)(uint64_t, uint64_t, _BOOL8))(v22 + 16))(v22, 1, v7);
LABEL_39:

}

- (BOOL)_isChannelVPPAPromptEligible:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "isWatchListEnabled"))
    v4 = objc_msgSend(v3, "isFirstParty") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)_isVPPAPromptDueForConfig:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "vppaStatus");
  objc_msgSend(v3, "vppaSessionDurationInMillis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6 / 1000.0;
  if (v7 <= 0.0)
    v8 = 86400.0;
  else
    v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("vppaConsentLastPrompted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (v4 & 0xFFFFFFFFFFFFFFFELL) == 2
     || v4 == 1
     && +[VUIVPPAManager _isReminderDue:reminderInterval:](VUIVPPAManager, "_isReminderDue:reminderInterval:", v10, v8);

  return v11;
}

- (void)_presentVPPAConsentScreen:(id)a3 vppaState:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  VUIVPPAManager *v22;
  id v23;
  id v24;
  id v25[2];
  id buf[2];

  v8 = a3;
  v9 = a5;
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Present consent screen", (uint8_t *)buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v8);
  -[VUIVPPAManager _getVPPABulkChannels:](self, "_getVPPABulkChannels:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIVPPAManager _getEligibleBulkChannels](self, "_getEligibleBulkChannels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Adding VPPA channels", (uint8_t *)buf, 2u);
    }
    v15 = v12;
LABEL_11:

    objc_msgSend((id)objc_opt_class(), "addUniqueChannels:channels:", v15, v11);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
    goto LABEL_12;
  }
  if (objc_msgSend(v13, "count"))
  {
    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Adding Eligible channels", (uint8_t *)buf, 2u);
    }
    v15 = v13;
    goto LABEL_11;
  }
LABEL_12:
  objc_initWeak(buf, self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke;
  v20[3] = &unk_1E9FA4738;
  objc_copyWeak(v25, buf);
  v25[1] = (id)a4;
  v21 = v11;
  v22 = self;
  v23 = v8;
  v24 = v9;
  v17 = v8;
  v18 = v11;
  v19 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

  objc_destroyWeak(v25);
  objc_destroyWeak(buf);

}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  VUIAccessViewController *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  VUIAccessViewController *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint8_t buf[8];
  _QWORD v38[4];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(WeakRetained, "alreadyInProgress"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Already presenting Consent screen. Skipping", buf, 2u);
    }

    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "setAlreadyInProgress:", 1);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("vppaConsentLastPrompted"));

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ams_activeiTunesAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = &stru_1E9FF3598;
  if (v9)
    v10 = v9;
  v38[0] = CFSTR("account");
  v38[1] = CFSTR("NewVPPAConsentPrompt");
  v11 = MEMORY[0x1E0C9AAB0];
  v12 = *(_QWORD *)(a1 + 72);
  v13 = v12 == 0;
  if (v12)
    v14 = MEMORY[0x1E0C9AAA0];
  else
    v14 = MEMORY[0x1E0C9AAB0];
  v39[0] = v10;
  v39[1] = v14;
  if (v13)
    v11 = MEMORY[0x1E0C9AAA0];
  v38[2] = CFSTR("requireVPPAStateUpdate");
  v38[3] = CFSTR("shouldDenyOnCancel");
  v39[2] = v11;
  v39[3] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [VUIAccessViewController alloc];
  v17 = *(_QWORD *)(a1 + 32);
  v18 = objc_msgSend(*(id *)(a1 + 40), "consentCancelButtonType");
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_35;
  v32 = &unk_1E9FA4710;
  v33 = WeakRetained;
  v34 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 72);
  v35 = v19;
  v36 = v20;
  v21 = -[VUIAccessViewController initWithChannels:options:consentCancelButtonType:completionHandler:](v16, "initWithChannels:options:consentCancelButtonType:completionHandler:", v17, v15, v18, &v29);
  objc_msgSend(*(id *)(a1 + 40), "setAccessViewController:", v21, v29, v30, v31, v32, v33);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if (v23 == 2)
  {
    v24 = 8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "userInterfaceIdiom");

    if (v26 == 1)
      v24 = 2;
    else
      v24 = -2;
  }
  -[VUIAccessViewController setModalPresentationStyle:](v21, "setModalPresentationStyle:", v24);
  objc_msgSend(*(id *)(a1 + 40), "_rootViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentViewController:animated:completion:", v21, 1, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("VUIVPPAPresentedNotification"), 0, 0);

LABEL_20:
}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_35(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a2;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Received access result: %lu", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_36;
  block[3] = &unk_1E9FA46E8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10 = v6;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_36(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "accessViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_2;
  v8 = &unk_1E9FA46C0;
  v11 = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v10 = v3;
  v12 = v4;
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, &v5);

  objc_msgSend(*(id *)(a1 + 32), "setAccessViewController:", 0, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "setAlreadyInProgress:", 0);

}

void __65__VUIVPPAManager__presentVPPAConsentScreen_vppaState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 1)
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "appName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Updating VPPA consent for channel details: %@ and invalidating cache", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstanceFiltered");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "channelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateConsentStatusForCachedEntry:consented:", v6, 1);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = (unint64_t)(*(_QWORD *)(a1 + 48) - 1) < 2 || *(_QWORD *)(a1 + 56) == 1;
    (*(void (**)(uint64_t, _BOOL8, BOOL))(v7 + 16))(v7, v8, v2 == 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "channelID", CFSTR("channelID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("userAcceptedVPPA");
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 == 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("VUIVPPADismissedNotification"), 0, v11);

}

- (id)_getVPPABulkChannels:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if ((unint64_t)(a3 - 1) > 1)
  {
    if (a3 != 3)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_getConsentedChannels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    objc_msgSend((id)objc_opt_class(), "_getDeniedChannels");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_getConsentedChannels");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  objc_msgSend(v4, "addObjectsFromArray:", v5);

LABEL_7:
  -[VUIVPPAManager _filterOutNotEligibleVPPAChannels:](self, "_filterOutNotEligibleVPPAChannels:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_filterOutNotEligibleVPPAChannels:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v14 = v4;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isiTunes", v14) & 1) != 0
            || (objc_msgSend(v10, "isFirstParty") & 1) != 0
            || !objc_msgSend(v10, "isWatchListEnabled"))
          {
            VUIDefaultLogObject();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "name");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v21 = v12;
              _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - %@ not eligible for VPPA.", buf, 0xCu);

            }
            -[VUIVPPAManager _removeNotEligibleChannelFromSettingsStore:](self, "_removeNotEligibleChannelFromSettingsStore:", v10);
          }
          else
          {
            objc_msgSend(v15, "addObject:", v10);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v7);
    }

    v4 = v14;
  }
  else
  {
    v15 = v4;
  }

  return v15;
}

- (void)_removeNotEligibleChannelFromSettingsStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingsForChannelID:externalID:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "appName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Removing not eligible channel %@ from settings store.", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v4, "_removeWatchListApp:", v6);

}

- (id)_getEligibleBulkChannels
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v23;
  id v24;
  VUIVPPAManager *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[VUIVPPAManager _subscribedAppBundleIdentifiers](self, "_subscribedAppBundleIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = self;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[VUIVPPAManager _watchlistOrderedChannels](self, "_watchlistOrderedChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v33;
    *(_QWORD *)&v5 = 138412290;
    v23 = v5;
    v26 = v3;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v9, "appBundleIDs", v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isFirstParty") & 1) == 0 && objc_msgSend(v9, "isWatchListEnabled"))
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v11 = v27;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v29;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
                if (objc_msgSend(v10, "containsObject:", v16))
                {
                  -[VUIVPPAManager _subscriptionIdentifierForBundleID:](v25, "_subscriptionIdentifierForBundleID:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "channelID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VUIVPPAManager _appSettingsForChannelID:externalID:](v25, "_appSettingsForChannelID:externalID:", v18, v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((!v19 || !objc_msgSend(v19, "accessStatus"))
                    && (objc_msgSend(v24, "containsObject:", v9) & 1) == 0)
                  {
                    VUIDefaultLogObject();
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v9, "channelID");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = v23;
                      v37 = v21;
                      _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "VUIVPPAManager - Found eligible channel: %@", buf, 0xCu);

                    }
                    objc_msgSend(v24, "addObject:", v9);
                  }

                  goto LABEL_24;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
              if (v13)
                continue;
              break;
            }
          }
LABEL_24:

          v3 = v26;
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v6);
  }

  return v24;
}

+ (BOOL)_isReminderDue:(id)a3 reminderInterval:(double)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 1;
  objc_msgSend(a3, "dateByAddingTimeInterval:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == -1;

  return v6;
}

+ (BOOL)channelAlreadyExists:(id)a3 channelID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6
    && (v19 = 0u,
        v20 = 0u,
        v17 = 0u,
        v18 = 0u,
        (v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16)) != 0))
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "channelID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v12, "channelID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v6);

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }
        v9 |= v15;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

+ (id)addUniqueChannels:(id)a3 channels:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "channelID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = objc_opt_class();
            objc_msgSend(v11, "channelID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v13) = objc_msgSend((id)v13, "channelAlreadyExists:channelID:", v6, v14);

            if ((v13 & 1) == 0)
              objc_msgSend(v6, "addObject:", v11);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v6;
}

+ (id)_getConsentedChannels
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_getConsentedBrandsFromSettingsStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend((id)objc_opt_class(), "_getChannelDetailsForID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && (objc_msgSend(v9, "isiTunes") & 1) == 0 && (objc_msgSend(v10, "isFirstParty") & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)_getDeniedChannels
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_getDeniedBrandsFromSettingsStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend((id)objc_opt_class(), "_getChannelDetailsForID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && (objc_msgSend(v9, "isiTunes") & 1) == 0 && (objc_msgSend(v10, "isFirstParty") & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_rootViewController
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subscribedAppBundleIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC8750], "defaultAppLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscribedAppBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_watchlistOrderedChannels
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC8780], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subscriptionIdentifierForBundleID:(id)a3
{
  return (id)WLKSubscriptionIdentifierForBundleID();
}

- (id)_appSettingsForChannelID:(id)a3 externalID:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0DC8840];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settingsForChannelID:externalID:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_getConsentedBrandsFromSettingsStore
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "consentedBrands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_getDeniedBrandsFromSettingsStore
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deniedBrands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_getChannelDetailsForID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC8780];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "channelForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VUIAccessViewController)accessViewController
{
  return self->_accessViewController;
}

- (void)setAccessViewController:(id)a3
{
  objc_storeStrong((id *)&self->_accessViewController, a3);
}

- (BOOL)alreadyInProgress
{
  return self->_alreadyInProgress;
}

- (void)setAlreadyInProgress:(BOOL)a3
{
  self->_alreadyInProgress = a3;
}

- (unint64_t)consentCancelButtonType
{
  return self->_consentCancelButtonType;
}

- (void)setConsentCancelButtonType:(unint64_t)a3
{
  self->_consentCancelButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessViewController, 0);
}

@end
