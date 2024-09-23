@implementation VSSpeechSynthesizer

- (void)playVoicePreviewForLanguageCode:(id)a3 voiceName:(id)a4 previewType:(int64_t)a5 completion:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  SiriTTSDaemonSession *proxySession;
  id v17;
  _QWORD v18[5];
  id v19;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0DA7900];
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithLanguage:name:", v13, v12);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78D8]), "initWithVoice:previewType:", v14, a5);
  -[VSSpeechSynthesizer setIsPlayingPreview:](self, "setIsPlayingPreview:", v15);
  proxySession = self->_proxySession;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__VSSpeechSynthesizer_playVoicePreviewForLanguageCode_voiceName_previewType_completion___block_invoke;
  v18[3] = &unk_1EA8AF9E8;
  v18[4] = self;
  v19 = v10;
  v17 = v10;
  -[SiriTTSDaemonSession speakWithPreviewRequest:didFinish:](proxySession, "speakWithPreviewRequest:didFinish:", v15, v18);

}

- (void)stopPlayingVoicePreview
{
  SiriTTSDaemonSession *proxySession;
  id v3;

  proxySession = self->_proxySession;
  -[VSSpeechSynthesizer isPlayingPreview](self, "isPlayingPreview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriTTSDaemonSession cancelWithRequest:](proxySession, "cancelWithRequest:", v3);

}

- (VSSpeechSynthesizer)init
{
  return -[VSSpeechSynthesizer initWithAccessoryID:](self, "initWithAccessoryID:", 0);
}

- (VSSpeechSynthesizer)initWithAccessoryID:(id)a3
{
  id v4;
  char *v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  void *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  VSSpeechConnection *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  objc_super v43;
  uint8_t buf[4];
  __CFString *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)VSSpeechSynthesizer;
  v5 = -[VSSpeechSynthesizer init](&v43, sel_init);
  if (!v5)
    goto LABEL_20;
  v6 = dispatch_queue_create("VSSpeechSynthesizer", 0);
  v7 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v6;

  v8 = dispatch_queue_create("VSSpeechSynthesizerCallbackThread", 0);
  v9 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v8;

  dispatch_set_target_queue(*((dispatch_object_t *)v5 + 3), MEMORY[0x1E0C80D38]);
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(v5 + 52) = _D0;
  *((_DWORD *)v5 + 15) = 1061997773;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredLocalizations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v17;
  else
    v18 = CFSTR("en-US");
  +[VSSpeechSynthesizerPreference fallbackLanguageForLanguage:](VSSpeechSynthesizerPreference, "fallbackLanguageForLanguage:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v17, "isEqualToString:", v19) & 1) == 0)
  {
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v45 = v17;
      v46 = 2114;
      v47 = v19;
      _os_log_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ is not TTS language, VSSpeechSynthesizer fallback to %{public}@", buf, 0x16u);
    }

  }
  objc_storeStrong((id *)v5 + 10, v19);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v22;

  v24 = objc_msgSend(*((id *)v5 + 1), "isEqualToString:", CFSTR("com.apple.assistantd"));
  v25 = (void *)*((_QWORD *)v5 + 1);
  if ((v24 & 1) != 0)
  {
    v26 = CFSTR("com.apple.AssistantServices");
LABEL_13:
    *((_QWORD *)v5 + 1) = v26;

    goto LABEL_14;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.accessibility.axassetsd")))
  {
    v25 = (void *)*((_QWORD *)v5 + 1);
    v26 = CFSTR("com.apple.accessibility.AccessibilityUIServer");
    goto LABEL_13;
  }
LABEL_14:
  v27 = objc_msgSend(v4, "copy");
  v28 = (void *)*((_QWORD *)v5 + 11);
  *((_QWORD *)v5 + 11) = v27;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v29, "processName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("VSSpeechSynthesizer_%p@%@_%d"), v5, v31, objc_msgSend(v29, "processIdentifier"));
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v32;

  v34 = objc_alloc_init(VSSpeechConnection);
  v35 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v34;

  objc_msgSend(*((id *)v5 + 4), "setIdentifier:", *((_QWORD *)v5 + 5));
  objc_msgSend(*((id *)v5 + 4), "setDelegate:", v5);
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = (void *)*((_QWORD *)v5 + 12);
  *((_QWORD *)v5 + 12) = v36;

  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    if (*((_QWORD *)v5 + 11))
      v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78B0]), "initWithAccessoryId:", v4);
    else
      v38 = objc_alloc_init(MEMORY[0x1E0DA78B0]);
    v39 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v38;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v40;

  }
LABEL_20:

  return (VSSpeechSynthesizer *)v5;
}

- (id)errorFromSTSError:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = a3;
    v5 = objc_msgSend(v4, "code");
    v6 = v5;
    if (v5 <= 298)
    {
      if (v5 > 99)
      {
        switch(v5)
        {
          case 100:
            v6 = 401;
            goto LABEL_28;
          case 101:
            v6 = 402;
            goto LABEL_28;
          case 200:
            v6 = 450;
            goto LABEL_28;
        }
      }
      else
      {
        if (v5 == -1 || !v5)
          goto LABEL_28;
        if (v5 == 1)
        {
          v6 = 400;
LABEL_28:
          objc_msgSend(v4, "userInfo");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), v6, v8);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          return v7;
        }
      }
    }
    else
    {
      if (v5 <= 399)
      {
        switch(v5)
        {
          case 299:
            v6 = 452;
            break;
          case 300:
            v6 = 601;
            break;
          case 301:
            v6 = 602;
            break;
          case 302:
            v6 = 603;
            break;
          default:
            goto LABEL_27;
        }
        goto LABEL_28;
      }
      switch(v5)
      {
        case 400:
          v6 = 700;
          goto LABEL_28;
        case 401:
          v6 = 701;
          goto LABEL_28;
        case 402:
          v6 = 702;
          goto LABEL_28;
      }
    }
LABEL_27:
    v6 = -1;
    goto LABEL_28;
  }
  v7 = 0;
  return v7;
}

- (id)STS_prewarmRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SiriTTSDaemonSession *proxySession;
  id v13;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DA7900]);
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithLanguage:name:", v6, v7);

  objc_msgSend(v8, "setType:", objc_msgSend(v4, "voiceType"));
  objc_msgSend(v8, "setFootprint:", objc_msgSend(v4, "footprint"));
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  v9 = objc_alloc(MEMORY[0x1E0DA78F8]);
  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithText:voice:", v10, v8);

  objc_msgSend(v11, "setPrivacySensitive:", objc_msgSend(v4, "canUseServerTTS") ^ 1);
  objc_msgSend(v11, "setDisableCompactVoice:", objc_msgSend(v4, "disableCompactVoiceFallback"));
  objc_msgSend(v11, "setSynthesisProfile:", objc_msgSend(v4, "powerProfile"));
  proxySession = self->_proxySession;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__VSSpeechSynthesizer_STS_prewarmRequest___block_invoke;
  v15[3] = &unk_1EA8AFA30;
  v15[4] = self;
  v16 = v4;
  v13 = v4;
  -[SiriTTSDaemonSession prewarmWithRequest:didFinish:](proxySession, "prewarmWithRequest:didFinish:", v11, v15);

  return 0;
}

- (id)STS_startSynthesizingRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  SiriTTSDaemonSession *proxySession;
  id v21;
  NSMutableDictionary *stsRequestMapping;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  VSSpeechSynthesizer *v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DA7900]);
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithLanguage:name:", v6, v7);

  objc_msgSend(v8, "setType:", objc_msgSend(v4, "voiceType"));
  objc_msgSend(v8, "setFootprint:", objc_msgSend(v4, "footprint"));
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  v9 = objc_alloc(MEMORY[0x1E0DA78F8]);
  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithText:voice:", v10, v8);

  objc_msgSend(v11, "setPrivacySensitive:", objc_msgSend(v4, "canUseServerTTS") ^ 1);
  objc_msgSend(v4, "contextInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContextInfo:", v12);

  objc_msgSend(v4, "rate");
  *(float *)&v13 = v13;
  objc_msgSend(v11, "setRate:", v13);
  objc_msgSend(v4, "volume");
  *(float *)&v14 = v14;
  objc_msgSend(v11, "setVolume:", v14);
  objc_msgSend(v4, "pitch");
  *(float *)&v15 = v15;
  objc_msgSend(v11, "setPitch:", v15);
  objc_msgSend(v11, "setDisableCompactVoice:", objc_msgSend(v4, "disableCompactVoiceFallback"));
  objc_msgSend(v11, "setSynthesisProfile:", objc_msgSend(v4, "powerProfile"));
  objc_msgSend(v4, "outputPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOutputPath:", v16);

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__2614;
  v37[4] = __Block_byref_object_dispose__2615;
  v17 = MEMORY[0x1E0C809B0];
  v38 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke;
  v36[3] = &unk_1EA8AFA58;
  v36[4] = v37;
  objc_msgSend(v11, "setDidReportInstrument:", v36);
  v34[0] = v17;
  v34[1] = 3221225472;
  v34[2] = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_2;
  v34[3] = &unk_1EA8AFA80;
  v34[4] = self;
  v18 = v4;
  v35 = v18;
  objc_msgSend(v11, "setDidGenerateAudio:", v34);
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_3;
  v32[3] = &unk_1EA8AFAA8;
  v32[4] = self;
  v19 = v18;
  v33 = v19;
  objc_msgSend(v11, "setDidGenerateWordTimings:", v32);
  proxySession = self->_proxySession;
  v25 = v17;
  v26 = 3221225472;
  v27 = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_4;
  v28 = &unk_1EA8AFAD0;
  v29 = self;
  v21 = v19;
  v30 = v21;
  v31 = v37;
  -[SiriTTSDaemonSession synthesizeWithRequest:didFinish:](proxySession, "synthesizeWithRequest:didFinish:", v11, &v25);
  objc_msgSend(v21, "setRequestCreatedTimestamp:", mach_absolute_time(), v25, v26, v27, v28, v29);
  stsRequestMapping = self->_stsRequestMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v21, "requestCreatedTimestamp"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](stsRequestMapping, "setObject:forKeyedSubscript:", v11, v23);

  _Block_object_dispose(v37, 8);
  return 0;
}

- (id)STS_startSpeakingRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  SiriTTSDaemonSession *proxySession;
  id v23;
  NSMutableDictionary *stsRequestMapping;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  VSSpeechSynthesizer *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DA7900]);
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithLanguage:name:", v6, v7);

  objc_msgSend(v8, "setType:", objc_msgSend(v4, "voiceType"));
  objc_msgSend(v8, "setFootprint:", objc_msgSend(v4, "footprint"));
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  v9 = objc_alloc(MEMORY[0x1E0DA78F0]);
  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithText:voice:", v10, v8);

  objc_msgSend(v11, "setPrivacySensitive:", objc_msgSend(v4, "canUseServerTTS") ^ 1);
  objc_msgSend(v4, "siriRequestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSiriRequestId:", v12);

  objc_msgSend(v11, "setImmediate:", objc_msgSend(v4, "shouldWaitCurrentSpeaking") ^ 1);
  objc_msgSend(v11, "setAudioSessionId:", objc_msgSend(v4, "audioSessionID"));
  objc_msgSend(v4, "contextInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContextInfo:", v13);

  objc_msgSend(v4, "rate");
  *(float *)&v14 = v14;
  objc_msgSend(v11, "setRate:", v14);
  objc_msgSend(v4, "volume");
  *(float *)&v15 = v15;
  objc_msgSend(v11, "setVolume:", v15);
  objc_msgSend(v4, "pitch");
  *(float *)&v16 = v16;
  objc_msgSend(v11, "setPitch:", v16);
  objc_msgSend(v11, "setDisableCompactVoice:", objc_msgSend(v4, "disableCompactVoiceFallback"));
  objc_msgSend(v11, "setSynthesisProfile:", objc_msgSend(v4, "powerProfile"));
  objc_msgSend(v4, "outputPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOutputPath:", v17);

  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke;
  v37[3] = &unk_1EA8AFFE0;
  v37[4] = self;
  v19 = v4;
  v38 = v19;
  objc_msgSend(v11, "setDidStartSpeaking:", v37);
  v35[0] = v18;
  v35[1] = 3221225472;
  v35[2] = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_2;
  v35[3] = &unk_1EA8AFAF8;
  v35[4] = self;
  v20 = v19;
  v36 = v20;
  objc_msgSend(v11, "setDidReportInstrument:", v35);
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_3;
  v33[3] = &unk_1EA8AFAA8;
  v33[4] = self;
  v21 = v20;
  v34 = v21;
  objc_msgSend(v11, "setDidGenerateWordTimings:", v33);
  proxySession = self->_proxySession;
  v27 = v18;
  v28 = 3221225472;
  v29 = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_4;
  v30 = &unk_1EA8AFA30;
  v31 = self;
  v32 = v21;
  v23 = v21;
  -[SiriTTSDaemonSession speakWithSpeechRequest:didFinish:](proxySession, "speakWithSpeechRequest:didFinish:", v11, &v27);
  objc_msgSend(v23, "setRequestCreatedTimestamp:", mach_absolute_time(), v27, v28, v29, v30, v31);
  stsRequestMapping = self->_stsRequestMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "requestCreatedTimestamp"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](stsRequestMapping, "setObject:forKeyedSubscript:", v11, v25);

  return 0;
}

- (id)STS_startSpeakingAudioRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  SiriTTSDaemonSession *proxySession;
  id v13;
  NSMutableDictionary *stsRequestMapping;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  VSSpeechSynthesizer *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _OWORD v27[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DA7898]);
  objc_msgSend(v4, "audioData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioData:", v6);

  if (v4)
  {
    objc_msgSend(v4, "decoderStreamDescription");
  }
  else
  {
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
  }
  v27[0] = v29;
  v27[1] = v30;
  v28 = v31;
  objc_msgSend(v5, "setAsbd:", v27);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA78A0]), "initWithAudio:", v5);
  objc_msgSend(v7, "setAudioSessionId:", objc_msgSend(v4, "audioSessionID"));
  objc_msgSend(v7, "setImmediate:", objc_msgSend(v4, "enqueue") ^ 1);
  objc_msgSend(v4, "siriRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSiriRequestId:", v8);

  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke;
  v25[3] = &unk_1EA8AFFE0;
  v25[4] = self;
  v10 = v4;
  v26 = v10;
  objc_msgSend(v7, "setDidStartSpeaking:", v25);
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_3;
  v23[3] = &unk_1EA8AFAF8;
  v23[4] = self;
  v11 = v10;
  v24 = v11;
  objc_msgSend(v7, "setDidReportInstrument:", v23);
  proxySession = self->_proxySession;
  v17 = v9;
  v18 = 3221225472;
  v19 = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_4;
  v20 = &unk_1EA8AFA30;
  v21 = self;
  v22 = v11;
  v13 = v11;
  -[SiriTTSDaemonSession speakWithAudioRequest:didFinish:](proxySession, "speakWithAudioRequest:didFinish:", v7, &v17);
  objc_msgSend(v13, "setRequestCreatedTimestamp:", mach_absolute_time(), v17, v18, v19, v20, v21);
  stsRequestMapping = self->_stsRequestMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v13, "requestCreatedTimestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](stsRequestMapping, "setObject:forKeyedSubscript:", v7, v15);

  return 0;
}

- (double)STS_estimateDurationOfRequest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v3 = (objc_class *)MEMORY[0x1E0DA7900];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithLanguage:name:", v6, v7);

  v9 = objc_alloc(MEMORY[0x1E0DA78F8]);
  objc_msgSend(v4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithText:voice:", v10, v8);
  objc_msgSend(MEMORY[0x1E0DA78B8], "roughEstimationWithRequest:", v11);
  v13 = v12;

  return v13;
}

- (void)STS_estimateDurationOfRequest:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0DA7900];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v9, "initWithLanguage:name:", v10, v11);

  v12 = objc_alloc(MEMORY[0x1E0DA78F8]);
  objc_msgSend(v8, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithText:voice:", v13, v15);
  -[SiriTTSDaemonSession estimateDurationWithRequest:didFinish:](self->_proxySession, "estimateDurationWithRequest:didFinish:", v14, v7);

}

- (void)STS_textToPhonemesWithRequest:(id)a3 phonemeSystem:(int64_t)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  SiriTTSDaemonSession *proxySession;
  id v19;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0DA7900];
  v10 = a3;
  v11 = [v9 alloc];
  objc_msgSend(v10, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "voiceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithLanguage:name:", v12, v13);

  objc_msgSend(v14, "setType:", objc_msgSend(v10, "voiceType"));
  objc_msgSend(v14, "setFootprint:", objc_msgSend(v10, "footprint"));
  objc_msgSend(v14, "setGender:", objc_msgSend(v10, "gender"));
  v15 = objc_alloc(MEMORY[0x1E0DA78D0]);
  objc_msgSend(v10, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithText:voice:phonemeSystem:", v16, v14, a4);
  proxySession = self->_proxySession;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__VSSpeechSynthesizer_STS_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke;
  v20[3] = &unk_1EA8AFB20;
  v21 = v8;
  v19 = v8;
  -[SiriTTSDaemonSession textToPhonemeWithRequest:didFinish:](proxySession, "textToPhonemeWithRequest:didFinish:", v17, v20);

}

- (id)STS_signalInlineStreaming:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0DA78C0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithText:identifier:", v7, v8);
  -[SiriTTSDaemonSession signalWithInlineStreaming:](self->_proxySession, "signalWithInlineStreaming:", v9);

  return 0;
}

- (void)STS_forwardStreamObject:(id)a3
{
  -[SiriTTSDaemonSession forwardWithStreamObject:](self->_proxySession, "forwardWithStreamObject:", a3);
}

- (void)STS_cancelRequest:(id)a3
{
  NSMutableDictionary *stsRequestMapping;
  void *v5;
  void *v6;
  id v7;

  stsRequestMapping = self->_stsRequestMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "requestCreatedTimestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](stsRequestMapping, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_proxySession, "cancelWithRequest:", v7);
    v6 = v7;
  }

}

- (void)STS_cancelAudioRequest:(id)a3
{
  NSMutableDictionary *stsRequestMapping;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *clientBundleIdentifier;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  stsRequestMapping = self->_stsRequestMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "requestCreatedTimestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](stsRequestMapping, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_proxySession, "cancelWithRequest:", v6);
  }
  else
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      v9 = 138543362;
      v10 = clientBundleIdentifier;
      _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_DEFAULT, "Cancel #PresynthesizedAudioRequest from client %{public}@ was ignored, no request to stop", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (BOOL)STS_isSpeaking
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke;
  v5[3] = &unk_1EA8AFC60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)STS_queryPhaticCapabilityWithRequest:(id)a3 reply:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SiriTTSDaemonSession *proxySession;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0DA7900];
  v8 = a3;
  v9 = [v7 alloc];
  objc_msgSend(v8, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithLanguage:name:", v10, v11);

  objc_msgSend(v12, "setType:", objc_msgSend(v8, "voiceType"));
  v13 = objc_msgSend(v8, "footprint");

  objc_msgSend(v12, "setFootprint:", v13);
  proxySession = self->_proxySession;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__VSSpeechSynthesizer_STS_queryPhaticCapabilityWithRequest_reply___block_invoke;
  v16[3] = &unk_1EA8AFB48;
  v17 = v6;
  v15 = v6;
  -[SiriTTSDaemonSession queryPhaticCapabilityWithVoice:reply:](proxySession, "queryPhaticCapabilityWithVoice:reply:", v12, v16);

}

- (void)STS_subscribeVoices:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x1E0DA7900]);
        objc_msgSend(v9, "languages");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v10, "initWithLanguage:name:", v12, v13);

        objc_msgSend(v14, "setType:", objc_msgSend(v9, "type"));
        objc_msgSend(v14, "setFootprint:", objc_msgSend(v9, "footprint"));
        objc_msgSend(v4, "addObject:", v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  -[SiriTTSDaemonSession subscribeWithVoices:reply:](self->_proxySession, "subscribeWithVoices:reply:", v4, &__block_literal_global_106);
}

- (void)STS_subscribedVoices:(id)a3
{
  id v4;
  SiriTTSDaemonSession *proxySession;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  proxySession = self->_proxySession;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__VSSpeechSynthesizer_STS_subscribedVoices___block_invoke;
  v7[3] = &unk_1EA8AFB90;
  v8 = v4;
  v6 = v4;
  -[SiriTTSDaemonSession subscribedVoicesWithReply:](proxySession, "subscribedVoicesWithReply:", v7);

}

- (void)STS_subscribedVoicesWithClientID:(id)a3 reply:(id)a4
{
  id v6;
  SiriTTSDaemonSession *proxySession;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  proxySession = self->_proxySession;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__VSSpeechSynthesizer_STS_subscribedVoicesWithClientID_reply___block_invoke;
  v9[3] = &unk_1EA8AFB90;
  v10 = v6;
  v8 = v6;
  -[SiriTTSDaemonSession subscribedVoicesWithClientId:reply:](proxySession, "subscribedVoicesWithClientId:reply:", a3, v9);

}

- (void)STS_downloadedVoicesMatching:(id)a3 reply:(id)a4
{
  id v6;
  SiriTTSDaemonSession *proxySession;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  proxySession = self->_proxySession;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__VSSpeechSynthesizer_STS_downloadedVoicesMatching_reply___block_invoke;
  v9[3] = &unk_1EA8AFB90;
  v10 = v6;
  v8 = v6;
  -[SiriTTSDaemonSession downloadedVoicesMatching:reply:](proxySession, "downloadedVoicesMatching:reply:", a3, v9);

}

- (void)STS_getSynthesisVoiceMatching:(id)a3 reply:(id)a4
{
  id v6;
  SiriTTSDaemonSession *proxySession;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  proxySession = self->_proxySession;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__VSSpeechSynthesizer_STS_getSynthesisVoiceMatching_reply___block_invoke;
  v9[3] = &unk_1EA8AFBB8;
  v10 = v6;
  v8 = v6;
  -[SiriTTSDaemonSession getSynthesisVoiceMatching:reply:](proxySession, "getSynthesisVoiceMatching:reply:", a3, v9);

}

- (id)initForInputFeedback
{
  id result;

  result = -[VSSpeechSynthesizer init](self, "init");
  if (result)
    *((_WORD *)result + 24) |= 0x80u;
  return result;
}

- (id)prewarmIfNeededWithRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *queue;
  _QWORD v11[4];
  id v12;
  VSSpeechSynthesizer *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_prewarmRequest:](self, "STS_prewarmRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (+[VSFeatureFlags lowInactiveMemory](VSFeatureFlags, "lowInactiveMemory")
      && !-[VSSpeechSynthesizer keepActive](self, "keepActive"))
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_FAULT, "VSSpeechSynthesizer keepActive must be true before prewarming.", buf, 2u);
      }

    }
    +[VSSpeechSynthesizer validatePrewarmRequest:](VSSpeechSynthesizer, "validatePrewarmRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      VSGetLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = v5;
        _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, "Invalid #PrewarmRequest: %@, error: %@", buf, 0x16u);
      }

      v8 = v5;
    }
    else
    {
      queue = self->_queue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke;
      v11[3] = &unk_1EA8AFFE0;
      v12 = v4;
      v13 = self;
      dispatch_sync(queue, v11);

    }
  }

  return v5;
}

- (BOOL)queryPhaticCapability:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    v5 = dispatch_semaphore_create(0);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__VSSpeechSynthesizer_queryPhaticCapability___block_invoke;
    v9[3] = &unk_1EA8AFBE0;
    v11 = &v12;
    v6 = v5;
    v10 = v6;
    -[VSSpeechSynthesizer STS_queryPhaticCapabilityWithRequest:reply:](self, "STS_queryPhaticCapabilityWithRequest:reply:", v4, v9);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = -[VSSpeechConnection queryPhaticCapabilityWithRequest:](self->_xpcConnection, "queryPhaticCapabilityWithRequest:", v4);
  }

  return v7;
}

- (void)_setDelegate:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFF7 | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 16;
    else
      v7 = 0;
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFEF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 32;
    else
      v8 = 0;
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFDF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 4;
    else
      v9 = 0;
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFFB | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFBF | v10;
  }

}

- (id)_stopSpeakingPresynthesizedAudioRequest:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSString *v10;
  dispatch_semaphore_t v11;
  dispatch_time_t v12;
  CFErrorRef v13;
  NSString *clientBundleIdentifier;
  _QWORD v16[4];
  NSObject *v17;
  _BYTE buf[12];
  __int16 v19;
  NSString *v20;
  __int16 v21;
  _BOOL4 v22;
  void *userInfoValues[2];

  v4 = a4;
  userInfoValues[1] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a3;
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = clientBundleIdentifier;
      _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_DEFAULT, "Stop #SpeechPresynthesizedAudioRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (v8)
  {
    v9 = objc_msgSend(v6, "requestCreatedTimestamp");
    v10 = self->_clientBundleIdentifier;
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v9;
    v19 = 2114;
    v20 = v10;
    v21 = 1024;
    v22 = v4;
    _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_DEFAULT, "Stop #SpeechPresynthesizedAudioRequest %llu from client %{public}@, synchronously: %{BOOL}d", buf, 0x1Cu);
  }

  if (!v4)
  {
    -[VSSpeechConnection stopPresynthesizedAudioRequest:](self->_xpcConnection, "stopPresynthesizedAudioRequest:", v6);
    v7 = 0;
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v11 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__VSSpeechSynthesizer__stopSpeakingPresynthesizedAudioRequest_synchronously___block_invoke;
  v16[3] = &unk_1EA8AFFB8;
  v7 = v11;
  v17 = v7;
  objc_msgSend(v6, "setStopHandler:", v16);

  -[VSSpeechConnection stopPresynthesizedAudioRequest:](self->_xpcConnection, "stopPresynthesizedAudioRequest:", v6);
  if (!v7)
    goto LABEL_11;
  v12 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(v7, v12))
    goto LABEL_11;
  *(_QWORD *)buf = *MEMORY[0x1E0C9AFB0];
  userInfoValues[0] = CFSTR("stop presynthesized request timeout");
  v13 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("VSErrorDomain"), -4004, (const void *const *)buf, (const void *const *)userInfoValues, 1);
LABEL_12:

  return v13;
}

- (id)_stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSString *clientBundleIdentifier;
  dispatch_time_t v16;
  CFErrorRef v17;
  _QWORD v19[4];
  NSObject *v20;
  _BYTE buf[12];
  __int16 v22;
  NSString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  void *userInfoValues[2];

  v5 = a5;
  userInfoValues[1] = *(void **)MEMORY[0x1E0C80C00];
  v8 = a3;
  VSGetLogDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = clientBundleIdentifier;
      _os_log_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEFAULT, "Stop #SpeechRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (v10)
  {
    v11 = objc_msgSend(v8, "requestCreatedTimestamp");
    v12 = self->_clientBundleIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v11;
    v22 = 2114;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 1024;
    v27 = v5;
    _os_log_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEFAULT, "Stop #SpeechRequest %llu from client %{public}@, boundary: %@, synchronously: %{BOOL}d", buf, 0x26u);

  }
  if (v5)
  {
    v14 = dispatch_semaphore_create(0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__VSSpeechSynthesizer__stopSpeakingRequest_atNextBoundary_synchronously___block_invoke;
    v19[3] = &unk_1EA8AFFB8;
    v9 = v14;
    v20 = v9;
    objc_msgSend(v8, "setStopHandler:", v19);

  }
  else
  {
    v9 = 0;
  }
  -[VSSpeechConnection stopSpeechRequest:atMark:](self->_xpcConnection, "stopSpeechRequest:atMark:", v8, a4 == 1);
  if (!v9 || (v16 = dispatch_time(0, 1000000000), !dispatch_semaphore_wait(v9, v16)))
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  *(_QWORD *)buf = *MEMORY[0x1E0C9AFB0];
  userInfoValues[0] = CFSTR("stop request timeout");
  v17 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("VSErrorDomain"), -4004, (const void *const *)buf, (const void *const *)userInfoValues, 1);
LABEL_13:

  return v17;
}

- (id)_pauseSpeakingRequestAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  dispatch_semaphore_t v13;
  NSString *clientBundleIdentifier;
  dispatch_time_t v15;
  CFErrorRef v16;
  _QWORD v18[4];
  NSObject *v19;
  _BYTE buf[12];
  __int16 v21;
  NSString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  void *userInfoValues[2];

  v4 = a4;
  userInfoValues[1] = *(void **)MEMORY[0x1E0C80C00];
  -[VSSpeechConnection currentRequest](self->_xpcConnection, "currentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  VSGetLogDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = clientBundleIdentifier;
      _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "Pause #SpeechRequest from client %{public}@ was ignored, no request to pause", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (v9)
  {
    v10 = objc_msgSend(v7, "requestCreatedTimestamp");
    v11 = self->_clientBundleIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 1024;
    v26 = v4;
    _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "Pause #SpeechRequest %llu from client %{public}@, boundary: %@, synchronously: %{BOOL}d", buf, 0x26u);

  }
  if (v4)
  {
    v13 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__VSSpeechSynthesizer__pauseSpeakingRequestAtNextBoundary_synchronously___block_invoke;
    v18[3] = &unk_1EA8AFFB8;
    v8 = v13;
    v19 = v8;
    objc_msgSend(v7, "setPauseHandler:", v18);

  }
  else
  {
    v8 = 0;
  }
  -[VSSpeechConnection pauseSpeechRequest:atMark:](self->_xpcConnection, "pauseSpeechRequest:atMark:", v7, a3 == 1);
  if (!v8 || (v15 = dispatch_time(0, 1000000000), !dispatch_semaphore_wait(v8, v15)))
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  *(_QWORD *)buf = *MEMORY[0x1E0C9AFB0];
  userInfoValues[0] = CFSTR("pause request timeout");
  v16 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("VSErrorDomain"), -4004, (const void *const *)buf, (const void *const *)userInfoValues, 1);
LABEL_13:

  return v16;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VSSpeechSynthesizer_setDelegate___block_invoke;
  block[3] = &unk_1EA8AFFE0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)setKeepActive:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;

  v3 = a3;
  v5 = +[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService");
  v6 = 32;
  if (v5)
    v6 = 104;
  objc_msgSend(*(id *)((char *)&self->super.isa + v6), "setKeepActive:", v3);
}

- (BOOL)keepActive
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = +[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService");
  v4 = 32;
  if (v3)
    v4 = 104;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "keepActive");
}

- (id)startSynthesizingRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  VSSpeechSynthesizer *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_startSynthesizingRequest:](self, "STS_startSynthesizingRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[VSSpeechSynthesizer validateRequest:](VSSpeechSynthesizer, "validateRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v5;
        _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Invalid #SynthesisRequest: %@, error: %@", buf, 0x16u);
      }

      v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __48__VSSpeechSynthesizer_startSynthesizingRequest___block_invoke;
      v10[3] = &unk_1EA8AFFE0;
      v11 = v4;
      v12 = self;
      dispatch_sync(queue, v10);

    }
  }

  return v5;
}

- (id)startSpeakingRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  VSSpeechSynthesizer *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_startSpeakingRequest:](self, "STS_startSpeakingRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[VSSpeechSynthesizer validateRequest:](VSSpeechSynthesizer, "validateRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v5;
        _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Invalid #SpeechRequest: %@, error: %@", buf, 0x16u);
      }

      v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__VSSpeechSynthesizer_startSpeakingRequest___block_invoke;
      v10[3] = &unk_1EA8AFFE0;
      v11 = v4;
      v12 = self;
      dispatch_sync(queue, v10);

    }
  }

  return v5;
}

- (id)startSpeakingPresynthesizedAudioRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  VSSpeechSynthesizer *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_startSpeakingAudioRequest:](self, "STS_startSpeakingAudioRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[VSSpeechSynthesizer validateAudioRequest:](VSSpeechSynthesizer, "validateAudioRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v5;
        _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Invalid #PresynthesizedAudioRequest: %@, error: %@", buf, 0x16u);
      }

      v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __63__VSSpeechSynthesizer_startSpeakingPresynthesizedAudioRequest___block_invoke;
      v10[3] = &unk_1EA8AFFE0;
      v11 = v4;
      v12 = self;
      dispatch_sync(queue, v10);

    }
  }

  return v5;
}

- (id)cachePresynthesizedAudioRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  VSSpeechSynthesizer *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_signalInlineStreaming:](self, "STS_signalInlineStreaming:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[VSSpeechSynthesizer validateAudioCachingRequest:](VSSpeechSynthesizer, "validateAudioCachingRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v5;
        _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Invalid #AudioCachingRequest: %@, error: %@", buf, 0x16u);
      }

      v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __55__VSSpeechSynthesizer_cachePresynthesizedAudioRequest___block_invoke;
      v10[3] = &unk_1EA8AFFE0;
      v11 = v4;
      v12 = self;
      dispatch_sync(queue, v10);

    }
  }

  return v5;
}

- (void)cancelRequest:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  NSString *clientBundleIdentifier;
  _QWORD v8[4];
  id v9;
  VSSpeechSynthesizer *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_cancelRequest:](self, "STS_cancelRequest:", v4);
  }
  else if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__VSSpeechSynthesizer_cancelRequest___block_invoke;
    v8[3] = &unk_1EA8AFFE0;
    v9 = v4;
    v10 = self;
    dispatch_sync(queue, v8);

  }
  else
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      v12 = clientBundleIdentifier;
      _os_log_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_DEFAULT, "Cancel #SpeechRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
    }

  }
}

- (void)cancelAudioRequest:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  NSString *clientBundleIdentifier;
  _QWORD v8[4];
  id v9;
  VSSpeechSynthesizer *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_cancelAudioRequest:](self, "STS_cancelAudioRequest:", v4);
  }
  else if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__VSSpeechSynthesizer_cancelAudioRequest___block_invoke;
    v8[3] = &unk_1EA8AFFE0;
    v9 = v4;
    v10 = self;
    dispatch_sync(queue, v8);

  }
  else
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      v12 = clientBundleIdentifier;
      _os_log_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_DEFAULT, "Cancel #PresynthesizedAudioRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
    }

  }
}

- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  NSObject *queue;
  _QWORD v17[7];
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[NSMutableDictionary allValues](self->_stsRequestMapping, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          -[SiriTTSDaemonSession cancelWithRequest:](self->_proxySession, "cancelWithRequest:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    return 1;
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2614;
    v23 = __Block_byref_object_dispose__2615;
    v24 = 0;
    queue = self->_queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__VSSpeechSynthesizer_stopSpeakingAtNextBoundary_synchronously_error___block_invoke;
    v17[3] = &unk_1EA8AFC10;
    v17[4] = self;
    v17[5] = &v19;
    v17[6] = a3;
    v18 = a4;
    dispatch_sync(queue, v17);
    if (a5)
      *a5 = objc_retainAutorelease((id)v20[5]);
    v14 = v20[5] == 0;
    _Block_object_dispose(&v19, 8);

  }
  return v14;
}

- (BOOL)stopSpeakingPresynthesizedAudioSynchronously:(BOOL)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  NSObject *queue;
  _QWORD block[6];
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSMutableDictionary allValues](self->_stsRequestMapping, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          -[SiriTTSDaemonSession cancelWithRequest:](self->_proxySession, "cancelWithRequest:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    return 1;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__2614;
    v21 = __Block_byref_object_dispose__2615;
    v22 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__VSSpeechSynthesizer_stopSpeakingPresynthesizedAudioSynchronously_error___block_invoke;
    block[3] = &unk_1EA8AFC38;
    block[4] = self;
    block[5] = &v17;
    v16 = a3;
    dispatch_sync(queue, block);
    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
    v12 = v18[5] == 0;
    _Block_object_dispose(&v17, 8);

  }
  return v12;
}

- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  NSObject *queue;
  BOOL v7;
  _QWORD v9[7];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2614;
  v15 = __Block_byref_object_dispose__2615;
  v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__VSSpeechSynthesizer_pauseSpeakingAtNextBoundary_synchronously_error___block_invoke;
  v9[3] = &unk_1EA8AFC10;
  v9[4] = self;
  v9[5] = &v11;
  v9[6] = a3;
  v10 = a4;
  dispatch_sync(queue, v9);
  if (a5)
    *a5 = objc_retainAutorelease((id)v12[5]);
  v7 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (BOOL)continueSpeakingWithError:(id *)a3
{
  NSObject *queue;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2614;
  v12 = __Block_byref_object_dispose__2615;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__VSSpeechSynthesizer_continueSpeakingWithError___block_invoke;
  v7[3] = &unk_1EA8AFC60;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  v5 = v9[5] == 0;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)isSpeaking
{
  NSObject *queue;
  char v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
    return -[VSSpeechSynthesizer STS_isSpeaking](self, "STS_isSpeaking");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__VSSpeechSynthesizer_isSpeaking__block_invoke;
  v6[3] = &unk_1EA8AFC60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v5 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (BOOL)isSystemSpeaking
{
  NSObject *queue;
  char v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
    return -[VSSpeechSynthesizer STS_isSpeaking](self, "STS_isSpeaking");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__VSSpeechSynthesizer_isSystemSpeaking__block_invoke;
  v6[3] = &unk_1EA8AFC60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v5 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (id)speechString
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2614;
  v10 = __Block_byref_object_dispose__2615;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__VSSpeechSynthesizer_speechString__block_invoke;
  v5[3] = &unk_1EA8AFC60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (float)minimumRate
{
  return 0.5;
}

- (float)maximumRate
{
  return 4.0;
}

- (id)_continueSpeakingRequest
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSString *clientBundleIdentifier;
  NSString *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VSSpeechConnection currentRequest](self->_xpcConnection, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = objc_msgSend(v3, "requestCreatedTimestamp");
      clientBundleIdentifier = self->_clientBundleIdentifier;
      v10 = 134218242;
      v11 = v6;
      v12 = 2114;
      v13 = clientBundleIdentifier;
      _os_log_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_DEFAULT, "Resume #SpeechRequest %llu from client %{public}@", (uint8_t *)&v10, 0x16u);
    }

    -[VSSpeechConnection continueSpeechRequest:](self->_xpcConnection, "continueSpeechRequest:", v3);
  }
  else
  {
    if (v5)
    {
      v8 = self->_clientBundleIdentifier;
      v10 = 138543362;
      v11 = (uint64_t)v8;
      _os_log_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_DEFAULT, "Resume #SpeechRequest from client %{public}@ was ignored, no request to resume", (uint8_t *)&v10, 0xCu);
    }

  }
  return 0;
}

- (double)estimateDurationOfRequest:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  unint64_t v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  NSObject *v23;
  void *v24;
  int v26;
  double v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    -[VSSpeechSynthesizer STS_estimateDurationOfRequest:](self, "STS_estimateDurationOfRequest:", v4);
    v6 = v5;
  }
  else
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "logText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = *(double *)&v8;
      _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_DEFAULT, "#RoughEstimateDuration Request utterance: %@", (uint8_t *)&v26, 0xCu);

    }
    objc_msgSend(v4, "languageCode");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA8BEB20, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_9;
    if ((unint64_t)-[__CFString length](v9, "length") >= 3)
    {
      -[__CFString substringWithRange:](v9, "substringWithRange:", 0, 2);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (__CFString *)v11;
    }
    objc_msgSend(&unk_1EA8BEB20, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_9:
      v12 = (void *)v10;
    }
    else
    {

      v9 = CFSTR("generic");
      v12 = &unk_1EA8BE668;
    }
    objc_msgSend(v4, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechSynthesizer characterClassCountForUtterance:language:](VSSpeechSynthesizer, "characterClassCountForUtterance:language:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v6 = v17 / 1000.0;
    if ((unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      v18 = 1;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (double)(unint64_t)objc_msgSend(v19, "unsignedIntegerValue");
        objc_msgSend(v12, "objectAtIndexedSubscript:", v18 - 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v6 = v6 + v20 * v22;

        ++v18;
      }
      while (v18 < objc_msgSend(v15, "count"));
    }
    VSGetLogDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "logText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 134218498;
      v27 = v6;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_1DE15E000, v23, OS_LOG_TYPE_DEFAULT, "#RoughEstimateDuration calculated duration: %.2f, using %@ locale, for text: %@", (uint8_t *)&v26, 0x20u);

    }
  }

  return v6;
}

- (void)estimateDurationOfRequest:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  VSSpeechSynthesizer *v11;
  id v12;

  v8 = a3;
  v6 = a4;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    -[VSSpeechSynthesizer STS_estimateDurationOfRequest:completion:](self, "STS_estimateDurationOfRequest:completion:", v8, v6);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke;
    block[3] = &unk_1EA8B0368;
    v10 = v8;
    v11 = self;
    v12 = v6;
    dispatch_sync(queue, block);

  }
}

- (void)textToPhonemesWithRequest:(id)a3 phonemeSystem:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, const __CFString *, void *);
  void *v10;
  NSObject *v11;
  NSObject *queue;
  NSString *clientBundleIdentifier;
  _QWORD v14[4];
  id v15;
  VSSpeechSynthesizer *v16;
  void (**v17)(id, const __CFString *, void *);
  int64_t v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, const __CFString *, void *))a5;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
  {
    -[VSSpeechSynthesizer STS_textToPhonemesWithRequest:phonemeSystem:completion:](self, "STS_textToPhonemesWithRequest:phonemeSystem:completion:", v8, a4, v9);
  }
  else
  {
    +[VSSpeechSynthesizer validateRequest:](VSSpeechSynthesizer, "validateRequest:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      VSGetLogDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        clientBundleIdentifier = self->_clientBundleIdentifier;
        *(_DWORD *)buf = 138543874;
        v20 = clientBundleIdentifier;
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v10;
        _os_log_error_impl(&dword_1DE15E000, v11, OS_LOG_TYPE_ERROR, "Invalid #TTPRequest from client %{public}@: %@, error: %@", buf, 0x20u);
      }

      if (v9)
        v9[2](v9, &stru_1EA8B0C98, v10);
    }
    else
    {
      queue = self->_queue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke;
      v14[3] = &unk_1EA8AFCD8;
      v15 = v8;
      v16 = self;
      v18 = a4;
      v17 = v9;
      dispatch_async(queue, v14);

    }
  }

}

- (void)connection:(id)a3 speechRequestDidStart:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  VSSpeechSynthesizer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke;
  block[3] = &unk_1EA8AFD00;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)connection:(id)a3 speechRequestDidPause:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  VSSpeechSynthesizer *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "pauseHandler");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    objc_msgSend(v7, "setPauseHandler:", 0);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke;
  block[3] = &unk_1EA8AFD00;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(queue, block);

}

- (void)connection:(id)a3 speechRequestDidContinue:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  VSSpeechSynthesizer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke;
  block[3] = &unk_1EA8AFD00;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)connection:(id)a3 speechRequest:(id)a4 didStopAtEnd:(BOOL)a5 phonemesSpoken:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *queue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  VSSpeechSynthesizer *v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "stopHandler");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
    objc_msgSend(v13, "setStopHandler:", 0);
  }
  queue = self->_queue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke;
  v23[3] = &unk_1EA8AFD50;
  v24 = v12;
  v25 = self;
  v29 = a5;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(queue, v23);

}

- (void)connection:(id)a3 speechRequest:(id)a4 successWithInstrumentMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  VSSpeechSynthesizer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke;
  v15[3] = &unk_1EA8AFD78;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)connection:(id)a3 speechRequest:(id)a4 didReceiveTimingInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  VSSpeechSynthesizer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke;
  v15[3] = &unk_1EA8AFD78;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)connection:(id)a3 speechRequest:(id)a4 willSpeakMark:(int64_t)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  VSSpeechSynthesizer *v17;
  id v18;
  NSUInteger v19;
  NSUInteger v20;

  length = a6.length;
  location = a6.location;
  v10 = a3;
  v11 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke;
  block[3] = &unk_1EA8AFDC8;
  v16 = v10;
  v17 = self;
  v19 = location;
  v20 = length;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, block);

}

- (void)connection:(id)a3 speechRequest:(id)a4 didGenerateAudioChunk:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  VSSpeechSynthesizer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke;
  v15[3] = &unk_1EA8AFD78;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)connection:(id)a3 synthesisRequest:(id)a4 didFinishWithInstrumentMetrics:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v18;
  NSObject *queue;
  _QWORD block[4];
  id v21;
  VSSpeechSynthesizer *v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSynthesizer durationRequests](self, "durationRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "completion");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v17)[2](v17, v11, v12, v13);

    -[VSSpeechSynthesizer durationRequests](self, "durationRequests");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v14);

  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke;
    block[3] = &unk_1EA8AFDF0;
    v21 = v10;
    v22 = self;
    v23 = v11;
    v24 = v12;
    v25 = v13;
    dispatch_async(queue, block);

  }
}

- (void)connection:(id)a3 presynthesizedAudioRequestDidStart:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  NSObject *callbackQueue;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    callbackQueue = self->_callbackQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__VSSpeechSynthesizer_connection_presynthesizedAudioRequestDidStart___block_invoke;
    v9[3] = &unk_1EA8AFFE0;
    v9[4] = self;
    v10 = v5;
    dispatch_async(callbackQueue, v9);

  }
}

- (void)connection:(id)a3 presynthesizedAudioRequest:(id)a4 didStopAtEnd:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  char v14;
  NSObject *callbackQueue;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v9 = a4;
  v10 = a6;
  objc_msgSend(v9, "stopHandler");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
    objc_msgSend(v9, "setStopHandler:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    callbackQueue = self->_callbackQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_didStopAtEnd_error___block_invoke;
    v16[3] = &unk_1EA8AFE18;
    v16[4] = self;
    v17 = v9;
    v19 = a5;
    v18 = v10;
    dispatch_async(callbackQueue, v16);

  }
}

- (void)connection:(id)a3 presynthesizedAudioRequest:(id)a4 successWithInstrumentMetrics:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  char v13;
  NSObject *callbackQueue;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    callbackQueue = self->_callbackQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_successWithInstrumentMetrics_error___block_invoke;
    v15[3] = &unk_1EA8AFD78;
    v15[4] = self;
    v16 = v9;
    v17 = v10;
    v18 = v11;
    dispatch_async(callbackQueue, v15);

  }
}

- (void)connection:(id)a3 invalidatedWithError:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  NSObject *v8;
  NSString *identifier;
  id v10;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      v11 = 138412290;
      v12 = identifier;
      _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_INFO, "Notify daemon crash from: %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "speechSynthesizer:daemonDidCrashWithError:", self, v5);

  }
}

- (void)forwardStreamObject:(id)a3
{
  id v4;

  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService](VSFeatureFlags, "useSiriTTSService"))
    -[VSSpeechSynthesizer STS_forwardStreamObject:](self, "STS_forwardStreamObject:", v4);
  else
    -[VSSpeechConnection forwardStreamObject:](self->_xpcConnection, "forwardStreamObject:", v4);

}

- (void)invokeDaemon:(id)a3
{
  -[VSSpeechConnection invokeDaemon:](self->_xpcConnection, "invokeDaemon:", a3);
}

- (void)killDaemon
{
  -[VSSpeechConnection killDaemon](self->_xpcConnection, "killDaemon");
}

- (void)beginAudioPowerUpdateWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *audioPowerUpdaterQueue;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  AFAudioPowerUpdater *v11;
  AFAudioPowerUpdater *audioPowerUpdater;
  AFAudioPowerUpdater *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_queue *)dispatch_queue_create("VSAudioPowerUpdateQueue", v5);
  audioPowerUpdaterQueue = self->_audioPowerUpdaterQueue;
  self->_audioPowerUpdaterQueue = v6;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)getAFAudioPowerUpdaterClass_softClass;
  v21 = getAFAudioPowerUpdaterClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getAFAudioPowerUpdaterClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getAFAudioPowerUpdaterClass_block_invoke;
    v17[3] = &unk_1EA8AFF40;
    v17[4] = &v18;
    __getAFAudioPowerUpdaterClass_block_invoke((uint64_t)v17);
    v8 = (void *)v19[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v11 = (AFAudioPowerUpdater *)objc_msgSend([v10 alloc], "initWithProvider:queue:frequency:delegate:", self, self->_audioPowerUpdaterQueue, 1, 0);
  audioPowerUpdater = self->_audioPowerUpdater;
  self->_audioPowerUpdater = v11;

  -[AFAudioPowerUpdater beginUpdate](self->_audioPowerUpdater, "beginUpdate");
  v13 = self->_audioPowerUpdater;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __54__VSSpeechSynthesizer_beginAudioPowerUpdateWithReply___block_invoke;
  v15[3] = &unk_1EA8AFE40;
  v16 = v4;
  v14 = v4;
  -[AFAudioPowerUpdater createNewXPCWrapperWithCompletion:](v13, "createNewXPCWrapperWithCompletion:", v15);

}

- (void)endAudioPowerUpdate
{
  OS_dispatch_queue *audioPowerUpdaterQueue;
  AFAudioPowerUpdater *audioPowerUpdater;

  -[AFAudioPowerUpdater endUpdate](self->_audioPowerUpdater, "endUpdate");
  audioPowerUpdaterQueue = self->_audioPowerUpdaterQueue;
  self->_audioPowerUpdaterQueue = 0;

  audioPowerUpdater = self->_audioPowerUpdater;
  self->_audioPowerUpdater = 0;

}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  void *v7;
  BOOL v8;
  dispatch_semaphore_t v9;
  SiriTTSDaemonSession *proxySession;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  float *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  float *v24;
  uint64_t v25;
  int v26;

  -[VSSpeechSynthesizer isPlayingPreview](self, "isPlayingPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 0;
  v23 = 0;
  v24 = (float *)&v23;
  v25 = 0x2020000000;
  v26 = -1024458752;
  v19 = 0;
  v20 = (float *)&v19;
  v21 = 0x2020000000;
  v22 = -1024458752;
  v9 = dispatch_semaphore_create(0);
  proxySession = self->_proxySession;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__VSSpeechSynthesizer_getAveragePower_andPeakPower___block_invoke;
  v15[3] = &unk_1EA8AFE68;
  v17 = &v23;
  v18 = &v19;
  v11 = v9;
  v16 = v11;
  -[SiriTTSDaemonSession getAudioPower:](proxySession, "getAudioPower:", v15);
  v12 = dispatch_time(0, 500000000);
  v13 = dispatch_semaphore_wait(v11, v12);
  *a3 = v24[6];
  *a4 = v20[6];
  v8 = v13 == 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v8;
}

- (void)cleanUnusedAssets:(id)a3
{
  id v4;

  v4 = a3;
  if (!+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
    -[VSSpeechConnection cleanUnusedAssets:](self->_xpcConnection, "cleanUnusedAssets:", v4);

}

- (void)getLocalVoiceAssets:(id)a3
{
  id v4;

  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
    -[VSSpeechSynthesizer STS_downloadedVoicesMatching:reply:](self, "STS_downloadedVoicesMatching:reply:", 0, v4);
  else
    -[VSSpeechConnection getLocalVoiceAssetsForLanguage:reply:](self->_xpcConnection, "getLocalVoiceAssetsForLanguage:reply:", 0, v4);

}

- (void)getLocalVoiceAssetsForLanguage:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", v8, 0);
    -[VSSpeechSynthesizer STS_downloadedVoicesMatching:reply:](self, "STS_downloadedVoicesMatching:reply:", v7, v6);

  }
  else
  {
    -[VSSpeechConnection getLocalVoiceAssetsForLanguage:reply:](self->_xpcConnection, "getLocalVoiceAssetsForLanguage:reply:", v8, v6);
  }

}

- (void)getLocalVoiceResources:(id)a3
{
  -[VSSpeechConnection getLocalVoiceResources:](self->_xpcConnection, "getLocalVoiceResources:", a3);
}

- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4
{
  -[VSSpeechConnection getVoiceResourceForLanguage:reply:](self->_xpcConnection, "getVoiceResourceForLanguage:reply:", a3, a4);
}

- (void)setAutoDownloadedVoiceAssets:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *clientBundleIdentifier;
  NSUUID *accessoryID;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSString *v37;
  NSUUID *v38;
  void *v39;
  VSSpeechSynthesizer *v40;
  id v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  int v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  NSString *v62;
  __int16 v63;
  NSUUID *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    -[VSSpeechSynthesizer STS_subscribeVoices:](self, "STS_subscribeVoices:", v4);
    goto LABEL_42;
  }
  VSGetLogEvent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleIdentifier = self->_clientBundleIdentifier;
    accessoryID = self->_accessoryID;
    __52__VSSpeechSynthesizer_setAutoDownloadedVoiceAssets___block_invoke(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v62 = clientBundleIdentifier;
    v63 = 2112;
    v64 = accessoryID;
    v65 = 2112;
    v66 = v8;
    _os_log_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEFAULT, "#VoiceSubscription, client: %{public}@, accessory: %@, requested voices: %@", buf, 0x20u);

  }
  if (self->_clientBundleIdentifier)
  {
    v40 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v41 = v4;
    v10 = v4;
    v45 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (!v45)
      goto LABEL_36;
    v43 = v9;
    v44 = *(_QWORD *)v56;
    v42 = v10;
    while (1)
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v56 != v44)
          objc_enumerationMutation(v10);
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v13 = v10;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (!v14)
        {

LABEL_33:
          -[NSObject addObject:](v9, "addObject:", v12);
          continue;
        }
        v15 = v14;
        v46 = i;
        v47 = 0;
        v16 = *(_QWORD *)v52;
        do
        {
          v17 = 0;
          v48 = v15;
          do
          {
            if (*(_QWORD *)v52 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v17);
            if (v18 != v12)
            {
              objc_msgSend(v12, "languages");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "firstObject");
              v20 = objc_claimAutoreleasedReturnValue();
              v50 = v18;
              if (v20)
              {
                v21 = (void *)v20;
                objc_msgSend(v18, "languages");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "firstObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "languages");
                v24 = v16;
                v25 = v12;
                v26 = v13;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "firstObject");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v23, "isEqualToString:", v28);

                v13 = v26;
                v12 = v25;
                v16 = v24;
                v15 = v48;

                if (!v49)
                  goto LABEL_28;
              }
              else
              {

              }
              objc_msgSend(v12, "name");
              v29 = objc_claimAutoreleasedReturnValue();
              if (!v29)
                goto LABEL_45;
              v30 = (void *)v29;
              objc_msgSend(v50, "name");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v31, "isEqualToString:", v32);

              if (v33)
              {
LABEL_45:
                if (!objc_msgSend(v12, "type") || (v34 = objc_msgSend(v50, "type"), v34 == objc_msgSend(v12, "type")))
                {
                  if (!objc_msgSend(v12, "footprint")
                    || (v35 = objc_msgSend(v50, "footprint"), v35 == objc_msgSend(v12, "footprint")))
                  {
                    v47 = 1;
                  }
                }
              }
            }
LABEL_28:
            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        }
        while (v15);

        v10 = v42;
        v9 = v43;
        i = v46;
        if ((v47 & 1) == 0)
          goto LABEL_33;
      }
      v45 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (!v45)
      {
LABEL_36:

        VSGetLogEvent();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v40->_clientBundleIdentifier;
          v38 = v40->_accessoryID;
          __52__VSSpeechSynthesizer_setAutoDownloadedVoiceAssets___block_invoke(v9);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = v37;
          v63 = 2112;
          v64 = v38;
          v65 = 2112;
          v66 = v39;
          _os_log_impl(&dword_1DE15E000, v36, OS_LOG_TYPE_DEFAULT, "#VoiceSubscription, client: %{public}@, accessory: %@, deduped voices: %@", buf, 0x20u);

        }
        -[VSSpeechConnection setSubscribedVoiceAssets:withClientID:forAccessoryID:](v40->_xpcConnection, "setSubscribedVoiceAssets:withClientID:forAccessoryID:", v9, v40->_clientBundleIdentifier, v40->_accessoryID);
        v4 = v41;
        goto LABEL_41;
      }
    }
  }
  VSGetLogDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_ERROR, "Ignore voice subscription due to null clientId.", buf, 2u);
  }
LABEL_41:

LABEL_42:
}

- (void)triggerCellularDownloadedVoiceAssets:(id)a3
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSString *clientBundleIdentifier;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v23;
    *(_QWORD *)&v4 = 138544642;
    v18 = v4;
    do
    {
      v7 = 0;
      v20 = v5;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        VSGetLogDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v6;
          clientBundleIdentifier = self->_clientBundleIdentifier;
          objc_msgSend(v8, "languages");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v8, "gender");
          v15 = objc_msgSend(v8, "type");
          v16 = objc_msgSend(v8, "footprint");
          objc_msgSend(v8, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v18;
          v27 = clientBundleIdentifier;
          v6 = v10;
          v5 = v20;
          v28 = 2114;
          v29 = v13;
          v30 = 2048;
          v31 = v14;
          v32 = 2048;
          v33 = v15;
          v34 = 2048;
          v35 = v16;
          v36 = 2114;
          v37 = v17;
          _os_log_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEFAULT, "Request to download with cellular, client: %{public}@, language: %{public}@, gender: %ld, type: %ld, footprint: %ld, name: %{public}@", buf, 0x3Eu);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
    }
    while (v5);
  }
  -[VSSpeechConnection triggerCellularDownloadedVoiceAssets:withClientID:](self->_xpcConnection, "triggerCellularDownloadedVoiceAssets:withClientID:", obj, self->_clientBundleIdentifier, v18);

}

- (void)getAutoDownloadedVoiceAssets:(id)a3
{
  void (**v4)(id, _QWORD);
  NSString *clientBundleIdentifier;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    -[VSSpeechSynthesizer STS_subscribedVoices:](self, "STS_subscribedVoices:", v4);
  }
  else
  {
    clientBundleIdentifier = self->_clientBundleIdentifier;
    if (clientBundleIdentifier)
    {
      -[VSSpeechConnection getSubscribedVoiceAssetsWithClientID:forAccessoryID:reply:](self->_xpcConnection, "getSubscribedVoiceAssetsWithClientID:forAccessoryID:reply:", clientBundleIdentifier, self->_accessoryID, v4);
    }
    else
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Ignore get voice subscription due to null clientId.", v7, 2u);
      }

      v4[2](v4, 0);
    }
  }

}

- (void)getAllAutoDownloadedVoiceAssets:(id)a3
{
  id v4;

  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
    -[VSSpeechSynthesizer STS_subscribedVoicesWithClientID:reply:](self, "STS_subscribedVoicesWithClientID:reply:", 0, v4);
  else
    -[VSSpeechConnection getAllVoiceSubscriptionsWithReply:](self->_xpcConnection, "getAllVoiceSubscriptionsWithReply:", v4);

}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  VSSpeechConnection *xpcConnection;
  _QWORD v19[4];
  id v20;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", v14, v15);
    objc_msgSend(v17, "setFootprint:", a5);
    objc_msgSend(v17, "setType:", a7);
    -[VSSpeechSynthesizer STS_getSynthesisVoiceMatching:reply:](self, "STS_getSynthesisVoiceMatching:reply:", v17, v16);

  }
  else
  {
    xpcConnection = self->_xpcConnection;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke;
    v19[3] = &unk_1EA8AFE90;
    v20 = v16;
    -[VSSpeechConnection getVoiceInfoForLanguageCode:name:footprint:gender:type:reply:](xpcConnection, "getVoiceInfoForLanguageCode:name:footprint:gender:type:reply:", v14, v15, a5, a6, a7, v19);

  }
}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", v12, v13);
    objc_msgSend(v15, "setFootprint:", a6);
    objc_msgSend(v15, "setType:", a5);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_type_footprint_reply___block_invoke;
    v16[3] = &unk_1EA8AFEB8;
    v17 = v14;
    -[VSSpeechSynthesizer STS_getSynthesisVoiceMatching:reply:](self, "STS_getSynthesisVoiceMatching:reply:", v15, v16);

  }
  else
  {
    -[VSSpeechConnection getVoiceInfoForLanguageCode:name:footprint:gender:type:reply:](self->_xpcConnection, "getVoiceInfoForLanguageCode:name:footprint:gender:type:reply:", v12, v13, a6, 0, a5, v14);
  }

}

- (id)availableVoicesForLanguageCode:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  dispatch_semaphore_t v15;

  v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    v5 = dispatch_semaphore_create(0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7900]), "initWithLanguage:name:", v4, 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__VSSpeechSynthesizer_availableVoicesForLanguageCode___block_invoke;
    v13[3] = &unk_1EA8AFEE0;
    v8 = v7;
    v14 = v8;
    v15 = v5;
    v9 = v5;
    -[VSSpeechSynthesizer STS_downloadedVoicesMatching:reply:](self, "STS_downloadedVoicesMatching:reply:", v6, v13);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v10 = v15;
    v11 = v8;

  }
  else
  {
    -[VSSpeechConnection availableVoicesForLanguageCode:](self->_xpcConnection, "availableVoicesForLanguageCode:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)availableLanguageCodes
{
  void *v2;
  void *v3;
  void *v4;

  if (+[VSFeatureFlags useSiriTTSServiceV2](VSFeatureFlags, "useSiriTTSServiceV2"))
  {
    objc_msgSend(MEMORY[0x1E0DA78C8], "availableLanguages");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = VSPreferencesCopyAvailableOutputLanguageIdentifiers();
  }
  v3 = v2;
  objc_msgSend(v2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)availableFootprintsForVoice:(id)a3 languageCode:(id)a4
{
  return -[VSSpeechConnection availableFootprintsForVoice:languageCode:](self->_xpcConnection, "availableFootprintsForVoice:languageCode:", a3, a4);
}

- (VSSpeechSynthesizerDelegate)delegate
{
  return (VSSpeechSynthesizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (NSString)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
  objc_storeStrong((id *)&self->_voice, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSMutableDictionary)durationRequests
{
  return self->_durationRequests;
}

- (void)setDurationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_durationRequests, a3);
}

- (SiriTTSDaemonSession)proxySession
{
  return self->_proxySession;
}

- (void)setProxySession:(id)a3
{
  objc_storeStrong((id *)&self->_proxySession, a3);
}

- (NSMutableDictionary)stsRequestMapping
{
  return self->_stsRequestMapping;
}

- (void)setStsRequestMapping:(id)a3
{
  objc_storeStrong((id *)&self->_stsRequestMapping, a3);
}

- (OS_dispatch_queue)audioPowerUpdaterQueue
{
  return self->_audioPowerUpdaterQueue;
}

- (void)setAudioPowerUpdaterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_audioPowerUpdaterQueue, a3);
}

- (AFAudioPowerUpdater)audioPowerUpdater
{
  return self->_audioPowerUpdater;
}

- (void)setAudioPowerUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_audioPowerUpdater, a3);
}

- (SiriTTSPreviewRequest)isPlayingPreview
{
  return self->_isPlayingPreview;
}

- (void)setIsPlayingPreview:(id)a3
{
  self->_isPlayingPreview = (SiriTTSPreviewRequest *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_stsRequestMapping, 0);
  objc_storeStrong((id *)&self->_proxySession, 0);
  objc_storeStrong((id *)&self->_durationRequests, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

void __54__VSSpeechSynthesizer_availableVoicesForLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __77__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_type_footprint_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __52__VSSpeechSynthesizer_setAutoDownloadedVoiceAssets___block_invoke(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v1;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v2)
  {
    v3 = v2;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "languages");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", objc_msgSend(v5, "type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", objc_msgSend(v5, "footprint"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@:%@:%@"), v8, v9, v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v12);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }

  return v16;
}

intptr_t __52__VSSpeechSynthesizer_getAveragePower_andPeakPower___block_invoke(uint64_t a1, float a2, float a3)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __54__VSSpeechSynthesizer_beginAudioPowerUpdateWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_successWithInstrumentMetrics_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didFinishPresynthesizedAudioRequest:withInstrumentMetrics:error:", a1[4], a1[5], a1[6], a1[7]);

}

void __80__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_didStopAtEnd_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didStopPresynthesizedAudioRequest:atEnd:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __69__VSSpeechSynthesizer_connection_presynthesizedAudioRequestDidStart___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didStartPresynthesizedAudioRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v18 = "-[VSSpeechSynthesizer connection:synthesisRequest:didFinishWithInstrumentMetrics:error:]_block_invoke";
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_INFO, "%s, callback received in framework. %@", buf, 0x16u);
  }

  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 64));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(a1 + 48);
      v10 = *(NSObject **)(v8 + 24);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke_269;
      v13[3] = &unk_1EA8AFD78;
      v13[4] = v8;
      v14 = v9;
      v15 = *(id *)(a1 + 56);
      v16 = *(id *)(a1 + 64);
      dispatch_async(v10, v13);

    }
  }
  else
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(const char **)(*(_QWORD *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v11;
      _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "Current xpc connection %@ does not match %@", buf, 0x16u);
    }

  }
}

void __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke_269(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didFinishSynthesisRequest:withInstrumentMetrics:error:", a1[4], a1[5], a1[6], a1[7]);

}

void __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 0x40) != 0)
  {
    v3 = *(NSObject **)(v1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke_2;
    block[3] = &unk_1EA8AFD00;
    block[4] = v1;
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    dispatch_async(v3, block);

  }
}

void __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:withSynthesisRequest:didGenerateAudioChunk:", a1[4], a1[5], a1[6]);

}

void __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;
  __int128 v5;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 0x20) != 0)
  {
    v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke_2;
    v3[3] = &unk_1EA8AFDA0;
    v3[4] = v1;
    v5 = *(_OWORD *)(a1 + 56);
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);

  }
}

void __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:willSpeakRangeOfSpeechString:forRequest:", a1[4], a1[6], a1[7], a1[5]);

}

void __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  char v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 64));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(a1 + 48);
      v7 = *(NSObject **)(v5 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke_2;
      block[3] = &unk_1EA8AFD00;
      block[4] = v5;
      v9 = v6;
      v10 = *(id *)(a1 + 56);
      dispatch_async(v7, block);

    }
  }
}

void __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:withRequest:didReceiveTimingInfo:", a1[4], a1[5], a1[6]);

}

void __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 4) != 0)
  {
    v3 = *(NSObject **)(v1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke_2;
    block[3] = &unk_1EA8AFD00;
    block[4] = v1;
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    dispatch_async(v3, block);

  }
}

void __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didFinishSpeakingRequest:withInstrumentMetrics:", a1[4], a1[5], a1[6]);

}

void __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[VSSpeechSynthesizer connection:speechRequest:didStopAtEnd:phonemesSpoken:error:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_INFO, "%s, callback received in framework. %@", buf, 0x16u);
  }

  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 32))
  {
    if ((*(_WORD *)(v4 + 48) & 2) != 0)
    {
      v6 = *(NSObject **)(v4 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke_267;
      block[3] = &unk_1EA8AFD28;
      block[4] = v4;
      v10 = *(id *)(a1 + 48);
      v13 = *(_BYTE *)(a1 + 72);
      v11 = *(id *)(a1 + 56);
      v12 = *(id *)(a1 + 64);
      dispatch_async(v6, block);

    }
  }
  else
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(*(_QWORD *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "Current xpc connection %@ does not match %@", buf, 0x16u);
    }

  }
}

void __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke_267(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didFinishSpeakingRequest:successfully:phonemesSpoken:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 0x10) != 0)
  {
    v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke_2;
    v3[3] = &unk_1EA8AFFE0;
    v3[4] = v1;
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);

  }
}

void __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didContinueSpeakingRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 8) != 0)
  {
    v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke_2;
    v3[3] = &unk_1EA8AFFE0;
    v3[4] = v1;
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);

  }
}

void __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didPauseSpeakingRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 1) != 0)
  {
    v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke_2;
    v3[3] = &unk_1EA8AFFE0;
    v3[4] = v1;
    v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);

  }
}

void __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:didStartSpeakingRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestCreatedTimestamp:", mach_absolute_time());
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_DWORD *)buf = 134218242;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "Start #TTPRequest %llu from client %{public}@", buf, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke_266;
  v8[3] = &unk_1EA8AFCB0;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v6, "startPhonemesRequest:phonemeSystem:reply:", v9, v7, v8);

}

void __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke_266(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, "Error #TTPRequest %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    objc_msgSend(*(id *)(a1 + 32), "logText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218498;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "#TTPRequest %llu Received phonemes: %@, for text: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

void __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "#EstimateDuration Request text: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setFootprint:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setVoiceType:", 1);
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke_262;
  v6[3] = &unk_1EA8AFC88;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "estimateDurationWithRequest:reply:", v7, v6);

}

void __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke_262(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[VSSpeechSynthesizer estimateDurationOfRequest:completion:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Error %s, %@", (uint8_t *)&v10, 0x16u);
    }

  }
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = *(const char **)&a3;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_DEFAULT, "#EstimateDuration Received duration: %.2f, for text: %@", (uint8_t *)&v10, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, double))(v9 + 16))(v9, v5, a3);

}

void __35__VSSpeechSynthesizer_speechString__block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(v5, "attributedText");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (!v3)
  {

  }
}

uint64_t __39__VSSpeechSynthesizer_isSystemSpeaking__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isSystemSpeaking");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __33__VSSpeechSynthesizer_isSpeaking__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isSystemSpeakingOnBehalfOfCurrentConnection");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __49__VSSpeechSynthesizer_continueSpeakingWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_continueSpeakingRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__VSSpeechSynthesizer_pauseSpeakingAtNextBoundary_synchronously_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_pauseSpeakingRequestAtNextBoundary:synchronously:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __74__VSSpeechSynthesizer_stopSpeakingPresynthesizedAudioSynchronously_error___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[4], "currentAudioRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stopSpeakingPresynthesizedAudioRequest:synchronously:", v3, *(unsigned __int8 *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, "Error Stop #PresynthesizedAudioRequest %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void __70__VSSpeechSynthesizer_stopSpeakingAtNextBoundary_synchronously_error___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[4], "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stopSpeakingRequest:atNextBoundary:synchronously:", v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, "Error Stop #SpeechRequest %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

uint64_t __42__VSSpeechSynthesizer_cancelAudioRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "Cancel #PresynthesizedAudioRequest %llu from client %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "stopPresynthesizedAudioRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __37__VSSpeechSynthesizer_cancelRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "Cancel #SpeechRequest %llu from client %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "stopSpeechRequest:atMark:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __55__VSSpeechSynthesizer_cachePresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestCreatedTimestamp:", mach_absolute_time());
  objc_msgSend(*(id *)(a1 + 32), "setClientBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "Cache #PresynthesizedAudioRequest %llu: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "cachePresynthesizedAudioRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__VSSpeechSynthesizer_startSpeakingPresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestCreatedTimestamp:", mach_absolute_time());
  objc_msgSend(*(id *)(a1 + 32), "setClientBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v2 = objc_msgSend(*(id *)(a1 + 32), "audioSessionID");
  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));

  }
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 134218242;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_DEFAULT, "Start #PresynthesizedAudioRequest %llu: %@", (uint8_t *)&v8, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "startPresynthesizedAudioRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__VSSpeechSynthesizer_startSpeakingRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "setRequestCreatedTimestamp:", mach_absolute_time());
  objc_msgSend(*(id *)(a1 + 32), "setClientBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v2 = objc_msgSend(*(id *)(a1 + 32), "audioSessionID");
  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));

  }
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    objc_msgSend(*(id *)(a1 + 32), "clientBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 134218498;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_DEFAULT, "Start #SpeechRequest %llu from client %{public}@, %{public}@", (uint8_t *)&v9, 0x20u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "startSpeechRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __48__VSSpeechSynthesizer_startSynthesizingRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "setRequestCreatedTimestamp:", mach_absolute_time());
  objc_msgSend(*(id *)(a1 + 32), "setClientBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  objc_msgSend(*(id *)(a1 + 32), "setShouldStreamAudioData:", (*(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 48) >> 6) & 1);
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    objc_msgSend(*(id *)(a1 + 32), "clientBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 134218498;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "Start #SynthesisRequest %llu from client %{public}@, %@", (uint8_t *)&v7, 0x20u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "startSynthesisRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __35__VSSpeechSynthesizer_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDelegate:", *(_QWORD *)(a1 + 40));
}

intptr_t __73__VSSpeechSynthesizer__pauseSpeakingRequestAtNextBoundary_synchronously___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __73__VSSpeechSynthesizer__stopSpeakingRequest_atNextBoundary_synchronously___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __77__VSSpeechSynthesizer__stopSpeakingPresynthesizedAudioRequest_synchronously___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __45__VSSpeechSynthesizer_queryPhaticCapability___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestCreatedTimestamp:", mach_absolute_time());
  objc_msgSend(*(id *)(a1 + 32), "setClientBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTimestamp");
    objc_msgSend(*(id *)(a1 + 32), "clientBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v14 = v3;
    v15 = 2114;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "#PrewarmRequest %llu from client %{public}@, request: %@", buf, 0x20u);

  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "audioSessionID");
  if ((_DWORD)v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", objc_msgSend(v7, "opaqueSessionID"));

  }
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v8 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke_112;
  v11[3] = &unk_1EA8AFA30;
  v11[4] = v8;
  v12 = v9;
  objc_msgSend(v10, "prewarmIfNeededWithRequest:reply:", v12, v11);

}

void __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke_112(uint64_t a1, void *a2)
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v5, "speechSynthesizer:didFinishPrewarmRequest:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);

  }
}

void __59__VSSpeechSynthesizer_STS_getSynthesisVoiceMatching_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  VSVoiceAsset *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, "Unable to get synthesis voice, error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(VSVoiceAsset);
    objc_msgSend(v5, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setLanguages:](v8, "setLanguages:", v10);

    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setName:](v8, "setName:", v11);

    -[VSVoiceAsset setFootprint:](v8, "setFootprint:", objc_msgSend(v5, "footprint"));
    -[VSVoiceAsset setType:](v8, "setType:", objc_msgSend(v5, "type"));
    -[VSVoiceAsset setGender:](v8, "setGender:", objc_msgSend(v5, "gender"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __58__VSSpeechSynthesizer_STS_downloadedVoicesMatching_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VSVoiceAsset *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = objc_alloc_init(VSVoiceAsset);
        objc_msgSend(v8, "language");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setLanguages:](v9, "setLanguages:", v11);

        objc_msgSend(v8, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setName:](v9, "setName:", v12);

        -[VSVoiceAsset setType:](v9, "setType:", objc_msgSend(v8, "type"));
        -[VSVoiceAsset setFootprint:](v9, "setFootprint:", objc_msgSend(v8, "footprint"));
        -[VSVoiceAsset setGender:](v9, "setGender:", objc_msgSend(v8, "gender"));
        -[VSAssetBase setStorage:](v9, "setStorage:", 3);
        objc_msgSend(v3, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__VSSpeechSynthesizer_STS_subscribedVoicesWithClientID_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  VSVoiceAsset *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VSVoiceSubscription *v19;
  void *v20;
  void *v21;
  VSVoiceSubscription *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        v10 = objc_alloc_init(VSVoiceAsset);
        objc_msgSend(v9, "voice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "language");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setLanguages:](v10, "setLanguages:", v13);

        objc_msgSend(v9, "voice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setName:](v10, "setName:", v15);

        objc_msgSend(v9, "voice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setType:](v10, "setType:", objc_msgSend(v16, "type"));

        objc_msgSend(v9, "voice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setFootprint:](v10, "setFootprint:", objc_msgSend(v17, "footprint"));

        objc_msgSend(v9, "voice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setGender:](v10, "setGender:", objc_msgSend(v18, "gender"));

        v19 = [VSVoiceSubscription alloc];
        objc_msgSend(v9, "clientId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accessoryId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[VSVoiceSubscription initWithClient:accessory:voice:](v19, "initWithClient:accessory:voice:", v20, v21, v10);

        objc_msgSend(v3, "addObject:", v22);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__VSSpeechSynthesizer_STS_subscribedVoices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  VSVoiceAsset *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = objc_alloc_init(VSVoiceAsset);
        objc_msgSend(v9, "voice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "language");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setLanguages:](v10, "setLanguages:", v13);

        objc_msgSend(v9, "voice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setName:](v10, "setName:", v15);

        objc_msgSend(v9, "voice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setType:](v10, "setType:", objc_msgSend(v16, "type"));

        objc_msgSend(v9, "voice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setFootprint:](v10, "setFootprint:", objc_msgSend(v17, "footprint"));

        objc_msgSend(v3, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__VSSpeechSynthesizer_STS_subscribeVoices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "Unable to subscribe voice, error %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __66__VSSpeechSynthesizer_STS_queryPhaticCapabilityWithRequest_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke_2;
  v4[3] = &unk_1EA8B0128;
  v4[4] = v1;
  return objc_msgSend(v2, "isSpeaking:", v4);
}

uint64_t __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __78__VSSpeechSynthesizer_STS_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(v4 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_2;
    v7[3] = &unk_1EA8AFFE0;
    v7[4] = v4;
    v8 = v5;
    dispatch_async(v6, v7);

  }
}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[VSInstrumentMetrics vs_metricsFromSTSMetrics:](VSInstrumentMetrics, "vs_metricsFromSTSMetrics:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speechSynthesizer:didFinishPresynthesizedAudioRequest:withInstrumentMetrics:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, 0);

  }
}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "errorFromSTSError:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechSynthesizer:didStopPresynthesizedAudioRequest:atEnd:error:", v6, v7, v11 == 0, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "stsRequestMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "requestCreatedTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechSynthesizer:didStartPresynthesizedAudioRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechSynthesizer:didStartSpeakingRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    +[VSInstrumentMetrics vs_metricsFromSTSMetrics:](VSInstrumentMetrics, "vs_metricsFromSTSMetrics:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsSpeechRequest:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speechSynthesizer:didFinishSpeakingRequest:withInstrumentMetrics:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);

  }
}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  VSSpeechWordTimingInfo *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = objc_alloc_init(VSSpeechWordTimingInfo);
          objc_msgSend(v12, "startTime", (_QWORD)v17);
          -[VSSpeechWordTimingInfo setStartTime:](v13, "setStartTime:");
          v14 = objc_msgSend(v12, "textRange");
          -[VSSpeechWordTimingInfo setTextRange:](v13, "setTextRange:", v14, v15);
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "speechSynthesizer:withRequest:didReceiveTimingInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);

  }
}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "errorFromSTSError:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechSynthesizer:didFinishSpeakingRequest:successfully:phonemesSpoken:withError:", v6, v7, v11 == 0, 0, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "stsRequestMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "requestCreatedTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v10);

}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[VSInstrumentMetrics vs_metricsFromSTSMetrics:](VSInstrumentMetrics, "vs_metricsFromSTSMetrics:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  VSAudioData *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_alloc_init(VSAudioData);
    if (v3)
    {
      objc_msgSend(v3, "asbd");
    }
    else
    {
      v14 = 0;
      v12 = 0u;
      v13 = 0u;
    }
    v10[0] = v12;
    v10[1] = v13;
    v11 = v14;
    -[VSAudioData setAsbd:](v6, "setAsbd:", v10);
    objc_msgSend(v3, "audioData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAudioData setAudioData:](v6, "setAudioData:", v7);

    -[VSAudioData setPacketCount:](v6, "setPacketCount:", objc_msgSend(v3, "packetCount"));
    objc_msgSend(v3, "packetDescriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAudioData setPacketDescriptions:](v6, "setPacketDescriptions:", v8);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "speechSynthesizer:withSynthesisRequest:didGenerateAudioChunk:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);

  }
}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  VSSpeechWordTimingInfo *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = objc_alloc_init(VSSpeechWordTimingInfo);
          objc_msgSend(v12, "startTime", (_QWORD)v17);
          -[VSSpeechWordTimingInfo setStartTime:](v13, "setStartTime:");
          v14 = objc_msgSend(v12, "textRange");
          -[VSSpeechWordTimingInfo setTextRange:](v13, "setTextRange:", v14, v15);
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "speechSynthesizer:withRequest:didReceiveTimingInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);

  }
}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v6, "errorFromSTSError:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechSynthesizer:didFinishSynthesisRequest:withInstrumentMetrics:error:", v6, v7, v8, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "stsRequestMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "requestCreatedTimestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

}

void __42__VSSpeechSynthesizer_STS_prewarmRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechSynthesizer:didFinishPrewarmRequest:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);

  }
}

uint64_t __88__VSSpeechSynthesizer_playVoicePreviewForLanguageCode_voiceName_previewType_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsPlayingPreview:", 0);
  return (*(uint64_t (**)(_QWORD, BOOL, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 == 0, 0.0);
}

+ (id)errorWithReason:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D68];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("VSSpeechSynthesizer"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validatePrewarmRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  void *v14;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Request is nil.");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = (const __CFString **)v21;
    v13 = &v20;
LABEL_7:
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    v9 = 100;
    goto LABEL_8;
  }
  objc_msgSend(v3, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("language is not set.");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v19;
    v13 = &v18;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "requestCreatedTimestamp"))
  {
    v14 = 0;
    goto LABEL_9;
  }
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0CB2D50];
  v17 = CFSTR("Request has been used before. Please make a new copy of it.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = 101;
LABEL_8:
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), v9, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

+ (id)validateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "validatePrewarmRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = CFSTR("text is not set.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 100, v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

+ (id)validateAudioRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("Request is nil.");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (const __CFString **)v20;
    v12 = &v19;
LABEL_8:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v8 = 100;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "requestCreatedTimestamp"))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("Request has been used before. Please make a new copy of it.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = 101;
LABEL_9:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), v8, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "hasValidAudio") & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16 = CFSTR("Audio request has invalid audio data.");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v16;
    v12 = &v15;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

+ (id)validateAudioCachingRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("Request is nil.");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (const __CFString **)v29;
    v12 = &v28;
LABEL_5:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    v8 = 100;
    goto LABEL_6;
  }
  if (!objc_msgSend(v3, "requestCreatedTimestamp"))
  {
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (!v17)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB2D50];
        v25 = CFSTR("Missing text of inline streaming request.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = &v25;
        v12 = &v24;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(v4, "audioData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (!v19)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v20 = *MEMORY[0x1E0CB2D50];
        v21 = CFSTR("Audio caching request must be either inline streaming or audio request.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = &v21;
        v12 = &v20;
        goto LABEL_5;
      }
      if ((objc_msgSend(v4, "hasValidAudio") & 1) == 0)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2D50];
        v23 = CFSTR("Invalid audio request. Audio is invalid.");
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = &v23;
        v12 = &v22;
        goto LABEL_5;
      }
    }
    v13 = 0;
    goto LABEL_7;
  }
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0CB2D50];
  v27 = CFSTR("Request has been used before. Please make a new copy of it.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = 101;
LABEL_6:
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), v8, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v13;
}

+ (BOOL)playVoicePreviewForLanguageCode:(id)a3 voiceName:(id)a4 previewType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a1, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__VSSpeechSynthesizer_playVoicePreviewForLanguageCode_voiceName_previewType_completion___block_invoke;
  v16[3] = &unk_1EA8AF9C0;
  v17 = v10;
  v14 = v10;
  objc_msgSend(v13, "playVoicePreviewForLanguageCode:voiceName:previewType:completion:", v12, v11, a5, v16);

  return 1;
}

+ (void)stopPlayingVoicePreview
{
  id v2;

  objc_msgSend(a1, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopPlayingVoicePreview");

}

+ (VSSpeechSynthesizer)sharedInstance
{
  if (sharedInstance_onceToken_2692 != -1)
    dispatch_once(&sharedInstance_onceToken_2692, &__block_literal_global_2693);
  return (VSSpeechSynthesizer *)(id)sharedInstance___sharedInstance;
}

+ (id)characterClassCountForUtterance:(id)a3 language:(id)a4
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  unsigned int v31;
  _QWORD v32[7];

  v32[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "vs_textifyEmojiWithLanguage:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vs_measurePauses");
  v6 = v5;
  v30 = objc_msgSend(v4, "vs_countPhoneticSyllables");
  objc_msgSend(v4, "vs_removePhonetics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "vs_removeSpeechTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v31 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = objc_msgSend(v8, "characterAtIndex:", v11);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "characterIsMember:", v15);

      if ((v17 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "characterIsMember:", v15);

        if (v19)
        {
          v14 = (v14 + 1);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "characterIsMember:", v15);

          if (v21)
          {
            v13 = (v13 + 1);
          }
          else if (objc_msgSend(MEMORY[0x1E0CB3940], "vs_isCJKCharacter:", v15))
          {
            v12 = (v12 + 1);
          }
          else
          {
            ++v31;
          }
        }
      }
      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v31 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v6 * 1000.0));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

void __37__VSSpeechSynthesizer_sharedInstance__block_invoke()
{
  VSSpeechSynthesizer *v0;
  void *v1;

  v0 = objc_alloc_init(VSSpeechSynthesizer);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

uint64_t __88__VSSpeechSynthesizer_playVoicePreviewForLanguageCode_voiceName_previewType_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
