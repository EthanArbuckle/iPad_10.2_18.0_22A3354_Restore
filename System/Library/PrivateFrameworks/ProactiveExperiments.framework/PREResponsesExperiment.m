@implementation PREResponsesExperiment

- (PREResponsesExperiment)initWithExperimentResolver:(id)a3 metricsClient:(id)a4 xpcClient:(id)a5 rkClient:(id)a6 tiPreferencesController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PREResponsesExperiment *v17;
  PREResponsesExperiment *v18;
  uint64_t v19;
  NSUserDefaults *defaults;
  uint64_t v21;
  _PASLRUCache *responsesGeneratedCache;
  id v23;
  void *v24;
  uint64_t v25;
  _PASLock *guardedCachedResponsesGeneratedEvent;
  uint64_t v27;
  PREPredictionExemptTermsDetector *exemptTermsDetector;
  NSObject *v29;
  id v31;
  uint8_t buf[16];
  objc_super v33;

  v31 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)PREResponsesExperiment;
  v17 = -[PREResponsesExperiment init](&v33, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_experimentResolver, a3);
    objc_storeStrong((id *)&v18->_metrics, a4);
    objc_storeStrong((id *)&v18->_xpcClient, a5);
    objc_storeStrong((id *)&v18->_rkClient, a6);
    objc_storeStrong((id *)&v18->_tiPreferencesController, a7);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.proactive.experiments.responses"));
    defaults = v18->_defaults;
    v18->_defaults = (NSUserDefaults *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 50);
    responsesGeneratedCache = v18->_responsesGeneratedCache;
    v18->_responsesGeneratedCache = (_PASLRUCache *)v21;

    v23 = objc_alloc(MEMORY[0x1E0D815F0]);
    v24 = (void *)objc_opt_new();
    v25 = objc_msgSend(v23, "initWithGuardedData:", v24);
    guardedCachedResponsesGeneratedEvent = v18->_guardedCachedResponsesGeneratedEvent;
    v18->_guardedCachedResponsesGeneratedEvent = (_PASLock *)v25;

    v18->_useResponseKitAsFallback = 1;
    *(_DWORD *)&v18->_registerDisplayed = 16843009;
    v27 = objc_opt_new();
    exemptTermsDetector = v18->_exemptTermsDetector;
    v18->_exemptTermsDetector = (PREPredictionExemptTermsDetector *)v27;

    pre_responses_handle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v29, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment init", buf, 2u);
    }

  }
  return v18;
}

- (PREResponsesExperiment)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PREResponsesExperiment *v8;

  +[PREExperimentResolver sharedInstance](PREExperimentResolver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  +[PREResponsesClient sharedInstance](PREResponsesClient, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PREResponsesExperiment initWithExperimentResolver:metricsClient:xpcClient:rkClient:tiPreferencesController:](self, "initWithExperimentResolver:metricsClient:xpcClient:rkClient:tiPreferencesController:", v3, v4, v5, v6, v7);

  return v8;
}

- (id)cachedResponsesGeneratedEvent
{
  _PASLock *guardedCachedResponsesGeneratedEvent;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1795;
  v10 = __Block_byref_object_dispose__1796;
  v11 = 0;
  guardedCachedResponsesGeneratedEvent = self->_guardedCachedResponsesGeneratedEvent;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PREResponsesExperiment_cachedResponsesGeneratedEvent__block_invoke;
  v5[3] = &unk_1E7D9E2E0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](guardedCachedResponsesGeneratedEvent, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setCachedResponsesGeneratedEvent:(id)a3
{
  id v4;
  _PASLock *guardedCachedResponsesGeneratedEvent;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  guardedCachedResponsesGeneratedEvent = self->_guardedCachedResponsesGeneratedEvent;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PREResponsesExperiment_setCachedResponsesGeneratedEvent___block_invoke;
  v7[3] = &unk_1E7D9E308;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](guardedCachedResponsesGeneratedEvent, "runWithLockAcquired:", v7);

}

- (void)setIncludeCustomResponses:(BOOL)a3
{
  -[_PASLRUCache removeAllObjects](self->_responsesGeneratedCache, "removeAllObjects");
  self->_includeCustomResponses = a3;
}

- (void)setIncludeResponsesToRobots:(BOOL)a3
{
  -[_PASLRUCache removeAllObjects](self->_responsesGeneratedCache, "removeAllObjects");
  self->_includeResponsesToRobots = a3;
}

- (id)clippedMessageIfNecessary:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[12];
  int ptr;

  v3 = a3;
  pre_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v5 = os_signpost_id_make_with_pointer(v4, &ptr);

  pre_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PRE-ClipMessage", "Start", buf, 2u);
  }

  if ((unint64_t)objc_msgSend(v3, "length") >= 0x231)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "substringToIndex:", 280);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 280);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@%@"), v9, v10);

    v3 = (id)v11;
  }
  pre_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v13, OS_SIGNPOST_INTERVAL_END, v5, "PRE-ClipMessage", "Completed", v15, 2u);
  }

  return v3;
}

- (id)cacheKeyForMessage:(id)a3 maxResponses:(unint64_t)a4 time:(id)a5 language:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (v11)
  {
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (v10)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v16 = (__CFString *)objc_msgSend(v14, "initWithFormat:", CFSTR("%.02f"), v15);
  }
  else
  {
    v16 = CFSTR("0");
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%tu-%@-%@"), v9, a4, v13, v16);

  return v17;
}

- (unint64_t)mode
{
  void *v2;
  unint64_t v3;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("experimentModelName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("DEFAULT_RESPONSE_KIT")) & 1) != 0)
  {
    v3 = 0;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("QR_CHUNK_PLIST_BUNDLED_ON_DEVICE")) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("USER_SPECIFIED_MODEL")))
  {
    v3 = 2;
  }
  else
  {
    v3 = 3;
  }

  return v3;
}

- (id)activeExperimentNameForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  int v29;
  int ptr;
  uint8_t buf[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pre_signpost_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v6 = os_signpost_id_make_with_pointer(v5, &ptr);

  pre_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PRE-ReadExperimentNameDefaults", "Start", buf, 2u);
  }

  v10 = -[PREResponsesExperiment mode](self, "mode");
  if (v10 == 2)
  {
    -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("experimentModelUserLabel"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    pre_responses_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v14;
      _os_log_impl(&dword_1C35DB000, v15, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from defaults (user-specified model): %@", buf, 0xCu);
    }

    pre_signpost_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PRE-ReadExperimentNameDefaults", "Completed", buf, 2u);
    }
  }
  else if (v10 == 1)
  {
    pre_responses_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("QR_CHUNK_PLIST_BUNDLED_ON_DEVICE");
      _os_log_impl(&dword_1C35DB000, v17, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from defaults (bundled in build): %@", buf, 0xCu);
    }

    pre_signpost_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PRE-ReadExperimentNameDefaults", "Completed", buf, 2u);
    }
    v14 = CFSTR("QR_CHUNK_PLIST_BUNDLED_ON_DEVICE");
  }
  else if (v10)
  {
    pre_signpost_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    v29 = 7;
    v20 = os_signpost_id_make_with_pointer(v19, &v29);

    pre_signpost_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PRE-ReadTrialExperimentNameFactor", "Start", buf, 2u);
    }

    -[PREExperimentResolverProtocol getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self->_experimentResolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v4, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject treatmentName](v13, "treatmentName");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    pre_responses_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v32 = v23;
        _os_log_impl(&dword_1C35DB000, v24, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from Trial: %@", buf, 0xCu);
      }

      pre_signpost_handle();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C35DB000, v27, OS_SIGNPOST_INTERVAL_END, v20, "PRE-ReadTrialExperimentNameFactor", "Completed", buf, 2u);
      }

      v14 = v23;
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v32 = CFSTR("DEFAULT_RESPONSE_KIT");
        _os_log_impl(&dword_1C35DB000, v24, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName got nothing from defaults or trials, returning fallback: %@", buf, 0xCu);
      }

      v14 = CFSTR("DEFAULT_RESPONSE_KIT");
    }

  }
  else
  {
    pre_responses_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("DEFAULT_RESPONSE_KIT");
      _os_log_impl(&dword_1C35DB000, v11, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment activeExperimentName from defaults (response kit): %@", buf, 0xCu);
    }

    pre_signpost_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PRE-ReadExperimentNameDefaults", "Completed", buf, 2u);
    }
    v14 = CFSTR("DEFAULT_RESPONSE_KIT");
  }

  return v14;
}

- (id)suggestionsForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  PREPredictionExemptTermsDetector *exemptTermsDetector;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  PREResponsesExperimentSuggestionsResponse *v49;
  uint64_t v51;
  void *v52;
  void *v53;
  os_signpost_id_t spid;
  unint64_t v55;
  void *v56;
  void *v57;
  uint8_t v58[16];
  uint8_t v59[16];
  uint8_t buf[12];
  int ptr;

  v4 = a3;
  pre_signpost_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v6 = os_signpost_id_make_with_pointer(v5, &ptr);

  pre_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  spid = v6;
  v9 = v6 - 1;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-SyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  v10 = objc_msgSend(v4, "includesDynamicSuggestions");
  if ((objc_msgSend(v4, "includesDynamicSuggestions") & 1) != 0
    || -[PREResponsesExperiment includeCannedResponses](self, "includeCannedResponses"))
  {
    v55 = v9;
    v11 = (void *)objc_opt_class();
    objc_msgSend(v4, "receivedMessages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_rawStringsForMessages:excludingTapBacks:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_opt_class();
    objc_msgSend(v4, "senderMessages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_rawStringsForMessages:excludingTapBacks:", v15, 1);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "receivedMessages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "senderIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();

    +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageLastChangedDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v16;
    v23 = v16;
    v24 = (void *)v19;
    objc_msgSend(v20, "localeForIncomingMessages:outgoingMessages:defaultLocale:defaultLocaleLastChangedDate:sender:", v13, v23, v21, v22, v19);
    v25 = objc_claimAutoreleasedReturnValue();

    exemptTermsDetector = self->_exemptTermsDetector;
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRELocaleDetection languageTagForLocaleIdentifier:](PRELocaleDetection, "languageTagForLocaleIdentifier:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(exemptTermsDetector) = -[PREPredictionExemptTermsDetector checkForExemptContentInText:languageCode:](exemptTermsDetector, "checkForExemptContentInText:languageCode:", v27, v28);

    if ((_DWORD)exemptTermsDetector)
    {
      pre_responses_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_1C35DB000, v29, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received messages contain exempt content", v59, 2u);
      }

      v10 = 0;
    }
    if (-[PREResponsesExperiment includeCannedResponses](self, "includeCannedResponses")
      && objc_msgSend((id)objc_opt_class(), "_isPreferredLocaleValid:", v25))
    {
      objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PREResponsesExperiment _cannedRepliesForLanguage:inputPreferences:](PREResponsesExperiment, "_cannedRepliesForLanguage:inputPreferences:", v30, self->_tiPreferencesController);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = (void *)MEMORY[0x1E0C9AA60];
    }
    v56 = (void *)v25;
    if (v10)
    {
      v32 = -[TIPreferencesController BOOLForKey:](self->_tiPreferencesController, "BOOLForKey:", 9);
      v33 = 384;
      if (v32)
        v33 = 256;
      v51 = v33;
      +[PREResponsesExperiment _getConversationHistoryFromRequest:](PREResponsesExperiment, "_getConversationHistoryFromRequest:", v4);
      v53 = v13;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "text");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "recipients");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREResponsesExperiment handlesFromRecipients:](self, "handlesFromRecipients:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "requestDate");
      v52 = v31;
      v39 = v24;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "languageCode");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "languageLastChangedDate");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v25;
      v44 = (void *)v42;
      -[PREResponsesExperiment _responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:](self, "_responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:", v36, 4, v57, v34, 0, v40, v41, v42, v38, v51, v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v39;
      v31 = v52;

      v13 = v53;
    }
    else
    {
      v45 = 0;
    }
    pre_signpost_handle();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)v58 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v47, OS_SIGNPOST_INTERVAL_END, spid, "PRE-SyncFullNonEditableSuggestions", "Completed", v58, 2u);
    }

    +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:](PREResponsesExperiment, "_suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:", v45, v31, self->_tiPreferencesController);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[PREResponsesExperimentSuggestionsResponse initWithSuggestions:]([PREResponsesExperimentSuggestionsResponse alloc], "initWithSuggestions:", v48);

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (void)suggestionsForRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  _QWORD v20[4];
  id v21;
  PREResponsesExperiment *v22;
  id v23;
  id v24;
  uint8_t buf[8];
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  int ptr;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  os_signpost_id_t v33;

  v6 = a3;
  v7 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  pre_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v9 = os_signpost_id_make_with_pointer(v8, &ptr);

  v33 = v9;
  pre_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v31[3];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PRE-AsyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke;
  v26[3] = &unk_1E7D9E330;
  v27 = v7;
  v28 = &v30;
  v14 = v7;
  v15 = (void *)MEMORY[0x1C3BD3B64](v26);
  if (suggestionsForRequest_withCompletion___pasOnceToken411 != -1)
    dispatch_once(&suggestionsForRequest_withCompletion___pasOnceToken411, &__block_literal_global_116);
  *(_QWORD *)buf = 0;
  v16 = (id)suggestionsForRequest_withCompletion___pasExprOnceResult;
  objc_initWeak((id *)buf, self);
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_2;
  v20[3] = &unk_1E7D9E3A0;
  objc_copyWeak(&v24, (id *)buf);
  v22 = self;
  v23 = v15;
  v21 = v6;
  v17 = v6;
  v18 = v15;
  v19 = dispatch_block_create((dispatch_block_flags_t)0, v20);
  dispatch_async(v16, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(&v30, 8);
}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipients:(id)a9 options:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;

  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  -[PREResponsesExperiment handlesFromRecipients:](self, "handlesFromRecipients:", a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREResponsesExperiment responsesForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:](self, "responsesForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:", v20, a4, v19, v18, v17, v16, v21, a10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)fullNonEditableSuggestionsListForMessage:(id)a3 context:(id)a4 additionalSenderMessages:(id)a5 date:(id)a6 keyboardLanguageID:(id)a7 keyboardLanguageLastChangedDate:(id)a8 recipients:(id)a9 includeDynamicSuggestions:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v32;
  os_signpost_id_t spid;
  uint8_t v35[16];
  uint8_t buf[12];
  int ptr;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  pre_signpost_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v24 = os_signpost_id_make_with_pointer(v23, &ptr);

  pre_signpost_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  spid = v24;
  v27 = v24 - 1;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-SyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  LOBYTE(v32) = a10;
  -[PREResponsesExperiment nonEditableSuggestionsForMessage:messageDate:senderID:recipients:outgoingMessageHistory:keyboardLanguageID:keyboardLanguageLastChangedDate:includeDynamicSuggestions:](self, "nonEditableSuggestionsForMessage:messageDate:senderID:recipients:outgoingMessageHistory:keyboardLanguageID:keyboardLanguageLastChangedDate:includeDynamicSuggestions:", v22, v19, v21, v16, v20, v18, v17, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  pre_signpost_handle();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)v35 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v30, OS_SIGNPOST_INTERVAL_END, spid, "PRE-SyncFullNonEditableSuggestions", "Completed", v35, 2u);
  }

  return v28;
}

- (void)fullNonEditableSuggestionsListForMessage:(id)a3 context:(id)a4 additionalSenderMessages:(id)a5 date:(id)a6 keyboardLanguageID:(id)a7 keyboardLanguageLastChangedDate:(id)a8 recipients:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  dispatch_block_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  BOOL v52;
  uint8_t buf[8];
  _QWORD v54[4];
  id v55;
  os_signpost_id_t v56;
  int ptr[3];

  v41 = a3;
  v39 = a4;
  v37 = a5;
  v17 = a6;
  v35 = a7;
  v33 = a8;
  v18 = a9;
  v19 = a11;
  pre_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  ptr[0] = 7;
  v21 = os_signpost_id_make_with_pointer(v20, ptr);

  pre_signpost_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PRE-AsyncFullNonEditableSuggestions", "Start", buf, 2u);
  }

  v24 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke;
  v54[3] = &unk_1E7D9E3E8;
  v55 = v19;
  v56 = v21;
  v40 = v19;
  v25 = (void *)MEMORY[0x1C3BD3B64](v54);
  if (fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasOnceToken421 != -1)
    dispatch_once(&fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasOnceToken421, &__block_literal_global_134);
  *(_QWORD *)buf = 0;
  v26 = (id)fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasExprOnceResult;
  objc_initWeak((id *)buf, self);
  block[0] = v24;
  block[1] = 3221225472;
  block[2] = __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke_2;
  block[3] = &unk_1E7D9E430;
  objc_copyWeak(&v51, (id *)buf);
  v43 = v41;
  v44 = v17;
  v45 = v39;
  v46 = v18;
  v47 = v37;
  v48 = v35;
  v49 = v33;
  v50 = v25;
  v52 = a10;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v27 = v18;
  v28 = v39;
  v29 = v17;
  v30 = v41;
  v31 = v25;
  v32 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_async(v26, v32);

  objc_destroyWeak(&v51);
  objc_destroyWeak((id *)buf);

}

- (id)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipients:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[PREResponsesExperiment handlesFromRecipients:](self, "handlesFromRecipients:", a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = a10;
  -[PREResponsesExperiment nonEditableSuggestionsForMessage:messageDate:senderID:recipientHandles:outgoingMessageHistory:keyboardLanguageID:keyboardLanguageLastChangedDate:includeDynamicSuggestions:](self, "nonEditableSuggestionsForMessage:messageDate:senderID:recipientHandles:outgoingMessageHistory:keyboardLanguageID:keyboardLanguageLastChangedDate:includeDynamicSuggestions:", v22, v21, v20, v23, v19, v18, v17, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipientHandles:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10
{
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  PREPredictionExemptTermsDetector *exemptTermsDetector;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  uint8_t buf[16];

  v16 = a10;
  v17 = a3;
  v38 = a4;
  v18 = a5;
  v37 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!a10 && !-[PREResponsesExperiment includeCannedResponses](self, "includeCannedResponses"))
  {
    v34 = (void *)MEMORY[0x1E0C9AA60];
    v31 = v37;
    v30 = v38;
    goto LABEL_17;
  }
  +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v18;
  objc_msgSend(v22, "localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:", v17, v19, v20, v21, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  exemptTermsDetector = self->_exemptTermsDetector;
  +[PRELocaleDetection languageTagForLocaleIdentifier:](PRELocaleDetection, "languageTagForLocaleIdentifier:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(exemptTermsDetector) = -[PREPredictionExemptTermsDetector checkForExemptContentInText:languageCode:](exemptTermsDetector, "checkForExemptContentInText:languageCode:", v17, v25);

  if ((_DWORD)exemptTermsDetector)
  {
    pre_responses_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v26, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received message contains exempt content", buf, 2u);
    }

    v16 = 0;
  }
  if (!-[PREResponsesExperiment includeCannedResponses](self, "includeCannedResponses")
    || !objc_msgSend((id)objc_opt_class(), "_isPreferredLocaleValid:", v23))
  {
    v28 = (void *)MEMORY[0x1E0C9AA60];
    if (!v16)
      goto LABEL_10;
LABEL_12:
    v32 = -[TIPreferencesController BOOLForKey:](self->_tiPreferencesController, "BOOLForKey:", 9);
    v33 = 384;
    if (v32)
      v33 = 256;
    v31 = v37;
    v30 = v38;
    -[PREResponsesExperiment _responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:](self, "_responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:", v17, 4, v19, 0, v36, v38, v20, v21, v37, v33, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PREResponsesExperiment _cannedRepliesForLanguage:inputPreferences:](PREResponsesExperiment, "_cannedRepliesForLanguage:inputPreferences:", v27, self->_tiPreferencesController);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_12;
LABEL_10:
  v29 = 0;
  v31 = v37;
  v30 = v38;
LABEL_15:
  +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:](PREResponsesExperiment, "_suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:", v29, v28, self->_tiPreferencesController);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v36;
LABEL_17:

  return v34;
}

- (void)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipients:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;

  v18 = a11;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  -[PREResponsesExperiment handlesFromRecipients:](self, "handlesFromRecipients:", a6);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = a10;
  -[PREResponsesExperiment nonEditableSuggestionsForMessage:messageDate:senderID:recipientHandles:outgoingMessageHistory:keyboardLanguageID:keyboardLanguageLastChangedDate:includeDynamicSuggestions:completion:](self, "nonEditableSuggestionsForMessage:messageDate:senderID:recipientHandles:outgoingMessageHistory:keyboardLanguageID:keyboardLanguageLastChangedDate:includeDynamicSuggestions:completion:", v24, v23, v22, v26, v21, v20, v19, v25, v18);

}

- (void)nonEditableSuggestionsForMessage:(id)a3 messageDate:(id)a4 senderID:(id)a5 recipientHandles:(id)a6 outgoingMessageHistory:(id)a7 keyboardLanguageID:(id)a8 keyboardLanguageLastChangedDate:(id)a9 includeDynamicSuggestions:(BOOL)a10 completion:(id)a11
{
  BOOL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  PREPredictionExemptTermsDetector *exemptTermsDetector;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint8_t buf[8];

  v17 = a10;
  v18 = a3;
  v38 = a4;
  v39 = a5;
  v37 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  if (a10 || -[PREResponsesExperiment includeCannedResponses](self, "includeCannedResponses"))
  {
    +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v21;
    objc_msgSend(v23, "localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:", v18, v19, v20, v21, v39);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    exemptTermsDetector = self->_exemptTermsDetector;
    +[PRELocaleDetection languageTagForLocaleIdentifier:](PRELocaleDetection, "languageTagForLocaleIdentifier:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(exemptTermsDetector) = -[PREPredictionExemptTermsDetector checkForExemptContentInText:languageCode:](exemptTermsDetector, "checkForExemptContentInText:languageCode:", v18, v26);

    if ((_DWORD)exemptTermsDetector)
    {
      pre_responses_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C35DB000, v27, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received message contains exempt content", buf, 2u);
      }

      v17 = 0;
    }
    if (-[PREResponsesExperiment includeCannedResponses](self, "includeCannedResponses")
      && objc_msgSend((id)objc_opt_class(), "_isPreferredLocaleValid:", v24))
    {
      objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[PREResponsesExperiment _cannedRepliesForLanguage:inputPreferences:](PREResponsesExperiment, "_cannedRepliesForLanguage:inputPreferences:", v28, self->_tiPreferencesController);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = (void *)MEMORY[0x1E0C9AA60];
    }
    v30 = v19;
    if (v17)
    {
      if (-[TIPreferencesController BOOLForKey:](self->_tiPreferencesController, "BOOLForKey:", 9))
        v31 = 256;
      else
        v31 = 384;
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __208__PREResponsesExperiment_nonEditableSuggestionsForMessage_messageDate_senderID_recipientHandles_outgoingMessageHistory_keyboardLanguageID_keyboardLanguageLastChangedDate_includeDynamicSuggestions_completion___block_invoke;
      v40[3] = &unk_1E7D9E378;
      objc_copyWeak(&v43, (id *)buf);
      v42 = v22;
      v41 = v29;
      v35 = v31;
      v32 = v37;
      v33 = v38;
      -[PREResponsesExperiment _responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:completionBlock:](self, "_responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:completionBlock:", v18, 4, v30, 0, v39, v38, v20, v36, v37, v35, v24, v40);

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:](PREResponsesExperiment, "_suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:", 0, v29, self->_tiPreferencesController);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v22 + 2))(v22, v34);

      v32 = v37;
      v33 = v38;
    }

    v21 = v36;
  }
  else
  {
    v30 = v19;
    (*((void (**)(id, _QWORD))v22 + 2))(v22, MEMORY[0x1E0C9AA60]);
    v32 = v37;
    v33 = v38;
  }

}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:", v21, 0, v17, 0, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREResponsesExperiment _responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:](self, "_responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:", v21, a4, 0, v20, v19, v18, v17, 0, v16, a10, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 outgoingMessageHistory:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 time:(id)a8 withLanguage:(id)a9 languageLastChangedDate:(id)a10 recipientHandles:(id)a11 options:(unint64_t)a12 preferredLocale:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  NSObject *v38;
  NSObject *v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  os_signpost_id_t v51;
  os_signpost_id_t spid;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  int ptr;
  uint64_t v61[3];
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a5;
  v54 = a6;
  v58 = a7;
  v57 = a8;
  v56 = a9;
  v55 = a10;
  v20 = a11;
  v21 = a13;
  if (objc_msgSend((id)objc_opt_class(), "_isPreferredLocaleValid:", v21))
  {
    v61[2] = 0;
    v61[0] = (uint64_t)CFSTR("sync-responsesForMessage");
    v61[1] = mach_absolute_time();
    pre_signpost_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    ptr = 7;
    spid = os_signpost_id_make_with_pointer(v22, &ptr);

    pre_signpost_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v24, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-SyncTotalResponsesForMessage", "Start", buf, 2u);
    }

    pre_responses_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v25, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment sync api called", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PREResponsesExperiment shouldUseDefaultRKTreatmentForLanguage:](self, "shouldUseDefaultRKTreatmentForLanguage:", v26);
    if (objc_msgSend((id)objc_opt_class(), "_isStringEmpty:", v18))
    {
      pre_responses_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v29 = "PREResponsesExperiment sync received null message, returning empty array";
LABEL_19:
        _os_log_impl(&dword_1C35DB000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
      }
    }
    else if (v18
           && objc_msgSend(v19, "count")
           && (objc_msgSend(v19, "firstObject"),
               v31 = (void *)objc_claimAutoreleasedReturnValue(),
               v32 = objc_msgSend(v18, "isEqualToString:", v31),
               v31,
               v32))
    {
      pre_responses_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v29 = "PREResponsesExperiment sync received message exactly matching first message in outgoing history; treating "
              "prompt as outgoing message and returning empty array";
        goto LABEL_19;
      }
    }
    else
    {
      +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isLanguageMismatchedForMessage:withLocaleIdentifier:", v18, v21);

      if (!v34)
      {
        if (v27)
        {
          pre_responses_handle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C35DB000, v35, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment sync api is fetching default RK responses", buf, 2u);
          }

          pre_signpost_handle();
          v36 = objc_claimAutoreleasedReturnValue();
          v59 = 7;
          v37 = os_signpost_id_make_with_pointer(v36, &v59);

          pre_signpost_handle();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v38;
          v40 = v37 - 1;
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C35DB000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "PRE-SyncRKResponsesForMessage", "Start", buf, 2u);
          }

          v51 = v37;
          -[RKMessageResponseManager responsesForMessage:maximumResponses:forContext:withLanguage:options:](self->_rkClient, "responsesForMessage:maximumResponses:forContext:withLanguage:options:", v18, a4, v58, v26, a12);
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = (void *)v41;
          if (v41)
          {
            +[PREResponseItem responseItemArrayFromResponseKitArray:forLocale:](PREResponseItem, "responseItemArrayFromResponseKitArray:forLocale:", v41, v56);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v43 = (void *)MEMORY[0x1E0C9AA60];
          }
          -[PREResponsesExperiment registerGenerationWithPreResponseItems:language:isCached:responseTimePerf:promptMessage:generationStatus:](self, "registerGenerationWithPreResponseItems:language:isCached:responseTimePerf:promptMessage:generationStatus:", v43, v26, 0, PRERecordMeasurementState(v61), v18, 1);
          pre_signpost_handle();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C35DB000, v45, OS_SIGNPOST_INTERVAL_END, v51, "PRE-SyncRKResponsesForMessage", "Completed", buf, 2u);
          }

        }
        else
        {
          -[PREResponsesExperiment waitForPreResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:](self, "waitForPreResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:", v18, a4, 0, v58, v57, v26, v20, a12);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        pre_signpost_handle();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1C35DB000, v47, OS_SIGNPOST_INTERVAL_END, spid, "PRE-SyncTotalResponsesForMessage", "Completed", buf, 2u);
        }

        pre_responses_handle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = objc_msgSend(v43, "count");
          *(_DWORD *)buf = 134217984;
          v63 = v49;
          _os_log_impl(&dword_1C35DB000, v48, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment sync api returning %tu responses", buf, 0xCu);
        }

        objc_msgSend((id)objc_opt_class(), "_getFormattedPREResponseItems:inputPreferences:", v43, self->_tiPreferencesController);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_41;
      }
      pre_responses_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v29 = "PREResponsesExperiment sync detected language mismatch between prompt and previous outgoing messages in co"
              "nversation, returning empty array";
        goto LABEL_19;
      }
    }

    PRERecordMeasurementState(v61);
    v30 = (void *)MEMORY[0x1E0C9AA60];
LABEL_41:

    PRERecordMeasurementState(v61);
    goto LABEL_42;
  }
  v30 = (void *)MEMORY[0x1E0C9AA60];
LABEL_42:

  return v30;
}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipients:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v18 = a11;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  -[PREResponsesExperiment handlesFromRecipients:](self, "handlesFromRecipients:", a9);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[PREResponsesExperiment responsesForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:completionBlock:](self, "responsesForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:completionBlock:", v23, a4, v22, v21, v20, v19, v24, a10, v18);

}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v26;

  v17 = a11;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:", v23, 0, v19, 0, v21);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  -[PREResponsesExperiment _responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:completionBlock:](self, "_responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:completionBlock:", v23, a4, 0, v22, v21, v20, v19, 0, v18, a10, v26, v17);
}

- (void)_responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 outgoingMessageHistory:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 time:(id)a8 withLanguage:(id)a9 languageLastChangedDate:(id)a10 recipientHandles:(id)a11 options:(unint64_t)a12 preferredLocale:(id)a13 completionBlock:(id)a14
{
  id v19;
  id v20;
  id v21;
  void (**v22)(id, _QWORD);
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  RKMessageResponseManager *rkClient;
  id *p_location;
  void *spid;
  void *v51;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  void (**v60)(id, _QWORD);
  uint8_t *v61;
  id v62[2];
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  void (**v67)(id, _QWORD);
  uint8_t *v68;
  uint8_t *v69;
  id v70[2];
  uint8_t v71[12];
  int v72;
  uint8_t v73[8];
  uint8_t *v74;
  uint64_t v75;
  os_signpost_id_t v76;
  id location;
  uint8_t buf[8];
  uint8_t *v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  uint64_t v83;
  uint64_t v84;
  int ptr[3];

  v57 = a3;
  v19 = a5;
  v56 = a6;
  v58 = a7;
  v55 = a8;
  v54 = a9;
  v20 = a10;
  v53 = a11;
  v21 = a13;
  v22 = (void (**)(id, _QWORD))a14;
  v23 = v20;
  if ((objc_msgSend((id)objc_opt_class(), "_isPreferredLocaleValid:", v21) & 1) != 0)
  {
    pre_signpost_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    ptr[0] = 7;
    v25 = os_signpost_id_make_with_pointer(v24, ptr);

    pre_signpost_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v25 - 1;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PRE-AsyncTotalResponsesForMessage", "Start", buf, 2u);
    }
    spid = (void *)v25;

    *(_QWORD *)buf = 0;
    v79 = buf;
    v80 = 0x3810000000;
    v83 = 0;
    v84 = 0;
    v81 = &unk_1C35FF5CD;
    v82 = CFSTR("async-responsesForMessage");
    v83 = mach_absolute_time();
    v84 = 0;
    objc_msgSend(MEMORY[0x1E0D70A90], "languageForLocaleIdentifier:", v21);
    v29 = v57;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PREResponsesExperiment shouldUseDefaultRKTreatmentForLanguage:](self, "shouldUseDefaultRKTreatmentForLanguage:", v51);
    if (objc_msgSend((id)objc_opt_class(), "_isStringEmpty:", v57))
    {
      pre_responses_handle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl(&dword_1C35DB000, v31, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment responsesForMessage async received null message, returning empty array", v73, 2u);
      }

      v22[2](v22, MEMORY[0x1E0C9AA60]);
      pre_signpost_handle();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v28 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v32))
        goto LABEL_27;
      *(_WORD *)v73 = 0;
    }
    else if (v57
           && objc_msgSend(v19, "count")
           && (objc_msgSend(v19, "firstObject"),
               v34 = (void *)objc_claimAutoreleasedReturnValue(),
               v35 = objc_msgSend(v57, "isEqualToString:", v34),
               v34,
               v35))
    {
      pre_responses_handle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl(&dword_1C35DB000, v36, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment responsesForMessage async received message exactly matching first message in outgoing history; treating prompt as outgoing message and returning empty array",
          v73,
          2u);
      }

      v22[2](v22, MEMORY[0x1E0C9AA60]);
      pre_signpost_handle();
      v37 = objc_claimAutoreleasedReturnValue();
      v33 = v37;
      if (v28 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v37))
        goto LABEL_27;
      *(_WORD *)v73 = 0;
    }
    else
    {
      +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isLanguageMismatchedForMessage:withLocaleIdentifier:", v57, v21);

      if (!v39)
      {
        if (v30)
        {
          pre_responses_handle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v73 = 0;
            _os_log_impl(&dword_1C35DB000, v42, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment async api is fetching default RK responses", v73, 2u);
          }

          location = 0;
          objc_initWeak(&location, self);
          *(_QWORD *)v73 = 0;
          v74 = v73;
          v75 = 0x2020000000;
          v76 = 0;
          pre_signpost_handle();
          v43 = objc_claimAutoreleasedReturnValue();
          v72 = 7;
          v44 = os_signpost_id_make_with_pointer(v43, &v72);

          v76 = v44;
          pre_signpost_handle();
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = v45;
          v47 = *((_QWORD *)v74 + 3);
          if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
          {
            *(_WORD *)v71 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C35DB000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v47, "PRE-AsyncRKResponsesForMessage", "Start", v71, 2u);
          }

          rkClient = self->_rkClient;
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke;
          v63[3] = &unk_1E7D9E510;
          objc_copyWeak(v70, &location);
          v68 = v73;
          v70[1] = spid;
          v64 = v54;
          v69 = buf;
          v67 = v22;
          v65 = v51;
          v66 = v57;
          -[RKMessageResponseManager responsesForMessage:maximumResponses:forContext:withLanguage:options:completionBlock:](rkClient, "responsesForMessage:maximumResponses:forContext:withLanguage:options:completionBlock:", v66, a4, v58, v65, a12, v63);

          objc_destroyWeak(v70);
          _Block_object_dispose(v73, 8);
          p_location = &location;
        }
        else
        {
          *(_QWORD *)v73 = 0;
          objc_initWeak((id *)v73, self);
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke_141;
          v59[3] = &unk_1E7D9E458;
          objc_copyWeak(v62, (id *)v73);
          v60 = v22;
          v61 = buf;
          v62[1] = spid;
          v29 = v57;
          -[PREResponsesExperiment preResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:completionBlock:](self, "preResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:completionBlock:", v57, a4, v56, v58, v55, v51, v53, a12, v59);

          objc_destroyWeak(v62);
          p_location = (id *)v73;
        }
        objc_destroyWeak(p_location);
        goto LABEL_37;
      }
      pre_responses_handle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl(&dword_1C35DB000, v40, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment responsesForMessage async detected language mismatch between prompt and previous outgoing messages in conversation, returning empty array", v73, 2u);
      }

      v22[2](v22, MEMORY[0x1E0C9AA60]);
      pre_signpost_handle();
      v41 = objc_claimAutoreleasedReturnValue();
      v33 = v41;
      if (v28 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v41))
      {
LABEL_27:

        PRERecordMeasurementState((uint64_t *)v79 + 4);
LABEL_37:

        _Block_object_dispose(buf, 8);
        goto LABEL_38;
      }
      *(_WORD *)v73 = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v33, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "PRE-AsyncTotalResponsesForMessage", "Completed", v73, 2u);
    goto LABEL_27;
  }
  v22[2](v22, MEMORY[0x1E0C9AA60]);
  v29 = v57;
LABEL_38:

}

- (void)performWithResolvedModelAssetPathsUsingLanguage:(id)a3 block:(id)a4
{
  void (**v6)(id, id, id, id, id);
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = (void (**)(id, id, id, id, id))a4;
  if (-[PREResponsesExperiment mode](self, "mode") == 2)
  {
    -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("experimentModelUserDirectory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if ((-[NSObject isReadableFileAtPath:](v8, "isReadableFileAtPath:", v7) & 1) != 0)
      {
        objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("model.chunk"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v10;
        if (-[NSObject isReadableFileAtPath:](v9, "isReadableFileAtPath:", v10))
          v11 = v10;
        else
          v11 = 0;
        objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("config.plist"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v20;
        if (-[NSObject isReadableFileAtPath:](v9, "isReadableFileAtPath:", v20))
          v12 = v20;
        else
          v12 = 0;
        objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("espresso.bin"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject isReadableFileAtPath:](v9, "isReadableFileAtPath:", v21))
          v13 = v21;
        else
          v13 = 0;
        objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("vocab.trie"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject isReadableFileAtPath:](v9, "isReadableFileAtPath:", v22))
          v14 = v22;
        else
          v14 = 0;

        goto LABEL_28;
      }
      pre_responses_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C35DB000, v19, OS_LOG_TYPE_FAULT, "PREResponsesExperiment performWithResolvedModelAssetPaths could not read user-specified model directory. Is this in a location thie process can read from? Falling back on bundled assets.", buf, 2u);
      }

    }
    else
    {
      pre_responses_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C35DB000, v18, OS_LOG_TYPE_FAULT, "PREResponsesExperiment performWithResolvedModelAssetPaths could not resolve user-specified model directory. Has this been specified correctly in user defaults? Falling back on bundled assets.", buf, 2u);
      }

      v7 = 0;
    }
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v11 = 0;
LABEL_28:

    goto LABEL_29;
  }
  if (-[PREResponsesExperiment mode](self, "mode") != 1)
  {
    -[PREExperimentResolverProtocol getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self->_experimentResolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inferenceModelFilePath");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inferenceModelConfigPath");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "espressoBinFilePath");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vocabFilePath");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    pre_responses_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "experimentIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "experimentId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "experimentIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "treatmentId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREResponsesExperiment activeExperimentNameForLanguage:](self, "activeExperimentNameForLanguage:", v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_1C35DB000, v9, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment performWithResolvedModelAssets api is fetching experimental responses with experiment %@, treatment %@, model %@", buf, 0x20u);

    }
    goto LABEL_28;
  }
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v11 = 0;
LABEL_29:
  v6[2](v6, v11, v12, v13, v14);

}

- (void)predictionsForRequest:(id)a3 heads:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  PREResponsesProtocol *xpcClient;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[8];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[5];
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__1795;
  v42[4] = __Block_byref_object_dispose__1796;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1795;
  v40 = __Block_byref_object_dispose__1796;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1795;
  v34 = __Block_byref_object_dispose__1796;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1795;
  v28 = __Block_byref_object_dispose__1796;
  v29 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke;
  v23[3] = &unk_1E7D9E4C0;
  v23[4] = v42;
  v23[5] = &v36;
  v23[6] = &v30;
  v23[7] = &v24;
  -[PREResponsesExperiment performWithResolvedModelAssetPathsUsingLanguage:block:](self, "performWithResolvedModelAssetPathsUsingLanguage:block:", CFSTR("en"), v23);
  +[PREResponsesExperiment _getConversationHistoryFromRequest:](PREResponsesExperiment, "_getConversationHistoryFromRequest:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  xpcClient = self->_xpcClient;
  v16 = v37[5];
  v17 = v31[5];
  v18 = v25[5];
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke_2;
  v21[3] = &unk_1E7D9E4E8;
  v19 = v10;
  v22 = v19;
  -[PREResponsesProtocol predictForMessage:conversationTurns:language:plistPath:espressoBinPath:vocabPath:heads:completion:](xpcClient, "predictForMessage:conversationTurns:language:plistPath:espressoBinPath:vocabPath:heads:completion:", v14, v12, CFSTR("en"), v16, v17, v18, v9, v21);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);

}

- (void)predictionsForRequest:(id)a3 plistPath:(id)a4 espressoBinPath:(id)a5 vocabPath:(id)a6 heads:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  PREResponsesProtocol *xpcClient;
  id v23;
  _QWORD v24[4];
  id v25;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  +[PREResponsesExperiment _getConversationHistoryFromRequest:](PREResponsesExperiment, "_getConversationHistoryFromRequest:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  xpcClient = self->_xpcClient;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__PREResponsesExperiment_predictionsForRequest_plistPath_espressoBinPath_vocabPath_heads_completion___block_invoke;
  v24[3] = &unk_1E7D9E4E8;
  v25 = v14;
  v23 = v14;
  -[PREResponsesProtocol predictForMessage:conversationTurns:language:plistPath:espressoBinPath:vocabPath:heads:completion:](xpcClient, "predictForMessage:conversationTurns:language:plistPath:espressoBinPath:vocabPath:heads:completion:", v21, v19, CFSTR("en"), v18, v17, v16, v15, v24);

}

- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10 completionBlock:(id)a11
{
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  PREResponsesProtocol *xpcClient;
  void *v49;
  id v50;
  id v51;
  id v52;
  char *spid;
  void (**v55)(id, void *);
  id v56;
  void *v57;
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  id v63;
  void (**v64)(id, void *);
  uint64_t *v65;
  uint8_t *v66;
  id v67[4];
  _QWORD v68[8];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  int v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  os_signpost_id_t v91;
  id location;
  int v93;
  uint8_t buf[8];
  uint8_t *v95;
  uint64_t v96;
  void *v97;
  const __CFString *v98;
  uint64_t v99;
  uint64_t v100;
  int ptr;
  __int128 v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v50 = a5;
  v51 = a6;
  v56 = a7;
  v58 = a8;
  v52 = a9;
  v55 = (void (**)(id, void *))a11;
  pre_signpost_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  spid = (char *)os_signpost_id_make_with_pointer(v17, &ptr);

  pre_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "PRE-AsyncTotalResponsesForMessage", "Start", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v95 = buf;
  v96 = 0x3810000000;
  v99 = 0;
  v100 = 0;
  v97 = &unk_1C35FF5CD;
  v98 = CFSTR("preResponseItemsForMessage");
  v99 = mach_absolute_time();
  v100 = 0;
  pre_responses_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v102) = 0;
    _os_log_impl(&dword_1C35DB000, v20, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment async api called", (uint8_t *)&v102, 2u);
  }

  -[PREResponsesExperiment clippedMessageIfNecessary:](self, "clippedMessageIfNecessary:", v16);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  pre_signpost_handle();
  v21 = objc_claimAutoreleasedReturnValue();
  v93 = 7;
  v22 = os_signpost_id_make_with_pointer(v21, &v93);

  pre_signpost_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    LOWORD(v102) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PRE-ReadSharedCache", "Start", (uint8_t *)&v102, 2u);
  }

  -[PREResponsesExperiment cacheKeyForMessage:maxResponses:time:language:](self, "cacheKeyForMessage:maxResponses:time:language:", v57, a4, v56, v58);
  v25 = objc_claimAutoreleasedReturnValue();
  -[_PASLRUCache objectForKey:](self->_responsesGeneratedCache, "objectForKey:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v25;
  pre_signpost_handle();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    LOWORD(v102) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v28, OS_SIGNPOST_INTERVAL_END, v22, "PRE-ReadSharedCache", "Completed", (uint8_t *)&v102, 2u);
  }

  if (v26)
  {
    pre_responses_handle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v26, "count");
      LODWORD(v102) = 134217984;
      *(_QWORD *)((char *)&v102 + 4) = v30;
      _os_log_impl(&dword_1C35DB000, v29, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api loaded %tu responses from cache", (uint8_t *)&v102, 0xCu);
    }

    v31 = PRERecordMeasurementState((uint64_t *)v95 + 4);
    pre_signpost_handle();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      LOWORD(v102) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v33, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&v102, 2u);
    }

    v55[2](v55, v26);
    -[PREResponsesExperiment registerGenerationWithPreResponseItems:language:isCached:responseTimePerf:promptMessage:generationStatus:](self, "registerGenerationWithPreResponseItems:language:isCached:responseTimePerf:promptMessage:generationStatus:", v26, v58, 1, v31, v57, 2);
  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 0;
    pre_signpost_handle();
    v34 = objc_claimAutoreleasedReturnValue();
    v87 = 7;
    v35 = os_signpost_id_make_with_pointer(v34, &v87);

    v91 = v35;
    pre_signpost_handle();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = v89[3];
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      LOWORD(v102) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v38, "PRE-AsyncSuggestdResponsesForMessage", "Start", (uint8_t *)&v102, 2u);
    }

    *(_QWORD *)&v102 = 0;
    *((_QWORD *)&v102 + 1) = &v102;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__1795;
    v105 = __Block_byref_object_dispose__1796;
    v106 = 0;
    v81 = 0;
    v82 = &v81;
    v83 = 0x3032000000;
    v84 = __Block_byref_object_copy__1795;
    v85 = __Block_byref_object_dispose__1796;
    v86 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__1795;
    v79 = __Block_byref_object_dispose__1796;
    v80 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__1795;
    v73 = __Block_byref_object_dispose__1796;
    v74 = 0;
    v39 = MEMORY[0x1E0C809B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke;
    v68[3] = &unk_1E7D9E4C0;
    v68[4] = &v102;
    v68[5] = &v81;
    v68[6] = &v75;
    v68[7] = &v69;
    -[PREResponsesExperiment performWithResolvedModelAssetPathsUsingLanguage:block:](self, "performWithResolvedModelAssetPathsUsingLanguage:block:", v58, v68);
    v47 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 40);
    xpcClient = self->_xpcClient;
    v45 = v76[5];
    v46 = v82[5];
    v40 = v70[5];
    v41 = -[PREResponsesExperiment registerDisplayed](self, "registerDisplayed");
    v42 = -[PREResponsesExperiment includeCustomResponses](self, "includeCustomResponses");
    v43 = -[PREResponsesExperiment includeResponsesToRobots](self, "includeResponsesToRobots");
    v59[0] = v39;
    v59[1] = 3221225472;
    v59[2] = __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_2;
    v59[3] = &unk_1E7D9E538;
    v59[4] = self;
    v65 = &v88;
    v60 = v57;
    v67[1] = (id)a4;
    v61 = v51;
    v62 = v58;
    v67[2] = (id)a10;
    objc_copyWeak(v67, &location);
    v66 = buf;
    v67[3] = spid;
    v64 = v55;
    v63 = v49;
    BYTE2(v44) = v43;
    BYTE1(v44) = v42;
    LOBYTE(v44) = v41;
    -[PREResponsesProtocol preResponseItemsForMessage:maximumResponses:conversationTurns:context:time:language:recipientHandles:modelFilePath:modelConfigPath:espressoBinFilePath:vocabFilePath:registerDisplayed:includeCustomResponses:includeResponsesToRobots:completion:](xpcClient, "preResponseItemsForMessage:maximumResponses:conversationTurns:context:time:language:recipientHandles:modelFilePath:modelConfigPath:espressoBinFilePath:vocabFilePath:registerDisplayed:includeCustomResponses:includeResponsesToRobots:completion:", v60, a4, v50, v61, v56, v62, v52, v47, v46, v45, v40, v44, v59);

    objc_destroyWeak(v67);
    _Block_object_dispose(&v69, 8);

    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v81, 8);

    _Block_object_dispose(&v102, 8);
    _Block_object_dispose(&v88, 8);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(buf, 8);
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 time:(id)a5 metadata:(id)a6 withLanguage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  id v44;
  BOOL v45;
  id v46;
  os_signpost_id_t spid;
  id v48;
  void *v49;
  uint8_t v50[16];
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _BYTE *v59;
  _QWORD *v60;
  id v61;
  int v62;
  BOOL v63;
  id location;
  _QWORD v65[6];
  _QWORD v66[5];
  id v67;
  int ptr;
  _BYTE buf[24];
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v44 = a5;
  v14 = a6;
  v15 = a7;
  pre_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  spid = os_signpost_id_make_with_pointer(v16, &ptr);

  pre_signpost_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PRE-RegisterEngagementPreparation", "Start", buf, 2u);
  }

  -[PREResponsesExperiment cachedResponsesGeneratedEvent](self, "cachedResponsesGeneratedEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "language");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v48 = v20;
  }
  else
  {
    +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:", v13, 0, v15, 0, 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();

  }
  v45 = -[PREResponsesExperiment shouldUseDefaultRKTreatmentForLanguage:](self, "shouldUseDefaultRKTreatmentForLanguage:", v48);
  -[PREResponsesExperiment clippedMessageIfNecessary:](self, "clippedMessageIfNecessary:", v12);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D87C50]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      v25 = v23;
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D87C58]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v27 = objc_msgSend((id)objc_opt_class(), "_preInputMethodFrom:", v26);
    else
      v27 = 0;

  }
  else
  {
    v24 = 0;
    v27 = 0;
  }
  pre_responses_handle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "_inputMethodStringFrom:", v27);
    v29 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v70 = v29;
    _os_log_impl(&dword_1C35DB000, v28, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment user engaged prediction at position %@ with language %@ and method %@", buf, 0x20u);

  }
  -[PREResponsesExperiment cachedResponsesGeneratedEvent](self, "cachedResponsesGeneratedEvent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setResponsesGeneratedEvent:", v30);
  objc_msgSend(v31, "setInputMethod:", v27);
  objc_msgSend(v31, "setSelectedResponse:", v49);
  objc_msgSend(v31, "setSelectedPosition:", v24);
  if (v30)
  {
    v32 = mach_absolute_time();
    objc_msgSend(v31, "setTimeToTap:", PREMachTimeToMilliseconds(v32 - objc_msgSend(v30, "responseGenerationTime")));
  }
  objc_msgSend(v31, "setHasQuestionMark:", objc_msgSend(v13, "containsString:", CFSTR("?")));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v70 = __Block_byref_object_copy__1795;
  v71 = __Block_byref_object_dispose__1796;
  v72 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__1795;
  v66[4] = __Block_byref_object_dispose__1796;
  v67 = 0;
  v33 = MEMORY[0x1E0C809B0];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke;
  v65[3] = &unk_1E7D9E560;
  v65[4] = buf;
  v65[5] = v66;
  -[PREResponsesExperiment performWithResolvedModelAssetPathsUsingLanguage:block:](self, "performWithResolvedModelAssetPathsUsingLanguage:block:", v15, v65);
  location = 0;
  objc_initWeak(&location, self);
  v51[0] = v33;
  v51[1] = 3221225472;
  v51[2] = __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke_2;
  v51[3] = &unk_1E7D9E588;
  objc_copyWeak(&v61, &location);
  v63 = v45;
  v51[4] = self;
  v43 = v12;
  v52 = v43;
  v46 = v13;
  v53 = v46;
  v34 = v14;
  v54 = v34;
  v35 = v15;
  v55 = v35;
  v36 = v31;
  v56 = v36;
  v37 = v49;
  v57 = v37;
  v38 = v24;
  v62 = v27;
  v58 = v38;
  v59 = buf;
  v60 = v66;
  v39 = (void *)MEMORY[0x1C3BD3B64](v51);
  dispatch_get_global_queue(9, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", v40, v39, 0.5);
  pre_signpost_handle();
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)v50 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v42, OS_SIGNPOST_INTERVAL_END, spid, "PRE-RegisterEngagementPreparation", "Completed", v50, 2u);
  }

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
  _Block_object_dispose(v66, 8);

  _Block_object_dispose(buf, 8);
}

- (void)registerResponseDisplayedAtIndex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id location[2];

  v4 = a3;
  if (v4)
  {
    location[0] = 0;
    objc_initWeak(location, self);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __59__PREResponsesExperiment_registerResponseDisplayedAtIndex___block_invoke;
    v11 = &unk_1E7D9E5B0;
    objc_copyWeak(&v13, location);
    v12 = v4;
    v5 = (void *)MEMORY[0x1C3BD3B64](&v8);
    dispatch_get_global_queue(9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", v6, v5, 0.5, v8, v9, v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    pre_responses_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1C35DB000, v7, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment registerResponseDisplayed received invalid params", (uint8_t *)location, 2u);
    }

  }
}

- (void)primeResponsesExperimentsIfNeeded
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[16];

  v2 = -[PREResponsesExperiment waitForPreResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:](self, "waitForPreResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:", CFSTR("wake up, suggestd!"), 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[PREExperimentResolver sharedInstance](PREExperimentResolver, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "warmupForLocale:", v4);

  }
  if (v6 && (objc_msgSend(v4, "isEqualToString:", v6) & 1) == 0)
  {
    +[PREExperimentResolver sharedInstance](PREExperimentResolver, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "warmupForLocale:", v6);

  }
  pre_responses_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C35DB000, v9, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment finished priming suggestd", buf, 2u);
  }

}

- (id)responsesCache
{
  return self->_responsesGeneratedCache;
}

- (void)registerGenerationWithPreResponseItems:(id)a3 language:(id)a4 isCached:(BOOL)a5 responseTimePerf:(unint64_t)a6 promptMessage:(id)a7 generationStatus:(int)a8
{
  uint64_t v8;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PREResponsesMetricsProtocol *v26;
  id v27;
  PREResponsesMetricsProtocol *v28;
  dispatch_block_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t spid;
  _QWORD block[4];
  PREResponsesMetricsProtocol *v35;
  id v36;
  uint8_t buf[12];
  int ptr;

  v8 = *(_QWORD *)&a8;
  v10 = a5;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  pre_signpost_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v18 = os_signpost_id_make_with_pointer(v17, &ptr);

  pre_signpost_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PRE-RegisterImpressionPreparation", "Start", buf, 2u);
  }
  spid = v18;

  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setResponses:", v16);
  objc_msgSend(v16, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "language");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLanguage:", v24);

  objc_msgSend(v22, "setLocale:", v15);
  objc_msgSend(v22, "setIsCached:", v10);
  objc_msgSend(v22, "setResponseTimePerf:", a6);
  objc_msgSend(v22, "setMessageCharCount:", objc_msgSend(v14, "length"));
  v25 = objc_msgSend(v14, "containsString:", CFSTR("?"));

  objc_msgSend(v22, "setHasQuestionMark:", v25);
  objc_msgSend(v22, "setResponseGenerationTime:", mach_absolute_time());
  objc_msgSend(v22, "setGenerationStatus:", v8);
  -[PREResponsesExperiment setCachedResponsesGeneratedEvent:](self, "setCachedResponsesGeneratedEvent:", v22);
  v26 = self->_metrics;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __131__PREResponsesExperiment_registerGenerationWithPreResponseItems_language_isCached_responseTimePerf_promptMessage_generationStatus___block_invoke;
  block[3] = &unk_1E7D9E5D8;
  v35 = v26;
  v36 = v22;
  v27 = v22;
  v28 = v26;
  v29 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_get_global_queue(9, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v30, v29);
  pre_signpost_handle();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PRE-RegisterImpressionPreparation", "Completed", buf, 2u);
  }

}

- (id)waitForPreResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 time:(id)a7 withLanguage:(id)a8 recipientHandles:(id)a9 options:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  id v24;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1795;
  v33 = __Block_byref_object_dispose__1796;
  v34 = 0;
  v22 = dispatch_semaphore_create(0);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __154__PREResponsesExperiment_waitForPreResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options___block_invoke;
  v26[3] = &unk_1E7D9E600;
  v28 = &v29;
  v23 = v22;
  v27 = v23;
  -[PREResponsesExperiment preResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:completionBlock:](self, "preResponseItemsForMessage:maximumResponses:forConversationHistory:forContext:time:withLanguage:recipientHandles:options:completionBlock:", v16, a4, v17, v18, v19, v20, v21, a10, v26);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v23, 1.0);
  v24 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v24;
}

- (id)handlesFromRecipients:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v24[128];
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v5 = (void *)getCKEntityClass_softClass_1788;
  v23 = getCKEntityClass_softClass_1788;
  if (!getCKEntityClass_softClass_1788)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCKEntityClass_block_invoke_1789;
    v26 = &unk_1E7D9E670;
    v27 = &v20;
    __getCKEntityClass_block_invoke_1789((uint64_t)buf);
    v5 = (void *)v21[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v20, 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "rawAddress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
            goto LABEL_14;
          objc_msgSend(v11, "rawAddress");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);
        }
        else
        {
          pre_responses_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            v14 = objc_opt_class();
            *(_DWORD *)buf = 138543619;
            *(_QWORD *)&buf[4] = v14;
            *(_WORD *)&buf[12] = 2117;
            *(_QWORD *)&buf[14] = v11;
            _os_log_fault_impl(&dword_1C35DB000, v13, OS_LOG_TYPE_FAULT, "PREResponsesExperiment unexpectedly received unknown object %{public}@ (%{sensitive}@) when expecting CKEntity", buf, 0x16u);
          }
        }

LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

  return v4;
}

- (BOOL)shouldUseDefaultRKTreatment
{
  return -[PREResponsesExperiment shouldUseDefaultRKTreatmentForLanguage:](self, "shouldUseDefaultRKTreatmentForLanguage:", CFSTR("en"));
}

- (BOOL)shouldUseDefaultRKTreatmentForLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[12];
  int ptr;

  v4 = a3;
  pre_signpost_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v6 = os_signpost_id_make_with_pointer(v5, &ptr);

  pre_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PRE-shouldUseDefaultRKTreatment", "Start", buf, 2u);
  }

  -[PREResponsesExperiment activeExperimentNameForLanguage:](self, "activeExperimentNameForLanguage:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("DEFAULT_RESPONSE_KIT"));
  pre_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v12, OS_SIGNPOST_INTERVAL_END, v6, "PRE-shouldUseDefaultRKTreatment", "Completed", v14, 2u);
  }

  return v10;
}

- (BOOL)registerDisplayed
{
  return self->_registerDisplayed;
}

- (void)setRegisterDisplayed:(BOOL)a3
{
  self->_registerDisplayed = a3;
}

- (BOOL)includeCannedResponses
{
  return self->_includeCannedResponses;
}

- (void)setIncludeCannedResponses:(BOOL)a3
{
  self->_includeCannedResponses = a3;
}

- (BOOL)includeCustomResponses
{
  return self->_includeCustomResponses;
}

- (BOOL)includeResponsesToRobots
{
  return self->_includeResponsesToRobots;
}

- (BOOL)useResponseKitAsFallback
{
  return self->_useResponseKitAsFallback;
}

- (void)setUseResponseKitAsFallback:(BOOL)a3
{
  self->_useResponseKitAsFallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exemptTermsDetector, 0);
  objc_storeStrong((id *)&self->_guardedCachedResponsesGeneratedEvent, 0);
  objc_storeStrong((id *)&self->_responsesGeneratedCache, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_tiPreferencesController, 0);
  objc_storeStrong((id *)&self->_rkClient, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_experimentResolver, 0);
}

void __154__PREResponsesExperiment_waitForPreResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __131__PREResponsesExperiment_registerGenerationWithPreResponseItems_language_isCached_responseTimePerf_promptMessage_generationStatus___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t v10[12];
  int ptr;
  uint8_t buf[16];

  pre_responses_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C35DB000, v2, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment registering impression", buf, 2u);
  }

  pre_signpost_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  ptr = 7;
  v4 = os_signpost_id_make_with_pointer(v3, &ptr);

  pre_signpost_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PRE-RegisterImpression", "Start", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "registerResponsesGenerated:", *(_QWORD *)(a1 + 40));
  pre_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v8, OS_SIGNPOST_INTERVAL_END, v4, "PRE-RegisterImpression", "Completed", v9, 2u);
  }

}

void __59__PREResponsesExperiment_registerResponseDisplayedAtIndex___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    pre_responses_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1C35DB000, v3, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment logging responsesViewedEvent", v4, 2u);
    }

    objc_msgSend(WeakRetained[2], "registerResponseViewed:", *(_QWORD *)(a1 + 32));
  }

}

void __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

void __81__PREResponsesExperiment_registerResponse_forMessage_time_metadata_withLanguage___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[12];
  int ptr;
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 112));
  if (WeakRetained)
  {
    pre_responses_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v3, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment registerResponse api called", buf, 2u);
    }

    pre_signpost_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    ptr = 7;
    v5 = os_signpost_id_make_with_pointer(v4, &ptr);

    pre_signpost_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PRE-RegisterEngagement", "Start", v11, 2u);
    }

    if (*(_BYTE *)(a1 + 124))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "registerResponse:forMessage:metadata:withLanguage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(WeakRetained[2], "registerResponseTapped:", *(_QWORD *)(a1 + 72));
    objc_msgSend(WeakRetained[3], "registerResponse:position:isCanned:isUsingQuickResponses:locale:modelConfigPath:vocabPath:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_DWORD *)(a1 + 120) == 1, *(_BYTE *)(a1 + 124) == 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
    pre_signpost_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v9, OS_SIGNPOST_INTERVAL_END, v5, "PRE-RegisterEngagement", "Completed", v10, 2u);
    }

  }
}

void __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1[4] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v9;
  v23 = v9;

  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v10;
  v17 = v10;

  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v11;
  v20 = v11;

  v21 = *(_QWORD *)(a1[7] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v12;

}

void __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  __int128 *p_buf;
  id v44[2];
  uint8_t v45[12];
  int ptr;
  __int128 buf;
  uint64_t v48;
  os_signpost_id_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v36 = v6;
  if (objc_msgSend(*(id *)(a1 + 32), "useResponseKitAsFallback") && (!v5 || v6))
  {
    pre_responses_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "debugDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1C35DB000, v17, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api got error or no response when calling XPC, falling back to RK: %@", (uint8_t *)&buf, 0xCu);

    }
    pre_signpost_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PRE-AsyncSuggestdResponsesForMessage", "Completed", (uint8_t *)&buf, 2u);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x2020000000;
    v49 = 0;
    pre_signpost_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    ptr = 7;
    v23 = os_signpost_id_make_with_pointer(v22, &ptr);

    v49 = v23;
    pre_signpost_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v45 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PRE-AsyncRKFallbackResponsesForMessage", "Start", v45, 2u);
    }

    v35 = *(_QWORD *)(a1 + 40);
    v27 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v28 = *(_QWORD *)(a1 + 56);
    v29 = *(_QWORD *)(a1 + 48);
    v31 = *(_QWORD *)(a1 + 104);
    v30 = *(_QWORD *)(a1 + 112);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_152;
    v37[3] = &unk_1E7D9E510;
    objc_copyWeak(v44, (id *)(a1 + 96));
    v32 = *(id *)(a1 + 56);
    v33 = *(_QWORD *)(a1 + 88);
    v38 = v32;
    v34 = *(void **)(a1 + 120);
    v42 = v33;
    p_buf = &buf;
    v44[1] = v34;
    v41 = *(id *)(a1 + 72);
    v39 = v36;
    v40 = *(id *)(a1 + 40);
    objc_msgSend(v27, "responsesForMessage:maximumResponses:forContext:withLanguage:options:completionBlock:", v35, v31, v29, v28, v30, v37);

    objc_destroyWeak(v44);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
    pre_responses_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1C35DB000, v8, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api returning %tu responses from suggestd", (uint8_t *)&buf, 0xCu);
    }

    v9 = PRERecordMeasurementState((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    pre_signpost_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PRE-AsyncSuggestdResponsesForMessage", "Completed", (uint8_t *)&buf, 2u);
    }

    pre_signpost_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 120);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&buf, 2u);
    }

    if (objc_msgSend(v5, "count"))
      v16 = 1;
    else
      v16 = 5;
    objc_msgSend(WeakRetained, "registerGenerationWithPreResponseItems:language:isCached:responseTimePerf:promptMessage:generationStatus:", v5, *(_QWORD *)(a1 + 56), 0, v9, *(_QWORD *)(a1 + 40), v16);
    objc_msgSend(WeakRetained[7], "setObject:forKey:", v5, *(_QWORD *)(a1 + 64));

  }
}

void __163__PREResponsesExperiment_preResponseItemsForMessage_maximumResponses_forConversationHistory_forContext_time_withLanguage_recipientHandles_options_completionBlock___block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  pre_responses_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1C35DB000, v5, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment preResponseItemsForMessage api returning %tu responses from ResponseKit fallback", (uint8_t *)&v15, 0xCu);
  }

  +[PREResponseItem responseItemArrayFromResponseKitArray:forLocale:](PREResponseItem, "responseItemArrayFromResponseKitArray:forLocale:", v3, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PRERecordMeasurementState((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  pre_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PRE-AsyncRKFallbackResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  pre_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 88);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (*(_QWORD *)(a1 + 40))
    v14 = 4;
  else
    v14 = 3;
  objc_msgSend(WeakRetained, "registerGenerationWithPreResponseItems:language:isCached:responseTimePerf:promptMessage:generationStatus:", v6, *(_QWORD *)(a1 + 32), 0, v7, *(_QWORD *)(a1 + 48), v14);

}

uint64_t __101__PREResponsesExperiment_predictionsForRequest_plistPath_espressoBinPath_vocabPath_heads_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1[4] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v9;
  v23 = v9;

  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v10;
  v17 = v10;

  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v11;
  v20 = v11;

  v21 = *(_QWORD *)(a1[7] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v12;

}

uint64_t __65__PREResponsesExperiment_predictionsForRequest_heads_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  pre_responses_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1C35DB000, v5, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment async api returning %tu responses", (uint8_t *)&v15, 0xCu);
  }

  pre_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PRE-AsyncRKResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  pre_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 88);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PRE-AsyncTotalResponsesForMessage", "Completed", (uint8_t *)&v15, 2u);
  }

  +[PREResponseItem responseItemArrayFromResponseKitArray:forLocale:](PREResponseItem, "responseItemArrayFromResponseKitArray:forLocale:", v3, *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PREResponsesExperiment _getFormattedPREResponseItems:inputPreferences:](PREResponsesExperiment, "_getFormattedPREResponseItems:inputPreferences:", v12, WeakRetained[5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = PRERecordMeasurementState((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(WeakRetained, "registerGenerationWithPreResponseItems:language:isCached:responseTimePerf:promptMessage:generationStatus:", v13, *(_QWORD *)(a1 + 40), 0, v14, *(_QWORD *)(a1 + 48), 1);

}

void __220__PREResponsesExperiment__responsesForMessage_maximumResponses_outgoingMessageHistory_forConversationHistory_forContext_time_withLanguage_languageLastChangedDate_recipientHandles_options_preferredLocale_completionBlock___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint8_t v9[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[PREResponsesExperiment _getFormattedPREResponseItems:inputPreferences:](PREResponsesExperiment, "_getFormattedPREResponseItems:inputPreferences:", v3, WeakRetained[5]);
    v5 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    PRERecordMeasurementState((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
    pre_signpost_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 56);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C35DB000, v7, OS_SIGNPOST_INTERVAL_END, v8, "PRE-AsyncTotalResponsesForMessage", "Completed", v9, 2u);
    }

    v3 = (id)v5;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __208__PREResponsesExperiment_nonEditableSuggestionsForMessage_messageDate_senderID_recipientHandles_outgoingMessageHistory_keyboardLanguageID_keyboardLanguageLastChangedDate_includeDynamicSuggestions_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  if (WeakRetained)
  {
    +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:](PREResponsesExperiment, "_suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:", v6, *(_QWORD *)(a1 + 32), WeakRetained[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60]);
  }

}

void __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  pre_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PRE-AsyncFullNonEditableSuggestions", "Completed", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    LOBYTE(v3) = *(_BYTE *)(a1 + 104);
    objc_msgSend(WeakRetained, "nonEditableSuggestionsForMessage:messageDate:senderID:recipients:outgoingMessageHistory:keyboardLanguageID:keyboardLanguageLastChangedDate:includeDynamicSuggestions:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v3, *(_QWORD *)(a1 + 88), WeakRetained);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

}

void __204__PREResponsesExperiment_fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___block_invoke_133()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "PRE-asyncFullNonEditableSuggestionsQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasExprOnceResult;
  fullNonEditableSuggestionsListForMessage_context_additionalSenderMessages_date_keyboardLanguageID_keyboardLanguageLastChangedDate_recipients_includeDynamicSuggestions_completion___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  pre_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C35DB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PRE-AsyncFullNonEditableSuggestions", "Completed", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_2(id *a1)
{
  _QWORD *WeakRetained;
  void (**v3)(id, PREResponsesExperimentSuggestionsResponse *);
  PREResponsesExperimentSuggestionsResponse *v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  PREResponsesExperimentSuggestionsResponse *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void (**v38)(id, PREResponsesExperimentSuggestionsResponse *);
  void (**v39)(id, PREResponsesExperimentSuggestionsResponse *);
  PREResponsesExperimentSuggestionsResponse *v40;
  id v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint8_t buf[8];

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (!WeakRetained)
  {
    v3 = (void (**)(id, PREResponsesExperimentSuggestionsResponse *))a1[6];
    v4 = -[PREResponsesExperimentSuggestionsResponse initWithSuggestions:]([PREResponsesExperimentSuggestionsResponse alloc], "initWithSuggestions:", 0);
    v3[2](v3, v4);

  }
  v5 = objc_msgSend(a1[4], "includesDynamicSuggestions");
  if ((v5 & 1) == 0 && (objc_msgSend(WeakRetained, "includeCannedResponses") & 1) == 0)
  {
    v39 = (void (**)(id, PREResponsesExperimentSuggestionsResponse *))a1[6];
    v40 = -[PREResponsesExperimentSuggestionsResponse initWithSuggestions:]([PREResponsesExperimentSuggestionsResponse alloc], "initWithSuggestions:", 0);
    v39[2](v39, v40);

    goto LABEL_16;
  }
  v44 = v5;
  v6 = (void *)objc_opt_class();
  objc_msgSend(a1[4], "receivedMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rawStringsForMessages:excludingTapBacks:", v7, 1);
  v8 = WeakRetained;
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  objc_msgSend(a1[4], "senderMessages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_rawStringsForMessages:excludingTapBacks:", v11, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "receivedMessages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "senderIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PRELocaleDetection sharedInstance](PRELocaleDetection, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "languageLastChangedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  v46 = (void *)v12;
  v20 = v12;
  v21 = (void *)v9;
  WeakRetained = v8;
  objc_msgSend(v16, "localeForIncomingMessages:outgoingMessages:defaultLocale:defaultLocaleLastChangedDate:sender:", v19, v20, v17, v18, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)v8[9];
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRELocaleDetection languageTagForLocaleIdentifier:](PRELocaleDetection, "languageTagForLocaleIdentifier:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v23, "checkForExemptContentInText:languageCode:", v24, v25);

  if ((_DWORD)v23)
  {
    pre_responses_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C35DB000, v26, OS_LOG_TYPE_DEFAULT, "PREResponsesExperiment received messages contain exempt content", buf, 2u);
    }

  }
  else if ((v44 & 1) != 0)
  {
    v27 = objc_msgSend((id)v8[5], "BOOLForKey:", 9);
    v28 = 384;
    if (v27)
      v28 = 256;
    v45 = v28;
    +[PREResponsesExperiment _getConversationHistoryFromRequest:](PREResponsesExperiment, "_getConversationHistoryFromRequest:", a1[4]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "text");
    v31 = (PREResponsesExperimentSuggestionsResponse *)objc_claimAutoreleasedReturnValue();

    v32 = a1[5];
    objc_msgSend(a1[4], "recipients");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handlesFromRecipients:", v33);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, a1[5]);
    v41 = a1[5];
    objc_msgSend(a1[4], "requestDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "languageCode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "languageLastChangedDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_119;
    v47[3] = &unk_1E7D9E378;
    objc_copyWeak(&v50, (id *)buf);
    v36 = a1[6];
    v48 = (id)MEMORY[0x1E0C9AA60];
    v49 = v36;
    v37 = v46;
    objc_msgSend(v41, "_responsesForMessage:maximumResponses:outgoingMessageHistory:forConversationHistory:forContext:time:withLanguage:languageLastChangedDate:recipientHandles:options:preferredLocale:completionBlock:", v31, 4, v46, v29, 0, v42, v34, v35, v43, v45, v22, v47);

    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)buf);

    goto LABEL_14;
  }
  +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:](PREResponsesExperiment, "_suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:", 0, MEMORY[0x1E0C9AA60], WeakRetained[5]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void (**)(id, PREResponsesExperimentSuggestionsResponse *))a1[6];
  v31 = -[PREResponsesExperimentSuggestionsResponse initWithSuggestions:]([PREResponsesExperimentSuggestionsResponse alloc], "initWithSuggestions:", v29);
  v38[2](v38, v31);
  v37 = v46;
LABEL_14:

LABEL_16:
}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_119(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  PREResponsesExperimentSuggestionsResponse *v4;
  uint64_t v5;
  PREResponsesExperimentSuggestionsResponse *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:](PREResponsesExperiment, "_suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:", v8, *(_QWORD *)(a1 + 32), WeakRetained[5]);
    v4 = (PREResponsesExperimentSuggestionsResponse *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = -[PREResponsesExperimentSuggestionsResponse initWithSuggestions:]([PREResponsesExperimentSuggestionsResponse alloc], "initWithSuggestions:", v4);
    (*(void (**)(uint64_t, PREResponsesExperimentSuggestionsResponse *))(v5 + 16))(v5, v6);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v4 = -[PREResponsesExperimentSuggestionsResponse initWithSuggestions:]([PREResponsesExperimentSuggestionsResponse alloc], "initWithSuggestions:", 0);
    (*(void (**)(uint64_t, PREResponsesExperimentSuggestionsResponse *))(v7 + 16))(v7, v4);
  }

}

void __63__PREResponsesExperiment_suggestionsForRequest_withCompletion___block_invoke_115()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "PRE-asyncFullNonEditableSuggestionsQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)suggestionsForRequest_withCompletion___pasExprOnceResult;
  suggestionsForRequest_withCompletion___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __59__PREResponsesExperiment_setCachedResponsesGeneratedEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEvent:", *(_QWORD *)(a1 + 32));
}

void __55__PREResponsesExperiment_cachedResponsesGeneratedEvent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "event");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)sharedManager
{
  if (sharedManager__pasOnceToken379 != -1)
    dispatch_once(&sharedManager__pasOnceToken379, &__block_literal_global_1818);
  return (id)sharedManager__pasExprOnceResult;
}

+ (id)_rawStringsForMessages:(id)a3 excludingTapBacks:(BOOL)a4
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PREResponsesExperiment__rawStringsForMessages_excludingTapBacks___block_invoke;
  v5[3] = &__block_descriptor_33_e49___NSString_16__0__PREResponsesExperimentMessage_8l;
  v6 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_isPreferredLocaleValid:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "length") > 1;
}

+ (id)_getConversationHistoryFromRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("dateSent"), 1);
  objc_msgSend(v3, "receivedMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)v4;
  v59[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v3;
  objc_msgSend(v3, "senderMessages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isTapBack") & 1) == 0 && (objc_msgSend(v15, "isEmote") & 1) == 0)
        {
          objc_msgSend(v15, "title");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          v18 = &stru_1E7D9F210;
          if (v16)
            v18 = (__CFString *)v16;
          v19 = v18;

          v20 = objc_alloc(MEMORY[0x1E0D197C0]);
          objc_msgSend(v15, "senderIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dateSent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v20, "initWithText:senderID:timestamp:", v19, v21, v22);

          objc_msgSend(v9, "addObject:", v23);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v12);
  }

  v47 = v9;
  objc_msgSend(v9, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v26 = v8;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v49 != v29)
          objc_enumerationMutation(v26);
        if (v25)
        {
          v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v31, "dateSent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "laterDate:", v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33 && (objc_msgSend(v31, "isTapBack") & 1) == 0 && (objc_msgSend(v31, "isEmote") & 1) == 0)
          {
            objc_msgSend(v31, "title");
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = (void *)v34;
            v36 = &stru_1E7D9F210;
            if (v34)
              v36 = (__CFString *)v34;
            v37 = v36;

            v38 = objc_alloc(MEMORY[0x1E0D197C0]);
            objc_msgSend(v31, "senderIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "dateSent");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)objc_msgSend(v38, "initWithText:senderID:timestamp:", v37, v39, v40);

            objc_msgSend(v47, "addObject:", v41);
          }
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v28);
  }

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timestamp"), 1);
  v56 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sortUsingDescriptors:", v43);

  return v47;
}

+ (id)_getFormattedPREResponseItems:(id)a3 inputPreferences:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "BOOLForKey:", 9))
    {
      v8 = v5;
    }
    else
    {
      objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_143);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)stringArrayFromPreResponseItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "addObject:", v10);
          pre_responses_handle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            v12 = v11;
            v13 = "PREResponsesExperiment unexpectedly received NSString when expecting PREResponseItem";
            v14 = 2;
LABEL_17:
            _os_log_fault_impl(&dword_1C35DB000, v12, OS_LOG_TYPE_FAULT, v13, buf, v14);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "replyText");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
              goto LABEL_14;
            objc_msgSend(v10, "replyText");
            v11 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);
          }
          else
          {
            pre_responses_handle();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            {
              v16 = objc_opt_class();
              *(_DWORD *)buf = 138543619;
              v24 = v16;
              v25 = 2117;
              v26 = v10;
              v12 = v11;
              v13 = "PREResponsesExperiment unexpectedly received unknown object %{public}@ (%{sensitive}@) when expectin"
                    "g PREResponseItem";
              v14 = 22;
              goto LABEL_17;
            }
          }
        }

LABEL_14:
        ++v9;
      }
      while (v7 != v9);
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      v7 = v17;
    }
    while (v17);
  }

  return v4;
}

+ (id)_cannedRepliesForLanguage:(id)a3 inputPreferences:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  PREResponseItem *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (_cannedRepliesForLanguage_inputPreferences__onceToken != -1)
    dispatch_once(&_cannedRepliesForLanguage_inputPreferences__onceToken, &__block_literal_global_161);
  objc_msgSend((id)_cannedRepliesForLanguage_inputPreferences__store, "repliesForLanguage:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = -[PREResponseItem initWithCategoryId:modelId:responseClassId:replySubgroupId:replyTextId:replyText:language:isCustomResponse:isRobotResponse:]([PREResponseItem alloc], "initWithCategoryId:modelId:responseClassId:replySubgroupId:replyTextId:replyText:language:isCustomResponse:isRobotResponse:", 0, 0, 0, 0, 0, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), v5, 0, 0);
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (BOOL)_shouldInsertSuggestion:(id)a3 forExistingSuggestions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedLowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "title", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedLowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v7);

        if ((v15 & 1) != 0)
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

+ (id)_suggestionsWithDynamicResponseItems:(id)a3 cannedResponseItems:(id)a4 inputPreferences:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id obj;
  id v46;
  _QWORD v47[5];
  __int128 v48;
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
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v46 = (id)objc_opt_new();
  v10 = (void *)objc_opt_class();
  if (v7)
  {
    objc_msgSend(v10, "stringArrayFromPreResponseItems:", v8);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "indexOfObject:", CFSTR("SMART_REPLIES_MARKER"));
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 0;
    else
      v12 = v11;
    v41 = v12;
    v42 = v8;
    +[PREResponsesExperiment _suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:](PREResponsesExperiment, "_suggestionsWithDynamicResponseItems:cannedResponseItems:inputPreferences:", 0, v8, v9);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v9;
    objc_msgSend((id)objc_opt_class(), "_getFormattedPREResponseItems:inputPreferences:", v7, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "replyText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_opt_new();
          v22 = (void *)objc_msgSend(v20, "copy");
          objc_msgSend(v21, "setTitle:", v22);

          objc_msgSend(v21, "setDynamicReply:", 1);
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v17);
    }

    v23 = v43;
    objc_msgSend(v46, "addObjectsFromArray:", v43);
    if (objc_msgSend(v14, "count"))
    {
      v40 = v7;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v41, objc_msgSend(v14, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "insertObjects:atIndexes:", v14, v24);

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v25 = v43;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v49 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
            if (!+[PREResponsesExperiment _shouldInsertSuggestion:forExistingSuggestions:](PREResponsesExperiment, "_shouldInsertSuggestion:forExistingSuggestions:", v30, v14))
            {
              v47[0] = MEMORY[0x1E0C809B0];
              v47[1] = 3221225472;
              v47[2] = __100__PREResponsesExperiment__suggestionsWithDynamicResponseItems_cannedResponseItems_inputPreferences___block_invoke;
              v47[3] = &unk_1E7D9E648;
              v47[4] = v30;
              v31 = objc_msgSend(v46, "indexOfObjectWithOptions:passingTest:", 2, v47);
              if (v31 != 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v46, "removeObjectAtIndex:", v31);
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        }
        while (v27);
      }

      v7 = v40;
      v23 = v43;
    }

    v8 = v42;
LABEL_34:
    v9 = v44;
    goto LABEL_35;
  }
  objc_msgSend(v10, "_getFormattedPREResponseItems:inputPreferences:", v8, v9);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v32)
  {
    v33 = v32;
    v44 = v9;
    v34 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v57 != v34)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "replyText");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER")) & 1) == 0)
        {
          v37 = (void *)objc_opt_new();
          v38 = (void *)objc_msgSend(v36, "copy");
          objc_msgSend(v37, "setTitle:", v38);

          objc_msgSend(v46, "addObject:", v37);
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v33);
    goto LABEL_34;
  }
LABEL_35:

  return v46;
}

+ (id)_inputMethodStringFrom:(int)a3
{
  if (a3 > 5)
    return CFSTR("canned");
  else
    return off_1E7D9E6C0[a3];
}

+ (int)_preInputMethodFrom:(id)a3
{
  uint64_t v3;
  int v4;

  v3 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v3 == 1)
    v4 = 2;
  else
    v4 = 1;
  if (v3 == 2)
    return 3;
  else
    return v4;
}

+ (BOOL)_isStringEmpty:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v3, "isEqualToString:", &stru_1E7D9F210);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __100__PREResponsesExperiment__suggestionsWithDynamicResponseItems_cannedResponseItems_inputPreferences___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

void __69__PREResponsesExperiment__cannedRepliesForLanguage_inputPreferences___block_invoke()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getWRCannedRepliesStoreClass_softClass;
  v8 = getWRCannedRepliesStoreClass_softClass;
  if (!getWRCannedRepliesStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getWRCannedRepliesStoreClass_block_invoke;
    v4[3] = &unk_1E7D9E670;
    v4[4] = &v5;
    __getWRCannedRepliesStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_msgSend([v1 alloc], "initWithCategory:", 1);
  v3 = (void *)_cannedRepliesForLanguage_inputPreferences__store;
  _cannedRepliesForLanguage_inputPreferences__store = v2;

}

PREResponseItem *__73__PREResponsesExperiment__getFormattedPREResponseItems_inputPreferences___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  PREResponseItem *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PREResponseItem *v21;

  v2 = a2;
  objc_msgSend(v2, "replyText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_REPLIES_MARKER"));

  if (v4)
    goto LABEL_4;
  objc_msgSend(v2, "isCustomResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6
    || (objc_msgSend(v2, "isRobotResponse"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        v8))
  {
LABEL_4:
    v9 = (PREResponseItem *)v2;
  }
  else
  {
    v21 = [PREResponseItem alloc];
    objc_msgSend(v2, "categoryId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "modelId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "responseClassId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replySubgroupId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replyTextId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replyText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedLowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "language");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "isCustomResponse");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "isRobotResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PREResponseItem initWithCategoryId:modelId:responseClassId:replySubgroupId:replyTextId:replyText:language:isCustomResponse:isRobotResponse:](v21, "initWithCategoryId:modelId:responseClassId:replySubgroupId:replyTextId:replyText:language:isCustomResponse:isRobotResponse:", v19, v11, v12, v13, v14, v15, v16, v17, v18);

  }
  return v9;
}

id __67__PREResponsesExperiment__rawStringsForMessages_excludingTapBacks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32) && (objc_msgSend(v3, "isTapBack") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __39__PREResponsesExperiment_sharedManager__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD39FC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedManager__pasExprOnceResult;
  sharedManager__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
