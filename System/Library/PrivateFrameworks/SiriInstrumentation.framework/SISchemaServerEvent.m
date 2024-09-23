@implementation SISchemaServerEvent

- (id)getComponentId
{
  SISchemaUUID *v3;
  void *v4;
  void *v5;
  SISchemaUUID *v6;
  SISchemaUUID *v7;
  void *v8;
  uint64_t v9;

  v3 = [SISchemaUUID alloc];
  -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SISchemaUUID initWithBytesAsData:](v3, "initWithBytesAsData:", v5);

  if (!v6)
    goto LABEL_5;
  -[SISchemaUUID value](v6, "value");
  v7 = (SISchemaUUID *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SISchemaUUID value](v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v7 = v6;
      goto LABEL_6;
    }
LABEL_5:
    v7 = 0;
  }
LABEL_6:

  return v7;
}

- (int)componentName
{
  SISchemaUUID *v3;
  void *v4;
  void *v5;
  SISchemaUUID *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v3 = [SISchemaUUID alloc];
  -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SISchemaUUID initWithBytesAsData:](v3, "initWithBytesAsData:", v5);

  if (v6)
  {
    -[SISchemaUUID value](v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SISchemaUUID value](v6, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length") != 0;

      LODWORD(v7) = 2 * v9;
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }

  return (int)v7;
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
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SISchemaServerEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaServerEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[SISchemaServerEvent userSpeechDuration](self, "userSpeechDuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaServerEvent deleteUserSpeechDuration](self, "deleteUserSpeechDuration");
  -[SISchemaServerEvent serverConversationTrace](self, "serverConversationTrace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaServerEvent deleteServerConversationTrace](self, "deleteServerConversationTrace");
  -[SISchemaServerEvent turnInteraction](self, "turnInteraction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SISchemaServerEvent deleteTurnInteraction](self, "deleteTurnInteraction");
  -[SISchemaServerEvent speechResultSelected](self, "speechResultSelected");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[SISchemaServerEvent deleteSpeechResultSelected](self, "deleteSpeechResultSelected");
  -[SISchemaServerEvent serverDeviceFixedContext](self, "serverDeviceFixedContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[SISchemaServerEvent deleteServerDeviceFixedContext](self, "deleteServerDeviceFixedContext");
  -[SISchemaServerEvent serverGeneratedDismissal](self, "serverGeneratedDismissal");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[SISchemaServerEvent deleteServerGeneratedDismissal](self, "deleteServerGeneratedDismissal");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SISchemaServerEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 5)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AEE8[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5)
    return 0;
  else
    return off_1E562AF18[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SISchemaServerEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 5)
    return CFSTR("com.apple.aiml.siri.uei.ServerEvent");
  else
    return off_1E5637130[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SISchemaServerEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setUserSpeechDuration:(id)a3
{
  SISchemaUserSpeechDuration *v4;
  SISchemaConversationTrace *serverConversationTrace;
  SISchemaTurnInteraction *turnInteraction;
  SISchemaSpeechResultSelected *speechResultSelected;
  SISchemaDeviceFixedContext *serverDeviceFixedContext;
  SISchemaServerGeneratedDismissal *serverGeneratedDismissal;
  unint64_t v10;
  SISchemaUserSpeechDuration *userSpeechDuration;

  v4 = (SISchemaUserSpeechDuration *)a3;
  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  v10 = 101;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = v4;

}

- (SISchemaUserSpeechDuration)userSpeechDuration
{
  if (self->_whichEvent_Type == 101)
    return self->_userSpeechDuration;
  else
    return (SISchemaUserSpeechDuration *)0;
}

- (void)deleteUserSpeechDuration
{
  SISchemaUserSpeechDuration *userSpeechDuration;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    userSpeechDuration = self->_userSpeechDuration;
    self->_userSpeechDuration = 0;

  }
}

- (void)setServerConversationTrace:(id)a3
{
  SISchemaConversationTrace *v4;
  SISchemaUserSpeechDuration *userSpeechDuration;
  SISchemaTurnInteraction *turnInteraction;
  SISchemaSpeechResultSelected *speechResultSelected;
  SISchemaDeviceFixedContext *serverDeviceFixedContext;
  SISchemaServerGeneratedDismissal *serverGeneratedDismissal;
  unint64_t v10;
  SISchemaConversationTrace *serverConversationTrace;

  v4 = (SISchemaConversationTrace *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  v10 = 102;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = v4;

}

- (SISchemaConversationTrace)serverConversationTrace
{
  if (self->_whichEvent_Type == 102)
    return self->_serverConversationTrace;
  else
    return (SISchemaConversationTrace *)0;
}

- (void)deleteServerConversationTrace
{
  SISchemaConversationTrace *serverConversationTrace;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    serverConversationTrace = self->_serverConversationTrace;
    self->_serverConversationTrace = 0;

  }
}

- (void)setTurnInteraction:(id)a3
{
  SISchemaTurnInteraction *v4;
  SISchemaUserSpeechDuration *userSpeechDuration;
  SISchemaConversationTrace *serverConversationTrace;
  SISchemaSpeechResultSelected *speechResultSelected;
  SISchemaDeviceFixedContext *serverDeviceFixedContext;
  SISchemaServerGeneratedDismissal *serverGeneratedDismissal;
  unint64_t v10;
  SISchemaTurnInteraction *turnInteraction;

  v4 = (SISchemaTurnInteraction *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  v10 = 103;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = v4;

}

- (SISchemaTurnInteraction)turnInteraction
{
  if (self->_whichEvent_Type == 103)
    return self->_turnInteraction;
  else
    return (SISchemaTurnInteraction *)0;
}

- (void)deleteTurnInteraction
{
  SISchemaTurnInteraction *turnInteraction;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    turnInteraction = self->_turnInteraction;
    self->_turnInteraction = 0;

  }
}

- (void)setSpeechResultSelected:(id)a3
{
  SISchemaSpeechResultSelected *v4;
  SISchemaUserSpeechDuration *userSpeechDuration;
  SISchemaConversationTrace *serverConversationTrace;
  SISchemaTurnInteraction *turnInteraction;
  SISchemaDeviceFixedContext *serverDeviceFixedContext;
  SISchemaServerGeneratedDismissal *serverGeneratedDismissal;
  unint64_t v10;
  SISchemaSpeechResultSelected *speechResultSelected;

  v4 = (SISchemaSpeechResultSelected *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  v10 = 104;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = v4;

}

- (SISchemaSpeechResultSelected)speechResultSelected
{
  if (self->_whichEvent_Type == 104)
    return self->_speechResultSelected;
  else
    return (SISchemaSpeechResultSelected *)0;
}

- (void)deleteSpeechResultSelected
{
  SISchemaSpeechResultSelected *speechResultSelected;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    speechResultSelected = self->_speechResultSelected;
    self->_speechResultSelected = 0;

  }
}

- (void)setServerDeviceFixedContext:(id)a3
{
  SISchemaDeviceFixedContext *v4;
  SISchemaUserSpeechDuration *userSpeechDuration;
  SISchemaConversationTrace *serverConversationTrace;
  SISchemaTurnInteraction *turnInteraction;
  SISchemaSpeechResultSelected *speechResultSelected;
  SISchemaServerGeneratedDismissal *serverGeneratedDismissal;
  unint64_t v10;
  SISchemaDeviceFixedContext *serverDeviceFixedContext;

  v4 = (SISchemaDeviceFixedContext *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = 0;

  v10 = 105;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = v4;

}

- (SISchemaDeviceFixedContext)serverDeviceFixedContext
{
  if (self->_whichEvent_Type == 105)
    return self->_serverDeviceFixedContext;
  else
    return (SISchemaDeviceFixedContext *)0;
}

- (void)deleteServerDeviceFixedContext
{
  SISchemaDeviceFixedContext *serverDeviceFixedContext;

  if (self->_whichEvent_Type == 105)
  {
    self->_whichEvent_Type = 0;
    serverDeviceFixedContext = self->_serverDeviceFixedContext;
    self->_serverDeviceFixedContext = 0;

  }
}

- (void)setServerGeneratedDismissal:(id)a3
{
  SISchemaServerGeneratedDismissal *v4;
  SISchemaUserSpeechDuration *userSpeechDuration;
  SISchemaConversationTrace *serverConversationTrace;
  SISchemaTurnInteraction *turnInteraction;
  SISchemaSpeechResultSelected *speechResultSelected;
  SISchemaDeviceFixedContext *serverDeviceFixedContext;
  unint64_t v10;
  SISchemaServerGeneratedDismissal *serverGeneratedDismissal;

  v4 = (SISchemaServerGeneratedDismissal *)a3;
  userSpeechDuration = self->_userSpeechDuration;
  self->_userSpeechDuration = 0;

  serverConversationTrace = self->_serverConversationTrace;
  self->_serverConversationTrace = 0;

  turnInteraction = self->_turnInteraction;
  self->_turnInteraction = 0;

  speechResultSelected = self->_speechResultSelected;
  self->_speechResultSelected = 0;

  serverDeviceFixedContext = self->_serverDeviceFixedContext;
  self->_serverDeviceFixedContext = 0;

  v10 = 106;
  if (!v4)
    v10 = 0;
  self->_whichEvent_Type = v10;
  serverGeneratedDismissal = self->_serverGeneratedDismissal;
  self->_serverGeneratedDismissal = v4;

}

- (SISchemaServerGeneratedDismissal)serverGeneratedDismissal
{
  if (self->_whichEvent_Type == 106)
    return self->_serverGeneratedDismissal;
  else
    return (SISchemaServerGeneratedDismissal *)0;
}

- (void)deleteServerGeneratedDismissal
{
  SISchemaServerGeneratedDismissal *serverGeneratedDismissal;

  if (self->_whichEvent_Type == 106)
  {
    self->_whichEvent_Type = 0;
    serverGeneratedDismissal = self->_serverGeneratedDismissal;
    self->_serverGeneratedDismissal = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaServerEventReadFrom(self, (uint64_t)a3);
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
  id v18;

  v18 = a3;
  -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaServerEvent userSpeechDuration](self, "userSpeechDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaServerEvent userSpeechDuration](self, "userSpeechDuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaServerEvent serverConversationTrace](self, "serverConversationTrace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SISchemaServerEvent serverConversationTrace](self, "serverConversationTrace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaServerEvent turnInteraction](self, "turnInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SISchemaServerEvent turnInteraction](self, "turnInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaServerEvent speechResultSelected](self, "speechResultSelected");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SISchemaServerEvent speechResultSelected](self, "speechResultSelected");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaServerEvent serverDeviceFixedContext](self, "serverDeviceFixedContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SISchemaServerEvent serverDeviceFixedContext](self, "serverDeviceFixedContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaServerEvent serverGeneratedDismissal](self, "serverGeneratedDismissal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SISchemaServerEvent serverGeneratedDismissal](self, "serverGeneratedDismissal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v42;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_38;
  -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_38;
  }
  else
  {

  }
  -[SISchemaServerEvent userSpeechDuration](self, "userSpeechDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSpeechDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SISchemaServerEvent userSpeechDuration](self, "userSpeechDuration");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SISchemaServerEvent userSpeechDuration](self, "userSpeechDuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSpeechDuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_38;
  }
  else
  {

  }
  -[SISchemaServerEvent serverConversationTrace](self, "serverConversationTrace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverConversationTrace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SISchemaServerEvent serverConversationTrace](self, "serverConversationTrace");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SISchemaServerEvent serverConversationTrace](self, "serverConversationTrace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverConversationTrace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_38;
  }
  else
  {

  }
  -[SISchemaServerEvent turnInteraction](self, "turnInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SISchemaServerEvent turnInteraction](self, "turnInteraction");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[SISchemaServerEvent turnInteraction](self, "turnInteraction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnInteraction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_38;
  }
  else
  {

  }
  -[SISchemaServerEvent speechResultSelected](self, "speechResultSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechResultSelected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SISchemaServerEvent speechResultSelected](self, "speechResultSelected");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[SISchemaServerEvent speechResultSelected](self, "speechResultSelected");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechResultSelected");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_38;
  }
  else
  {

  }
  -[SISchemaServerEvent serverDeviceFixedContext](self, "serverDeviceFixedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverDeviceFixedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_37;
  -[SISchemaServerEvent serverDeviceFixedContext](self, "serverDeviceFixedContext");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[SISchemaServerEvent serverDeviceFixedContext](self, "serverDeviceFixedContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverDeviceFixedContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_38;
  }
  else
  {

  }
  -[SISchemaServerEvent serverGeneratedDismissal](self, "serverGeneratedDismissal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverGeneratedDismissal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SISchemaServerEvent serverGeneratedDismissal](self, "serverGeneratedDismissal");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
    {

LABEL_41:
      v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    -[SISchemaServerEvent serverGeneratedDismissal](self, "serverGeneratedDismissal");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverGeneratedDismissal");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if ((v42 & 1) != 0)
      goto LABEL_41;
  }
  else
  {
LABEL_37:

  }
LABEL_38:
  v43 = 0;
LABEL_39:

  return v43;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[SISchemaServerEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[SISchemaUserSpeechDuration hash](self->_userSpeechDuration, "hash") ^ v3;
  v5 = -[SISchemaConversationTrace hash](self->_serverConversationTrace, "hash");
  v6 = v4 ^ v5 ^ -[SISchemaTurnInteraction hash](self->_turnInteraction, "hash");
  v7 = -[SISchemaSpeechResultSelected hash](self->_speechResultSelected, "hash");
  v8 = v7 ^ -[SISchemaDeviceFixedContext hash](self->_serverDeviceFixedContext, "hash");
  return v6 ^ v8 ^ -[SISchemaServerGeneratedDismissal hash](self->_serverGeneratedDismissal, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[SISchemaServerEvent eventMetadata](self, "eventMetadata");
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
  if (self->_serverConversationTrace)
  {
    -[SISchemaServerEvent serverConversationTrace](self, "serverConversationTrace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("serverConversationTrace"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("serverConversationTrace"));

    }
  }
  if (self->_serverDeviceFixedContext)
  {
    -[SISchemaServerEvent serverDeviceFixedContext](self, "serverDeviceFixedContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("serverDeviceFixedContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("serverDeviceFixedContext"));

    }
  }
  if (self->_serverGeneratedDismissal)
  {
    -[SISchemaServerEvent serverGeneratedDismissal](self, "serverGeneratedDismissal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("serverGeneratedDismissal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("serverGeneratedDismissal"));

    }
  }
  if (self->_speechResultSelected)
  {
    -[SISchemaServerEvent speechResultSelected](self, "speechResultSelected");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("speechResultSelected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("speechResultSelected"));

    }
  }
  if (self->_turnInteraction)
  {
    -[SISchemaServerEvent turnInteraction](self, "turnInteraction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("turnInteraction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("turnInteraction"));

    }
  }
  if (self->_userSpeechDuration)
  {
    -[SISchemaServerEvent userSpeechDuration](self, "userSpeechDuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("userSpeechDuration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("userSpeechDuration"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaServerEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaServerEvent)initWithJSON:(id)a3
{
  void *v4;
  SISchemaServerEvent *v5;
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
    self = -[SISchemaServerEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaServerEvent)initWithDictionary:(id)a3
{
  id v4;
  SISchemaServerEvent *v5;
  void *v6;
  SISchemaServerEventMetadata *v7;
  void *v8;
  SISchemaUserSpeechDuration *v9;
  void *v10;
  SISchemaConversationTrace *v11;
  void *v12;
  SISchemaTurnInteraction *v13;
  void *v14;
  SISchemaSpeechResultSelected *v15;
  void *v16;
  SISchemaDeviceFixedContext *v17;
  void *v18;
  SISchemaServerGeneratedDismissal *v19;
  SISchemaServerEvent *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SISchemaServerEvent;
  v5 = -[SISchemaServerEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaServerEventMetadata initWithDictionary:]([SISchemaServerEventMetadata alloc], "initWithDictionary:", v6);
      -[SISchemaServerEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userSpeechDuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUserSpeechDuration initWithDictionary:]([SISchemaUserSpeechDuration alloc], "initWithDictionary:", v8);
      -[SISchemaServerEvent setUserSpeechDuration:](v5, "setUserSpeechDuration:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverConversationTrace"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaConversationTrace initWithDictionary:]([SISchemaConversationTrace alloc], "initWithDictionary:", v10);
      -[SISchemaServerEvent setServerConversationTrace:](v5, "setServerConversationTrace:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnInteraction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaTurnInteraction initWithDictionary:]([SISchemaTurnInteraction alloc], "initWithDictionary:", v12);
      -[SISchemaServerEvent setTurnInteraction:](v5, "setTurnInteraction:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechResultSelected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaSpeechResultSelected initWithDictionary:]([SISchemaSpeechResultSelected alloc], "initWithDictionary:", v14);
      -[SISchemaServerEvent setSpeechResultSelected:](v5, "setSpeechResultSelected:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverDeviceFixedContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaDeviceFixedContext initWithDictionary:]([SISchemaDeviceFixedContext alloc], "initWithDictionary:", v16);
      -[SISchemaServerEvent setServerDeviceFixedContext:](v5, "setServerDeviceFixedContext:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverGeneratedDismissal"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[SISchemaServerGeneratedDismissal initWithDictionary:]([SISchemaServerGeneratedDismissal alloc], "initWithDictionary:", v18);
      -[SISchemaServerEvent setServerGeneratedDismissal:](v5, "setServerGeneratedDismissal:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SISchemaServerEventMetadata)eventMetadata
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

- (BOOL)hasUserSpeechDuration
{
  return self->_hasUserSpeechDuration;
}

- (void)setHasUserSpeechDuration:(BOOL)a3
{
  self->_hasUserSpeechDuration = a3;
}

- (BOOL)hasServerConversationTrace
{
  return self->_hasServerConversationTrace;
}

- (void)setHasServerConversationTrace:(BOOL)a3
{
  self->_hasServerConversationTrace = a3;
}

- (BOOL)hasTurnInteraction
{
  return self->_hasTurnInteraction;
}

- (void)setHasTurnInteraction:(BOOL)a3
{
  self->_hasTurnInteraction = a3;
}

- (BOOL)hasSpeechResultSelected
{
  return self->_hasSpeechResultSelected;
}

- (void)setHasSpeechResultSelected:(BOOL)a3
{
  self->_hasSpeechResultSelected = a3;
}

- (BOOL)hasServerDeviceFixedContext
{
  return self->_hasServerDeviceFixedContext;
}

- (void)setHasServerDeviceFixedContext:(BOOL)a3
{
  self->_hasServerDeviceFixedContext = a3;
}

- (BOOL)hasServerGeneratedDismissal
{
  return self->_hasServerGeneratedDismissal;
}

- (void)setHasServerGeneratedDismissal:(BOOL)a3
{
  self->_hasServerGeneratedDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverGeneratedDismissal, 0);
  objc_storeStrong((id *)&self->_serverDeviceFixedContext, 0);
  objc_storeStrong((id *)&self->_speechResultSelected, 0);
  objc_storeStrong((id *)&self->_turnInteraction, 0);
  objc_storeStrong((id *)&self->_serverConversationTrace, 0);
  objc_storeStrong((id *)&self->_userSpeechDuration, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 2;
}

@end
