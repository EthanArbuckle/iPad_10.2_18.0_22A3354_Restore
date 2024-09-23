@implementation VUIRedownloadEndpointManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17 != -1)
    dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_75);
  return (id)sharedInstance_instance_2;
}

void __46__VUIRedownloadEndpointManager_sharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;
  VUIRedownloadEndpointManager *v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIRedownloadEndpointManager");
  v1 = (void *)sLogObject_9;
  sLogObject_9 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIRedownloadEndpointManager);
  v3 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v2;

}

- (VUIRedownloadEndpointManager)init
{
  VUIRedownloadEndpointManager *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingRedownloadInfos;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIRedownloadEndpointManager;
  v2 = -[VUIRedownloadEndpointManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingRedownloadInfos = v2->_pendingRedownloadInfos;
    v2->_pendingRedownloadInfos = v3;

  }
  return v2;
}

- (void)performRedownloadWithType:(int64_t)a3 buyParams:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  VUIRedownloadInfo *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id buf[2];

  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v10 = -[VUIRedownloadEndpointManager initialRedownloadInProgress](self, "initialRedownloadInProgress");
    v11 = sLogObject_9;
    v12 = os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Not starting redownload for download yet since initial one is already in progress.  Will start when initial one is done", (uint8_t *)buf, 2u);
      }
      v13 = objc_alloc_init(VUIRedownloadInfo);
      -[VUIRedownloadInfo setBuyParams:](v13, "setBuyParams:", v8);
      -[VUIRedownloadInfo setRedownloadType:](v13, "setRedownloadType:", a3);
      -[VUIRedownloadInfo setCompletion:](v13, "setCompletion:", v9);
      -[VUIRedownloadEndpointManager pendingRedownloadInfos](self, "pendingRedownloadInfos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v13);

    }
    else
    {
      if (v12)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Starting initial redownload for download", (uint8_t *)buf, 2u);
      }
      -[VUIRedownloadEndpointManager setInitialRedownloadInProgress:](self, "setInitialRedownloadInProgress:", 1);
      objc_initWeak(buf, self);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke;
      v15[3] = &unk_1E9F9E800;
      objc_copyWeak(&v17, buf);
      v16 = v9;
      -[VUIRedownloadEndpointManager _performRedownloadWithType:buyParams:completion:](self, "_performRedownloadWithType:buyParams:completion:", a3, v8, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    -[VUIRedownloadEndpointManager _performRedownloadWithType:buyParams:completion:](self, "_performRedownloadWithType:buyParams:completion:", 0, v8, v9);
  }

}

void __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id WeakRetained;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setInitialRedownloadInProgress:", 0);
  if (v6)
  {
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_numberForKey:", *MEMORY[0x1E0CFD818]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "integerValue") == 3050)
    {
      v9 = (void *)sLogObject_9;
      if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(WeakRetained, "pendingRedownloadInfos");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 134217984;
        v58 = v12;
        _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Initial redownload failed because device is not authorized.  Failing %lu pending redownloads", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "pendingRedownloadInfos");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

      objc_msgSend(WeakRetained, "pendingRedownloadInfos");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeAllObjects");

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v52 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v21, "completion");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v21, "completion");
              v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, _QWORD, id))v23)[2](v23, 0, v6);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v18);
      }

    }
  }
  objc_msgSend(WeakRetained, "pendingRedownloadInfos");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  v26 = sLogObject_9;
  v27 = os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    v44 = a1;
    if (v27)
    {
      v28 = v26;
      objc_msgSend(WeakRetained, "pendingRedownloadInfos");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");
      *(_DWORD *)buf = 134217984;
      v58 = v30;
      _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "Performing %lu pending redownloads now that initial one is done", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "pendingRedownloadInfos");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");

    objc_msgSend(WeakRetained, "pendingRedownloadInfos");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeAllObjects");

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v48;
      v38 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(v34);
          v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          v41 = objc_msgSend(v40, "redownloadType");
          objc_msgSend(v40, "buyParams");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = v38;
          v46[1] = 3221225472;
          v46[2] = __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke_30;
          v46[3] = &unk_1E9F9E7D8;
          v46[4] = v40;
          objc_msgSend(WeakRetained, "_performRedownloadWithType:buyParams:completion:", v41, v42, v46);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v36);
    }

    a1 = v44;
  }
  else if (v27)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "After initial redownload, no further pending redownloads exist", buf, 2u);
  }
  v43 = *(_QWORD *)(a1 + 32);
  if (v43)
    (*(void (**)(uint64_t, id, id))(v43 + 16))(v43, v5, v6);

}

void __79__VUIRedownloadEndpointManager_performRedownloadWithType_buyParams_completion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v7)[2](v7, v8, v5);

  }
}

- (void)_performRedownloadWithType:(int64_t)a3 buyParams:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = sLogObject_9;
  if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("Download");
    if (!a3)
      v11 = CFSTR("Streaming");
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Starting redownload of type %@", buf, 0xCu);
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDBE0]), "initWithPurchaseType:buyParams:", 0, v8);
  if (!a3 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "setURLBagKey:", CFSTR("redownloadProduct"));
  objc_msgSend(v12, "setIgnoreRequirePasswordRestriction:", 1);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_activeiTunesAccountForMediaType:", *MEMORY[0x1E0CFD7B0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke;
  v21[3] = &unk_1E9F9E828;
  objc_copyWeak(&v23, (id *)buf);
  v16 = v12;
  v22 = v16;
  objc_msgSend(v14, "continueWithBlock:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43;
  v19[3] = &unk_1E9F9E850;
  v18 = v9;
  v20 = v18;
  objc_msgSend(v17, "resultWithCompletion:", v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

id __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    v8 = sLogObject_9;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR))
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setAccount:", v5);
  }
  v15 = objc_alloc(MEMORY[0x1E0CFDC00]);
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CFDC00], "createBagForSubProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithPurchase:bag:", v16, v17);

  objc_msgSend(v18, "setDelegate:", WeakRetained);
  objc_msgSend(v18, "performPurchase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  uint8_t buf[8];
  uint64_t v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_9;
  if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Redownload complete", buf, 2u);
  }
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vui_dictionaryForKey:", *MEMORY[0x1E0CFD820]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_dictionaryForKey:", CFSTR("dialog"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_4:
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vui_numberForKey:", *MEMORY[0x1E0CFD818]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "domain");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (uint64_t *)MEMORY[0x1E0CB3388];
      if (v13)
      {
        v15 = (void *)v13;
        objc_msgSend(v6, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *v14;
        objc_msgSend(v16, "objectForKey:", *v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(v6, "userInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v19, "mutableCopy");

          v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CFD9A0], objc_msgSend(v12, "integerValue"), 0);
          objc_msgSend(v20, "setObject:forKey:", v22, v17);

          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          objc_msgSend(v6, "domain");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, objc_msgSend(v6, "code"), v20);

          v6 = (id)v25;
        }
      }
      if (objc_msgSend(v12, "integerValue") == 5102)
      {
        v65 = *v14;
        v66[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 812, v26);

        v6 = (id)v27;
      }
    }
    if (v10)
    {
      objc_msgSend(v6, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");

      objc_msgSend(v29, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("VUIDownloadManagerSuppressErrorDialogKey"));
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v6, "domain");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, objc_msgSend(v6, "code"), v29);

      v6 = (id)v32;
    }
    v33 = sLogObject_9;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR))
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43_cold_1((uint64_t)v6, v33, v34, v35, v36, v37, v38, v39);
    v40 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v5, "responseDictionary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v43;
  if (!v43)
  {
    v45 = -123007;
    v46 = sLogObject_9;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR))
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43_cold_2(v46, v47, v48, v49, v50, v51, v52, v53);
LABEL_24:
    v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, v45, 0);

    if (!v6)
    {
      v40 = 0;
      goto LABEL_16;
    }
    goto LABEL_4;
  }
  objc_msgSend(v43, "objectForKey:", CFSTR("songList"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    v54 = sLogObject_9;
    v45 = -123006;
    if (os_log_type_enabled((os_log_t)sLogObject_9, OS_LOG_TYPE_ERROR))
      __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43_cold_3(v54, v55, v56, v57, v58, v59, v60, v61);
    goto LABEL_24;
  }
  v6 = 0;
LABEL_15:

LABEL_16:
  v63 = *(id *)(a1 + 32);
  v41 = v6;
  v42 = v40;
  TVPPerformBlockOnMainThreadIfNeeded();

}

uint64_t __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_52(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (objc_class *)MEMORY[0x1E0CFD9D8];
  v8 = a5;
  v9 = a4;
  v10 = [v7 alloc];
  objc_msgSend(MEMORY[0x1E0CFD9D8], "createBagForSubProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v10, "initWithRequest:bag:", v9, v11);

  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "performAuthentication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addFinishBlock:", v8);

}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0CFDC48];
  v7 = a5;
  v8 = a4;
  v10 = (id)objc_msgSend([v6 alloc], "initWithRequest:", v8);

  objc_msgSend(v10, "present");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", v7);

}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0CFDC50];
  v7 = a5;
  v8 = a4;
  v10 = (id)objc_msgSend([v6 alloc], "initWithRequest:", v8);

  objc_msgSend(v10, "present");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", v7);

}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0CFDC48];
  v7 = a5;
  v8 = a4;
  v10 = (id)objc_msgSend([v6 alloc], "initWithRequest:", v8);

  objc_msgSend(v10, "present");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", v7);

}

- (NSMutableArray)pendingRedownloadInfos
{
  return self->_pendingRedownloadInfos;
}

- (void)setPendingRedownloadInfos:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRedownloadInfos, a3);
}

- (BOOL)initialRedownloadInProgress
{
  return self->_initialRedownloadInProgress;
}

- (void)setInitialRedownloadInProgress:(BOOL)a3
{
  self->_initialRedownloadInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRedownloadInfos, 0);
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "Error fetching account for redownload: %@", a5, a6, a7, a8, 2u);
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "Error performing redownload: %@", a5, a6, a7, a8, 2u);
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "Empty purchase response", a5, a6, a7, a8, 0);
}

void __80__VUIRedownloadEndpointManager__performRedownloadWithType_buyParams_completion___block_invoke_43_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "storeItemDict is nil", a5, a6, a7, a8, 0);
}

@end
