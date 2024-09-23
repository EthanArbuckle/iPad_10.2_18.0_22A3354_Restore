@implementation SFSSDeviceTTSTask

- (SFSSDeviceTTSTask)initWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SFSSDeviceTTSTask *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[16];

  v4 = a3;
  SFSSGetLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "Init device tts task.", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)SFSSDeviceTTSTask;
  v6 = -[SFSpeechSynthesisTask initWithRequest:](&v15, sel_initWithRequest_, v4);
  if (v6)
  {
    +[SFSSTTSEngineFactory sharedInstance](SFSSTTSEngineFactory, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "voiceAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resourceAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getEngineByVoiceAsset:resourceAsset:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_ttsEngine, v12);

    -[SFSpeechSynthesisTask instrumentMetrics](v6, "instrumentMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceOfTTS:", 2);

  }
  return v6;
}

- (void)startTask:(id)a3
{
  void (**v4)(id, void *);
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_ttsEngine);
  -[SFSpeechSynthesisTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSpeechSynthesisTask request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPrivate");
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __31__SFSSDeviceTTSTask_startTask___block_invoke;
  v20[3] = &unk_24E246BF0;
  objc_copyWeak(&v21, &location);
  v20[4] = self;
  v15 = v10;
  v16 = 3221225472;
  v17 = __31__SFSSDeviceTTSTask_startTask___block_invoke_12;
  v18 = &unk_24E246C18;
  objc_copyWeak(&v19, &location);
  objc_msgSend(WeakRetained, "synthesizeText:loggable:synthesisBegin:synthesisChunk:synthesisEnd:", v7, v9, v20, &v15, &__block_literal_global_1394);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFSpeechSynthesisTask handleSynthesisEnd:](self, "handleSynthesisEnd:", v11, v15, v16, v17, v18);
  SFSSGetLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SFSpeechSynthesisTask error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v13;
    _os_log_impl(&dword_21E284000, v12, OS_LOG_TYPE_INFO, "Device tts complete. error=%@", buf, 0xCu);

  }
  -[SFSpeechSynthesisTask error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)cancelTask
{
  id v2;

  -[SFSSDeviceTTSTask ttsEngine](self, "ttsEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSynthesis");

}

- (SFSSTTSEngine)ttsEngine
{
  return (SFSSTTSEngine *)objc_loadWeakRetained((id *)&self->_ttsEngine);
}

- (void)setTtsEngine:(id)a3
{
  objc_storeWeak((id *)&self->_ttsEngine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ttsEngine);
}

uint64_t __31__SFSSDeviceTTSTask_startTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[16];

  SFSSGetLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v2, OS_LOG_TYPE_INFO, "Received device tts begin.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "ttsEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "asbd");
  }
  else
  {
    v15 = 0;
    v13 = 0u;
    v14 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "request", v13, v14, v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "voiceAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "voice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleSynthesisBegin:asbd:audioPlaybackBufferDuration:voiceAsset:resourceAsset:", 0, &v13, v8, v11, 0.0);

  return 0;
}

uint64_t __31__SFSSDeviceTTSTask_startTask___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint8_t v8[16];

  v3 = a2;
  SFSSGetLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_21E284000, v4, OS_LOG_TYPE_DEBUG, "Received device tts chunk.", v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "pcmData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handleSynthesisChunks:", v6);
  return 0;
}

uint64_t __31__SFSSDeviceTTSTask_startTask___block_invoke_13()
{
  NSObject *v0;
  uint8_t v2[16];

  SFSSGetLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21E284000, v0, OS_LOG_TYPE_INFO, "Received device tts end.", v2, 2u);
  }

  return 0;
}

@end
