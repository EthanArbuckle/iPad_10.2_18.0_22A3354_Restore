@implementation LTLanguageDetector

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  NSObject *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  double v36;
  double v37;
  _BOOL8 v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  id v44;
  _QWORD block[4];
  id v46;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 50))
    {
      v5 = _LTOSLogLID();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_4();
    }
    else
    {
      v6 = (void *)WeakRetained[9];
      v8 = *(void **)(a1 + 32);
      v7 = (id *)(a1 + 32);
      objc_msgSend(v8, "locale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*v7, "modelVersion");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(*v7, "modelVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v13)
        {
          v14 = _LTOSLogLID();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_3(v7, v14);
          objc_msgSend(*v7, "modelVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "copy");
          v17 = (void *)*((_QWORD *)v4 + 9);
          objc_msgSend(*v7, "locale");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

          v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v20 = (void *)*((_QWORD *)v4 + 7);
          objc_msgSend(*v7, "locale");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

        }
      }
      if (objc_msgSend(*v7, "isFinal"))
      {
        v22 = *v7;
        v23 = (void *)*((_QWORD *)v4 + 8);
        objc_msgSend(v22, "locale");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

        v25 = _LTOSLogLID();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_1();
        objc_msgSend(v4, "endAudio");
        if (_LTPreferencesFinalThresholdsLanguageDetectionResultWaitTime())
        {
          if (!*((_BYTE *)v4 + 49))
          {
            v26 = _LTPreferencesFinalThresholdsLanguageDetectionResultWaitTime();
            if (v26 < _LTPreferencesFinalLanguageDetectionResultWaitTime())
            {
              v27 = *((_QWORD *)v4 + 13);
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_17;
              block[3] = &unk_251A111A0;
              objc_copyWeak(&v46, v2);
              dispatch_async(v27, block);
              objc_destroyWeak(&v46);
            }
          }
        }
        else
        {
          *((_BYTE *)v4 + 49) = 1;
        }
        v38 = _LTPreferencesFinalLanguageDetectionResultWaitTime() == 0;
        if ((objc_msgSend(v4, "haveFinalASRResults") & 1) == 0 && _LTPreferencesFinalLanguageDetectionResultWaitTime())
        {
          v39 = *((_QWORD *)v4 + 13);
          v40 = MEMORY[0x24BDAC760];
          v41 = 3221225472;
          v42 = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_19;
          v43 = &unk_251A111A0;
          objc_copyWeak(&v44, v2);
          dispatch_async(v39, &v40);
          objc_destroyWeak(&v44);
        }
      }
      else
      {
        v28 = (void *)*((_QWORD *)v4 + 7);
        *((_BYTE *)v4 + 51) = 1;
        objc_msgSend(*v7, "locale");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*v7, "bestTranscription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "confidence");
        objc_msgSend(v31, "numberWithDouble:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v33);

        v34 = _LTOSLogLID();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_2(v7, v34, (void **)v4 + 7);
        objc_msgSend(*v7, "bestTranscription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "confidence");
        v37 = v36;

        v38 = 0;
        if (v37 > 0.0)
          *((_BYTE *)v4 + 52) = 1;
      }
      objc_msgSend(v4, "sendFinalLanguageDetectionResult:", v38, v40, v41, v42, v43);

    }
  }

}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_17(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  uint64_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = _LTPreferencesFinalThresholdsLanguageDetectionResultWaitTime();
    v4 = dispatch_time(0, 1000000 * v3);
    v5 = WeakRetained[12];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2;
    block[3] = &unk_251A111A0;
    objc_copyWeak(&v7, v1);
    dispatch_after(v4, v5, block);
    objc_destroyWeak(&v7);
  }

}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogLID();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_cold_1();
    WeakRetained[49] = 1;
    objc_msgSend(WeakRetained, "sendFinalLanguageDetectionResult:", 0);
  }

}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_19(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  uint64_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = _LTPreferencesFinalLanguageDetectionResultWaitTime();
    v4 = dispatch_time(0, 1000000 * v3);
    v5 = WeakRetained[12];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_20;
    block[3] = &unk_251A111A0;
    objc_copyWeak(&v7, v1);
    dispatch_after(v4, v5, block);
    objc_destroyWeak(&v7);
  }

}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_20(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogLID();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_20_cold_1();
    objc_msgSend(WeakRetained, "sendFinalLanguageDetectionResult:", 1);
  }

}

void __31___LTLanguageDetector_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 48) = 1;
    v3 = _LTOSLogLID();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __31___LTLanguageDetector_endAudio__block_invoke_cold_1();
    objc_msgSend(v2, "sendFinalLanguageDetectionResult:", 0);
  }

}

void __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 50))
      v4 = 0;
    else
      v4 = WeakRetained[17] || objc_msgSend(WeakRetained[8], "count") == 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v5 = v3[17];
      if (v5)
      {
        objc_msgSend(v5, "setIsFinal:", 1);
        v6 = _LTOSLogLID();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_2();
      }
      else
      {
        objc_msgSend(v3[8], "objectEnumerator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "nextObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "locale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = _LTOSLogLID();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_1(v10, v9);
        v11 = objc_alloc(MEMORY[0x24BDF63E8]);
        v15 = v9;
        v16[0] = &unk_251A50A38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "initWithConfidences:isConfident:dominantLanguage:isFinal:", v12, objc_msgSend(v3, "isLowConfidencePair") ^ 1, v9, 1);
        v14 = v3[17];
        v3[17] = (id)v13;

      }
      objc_msgSend(v3, "sendLIDResult:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
    }
  }

}

void __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[16];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63E8]), "initWithConfidences:isConfident:dominantLanguage:isFinal:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(v4, "addObject:", v5);

    v6 = _LTOSLogLID();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke_cold_1();
    objc_msgSend(v3, "sendFinalLanguageDetectionResult:", 0);
    if (*((_BYTE *)v3 + 51) && !*((_BYTE *)v3 + 52))
    {
      objc_msgSend(v3[16], "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sendLIDResult:", v7);

    }
  }

}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Calling endAudio from addSpeechRecognitionResult", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_2(id *a1, void *a2, void **a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = a2;
  objc_msgSend(v5, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "bestTranscription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "confidence");
  v11 = v10;
  v12 = *a3;
  objc_msgSend(*a1, "locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 138543874;
  v16 = v8;
  v17 = 2048;
  v18 = v11;
  v19 = 2048;
  v20 = objc_msgSend(v14, "count");
  _os_log_debug_impl(&dword_2491B9000, v6, OS_LOG_TYPE_DEBUG, "Added %{public}@ partial-confidence: %f; new array length: %zu",
    (uint8_t *)&v15,
    0x20u);

}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_3(void **a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v6, v7, "Change in model-version triggers deletion of cached %{public}@ partial-confidences", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_3();
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Already sent final LID result, ignoring additional speech result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Initiate use of final thresholds to reduce dialog rates, as timer ended after 1st final ASR", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Try to force final LID, as timer ended after 1st final ASR", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __31___LTLanguageDetector_endAudio__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Trying to send final LID result from endAudio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "_ltLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v5, v6, "Forcing language detection result to be %{public}@", v7, v8, v9, v10, 2u);

}

void __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Forcing current language detection result to be final", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Trying to send final LID result from acousticLID CoreSpeech delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
