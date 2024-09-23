@implementation CAMSchemaCAMClientEvent

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

  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "camId");
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
  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
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
  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
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

  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "camId");
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
    LODWORD(v9) = 4;
  }
  else
  {
LABEL_5:
    -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
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
      -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
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
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CAMSchemaCAMClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CAMSchemaCAMClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[CAMSchemaCAMClientEvent requestReceived](self, "requestReceived");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CAMSchemaCAMClientEvent deleteRequestReceived](self, "deleteRequestReceived");
  -[CAMSchemaCAMClientEvent modelExecuted](self, "modelExecuted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CAMSchemaCAMClientEvent deleteModelExecuted](self, "deleteModelExecuted");
  -[CAMSchemaCAMClientEvent responseGenerated](self, "responseGenerated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CAMSchemaCAMClientEvent deleteResponseGenerated](self, "deleteResponseGenerated");
  -[CAMSchemaCAMClientEvent autoSendFeaturesGenerated](self, "autoSendFeaturesGenerated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CAMSchemaCAMClientEvent deleteAutoSendFeaturesGenerated](self, "deleteAutoSendFeaturesGenerated");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[CAMSchemaCAMClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 3)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5628F60[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 3)
    return 0;
  else
    return off_1E5628F80[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[CAMSchemaCAMClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 3)
    return CFSTR("com.apple.aiml.siri.cam.CAMClientEvent");
  else
    return off_1E562B960[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[CAMSchemaCAMClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setRequestReceived:(id)a3
{
  CAMSchemaCAMRequestReceived *v4;
  CAMSchemaCAMModelExecuted *modelExecuted;
  CAMSchemaCAMResponseGenerated *responseGenerated;
  CAMSchemaCAMAutoSendFeaturesGenerated *autoSendFeaturesGenerated;
  unint64_t v8;
  CAMSchemaCAMRequestReceived *requestReceived;

  v4 = (CAMSchemaCAMRequestReceived *)a3;
  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = 0;

  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = 0;

  v8 = 101;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  requestReceived = self->_requestReceived;
  self->_requestReceived = v4;

}

- (CAMSchemaCAMRequestReceived)requestReceived
{
  if (self->_whichEvent_Type == 101)
    return self->_requestReceived;
  else
    return (CAMSchemaCAMRequestReceived *)0;
}

- (void)deleteRequestReceived
{
  CAMSchemaCAMRequestReceived *requestReceived;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    requestReceived = self->_requestReceived;
    self->_requestReceived = 0;

  }
}

- (void)setModelExecuted:(id)a3
{
  CAMSchemaCAMModelExecuted *v4;
  CAMSchemaCAMRequestReceived *requestReceived;
  CAMSchemaCAMResponseGenerated *responseGenerated;
  CAMSchemaCAMAutoSendFeaturesGenerated *autoSendFeaturesGenerated;
  unint64_t v8;
  CAMSchemaCAMModelExecuted *modelExecuted;

  v4 = (CAMSchemaCAMModelExecuted *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = 0;

  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = 0;

  v8 = 102;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = v4;

}

- (CAMSchemaCAMModelExecuted)modelExecuted
{
  if (self->_whichEvent_Type == 102)
    return self->_modelExecuted;
  else
    return (CAMSchemaCAMModelExecuted *)0;
}

- (void)deleteModelExecuted
{
  CAMSchemaCAMModelExecuted *modelExecuted;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    modelExecuted = self->_modelExecuted;
    self->_modelExecuted = 0;

  }
}

- (void)setResponseGenerated:(id)a3
{
  CAMSchemaCAMResponseGenerated *v4;
  CAMSchemaCAMRequestReceived *requestReceived;
  CAMSchemaCAMModelExecuted *modelExecuted;
  CAMSchemaCAMAutoSendFeaturesGenerated *autoSendFeaturesGenerated;
  unint64_t v8;
  CAMSchemaCAMResponseGenerated *responseGenerated;

  v4 = (CAMSchemaCAMResponseGenerated *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = 0;

  v8 = 103;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = v4;

}

- (CAMSchemaCAMResponseGenerated)responseGenerated
{
  if (self->_whichEvent_Type == 103)
    return self->_responseGenerated;
  else
    return (CAMSchemaCAMResponseGenerated *)0;
}

- (void)deleteResponseGenerated
{
  CAMSchemaCAMResponseGenerated *responseGenerated;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    responseGenerated = self->_responseGenerated;
    self->_responseGenerated = 0;

  }
}

- (void)setAutoSendFeaturesGenerated:(id)a3
{
  CAMSchemaCAMAutoSendFeaturesGenerated *v4;
  CAMSchemaCAMRequestReceived *requestReceived;
  CAMSchemaCAMModelExecuted *modelExecuted;
  CAMSchemaCAMResponseGenerated *responseGenerated;
  unint64_t v8;
  CAMSchemaCAMAutoSendFeaturesGenerated *autoSendFeaturesGenerated;

  v4 = (CAMSchemaCAMAutoSendFeaturesGenerated *)a3;
  requestReceived = self->_requestReceived;
  self->_requestReceived = 0;

  modelExecuted = self->_modelExecuted;
  self->_modelExecuted = 0;

  responseGenerated = self->_responseGenerated;
  self->_responseGenerated = 0;

  v8 = 104;
  if (!v4)
    v8 = 0;
  self->_whichEvent_Type = v8;
  autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
  self->_autoSendFeaturesGenerated = v4;

}

- (CAMSchemaCAMAutoSendFeaturesGenerated)autoSendFeaturesGenerated
{
  if (self->_whichEvent_Type == 104)
    return self->_autoSendFeaturesGenerated;
  else
    return (CAMSchemaCAMAutoSendFeaturesGenerated *)0;
}

- (void)deleteAutoSendFeaturesGenerated
{
  CAMSchemaCAMAutoSendFeaturesGenerated *autoSendFeaturesGenerated;

  if (self->_whichEvent_Type == 104)
  {
    self->_whichEvent_Type = 0;
    autoSendFeaturesGenerated = self->_autoSendFeaturesGenerated;
    self->_autoSendFeaturesGenerated = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMClientEventReadFrom(self, (uint64_t)a3);
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
  id v14;

  v14 = a3;
  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMClientEvent requestReceived](self, "requestReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAMSchemaCAMClientEvent requestReceived](self, "requestReceived");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMClientEvent modelExecuted](self, "modelExecuted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAMSchemaCAMClientEvent modelExecuted](self, "modelExecuted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMClientEvent responseGenerated](self, "responseGenerated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CAMSchemaCAMClientEvent responseGenerated](self, "responseGenerated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CAMSchemaCAMClientEvent autoSendFeaturesGenerated](self, "autoSendFeaturesGenerated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CAMSchemaCAMClientEvent autoSendFeaturesGenerated](self, "autoSendFeaturesGenerated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_28;
  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[CAMSchemaCAMClientEvent requestReceived](self, "requestReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestReceived");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAMSchemaCAMClientEvent requestReceived](self, "requestReceived");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CAMSchemaCAMClientEvent requestReceived](self, "requestReceived");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestReceived");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[CAMSchemaCAMClientEvent modelExecuted](self, "modelExecuted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelExecuted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAMSchemaCAMClientEvent modelExecuted](self, "modelExecuted");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CAMSchemaCAMClientEvent modelExecuted](self, "modelExecuted");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelExecuted");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[CAMSchemaCAMClientEvent responseGenerated](self, "responseGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CAMSchemaCAMClientEvent responseGenerated](self, "responseGenerated");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[CAMSchemaCAMClientEvent responseGenerated](self, "responseGenerated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseGenerated");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[CAMSchemaCAMClientEvent autoSendFeaturesGenerated](self, "autoSendFeaturesGenerated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoSendFeaturesGenerated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CAMSchemaCAMClientEvent autoSendFeaturesGenerated](self, "autoSendFeaturesGenerated");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[CAMSchemaCAMClientEvent autoSendFeaturesGenerated](self, "autoSendFeaturesGenerated");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autoSendFeaturesGenerated");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[CAMSchemaCAMClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[CAMSchemaCAMRequestReceived hash](self->_requestReceived, "hash") ^ v3;
  v5 = -[CAMSchemaCAMModelExecuted hash](self->_modelExecuted, "hash");
  v6 = v4 ^ v5 ^ -[CAMSchemaCAMResponseGenerated hash](self->_responseGenerated, "hash");
  return v6 ^ -[CAMSchemaCAMAutoSendFeaturesGenerated hash](self->_autoSendFeaturesGenerated, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_autoSendFeaturesGenerated)
  {
    -[CAMSchemaCAMClientEvent autoSendFeaturesGenerated](self, "autoSendFeaturesGenerated");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("autoSendFeaturesGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("autoSendFeaturesGenerated"));

    }
  }
  if (self->_eventMetadata)
  {
    -[CAMSchemaCAMClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_modelExecuted)
  {
    -[CAMSchemaCAMClientEvent modelExecuted](self, "modelExecuted");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("modelExecuted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("modelExecuted"));

    }
  }
  if (self->_requestReceived)
  {
    -[CAMSchemaCAMClientEvent requestReceived](self, "requestReceived");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("requestReceived"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("requestReceived"));

    }
  }
  if (self->_responseGenerated)
  {
    -[CAMSchemaCAMClientEvent responseGenerated](self, "responseGenerated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("responseGenerated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("responseGenerated"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAMSchemaCAMClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAMSchemaCAMClientEvent)initWithJSON:(id)a3
{
  void *v4;
  CAMSchemaCAMClientEvent *v5;
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
    self = -[CAMSchemaCAMClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAMSchemaCAMClientEvent)initWithDictionary:(id)a3
{
  id v4;
  CAMSchemaCAMClientEvent *v5;
  void *v6;
  CAMSchemaCAMClientEventMetadata *v7;
  void *v8;
  CAMSchemaCAMRequestReceived *v9;
  void *v10;
  CAMSchemaCAMModelExecuted *v11;
  void *v12;
  CAMSchemaCAMResponseGenerated *v13;
  void *v14;
  CAMSchemaCAMAutoSendFeaturesGenerated *v15;
  CAMSchemaCAMClientEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAMSchemaCAMClientEvent;
  v5 = -[CAMSchemaCAMClientEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CAMSchemaCAMClientEventMetadata initWithDictionary:]([CAMSchemaCAMClientEventMetadata alloc], "initWithDictionary:", v6);
      -[CAMSchemaCAMClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestReceived"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CAMSchemaCAMRequestReceived initWithDictionary:]([CAMSchemaCAMRequestReceived alloc], "initWithDictionary:", v8);
      -[CAMSchemaCAMClientEvent setRequestReceived:](v5, "setRequestReceived:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelExecuted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CAMSchemaCAMModelExecuted initWithDictionary:]([CAMSchemaCAMModelExecuted alloc], "initWithDictionary:", v10);
      -[CAMSchemaCAMClientEvent setModelExecuted:](v5, "setModelExecuted:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseGenerated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CAMSchemaCAMResponseGenerated initWithDictionary:]([CAMSchemaCAMResponseGenerated alloc], "initWithDictionary:", v12);
      -[CAMSchemaCAMClientEvent setResponseGenerated:](v5, "setResponseGenerated:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoSendFeaturesGenerated"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[CAMSchemaCAMAutoSendFeaturesGenerated initWithDictionary:]([CAMSchemaCAMAutoSendFeaturesGenerated alloc], "initWithDictionary:", v14);
      -[CAMSchemaCAMClientEvent setAutoSendFeaturesGenerated:](v5, "setAutoSendFeaturesGenerated:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (CAMSchemaCAMClientEventMetadata)eventMetadata
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

- (BOOL)hasRequestReceived
{
  return self->_hasRequestReceived;
}

- (void)setHasRequestReceived:(BOOL)a3
{
  self->_hasRequestReceived = a3;
}

- (BOOL)hasModelExecuted
{
  return self->_hasModelExecuted;
}

- (void)setHasModelExecuted:(BOOL)a3
{
  self->_hasModelExecuted = a3;
}

- (BOOL)hasResponseGenerated
{
  return self->_hasResponseGenerated;
}

- (void)setHasResponseGenerated:(BOOL)a3
{
  self->_hasResponseGenerated = a3;
}

- (BOOL)hasAutoSendFeaturesGenerated
{
  return self->_hasAutoSendFeaturesGenerated;
}

- (void)setHasAutoSendFeaturesGenerated:(BOOL)a3
{
  self->_hasAutoSendFeaturesGenerated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSendFeaturesGenerated, 0);
  objc_storeStrong((id *)&self->_responseGenerated, 0);
  objc_storeStrong((id *)&self->_modelExecuted, 0);
  objc_storeStrong((id *)&self->_requestReceived, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 14;
}

@end
