@implementation _LTMultilingualSpeechRecognizer

- (_LTMultilingualSpeechRecognizer)initWithModelURLs:(id)a3 modelVersions:(id)a4
{
  id v6;
  id v7;
  _LTMultilingualSpeechRecognizer *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *recognizers;
  NSDictionary *v12;
  _LTMultilingualSpeechRecognizer *v13;
  _QWORD v15[4];
  id v16;
  NSDictionary *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_LTMultilingualSpeechRecognizer;
  v8 = -[_LTMultilingualSpeechRecognizer init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67___LTMultilingualSpeechRecognizer_initWithModelURLs_modelVersions___block_invoke;
    v15[3] = &unk_251A129A8;
    v16 = v7;
    v10 = v9;
    v17 = v10;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);
    recognizers = v8->_recognizers;
    v8->_recognizers = v10;
    v12 = v10;

    v13 = v8;
  }

  return v8;
}

- (void)startRecognitionForLocale:(id)a3 autoEndpoint:(BOOL)a4 resultHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSDictionary *recognizers;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  NSObject *queue;
  _QWORD block[4];
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  _QWORD *v45;
  _QWORD *v46;
  os_signpost_id_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  _QWORD v53[5];
  id v54;
  uint8_t buf[4];
  void *v56;
  uint8_t v57[128];
  uint8_t v58[16];
  _QWORD v59[4];

  v6 = a4;
  v59[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v31 = a5;
  recognizers = self->_recognizers;
  v30 = v8;
  if (v8)
  {
    -[NSDictionary objectForKeyedSubscript:](recognizers, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSDictionary allValues](recognizers, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  queue = dispatch_queue_create("com.apple.multilingualrecognition.results", 0);
  v12 = dispatch_group_create();
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__5;
  v53[4] = __Block_byref_object_dispose__5;
  v54 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v52[3] = 0;
  v13 = (id)_LTOSLogSpeech();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_LTMultilingualSpeechRecognizer startRecognitionForLocale:autoEndpoint:resultHandler:].cold.1(v58, objc_msgSend(v11, "count"), v13);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        dispatch_group_enter(v12);
        objc_msgSend(v18, "language");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = _LTOSLogSpeech();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v56 = v20;
          _os_log_debug_impl(&dword_2491B9000, v21, OS_LOG_TYPE_DEBUG, "Starting recognizer: %{public}@", buf, 0xCu);
        }
        _LTOSLogSpeech();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_signpost_id_generate(v22);
        v24 = v22;
        v25 = v24;
        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_DWORD *)buf = 138543362;
          v56 = v20;
          _os_signpost_emit_with_name_impl(&dword_2491B9000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ASR", "Starting ASR for %{public}@", buf, 0xCu);
        }

        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke;
        v37[3] = &unk_251A129F8;
        v45 = v53;
        v26 = v25;
        v38 = v26;
        v47 = v23;
        v27 = v20;
        v39 = v27;
        v40 = queue;
        v44 = v31;
        v41 = v12;
        v28 = v14;
        v42 = v28;
        v43 = v18;
        v46 = v52;
        objc_msgSend(v18, "startRecognitionWithAutoStop:resultHandler:", v6, v37);

      }
      v15 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v15);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9;
  block[3] = &unk_251A12A20;
  v35 = v53;
  v36 = v52;
  v34 = v31;
  v29 = v31;
  dispatch_group_notify(v12, queue, block);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v53, 8);

}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSDictionary allValues](self->_recognizers, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addSpeechAudioData:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)endAudio
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Propagate endAudio to recognizers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)cancelRecognition
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSDictionary allValues](self->_recognizers, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancelRecognition");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)loadedRecognizers
{
  return -[NSDictionary allKeys](self->_recognizers, "allKeys");
}

- (void)setLanguagesRecognized:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  int *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[4];
  int v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _LTOSLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_LTMultilingualSpeechRecognizer setLanguagesRecognized:].cold.2();
  if (objc_msgSend(v4, "isFinal") && objc_msgSend(v4, "isConfident"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSDictionary allValues](self->_recognizers, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v17 = &v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v10, "language", v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_ltLocaleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "dominantLanguage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_ltLocaleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "isEqualToString:", v14);

          if ((v15 & 1) == 0)
          {
            v16 = _LTOSLogSpeech();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              -[_LTMultilingualSpeechRecognizer setLanguagesRecognized:].cold.1(v23, v16, v10, v17);
            objc_msgSend(v10, "cancelRecognition");
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizers, 0);
}

- (void)startRecognitionForLocale:(uint8_t *)buf autoEndpoint:(uint64_t)a2 resultHandler:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Starting recognition for %zu recognizers", buf, 0xCu);
}

- (void)setLanguagesRecognized:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_ltLocaleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v9;
  _os_log_debug_impl(&dword_2491B9000, v7, OS_LOG_TYPE_DEBUG, "Trying to cancel recognition for %{public}@", a1, 0xCu);

}

- (void)setLanguagesRecognized:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Received new language detection result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
