@implementation IFTSchemaIFTInterpretedStatementResult

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
  v19.super_class = (Class)IFTSchemaIFTInterpretedStatementResult;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[IFTSchemaIFTInterpretedStatementResult deleteToolId](self, "deleteToolId");
  -[IFTSchemaIFTInterpretedStatementResult outcome](self, "outcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTInterpretedStatementResult deleteOutcome](self, "deleteOutcome");
  -[IFTSchemaIFTInterpretedStatementResult resultStatementId](self, "resultStatementId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTInterpretedStatementResult deleteResultStatementId](self, "deleteResultStatementId");
  -[IFTSchemaIFTInterpretedStatementResult originProgramStatementId](self, "originProgramStatementId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTInterpretedStatementResult deleteOriginProgramStatementId](self, "deleteOriginProgramStatementId");
  -[IFTSchemaIFTInterpretedStatementResult actionEventId](self, "actionEventId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTInterpretedStatementResult deleteActionEventId](self, "deleteActionEventId");

  return v5;
}

- (BOOL)hasOutcome
{
  return self->_outcome != 0;
}

- (void)deleteOutcome
{
  -[IFTSchemaIFTInterpretedStatementResult setOutcome:](self, "setOutcome:", 0);
}

- (BOOL)hasResultStatementId
{
  return self->_resultStatementId != 0;
}

- (void)deleteResultStatementId
{
  -[IFTSchemaIFTInterpretedStatementResult setResultStatementId:](self, "setResultStatementId:", 0);
}

- (BOOL)hasOriginProgramStatementId
{
  return self->_originProgramStatementId != 0;
}

- (void)deleteOriginProgramStatementId
{
  -[IFTSchemaIFTInterpretedStatementResult setOriginProgramStatementId:](self, "setOriginProgramStatementId:", 0);
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteToolId
{
  -[IFTSchemaIFTInterpretedStatementResult setToolId:](self, "setToolId:", 0);
}

- (BOOL)hasActionEventId
{
  return self->_actionEventId != 0;
}

- (void)deleteActionEventId
{
  -[IFTSchemaIFTInterpretedStatementResult setActionEventId:](self, "setActionEventId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTInterpretedStatementResultReadFrom(self, (uint64_t)a3);
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
  id v13;

  v13 = a3;
  -[IFTSchemaIFTInterpretedStatementResult outcome](self, "outcome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTInterpretedStatementResult outcome](self, "outcome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTInterpretedStatementResult resultStatementId](self, "resultStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTInterpretedStatementResult resultStatementId](self, "resultStatementId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTInterpretedStatementResult originProgramStatementId](self, "originProgramStatementId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTInterpretedStatementResult originProgramStatementId](self, "originProgramStatementId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTInterpretedStatementResult toolId](self, "toolId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[IFTSchemaIFTInterpretedStatementResult actionEventId](self, "actionEventId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IFTSchemaIFTInterpretedStatementResult actionEventId](self, "actionEventId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[IFTSchemaIFTInterpretedStatementResult outcome](self, "outcome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[IFTSchemaIFTInterpretedStatementResult outcome](self, "outcome");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTInterpretedStatementResult outcome](self, "outcome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outcome");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[IFTSchemaIFTInterpretedStatementResult resultStatementId](self, "resultStatementId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[IFTSchemaIFTInterpretedStatementResult resultStatementId](self, "resultStatementId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[IFTSchemaIFTInterpretedStatementResult resultStatementId](self, "resultStatementId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultStatementId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[IFTSchemaIFTInterpretedStatementResult originProgramStatementId](self, "originProgramStatementId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originProgramStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[IFTSchemaIFTInterpretedStatementResult originProgramStatementId](self, "originProgramStatementId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[IFTSchemaIFTInterpretedStatementResult originProgramStatementId](self, "originProgramStatementId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originProgramStatementId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[IFTSchemaIFTInterpretedStatementResult toolId](self, "toolId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[IFTSchemaIFTInterpretedStatementResult toolId](self, "toolId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[IFTSchemaIFTInterpretedStatementResult toolId](self, "toolId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[IFTSchemaIFTInterpretedStatementResult actionEventId](self, "actionEventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFTSchemaIFTInterpretedStatementResult actionEventId](self, "actionEventId");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[IFTSchemaIFTInterpretedStatementResult actionEventId](self, "actionEventId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionEventId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;

  v3 = -[IFTSchemaIFTStatementOutcome hash](self->_outcome, "hash");
  v4 = -[IFTSchemaIFTStatementId hash](self->_resultStatementId, "hash") ^ v3;
  v5 = -[IFTSchemaIFTStatementId hash](self->_originProgramStatementId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_toolId, "hash");
  return v6 ^ -[SISchemaUUID hash](self->_actionEventId, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionEventId)
  {
    -[IFTSchemaIFTInterpretedStatementResult actionEventId](self, "actionEventId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionEventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionEventId"));

    }
  }
  if (self->_originProgramStatementId)
  {
    -[IFTSchemaIFTInterpretedStatementResult originProgramStatementId](self, "originProgramStatementId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originProgramStatementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originProgramStatementId"));

    }
  }
  if (self->_outcome)
  {
    -[IFTSchemaIFTInterpretedStatementResult outcome](self, "outcome");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("outcome"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("outcome"));

    }
  }
  if (self->_resultStatementId)
  {
    -[IFTSchemaIFTInterpretedStatementResult resultStatementId](self, "resultStatementId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("resultStatementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("resultStatementId"));

    }
  }
  if (self->_toolId)
  {
    -[IFTSchemaIFTInterpretedStatementResult toolId](self, "toolId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("toolId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTInterpretedStatementResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTInterpretedStatementResult)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTInterpretedStatementResult *v5;
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
    self = -[IFTSchemaIFTInterpretedStatementResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTInterpretedStatementResult)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTInterpretedStatementResult *v5;
  void *v6;
  IFTSchemaIFTStatementOutcome *v7;
  void *v8;
  IFTSchemaIFTStatementId *v9;
  void *v10;
  IFTSchemaIFTStatementId *v11;
  void *v12;
  void *v13;
  void *v14;
  SISchemaUUID *v15;
  IFTSchemaIFTInterpretedStatementResult *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IFTSchemaIFTInterpretedStatementResult;
  v5 = -[IFTSchemaIFTInterpretedStatementResult init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outcome"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTStatementOutcome initWithDictionary:]([IFTSchemaIFTStatementOutcome alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTInterpretedStatementResult setOutcome:](v5, "setOutcome:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultStatementId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTInterpretedStatementResult setResultStatementId:](v5, "setResultStatementId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originProgramStatementId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTInterpretedStatementResult setOriginProgramStatementId:](v5, "setOriginProgramStatementId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[IFTSchemaIFTInterpretedStatementResult setToolId:](v5, "setToolId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionEventId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[IFTSchemaIFTInterpretedStatementResult setActionEventId:](v5, "setActionEventId:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (IFTSchemaIFTStatementOutcome)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_outcome, a3);
}

- (IFTSchemaIFTStatementId)resultStatementId
{
  return self->_resultStatementId;
}

- (void)setResultStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_resultStatementId, a3);
}

- (IFTSchemaIFTStatementId)originProgramStatementId
{
  return self->_originProgramStatementId;
}

- (void)setOriginProgramStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_originProgramStatementId, a3);
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setToolId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SISchemaUUID)actionEventId
{
  return self->_actionEventId;
}

- (void)setActionEventId:(id)a3
{
  objc_storeStrong((id *)&self->_actionEventId, a3);
}

- (void)setHasOutcome:(BOOL)a3
{
  self->_hasOutcome = a3;
}

- (void)setHasResultStatementId:(BOOL)a3
{
  self->_hasResultStatementId = a3;
}

- (void)setHasOriginProgramStatementId:(BOOL)a3
{
  self->_hasOriginProgramStatementId = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  self->_hasToolId = a3;
}

- (void)setHasActionEventId:(BOOL)a3
{
  self->_hasActionEventId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionEventId, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_originProgramStatementId, 0);
  objc_storeStrong((id *)&self->_resultStatementId, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
}

@end
