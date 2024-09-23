@implementation SUTSchemaTestExecutionBegin

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUTSchemaTestExecutionBegin;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUTSchemaTestExecutionBegin context](self, "context", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SUTSchemaTestExecutionBegin deleteContext](self, "deleteContext");
  return v5;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (void)deleteContext
{
  -[SUTSchemaTestExecutionBegin setContext:](self, "setContext:", 0);
}

- (void)setShouldPersistData:(BOOL)a3
{
  *(&self->_shouldPersistData + 1) |= 1u;
  self->_shouldPersistData = a3;
}

- (BOOL)hasShouldPersistData
{
  return *(&self->_shouldPersistData + 1);
}

- (void)setHasShouldPersistData:(BOOL)a3
{
  *(&self->_shouldPersistData + 1) = *(&self->_shouldPersistData + 1) & 0xFE | a3;
}

- (void)deleteShouldPersistData
{
  -[SUTSchemaTestExecutionBegin setShouldPersistData:](self, "setShouldPersistData:", 0);
  *(&self->_shouldPersistData + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestExecutionBeginReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SUTSchemaTestExecutionBegin context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUTSchemaTestExecutionBegin context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (*(&self->_shouldPersistData + 1))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int shouldPersistData;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SUTSchemaTestExecutionBegin context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[SUTSchemaTestExecutionBegin context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUTSchemaTestExecutionBegin context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if (*(&self->_shouldPersistData + 1) != (v4[17] & 1))
    goto LABEL_12;
  if (*(&self->_shouldPersistData + 1))
  {
    shouldPersistData = self->_shouldPersistData;
    if (shouldPersistData != objc_msgSend(v4, "shouldPersistData"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[SUTSchemaTestContext hash](self->_context, "hash");
  if (*(&self->_shouldPersistData + 1))
    v4 = 2654435761 * self->_shouldPersistData;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_context)
  {
    -[SUTSchemaTestExecutionBegin context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("context"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("context"));

    }
  }
  if (*(&self->_shouldPersistData + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SUTSchemaTestExecutionBegin shouldPersistData](self, "shouldPersistData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("shouldPersistData"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUTSchemaTestExecutionBegin dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUTSchemaTestExecutionBegin)initWithJSON:(id)a3
{
  void *v4;
  SUTSchemaTestExecutionBegin *v5;
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
    self = -[SUTSchemaTestExecutionBegin initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUTSchemaTestExecutionBegin)initWithDictionary:(id)a3
{
  id v4;
  SUTSchemaTestExecutionBegin *v5;
  void *v6;
  SUTSchemaTestContext *v7;
  void *v8;
  SUTSchemaTestExecutionBegin *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUTSchemaTestExecutionBegin;
  v5 = -[SUTSchemaTestExecutionBegin init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SUTSchemaTestContext initWithDictionary:]([SUTSchemaTestContext alloc], "initWithDictionary:", v6);
      -[SUTSchemaTestExecutionBegin setContext:](v5, "setContext:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldPersistData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUTSchemaTestExecutionBegin setShouldPersistData:](v5, "setShouldPersistData:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (SUTSchemaTestContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)shouldPersistData
{
  return self->_shouldPersistData;
}

- (void)setHasContext:(BOOL)a3
{
  *(&self->_shouldPersistData + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
