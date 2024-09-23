@implementation SFSSServerTTSTask

- (SFSSServerTTSTask)initWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SFSSServerTTSTask *v6;
  void *v7;
  uint64_t v8;
  void *v9;
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
  uint64_t v20;
  void *v21;
  void *v23;
  objc_super v24;
  uint8_t buf[16];

  v4 = a3;
  SFSSGetLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "Init server tts task.", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)SFSSServerTTSTask;
  v6 = -[SFSpeechSynthesisTask initWithRequest:](&v24, sel_initWithRequest_, v4);
  if (v6)
  {
    objc_msgSend(v4, "voice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "voiceReleaseType");

    if (v8 == 6)
    {
      +[SFSSOspreyTTSClientFactory sharedInstance](SFSSOspreyTTSClientFactory, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "voice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "serverVoiceConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ospreyEndpointUrl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "voice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serverVoiceConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "useBlazar");
      objc_msgSend(v4, "voice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "serverVoiceConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getOspreyClientByUrl:useBlazar:enableAuthentication:", v11, v14, objc_msgSend(v16, "enableAuthentication"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v6->_ospreyTTSClient, v17);

      v18 = v23;
    }
    else
    {
      objc_msgSend(v4, "voice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "voiceReleaseType");

      +[SFSSOspreyTTSClientFactory sharedInstance](SFSSOspreyTTSClientFactory, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFSpeechSynthesisInternalSetting sharedInstance](SFSpeechSynthesisInternalSetting, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "voice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ospreyEndpointURLByType:", objc_msgSend(v10, "voiceReleaseType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == 7)
        objc_msgSend(v9, "getOspreyClientByUrl:useBlazar:enableAuthentication:", v11, 0, 0);
      else
        objc_msgSend(v9, "getOspreyClientByUrl:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v6->_ospreyTTSClient, v12);
    }

    -[SFSpeechSynthesisTask instrumentMetrics](v6, "instrumentMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSourceOfTTS:", 3);

  }
  return v6;
}

- (void)startTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  -[SFSpeechSynthesisTask request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSServerTTSTask createOspreyRequestFromReqeust:](SFSSServerTTSTask, "createOspreyRequestFromReqeust:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFSpeechSynthesisTask request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSServerTTSTask createGrpcHeadersFromRequest:](SFSSServerTTSTask, "createGrpcHeadersFromRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__346;
  v18[4] = __Block_byref_object_dispose__347;
  v19 = (id)MEMORY[0x2207ADF98](v4);
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_ospreyTTSClient);
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __31__SFSSServerTTSTask_startTask___block_invoke;
  v15[3] = &unk_24E2469A8;
  objc_copyWeak(&v16, &location);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __31__SFSSServerTTSTask_startTask___block_invoke_14;
  v13[3] = &unk_24E2469D0;
  objc_copyWeak(&v14, &location);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __31__SFSSServerTTSTask_startTask___block_invoke_18;
  v11[3] = &unk_24E246A38;
  objc_copyWeak(&v12, &location);
  v11[4] = v18;
  objc_msgSend(WeakRetained, "streamTTS:headers:beginHandler:chunkHandler:endHandler:completion:", v6, v8, v15, v13, &__block_literal_global_348, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v18, 8);

}

- (void)cancelTask
{
  NSObject *v2;
  uint8_t v3[16];

  SFSSGetLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_21E284000, v2, OS_LOG_TYPE_DEBUG, "Server Task cancelled.", v3, 2u);
  }

}

- (SFSSOspreyTTSClient)ospreyTTSClient
{
  return (SFSSOspreyTTSClient *)objc_loadWeakRetained((id *)&self->_ospreyTTSClient);
}

- (void)setOspreyTTSClient:(id)a3
{
  objc_storeWeak((id *)&self->_ospreyTTSClient, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ospreyTTSClient);
}

void __31__SFSSServerTTSTask_startTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  _OWORD v15[2];
  uint64_t v16;
  uint8_t buf[16];
  __int128 v18;
  uint64_t v19;

  v3 = a2;
  SFSSGetLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v4, OS_LOG_TYPE_INFO, "Received streaming begin response.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v19 = 0;
  *(_OWORD *)buf = 0u;
  v18 = 0u;
  objc_msgSend(v3, "decoder_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSServerTTSTask audioStreamBasicDescription:](SFSSServerTTSTask, "audioStreamBasicDescription:", v6);

  objc_msgSend(v3, "meta_info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "voice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSServerTTSTask generateVoiceAssetFromVoiceMetaInfo:](SFSSServerTTSTask, "generateVoiceAssetFromVoiceMetaInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "meta_info");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSServerTTSTask generateResourceAssetFromResourceMetaInfo:](SFSSServerTTSTask, "generateResourceAssetFromResourceMetaInfo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "streaming_playback_buffer_size_in_seconds");
  v14 = v13;

  v15[0] = *(_OWORD *)buf;
  v15[1] = v18;
  v16 = v19;
  objc_msgSend(WeakRetained, "handleSynthesisBegin:asbd:audioPlaybackBufferDuration:voiceAsset:resourceAsset:", 0, v15, v9, v12, v14);

}

void __31__SFSSServerTTSTask_startTask___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SFSSGetLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67109120;
    v12[1] = objc_msgSend(v3, "current_pkt_number");
    _os_log_debug_impl(&dword_21E284000, v4, OS_LOG_TYPE_DEBUG, "Received streaming partial response. pkt_number=%d", (uint8_t *)v12, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "audio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleSynthesisChunks:", v6);

  objc_msgSend(WeakRetained, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "returnFrontEndFeature");

  if (v8)
  {
    objc_msgSend(v3, "feature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "phoneme_sequence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFSSServerTTSTask flatPhonemeSequence:](SFSSServerTTSTask, "flatPhonemeSequence:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handleSynthesisFrontendFeaturePhoneme:", v11);

  }
}

void __31__SFSSServerTTSTask_startTask___block_invoke_18(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "handleSynthesisEnd:", v4);

  SFSSGetLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_21E284000, v6, OS_LOG_TYPE_INFO, "Server tts complete. error=%@", (uint8_t *)&v12, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v8)
  {
    objc_msgSend(WeakRetained, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
}

void __31__SFSSServerTTSTask_startTask___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = objc_msgSend(v2, "total_pkt_number");
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Received streaming end response. total_pkt=%d", (uint8_t *)v4, 8u);
  }

}

+ (id)generateVoiceAssetFromVoiceMetaInfo:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  SFSSVoiceAsset *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "gender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SFSpeechSynthesisUtils genderFromString:](SFSpeechSynthesisUtils, "genderFromString:", v4);

  objc_msgSend(v3, "quality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SFSpeechSynthesisUtils footprintFromString:](SFSpeechSynthesisUtils, "footprintFromString:", v6);

  objc_msgSend(v3, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[SFSpeechSynthesisUtils typeFromString:](SFSpeechSynthesisUtils, "typeFromString:", v8);

  v10 = [SFSSVoiceAsset alloc];
  objc_msgSend(v3, "language");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SFSSVoiceAsset init:gender:name:type:footprint:contentVersion:](v10, "init:gender:name:type:footprint:contentVersion:", v11, v5, v12, v9, v7, objc_msgSend(v13, "integerValue"));
  return v14;
}

+ (id)generateResourceAssetFromResourceMetaInfo:(id)a3
{
  id v3;
  SFSSResourceAsset *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = [SFSSResourceAsset alloc];
  objc_msgSend(v3, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SFSSResourceAsset init:contentVersion:](v4, "init:contentVersion:", v5, objc_msgSend(v6, "integerValue"));
  return v7;
}

+ (id)generateProsodyTransferConfig:(id)a3
{
  id v3;
  QSSMutableTextToSpeechRequestProsodyTransferConfig *v4;
  QSSMutableTextToSpeechSpeechFeatureInputWave *v5;
  QSSMutableTextToSpeechUserVoiceProfile *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v3 = a3;
  v4 = objc_alloc_init(QSSMutableTextToSpeechRequestProsodyTransferConfig);
  v5 = objc_alloc_init(QSSMutableTextToSpeechSpeechFeatureInputWave);
  v6 = objc_alloc_init(QSSMutableTextToSpeechUserVoiceProfile);
  objc_msgSend(v3, "prosodyTransferData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userVoiceProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pitch_mean");
  -[QSSMutableTextToSpeechUserVoiceProfile setPitch_mean:](v6, "setPitch_mean:");

  objc_msgSend(v3, "prosodyTransferData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userVoiceProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pitch_std");
  -[QSSMutableTextToSpeechUserVoiceProfile setPitch_std:](v6, "setPitch_std:");

  objc_msgSend(v3, "prosodyTransferData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userVoiceProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "energy_mean");
  -[QSSMutableTextToSpeechUserVoiceProfile setEnergy_mean:](v6, "setEnergy_mean:");

  objc_msgSend(v3, "prosodyTransferData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userVoiceProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "energy_std");
  -[QSSMutableTextToSpeechUserVoiceProfile setEnergy_std:](v6, "setEnergy_std:");

  objc_msgSend(v3, "prosodyTransferData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userVoiceProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "duration_mean");
  -[QSSMutableTextToSpeechUserVoiceProfile setDuration_mean:](v6, "setDuration_mean:");

  objc_msgSend(v3, "prosodyTransferData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userVoiceProfile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "duration_std");
  -[QSSMutableTextToSpeechUserVoiceProfile setDuration_std:](v6, "setDuration_std:");

  objc_msgSend(v3, "prosodyTransferData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "waveData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableTextToSpeechSpeechFeatureInputWave setPcm_data:](v5, "setPcm_data:", v20);

  objc_msgSend(v3, "prosodyTransferData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "asbd");
    v23 = (int)*(double *)&v27;
  }
  else
  {
    v23 = 0;
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
  }
  -[QSSMutableTextToSpeechSpeechFeatureInputWave setSample_rate:](v5, "setSample_rate:", v23, v27, v28, v29);

  -[QSSMutableTextToSpeechRequestProsodyTransferConfig setWave_data:](v4, "setWave_data:", v5);
  -[QSSMutableTextToSpeechRequestProsodyTransferConfig setUser_voice_profile:](v4, "setUser_voice_profile:", v6);
  objc_msgSend(v3, "prosodyTransferData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "userVoiceProfileUrl");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableTextToSpeechRequestProsodyTransferConfig setUser_voice_profile_url:](v4, "setUser_voice_profile_url:", v25);

  return v4;
}

+ (id)createOspreyRequestFromReqeust:(id)a3
{
  id v3;
  QSSMutableStartTextToSpeechStreamingRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  QSSMutableTextToSpeechRequestMeta *v11;
  void *v12;
  void *v13;
  QSSMutableTTSRequestFeatureFlags *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(QSSMutableStartTextToSpeechStreamingRequest);
  objc_msgSend(v3, "requestIdentifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableStartTextToSpeechStreamingRequest setSession_id:](v4, "setSession_id:", v5);

  objc_msgSend(v3, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableStartTextToSpeechStreamingRequest setLanguage:](v4, "setLanguage:", v7);

  objc_msgSend(v3, "gender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableStartTextToSpeechStreamingRequest setGender:](v4, "setGender:", v8);

  objc_msgSend(v3, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableStartTextToSpeechStreamingRequest setText:](v4, "setText:", v9);

  -[QSSMutableStartTextToSpeechStreamingRequest setAudio_type:](v4, "setAudio_type:", 1);
  -[QSSMutableStartTextToSpeechStreamingRequest setEnable_word_timing_info:](v4, "setEnable_word_timing_info:", 0);
  objc_msgSend(v3, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableStartTextToSpeechStreamingRequest setVoice_name:](v4, "setVoice_name:", v10);

  v11 = objc_alloc_init(QSSMutableTextToSpeechRequestMeta);
  objc_msgSend(v3, "clientBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableTextToSpeechRequestMeta setApp_id:](v11, "setApp_id:", v12);

  -[QSSMutableTextToSpeechRequestMeta setChannel_type:](v11, "setChannel_type:", 2);
  -[QSSMutableTextToSpeechRequestMeta setIs_synthesis:](v11, "setIs_synthesis:", objc_msgSend(v3, "type") == 1);
  -[QSSMutableStartTextToSpeechStreamingRequest setMeta_info:](v4, "setMeta_info:", v11);
  objc_msgSend(v3, "voice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QSSMutableStartTextToSpeechStreamingRequest setPreferred_voice_type:](v4, "setPreferred_voice_type:", +[SFSSServerTTSTask convertVoiceTypeToServerType:](SFSSServerTTSTask, "convertVoiceTypeToServerType:", objc_msgSend(v13, "voiceType")));

  v14 = objc_alloc_init(QSSMutableTTSRequestFeatureFlags);
  -[QSSMutableTTSRequestFeatureFlags setFe_feature:](v14, "setFe_feature:", objc_msgSend(v3, "returnFrontEndFeature"));
  -[QSSMutableTTSRequestFeatureFlags setPhoneset_type:](v14, "setPhoneset_type:", +[SFSSServerTTSTask convertPhoneSetTypeToServerPhoneSetType:](SFSSServerTTSTask, "convertPhoneSetTypeToServerPhoneSetType:", objc_msgSend(v3, "phoneSetType")));
  -[QSSMutableStartTextToSpeechStreamingRequest setFeature_flags:](v4, "setFeature_flags:", v14);
  +[SFSSServerTTSTask generateProsodyTransferConfig:](SFSSServerTTSTask, "generateProsodyTransferConfig:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[QSSMutableStartTextToSpeechStreamingRequest setProsody_config:](v4, "setProsody_config:", v15);
  return v4;
}

+ (id)createGrpcHeadersFromRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "devServiceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v8 = CFSTR("tts-dev-proxy-service-name");
    objc_msgSend(v3, "devServiceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v6;
}

+ (AudioStreamBasicDescription)audioStreamBasicDescription:(SEL)a3
{
  id v5;
  Float64 v6;
  UInt32 v7;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  v5 = a4;
  retstr->mFormatID = objc_msgSend(v5, "format_id");
  objc_msgSend(v5, "sample_rate");
  retstr->mSampleRate = v6;
  retstr->mFormatFlags = objc_msgSend(v5, "format_flags");
  retstr->mBytesPerPacket = objc_msgSend(v5, "bytes_per_packet");
  retstr->mFramesPerPacket = objc_msgSend(v5, "frames_per_packet");
  retstr->mBytesPerFrame = objc_msgSend(v5, "bytes_per_frame");
  retstr->mChannelsPerFrame = objc_msgSend(v5, "channels_per_frame");
  retstr->mBitsPerChannel = objc_msgSend(v5, "bits_per_channel");
  v7 = objc_msgSend(v5, "reserved");

  retstr->mReserved = v7;
  return result;
}

+ (int64_t)convertPhoneSetTypeToServerPhoneSetType:(int64_t)a3
{
  return a3 == 1;
}

+ (int64_t)convertVoiceTypeToServerType:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 3;
}

+ (id)flatPhonemeSequence:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v31;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v6, "word_phonemes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
              v22 = 0u;
              v23 = 0u;
              v24 = 0u;
              v25 = 0u;
              objc_msgSend(v12, "phonemes");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v23;
                do
                {
                  v17 = 0;
                  do
                  {
                    if (*(_QWORD *)v23 != v16)
                      objc_enumerationMutation(v13);
                    objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17++));
                  }
                  while (v15 != v17);
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
                }
                while (v15);
              }

              ++v11;
            }
            while (v11 != v9);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v21);
  }

  return v4;
}

@end
