@implementation ORCHSchemaORCHRequestStarted

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORCHSchemaORCHRequestStarted;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHRequestStarted orchestratorSessionId](self, "orchestratorSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHRequestStarted deleteOrchestratorSessionId](self, "deleteOrchestratorSessionId");
  -[ORCHSchemaORCHRequestStarted nlv3DeprecationFlags](self, "nlv3DeprecationFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHRequestStarted deleteNlv3DeprecationFlags](self, "deleteNlv3DeprecationFlags");

  return v5;
}

- (BOOL)hasOrchestratorSessionId
{
  return self->_orchestratorSessionId != 0;
}

- (void)deleteOrchestratorSessionId
{
  -[ORCHSchemaORCHRequestStarted setOrchestratorSessionId:](self, "setOrchestratorSessionId:", 0);
}

- (void)setRequestType:(int)a3
{
  *(&self->_isAssistantEngineRequest + 1) |= 1u;
  self->_requestType = a3;
}

- (BOOL)hasRequestType
{
  return *(&self->_isAssistantEngineRequest + 1);
}

- (void)setHasRequestType:(BOOL)a3
{
  *(&self->_isAssistantEngineRequest + 1) = *(&self->_isAssistantEngineRequest + 1) & 0xFE | a3;
}

- (void)deleteRequestType
{
  -[ORCHSchemaORCHRequestStarted setRequestType:](self, "setRequestType:", 0);
  *(&self->_isAssistantEngineRequest + 1) &= ~1u;
}

- (void)setSiriUODEnabled:(BOOL)a3
{
  *(&self->_isAssistantEngineRequest + 1) |= 2u;
  self->_siriUODEnabled = a3;
}

- (BOOL)hasSiriUODEnabled
{
  return (*((unsigned __int8 *)&self->_isAssistantEngineRequest + 1) >> 1) & 1;
}

- (void)setHasSiriUODEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_isAssistantEngineRequest + 1) = *(&self->_isAssistantEngineRequest + 1) & 0xFD | v3;
}

- (void)deleteSiriUODEnabled
{
  -[ORCHSchemaORCHRequestStarted setSiriUODEnabled:](self, "setSiriUODEnabled:", 0);
  *(&self->_isAssistantEngineRequest + 1) &= ~2u;
}

- (void)setSiriUODMode:(int)a3
{
  *(&self->_isAssistantEngineRequest + 1) |= 4u;
  self->_siriUODMode = a3;
}

- (BOOL)hasSiriUODMode
{
  return (*((unsigned __int8 *)&self->_isAssistantEngineRequest + 1) >> 2) & 1;
}

- (void)setHasSiriUODMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_isAssistantEngineRequest + 1) = *(&self->_isAssistantEngineRequest + 1) & 0xFB | v3;
}

- (void)deleteSiriUODMode
{
  -[ORCHSchemaORCHRequestStarted setSiriUODMode:](self, "setSiriUODMode:", 0);
  *(&self->_isAssistantEngineRequest + 1) &= ~4u;
}

- (void)setSiriAsrMode:(int)a3
{
  *(&self->_isAssistantEngineRequest + 1) |= 8u;
  self->_siriAsrMode = a3;
}

- (BOOL)hasSiriAsrMode
{
  return (*((unsigned __int8 *)&self->_isAssistantEngineRequest + 1) >> 3) & 1;
}

- (void)setHasSiriAsrMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(&self->_isAssistantEngineRequest + 1) = *(&self->_isAssistantEngineRequest + 1) & 0xF7 | v3;
}

- (void)deleteSiriAsrMode
{
  -[ORCHSchemaORCHRequestStarted setSiriAsrMode:](self, "setSiriAsrMode:", 0);
  *(&self->_isAssistantEngineRequest + 1) &= ~8u;
}

- (void)setSiriNlMode:(int)a3
{
  *(&self->_isAssistantEngineRequest + 1) |= 0x10u;
  self->_siriNlMode = a3;
}

- (BOOL)hasSiriNlMode
{
  return (*((unsigned __int8 *)&self->_isAssistantEngineRequest + 1) >> 4) & 1;
}

- (void)setHasSiriNlMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(&self->_isAssistantEngineRequest + 1) = *(&self->_isAssistantEngineRequest + 1) & 0xEF | v3;
}

- (void)deleteSiriNlMode
{
  -[ORCHSchemaORCHRequestStarted setSiriNlMode:](self, "setSiriNlMode:", 0);
  *(&self->_isAssistantEngineRequest + 1) &= ~0x10u;
}

- (BOOL)hasNlv3DeprecationFlags
{
  return self->_nlv3DeprecationFlags != 0;
}

- (void)deleteNlv3DeprecationFlags
{
  -[ORCHSchemaORCHRequestStarted setNlv3DeprecationFlags:](self, "setNlv3DeprecationFlags:", 0);
}

- (void)setIsAssistantEngineRequest:(BOOL)a3
{
  *(&self->_isAssistantEngineRequest + 1) |= 0x20u;
  self->_isAssistantEngineRequest = a3;
}

- (BOOL)hasIsAssistantEngineRequest
{
  return (*((unsigned __int8 *)&self->_isAssistantEngineRequest + 1) >> 5) & 1;
}

- (void)setHasIsAssistantEngineRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(&self->_isAssistantEngineRequest + 1) = *(&self->_isAssistantEngineRequest + 1) & 0xDF | v3;
}

- (void)deleteIsAssistantEngineRequest
{
  -[ORCHSchemaORCHRequestStarted setIsAssistantEngineRequest:](self, "setIsAssistantEngineRequest:", 0);
  *(&self->_isAssistantEngineRequest + 1) &= ~0x20u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ORCHSchemaORCHRequestStarted orchestratorSessionId](self, "orchestratorSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHRequestStarted orchestratorSessionId](self, "orchestratorSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v6 = *(&self->_isAssistantEngineRequest + 1);
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = *(&self->_isAssistantEngineRequest + 1);
    if ((v6 & 2) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(&self->_isAssistantEngineRequest + 1) & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v6 = *(&self->_isAssistantEngineRequest + 1);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  v6 = *(&self->_isAssistantEngineRequest + 1);
  if ((v6 & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  if ((*(&self->_isAssistantEngineRequest + 1) & 0x10) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:
  -[ORCHSchemaORCHRequestStarted nlv3DeprecationFlags](self, "nlv3DeprecationFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ORCHSchemaORCHRequestStarted nlv3DeprecationFlags](self, "nlv3DeprecationFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(&self->_isAssistantEngineRequest + 1) & 0x20) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int requestType;
  int v15;
  int siriUODEnabled;
  int v17;
  int siriUODMode;
  int v19;
  int siriAsrMode;
  int v21;
  int siriNlMode;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  BOOL v28;
  int v30;
  int isAssistantEngineRequest;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[ORCHSchemaORCHRequestStarted orchestratorSessionId](self, "orchestratorSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orchestratorSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[ORCHSchemaORCHRequestStarted orchestratorSessionId](self, "orchestratorSessionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ORCHSchemaORCHRequestStarted orchestratorSessionId](self, "orchestratorSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orchestratorSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  v12 = *((unsigned __int8 *)&self->_isAssistantEngineRequest + 1);
  v13 = v4[49];
  if ((v12 & 1) != (v13 & 1))
    goto LABEL_31;
  if ((v12 & 1) != 0)
  {
    requestType = self->_requestType;
    if (requestType != objc_msgSend(v4, "requestType"))
      goto LABEL_31;
    v12 = *((unsigned __int8 *)&self->_isAssistantEngineRequest + 1);
    v13 = v4[49];
  }
  v15 = (v12 >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_31;
  if (v15)
  {
    siriUODEnabled = self->_siriUODEnabled;
    if (siriUODEnabled != objc_msgSend(v4, "siriUODEnabled"))
      goto LABEL_31;
    v12 = *((unsigned __int8 *)&self->_isAssistantEngineRequest + 1);
    v13 = v4[49];
  }
  v17 = (v12 >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_31;
  if (v17)
  {
    siriUODMode = self->_siriUODMode;
    if (siriUODMode != objc_msgSend(v4, "siriUODMode"))
      goto LABEL_31;
    v12 = *((unsigned __int8 *)&self->_isAssistantEngineRequest + 1);
    v13 = v4[49];
  }
  v19 = (v12 >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_31;
  if (v19)
  {
    siriAsrMode = self->_siriAsrMode;
    if (siriAsrMode != objc_msgSend(v4, "siriAsrMode"))
      goto LABEL_31;
    v12 = *((unsigned __int8 *)&self->_isAssistantEngineRequest + 1);
    v13 = v4[49];
  }
  v21 = (v12 >> 4) & 1;
  if (v21 != ((v13 >> 4) & 1))
    goto LABEL_31;
  if (v21)
  {
    siriNlMode = self->_siriNlMode;
    if (siriNlMode != objc_msgSend(v4, "siriNlMode"))
      goto LABEL_31;
  }
  -[ORCHSchemaORCHRequestStarted nlv3DeprecationFlags](self, "nlv3DeprecationFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlv3DeprecationFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  -[ORCHSchemaORCHRequestStarted nlv3DeprecationFlags](self, "nlv3DeprecationFlags");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ORCHSchemaORCHRequestStarted nlv3DeprecationFlags](self, "nlv3DeprecationFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlv3DeprecationFlags");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_31;
  }
  else
  {

  }
  v30 = (*((unsigned __int8 *)&self->_isAssistantEngineRequest + 1) >> 5) & 1;
  if (v30 == ((v4[49] >> 5) & 1))
  {
    if (!v30
      || (isAssistantEngineRequest = self->_isAssistantEngineRequest,
          isAssistantEngineRequest == objc_msgSend(v4, "isAssistantEngineRequest")))
    {
      v28 = 1;
      goto LABEL_32;
    }
  }
LABEL_31:
  v28 = 0;
LABEL_32:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[SISchemaUUID hash](self->_orchestratorSessionId, "hash");
  if (*(&self->_isAssistantEngineRequest + 1))
  {
    v4 = 2654435761 * self->_requestType;
    if ((*(&self->_isAssistantEngineRequest + 1) & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_siriUODEnabled;
      if ((*(&self->_isAssistantEngineRequest + 1) & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(&self->_isAssistantEngineRequest + 1) & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(&self->_isAssistantEngineRequest + 1) & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_siriUODMode;
    if ((*(&self->_isAssistantEngineRequest + 1) & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(&self->_isAssistantEngineRequest + 1) & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((*(&self->_isAssistantEngineRequest + 1) & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_siriAsrMode;
  if ((*(&self->_isAssistantEngineRequest + 1) & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_siriNlMode;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = -[ORCHSchemaORCHNLClassicDeprecationFlags hash](self->_nlv3DeprecationFlags, "hash");
  if ((*(&self->_isAssistantEngineRequest + 1) & 0x20) != 0)
    v10 = 2654435761 * self->_isAssistantEngineRequest;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
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
  char v11;
  const __CFString *v12;
  unsigned int v14;
  const __CFString *v15;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(&self->_isAssistantEngineRequest + 1) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHRequestStarted isAssistantEngineRequest](self, "isAssistantEngineRequest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isAssistantEngineRequest"));

  }
  if (self->_nlv3DeprecationFlags)
  {
    -[ORCHSchemaORCHRequestStarted nlv3DeprecationFlags](self, "nlv3DeprecationFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("nlv3DeprecationFlags"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("nlv3DeprecationFlags"));

    }
  }
  if (self->_orchestratorSessionId)
  {
    -[ORCHSchemaORCHRequestStarted orchestratorSessionId](self, "orchestratorSessionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("orchestratorSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("orchestratorSessionId"));

    }
  }
  v11 = *(&self->_isAssistantEngineRequest + 1);
  if ((v11 & 1) != 0)
  {
    v14 = -[ORCHSchemaORCHRequestStarted requestType](self, "requestType") - 1;
    if (v14 > 5)
      v15 = CFSTR("ORCHREQUESTTYPE_UNKNOWN");
    else
      v15 = off_1E5632868[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("requestType"));
    v11 = *(&self->_isAssistantEngineRequest + 1);
    if ((v11 & 8) == 0)
    {
LABEL_15:
      if ((v11 & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_33;
    }
  }
  else if ((*(&self->_isAssistantEngineRequest + 1) & 8) == 0)
  {
    goto LABEL_15;
  }
  v16 = -[ORCHSchemaORCHRequestStarted siriAsrMode](self, "siriAsrMode");
  v17 = CFSTR("ORCHSIRIASRMODE_UNKNOWN");
  if (v16 == 1)
    v17 = CFSTR("ORCHSIRIASRMODE_SERVER");
  if (v16 == 2)
    v18 = CFSTR("ORCHSIRIASRMODE_DEVICE");
  else
    v18 = v17;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("siriAsrMode"));
  v11 = *(&self->_isAssistantEngineRequest + 1);
  if ((v11 & 0x10) == 0)
  {
LABEL_16:
    if ((v11 & 2) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_33:
  v19 = -[ORCHSchemaORCHRequestStarted siriNlMode](self, "siriNlMode");
  v20 = CFSTR("ORCHSIRINLMODE_UNKNOWN");
  if (v19 == 1)
    v20 = CFSTR("ORCHSIRINLMODE_NLV3_SERVER");
  if (v19 == 2)
    v21 = CFSTR("ORCHSIRINLMODE_NLX_DEVICE");
  else
    v21 = v20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("siriNlMode"));
  v11 = *(&self->_isAssistantEngineRequest + 1);
  if ((v11 & 2) == 0)
  {
LABEL_17:
    if ((v11 & 4) == 0)
      goto LABEL_22;
    goto LABEL_18;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHRequestStarted siriUODEnabled](self, "siriUODEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("siriUODEnabled"));

  if ((*(&self->_isAssistantEngineRequest + 1) & 4) == 0)
    goto LABEL_22;
LABEL_18:
  if (-[ORCHSchemaORCHRequestStarted siriUODMode](self, "siriUODMode") == 1)
    v12 = CFSTR("ORCHSIRIUNDERSTANDINGONDEVICEMODE_HYBRID_ASR_ON_SERVER_NL_ON_DEVICE");
  else
    v12 = CFSTR("ORCHSIRIUNDERSTANDINGONDEVICEMODE_FULL_UOD");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("siriUODMode"));
LABEL_22:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHRequestStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHRequestStarted)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHRequestStarted *v5;
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
    self = -[ORCHSchemaORCHRequestStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHRequestStarted)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHRequestStarted *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ORCHSchemaORCHNLClassicDeprecationFlags *v14;
  void *v15;
  ORCHSchemaORCHRequestStarted *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ORCHSchemaORCHRequestStarted;
  v5 = -[ORCHSchemaORCHRequestStarted init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orchestratorSessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHRequestStarted setOrchestratorSessionId:](v5, "setOrchestratorSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestStarted setRequestType:](v5, "setRequestType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriUODEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestStarted setSiriUODEnabled:](v5, "setSiriUODEnabled:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriUODMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestStarted setSiriUODMode:](v5, "setSiriUODMode:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriAsrMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestStarted setSiriAsrMode:](v5, "setSiriAsrMode:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriNlMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestStarted setSiriNlMode:](v5, "setSiriNlMode:", objc_msgSend(v12, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlv3DeprecationFlags"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[ORCHSchemaORCHNLClassicDeprecationFlags initWithDictionary:]([ORCHSchemaORCHNLClassicDeprecationFlags alloc], "initWithDictionary:", v13);
      -[ORCHSchemaORCHRequestStarted setNlv3DeprecationFlags:](v5, "setNlv3DeprecationFlags:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAssistantEngineRequest"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHRequestStarted setIsAssistantEngineRequest:](v5, "setIsAssistantEngineRequest:", objc_msgSend(v15, "BOOLValue"));
    v16 = v5;

  }
  return v5;
}

- (SISchemaUUID)orchestratorSessionId
{
  return self->_orchestratorSessionId;
}

- (void)setOrchestratorSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_orchestratorSessionId, a3);
}

- (int)requestType
{
  return self->_requestType;
}

- (BOOL)siriUODEnabled
{
  return self->_siriUODEnabled;
}

- (int)siriUODMode
{
  return self->_siriUODMode;
}

- (int)siriAsrMode
{
  return self->_siriAsrMode;
}

- (int)siriNlMode
{
  return self->_siriNlMode;
}

- (ORCHSchemaORCHNLClassicDeprecationFlags)nlv3DeprecationFlags
{
  return self->_nlv3DeprecationFlags;
}

- (void)setNlv3DeprecationFlags:(id)a3
{
  objc_storeStrong((id *)&self->_nlv3DeprecationFlags, a3);
}

- (BOOL)isAssistantEngineRequest
{
  return self->_isAssistantEngineRequest;
}

- (void)setHasOrchestratorSessionId:(BOOL)a3
{
  *(&self->_isAssistantEngineRequest + 2) = a3;
}

- (void)setHasNlv3DeprecationFlags:(BOOL)a3
{
  *(&self->_isAssistantEngineRequest + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nlv3DeprecationFlags, 0);
  objc_storeStrong((id *)&self->_orchestratorSessionId, 0);
}

@end
