@implementation SISchemaOpaqueClientEvent

- (id)getComponentId
{
  SISchemaOpaqueClientEvent *v2;
  void *v3;

  v2 = self;
  v3 = (void *)SISchemaOpaqueClientEvent.getComponentId()();

  return v3;
}

- (int)componentName
{
  SISchemaOpaqueClientEvent *v2;
  int v3;

  v2 = self;
  v3 = SISchemaOpaqueClientEvent.componentName.getter();

  return v3;
}

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 2);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 4);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 5);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 6);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 7);
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
  v9.super_class = (Class)SISchemaOpaqueClientEvent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaOpaqueClientEvent componentId](self, "componentId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaOpaqueClientEvent deleteComponentId](self, "deleteComponentId");
  return v5;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.aiml.common.OpaqueClientEvent");
}

- (BOOL)hasAnyEventPayload
{
  return self->_anyEventPayload != 0;
}

- (void)deleteAnyEventPayload
{
  -[SISchemaOpaqueClientEvent setAnyEventPayload:](self, "setAnyEventPayload:", 0);
}

- (BOOL)hasComponentId
{
  return self->_componentId != 0;
}

- (void)deleteComponentId
{
  -[SISchemaOpaqueClientEvent setComponentId:](self, "setComponentId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaOpaqueClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SISchemaOpaqueClientEvent anyEventPayload](self, "anyEventPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[SISchemaOpaqueClientEvent componentId](self, "componentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaOpaqueClientEvent componentId](self, "componentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[SISchemaOpaqueClientEvent anyEventPayload](self, "anyEventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyEventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaOpaqueClientEvent anyEventPayload](self, "anyEventPayload");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaOpaqueClientEvent anyEventPayload](self, "anyEventPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyEventPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaOpaqueClientEvent componentId](self, "componentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaOpaqueClientEvent componentId](self, "componentId");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[SISchemaOpaqueClientEvent componentId](self, "componentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentId");
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
  uint64_t v3;

  v3 = -[NSData hash](self->_anyEventPayload, "hash");
  return -[SISchemaComponentIdentifier hash](self->_componentId, "hash") ^ v3;
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
  if (self->_anyEventPayload)
  {
    -[SISchemaOpaqueClientEvent anyEventPayload](self, "anyEventPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("anyEventPayload"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("anyEventPayload"));

    }
  }
  if (self->_componentId)
  {
    -[SISchemaOpaqueClientEvent componentId](self, "componentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("componentId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("componentId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaOpaqueClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaOpaqueClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SISchemaOpaqueClientEvent *v5;
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
    self = -[SISchemaOpaqueClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaOpaqueClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SISchemaOpaqueClientEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaComponentIdentifier *v9;
  SISchemaOpaqueClientEvent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaOpaqueClientEvent;
  v5 = -[SISchemaOpaqueClientEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anyEventPayload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
      -[SISchemaOpaqueClientEvent setAnyEventPayload:](v5, "setAnyEventPayload:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaComponentIdentifier initWithDictionary:]([SISchemaComponentIdentifier alloc], "initWithDictionary:", v8);
      -[SISchemaOpaqueClientEvent setComponentId:](v5, "setComponentId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSData)anyEventPayload
{
  return self->_anyEventPayload;
}

- (void)setAnyEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaComponentIdentifier)componentId
{
  return self->_componentId;
}

- (void)setComponentId:(id)a3
{
  objc_storeStrong((id *)&self->_componentId, a3);
}

- (void)setHasAnyEventPayload:(BOOL)a3
{
  self->_hasAnyEventPayload = a3;
}

- (void)setHasComponentId:(BOOL)a3
{
  self->_hasComponentId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentId, 0);
  objc_storeStrong((id *)&self->_anyEventPayload, 0);
}

- (int)getAnyEventType
{
  return 76;
}

@end
