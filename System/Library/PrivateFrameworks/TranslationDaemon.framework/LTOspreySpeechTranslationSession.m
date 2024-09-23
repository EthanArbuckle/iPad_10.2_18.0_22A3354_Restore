@implementation LTOspreySpeechTranslationSession

id __55___LTOspreySpeechTranslationSession_sendAnalyticsEvent__block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[10];
  _QWORD v15[12];

  v15[10] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v14[0] = CFSTR("sentAudio");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[24]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v13;
    v14[1] = CFSTR("sentEndAudio");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[25]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v12;
    v14[2] = CFSTR("endpointedSpeech");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[26]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v2;
    v14[3] = CFSTR("didReceiveAudioLimitExceededResponse");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[27]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v3;
    v14[4] = CFSTR("didReceivePartialRecognitionResponse");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[28]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v4;
    v14[5] = CFSTR("didReceiveFinalRecognitionResponse");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[29]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v5;
    v14[6] = CFSTR("didReceiveTranslationResponse");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[6] = v6;
    v14[7] = CFSTR("didReceiveTTSResponse");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[31]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[7] = v7;
    v14[8] = CFSTR("didReceiveFinalBlazarResponse");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[32]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[8] = v8;
    v14[9] = CFSTR("didTimeout");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WeakRetained[33]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[9] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v10;
}

void __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientTraceIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "sequoiaClientHeaderValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "sequoiaClientHeaderValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Using client header value: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "sequoiaClientHeaderValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v10, CFSTR("x-sequoia-client"));

  }
}

void __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id *v7;
  id WeakRetained;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  uint8_t v12[16];

  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_36_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Streaming connection finished successfully", v12, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "sendAnalyticsEvent");
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LTSendErrorEvent(v3, v6);

  objc_msgSend(*(id *)(a1 + 32), "translationDidFinishWithError:", v3);
  v7 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) != 0)
    goto LABEL_9;
  v9 = objc_loadWeakRetained(v7);
  objc_msgSend(v9, "completionBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "completionBlock");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v11)[2](v11, v3);

LABEL_9:
  }

}

void __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClientTraceIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "sequoiaClientHeaderValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "sequoiaClientHeaderValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v5, CFSTR("x-sequoia-client"));

  }
}

void __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id *v6;
  id WeakRetained;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  uint8_t v11[16];

  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Streaming text translation session finished successfully", v11, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "translationDidFinishWithError:", v3);
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) != 0)
    goto LABEL_9;
  v8 = objc_loadWeakRetained(v6);
  objc_msgSend(v8, "completionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained(v6);
    objc_msgSend(WeakRetained, "completionBlock");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v3);

LABEL_9:
  }

}

void __57___LTOspreySpeechTranslationSession_updateServerTimeout___block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v2;
  dispatch_source_t *v3;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[14]);
    v2 = v3[14];
    v3[14] = 0;

    -[dispatch_source_t serverTimeoutFired](v3, "serverTimeoutFired");
    WeakRetained = v3;
  }

}

FTMutableAudioFrame *__73___LTOspreySpeechTranslationSession_didCompressPackets_totalPacketCount___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FTMutableAudioFrame *v3;

  v2 = a2;
  v3 = objc_alloc_init(FTMutableAudioFrame);
  -[FTMutableAudioFrame setAudio_bytes:](v3, "setAudio_bytes:", v2);

  return v3;
}

id __69___LTOspreySpeechTranslationSession__handleFinalRecognitionResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "formattedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "confidence");
  v6 = v5;
  v7 = objc_msgSend(v3, "isLowConfidence");

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: %f : %d"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_36_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Streaming connection finished with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Streaming text translation session finished with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
