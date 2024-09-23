@implementation IFTSchemaIFTStatementResultPayload

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
  v13.super_class = (Class)IFTSchemaIFTStatementResultPayload;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTStatementResultPayload outcome](self, "outcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTStatementResultPayload deleteOutcome](self, "deleteOutcome");
  -[IFTSchemaIFTStatementResultPayload response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTStatementResultPayload deleteResponse](self, "deleteResponse");

  return v5;
}

- (BOOL)hasOutcome
{
  return self->_outcome != 0;
}

- (void)deleteOutcome
{
  -[IFTSchemaIFTStatementResultPayload setOutcome:](self, "setOutcome:", 0);
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (void)deleteResponse
{
  -[IFTSchemaIFTStatementResultPayload setResponse:](self, "setResponse:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTStatementResultPayloadReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IFTSchemaIFTStatementResultPayload outcome](self, "outcome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTStatementResultPayload outcome](self, "outcome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementResultPayload response](self, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTStatementResultPayload response](self, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[IFTSchemaIFTStatementResultPayload outcome](self, "outcome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[IFTSchemaIFTStatementResultPayload outcome](self, "outcome");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTStatementResultPayload outcome](self, "outcome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outcome");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementResultPayload response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFTSchemaIFTStatementResultPayload response](self, "response");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[IFTSchemaIFTStatementResultPayload response](self, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "response");
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

  v3 = -[IFTSchemaIFTStatementOutcome hash](self->_outcome, "hash");
  return -[IFTSchemaIFTResponseManifest hash](self->_response, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_outcome)
  {
    -[IFTSchemaIFTStatementResultPayload outcome](self, "outcome");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("outcome"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("outcome"));

    }
  }
  if (self->_response)
  {
    -[IFTSchemaIFTStatementResultPayload response](self, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("response"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("response"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTStatementResultPayload dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTStatementResultPayload)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTStatementResultPayload *v5;
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
    self = -[IFTSchemaIFTStatementResultPayload initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTStatementResultPayload)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTStatementResultPayload *v5;
  void *v6;
  IFTSchemaIFTStatementOutcome *v7;
  void *v8;
  IFTSchemaIFTResponseManifest *v9;
  IFTSchemaIFTStatementResultPayload *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTStatementResultPayload;
  v5 = -[IFTSchemaIFTStatementResultPayload init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outcome"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTStatementOutcome initWithDictionary:]([IFTSchemaIFTStatementOutcome alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTStatementResultPayload setOutcome:](v5, "setOutcome:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("response"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTResponseManifest initWithDictionary:]([IFTSchemaIFTResponseManifest alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTStatementResultPayload setResponse:](v5, "setResponse:", v9);

    }
    v10 = v5;

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

- (IFTSchemaIFTResponseManifest)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void)setHasOutcome:(BOOL)a3
{
  self->_hasOutcome = a3;
}

- (void)setHasResponse:(BOOL)a3
{
  self->_hasResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
}

@end
