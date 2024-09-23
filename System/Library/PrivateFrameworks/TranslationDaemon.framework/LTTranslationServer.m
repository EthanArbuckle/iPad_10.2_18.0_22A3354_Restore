@implementation LTTranslationServer

void __54___LTTranslationServer_preheatWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Requested preheat with context: %{public}@", buf, 0xCu);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "route") == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3[2](v3);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v15 = 0;
    objc_msgSend(v6, "_engineForContext:error:", v7, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v8)
    {
      objc_msgSend(v8, "preheatAsynchronously:withContext:", 0, *(_QWORD *)(a1 + 32));
      v10 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_2491B9000, v10, OS_LOG_TYPE_INFO, "Preheated engine with context: %{public}@", buf, 0xCu);
      }
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _LTAnalyticsSendOptionalErrorEvent(v9, v13);

      v14 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __54___LTTranslationServer_preheatWithContext_completion___block_invoke_cold_1();
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v12();
    v3[2](v3);

  }
}

void __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD);
  id v15[2];
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v4, "_engineForContext:error:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_19;
    v12[3] = &unk_251A13DC0;
    v15[1] = *(id *)(a1 + 72);
    objc_copyWeak(v15, (id *)(a1 + 64));
    v13 = *(id *)(a1 + 56);
    v14 = v3;
    objc_msgSend(v6, "translateSentence:withContext:completion:", v8, v9, v12);

    objc_destroyWeak(v15);
  }
  else
  {
    v10 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_cold_1();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LTAnalyticsSendOptionalErrorEvent(v7, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v3[2](v3);
  }

}

uint64_t __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = *(const char **)(a1 + 56);
  v6 = a3;
  v7 = a2;
  NSStringFromSelector(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v6, v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateOfflineEngineIdleTimer");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  void (**v24)(_QWORD);
  id v25[3];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 40);
    v7 = v5;
    *(_DWORD *)buf = 134218240;
    v28 = v4;
    v29 = 2048;
    v30 = objc_msgSend(v6, "route");
    _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Translating %zu paragraphs for route: %ld", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 48), "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
  v8 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v26 = 0;
  objc_msgSend(v8, "_engineForContext:error:", v9, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;
  if (v10)
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 64);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_21;
    v20[3] = &unk_251A13E10;
    objc_copyWeak(v25, (id *)(a1 + 72));
    v25[1] = v4;
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(a1 + 56);
    v21 = v15;
    v22 = v16;
    v25[2] = *(id *)(a1 + 80);
    v23 = v17;
    v24 = v3;
    objc_msgSend(v10, "translate:withContext:paragraphResult:completion:", v13, v12, v14, v20);

    objc_destroyWeak(v25);
  }
  else
  {
    v18 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_cold_1();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _LTAnalyticsSendOptionalErrorEvent(v11, v19);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v3[2](v3);
  }

}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = _LTOSLogTranslationEngine();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_21_cold_1();
      v7 = 3;
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 72);
        v14 = 134217984;
        v15 = v8;
        _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Finished translating %zu paragraphs", (uint8_t *)&v14, 0xCu);
      }
      v7 = 2;
    }
    v9 = objc_alloc(MEMORY[0x24BDF6418]);
    objc_msgSend(*(id *)(a1 + 32), "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithType:invocationId:", v7, v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "selfLoggingEventWithData:", v11);
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LTAnalyticsSendOptionalErrorEvent(v3, v12);

    v13 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v13, "_updateOfflineEngineIdleTimer");

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __65___LTTranslationServer_textStreamingConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  +[_LTDConfigurationService textStreamingConfigurationWithError:](_LTDConfigurationService, "textStreamingConfigurationWithError:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v11 = (id)v2;
  if (v2)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6470]);
    objc_msgSend(v11, "minTimeBetweenTranslations");
    v6 = v5;
    objc_msgSend(v11, "maxTimeBetweenTranslations");
    v8 = v7;
    objc_msgSend(v11, "userIdleTime");
    v10 = (void *)objc_msgSend(v4, "initWithMinTimeBetweenTranslations:maxTimeBetweenTranslations:userIdleTime:maxPartialTranslationAttempts:minNumberOfCharactersForTranslation:", objc_msgSend(v11, "maxPartialTranslationAttempts"), objc_msgSend(v11, "minNumberOfCharactersForTranslation"), v6, v8, v9);
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v10);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

void __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _LTServerSpeechSession *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  void (**v22)(_QWORD);
  id v23[2];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancelExistingSessions");
    objc_msgSend(v5, "_removePendingSpeechSessionID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      v9 = objc_msgSend(v7, "route");
      v10 = objc_msgSend(*(id *)(a1 + 40), "autodetectLanguage");
      *(_DWORD *)buf = 134218240;
      v26 = v9;
      v27 = 1024;
      v28 = v10;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Handling text translation request for route: %zd (autodetect: %{BOOL}i)", buf, 0x12u);

    }
    v12 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v24 = 0;
    objc_msgSend(v11, "_engineForContext:error:", v12, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;
    if (v13)
    {
      v15 = -[_LTServerSpeechSession initWithEngine:delegate:selfLoggingManager:]([_LTServerSpeechSession alloc], "initWithEngine:delegate:selfLoggingManager:", v13, *(_QWORD *)(a1 + 56), v5[10]);
      -[_LTServerSpeechSession setSessionID:](v15, "setSessionID:", *(_QWORD *)(a1 + 64));
      objc_storeStrong(v5 + 5, v15);
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_29;
      v21 = &unk_251A13E60;
      v23[1] = *(id *)(a1 + 88);
      objc_copyWeak(v23, (id *)(a1 + 80));
      v22 = v3;
      -[_LTServerSpeechSession setCompletionHandler:](v15, "setCompletionHandler:", &v18);
      -[_LTServerSpeechSession startTextToSpeechTranslationWithContext:text:](v15, "startTextToSpeechTranslationWithContext:text:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v18, v19, v20, v21);

      objc_destroyWeak(v23);
    }
    else
    {
      v16 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_cold_1();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _LTAnalyticsSendOptionalErrorEvent(v14, v17);

      objc_msgSend(*(id *)(a1 + 56), "translationDidFinishWithError:", v14);
      v3[2](v3);
    }

  }
}

uint64_t __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_29(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  id WeakRetained;
  id v7;

  v3 = *(const char **)(a1 + 48);
  v4 = a2;
  NSStringFromSelector(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v4, v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateOfflineEngineIdleTimer");

  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "_speechSessionCompleted");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _LTServerSpeakSession *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD);
  id v25[2];
  id v26;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancelExistingSessions");
    objc_msgSend(v5, "_removePendingSpeechSessionID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(a1 + 48);
    v26 = 0;
    objc_msgSend(v6, "_engineForContext:error:", v7, &v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v26;
    v10 = v9;
    if (v8)
    {
      v19 = v9;
      v11 = -[_LTServerSpeakSession initWithEngine:]([_LTServerSpeakSession alloc], "initWithEngine:", v8);
      v12 = (void *)v5[6];
      v5[6] = v11;

      v13 = (void *)v5[6];
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_31;
      v22[3] = &unk_251A13EB0;
      v25[1] = *(id *)(a1 + 88);
      objc_copyWeak(v25, (id *)(a1 + 80));
      v23 = *(id *)(a1 + 72);
      v24 = v3;
      v20[0] = v16;
      v20[1] = 3221225472;
      v20[2] = __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_33;
      v20[3] = &unk_251A13ED8;
      v21 = *(id *)(a1 + 64);
      objc_msgSend(v13, "speak:context:completion:audioStartHandler:", v14, v15, v22, v20);

      objc_destroyWeak(v25);
      v10 = v19;
    }
    else
    {
      v17 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_cold_1();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _LTAnalyticsSendOptionalErrorEvent(v10, v18);

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      v3[2](v3);
    }

  }
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = _LTOSLogTTS();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_31_cold_1();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LTAnalyticsSendOptionalErrorEvent(v6, v8);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateOfflineEngineIdleTimer");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_33(uint64_t a1, void *a2, double a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "wordTimingInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ttsAudioStarted:duration:", v6, a3);

  }
}

void __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id *WeakRetained;
  id *v5;
  id *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  _LTServerSpeechSession *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  id v32[2];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancelExistingSessions");
    objc_msgSend(v5, "_removePendingSpeechSessionID:", *(_QWORD *)(a1 + 32));
    v6 = (id *)(a1 + 40);
    objc_msgSend(v5, "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *v6;
      v9 = v7;
      v10 = objc_msgSend(v8, "route");
      v11 = objc_msgSend(*v6, "autodetectLanguage");
      *(_DWORD *)buf = 134218240;
      v35 = v10;
      v36 = 1024;
      v37 = v11;
      _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Handling speech translation request for route: %zd (autodetect: %{BOOL}i)", buf, 0x12u);

    }
    objc_msgSend(*(id *)(a1 + 48), "_modalitiesPerLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localePair");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "locale:supportsModality:", v13, 1) & 1) != 0)
    {
      if ((objc_msgSend(*v6, "autodetectLanguage") & 1) == 0)
      {

LABEL_13:
        v22 = *v6;
        v33 = 0;
        objc_msgSend(v5, "_engineForContext:error:", v22, &v33);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v33;
        v25 = _LTOSLogTranslationEngine();
        v26 = v25;
        if (v23)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2491B9000, v26, OS_LOG_TYPE_INFO, "Start speech translation session", buf, 2u);
          }
          v27 = -[_LTServerSpeechSession initWithEngine:delegate:selfLoggingManager:]([_LTServerSpeechSession alloc], "initWithEngine:delegate:selfLoggingManager:", v23, *(_QWORD *)(a1 + 56), v5[10]);
          -[_LTServerSpeechSession setSessionID:](v27, "setSessionID:", *(_QWORD *)(a1 + 64));
          objc_storeStrong(v5 + 5, v27);
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_37;
          v30[3] = &unk_251A13E60;
          v32[1] = *(id *)(a1 + 80);
          objc_copyWeak(v32, (id *)(a1 + 72));
          v31 = v3;
          -[_LTServerSpeechSession setCompletionHandler:](v27, "setCompletionHandler:", v30);
          -[_LTServerSpeechSession startSpeechTranslationWithContext:](v27, "startSpeechTranslationWithContext:", *v6);

          objc_destroyWeak(v32);
        }
        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_1();
          NSStringFromSelector(*(SEL *)(a1 + 80));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          _LTAnalyticsSendOptionalErrorEvent(v24, v28);

          objc_msgSend(*(id *)(a1 + 56), "translationDidFinishWithError:", v24);
          v3[2](v3);
        }

LABEL_21:
        goto LABEL_22;
      }
      objc_msgSend(*v6, "localePair");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "targetLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v29, "locale:supportsModality:", v15, 1);

      if ((v16 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

    }
    v17 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_2((void **)(a1 + 40), v17);
    v18 = *(void **)(a1 + 56);
    v19 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 40), "localePair");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lt_unsupporedLocalePairError:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "translationDidFinishWithError:", v21);

    v3[2](v3);
    goto LABEL_21;
  }
LABEL_22:

}

uint64_t __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_37(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  id WeakRetained;
  id v7;

  v3 = *(const char **)(a1 + 48);
  v4 = a2;
  NSStringFromSelector(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v4, v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateOfflineEngineIdleTimer");

  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "_speechSessionCompleted");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43___LTTranslationServer_cancelSpeechSession__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[5], "cancel");
    v2 = v3[5];
    v3[5] = 0;

    WeakRetained = v3;
  }

}

void __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_2(a1, (uint64_t)WeakRetained, v3);
    objc_msgSend(WeakRetained[5], "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v5 & 1) != 0)
    {
      objc_msgSend(WeakRetained[5], "cancel");
      v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Resetting session", v9, 2u);
      }
      v7 = WeakRetained[5];
      WeakRetained[5] = 0;

    }
    else
    {
      v8 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_1();
    }
  }

}

void __47___LTTranslationServer__speechSessionCompleted__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __43___LTTranslationServer_addSpeechAudioData___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __43___LTTranslationServer_addSpeechAudioData___block_invoke_cold_1();
    objc_msgSend(WeakRetained[5], "addSpeechAudioData:", *(_QWORD *)(a1 + 32));
  }

}

void __32___LTTranslationServer_endAudio__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __32___LTTranslationServer_endAudio__block_invoke_cold_1();
    objc_msgSend(WeakRetained[5], "endAudio");
  }

}

void __71___LTTranslationServer_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _LTPreferencesGetLanguageDetectorUnsupportedPairs();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __58___LTTranslationServer_modalitiesPerLocaleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_modalitiesPerLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __88___LTTranslationServer__markPendingSpeechSessionIfNeededWithContext_effectiveSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", *(_QWORD *)(a1 + 40));
}

void __37___LTTranslationServer__logStateSoon__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "onDeviceModeEnabled:", &__block_literal_global_29);
    WeakRetained = v2;
  }

}

void __37___LTTranslationServer__logStateSoon__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = _LTOSLogDeviceState();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEFAULT, "On-device mode enabled: %{BOOL}i", (uint8_t *)v4, 8u);
  }
}

void __37___LTTranslationServer__logStateSoon__block_invoke_41(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

void __44___LTTranslationServer_startLoggingRequest___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[8], "startLoggingRequest:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __44___LTTranslationServer_cleanupOfflineEngine__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __31___LTTranslationServer_cleanup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogSpeech();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Client requested a cleanup of ongoing speech sessions", v3, 2u);
    }
    objc_msgSend(WeakRetained, "cancelExistingSessions");
    objc_msgSend(WeakRetained, "_cancelPendingSpeechOperations");
  }

}

void __61___LTTranslationServer_attemptToCancelRequestsWithSessionID___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[3];
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelOperationsWithGroupID:", v4);

    WeakRetained = v5;
  }

}

void __59___LTTranslationServer_shouldPresentSystemFirstUseConsent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "lt_appGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5 = v2;
  if ((objc_msgSend(v2, "lt_isOnDeviceOnly") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v5, "lt_hasAcceptedFirstUseConsent") ^ 1;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);

}

void __51___LTTranslationServer_languageForText_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _LTTextLanguageDetector *v4;

  v4 = objc_alloc_init(_LTTextLanguageDetector);
  _LTPreferencesSupportedLocales(2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTextLanguageDetector setAvailableLocales:](v4, "setAvailableLocales:", v2);

  -[_LTTextLanguageDetector detectionForString:](v4, "detectionForString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke(_QWORD *a1)
{
  _LTTextLanguageDetector *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = -[_LTTextLanguageDetector initWithModel:]([_LTTextLanguageDetector alloc], "initWithModel:", a1[6]);
  _LTPreferencesSupportedLocales(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTextLanguageDetector setAvailableLocales:](v2, "setAvailableLocales:", v3);

  -[_LTTextLanguageDetector detectionForStrings:strategy:](v2, "detectionForStrings:strategy:", a1[4], a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _LTOSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke_cold_1(v5);
  (*(void (**)(void))(a1[5] + 16))();

}

uint64_t __61___LTTranslationServer_languageAssetsWithOptions_completion___block_invoke(uint64_t a1)
{
  return +[_LTDLanguageAssetService assetsWithOptions:completion:](_LTDLanguageAssetService, "assetsWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __70___LTTranslationServer_setLanguageAssets_options_progress_completion___block_invoke(_QWORD *a1)
{
  return +[_LTDLanguageAssetService setAssets:options:progress:completion:](_LTDLanguageAssetService, "setAssets:options:progress:completion:", a1[4], a1[7], a1[5], a1[6]);
}

void __47___LTTranslationServer__offlineLanguageStatus___block_invoke(uint64_t a1)
{
  _LTOfflineAssetManager *v2;
  _QWORD v3[4];
  id v4;

  v2 = objc_alloc_init(_LTOfflineAssetManager);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47___LTTranslationServer__offlineLanguageStatus___block_invoke_2;
  v3[3] = &unk_251A115E8;
  v4 = *(id *)(a1 + 32);
  -[_LTOfflineAssetManager offlineLanguageStatus:](v2, "offlineLanguageStatus:", v3);

}

uint64_t __47___LTTranslationServer__offlineLanguageStatus___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  _LTOfflineAssetManager *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = objc_alloc_init(_LTOfflineAssetManager);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v7[3] = &unk_251A13F98;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  -[_LTOfflineAssetManager downloadAssetsForLanguagePair:userInitiated:completion:](v2, "downloadAssetsForLanguagePair:userInitiated:completion:", v3, v4, v7);

}

void __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  id v5;

  v3 = *(const char **)(a1 + 40);
  v5 = a2;
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  _LTOfflineAssetManager *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = objc_alloc_init(_LTOfflineAssetManager);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v7[3] = &unk_251A13F98;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  -[_LTOfflineAssetManager purgeAssetForLanguagePair:userInitiated:completion:](v2, "purgeAssetForLanguagePair:userInitiated:completion:", v3, v4, v7);

}

void __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  id v5;

  v3 = *(const char **)(a1 + 40);
  v5 = a2;
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke(uint64_t a1)
{
  _LTOfflineAssetManager *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  +[_LTDLanguageAssetService setSelectedLocales:](_LTDLanguageAssetService, "setSelectedLocales:", MEMORY[0x24BDBD1A8]);
  v2 = objc_alloc_init(_LTOfflineAssetManager);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke_2;
  v6[3] = &unk_251A13F98;
  v5 = *(_OWORD *)(a1 + 32);
  v4 = (id)v5;
  v7 = v5;
  -[_LTOfflineAssetManager purgeAllAssetsExcludingConfig:completion:](v2, "purgeAllAssetsExcludingConfig:completion:", v3, v6);

}

void __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  id v5;

  v3 = *(const char **)(a1 + 40);
  v5 = a2;
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __41___LTTranslationServer__updateAllAssets___block_invoke(uint64_t a1)
{
  _LTOfflineAssetManager *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  +[_LTDAssetService setNeedsCatalogRefresh:](_LTDAssetService, "setNeedsCatalogRefresh:", 1);
  v2 = objc_alloc_init(_LTOfflineAssetManager);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41___LTTranslationServer__updateAllAssets___block_invoke_2;
  v5[3] = &unk_251A13F98;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  -[_LTOfflineAssetManager updateAllAssets:](v2, "updateAllAssets:", v5);

}

void __41___LTTranslationServer__updateAllAssets___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  id v5;

  v3 = *(const char **)(a1 + 40);
  v5 = a2;
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __41___LTTranslationServer_installedLocales___block_invoke(uint64_t a1)
{
  id v2;

  +[_LTDLanguageAssetService selectedLocales](_LTDLanguageAssetService, "selectedLocales");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_2;
  v2[3] = &unk_251A14050;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  +[_LTDLanguageAssetService assetsWithOptions:completion:](_LTDLanguageAssetService, "assetsWithOptions:completion:", 64, v2);

  objc_destroyWeak(&v4);
}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[12];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3;
    block[3] = &unk_251A11DC8;
    v11 = v6;
    v13 = *(id *)(a1 + 32);
    v12 = v5;
    dispatch_async(v9, block);

  }
}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_ltCompactMap:", &__block_literal_global_50);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locale");
}

void __53___LTTranslationServer_startInstallRequest_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "locales");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "useCellular");
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_2;
  v7[3] = &unk_251A11268;
  v8 = *(id *)(a1 + 40);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_3;
  v5[3] = &unk_251A11290;
  v6 = *(id *)(a1 + 40);
  +[_LTDLanguageAssetService setInstalledLocales:useCellular:progress:completion:](_LTDLanguageAssetService, "setInstalledLocales:useCellular:progress:completion:", v2, v3, v7, v5);

}

uint64_t __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "languageInstallProgressed:error:", a2, 0);
}

uint64_t __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "languageInstallProgressed:error:", 0, a2);
}

void __38___LTTranslationServer__getAssetSize___block_invoke(uint64_t a1)
{
  _LTOfflineAssetManager *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v2 = objc_alloc_init(_LTOfflineAssetManager);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38___LTTranslationServer__getAssetSize___block_invoke_2;
  v5[3] = &unk_251A14078;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  -[_LTOfflineAssetManager assetSize:](v2, "assetSize:", v5);

}

void __38___LTTranslationServer__getAssetSize___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(const char **)(a1 + 40);
  v6 = a3;
  v8 = a2;
  NSStringFromSelector(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LTAnalyticsSendOptionalErrorEvent(v6, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63___LTTranslationServer_availableLocalePairsForTask_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  _LTPreferencesSupportedLocalePairsForTask(*(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __77___LTTranslationServer_additionalLikelyPreferredLocalesForLocale_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  _LTPreferencesAdditionalLikelyPreferredLocales(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke(id *a1)
{
  _LTOfflineAssetManager *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = objc_alloc_init(_LTOfflineAssetManager);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke_2;
  v3[3] = &unk_251A140A0;
  v6 = a1[6];
  v4 = a1[4];
  v5 = a1[5];
  -[_LTOfflineAssetManager refreshAllIfNeededWithCompletion:](v2, "refreshAllIfNeededWithCompletion:", v3);

}

void __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  _LTPreferencesConfigInfoForLocale(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __61___LTTranslationServer_task_isSupportedInCountry_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38___LTTranslationServer__updateHotfix___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[_LTHotfixManager shared](_LTHotfixManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38___LTTranslationServer__updateHotfix___block_invoke_2;
  v3[3] = &unk_251A112E0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "updateHotfix:", v3);

}

uint64_t __38___LTTranslationServer__updateHotfix___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38___LTTranslationServer__deleteHotfix___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[_LTHotfixManager shared](_LTHotfixManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38___LTTranslationServer__deleteHotfix___block_invoke_2;
  v3[3] = &unk_251A112E0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "deleteHotfix:", v3);

}

uint64_t __38___LTTranslationServer__deleteHotfix___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44___LTTranslationServer_onDeviceModeEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDBCF50], "lt_appGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lt_isOnDeviceOnly");

  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44___LTTranslationServer_onDeviceModeEnabled___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46___LTTranslationServer_onDeviceModeSupported___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = +[_LTDLanguageAssetService onDeviceModeSupported](_LTDLanguageAssetService, "onDeviceModeSupported");
  v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __46___LTTranslationServer_onDeviceModeSupported___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49___LTTranslationServer_selfLoggingEventWithData___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[10], "selfLoggingEventWithData:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __78___LTTranslationServer_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[10], "selfLoggingLanguageIdentificationCompletedWithLIDData:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_2;
  v6[3] = &unk_251A14118;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v5 = v3;
  v7 = v5;
  (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v6);

  objc_destroyWeak(&v8);
}

void __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  char v10;
  uint8_t buf[16];

  v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Finished asset cleanup actions after a download completed", buf, 2u);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[12];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_54;
    block[3] = &unk_251A140F0;
    v10 = a2;
    block[4] = WeakRetained;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

  }
}

uint64_t __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_54(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  uint8_t buf[16];
  __int16 v12;

  if (!*(_BYTE *)(a1 + 48))
  {
    v4 = _LTOSLogAssets();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    v12 = 0;
    v7 = "No further cleanup required";
    v8 = (uint8_t *)&v12;
LABEL_10:
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, v7, v8, 2u);
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = _LTOSLogTranslationEngine();
  v4 = v3;
  if (!v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    v10 = 0;
    v7 = "No need to clear offline engine after downloads finished because there wasn't a cached engine";
    v8 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_DEFAULT, "Clearing offline translation engine since assets may have changed and files may have changed locations", buf, 2u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = 0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

void __54___LTTranslationServer_preheatWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to preheat engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create text translation engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create paragraph text translation engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_21_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_2491B9000, v1, OS_LOG_TYPE_ERROR, "Failed to translate %zu paragraphs: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

void __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create text-to-speech translation engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create translation engine for speaking: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed TTS request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create speech translation engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_2(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "localePair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v3, v6, "Speech translation request for %{public}@ is not supported", v7);

  OUTLINED_FUNCTION_1_3();
}

void __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Ignoring cancel request because of different session IDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEBUG, "Asked to cancel %{public}@, current ongoing is: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_3();
}

void __43___LTTranslationServer_addSpeechAudioData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Add speech audio data for session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __32___LTTranslationServer_endAudio__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "End speech audio data on session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "XPC languages for text result: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to lookup installed languages: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __44___LTTranslationServer_onDeviceModeEnabled___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14_1(&dword_2491B9000, a2, a3, "XPC on-device mode result: %{BOOL}i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void __46___LTTranslationServer_onDeviceModeSupported___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14_1(&dword_2491B9000, a2, a3, "XPC on-device support result: %{BOOL}i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

@end
