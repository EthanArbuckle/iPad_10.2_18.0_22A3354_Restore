@implementation ORCHSchemaORCHNLRouterBridgeSubComponentContext

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
  v22.super_class = (Class)ORCHSchemaORCHNLRouterBridgeSubComponentContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext traceId](self, "traceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext deleteTraceId](self, "deleteTraceId");
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext startedOrChanged](self, "startedOrChanged");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext ended](self, "ended");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext deleteEnded](self, "deleteEnded");
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext failed](self, "failed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext deleteFailed](self, "deleteFailed");
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext trpId](self, "trpId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext deleteTrpId](self, "deleteTrpId");

  return v5;
}

- (BOOL)hasTraceId
{
  return self->_traceId != 0;
}

- (void)deleteTraceId
{
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext setTraceId:](self, "setTraceId:", 0);
}

- (void)setStartedOrChanged:(id)a3
{
  ORCHSchemaORCHNLRouterBridgeSubComponentStarted *v4;
  ORCHSchemaORCHNLRouterBridgeSubComponentEnded *ended;
  ORCHSchemaORCHNLRouterBridgeSubComponentFailed *failed;
  ORCHSchemaORCHNLRouterBridgeSubComponentStarted *startedOrChanged;

  v4 = (ORCHSchemaORCHNLRouterBridgeSubComponentStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (ORCHSchemaORCHNLRouterBridgeSubComponentStarted)startedOrChanged
{
  if (self->_whichContextevent == 2)
    return self->_startedOrChanged;
  else
    return (ORCHSchemaORCHNLRouterBridgeSubComponentStarted *)0;
}

- (void)deleteStartedOrChanged
{
  ORCHSchemaORCHNLRouterBridgeSubComponentStarted *startedOrChanged;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  ORCHSchemaORCHNLRouterBridgeSubComponentEnded *v4;
  ORCHSchemaORCHNLRouterBridgeSubComponentStarted *startedOrChanged;
  ORCHSchemaORCHNLRouterBridgeSubComponentFailed *failed;
  unint64_t v7;
  ORCHSchemaORCHNLRouterBridgeSubComponentEnded *ended;

  v4 = (ORCHSchemaORCHNLRouterBridgeSubComponentEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  ended = self->_ended;
  self->_ended = v4;

}

- (ORCHSchemaORCHNLRouterBridgeSubComponentEnded)ended
{
  if (self->_whichContextevent == 3)
    return self->_ended;
  else
    return (ORCHSchemaORCHNLRouterBridgeSubComponentEnded *)0;
}

- (void)deleteEnded
{
  ORCHSchemaORCHNLRouterBridgeSubComponentEnded *ended;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  ORCHSchemaORCHNLRouterBridgeSubComponentFailed *v4;
  ORCHSchemaORCHNLRouterBridgeSubComponentStarted *startedOrChanged;
  ORCHSchemaORCHNLRouterBridgeSubComponentEnded *ended;
  ORCHSchemaORCHNLRouterBridgeSubComponentFailed *failed;

  v4 = (ORCHSchemaORCHNLRouterBridgeSubComponentFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_whichContextevent = 4 * (v4 != 0);
  failed = self->_failed;
  self->_failed = v4;

}

- (ORCHSchemaORCHNLRouterBridgeSubComponentFailed)failed
{
  if (self->_whichContextevent == 4)
    return self->_failed;
  else
    return (ORCHSchemaORCHNLRouterBridgeSubComponentFailed *)0;
}

- (void)deleteFailed
{
  ORCHSchemaORCHNLRouterBridgeSubComponentFailed *failed;

  if (self->_whichContextevent == 4)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHNLRouterBridgeSubComponentContextReadFrom(self, (uint64_t)a3);
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
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext traceId](self, "traceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext traceId](self, "traceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext startedOrChanged](self, "startedOrChanged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext ended](self, "ended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext ended](self, "ended");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext failed](self, "failed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext failed](self, "failed");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext trpId](self, "trpId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext trpId](self, "trpId");
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
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext traceId](self, "traceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext traceId](self, "traceId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext traceId](self, "traceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext startedOrChanged](self, "startedOrChanged");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext startedOrChanged](self, "startedOrChanged");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext ended](self, "ended");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext ended](self, "ended");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext failed](self, "failed");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext failed](self, "failed");
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
  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext trpId](self, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext trpId](self, "trpId");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext trpId](self, "trpId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
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

  v3 = -[SISchemaUUID hash](self->_traceId, "hash");
  v4 = -[ORCHSchemaORCHNLRouterBridgeSubComponentStarted hash](self->_startedOrChanged, "hash") ^ v3;
  v5 = -[ORCHSchemaORCHNLRouterBridgeSubComponentEnded hash](self->_ended, "hash");
  v6 = v4 ^ v5 ^ -[ORCHSchemaORCHNLRouterBridgeSubComponentFailed hash](self->_failed, "hash");
  return v6 ^ -[SISchemaUUID hash](self->_trpId, "hash");
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
  if (self->_ended)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext ended](self, "ended");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ended"));

    }
  }
  if (self->_failed)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext failed](self, "failed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failed"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("startedOrChanged"));

    }
  }
  if (self->_traceId)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext traceId](self, "traceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("traceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("traceId"));

    }
  }
  if (self->_trpId)
  {
    -[ORCHSchemaORCHNLRouterBridgeSubComponentContext trpId](self, "trpId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("trpId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHNLRouterBridgeSubComponentContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHNLRouterBridgeSubComponentContext)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *v5;
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
    self = -[ORCHSchemaORCHNLRouterBridgeSubComponentContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHNLRouterBridgeSubComponentContext)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  ORCHSchemaORCHNLRouterBridgeSubComponentStarted *v9;
  void *v10;
  ORCHSchemaORCHNLRouterBridgeSubComponentEnded *v11;
  void *v12;
  ORCHSchemaORCHNLRouterBridgeSubComponentFailed *v13;
  void *v14;
  SISchemaUUID *v15;
  ORCHSchemaORCHNLRouterBridgeSubComponentContext *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ORCHSchemaORCHNLRouterBridgeSubComponentContext;
  v5 = -[ORCHSchemaORCHNLRouterBridgeSubComponentContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traceId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHNLRouterBridgeSubComponentContext setTraceId:](v5, "setTraceId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ORCHSchemaORCHNLRouterBridgeSubComponentStarted initWithDictionary:]([ORCHSchemaORCHNLRouterBridgeSubComponentStarted alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHNLRouterBridgeSubComponentContext setStartedOrChanged:](v5, "setStartedOrChanged:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ORCHSchemaORCHNLRouterBridgeSubComponentEnded initWithDictionary:]([ORCHSchemaORCHNLRouterBridgeSubComponentEnded alloc], "initWithDictionary:", v10);
      -[ORCHSchemaORCHNLRouterBridgeSubComponentContext setEnded:](v5, "setEnded:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ORCHSchemaORCHNLRouterBridgeSubComponentFailed initWithDictionary:]([ORCHSchemaORCHNLRouterBridgeSubComponentFailed alloc], "initWithDictionary:", v12);
      -[ORCHSchemaORCHNLRouterBridgeSubComponentContext setFailed:](v5, "setFailed:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[ORCHSchemaORCHNLRouterBridgeSubComponentContext setTrpId:](v5, "setTrpId:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)traceId
{
  return self->_traceId;
}

- (void)setTraceId:(id)a3
{
  objc_storeStrong((id *)&self->_traceId, a3);
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (void)setHasTraceId:(BOOL)a3
{
  self->_hasTraceId = a3;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_traceId, 0);
}

@end
