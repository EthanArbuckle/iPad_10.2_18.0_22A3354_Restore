@implementation VSServerTTSClient

+ (BOOL)shouldUseServerTTSForRequest:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  BOOL v8;
  void *v9;
  int v10;
  const char *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableServerTTS");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "forceServerTTS");

    if (v10)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      v8 = 1;
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_31;
      LOWORD(v29) = 0;
      v11 = "forceServerTTS is enabled by user default, force server TTS";
LABEL_12:
      _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v29, 2u);
      goto LABEL_31;
    }
    if (objc_msgSend(v3, "forceServerTTS"))
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      v8 = 1;
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_31;
      LOWORD(v29) = 0;
      v11 = "forceServerTTS is enabled by speech request, force server TTS";
      goto LABEL_12;
    }
    +[VSSpeechCache defaultCacheStore](VSSpeechCache, "defaultCacheStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPreinstalledCacheAvailableForRequest:", v3);

    if (v13)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_5;
      LOWORD(v29) = 0;
      v7 = "Preinstalled cache is found, disable server TTS";
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "voiceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectVoiceForLang:name:type:gender:footprint:", v15, v16, objc_msgSend(v3, "voiceType"), objc_msgSend(v3, "gender"), objc_msgSend(v3, "footprint"));
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject voiceData](v6, "voiceData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "type") == 4)
    {
      v18 = objc_msgSend(MEMORY[0x24BEC0DA8], "isNeuralFallbackCondition");

      if ((v18 & 1) == 0)
      {
        VSGetLogDefault();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_21AA84000, v19, OS_LOG_TYPE_INFO, "Neural voice is found on device without fallback condition, disable server TTS", (uint8_t *)&v29, 2u);
        }
        goto LABEL_29;
      }
    }
    else
    {

    }
    +[VSCachingService standardService](VSCachingService, "standardService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shortTermCacheForHash:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      VSGetLogDefault();
      v19 = objc_claimAutoreleasedReturnValue();
      v8 = 1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_21AA84000, v19, OS_LOG_TYPE_INFO, "Short term cache is found for the text, use server TTS", (uint8_t *)&v29, 2u);
      }
      goto LABEL_30;
    }
    if (!objc_msgSend(v3, "canUseServerTTS"))
      goto LABEL_5;
    +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allowedAppID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "containsObject:", v25);

    if ((v26 & 1) != 0)
    {
      v8 = 1;
      goto LABEL_31;
    }
    VSGetLogDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "clientBundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v27;
      _os_log_impl(&dword_21AA84000, v19, OS_LOG_TYPE_INFO, "Server TTS is disabled since '%{public}@' is not in the list of allowed apps", (uint8_t *)&v29, 0xCu);

    }
LABEL_29:
    v8 = 0;
LABEL_30:

    goto LABEL_31;
  }
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    v7 = "disableServerTTS is enabled by user default, disable server TTS";
LABEL_4:
    _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v29, 2u);
  }
LABEL_5:
  v8 = 0;
LABEL_31:

  return v8;
}

- (void)ospreyStartSynthesisRequest:(id)a3 responseHandler:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[OPTTSMutableTextToSpeechRequest requestFromVSRequest:](OPTTSMutableTextToSpeechRequest, "requestFromVSRequest:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3142;
  v18[4] = __Block_byref_object_dispose__3143;
  v19 = (id)MEMORY[0x220750D8C](v9);
  +[OspreyTTSService sharedInstance](OspreyTTSService, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76__VSServerTTSClient_ospreyStartSynthesisRequest_responseHandler_completion___block_invoke;
  v14[3] = &unk_24DD8EAD8;
  v17 = v18;
  v12 = v7;
  v15 = v12;
  v13 = v8;
  v16 = v13;
  objc_msgSend(v11, "roundTripTTS:responseHandler:", v10, v14);

  _Block_object_dispose(v18, 8);
}

- (void)ospreyStartStreamingRequest:(id)a3 dataHandler:(id)a4 metaInfoHandler:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[OPTTSMutableTextToSpeechRequest requestFromVSRequest:](OPTTSMutableTextToSpeechRequest, "requestFromVSRequest:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__3142;
  v33[4] = __Block_byref_object_dispose__3143;
  v34 = (id)MEMORY[0x220750D8C](v10);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__3142;
  v31[4] = __Block_byref_object_dispose__3143;
  v32 = (id)MEMORY[0x220750D8C](v12);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4810000000;
  v28 = 0u;
  v29 = 0u;
  v27[3] = &unk_21AAD8ACB;
  v30 = 0;
  +[OspreyTTSService sharedInstance](OspreyTTSService, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke;
  v24[3] = &unk_24DD8EB00;
  v26 = v27;
  v16 = v11;
  v25 = v16;
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_2;
  v19[3] = &unk_24DD8EB28;
  v21 = v27;
  v22 = v33;
  v23 = v31;
  v17 = v13;
  v20 = v17;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_4;
  v18[3] = &unk_24DD8EC68;
  v18[4] = v31;
  objc_msgSend(v14, "streamTTS:beginHandler:chunkHandler:endHandler:completion:", v17, v24, v19, &__block_literal_global_3146, v18);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
}

void __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(v3, "decoder_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioStreamBasicDescription");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = v17;
  v7 = v16;
  *(_OWORD *)(v5 + 32) = v15;
  *(_OWORD *)(v5 + 48) = v7;
  *(_QWORD *)(v5 + 64) = v6;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v3, "meta_info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "voice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vs_voice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "meta_info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vs_voiceResource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "streaming_playback_buffer_size_in_seconds");
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v11, v14);

  }
}

void __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BEC0D78];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(v3, "audio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(v5 + 48);
  v20[0] = *(_OWORD *)(v5 + 32);
  v20[1] = v7;
  v21 = *(_QWORD *)(v5 + 64);
  objc_msgSend(v4, "audioDataWithASBD:rawData:", v20, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "word_timing_info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OPTTSWordTimingInfo vs_wordTimingInfos:withText:](OPTTSWordTimingInfo, "vs_wordTimingInfos:withText:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v12)
      (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v8, v11);
    goto LABEL_6;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("Unable to process audio data.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 600, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v18);

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;
LABEL_6:

  }
}

void __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __76__VSServerTTSClient_ospreyStartSynthesisRequest_responseHandler_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v11 = (void *)MEMORY[0x24BEC0D78];
    objc_msgSend(v5, "decoder_description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "audioStreamBasicDescription");
    }
    else
    {
      v29 = 0;
      v27 = 0u;
      v28 = 0u;
    }
    objc_msgSend(v5, "audio", v27, v28, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "audioDataWithASBD:rawData:", &v27, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "word_timing_info");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "utterance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[OPTTSWordTimingInfo vs_wordTimingInfos:withText:](OPTTSWordTimingInfo, "vs_wordTimingInfos:withText:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *(_QWORD *)(a1 + 40);
      if (v18)
        (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v10, v17);
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v19)
      {
        (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, 0);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = 0;

      }
    }
    else
    {
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v22)
      {
        v10 = 0;
        goto LABEL_17;
      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD0FC8];
      v31 = CFSTR("Unable to process audio data.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 600, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v25);

      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = 0;
    }

LABEL_17:
    goto LABEL_18;
  }
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[VSServerTTSClient ospreyStartSynthesisRequest:responseHandler:completion:]_block_invoke";
    v34 = 2112;
    v35 = v6;
    _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "%s, %@", buf, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;
    goto LABEL_17;
  }
LABEL_18:

}

@end
