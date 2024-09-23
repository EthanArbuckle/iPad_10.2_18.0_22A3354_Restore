@implementation VSSiriInstrumentation

- (VSSiriInstrumentation)initWithSiriRequestId:(id)a3
{
  id v5;
  VSSiriInstrumentation *v6;
  uint64_t v7;
  NSUUID *ttsId;
  uint64_t v9;
  NSUUID *contextId;
  VSSiriInstrumentation *v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VSSiriInstrumentation;
  v6 = -[VSSiriInstrumentation init](&v15, sel_init);
  if (!v6)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE909B0], "derivedIdentifierForComponentName:fromSourceIdentifier:", 13, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  ttsId = v6->_ttsId;
  v6->_ttsId = (NSUUID *)v7;

  if (v6->_ttsId)
  {
    objc_storeStrong((id *)&v6->_siriRequestId, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    contextId = v6->_contextId;
    v6->_contextId = (NSUUID *)v9;

    -[VSSiriInstrumentation makeRequestLinkEvent](v6, "makeRequestLinkEvent");
LABEL_4:
    v11 = v6;
    goto LABEL_8;
  }
  VSGetLogDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_fault_impl(&dword_21AA84000, v12, OS_LOG_TYPE_FAULT, "AssistantSiriAnalytics should always derive an identifier for SISchemaComponentName_COMPONENTNAME_TTS", v14, 2u);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (void)makeRequestLinkEvent
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", self->_siriRequestId);
  v3 = objc_alloc_init(MEMORY[0x24BE95B68]);
  objc_msgSend(v3, "setUuid:", v8);
  objc_msgSend(v3, "setComponent:", 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", self->_ttsId);
  v5 = objc_alloc_init(MEMORY[0x24BE95B68]);
  objc_msgSend(v5, "setUuid:", v4);
  objc_msgSend(v5, "setComponent:", 13);
  v6 = objc_alloc_init(MEMORY[0x24BE95B60]);
  objc_msgSend(v6, "setSource:", v5);
  objc_msgSend(v6, "setTarget:", v3);
  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emitMessage:", v6);

}

- (void)instrumentRequestReceivedWithText:(id)a3 requestedVoiceType:(int64_t)a4 requestedVoiceFootprint:(int64_t)a5 isPrivate:(BOOL)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  v10 = objc_alloc_init(MEMORY[0x24BE95E50]);
  v11 = v10;
  if (!a6)
    objc_msgSend(v10, "setTextToSynthesize:", v38);
  v12 = objc_alloc(MEMORY[0x24BE95C78]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithNSUUID:", v13);
  objc_msgSend(v11, "setLinkId:", v14);

  v15 = objc_alloc_init(MEMORY[0x24BE95E30]);
  objc_msgSend(v15, "setRequestReceivedTier1:", v11);
  v16 = objc_alloc_init(MEMORY[0x24BE95E38]);
  objc_msgSend(v15, "setEventMetadata:", v16);

  v17 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithNSUUID:", v18);
  objc_msgSend(v15, "eventMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTtsId:", v19);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "emitMessage:", v15);

  v22 = objc_alloc_init(MEMORY[0x24BE95E48]);
  objc_msgSend(v11, "linkId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLinkId:", v23);

  v24 = objc_alloc_init(MEMORY[0x24BE95E78]);
  objc_msgSend(v22, "setRequestedVoiceContext:", v24);

  v25 = +[VSSiriInstrumentation schemaVoiceTypeFromType:](VSSiriInstrumentation, "schemaVoiceTypeFromType:", a4);
  objc_msgSend(v22, "requestedVoiceContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setVoiceType:", v25);

  v27 = +[VSSiriInstrumentation schemaFootprintFromFootprint:](VSSiriInstrumentation, "schemaFootprintFromFootprint:", a5);
  objc_msgSend(v22, "requestedVoiceContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setVoiceFootprint:", v27);

  objc_msgSend(v22, "setInputTextLength:", objc_msgSend(v38, "length"));
  v29 = objc_alloc_init(MEMORY[0x24BE95E30]);
  objc_msgSend(v29, "setRequestReceived:", v22);
  v30 = objc_alloc_init(MEMORY[0x24BE95E38]);
  objc_msgSend(v29, "setEventMetadata:", v30);

  v31 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithNSUUID:", v32);
  objc_msgSend(v29, "eventMetadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTtsId:", v33);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "emitMessage:", v29);

  objc_msgSend(MEMORY[0x24BEA4BA0], "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSSiriInstrumentation instrumentPowerEvent:ttsId:](VSSiriInstrumentation, "instrumentPowerEvent:ttsId:", v36, v37);

}

- (void)instrumentSpeechStartedWithSource:(int64_t)a3 customerPerceivedLatency:(double)a4 audioOutputRoute:(id)a5 voiceType:(int64_t)a6 voiceFootprint:(int64_t)a7 voiceVersion:(unint64_t)a8 resourceVersion:(unint64_t)a9 isWhisper:(BOOL)a10
{
  objc_class *v17;
  id v18;
  uint64_t v19;
  double v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v17 = (objc_class *)MEMORY[0x24BE95E70];
  v18 = a5;
  v42 = objc_alloc_init(v17);
  v19 = +[VSSiriInstrumentation outputRouteFromRouteInfo:](VSSiriInstrumentation, "outputRouteFromRouteInfo:", v18);

  objc_msgSend(v42, "setAudioOutputRoute:", v19);
  *(float *)&v20 = a4;
  objc_msgSend(v42, "setCustomerPerceivedLatencyInSecond:", v20);
  objc_msgSend(v42, "setSynthesisSource:", +[VSSiriInstrumentation synthesisSourceFromSource:](VSSiriInstrumentation, "synthesisSourceFromSource:", a3));
  v21 = objc_alloc_init(MEMORY[0x24BE95E78]);
  objc_msgSend(v42, "setVoiceContext:", v21);

  v22 = +[VSSiriInstrumentation schemaVoiceTypeFromType:](VSSiriInstrumentation, "schemaVoiceTypeFromType:", a6);
  objc_msgSend(v42, "voiceContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setVoiceType:", v22);

  v24 = +[VSSiriInstrumentation schemaFootprintFromFootprint:](VSSiriInstrumentation, "schemaFootprintFromFootprint:", a7);
  objc_msgSend(v42, "voiceContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setVoiceFootprint:", v24);

  objc_msgSend(v42, "voiceContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setVoiceVersion:", a8);

  objc_msgSend(v42, "voiceContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setResourceVersion:", a9);

  if (a10)
    v28 = 3;
  else
    v28 = 2;
  objc_msgSend(v42, "setSynthesisEffect:", v28);
  v29 = objc_alloc_init(MEMORY[0x24BE95E40]);
  objc_msgSend(v29, "setStartedOrChanged:", v42);
  v30 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation contextId](self, "contextId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithNSUUID:", v31);
  objc_msgSend(v29, "setContextId:", v32);

  v33 = objc_alloc_init(MEMORY[0x24BE95E30]);
  objc_msgSend(v33, "setSpeechContext:", v29);
  v34 = objc_alloc_init(MEMORY[0x24BE95E38]);
  objc_msgSend(v33, "setEventMetadata:", v34);

  v35 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithNSUUID:", v36);
  objc_msgSend(v33, "eventMetadata");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTtsId:", v37);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "emitMessage:", v33);

  objc_msgSend(MEMORY[0x24BEA4BC0], "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSSiriInstrumentation instrumentPowerEvent:ttsId:](VSSiriInstrumentation, "instrumentPowerEvent:ttsId:", v40, v41);

}

- (void)instrumentSpeechEndedWithAudioDuration:(double)a3 synthesisLatency:(double)a4 realTimeFactor:(double)a5 promptCount:(unint64_t)a6 errorCode:(int64_t)a7
{
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v13 = objc_alloc_init(MEMORY[0x24BE95E60]);
  *(float *)&v14 = a3;
  objc_msgSend(v13, "setSynthesizedAudioDurationInSecond:", v14);
  *(float *)&v15 = a4;
  objc_msgSend(v13, "setSynthesisLatencyInSecond:", v15);
  *(float *)&v16 = a5;
  objc_msgSend(v13, "setSynthesisRealTimeFactor:", v16);
  objc_msgSend(v13, "setPromptCount:", a6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setErrorCodes:", v18);

  v19 = objc_alloc_init(MEMORY[0x24BE95E40]);
  objc_msgSend(v19, "setEnded:", v13);
  v20 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation contextId](self, "contextId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithNSUUID:", v21);
  objc_msgSend(v19, "setContextId:", v22);

  v23 = objc_alloc_init(MEMORY[0x24BE95E30]);
  objc_msgSend(v23, "setSpeechContext:", v19);
  v24 = objc_alloc_init(MEMORY[0x24BE95E38]);
  objc_msgSend(v23, "setEventMetadata:", v24);

  v25 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithNSUUID:", v26);
  objc_msgSend(v23, "eventMetadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTtsId:", v27);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "emitMessage:", v23);

  objc_msgSend(MEMORY[0x24BEA4BB0], "context");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSSiriInstrumentation instrumentPowerEvent:ttsId:](VSSiriInstrumentation, "instrumentPowerEvent:ttsId:", v30, v31);

}

- (void)instrumentSpeechFailedWithErrorCodes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = (objc_class *)MEMORY[0x24BE95E68];
  v5 = a3;
  v19 = objc_alloc_init(v4);
  objc_msgSend(v19, "setErrorCodes:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BE95E40]);
  objc_msgSend(v6, "setFailed:", v19);
  v7 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation contextId](self, "contextId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithNSUUID:", v8);
  objc_msgSend(v6, "setContextId:", v9);

  v10 = objc_alloc_init(MEMORY[0x24BE95E30]);
  objc_msgSend(v10, "setSpeechContext:", v6);
  v11 = objc_alloc_init(MEMORY[0x24BE95E38]);
  objc_msgSend(v10, "setEventMetadata:", v11);

  v12 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithNSUUID:", v13);
  objc_msgSend(v10, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTtsId:", v14);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "emitMessage:", v10);

  objc_msgSend(MEMORY[0x24BEA4BB8], "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSSiriInstrumentation instrumentPowerEvent:ttsId:](VSSiriInstrumentation, "instrumentPowerEvent:ttsId:", v17, v18);

}

- (void)instrumentSpeechCancelled
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = objc_alloc_init(MEMORY[0x24BE95E58]);
  objc_msgSend(v16, "setExists:", 1);
  v3 = objc_alloc_init(MEMORY[0x24BE95E40]);
  objc_msgSend(v3, "setCancelled:", v16);
  v4 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation contextId](self, "contextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithNSUUID:", v5);
  objc_msgSend(v3, "setContextId:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BE95E30]);
  objc_msgSend(v7, "setSpeechContext:", v3);
  v8 = objc_alloc_init(MEMORY[0x24BE95E38]);
  objc_msgSend(v7, "setEventMetadata:", v8);

  v9 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithNSUUID:", v10);
  objc_msgSend(v7, "eventMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTtsId:", v11);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitMessage:", v7);

  objc_msgSend(MEMORY[0x24BEA4BA8], "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSSiriInstrumentation instrumentPowerEvent:ttsId:](VSSiriInstrumentation, "instrumentPowerEvent:ttsId:", v14, v15);

}

- (void)instrumentVoiceFallbackOccurredWithVoice:(id)a3 resource:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v6 = (objc_class *)MEMORY[0x24BE95E80];
  v7 = a4;
  v8 = a3;
  v37 = objc_alloc_init(v6);
  v9 = objc_alloc_init(MEMORY[0x24BE95CA0]);
  objc_msgSend(v37, "setVoiceSettings:", v9);

  v10 = +[VSSiriInstrumentation schemaVoiceGenderFromGender:](VSSiriInstrumentation, "schemaVoiceGenderFromGender:", objc_msgSend(v8, "gender"));
  objc_msgSend(v37, "voiceSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVoiceGender:", v10);

  objc_msgSend(v8, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "voiceSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVoiceName:", v12);

  v14 = (void *)MEMORY[0x24BE95CA8];
  objc_msgSend(v8, "languages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "convertLanguageCodeToSchemaLocale:", v16);
  objc_msgSend(v37, "voiceSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setVoiceAccent:", v17);

  v19 = objc_alloc_init(MEMORY[0x24BE95E78]);
  objc_msgSend(v37, "setContext:", v19);

  v20 = +[VSSiriInstrumentation schemaVoiceTypeFromType:](VSSiriInstrumentation, "schemaVoiceTypeFromType:", objc_msgSend(v8, "type"));
  objc_msgSend(v37, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setVoiceType:", v20);

  v22 = +[VSSiriInstrumentation schemaFootprintFromFootprint:](VSSiriInstrumentation, "schemaFootprintFromFootprint:", objc_msgSend(v8, "footprint"));
  objc_msgSend(v37, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setVoiceFootprint:", v22);

  objc_msgSend(v8, "contentVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "integerValue");
  objc_msgSend(v37, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setVoiceVersion:", v25);

  objc_msgSend(v7, "contentVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "integerValue");
  objc_msgSend(v37, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setResourceVersion:", v28);

  v30 = objc_alloc_init(MEMORY[0x24BE95E30]);
  objc_msgSend(v30, "setVoiceFallbackOccurred:", v37);
  v31 = objc_alloc_init(MEMORY[0x24BE95E38]);
  objc_msgSend(v30, "setEventMetadata:", v31);

  v32 = objc_alloc(MEMORY[0x24BE95C78]);
  -[VSSiriInstrumentation ttsId](self, "ttsId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithNSUUID:", v33);
  objc_msgSend(v30, "eventMetadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTtsId:", v34);

  objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "emitMessage:", v30);

}

- (NSUUID)siriRequestId
{
  return self->_siriRequestId;
}

- (void)setSiriRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_siriRequestId, a3);
}

- (NSUUID)ttsId
{
  return self->_ttsId;
}

- (void)setTtsId:(id)a3
{
  objc_storeStrong((id *)&self->_ttsId, a3);
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
  objc_storeStrong((id *)&self->_contextId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_ttsId, 0);
  objc_storeStrong((id *)&self->_siriRequestId, 0);
}

+ (int)schemaVoiceGenderFromGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return dword_21AACEDD0[a3 - 1];
}

+ (int)schemaVoiceTypeFromType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 1;
  else
    return dword_21AACED60[a3 - 1];
}

+ (int)schemaFootprintFromFootprint:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 1;
  else
    return a3 + 1;
}

+ (int)outputRouteFromRouteInfo:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v3 = a3;
  objc_msgSend(v3, "audioRouteName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Speaker")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CarAudioOutput")) & 1) != 0)
  {
    v5 = 7;
  }
  else
  {
    v6 = objc_msgSend(v3, "isBluetoothRoute");
    v7 = objc_msgSend(v3, "isAppleProduct");
    v8 = v7 ^ 1;
    if (((v6 ^ 1) & 1) != 0 || v8)
    {
      v9 = v6 | v8;
      if (v6 | v7)
        v10 = 1;
      else
        v10 = 6;
      if (v9 == 1)
        v11 = v10;
      else
        v11 = 5;
      if ((v6 ^ 1 | v7) == 1)
        v5 = v11;
      else
        v5 = 4;
    }
    else
    {
      v5 = 3;
    }
  }

  return v5;
}

+ (int)synthesisSourceFromSource:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return 1;
  else
    return dword_21AACEDDC[a3];
}

+ (id)sharedPowerLogger
{
  if (sharedPowerLogger_once != -1)
    dispatch_once(&sharedPowerLogger_once, &__block_literal_global_3404);
  return (id)sharedPowerLogger_sharedInstance;
}

+ (void)instrumentVoicedProcessStartedPowerEvent
{
  void *v2;
  void *v3;
  id v4;

  +[VSSiriInstrumentation sharedPowerLogger](VSSiriInstrumentation, "sharedPowerLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEA4B98], "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logWithEventContext:", v3);

}

+ (void)instrumentPowerEvent:(id)a3 ttsId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[VSSiriInstrumentation sharedPowerLogger](VSSiriInstrumentation, "sharedPowerLogger");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "captureSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logWithEventContext:ttsIdentifier:", v6, v5);

}

void __42__VSSiriInstrumentation_sharedPowerLogger__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEA4B90]), "initWithCurrentProcess");
  v1 = (void *)sharedPowerLogger_sharedInstance;
  sharedPowerLogger_sharedInstance = v0;

}

@end
