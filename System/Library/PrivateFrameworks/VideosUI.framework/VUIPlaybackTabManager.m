@implementation VUIPlaybackTabManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VUIPlaybackTabManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_20 != -1)
    dispatch_once(&sharedInstance_onceToken_20, block);
  return (id)sharedInstance_sharedInstance_7;
}

void __39__VUIPlaybackTabManager_sharedInstance__block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  id v4;
  void *v5;

  v2 = os_log_create("com.apple.tv.TimedMetadata", "VUIPlaybackTabManager");
  v3 = (void *)sTimedMetadataLogObject;
  sTimedMetadataLogObject = (uint64_t)v2;

  v4 = objc_alloc_init(*(Class *)(a1 + 32));
  v5 = (void *)sharedInstance_sharedInstance_7;
  sharedInstance_sharedInstance_7 = (uint64_t)v4;

}

- (VUIPlaybackTabManager)init
{
  VUIPlaybackTabManager *v2;
  uint64_t v3;
  NSMutableDictionary *hudViewControllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIPlaybackTabManager;
  v2 = -[VUIPlaybackTabManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    hudViewControllers = v2->_hudViewControllers;
    v2->_hudViewControllers = (NSMutableDictionary *)v3;

    v2->_playbackTabError = 0;
  }
  return v2;
}

- (BOOL)isPlayerTabsEnabled
{
  return 1;
}

- (void)updatePlayerTabsExcludingCanonicals:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  int v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void (**v49)(void *, id, const __CFString *);
  id val;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  void (**v59)(void *, id, const __CFString *);
  void (**v60)(_QWORD);
  id v61;
  id v62;
  char v63;
  id location;
  _QWORD aBlock[4];
  id v66;
  uint8_t buf[4];
  const __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  *((_QWORD *)&v55 + 1) = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  *(_QWORD *)&v55 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataMakeAdditionalPlayerTabsRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v8, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataIsEligibleForPlayerTabs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "BOOLValue");
  else
    v13 = 1;
  objc_msgSend(v8, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataPlayablePassThrough"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B08]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BE8]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataIsEligibleForInfoTab"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = objc_msgSend(v14, "BOOLValue");
  else
    v16 = 1;
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isNetworkReachable");

  if ((v18 & 1) != 0)
  {
    if (v10)
    {
      -[VUIPlaybackTabManager lastRequestDate](self, "lastRequestDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[VUIPlaybackTabManager lastRequestDate](self, "lastRequestDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceNow");
        v22 = fabs(v21);

        if (v22 < 1.0)
        {
          VUIDefaultLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Not fetching tabs since we just fetched them a moment ago", buf, 2u);
          }

          if (v6)
            v6[2](v6);
          goto LABEL_54;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackTabManager setLastRequestDate:](self, "setLastRequestDate:", v28);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke;
    aBlock[3] = &unk_1E9FA01D0;
    v29 = v6;
    v66 = v29;
    v49 = (void (**)(void *, id, const __CFString *))_Block_copy(aBlock);
    objc_initWeak(&location, self);
    if (v13)
    {
      if (v55 != 0)
      {
        -[VUIPlaybackTabManager delegate](self, "delegate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "playerViewController");
        val = (id)objc_claimAutoreleasedReturnValue();
        if (*((_QWORD *)&v55 + 1))
        {
          -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "canonicalId");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v31, "isEqualToString:", *((_QWORD *)&v55 + 1));

            if (((v44 ^ 1 | v10) & 1) == 0)
            {
LABEL_47:
              -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "isInfoTabAllowed");

              VUIDefaultLogObject();
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = v38 & v16;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v41 = CFSTR("NO");
                if ((_DWORD)v40)
                  v41 = CFSTR("YES");
                *(_DWORD *)buf = 138412290;
                v68 = v41;
                _os_log_impl(&dword_1D96EE000, v39, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not fetching tabs because we already have tabs setAllowInfoTab:%@", buf, 0xCu);
              }

              objc_msgSend(val, "setAllowInfoMetadataSubpanel:", v40);
              -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "tabDetails");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIPlaybackTabManager _updateHUDsForAVPlayerViewController:tabInfo:excludingCanonicals:](self, "_updateHUDsForAVPlayerViewController:tabInfo:excludingCanonicals:", val, v43, v54);

              -[VUIPlaybackTabManager _updateTimedMetadataEligibilityFlagInCurrentMediaItem](self, "_updateTimedMetadataEligibilityFlagInCurrentMediaItem");
              if (!v29)
                goto LABEL_53;
              goto LABEL_52;
            }
          }
        }
        else
        {
          if (!(_QWORD)v55)
            goto LABEL_47;
          -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47 || -[VUIPlaybackTabManager playbackTabError](self, "playbackTabError") == 2)
          {
            -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "adamId");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v36, "isEqualToString:", (_QWORD)v55);

            if ((v45 & 1) != 0)
            {
              if (-[VUIPlaybackTabManager playbackTabError](self, "playbackTabError") == 2)
              {
                v49[2](v49, val, CFSTR("VUIPlaybackTabManager:: not fetching tabs as canonical id is missing and we couldn't resolve it using current adam id"));
LABEL_53:

                objc_destroyWeak(&location);
                goto LABEL_54;
              }
              goto LABEL_47;
            }
          }
        }
        if ((v10 & 1) == 0)
          -[VUIPlaybackTabManager resetPlayerTabsForPlayerViewController:](self, "resetPlayerTabsForPlayerViewController:", val);
        objc_initWeak((id *)buf, val);
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke_115;
        v56[3] = &unk_1E9FA01F8;
        objc_copyWeak(&v61, &location);
        objc_copyWeak(&v62, (id *)buf);
        v57 = *((id *)&v55 + 1);
        v59 = v49;
        v63 = v16;
        v60 = v29;
        v58 = v54;
        -[VUIPlaybackTabManager _getTabsForCanonicalId:adamId:playablePassThrough:programId:contentId:completion:](self, "_getTabsForCanonicalId:adamId:playablePassThrough:programId:contentId:completion:", v57, (_QWORD)v55, v53, v52, v51, v56);

        objc_destroyWeak(&v62);
        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);
        goto LABEL_53;
      }
      -[VUIPlaybackTabManager delegate](self, "delegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "playerViewController");
      val = (id)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackTabManager resetPlayerTabsForPlayerViewController:](self, "resetPlayerTabsForPlayerViewController:", val);
      VUIDefaultLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = CFSTR("NO");
        if ((_DWORD)v16)
          v34 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v68 = v34;
        _os_log_impl(&dword_1D96EE000, v33, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not fetching tabs because canonical id is missing setAllowInfoTab:%@", buf, 0xCu);
      }

      objc_msgSend(val, "setAllowInfoMetadataSubpanel:", v16);
      if (!v29)
        goto LABEL_53;
    }
    else
    {
      -[VUIPlaybackTabManager delegate](self, "delegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "playerViewController");
      val = (id)objc_claimAutoreleasedReturnValue();
      VUIDefaultLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not fetching tabs because content is not eligible setAllowInfoMetadataSubpanel:NO", buf, 2u);
      }

      objc_msgSend(val, "setAllowInfoMetadataSubpanel:", 0);
      -[VUIPlaybackTabManager resetPlayerTabsForPlayerViewController:](self, "resetPlayerTabsForPlayerViewController:", val);
      if (!v29)
        goto LABEL_53;
    }
LABEL_52:
    v29[2](v29);
    goto LABEL_53;
  }
  VUIDefaultLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("NO");
    if ((_DWORD)v16)
      v25 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v68 = v25;
    _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Network is not reachable, not fetching tabs setAllowInfoMetadataSubpanel:%@", buf, 0xCu);
  }

  -[VUIPlaybackTabManager delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "playerViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAllowInfoMetadataSubpanel:", v16);
  if (v6)
    v6[2](v6);

LABEL_54:
}

uint64_t __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t result;
  uint8_t v6[16];

  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Coudn't fetch tabs, returning early setting setAllowInfoMetadataSubpanel:NO", v6, 2u);
  }

  objc_msgSend(v3, "setAllowInfoMetadataSubpanel:", 0);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__VUIPlaybackTabManager_updatePlayerTabsExcludingCanonicals_completion___block_invoke_115(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  _BOOL8 v35;
  NSObject *v36;
  const __CFString *v37;
  const __CFString *v38;
  int v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  _BYTE v49[14];
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = objc_loadWeakRetained((id *)(a1 + 72));
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v7;
    v10 = *(const __CFString **)(a1 + 32);
    objc_msgSend(v5, "tabDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = objc_msgSend(v5, "isInfoTabAllowed");
    objc_msgSend(v5, "focusedTabIdOnFirstDisplay");
    v43 = a1;
    v14 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v45 = v10;
    v7 = v9;
    v46 = 2048;
    v47 = v12;
    v48 = 1024;
    *(_DWORD *)v49 = v13;
    *(_WORD *)&v49[4] = 2112;
    *(_QWORD *)&v49[6] = v15;
    v50 = 2048;
    v51 = a3;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Fetched tabs: %@, count = %lu, isInfoTabAllowed: %d, focusedTabIdOnFirstDisplay: %@, error: %ld", buf, 0x30u);

    v5 = v14;
    a1 = v43;

  }
  objc_msgSend(WeakRetained, "setPlaybackTabError:", a3);
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isNetworkReachable");

    if ((v17 & 1) == 0)
    {
      VUIDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(a1 + 80))
          v19 = CFSTR("YES");
        else
          v19 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v45 = v19;
        _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: Network is not reachable setAllowInfoMetadataSubpanel:%@", buf, 0xCu);
      }

      objc_msgSend(v7, "setAllowInfoMetadataSubpanel:", *(unsigned __int8 *)(a1 + 80));
    }
    goto LABEL_39;
  }
  v20 = *(void **)(a1 + 32);
  if (v20)
  {
    objc_msgSend(v5, "canonicalId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_39;
    }
  }
  objc_msgSend(WeakRetained, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentMediaItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v5, "adamId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqualToString:", v26);

    if ((v27 & 1) == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      goto LABEL_39;
    }
  }

  objc_msgSend(WeakRetained, "tabsInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v28) & 1) == 0)
  {

    goto LABEL_22;
  }
  objc_msgSend(v7, "customInfoViewControllers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");
  objc_msgSend(v5, "tabDetails");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v30 != v32)
  {
LABEL_22:
    v34 = objc_msgSend(v5, "isInfoTabAllowed");
    if (v34)
      v35 = *(_BYTE *)(a1 + 80) != 0;
    else
      v35 = 0;
    VUIDefaultLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = CFSTR("NO");
      if (v35)
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      v39 = *(unsigned __int8 *)(a1 + 80);
      if (v34)
        v40 = CFSTR("YES");
      else
        v40 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v45 = v38;
      v46 = 2112;
      v47 = (uint64_t)v40;
      if (v39)
        v37 = CFSTR("YES");
      v48 = 2112;
      *(_QWORD *)v49 = v37;
      _os_log_impl(&dword_1D96EE000, v36, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: using tabs from UTS response setAllowInfoMetadataSubpanel: %@ isInfoTabAllowed = %@, isContentEligibleForInfoTab = %@", buf, 0x20u);
    }

    objc_msgSend(WeakRetained, "setTabsInfo:", v5);
    objc_msgSend(v7, "setAllowInfoMetadataSubpanel:", v35);
    objc_msgSend(v5, "tabDetails");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateHUDsForAVPlayerViewController:tabInfo:excludingCanonicals:", v7, v41, *(_QWORD *)(a1 + 40));

    objc_msgSend(WeakRetained, "_updateTimedMetadataEligibilityFlagInCurrentMediaItem");
    goto LABEL_37;
  }
  objc_msgSend(WeakRetained, "_updateTimedMetadataEligibilityFlagInCurrentMediaItem");
  VUIDefaultLogObject();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v33, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager:: not updating tabs because the new ones match the existing ones", buf, 2u);
  }

LABEL_37:
  v42 = *(_QWORD *)(a1 + 56);
  if (v42)
    (*(void (**)(void))(v42 + 16))();
LABEL_39:

}

- (id)createHUDViewControllerWithTabInfo:(id)a3 excludingCanonicals:(id)a4 isMultiview:(BOOL)a5 locale:(id)a6 playsFromStart:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  VUIHUDViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v23[16];

  v7 = a7;
  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = a4;
  objc_msgSend(v12, "tabId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackTabManager _createHudContentViewControllerWithTabId:excludingCanonicals:isMultiview:locale:playsFromStart:](self, "_createHudContentViewControllerWithTabId:excludingCanonicals:isMultiview:locale:playsFromStart:", v15, v14, v9, v13, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && v16)
  {
    v17 = objc_alloc_init(VUIHUDViewController);
    objc_msgSend(v12, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIHUDViewController setTitle:](v17, "setTitle:", v18);
    -[VUIHUDViewController setHudContentViewController:](v17, "setHudContentViewController:", v16);
    objc_msgSend(v12, "tabId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIHUDViewController setTabIdentifier:](v17, "setTabIdentifier:", v19);

    -[VUIPlaybackTabManager hudViewControllers](self, "hudViewControllers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v17, v15);

  }
  else
  {
    VUIDefaultLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Failed to create hud content view controller", v23, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (void)resetPlayerTabsForPlayerViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[VUIPlaybackTabManager setTabsInfo:](self, "setTabsInfo:", 0);
  -[VUIPlaybackTabManager setLastRequestDate:](self, "setLastRequestDate:", 0);
  -[VUIPlaybackTabManager hudViewControllers](self, "hudViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(v4, "setCustomInfoViewControllers:", MEMORY[0x1E0C9AA60]);
  -[VUIPlaybackTabManager setPlaybackTabError:](self, "setPlaybackTabError:", 0);
}

- (void)updatePlayerViewSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[VUIPlaybackTabManager hudViewControllers](self, "hudViewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        -[VUIPlaybackTabManager hudViewControllers](self, "hudViewControllers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setPlayerViewSize:", width, height);
        objc_msgSend(v14, "hudContentViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPlayerViewSize:", width, height);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)_getTabsForCanonicalId:(id)a3 adamId:(id)a4 playablePassThrough:(id)a5 programId:(id)a6 contentId:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  -[VUIPlaybackTabManager appContext](self, "appContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke;
  v27[3] = &unk_1E9FA0220;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  objc_msgSend(v20, "evaluate:", v27);

}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD aBlock[4];
  id v43;
  _QWORD v44[3];
  _QWORD v45[4];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PlayerTabsInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("getPlayerTabsItemWithParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUndefined");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("getPlayerTabsItemWithPlayablePassThrough"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isUndefined");

    if ((v7 & 1) != 0)
    {
      v8 = *(void **)(a1 + 32);
      v9 = v8;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v44[0] = v9;
      v10 = *(void **)(a1 + 40);
      v11 = v10;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v44[1] = v11;
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3_139;
      v38 = &unk_1E9F9BA48;
      v39 = *(id *)(a1 + 72);
      v12 = _Block_copy(&v35);
      v44[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3, v35, v36, v37, v38);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getPlayerTabsItem"), v13);

      if (v10)
      {
        if (v8)
        {
LABEL_9:
          v15 = v39;
          goto LABEL_31;
        }
      }
      else
      {

        if (v8)
          goto LABEL_9;
      }

      goto LABEL_9;
    }
    v26 = *(void **)(a1 + 32);
    v27 = v26;
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45[0] = v27;
    v28 = *(void **)(a1 + 40);
    v29 = v28;
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45[1] = v29;
    v30 = *(void **)(a1 + 48);
    v31 = v30;
    if (!v30)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45[2] = v31;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3;
    v40[3] = &unk_1E9F9BA48;
    v41 = *(id *)(a1 + 72);
    v32 = _Block_copy(v40);
    v45[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getPlayerTabsItemWithPlayablePassThrough"), v33);

    if (v30)
    {
      if (v28)
        goto LABEL_29;
    }
    else
    {

      if (v28)
      {
LABEL_29:
        if (v26)
        {
LABEL_30:
          v15 = v41;
          goto LABEL_31;
        }
LABEL_36:

        goto LABEL_30;
      }
    }

    if (v26)
      goto LABEL_30;
    goto LABEL_36;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = v16;
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("canonicalId"));
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("adamId"));
  v19 = *(_QWORD *)(a1 + 48);
  if (v19)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("playablePassThrough"));
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("programId"));
  v21 = *(_QWORD *)(a1 + 64);
  if (v21)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("contentId"));
  v22 = (void *)objc_msgSend(v15, "copy");
  v46[0] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2;
  aBlock[3] = &unk_1E9F9BA48;
  v43 = *(id *)(a1 + 72);
  v23 = _Block_copy(aBlock);
  v46[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", CFSTR("getPlayerTabsItemWithParams"), v24);

LABEL_31:
}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  VUIPlaybackTabInfo *v7;
  VUIPlaybackTabInfo *v8;
  id v9;
  _QWORD v10[4];
  VUIPlaybackTabInfo *v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  VUIPlaybackTabInfo *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Error occurred while fetching tabs: %@", buf, 0xCu);
    }

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PlaybackTabErrorNoCanonicalOrAdamId")))
      v6 = 1;
    else
      v6 = 2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_132;
    block[3] = &unk_1E9F99A10;
    v15 = (VUIPlaybackTabInfo *)*(id *)(a1 + 32);
    v16 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v15;
  }
  else
  {
    v8 = -[VUIPlaybackTabInfo initWithDictionary:]([VUIPlaybackTabInfo alloc], "initWithDictionary:", v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_133;
    v10[3] = &unk_1E9F9F418;
    v9 = *(id *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    v13 = 0;
    v7 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_133(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  VUIPlaybackTabInfo *v7;
  VUIPlaybackTabInfo *v8;
  id v9;
  _QWORD v10[4];
  VUIPlaybackTabInfo *v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  VUIPlaybackTabInfo *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Error occurred while fetching tabs: %@", buf, 0xCu);
    }

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PlaybackTabErrorNoCanonicalOrAdamId")))
      v6 = 1;
    else
      v6 = 2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_137;
    block[3] = &unk_1E9F99A10;
    v15 = (VUIPlaybackTabInfo *)*(id *)(a1 + 32);
    v16 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v15;
  }
  else
  {
    v8 = -[VUIPlaybackTabInfo initWithDictionary:]([VUIPlaybackTabInfo alloc], "initWithDictionary:", v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_138;
    v10[3] = &unk_1E9F9F418;
    v9 = *(id *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    v13 = 0;
    v7 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_138(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_3_139(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  VUIPlaybackTabInfo *v7;
  VUIPlaybackTabInfo *v8;
  id v9;
  _QWORD v10[4];
  VUIPlaybackTabInfo *v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  VUIPlaybackTabInfo *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Error occurred while fetching tabs: %@", buf, 0xCu);
    }

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("PlaybackTabErrorNoCanonicalOrAdamId")))
      v6 = 1;
    else
      v6 = 2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_140;
    block[3] = &unk_1E9F99A10;
    v15 = (VUIPlaybackTabInfo *)*(id *)(a1 + 32);
    v16 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v15;
  }
  else
  {
    v8 = -[VUIPlaybackTabInfo initWithDictionary:]([VUIPlaybackTabInfo alloc], "initWithDictionary:", v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_141;
    v10[3] = &unk_1E9F9F418;
    v9 = *(id *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    v13 = 0;
    v7 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __106__VUIPlaybackTabManager__getTabsForCanonicalId_adamId_playablePassThrough_programId_contentId_completion___block_invoke_2_141(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)_updateHUDsForAVPlayerViewController:(id)a3 tabInfo:(id)a4 excludingCanonicals:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  id obj;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v38 = a5;
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v34 = v8;
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v33 = v9;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (!v10)
      goto LABEL_17;
    v11 = v10;
    v12 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v14, "tabId", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlaybackTabManager hudViewControllers](self, "hudViewControllers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v17, "hudContentViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIPlaybackTabManager updatePrefetchedDataOnExistingHUDContentViewController:excludingCanonicals:](self, "updatePrefetchedDataOnExistingHUDContentViewController:excludingCanonicals:", v18, v38);

        }
        else
        {
          objc_msgSend(v36, "currentMediaItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataBroadcastLocale"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaysFromStartOfLiveStream"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "BOOLValue");

          -[VUIPlaybackTabManager createHUDViewControllerWithTabInfo:excludingCanonicals:isMultiview:locale:playsFromStart:](self, "createHUDViewControllerWithTabInfo:excludingCanonicals:isMultiview:locale:playsFromStart:", v14, v38, 0, v20, v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "bounds");
          objc_msgSend(v17, "setPlayerViewSize:", v24, v25);

          if (!v17)
            goto LABEL_15;
        }
        objc_msgSend(v17, "hudContentViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "conformsToProtocol:", &unk_1F0344378))
        {
          v27 = v26;
          objc_msgSend(v36, "nowPlayingControllerDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setNowPlayingTabDelegate:", v28);

        }
        objc_msgSend(v17, "title");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "length");

        if (!v30)
        {
          objc_msgSend(v14, "title");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setTitle:", v31);

        }
        objc_msgSend(v37, "addObject:", v17);

LABEL_15:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v11)
      {
LABEL_17:

        v8 = v34;
        if (objc_msgSend(v37, "count"))
          objc_msgSend(v34, "setCustomInfoViewControllers:", v37);

        v9 = v33;
        goto LABEL_23;
      }
    }
  }
  VUIDefaultLogObject();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::No tabs are received, reset existing tabs if available and return early", buf, 2u);
  }

  -[VUIPlaybackTabManager resetPlayerTabsForPlayerViewController:](self, "resetPlayerTabsForPlayerViewController:", v8);
LABEL_23:

}

- (id)_createHudContentViewControllerWithTabId:(id)a3 excludingCanonicals:(id)a4 isMultiview:(BOOL)a5 locale:(id)a6 playsFromStart:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  VUIDocumentDataSource *v18;
  VUIDocumentDataSource *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v35;
  void *v36;
  uint64_t v37;

  v7 = a7;
  v9 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("uts.marker.Spotlight")))
  {
    VUIDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Creating timed metadata controller", (uint8_t *)&v35, 2u);
    }

    v18 = -[VUIDocumentDataSource initWithDocumentRef:]([VUIDocumentDataSource alloc], "initWithDocumentRef:", CFSTR("TimedMetadata"));
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v19 = (VUIDocumentDataSource *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackTabManager appContext](self, "appContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDocumentDataSource viewControllerWithDocumentDataSource:appContext:](v19, "viewControllerWithDocumentDataSource:appContext:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIPlaybackTabManager _createPrefetchedDataForPlayerHUDWithTabId:excludingCanonicals:isMultiview:locale:playsFromStart:](self, "_createPrefetchedDataForPlayerHUDWithTabId:excludingCanonicals:isMultiview:locale:playsFromStart:", v12, v13, v9, v14, v7);
    v18 = (VUIDocumentDataSource *)objc_claimAutoreleasedReturnValue();
    -[VUIDocumentDataSource jsonData](v18, "jsonData");
    v22 = objc_claimAutoreleasedReturnValue();

    VUIDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIDocumentDataSource jsonData](v18, "jsonData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412290;
      v36 = v24;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Creating hud content controller with data: [%@]", (uint8_t *)&v35, 0xCu);

    }
    v19 = -[VUIDocumentDataSource initWithDocumentRef:]([VUIDocumentDataSource alloc], "initWithDocumentRef:", CFSTR("PlayerHUD"));
    -[VUIPlaybackTabManager appContext](self, "appContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDocumentDataSource setDocumentType:](v19, "setDocumentType:", CFSTR("player"));
    -[VUIDocumentDataSource setControllerRef:](v19, "setControllerRef:", CFSTR("PlayerHUD"));
    -[VUIDocumentDataSource setPrefetchData:](v19, "setPrefetchData:", v18);
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "viewControllerWithDocumentDataSource:appContext:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)v22;
  }

  if (objc_msgSend(v21, "conformsToProtocol:", &unk_1F0344378))
  {
    v26 = v21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "nowPlayingControllerDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setNowPlayingTabDelegate:", v27);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "setNowPlayingTabContextData:", v16);
    objc_msgSend(v15, "playerViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30;
    v33 = v32;

    objc_msgSend(v26, "setPlayerViewSize:", v31, v33);
  }

  return v21;
}

- (id)_createPrefetchedDataForPlayerHUDWithTabId:(id)a3 excludingCanonicals:(id)a4 isMultiview:(BOOL)a5 locale:(id)a6 playsFromStart:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a7;
  v9 = a5;
  v12 = a4;
  v13 = a6;
  v14 = a3;
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setTabId:", v14);

  -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "canonicalId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v16, "setCanonicalId:", v18);
  if (v12)
    objc_msgSend(v16, "setExcludedCanonicals:", v12);
  v19 = objc_msgSend(v15, "multiviewPlayerCount");
  if (v19 == objc_msgSend(v15, "maxMultiviewPlayerCount"))
  {
    objc_msgSend(v16, "setIncludeMultiviewButton:", 0);
  }
  else
  {
    -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "multiviewTabInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIncludeMultiviewButton:", v21 != 0);

  }
  objc_msgSend(v16, "setIsMultiviewPlayer:", v9);
  objc_msgSend(v16, "setPlayFromStart:", v7);
  objc_msgSend(v15, "multiviewIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMultiviewIdentifiers:", v22);

  objc_msgSend(v16, "setLocale:", v13);
  return v16;
}

- (void)updatePrefetchedDataOnExistingHUDContentViewController:(id)a3 excludingCanonicals:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  VUIDocumentPreFetchedDataPlayerHUD *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_1F0344378))
  {
    v8 = v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "getNowPlayingTabContextData");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = -[VUIDocumentPreFetchedDataPlayerHUD initWithDictionary:]([VUIDocumentPreFetchedDataPlayerHUD alloc], "initWithDictionary:", v9);
        -[VUIDocumentPreFetchedDataPlayerHUD setExcludedCanonicals:](v11, "setExcludedCanonicals:", v6);
        objc_msgSend(v7, "multiviewIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDocumentPreFetchedDataPlayerHUD setMultiviewIdentifiers:](v11, "setMultiviewIdentifiers:", v12);

        v13 = objc_msgSend(v7, "multiviewPlayerCount");
        if (v13 == objc_msgSend(v7, "maxMultiviewPlayerCount"))
        {
          -[VUIDocumentPreFetchedDataPlayerHUD setIncludeMultiviewButton:](v11, "setIncludeMultiviewButton:", 0);
        }
        else
        {
          -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "multiviewTabInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIDocumentPreFetchedDataPlayerHUD setIncludeMultiviewButton:](v11, "setIncludeMultiviewButton:", v15 != 0);

        }
        -[VUIDocumentPreFetchedDataPlayerHUD jsonData](v11, "jsonData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "setNowPlayingTabContextData:", v16);

      }
    }

  }
}

- (id)appContext
{
  void *v2;
  void *v3;
  void *v4;

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)playTitleForFromBeginningAction
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[VUIPlaybackTabManager _isCurrentMediaSportingEvent](self, "_isCurrentMediaSportingEvent");
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("WATCH_FROM_START");
  else
    v5 = CFSTR("START_PLAYBACK_FROM_BEGINNING");
  objc_msgSend(v3, "localizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (UIImage)playImageForFromBeginningAction
{
  const __CFString *v2;

  if (-[VUIPlaybackTabManager _isCurrentMediaSportingEvent](self, "_isCurrentMediaSportingEvent"))
    v2 = CFSTR("arrow.counterclockwise");
  else
    v2 = CFSTR("play.fill");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v2);
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)recordPageMetricsForInfoTab
{
  -[VUIPlaybackTabManager recordPageMetricsForSelectedTab:tabName:pageID:](self, "recordPageMetricsForSelectedTab:tabName:pageID:", *MEMORY[0x1E0C8B3F0], &stru_1E9FF3598, &stru_1E9FF3598);
}

- (void)recordPageMetricsForSelectedTab:(id)a3 tabName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VUIPlaybackTabManager _getPageIDForTabName:](self, "_getPageIDForTabName:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackTabManager recordPageMetricsForSelectedTab:tabName:pageID:](self, "recordPageMetricsForSelectedTab:tabName:pageID:", v7, v6, v8);

}

- (id)getPageEventDataWithSelectedTab:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = CFSTR("pageContext");
  v12[0] = CFSTR("player");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8B3F0]))
  {
    -[VUIPlaybackTabManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentMediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:](VUIMetricsPageEventData, "createWithPageId:andPageType:andEventData:", v8, CFSTR("Player"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VUIPlaybackTabManager _getPageIDForTabName:](self, "_getPageIDForTabName:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:](VUIMetricsPageEventData, "createWithPageId:andPageType:andEventData:", v7, CFSTR("Player"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)recordPageMetricsForSelectedTab:(id)a3 tabName:(id)a4 pageID:(id)a5
{
  void *v5;
  id v6;

  -[VUIPlaybackTabManager getPageEventDataWithSelectedTab:](self, "getPageEventDataWithSelectedTab:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordPage:", v6);

}

- (id)_getPageIDForTabName:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Up Next")))
  {
    v4 = CFSTR("UpNext");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Live Sports")))
  {
    v4 = CFSTR("LiveSports");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Key Plays")))
  {
    v4 = CFSTR("keyPlays");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("InSight")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    v4 = CFSTR("insight");
  }
  v5 = (void *)-[__CFString copy](v4, "copy");
LABEL_10:

  return v5;
}

- (BOOL)_isCurrentMediaSportingEvent
{
  void *v2;
  void *v3;

  -[VUIPlaybackTabManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "hasTrait:", VUIMediaItemTraitIsSportingEvent);
  return (char)v2;
}

- (BOOL)isCurrentMediaMovie
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[VUIPlaybackTabManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DD0]);

  return v5;
}

- (BOOL)isCurrentMediaTVShow
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[VUIPlaybackTabManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);

  return v5;
}

- (BOOL)_isCurrentMediaLive
{
  void *v2;
  void *v3;

  -[VUIPlaybackTabManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "hasTrait:", *MEMORY[0x1E0DB1D60]);
  return (char)v2;
}

- (BOOL)_isInsightTabAvailable
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    return 0;
  -[VUIPlaybackTabManager tabsInfo](self, "tabsInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "tabId", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("uts.marker.Spotlight"));

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)_updateTimedMetadataEligibilityFlagInCurrentMediaItem
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[VUIPlaybackTabManager _isInsightTabAvailable](self, "_isInsightTabAvailable");
  v6 = sTimedMetadataLogObject;
  if (os_log_type_enabled((os_log_t)sTimedMetadataLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIPlaybackTabManager::Setting isEligibleForTimedMetadata - %@ for title - %@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaItemMetadata:forProperty:", v8, CFSTR("isEligibleForTimedMetadata"));

}

- (BOOL)shouldShowMoreInfoButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  -[VUIPlaybackTabManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[VUIPlaybackTabManager isCurrentMediaMovie](self, "isCurrentMediaMovie")
     || -[VUIPlaybackTabManager _isCurrentMediaSportingEvent](self, "_isCurrentMediaSportingEvent"))
    && objc_msgSend(v5, "length"))
  {
    v7 = 1;
  }
  else
  {
    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isCurrentMediaTVShow"))
      v7 = objc_msgSend(v6, "length") != 0;
    else
      v7 = 0;

  }
  return v7;
}

- (BOOL)shouldShowPlayFromBeginningButtonForMediaInfo
{
  uint64_t v3;
  char v4;
  BOOL v5;

  -[VUIPlaybackTabManager delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)v3, "mediaSupportsStartOver");

  LOBYTE(v3) = -[VUIPlaybackTabManager _isCurrentMediaSportingEvent](self, "_isCurrentMediaSportingEvent");
  v5 = -[VUIPlaybackTabManager _isCurrentMediaLive](self, "_isCurrentMediaLive");
  return (v3 | v5) & v4 | (v3 | v5) ^ 1;
}

- (NSString)moreInfoTitle
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isCurrentMediaSportingEvent");
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("MORE_INFO");
  else
    v6 = CFSTR("DETAILS");
  objc_msgSend(v4, "localizedStringForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)_documentRefContextDataForCurrentMediaTypeWithCanonicalID:(id)a3 showCanonicalID:(id)a4
{
  id v6;
  id v7;
  VUIDocumentContextDataTVShow *v8;
  VUIDocumentContextDataTVShow *v9;

  v6 = a3;
  v7 = a4;
  if (!-[VUIPlaybackTabManager isCurrentMediaMovie](self, "isCurrentMediaMovie")
    && !-[VUIPlaybackTabManager _isCurrentMediaSportingEvent](self, "_isCurrentMediaSportingEvent"))
  {
    if (-[VUIPlaybackTabManager isCurrentMediaTVShow](self, "isCurrentMediaTVShow") && objc_msgSend(v7, "length"))
    {
      v8 = -[VUIDocumentContextDataTVShow initWithShowID:episodeID:]([VUIDocumentContextDataTVShow alloc], "initWithShowID:episodeID:", v7, v6);
      goto LABEL_5;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "length"))
    goto LABEL_9;
  v8 = -[VUIDocumentContextDataMovie initWithMovieID:]([VUIDocumentContextDataMovie alloc], "initWithMovieID:", v6);
LABEL_5:
  v9 = v8;
LABEL_10:

  return v9;
}

- (id)moreInfoViewControllerWithAppContext:(id)a3
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __CFString **v13;
  void *v14;
  int v15;
  id v16;
  __CFString *v17;
  VUIDocumentDataSource *v18;
  VUIDocumentUIConfiguration *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = CFSTR("MovieCanonical");
  v6 = a3;
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_isCurrentMediaSportingEvent");

  if ((v12 & 1) != 0)
  {
    v13 = VUIDocumentRefSportsCanonical;
LABEL_5:
    v17 = *v13;

    v5 = v17;
    goto LABEL_6;
  }
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCurrentMediaTVShow");

  if (v15)
  {
    v16 = v10;

    v13 = VUIDocumentRefTVShowCanonical;
    v9 = v16;
    goto LABEL_5;
  }
LABEL_6:
  v18 = -[VUIDocumentDataSource initWithDocumentRef:]([VUIDocumentDataSource alloc], "initWithDocumentRef:", v5);
  -[VUIDocumentDataSource setDocumentType:](v18, "setDocumentType:", CFSTR("canonical"));
  -[VUIDocumentDataSource setControllerRef:](v18, "setControllerRef:", v5);
  v19 = objc_alloc_init(VUIDocumentUIConfiguration);
  -[VUIDocumentUIConfiguration setViewControllerDocumentIdentifier:](v19, "setViewControllerDocumentIdentifier:", v9);
  -[VUIDocumentDataSource setUiConfiguration:](v18, "setUiConfiguration:", v19);
  -[VUIPlaybackTabManager _documentRefContextDataForCurrentMediaTypeWithCanonicalID:showCanonicalID:](self, "_documentRefContextDataForCurrentMediaTypeWithCanonicalID:showCanonicalID:", v9, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDocumentDataSource setContextData:](v18, "setContextData:", v20);

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewControllerWithDocumentDataSource:appContext:", v18, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)_isInfoHUDButtonPresent:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("play")))
  {
    v5 = -[VUIPlaybackTabManager shouldShowPlayFromBeginningButtonForMediaInfo](self, "shouldShowPlayFromBeginningButtonForMediaInfo");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("navigate")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[VUIPlaybackTabManager shouldShowMoreInfoButton](self, "shouldShowMoreInfoButton");
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)createClickMetricsWithType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[VUIPlaybackTabManager _isInfoHUDButtonPresent:](self, "_isInfoHUDButtonPresent:", v4))
  {
    v9[0] = CFSTR("targetType");
    v9[1] = CFSTR("actionType");
    v10[0] = CFSTR("button");
    v10[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[VUIPlaybackTabManager _addMetadataInfoToEvent:](self, "_addMetadataInfoToEvent:", v6);
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_addMetadataInfoToEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString **v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIPlaybackTabManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("brandId"));
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);
    v11 = VUIMetricsMediaContentTypeEpisode;
    if (!v10)
      v11 = VUIMetricsMediaContentTypeMovie;
    objc_msgSend(v4, "setObject:forKey:", *v11, CFSTR("contentType"));
  }
  objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("targetId"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("play")))
    {
      -[VUIPlaybackTabManager playTitleForFromBeginningAction](self, "playTitleForFromBeginningAction");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("navigate")))
      {
        v15 = 0;
        goto LABEL_16;
      }
      -[VUIPlaybackTabManager moreInfoTitle](self, "moreInfoTitle");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
LABEL_16:
    if (objc_msgSend(v15, "length"))
    {
      v17 = CFSTR("name");
      v18[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("actionDetails"));

    }
  }

}

- (void)reportPlayFromBeginningMetrics
{
  void *v2;
  id v3;

  -[VUIPlaybackTabManager createClickMetricsWithType:](self, "createClickMetricsWithType:", CFSTR("play"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordClick:", v3);

}

- (void)reportMoreInfoMetrics
{
  void *v2;
  id v3;

  -[VUIPlaybackTabManager createClickMetricsWithType:](self, "createClickMetricsWithType:", CFSTR("navigate"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordClick:", v3);

}

- (VUIPlaybackTabManagerDelegate)delegate
{
  return (VUIPlaybackTabManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIPlaybackTabInfo)tabsInfo
{
  return self->_tabsInfo;
}

- (void)setTabsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_tabsInfo, a3);
}

- (int64_t)playbackTabError
{
  return self->_playbackTabError;
}

- (void)setPlaybackTabError:(int64_t)a3
{
  self->_playbackTabError = a3;
}

- (double)playbackFromBeginningTimeOffset
{
  return self->_playbackFromBeginningTimeOffset;
}

- (NSMutableDictionary)hudViewControllers
{
  return self->_hudViewControllers;
}

- (void)setHudViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_hudViewControllers, a3);
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (void)setLastRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_hudViewControllers, 0);
  objc_storeStrong((id *)&self->_tabsInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
