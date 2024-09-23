@implementation ODDSiriSchemaODDtvOSAssistantProperties

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
  v13.super_class = (Class)ODDSiriSchemaODDtvOSAssistantProperties;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDtvOSAssistantProperties multiUserState](self, "multiUserState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDtvOSAssistantProperties deleteMultiUserState](self, "deleteMultiUserState");
  -[ODDSiriSchemaODDtvOSAssistantProperties homePodProperties](self, "homePodProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDtvOSAssistantProperties deleteHomePodProperties](self, "deleteHomePodProperties");

  return v5;
}

- (BOOL)hasMultiUserState
{
  return self->_multiUserState != 0;
}

- (void)deleteMultiUserState
{
  -[ODDSiriSchemaODDtvOSAssistantProperties setMultiUserState:](self, "setMultiUserState:", 0);
}

- (BOOL)hasHomePodProperties
{
  return self->_homePodProperties != 0;
}

- (void)deleteHomePodProperties
{
  -[ODDSiriSchemaODDtvOSAssistantProperties setHomePodProperties:](self, "setHomePodProperties:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDtvOSAssistantPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ODDSiriSchemaODDtvOSAssistantProperties multiUserState](self, "multiUserState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDtvOSAssistantProperties multiUserState](self, "multiUserState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDtvOSAssistantProperties homePodProperties](self, "homePodProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDtvOSAssistantProperties homePodProperties](self, "homePodProperties");
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
  -[ODDSiriSchemaODDtvOSAssistantProperties multiUserState](self, "multiUserState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiUserState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[ODDSiriSchemaODDtvOSAssistantProperties multiUserState](self, "multiUserState");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDtvOSAssistantProperties multiUserState](self, "multiUserState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiUserState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[ODDSiriSchemaODDtvOSAssistantProperties homePodProperties](self, "homePodProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homePodProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDtvOSAssistantProperties homePodProperties](self, "homePodProperties");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[ODDSiriSchemaODDtvOSAssistantProperties homePodProperties](self, "homePodProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homePodProperties");
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

  v3 = -[ODDSiriSchemaODDMultiUserState hash](self->_multiUserState, "hash");
  return -[ODDSiriSchemaODDHomePodProperties hash](self->_homePodProperties, "hash") ^ v3;
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
  if (self->_homePodProperties)
  {
    -[ODDSiriSchemaODDtvOSAssistantProperties homePodProperties](self, "homePodProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homePodProperties"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homePodProperties"));

    }
  }
  if (self->_multiUserState)
  {
    -[ODDSiriSchemaODDtvOSAssistantProperties multiUserState](self, "multiUserState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("multiUserState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("multiUserState"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDtvOSAssistantProperties dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDtvOSAssistantProperties)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDtvOSAssistantProperties *v5;
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
    self = -[ODDSiriSchemaODDtvOSAssistantProperties initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDtvOSAssistantProperties)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDtvOSAssistantProperties *v5;
  void *v6;
  ODDSiriSchemaODDMultiUserState *v7;
  void *v8;
  ODDSiriSchemaODDHomePodProperties *v9;
  ODDSiriSchemaODDtvOSAssistantProperties *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDtvOSAssistantProperties;
  v5 = -[ODDSiriSchemaODDtvOSAssistantProperties init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiUserState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDMultiUserState initWithDictionary:]([ODDSiriSchemaODDMultiUserState alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDtvOSAssistantProperties setMultiUserState:](v5, "setMultiUserState:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homePodProperties"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDHomePodProperties initWithDictionary:]([ODDSiriSchemaODDHomePodProperties alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDtvOSAssistantProperties setHomePodProperties:](v5, "setHomePodProperties:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDMultiUserState)multiUserState
{
  return self->_multiUserState;
}

- (void)setMultiUserState:(id)a3
{
  objc_storeStrong((id *)&self->_multiUserState, a3);
}

- (ODDSiriSchemaODDHomePodProperties)homePodProperties
{
  return self->_homePodProperties;
}

- (void)setHomePodProperties:(id)a3
{
  objc_storeStrong((id *)&self->_homePodProperties, a3);
}

- (void)setHasMultiUserState:(BOOL)a3
{
  self->_hasMultiUserState = a3;
}

- (void)setHasHomePodProperties:(BOOL)a3
{
  self->_hasHomePodProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePodProperties, 0);
  objc_storeStrong((id *)&self->_multiUserState, 0);
}

@end
