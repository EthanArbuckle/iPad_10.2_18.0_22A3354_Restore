@implementation SVXSpeechSynthesizer

- (void)dealloc
{
  objc_super v3;

  -[SVXDefaultNotificationCenterRegistrar removeObserver:](self->_notificationCenterRegistrar, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SVXSpeechSynthesizer;
  -[SVXSpeechSynthesizer dealloc](&v3, sel_dealloc);
}

- (void)prewarmRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SVXSpeechSynthesizer *v9;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SVXSpeechSynthesizer_prewarmRequest___block_invoke;
  v7[3] = &unk_24D24F018;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)synthesizeRequest:(id)a3 audioChunkHandler:(id)a4 taskTracker:(id)a5 analyticsContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SVXSpeechSynthesisContext *v17;
  void *v18;
  SVXSpeechSynthesisContext *v19;
  _QWORD v20[5];
  SVXSpeechSynthesisContext *v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[SVXSpeechSynthesisContext initWithOperationType:request:languageCode:voiceName:gender:audioSessionID:preparation:audioChunkHandler:finalization:taskTracker:analyticsContext:]([SVXSpeechSynthesisContext alloc], "initWithOperationType:request:languageCode:voiceName:gender:audioSessionID:preparation:audioChunkHandler:finalization:taskTracker:analyticsContext:", 1, v16, 0, 0, 0, 0, 0, v15, v12, v14, v13);

  -[SVXModule performer](self->_module, "performer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __100__SVXSpeechSynthesizer_synthesizeRequest_audioChunkHandler_taskTracker_analyticsContext_completion___block_invoke;
  v20[3] = &unk_24D24F018;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "performBlock:", v20);

}

- (void)enqueueRequest:(id)a3 languageCode:(id)a4 voiceName:(id)a5 gender:(int64_t)a6 audioSessionID:(unsigned int)a7 preparation:(id)a8 finalization:(id)a9 taskTracker:(id)a10 analyticsContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  SVXSpeechSynthesisContext *v25;
  void *v26;
  SVXSpeechSynthesisContext *v27;
  _QWORD v29[5];
  SVXSpeechSynthesisContext *v30;

  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  if (-[SVXSpeechSynthesizer _useStreamingAudio](self, "_useStreamingAudio"))
    v24 = 1;
  else
    v24 = 2;
  v25 = -[SVXSpeechSynthesisContext initWithOperationType:request:languageCode:voiceName:gender:audioSessionID:preparation:audioChunkHandler:finalization:taskTracker:analyticsContext:]([SVXSpeechSynthesisContext alloc], "initWithOperationType:request:languageCode:voiceName:gender:audioSessionID:preparation:audioChunkHandler:finalization:taskTracker:analyticsContext:", v24, v23, v22, v21, a6, a7, v20, 0, v19, v18, v17);

  if (-[SVXSpeechSynthesizer _useStreamingAudio](self, "_useStreamingAudio"))
    -[SVXSpeechSynthesisContext setIsStreamingSynthesisRequest:](v25, "setIsStreamingSynthesisRequest:", 1);
  -[SVXModule performer](self->_module, "performer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __138__SVXSpeechSynthesizer_enqueueRequest_languageCode_voiceName_gender_audioSessionID_preparation_finalization_taskTracker_analyticsContext___block_invoke;
  v29[3] = &unk_24D24F018;
  v29[4] = self;
  v30 = v25;
  v27 = v25;
  objc_msgSend(v26, "performBlock:", v29);

}

- (void)cancelRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SVXSpeechSynthesizer_cancelRequest___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)stopRequest:(id)a3 withInterruptionBehavior:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[SVXModule performer](self->_module, "performer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__SVXSpeechSynthesizer_stopRequest_withInterruptionBehavior___block_invoke;
  v9[3] = &unk_24D24ECE8;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)cancelPendingRequests
{
  void *v3;
  _QWORD v4[5];

  -[SVXModule performer](self->_module, "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__SVXSpeechSynthesizer_cancelPendingRequests__block_invoke;
  v4[3] = &unk_24D24EFF0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)stopCurrentRequestWithInterruptionBehavior:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__SVXSpeechSynthesizer_stopCurrentRequestWithInterruptionBehavior___block_invoke;
  v6[3] = &unk_24D24EA18;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performBlock:", v6);

}

- (SVXSpeechSynthesizer)initWithModule:(id)a3
{
  SVXSpeechSynthesisUtils *v3;
  SVXSessionUtils *v4;
  SVXVoiceGenderConverter *v5;
  SVXSpeechSynthesisConfigurationStateManager *v6;
  SVXDefaultNotificationCenterRegistrar *v7;
  SVXVoiceGenderConverter *v8;
  SVXSpeechSynthesisUtils *v9;
  SVXLocalizationUtils *v10;
  SVXSpeechInstrumentationUtilities *v11;
  SVXSpeechSynthesisMetricsContextFactory *v12;
  SVXAFSpeakableUtteranceParserProvider *v14;
  SVXSynthesisVoiceConfigurer *v15;
  SVXSpeechRequestConfigurer *v16;
  SVXSpeechSynthesisConfigurer *v17;
  SVXSpeechSynthesisUtils *v18;
  id v19;
  SVXSynthesisVoiceConfigurer *v20;
  SVXAudioStreamingAnnouncer *v21;
  SVXSpeechSynthesisAnnouncer *v22;
  id v23;
  SVXSpeechSynthesizer *v25;
  SVXVoiceGenderConverter *v26;

  v23 = a3;
  v3 = objc_alloc_init(SVXSpeechSynthesisUtils);
  v4 = objc_alloc_init(SVXSessionUtils);
  v5 = objc_alloc_init(SVXVoiceGenderConverter);
  v22 = objc_alloc_init(SVXSpeechSynthesisAnnouncer);
  v6 = objc_alloc_init(SVXSpeechSynthesisConfigurationStateManager);
  v21 = objc_alloc_init(SVXAudioStreamingAnnouncer);
  v7 = objc_alloc_init(SVXDefaultNotificationCenterRegistrar);
  v19 = objc_alloc_init(MEMORY[0x24BEA7A10]);
  v8 = v5;
  v26 = v5;
  v20 = -[SVXSynthesisVoiceConfigurer initWithConfigurationManager:speechSynthesisUtils:sessionUtils:voiceGenderConverter:]([SVXSynthesisVoiceConfigurer alloc], "initWithConfigurationManager:speechSynthesisUtils:sessionUtils:voiceGenderConverter:", v6, v3, v4, v5);
  v17 = -[SVXSpeechSynthesisConfigurer initWithVoiceConfigurer:]([SVXSpeechSynthesisConfigurer alloc], "initWithVoiceConfigurer:", v20);
  v16 = -[SVXSpeechRequestConfigurer initWithConfigurationManager:voiceConfigurer:]([SVXSpeechRequestConfigurer alloc], "initWithConfigurationManager:voiceConfigurer:", v6, v20);
  v9 = v3;
  v18 = v3;
  v15 = -[SVXSynthesisVoiceConfigurer initWithConfigurationManager:speechSynthesisUtils:sessionUtils:voiceGenderConverter:]([SVXSynthesisVoiceConfigurer alloc], "initWithConfigurationManager:speechSynthesisUtils:sessionUtils:voiceGenderConverter:", v6, v3, v4, v8);
  v14 = objc_alloc_init(SVXAFSpeakableUtteranceParserProvider);
  v10 = objc_alloc_init(SVXLocalizationUtils);
  v11 = objc_alloc_init(SVXSpeechInstrumentationUtilities);
  v12 = objc_alloc_init(SVXSpeechSynthesisMetricsContextFactory);
  v25 = -[SVXSpeechSynthesizer initWithModule:speechSynthesisUtils:sessionUtils:voiceGenderConverter:announcer:configurationManager:audioStreamingAnnouncer:ttsSession:speechSynthesisConfigurer:speechRequestConfigurer:voiceConfigurer:notificationCenterRegistrar:speakableUtteranceParserProvider:localizationUtils:speechInstrumentationUtilities:metricsContextFactory:](self, "initWithModule:speechSynthesisUtils:sessionUtils:voiceGenderConverter:announcer:configurationManager:audioStreamingAnnouncer:ttsSession:speechSynthesisConfigurer:speechRequestConfigurer:voiceConfigurer:notificationCenterRegistrar:speakableUtteranceParserProvider:localizationUtils:speechInstrumentationUtilities:metricsContextFactory:", v23, v9, v4, v26, v22, v6, v21, v19, v17, v16, v15, v7, v14, v10, v11,
          v12);

  return v25;
}

- (SVXSpeechSynthesizer)initWithModule:(id)a3 speechSynthesisUtils:(id)a4 sessionUtils:(id)a5 voiceGenderConverter:(id)a6 announcer:(id)a7 configurationManager:(id)a8 audioStreamingAnnouncer:(id)a9 ttsSession:(id)a10 speechSynthesisConfigurer:(id)a11 speechRequestConfigurer:(id)a12 voiceConfigurer:(id)a13 notificationCenterRegistrar:(id)a14 speakableUtteranceParserProvider:(id)a15 localizationUtils:(id)a16 speechInstrumentationUtilities:(id)a17 metricsContextFactory:(id)a18
{
  SVXSpeechSynthesizer *v23;
  SVXSpeechSynthesizer *v24;
  uint64_t v25;
  NSMutableArray *pendingContexts;
  uint64_t v27;
  NSMutableSet *synthesizingContexts;
  SVXSpeechSynthesisUtils *speechSynthesisUtils;
  void *v30;
  void *v31;
  SVXSpeechSynthesisUtils *v32;
  void *v33;
  void *v34;
  SVXSpeechSynthesisConfiguration *v35;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v54 = a3;
  v53 = a4;
  v52 = a5;
  v51 = a6;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v44 = a13;
  v43 = a14;
  v42 = a15;
  v41 = a16;
  v40 = a17;
  v39 = a18;
  v55.receiver = self;
  v55.super_class = (Class)SVXSpeechSynthesizer;
  v23 = -[SVXSpeechSynthesizer init](&v55, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_speechSynthesisUtils, a4);
    objc_storeStrong((id *)&v24->_sessionUtils, a5);
    objc_storeStrong((id *)&v24->_voiceGenderConverter, a6);
    objc_storeStrong((id *)&v24->_module, a3);
    objc_storeStrong((id *)&v24->_announcer, a7);
    objc_storeStrong((id *)&v24->_configurationManager, a8);
    objc_storeStrong((id *)&v24->_audioStreamingAnnouncer, a9);
    objc_storeStrong((id *)&v24->_ttsSession, a10);
    objc_storeStrong((id *)&v24->_speechSynthesisConfigurer, a11);
    objc_storeStrong((id *)&v24->_speechRequestConfigurer, a12);
    objc_storeStrong((id *)&v24->_voiceConfigurer, a13);
    objc_storeStrong((id *)&v24->_notificationCenterRegistrar, a14);
    objc_storeStrong((id *)&v24->_speakableUtteranceParserProvider, a15);
    objc_storeStrong((id *)&v24->_speechInstrumentationUtilities, a17);
    objc_storeStrong((id *)&v24->_localizationUtils, a16);
    objc_storeStrong((id *)&v24->_metricsContextFactory, a18);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 16);
    pendingContexts = v24->_pendingContexts;
    v24->_pendingContexts = (NSMutableArray *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 16);
    synthesizingContexts = v24->_synthesizingContexts;
    v24->_synthesizingContexts = (NSMutableSet *)v27;

    speechSynthesisUtils = v24->_speechSynthesisUtils;
    -[SVXModule preferences](v24->_module, "preferences");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:](speechSynthesisUtils, "getLocaleWithAllowsFallback:preferences:", 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v24->_speechSynthesisUtils;
    -[SVXModule preferences](v24->_module, "preferences");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:](v32, "getOutputVoiceInfoWithAllowsFallback:preferences:", 0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = -[SVXSpeechSynthesisConfiguration initWithLocale:outputVoiceInfo:audioSessionID:]([SVXSpeechSynthesisConfiguration alloc], "initWithLocale:outputVoiceInfo:audioSessionID:", v31, v34, 0);
    -[SVXSpeechSynthesizer _configureWithConfiguration:](v24, "_configureWithConfiguration:", v35);
    -[SVXDefaultNotificationCenterRegistrar addObserver:selector:name:object:](v24->_notificationCenterRegistrar, "addObserver:selector:name:object:", v24, sel_outputVoiceChanged_, *MEMORY[0x24BE08E88], 0);
    -[SVXDefaultNotificationCenterRegistrar addObserver:selector:name:object:](v24->_notificationCenterRegistrar, "addObserver:selector:name:object:", v24, sel_languageCodeChanged_, *MEMORY[0x24BE08DF0], 0);

  }
  return v24;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  SVXAudioStreamingAnnouncer *audioStreamingAnnouncer;
  void *v18;
  SVXSpeechSynthesisConfigurationStateManager *configurationManager;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __77__SVXSpeechSynthesizer_startWithModuleInstanceProvider_platformDependencies___block_invoke;
  v25[3] = &unk_24D24EF00;
  v25[4] = self;
  v9 = v6;
  v26 = v9;
  v10 = v7;
  v27 = v10;
  objc_msgSend(v8, "performBlock:", v25);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "type", (_QWORD)v21) == 5)
        {
          audioStreamingAnnouncer = self->_audioStreamingAnnouncer;
          objc_msgSend(v16, "audioStreamingListener");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SVXAnnouncer addListener:](audioStreamingAnnouncer, "addListener:", v18);

        }
        if (objc_msgSend(v16, "type") == 7)
        {
          configurationManager = self->_configurationManager;
          objc_msgSend(v16, "clientAudioSystemService");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SVXSpeechSynthesisConfigurationStateManager setClientAudioSystemServicing:](configurationManager, "setClientAudioSystemServicing:", v20);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v13);
  }

}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[SVXModule performer](self->_module, "performer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SVXSpeechSynthesizer_stopWithModuleInstanceProvider___block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)prewarm
{
  void *v3;
  _QWORD v4[5];

  -[SVXModule performer](self->_module, "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__SVXSpeechSynthesizer_prewarm__block_invoke;
  v4[3] = &unk_24D24EFF0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)postcool
{
  void *v3;
  _QWORD v4[5];

  -[SVXModule performer](self->_module, "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__SVXSpeechSynthesizer_postcool__block_invoke;
  v4[3] = &unk_24D24EFF0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SVXSpeechSynthesizer_updateWithConfiguration___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SVXSpeechSynthesizer_addListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SVXSpeechSynthesizer_removeListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)outputVoiceChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SVXSpeechSynthesizer outputVoiceChanged:]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SVXSpeechSynthesizer_outputVoiceChanged___block_invoke;
  v6[3] = &unk_24D24EFF0;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)languageCodeChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SVXSpeechSynthesizer languageCodeChanged:]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__SVXSpeechSynthesizer_languageCodeChanged___block_invoke;
  v6[3] = &unk_24D24EFF0;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)didStartSpeakingRequest:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  SiriTTSDaemonSession *ttsSession;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  SiriTTSDaemonSession *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = mach_absolute_time();
  kdebug_trace();
  v6 = (id *)MEMORY[0x24BE08FE0];
  v7 = os_signpost_id_generate((os_log_t)*MEMORY[0x24BE08FE0]);
  v8 = *v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214934000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TextToSpeech", (const char *)&unk_2149C7932, buf, 2u);
  }

  self->_ttsSignpostInterval = v7;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136315650;
    v18 = "-[SVXSpeechSynthesizer didStartSpeakingRequest:]";
    v19 = 2112;
    v20 = ttsSession;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@", buf, 0x20u);
  }
  -[SVXModule performer](self->_module, "performer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__SVXSpeechSynthesizer_didStartSpeakingRequest___block_invoke;
  v14[3] = &unk_24D24ECE8;
  v14[4] = self;
  v15 = v4;
  v16 = v5;
  v13 = v4;
  objc_msgSend(v12, "performBlock:", v14);

}

- (void)didFinishSpeakingRequest:(id)a3 withInstrumentMetrics:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SiriTTSDaemonSession *ttsSession;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  SiriTTSDaemonSession *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXSpeechSynthesizer didFinishSpeakingRequest:withInstrumentMetrics:]";
    v18 = 2112;
    v19 = ttsSession;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@", buf, 0x20u);
  }
  -[SVXModule performer](self->_module, "performer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__SVXSpeechSynthesizer_didFinishSpeakingRequest_withInstrumentMetrics___block_invoke;
  v13[3] = &unk_24D24EF00;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)didFinishSpeakingRequest:(id)a3 successfully:(BOOL)a4 phonemesSpoken:(id)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t ttsSignpostInterval;
  NSObject *v14;
  SiriTTSDaemonSession *ttsSession;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  SiriTTSDaemonSession *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v7 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  kdebug_trace();
  v11 = (id)*MEMORY[0x24BE08FE0];
  v12 = v11;
  ttsSignpostInterval = self->_ttsSignpostInterval;
  if (ttsSignpostInterval - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_214934000, v12, OS_SIGNPOST_INTERVAL_END, ttsSignpostInterval, "TextToSpeech", (const char *)&unk_2149C7932, buf, 2u);
  }

  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136316162;
    v24 = "-[SVXSpeechSynthesizer didFinishSpeakingRequest:successfully:phonemesSpoken:withError:]";
    v25 = 2112;
    v26 = ttsSession;
    v27 = 2112;
    v28 = v9;
    v29 = 1024;
    v30 = v7;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, finishedSpeaking = %d, error = %@", buf, 0x30u);
  }
  -[SVXModule performer](self->_module, "performer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__SVXSpeechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke;
  v19[3] = &unk_24D24F130;
  v19[4] = self;
  v20 = v9;
  v22 = v7;
  v21 = v10;
  v17 = v10;
  v18 = v9;
  objc_msgSend(v16, "performBlock:", v19);

}

- (void)didStartPresynthesizedAudioRequest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  SiriTTSDaemonSession *ttsSession;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  SiriTTSDaemonSession *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = mach_absolute_time();
  kdebug_trace();
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSpeechSynthesizer didStartPresynthesizedAudioRequest:]";
    v15 = 2112;
    v16 = ttsSession;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@", buf, 0x20u);
  }
  -[SVXModule performer](self->_module, "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__SVXSpeechSynthesizer_didStartPresynthesizedAudioRequest___block_invoke;
  v10[3] = &unk_24D24ECE8;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v9 = v4;
  objc_msgSend(v8, "performBlock:", v10);

}

- (void)didStopPresynthesizedAudioRequest:(id)a3 atEnd:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  SiriTTSDaemonSession *ttsSession;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  SiriTTSDaemonSession *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136316162;
    v20 = "-[SVXSpeechSynthesizer didStopPresynthesizedAudioRequest:atEnd:error:]";
    v21 = 2112;
    v22 = ttsSession;
    v23 = 2112;
    v24 = v8;
    v25 = 1024;
    v26 = v6;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, atEnd = %d, error = %@", buf, 0x30u);
  }
  -[SVXModule performer](self->_module, "performer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__SVXSpeechSynthesizer_didStopPresynthesizedAudioRequest_atEnd_error___block_invoke;
  v15[3] = &unk_24D24F130;
  v15[4] = self;
  v16 = v8;
  v18 = v6;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "performBlock:", v15);

}

- (void)didFinishPresynthesizedAudioRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SiriTTSDaemonSession *ttsSession;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  SiriTTSDaemonSession *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136316162;
    v22 = "-[SVXSpeechSynthesizer didFinishPresynthesizedAudioRequest:withInstrumentMetrics:error:]";
    v23 = 2112;
    v24 = ttsSession;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, instrumentMetrics = %@, error = %@", buf, 0x34u);
  }
  -[SVXModule performer](self->_module, "performer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__SVXSpeechSynthesizer_didFinishPresynthesizedAudioRequest_withInstrumentMetrics_error___block_invoke;
  v17[3] = &unk_24D24E638;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v13, "performBlock:", v17);

}

- (void)withRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SiriTTSDaemonSession *ttsSession;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SVXSpeechSynthesizer *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  SiriTTSDaemonSession *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    v10 = v8;
    *(_DWORD *)buf = 136315906;
    v19 = "-[SVXSpeechSynthesizer withRequest:didReceiveTimingInfo:]";
    v20 = 2112;
    v21 = ttsSession;
    v22 = 2112;
    v23 = v6;
    v24 = 2048;
    v25 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, timingInfo.count = %tu", buf, 0x2Au);

  }
  -[SVXModule performer](self->_module, "performer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__SVXSpeechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke;
  v14[3] = &unk_24D24EF00;
  v15 = v7;
  v16 = self;
  v17 = v6;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "performBlock:", v14);

}

- (void)withRequest:(id)a3 didGenerateAudioChunk:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SiriTTSDaemonSession *ttsSession;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  SiriTTSDaemonSession *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136315906;
    v17 = "-[SVXSpeechSynthesizer withRequest:didGenerateAudioChunk:]";
    v18 = 2112;
    v19 = ttsSession;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, audio = %@", buf, 0x2Au);
  }
  -[SVXModule performer](self->_module, "performer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__SVXSpeechSynthesizer_withRequest_didGenerateAudioChunk___block_invoke;
  v13[3] = &unk_24D24EF00;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SiriTTSDaemonSession *ttsSession;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  SiriTTSDaemonSession *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    ttsSession = self->_ttsSession;
    *(_DWORD *)buf = 136316162;
    v22 = "-[SVXSpeechSynthesizer didFinishSynthesisRequest:withInstrumentMetrics:error:]";
    v23 = 2112;
    v24 = ttsSession;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s TTS session = %@, request = %@, instrumentMetrics = %@, error = %@", buf, 0x34u);
  }
  -[SVXModule performer](self->_module, "performer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__SVXSpeechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke;
  v17[3] = &unk_24D24E638;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v13, "performBlock:", v17);

}

- (BOOL)_useStreamingAudio
{
  return 0;
}

- (void)_prewarm
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SVXSpeechSynthesizer _prewarm]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  -[SiriTTSDaemonSession setKeepActive:](self->_ttsSession, "setKeepActive:", 1);
  -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](self->_configurationManager, "currentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioSessionID");

  if (v6)
  {
    self->_needsPrewarm = 0;
    -[SVXSpeechSynthesizer _prewarmWithContext:](self, "_prewarmWithContext:", 0);
  }
  else
  {
    v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[SVXSpeechSynthesizer _prewarm]";
      _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Skipped prewarming because audio session ID is unknown.", (uint8_t *)&v8, 0xCu);
    }
    self->_needsPrewarm = 1;
  }
}

- (void)_postcool
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SVXSpeechSynthesizer _postcool]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[SiriTTSDaemonSession setKeepActive:](self->_ttsSession, "setKeepActive:", 0);
}

- (void)_prewarmWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXSynthesisVoiceConfigurer *voiceConfigurer;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[SVXSpeechSynthesizer _prewarmWithContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v10, 0x16u);
  }
  voiceConfigurer = self->_voiceConfigurer;
  -[SVXModule preferences](self->_module, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXSynthesisVoiceConfigurer voiceForContext:preferences:](voiceConfigurer, "voiceForContext:preferences:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVXSpeechSynthesisConfigurer synthesisRequestForText:voice:](self->_speechSynthesisConfigurer, "synthesisRequestForText:voice:", &stru_24D24F378, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriTTSDaemonSession prewarmWithRequest:didFinish:](self->_ttsSession, "prewarmWithRequest:didFinish:", v9, &__block_literal_global_2106);

}

- (void)_configureWithConfiguration:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (-[SVXSpeechSynthesisConfigurationStateManager updateConfiguration:](self->_configurationManager, "updateConfiguration:", a3))
  {
    -[SVXModule performer](self->_module, "performer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__SVXSpeechSynthesizer__configureWithConfiguration___block_invoke;
    v5[3] = &unk_24D24EFF0;
    v5[4] = self;
    objc_msgSend(v4, "performBlock:withOptions:", v5, 0);

  }
}

- (void)_handleDidStartSpeakingWithSpeechRequest:(id)a3 timestamp:(unint64_t)a4
{
  SVXSpeechSynthesisContext *v6;
  os_log_t *v7;
  NSObject *v8;
  SVXSpeechSynthesisContext *v9;
  NSObject *v10;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  void *v12;
  void *v13;
  SVXSpeechSynthesisAnnouncer *announcer;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  SVXSpeechSynthesisContext *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (SVXSpeechSynthesisContext *)a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v20 = 136315394;
    v21 = "-[SVXSpeechSynthesizer _handleDidStartSpeakingWithSpeechRequest:timestamp:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@", (uint8_t *)&v20, 0x16u);
  }
  -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
  v9 = (SVXSpeechSynthesisContext *)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      v20 = 136315394;
      v21 = "-[SVXSpeechSynthesizer _handleDidStartSpeakingWithSpeechRequest:timestamp:]";
      v22 = 2112;
      v23 = currentSpeakingContext;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s Started TTS for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v20, 0x16u);
    }
    -[SVXModule analytics](self->_module, "analytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisContext analyticsContext](self->_currentSpeakingContext, "analyticsContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logEventWithType:context:", 2706, v13);

    announcer = self->_announcer;
    -[SVXSpeechSynthesisContext request](self->_currentSpeakingContext, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x24BE09368]);
    -[SVXSpeechSynthesisContext text](v6, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithUtterance:beginTimestamp:endTimestamp:", v17, a4, 0);
    -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidStartRequest:record:taskTracker:](announcer, "speechSynthesizerDidStartRequest:record:taskTracker:", v15, v18, v19);

  }
}

- (void)_handleDidFinishSpeakingWithSpeechRequest:(id)a3 instrumentMetrics:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  SVXSpeechInstrumentationUtilities *speechInstrumentationUtilities;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[2];
  _QWORD v69[2];
  const __CFString *v70;
  uint64_t v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v73 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:instrumentMetrics:]";
    v74 = 2112;
    v75 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@", buf, 0x16u);
  }
  -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[SVXSpeechSynthesisContext setInstrumentMetrics:](self->_currentSpeakingContext, "setInstrumentMetrics:", v7);
    if (v7)
    {
      -[SVXSpeechSynthesisContext request](self->_currentSpeakingContext, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:forKey:", v12, CFSTR("id"));
      v70 = CFSTR("id");
      v71 = v12;
      v60 = (void *)v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVXSpeechSynthesisContext analyticsContext](self->_currentSpeakingContext, "analyticsContext");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = (void *)MEMORY[0x24BDBD1B8];
      if (v13)
        v15 = (void *)v13;
      v16 = v15;

      v17 = -[SVXSpeechSynthesizer _isInternalInstall](self, "_isInternalInstall");
      v63 = v10;
      if (v17
        || (-[SVXModule preferences](self->_module, "preferences"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "shouldLogForQA")))
      {
        v68[0] = CFSTR("text");
        objc_msgSend(v10, "speakableText");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = &stru_24D24F378;
        v68[1] = CFSTR("utterance");
        v69[0] = v20;
        objc_msgSend(v7, "utterance");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
          v23 = (const __CFString *)v21;
        else
          v23 = &stru_24D24F378;
        v69[1] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v63;
        if (v17)
          goto LABEL_19;
      }
      else
      {
        v24 = (void *)MEMORY[0x24BDBD1B8];
      }

LABEL_19:
      v25 = objc_msgSend(v7, "requestCreatedTime");
      if (v25)
      {
        v26 = v25;
        -[SVXModule analytics](self->_module, "analytics");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v61;
        v67[1] = v16;
        v67[2] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logEventWithType:machAbsoluteTime:context:", 1801, v26, v29);

        speechInstrumentationUtilities = self->_speechInstrumentationUtilities;
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "instrumentationContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechInstrumentationUtilities emitTextToSpeechRequestReceived:instrumentMetrics:](speechInstrumentationUtilities, "emitTextToSpeechRequestReceived:instrumentMetrics:", v32, v7);

        v10 = v63;
      }
      v33 = objc_msgSend(v7, "speechBeginTime");
      if (v33)
      {
        v34 = v33;
        -[SVXModule analytics](self->_module, "analytics");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v62;
        v66[1] = v16;
        v66[2] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logEventWithType:machAbsoluteTime:context:", 1802, v34, v37);

        v38 = objc_alloc_init(MEMORY[0x24BE95B90]);
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "aceId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setAceID:", v40);

        v41 = *MEMORY[0x24BE09010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:instrumentMetrics:]";
          v74 = 2112;
          v75 = v38;
          _os_log_impl(&dword_214934000, v41, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "instrumentationContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "emitInstrumentation:machAbsoluteTime:", v38, v34);

        v10 = v63;
      }
      v44 = objc_msgSend(v7, "speechEstimatedOutputBeginTime");
      if (v44 >= 1)
      {
        v45 = v44;
        -[SVXModule analytics](self->_module, "analytics");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v62;
        v65[1] = v16;
        v65[2] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 3);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logEventWithType:machAbsoluteTime:context:", 1806, v45, v48);

        v10 = v63;
      }
      v49 = objc_msgSend(v7, "speechEndTime");
      if (v49)
      {
        v50 = v49;
        -[SVXModule analytics](self->_module, "analytics");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v62;
        v64[1] = v16;
        v64[2] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "logEventWithType:machAbsoluteTime:context:", 1803, v50, v53);

        v54 = objc_alloc_init(MEMORY[0x24BE95B98]);
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "aceId");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setAceID:", v56);

        v57 = *MEMORY[0x24BE09010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:instrumentMetrics:]";
          v74 = 2112;
          v75 = v54;
          _os_log_impl(&dword_214934000, v57, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "instrumentationContext");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "emitInstrumentation:machAbsoluteTime:", v54, v50);

        v10 = v63;
      }

    }
  }

}

- (void)_handleDidFinishSpeakingWithSpeechRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  SVXSpeechSynthesisContext *v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  SVXSpeechSynthesisContext *v12;
  NSObject *v13;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  SVXSpeechSynthesisContext *v15;
  SVXSpeechSynthesisContext *v16;
  void *v17;
  SVXSpeechSynthesizer *v18;
  SVXSpeechSynthesisContext *v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v23;
  const char *v24;
  __int16 v25;
  SVXSpeechSynthesisContext *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = (SVXSpeechSynthesisContext *)a3;
  v9 = a5;
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v23 = 136315906;
    v24 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:success:error:]";
    v25 = 2112;
    v26 = v8;
    v27 = 1024;
    v28 = v6;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s speechRequest = %@, success = %d, error = %@", (uint8_t *)&v23, 0x26u);
  }
  -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
  v12 = (SVXSpeechSynthesisContext *)objc_claimAutoreleasedReturnValue();

  if (v12 == v8)
  {
    v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      v23 = 136315394;
      v24 = "-[SVXSpeechSynthesizer _handleDidFinishSpeakingWithSpeechRequest:success:error:]";
      v25 = 2112;
      v26 = currentSpeakingContext;
      _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Stopped TTS for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v23, 0x16u);
    }
    v15 = self->_currentSpeakingContext;
    if (!v9)
    {
      -[SVXSpeechSynthesisContext text](v8, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self;
      v19 = v15;
      v20 = 1;
      v21 = v17;
      v22 = 0;
      goto LABEL_10;
    }
    if (!-[SVXSpeechSynthesizer _continueContext:error:](self, "_continueContext:error:", self->_currentSpeakingContext, 0))
    {
      v16 = self->_currentSpeakingContext;
      -[SVXSpeechSynthesisContext text](v8, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self;
      v19 = v16;
      v20 = 4;
      v21 = v17;
      v22 = v9;
LABEL_10:
      -[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:](v18, "_finalizeContext:withResultType:utterance:error:", v19, v20, v21, v22);

    }
  }

}

- (void)_handleDidStartPresynthesizedAudioRequest:(id)a3 timestamp:(unint64_t)a4
{
  SVXSpeechSynthesisContext *v6;
  os_log_t *v7;
  NSObject *v8;
  SVXSpeechSynthesisContext *v9;
  NSObject *v10;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  void *v12;
  void *v13;
  SVXSpeechSynthesisAnnouncer *announcer;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  SVXSpeechSynthesisContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (SVXSpeechSynthesisContext *)a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "-[SVXSpeechSynthesizer _handleDidStartPresynthesizedAudioRequest:timestamp:]";
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s presynthesizedAudioRequest = %@", (uint8_t *)&v18, 0x16u);
  }
  -[SVXSpeechSynthesisContext presynthesizedAudioRequest](self->_currentSpeakingContext, "presynthesizedAudioRequest");
  v9 = (SVXSpeechSynthesisContext *)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      v18 = 136315394;
      v19 = "-[SVXSpeechSynthesizer _handleDidStartPresynthesizedAudioRequest:timestamp:]";
      v20 = 2112;
      v21 = currentSpeakingContext;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s Started TTS with presynthesized audio for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v18, 0x16u);
    }
    -[SVXModule analytics](self->_module, "analytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisContext analyticsContext](self->_currentSpeakingContext, "analyticsContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logEventWithType:context:", 2706, v13);

    announcer = self->_announcer;
    -[SVXSpeechSynthesisContext request](self->_currentSpeakingContext, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09368]), "initWithUtterance:beginTimestamp:endTimestamp:", 0, a4, 0);
    -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidStartRequest:record:taskTracker:](announcer, "speechSynthesizerDidStartRequest:record:taskTracker:", v15, v16, v17);

  }
}

- (void)_handleDidStopPresynthesizedAudioRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  SVXSpeechSynthesisContext *v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  SVXSpeechSynthesisContext *v12;
  NSObject *v13;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  int v15;
  const char *v16;
  __int16 v17;
  SVXSpeechSynthesisContext *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = (SVXSpeechSynthesisContext *)a3;
  v9 = a5;
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v15 = 136315906;
    v16 = "-[SVXSpeechSynthesizer _handleDidStopPresynthesizedAudioRequest:success:error:]";
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = v6;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s presynthesizedAudioRequest = %@, success = %d, error = %@", (uint8_t *)&v15, 0x26u);
  }
  -[SVXSpeechSynthesisContext presynthesizedAudioRequest](self->_currentSpeakingContext, "presynthesizedAudioRequest");
  v12 = (SVXSpeechSynthesisContext *)objc_claimAutoreleasedReturnValue();

  if (v12 == v8)
  {
    v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      v15 = 136315394;
      v16 = "-[SVXSpeechSynthesizer _handleDidStopPresynthesizedAudioRequest:success:error:]";
      v17 = 2112;
      v18 = currentSpeakingContext;
      _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Stopped TTS with presynthesized audio for current speaking context. (_currentSpeakingContext = %@)", (uint8_t *)&v15, 0x16u);
    }
  }

}

- (void)_handleDidFinishPresynthesizedAudioRequest:(id)a3 instrumentMetrics:(id)a4 error:(id)a5
{
  SVXSpeechSynthesisContext *v8;
  id v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  SVXSpeechSynthesisContext *v13;
  NSObject *v14;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  SVXSpeechInstrumentationUtilities *speechInstrumentationUtilities;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  SVXSpeechSynthesisContext *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  SVXSpeechSynthesisContext *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  SVXSpeechSynthesisContext *v65;
  SVXSpeechSynthesizer *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[4];
  _QWORD v80[2];
  _QWORD v81[2];
  const __CFString *v82;
  uint64_t v83;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  SVXSpeechSynthesisContext *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v8 = (SVXSpeechSynthesisContext *)a3;
  v9 = a4;
  v10 = a5;
  v11 = (os_log_t *)MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
    v86 = 2112;
    v87 = v8;
    v88 = 2112;
    v89 = v9;
    v90 = 2112;
    v91 = v10;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s presynthesizedAudioRequest = %@, instrumentMetrics = %@, error = %@", buf, 0x2Au);
  }
  -[SVXSpeechSynthesisContext presynthesizedAudioRequest](self->_currentSpeakingContext, "presynthesizedAudioRequest");
  v13 = (SVXSpeechSynthesisContext *)objc_claimAutoreleasedReturnValue();

  if (v13 == v8)
  {
    v14 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      currentSpeakingContext = self->_currentSpeakingContext;
      *(_DWORD *)buf = 136315394;
      v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
      v86 = 2112;
      v87 = currentSpeakingContext;
      _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s Stopped TTS with presynthesized audio for current speaking context. (_currentSpeakingContext = %@)", buf, 0x16u);
    }
    -[SVXSpeechSynthesisContext setInstrumentMetrics:](self->_currentSpeakingContext, "setInstrumentMetrics:", v9);
    if (v9)
    {
      -[SVXSpeechSynthesisContext request](self->_currentSpeakingContext, "request");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = objc_claimAutoreleasedReturnValue();

      -[SVXSpeechSynthesisMetricsContextFactory creationContextFromInstrumentMetrics:](self->_metricsContextFactory, "creationContextFromInstrumentMetrics:", v9);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = CFSTR("id");
      v71 = (void *)v17;
      v83 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVXSpeechSynthesisContext analyticsContext](self->_currentSpeakingContext, "analyticsContext");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = (void *)MEMORY[0x24BDBD1B8];
      if (v18)
        v21 = (void *)v18;
      else
        v21 = (void *)MEMORY[0x24BDBD1B8];
      v74 = v21;

      if (-[SVXSpeechSynthesizer _isInternalInstall](self, "_isInternalInstall"))
      {
        v80[0] = CFSTR("text");
        objc_msgSend(v72, "speakableText");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22)
          v24 = (const __CFString *)v22;
        else
          v24 = &stru_24D24F378;
        v80[1] = CFSTR("utterance");
        v81[0] = v24;
        objc_msgSend(v9, "utterance");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v25)
          v27 = (const __CFString *)v25;
        else
          v27 = &stru_24D24F378;
        v81[1] = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v28 = objc_msgSend(v9, "requestCreatedTime");
      if (v28)
      {
        v29 = v28;
        -[SVXModule analytics](self->_module, "analytics");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = v73;
        v79[1] = v75;
        v79[2] = v74;
        v79[3] = v20;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logEventWithType:machAbsoluteTime:context:", 1801, v29, v32);

        speechInstrumentationUtilities = self->_speechInstrumentationUtilities;
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "instrumentationContext");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechInstrumentationUtilities emitTextToSpeechRequestReceived:instrumentMetrics:](speechInstrumentationUtilities, "emitTextToSpeechRequestReceived:instrumentMetrics:", v35, v9);

      }
      v36 = objc_msgSend(v9, "speechBeginTime");
      if (v36)
      {
        v37 = v36;
        -[SVXModule analytics](self->_module, "analytics");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = v75;
        v78[1] = v74;
        v78[2] = v20;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logEventWithType:machAbsoluteTime:context:", 1802, v37, v40);

        v41 = (SVXSpeechSynthesisContext *)objc_alloc_init(MEMORY[0x24BE95B90]);
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "aceId");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechSynthesisContext setAceID:](v41, "setAceID:", v43);

        v44 = *MEMORY[0x24BE09010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
          v86 = 2112;
          v87 = v41;
          _os_log_impl(&dword_214934000, v44, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "instrumentationContext");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "emitInstrumentation:machAbsoluteTime:", v41, v37);

      }
      v47 = objc_msgSend(v9, "speechEstimatedOutputBeginTime");
      if (v47 >= 1)
      {
        v48 = v47;
        -[SVXModule analytics](self->_module, "analytics");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = v75;
        v77[1] = v74;
        v77[2] = v20;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 3);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "logEventWithType:machAbsoluteTime:context:", 1806, v48, v51);

      }
      v52 = objc_msgSend(v9, "speechEndTime");
      if (v52)
      {
        v53 = v52;
        -[SVXModule analytics](self->_module, "analytics");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v75;
        v76[1] = v74;
        v76[2] = v20;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "logEventWithType:machAbsoluteTime:context:", 1803, v53, v56);

        v57 = (SVXSpeechSynthesisContext *)objc_alloc_init(MEMORY[0x24BE95B98]);
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "aceId");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechSynthesisContext setAceID:](v57, "setAceID:", v59);

        v60 = *MEMORY[0x24BE09010];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v85 = "-[SVXSpeechSynthesizer _handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:]";
          v86 = 2112;
          v87 = v57;
          _os_log_impl(&dword_214934000, v60, OS_LOG_TYPE_INFO, "%s Emit instrumentation: %@", buf, 0x16u);
        }
        -[SVXSpeechSynthesisContext taskTracker](self->_currentSpeakingContext, "taskTracker");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "instrumentationContext");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "emitInstrumentation:machAbsoluteTime:", v57, v53);

      }
    }
    if (!v10)
    {
      -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "text");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = self->_currentSpeakingContext;
      v66 = self;
      v67 = 1;
      v68 = v64;
      v69 = 0;
      goto LABEL_35;
    }
    if (!-[SVXSpeechSynthesizer _continueContext:error:](self, "_continueContext:error:", self->_currentSpeakingContext, 0))
    {
      -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "text");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = self->_currentSpeakingContext;
      v66 = self;
      v67 = 4;
      v68 = v64;
      v69 = v10;
LABEL_35:
      -[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:](v66, "_finalizeContext:withResultType:utterance:error:", v65, v67, v68, v69);

    }
  }

}

- (void)_handleDidReceiveSpeechWordTimingInfoArray:(id)a3 forSpeechRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[SVXSpeechSynthesizer _handleDidReceiveSpeechWordTimingInfoArray:forSpeechRequest:]";
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@, speechWordTimingInfoArray = %@", buf, 0x20u);
  }
  -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
    -[SVXSpeechSynthesisContext setSpeechWordTimingInfoArray:](self->_currentSpeakingContext, "setSpeechWordTimingInfoArray:", v6);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_synthesizingContexts;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v15, "speechRequest", (_QWORD)v17);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v7)
          objc_msgSend(v15, "setSpeechWordTimingInfoArray:", v6);
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)_handleDidGenerateAudioChunkData:(id)a3 forSpeechRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[SVXSpeechSynthesizer _handleDidGenerateAudioChunkData:forSpeechRequest:]";
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s speechRequest = %@, audioChunkData = %@", buf, 0x20u);
  }
  -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    if (-[SVXSpeechSynthesisContext isStreamingSynthesisRequest](self->_currentSpeakingContext, "isStreamingSynthesisRequest"))
    {
      -[SVXAudioStreamingAnnouncer audioStreamDidProvideAudio:](self->_audioStreamingAnnouncer, "audioStreamDidProvideAudio:", v6);
    }
    else
    {
      -[SVXSpeechSynthesisContext handleAudioChunkData:](self->_currentSpeakingContext, "handleAudioChunkData:", v6);
    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_synthesizingContexts;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v15, "speechRequest", (_QWORD)v17);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v7)
        {
          if (objc_msgSend(v15, "isStreamingSynthesisRequest"))
            -[SVXAudioStreamingAnnouncer audioStreamDidProvideAudio:](self->_audioStreamingAnnouncer, "audioStreamDidProvideAudio:", v6);
          else
            objc_msgSend(v15, "handleAudioChunkData:", v6);
        }
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)_handleDidFinishSynthesizingForSpeechRequest:(id)a3 instrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSMutableSet *synthesizingContexts;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  int v24;
  void *v25;
  const __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  const __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  SVXSpeechInstrumentationUtilities *speechInstrumentationUtilities;
  void *v38;
  void *v39;
  SVXSpeechInstrumentationUtilities *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  SVXSpeechSynthesizer *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  id obj;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  SVXSpeechSynthesizer *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[4];
  _QWORD v77[2];
  _QWORD v78[2];
  const __CFString *v79;
  uint64_t v80;
  uint8_t v81[128];
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v83 = "-[SVXSpeechSynthesizer _handleDidFinishSynthesizingForSpeechRequest:instrumentMetrics:error:]";
    v84 = 2112;
    v85 = v8;
    v86 = 2112;
    v87 = v9;
    v88 = 2112;
    v89 = v10;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s speechRequest = %@, instrumentMetrics = %@, error = %@", buf, 0x2Au);
  }
  synthesizingContexts = self->_synthesizingContexts;
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __93__SVXSpeechSynthesizer__handleDidFinishSynthesizingForSpeechRequest_instrumentMetrics_error___block_invoke;
  v72[3] = &unk_24D24C078;
  v60 = v8;
  v73 = v60;
  -[NSMutableSet objectsPassingTest:](synthesizingContexts, "objectsPassingTest:", v72);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[NSMutableSet minusSet:](self->_synthesizingContexts, "minusSet:", v13);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v57 = v13;
    obj = v13;
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    if (!v63)
      goto LABEL_36;
    v62 = *(_QWORD *)v69;
    v67 = self;
    v59 = v10;
    while (1)
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v69 != v62)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v15, "setInstrumentMetrics:", v9);
        if (v9)
        {
          objc_msgSend(v15, "request");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = objc_claimAutoreleasedReturnValue();

          -[SVXSpeechSynthesisMetricsContextFactory creationContextFromInstrumentMetrics:](self->_metricsContextFactory, "creationContextFromInstrumentMetrics:", v9);
          v64 = (void *)v17;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = CFSTR("id");
          v80 = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "analyticsContext");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v21 = (void *)MEMORY[0x24BDBD1B8];
          if (v19)
            v21 = (void *)v19;
          v22 = v21;

          v23 = -[SVXSpeechSynthesizer _isInternalInstall](self, "_isInternalInstall");
          if (!v23)
          {
            -[SVXModule preferences](self->_module, "preferences");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v61, "shouldLogForQA");
            v25 = (void *)MEMORY[0x24BDBD1B8];
            if (!v24)
              goto LABEL_21;
          }
          v77[0] = CFSTR("text");
          objc_msgSend(v66, "speakableText");
          v26 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v27 = (__CFString *)v26;
          v28 = v26 ? (__CFString *)v26 : &stru_24D24F378;
          v77[1] = CFSTR("utterance");
          v78[0] = v28;
          objc_msgSend(v9, "utterance");
          v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v30 = (__CFString *)v29;
          v31 = v29 ? (__CFString *)v29 : &stru_24D24F378;
          v78[1] = v31;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
LABEL_21:

          v32 = objc_msgSend(v9, "requestCreatedTime");
          if (v32)
          {
            v33 = v32;
            -[SVXModule analytics](self->_module, "analytics");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v76[0] = v65;
            v76[1] = v18;
            v76[2] = v22;
            v76[3] = v25;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 4);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            AFAnalyticsContextsMerge();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "logEventWithType:machAbsoluteTime:context:", 1801, v33, v36);

            speechInstrumentationUtilities = v67->_speechInstrumentationUtilities;
            -[SVXSpeechSynthesisContext taskTracker](v67->_currentSpeakingContext, "taskTracker");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "instrumentationContext");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = speechInstrumentationUtilities;
            self = v67;
            -[SVXSpeechInstrumentationUtilities emitTextToSpeechRequestReceived:instrumentMetrics:](v40, "emitTextToSpeechRequestReceived:instrumentMetrics:", v39, v9);

          }
          v41 = objc_msgSend(v9, "synthesisBeginTime");
          if (v41)
          {
            v42 = v41;
            -[SVXModule analytics](self->_module, "analytics");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v75[0] = v18;
            v75[1] = v22;
            v75[2] = v25;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 3);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            AFAnalyticsContextsMerge();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "logEventWithType:machAbsoluteTime:context:", 1804, v42, v45);

            self = v67;
          }
          v46 = objc_msgSend(v9, "synthesisEndTime");
          if (v46)
          {
            v47 = v46;
            -[SVXModule analytics](self->_module, "analytics");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v74[0] = v18;
            v74[1] = v22;
            v74[2] = v25;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 3);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            AFAnalyticsContextsMerge();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "logEventWithType:machAbsoluteTime:context:", 1805, v47, v50);

            self = v67;
          }

          v10 = v59;
        }
        if (v10)
        {
          if (-[SVXSpeechSynthesizer _continueContext:error:](self, "_continueContext:error:", v15, 0))
            continue;
          objc_msgSend(v60, "text");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = self;
          v53 = v15;
          v54 = 4;
          v55 = v51;
          v56 = v10;
        }
        else
        {
          objc_msgSend(v60, "text");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = self;
          v53 = v15;
          v54 = 1;
          v55 = v51;
          v56 = 0;
        }
        -[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:](v52, "_finalizeContext:withResultType:utterance:error:", v53, v54, v55, v56);

      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
      if (!v63)
      {
LABEL_36:

        v13 = v57;
        break;
      }
    }
  }

}

- (unint64_t)_numberOfContexts
{
  unint64_t result;

  result = -[NSMutableArray count](self->_pendingContexts, "count");
  if (self->_currentSpeakingContext)
    ++result;
  return result;
}

- (void)_enqueueContext:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  SVXSpeechSynthesisAnnouncer *announcer;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *pendingContexts;
  _QWORD v26[5];
  _QWORD v27[6];
  uint8_t v28[4];
  const char *v29;
  __int16 v30;
  SVXSpeechSynthesisContext *v31;
  _BYTE buf[24];
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _enqueueContext:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  v7 = -[SVXSpeechSynthesizer _numberOfContexts](self, "_numberOfContexts");
  v8 = objc_msgSend(v4, "operationType");
  objc_msgSend(v4, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "priority");
  if (v8 != 2)
    goto LABEL_19;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v33) = 0;
  if (v10 == 3)
  {
    -[SVXSpeechSynthesizer _cancelPendingSpeakingContextsWithPriorityBelow:](self, "_cancelPendingSpeakingContextsWithPriorityBelow:", 3);
    -[SVXSpeechSynthesisContext request](self->_currentSpeakingContext, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "priority") < 3;

    if (v16)
      -[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:](self, "_stopCurrentSpeakingContextWithInterruptionBehavior:", 1);
    goto LABEL_16;
  }
  if (v10 == 2)
  {
    -[SVXSpeechSynthesizer _cancelPendingSpeakingContextsWithPriorityBelow:](self, "_cancelPendingSpeakingContextsWithPriorityBelow:", 2);
  }
  else
  {
    if (v10 == 1)
    {
      -[SVXSpeechSynthesisContext request](self->_currentSpeakingContext, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "priority") > 1;

      if (!v12)
      {
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          pendingContexts = self->_pendingContexts;
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __40__SVXSpeechSynthesizer__enqueueContext___block_invoke;
          v27[3] = &unk_24D24C0A0;
          v27[4] = buf;
          v27[5] = 1;
          -[NSMutableArray enumerateObjectsUsingBlock:](pendingContexts, "enumerateObjectsUsingBlock:", v27);
        }
        goto LABEL_16;
      }
      v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        currentSpeakingContext = self->_currentSpeakingContext;
        *(_DWORD *)v28 = 136315394;
        v29 = "-[SVXSpeechSynthesizer _enqueueContext:]";
        v30 = 2112;
        v31 = currentSpeakingContext;
        _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Ignored because current speaking context (%@) has a higher priority.", v28, 0x16u);
      }
    }
    else
    {
      v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v28 = 136315138;
        v29 = "-[SVXSpeechSynthesizer _enqueueContext:]";
        _os_log_error_impl(&dword_214934000, v17, OS_LOG_TYPE_ERROR, "%s Ignored because no priority is specified.", v28, 0xCu);
      }
    }
    *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 1;
  }
LABEL_16:
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:](self, "_finalizeContext:withResultType:utterance:error:", v4, 2, 0, 0);
    _Block_object_dispose(buf, 8);
    goto LABEL_25;
  }
  kdebug_trace();
  _Block_object_dispose(buf, 8);
LABEL_19:
  announcer = self->_announcer;
  objc_msgSend(v4, "taskTracker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXSpeechSynthesisAnnouncer speechSynthesizerWillEnqueueRequest:taskTracker:](announcer, "speechSynthesizerWillEnqueueRequest:taskTracker:", v9, v19);

  -[NSMutableArray addObject:](self->_pendingContexts, "addObject:", v4);
  v20 = -[SVXSpeechSynthesizer _numberOfContexts](self, "_numberOfContexts");
  v21 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _enqueueContext:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2048;
    v33 = v20;
    _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s (numberOfContexts: %tu -> %tu)", buf, 0x20u);
  }
  if (!v7 && v20)
    -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidBecomeBusy](self->_announcer, "speechSynthesizerDidBecomeBusy");
  -[SVXModule analytics](self->_module, "analytics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logEventWithType:context:", 2701, v23);

  -[SVXModule performer](self->_module, "performer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __40__SVXSpeechSynthesizer__enqueueContext___block_invoke_44;
  v26[3] = &unk_24D24EFF0;
  v26[4] = self;
  objc_msgSend(v24, "performBlock:withOptions:", v26, 0);

LABEL_25:
}

- (void)_processPendingContexts
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  NSMutableArray *pendingContexts;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  SVXSpeechSynthesizer *v28;
  __int128 *p_buf;
  _QWORD *v30;
  _QWORD v31[4];
  uint8_t v32[128];
  uint8_t v33[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int128 buf;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SVXSpeechSynthesizer _processPendingContexts]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](self->_configurationManager, "currentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioSessionID");

  if (self->_needsPrewarm)
  {
    if (v6)
    {
      -[SVXSpeechSynthesizer _prewarm](self, "_prewarm");
    }
    else
    {
      v7 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[SVXSpeechSynthesizer _processPendingContexts]";
        _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Skipped prewarming because there's no audio session ID configured.", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  if (-[NSMutableArray count](self->_pendingContexts, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1698]);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x2020000000;
    v39 = 0x7FFFFFFFFFFFFFFFLL;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    pendingContexts = self->_pendingContexts;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __47__SVXSpeechSynthesizer__processPendingContexts__block_invoke;
    v26[3] = &unk_24D24C0C8;
    v10 = v8;
    v27 = v10;
    v28 = self;
    p_buf = &buf;
    v30 = v31;
    -[NSMutableArray enumerateObjectsUsingBlock:](pendingContexts, "enumerateObjectsUsingBlock:", v26);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "addIndex:");
    if (objc_msgSend(v10, "count"))
    {
      -[NSMutableArray objectsAtIndexes:](self->_pendingContexts, "objectsAtIndexes:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsAtIndexes:](self->_pendingContexts, "removeObjectsAtIndexes:", v10);
      v12 = *v3;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend(v11, "count");
        *(_DWORD *)v33 = 136315394;
        v34 = "-[SVXSpeechSynthesizer _processPendingContexts]";
        v35 = 2048;
        v36 = v13;
        _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s Dequeued %tu pending contexts to process.", v33, 0x16u);
      }

      if (-[SVXSpeechSynthesizer _isInternalInstall](self, "_isInternalInstall")
        || (-[SVXModule preferences](self->_module, "preferences"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "shouldLogForQA"),
            v14,
            v15))
      {
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_47);
      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = v11;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v16);
            -[SVXSpeechSynthesizer _startContext:](self, "_startContext:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        }
        while (v17);
      }

    }
    else
    {
      v21 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v33 = 136315138;
        v34 = "-[SVXSpeechSynthesizer _processPendingContexts]";
        _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s Skipped processing pending contexts because there's no suitable pending context.", v33, 0xCu);
      }
    }

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v20 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[SVXSpeechSynthesizer _processPendingContexts]";
      _os_log_impl(&dword_214934000, v20, OS_LOG_TYPE_INFO, "%s Skipped processing next pending context because there is no pending context.", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)_startContext:(id)a3
{
  SVXSpeechSynthesisContext *v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  SVXSpeechSynthesisAnnouncer *announcer;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  SVXSpeechSynthesisContext *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  SVXSessionManager *sessionManager;
  NSObject *v19;
  NSObject *v20;
  SVXSpeechSynthesisContext **p_currentSpeakingContext;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  SVXSpeechSynthesisContext *v27;
  _QWORD v28[5];
  SVXSpeechSynthesisContext *v29;
  id v30;
  _QWORD v31[5];
  SVXSpeechSynthesisContext *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  SVXSpeechSynthesisContext *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = (SVXSpeechSynthesisContext *)a3;
  v6 = (os_log_t *)MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[SVXSpeechSynthesizer _startContext:]";
    v35 = 2112;
    v36 = v5;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (v5)
  {
    -[SVXSpeechSynthesisContext prepare](v5, "prepare");
    -[SVXSpeechSynthesisContext request](v5, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    announcer = self->_announcer;
    -[SVXSpeechSynthesisContext taskTracker](v5, "taskTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisAnnouncer speechSynthesizerWillStartRequest:taskTracker:](announcer, "speechSynthesizerWillStartRequest:taskTracker:", v8, v10);

    v11 = -[SVXSpeechSynthesisContext operationType](v5, "operationType");
    if (v11 == 2)
    {
      if (-[SVXSpeechSynthesizer _isTTSPlaybackDisabled](self, "_isTTSPlaybackDisabled"))
      {
        v20 = *MEMORY[0x24BE08FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[SVXSpeechSynthesizer _startContext:]";
          v35 = 2112;
          v36 = v5;
          _os_log_impl(&dword_214934000, v20, OS_LOG_TYPE_DEFAULT, "%s TTS is disabled. Cancel speaking context %@.", buf, 0x16u);
        }
        -[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:](self, "_finalizeContext:withResultType:utterance:error:", v5, 2, 0, 0);
        goto LABEL_16;
      }
      p_currentSpeakingContext = &self->_currentSpeakingContext;
      currentSpeakingContext = self->_currentSpeakingContext;
      if (currentSpeakingContext)
      {
        v23 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[SVXSpeechSynthesizer _startContext:]";
          v35 = 2112;
          v36 = currentSpeakingContext;
          _os_log_error_impl(&dword_214934000, v23, OS_LOG_TYPE_ERROR, "%s Attempted to start a new speaking context when the current speaking context still exists. (_currentSpeakingContext = %@)", buf, 0x16u);
          currentSpeakingContext = *p_currentSpeakingContext;
        }
        -[SVXSpeechSynthesisContext speechRequest](currentSpeakingContext, "speechRequest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "text");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:](self, "_finalizeContext:withResultType:utterance:error:", self->_currentSpeakingContext, 3, v25, 0);
      }
      if (-[SVXSpeechSynthesisUtils requestHasSpeakableContents:](self->_speechSynthesisUtils, "requestHasSpeakableContents:", v8))
      {
        v12 = -[SVXSpeechSynthesisContext audioSessionID](v5, "audioSessionID") == 0;
      }
      else
      {
        v12 = 0;
      }
      objc_storeStrong((id *)&self->_currentSpeakingContext, a3);
      v26 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
      {
        v27 = *p_currentSpeakingContext;
        *(_DWORD *)buf = 136315394;
        v34 = "-[SVXSpeechSynthesizer _startContext:]";
        v35 = 2112;
        v36 = v27;
        _os_log_impl(&dword_214934000, v26, OS_LOG_TYPE_INFO, "%s Setting current speaking context. (_currentSpeakingContext = %@)", buf, 0x16u);
      }
    }
    else
    {
      if (v11 == 1)
        -[NSMutableSet addObject:](self->_synthesizingContexts, "addObject:", v5);
      v12 = 0;
    }
    v13 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke;
    v31[3] = &unk_24D24F018;
    v31[4] = self;
    v14 = v5;
    v32 = v14;
    v15 = MEMORY[0x2199D950C](v31);
    v16 = (void *)v15;
    if (v12)
    {
      v17 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[SVXSpeechSynthesizer _startContext:]";
        _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s Acquiring active audio session...", buf, 0xCu);
      }
      sessionManager = self->_sessionManager;
      v28[0] = v13;
      v28[1] = 3221225472;
      v28[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke_48;
      v28[3] = &unk_24D24C158;
      v28[4] = self;
      v29 = v14;
      v30 = v16;
      -[SVXSessionManager getAudioSessionProviderWithCompletion:](sessionManager, "getAudioSessionProviderWithCompletion:", v28);

    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }

LABEL_16:
    goto LABEL_17;
  }
  v19 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[SVXSpeechSynthesizer _startContext:]";
    _os_log_error_impl(&dword_214934000, v19, OS_LOG_TYPE_ERROR, "%s There's no context to start.", buf, 0xCu);
  }
LABEL_17:

}

- (BOOL)_continueContext:(id)a3 error:(id *)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (a4)
    *a4 = 0;
  if (v6)
  {
    v9 = objc_msgSend(v6, "operationType");
    if (v9 == 2)
    {
      if ((objc_msgSend(v6, "handledPresynthesizedAudioRequest") & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v12 = 1;
        objc_msgSend(v6, "setHandledPresynthesizedAudioRequest:", 1);
        v22 = 0;
        v16 = -[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:](self, "_startPresynthesizedAudioRequestForContext:error:", v6, &v22);
        v10 = v22;
        if (v16)
          goto LABEL_32;
      }
      if ((objc_msgSend(v6, "handledSpeechRequest") & 1) == 0)
      {
        v12 = 1;
        objc_msgSend(v6, "setHandledSpeechRequest:", 1);
        v21 = v10;
        v14 = -[SVXSpeechSynthesizer _startSpeechRequestForContext:error:](self, "_startSpeechRequestForContext:error:", v6, &v21);
        v15 = v21;
LABEL_22:
        v17 = v15;

        v10 = v17;
        if (!v14)
          goto LABEL_23;
LABEL_32:

        goto LABEL_33;
      }
    }
    else if (v9 == 1)
    {
      if ((objc_msgSend(v6, "handledPresynthesizedAudioRequest") & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v6, "setHandledPresynthesizedAudioRequest:", 1);
        v24 = 0;
        v13 = -[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:](self, "_startPresynthesizedAudioRequestForContext:error:", v6, &v24);
        v10 = v24;
        if (v13)
        {
LABEL_31:
          v12 = 0;
          goto LABEL_32;
        }
      }
      if ((objc_msgSend(v6, "handledSpeechRequest") & 1) == 0)
      {
        v12 = 1;
        objc_msgSend(v6, "setHandledSpeechRequest:", 1);
        v23 = v10;
        v14 = -[SVXSpeechSynthesizer _startSpeechRequestForContext:error:](self, "_startSpeechRequestForContext:error:", v6, &v23);
        v15 = v23;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SVXSpeechSynthesisErrorDomain"), 3, 0);
    }
LABEL_23:
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v18 = *v7;
    v19 = *v7;
    if (v10)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
        v27 = 2112;
        v28 = v6;
        v29 = 2112;
        v30 = v10;
        _os_log_error_impl(&dword_214934000, v18, OS_LOG_TYPE_ERROR, "%s Unable to continue context (context = %@, error = %@).", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s Unable to continue context (context = %@).", buf, 0x16u);
      }
      v10 = 0;
    }
    goto LABEL_31;
  }
  v11 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SVXSpeechSynthesizer _continueContext:error:]";
    _os_log_error_impl(&dword_214934000, v11, OS_LOG_TYPE_ERROR, "%s There's no context to continue.", buf, 0xCu);
  }
  v12 = 0;
LABEL_33:

  return v12;
}

- (BOOL)_startPresynthesizedAudioRequestForContext:(id)a3 error:(id *)a4
{
  SiriTTSDaemonSession *v5;
  NSObject *v6;
  SiriTTSDaemonSession *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  SiriTTSDaemonSession *v23;
  void *v24;
  void *v25;
  SVXSpeechSynthesisUtils *speechSynthesisUtils;
  void *v27;
  void *v28;
  void *v29;
  SiriTTSDaemonSession *v30;
  SiriTTSDaemonSession *v31;
  id *v32;
  SiriTTSDaemonSession *v33;
  void *v34;
  SiriTTSDaemonSession *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  SiriTTSDaemonSession *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  SiriTTSDaemonSession *v53;
  NSObject *v54;
  SiriTTSDaemonSession *v55;
  void *v56;
  SiriTTSDaemonSession *ttsSession;
  NSObject *log;
  void *v60;
  id vala;
  void *v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id from;
  id location;
  id v73;
  uint64_t v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  unint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  SiriTTSDaemonSession *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v5 = (SiriTTSDaemonSession *)a3;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
    v85 = 2112;
    v86 = (unint64_t)v5;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (a4)
    *a4 = 0;
  -[SiriTTSDaemonSession request](v5, "request");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "presynthesizedAudio");
  v7 = (SiriTTSDaemonSession *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "streamID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
      v85 = 2112;
      v86 = (unint64_t)v7;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s presynthesizedAudio = %@", buf, 0x16u);
    }
    v11 = objc_alloc_init(MEMORY[0x24BEA79E0]);
    -[SiriTTSDaemonSession data](v7, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAudioData:", v12);

    -[SiriTTSDaemonSession decoderASBD](v7, "decoderASBD");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sampleRate");
    v74 = v14;
    v75 = objc_msgSend(v13, "formatID");
    v76 = objc_msgSend(v13, "formatFlags");
    v77 = objc_msgSend(v13, "bytesPerPacket");
    v78 = objc_msgSend(v13, "framesPerPacket");
    v79 = objc_msgSend(v13, "bytesPerFrame");
    v80 = objc_msgSend(v13, "channelsPerFrame");
    v81 = objc_msgSend(v13, "bitsPerChannel");
    v15 = objc_msgSend(v13, "reserved");

    v82 = v15;
    objc_msgSend(v11, "setAsbd:", &v74);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BEA7A00]), "initWithAudio:", v11);
  }
  else
  {
    if (v8)
    {
      v18 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
        v85 = 2112;
        v86 = v9;
        _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s streamID = %@", buf, 0x16u);
      }
      v16 = 0;
LABEL_16:
      v19 = -[SiriTTSDaemonSession operationType](v5, "operationType");
      v20 = v7 != 0;
      if (!v9)
        v20 = 1;
      if (!v20 && v19 == 2)
      {
        v21 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
          v85 = 2112;
          v86 = v9;
          _os_log_error_impl(&dword_214934000, v21, OS_LOG_TYPE_ERROR, "%s operationType is speaking but presynthesizedAudio is nil for streamID:(%@). Updated to synthesizing.", buf, 0x16u);
        }
        goto LABEL_22;
      }
      if (v16 && v19 == 2)
      {
        v39 = -[SiriTTSDaemonSession audioSessionID](v5, "audioSessionID");
        if (!(_DWORD)v39)
        {
          -[SiriTTSDaemonSession audioSessionAssertion](v5, "audioSessionAssertion");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v40, "audioSessionID");
          if (!(_DWORD)v39)
          {
            -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](self->_configurationManager, "currentConfiguration");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v41, "audioSessionID");

          }
        }
        v42 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
          v85 = 2048;
          v86 = v39;
          _os_log_impl(&dword_214934000, v42, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", buf, 0x16u);
        }
        objc_msgSend((id)v16, "setAudioSessionId:", v39);
      }
      else if (v19 != 2)
      {
        if (v19 != 1)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SVXSpeechSynthesisErrorDomain"), 3, 0);
          v31 = (SiriTTSDaemonSession *)objc_claimAutoreleasedReturnValue();
          v43 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
            v85 = 2114;
            v86 = (unint64_t)v31;
            _os_log_error_impl(&dword_214934000, v43, OS_LOG_TYPE_ERROR, "%s Speech synthesizer failed. (error = %{public}@)", buf, 0x16u);
          }
LABEL_60:
          if (v31)
          {
            if (a4)
            {
              v31 = objc_retainAutorelease(v31);
              v17 = 0;
              *a4 = v31;
            }
            else
            {
              v17 = 0;
            }
            goto LABEL_65;
          }
LABEL_63:
          -[SiriTTSDaemonSession setPresynthesizedAudioRequest:](v5, "setPresynthesizedAudioRequest:", v16, log);
          v31 = 0;
          v17 = 1;
LABEL_65:

          goto LABEL_66;
        }
LABEL_22:
        -[SiriTTSDaemonSession request](v5, "request");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "speakableText");
        v23 = (SiriTTSDaemonSession *)objc_claimAutoreleasedReturnValue();

        if (-[SiriTTSDaemonSession length](v23, "length"))
        {
          -[SiriTTSDaemonSession languageCode](v5, "languageCode");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v60, "length")
            || (-[SVXSpeechSynthesisUtils createLocaleFromLanguageCode:](self->_speechSynthesisUtils, "createLocaleFromLanguageCode:", v60), (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](self->_configurationManager, "currentConfiguration");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "locale");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
            {
              speechSynthesisUtils = self->_speechSynthesisUtils;
              -[SVXModule preferences](self->_module, "preferences");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:](speechSynthesisUtils, "getLocaleWithAllowsFallback:preferences:", 1, v27);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          -[SVXAFSpeakableUtteranceParserProvider getWithLocale:](self->_speakableUtteranceParserProvider, "getWithLocale:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setHandleTTSCodes:", 1);
          v73 = 0;
          objc_msgSend(v28, "parseStringWithFormat:error:", v23, &v73);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (SiriTTSDaemonSession *)v73;
          if (v30)
          {
            v31 = v30;
            vala = (id)v16;
            v32 = a4;
            v33 = v5;
            v34 = v24;
            v35 = v7;
            v36 = v9;
            v37 = v29;
            v38 = *MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
              v85 = 2114;
              v86 = (unint64_t)v23;
              v87 = 2114;
              v88 = (uint64_t)v28;
              v89 = 2114;
              v90 = v31;
              _os_log_error_impl(&dword_214934000, v38, OS_LOG_TYPE_ERROR, "%s Speakable utterance parser failed to parse speakable text. (speakableText = %{public}@, speakableUtteranceParser = %{public}@, error = %{public}@)", buf, 0x2Au);
            }
            v29 = v37;
            v9 = v36;
            v7 = v35;
            v24 = v34;
            v5 = v33;
            a4 = v32;
            v16 = (uint64_t)vala;
          }
          else if (objc_msgSend(v29, "length") && objc_msgSend((id)v9, "length"))
          {
            v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A18]), "initWithText:identifier:", v29, v9);
            -[SiriTTSDaemonSession signalWithInlineStreaming:](self->_ttsSession, "signalWithInlineStreaming:", v56);
            log = *MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
            {
              ttsSession = self->_ttsSession;
              *(_DWORD *)buf = 136315650;
              v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
              v85 = 2112;
              v86 = (unint64_t)ttsSession;
              v87 = 2112;
              v88 = (uint64_t)v56;
              _os_log_impl(&dword_214934000, log, OS_LOG_TYPE_INFO, "%s Signaled inline streaming. (session = %@, signal = %@)", buf, 0x20u);
            }

            v31 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SVXSpeechSynthesisErrorDomain"), 5, 0);
            v31 = (SiriTTSDaemonSession *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SVXSpeechSynthesisErrorDomain"), 4, 0);
          v31 = (SiriTTSDaemonSession *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_60;
      }
      v44 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v45 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
        v85 = 2112;
        v86 = (unint64_t)v45;
        v87 = 2112;
        v88 = v16;
        _os_log_impl(&dword_214934000, v44, OS_LOG_TYPE_INFO, "%s Starting TTS with presynthesized audio for speaking context... (session = %@, audioRequest = %@)", buf, 0x20u);
      }
      -[SiriTTSDaemonSession taskTracker](v5, "taskTracker");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "sessionUUID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v16, "setSiriRequestId:", v47);

      v48 = objc_alloc(MEMORY[0x24BDD1880]);
      -[SiriTTSDaemonSession taskTracker](v5, "taskTracker");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "aceId");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v48, "initWithUUIDString:", v50);

      objc_msgSend((id)v16, "setSiriAceViewId:", v51);
      objc_initWeak(&location, (id)v16);
      objc_initWeak(&from, self);
      v52 = MEMORY[0x24BDAC760];
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke;
      v68[3] = &unk_24D24C180;
      objc_copyWeak(&v69, &from);
      objc_copyWeak(&v70, &location);
      objc_msgSend((id)v16, "setDidReportInstrument:", v68);
      v66[0] = v52;
      v66[1] = 3221225472;
      v66[2] = __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_2;
      v66[3] = &unk_24D24F0E0;
      v66[4] = self;
      objc_copyWeak(&v67, &location);
      objc_msgSend((id)v16, "setDidStartSpeaking:", v66);
      v53 = self->_ttsSession;
      v64[0] = v52;
      v64[1] = 3221225472;
      v64[2] = __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_3;
      v64[3] = &unk_24D24C1A8;
      v64[4] = self;
      objc_copyWeak(&v65, &location);
      -[SiriTTSDaemonSession speakWithAudioRequest:didFinish:](v53, "speakWithAudioRequest:didFinish:", v16, v64);
      v54 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v55 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        v84 = "-[SVXSpeechSynthesizer _startPresynthesizedAudioRequestForContext:error:]";
        v85 = 2112;
        v86 = (unint64_t)v55;
        v87 = 2112;
        v88 = v16;
        _os_log_impl(&dword_214934000, v54, OS_LOG_TYPE_INFO, "%s Started TTS with presynthesized audio for speaking context. (session = %@, audioRequest = %@)", buf, 0x20u);
      }
      objc_destroyWeak(&v65);
      objc_destroyWeak(&v67);
      objc_destroyWeak(&v70);
      objc_destroyWeak(&v69);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      goto LABEL_63;
    }
    v16 = 0;
  }
  if (v16 | v9)
    goto LABEL_16;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SVXSpeechSynthesisErrorDomain"), 1, 0);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_66:

  return v17;
}

- (BOOL)_startSpeechRequestForContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  SVXSpeechSynthesisUtils *speechSynthesisUtils;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  SVXSpeechSynthesisUtils *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  BOOL v27;
  NSObject *v28;
  _BOOL8 v30;
  uint64_t v31;
  SVXSpeechRequestConfigurer *speechRequestConfigurer;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  SiriTTSDaemonSession *v43;
  SiriTTSDaemonSession *v44;
  NSObject *v45;
  SiriTTSDaemonSession *v46;
  SVXSpeechSynthesisConfigurer *speechSynthesisConfigurer;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  SiriTTSDaemonSession *ttsSession;
  SiriTTSDaemonSession *v53;
  id v54;
  NSObject *v55;
  SiriTTSDaemonSession *v56;
  NSObject *v57;
  id *v59;
  id *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _BYTE *v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  _QWORD v87[5];
  id location;
  id v89;
  unsigned __int8 v90;
  _BYTE from[12];
  __int16 v92;
  SiriTTSDaemonSession *v93;
  __int16 v94;
  id v95;
  _BYTE buf[24];
  uint64_t (*v97)(uint64_t, uint64_t);
  __int128 v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (a4)
    *a4 = 0;
  objc_msgSend(v6, "languageCode");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v62, "length")
    || (-[SVXSpeechSynthesisUtils createLocaleFromLanguageCode:](self->_speechSynthesisUtils, "createLocaleFromLanguageCode:", v62), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](self->_configurationManager, "currentConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      speechSynthesisUtils = self->_speechSynthesisUtils;
      -[SVXModule preferences](self->_module, "preferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:](speechSynthesisUtils, "getLocaleWithAllowsFallback:preferences:", 1, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v12 = objc_msgSend(v6, "gender");
  -[SVXAFSpeakableUtteranceParserProvider getWithLocale:](self->_speakableUtteranceParserProvider, "getWithLocale:", v8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setHandleTTSCodes:", 1);
  objc_msgSend(v6, "request");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "speakableText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v61, "localizationKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](self->_configurationManager, "currentConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "outputVoiceInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        v19 = self->_speechSynthesisUtils;
        -[SVXModule preferences](self->_module, "preferences");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:](v19, "getOutputVoiceInfoWithAllowsFallback:preferences:", 1, v20);
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v62)
      {
        v21 = v62;
      }
      else
      {
        objc_msgSend(v18, "languageCode");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v21;
      if (!v12)
        v12 = -[SVXSpeechSynthesisUtils getGenderFromVoiceGender:](self->_speechSynthesisUtils, "getGenderFromVoiceGender:", objc_msgSend(v18, "gender"));
      -[SVXLocalizationUtils getLocalizedStringWithLanguageCode:gender:key:](self->_localizationUtils, "getLocalizedStringWithLanguageCode:gender:key:", v22, v12, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  v90 = 0;
  v89 = 0;
  objc_msgSend(v63, "parseStringWithFormat:error:containsPrivacySensitiveContents:", v13, &v89, &v90);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v89;
  if (!v24)
  {
    if (!objc_msgSend(v23, "length"))
    {
      v25 = 0;
      goto LABEL_47;
    }
    v28 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v90;
      _os_log_impl(&dword_214934000, v28, OS_LOG_TYPE_INFO, "%s containsPrivacySensitiveContents = %d", buf, 0x12u);
    }
    v30 = (objc_msgSend(v61, "options") & 1) == 0 || v90 != 0;
    objc_initWeak(&location, self);
    v31 = objc_msgSend(v6, "operationType");
    if (v31 == 1)
    {
      speechSynthesisConfigurer = self->_speechSynthesisConfigurer;
      -[SVXModule preferences](self->_module, "preferences");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVXSpeechSynthesisConfigurer synthesisRequestForContext:preferences:](speechSynthesisConfigurer, "synthesisRequestForContext:preferences:", v6, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "setText:", v23);
      objc_msgSend(v49, "setPrivacySensitive:", v30);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v97 = __Block_byref_object_copy_;
      *(_QWORD *)&v98 = __Block_byref_object_dispose_;
      v50 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v98 + 1) = 0;
      v87[0] = MEMORY[0x24BDAC760];
      v87[1] = 3221225472;
      v87[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke;
      v87[3] = &unk_24D24C1D0;
      v87[4] = buf;
      objc_msgSend(v49, "setDidReportInstrument:", v87);
      objc_initWeak(&v86, v49);
      v83[0] = v50;
      v83[1] = 3221225472;
      v83[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2;
      v83[3] = &unk_24D24C1F8;
      objc_copyWeak(&v84, &location);
      objc_copyWeak(&v85, &v86);
      objc_msgSend(v49, "setDidGenerateAudio:", v83);
      v80[0] = v50;
      v80[1] = 3221225472;
      v80[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3;
      v80[3] = &unk_24D24C220;
      objc_copyWeak(&v81, &location);
      objc_copyWeak(&v82, &v86);
      objc_msgSend(v49, "setDidGenerateWordTimings:", v80);
      v51 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        ttsSession = self->_ttsSession;
        *(_DWORD *)from = 136315650;
        *(_QWORD *)&from[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        v92 = 2112;
        v93 = ttsSession;
        v94 = 2112;
        v95 = v49;
        _os_log_impl(&dword_214934000, v51, OS_LOG_TYPE_INFO, "%s Starting synthesizing context... (ttsSession = %@, synthesisRequest = %@)", from, 0x20u);
      }
      v53 = self->_ttsSession;
      v76[0] = v50;
      v76[1] = 3221225472;
      v76[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_62;
      v76[3] = &unk_24D24C248;
      objc_copyWeak(&v79, &location);
      v54 = v49;
      v77 = v54;
      v78 = buf;
      -[SiriTTSDaemonSession synthesizeWithRequest:didFinish:](v53, "synthesizeWithRequest:didFinish:", v54, v76);
      v55 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v56 = self->_ttsSession;
        *(_DWORD *)from = 136315650;
        *(_QWORD *)&from[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        v92 = 2112;
        v93 = v56;
        v94 = 2112;
        v95 = v54;
        _os_log_impl(&dword_214934000, v55, OS_LOG_TYPE_INFO, "%s Started synthesizing context. (ttsSession = %@, synthesisRequest = %@)", from, 0x20u);
      }
      objc_msgSend(v6, "setSynthesisRequest:", v54);

      objc_destroyWeak(&v79);
      objc_destroyWeak(&v82);
      objc_destroyWeak(&v81);
      objc_destroyWeak(&v85);
      objc_destroyWeak(&v84);
      objc_destroyWeak(&v86);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      if (v31 != 2)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SVXSpeechSynthesisErrorDomain"), 3, 0);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v57 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v25;
          _os_log_error_impl(&dword_214934000, v57, OS_LOG_TYPE_ERROR, "%s Speech synthesizer failed. (error = %{public}@)", buf, 0x16u);
        }
        v27 = v25 == 0;
        if (a4 && v25)
        {
          v25 = objc_retainAutorelease(v25);
          v27 = 0;
          *a4 = v25;
        }
        goto LABEL_59;
      }
      speechRequestConfigurer = self->_speechRequestConfigurer;
      -[SVXModule preferences](self->_module, "preferences");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVXSpeechRequestConfigurer speechRequestForContext:preferences:](speechRequestConfigurer, "speechRequestForContext:preferences:", v6, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "taskTracker");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sessionUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSiriRequestId:", v36);

      v37 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v6, "taskTracker");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "aceId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (id *)objc_msgSend(v37, "initWithUUIDString:", v39);

      objc_msgSend(v34, "setSiriAceViewId:", v60);
      objc_msgSend(v34, "setText:", v23);
      objc_msgSend(v34, "setPrivacySensitive:", v30);
      if ((objc_msgSend(v61, "options") & 2) != 0)
      {
        v40 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
          _os_log_impl(&dword_214934000, v40, OS_LOG_TYPE_INFO, "%s Setting minimizeDeviceUsage for TTS request to prefer server side synthesis.", buf, 0xCu);
        }
        objc_msgSend(v34, "setMinimizeDeviceUsage:", 1);
      }
      objc_initWeak((id *)from, v34);
      v41 = MEMORY[0x24BDAC760];
      v73[0] = MEMORY[0x24BDAC760];
      v73[1] = 3221225472;
      v73[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_63;
      v73[3] = &unk_24D24C180;
      objc_copyWeak(&v74, &location);
      objc_copyWeak(&v75, (id *)from);
      objc_msgSend(v34, "setDidReportInstrument:", v73);
      v70[0] = v41;
      v70[1] = 3221225472;
      v70[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2_64;
      v70[3] = &unk_24D24C270;
      objc_copyWeak(&v71, &location);
      objc_copyWeak(&v72, (id *)from);
      objc_msgSend(v34, "setDidStartSpeaking:", v70);
      v67[0] = v41;
      v67[1] = 3221225472;
      v67[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3_65;
      v67[3] = &unk_24D24C220;
      objc_copyWeak(&v68, &location);
      objc_copyWeak(&v69, (id *)from);
      objc_msgSend(v34, "setDidGenerateWordTimings:", v67);
      v42 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v43 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2112;
        v97 = (uint64_t (*)(uint64_t, uint64_t))v34;
        _os_log_impl(&dword_214934000, v42, OS_LOG_TYPE_INFO, "%s Starting TTS for speaking context... (ttsSession = %@, speechRequest = %@)", buf, 0x20u);
      }
      v44 = self->_ttsSession;
      v64[0] = v41;
      v64[1] = 3221225472;
      v64[2] = __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_66;
      v64[3] = &unk_24D24C298;
      objc_copyWeak(&v65, &location);
      objc_copyWeak(&v66, (id *)from);
      -[SiriTTSDaemonSession speakWithSpeechRequest:didFinish:](v44, "speakWithSpeechRequest:didFinish:", v34, v64);
      v45 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v46 = self->_ttsSession;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2112;
        v97 = (uint64_t (*)(uint64_t, uint64_t))v34;
        _os_log_impl(&dword_214934000, v45, OS_LOG_TYPE_INFO, "%s Started TTS for speaking context... (ttsSession = %@, speechRequest = %@)", buf, 0x20u);
      }
      objc_msgSend(v6, "setSpeechRequest:", v34, &v68);
      objc_destroyWeak(&v66);
      objc_destroyWeak(&v65);
      objc_destroyWeak(&v69);
      objc_destroyWeak(v59);
      objc_destroyWeak(&v72);
      objc_destroyWeak(&v71);
      objc_destroyWeak(&v75);
      objc_destroyWeak(&v74);
      objc_destroyWeak((id *)from);

    }
    v25 = 0;
    v27 = 1;
LABEL_59:
    objc_destroyWeak(&location);
    goto LABEL_60;
  }
  v25 = v24;
  v26 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SVXSpeechSynthesizer _startSpeechRequestForContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v97 = (uint64_t (*)(uint64_t, uint64_t))v63;
    LOWORD(v98) = 2114;
    *(_QWORD *)((char *)&v98 + 2) = v25;
    _os_log_error_impl(&dword_214934000, v26, OS_LOG_TYPE_ERROR, "%s Speakable utterance parser failed to parse speakable text. (speakableText = %{public}@, speakableUtteranceParser = %{public}@, error = %{public}@)", buf, 0x2Au);
    if (a4)
      goto LABEL_25;
LABEL_47:
    v27 = 0;
    goto LABEL_60;
  }
  if (!a4)
    goto LABEL_47;
LABEL_25:
  v25 = objc_retainAutorelease(v25);
  v27 = 0;
  *a4 = v25;
LABEL_60:

  return v27;
}

- (void)_cancelPendingContextsAtIndexes:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableArray *pendingContexts;
  id *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:]";
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (-[NSMutableArray count](self->_pendingContexts, "count"))
  {
    v7 = -[SVXSpeechSynthesizer _numberOfContexts](self, "_numberOfContexts");
    v8 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke;
    v22[3] = &unk_24D24C2C0;
    v22[4] = self;
    v9 = (void *)MEMORY[0x2199D950C](v22);
    v10 = v9;
    pendingContexts = self->_pendingContexts;
    if (v4)
    {
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_2;
      v20[3] = &unk_24D24C2E8;
      v12 = &v21;
      v21 = v9;
      -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](pendingContexts, "enumerateObjectsAtIndexes:options:usingBlock:", v4, 0, v20);
      -[NSMutableArray removeObjectsAtIndexes:](self->_pendingContexts, "removeObjectsAtIndexes:", v4);
    }
    else
    {
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_3;
      v18[3] = &unk_24D24C2E8;
      v12 = &v19;
      v19 = v9;
      -[NSMutableArray enumerateObjectsUsingBlock:](pendingContexts, "enumerateObjectsUsingBlock:", v18);
      -[NSMutableArray removeAllObjects](self->_pendingContexts, "removeAllObjects");
    }

    v14 = -[SVXSpeechSynthesizer _numberOfContexts](self, "_numberOfContexts");
    v15 = *v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:]";
      v25 = 2048;
      v26 = v7;
      v27 = 2048;
      v28 = v14;
      _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s (numberOfContexts: %tu -> %tu)", buf, 0x20u);
    }
    if (v7 && !v14)
      -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidBecomeIdle](self->_announcer, "speechSynthesizerDidBecomeIdle");
    -[SVXModule performer](self->_module, "performer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_68;
    v17[3] = &unk_24D24EFF0;
    v17[4] = self;
    objc_msgSend(v16, "performBlock:withOptions:", v17, 0);

  }
  else
  {
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:]";
      _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s There's no pending context to cancel.", buf, 0xCu);
    }
  }

}

- (void)_stopCurrentSpeakingContextWithInterruptionBehavior:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  SVXSpeechSynthesisContext *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  NSObject *v15;
  SVXSpeechSynthesisContext *v16;
  __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  SiriTTSDaemonSession *ttsSession;
  NSObject *v21;
  SiriTTSDaemonSession *v22;
  void *v23;
  SVXSpeechSynthesisContext *v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    currentSpeakingContext = self->_currentSpeakingContext;
    v8 = v6;
    if ((unint64_t)a3 > 2)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24D170[a3];
    v10 = v9;
    v25 = 136315650;
    v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
    v27 = 2112;
    v28 = currentSpeakingContext;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s (_currentSpeakingContext = %@, interruptionBehavior = %@)", (uint8_t *)&v25, 0x20u);

  }
  v11 = self->_currentSpeakingContext;
  if (v11)
  {
    -[SVXSpeechSynthesisContext presynthesizedAudioRequest](v11, "presynthesizedAudioRequest");
    v12 = objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisContext speechRequest](self->_currentSpeakingContext, "speechRequest");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (__CFString *)v13;
    if (v12 | v13)
    {
      if (v13)
      {
        v19 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          ttsSession = self->_ttsSession;
          v25 = 136315650;
          v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
          v27 = 2112;
          v28 = ttsSession;
          v29 = 2112;
          v30 = v14;
          _os_log_impl(&dword_214934000, v19, OS_LOG_TYPE_INFO, "%s Stopping TTS for current speaking request... (ttsSession = %@, speechRequest = %@)", (uint8_t *)&v25, 0x20u);
        }
        -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:", v14);
      }
      if (v12)
      {
        v21 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          v22 = self->_ttsSession;
          v25 = 136315650;
          v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
          v27 = 2112;
          v28 = v22;
          v29 = 2112;
          v30 = (__CFString *)v12;
          _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s Stopping TTS with presynthesized audio for current request... (ttsSession = %@, audioRequest = %@)", (uint8_t *)&v25, 0x20u);
        }
        -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:", v12);
      }
      v16 = self->_currentSpeakingContext;
      v17 = v14;
    }
    else
    {
      v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        v24 = self->_currentSpeakingContext;
        v25 = 136315394;
        v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
        v27 = 2112;
        v28 = v24;
        _os_log_error_impl(&dword_214934000, v15, OS_LOG_TYPE_ERROR, "%s Current speaking context does NOT have an underlying speech request or presynthesized audio request when attempted to stop TTS. (_currentSpeakingContext = %@)", (uint8_t *)&v25, 0x16u);
      }
      v16 = self->_currentSpeakingContext;
      v17 = 0;
    }
    -[__CFString text](v17, "text");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:](self, "_finalizeContext:withResultType:utterance:error:", v16, 3, v23, 0);

  }
  else
  {
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v25 = 136315138;
      v26 = "-[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:]";
      _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s There's no current speaking context to stop.", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)_cancelPendingSpeakingContextWithRequest:(id)a3
{
  id v4;
  NSMutableArray *pendingContexts;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    pendingContexts = self->_pendingContexts;
    v8[1] = 3221225472;
    v8[2] = __65__SVXSpeechSynthesizer__cancelPendingSpeakingContextWithRequest___block_invoke;
    v8[3] = &unk_24D24C310;
    v7 = v4;
    v8[0] = MEMORY[0x24BDAC760];
    v9 = v4;
    -[NSMutableArray indexesOfObjectsPassingTest:](pendingContexts, "indexesOfObjectsPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      -[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:](self, "_cancelPendingContextsAtIndexes:", v6);

    v4 = v7;
  }

}

- (void)_cancelPendingSpeakingContextsWithPriorityBelow:(int64_t)a3
{
  NSMutableArray *pendingContexts;
  id v5;
  _QWORD v6[5];

  if (a3)
  {
    pendingContexts = self->_pendingContexts;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __72__SVXSpeechSynthesizer__cancelPendingSpeakingContextsWithPriorityBelow___block_invoke;
    v6[3] = &__block_descriptor_40_e42_B32__0__SVXSpeechSynthesisContext_8Q16_B24l;
    v6[4] = a3;
    -[NSMutableArray indexesOfObjectsPassingTest:](pendingContexts, "indexesOfObjectsPassingTest:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      -[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:](self, "_cancelPendingContextsAtIndexes:", v5);

  }
}

- (void)_cancelPendingContextsWithOperationType:(int64_t)a3
{
  NSMutableArray *pendingContexts;
  id v5;
  _QWORD v6[5];

  if (a3)
  {
    pendingContexts = self->_pendingContexts;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __64__SVXSpeechSynthesizer__cancelPendingContextsWithOperationType___block_invoke;
    v6[3] = &__block_descriptor_40_e42_B32__0__SVXSpeechSynthesisContext_8Q16_B24l;
    v6[4] = a3;
    -[NSMutableArray indexesOfObjectsPassingTest:](pendingContexts, "indexesOfObjectsPassingTest:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      -[SVXSpeechSynthesizer _cancelPendingContextsAtIndexes:](self, "_cancelPendingContextsAtIndexes:", v5);

  }
}

- (void)_stopCurrentSpeakingContextWithRequest:(id)a3 withInterruptionBehavior:(int64_t)a4
{
  SVXSpeechSynthesisContext *currentSpeakingContext;
  id v7;
  void *v8;
  int v9;

  currentSpeakingContext = self->_currentSpeakingContext;
  v7 = a3;
  -[SVXSpeechSynthesisContext request](currentSpeakingContext, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
    -[SVXSpeechSynthesizer _stopCurrentSpeakingContextWithInterruptionBehavior:](self, "_stopCurrentSpeakingContextWithInterruptionBehavior:", a4);
}

- (void)_finalizeContext:(id)a3 withResultType:(int64_t)a4 utterance:(id)a5 error:(id)a6
{
  SVXSpeechSynthesisContext *v10;
  id v11;
  id v12;
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  __CFString *v17;
  unint64_t v18;
  NSObject *v19;
  SVXSpeechSynthesisContext *currentSpeakingContext;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  SVXSpeechSynthesisWordTiming *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  SVXSpeechSynthesisWordTiming *v34;
  SVXSpeechSynthesisUtteranceInfo *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  SVXSpeechSynthesizer *v56;
  void *v57;
  os_log_t *v58;
  id v59;
  void *v60;
  unint64_t v61;
  NSObject *v62;
  void *v63;
  int64_t v64;
  id v65;
  uint64_t v66;
  void *v67;
  unint64_t v68;
  void *v69;
  unint64_t v70;
  SVXSpeechSynthesizer *v71;
  SVXSpeechSynthesisUtteranceInfo *v72;
  void *v73;
  void *v74;
  SVXSpeechSynthesisContext *v75;
  void *v76;
  _QWORD v77[5];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[2];
  uint8_t v83[128];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  unint64_t v87;
  __int16 v88;
  __CFString *v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v10 = (SVXSpeechSynthesisContext *)a3;
  v11 = a5;
  v12 = a6;
  v13 = (os_log_t *)MEMORY[0x24BE08FB0];
  v14 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    if ((unint64_t)a4 > 4)
      v16 = CFSTR("(unknown)");
    else
      v16 = off_24D24D308[a4];
    v17 = v16;
    *(_DWORD *)buf = 136316162;
    v85 = "-[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:]";
    v86 = 2112;
    v87 = (unint64_t)v10;
    v88 = 2112;
    v89 = v17;
    v90 = 2112;
    v91 = v11;
    v92 = 2112;
    v93 = v12;
    _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s context = %@, resultType = %@, utterance = %@, error = %@", buf, 0x34u);

  }
  if (v10)
  {
    v18 = -[SVXSpeechSynthesizer _numberOfContexts](self, "_numberOfContexts");
    if (self->_currentSpeakingContext == v10)
    {
      self->_currentSpeakingContext = 0;

      v19 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
      {
        currentSpeakingContext = self->_currentSpeakingContext;
        *(_DWORD *)buf = 136315394;
        v85 = "-[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:]";
        v86 = 2112;
        v87 = (unint64_t)currentSpeakingContext;
        _os_log_impl(&dword_214934000, v19, OS_LOG_TYPE_INFO, "%s Setting current speaking context. (_currentSpeakingContext = %@)", buf, 0x16u);
      }
    }
    -[NSMutableArray removeObject:](self->_pendingContexts, "removeObject:", v10);
    -[NSMutableSet removeObject:](self->_synthesizingContexts, "removeObject:", v10);
    -[SVXSpeechSynthesisContext speechWordTimingInfoArray](v10, "speechWordTimingInfoArray");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v21;
    if (v21)
    {
      v22 = v21;
      v64 = a4;
      v65 = v12;
      v68 = v18;
      v71 = self;
      v75 = v10;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v21, "count"));
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v24 = v22;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v79 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
            v30 = [SVXSpeechSynthesisWordTiming alloc];
            v31 = objc_msgSend(v29, "textRange");
            v33 = v32;
            objc_msgSend(v29, "startTime");
            v34 = -[SVXSpeechSynthesisWordTiming initWithRange:timeInterval:](v30, "initWithRange:timeInterval:", v31, v33);
            objc_msgSend(v23, "addObject:", v34);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
        }
        while (v26);
      }

      v10 = v75;
      v18 = v68;
      self = v71;
      a4 = v64;
      v12 = v65;
      v13 = (os_log_t *)MEMORY[0x24BE08FB0];
    }
    else
    {
      v23 = 0;
    }
    v35 = -[SVXSpeechSynthesisUtteranceInfo initWithUtterance:wordTimings:]([SVXSpeechSynthesisUtteranceInfo alloc], "initWithUtterance:wordTimings:", v11, v23);
    -[SVXSpeechSynthesisContext finalizeWithResultType:utteranceInfo:error:](v10, "finalizeWithResultType:utteranceInfo:error:", a4, v35, v12);
    -[SVXSpeechSynthesisContext request](v10, "request");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSpeechSynthesisContext taskTracker](v10, "taskTracker");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v35;
    switch(a4)
    {
      case 1:
        -[SVXModule analytics](self->_module, "analytics");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechSynthesisContext analyticsContext](v10, "analyticsContext");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logEventWithType:context:", 2704, v37);

        -[SVXSpeechSynthesisContext instrumentMetrics](v10, "instrumentMetrics");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (!v38)
        {
          v44 = 0;
LABEL_35:
          v35 = v72;
          goto LABEL_36;
        }
        v40 = objc_msgSend(v38, "speechBeginTime");
        v41 = v39;
        v42 = v40;
        v69 = v41;
        v43 = objc_msgSend(v41, "speechEndTime");
        v44 = 0;
        v35 = v72;
        v66 = v42;
        if (v42)
        {
          v39 = v69;
          if (!v43)
            goto LABEL_36;
          v64 = v43;
          v45 = objc_alloc(MEMORY[0x24BE09368]);
          objc_msgSend(v69, "utterance");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)objc_msgSend(v45, "initWithUtterance:beginTimestamp:endTimestamp:", v46, v66, v64);

          goto LABEL_35;
        }
        v39 = v69;
LABEL_36:
        -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:](self->_announcer, "speechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:", v76, v35, v44, v74, v64);

LABEL_37:
        v61 = -[SVXSpeechSynthesizer _numberOfContexts](self, "_numberOfContexts", v64);
        v62 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v85 = "-[SVXSpeechSynthesizer _finalizeContext:withResultType:utterance:error:]";
          v86 = 2048;
          v87 = v18;
          v88 = 2048;
          v89 = (__CFString *)v61;
          _os_log_impl(&dword_214934000, v62, OS_LOG_TYPE_INFO, "%s (numberOfContexts: %tu -> %tu)", buf, 0x20u);
        }
        if (v18 && !v61)
          -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidBecomeIdle](self->_announcer, "speechSynthesizerDidBecomeIdle");

        break;
      case 2:
        -[SVXModule analytics](self->_module, "analytics");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechSynthesisContext analyticsContext](v10, "analyticsContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logEventWithType:context:", 2702, v48);

        -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidCancelRequest:taskTracker:](self->_announcer, "speechSynthesizerDidCancelRequest:taskTracker:", v76, v74);
        goto LABEL_33;
      case 3:
        -[SVXModule analytics](self->_module, "analytics");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXSpeechSynthesisContext analyticsContext](v10, "analyticsContext");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "logEventWithType:context:", 2705, v50);

        -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidInterruptRequest:taskTracker:](self->_announcer, "speechSynthesizerDidInterruptRequest:taskTracker:", v76, v74);
        goto LABEL_33;
      case 4:
        -[SVXSpeechSynthesisContext analyticsContext](v10, "analyticsContext");
        v51 = objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextCreateWithError();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXModule analytics](self->_module, "analytics");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)MEMORY[0x24BDBD1B8];
        v67 = (void *)v51;
        if (v51)
          v55 = v51;
        else
          v55 = MEMORY[0x24BDBD1B8];
        if (v52)
          v54 = v52;
        v82[0] = v55;
        v82[1] = v54;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 2, v64);
        v70 = v18;
        v56 = self;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        AFAnalyticsContextsMerge();
        v58 = v13;
        v59 = v12;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "logEventWithType:context:", 2703, v60);

        v12 = v59;
        v13 = v58;

        self = v56;
        v18 = v70;

        -[SVXSpeechSynthesisAnnouncer speechSynthesizerDidFailRequest:taskTracker:error:](self->_announcer, "speechSynthesizerDidFailRequest:taskTracker:error:", v76, v74, v12);
LABEL_33:
        v35 = v72;
        goto LABEL_37;
      default:
        goto LABEL_37;
    }
  }
  -[SVXModule performer](self->_module, "performer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __72__SVXSpeechSynthesizer__finalizeContext_withResultType_utterance_error___block_invoke;
  v77[3] = &unk_24D24EFF0;
  v77[4] = self;
  objc_msgSend(v63, "performBlock:withOptions:", v77, 0);

}

- (void)duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  double v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__SVXSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke;
  v11[3] = &unk_24D24DCA0;
  v12 = v8;
  v9 = v8;
  *(float *)&v10 = a3;
  -[SVXSpeechSynthesizer _duckTTSVolumeTo:rampTime:completion:](self, "_duckTTSVolumeTo:rampTime:completion:", v11, v10, a4);

}

- (void)_duckTTSVolumeTo:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  void (**v8)(_QWORD, void *);
  double v9;
  SiriTTSDaemonSession *ttsSession;
  id v11;
  void *v12;
  void (**v13)(_QWORD, void *);

  v8 = (void (**)(_QWORD, void *))a5;
  ttsSession = self->_ttsSession;
  if (ttsSession)
  {
    *(float *)&v9 = a3;
    v13 = v8;
    -[SiriTTSDaemonSession adjustVolume:rampTime:didFinish:](ttsSession, "adjustVolume:rampTime:didFinish:", v8, v9, a4);
LABEL_5:
    v8 = v13;
    goto LABEL_6;
  }
  if (v8)
  {
    v13 = v8;
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v12 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x24BE09488], 6, 0);
    v13[2](v13, v12);

    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_isTTSPlaybackDisabled
{
  void *v2;
  char v3;

  _AFPreferencesValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _AFPreferencesBoolFromValueWithDefault();

  return v3;
}

- (SiriTTSDaemonSession)ttsSession
{
  return self->_ttsSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsSession, 0);
  objc_storeStrong((id *)&self->_metricsContextFactory, 0);
  objc_storeStrong((id *)&self->_speechInstrumentationUtilities, 0);
  objc_storeStrong((id *)&self->_localizationUtils, 0);
  objc_storeStrong((id *)&self->_speakableUtteranceParserProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenterRegistrar, 0);
  objc_storeStrong((id *)&self->_voiceConfigurer, 0);
  objc_storeStrong((id *)&self->_speechRequestConfigurer, 0);
  objc_storeStrong((id *)&self->_speechSynthesisConfigurer, 0);
  objc_storeStrong((id *)&self->_voiceGenderConverter, 0);
  objc_storeStrong((id *)&self->_sessionUtils, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_synthesizingContexts, 0);
  objc_storeStrong((id *)&self->_pendingContexts, 0);
  objc_storeStrong((id *)&self->_currentSpeakingContext, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_announcer, 0);
  objc_storeStrong((id *)&self->_audioStreamingAnnouncer, 0);
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

uint64_t __60__SVXSpeechSynthesizer_duckTTSVolumeTo_rampTime_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__SVXSpeechSynthesizer__finalizeContext_withResultType_utterance_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPendingContexts");
}

BOOL __64__SVXSpeechSynthesizer__cancelPendingContextsWithOperationType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "operationType") == *(_QWORD *)(a1 + 32);
}

BOOL __72__SVXSpeechSynthesizer__cancelPendingSpeakingContextsWithPriorityBelow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "operationType") == 2)
  {
    objc_msgSend(v3, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "priority") < *(_QWORD *)(a1 + 32);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __65__SVXSpeechSynthesizer__cancelPendingSpeakingContextWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "operationType") == 2)
  {
    objc_msgSend(v3, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "finalizeWithResultType:utteranceInfo:error:", 2, 0, 0);
  objc_msgSend(v3, "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "analytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 2702, v5);

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v3, "taskTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "speechSynthesizerDidCancelRequest:taskTracker:", v8, v7);
}

uint64_t __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__SVXSpeechSynthesizer__cancelPendingContextsAtIndexes___block_invoke_68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPendingContexts");
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "withRequest:didGenerateAudioChunk:", v5, v4);

}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "withRequest:didReceiveTimingInfo:", v5, v4);

}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_62(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "didFinishSynthesisRequest:withInstrumentMetrics:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_63(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didFinishSpeakingRequest:withInstrumentMetrics:", v5, v4);

}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_2_64(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didStartSpeakingRequest:", v2);

}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_3_65(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "withRequest:didReceiveTimingInfo:", v5, v4);

}

void __60__SVXSpeechSynthesizer__startSpeechRequestForContext_error___block_invoke_66(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didFinishSpeakingRequest:successfully:phonemesSpoken:withError:", v5, v4 == 0, 0, v4);

}

void __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didFinishPresynthesizedAudioRequest:withInstrumentMetrics:error:", v5, v4, 0);

}

void __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "didStartPresynthesizedAudioRequest:", WeakRetained);

}

void __73__SVXSpeechSynthesizer__startPresynthesizedAudioRequestForContext_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  id v4;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v2, "didStopPresynthesizedAudioRequest:atEnd:error:", WeakRetained, v4 == 0, v4);

}

void __38__SVXSpeechSynthesizer__startContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v11 = 0;
  v4 = objc_msgSend(v2, "_continueContext:error:", v3, &v11);
  v5 = v11;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "speechRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v8 = 4;
      v9 = v7;
      v10 = v5;
    }
    else
    {
      v8 = 1;
      v9 = v7;
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_finalizeContext:withResultType:utterance:error:", *(_QWORD *)(a1 + 40), v8, v9, v10);

  }
}

void __38__SVXSpeechSynthesizer__startContext___block_invoke_48(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke_2;
  v5[3] = &unk_24D24C130;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "acquireAudioSessionForReason:completion:", CFSTR("Speech Synthesis"), v5);

}

void __38__SVXSpeechSynthesizer__startContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SVXSpeechSynthesizer _startContext:]_block_invoke_2";
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s Failed to acquire active audio session. (error = %@)", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSpeechSynthesizer _startContext:]_block_invoke";
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Acquired active audio session. (assertion = %@)", buf, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "performer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __38__SVXSpeechSynthesizer__startContext___block_invoke_52;
  v12[3] = &unk_24D24DF70;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v5;
  v15 = v6;
  v16 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "performBlock:", v12);

}

uint64_t __38__SVXSpeechSynthesizer__startContext___block_invoke_52(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v3 != v2)
    return objc_msgSend(*(id *)(a1 + 48), "relinquish");
  objc_msgSend(v3, "setAudioSessionAssertion:", *(_QWORD *)(a1 + 48));
  v5 = *(void **)(a1 + 56);
  if (!v5
    || SVXAudioSessionIsNoRoutesAvailableError(v5)
    && objc_msgSend(*(id *)(a1 + 48), "audioSessionID"))
  {
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    return objc_msgSend(*(id *)(a1 + 32), "_finalizeContext:withResultType:utterance:error:", *(_QWORD *)(a1 + 40), 4, 0, *(_QWORD *)(a1 + 56));
  }
}

void __47__SVXSpeechSynthesizer__processPendingContexts__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a2;
  objc_msgSend(v5, "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "operationType");

  if (v6 == 2)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
        || (v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v7 < objc_msgSend(v8, "priority")))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "priority");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

void __47__SVXSpeechSynthesizer__processPendingContexts__block_invoke_46(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[SVXSpeechSynthesizer _processPendingContexts]_block_invoke";
    v8 = 2048;
    v9 = a3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Dequeued[%tu] = %@", (uint8_t *)&v6, 0x20u);
  }

}

void __40__SVXSpeechSynthesizer__enqueueContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (objc_msgSend(v6, "operationType") == 2)
  {
    objc_msgSend(v6, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "priority");
    v9 = *(_QWORD *)(a1 + 40);

    if (v8 > v9)
    {
      v10 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v11 = 136315394;
        v12 = "-[SVXSpeechSynthesizer _enqueueContext:]_block_invoke";
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s Ignored because pending speaking context (%@) has a higher priority.", (uint8_t *)&v11, 0x16u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

uint64_t __40__SVXSpeechSynthesizer__enqueueContext___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPendingContexts");
}

BOOL __93__SVXSpeechSynthesizer__handleDidFinishSynthesizingForSpeechRequest_instrumentMetrics_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "synthesisRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __52__SVXSpeechSynthesizer__configureWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPendingContexts");
}

void __44__SVXSpeechSynthesizer__prewarmWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[SVXSpeechSynthesizer _prewarmWithContext:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Unable to prewarm session, error=%@", (uint8_t *)&v4, 0x16u);
    }
  }

}

uint64_t __78__SVXSpeechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFinishSynthesizingForSpeechRequest:instrumentMetrics:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __58__SVXSpeechSynthesizer_withRequest_didGenerateAudioChunk___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidGenerateAudioChunkData:forSpeechRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __57__SVXSpeechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_t *v5;
  uint64_t i;
  os_log_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;
  NSRange v28;

  v27 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = (os_log_t *)MEMORY[0x24BE08FB0];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v7 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v9 = v7;
          v28.location = objc_msgSend(v8, "textRange");
          NSStringFromRange(v28);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "startTime");
          *(_DWORD *)buf = 136315906;
          v19 = "-[SVXSpeechSynthesizer withRequest:didReceiveTimingInfo:]_block_invoke";
          v20 = 2112;
          v21 = v8;
          v22 = 2112;
          v23 = v10;
          v24 = 2048;
          v25 = v11;
          _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s %@ {textRange = %@, startTime = %f}", buf, 0x2Au);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_handleDidReceiveSpeechWordTimingInfoArray:forSpeechRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

uint64_t __88__SVXSpeechSynthesizer_didFinishPresynthesizedAudioRequest_withInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFinishPresynthesizedAudioRequest:instrumentMetrics:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __70__SVXSpeechSynthesizer_didStopPresynthesizedAudioRequest_atEnd_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidStopPresynthesizedAudioRequest:success:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __59__SVXSpeechSynthesizer_didStartPresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidStartPresynthesizedAudioRequest:timestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __87__SVXSpeechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFinishSpeakingWithSpeechRequest:success:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __71__SVXSpeechSynthesizer_didFinishSpeakingRequest_withInstrumentMetrics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFinishSpeakingWithSpeechRequest:instrumentMetrics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __48__SVXSpeechSynthesizer_didStartSpeakingRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidStartSpeakingWithSpeechRequest:timestamp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __44__SVXSpeechSynthesizer_languageCodeChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  objc_msgSend(*(id *)(v2 + 32), "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getLocaleWithAllowsFallback:preferences:", 0, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SVXSpeechSynthesisConfiguration configurationWithLocale:](SVXSpeechSynthesisConfiguration, "configurationWithLocale:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_configureWithConfiguration:", v5);

}

void __43__SVXSpeechSynthesizer_outputVoiceChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  objc_msgSend(*(id *)(v2 + 32), "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getOutputVoiceInfoWithAllowsFallback:preferences:", 0, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[SVXSpeechSynthesisConfiguration configurationWithOutputVoiceInfo:](SVXSpeechSynthesisConfiguration, "configurationWithOutputVoiceInfo:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_configureWithConfiguration:", v5);

}

uint64_t __39__SVXSpeechSynthesizer_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__SVXSpeechSynthesizer_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__SVXSpeechSynthesizer_updateWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureWithConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__SVXSpeechSynthesizer_postcool__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postcool");
}

uint64_t __31__SVXSpeechSynthesizer_prewarm__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prewarm");
}

uint64_t __55__SVXSpeechSynthesizer_stopWithModuleInstanceProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_cancelPendingContextsWithOperationType:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_stopCurrentSpeakingContextWithInterruptionBehavior:", 1);
}

void __77__SVXSpeechSynthesizer_startWithModuleInstanceProvider_platformDependencies___block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_cancelPendingContextsWithOperationType:", 2);
  objc_msgSend(a1[4], "_stopCurrentSpeakingContextWithInterruptionBehavior:", 1);
  objc_msgSend(a1[5], "sessionManager");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[1];
  v3[1] = v2;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v13) == 6)
        {
          v11 = a1[4];
          objc_msgSend(v10, "speechSynthesisListener");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addListener:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

uint64_t __67__SVXSpeechSynthesizer_stopCurrentRequestWithInterruptionBehavior___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopCurrentSpeakingContextWithInterruptionBehavior:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__SVXSpeechSynthesizer_cancelPendingRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPendingContextsWithOperationType:", 2);
}

uint64_t __61__SVXSpeechSynthesizer_stopRequest_withInterruptionBehavior___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopCurrentSpeakingContextWithRequest:withInterruptionBehavior:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __38__SVXSpeechSynthesizer_cancelRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPendingSpeakingContextWithRequest:", *(_QWORD *)(a1 + 40));
}

uint64_t __138__SVXSpeechSynthesizer_enqueueRequest_languageCode_voiceName_gender_audioSessionID_preparation_finalization_taskTracker_analyticsContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __100__SVXSpeechSynthesizer_synthesizeRequest_audioChunkHandler_taskTracker_analyticsContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueContext:", *(_QWORD *)(a1 + 40));
}

void __39__SVXSpeechSynthesizer_prewarmRequest___block_invoke(uint64_t a1)
{
  SVXSpeechSynthesisContext *v2;

  v2 = -[SVXSpeechSynthesisContext initWithOperationType:request:languageCode:voiceName:gender:audioSessionID:preparation:audioChunkHandler:finalization:taskTracker:analyticsContext:]([SVXSpeechSynthesisContext alloc], "initWithOperationType:request:languageCode:voiceName:gender:audioSessionID:preparation:audioChunkHandler:finalization:taskTracker:analyticsContext:", 1, *(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "_prewarmWithContext:", v2);

}

@end
