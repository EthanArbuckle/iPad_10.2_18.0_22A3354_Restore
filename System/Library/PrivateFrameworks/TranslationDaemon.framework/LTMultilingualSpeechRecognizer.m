@implementation LTMultilingualSpeechRecognizer

void __67___LTMultilingualSpeechRecognizer_initWithModelURLs_modelVersions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _LTSpeechRecognizer *v7;
  void *v8;
  _LTSpeechRecognizer *v9;

  v5 = a3;
  v6 = a2;
  v7 = [_LTSpeechRecognizer alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_LTSpeechRecognizer initWithModelURL:language:modelVersion:](v7, "initWithModelURL:language:modelVersion:", v5, v6, v8);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v6);
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = _LTOSLogSpeech();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_3((uint64_t)v6, v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a3);
    v9 = *(id *)(a1 + 32);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 104);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v45 = v12;
      v46 = 2112;
      v47 = v6;
      _os_signpost_emit_with_name_impl(&dword_2491B9000, v10, OS_SIGNPOST_INTERVAL_END, v11, "ASR", "Failed ASR (%{public}@) with error: %@", buf, 0x16u);
    }

    if (v5)
    {
      v13 = *(NSObject **)(a1 + 48);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_4;
      block[3] = &unk_251A129D0;
      v42 = *(id *)(a1 + 80);
      v41 = v5;
      dispatch_async(v13, block);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_2(v8, v5);
    v14 = *(NSObject **)(a1 + 48);
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_6;
    v37[3] = &unk_251A129D0;
    v39 = *(id *)(a1 + 80);
    v15 = v5;
    v38 = v15;
    dispatch_async(v14, v37);
    if (objc_msgSend(v15, "isFinal"))
    {
      v31 = 0;
      v16 = _LTOSLogSpeech();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_1();
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v17 = *(id *)(a1 + 64);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v22, "language", v31);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 72), "language");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqual:", v24);

            if ((v25 & 1) == 0)
              objc_msgSend(v22, "triggerServerSideEndPointer");
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        }
        while (v19);
      }

      v26 = *(NSObject **)(a1 + 48);
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_7;
      v32[3] = &unk_251A120D0;
      v32[4] = *(_QWORD *)(a1 + 96);
      dispatch_async(v26, v32);
      v27 = *(id *)(a1 + 32);
      v28 = v27;
      v29 = *(_QWORD *)(a1 + 104);
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        v30 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v45 = v30;
        _os_signpost_emit_with_name_impl(&dword_2491B9000, v28, OS_SIGNPOST_INTERVAL_END, v29, "ASR", "Completed ASR for %@", buf, 0xCu);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
      v6 = v31;
    }

  }
}

uint64_t __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_7(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9(_QWORD *a1)
{
  NSObject *v2;

  v2 = _LTOSLogSpeech();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9_cold_1();
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    if (*(uint64_t *)(*(_QWORD *)(a1[6] + 8) + 24) <= 0)
      (*(void (**)(void))(a1[4] + 16))();
  }
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Recognizer finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bestTranscription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543619;
  v9 = v5;
  v10 = 2117;
  v11 = v7;
  _os_log_debug_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEBUG, "ASR result (%{public}@): %{sensitive}@", (uint8_t *)&v8, 0x16u);

}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2491B9000, a2, OS_LOG_TYPE_ERROR, "Recognition error: %@", (uint8_t *)&v2, 0xCu);
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "All recognizers finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
