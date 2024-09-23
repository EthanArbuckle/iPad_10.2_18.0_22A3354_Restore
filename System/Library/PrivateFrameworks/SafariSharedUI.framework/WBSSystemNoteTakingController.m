@implementation WBSSystemNoteTakingController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_setUpNotesVisibilityObserver
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  SYNotesActivationObserver *v7;
  SYNotesActivationObserver *notesActivationObserver;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (!self->_notesActivationObserver)
  {
    objc_initWeak(&location, self);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v3 = (void *)getSYNotesActivationObserverClass_softClass;
    v16 = getSYNotesActivationObserverClass_softClass;
    v4 = MEMORY[0x1E0C809B0];
    if (!getSYNotesActivationObserverClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getSYNotesActivationObserverClass_block_invoke;
      v12[3] = &unk_1E54424C0;
      v12[4] = &v13;
      __getSYNotesActivationObserverClass_block_invoke((uint64_t)v12);
      v3 = (void *)v14[3];
    }
    v5 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v13, 8);
    v6 = [v5 alloc];
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke;
    v9[3] = &unk_1E54469D0;
    objc_copyWeak(&v10, &location);
    v7 = (SYNotesActivationObserver *)objc_msgSend(v6, "initWithHandler:", v9);
    notesActivationObserver = self->_notesActivationObserver;
    self->_notesActivationObserver = v7;

    self->_isNotesPIPVisible = -[SYNotesActivationObserver isVisible](self->_notesActivationObserver, "isVisible");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (WBSSystemNoteTakingController)init
{
  WBSSystemNoteTakingController *v2;
  id *p_isa;
  void *v4;
  objc_class *v5;
  WBSSystemNoteTakingController *v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v11.receiver = self;
  v11.super_class = (Class)WBSSystemNoteTakingController;
  v2 = -[WBSSystemNoteTakingController init](&v11, sel_init);
  p_isa = (id *)&v2->super.isa;
  if (v2 && -[WBSSystemNoteTakingController _isSystemNoteTakingEnabled](v2, "_isSystemNoteTakingEnabled"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v4 = (void *)getSYLinkContextClientClass_softClass;
    v16 = getSYLinkContextClientClass_softClass;
    if (!getSYLinkContextClientClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getSYLinkContextClientClass_block_invoke;
      v12[3] = &unk_1E54424C0;
      v12[4] = &v13;
      __getSYLinkContextClientClass_block_invoke((uint64_t)v12);
      v4 = (void *)v14[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v13, 8);
    v6 = (WBSSystemNoteTakingController *)objc_alloc_init(v5);
    v7 = p_isa[1];
    p_isa[1] = v6;

    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(p_isa[1], "setDelegate:", p_isa);
      v8 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      v9 = p_isa[2];
      p_isa[2] = v8;

      objc_msgSend(p_isa[2], "setTotalCostLimit:", 1000);
      objc_msgSend(p_isa, "_setUpNotesVisibilityObserver");
      v6 = p_isa;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isNoteTakingSupportedWithPrivateBrowsing:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  id WeakRetained;
  char v7;

  v3 = a3;
  v5 = -[WBSSystemNoteTakingController _isSystemNoteTakingEnabled](self, "_isSystemNoteTakingEnabled");
  if (v5 && v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "isNoteTakingControllerSupportedInPrivateBrowsing:", self);

    LOBYTE(v5) = v7;
  }
  return v5;
}

- (BOOL)_isSystemNoteTakingEnabled
{
  void *v3;
  id v4;
  int v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  Class (*v12)(uint64_t);
  void *v13;
  uint64_t *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!SynapseLibraryCore_frameworkLibrary)
  {
    v11 = xmmword_1E54469F0;
    v12 = 0;
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (SynapseLibraryCore_frameworkLibrary)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2050000000;
    v3 = (void *)getSYFeatureEligibilityClass_softClass;
    v10 = getSYFeatureEligibilityClass_softClass;
    if (!getSYFeatureEligibilityClass_softClass)
    {
      *(_QWORD *)&v11 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v11 + 1) = 3221225472;
      v12 = __getSYFeatureEligibilityClass_block_invoke;
      v13 = &unk_1E54424C0;
      v14 = &v7;
      __getSYFeatureEligibilityClass_block_invoke((uint64_t)&v11);
      v3 = (void *)v8[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v7, 8);
    v5 = objc_msgSend(v4, "supportsQuickNote", v7);
    if (v5)
      LOBYTE(v5) = -[WBSSystemNoteTakingController _isSystemNoteTakingEnabledForSafari](self, "_isSystemNoteTakingEnabledForSafari");
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

void __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateNotesPIPVisibility:", *(unsigned __int8 *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_updateNotesPIPVisibility:(BOOL)a3
{
  if (self->_isNotesPIPVisible != a3)
  {
    -[WBSSystemNoteTakingController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("WBSNotesPIPVisibilityChanged"));
    self->_isNotesPIPVisible = a3;
    -[WBSSystemNoteTakingController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("WBSNotesPIPVisibilityChanged"));
  }
}

void __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke_2;
  v3[3] = &unk_1E54469A8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

- (void)saveHighlightsData:(id)a3 selectedText:(id)a4 selectedImage:(id)a5 newGroup:(BOOL)a6 originatedInApp:(BOOL)a7 webView:(id)a8 userActivity:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke;
  block[3] = &unk_1E54468F0;
  block[4] = self;
  v26 = v18;
  v27 = v19;
  v28 = v15;
  v29 = v17;
  v30 = v16;
  v31 = a7;
  v32 = a6;
  v20 = v16;
  v21 = v17;
  v22 = v15;
  v23 = v19;
  v24 = v18;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  char v14;
  id location;

  +[WBSSystemNoteTakingLinkMetadataFetcher sharedFetcher](WBSSystemNoteTakingLinkMetadataFetcher, "sharedFetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2;
  v5[3] = &unk_1E54468C8;
  objc_copyWeak(&v12, &location);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v4 = v2;
  v8 = v4;
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v13 = *(_BYTE *)(a1 + 80);
  v11 = *(id *)(a1 + 40);
  v14 = *(_BYTE *)(a1 + 81);
  objc_msgSend(v4, "fetchMetadataForWebView:completion:", v3, v5);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *WeakRetained;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2_cold_1(v7, v6);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "insertCanonicalURLIfAvailableForUserActivity:", *(_QWORD *)(a1 + 32));
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v14 = CFSTR("linkContextData");
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_insertLinkContextInfo:userActivity:", v11, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(*(id *)(a1 + 48), "linkContextPreviewForMetadata:image:selectedText:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 88))
    {
      v13 = objc_loadWeakRetained(v9 + 5);
      objc_msgSend(v13, "notifyAddedLinkPreviewMetadata:toUserActivity:webView:", v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9[1], "createAndShowContextualLinkWithUserActivity:linkPreviewMetadata:preferNewDocument:completion:", *(_QWORD *)(a1 + 32), v12, *(unsigned __int8 *)(a1 + 89), &__block_literal_global_42);
    }

  }
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_11_cold_1(v4, v3);
  }

}

- (void)userWillAddLinkWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__WBSSystemNoteTakingController_userWillAddLinkWithActivity_completion___block_invoke;
  v10[3] = &unk_1E5445C90;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __72__WBSSystemNoteTakingController_userWillAddLinkWithActivity_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v3, "noteTakingController:addHighlightForUserActivity:completion:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)applyHighlightInUserActivity:(id)a3 webView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a4;
  objc_msgSend(a3, "_linkContextInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "safari_dataForKey:", CFSTR("linkContextData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "Found a note-taking user activity with valid highlight.", v10, 2u);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "_restoreAndScrollToAppHighlight:", v8);
    }

  }
}

- (void)fetchHighlightsForUserActivity:(id)a3 privateBrowsing:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  SYLinkContextClient *linkContextClient;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[5];
  uint8_t buf[8];
  id location;
  _QWORD v18[5];
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__23;
  v18[4] = __Block_byref_object_dispose__23;
  v19 = (id)MEMORY[0x1A85D45E4]();
  objc_initWeak(&location, self);
  if (-[WBSSystemNoteTakingController isNoteTakingSupportedWithPrivateBrowsing:](self, "isNoteTakingSupportedWithPrivateBrowsing:", v6))
  {
    objc_msgSend(v8, "_canonicalURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[WBSSystemNoteTakingController insertCanonicalURLIfAvailableForUserActivity:](self, "insertCanonicalURLIfAvailableForUserActivity:", v8);
    linkContextClient = self->_linkContextClient;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2;
    v13[3] = &unk_1E5446980;
    objc_copyWeak(&v14, &location);
    v13[4] = v18;
    -[SYLinkContextClient fetchLinkContextsForUserActivity:completion:](linkContextClient, "fetchLinkContextsForUserActivity:completion:", v8, v13);
    objc_destroyWeak(&v14);
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A840B000, v12, OS_LOG_TYPE_INFO, "Not fetching highlights since client is in Private Browsing", buf, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke;
    block[3] = &unk_1E54424C0;
    block[4] = v18;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(v18, 8);

}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_cold_1(v7, v6);
    goto LABEL_4;
  }
  if (!objc_msgSend(v5, "count"))
  {
LABEL_4:
    v8 = 0;
    goto LABEL_5;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_6;
  v11 = WeakRetained;
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_20;
  block[3] = &unk_1E5446958;
  v15 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  v14 = v6;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_6:
}

uint64_t __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_dataForKey:", CFSTR("linkContextData"));
}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_20(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (BOOL)_isSystemNoteTakingEnabledForSafari
{
  return 0;
}

- (void)_insertLinkContextInfo:(id)a3 userActivity:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  if (!SynapseLibraryCore_frameworkLibrary)
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  if (SynapseLibraryCore_frameworkLibrary)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "set_linkContextInfo:", v5);
    else
      objc_msgSend(v6, "setLinkContextInfo:", v5);
  }

}

- (void)_insertLinkContextPreview:(id)a3 userActivity:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  if (!SynapseLibraryCore_frameworkLibrary)
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  if (SynapseLibraryCore_frameworkLibrary && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "set_linkContextPreviewMetadata:", v5);

}

- (void)insertCanonicalURLIfAvailableForUserActivity:(id)a3
{
  id v4;
  void *v5;
  NSCache *cachedCanonicalURLStringForWebPageURLString;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!SynapseLibraryCore_frameworkLibrary)
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  if (SynapseLibraryCore_frameworkLibrary)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    cachedCanonicalURLStringForWebPageURLString = self->_cachedCanonicalURLStringForWebPageURLString;
    objc_msgSend(v4, "webpageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](cachedCanonicalURLStringForWebPageURLString, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "set_canonicalURL:", v10);

  }
}

- (void)cacheCanonicalURL:(id)a3 forWebPageURL:(id)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(a4, "absoluteString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCache setObject:forKey:cost:](self->_cachedCanonicalURLStringForWebPageURLString, "setObject:forKey:cost:", v7, v8, objc_msgSend(v8, "length") + objc_msgSend(v7, "length") + 16);
  }
}

- (id)userActivityForNoteTaking:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (!SynapseLibraryCore_frameworkLibrary)
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
  if (SynapseLibraryCore_frameworkLibrary)
  {
    objc_msgSend(v3, "_linkContextInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = v3;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isNoteTakingSupportedForURL:(id)a3
{
  return objc_msgSend(a3, "safari_isHTTPFamilyURL");
}

- (WBSSystemNoteTakingControllerDelegate)delegate
{
  return (WBSSystemNoteTakingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isNotesPIPVisible
{
  return self->_isNotesPIPVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notesActivationObserver, 0);
  objc_storeStrong((id *)&self->_cachedCanonicalURLStringForWebPageURLString, 0);
  objc_storeStrong((id *)&self->_linkContextClient, 0);
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Failed to fetch page metadata. Continuing with limited metadata. (%{public}@)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_11_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Failed to create link context: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Failed to fetch link context: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
