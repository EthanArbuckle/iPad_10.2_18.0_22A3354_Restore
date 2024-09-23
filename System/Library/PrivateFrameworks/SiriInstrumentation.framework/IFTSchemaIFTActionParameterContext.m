@implementation IFTSchemaIFTActionParameterContext

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTActionParameterContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[IFTSchemaIFTActionParameterContext deleteToolId](self, "deleteToolId");
  -[IFTSchemaIFTActionParameterContext statementId](self, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTActionParameterContext deleteStatementId](self, "deleteStatementId");

  return v5;
}

- (BOOL)hasStatementId
{
  return self->_statementId != 0;
}

- (void)deleteStatementId
{
  -[IFTSchemaIFTActionParameterContext setStatementId:](self, "setStatementId:", 0);
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteToolId
{
  -[IFTSchemaIFTActionParameterContext setToolId:](self, "setToolId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionParameterContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IFTSchemaIFTActionParameterContext statementId](self, "statementId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTActionParameterContext statementId](self, "statementId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTActionParameterContext toolId](self, "toolId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[IFTSchemaIFTActionParameterContext statementId](self, "statementId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[IFTSchemaIFTActionParameterContext statementId](self, "statementId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTActionParameterContext statementId](self, "statementId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statementId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[IFTSchemaIFTActionParameterContext toolId](self, "toolId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFTSchemaIFTActionParameterContext toolId](self, "toolId");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[IFTSchemaIFTActionParameterContext toolId](self, "toolId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[IFTSchemaIFTStatementId hash](self->_statementId, "hash");
  return -[NSString hash](self->_toolId, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_statementId)
  {
    -[IFTSchemaIFTActionParameterContext statementId](self, "statementId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("statementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("statementId"));

    }
  }
  if (self->_toolId)
  {
    -[IFTSchemaIFTActionParameterContext toolId](self, "toolId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("toolId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTActionParameterContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTActionParameterContext)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTActionParameterContext *v5;
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
    self = -[IFTSchemaIFTActionParameterContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTActionParameterContext)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTActionParameterContext *v5;
  void *v6;
  IFTSchemaIFTStatementId *v7;
  void *v8;
  void *v9;
  IFTSchemaIFTActionParameterContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTActionParameterContext;
  v5 = -[IFTSchemaIFTActionParameterContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statementId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTActionParameterContext setStatementId:](v5, "setStatementId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[IFTSchemaIFTActionParameterContext setToolId:](v5, "setToolId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (IFTSchemaIFTStatementId)statementId
{
  return self->_statementId;
}

- (void)setStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_statementId, a3);
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setToolId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasStatementId:(BOOL)a3
{
  self->_hasStatementId = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  self->_hasToolId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_statementId, 0);
}

@end
