@implementation _LTLoggingRequestHandler

- (FTBlazarService)mtAppService
{
  FTBlazarService *mtAppService;
  FTBlazarService *v4;
  FTBlazarService *v5;

  mtAppService = self->_mtAppService;
  if (!mtAppService)
  {
    +[_LTOnlineTranslationEngine blazarServiceWithBundleID:](_LTOnlineTranslationEngine, "blazarServiceWithBundleID:", CFSTR("com.apple.Translate"));
    v4 = (FTBlazarService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mtAppService;
    self->_mtAppService = v4;

    mtAppService = self->_mtAppService;
  }
  return mtAppService;
}

- (void)startLoggingRequest:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_LTLoggingRequestHandler startSpeechLIDRequest:](self, "startSpeechLIDRequest:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_LTLoggingRequestHandler startSpeechSensesLoggingRequest:](self, "startSpeechSensesLoggingRequest:", v4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_LTLoggingRequestHandler startSafariLatencyLoggingRequest:](self, "startSafariLatencyLoggingRequest:", v4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[_LTLoggingRequestHandler startSafariFeedbackRequest:](self, "startSafariFeedbackRequest:", v4);
      }
    }
  }

}

- (void)startSpeechLIDRequest:(id)a3
{
  NSObject *v5;
  void *v6;
  FTMutableTranslationLocalePair *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FTMutableLanguageDetected *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  FTMutableLanguageDetectionPrediction *v31;
  void *v32;
  void *v33;
  FTMutableStartSpeechTranslationLoggingRequest *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  FTMutableSpeechTranslationStreamingRequest *v39;
  FTMutableLanguageDetected *v40;
  FTMutableTranslationLocalePair *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint8_t buf[16];
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Start Speech LID logging request", buf, 2u);
  }
  -[_LTLoggingRequestHandler mtAppService](self, "mtAppService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __50___LTLoggingRequestHandler_startSpeechLIDRequest___block_invoke_2;
  v48[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v48[4] = a2;
  objc_msgSend(v6, "performSpeechTranslationWithDelegate:requestBuilder:completion:", self, &__block_literal_global_16, v48);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(FTMutableTranslationLocalePair);
  objc_msgSend(v43, "targetLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationLocalePair setTarget_locale:](v7, "setTarget_locale:", v9);

  objc_msgSend(v43, "localePair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "targetLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oppositeToLocale:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v7;
  -[FTMutableTranslationLocalePair setSource_locale:](v7, "setSource_locale:", v13);

  v14 = objc_alloc_init(FTMutableLanguageDetected);
  objc_msgSend(v43, "lidResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dominantLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v14;
  -[FTMutableLanguageDetected setDetected_locale:](v14, "setDetected_locale:", v17);

  objc_msgSend(v43, "lidResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "confidences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v43, "localePair");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v21;
  objc_msgSend(v43, "localePair");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reversedPair");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v28), "sourceLocale");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = objc_alloc_init(FTMutableLanguageDetectionPrediction);
          objc_msgSend(v29, "localeIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[FTMutableLanguageDetectionPrediction setLocale:](v31, "setLocale:", v32);

          objc_msgSend(v30, "floatValue");
          -[FTMutableLanguageDetectionPrediction setConfidence:](v31, "setConfidence:");
          objc_msgSend(v43, "lidResult");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[FTMutableLanguageDetectionPrediction setIs_low_confidence:](v31, "setIs_low_confidence:", objc_msgSend(v33, "isConfident") ^ 1);

          objc_msgSend(v20, "addObject:", v31);
        }

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v26);
  }

  -[FTMutableLanguageDetected setPredictions:](v40, "setPredictions:", v20);
  v34 = objc_alloc_init(FTMutableStartSpeechTranslationLoggingRequest);
  objc_msgSend(v43, "conversationID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setConversation_id:](v34, "setConversation_id:", v35);

  objc_msgSend(v43, "requestID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setRequest_id:](v34, "setRequest_id:", v36);

  objc_msgSend(v43, "selectedLocale");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localeIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setUser_selected_locale:](v34, "setUser_selected_locale:", v38);

  -[FTMutableStartSpeechTranslationLoggingRequest setDetected_locale:](v34, "setDetected_locale:", v40);
  -[FTMutableStartSpeechTranslationLoggingRequest setTranslation_locale_pair:](v34, "setTranslation_locale_pair:", v41);
  v39 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  -[FTMutableSpeechTranslationStreamingRequest setContentAsFTStartSpeechTranslationLoggingRequest:](v39, "setContentAsFTStartSpeechTranslationLoggingRequest:", v34);
  objc_msgSend(v42, "sendSpeechTranslationStreamingRequest:", v39);
  objc_msgSend(v42, "closeStream");

}

- (void)startSpeechSensesLoggingRequest:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  FTMutableStartSpeechTranslationLoggingRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  FTMutableSpeechTranslationStreamingRequest *v18;
  _QWORD v19[5];
  uint8_t buf[16];

  v5 = a3;
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Start speech senses logging request", buf, 2u);
  }
  -[_LTLoggingRequestHandler mtAppService](self, "mtAppService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60___LTLoggingRequestHandler_startSpeechSensesLoggingRequest___block_invoke_2;
  v19[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v19[4] = a2;
  objc_msgSend(v7, "performSpeechTranslationWithDelegate:requestBuilder:completion:", self, &__block_literal_global_13_0, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(FTMutableStartSpeechTranslationLoggingRequest);
  objc_msgSend(v5, "conversationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setConversation_id:](v9, "setConversation_id:", v10);

  objc_msgSend(v5, "requestID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setRequest_id:](v9, "setRequest_id:", v11);

  objc_msgSend(v5, "senses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setSenses:](v9, "setSenses:", v12);

  objc_msgSend(v5, "userInteractedSenses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v5, "userInteractedSenses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
  }
  else
  {
    objc_msgSend(v5, "senses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setUser_selected_sense:](v9, "setUser_selected_sense:", v16);

  objc_msgSend(v5, "userInteractedSenses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationLoggingRequest setUser_interacted_senses:](v9, "setUser_interacted_senses:", v17);

  v18 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  -[FTMutableSpeechTranslationStreamingRequest setContentAsFTStartSpeechTranslationLoggingRequest:](v18, "setContentAsFTStartSpeechTranslationLoggingRequest:", v9);
  objc_msgSend(v8, "sendSpeechTranslationStreamingRequest:", v18);
  objc_msgSend(v8, "closeStream");

}

- (void)startSafariLatencyLoggingRequest:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[16];

  v3 = a3;
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Start Safari latency logging request", buf, 2u);
  }
  v6 = v3;
  v5 = v3;
  AnalyticsSendEventLazy();

}

- (void)startSafariFeedbackRequest:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  FTMutableBatchTranslationFeedbackRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  FTMutableBatchTranslationStreamingRequest *v29;
  size_t v30;
  _QWORD v31[5];
  uint8_t buf[4104];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Start Safari feedback request", buf, 2u);
  }
  -[_LTLoggingRequestHandler mtAppService](self, "mtAppService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __55___LTLoggingRequestHandler_startSafariFeedbackRequest___block_invoke_2;
  v31[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v31[4] = a2;
  objc_msgSend(v7, "performBatchTranslationWithDelegate:requestBuilder:completion:", self, &__block_literal_global_16, v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(FTMutableBatchTranslationFeedbackRequest);
  objc_msgSend(v5, "sourceContentAsJSON");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setSource_content:](v9, "setSource_content:", v10);

  objc_msgSend(v5, "targetContentAsJSON");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setTranslated_content:](v9, "setTranslated_content:", v11);

  objc_msgSend(v5, "webpageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setUrl:](v9, "setUrl:", v13);

  v14 = objc_msgSend(v5, "category");
  objc_msgSend(v5, "errorsAsJSON");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTLoggingRequestHandler combineFeedbackCategory:andErrors:](self, "combineFeedbackCategory:andErrors:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setErrors:](v9, "setErrors:", v16);

  objc_msgSend(v5, "sessionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setSession_id:](v9, "setSession_id:", v17);

  objc_msgSend(v5, "localePair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sourceLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localeIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setSource_language:](v9, "setSource_language:", v20);

  objc_msgSend(v5, "localePair");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "targetLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localeIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setTarget_language:](v9, "setTarget_language:", v23);

  objc_msgSend(v5, "safariVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setSafari_version:](v9, "setSafari_version:", v24);

  objc_msgSend(v5, "clientBundleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[FTMutableBatchTranslationFeedbackRequest setApp_id:](v9, "setApp_id:", v25);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "operatingSystemVersionString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setOs_version:](v9, "setOs_version:", v27);

  v30 = 4096;
  sysctlbyname("hw.machine", buf, &v30, 0, 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationFeedbackRequest setDevice_type:](v9, "setDevice_type:", v28);

  v29 = objc_alloc_init(FTMutableBatchTranslationStreamingRequest);
  -[FTMutableBatchTranslationStreamingRequest setContentAsFTBatchTranslationFeedbackRequest:](v29, "setContentAsFTBatchTranslationFeedbackRequest:", v9);
  objc_msgSend(v8, "sendBatchTranslationStreamingRequest:", v29);
  objc_msgSend(v8, "closeStream");

}

- (id)combineFeedbackCategory:(int64_t)a3 andErrors:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v7)
  {
    v8 = v7;
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTLoggingRequestHandler combineFeedbackCategory:andErrors:].cold.2();
    v10 = v4;
  }
  else
  {
    _LTFeedbackCategoryString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("category");
    v19[1] = CFSTR("errors");
    v20[0] = v11;
    v20[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v12, 0, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v8)
    {
      v14 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_LTLoggingRequestHandler combineFeedbackCategory:andErrors:].cold.1();
      v15 = v4;
    }
    else
    {
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
    }
    v10 = v15;

  }
  return v10;
}

- (void)streamDidReceiveSpeechTranslationStreamingResponse:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "content_type") == 6)
  {
    objc_msgSend(v3, "contentAsFTFinalBlazarResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      v7 = objc_msgSend(v4, "return_code");
      objc_msgSend(v4, "return_str");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = 67109378;
      v10[1] = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Received speech logging request response: [%d] %@", (uint8_t *)v10, 0x12u);

    }
  }
  else
  {
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTLoggingRequestHandler streamDidReceiveSpeechTranslationStreamingResponse:].cold.1();
  }

}

- (void)streamFailVerifySpeechTranslationStreamingResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_LTLoggingRequestHandler streamFailVerifySpeechTranslationStreamingResponse:].cold.1();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LTSendErrorEvent(v4, v6);

}

- (void)streamDidReceiveBatchTranslationStreamingResponse:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "content_type") == 2)
  {
    objc_msgSend(v3, "contentAsFTFinalBlazarResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      v7 = objc_msgSend(v4, "return_code");
      objc_msgSend(v4, "return_str");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = 67109378;
      v10[1] = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Received safari feedback request response: [%d] %@", (uint8_t *)v10, 0x12u);

    }
  }
  else
  {
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTLoggingRequestHandler streamDidReceiveBatchTranslationStreamingResponse:].cold.1();
  }

}

- (void)streamFailVerifyBatchTranslationStreamingResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_LTLoggingRequestHandler streamFailVerifyBatchTranslationStreamingResponse:].cold.1();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LTSendErrorEvent(v4, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtAppService, 0);
}

- (void)combineFeedbackCategory:andErrors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to serialize dictionary with combined errors and category for Safari feedback into JSON: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)combineFeedbackCategory:andErrors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to de-serialize Safari error string JSON into array: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)streamDidReceiveSpeechTranslationStreamingResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Speech logging request received unexpected response: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)streamFailVerifySpeechTranslationStreamingResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Speech logging request received error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)streamDidReceiveBatchTranslationStreamingResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Safari feedback request received unexpected response: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)streamFailVerifyBatchTranslationStreamingResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Safari feedback request received error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
