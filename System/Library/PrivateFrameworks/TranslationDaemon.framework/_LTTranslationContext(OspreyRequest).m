@implementation _LTTranslationContext(OspreyRequest)

- (id)_ttsVoiceStringWithLocale:()OspreyRequest
{
  void *v0;
  uint64_t v1;
  void *v2;

  _LTLocaleMappedForTTS();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = _LTPreferredVoiceTypeForLocale(v0);
  _LTVoiceTypeRemoteServiceString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (FTMutableSpeechTranslationStreamingRequest)_ospreySpeechTranslationRequestWithHybridEndpointer:()OspreyRequest
{
  FTMutableStartSpeechTranslationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FTMutableTranslationOptions *v11;
  NSObject *v12;
  void *v13;
  FTMutableTranslationLocalePair *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  FTMutableTranslationLocalePair *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  FTMutableStartSpeechRequest *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  FTMutableTranslationRequest *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  FTMutableTextToSpeechRequest *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  FTMutableTextToSpeechRequestMeta *v51;
  void *v52;
  FTMutableTextToSpeechRequest *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  FTMutableTranslationRequest *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  FTMutableTextToSpeechRequestMeta *v66;
  void *v67;
  FTMutableSpeechTranslationStreamingRequest *v68;
  FTMutableStartSpeechTranslationRequest *v70;
  FTMutableTranslationLocalePair *v71;
  FTMutableTranslationOptions *v72;
  void *v73;

  v5 = objc_alloc_init(FTMutableStartSpeechTranslationRequest);
  objc_msgSend(a1, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationRequest setRequest_id:](v5, "setRequest_id:", v7);

  objc_msgSend(a1, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesSessionIDOverride(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationRequest setConversation_id:](v5, "setConversation_id:", v9);

  objc_msgSend(a1, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationRequest setApp_id:](v5, "setApp_id:", v10);

  -[FTMutableStartSpeechTranslationRequest setRestricted_mode:](v5, "setRestricted_mode:", objc_msgSend(a1, "censorSpeech"));
  -[FTMutableStartSpeechTranslationRequest setOpt_in_status:](v5, "setOpt_in_status:", LTDOspreyDataSharingStatus(objc_msgSend(a1, "dataSharingOptInStatus")));
  -[FTMutableStartSpeechTranslationRequest setStreaming_mode:](v5, "setStreaming_mode:", 1);
  v11 = objc_alloc_init(FTMutableTranslationOptions);
  -[FTMutableTranslationOptions setEnable_disambiguation_alternatives:](v11, "setEnable_disambiguation_alternatives:", objc_msgSend(a1, "supportsGenderDisambiguation"));
  -[FTMutableTranslationOptions setDisable_payload_logging:](v11, "setDisable_payload_logging:", LTDDisablePayloadLogging(objc_msgSend(a1, "dataSharingOptInStatus")));
  -[FTMutableStartSpeechTranslationRequest setOptions:](v5, "setOptions:", v11);
  v12 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_LTTranslationContext(OspreyRequest) _ospreySpeechTranslationRequestWithHybridEndpointer:].cold.2(v12);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(FTMutableTranslationLocalePair);
  objc_msgSend(a1, "localePair");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sourceLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_ltLocaleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationLocalePair setSource_locale:](v14, "setSource_locale:", v17);

  objc_msgSend(a1, "localePair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "targetLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_ltLocaleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationLocalePair setTarget_locale:](v14, "setTarget_locale:", v20);

  v71 = v14;
  objc_msgSend(v13, "addObject:", v14);
  v73 = v13;
  if (objc_msgSend(a1, "autodetectLanguage"))
  {
    v21 = objc_alloc_init(FTMutableTranslationLocalePair);
    objc_msgSend(a1, "localePair");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "targetLocale");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_ltLocaleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableTranslationLocalePair setSource_locale:](v21, "setSource_locale:", v24);

    objc_msgSend(a1, "localePair");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sourceLocale");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_ltLocaleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableTranslationLocalePair setTarget_locale:](v21, "setTarget_locale:", v27);

    v13 = v73;
    objc_msgSend(v73, "addObject:", v21);

  }
  -[FTMutableStartSpeechTranslationRequest setTranslation_locale_pairs:](v5, "setTranslation_locale_pairs:", v13);
  v28 = objc_alloc_init(FTMutableStartSpeechRequest);
  objc_msgSend(a1, "uniqueID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechRequest setSpeech_id:](v28, "setSpeech_id:", v30);

  -[FTMutableStartSpeechRequest setTask_name:](v28, "setTask_name:", CFSTR("MtApp"));
  -[FTMutableStartSpeechRequest setCodec:](v28, "setCodec:", 6);
  -[FTMutableStartSpeechRequest setStream_results:](v28, "setStream_results:", 1);
  -[FTMutableStartSpeechRequest setStore_audio:](v28, "setStore_audio:", 1);
  v31 = objc_msgSend(a1, "autoEndpoint");
  -[FTMutableStartSpeechRequest setEnd_point_mode:](v28, "setEnd_point_mode:", v31);
  -[FTMutableStartSpeechRequest setEnable_server_side_endpoint:](v28, "setEnable_server_side_endpoint:", v31);
  -[FTMutableStartSpeechRequest setClient_endpointer_model_version:](v28, "setClient_endpointer_model_version:", CFSTR("1"));
  -[FTMutableStartSpeechRequest setEnable_hybrid_endpoint:](v28, "setEnable_hybrid_endpoint:", v31 & a3);
  -[FTMutableStartSpeechRequest setKeyboard_identifier:](v28, "setKeyboard_identifier:", &stru_251A15610);
  -[FTMutableStartSpeechRequest setInput_origin:](v28, "setInput_origin:", &stru_251A15610);
  -[FTMutableStartSpeechRequest setInitial_recognition_candidate_id:](v28, "setInitial_recognition_candidate_id:", 0);
  -[FTMutableStartSpeechRequest setDisable_auto_punctuation:](v28, "setDisable_auto_punctuation:", 1);
  -[FTMutableStartSpeechTranslationRequest setStart_speech_request:](v5, "setStart_speech_request:", v28);
  v32 = objc_alloc_init(FTMutableTranslationRequest);
  objc_msgSend(a1, "uniqueID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationRequest setSpeech_id:](v32, "setSpeech_id:", v34);

  objc_msgSend(a1, "uniqueID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationRequest setRequest_id:](v32, "setRequest_id:", v36);

  objc_msgSend(a1, "taskHint");
  _LTTranslationModelTaskString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationRequest setTask:](v32, "setTask:", v37);

  -[FTMutableTranslationRequest setOptions:](v32, "setOptions:", v11);
  v38 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    -[_LTTranslationContext(OspreyRequest) _ospreySpeechTranslationRequestWithHybridEndpointer:].cold.1(v38);
  v72 = v11;
  -[FTMutableStartSpeechTranslationRequest setTranslation_request:](v5, "setTranslation_request:", v32);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(FTMutableTextToSpeechRequest);
  objc_msgSend(a1, "uniqueID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setSpeech_id:](v40, "setSpeech_id:", v42);

  objc_msgSend(a1, "uniqueID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setSession_id:](v40, "setSession_id:", v44);

  objc_msgSend(a1, "localePair");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "targetLocale");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_ltLocaleIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setLanguage:](v40, "setLanguage:", v47);

  objc_msgSend(a1, "localePair");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "targetLocale");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ttsVoiceStringWithLocale:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setGender:](v40, "setGender:", v50);

  -[FTMutableTextToSpeechRequest setAudio_type:](v40, "setAudio_type:", 1);
  v51 = objc_alloc_init(FTMutableTextToSpeechRequestMeta);
  objc_msgSend(a1, "clientIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequestMeta setApp_id:](v51, "setApp_id:", v52);

  -[FTMutableTextToSpeechRequestMeta setChannel_type:](v51, "setChannel_type:", 2);
  -[FTMutableTextToSpeechRequest setMeta_info:](v40, "setMeta_info:", v51);
  objc_msgSend(v39, "addObject:", v40);
  if (objc_msgSend(a1, "autodetectLanguage"))
  {
    v53 = objc_alloc_init(FTMutableTextToSpeechRequest);
    objc_msgSend(a1, "uniqueID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    _LTPreferencesRequestIDOverride(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableTextToSpeechRequest setSpeech_id:](v53, "setSpeech_id:", v55);

    objc_msgSend(a1, "uniqueID");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    _LTPreferencesRequestIDOverride(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableTextToSpeechRequest setSession_id:](v53, "setSession_id:", v57);

    objc_msgSend(a1, "localePair");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "sourceLocale");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "_ltLocaleIdentifier");
    v70 = v5;
    v60 = v32;
    v61 = v39;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableTextToSpeechRequest setLanguage:](v53, "setLanguage:", v62);

    objc_msgSend(a1, "localePair");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "sourceLocale");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_ttsVoiceStringWithLocale:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableTextToSpeechRequest setGender:](v53, "setGender:", v65);

    v39 = v61;
    v32 = v60;
    v5 = v70;

    -[FTMutableTextToSpeechRequest setAudio_type:](v53, "setAudio_type:", 1);
    v66 = objc_alloc_init(FTMutableTextToSpeechRequestMeta);
    objc_msgSend(a1, "clientIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableTextToSpeechRequestMeta setApp_id:](v66, "setApp_id:", v67);

    -[FTMutableTextToSpeechRequestMeta setChannel_type:](v66, "setChannel_type:", 2);
    -[FTMutableTextToSpeechRequest setMeta_info:](v53, "setMeta_info:", v66);
    objc_msgSend(v39, "addObject:", v53);

  }
  -[FTMutableStartSpeechTranslationRequest setText_to_speech_requests:](v5, "setText_to_speech_requests:", v39);
  v68 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](v68, "setContent_type:", 1);
  -[FTMutableSpeechTranslationStreamingRequest setContentAsFTStartSpeechTranslationRequest:](v68, "setContentAsFTStartSpeechTranslationRequest:", v5);

  return v68;
}

- (FTMutableSpeechTranslationStreamingRequest)_ospreyTextToSpeechTranslationRequestWithText:()OspreyRequest
{
  id v4;
  FTMutableStartSpeechTranslationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FTMutableTranslationOptions *v11;
  NSObject *v12;
  void *v13;
  FTMutableTranslationLocalePair *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  FTMutableTranslationRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  FTMutableTextToSpeechRequest *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  FTMutableTextToSpeechRequestMeta *v41;
  void *v42;
  FTMutableSpeechTranslationStreamingRequest *v43;
  id v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(FTMutableStartSpeechTranslationRequest);
  objc_msgSend(a1, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationRequest setRequest_id:](v5, "setRequest_id:", v7);

  objc_msgSend(a1, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesSessionIDOverride(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationRequest setConversation_id:](v5, "setConversation_id:", v9);

  objc_msgSend(a1, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableStartSpeechTranslationRequest setApp_id:](v5, "setApp_id:", v10);

  -[FTMutableStartSpeechTranslationRequest setRestricted_mode:](v5, "setRestricted_mode:", objc_msgSend(a1, "censorSpeech"));
  -[FTMutableStartSpeechTranslationRequest setOpt_in_status:](v5, "setOpt_in_status:", LTDOspreyDataSharingStatus(objc_msgSend(a1, "dataSharingOptInStatus")));
  -[FTMutableStartSpeechTranslationRequest setStreaming_mode:](v5, "setStreaming_mode:", 0);
  v11 = objc_alloc_init(FTMutableTranslationOptions);
  -[FTMutableTranslationOptions setEnable_disambiguation_alternatives:](v11, "setEnable_disambiguation_alternatives:", objc_msgSend(a1, "supportsGenderDisambiguation"));
  -[FTMutableTranslationOptions setDisable_payload_logging:](v11, "setDisable_payload_logging:", LTDDisablePayloadLogging(objc_msgSend(a1, "dataSharingOptInStatus")));
  -[FTMutableStartSpeechTranslationRequest setOptions:](v5, "setOptions:", v11);
  v12 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_LTTranslationContext(OspreyRequest) _ospreyTextToSpeechTranslationRequestWithText:].cold.2(v12);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(FTMutableTranslationLocalePair);
  objc_msgSend(a1, "localePair");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sourceLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_ltLocaleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationLocalePair setSource_locale:](v14, "setSource_locale:", v17);

  objc_msgSend(a1, "localePair");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "targetLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_ltLocaleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationLocalePair setTarget_locale:](v14, "setTarget_locale:", v20);

  objc_msgSend(v13, "addObject:", v14);
  v46 = v13;
  -[FTMutableStartSpeechTranslationRequest setTranslation_locale_pairs:](v5, "setTranslation_locale_pairs:", v13);
  v21 = objc_alloc_init(FTMutableTranslationRequest);
  objc_msgSend(a1, "uniqueID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationRequest setSpeech_id:](v21, "setSpeech_id:", v23);

  objc_msgSend(a1, "uniqueID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationRequest setRequest_id:](v21, "setRequest_id:", v25);

  objc_msgSend(a1, "taskHint");
  _LTTranslationModelTaskString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationRequest setTask:](v21, "setTask:", v26);

  v47[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTranslationRequest setTranslation_phrase:](v21, "setTranslation_phrase:", v27);

  -[FTMutableTranslationRequest setIs_partial:](v21, "setIs_partial:", objc_msgSend(a1, "isFinal") ^ 1);
  -[FTMutableTranslationRequest setOptions:](v21, "setOptions:", v11);
  v28 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[_LTTranslationContext(OspreyRequest) _ospreyTextToSpeechTranslationRequestWithText:].cold.1(v28);
  -[FTMutableStartSpeechTranslationRequest setTranslation_request:](v5, "setTranslation_request:", v21, v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(FTMutableTextToSpeechRequest);
  objc_msgSend(a1, "uniqueID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setSpeech_id:](v30, "setSpeech_id:", v32);

  objc_msgSend(a1, "uniqueID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setSession_id:](v30, "setSession_id:", v34);

  objc_msgSend(a1, "localePair");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "targetLocale");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_ltLocaleIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setLanguage:](v30, "setLanguage:", v37);

  objc_msgSend(a1, "localePair");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "targetLocale");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ttsVoiceStringWithLocale:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setGender:](v30, "setGender:", v40);

  -[FTMutableTextToSpeechRequest setAudio_type:](v30, "setAudio_type:", 1);
  v41 = objc_alloc_init(FTMutableTextToSpeechRequestMeta);
  objc_msgSend(a1, "clientIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequestMeta setApp_id:](v41, "setApp_id:", v42);

  -[FTMutableTextToSpeechRequestMeta setChannel_type:](v41, "setChannel_type:", 2);
  -[FTMutableTextToSpeechRequest setMeta_info:](v30, "setMeta_info:", v41);
  objc_msgSend(v29, "addObject:", v30);
  -[FTMutableStartSpeechTranslationRequest setText_to_speech_requests:](v5, "setText_to_speech_requests:", v29);
  v43 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](v43, "setContent_type:", 1);
  -[FTMutableSpeechTranslationStreamingRequest setContentAsFTStartSpeechTranslationRequest:](v43, "setContentAsFTStartSpeechTranslationRequest:", v5);

  return v43;
}

- (FTMutableTextToSpeechRequest)_ospreyTTSRequestWithText:()OspreyRequest
{
  id v4;
  FTMutableTextToSpeechRequest *v5;
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
  void *v16;
  FTMutableTextToSpeechRequestMeta *v17;
  void *v18;

  v4 = a3;
  v5 = objc_alloc_init(FTMutableTextToSpeechRequest);
  -[FTMutableTextToSpeechRequest setText:](v5, "setText:", v4);

  objc_msgSend(a1, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ttsVoiceStringWithLocale:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setGender:](v5, "setGender:", v8);

  objc_msgSend(a1, "localePair");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_ltLocaleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _LTLocaleIdentifierMappedForTTS();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setLanguage:](v5, "setLanguage:", v12);

  -[FTMutableTextToSpeechRequest setAudio_type:](v5, "setAudio_type:", 1);
  objc_msgSend(a1, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesRequestIDOverride(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setSpeech_id:](v5, "setSpeech_id:", v14);

  objc_msgSend(a1, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _LTPreferencesSessionIDOverride(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequest setSession_id:](v5, "setSession_id:", v16);

  -[FTMutableTextToSpeechRequest setEnable_word_timing_info:](v5, "setEnable_word_timing_info:", 1);
  v17 = objc_alloc_init(FTMutableTextToSpeechRequestMeta);
  objc_msgSend(a1, "clientIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableTextToSpeechRequestMeta setApp_id:](v17, "setApp_id:", v18);

  -[FTMutableTextToSpeechRequestMeta setChannel_type:](v17, "setChannel_type:", 2);
  -[FTMutableTextToSpeechRequest setMeta_info:](v5, "setMeta_info:", v17);

  return v5;
}

- (__CFString)redactIfNeeded:()OspreyRequest
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("translate")))
    {
      v5 = v4;
    }
    else
    {
      v5 = CFSTR("<redacted>");
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sequoiaClientHeaderValue
{
  id v2;
  uint32_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v3 = arc4random_uniform(0xAu);
  objc_msgSend(a1, "appIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && v3)
  {
    objc_msgSend(a1, "redactIfNeeded:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  if (v5 && v3)
  {
    objc_msgSend(a1, "redactIfNeeded:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (v4)
    v8 = v4;
  else
    v8 = v5;
  if (v4)
    v9 = v5;
  else
    v9 = 0;
  v10 = v8;
  v11 = v9;
  if (v10)
    objc_msgSend(v2, "appendString:", v10);
  if (v11)
    objc_msgSend(v2, "appendFormat:", CFSTR(" (%@)"), v11);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v2, "appendFormat:", CFSTR("; %@"), v13);
  if (objc_msgSend(a1, "sourceOrigin") == 1)
    objc_msgSend(v2, "appendString:", CFSTR(" | OCR"));
  if (objc_msgSend(a1, "sourceOrigin") == 2)
    objc_msgSend(v2, "appendString:", CFSTR(" | action-button"));
  if (objc_msgSend(a1, "sourceOrigin") == 4)
    objc_msgSend(v2, "appendString:", CFSTR(" | control-center"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_ospreySpeechTranslationRequestWithHybridEndpointer:()OspreyRequest .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_6(a1);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_2491B9000, v2, v3, "Disambiguation: Creating FTMutableTranslationRequest as part of online speech translation request (with ASR input), setting option enable_disambiguation_alternatives: %{BOOL}i", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_6();
}

- (void)_ospreySpeechTranslationRequestWithHybridEndpointer:()OspreyRequest .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_6(a1);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_2491B9000, v2, v3, "Disambiguation: Creating online speech translation request (with ASR input), setting option enable_disambiguation_alternatives: %{BOOL}i", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_6();
}

- (void)_ospreyTextToSpeechTranslationRequestWithText:()OspreyRequest .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_6(a1);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_2491B9000, v2, v3, "Disambiguation: Creating online FTMutableTranslationRequest as part of text-based speech translation request, setting  option enable_disambiguation_alternatives: %{BOOL}i", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_6();
}

- (void)_ospreyTextToSpeechTranslationRequestWithText:()OspreyRequest .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_6(a1);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_2491B9000, v2, v3, "Disambiguation: Creating online speech translation request text-based input, setting option for enable_disambiguation_alternatives: %{BOOL}i", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_6();
}

@end
