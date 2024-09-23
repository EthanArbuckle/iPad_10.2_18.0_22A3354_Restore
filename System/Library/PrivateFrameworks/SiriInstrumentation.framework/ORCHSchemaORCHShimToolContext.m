@implementation ORCHSchemaORCHShimToolContext

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
  v22.super_class = (Class)ORCHSchemaORCHShimToolContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHShimToolContext clientTraceId](self, "clientTraceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHShimToolContext deleteClientTraceId](self, "deleteClientTraceId");
  -[ORCHSchemaORCHShimToolContext subRequestId](self, "subRequestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHShimToolContext deleteSubRequestId](self, "deleteSubRequestId");
  -[ORCHSchemaORCHShimToolContext startedOrChanged](self, "startedOrChanged");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ORCHSchemaORCHShimToolContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[ORCHSchemaORCHShimToolContext failed](self, "failed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ORCHSchemaORCHShimToolContext deleteFailed](self, "deleteFailed");
  -[ORCHSchemaORCHShimToolContext ended](self, "ended");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ORCHSchemaORCHShimToolContext deleteEnded](self, "deleteEnded");

  return v5;
}

- (BOOL)hasClientTraceId
{
  return self->_clientTraceId != 0;
}

- (void)deleteClientTraceId
{
  -[ORCHSchemaORCHShimToolContext setClientTraceId:](self, "setClientTraceId:", 0);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[ORCHSchemaORCHShimToolContext setSubRequestId:](self, "setSubRequestId:", 0);
}

- (void)setStartedOrChanged:(id)a3
{
  ORCHSchemaORCHShimToolStarted *v4;
  ORCHSchemaORCHShimToolFailed *failed;
  ORCHSchemaORCHShimToolEnded *ended;
  unint64_t v7;
  ORCHSchemaORCHShimToolStarted *startedOrChanged;

  v4 = (ORCHSchemaORCHShimToolStarted *)a3;
  failed = self->_failed;
  self->_failed = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (ORCHSchemaORCHShimToolStarted)startedOrChanged
{
  if (self->_whichContextevent == 101)
    return self->_startedOrChanged;
  else
    return (ORCHSchemaORCHShimToolStarted *)0;
}

- (void)deleteStartedOrChanged
{
  ORCHSchemaORCHShimToolStarted *startedOrChanged;

  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setFailed:(id)a3
{
  ORCHSchemaORCHShimToolFailed *v4;
  ORCHSchemaORCHShimToolStarted *startedOrChanged;
  ORCHSchemaORCHShimToolEnded *ended;
  unint64_t v7;
  ORCHSchemaORCHShimToolFailed *failed;

  v4 = (ORCHSchemaORCHShimToolFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  failed = self->_failed;
  self->_failed = v4;

}

- (ORCHSchemaORCHShimToolFailed)failed
{
  if (self->_whichContextevent == 102)
    return self->_failed;
  else
    return (ORCHSchemaORCHShimToolFailed *)0;
}

- (void)deleteFailed
{
  ORCHSchemaORCHShimToolFailed *failed;

  if (self->_whichContextevent == 102)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (void)setEnded:(id)a3
{
  ORCHSchemaORCHShimToolEnded *v4;
  ORCHSchemaORCHShimToolStarted *startedOrChanged;
  ORCHSchemaORCHShimToolFailed *failed;
  unint64_t v7;
  ORCHSchemaORCHShimToolEnded *ended;

  v4 = (ORCHSchemaORCHShimToolEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  ended = self->_ended;
  self->_ended = v4;

}

- (ORCHSchemaORCHShimToolEnded)ended
{
  if (self->_whichContextevent == 103)
    return self->_ended;
  else
    return (ORCHSchemaORCHShimToolEnded *)0;
}

- (void)deleteEnded
{
  ORCHSchemaORCHShimToolEnded *ended;

  if (self->_whichContextevent == 103)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHShimToolContextReadFrom(self, (uint64_t)a3);
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
  -[ORCHSchemaORCHShimToolContext clientTraceId](self, "clientTraceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHShimToolContext clientTraceId](self, "clientTraceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHShimToolContext subRequestId](self, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHShimToolContext subRequestId](self, "subRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHShimToolContext startedOrChanged](self, "startedOrChanged");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ORCHSchemaORCHShimToolContext startedOrChanged](self, "startedOrChanged");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHShimToolContext failed](self, "failed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ORCHSchemaORCHShimToolContext failed](self, "failed");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHShimToolContext ended](self, "ended");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ORCHSchemaORCHShimToolContext ended](self, "ended");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichContextevent;
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
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_28;
  -[ORCHSchemaORCHShimToolContext clientTraceId](self, "clientTraceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientTraceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHShimToolContext clientTraceId](self, "clientTraceId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHShimToolContext clientTraceId](self, "clientTraceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientTraceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[ORCHSchemaORCHShimToolContext subRequestId](self, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHShimToolContext subRequestId](self, "subRequestId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ORCHSchemaORCHShimToolContext subRequestId](self, "subRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[ORCHSchemaORCHShimToolContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHShimToolContext startedOrChanged](self, "startedOrChanged");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ORCHSchemaORCHShimToolContext startedOrChanged](self, "startedOrChanged");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[ORCHSchemaORCHShimToolContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHShimToolContext failed](self, "failed");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ORCHSchemaORCHShimToolContext failed](self, "failed");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[ORCHSchemaORCHShimToolContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ORCHSchemaORCHShimToolContext ended](self, "ended");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[ORCHSchemaORCHShimToolContext ended](self, "ended");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
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

  v3 = -[SISchemaUUID hash](self->_clientTraceId, "hash");
  v4 = -[SISchemaUUID hash](self->_subRequestId, "hash") ^ v3;
  v5 = -[ORCHSchemaORCHShimToolStarted hash](self->_startedOrChanged, "hash");
  v6 = v4 ^ v5 ^ -[ORCHSchemaORCHShimToolFailed hash](self->_failed, "hash");
  return v6 ^ -[ORCHSchemaORCHShimToolEnded hash](self->_ended, "hash");
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
  if (self->_clientTraceId)
  {
    -[ORCHSchemaORCHShimToolContext clientTraceId](self, "clientTraceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientTraceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientTraceId"));

    }
  }
  if (self->_ended)
  {
    -[ORCHSchemaORCHShimToolContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ended"));

    }
  }
  if (self->_failed)
  {
    -[ORCHSchemaORCHShimToolContext failed](self, "failed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("failed"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[ORCHSchemaORCHShimToolContext startedOrChanged](self, "startedOrChanged");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("startedOrChanged"));

    }
  }
  if (self->_subRequestId)
  {
    -[ORCHSchemaORCHShimToolContext subRequestId](self, "subRequestId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("subRequestId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHShimToolContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHShimToolContext)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHShimToolContext *v5;
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
    self = -[ORCHSchemaORCHShimToolContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHShimToolContext)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHShimToolContext *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  void *v10;
  ORCHSchemaORCHShimToolStarted *v11;
  void *v12;
  ORCHSchemaORCHShimToolFailed *v13;
  void *v14;
  ORCHSchemaORCHShimToolEnded *v15;
  ORCHSchemaORCHShimToolContext *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ORCHSchemaORCHShimToolContext;
  v5 = -[ORCHSchemaORCHShimToolContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientTraceId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHShimToolContext setClientTraceId:](v5, "setClientTraceId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHShimToolContext setSubRequestId:](v5, "setSubRequestId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ORCHSchemaORCHShimToolStarted initWithDictionary:]([ORCHSchemaORCHShimToolStarted alloc], "initWithDictionary:", v10);
      -[ORCHSchemaORCHShimToolContext setStartedOrChanged:](v5, "setStartedOrChanged:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ORCHSchemaORCHShimToolFailed initWithDictionary:]([ORCHSchemaORCHShimToolFailed alloc], "initWithDictionary:", v12);
      -[ORCHSchemaORCHShimToolContext setFailed:](v5, "setFailed:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[ORCHSchemaORCHShimToolEnded initWithDictionary:]([ORCHSchemaORCHShimToolEnded alloc], "initWithDictionary:", v14);
      -[ORCHSchemaORCHShimToolContext setEnded:](v5, "setEnded:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setClientTraceId:(id)a3
{
  objc_storeStrong((id *)&self->_clientTraceId, a3);
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
}

- (void)setHasClientTraceId:(BOOL)a3
{
  self->_hasClientTraceId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_clientTraceId, 0);
}

@end
