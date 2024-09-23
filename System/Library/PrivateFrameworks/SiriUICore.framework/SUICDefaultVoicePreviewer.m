@implementation SUICDefaultVoicePreviewer

- (void)previewVoice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SiriTTSServiceSession *v9;
  SiriTTSServiceSession *session;
  NSMutableSet *v11;
  NSMutableSet *previewSessions;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SiriTTSServiceSession *v20;
  uint64_t v21;
  id v22;
  id v23;
  id WeakRetained;
  void *v25;
  NSTimer *v26;
  NSTimer *outputAudioPowerUpdater;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[SUICDefaultVoicePreviewer previewVoice:completion:]";
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_1A3752000, v8, OS_LOG_TYPE_DEFAULT, "%s Requesting to play voice preview for : %@", buf, 0x16u);
  }
  -[NSTimer invalidate](self->_outputAudioPowerUpdater, "invalidate");
  if (!self->previewSessions)
  {
    v9 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x1E0DA78E8]);
    session = self->_session;
    self->_session = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    previewSessions = self->previewSessions;
    self->previewSessions = v11;

  }
  v13 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](self->previewSessions, "addObject:", v14);
  v15 = objc_alloc(MEMORY[0x1E0DA7908]);
  objc_msgSend(v6, "languageCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithLanguage:name:", v16, v17);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78E0]), "initWithVoice:previewType:", v18, 1);
  objc_storeStrong((id *)&self->_lastRequest, v19);
  v20 = self->_session;
  v21 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke;
  v30[3] = &unk_1E4A55178;
  objc_copyWeak(&v33, &location);
  v22 = v14;
  v31 = v22;
  v23 = v7;
  v32 = v23;
  -[SiriTTSServiceSession speakWithPreviewRequest:didFinish:](v20, "speakWithPreviewRequest:didFinish:", v19, v30);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v25 = (void *)MEMORY[0x1E0C99E88];
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_3;
    v28[3] = &unk_1E4A551A0;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v25, "scheduledTimerWithTimeInterval:repeats:block:", 1, v28, 0.0166666667);
    v26 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    outputAudioPowerUpdater = self->_outputAudioPowerUpdater;
    self->_outputAudioPowerUpdater = v26;

    objc_destroyWeak(&v29);
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  _QWORD block[4];
  void (**v9)(_QWORD);
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SUICDefaultVoicePreviewer previewVoice:completion:]_block_invoke";
    v17 = 1024;
    v18 = v3 == 0;
    _os_log_impl(&dword_1A3752000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully: %d", buf, 0x12u);
  }
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_5;
  v10[3] = &unk_1E4A55150;
  objc_copyWeak(&v14, a1 + 6);
  v11 = a1[4];
  v13 = a1[5];
  v6 = v3;
  v12 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1A8593D14](v10);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v7[2](v7);
  }
  else
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_2;
    block[3] = &unk_1E4A54C70;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_destroyWeak(&v14);

}

void __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      (*(void (**)(uint64_t, BOOL, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 40) == 0, 0);
      v3 = v5;
    }
  }

}

uint64_t __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "audioPowerUpdaterDidFire:", v3);
  else
    objc_msgSend(v3, "invalidate");

}

- (void)audioPowerUpdaterDidFire:(id)a3
{
  id v4;
  SiriTTSServiceSession *session;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  session = self->_session;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke;
  v7[3] = &unk_1E4A551F0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[SiriTTSServiceSession getAudioPower:](session, "getAudioPower:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  _QWORD block[4];
  void (**v9)(_QWORD);
  _QWORD v10[5];
  float v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_2;
    v10[3] = &unk_1E4A551C8;
    v10[4] = WeakRetained;
    v11 = a2;
    v7 = (void (**)(_QWORD))MEMORY[0x1A8593D14](v10);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v7[2](v7);
    }
    else
    {
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_3;
      block[3] = &unk_1E4A54C70;
      v9 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    objc_msgSend(v5, "audioPowerUpdaterDidUpdate:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

void __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_2(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "voicePreviewerAudioOutputDidChangePowerLevel:", v2);

}

uint64_t __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)audioPowerUpdaterDidUpdate:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSMutableSet count](self->previewSessions, "count"))
    objc_msgSend(v4, "invalidate");

}

- (void)stopVoicePreview
{
  if (self->_lastRequest)
    -[SiriTTSServiceSession cancelWithRequest:](self->_session, "cancelWithRequest:");
}

- (void)dealloc
{
  objc_super v3;

  -[SUICDefaultVoicePreviewer stopVoicePreview](self, "stopVoicePreview");
  v3.receiver = self;
  v3.super_class = (Class)SUICDefaultVoicePreviewer;
  -[SUICDefaultVoicePreviewer dealloc](&v3, sel_dealloc);
}

- (SUICVoicePreviewingDelegate)delegate
{
  return (SUICVoicePreviewingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->previewSessions, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerUpdater, 0);
}

@end
