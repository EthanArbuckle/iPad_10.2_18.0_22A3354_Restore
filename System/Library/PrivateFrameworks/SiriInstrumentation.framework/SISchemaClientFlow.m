@implementation SISchemaClientFlow

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasClientFlowPayload
{
  return self->_clientFlowPayload != 0;
}

- (void)deleteClientFlowPayload
{
  -[SISchemaClientFlow setClientFlowPayload:](self, "setClientFlowPayload:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaClientFlowReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SISchemaClientFlow clientFlowPayload](self, "clientFlowPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[SISchemaClientFlow clientFlowPayload](self, "clientFlowPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientFlowPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[SISchemaClientFlow clientFlowPayload](self, "clientFlowPayload");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[SISchemaClientFlow clientFlowPayload](self, "clientFlowPayload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientFlowPayload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_clientFlowPayload, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientFlowPayload)
  {
    -[SISchemaClientFlow clientFlowPayload](self, "clientFlowPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientFlowPayload"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaClientFlow dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaClientFlow)initWithJSON:(id)a3
{
  void *v4;
  SISchemaClientFlow *v5;
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
    self = -[SISchemaClientFlow initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaClientFlow)initWithDictionary:(id)a3
{
  id v4;
  SISchemaClientFlow *v5;
  void *v6;
  void *v7;
  SISchemaClientFlow *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SISchemaClientFlow;
  v5 = -[SISchemaClientFlow init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientFlowPayload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaClientFlow setClientFlowPayload:](v5, "setClientFlowPayload:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NSString)clientFlowPayload
{
  return self->_clientFlowPayload;
}

- (void)setClientFlowPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setHasClientFlowPayload:(BOOL)a3
{
  self->_hasClientFlowPayload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFlowPayload, 0);
}

@end
