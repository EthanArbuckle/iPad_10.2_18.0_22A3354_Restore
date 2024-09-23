@implementation LTOnlineTranslationEngine

void __53___LTOnlineTranslationEngine_startServerTimeoutTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_source_t v6;
  void *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[9])
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v3;

    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "startServerTimeoutTimer", v8, 2u);
    }
    v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v2 + 8));
    v7 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v6;

    objc_msgSend(v2, "updateServerTimeout");
    dispatch_resume(*((dispatch_object_t *)v2 + 9));
  }

}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD handler[4];
  id v12;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 9);
    if (v4)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_2;
      handler[3] = &unk_251A13100;
      objc_copyWeak(&v12, v1);
      dispatch_source_set_event_handler(v4, handler);
      v5 = _LTPreferencesBatchingMaxParagraphBufferTimeout();
      v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_cold_1(v6, v5, v7, v8);
      v9 = v3[9];
      v10 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_destroyWeak(&v12);
    }
  }

}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_2(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancelServerTimeout");
    v4 = v3[5];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_3;
    block[3] = &unk_251A13100;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "serverTimeoutFired");

}

void __49___LTOnlineTranslationEngine_cancelServerTimeout__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject *v2;
  NSObject **v3;
  NSObject **v4;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[9];
    if (v2)
    {
      v4 = WeakRetained;
      if (dispatch_source_testcancel(v2))
      {
        v3 = v4;
      }
      else
      {
        dispatch_source_cancel(v2);
        v3 = v4;
        v2 = v4[9];
      }
      v3[9] = 0;

      WeakRetained = v4;
    }
  }

}

void __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "speech_id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientTraceIdentifier:", v3);

}

void __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _LTAudioData *v25;
  void *v26;
  _LTAudioData *v27;
  __int128 v28;
  uint8_t buf[32];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v5, "error_code");
      objc_msgSend(v5, "error_str");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v9;
      _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "TTS response (%d): %@", buf, 0x12u);

    }
    if (_LTRemoteStatusIsSuccess(objc_msgSend(v5, "error_code")))
    {
      v30 = 0;
      memset(buf, 0, sizeof(buf));
      objc_msgSend(v5, "decoder_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "audioStreamBasicDescription");
      }
      else
      {
        v30 = 0;
        memset(buf, 0, sizeof(buf));
      }

      v22 = (void *)MEMORY[0x24BDF64E0];
      objc_msgSend(v5, "word_timing_info");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "wordTimingInfoFromArray:text:", v23, *(_QWORD *)(a1 + 32));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = [_LTAudioData alloc];
      objc_msgSend(v5, "audio", *(_QWORD *)buf, *(_QWORD *)&buf[8], *(_OWORD *)&buf[16], v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_LTAudioData initWithASBD:rawData:wordTimingInfo:](v25, "initWithASBD:rawData:wordTimingInfo:", &v28, v26, v24);

      objc_msgSend(*(id *)(a1 + 40), "cacheAudioData:forKey:", v27, *(_QWORD *)(a1 + 48));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
      v12 = objc_msgSend(v5, "error_code");
      objc_msgSend(v5, "error_str");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _LTErrorFromRemoteFailure(v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2_cold_1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
  }

}

FTMutableSpan *__107___LTOnlineTranslationEngine__createOrUpdateBatchTranslationRequestWithParagraph_index_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FTMutableSpan *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = objc_alloc_init(FTMutableSpan);
  objc_msgSend(*(id *)(a1 + 32), "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "range");
  v8 = objc_msgSend(v5, "lt_codePointsRangeFromCodeUnitsRange:", v6, v7);
  v10 = v9;

  -[FTMutableSpan setStart_index:](v4, "setStart_index:", v8);
  -[FTMutableSpan setEnd_index:](v4, "setEnd_index:", (v8 + v10 - 1));
  -[FTMutableSpan setDo_not_translate:](v4, "setDo_not_translate:", objc_msgSend(v3, "shouldTranslate") ^ 1);
  objc_msgSend(v3, "metaInfoData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v3, "metaInfoData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithData:encoding:", v13, 4);
    -[FTMutableSpan setMeta_info:](v4, "setMeta_info:", v14);

  }
  return v4;
}

void __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "request_id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClientTraceIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 40), "clientHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v5, CFSTR("x-sequoia-client"));

  }
}

void __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3;
  block[3] = &unk_251A13518;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 72);
  v12 = v6;
  v17 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = v3;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 80);
  v15 = v8;
  v18 = v9;
  v16 = *(id *)(a1 + 64);
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    objc_msgSend(*(id *)(a1 + 40), "request_id");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v3, OS_SIGNPOST_INTERVAL_END, v4, "TranslateParagraph", "Online: Finished translating paragraph: %{public}@ error %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 56), "responseReceived:", *(_QWORD *)(a1 + 80));
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "request_id");
      objc_claimAutoreleasedReturnValue();
      __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3_cold_1();
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "setCompletionHandlerCalled:", 1);
  return objc_msgSend(*(id *)(a1 + 64), "callCompletionHandlersWithError:", *(_QWORD *)(a1 + 48));
}

void __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke_2;
    v7[3] = &unk_251A13568;
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 80);
    v8 = v5;
    v11 = v6;
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(WeakRetained, "_createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:", v3, 0, v4, v7);

  }
}

void __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v8, OS_SIGNPOST_INTERVAL_END, v9, "TranslateSentence", "Online: finished translating sentence", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "sendLazy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__8;
    v15[4] = __Block_byref_object_dispose__8;
    v16 = 0;
    v4 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_218;
    v11[3] = &unk_251A135E0;
    v11[4] = WeakRetained;
    v5 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v14 = v15;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    v6 = completionGroup;
    v7 = v3[5];
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_3;
    v8[3] = &unk_251A13608;
    v9 = *(id *)(a1 + 56);
    v10 = v15;
    dispatch_group_notify(v6, v7, v8);

    _Block_object_dispose(v15, 8);
  }

}

void __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_218(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;

  v3 = a2;
  ++completionGroupCount;
  dispatch_group_enter((dispatch_group_t)completionGroup);
  v4 = -[_LTOnlineTranslationEngine translate:withContext:paragraphResult:completion:]::paragraphIndex++;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_2;
  v10[3] = &unk_251A135B8;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = (id)v9;
  v12 = v9;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v5, "_createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:", v8, v4, v6, v10);

}

void __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
      objc_storeStrong(v7, a3);
  }
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v11, v5);

  --completionGroupCount;
  dispatch_group_leave((dispatch_group_t)completionGroup);

}

uint64_t __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[13];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2;
    block[3] = &unk_251A13658;
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = v3;
    dispatch_async(v6, block);

  }
}

uint64_t __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "responseReceived:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_speechSessionCompletedWithError:", *(_QWORD *)(a1 + 48));
}

void __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[13];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2;
    v7[3] = &unk_251A12E20;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speechSessionCompletedWithError:", *(_QWORD *)(a1 + 40));
}

void __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 6), "cancel");
    v4 = (void *)v3[6];
    v3[6] = 0;

    if (*(_BYTE *)(a1 + 40))
    {
      v5 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke_cold_1();
    }
  }

}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_cold_1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_5(&dword_2491B9000, a1, a4, "updateServerTimeout %.2fs", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_2();
}

void __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Remote failure during TTS request: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

void __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_5_4();
  v2 = *v1;
  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(_QWORD *)(v3 + 14) = v2;
  OUTLINED_FUNCTION_3_4(&dword_2491B9000, "Failed to translate paragraph %{public}@: %@", v5, v6);

  OUTLINED_FUNCTION_16();
}

void __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Notifying delegate of successfull cancellation is not supported for online engine.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
