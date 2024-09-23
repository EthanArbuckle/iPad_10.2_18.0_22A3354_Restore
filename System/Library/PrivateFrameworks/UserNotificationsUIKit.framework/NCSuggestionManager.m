@implementation NCSuggestionManager

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_sectionIdentifiersWithNotificationManagementSuggestions, "containsObject:", v6))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary allKeys](self->_suggestionContentProviders, "allKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "sectionIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

          if (v14)
            -[NCSuggestionManager _reloadSuggestionForNotificationRequest:sectionSettings:](self, "_reloadSuggestionForNotificationRequest:sectionSettings:", v12, v5);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (NCSuggestionManager)init
{
  NCSuggestionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *suggestionContentProviders;
  NSMutableSet *v5;
  NSMutableSet *sectionIdentifiersWithNotificationManagementSuggestions;
  NSMutableSet *v7;
  NSMutableSet *requestsWithRemoteSuggestions;
  NSMutableSet *v9;
  NSMutableSet *requestsWithContactSuggestions;
  NSMutableDictionary *v11;
  NSMutableDictionary *remoteSuggestions;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NCSuggestionManager;
  v2 = -[NCSuggestionManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    suggestionContentProviders = v2->_suggestionContentProviders;
    v2->_suggestionContentProviders = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sectionIdentifiersWithNotificationManagementSuggestions = v2->_sectionIdentifiersWithNotificationManagementSuggestions;
    v2->_sectionIdentifiersWithNotificationManagementSuggestions = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requestsWithRemoteSuggestions = v2->_requestsWithRemoteSuggestions;
    v2->_requestsWithRemoteSuggestions = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requestsWithContactSuggestions = v2->_requestsWithContactSuggestions;
    v2->_requestsWithContactSuggestions = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    remoteSuggestions = v2->_remoteSuggestions;
    v2->_remoteSuggestions = v11;

  }
  return v2;
}

- (void)reloadRemoteSuggestions
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  NCSuggestionManager *v8;
  id v9;
  id buf[2];

  v3 = *MEMORY[0x1E0DC5F98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_DEFAULT, "Notification Suggestion Manager reloading remote suggestions", (uint8_t *)buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke;
  v6[3] = &unk_1E8D1E1C0;
  objc_copyWeak(&v9, buf);
  v5 = v4;
  v7 = v5;
  v8 = self;
  objc_msgSend(v5, "activeSuggestionsWithReply:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);

}

void __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  id obja;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    v45 = v6;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(WeakRetained, "remoteSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    v46 = v5;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v58 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "remoteSuggestions");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v5, "containsObject:", v18) & 1) == 0)
          {
            v19 = *(void **)(a1 + 32);
            v20 = objc_msgSend(v18, "subtype");
            objc_msgSend(v18, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v20;
            v5 = v46;
            objc_msgSend(v19, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 6, v23, v21, v22);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      }
      while (v13);
    }

    objc_msgSend(WeakRetained, "requestsWithRemoteSuggestions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v54 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(WeakRetained, "_removeSuggestionIfNecessaryForNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j));
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v28);
    }
    v44 = v26;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obja = v5;
    v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v50 != v33)
            objc_enumerationMutation(obja);
          v35 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
          objc_msgSend(v35, "triggerNotificationUUID", v44);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v36
            || (objc_msgSend(WeakRetained, "delegate"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v37, "suggestionManager:notificationRequestForUUID:", WeakRetained, v36),
                v38 = (void *)objc_claimAutoreleasedReturnValue(),
                v37,
                !v38)
            || (v39 = objc_msgSend(*(id *)(a1 + 40), "_createRemoteSuggestionIfNeededForRequest:remoteSuggestion:", v38, v35), v38, (v39 & 1) == 0))
          {
            v40 = *(void **)(a1 + 32);
            v41 = objc_msgSend(v35, "subtype");
            objc_msgSend(v35, "uuid");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 8, v41, v42, v43);

          }
        }
        v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v32);
    }

    v7 = v45;
    v5 = v46;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC5F98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_ERROR))
      __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke_cold_1((uint64_t)v7, v8);
  }

}

- (void)reloadContactSuggestions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NCSuggestionManager requestsWithContactSuggestions](self, "requestsWithContactSuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "content");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "communicationContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "sender");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0DC6038], "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "topLevelSectionIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "curatedContactMatchDetailsForContact:bundleIdentifier:", v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v15, "isSuggestedMatch") & 1) == 0)
            -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)checkSuggestionNeededForNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isUserConfigurable")
    && !-[NCSuggestionManager _createTimeSensitiveSuggestionIfNeededForNotificationRequest:sectionSettings:](self, "_createTimeSensitiveSuggestionIfNeededForNotificationRequest:sectionSettings:", v6, v5)&& !-[NCSuggestionManager _createDirectMessagesSuggestionIfNeededForNotificationRequest:sectionSettings:](self, "_createDirectMessagesSuggestionIfNeededForNotificationRequest:sectionSettings:", v6, v5)&& !-[NCSuggestionManager _createProvisionalAuthorizationSuggestionIfNeededForRequest:sectionSettings:](self, "_createProvisionalAuthorizationSuggestionIfNeededForRequest:sectionSettings:", v6, v5)&& !-[NCSuggestionManager _createContactMatchingSuggestionIfNeededForRequest:sectionSettings:](self, "_createContactMatchingSuggestionIfNeededForRequest:sectionSettings:", v6, v5))
  {
    -[NCSuggestionManager _createSummaryFeedbackSuggestionIfNeededForRequest:sectionSettings:](self, "_createSummaryFeedbackSuggestionIfNeededForRequest:sectionSettings:", v6, v5);
  }

}

- (void)_reloadSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  NSMutableDictionary *remoteSuggestions;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v14);
  if (-[NCNotificationRequest matchesRequest:](self->_requestWithProvisionalNotificationManagementSuggestion, "matchesRequest:", v14))
  {
    -[NCSuggestionManager _createProvisionalAuthorizationSuggestionIfNeededForRequest:sectionSettings:](self, "_createProvisionalAuthorizationSuggestionIfNeededForRequest:sectionSettings:", v14, v6);
  }
  else if (-[NSMutableSet containsObject:](self->_requestsWithTimeSensitiveManagementSuggestion, "containsObject:", v14))
  {
    -[NCSuggestionManager _createTimeSensitiveSuggestionIfNeededForNotificationRequest:sectionSettings:](self, "_createTimeSensitiveSuggestionIfNeededForNotificationRequest:sectionSettings:", v14, v6);
  }
  else if (-[NSMutableSet containsObject:](self->_requestsWithDirectMessagesManagementSuggestion, "containsObject:", v14))
  {
    -[NCSuggestionManager _createDirectMessagesSuggestionIfNeededForNotificationRequest:sectionSettings:](self, "_createDirectMessagesSuggestionIfNeededForNotificationRequest:sectionSettings:", v14, v6);
  }
  else if (-[NSMutableSet containsObject:](self->_requestsWithRemoteSuggestions, "containsObject:", v14))
  {
    remoteSuggestions = self->_remoteSuggestions;
    objc_msgSend(v14, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](remoteSuggestions, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && !-[NCSuggestionManager _createRemoteSuggestionIfNeededForRequest:remoteSuggestion:](self, "_createRemoteSuggestionIfNeededForRequest:remoteSuggestion:", v14, v9))
    {
      objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "subtype");
      objc_msgSend(v9, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 5, v11, v12, v13);

    }
  }

}

- (void)clearSuggestionForNotificationRequest:(id)a3
{
  id v4;
  NSMutableDictionary *remoteSuggestions;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  remoteSuggestions = self->_remoteSuggestions;
  v12 = v4;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](remoteSuggestions, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "subtype");
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 4, v9, v10, v11);

  }
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v12);

}

- (BOOL)_createTimeSensitiveSuggestionIfNeededForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *requestsWithTimeSensitiveManagementSuggestion;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableSet *v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  BOOL v34;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "alertOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "suppression");

  if (v9
    || objc_msgSend(v6, "interruptionLevel") != 2
    || !objc_msgSend(v7, "isTimeSensitiveEnabled")
    || (objc_msgSend(v7, "hasUserConfiguredTimeSensitiveSetting") & 1) != 0)
  {
    goto LABEL_23;
  }
  requestsWithTimeSensitiveManagementSuggestion = self->_requestsWithTimeSensitiveManagementSuggestion;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __100__NCSuggestionManager__createTimeSensitiveSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke;
  v36[3] = &unk_1E8D1C940;
  v11 = v6;
  v37 = v11;
  -[NSMutableSet objectsPassingTest:](requestsWithTimeSensitiveManagementSuggestion, "objectsPassingTest:", v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_8:
    objc_msgSend(v11, "alertOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "reason");

    if (v18 == 4)
    {
      v19 = (void *)*MEMORY[0x1E0DC5F98];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        objc_msgSend(v11, "notificationIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "un_logDigest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sectionIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v22;
        v40 = 2114;
        v41 = v23;
        _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "Creating time sensitive suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

      }
      -[NCSuggestionManager _createNewTimeSensitiveSuggestionForNotificationRequest:sectionSettings:](self, "_createNewTimeSensitiveSuggestionForNotificationRequest:sectionSettings:", v11, v7);
LABEL_17:
      v31 = self->_requestsWithTimeSensitiveManagementSuggestion;
      if (!v31)
      {
        v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v33 = self->_requestsWithTimeSensitiveManagementSuggestion;
        self->_requestsWithTimeSensitiveManagementSuggestion = v32;

        v31 = self->_requestsWithTimeSensitiveManagementSuggestion;
      }
      -[NSMutableSet addObject:](v31, "addObject:", v11);
      v34 = 1;
      goto LABEL_21;
    }
    if (objc_msgSend(v7, "isScheduledDeliveryEnabled"))
    {
      objc_msgSend(v11, "alertOptions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "reason");

      if (v25 == 1)
      {
        v26 = (void *)*MEMORY[0x1E0DC5F98];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          objc_msgSend(v11, "notificationIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "un_logDigest");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sectionIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v29;
          v40 = 2114;
          v41 = v30;
          _os_log_impl(&dword_1CFC3D000, v27, OS_LOG_TYPE_DEFAULT, "Creating time sensitive digest suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

        }
        -[NCSuggestionManager _createNewTimeSensitiveInDigestSuggestionForNotificationRequest:sectionSettings:](self, "_createNewTimeSensitiveInDigestSuggestionForNotificationRequest:sectionSettings:", v11, v7);
        goto LABEL_17;
      }
    }

LABEL_23:
    v34 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v11, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15);

  if (v16 == 1)
  {
    -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v13);
    goto LABEL_8;
  }
  v34 = 0;
LABEL_21:

LABEL_24:
  return v34;
}

uint64_t __100__NCSuggestionManager__createTimeSensitiveSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)_createDirectMessagesSuggestionIfNeededForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSMutableSet *requestsWithDirectMessagesManagementSuggestion;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableSet *v23;
  NSMutableSet *v24;
  NSMutableSet *v25;
  BOOL v26;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEC868]);

  if (v10
    && objc_msgSend(v7, "isDirectMessagesEnabled")
    && (objc_msgSend(v7, "hasUserConfiguredDirectMessagesSetting") & 1) == 0
    && objc_msgSend(v7, "isScheduledDeliveryEnabled"))
  {
    requestsWithDirectMessagesManagementSuggestion = self->_requestsWithDirectMessagesManagementSuggestion;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __101__NCSuggestionManager__createDirectMessagesSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke;
    v28[3] = &unk_1E8D1C940;
    v12 = v6;
    v29 = v12;
    -[NSMutableSet objectsPassingTest:](requestsWithDirectMessagesManagementSuggestion, "objectsPassingTest:", v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v12, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "compare:", v16);

      if (v17 != 1)
      {
        v26 = 0;
LABEL_16:

        goto LABEL_14;
      }
      -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v14);
    }
    v18 = (void *)*MEMORY[0x1E0DC5F98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v12, "notificationIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "un_logDigest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "Creating direct messages digest suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

    }
    -[NCSuggestionManager _createNewDirectMessagesInDigestSuggestionForNotificationRequest:sectionSettings:](self, "_createNewDirectMessagesInDigestSuggestionForNotificationRequest:sectionSettings:", v12, v7);
    v23 = self->_requestsWithDirectMessagesManagementSuggestion;
    if (!v23)
    {
      v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v25 = self->_requestsWithDirectMessagesManagementSuggestion;
      self->_requestsWithDirectMessagesManagementSuggestion = v24;

      v23 = self->_requestsWithDirectMessagesManagementSuggestion;
    }
    -[NSMutableSet addObject:](v23, "addObject:", v12);
    v26 = 1;
    goto LABEL_16;
  }
  v26 = 0;
LABEL_14:

  return v26;
}

uint64_t __101__NCSuggestionManager__createDirectMessagesSuggestionIfNeededForNotificationRequest_sectionSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)_createProvisionalAuthorizationSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4
{
  id v7;
  id v8;
  NCNotificationRequest **p_requestWithProvisionalNotificationManagementSuggestion;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v8, "hasProvisionalAuthorization"))
    goto LABEL_11;
  p_requestWithProvisionalNotificationManagementSuggestion = &self->_requestWithProvisionalNotificationManagementSuggestion;
  if (self->_requestWithProvisionalNotificationManagementSuggestion)
  {
    objc_msgSend(v7, "sectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequest sectionIdentifier](*p_requestWithProvisionalNotificationManagementSuggestion, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
    {
      objc_msgSend(v7, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRequest timestamp](*p_requestWithProvisionalNotificationManagementSuggestion, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13);

      if (v14 == 1)
      {
        if (*p_requestWithProvisionalNotificationManagementSuggestion)
          -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:");
        goto LABEL_7;
      }
    }
    else
    {

    }
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v15 = (void *)*MEMORY[0x1E0DC5F98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v7, "notificationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "un_logDigest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v18;
    v24 = 2114;
    v25 = v19;
    _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "Creating promoting suggestion for provisional request %{public}@ from section %{public}@", (uint8_t *)&v22, 0x16u);

  }
  -[NCSuggestionManager _createNewPromotingSuggestionForNotificationRequest:sectionSettings:](self, "_createNewPromotingSuggestionForNotificationRequest:sectionSettings:", v7, v8);
  objc_storeStrong((id *)&self->_requestWithProvisionalNotificationManagementSuggestion, a3);
  v20 = 1;
LABEL_12:

  return v20;
}

- (BOOL)_createContactMatchingSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "communicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (objc_msgSend(v9, "isDirect") && v10)
  {
    objc_msgSend(MEMORY[0x1E0DC6038], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topLevelSectionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "curatedContactMatchDetailsForContact:bundleIdentifier:", v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v14, "isSuggestedMatch"))
    {
      objc_msgSend(v14, "cnContactFullname");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCSuggestionManager _createNewCuratedContactMatchSuggestionForNotificationRequest:sectionSettings:contactName:](self, "_createNewCuratedContactMatchSuggestionForNotificationRequest:sectionSettings:contactName:", v6, v7, v15);

      -[NSMutableSet addObject:](self->_requestsWithContactSuggestions, "addObject:", v6);
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)_createSummaryFeedbackSuggestionIfNeededForRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (MEMORY[0x1D17DCDFC]("-[NCSuggestionManager _createSummaryFeedbackSuggestionIfNeededForRequest:sectionSettings:]")
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v9 = objc_msgSend(WeakRetained, "suggestionManager:isSummaryVisibleForNotificationRequest:", self, v6),
        WeakRetained,
        v9)
    && arc4random_uniform(0x64u) <= 0x1D)
  {
    v10 = (void *)*MEMORY[0x1E0DC5F98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v6, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sectionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "Creating summary feedback suggestion for request %{public}@ from section %{public}@", (uint8_t *)&v17, 0x16u);

    }
    -[NCSuggestionManager _createNewSummaryFeedbackSuggestionForNotificationRequest:sectionSettings:](self, "_createNewSummaryFeedbackSuggestionForNotificationRequest:sectionSettings:", v6, v7);
    -[NSMutableSet addObject:](self->_requestsWithSummaryFeedbackSuggestions, "addObject:", v6);
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_createRemoteSuggestionIfNeededForRequest:(id)a3 remoteSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[NCSuggestionManager remoteSuggestions](self, "remoteSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

  -[NCSuggestionManager _contentProviderForRequest:withRemoteSuggestion:](self, "_contentProviderForRequest:withRemoteSuggestion:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (-[NCSuggestionManager suggestionContentProviders](self, "suggestionContentProviders"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKey:", v6),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12)
    && -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](self, "_addSuggestionForNotificationRequest:managementContentProvider:", v6, v10))
  {
    -[NCSuggestionManager requestsWithRemoteSuggestions](self, "requestsWithRemoteSuggestions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v6);

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)auxiliaryOptionsContentProviderForNotificationRequest:(id)a3 isLongLook:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NCNotificationManagementLongLookContentProvider *v10;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (v4)
    {
      objc_msgSend(v6, "sectionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isUserConfigurable"))
        v10 = -[NCNotificationManagementContentProvider initWithNotificationRequest:managementDelegate:]([NCNotificationManagementLongLookContentProvider alloc], "initWithNotificationRequest:managementDelegate:", v7, self);
      else
        v10 = 0;

    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_suggestionContentProviders, "objectForKey:", v6);
      v10 = (NCNotificationManagementLongLookContentProvider *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_deviceAuthenticated != a3)
  {
    self->_deviceAuthenticated = a3;
    -[NCSuggestionManager suggestionContentProviders](self, "suggestionContentProviders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__NCSuggestionManager_setDeviceAuthenticated___block_invoke;
    v5[3] = &unk_1E8D1E1E8;
    v5[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __46__NCSuggestionManager_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sectionSettingsForSectionIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "contentPreviewSetting"))
    v8 = objc_msgSend(*(id *)(a1 + 32), "isDeviceAuthenticated");
  else
    v8 = 1;
  objc_msgSend(v9, "setAuxiliaryOptionsVisible:", v8);

}

- (void)logResponseForNotificationRequest:(id)a3 allowsNotifications:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = v6;
  if (!a4)
  {
    -[NCSuggestionManager suggestionContentProviders](self, "suggestionContentProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "logSuggestionEvent:", 2);

    v6 = v9;
  }
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v6);

}

- (void)logResponseForNotificationRequest:(id)a3 allowsTimeSensitive:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = v6;
  if (!a4)
  {
    -[NCSuggestionManager suggestionContentProviders](self, "suggestionContentProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "logSuggestionEvent:", 2);

    v6 = v9;
  }
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v6);

}

- (void)logResponseForNotificationRequest:(id)a3 muted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  v9 = v6;
  if (v4)
  {
    -[NCSuggestionManager suggestionContentProviders](self, "suggestionContentProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "logSuggestionEvent:", 2);

    v6 = v9;
  }
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v6);

}

- (void)logResponseForNotificationRequest:(id)a3 scheduledDelivery:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NCSuggestionManager suggestionContentProviders](self, "suggestionContentProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "logSuggestionEvent:", 2);
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", v7);

}

- (void)notificationManagementContentProvider:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a5;
  -[NCSuggestionManager delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suggestionManager:requestsPresentingNotificationManagementViewType:forNotificationRequest:withPresentingView:", self, a4, v10, v9);

}

- (void)notificationManagementContentProvider:(id)a3 hasUpdatedContentForRequest:(id)a4
{
  -[NCSuggestionManager _updateContentForNotificationRequest:](self, "_updateContentForNotificationRequest:", a4);
}

- (void)notificationManagementContentProvider:(id)a3 keepNotificationsForSectionIdentifierForNotificationRequest:(id)a4
{
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", a4);
}

- (void)notificationManagementContentProvider:(id)a3 setCuratedContactSuggestionConfirmed:(BOOL)a4 request:(id)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v12 = a5;
  objc_msgSend(v12, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "communicationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC6038], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topLevelSectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "confirmCuratedContactSuggestion:forContact:bundleIdentifier:", v5, v9, v11);

  }
  -[NCSuggestionManager reloadContactSuggestions](self, "reloadContactSuggestions");

}

- (void)notificationManagementContentProvider:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  -[NCSuggestionManager delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "suggestionManager:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v13, v12, v11);

}

- (void)notificationManagementContentProvider:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[NCSuggestionManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionManager:setScheduledDelivery:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationManagementContentProvider:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[NCSuggestionManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionManager:setAllowsTimeSensitive:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationManagementContentProvider:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[NCSuggestionManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionManager:setAllowsDirectMessages:forSectionIdentifier:", self, v5, v7);

}

- (void)notificationManagementContentProvider:(id)a3 setModeConfiguration:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NCSuggestionManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestionManager:setModeConfiguration:", self, v5);

}

- (void)notificationManagementContentProvider:(id)a3 requestsRemoveSuggestionForRequest:(id)a4
{
  -[NCSuggestionManager _removeSuggestionIfNecessaryForNotificationRequest:](self, "_removeSuggestionIfNecessaryForNotificationRequest:", a4);
}

- (void)_updateContentForNotificationRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NCSuggestionManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionManager:requestsUpdatingContentForNotificationRequest:", self, v4);

}

- (id)_sectionSettingsForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCSuggestionManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionManager:requestsSectionSettingsForSectionIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_addSuggestionForNotificationRequest:(id)a3 managementContentProvider:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *sectionIdentifiersWithNotificationManagementSuggestions;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableSet *v19;
  void *v20;
  _BOOL8 v21;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  sectionIdentifiersWithNotificationManagementSuggestions = self->_sectionIdentifiersWithNotificationManagementSuggestions;
  objc_msgSend(v6, "sectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(sectionIdentifiersWithNotificationManagementSuggestions) = -[NSMutableSet containsObject:](sectionIdentifiersWithNotificationManagementSuggestions, "containsObject:", v9);

  if ((sectionIdentifiersWithNotificationManagementSuggestions & 1) != 0)
  {
    v10 = (void *)*MEMORY[0x1E0DC5F98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_ERROR))
      -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:].cold.1(v10, v6);
    LOBYTE(v11) = 0;
  }
  else
  {
    objc_msgSend(v6, "sectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v13, "isUserConfigurable");
    v14 = (void *)*MEMORY[0x1E0DC5F98];
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend(v6, "notificationIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "un_logDigest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v17;
        v27 = 2114;
        v28 = v18;
        _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, "Adding suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

      }
      -[NSMutableDictionary setObject:forKey:](self->_suggestionContentProviders, "setObject:forKey:", v7, v6);
      v19 = self->_sectionIdentifiersWithNotificationManagementSuggestions;
      objc_msgSend(v6, "sectionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v19, "addObject:", v20);

      if (objc_msgSend(v13, "contentPreviewSetting"))
        v21 = -[NCSuggestionManager isDeviceAuthenticated](self, "isDeviceAuthenticated");
      else
        v21 = 1;
      objc_msgSend(v7, "setAuxiliaryOptionsVisible:", v21);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __86__NCSuggestionManager__addSuggestionForNotificationRequest_managementContentProvider___block_invoke;
      v23[3] = &unk_1E8D1B3A0;
      v23[4] = self;
      v24 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v23);

    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_ERROR))
    {
      -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:].cold.2(v14, v6);
    }

  }
  return v11;
}

uint64_t __86__NCSuggestionManager__addSuggestionForNotificationRequest_managementContentProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentForNotificationRequest:", *(_QWORD *)(a1 + 40));
}

- (void)_createNewPromotingSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  NCNotificationManagementPromotingSuggestionContentProvider *v8;
  void *v9;
  NCNotificationManagementPromotingSuggestionContentProvider *v10;

  v6 = a4;
  v7 = a3;
  v8 = [NCNotificationManagementPromotingSuggestionContentProvider alloc];
  objc_msgSend(v6, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NCNotificationManagementPromotingSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:](v8, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:", v7, v9, self, self);
  -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](self, "_addSuggestionForNotificationRequest:managementContentProvider:", v7, v10);

}

- (void)_createNewTimeSensitiveSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  NCNotificationManagementTimeSensitiveSuggestionContentProvider *v8;
  void *v9;
  NCNotificationManagementTimeSensitiveSuggestionContentProvider *v10;

  v6 = a4;
  v7 = a3;
  v8 = [NCNotificationManagementTimeSensitiveSuggestionContentProvider alloc];
  objc_msgSend(v6, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NCNotificationManagementTimeSensitiveSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:](v8, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:", v7, v9, self, self);
  -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](self, "_addSuggestionForNotificationRequest:managementContentProvider:", v7, v10);

}

- (void)_createNewTimeSensitiveInDigestSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  NCNotificationManagementTimeSensitiveInDigestSuggestionContentProvider *v8;
  void *v9;
  NCNotificationManagementTimeSensitiveInDigestSuggestionContentProvider *v10;

  v6 = a4;
  v7 = a3;
  v8 = [NCNotificationManagementTimeSensitiveInDigestSuggestionContentProvider alloc];
  objc_msgSend(v6, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NCNotificationManagementTimeSensitiveInDigestSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:](v8, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:", v7, v9, self, self);
  -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](self, "_addSuggestionForNotificationRequest:managementContentProvider:", v7, v10);

}

- (void)_createNewDirectMessagesInDigestSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  id v6;
  id v7;
  NCNotificationManagementDirectMessagesInDigestSuggestionContentProvider *v8;
  void *v9;
  NCNotificationManagementDirectMessagesInDigestSuggestionContentProvider *v10;

  v6 = a4;
  v7 = a3;
  v8 = [NCNotificationManagementDirectMessagesInDigestSuggestionContentProvider alloc];
  objc_msgSend(v6, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NCNotificationManagementDirectMessagesInDigestSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:](v8, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:", v7, v9, self, self);
  -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](self, "_addSuggestionForNotificationRequest:managementContentProvider:", v7, v10);

}

- (void)_createNewCuratedContactMatchSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4 contactName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NCNotificationManagementCuratedContactMatchSuggestionContentProvider *v11;
  void *v12;
  NCNotificationManagementCuratedContactMatchSuggestionContentProvider *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [NCNotificationManagementCuratedContactMatchSuggestionContentProvider alloc];
  objc_msgSend(v9, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[NCNotificationManagementCuratedContactMatchSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:contactName:](v11, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:contactName:", v10, v12, self, self, v8);
  -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](self, "_addSuggestionForNotificationRequest:managementContentProvider:", v10, v13);

}

- (void)_createNewSummaryFeedbackSuggestionForNotificationRequest:(id)a3 sectionSettings:(id)a4
{
  NCSuggestionManagerDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  NCNotificationManagementSummaryFeedbackSuggestionContentProvider *v11;
  void *v12;
  NCNotificationManagementSummaryFeedbackSuggestionContentProvider *v13;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v10 = objc_msgSend(WeakRetained, "suggestionManager:isThreadSummaryVisibleForNotificationRequest:", self, v8);

  v11 = [NCNotificationManagementSummaryFeedbackSuggestionContentProvider alloc];
  objc_msgSend(v7, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[NCNotificationManagementSummaryFeedbackSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:isStackedSummary:managementDelegate:suggestionDelegate:](v11, "initWithNotificationRequest:bundleDisplayName:isStackedSummary:managementDelegate:suggestionDelegate:", v8, v12, v10, self, self);
  -[NCSuggestionManager _addSuggestionForNotificationRequest:managementContentProvider:](self, "_addSuggestionForNotificationRequest:managementContentProvider:", v8, v13);

}

- (void)_removeSuggestionIfNecessaryForNotificationRequest:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NCNotificationRequest *requestWithProvisionalNotificationManagementSuggestion;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *requestsWithTimeSensitiveManagementSuggestion;
  NSMutableSet *sectionIdentifiersWithNotificationManagementSuggestions;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableSet *requestsWithContactSuggestions;
  int v36;
  os_log_t v37;
  _BOOL4 v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableDictionary *remoteSuggestions;
  void *v48;
  _QWORD v49[5];
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0DC5F98];
  v6 = (void *)*MEMORY[0x1E0DC5F98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v9;
    v53 = 2114;
    v54 = v10;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "Attempt to remove suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

  }
  if (v4)
  {
    if (-[NCNotificationRequest matchesRequest:](self->_requestWithProvisionalNotificationManagementSuggestion, "matchesRequest:", v4))
    {
      v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        requestWithProvisionalNotificationManagementSuggestion = self->_requestWithProvisionalNotificationManagementSuggestion;
        v13 = v11;
        -[NCNotificationRequest notificationIdentifier](requestWithProvisionalNotificationManagementSuggestion, "notificationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "un_logDigest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRequest sectionIdentifier](self->_requestWithProvisionalNotificationManagementSuggestion, "sectionIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v15;
        v53 = 2114;
        v54 = v16;
        _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "Removing suggestion for provisional request %{public}@ from section %{public}@", buf, 0x16u);

      }
      requestsWithTimeSensitiveManagementSuggestion = self->_requestWithProvisionalNotificationManagementSuggestion;
      self->_requestWithProvisionalNotificationManagementSuggestion = 0;
    }
    else if (-[NSMutableSet containsObject:](self->_requestsWithTimeSensitiveManagementSuggestion, "containsObject:", v4))
    {
      v20 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        objc_msgSend(v4, "notificationIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "un_logDigest");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sectionIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v23;
        v53 = 2114;
        v54 = v24;
        _os_log_impl(&dword_1CFC3D000, v21, OS_LOG_TYPE_DEFAULT, "Removing suggestion for time sensitive request %{public}@ from section %{public}@", buf, 0x16u);

      }
      -[NSMutableSet removeObject:](self->_requestsWithTimeSensitiveManagementSuggestion, "removeObject:", v4);
      if (-[NSMutableSet count](self->_requestsWithTimeSensitiveManagementSuggestion, "count"))
        goto LABEL_9;
      requestsWithTimeSensitiveManagementSuggestion = self->_requestsWithTimeSensitiveManagementSuggestion;
      self->_requestsWithTimeSensitiveManagementSuggestion = 0;
    }
    else
    {
      if (!-[NSMutableSet containsObject:](self->_requestsWithDirectMessagesManagementSuggestion, "containsObject:", v4))
      {
        if (-[NSMutableSet containsObject:](self->_requestsWithContactSuggestions, "containsObject:", v4))
        {
          v30 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            v31 = v30;
            objc_msgSend(v4, "notificationIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "un_logDigest");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "sectionIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v33;
            v53 = 2114;
            v54 = v34;
            _os_log_impl(&dword_1CFC3D000, v31, OS_LOG_TYPE_DEFAULT, "Removing contact suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

          }
          requestsWithContactSuggestions = self->_requestsWithContactSuggestions;
        }
        else
        {
          v36 = -[NSMutableSet containsObject:](self->_requestsWithSummaryFeedbackSuggestions, "containsObject:", v4);
          v37 = *v5;
          v38 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
          if (!v36)
          {
            if (v38)
            {
              v43 = v37;
              objc_msgSend(v4, "notificationIdentifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "un_logDigest");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "sectionIdentifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v52 = v45;
              v53 = 2114;
              v54 = v46;
              _os_log_impl(&dword_1CFC3D000, v43, OS_LOG_TYPE_DEFAULT, "Removing remote suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

            }
            -[NSMutableSet removeObject:](self->_requestsWithRemoteSuggestions, "removeObject:", v4);
            remoteSuggestions = self->_remoteSuggestions;
            objc_msgSend(v4, "uuid");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](remoteSuggestions, "removeObjectForKey:", v48);

            goto LABEL_9;
          }
          if (v38)
          {
            v39 = v37;
            objc_msgSend(v4, "notificationIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "un_logDigest");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "sectionIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v41;
            v53 = 2114;
            v54 = v42;
            _os_log_impl(&dword_1CFC3D000, v39, OS_LOG_TYPE_DEFAULT, "Removing summary feedback suggestion for request %{public}@ from section %{public}@", buf, 0x16u);

          }
          requestsWithContactSuggestions = self->_requestsWithSummaryFeedbackSuggestions;
        }
        -[NSMutableSet removeObject:](requestsWithContactSuggestions, "removeObject:", v4);
LABEL_9:
        -[NSMutableDictionary removeObjectForKey:](self->_suggestionContentProviders, "removeObjectForKey:", v4);
        sectionIdentifiersWithNotificationManagementSuggestions = self->_sectionIdentifiersWithNotificationManagementSuggestions;
        objc_msgSend(v4, "sectionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](sectionIdentifiersWithNotificationManagementSuggestions, "removeObject:", v19);

        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __74__NCSuggestionManager__removeSuggestionIfNecessaryForNotificationRequest___block_invoke;
        v49[3] = &unk_1E8D1B3A0;
        v49[4] = self;
        v50 = v4;
        dispatch_async(MEMORY[0x1E0C80D38], v49);

        goto LABEL_10;
      }
      v25 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v25;
        objc_msgSend(v4, "notificationIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "un_logDigest");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sectionIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v28;
        v53 = 2114;
        v54 = v29;
        _os_log_impl(&dword_1CFC3D000, v26, OS_LOG_TYPE_DEFAULT, "Removing suggestion for direct messages request %{public}@ from section %{public}@", buf, 0x16u);

      }
      -[NSMutableSet removeObject:](self->_requestsWithDirectMessagesManagementSuggestion, "removeObject:", v4);
      if (-[NSMutableSet count](self->_requestsWithDirectMessagesManagementSuggestion, "count"))
        goto LABEL_9;
      requestsWithTimeSensitiveManagementSuggestion = self->_requestsWithDirectMessagesManagementSuggestion;
      self->_requestsWithDirectMessagesManagementSuggestion = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __74__NCSuggestionManager__removeSuggestionIfNecessaryForNotificationRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentForNotificationRequest:", *(_QWORD *)(a1 + 40));
}

- (id)_contentProviderForRequest:(id)a3 withRemoteSuggestion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "subtype"))
  {
    case 4:
      -[NCSuggestionManager _contentProviderForRequest:withMutingSuggestion:](self, "_contentProviderForRequest:withMutingSuggestion:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[NCSuggestionManager _contentProviderForRequest:withModeConfigurationTuningSuggestion:](self, "_contentProviderForRequest:withModeConfigurationTuningSuggestion:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      -[NCSuggestionManager _contentProviderForRequest:withDigestSuggestion:](self, "_contentProviderForRequest:withDigestSuggestion:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      -[NCSuggestionManager _contentProviderForRequest:withUrgencyTuningSuggestion:](self, "_contentProviderForRequest:withUrgencyTuningSuggestion:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8:
      -[NCSuggestionManager _contentProviderForRequest:withSendMessagesToDigestSuggestion:](self, "_contentProviderForRequest:withSendMessagesToDigestSuggestion:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 9:
      -[NCSuggestionManager _contentProviderForRequest:withTurnOffNotificationsForAppSuggestion:](self, "_contentProviderForRequest:withTurnOffNotificationsForAppSuggestion:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)_contentProviderForRequest:(id)a3 withModeConfigurationTuningSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NCModeConfigurationRemoteSuggestionContentProvider *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NCModeConfigurationRemoteSuggestionContentProvider *v24;
  uint64_t v25;
  void *v26;
  NCModeConfigurationRemoteSuggestionContentProvider *v27;
  void *v28;
  NCModeConfigurationRemoteSuggestionContentProvider *v29;
  uint64_t v30;
  NCSuggestionManager *v31;
  NCSuggestionManager *v32;
  void *v33;
  void *v35;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "subObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "suggestionManagerRequestsCurrentModeConfiguration:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_9;
  v14 = objc_msgSend(v7, "scope");
  if (v14 == 3)
  {
    DNDContactHandleFromNotificationRequest(v6);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v13, "senderConfigurationType");
    v35 = (void *)v20;
    v22 = objc_msgSend(v13, "exceptionForContactHandle:", v20);
    v23 = objc_msgSend(v10, "tuningSuggestionType");
    if (v23 == 3)
    {
      v19 = 0;
      if (v22 == 1 || v21 != 1)
        goto LABEL_23;
    }
    else
    {
      if (v23 != 1)
      {
        v19 = 0;
LABEL_23:
        v28 = v35;
        goto LABEL_24;
      }
      v19 = 0;
      if (!v22 || v21)
        goto LABEL_23;
    }
    v29 = [NCModeConfigurationRemoteSuggestionContentProvider alloc];
    objc_msgSend(v9, "displayName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = self;
    v32 = self;
    v33 = (void *)v30;
    v19 = -[NCModeConfigurationRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:suggestionType:scope:modeConfiguration:](v29, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:suggestionType:scope:modeConfiguration:", v6, v26, v31, v32, v30, 0, 2, v12);

    v28 = v35;
    goto LABEL_21;
  }
  if (v14 != 1)
    goto LABEL_9;
  v15 = objc_msgSend(v13, "applicationConfigurationType");
  objc_msgSend(v6, "sectionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "exceptionForApplication:", v16);

  v18 = objc_msgSend(v10, "tuningSuggestionType");
  if (v18 != 3)
  {
    if (v18 == 1)
    {
      v19 = 0;
      if (!v17 || v15)
        goto LABEL_25;
      goto LABEL_17;
    }
LABEL_9:
    v19 = 0;
    goto LABEL_25;
  }
  v19 = 0;
  if (v17 != 1 && v15 == 1)
  {
LABEL_17:
    v24 = [NCModeConfigurationRemoteSuggestionContentProvider alloc];
    objc_msgSend(v9, "displayName");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v24;
    v28 = (void *)v25;
    v19 = -[NCModeConfigurationRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:suggestionType:scope:modeConfiguration:](v27, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:suggestionType:scope:modeConfiguration:", v6, v25, self, self, v26, 0, 0, v12);
LABEL_21:

LABEL_24:
  }
LABEL_25:

  return v19;
}

- (id)_contentProviderForRequest:(id)a3 withMutingSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NCMutingRemoteSuggestionContentProvider *v14;
  void *v15;
  void *v16;
  void *v17;
  NCMutingRemoteSuggestionContentProvider *v18;
  void *v19;
  void *v20;
  NCMutingRemoteSuggestionContentProvider *v21;
  id v22;
  void *v23;
  NCSuggestionManager *v24;
  NCSuggestionManager *v25;
  void *v26;
  uint64_t v27;
  NCMutingRemoteSuggestionContentProvider *v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "muteAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueThreadIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "activeMuteAssertionLevelForThreadIdentifier:", v11);

  v13 = objc_msgSend(v7, "scope");
  if (v13 != 2)
  {
    if (v13 != 1 || v12 == 2)
    {
      v14 = 0;
      goto LABEL_10;
    }
    v28 = [NCMutingRemoteSuggestionContentProvider alloc];
    objc_msgSend(v9, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v28;
    v22 = v6;
    v23 = v19;
    v24 = self;
    v25 = self;
    v26 = v20;
    v27 = 0;
LABEL_9:
    v14 = -[NCMutingRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:scope:](v21, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:scope:", v22, v23, v24, v25, v26, v27);

    goto LABEL_10;
  }
  objc_msgSend(v6, "content");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "communicationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v17 && v12 != 1)
  {
    v18 = [NCMutingRemoteSuggestionContentProvider alloc];
    objc_msgSend(v9, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    v22 = v6;
    v23 = v19;
    v24 = self;
    v25 = self;
    v26 = v20;
    v27 = 1;
    goto LABEL_9;
  }
LABEL_10:

  return v14;
}

- (id)_contentProviderForRequest:(id)a3 withDigestSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NCDigestRemoteSuggestionContentProvider *v10;
  NCDigestRemoteSuggestionContentProvider *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isScheduledDeliveryEnabled") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = [NCDigestRemoteSuggestionContentProvider alloc];
    objc_msgSend(v9, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NCDigestRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:](v11, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:", v6, v12, self, self, v13);

  }
  return v10;
}

- (id)_contentProviderForRequest:(id)a3 withUrgencyTuningSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NCTimeSensitiveRemoteSuggestionContentProvider *v10;
  void *v11;
  void *v12;
  NCTimeSensitiveRemoteSuggestionContentProvider *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isTimeSensitiveEnabled"))
  {
    v10 = [NCTimeSensitiveRemoteSuggestionContentProvider alloc];
    objc_msgSend(v9, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NCTimeSensitiveRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:](v10, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:", v6, v11, self, self, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_contentProviderForRequest:(id)a3 withSendMessagesToDigestSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NCMessagesInDigestRemoteSuggestionContentProvider *v10;
  void *v11;
  void *v12;
  NCMessagesInDigestRemoteSuggestionContentProvider *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isScheduledDeliveryEnabled")
    && objc_msgSend(v9, "isDirectMessagesEnabled"))
  {
    v10 = [NCMessagesInDigestRemoteSuggestionContentProvider alloc];
    objc_msgSend(v9, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NCMessagesInDigestRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:](v10, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:", v6, v11, self, self, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_contentProviderForRequest:(id)a3 withTurnOffNotificationsForAppSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NCTurnOffNotificationsForAppRemoteSuggestionContentProvider *v10;
  void *v11;
  void *v12;
  NCTurnOffNotificationsForAppRemoteSuggestionContentProvider *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSuggestionManager _sectionSettingsForSectionIdentifier:](self, "_sectionSettingsForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [NCTurnOffNotificationsForAppRemoteSuggestionContentProvider alloc];
  objc_msgSend(v9, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[NCTurnOffNotificationsForAppRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:](v10, "initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:", v7, v11, self, self, v12);
  return v13;
}

- (NCSuggestionManagerDelegate)delegate
{
  return (NCSuggestionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (NSMutableDictionary)suggestionContentProviders
{
  return self->_suggestionContentProviders;
}

- (void)setSuggestionContentProviders:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionContentProviders, a3);
}

- (NCNotificationRequest)requestWithProvisionalNotificationManagementSuggestion
{
  return self->_requestWithProvisionalNotificationManagementSuggestion;
}

- (void)setRequestWithProvisionalNotificationManagementSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_requestWithProvisionalNotificationManagementSuggestion, a3);
}

- (NSMutableSet)requestsWithTimeSensitiveManagementSuggestion
{
  return self->_requestsWithTimeSensitiveManagementSuggestion;
}

- (void)setRequestsWithTimeSensitiveManagementSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_requestsWithTimeSensitiveManagementSuggestion, a3);
}

- (NSMutableSet)requestsWithDirectMessagesManagementSuggestion
{
  return self->_requestsWithDirectMessagesManagementSuggestion;
}

- (void)setRequestsWithDirectMessagesManagementSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_requestsWithDirectMessagesManagementSuggestion, a3);
}

- (NSMutableSet)sectionIdentifiersWithNotificationManagementSuggestions
{
  return self->_sectionIdentifiersWithNotificationManagementSuggestions;
}

- (void)setSectionIdentifiersWithNotificationManagementSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifiersWithNotificationManagementSuggestions, a3);
}

- (NSMutableDictionary)remoteSuggestions
{
  return self->_remoteSuggestions;
}

- (void)setRemoteSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSuggestions, a3);
}

- (NSMutableSet)requestsWithRemoteSuggestions
{
  return self->_requestsWithRemoteSuggestions;
}

- (void)setRequestsWithRemoteSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_requestsWithRemoteSuggestions, a3);
}

- (NSMutableSet)requestsWithContactSuggestions
{
  return self->_requestsWithContactSuggestions;
}

- (void)setRequestsWithContactSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_requestsWithContactSuggestions, a3);
}

- (NSMutableSet)requestsWithSummaryFeedbackSuggestions
{
  return self->_requestsWithSummaryFeedbackSuggestions;
}

- (void)setRequestsWithSummaryFeedbackSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_requestsWithSummaryFeedbackSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsWithSummaryFeedbackSuggestions, 0);
  objc_storeStrong((id *)&self->_requestsWithContactSuggestions, 0);
  objc_storeStrong((id *)&self->_requestsWithRemoteSuggestions, 0);
  objc_storeStrong((id *)&self->_remoteSuggestions, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersWithNotificationManagementSuggestions, 0);
  objc_storeStrong((id *)&self->_requestsWithDirectMessagesManagementSuggestion, 0);
  objc_storeStrong((id *)&self->_requestsWithTimeSensitiveManagementSuggestion, 0);
  objc_storeStrong((id *)&self->_requestWithProvisionalNotificationManagementSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionContentProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __46__NCSuggestionManager_reloadRemoteSuggestions__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_ERROR, "Error retrieving active notification suggestions with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_addSuggestionForNotificationRequest:(void *)a1 managementContentProvider:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = a1;
  objc_msgSend(a2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(&dword_1CFC3D000, v7, v8, "Not adding suggestion for request %{public}@ from section %{public}@ since there is an existing suggestion for this section", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_0_0();
}

- (void)_addSuggestionForNotificationRequest:(void *)a1 managementContentProvider:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = a1;
  objc_msgSend(a2, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(&dword_1CFC3D000, v7, v8, "Not adding suggestion for request %{public}@ from section %{public}@ since the section doesnt have user configurable settings", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_0_0();
}

@end
