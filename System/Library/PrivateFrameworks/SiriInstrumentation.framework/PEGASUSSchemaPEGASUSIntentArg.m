@implementation PEGASUSSchemaPEGASUSIntentArg

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
  v9.super_class = (Class)PEGASUSSchemaPEGASUSIntentArg;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSIntentArg entity](self, "entity", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PEGASUSSchemaPEGASUSIntentArg deleteEntity](self, "deleteEntity");
  return v5;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)deleteKey
{
  -[PEGASUSSchemaPEGASUSIntentArg setKey:](self, "setKey:", 0);
}

- (BOOL)hasAttributeType
{
  return self->_attributeType != 0;
}

- (void)deleteAttributeType
{
  -[PEGASUSSchemaPEGASUSIntentArg setAttributeType:](self, "setAttributeType:", 0);
}

- (BOOL)hasEntity
{
  return self->_entity != 0;
}

- (void)deleteEntity
{
  -[PEGASUSSchemaPEGASUSIntentArg setEntity:](self, "setEntity:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSIntentArgReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PEGASUSSchemaPEGASUSIntentArg key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSIntentArg attributeType](self, "attributeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSIntentArg entity](self, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PEGASUSSchemaPEGASUSIntentArg entity](self, "entity");
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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[PEGASUSSchemaPEGASUSIntentArg key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSIntentArg key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSIntentArg key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSIntentArg attributeType](self, "attributeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSIntentArg attributeType](self, "attributeType");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSIntentArg attributeType](self, "attributeType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributeType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSIntentArg entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSIntentArg entity](self, "entity");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSIntentArg entity](self, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_attributeType, "hash") ^ v3;
  return v4 ^ -[PEGASUSSchemaPEGASUSEntityInfo hash](self->_entity, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_attributeType)
  {
    -[PEGASUSSchemaPEGASUSIntentArg attributeType](self, "attributeType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("attributeType"));

  }
  if (self->_entity)
  {
    -[PEGASUSSchemaPEGASUSIntentArg entity](self, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entity"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entity"));

    }
  }
  if (self->_key)
  {
    -[PEGASUSSchemaPEGASUSIntentArg key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("key"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSIntentArg dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSIntentArg)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSIntentArg *v5;
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
    self = -[PEGASUSSchemaPEGASUSIntentArg initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSIntentArg)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSIntentArg *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PEGASUSSchemaPEGASUSEntityInfo *v11;
  PEGASUSSchemaPEGASUSIntentArg *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSIntentArg;
  v5 = -[PEGASUSSchemaPEGASUSIntentArg init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSIntentArg setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSIntentArg setAttributeType:](v5, "setAttributeType:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PEGASUSSchemaPEGASUSEntityInfo initWithDictionary:]([PEGASUSSchemaPEGASUSEntityInfo alloc], "initWithDictionary:", v10);
      -[PEGASUSSchemaPEGASUSIntentArg setEntity:](v5, "setEntity:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)attributeType
{
  return self->_attributeType;
}

- (void)setAttributeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PEGASUSSchemaPEGASUSEntityInfo)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (void)setHasKey:(BOOL)a3
{
  self->_hasKey = a3;
}

- (void)setHasAttributeType:(BOOL)a3
{
  self->_hasAttributeType = a3;
}

- (void)setHasEntity:(BOOL)a3
{
  self->_hasEntity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_attributeType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
