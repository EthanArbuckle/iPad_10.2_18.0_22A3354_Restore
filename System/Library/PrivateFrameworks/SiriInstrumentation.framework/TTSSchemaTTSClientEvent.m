@implementation TTSSchemaTTSClientEvent

- (id)getComponentId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ttsId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
        goto LABEL_8;
    }
  }
  -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v10, "value");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v4 = v10;
LABEL_8:
      v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ttsId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = 13;
  }
  else
  {
LABEL_5:
    -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "value");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v14, "length") != 0;

      }
      else
      {
        v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      v9 = 0;
      v4 = 0;
    }
  }

  return v9;
}

+ (int)joinability
{
  return 2;
}

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TTSSchemaTTSClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[TTSSchemaTTSClientEvent deleteRequestReceivedTier1](self, "deleteRequestReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[TTSSchemaTTSClientEvent deleteRequestReceivedTier1](self, "deleteRequestReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[TTSSchemaTTSClientEvent deleteRequestReceivedTier1](self, "deleteRequestReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[TTSSchemaTTSClientEvent deleteRequestReceivedTier1](self, "deleteRequestReceivedTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[TTSSchemaTTSClientEvent deleteRequestReceivedTier1](self, "deleteRequestReceivedTier1");
  -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[TTSSchemaTTSClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[TTSSchemaTTSClientEvent speechContext](self, "speechContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[TTSSchemaTTSClientEvent deleteSpeechContext](self, "deleteSpeechContext");
  -[TTSSchemaTTSClientEvent requestReceived](self, "requestReceived");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[TTSSchemaTTSClientEvent deleteRequestReceived](self, "deleteRequestReceived");
  -[TTSSchemaTTSClientEvent requestReceivedTier1](self, "requestReceivedTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[TTSSchemaTTSClientEvent deleteRequestReceivedTier1](self, "deleteRequestReceivedTier1");
  -[TTSSchemaTTSClientEvent voiceFallbackOccurred](self, "voiceFallbackOccurred");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[TTSSchemaTTSClientEvent deleteVoiceFallbackOccurred](self, "deleteVoiceFallbackOccurred");
  -[TTSSchemaTTSClientEvent synthesisContext](self, "synthesisContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[TTSSchemaTTSClientEvent deleteSynthesisContext](self, "deleteSynthesisContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[TTSSchemaTTSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 4)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AF78[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 4)
    return 0;
  else
    return off_1E562AFA0[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[TTSSchemaTTSClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 4)
    return CFSTR("com.apple.aiml.siri.tts.TTSClientEvent");
  else
    return off_1E5638458[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[TTSSchemaTTSClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setSpeechContext:(id)a3
{
  TTSSchemaTTSClientSpeechContext *v4;
  TTSSchemaTTSRequestReceived *requestReceived;
  TTSSchemaTTSRequestReceivedTier1 *requestReceivedTier1;
  TTSSchemaTTSVoiceFallbackOccurred *voiceFallbackOccurred;
  TTSSchemaTTSClientSynthesisContext *synthesisContext;
  unint64_t v9;
  TTSSchemaTTSClientSpeechContext *speechContext;

  v4 = (TTSSchemaTTSClientSpeechContext *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  v9 = 101;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  speechContext = self->_speechContext;
  self->_speechContext = v4;

}

- (TTSSchemaTTSClientSpeechContext)speechContext
{
  if (self->_whichEvent_Type == 101)
    return self->_speechContext;
  else
    return (TTSSchemaTTSClientSpeechContext *)0;
}

- (void)deleteSpeechContext
{
  TTSSchemaTTSClientSpeechContext *speechContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    speechContext = self->_speechContext;
    self->_speechContext = 0;

  }
}

- (void)setRequestReceived:(id)a3
{
  TTSSchemaTTSRequestReceived *v4;
  TTSSchemaTTSClientSpeechContext *speechContext;
  TTSSchemaTTSRequestReceivedTier1 *requestReceivedTier1;
  TTSSchemaTTSVoiceFallbackOccurred *voiceFallbackOccurred;
  TTSSchemaTTSClientSynthesisContext *synthesisContext;
  unint64_t v9;
  TTSSchemaTTSRequestReceived *requestReceived;

  v4 = (TTSSchemaTTSRequestReceived *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  v9 = 102;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  requestReceived = self->_requestReceived;
  self->_requestReceived = v4;

}

- (TTSSchemaTTSRequestReceived)requestReceived
{
  if (self->_whichEvent_Type == 102)
    return self->_requestReceived;
  else
    return (TTSSchemaTTSRequestReceived *)0;
}

- (void)deleteRequestReceived
{
  TTSSchemaTTSRequestReceived *requestReceived;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    requestReceived = self->_requestReceived;
    self->_requestReceived = 0;

  }
}

- (void)setRequestReceivedTier1:(id)a3
{
  TTSSchemaTTSRequestReceivedTier1 *v4;
  TTSSchemaTTSClientSpeechContext *speechContext;
  TTSSchemaTTSRequestReceived *requestReceived;
  TTSSchemaTTSVoiceFallbackOccurred *voiceFallbackOccurred;
  TTSSchemaTTSClientSynthesisContext *synthesisContext;
  unint64_t v9;
  TTSSchemaTTSRequestReceivedTier1 *requestReceivedTier1;

  v4 = (TTSSchemaTTSRequestReceivedTier1 *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  v9 = 103;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = v4;

}

- (TTSSchemaTTSRequestReceivedTier1)requestReceivedTier1
{
  if (self->_whichEvent_Type == 103)
    return self->_requestReceivedTier1;
  else
    return (TTSSchemaTTSRequestReceivedTier1 *)0;
}

- (void)deleteRequestReceivedTier1
{
  TTSSchemaTTSRequestReceivedTier1 *requestReceivedTier1;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    requestReceivedTier1 = self->_requestReceivedTier1;
    self->_requestReceivedTier1 = 0;

  }
}

- (void)setVoiceFallbackOccurred:(id)a3
{
  TTSSchemaTTSVoiceFallbackOccurred *v4;
  TTSSchemaTTSClientSpeechContext *speechContext;
  TTSSchemaTTSRequestReceived *requestReceived;
  TTSSchemaTTSRequestReceivedTier1 *requestReceivedTier1;
  TTSSchemaTTSClientSynthesisContext *synthesisContext;
  unint64_t v9;
  TTSSchemaTTSVoiceFallbackOccurred *voiceFallbackOccurred;

  v4 = (TTSSchemaTTSVoiceFallbackOccurred *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = 0;

  v9 = 104;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = v4;

}

- (TTSSchemaTTSVoiceFallbackOccurred)voiceFallbackOccurred
{
  if (self->_whichEvent_Type == 104)
    return self->_voiceFallbackOccurred;
  else
    return (TTSSchemaTTSVoiceFallbackOccurred *)0;
}

- (void)deleteVoiceFallbackOccurred
{
  TTSSchemaTTSVoiceFallbackOccurred *voiceFallbackOccurred;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    voiceFallbackOccurred = self->_voiceFallbackOccurred;
    self->_voiceFallbackOccurred = 0;

  }
}

- (void)setSynthesisContext:(id)a3
{
  TTSSchemaTTSClientSynthesisContext *v4;
  TTSSchemaTTSClientSpeechContext *speechContext;
  TTSSchemaTTSRequestReceived *requestReceived;
  TTSSchemaTTSRequestReceivedTier1 *requestReceivedTier1;
  TTSSchemaTTSVoiceFallbackOccurred *voiceFallbackOccurred;
  unint64_t v9;
  TTSSchemaTTSClientSynthesisContext *synthesisContext;

  v4 = (TTSSchemaTTSClientSynthesisContext *)a3;
  speechContext = self->_speechContext;
  self->_speechContext = 0;

  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  requestReceivedTier1 = self->_requestReceivedTier1;
  self->_requestReceivedTier1 = 0;

  voiceFallbackOccurred = self->_voiceFallbackOccurred;
  self->_voiceFallbackOccurred = 0;

  v9 = 105;
  if (!v4)
    v9 = 0;
  self->_whichEvent_Type = v9;
  synthesisContext = self->_synthesisContext;
  self->_synthesisContext = v4;

}

- (TTSSchemaTTSClientSynthesisContext)synthesisContext
{
  if (self->_whichEvent_Type == 105)
    return self->_synthesisContext;
  else
    return (TTSSchemaTTSClientSynthesisContext *)0;
}

- (void)deleteSynthesisContext
{
  TTSSchemaTTSClientSynthesisContext *synthesisContext;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    synthesisContext = self->_synthesisContext;
    self->_synthesisContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
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
  id v16;

  v16 = a3;
  -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientEvent speechContext](self, "speechContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TTSSchemaTTSClientEvent speechContext](self, "speechContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientEvent requestReceived](self, "requestReceived");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TTSSchemaTTSClientEvent requestReceived](self, "requestReceived");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientEvent requestReceivedTier1](self, "requestReceivedTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TTSSchemaTTSClientEvent requestReceivedTier1](self, "requestReceivedTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientEvent voiceFallbackOccurred](self, "voiceFallbackOccurred");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TTSSchemaTTSClientEvent voiceFallbackOccurred](self, "voiceFallbackOccurred");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientEvent synthesisContext](self, "synthesisContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TTSSchemaTTSClientEvent synthesisContext](self, "synthesisContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_33;
  -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_33;
  }
  else
  {

  }
  -[TTSSchemaTTSClientEvent speechContext](self, "speechContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[TTSSchemaTTSClientEvent speechContext](self, "speechContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[TTSSchemaTTSClientEvent speechContext](self, "speechContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[TTSSchemaTTSClientEvent requestReceived](self, "requestReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[TTSSchemaTTSClientEvent requestReceived](self, "requestReceived");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[TTSSchemaTTSClientEvent requestReceived](self, "requestReceived");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestReceived");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[TTSSchemaTTSClientEvent requestReceivedTier1](self, "requestReceivedTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestReceivedTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[TTSSchemaTTSClientEvent requestReceivedTier1](self, "requestReceivedTier1");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[TTSSchemaTTSClientEvent requestReceivedTier1](self, "requestReceivedTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestReceivedTier1");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[TTSSchemaTTSClientEvent voiceFallbackOccurred](self, "voiceFallbackOccurred");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceFallbackOccurred");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[TTSSchemaTTSClientEvent voiceFallbackOccurred](self, "voiceFallbackOccurred");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[TTSSchemaTTSClientEvent voiceFallbackOccurred](self, "voiceFallbackOccurred");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceFallbackOccurred");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[TTSSchemaTTSClientEvent synthesisContext](self, "synthesisContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synthesisContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[TTSSchemaTTSClientEvent synthesisContext](self, "synthesisContext");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[TTSSchemaTTSClientEvent synthesisContext](self, "synthesisContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synthesisContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[TTSSchemaTTSClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[TTSSchemaTTSClientSpeechContext hash](self->_speechContext, "hash") ^ v3;
  v5 = -[TTSSchemaTTSRequestReceived hash](self->_requestReceived, "hash");
  v6 = v4 ^ v5 ^ -[TTSSchemaTTSRequestReceivedTier1 hash](self->_requestReceivedTier1, "hash");
  v7 = -[TTSSchemaTTSVoiceFallbackOccurred hash](self->_voiceFallbackOccurred, "hash");
  return v6 ^ v7 ^ -[TTSSchemaTTSClientSynthesisContext hash](self->_synthesisContext, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[TTSSchemaTTSClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_requestReceived)
  {
    -[TTSSchemaTTSClientEvent requestReceived](self, "requestReceived");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requestReceived"));

    }
  }
  if (self->_requestReceivedTier1)
  {
    -[TTSSchemaTTSClientEvent requestReceivedTier1](self, "requestReceivedTier1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requestReceivedTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requestReceivedTier1"));

    }
  }
  if (self->_speechContext)
  {
    -[TTSSchemaTTSClientEvent speechContext](self, "speechContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("speechContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("speechContext"));

    }
  }
  if (self->_synthesisContext)
  {
    -[TTSSchemaTTSClientEvent synthesisContext](self, "synthesisContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("synthesisContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("synthesisContext"));

    }
  }
  if (self->_voiceFallbackOccurred)
  {
    -[TTSSchemaTTSClientEvent voiceFallbackOccurred](self, "voiceFallbackOccurred");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("voiceFallbackOccurred"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("voiceFallbackOccurred"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (TTSSchemaTTSClientEvent)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSClientEvent *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[TTSSchemaTTSClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSClientEvent)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSClientEvent *v5;
  void *v6;
  TTSSchemaTTSClientEventMetadata *v7;
  void *v8;
  TTSSchemaTTSClientSpeechContext *v9;
  void *v10;
  TTSSchemaTTSRequestReceived *v11;
  void *v12;
  TTSSchemaTTSRequestReceivedTier1 *v13;
  void *v14;
  TTSSchemaTTSVoiceFallbackOccurred *v15;
  void *v16;
  TTSSchemaTTSClientSynthesisContext *v17;
  TTSSchemaTTSClientEvent *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TTSSchemaTTSClientEvent;
  v5 = -[TTSSchemaTTSClientEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[TTSSchemaTTSClientEventMetadata initWithDictionary:]([TTSSchemaTTSClientEventMetadata alloc], "initWithDictionary:", v6);
      -[TTSSchemaTTSClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[TTSSchemaTTSClientSpeechContext initWithDictionary:]([TTSSchemaTTSClientSpeechContext alloc], "initWithDictionary:", v8);
      -[TTSSchemaTTSClientEvent setSpeechContext:](v5, "setSpeechContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestReceived"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[TTSSchemaTTSRequestReceived initWithDictionary:]([TTSSchemaTTSRequestReceived alloc], "initWithDictionary:", v10);
      -[TTSSchemaTTSClientEvent setRequestReceived:](v5, "setRequestReceived:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestReceivedTier1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[TTSSchemaTTSRequestReceivedTier1 initWithDictionary:]([TTSSchemaTTSRequestReceivedTier1 alloc], "initWithDictionary:", v12);
      -[TTSSchemaTTSClientEvent setRequestReceivedTier1:](v5, "setRequestReceivedTier1:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceFallbackOccurred"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[TTSSchemaTTSVoiceFallbackOccurred initWithDictionary:]([TTSSchemaTTSVoiceFallbackOccurred alloc], "initWithDictionary:", v14);
      -[TTSSchemaTTSClientEvent setVoiceFallbackOccurred:](v5, "setVoiceFallbackOccurred:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synthesisContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[TTSSchemaTTSClientSynthesisContext initWithDictionary:]([TTSSchemaTTSClientSynthesisContext alloc], "initWithDictionary:", v16);
      -[TTSSchemaTTSClientEvent setSynthesisContext:](v5, "setSynthesisContext:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (TTSSchemaTTSClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasSpeechContext
{
  return self->_hasSpeechContext;
}

- (void)setHasSpeechContext:(BOOL)a3
{
  self->_hasSpeechContext = a3;
}

- (BOOL)hasRequestReceived
{
  return self->_hasRequestReceived;
}

- (void)setHasRequestReceived:(BOOL)a3
{
  self->_hasRequestReceived = a3;
}

- (BOOL)hasRequestReceivedTier1
{
  return self->_hasRequestReceivedTier1;
}

- (void)setHasRequestReceivedTier1:(BOOL)a3
{
  self->_hasRequestReceivedTier1 = a3;
}

- (BOOL)hasVoiceFallbackOccurred
{
  return self->_hasVoiceFallbackOccurred;
}

- (void)setHasVoiceFallbackOccurred:(BOOL)a3
{
  self->_hasVoiceFallbackOccurred = a3;
}

- (BOOL)hasSynthesisContext
{
  return self->_hasSynthesisContext;
}

- (void)setHasSynthesisContext:(BOOL)a3
{
  self->_hasSynthesisContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisContext, 0);
  objc_storeStrong((id *)&self->_voiceFallbackOccurred, 0);
  objc_storeStrong((id *)&self->_requestReceivedTier1, 0);
  objc_storeStrong((id *)&self->_requestReceived, 0);
  objc_storeStrong((id *)&self->_speechContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 24;
}

@end
