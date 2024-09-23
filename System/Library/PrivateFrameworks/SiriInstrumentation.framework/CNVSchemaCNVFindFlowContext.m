@implementation CNVSchemaCNVFindFlowContext

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
  v19.super_class = (Class)CNVSchemaCNVFindFlowContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVSchemaCNVFindFlowContext contextId](self, "contextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CNVSchemaCNVFindFlowContext deleteContextId](self, "deleteContextId");
  -[CNVSchemaCNVFindFlowContext startedOrChanged](self, "startedOrChanged");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CNVSchemaCNVFindFlowContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[CNVSchemaCNVFindFlowContext ended](self, "ended");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CNVSchemaCNVFindFlowContext deleteEnded](self, "deleteEnded");
  -[CNVSchemaCNVFindFlowContext hypothesisId](self, "hypothesisId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CNVSchemaCNVFindFlowContext deleteHypothesisId](self, "deleteHypothesisId");

  return v5;
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteContextId
{
  -[CNVSchemaCNVFindFlowContext setContextId:](self, "setContextId:", 0);
}

- (void)setStartedOrChanged:(id)a3
{
  CNVSchemaCNVFindFlowStarted *v4;
  CNVSchemaCNVFindFlowEnded *ended;
  CNVSchemaCNVFindFlowStarted *startedOrChanged;

  v4 = (CNVSchemaCNVFindFlowStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (CNVSchemaCNVFindFlowStarted)startedOrChanged
{
  if (self->_whichContextevent == 2)
    return self->_startedOrChanged;
  else
    return (CNVSchemaCNVFindFlowStarted *)0;
}

- (void)deleteStartedOrChanged
{
  CNVSchemaCNVFindFlowStarted *startedOrChanged;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  CNVSchemaCNVFindFlowEnded *v4;
  CNVSchemaCNVFindFlowStarted *startedOrChanged;
  unint64_t v6;
  CNVSchemaCNVFindFlowEnded *ended;

  v4 = (CNVSchemaCNVFindFlowEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  self->_whichContextevent = v6;
  ended = self->_ended;
  self->_ended = v4;

}

- (CNVSchemaCNVFindFlowEnded)ended
{
  if (self->_whichContextevent == 3)
    return self->_ended;
  else
    return (CNVSchemaCNVFindFlowEnded *)0;
}

- (void)deleteEnded
{
  CNVSchemaCNVFindFlowEnded *ended;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (BOOL)hasHypothesisId
{
  return self->_hypothesisId != 0;
}

- (void)deleteHypothesisId
{
  -[CNVSchemaCNVFindFlowContext setHypothesisId:](self, "setHypothesisId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVFindFlowContextReadFrom(self, (uint64_t)a3);
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
  -[CNVSchemaCNVFindFlowContext contextId](self, "contextId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNVSchemaCNVFindFlowContext contextId](self, "contextId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVFindFlowContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNVSchemaCNVFindFlowContext startedOrChanged](self, "startedOrChanged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVFindFlowContext ended](self, "ended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNVSchemaCNVFindFlowContext ended](self, "ended");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVFindFlowContext hypothesisId](self, "hypothesisId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CNVSchemaCNVFindFlowContext hypothesisId](self, "hypothesisId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_23;
  -[CNVSchemaCNVFindFlowContext contextId](self, "contextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[CNVSchemaCNVFindFlowContext contextId](self, "contextId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CNVSchemaCNVFindFlowContext contextId](self, "contextId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[CNVSchemaCNVFindFlowContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[CNVSchemaCNVFindFlowContext startedOrChanged](self, "startedOrChanged");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CNVSchemaCNVFindFlowContext startedOrChanged](self, "startedOrChanged");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[CNVSchemaCNVFindFlowContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[CNVSchemaCNVFindFlowContext ended](self, "ended");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CNVSchemaCNVFindFlowContext ended](self, "ended");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[CNVSchemaCNVFindFlowContext hypothesisId](self, "hypothesisId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hypothesisId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CNVSchemaCNVFindFlowContext hypothesisId](self, "hypothesisId");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[CNVSchemaCNVFindFlowContext hypothesisId](self, "hypothesisId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hypothesisId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SISchemaUUID hash](self->_contextId, "hash");
  v4 = -[CNVSchemaCNVFindFlowStarted hash](self->_startedOrChanged, "hash") ^ v3;
  v5 = -[CNVSchemaCNVFindFlowEnded hash](self->_ended, "hash");
  return v4 ^ v5 ^ -[SISchemaUUID hash](self->_hypothesisId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contextId)
  {
    -[CNVSchemaCNVFindFlowContext contextId](self, "contextId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contextId"));

    }
  }
  if (self->_ended)
  {
    -[CNVSchemaCNVFindFlowContext ended](self, "ended");
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
  if (self->_hypothesisId)
  {
    -[CNVSchemaCNVFindFlowContext hypothesisId](self, "hypothesisId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hypothesisId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hypothesisId"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[CNVSchemaCNVFindFlowContext startedOrChanged](self, "startedOrChanged");
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
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVFindFlowContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVFindFlowContext)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVFindFlowContext *v5;
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
    self = -[CNVSchemaCNVFindFlowContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVFindFlowContext)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVFindFlowContext *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  CNVSchemaCNVFindFlowStarted *v9;
  void *v10;
  CNVSchemaCNVFindFlowEnded *v11;
  void *v12;
  SISchemaUUID *v13;
  CNVSchemaCNVFindFlowContext *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNVSchemaCNVFindFlowContext;
  v5 = -[CNVSchemaCNVFindFlowContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CNVSchemaCNVFindFlowContext setContextId:](v5, "setContextId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CNVSchemaCNVFindFlowStarted initWithDictionary:]([CNVSchemaCNVFindFlowStarted alloc], "initWithDictionary:", v8);
      -[CNVSchemaCNVFindFlowContext setStartedOrChanged:](v5, "setStartedOrChanged:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CNVSchemaCNVFindFlowEnded initWithDictionary:]([CNVSchemaCNVFindFlowEnded alloc], "initWithDictionary:", v10);
      -[CNVSchemaCNVFindFlowContext setEnded:](v5, "setEnded:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hypothesisId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[CNVSchemaCNVFindFlowContext setHypothesisId:](v5, "setHypothesisId:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
  objc_storeStrong((id *)&self->_contextId, a3);
}

- (SISchemaUUID)hypothesisId
{
  return self->_hypothesisId;
}

- (void)setHypothesisId:(id)a3
{
  objc_storeStrong((id *)&self->_hypothesisId, a3);
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
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

- (void)setHasHypothesisId:(BOOL)a3
{
  self->_hasHypothesisId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hypothesisId, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end
