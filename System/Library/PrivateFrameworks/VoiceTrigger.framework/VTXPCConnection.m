@implementation VTXPCConnection

- (VTXPCConnection)init
{
  VTXPCConnection *v2;
  uint64_t v3;
  NSMutableSet *activationAssertions;
  uint64_t v5;
  VTSiriPHash *hasher;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VTXPCConnection;
  v2 = -[VTXPCConnection init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    activationAssertions = v2->_activationAssertions;
    v2->_activationAssertions = (NSMutableSet *)v3;

    *(_WORD *)&v2->_isPhraseSpotterBypassed = 0;
    +[VTSiriPHash sharedPhash](VTSiriPHash, "sharedPhash");
    v5 = objc_claimAutoreleasedReturnValue();
    hasher = v2->_hasher;
    v2->_hasher = (VTSiriPHash *)v5;

  }
  return v2;
}

- (void)getTestResponse:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446210;
    v8 = "-[VTXPCConnection getTestResponse:]";
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "::: %{public}s", (uint8_t *)&v7, 0xCu);
  }
  if (v3)
    v3[2](v3, v5);

}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 timestamp:(double)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  VTXPCConnection *v14;
  double v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v18 = "-[VTXPCConnection enableVoiceTrigger:withAssertion:timestamp:]";
    v19 = 1026;
    v20 = v6;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "::: %{public}s enable: %{public}d reason: %{public}@", buf, 0x1Cu);
  }
  if (enableVoiceTrigger_withAssertion_timestamp__onceToken == -1)
  {
    if (v8)
    {
LABEL_5:
      v10 = enableVoiceTrigger_withAssertion_timestamp___queue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __62__VTXPCConnection_enableVoiceTrigger_withAssertion_timestamp___block_invoke_5;
      v12[3] = &unk_24C7F4998;
      v16 = v6;
      v15 = a5;
      v13 = v8;
      v14 = self;
      dispatch_sync(v10, v12);

      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&enableVoiceTrigger_withAssertion_timestamp__onceToken, &__block_literal_global_6052);
    if (v8)
      goto LABEL_5;
  }
  v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring request to enable/disable voice trigger with nil reason.", buf, 2u);
  }
LABEL_9:

}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4 timestamp:(double)a5
{
  _BOOL4 v6;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12[2];
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (setPhraseSpotterBypassing_timeout_timestamp__onceToken != -1)
    dispatch_once(&setPhraseSpotterBypassing_timeout_timestamp__onceToken, &__block_literal_global_11_6047);
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NOT bypassed");
    if (v6)
      v9 = CFSTR("bypassed");
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2050;
    v17 = a4;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "::: Asserting that PhraseSpotter should be %{public}@, timeout: %{public}f", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v10 = setPhraseSpotterBypassing_timeout_timestamp___queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_17;
  v11[3] = &unk_24C7F4A08;
  v11[4] = self;
  v13 = v6;
  v12[1] = *(id *)&a4;
  objc_copyWeak(v12, (id *)buf);
  dispatch_sync(v10, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

- (void)_setPhraseSpotterBypassing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isPhraseSpotterBypassed != v3)
  {
    self->_isPhraseSpotterBypassed = v3;
    v6 = v5;
    objc_msgSend(v5, "setBypass:", v3);
    v5 = v6;
  }

}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4 timestamp:(double)a5
{
  _BOOL4 v6;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12[2];
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (setRaiseToSpeakBypassing_timeout_timestamp__onceToken != -1)
    dispatch_once(&setRaiseToSpeakBypassing_timeout_timestamp__onceToken, &__block_literal_global_19);
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NOT bypassed");
    if (v6)
      v9 = CFSTR("bypassed");
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2050;
    v17 = a4;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "::: Asserting that RaiseToSpeak should be %{public}@, timeout: %{public}f", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v10 = setRaiseToSpeakBypassing_timeout_timestamp___queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_21;
  v11[3] = &unk_24C7F4A08;
  v11[4] = self;
  v13 = v6;
  v12[1] = *(id *)&a4;
  objc_copyWeak(v12, (id *)buf);
  dispatch_sync(v10, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
}

- (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveSiriSessionCancellation:", v3);

}

- (void)notifySecondChanceRequest
{
  id v2;

  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestSecondChance");

}

- (void)notifyTriggerEventRequest
{
  id v2;

  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestFoceTrigger");

}

- (void)queryLastTriggerEventTypeWithReply:(id)a3
{
  void (**v3)(id, uint64_t);
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, uint64_t))a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "lastTriggerType");
  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9[0]) = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "No VTPhraseSpotter available to query last trigger event type", (uint8_t *)v9, 2u);
    }
    v6 = 0;
  }
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67240192;
    v9[1] = v6;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Requesting LastTriggerType : %{public}d", (uint8_t *)v9, 8u);
  }
  if (v3)
    v3[2](v3, v6);

}

- (void)resetAssertions
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446210;
    v4 = "-[VTXPCConnection resetAssertions]";
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "::: %{public}s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)clearVoiceTriggerCount
{
  id v2;

  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearTriggerCount");

}

- (void)getVoiceTriggerCountWithReply:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = objc_msgSend(v3, "triggerCount");
  if (v6)
LABEL_3:
    v6[2](v6, v5);
LABEL_4:

}

- (void)handleDisconnect
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "HandleDisconnect", buf, 2u);
  }
  v4 = (void *)-[NSMutableSet copy](self->_activationAssertions, "copy");
  if (objc_msgSend(v4, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD1760], "processInfo", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "systemUptime");
          -[VTXPCConnection enableVoiceTrigger:withAssertion:timestamp:](self, "enableVoiceTrigger:withAssertion:timestamp:", 0, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v7);
    }

  }
  if (self->_isPhraseSpotterBypassed)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemUptime");
    -[VTXPCConnection setPhraseSpotterBypassing:timeout:timestamp:](self, "setPhraseSpotterBypassing:timeout:timestamp:", 0, 0.0, v13);

    self->_isPhraseSpotterBypassed = 0;
  }
  if (self->_isRecording)
  {
    +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stopAudioCapture");

    self->_isRecording = 0;
  }

}

- (void)getFirstChanceAudioBufferWithReply:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void (**)(id, void *))a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "firstChanceAudioBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
LABEL_3:
      v3[2](v3, v6);
  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for first chance audio buffer", v8, 2u);
    }
    v6 = 0;
    if (v3)
      goto LABEL_3;
  }

}

- (void)getFirstChanceVTEventInfoWithReply:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void (**)(id, void *))a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "firstChanceVTEventInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
LABEL_3:
      v3[2](v3, v6);
  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for first chance voicetrigger event info", v8, 2u);
    }
    v6 = 0;
    if (v3)
      goto LABEL_3;
  }

}

- (void)getFirstChanceTriggeredDateWithReply:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void (**)(id, void *))a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "firstChanceTriggeredDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
LABEL_3:
      v3[2](v3, v6);
  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for first chance triggered date", v8, 2u);
    }
    v6 = 0;
    if (v3)
      goto LABEL_3;
  }

}

- (void)isLastTriggerFollowedBySpeechWithReply:(id)a3
{
  void (**v3)(id, uint64_t);
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void (**)(id, uint64_t))a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isFollowedBySpeech");
    if (v3)
LABEL_3:
      v3[2](v3, v6);
  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "No VoiceTrigger PhraseSpotter avail for trigger followed by speech", v8, 2u);
    }
    v6 = 0;
    if (v3)
      goto LABEL_3;
  }

}

- (void)requestAudioCapture:(double)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  VTXPCConnection *v11;
  id v12[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 134349056;
      *(id *)((char *)location + 4) = *(id *)&a3;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "::: Not capturing given wrong duration: %{public}.3f", (uint8_t *)location, 0xCu);
    }
  }
  else
  {
    if (requestAudioCapture__onceToken != -1)
      dispatch_once(&requestAudioCapture__onceToken, &__block_literal_global_23_6026);
    +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v6 = requestAudioCapture___queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__VTXPCConnection_requestAudioCapture___block_invoke_2;
    v9[3] = &unk_24C7F4A70;
    v12[1] = *(id *)&a3;
    v10 = v5;
    v11 = self;
    v7 = v5;
    objc_copyWeak(v12, location);
    dispatch_sync(v6, v9);
    objc_destroyWeak(v12);

    objc_destroyWeak(location);
  }
}

- (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, void *))a3;
  +[VTPhraseSpotter currentSpotter](VTPhraseSpotter, "currentSpotter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "returning asset dictionary : %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v3[2](v3, v5);
  }

}

- (void)requestCurrentBuiltInRTModelDictionaryWithReply:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, void *))a3;
  +[VTBuiltInRTModel sharedInstance](VTBuiltInRTModel, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "builtInRTModelDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "returning builtIn RTModel dictionary : %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v3[2](v3, v5);
  }

}

- (void)setCurrentBuiltInRTModelDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "Setting builtIn RTModel dictionary : %{public}@", (uint8_t *)&v6, 0xCu);
  }
  +[VTBuiltInRTModel sharedInstance](VTBuiltInRTModel, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBuiltInRTModelDictionary:", v3);

}

- (void)enableTriggerEventXPCNotification:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67240192;
    v7[1] = v3;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "EnableTriggerEventXPCNotification: %{public}d", (uint8_t *)v7, 8u);
  }
  +[VTTriggerEventMonitorManager sharedManager](VTTriggerEventMonitorManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5, "addConnection:", v6);
  else
    objc_msgSend(v5, "removeConnection:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasher, 0);
  objc_storeStrong((id *)&self->_activationAssertions, 0);
}

void __39__VTXPCConnection_requestAudioCapture___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  int8x16_t v11;
  _QWORD handler[4];
  int8x16_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134349056;
    v16 = v3;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "::: Starting audio capture for %{public}.2f seconds", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "startAudioCapture");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 17) = 1;
  if (requestAudioCapture___timer)
  {
    dispatch_source_cancel((dispatch_source_t)requestAudioCapture___timer);
    v4 = (void *)requestAudioCapture___timer;
    requestAudioCapture___timer = 0;

  }
  if (*(double *)(a1 + 56) > 0.0)
  {
    v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)requestAudioCapture___queue);
    v6 = (void *)requestAudioCapture___timer;
    requestAudioCapture___timer = (uint64_t)v5;

    v7 = requestAudioCapture___timer;
    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v9 = requestAudioCapture___timer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __39__VTXPCConnection_requestAudioCapture___block_invoke_25;
    handler[3] = &unk_24C7F4EC0;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    v11 = *(int8x16_t *)(a1 + 32);
    v10 = (id)v11.i64[0];
    v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)requestAudioCapture___timer);

    objc_destroyWeak(&v14);
  }
}

void __39__VTXPCConnection_requestAudioCapture___block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "::: Stopping audio capture", v4, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 0;
    objc_msgSend(*(id *)(a1 + 40), "stopAudioCapture");
  }

}

void __39__VTXPCConnection_requestAudioCapture___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("audio capture assertion queue", 0);
  v1 = (void *)requestAudioCapture___queue;
  requestAudioCapture___queue = (uint64_t)v0;

}

void __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_21(uint64_t a1)
{
  void *v2;
  dispatch_source_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_setRaiseToSpeakBypassing:", *(unsigned __int8 *)(a1 + 56));
  if (setRaiseToSpeakBypassing_timeout_timestamp___timer)
  {
    dispatch_source_cancel((dispatch_source_t)setRaiseToSpeakBypassing_timeout_timestamp___timer);
    v2 = (void *)setRaiseToSpeakBypassing_timeout_timestamp___timer;
    setRaiseToSpeakBypassing_timeout_timestamp___timer = 0;

  }
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(double *)(a1 + 48) > 0.0)
    {
      v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)setRaiseToSpeakBypassing_timeout_timestamp___queue);
      v4 = (void *)setRaiseToSpeakBypassing_timeout_timestamp___timer;
      setRaiseToSpeakBypassing_timeout_timestamp___timer = (uint64_t)v3;

      v5 = setRaiseToSpeakBypassing_timeout_timestamp___timer;
      v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v7 = setRaiseToSpeakBypassing_timeout_timestamp___timer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_2;
      handler[3] = &unk_24C7F49E0;
      objc_copyWeak(&v9, (id *)(a1 + 40));
      dispatch_source_set_event_handler(v7, handler);
      dispatch_resume((dispatch_object_t)setRaiseToSpeakBypassing_timeout_timestamp___timer);
      objc_destroyWeak(&v9);
    }
  }
}

void __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "::: Timeout!! RaiseToSpeak should be NOT bypassed", v3, 2u);
    }
    objc_msgSend(WeakRetained, "_setRaiseToSpeakBypassing:", 0);
  }

}

void __62__VTXPCConnection_setRaiseToSpeakBypassing_timeout_timestamp___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("RaiseToSpeak assertion queue", 0);
  v1 = (void *)setRaiseToSpeakBypassing_timeout_timestamp___queue;
  setRaiseToSpeakBypassing_timeout_timestamp___queue = (uint64_t)v0;

}

void __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_17(uint64_t a1)
{
  void *v2;
  dispatch_source_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_setPhraseSpotterBypassing:", *(unsigned __int8 *)(a1 + 56));
  if (setPhraseSpotterBypassing_timeout_timestamp___timer)
  {
    dispatch_source_cancel((dispatch_source_t)setPhraseSpotterBypassing_timeout_timestamp___timer);
    v2 = (void *)setPhraseSpotterBypassing_timeout_timestamp___timer;
    setPhraseSpotterBypassing_timeout_timestamp___timer = 0;

  }
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(double *)(a1 + 48) > 0.0)
    {
      v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)setPhraseSpotterBypassing_timeout_timestamp___queue);
      v4 = (void *)setPhraseSpotterBypassing_timeout_timestamp___timer;
      setPhraseSpotterBypassing_timeout_timestamp___timer = (uint64_t)v3;

      v5 = setPhraseSpotterBypassing_timeout_timestamp___timer;
      v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v7 = setPhraseSpotterBypassing_timeout_timestamp___timer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_2;
      handler[3] = &unk_24C7F49E0;
      objc_copyWeak(&v9, (id *)(a1 + 40));
      dispatch_source_set_event_handler(v7, handler);
      dispatch_resume((dispatch_object_t)setPhraseSpotterBypassing_timeout_timestamp___timer);
      objc_destroyWeak(&v9);
    }
  }
}

void __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "::: Timeout!! PhraseSpotter should be NOT bypassed", v3, 2u);
    }
    objc_msgSend(WeakRetained, "_setPhraseSpotterBypassing:", 0);
  }

}

void __63__VTXPCConnection_setPhraseSpotterBypassing_timeout_timestamp___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("phrasespotter assertion queue", 0);
  v1 = (void *)setPhraseSpotterBypassing_timeout_timestamp___queue;
  setPhraseSpotterBypassing_timeout_timestamp___queue = (uint64_t)v0;

}

void __62__VTXPCConnection_enableVoiceTrigger_withAssertion_timestamp___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = CFSTR("Enabled");
    else
      v4 = CFSTR("Disabled");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
    v7 = v3;
    v8 = objc_msgSend(v6, "count");
    v9 = *(_QWORD *)(a1 + 48);
    v16 = 138544642;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    v20 = 2050;
    v21 = v8;
    v22 = 2114;
    v23 = enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
    v24 = 2114;
    v25 = v2;
    v26 = 2050;
    v27 = v9;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: Asserting that VoiceTrigger should be %{public}@ with reason: %{public}@. Existing assertions (%{public}lu): %{public}@; times: %{public}@ vs %{public}f",
      (uint8_t *)&v16,
      0x3Eu);

  }
  objc_msgSend(v2, "doubleValue");
  if (v10 >= *(double *)(a1 + 48))
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring request to enable/disable voice trigger - time order violation.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    v11 = (void *)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, *(_QWORD *)(a1 + 32));

    if (*(_BYTE *)(a1 + 56))
    {
      v13 = objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "count");
      objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "addObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
      if (!v13)
      {
        +[VTSiriAssertionMonitor sharedInstance](VTSiriAssertionMonitor, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "enableAssertionReceived");
LABEL_14:

      }
    }
    else
    {
      objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "removeObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
      if (!objc_msgSend((id)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons, "count"))
      {
        +[VTSiriAssertionMonitor sharedInstance](VTSiriAssertionMonitor, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "disableAssertionReceived");
        goto LABEL_14;
      }
    }
  }

}

void __62__VTXPCConnection_enableVoiceTrigger_withAssertion_timestamp___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons;
  enableVoiceTrigger_withAssertion_timestamp__sRegisteredEnableReasons = v0;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason;
  enableVoiceTrigger_withAssertion_timestamp__sTimestampsByReason = v2;

  v4 = dispatch_queue_create("voicetrigger assertion queue", 0);
  v5 = (void *)enableVoiceTrigger_withAssertion_timestamp___queue;
  enableVoiceTrigger_withAssertion_timestamp___queue = (uint64_t)v4;

}

+ (void)initialize
{
  if (VTLogInitIfNeeded_once != -1)
    dispatch_once(&VTLogInitIfNeeded_once, &__block_literal_global_21_6307);
}

@end
