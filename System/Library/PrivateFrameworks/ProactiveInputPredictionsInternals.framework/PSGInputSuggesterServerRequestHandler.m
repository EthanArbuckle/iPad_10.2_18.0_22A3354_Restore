@implementation PSGInputSuggesterServerRequestHandler

- (void)warmUpWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  if (warmUpWithCompletion___pasOnceToken25 != -1)
    dispatch_once(&warmUpWithCompletion___pasOnceToken25, &__block_literal_global_92);
  v4 = (void *)warmUpWithCompletion___pasExprOnceResult;
  v5 = (void *)MEMORY[0x24BE7A5D8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__PSGInputSuggesterServerRequestHandler_warmUpWithCompletion___block_invoke_2;
  v8[3] = &unk_24FCB4760;
  v9 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "runAsyncOnQueue:afterDelaySeconds:block:", v7, v8, 0.1);

}

void __62__PSGInputSuggesterServerRequestHandler_warmUpWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[PSGExperimentResolver sharedInstance](PSGExperimentResolver, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warmupForLocale:", v3);

  }
  if (v5 && (objc_msgSend(v3, "isEqualToString:", v5) & 1) == 0)
  {
    +[PSGExperimentResolver sharedInstance](PSGExperimentResolver, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "warmupForLocale:", v5);

  }
  psg_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22F6A5000, v8, OS_LOG_TYPE_INFO, "PSGInputSuggesterServerRequestHandler: warmUp", v10, 2u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (PSGInputSuggesterServerRequestHandler)init
{
  void *v3;
  void *v4;
  PSGInputSuggesterServerRequestHandler *v5;

  +[PSGExperimentResolver sharedInstance](PSGExperimentResolver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = -[PSGInputSuggesterServerRequestHandler initWithExperimentResolver:metricsLogger:](self, "initWithExperimentResolver:metricsLogger:", v3, v4);

  return v5;
}

- (PSGInputSuggesterServerRequestHandler)initWithExperimentResolver:(id)a3 metricsLogger:(id)a4
{
  id v7;
  id v8;
  PSGInputSuggesterServerRequestHandler *v9;
  PSGInputSuggesterServerRequestHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGInputSuggesterServerRequestHandler;
  v9 = -[PSGInputSuggesterServerRequestHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_experimentResolver, a3);
    objc_storeStrong((id *)&v10->_metricsLogger, a4);
  }

  return v10;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (id)_quickResponsesForResponseContext:(id)a3 conversationTurns:(id)a4 localeIdentifier:(id)a5 maxResponses:(unint64_t)a6 recipients:(id)a7 chunkPath:(id)a8 plistPath:(id)a9 espressoBinFilePath:(id)a10 vocabFilePath:(id)a11
{
  uint64_t v12;

  BYTE2(v12) = 1;
  LOWORD(v12) = 257;
  return (id)objc_msgSend(MEMORY[0x24BE28680], "quickResponsesForMessage:conversationTurns:maxResponses:localeIdentifier:recipientHandles:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:useContactNames:includeCustomResponses:includeResponsesToRobots:", a3, a4, a6, a5, a7, a8, a9, a10, a11, v12);
}

- (id)_quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6
{
  return (id)objc_msgSend(MEMORY[0x24BE28648], "quickTypeTriggerForContext:localeIdentifier:modelConfigPath:espressoBinFilePath:", a3, a4, a5, a6);
}

- (id)_wordBoundaryResponseForRequest:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contextBeforeInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v6, "localeIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v9, "length"))
    {
      if ((objc_msgSend(v7, "isMLModelEnabled") & 1) != 0)
      {
        objc_msgSend(v7, "inferenceModelConfigPath");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "espressoBinFilePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject length](v10, "length") && objc_msgSend(v11, "length"))
        {
          -[PSGInputSuggesterServerRequestHandler _quickTypeTriggerForContext:localeIdentifier:modelConfigPath:espressoBinFilePath:](self, "_quickTypeTriggerForContext:localeIdentifier:modelConfigPath:espressoBinFilePath:", v8, v9, v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          psg_default_log_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v33 = (uint64_t)v12;
            _os_log_debug_impl(&dword_22F6A5000, v13, OS_LOG_TYPE_DEBUG, "ML model - word-boundary triggers %@", buf, 0xCu);
          }

          v30 = v12;
          if (objc_msgSend(v12, "count"))
          {
            v14 = objc_opt_new();
            v15 = objc_alloc(MEMORY[0x24BE79A58]);
            v16 = (void *)objc_msgSend(v15, "initWithSourceType:category:attributes:", 3, *MEMORY[0x24BE79A98], v12);
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79A60]), "initWithProactiveTrigger:portraitItem:operationalItem:", v16, 0, 0);
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79A50]), "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v17);
            -[NSObject addObject:](v14, "addObject:", v18);

          }
          else
          {
            v14 = 0;
          }
          psg_default_log_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = -[NSObject count](v14, "count");
            *(_DWORD *)buf = 134217984;
            v33 = v21;
            _os_log_impl(&dword_22F6A5000, v20, OS_LOG_TYPE_DEFAULT, "Server generated word boundary %tu results", buf, 0xCu);
          }

          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79A48]), "initWithResponseItems:explanationSet:", v14, 0);
        }
        else
        {
          psg_default_log_handle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v7, "experimentIdentifiers");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "experimentId");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "experimentIdentifiers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "treatmentId");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v33 = (uint64_t)v27;
            v34 = 2112;
            v35 = v29;
            _os_log_fault_impl(&dword_22F6A5000, v14, OS_LOG_TYPE_FAULT, "Some required file is missing for word boundary experiment: %@, treatment: %@", buf, 0x16u);

          }
          v19 = 0;
        }

        goto LABEL_26;
      }
      psg_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "experimentIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "experimentId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "experimentIdentifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "treatmentId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = (uint64_t)v24;
        v34 = 2112;
        v35 = v26;
        _os_log_debug_impl(&dword_22F6A5000, v10, OS_LOG_TYPE_DEBUG, "ML not enabled for word boundary experiment: %@, treatment: %@", buf, 0x16u);

      }
    }
    else
    {
      psg_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_22F6A5000, v10, OS_LOG_TYPE_ERROR, "[WordBoundary-ML] Locale not specified. Bail out", buf, 2u);
      }
    }
    v19 = 0;
LABEL_26:

    goto LABEL_27;
  }
  psg_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_22F6A5000, v9, OS_LOG_TYPE_ERROR, "[WordBoundary-ML] Context not specified. Bail out", buf, 2u);
  }
  v19 = 0;
LABEL_27:

  return v19;
}

- (id)_zkwResponseForRequest:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  char v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "responseContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v6, "localeIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v9, "length"))
    {
      v10 = (void *)MEMORY[0x24BE799F8];
      objc_msgSend(v7, "language");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isLanguageMismatchedForIdentifier:withIdentifier:", v9, v11);

      psg_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "treatmentName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "isMLModelEnabled"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = (uint64_t)v14;
        v50 = 2112;
        v51 = v15;
        _os_log_impl(&dword_22F6A5000, v13, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] ML config treatment name %@ enabled %@", buf, 0x16u);

      }
      if ((objc_msgSend(v7, "isMLModelEnabled") & 1) != 0)
      {
        objc_msgSend(v7, "inferenceModelFilePath");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "inferenceModelConfigPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "espressoBinFilePath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "vocabFilePath");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject length](v16, "length"))
          v19 = 0;
        else
          v19 = objc_msgSend(v18, "length") == 0;
        if (!objc_msgSend(v17, "length") || v19)
        {
          psg_default_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v7, "experimentIdentifiers");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "experimentId");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "experimentIdentifiers");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "treatmentId");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v49 = (uint64_t)v37;
            v50 = 2112;
            v51 = v38;
            _os_log_fault_impl(&dword_22F6A5000, v22, OS_LOG_TYPE_FAULT, "[ZKW-ML] Some required file is missing for zkw experiment: %@, treatment: %@", buf, 0x16u);

          }
          v20 = 0;
        }
        else if (objc_msgSend(v6, "isResponseContextBlacklisted"))
        {
          psg_default_log_handle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22F6A5000, v21, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] suppressing suggestions since response context is blacklisted", buf, 2u);
          }

          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79A48]), "initWithResponseItems:explanationSet:", 0, 0);
        }
        else
        {
          v39 = v12;
          objc_msgSend(v6, "conversationTurns");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v6, "textualResponseLimit");
          v24 = objc_msgSend(v6, "structuredInfoLimit") + v23;
          objc_msgSend(v6, "recipients");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v17;
          -[PSGInputSuggesterServerRequestHandler _quickResponsesForResponseContext:conversationTurns:localeIdentifier:maxResponses:recipients:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:](self, "_quickResponsesForResponseContext:conversationTurns:localeIdentifier:maxResponses:recipients:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:", v8, v42, v9, v24, v25, v16, v17, v18, v44);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v26;
          if (objc_msgSend(v26, "count"))
          {
            v45[0] = MEMORY[0x24BDAC760];
            v45[1] = 3221225472;
            v45[2] = __71__PSGInputSuggesterServerRequestHandler__zkwResponseForRequest_config___block_invoke;
            v45[3] = &unk_24FCB46B8;
            v47 = v39;
            v46 = v6;
            objc_msgSend(v26, "_pas_mappedArrayWithTransform:", v45);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            psg_default_log_handle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_msgSend(v28, "count");
              *(_DWORD *)buf = 134217984;
              v49 = v30;
              _os_log_impl(&dword_22F6A5000, v29, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] Server generated zkw %tu result(s)", buf, 0xCu);
            }

            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79A48]), "initWithResponseItems:explanationSet:", v28, 0);
          }
          else
          {
            psg_default_log_handle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22F6A5000, v31, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] no suggestions returned from model", buf, 2u);
            }

            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79A48]), "initWithResponseItems:explanationSet:", 0, 0);
          }
          v17 = v40;

        }
        goto LABEL_35;
      }
      psg_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "experimentIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "experimentId");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "experimentIdentifiers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "treatmentId");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = (uint64_t)v34;
        v50 = 2112;
        v51 = v36;
        _os_log_debug_impl(&dword_22F6A5000, v16, OS_LOG_TYPE_DEBUG, "[ZKW-ML] ML disabled for zkw experiment: %@, treatment: %@", buf, 0x16u);

      }
    }
    else
    {
      psg_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_22F6A5000, v16, OS_LOG_TYPE_ERROR, "[ZKW-ML] Locale not specified. Bail out.", buf, 2u);
      }
    }
    v20 = 0;
LABEL_35:

    goto LABEL_36;
  }
  psg_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_22F6A5000, v9, OS_LOG_TYPE_ERROR, "[ZKW-ML] Context not specified. Bail out.", buf, 2u);
  }
  v20 = 0;
LABEL_36:

  return v20;
}

- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PSGExperimentResolver *experimentResolver;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t buf[16];
  uint8_t v26[16];

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  psg_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v26 = 0;
    _os_log_debug_impl(&dword_22F6A5000, v8, OS_LOG_TYPE_DEBUG, "Server inputSuggestionsWithRequest called", v26, 2u);
  }

  psg_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  psg_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22F6A5000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PSGInputSuggesterServerRequestHandler_inputSuggestionsWithRequest", ", buf, 2u);
  }

  if (objc_msgSend(v6, "isDocumentEmpty"))
  {
    objc_msgSend(MEMORY[0x24BE799F8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adaptationContextID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localeForMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:", v14, 0, v15, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSGExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self->_experimentResolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGInputSuggesterServerRequestHandler _logRequest:config:](self, "_logRequest:config:", v6, v18);
    -[PSGInputSuggesterServerRequestHandler _zkwResponseForRequest:config:](self, "_zkwResponseForRequest:config:", v6, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    experimentResolver = self->_experimentResolver;
    objc_msgSend(v6, "localeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGExperimentResolver getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:](experimentResolver, "getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSGInputSuggesterServerRequestHandler _logRequest:config:](self, "_logRequest:config:", v6, v17);
    -[PSGInputSuggesterServerRequestHandler _wordBoundaryResponseForRequest:config:](self, "_wordBoundaryResponseForRequest:config:", v6, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  psg_default_log_handle();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)v24 = 0;
    _os_signpost_emit_with_name_impl(&dword_22F6A5000, v23, OS_SIGNPOST_INTERVAL_END, v10, "PSGInputSuggesterServerRequestHandler_inputSuggestionsWithRequest", ", v24, 2u);
  }

  v7[2](v7, v19, 0);
}

- (id)_getExperimentConfigForLogging:(id)a3
{
  id v4;
  int v5;
  PSGExperimentResolver *experimentResolver;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "isDocumentEmpty");
  experimentResolver = self->_experimentResolver;
  objc_msgSend(v4, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PSGExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](experimentResolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v7, 0);
  else
    -[PSGExperimentResolver getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:](experimentResolver, "getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_logRequest:(id)a3 config:(id)a4
{
  -[PSGInputSuggesterMetricsLogger logQuery:config:](self->_metricsLogger, "logQuery:config:", a3, a4);
}

- (void)_forwardFeedbackToPortraitWithResponseItems:(id)a3 feedbackType:(unsigned int)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    switch(a4)
    {
      case 0u:
      case 2u:
      case 3u:
      case 4u:
        psg_default_log_handle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          v11[0] = 67109120;
          v11[1] = a4;
          _os_log_fault_impl(&dword_22F6A5000, v6, OS_LOG_TYPE_FAULT, "Unhandled feedback type in forwardFeedbackToPortraitWithResponseItems: %d", (uint8_t *)v11, 8u);
        }
        goto LABEL_10;
      case 1u:
        v7 = objc_alloc(MEMORY[0x24BE71AF0]);
        v8 = v5;
        v9 = 0;
        goto LABEL_8;
      case 5u:
        v7 = objc_alloc(MEMORY[0x24BE71AF0]);
        v8 = 0;
        v9 = v5;
LABEL_8:
        v6 = objc_msgSend(v7, "initWithExplicitlyEngagedStrings:implicitlyEngagedStrings:offeredStrings:", v8, 0, v9);
        goto LABEL_9;
      default:
        v6 = 0;
LABEL_9:
        -[NSObject setClientIdentifier:](v6, "setClientIdentifier:", CFSTR("PSGPred"));
        objc_msgSend(MEMORY[0x24BE71B80], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "registerFeedback:completion:", v6, 0);

LABEL_10:
        break;
    }
  }

}

- (void)logTrigger:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PSGInputSuggesterServerRequestHandler _getExperimentConfigForLogging:](self, "_getExperimentConfigForLogging:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGInputSuggesterMetricsLogger logTrigger:request:config:](self->_metricsLogger, "logTrigger:request:config:", v7, v6, v8);

}

- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[PSGInputSuggesterServerRequestHandler _getExperimentConfigForLogging:](self, "_getExperimentConfigForLogging:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGInputSuggesterMetricsLogger logPrediction:request:latencyMillis:config:](self->_metricsLogger, "logPrediction:request:latencyMillis:config:", v9, v8, v10, a5);

}

- (void)logImpression:(id)a3 request:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PSGInputSuggesterServerRequestHandler _getExperimentConfigForLogging:](self, "_getExperimentConfigForLogging:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGInputSuggesterMetricsLogger logImpression:request:config:](self->_metricsLogger, "logImpression:request:config:", v8, v6, v7);
  -[PSGInputSuggesterServerRequestHandler _forwardFeedbackToPortraitWithResponseItems:feedbackType:](self, "_forwardFeedbackToPortraitWithResponseItems:feedbackType:", v8, 5);
  if (objc_msgSend(v6, "isDocumentEmpty"))
    -[PSGInputSuggesterServerRequestHandler _forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:request:isSelected:](self, "_forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:request:isSelected:", v8, v6, 0);

}

- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[PSGInputSuggesterServerRequestHandler _getExperimentConfigForLogging:](self, "_getExperimentConfigForLogging:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGInputSuggesterMetricsLogger logEngagement:request:position:config:](self->_metricsLogger, "logEngagement:request:position:config:", v8, v9, a5, v10);
  -[PSGInputSuggesterServerRequestHandler _forwardFeedbackToPortraitWithResponseItems:feedbackType:](self, "_forwardFeedbackToPortraitWithResponseItems:feedbackType:", v8, 1);
  if (a5 && objc_msgSend(v8, "count") >= a5)
  {
    if (!objc_msgSend(v9, "isDocumentEmpty"))
      goto LABEL_6;
    objc_msgSend(v8, "objectAtIndexedSubscript:", a5 - 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGInputSuggesterServerRequestHandler _forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:request:isSelected:](self, "_forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:request:isSelected:", v12, v9, 1);

  }
  else
  {
    psg_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v15 = objc_msgSend(v8, "count");
      v16 = 2048;
      v17 = a5;
      _os_log_error_impl(&dword_22F6A5000, v11, OS_LOG_TYPE_ERROR, "[ZKW-ML] Position argument expected to be between 1 and response count %lu. Position %lu is out of bounds.", buf, 0x16u);
    }
  }

LABEL_6:
}

- (void)logErrorForRequest:(id)a3 trigger:(id)a4 errorType:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[PSGInputSuggesterServerRequestHandler _getExperimentConfigForLogging:](self, "_getExperimentConfigForLogging:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGInputSuggesterMetricsLogger logError:request:trigger:config:](self->_metricsLogger, "logError:request:trigger:config:", v5, v9, v8, v10);

}

- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  psg_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138413058;
    v15 = v10;
    v16 = 1024;
    v17 = v8;
    v18 = 1024;
    v19 = v7;
    v20 = 1024;
    v21 = v6;
    _os_log_debug_impl(&dword_22F6A5000, v11, OS_LOG_TYPE_DEBUG, "[SpeedMetric] %@, %d, %d, %d", (uint8_t *)&v14, 0x1Eu);
  }

  -[PSGExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self->_experimentResolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGExperimentResolver getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:](self->_experimentResolver, "getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:", v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGInputSuggesterMetricsLogger logSpeedMetricForLocaleIdentifier:messageDurationMilliseconds:messageLength:messageWords:zkwConfig:wordBoundaryConfig:](self->_metricsLogger, "logSpeedMetricForLocaleIdentifier:messageDurationMilliseconds:messageLength:messageWords:zkwConfig:wordBoundaryConfig:", v10, v8, v7, v6, v12, v13);

}

- (id)_mlStringsFromResponseItems:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_87);
}

- (id)_quickResponsesConfigFromPSGInputSuggestionsRequest:(id)a3
{
  PSGExperimentResolver *experimentResolver;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  experimentResolver = self->_experimentResolver;
  v4 = a3;
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](experimentResolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE28658];
  objc_msgSend(v4, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "languageForLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE28670];
  objc_msgSend(v6, "inferenceModelConfigPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vocabFilePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configWithLanguage:mode:plistPath:vocabPath:", v9, 1, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:(id)a3 request:(id)a4 isSelected:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v5 = a5;
  v8 = a4;
  -[PSGInputSuggesterServerRequestHandler _mlStringsFromResponseItems:](self, "_mlStringsFromResponseItems:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[PSGInputSuggesterServerRequestHandler _quickResponsesConfigFromPSGInputSuggestionsRequest:](self, "_quickResponsesConfigFromPSGInputSuggestionsRequest:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_opt_new();
      v12 = v11;
      if (v5)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "registerSelectedResponse:config:", v13, v10);

      }
      else
      {
        objc_msgSend(v11, "registerDisplayedResponses:config:", v9, v10);
      }

    }
    else
    {
      psg_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_22F6A5000, v14, OS_LOG_TYPE_ERROR, "PSGInputSuggesterServerHandler: Could not initialize QuickResponses config for personalization feedback.", v15, 2u);
      }

    }
  }

}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setBundleIdResolver:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_metricsLogger, 0);
  objc_storeStrong((id *)&self->_experimentResolver, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

void __62__PSGInputSuggesterServerRequestHandler_warmUpWithCompletion___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2348A15A8]();
  objc_msgSend(MEMORY[0x24BE7A5D8], "autoreleasingSerialQueueWithLabel:qosClass:", "PSGInputSuggesterServerRequestHandler.warmUp", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)warmUpWithCompletion___pasExprOnceResult;
  warmUpWithCompletion___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __69__PSGInputSuggesterServerRequestHandler__mlStringsFromResponseItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  objc_msgSend(v2, "structuredInfoSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "textualResponseSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  objc_msgSend(v2, "textualResponseSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE79A90]) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v2, "textualResponseSuggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "responseCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE79A80]) ^ 1;

  }
  if (((v4 | v8) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v2, "textualResponseSuggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "responseText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

id __98__PSGInputSuggesterServerRequestHandler__forwardFeedbackToPortraitWithResponseItems_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "structuredInfoSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "portraitItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __71__PSGInputSuggesterServerRequestHandler__zkwResponseForRequest_config___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id *v16;
  objc_class *v17;
  id v18;
  void *v19;

  v3 = a2;
  objc_msgSend(v3, "proactiveTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v3, "isConfident") && !*(_BYTE *)(a1 + 40))
      v5 = (uint64_t *)MEMORY[0x24BE79AA0];
    else
      v5 = (uint64_t *)MEMORY[0x24BE79A88];
    v6 = *v5;
    v7 = objc_alloc(MEMORY[0x24BE79A58]);
    objc_msgSend(v3, "proactiveTrigger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSourceType:category:attributes:", 4, v6, v8);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79A60]), "initWithProactiveTrigger:portraitItem:operationalItem:", v9, 0, 0);
    v11 = objc_alloc(MEMORY[0x24BE79A50]);
    v12 = 0;
    v13 = v10;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldDisableAutoCaps")
      && !objc_msgSend(v3, "isCustomResponse"))
    {
      objc_msgSend(v3, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedLowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v3, "isConfident");
    v16 = (id *)MEMORY[0x24BE79A90];
    if (!v15)
      v16 = (id *)MEMORY[0x24BE79A80];
    v17 = (objc_class *)MEMORY[0x24BE79A68];
    v18 = *v16;
    v10 = (void *)objc_msgSend([v17 alloc], "initWithText:category:", v9, v18);

    v11 = objc_alloc(MEMORY[0x24BE79A50]);
    v12 = v10;
    v13 = 0;
  }
  v19 = (void *)objc_msgSend(v11, "initWithTextualResponseSuggestion:structuredInfoSuggestion:", v12, v13);

  return v19;
}

@end
