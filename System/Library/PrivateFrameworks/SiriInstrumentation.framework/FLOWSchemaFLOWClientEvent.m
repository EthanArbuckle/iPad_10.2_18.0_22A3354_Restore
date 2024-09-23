@implementation FLOWSchemaFLOWClientEvent

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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flowId");
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
        goto LABEL_11;
    }
  }
  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v4 = v10;
LABEL_11:
        v16 = v4;
        v4 = v16;
        goto LABEL_13;
      }
    }
  }
  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "value");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
      goto LABEL_11;
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

- (int)componentName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flowId");
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
    LODWORD(v9) = 3;
  }
  else
  {
LABEL_5:
    -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_9;
    objc_msgSend(v11, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    v13 = (void *)v12;
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      LODWORD(v9) = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subRequestId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v4, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (v18)
            LODWORD(v9) = 43;
          else
            LODWORD(v9) = 0;
        }
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
  }

  return (int)v9;
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
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)FLOWSchemaFLOWClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v37, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[FLOWSchemaFLOWClientEvent deleteFlowEntityContextTier1](self, "deleteFlowEntityContextTier1");
    -[FLOWSchemaFLOWClientEvent deletePegasusContextTier1](self, "deletePegasusContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerPlaybackContextTier1](self, "deleteMediaPlayerPlaybackContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerRadioStationContextTier1](self, "deleteMediaPlayerRadioStationContextTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[FLOWSchemaFLOWClientEvent deleteFlowEntityContextTier1](self, "deleteFlowEntityContextTier1");
    -[FLOWSchemaFLOWClientEvent deletePegasusContextTier1](self, "deletePegasusContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerPlaybackContextTier1](self, "deleteMediaPlayerPlaybackContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerRadioStationContextTier1](self, "deleteMediaPlayerRadioStationContextTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[FLOWSchemaFLOWClientEvent deleteFlowEntityContextTier1](self, "deleteFlowEntityContextTier1");
    -[FLOWSchemaFLOWClientEvent deletePegasusContextTier1](self, "deletePegasusContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerPlaybackContextTier1](self, "deleteMediaPlayerPlaybackContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerRadioStationContextTier1](self, "deleteMediaPlayerRadioStationContextTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[FLOWSchemaFLOWClientEvent deleteFlowEntityContextTier1](self, "deleteFlowEntityContextTier1");
    -[FLOWSchemaFLOWClientEvent deletePegasusContextTier1](self, "deletePegasusContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerPlaybackContextTier1](self, "deleteMediaPlayerPlaybackContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerRadioStationContextTier1](self, "deleteMediaPlayerRadioStationContextTier1");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[FLOWSchemaFLOWClientEvent deleteFlowEntityContextTier1](self, "deleteFlowEntityContextTier1");
    -[FLOWSchemaFLOWClientEvent deletePegasusContextTier1](self, "deletePegasusContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerPlaybackContextTier1](self, "deleteMediaPlayerPlaybackContextTier1");
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerRadioStationContextTier1](self, "deleteMediaPlayerRadioStationContextTier1");
  }
  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[FLOWSchemaFLOWClientEvent flowStep](self, "flowStep");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWClientEvent deleteFlowStep](self, "deleteFlowStep");
  -[FLOWSchemaFLOWClientEvent flowEntityContextTier1](self, "flowEntityContextTier1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWSchemaFLOWClientEvent deleteFlowEntityContextTier1](self, "deleteFlowEntityContextTier1");
  -[FLOWSchemaFLOWClientEvent smsAttachmentMetadataTier1](self, "smsAttachmentMetadataTier1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWSchemaFLOWClientEvent deleteSmsAttachmentMetadataTier1](self, "deleteSmsAttachmentMetadataTier1");
  -[FLOWSchemaFLOWClientEvent appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[FLOWSchemaFLOWClientEvent deleteAppleMusicVoicePreviewOfferNotShown](self, "deleteAppleMusicVoicePreviewOfferNotShown");
  -[FLOWSchemaFLOWClientEvent pegasusContextTier1](self, "pegasusContextTier1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[FLOWSchemaFLOWClientEvent deletePegasusContextTier1](self, "deletePegasusContextTier1");
  -[FLOWSchemaFLOWClientEvent mediaPlayerPlaybackContextTier1](self, "mediaPlayerPlaybackContextTier1");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerPlaybackContextTier1](self, "deleteMediaPlayerPlaybackContextTier1");
  -[FLOWSchemaFLOWClientEvent mediaPlayerRadioStationContextTier1](self, "mediaPlayerRadioStationContextTier1");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[FLOWSchemaFLOWClientEvent deleteMediaPlayerRadioStationContextTier1](self, "deleteMediaPlayerRadioStationContextTier1");
  -[FLOWSchemaFLOWClientEvent flowDomainExecutionContext](self, "flowDomainExecutionContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[FLOWSchemaFLOWClientEvent deleteFlowDomainExecutionContext](self, "deleteFlowDomainExecutionContext");
  -[FLOWSchemaFLOWClientEvent locationAccessPermissionPromptContext](self, "locationAccessPermissionPromptContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[FLOWSchemaFLOWClientEvent deleteLocationAccessPermissionPromptContext](self, "deleteLocationAccessPermissionPromptContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[FLOWSchemaFLOWClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 8)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E56294E8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 8)
    return 0;
  else
    return off_1E5629530[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[FLOWSchemaFLOWClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 8)
    return CFSTR("com.apple.aiml.siri.flow.FLOWClientEvent");
  else
    return off_1E562D9A8[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[FLOWSchemaFLOWClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setFlowStep:(id)a3
{
  FLOWSchemaFLOWStep *v4;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWStep *flowStep;

  v4 = (FLOWSchemaFLOWStep *)a3;
  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 101;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  flowStep = self->_flowStep;
  self->_flowStep = v4;

}

- (FLOWSchemaFLOWStep)flowStep
{
  if (self->_whichEvent_Type == 101)
    return self->_flowStep;
  else
    return (FLOWSchemaFLOWStep *)0;
}

- (void)deleteFlowStep
{
  FLOWSchemaFLOWStep *flowStep;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    flowStep = self->_flowStep;
    self->_flowStep = 0;

  }
}

- (void)setFlowEntityContextTier1:(id)a3
{
  FLOWSchemaFLOWEntityContextTier1 *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;

  v4 = (FLOWSchemaFLOWEntityContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 102;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = v4;

}

- (FLOWSchemaFLOWEntityContextTier1)flowEntityContextTier1
{
  if (self->_whichEvent_Type == 102)
    return self->_flowEntityContextTier1;
  else
    return (FLOWSchemaFLOWEntityContextTier1 *)0;
}

- (void)deleteFlowEntityContextTier1
{
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    flowEntityContextTier1 = self->_flowEntityContextTier1;
    self->_flowEntityContextTier1 = 0;

  }
}

- (void)setSmsAttachmentMetadataTier1:(id)a3
{
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;

  v4 = (FLOWSchemaFLOWSmsAttachmentMetadataTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 103;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = v4;

}

- (FLOWSchemaFLOWSmsAttachmentMetadataTier1)smsAttachmentMetadataTier1
{
  if (self->_whichEvent_Type == 103)
    return self->_smsAttachmentMetadataTier1;
  else
    return (FLOWSchemaFLOWSmsAttachmentMetadataTier1 *)0;
}

- (void)deleteSmsAttachmentMetadataTier1
{
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
    self->_smsAttachmentMetadataTier1 = 0;

  }
}

- (void)setAppleMusicVoicePreviewOfferNotShown:(id)a3
{
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;

  v4 = (FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 104;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = v4;

}

- (FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown)appleMusicVoicePreviewOfferNotShown
{
  if (self->_whichEvent_Type == 104)
    return self->_appleMusicVoicePreviewOfferNotShown;
  else
    return (FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *)0;
}

- (void)deleteAppleMusicVoicePreviewOfferNotShown
{
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
    self->_appleMusicVoicePreviewOfferNotShown = 0;

  }
}

- (void)setPegasusContextTier1:(id)a3
{
  FLOWSchemaFLOWPegasusContextTier1 *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;

  v4 = (FLOWSchemaFLOWPegasusContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 105;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = v4;

}

- (FLOWSchemaFLOWPegasusContextTier1)pegasusContextTier1
{
  if (self->_whichEvent_Type == 105)
    return self->_pegasusContextTier1;
  else
    return (FLOWSchemaFLOWPegasusContextTier1 *)0;
}

- (void)deletePegasusContextTier1
{
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    pegasusContextTier1 = self->_pegasusContextTier1;
    self->_pegasusContextTier1 = 0;

  }
}

- (void)setMediaPlayerPlaybackContextTier1:(id)a3
{
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;

  v4 = (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 106;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = v4;

}

- (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1)mediaPlayerPlaybackContextTier1
{
  if (self->_whichEvent_Type == 106)
    return self->_mediaPlayerPlaybackContextTier1;
  else
    return (FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *)0;
}

- (void)deleteMediaPlayerPlaybackContextTier1
{
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
    self->_mediaPlayerPlaybackContextTier1 = 0;

  }
}

- (void)setMediaPlayerRadioStationContextTier1:(id)a3
{
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;

  v4 = (FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 107;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = v4;

}

- (FLOWSchemaFLOWMediaPlayerRadioStationContextTier1)mediaPlayerRadioStationContextTier1
{
  if (self->_whichEvent_Type == 107)
    return self->_mediaPlayerRadioStationContextTier1;
  else
    return (FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *)0;
}

- (void)deleteMediaPlayerRadioStationContextTier1
{
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;

  if (self->_whichEvent_Type == 107)
  {
    self->_whichEvent_Type = 0;
    mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
    self->_mediaPlayerRadioStationContextTier1 = 0;

  }
}

- (void)setFlowDomainExecutionContext:(id)a3
{
  FLOWSchemaFLOWDomainExecutionContext *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;
  unint64_t v13;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;

  v4 = (FLOWSchemaFLOWDomainExecutionContext *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = 0;

  v13 = 108;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = v4;

}

- (FLOWSchemaFLOWDomainExecutionContext)flowDomainExecutionContext
{
  if (self->_whichEvent_Type == 108)
    return self->_flowDomainExecutionContext;
  else
    return (FLOWSchemaFLOWDomainExecutionContext *)0;
}

- (void)deleteFlowDomainExecutionContext
{
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;

  if (self->_whichEvent_Type == 108)
  {
    self->_whichEvent_Type = 0;
    flowDomainExecutionContext = self->_flowDomainExecutionContext;
    self->_flowDomainExecutionContext = 0;

  }
}

- (void)setLocationAccessPermissionPromptContext:(id)a3
{
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *v4;
  FLOWSchemaFLOWStep *flowStep;
  FLOWSchemaFLOWEntityContextTier1 *flowEntityContextTier1;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *smsAttachmentMetadataTier1;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *appleMusicVoicePreviewOfferNotShown;
  FLOWSchemaFLOWPegasusContextTier1 *pegasusContextTier1;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *mediaPlayerPlaybackContextTier1;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *mediaPlayerRadioStationContextTier1;
  FLOWSchemaFLOWDomainExecutionContext *flowDomainExecutionContext;
  unint64_t v13;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;

  v4 = (FLOWSchemaFLOWLocationAccessPermissionPromptContext *)a3;
  flowStep = self->_flowStep;
  self->_flowStep = 0;

  flowEntityContextTier1 = self->_flowEntityContextTier1;
  self->_flowEntityContextTier1 = 0;

  smsAttachmentMetadataTier1 = self->_smsAttachmentMetadataTier1;
  self->_smsAttachmentMetadataTier1 = 0;

  appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
  self->_appleMusicVoicePreviewOfferNotShown = 0;

  pegasusContextTier1 = self->_pegasusContextTier1;
  self->_pegasusContextTier1 = 0;

  mediaPlayerPlaybackContextTier1 = self->_mediaPlayerPlaybackContextTier1;
  self->_mediaPlayerPlaybackContextTier1 = 0;

  mediaPlayerRadioStationContextTier1 = self->_mediaPlayerRadioStationContextTier1;
  self->_mediaPlayerRadioStationContextTier1 = 0;

  flowDomainExecutionContext = self->_flowDomainExecutionContext;
  self->_flowDomainExecutionContext = 0;

  v13 = 109;
  if (!v4)
    v13 = 0;
  self->_whichEvent_Type = v13;
  locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
  self->_locationAccessPermissionPromptContext = v4;

}

- (FLOWSchemaFLOWLocationAccessPermissionPromptContext)locationAccessPermissionPromptContext
{
  if (self->_whichEvent_Type == 109)
    return self->_locationAccessPermissionPromptContext;
  else
    return (FLOWSchemaFLOWLocationAccessPermissionPromptContext *)0;
}

- (void)deleteLocationAccessPermissionPromptContext
{
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *locationAccessPermissionPromptContext;

  if (self->_whichEvent_Type == 109)
  {
    self->_whichEvent_Type = 0;
    locationAccessPermissionPromptContext = self->_locationAccessPermissionPromptContext;
    self->_locationAccessPermissionPromptContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWClientEventReadFrom(self, (uint64_t)a3);
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent flowStep](self, "flowStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWClientEvent flowStep](self, "flowStep");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent flowEntityContextTier1](self, "flowEntityContextTier1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FLOWSchemaFLOWClientEvent flowEntityContextTier1](self, "flowEntityContextTier1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent smsAttachmentMetadataTier1](self, "smsAttachmentMetadataTier1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FLOWSchemaFLOWClientEvent smsAttachmentMetadataTier1](self, "smsAttachmentMetadataTier1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FLOWSchemaFLOWClientEvent appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent pegasusContextTier1](self, "pegasusContextTier1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FLOWSchemaFLOWClientEvent pegasusContextTier1](self, "pegasusContextTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent mediaPlayerPlaybackContextTier1](self, "mediaPlayerPlaybackContextTier1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[FLOWSchemaFLOWClientEvent mediaPlayerPlaybackContextTier1](self, "mediaPlayerPlaybackContextTier1");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent mediaPlayerRadioStationContextTier1](self, "mediaPlayerRadioStationContextTier1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[FLOWSchemaFLOWClientEvent mediaPlayerRadioStationContextTier1](self, "mediaPlayerRadioStationContextTier1");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent flowDomainExecutionContext](self, "flowDomainExecutionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[FLOWSchemaFLOWClientEvent flowDomainExecutionContext](self, "flowDomainExecutionContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWClientEvent locationAccessPermissionPromptContext](self, "locationAccessPermissionPromptContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[FLOWSchemaFLOWClientEvent locationAccessPermissionPromptContext](self, "locationAccessPermissionPromptContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  BOOL v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_53;
  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent flowStep](self, "flowStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowStep");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent flowStep](self, "flowStep");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FLOWSchemaFLOWClientEvent flowStep](self, "flowStep");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowStep");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent flowEntityContextTier1](self, "flowEntityContextTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowEntityContextTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent flowEntityContextTier1](self, "flowEntityContextTier1");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLOWSchemaFLOWClientEvent flowEntityContextTier1](self, "flowEntityContextTier1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowEntityContextTier1");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent smsAttachmentMetadataTier1](self, "smsAttachmentMetadataTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smsAttachmentMetadataTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent smsAttachmentMetadataTier1](self, "smsAttachmentMetadataTier1");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[FLOWSchemaFLOWClientEvent smsAttachmentMetadataTier1](self, "smsAttachmentMetadataTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smsAttachmentMetadataTier1");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleMusicVoicePreviewOfferNotShown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[FLOWSchemaFLOWClientEvent appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleMusicVoicePreviewOfferNotShown");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent pegasusContextTier1](self, "pegasusContextTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusContextTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent pegasusContextTier1](self, "pegasusContextTier1");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[FLOWSchemaFLOWClientEvent pegasusContextTier1](self, "pegasusContextTier1");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusContextTier1");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent mediaPlayerPlaybackContextTier1](self, "mediaPlayerPlaybackContextTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayerPlaybackContextTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent mediaPlayerPlaybackContextTier1](self, "mediaPlayerPlaybackContextTier1");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[FLOWSchemaFLOWClientEvent mediaPlayerPlaybackContextTier1](self, "mediaPlayerPlaybackContextTier1");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPlayerPlaybackContextTier1");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent mediaPlayerRadioStationContextTier1](self, "mediaPlayerRadioStationContextTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayerRadioStationContextTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent mediaPlayerRadioStationContextTier1](self, "mediaPlayerRadioStationContextTier1");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[FLOWSchemaFLOWClientEvent mediaPlayerRadioStationContextTier1](self, "mediaPlayerRadioStationContextTier1");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPlayerRadioStationContextTier1");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent flowDomainExecutionContext](self, "flowDomainExecutionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowDomainExecutionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_52;
  -[FLOWSchemaFLOWClientEvent flowDomainExecutionContext](self, "flowDomainExecutionContext");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[FLOWSchemaFLOWClientEvent flowDomainExecutionContext](self, "flowDomainExecutionContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowDomainExecutionContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_53;
  }
  else
  {

  }
  -[FLOWSchemaFLOWClientEvent locationAccessPermissionPromptContext](self, "locationAccessPermissionPromptContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationAccessPermissionPromptContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLOWSchemaFLOWClientEvent locationAccessPermissionPromptContext](self, "locationAccessPermissionPromptContext");
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {

LABEL_56:
      v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    -[FLOWSchemaFLOWClientEvent locationAccessPermissionPromptContext](self, "locationAccessPermissionPromptContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationAccessPermissionPromptContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if ((v57 & 1) != 0)
      goto LABEL_56;
  }
  else
  {
LABEL_52:

  }
LABEL_53:
  v58 = 0;
LABEL_54:

  return v58;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[FLOWSchemaFLOWEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[FLOWSchemaFLOWStep hash](self->_flowStep, "hash") ^ v3;
  v5 = -[FLOWSchemaFLOWEntityContextTier1 hash](self->_flowEntityContextTier1, "hash");
  v6 = v4 ^ v5 ^ -[FLOWSchemaFLOWSmsAttachmentMetadataTier1 hash](self->_smsAttachmentMetadataTier1, "hash");
  v7 = -[FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown hash](self->_appleMusicVoicePreviewOfferNotShown, "hash");
  v8 = v7 ^ -[FLOWSchemaFLOWPegasusContextTier1 hash](self->_pegasusContextTier1, "hash");
  v9 = v6 ^ v8 ^ -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 hash](self->_mediaPlayerPlaybackContextTier1, "hash");
  v10 = -[FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 hash](self->_mediaPlayerRadioStationContextTier1, "hash");
  v11 = v10 ^ -[FLOWSchemaFLOWDomainExecutionContext hash](self->_flowDomainExecutionContext, "hash");
  return v9 ^ v11 ^ -[FLOWSchemaFLOWLocationAccessPermissionPromptContext hash](self->_locationAccessPermissionPromptContext, "hash");
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appleMusicVoicePreviewOfferNotShown)
  {
    -[FLOWSchemaFLOWClientEvent appleMusicVoicePreviewOfferNotShown](self, "appleMusicVoicePreviewOfferNotShown");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appleMusicVoicePreviewOfferNotShown"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appleMusicVoicePreviewOfferNotShown"));

    }
  }
  if (self->_eventMetadata)
  {
    -[FLOWSchemaFLOWClientEvent eventMetadata](self, "eventMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventMetadata"));

    }
  }
  if (self->_flowDomainExecutionContext)
  {
    -[FLOWSchemaFLOWClientEvent flowDomainExecutionContext](self, "flowDomainExecutionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("flowDomainExecutionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("flowDomainExecutionContext"));

    }
  }
  if (self->_flowEntityContextTier1)
  {
    -[FLOWSchemaFLOWClientEvent flowEntityContextTier1](self, "flowEntityContextTier1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("flowEntityContextTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("flowEntityContextTier1"));

    }
  }
  if (self->_flowStep)
  {
    -[FLOWSchemaFLOWClientEvent flowStep](self, "flowStep");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("flowStep"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("flowStep"));

    }
  }
  if (self->_locationAccessPermissionPromptContext)
  {
    -[FLOWSchemaFLOWClientEvent locationAccessPermissionPromptContext](self, "locationAccessPermissionPromptContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("locationAccessPermissionPromptContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("locationAccessPermissionPromptContext"));

    }
  }
  if (self->_mediaPlayerPlaybackContextTier1)
  {
    -[FLOWSchemaFLOWClientEvent mediaPlayerPlaybackContextTier1](self, "mediaPlayerPlaybackContextTier1");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("mediaPlayerPlaybackContextTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("mediaPlayerPlaybackContextTier1"));

    }
  }
  if (self->_mediaPlayerRadioStationContextTier1)
  {
    -[FLOWSchemaFLOWClientEvent mediaPlayerRadioStationContextTier1](self, "mediaPlayerRadioStationContextTier1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("mediaPlayerRadioStationContextTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("mediaPlayerRadioStationContextTier1"));

    }
  }
  if (self->_pegasusContextTier1)
  {
    -[FLOWSchemaFLOWClientEvent pegasusContextTier1](self, "pegasusContextTier1");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("pegasusContextTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("pegasusContextTier1"));

    }
  }
  if (self->_smsAttachmentMetadataTier1)
  {
    -[FLOWSchemaFLOWClientEvent smsAttachmentMetadataTier1](self, "smsAttachmentMetadataTier1");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("smsAttachmentMetadataTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("smsAttachmentMetadataTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWClientEvent)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWClientEvent *v5;
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
    self = -[FLOWSchemaFLOWClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWClientEvent)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWClientEvent *v5;
  uint64_t v6;
  FLOWSchemaFLOWEventMetadata *v7;
  uint64_t v8;
  FLOWSchemaFLOWStep *v9;
  uint64_t v10;
  FLOWSchemaFLOWEntityContextTier1 *v11;
  uint64_t v12;
  FLOWSchemaFLOWSmsAttachmentMetadataTier1 *v13;
  void *v14;
  FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown *v15;
  void *v16;
  FLOWSchemaFLOWPegasusContextTier1 *v17;
  void *v18;
  FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 *v19;
  void *v20;
  void *v21;
  FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 *v22;
  void *v23;
  FLOWSchemaFLOWDomainExecutionContext *v24;
  void *v25;
  FLOWSchemaFLOWLocationAccessPermissionPromptContext *v26;
  FLOWSchemaFLOWClientEvent *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FLOWSchemaFLOWClientEvent;
  v5 = -[FLOWSchemaFLOWClientEvent init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLOWSchemaFLOWEventMetadata initWithDictionary:]([FLOWSchemaFLOWEventMetadata alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowStep"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWSchemaFLOWStep initWithDictionary:]([FLOWSchemaFLOWStep alloc], "initWithDictionary:", v8);
      -[FLOWSchemaFLOWClientEvent setFlowStep:](v5, "setFlowStep:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowEntityContextTier1"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FLOWSchemaFLOWEntityContextTier1 initWithDictionary:]([FLOWSchemaFLOWEntityContextTier1 alloc], "initWithDictionary:", v10);
      -[FLOWSchemaFLOWClientEvent setFlowEntityContextTier1:](v5, "setFlowEntityContextTier1:", v11);

    }
    v30 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smsAttachmentMetadataTier1"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[FLOWSchemaFLOWSmsAttachmentMetadataTier1 initWithDictionary:]([FLOWSchemaFLOWSmsAttachmentMetadataTier1 alloc], "initWithDictionary:", v12);
      -[FLOWSchemaFLOWClientEvent setSmsAttachmentMetadataTier1:](v5, "setSmsAttachmentMetadataTier1:", v13);

    }
    v29 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleMusicVoicePreviewOfferNotShown"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown initWithDictionary:]([FLOWSchemaFLOWAppleMusicVoicePreviewOfferNotShown alloc], "initWithDictionary:", v14);
      -[FLOWSchemaFLOWClientEvent setAppleMusicVoicePreviewOfferNotShown:](v5, "setAppleMusicVoicePreviewOfferNotShown:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusContextTier1"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[FLOWSchemaFLOWPegasusContextTier1 initWithDictionary:]([FLOWSchemaFLOWPegasusContextTier1 alloc], "initWithDictionary:", v16);
      -[FLOWSchemaFLOWClientEvent setPegasusContextTier1:](v5, "setPegasusContextTier1:", v17);

    }
    v31 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaPlayerPlaybackContextTier1"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 initWithDictionary:]([FLOWSchemaFLOWMediaPlayerPlaybackContextTier1 alloc], "initWithDictionary:", v18);
      -[FLOWSchemaFLOWClientEvent setMediaPlayerPlaybackContextTier1:](v5, "setMediaPlayerPlaybackContextTier1:", v19);

    }
    v20 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaPlayerRadioStationContextTier1"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 initWithDictionary:]([FLOWSchemaFLOWMediaPlayerRadioStationContextTier1 alloc], "initWithDictionary:", v21);
      -[FLOWSchemaFLOWClientEvent setMediaPlayerRadioStationContextTier1:](v5, "setMediaPlayerRadioStationContextTier1:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowDomainExecutionContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[FLOWSchemaFLOWDomainExecutionContext initWithDictionary:]([FLOWSchemaFLOWDomainExecutionContext alloc], "initWithDictionary:", v23);
      -[FLOWSchemaFLOWClientEvent setFlowDomainExecutionContext:](v5, "setFlowDomainExecutionContext:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationAccessPermissionPromptContext"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[FLOWSchemaFLOWLocationAccessPermissionPromptContext initWithDictionary:]([FLOWSchemaFLOWLocationAccessPermissionPromptContext alloc], "initWithDictionary:", v25);
      -[FLOWSchemaFLOWClientEvent setLocationAccessPermissionPromptContext:](v5, "setLocationAccessPermissionPromptContext:", v26);

    }
    v27 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (FLOWSchemaFLOWEventMetadata)eventMetadata
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

- (BOOL)hasFlowStep
{
  return self->_hasFlowStep;
}

- (void)setHasFlowStep:(BOOL)a3
{
  self->_hasFlowStep = a3;
}

- (BOOL)hasFlowEntityContextTier1
{
  return self->_hasFlowEntityContextTier1;
}

- (void)setHasFlowEntityContextTier1:(BOOL)a3
{
  self->_hasFlowEntityContextTier1 = a3;
}

- (BOOL)hasSmsAttachmentMetadataTier1
{
  return self->_hasSmsAttachmentMetadataTier1;
}

- (void)setHasSmsAttachmentMetadataTier1:(BOOL)a3
{
  self->_hasSmsAttachmentMetadataTier1 = a3;
}

- (BOOL)hasAppleMusicVoicePreviewOfferNotShown
{
  return self->_hasAppleMusicVoicePreviewOfferNotShown;
}

- (void)setHasAppleMusicVoicePreviewOfferNotShown:(BOOL)a3
{
  self->_hasAppleMusicVoicePreviewOfferNotShown = a3;
}

- (BOOL)hasPegasusContextTier1
{
  return self->_hasPegasusContextTier1;
}

- (void)setHasPegasusContextTier1:(BOOL)a3
{
  self->_hasPegasusContextTier1 = a3;
}

- (BOOL)hasMediaPlayerPlaybackContextTier1
{
  return self->_hasMediaPlayerPlaybackContextTier1;
}

- (void)setHasMediaPlayerPlaybackContextTier1:(BOOL)a3
{
  self->_hasMediaPlayerPlaybackContextTier1 = a3;
}

- (BOOL)hasMediaPlayerRadioStationContextTier1
{
  return self->_hasMediaPlayerRadioStationContextTier1;
}

- (void)setHasMediaPlayerRadioStationContextTier1:(BOOL)a3
{
  self->_hasMediaPlayerRadioStationContextTier1 = a3;
}

- (BOOL)hasFlowDomainExecutionContext
{
  return self->_hasFlowDomainExecutionContext;
}

- (void)setHasFlowDomainExecutionContext:(BOOL)a3
{
  self->_hasFlowDomainExecutionContext = a3;
}

- (BOOL)hasLocationAccessPermissionPromptContext
{
  return self->_hasLocationAccessPermissionPromptContext;
}

- (void)setHasLocationAccessPermissionPromptContext:(BOOL)a3
{
  self->_hasLocationAccessPermissionPromptContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAccessPermissionPromptContext, 0);
  objc_storeStrong((id *)&self->_flowDomainExecutionContext, 0);
  objc_storeStrong((id *)&self->_mediaPlayerRadioStationContextTier1, 0);
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackContextTier1, 0);
  objc_storeStrong((id *)&self->_pegasusContextTier1, 0);
  objc_storeStrong((id *)&self->_appleMusicVoicePreviewOfferNotShown, 0);
  objc_storeStrong((id *)&self->_smsAttachmentMetadataTier1, 0);
  objc_storeStrong((id *)&self->_flowEntityContextTier1, 0);
  objc_storeStrong((id *)&self->_flowStep, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 13;
}

@end
