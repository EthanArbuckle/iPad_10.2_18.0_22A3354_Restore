@implementation SRUIFStateFeedbackDefaultProvider

- (SRUIFStateFeedbackDefaultProvider)initWithConnection:(id)a3
{
  return -[SRUIFStateFeedbackDefaultProvider initWithConnection:withPlaybackOptions:](self, "initWithConnection:withPlaybackOptions:", a3, 0);
}

- (SRUIFStateFeedbackDefaultProvider)initWithConnection:(id)a3 withPlaybackOptions:(unint64_t)a4
{
  id v6;
  SRUIFStateFeedbackDefaultProvider *v7;
  SRUIFStateFeedbackDefaultProvider *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRUIFStateFeedbackDefaultProvider;
  v7 = -[SRUIFStateFeedbackDefaultProvider init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_connection, v6);
    v8->_options = a4;
    v9 = dispatch_queue_create("com.apple.siri.stateFeedbackProviderQueue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

  }
  return v8;
}

- (id)currentAudioPlaybackRequest
{
  return self->_currentAudioPlaybackRequest;
}

- (id)uuidForFirstDelayTone
{
  return self->_uuidForFirstDelayTone;
}

- (void)playFeedbackForStateFeedbackType:(int64_t)a3 withResponseMode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (a3 == 1)
  {
    -[SRUIFStateFeedbackDefaultProvider _startSuccessFeedback:withCompletion:](self, "_startSuccessFeedback:withCompletion:", v8, v9);
  }
  else if (a3)
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SRUIFStateFeedbackDefaultProvider playFeedbackForStateFeedbackType:withResponseMode:completion:]";
      _os_log_impl(&dword_219F26000, v10, OS_LOG_TYPE_DEFAULT, "%s #statefeedback state feedback type not handled by feedback provier", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    -[SRUIFStateFeedbackDefaultProvider _startDelayFeedbackWithResponseMode:withCompletion:](self, "_startDelayFeedbackWithResponseMode:withCompletion:", v8, v9);
  }

}

- (void)playAudioPlaybackRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  AFAudioPlaybackRequest *v12;
  AFAudioPlaybackRequest *currentAudioPlaybackRequest;
  AFAudioPlaybackRequest *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "itemURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_4:
    v10 = objc_alloc(MEMORY[0x24BE090F0]);
    v11 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke;
    v28[3] = &unk_24DC1A958;
    v29 = v6;
    v12 = (AFAudioPlaybackRequest *)objc_msgSend(v10, "initWithBuilder:", v28);
    currentAudioPlaybackRequest = self->_currentAudioPlaybackRequest;
    self->_currentAudioPlaybackRequest = v12;
    v14 = v12;

    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2;
    v26[3] = &unk_24DC1A980;
    v27 = v7;
    -[SRUIFStateFeedbackDefaultProvider _playAudioPlaybackRequest:completion:](self, "_playAudioPlaybackRequest:completion:", v14, v26);

    goto LABEL_5;
  }
  objc_msgSend(v6, "itemData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_4;
  objc_msgSend(v6, "toneLibraryAlertType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "toneLibraryAlertType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    objc_msgSend(MEMORY[0x24BEB8CA0], "playAlertForType:", v17);
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
  else
  {
    v18 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFStateFeedbackDefaultProvider playAudioPlaybackRequest:completion:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }
LABEL_5:

}

void __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
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
  float v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  objc_msgSend(*(id *)(a1 + 32), "aceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUUID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "itemURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF48]);
    objc_msgSend(*(id *)(a1 + 32), "itemURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

    objc_msgSend(v24, "setItemURL:", v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "itemData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setItemData:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "volume");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "volume");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v24, "setVolume:");

  }
  objc_msgSend(*(id *)(a1 + 32), "fadeInDuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "fadeInDuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v24, "setFadeInDuration:", v16);

  }
  objc_msgSend(*(id *)(a1 + 32), "fadeOutDuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "fadeOutDuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v24, "setFadeOutDuration:", v19);

  }
  objc_msgSend(*(id *)(a1 + 32), "numberOfLoops");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "numberOfLoops");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNumberOfLoops:", objc_msgSend(v21, "integerValue"));

  }
  objc_msgSend(*(id *)(a1 + 32), "hapticLibraryKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "hapticLibraryKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHapticLibraryKey:", v23);

  }
}

void __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);

  v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v12();

}

- (void)cancelFeedback
{
  id WeakRetained;
  NSObject *v4;
  id audioSessionRelinquishBlock;
  AFAudioPlaybackRequest *currentAudioPlaybackRequest;
  NSString *uuidForFirstDelayTone;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_currentAudioPlaybackRequest)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "stopAudioPlaybackRequest:immediately:", self->_currentAudioPlaybackRequest, 0);

    if (self->_audioSessionRelinquishBlock)
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[SRUIFStateFeedbackDefaultProvider cancelFeedback]";
        _os_log_impl(&dword_219F26000, v4, OS_LOG_TYPE_DEFAULT, "%s #statefeedback cancelling feedback, calling audio session relinquish block", (uint8_t *)&v8, 0xCu);
      }
      (*((void (**)(void))self->_audioSessionRelinquishBlock + 2))();
      audioSessionRelinquishBlock = self->_audioSessionRelinquishBlock;
      self->_audioSessionRelinquishBlock = 0;

    }
    currentAudioPlaybackRequest = self->_currentAudioPlaybackRequest;
    self->_currentAudioPlaybackRequest = 0;

    uuidForFirstDelayTone = self->_uuidForFirstDelayTone;
    self->_uuidForFirstDelayTone = 0;

  }
  -[AFWatchdogTimer cancel](self->_delayToneTimer, "cancel");
}

- (void)releaseAudioSessionWithCompletion:(id)a3
{
  AFConnection **p_connection;
  id v4;
  id WeakRetained;

  p_connection = &self->_connection;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "forceAudioSessionInactiveWithOptions:completion:", 0, v4);

}

- (id)uuidForCurrentStateFeedback
{
  return (id)-[AFAudioPlaybackRequest UUID](self->_currentAudioPlaybackRequest, "UUID");
}

- (void)_playFeedbackWithSoundId:(int64_t)a3 hapticLibraryKey:(id)a4 UUID:(id)a5 completion:(id)a6
{
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  AFAudioPlaybackRequest *v17;
  AFAudioPlaybackRequest *currentAudioPlaybackRequest;
  AFAudioPlaybackRequest *v19;
  AFAudioPlaybackRequest *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = (unint64_t)a4;
  v11 = a5;
  v12 = a6;
  if (AFSoundIDGetIsValidAndSpecified())
  {
    objc_msgSend(MEMORY[0x24BE09110], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLForSoundID:", a3);
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (v10 | v14)
  {
    v15 = objc_alloc(MEMORY[0x24BE090F0]);
    v16 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke;
    v24[3] = &unk_24DC1A9A8;
    v25 = (id)v14;
    v26 = v11;
    v27 = (id)v10;
    v17 = (AFAudioPlaybackRequest *)objc_msgSend(v15, "initWithBuilder:", v24);
    currentAudioPlaybackRequest = self->_currentAudioPlaybackRequest;
    self->_currentAudioPlaybackRequest = v17;
    v19 = v17;

    v20 = self->_currentAudioPlaybackRequest;
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke_2;
    v22[3] = &unk_24DC1A980;
    v23 = v12;
    -[SRUIFStateFeedbackDefaultProvider _playAudioPlaybackRequest:completion:](self, "_playAudioPlaybackRequest:completion:", v20, v22);

  }
  else
  {
    v21 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[SRUIFStateFeedbackDefaultProvider _playFeedbackWithSoundId:hapticLibraryKey:UUID:completion:]";
      _os_log_impl(&dword_219F26000, v21, OS_LOG_TYPE_DEFAULT, "%s #statefeedback no audio or haptic specified, visual only feedback", buf, 0xCu);
    }
    if (v12)
      (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);
  }

}

void __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = a1[4];
  v5 = a2;
  objc_msgSend(v5, "setItemURL:", v3);
  objc_msgSend(v5, "setNumberOfLoops:", 0);
  LODWORD(v4) = 1.0;
  objc_msgSend(v5, "setVolume:", v4);
  objc_msgSend(v5, "setFadeOutDuration:", 0.5);
  objc_msgSend(v5, "setUUID:", a1[5]);
  objc_msgSend(v5, "setHapticLibraryKey:", a1[6]);

}

uint64_t __95__SRUIFStateFeedbackDefaultProvider__playFeedbackWithSoundId_hapticLibraryKey_UUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)_playAudioPlaybackRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE092A8]), "initWithBuilder:", &__block_literal_global);
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_2;
  v12[3] = &unk_24DC1AA10;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(WeakRetained, "acquireAudioSessionWithContext:completion:", v8, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setReason:", 3);
  objc_msgSend(v2, "setOptions:", 2);

}

void __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  id *WeakRetained;
  void *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (os_log_t *)MEMORY[0x24BE08FB0];
    v10 = (void *)*MEMORY[0x24BE08FB0];
    v11 = *MEMORY[0x24BE08FB0];
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_2_cold_1(v10, v5);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v10;
        v17 = 136315394;
        v18 = "-[SRUIFStateFeedbackDefaultProvider _playAudioPlaybackRequest:completion:]_block_invoke";
        v19 = 1024;
        v20 = objc_msgSend(v5, "audioSessionID");
        _os_log_impl(&dword_219F26000, v12, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Acquired Audio Session: %d", (uint8_t *)&v17, 0x12u);

      }
      if (WeakRetained[2])
      {
        v13 = objc_loadWeakRetained(WeakRetained + 1);
        objc_msgSend(v13, "startAudioPlaybackRequest:options:completion:", *(_QWORD *)(a1 + 32), WeakRetained[3], *(_QWORD *)(a1 + 40));

        v14 = MEMORY[0x220736DE0](v6);
        v15 = WeakRetained[4];
        WeakRetained[4] = (id)v14;

      }
      else
      {
        v16 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315138;
          v18 = "-[SRUIFStateFeedbackDefaultProvider _playAudioPlaybackRequest:completion:]_block_invoke";
          _os_log_impl(&dword_219F26000, v16, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Relinquishing audio session as there is no active audio playback request anymore", (uint8_t *)&v17, 0xCu);
        }
        v6[2](v6);
      }
    }
  }

}

- (void)_startSuccessFeedback:(id)a3 withCompletion:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = AFSoundIDGetFromName();
  if (AFDeviceSupportsSystemAssistantExperience() && v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFStateFeedbackDefaultProvider _playFeedbackWithSoundId:hapticLibraryKey:UUID:completion:](self, "_playFeedbackWithSoundId:hapticLibraryKey:UUID:completion:", v5, CFSTR("TestPattern01"), v7, v8);

  }
}

- (void)_startDelayFeedbackWithResponseMode:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  int v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (AFDeviceSupportsSystemAssistantExperience())
  {
    v10 = AFSoundIDGetFromName();
    if (v10)
      v11 = v10;
    else
      v11 = 8;
  }
  else
  {
    v11 = 8;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE827C8]) & 1) == 0
    && (!AFIsNano() || !objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE827C0])))
  {
    objc_storeStrong((id *)&self->_uuidForFirstDelayTone, v9);
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke;
    v12[3] = &unk_24DC1AAA0;
    objc_copyWeak(v15, &location);
    v16 = 1076887552;
    v15[1] = (id)v11;
    v13 = 0;
    v14 = v7;
    -[SRUIFStateFeedbackDefaultProvider _playFeedbackWithSoundId:hapticLibraryKey:UUID:completion:](self, "_playFeedbackWithSoundId:hapticLibraryKey:UUID:completion:", v11, 0, v9, v12);

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    -[SRUIFStateFeedbackDefaultProvider _startDelayFeedbackWithResponseMode:withCompletion:].cold.1();
    if (!v7)
      goto LABEL_13;
    goto LABEL_9;
  }
  if (v7)
LABEL_9:
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
LABEL_13:

}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_cold_1();
    }
    else if (a2 != 1)
    {
      v7 = objc_alloc(MEMORY[0x24BE093A8]);
      v8 = *(float *)(a1 + 64);
      v9 = *((_QWORD *)WeakRetained + 7);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_17;
      v20[3] = &unk_24DC1AA78;
      v10 = *(_QWORD *)(a1 + 56);
      v20[4] = WeakRetained;
      v22 = v10;
      v21 = *(id *)(a1 + 32);
      v11 = objc_msgSend(v7, "initWithTimeoutInterval:onQueue:timeoutHandler:", v9, v20, v8);
      v12 = (void *)*((_QWORD *)WeakRetained + 5);
      *((_QWORD *)WeakRetained + 5) = v11;

      v13 = (void *)*((_QWORD *)WeakRetained + 2);
      if (v13
        && (objc_msgSend(v13, "UUID"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isEqualToString:", *((_QWORD *)WeakRetained + 6)),
            v14,
            v15))
      {
        v16 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(float *)(a1 + 64);
          *(_DWORD *)buf = 136315394;
          v24 = "-[SRUIFStateFeedbackDefaultProvider _startDelayFeedbackWithResponseMode:withCompletion:]_block_invoke";
          v25 = 2048;
          v26 = v17;
          _os_log_impl(&dword_219F26000, v16, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Starting timer for second delay tone for %f seconds", buf, 0x16u);
        }
        objc_msgSend(*((id *)WeakRetained + 5), "start");
      }
      else
      {
        v18 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[SRUIFStateFeedbackDefaultProvider _startDelayFeedbackWithResponseMode:withCompletion:]_block_invoke";
          _os_log_impl(&dword_219F26000, v18, OS_LOG_TYPE_DEFAULT, "%s #statefeedback Not playing second delay tone, delay feedback has been cancelled", buf, 0xCu);
        }
      }

    }
    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
      (*(void (**)(uint64_t, uint64_t, id))(v19 + 16))(v19, a2, v5);
  }

}

uint64_t __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playFeedbackWithSoundId:hapticLibraryKey:UUID:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, &__block_literal_global_19);
}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (v3 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_2_cold_1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuidForFirstDelayTone, 0);
  objc_storeStrong((id *)&self->_delayToneTimer, 0);
  objc_storeStrong(&self->_audioSessionRelinquishBlock, 0);
  objc_storeStrong((id *)&self->_currentAudioPlaybackRequest, 0);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)playAudioPlaybackRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s Failed to play SAUIPlayAudioCommand, illformed command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __73__SRUIFStateFeedbackDefaultProvider_playAudioPlaybackRequest_completion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s Failed to play SAUIPlayAudioCommand, illformed command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __74__SRUIFStateFeedbackDefaultProvider__playAudioPlaybackRequest_completion___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_219F26000, v3, v5, "%s #statefeedback Failed to acquire Audio Session for playback with error: %@", (uint8_t *)v6);

}

- (void)_startDelayFeedbackWithResponseMode:withCompletion:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_219F26000, v0, OS_LOG_TYPE_DEBUG, "%s #statefeedback Stripping delay tone sound for response mode: %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_219F26000, v0, v1, "%s #statefeedback Failed to play first delay tone: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1_0();
}

void __88__SRUIFStateFeedbackDefaultProvider__startDelayFeedbackWithResponseMode_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_219F26000, v0, v1, "%s #statefeedback Failed to play second delay tone: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1_0();
}

@end
