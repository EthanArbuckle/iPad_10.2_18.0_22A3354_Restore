@implementation SUICVoiceSelectionPresenter

- (SUICVoiceSelectionPresenter)initWithDataManaging:(id)a3 view:(id)a4 delegate:(id)a5 voicePreviewing:(id)a6 recognitionLanguage:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SUICVoiceSelectionPresenter *v18;
  SUICVoiceSelectionPresenter *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SUICVoiceSelectionPresenter;
  v18 = -[SUICVoiceSelectionPresenter init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dataManager, a3);
    objc_storeStrong((id *)&v19->_view, a4);
    objc_storeWeak((id *)&v19->_delegate, v15);
    objc_storeStrong((id *)&v19->_voicePreviewer, a6);
    -[SUICVoicePreviewing setDelegate:](v19->_voicePreviewer, "setDelegate:", v19);
    -[SUICVoiceSelectionPresenter _determineVoiceOrdering](v19, "_determineVoiceOrdering");
    -[SUICVoiceSelectionDataManaging setVoiceSelectionDataProviderObserver:](v19->_dataManager, "setVoiceSelectionDataProviderObserver:", v19);
    -[SUICVoiceSelectionDisplaying setVoiceSelectionEventHandler:](v19->_view, "setVoiceSelectionEventHandler:", v19);
    -[SUICVoiceSelectionDisplaying setVoiceSelectionViewModelProvider:](v19->_view, "setVoiceSelectionViewModelProvider:", v19);
    -[SUICVoiceSelectionDataManaging setRecognitionLanguageCode:](v19->_dataManager, "setRecognitionLanguageCode:", v17);
  }

  return v19;
}

- (void)selectRandomVoiceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUICVoiceSelectionDataManaging voiceSelectionVoiceCollection](self->_dataManager, "voiceSelectionVoiceCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "randomVoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SUICVoiceSelectionPresenter selectRandomVoiceWithCompletion:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1A3752000, v7, OS_LOG_TYPE_DEFAULT, "%s Randomly selected voice:%@", buf, 0x16u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke;
  v10[3] = &unk_1E4A55410;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  -[SUICVoiceSelectionPresenter _processVoiceSelection:completion:](self, "_processVoiceSelection:completion:", v9, v10);

}

void __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CFE6A0];
  v7 = *MEMORY[0x1E0CFE6A0];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 136315650;
      v11 = "-[SUICVoiceSelectionPresenter selectRandomVoiceWithCompletion:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1A3752000, v6, OS_LOG_TYPE_DEFAULT, "%s Processed randomly selected voice:%@ error:%@", (uint8_t *)&v10, 0x20u);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke_cold_1();
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)stopVoicePreview
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUICVoicePreviewing stopVoicePreview](self->_voicePreviewer, "stopVoicePreview");
}

- (void)_determineVoiceOrdering
{
  NSObject *v3;
  _BOOL4 reverseVoiceOrder;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_reverseVoiceOrder = 0;
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    reverseVoiceOrder = self->_reverseVoiceOrder;
    v5 = 136315394;
    v6 = "-[SUICVoiceSelectionPresenter _determineVoiceOrdering]";
    v7 = 1024;
    v8 = reverseVoiceOrder;
    _os_log_impl(&dword_1A3752000, v3, OS_LOG_TYPE_DEFAULT, "%s Should reverse order: %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)voiceSelectionDataProviderVoiceCollectionDidChange:(id)a3
{
  SUICVoiceSelectionPresenterDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "voiceSelectionVoiceCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentVoice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presenter:didChangeVoiceSelection:", self, v8);

  -[SUICVoiceSelectionDisplaying voiceSelectionViewModelDidChange](self->_view, "voiceSelectionViewModelDidChange");
}

- (void)voiceSelectionView:(id)a3 receivedRequestToSelectVoice:(id)a4
{
  id v5;

  objc_msgSend(a4, "voiceInfo", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUICVoiceSelectionPresenter _processVoiceSelection:completion:](self, "_processVoiceSelection:completion:", v5, 0);

}

- (void)_processVoiceSelection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SUICVoiceSelectionDataManaging *dataManager;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  dataManager = self->_dataManager;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke;
  v11[3] = &unk_1E4A55438;
  v9 = v7;
  v13 = v9;
  objc_copyWeak(&v14, &location);
  v10 = v6;
  v12 = v10;
  -[SUICVoiceSelectionDataManaging changeSiriVoiceToVoice:completion:](dataManager, "changeSiriVoiceToVoice:completion:", v10, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_previewVoice:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_previewVoice:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  SUICVoicePreviewing *voicePreviewer;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v7 = a3;
  v8 = a4;
  if ((-[AFVoiceInfo isEqual:](self->_voiceBeingPreviewed, "isEqual:", v7) & 1) != 0)
  {
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SUICVoiceSelectionPresenter _previewVoice:completion:].cold.1();
  }
  else
  {
    objc_storeStrong((id *)&self->_voiceBeingPreviewed, a3);
    -[SUICVoiceSelectionPresenter _logVoicePreview:](self, "_logVoicePreview:", v7);
    objc_initWeak(&location, self);
    voicePreviewer = self->_voicePreviewer;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke;
    v10[3] = &unk_1E4A55488;
    objc_copyWeak(&v13, &location);
    v11 = v7;
    v12 = v8;
    -[SUICVoicePreviewing previewVoice:completion:](voicePreviewer, "previewVoice:completion:", v11, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2;
  block[3] = &unk_1E4A55460;
  objc_copyWeak(&v12, a1 + 6);
  v6 = a1[4];
  v13 = a2;
  v9 = v6;
  v10 = v5;
  v11 = a1[5];
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", WeakRetained[1]))
    {
      v3 = (void *)WeakRetained[1];
      WeakRetained[1] = 0;

    }
    if (!*(_BYTE *)(a1 + 64) && os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2_cold_1();
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  }

}

- (void)voiceSelectionView:(id)a3 receivedRequestToSelectLanguage:(id)a4
{
  SUICVoiceSelectionDataManaging *dataManager;
  id v5;

  dataManager = self->_dataManager;
  objc_msgSend(a4, "languageCode", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUICVoiceSelectionDataManaging changeSiriDialectLanguageToLanguageIdentifiedByLanguageCode:completion:](dataManager, "changeSiriDialectLanguageToLanguageIdentifiedByLanguageCode:completion:", v5, &__block_literal_global_4);

}

void __82__SUICVoiceSelectionPresenter_voiceSelectionView_receivedRequestToSelectLanguage___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[SUICVoiceSelectionPresenter voiceSelectionView:receivedRequestToSelectLanguage:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A3752000, v5, OS_LOG_TYPE_DEFAULT, "%s Error changing Siri Output Accent: %@", (uint8_t *)&v6, 0x16u);
    }
  }

}

- (SUICVoiceSelectionViewModel)voiceSelectionViewModel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  SUICVoiceSelectionViewModelLanguage *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  SUICVoiceSelectionViewModelLanguage *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  SUICVoiceSelectionViewModelVoice *v28;
  void *v29;
  void *v30;
  SUICVoiceSelectionViewModel *v31;
  BOOL reverseVoiceOrder;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  BOOL v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[SUICVoiceSelectionPresenter _voiceCollection](self, "_voiceCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICVoiceSelectionPresenter _localizedDisplayNameForLanguageCode:](self, "_localizedDisplayNameForLanguageCode:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = [SUICVoiceSelectionViewModelLanguage alloc];
  objc_msgSend(v3, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v6;
  v9 = -[SUICVoiceSelectionViewModelLanguage initWithLanguageCode:localizedDisplayName:isCurrentOutputLanguage:](v7, "initWithLanguageCode:localizedDisplayName:isCurrentOutputLanguage:", v8, v6, 1);

  v35 = (void *)v9;
  objc_msgSend(v4, "addObject:", v9);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v3, "dialectLanguageCodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[SUICVoiceSelectionPresenter _localizedDisplayNameForLanguageCode:](self, "_localizedDisplayNameForLanguageCode:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[SUICVoiceSelectionViewModelLanguage initWithLanguageCode:localizedDisplayName:isCurrentOutputLanguage:]([SUICVoiceSelectionViewModelLanguage alloc], "initWithLanguageCode:localizedDisplayName:isCurrentOutputLanguage:", v15, v16, 0);
        objc_msgSend(v4, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v12);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_13);
  reverseVoiceOrder = self->_reverseVoiceOrder;
  v18 = v3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "alternativeVoices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unionSet:", v20);

  v34 = v18;
  objc_msgSend(v18, "currentVoice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v19, "addObject:", v21);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v19, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v23 = v19;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v23);
        v28 = -[SUICVoiceSelectionViewModelVoice initWithVoice:isCurrentSiriVoice:]([SUICVoiceSelectionViewModelVoice alloc], "initWithVoice:isCurrentSiriVoice:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j), *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j) == (_QWORD)v21);
        objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v25);
  }

  objc_msgSend(v22, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = ___SUICGetViewModelVoicesForVoiceCollection_block_invoke;
  v41[3] = &__block_descriptor_33_e11_q24__0_8_16l;
  v42 = reverseVoiceOrder;
  objc_msgSend(v29, "sortedArrayUsingComparator:", v41);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = -[SUICVoiceSelectionViewModel initWithLanguages:voices:]([SUICVoiceSelectionViewModel alloc], "initWithLanguages:voices:", v4, v30);
  return v31;
}

uint64_t __54__SUICVoiceSelectionPresenter_voiceSelectionViewModel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_localizedDisplayNameForLanguageCode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CFE900];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedNameForSiriLanguage:inDisplayLanguage:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_voiceCollection
{
  return (id)-[SUICVoiceSelectionDataManaging voiceSelectionVoiceCollection](self->_dataManager, "voiceSelectionVoiceCollection");
}

- (void)voicePreviewerAudioOutputDidChangePowerLevel:(float)a3
{
  void *v5;
  char v6;
  double v7;
  id v8;

  -[SUICVoiceSelectionPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUICVoiceSelectionPresenter delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = a3;
    objc_msgSend(v8, "presenter:didChangeAudioOutputPowerLevel:", self, v7);

  }
}

- (void)_logVoicePreview:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __48__SUICVoiceSelectionPresenter__logVoicePreview___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "languageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("languageCode"));

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("voiceName"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("isOrderReversed"));

  return v2;
}

- (SUICVoiceSelectionDataManaging)dataManager
{
  return self->_dataManager;
}

- (SUICVoiceSelectionVoiceCollection)voiceCollection
{
  return self->_voiceCollection;
}

- (SUICVoiceSelectionDisplaying)view
{
  return self->_view;
}

- (SUICVoicePreviewing)voicePreviewer
{
  return self->_voicePreviewer;
}

- (SUICVoiceSelectionPresenterDelegate)delegate
{
  return (SUICVoiceSelectionPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_voicePreviewer, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_voiceCollection, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_voiceBeingPreviewed, 0);
}

void __63__SUICVoiceSelectionPresenter_selectRandomVoiceWithCompletion___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_3_0();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1A3752000, v2, OS_LOG_TYPE_ERROR, "%s Failed to process randomly selected voice:%@ error:%@", (uint8_t *)v3, 0x20u);
}

void __65__SUICVoiceSelectionPresenter__processVoiceSelection_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A3752000, v0, v1, "%s Error changing Siri voice: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_previewVoice:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A3752000, v0, v1, "%s Voice reselected while previewing %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__SUICVoiceSelectionPresenter__previewVoice_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1A3752000, v0, v1, "%s Error previewing voice: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
