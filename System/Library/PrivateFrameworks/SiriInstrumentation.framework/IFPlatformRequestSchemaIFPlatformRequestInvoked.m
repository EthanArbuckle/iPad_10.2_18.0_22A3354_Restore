@implementation IFPlatformRequestSchemaIFPlatformRequestInvoked

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
  v13.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestInvoked;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked ifSessionId](self, "ifSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked deleteIfSessionId](self, "deleteIfSessionId");
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked clientTraceId](self, "clientTraceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked deleteClientTraceId](self, "deleteClientTraceId");

  return v5;
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

- (void)deleteIfSessionId
{
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked setIfSessionId:](self, "setIfSessionId:", 0);
}

- (BOOL)hasClientTraceId
{
  return self->_clientTraceId != 0;
}

- (void)deleteClientTraceId
{
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked setClientTraceId:](self, "setClientTraceId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFPlatformRequestSchemaIFPlatformRequestInvokedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked ifSessionId](self, "ifSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked ifSessionId](self, "ifSessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked clientTraceId](self, "clientTraceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked clientTraceId](self, "clientTraceId");
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
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked ifSessionId](self, "ifSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked ifSessionId](self, "ifSessionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked ifSessionId](self, "ifSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[IFPlatformRequestSchemaIFPlatformRequestInvoked clientTraceId](self, "clientTraceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientTraceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked clientTraceId](self, "clientTraceId");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked clientTraceId](self, "clientTraceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientTraceId");
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

  v3 = -[SISchemaUUID hash](self->_ifSessionId, "hash");
  return -[SISchemaUUID hash](self->_clientTraceId, "hash") ^ v3;
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
  if (self->_clientTraceId)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked clientTraceId](self, "clientTraceId");
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
  if (self->_ifSessionId)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestInvoked ifSessionId](self, "ifSessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ifSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ifSessionId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFPlatformRequestSchemaIFPlatformRequestInvoked dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFPlatformRequestSchemaIFPlatformRequestInvoked)initWithJSON:(id)a3
{
  void *v4;
  IFPlatformRequestSchemaIFPlatformRequestInvoked *v5;
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
    self = -[IFPlatformRequestSchemaIFPlatformRequestInvoked initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFPlatformRequestSchemaIFPlatformRequestInvoked)initWithDictionary:(id)a3
{
  id v4;
  IFPlatformRequestSchemaIFPlatformRequestInvoked *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  SISchemaUUID *v9;
  IFPlatformRequestSchemaIFPlatformRequestInvoked *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestInvoked;
  v5 = -[IFPlatformRequestSchemaIFPlatformRequestInvoked init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifSessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[IFPlatformRequestSchemaIFPlatformRequestInvoked setIfSessionId:](v5, "setIfSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientTraceId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[IFPlatformRequestSchemaIFPlatformRequestInvoked setClientTraceId:](v5, "setClientTraceId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (void)setIfSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_ifSessionId, a3);
}

- (SISchemaUUID)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setClientTraceId:(id)a3
{
  objc_storeStrong((id *)&self->_clientTraceId, a3);
}

- (void)setHasIfSessionId:(BOOL)a3
{
  self->_hasIfSessionId = a3;
}

- (void)setHasClientTraceId:(BOOL)a3
{
  self->_hasClientTraceId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
}

@end
