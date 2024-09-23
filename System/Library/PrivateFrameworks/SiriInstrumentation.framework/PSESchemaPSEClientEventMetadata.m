@implementation PSESchemaPSEClientEventMetadata

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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSESchemaPSEClientEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSESchemaPSEClientEventMetadata uiSessionId](self, "uiSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PSESchemaPSEClientEventMetadata deleteUiSessionId](self, "deleteUiSessionId");
  -[PSESchemaPSEClientEventMetadata originalLastRequestId](self, "originalLastRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PSESchemaPSEClientEventMetadata deleteOriginalLastRequestId](self, "deleteOriginalLastRequestId");
  -[PSESchemaPSEClientEventMetadata taskId](self, "taskId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PSESchemaPSEClientEventMetadata deleteTaskId](self, "deleteTaskId");
  -[PSESchemaPSEClientEventMetadata pseId](self, "pseId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PSESchemaPSEClientEventMetadata deletePseId](self, "deletePseId");

  return v5;
}

- (BOOL)hasUiSessionId
{
  return self->_uiSessionId != 0;
}

- (void)deleteUiSessionId
{
  -[PSESchemaPSEClientEventMetadata setUiSessionId:](self, "setUiSessionId:", 0);
}

- (BOOL)hasOriginalLastRequestId
{
  return self->_originalLastRequestId != 0;
}

- (void)deleteOriginalLastRequestId
{
  -[PSESchemaPSEClientEventMetadata setOriginalLastRequestId:](self, "setOriginalLastRequestId:", 0);
}

- (void)setSiriEngagementTaskSuccess:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_siriEngagementTaskSuccess = a3;
}

- (BOOL)hasSiriEngagementTaskSuccess
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSiriEngagementTaskSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSiriEngagementTaskSuccess
{
  -[PSESchemaPSEClientEventMetadata setSiriEngagementTaskSuccess:](self, "setSiriEngagementTaskSuccess:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

- (void)deleteTaskId
{
  -[PSESchemaPSEClientEventMetadata setTaskId:](self, "setTaskId:", 0);
}

- (BOOL)hasPseId
{
  return self->_pseId != 0;
}

- (void)deletePseId
{
  -[PSESchemaPSEClientEventMetadata setPseId:](self, "setPseId:", 0);
}

- (void)setTriggerOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_triggerOrigin = a3;
}

- (BOOL)hasTriggerOrigin
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTriggerOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTriggerOrigin
{
  -[PSESchemaPSEClientEventMetadata setTriggerOrigin:](self, "setTriggerOrigin:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEClientEventMetadataReadFrom(self, (uint64_t)a3);
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
  id v12;

  v12 = a3;
  -[PSESchemaPSEClientEventMetadata uiSessionId](self, "uiSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSESchemaPSEClientEventMetadata uiSessionId](self, "uiSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEventMetadata originalLastRequestId](self, "originalLastRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PSESchemaPSEClientEventMetadata originalLastRequestId](self, "originalLastRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PSESchemaPSEClientEventMetadata taskId](self, "taskId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PSESchemaPSEClientEventMetadata taskId](self, "taskId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSEClientEventMetadata pseId](self, "pseId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PSESchemaPSEClientEventMetadata pseId](self, "pseId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int siriEngagementTaskSuccess;
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
  BOOL v28;
  int v30;
  int triggerOrigin;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[PSESchemaPSEClientEventMetadata uiSessionId](self, "uiSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[PSESchemaPSEClientEventMetadata uiSessionId](self, "uiSessionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PSESchemaPSEClientEventMetadata uiSessionId](self, "uiSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_25;
  }
  else
  {

  }
  -[PSESchemaPSEClientEventMetadata originalLastRequestId](self, "originalLastRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalLastRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[PSESchemaPSEClientEventMetadata originalLastRequestId](self, "originalLastRequestId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PSESchemaPSEClientEventMetadata originalLastRequestId](self, "originalLastRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalLastRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_25;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[52] & 1))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    siriEngagementTaskSuccess = self->_siriEngagementTaskSuccess;
    if (siriEngagementTaskSuccess != objc_msgSend(v4, "siriEngagementTaskSuccess"))
      goto LABEL_25;
  }
  -[PSESchemaPSEClientEventMetadata taskId](self, "taskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[PSESchemaPSEClientEventMetadata taskId](self, "taskId");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PSESchemaPSEClientEventMetadata taskId](self, "taskId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_25;
  }
  else
  {

  }
  -[PSESchemaPSEClientEventMetadata pseId](self, "pseId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pseId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_24:

    goto LABEL_25;
  }
  -[PSESchemaPSEClientEventMetadata pseId](self, "pseId");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PSESchemaPSEClientEventMetadata pseId](self, "pseId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pseId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_25;
  }
  else
  {

  }
  v30 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v30 == ((v4[52] >> 1) & 1))
  {
    if (!v30
      || (triggerOrigin = self->_triggerOrigin, triggerOrigin == objc_msgSend(v4, "triggerOrigin")))
    {
      v28 = 1;
      goto LABEL_26;
    }
  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[SISchemaUUID hash](self->_uiSessionId, "hash");
  v4 = -[SISchemaUUID hash](self->_originalLastRequestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_siriEngagementTaskSuccess;
  else
    v5 = 0;
  v6 = -[SISchemaUUID hash](self->_taskId, "hash");
  v7 = -[SISchemaUUID hash](self->_pseId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_triggerOrigin;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_originalLastRequestId)
  {
    -[PSESchemaPSEClientEventMetadata originalLastRequestId](self, "originalLastRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("originalLastRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("originalLastRequestId"));

    }
  }
  if (self->_pseId)
  {
    -[PSESchemaPSEClientEventMetadata pseId](self, "pseId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("pseId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pseId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = -[PSESchemaPSEClientEventMetadata siriEngagementTaskSuccess](self, "siriEngagementTaskSuccess") - 1;
    if (v10 > 3)
      v11 = CFSTR("PSESIRIENGAGEMENTTASKSUCCESS_UNKNOWN");
    else
      v11 = off_1E5638DE8[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("siriEngagementTaskSuccess"));
  }
  if (self->_taskId)
  {
    -[PSESchemaPSEClientEventMetadata taskId](self, "taskId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("taskId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("taskId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v15 = -[PSESchemaPSEClientEventMetadata triggerOrigin](self, "triggerOrigin") - 1;
    if (v15 > 2)
      v16 = CFSTR("PSETRIGGERORIGIN_UNKNOWN");
    else
      v16 = off_1E5638E08[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("triggerOrigin"));
  }
  if (self->_uiSessionId)
  {
    -[PSESchemaPSEClientEventMetadata uiSessionId](self, "uiSessionId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("uiSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("uiSessionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEClientEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEClientEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEClientEventMetadata *v5;
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
    self = -[PSESchemaPSEClientEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEClientEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEClientEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  void *v13;
  SISchemaUUID *v14;
  void *v15;
  PSESchemaPSEClientEventMetadata *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSESchemaPSEClientEventMetadata;
  v5 = -[PSESchemaPSEClientEventMetadata init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uiSessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PSESchemaPSEClientEventMetadata setUiSessionId:](v5, "setUiSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalLastRequestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[PSESchemaPSEClientEventMetadata setOriginalLastRequestId:](v5, "setOriginalLastRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriEngagementTaskSuccess"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEClientEventMetadata setSiriEngagementTaskSuccess:](v5, "setSiriEngagementTaskSuccess:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[PSESchemaPSEClientEventMetadata setTaskId:](v5, "setTaskId:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pseId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v13);
      -[PSESchemaPSEClientEventMetadata setPseId:](v5, "setPseId:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerOrigin"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PSESchemaPSEClientEventMetadata setTriggerOrigin:](v5, "setTriggerOrigin:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (SISchemaUUID)uiSessionId
{
  return self->_uiSessionId;
}

- (void)setUiSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_uiSessionId, a3);
}

- (SISchemaUUID)originalLastRequestId
{
  return self->_originalLastRequestId;
}

- (void)setOriginalLastRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_originalLastRequestId, a3);
}

- (int)siriEngagementTaskSuccess
{
  return self->_siriEngagementTaskSuccess;
}

- (SISchemaUUID)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (SISchemaUUID)pseId
{
  return self->_pseId;
}

- (void)setPseId:(id)a3
{
  objc_storeStrong((id *)&self->_pseId, a3);
}

- (int)triggerOrigin
{
  return self->_triggerOrigin;
}

- (void)setHasUiSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasOriginalLastRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTaskId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasPseId:(BOOL)a3
{
  self->_hasUiSessionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseId, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_originalLastRequestId, 0);
  objc_storeStrong((id *)&self->_uiSessionId, 0);
}

@end
