@implementation _LTOfflineTranslationEngine

- (_LTOfflineTranslationEngine)initWithLocalePair:(id)a3 assetInfo:(id)a4 selfLoggingManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  _LTOfflineTranslationEngine *v12;
  _LTOfflineTranslationEngine *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  _LTOfflineTranslationEngine *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_LTOfflineTranslationEngine;
  v12 = -[_LTOfflineTranslationEngine init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetInfo, a4);
    v14 = dispatch_queue_create("com.apple.siri.translation.offline", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_callbackQueue, MEMORY[0x24BDAC9B8]);
    objc_storeStrong((id *)&v13->_localePair, a3);
    v13->_isSpeechTranslationCancelled = 0;
    v13->_didEndpointSpeech = 0;
    objc_storeStrong((id *)&v13->_selfLoggingManager, a5);
    v16 = v13;
  }

  return v13;
}

- (BOOL)translatesPair:(id)a3
{
  id v4;
  char v5;
  _LTLocalePair *localePair;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if ((-[_LTLocalePair isEqual:](self->_localePair, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    localePair = self->_localePair;
    objc_msgSend(v4, "reversedPair");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[_LTLocalePair isEqual:](localePair, "isEqual:", v7) & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v4, "isPassthrough"))
    {
      -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sourceLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_loadRecognizersWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _LTSpeechTranslationAssetInfo *assetInfo;
  void *v16;
  void *v17;
  _LTSpeechTranslationAssetInfo *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  _LTSpeechTranslationAssetInfo *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _LTSpeechTranslationAssetInfo *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _LTMultilingualSpeechRecognizer *v35;
  _LTMultilingualSpeechRecognizer *recognizer;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t spid;
  unint64_t v40;
  NSObject *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[24];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_earError && !self->_recognizer)
  {
    _LTOSLogTranslationEngine();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);
    v7 = v5;
    v8 = v7;
    spid = v6;
    v40 = v6 - 1;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadOfflineRecognizers", "Loading recognizers", buf, 2u);
    }
    v41 = v8;

    -[_LTOfflineTranslationEngine asrModelURLs](self, "asrModelURLs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
    {
      v11 = (id)_LTOSLogTranslationEngine();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[_LTOfflineTranslationEngine asrModelURLs](self, "asrModelURLs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTOfflineTranslationEngine _loadRecognizersWithContext:].cold.3(v12, (uint64_t)v46);
      }

    }
    -[_LTOfflineTranslationEngine asrModelURLs](self, "asrModelURLs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      -[_LTOfflineTranslationEngine asrModelURLs](self, "asrModelURLs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    }
    else
    {
      assetInfo = self->_assetInfo;
      -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTSpeechTranslationAssetInfo speechModelURLForLocale:](assetInfo, "speechModelURLForLocale:", v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_LTOfflineTranslationEngine asrModelURLs](self, "asrModelURLs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v17, "count") >= 2)
    {
      -[_LTOfflineTranslationEngine asrModelURLs](self, "asrModelURLs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
    }
    else
    {
      v18 = self->_assetInfo;
      -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTSpeechTranslationAssetInfo speechModelURLForLocale:](v18, "speechModelURLForLocale:", v19);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      v43 = v16;
      v44 = 2113;
      v45 = v20;
      _os_log_impl(&dword_2491B9000, v21, OS_LOG_TYPE_INFO, "Creating multi recognizer: %{private}@, %{private}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", MEMORY[0x24BDBD1B8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v16)
    {
      -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, v24);

      v25 = self->_assetInfo;
      -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTSpeechTranslationAssetInfo speechModelVersionForLocale:](v25, "speechModelVersionForLocale:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, v28);

    }
    if (v20 && (-[_LTLocalePair isPassthrough](self->_localePair, "isPassthrough") & 1) == 0)
    {
      objc_msgSend(v4, "autodetectLanguage");
      -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v29);

      v30 = self->_assetInfo;
      -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTSpeechTranslationAssetInfo speechModelVersionForLocale:](v30, "speechModelVersionForLocale:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, v33);

    }
    v34 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[_LTOfflineTranslationEngine _loadRecognizersWithContext:].cold.2();
    v35 = -[_LTMultilingualSpeechRecognizer initWithModelURLs:modelVersions:]([_LTMultilingualSpeechRecognizer alloc], "initWithModelURLs:modelVersions:", v22, v23);
    recognizer = self->_recognizer;
    self->_recognizer = v35;

    v37 = v41;
    v38 = v37;
    if (v40 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v38, OS_SIGNPOST_INTERVAL_END, spid, "LoadOfflineRecognizers", "Finished loading recognizers", buf, 2u);
    }

  }
}

- (void)_loadEtiquetteSanitizers
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v4, (uint64_t)v4, "No etiquette sanitizer available for: %{public}@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)_loadTranslatorForTask:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  EMTTranslator *v13;
  EMTTranslator *translator;
  EMTTranslator *v15;
  void *v16;
  void *v17;
  EMTTranslator *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[_LTLocalePair isPassthrough](self->_localePair, "isPassthrough") & 1) == 0
    && !self->_earError
    && !self->_translator)
  {
    _LTOSLogTranslationEngine();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);
    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadOfflineTranslator", "Loading translator", (uint8_t *)&v23, 2u);
    }

    -[_LTOfflineTranslationEngine mtModelURL](self, "mtModelURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[_LTOfflineTranslationEngine mtModelURL](self, "mtModelURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[_LTSpeechTranslationAssetInfo translationModelURLs](self->_assetInfo, "translationModelURLs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v23 = 138543619;
      v24 = v4;
      v25 = 2113;
      v26 = v11;
      _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "Creating translator with task %{public}@ model URL: %{private}@", (uint8_t *)&v23, 0x16u);
    }
    v13 = (EMTTranslator *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E700]), "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:", v11, v4, 1, _LTPreferencesTranslationEngineCacheSize());
    translator = self->_translator;
    self->_translator = v13;

    v15 = self->_translator;
    -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMTTranslator loadTranslatorFrom:to:](v15, "loadTranslatorFrom:to:", v16, v17);

    v18 = self->_translator;
    -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMTTranslator loadTranslatorFrom:to:](v18, "loadTranslatorFrom:to:", v19, v20);

    v21 = v8;
    v22 = v21;
    if (v6 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v22, OS_SIGNPOST_INTERVAL_END, v6, "LoadOfflineTranslator", "Finished loading translator", (uint8_t *)&v23, 2u);
    }

  }
}

- (void)preheatAsynchronously:(BOOL)a3 withContext:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65___LTOfflineTranslationEngine_preheatAsynchronously_withContext___block_invoke;
  v10[3] = &unk_251A12E20;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v8 = (void *)MEMORY[0x2495AE9CC](v10);
  queue = self->_queue;
  if (v4)
    dispatch_async(queue, v8);
  else
    dispatch_sync(queue, v8);

}

- (id)_handleTranslationResults:(id)a3 withContext:(id)a4 sourceString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v29 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __82___LTOfflineTranslationEngine__handleTranslationResults_withContext_sourceString___block_invoke;
    v30[3] = &unk_251A12E48;
    v28 = &v35;
    objc_copyWeak(&v35, &location);
    v31 = v29;
    v13 = v11;
    v32 = v13;
    v14 = v9;
    v33 = v14;
    v15 = v12;
    v34 = v15;
    objc_msgSend(v8, "_ltCompactMap:", v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF64A8], "resultWithLocale:translations:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRoute:", 1);
    if ((objc_msgSend(MEMORY[0x24BDF63C0], "isGenderDisambiguationEnabled") & 1) != 0)
    {
      v18 = objc_msgSend(v15, "count", &v35);
      if (v18 == objc_msgSend(v16, "count"))
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF63C8]), "initWithSourceText:targetPhrases:selectedPhraseIndex:", v14, v15, 0);
        v20 = objc_alloc(MEMORY[0x24BDF63C0]);
        v41[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithSentences:", v21);

        v23 = _LTOSLogDisambiguation();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v38 = (uint64_t)v22;
          _os_log_impl(&dword_2491B9000, v23, OS_LOG_TYPE_INFO, "Created disambiguableResult from EMT result: %{public}@", buf, 0xCu);
        }
        objc_msgSend(v17, "setDisambiguableResult:", v22);

      }
      else
      {
        v19 = (id)_LTOSLogDisambiguation();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v25 = objc_msgSend(v15, "count");
          v26 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 134218240;
          v38 = v25;
          v39 = 2048;
          v40 = v26;
          _os_log_impl(&dword_2491B9000, v19, OS_LOG_TYPE_INFO, "Not creating combined disambiguation result because only %zu out of %zu candidates could create disambiguation nodes", buf, 0x16u);
        }
      }

    }
    else
    {
      v24 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v24, OS_LOG_TYPE_INFO, "Not creating combined disambiguation result because the feature flag is off", buf, 2u);
      }
    }

    objc_destroyWeak(v28);
    objc_destroyWeak(&location);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_translateString:(id)a3 isFinal:(BOOL)a4 withContext:(id)a5 toLocale:(id)a6 withSpans:(id)a7 completion:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  int v41;
  EMTTranslator *translator;
  void *v43;
  NSObject *v44;
  EMTTranslator *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  _LTOfflineTranslationEngine *val;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void (**v56)(id, void *);
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  NSObject *v61;
  _LTOfflineTranslationEngine *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void (**v67)(id, void *);
  id v68[2];
  id buf[2];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  id v75;
  uint8_t v76[4];
  int v77;
  _BYTE v78[128];
  const __CFString *v79;
  _QWORD v80[4];

  v50 = a4;
  v80[1] = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v13 = a5;
  v58 = a6;
  v55 = a7;
  v56 = (void (**)(id, void *))a8;
  v54 = v13;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v15;
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v13, "taskHint");
    _LTTranslationModelTaskString();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTOfflineTranslationEngine _loadTranslatorForTask:](self, "_loadTranslatorForTask:");
    if (objc_msgSend(v13, "censorSpeech"))
      -[_LTOfflineTranslationEngine _loadEtiquetteSanitizers](self, "_loadEtiquetteSanitizers");
    if (self->_earError)
    {
      objc_msgSend(MEMORY[0x24BDF64A8], "resultWithLocale:translations:", v58, MEMORY[0x24BDBD1A8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRoute:", 1);
      v56[2](v56, v16);

    }
    else
    {
      -[_LTOfflineTranslationEngine localePair](self, "localePair");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oppositeToLocale:", v58);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      +[_LTAnalyticsEvent timedEventWithName:](_LTAnalyticsEvent, "timedEventWithName:", CFSTR("OfflineTextTranslation"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setSourceLocale:", v48);
      objc_msgSend(v49, "setTargetLocale:", v58);
      v79 = CFSTR("sourceSentence");
      v80[0] = v57;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      val = self;
      objc_msgSend(v49, "addFieldsFromDictionary:internalOnly:", v19, 1);

      _LTOSLogTranslationEngine();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_signpost_id_generate(v20);
      v22 = v20;
      v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_2491B9000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "TranslateTokens", "Offline: Translating string", (uint8_t *)buf, 2u);
      }
      v46 = (void *)v21;
      v47 = v23;

      if (v55)
      {
        v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v72 = 0u;
        v73 = 0u;
        v71 = 0u;
        v70 = 0u;
        v24 = v55;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v71;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v71 != v26)
                objc_enumerationMutation(v24);
              v28 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
              v29 = objc_alloc(MEMORY[0x24BE2E6F0]);
              objc_msgSend(v28, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v28, "range");
              v33 = (void *)objc_msgSend(v29, "initWithIdentifier:range:doNotTranslate:", v30, v31, v32, objc_msgSend(v28, "shouldTranslate") ^ 1);
              objc_msgSend(v59, "addObject:", v33);

            }
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
          }
          while (v25);
        }

      }
      else
      {
        v59 = 0;
      }
      objc_initWeak(buf, val);
      -[EMTTranslator prepareFor:to:](val->_translator, "prepareFor:to:", v48, v58);
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke;
      v60[3] = &unk_251A12E98;
      objc_copyWeak(v68, buf);
      v34 = v47;
      v68[1] = v46;
      v61 = v34;
      v62 = val;
      v35 = v54;
      v63 = v35;
      v36 = v57;
      v64 = v36;
      v65 = v58;
      v37 = v49;
      v66 = v37;
      v67 = v56;
      v38 = (void *)MEMORY[0x2495AE9CC](v60);
      if ((objc_opt_respondsToSelector() & 1) != 0 && NSClassFromString(CFSTR("EMTTranslationOptions")))
      {
        v39 = objc_alloc_init(MEMORY[0x24BE2E6F8]);
        objc_msgSend(v39, "setEnableDisambiguationAlternatives:", objc_msgSend(v35, "supportsGenderDisambiguation"));
        v40 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = objc_msgSend(v35, "supportsGenderDisambiguation");
          *(_DWORD *)v76 = 67109120;
          v77 = v41;
          _os_log_impl(&dword_2491B9000, v40, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine is translating with enableDisambiguationAlternatives: %{BOOL}i", v76, 8u);
        }

        translator = val->_translator;
        v75 = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMTTranslator translateTokens:isFinal:spans:options:completion:](translator, "translateTokens:isFinal:spans:options:completion:", v43, v50, v59, v39, v38);

      }
      else
      {
        v44 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v76 = 0;
          _os_log_impl(&dword_2491B9000, v44, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine doesn't have EMTTranslationOptions on current device, translating with legacy method, and not setting enableDisambiguationAlternatives", v76, 2u);
        }
        v45 = val->_translator;
        v74 = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v74, 1);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        -[EMTTranslator translateTokens:isFinal:spans:completion:](v45, "translateTokens:isFinal:spans:completion:", v39, v50, v59, v38);
      }

      objc_destroyWeak(v68);
      objc_destroyWeak(buf);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF64A8], "resultWithLocale:translations:", v58, MEMORY[0x24BDBD1A8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRoute:", 1);
    v56[2](v56, v17);

  }
}

- (id)_paragraphResultFromSentences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_ltCompactMap:", &__block_literal_global_19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_ltCompactMap:", &__block_literal_global_39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke_3;
  v18[3] = &unk_251A12F20;
  v18[4] = &v19;
  objc_msgSend(v3, "_ltCompactMap:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {

    v7 = 0;
  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v20 + 24))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6488]), "initWithFormattedString:sanitizedFormattedString:confidence:lowConfidence:romanization:tokens:preToPostITN:", v8, v9, 0, v10, 0, 0, 1.0);
  v12 = (void *)MEMORY[0x24BDF64A8];
  v23[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resultWithLocale:translations:", v17, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF63C0], "combinedDisambiguableResultFromTranslationResults:joinedWithString:", v3, CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisambiguableResult:", v15);

  objc_msgSend(v14, "setRoute:", 1);
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)_translateParagraph:(id)a3 withContext:(id)a4 toLocale:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v11, "taskHint");
  _LTTranslationModelTaskString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTOfflineTranslationEngine _loadTranslatorForTask:](self, "_loadTranslatorForTask:", v21);
  if (objc_msgSend(v11, "censorSpeech"))
    -[_LTOfflineTranslationEngine _loadEtiquetteSanitizers](self, "_loadEtiquetteSanitizers");
  objc_msgSend(v10, "splitIntoSentences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v14 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke;
  v28[3] = &unk_251A12F70;
  objc_copyWeak(&v32, location);
  v15 = v10;
  v29 = v15;
  v16 = v11;
  v30 = v16;
  v17 = v12;
  v31 = v17;
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_2;
  v23[3] = &unk_251A12F98;
  objc_copyWeak(&v27, location);
  v18 = v15;
  v24 = v18;
  v19 = v16;
  v25 = v19;
  v20 = v22;
  v26 = v20;
  objc_msgSend(v13, "_ltSequentialMap:completion:", v28, v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v32);
  objc_destroyWeak(location);

}

- (void)_translate:(id)a3 withContext:(id)a4 toLocale:(id)a5 paragraphResult:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id location[2];

  v25 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[_LTAnalyticsEvent timedEventWithName:](_LTAnalyticsEvent, "timedEventWithName:", CFSTR("OfflineBatchTextTranslation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTOfflineTranslationEngine localePair](self, "localePair");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oppositeToLocale:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSourceLocale:", v17);

  objc_msgSend(v15, "setTargetLocale:", v13);
  objc_initWeak(location, self);
  v18 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke;
  v29[3] = &unk_251A12FE8;
  objc_copyWeak(&v33, location);
  v19 = v12;
  v30 = v19;
  v20 = v13;
  v31 = v20;
  v21 = v14;
  v32 = v21;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_45;
  v26[3] = &unk_251A13010;
  v22 = v15;
  v27 = v22;
  v23 = v24;
  v28 = v23;
  objc_msgSend(v25, "_ltSequentialMap:completion:", v29, v26);

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);

}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _LTOfflineTranslationEngine *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke;
  v15[3] = &unk_251A13038;
  objc_copyWeak(&v20, &location);
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *queue;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _LTOfflineTranslationEngine *v28;
  id v29;
  id v30;
  void (**v31)(id, void *);
  id v32;
  id buf;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_2491B9000, v14, OS_LOG_TYPE_INFO, "Translate text paragraphs (block completion handler) with offline engine", (uint8_t *)&buf, 2u);
  }
  if (!objc_msgSend(v10, "count")
    || (objc_msgSend(v10, "firstObject"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "text"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "length") == 0,
        v16,
        v15,
        v17))
  {
    v19 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_LTOfflineTranslationEngine translate:withContext:paragraphResult:completion:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD1540];
    v34[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("GENERIC_FAILURE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    v34[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("INPUT_EMPTY_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDF6530], 3, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, v25);
  }
  else
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke;
    v26[3] = &unk_251A13088;
    objc_copyWeak(&v32, &buf);
    v27 = v11;
    v28 = self;
    v29 = v10;
    v30 = v12;
    v31 = v13;
    dispatch_async(queue, v26);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&buf);
  }

}

- (void)cancelSpeechTranslation:(BOOL)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id buf[2];

  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Cancel speech translation with offline engine", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55___LTOfflineTranslationEngine_cancelSpeechTranslation___block_invoke;
  v7[3] = &unk_251A130B0;
  objc_copyWeak(&v8, buf);
  v9 = a3;
  dispatch_async(queue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  id v9;
  id buf[2];

  v4 = a3;
  if (!self->_didEndpointSpeech)
  {
    v5 = _LTOSLogSpeech();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Add audio to offline engine", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50___LTOfflineTranslationEngine_addSpeechAudioData___block_invoke;
    v7[3] = &unk_251A130D8;
    objc_copyWeak(&v9, buf);
    v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }

}

- (void)endpoint
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39___LTOfflineTranslationEngine_endpoint__block_invoke;
  v4[3] = &unk_251A13100;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (BOOL)_needToWaitForBothFinalTranslationResultsWithContext:(id)a3 lidResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "autodetectLanguage") & 1) == 0)
    goto LABEL_6;
  if (!v6 || !objc_msgSend(v6, "isConfident"))
  {
    v12 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "forceSourceLocale"))
  {
    objc_msgSend(v6, "dominantLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ltLocaleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localePair");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_ltLocaleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8 != v11;

  }
  else
  {
LABEL_6:
    v12 = 0;
  }
LABEL_8:

  return v12;
}

- (void)setLanguagesRecognized:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dominantLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 1024;
    v22 = objc_msgSend(v6, "isConfident");
    _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Notified of LID result: %{public}@ is confident: %{BOOL}i", buf, 0x12u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62___LTOfflineTranslationEngine_setLanguagesRecognized_context___block_invoke;
  v14[3] = &unk_251A13128;
  objc_copyWeak(&v18, (id *)buf);
  v15 = v8;
  v16 = v7;
  v17 = v6;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  dispatch_async(queue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (id)_getBestRecognitionResult:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _LTLanguageDetectionResult *lidResult;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "localePair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "autodetectLanguage") && !objc_msgSend(v7, "forceSourceLocale"))
  {
    lidResult = self->_lidResult;
    if (lidResult
      && -[_LTLanguageDetectionResult isFinal](lidResult, "isFinal")
      && (objc_msgSend(v6, "objectForKeyedSubscript:", self->_lidBestResult),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", self->_lidBestResult);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v8, "sourceLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)_waitForLIDWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
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
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke;
  v11[3] = &unk_251A13178;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTOfflineSpeechSynthesizer *v11;
  id v12;
  _LTOfflineSpeechSynthesizer *v13;
  _LTOfflineSpeechSynthesizer *synthesizer;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = [_LTOfflineSpeechSynthesizer alloc];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke;
  v15[3] = &unk_251A131C8;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v16 = v12;
  v13 = -[_LTOfflineSpeechSynthesizer initWithCompletion:](v11, "initWithCompletion:", v15);
  synthesizer = self->_synthesizer;
  self->_synthesizer = v13;

  -[_LTOfflineSpeechSynthesizer speak:withContext:](self->_synthesizer, "speak:withContext:", v8, v9);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_translate:(id)a3 withContext:(id)a4 isFinal:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *queue;
  id v21;
  _BOOL4 v22;
  id v23;
  NSObject *v24;
  int v25;
  EMTTranslator *translator;
  void *v27;
  void *v28;
  NSObject *v29;
  EMTTranslator *v30;
  _LTDSELFLoggingManager *selfLoggingManager;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  BOOL v41;
  id buf[2];
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint8_t v50[4];
  int v51;
  uint64_t v52;

  v7 = a5;
  v52 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v35 = a4;
  v34 = a6;
  objc_msgSend(v10, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_LTOfflineTranslationEngine _translate:withContext:isFinal:completion:].cold.3();
    if (objc_msgSend(v35, "autodetectLanguage") && !v7)
    {
      v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_LTOfflineTranslationEngine _translate:withContext:isFinal:completion:].cold.2();
      goto LABEL_27;
    }
    v14 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_LTOfflineTranslationEngine _translate:withContext:isFinal:completion:].cold.1();
    objc_msgSend(v35, "localePair");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sourceLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Starting speech translation with offline engine", (uint8_t *)buf, 2u);
  }
  objc_msgSend(v10, "bestTranscription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTOfflineTranslationEngine localePair](self, "localePair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isPassthrough");

  if (v19)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke;
    block[3] = &unk_251A131F0;
    v44 = v17;
    v45 = v11;
    v46 = v35;
    v47 = v34;
    dispatch_async(queue, block);

  }
  else
  {
    objc_initWeak(buf, self);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_2;
    v36[3] = &unk_251A13240;
    objc_copyWeak(&v40, buf);
    v37 = v10;
    v21 = v35;
    v38 = v21;
    v41 = v7;
    v39 = v34;
    v33 = (void *)MEMORY[0x2495AE9CC](v36);
    v22 = (objc_opt_respondsToSelector() & 1) != 0 && NSClassFromString(CFSTR("EMTTranslationOptions")) != 0;
    -[_LTOfflineTranslationEngine _translatePrepare:](self, "_translatePrepare:", v11);
    if (v22)
    {
      v23 = objc_alloc_init(MEMORY[0x24BE2E6F8]);
      objc_msgSend(v23, "setEnableDisambiguationAlternatives:", objc_msgSend(v21, "supportsGenderDisambiguation"));
      v24 = (id)_LTOSLogTranslationEngine();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = objc_msgSend(v21, "supportsGenderDisambiguation");
        *(_DWORD *)v50 = 67109120;
        v51 = v25;
        _os_log_impl(&dword_2491B9000, v24, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine is translating with speech input and options enableDisambiguationAlternatives: %{BOOL}i", v50, 8u);
      }

      translator = self->_translator;
      objc_msgSend(v17, "formattedString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v27;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMTTranslator translateTokens:isFinal:spans:options:completion:](translator, "translateTokens:isFinal:spans:options:completion:", v28, v7, 0, v23, v33);

    }
    else
    {
      v29 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_2491B9000, v29, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine doesn't have EMTTranslationOptions on current device, translating with legacy method, and not setting enableDisambiguationAlternatives", v50, 2u);
      }
      v30 = self->_translator;
      objc_msgSend(v17, "formattedString");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v48 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMTTranslator translateTokens:isFinal:spans:completion:](v30, "translateTokens:isFinal:spans:completion:", v27, v7, 0, v33);
    }

    selfLoggingManager = self->_selfLoggingManager;
    objc_msgSend(v21, "logIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTDSELFLoggingManager sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:](selfLoggingManager, "sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:", v32, 0, 2, 0);

    objc_destroyWeak(&v40);
    objc_destroyWeak(buf);
  }

LABEL_27:
}

- (void)_translatePrepare:(id)a3
{
  id v4;
  NSObject *v5;
  EMTTranslator *translator;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Initialize translation with offline engine", v8, 2u);
  }
  translator = self->_translator;
  -[_LTLocalePair oppositeToLocale:](self->_localePair, "oppositeToLocale:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMTTranslator prepareFor:to:](translator, "prepareFor:to:", v4, v7);

}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  NSObject *queue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id location;
  _QWORD v38[4];
  id v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[_LTAnalyticsEvent timedEventWithName:](_LTAnalyticsEvent, "timedEventWithName:", CFSTR("OfflineTextToSpeechTranslation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localePair");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceLocale:", v15);

  objc_msgSend(v8, "localePair");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "targetLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTargetLocale:", v17);

  v18 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke;
  v38[3] = &unk_251A13268;
  v19 = v10;
  v39 = v19;
  v20 = v13;
  v40 = v20;
  v21 = (void *)MEMORY[0x2495AE9CC](v38);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2;
  block[3] = &unk_251A132B8;
  objc_copyWeak(&v36, &location);
  v30 = v8;
  v31 = v9;
  v32 = v20;
  v33 = v12;
  v34 = v19;
  v35 = v21;
  v23 = v19;
  v24 = v12;
  v25 = v20;
  v26 = v9;
  v27 = v21;
  v28 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  NSObject *queue;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _LTOfflineTranslationEngine *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t *v58;
  _QWORD *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD *v71;
  _QWORD *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  _LTOfflineTranslationEngine *v76;
  id v77;
  id v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  id v82;
  id location;
  _QWORD v84[3];
  char v85;
  _QWORD v86[3];
  char v87;
  _QWORD v88[5];
  id v89;
  _QWORD v90[5];
  id v91;
  uint8_t buf[8];
  __int128 v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  const __CFString *v97;
  _QWORD v98[3];

  v98[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = objc_msgSend(v5, "autodetectLanguage");
    LOWORD(v93) = 2114;
    *(_QWORD *)((char *)&v93 + 2) = v8;
    _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Starting offline speech translation (auto detect language: %{BOOL}i, id: %{public}@)", buf, 0x12u);
  }

  +[_LTAnalyticsEvent timedEventWithName:](_LTAnalyticsEvent, "timedEventWithName:", CFSTR("OfflineSpeechTranslation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localePair");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourceLocale:", v12);

  objc_msgSend(v5, "localePair");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "targetLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTargetLocale:", v14);

  v97 = CFSTR("autodetect");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "autodetectLanguage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, &v97, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFieldsFromDictionary:", v16);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&v93 = buf;
  *((_QWORD *)&v93 + 1) = 0x3032000000;
  v94 = __Block_byref_object_copy__7;
  v95 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v96 = (id)objc_claimAutoreleasedReturnValue();
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__7;
  v90[4] = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v91 = (id)objc_claimAutoreleasedReturnValue();
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = __Block_byref_object_copy__7;
  v88[4] = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v87 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v85 = 0;
  objc_initWeak(&location, self);
  v17 = MEMORY[0x24BDAC760];
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke;
  v74[3] = &unk_251A132E0;
  objc_copyWeak(&v82, &location);
  v79 = v90;
  v18 = v5;
  v75 = v18;
  v76 = self;
  v80 = v86;
  v81 = v84;
  v19 = v6;
  v77 = v19;
  v20 = v10;
  v78 = v20;
  v21 = (void *)MEMORY[0x2495AE9CC](v74);
  v65[0] = v17;
  v65[1] = 3221225472;
  v65[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2;
  v65[3] = &unk_251A13358;
  objc_copyWeak(&v73, &location);
  v66 = v8;
  v22 = v20;
  v67 = v22;
  v23 = v18;
  v68 = v23;
  v24 = v19;
  v69 = v24;
  v71 = v90;
  v72 = v86;
  v25 = v21;
  v70 = v25;
  v40 = v8;
  v26 = (void *)MEMORY[0x2495AE9CC](v65);
  v61[0] = v17;
  v61[1] = 3221225472;
  v61[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_77;
  v61[3] = &unk_251A133A8;
  objc_copyWeak(&v64, &location);
  v27 = v23;
  v62 = v27;
  v28 = v24;
  v63 = v28;
  v29 = (void *)MEMORY[0x2495AE9CC](v61);
  v50[0] = v17;
  v50[1] = 3221225472;
  v50[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_80;
  v50[3] = &unk_251A133F8;
  objc_copyWeak(&v60, &location);
  v30 = v27;
  v51 = v30;
  v31 = v28;
  v55 = v29;
  v58 = buf;
  v52 = v31;
  v53 = self;
  v32 = v22;
  v54 = v32;
  v56 = v26;
  v57 = v25;
  v59 = v88;
  v41 = v25;
  v42 = v26;
  v33 = v29;
  v34 = (void *)MEMORY[0x2495AE9CC](v50);
  queue = self->_queue;
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_92;
  block[3] = &unk_251A13038;
  objc_copyWeak(&v49, &location);
  v45 = v30;
  v46 = v31;
  v47 = v32;
  v48 = v34;
  v36 = v34;
  v37 = v32;
  v38 = v31;
  v39 = v30;
  dispatch_async(queue, block);

  objc_destroyWeak(&v49);
  objc_destroyWeak(&v60);

  objc_destroyWeak(&v64);
  objc_destroyWeak(&v73);

  objc_destroyWeak(&v82);
  objc_destroyWeak(&location);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v88, 8);

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(buf, 8);

}

- (void)endAudio
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39___LTOfflineTranslationEngine_endAudio__block_invoke;
  v4[3] = &unk_251A13100;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelRecognition:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___LTOfflineTranslationEngine_cancelRecognition___block_invoke;
  block[3] = &unk_251A130B0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (NSArray)asrModelURLs
{
  return self->_asrModelURLs;
}

- (void)setAsrModelURLs:(id)a3
{
  objc_storeStrong((id *)&self->_asrModelURLs, a3);
}

- (NSURL)mtModelURL
{
  return self->_mtModelURL;
}

- (void)setMtModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_mtModelURL, a3);
}

- (_LTTextToSpeechCache)ttsCache
{
  return self->_ttsCache;
}

- (void)setTtsCache:(id)a3
{
  objc_storeStrong((id *)&self->_ttsCache, a3);
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
  objc_storeStrong((id *)&self->_localePair, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_mtModelURL, 0);
  objc_storeStrong((id *)&self->_asrModelURLs, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_earError, 0);
  objc_storeStrong((id *)&self->_lidResult, 0);
  objc_storeStrong((id *)&self->_lidBestResult, 0);
  objc_storeStrong((id *)&self->_lidWaitGroup, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_etiquetteSanitizers, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
}

- (void)_loadRecognizersWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Failed to create recognizer: %{public}@", v2);
  OUTLINED_FUNCTION_1_2();
}

- (void)_loadRecognizersWithContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v0, v1, "Offline modelVersions %{public}@", v2);
  OUTLINED_FUNCTION_1_2();
}

- (void)_loadRecognizersWithContext:(void *)a1 .cold.3(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9_1((uint64_t)a1, a2, 5.808e-34);
  OUTLINED_FUNCTION_5(&dword_2491B9000, v3, (uint64_t)v3, "Using model overrides as specified: %{private}@", v4);

  OUTLINED_FUNCTION_16();
}

- (void)_loadTranslatorForTask:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_2491B9000, v1, OS_LOG_TYPE_ERROR, "Failed to create translator for task %{public}@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

- (void)translate:withContext:paragraphResult:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Can't translate paragraphs because there's nothing to translate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_translate:withContext:isFinal:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Using context.localePair.source instead", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_translate:withContext:isFinal:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Skipping Speech result: autodetect is on for only a partial result.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_translate:withContext:isFinal:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Request to translate speech with no language identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
