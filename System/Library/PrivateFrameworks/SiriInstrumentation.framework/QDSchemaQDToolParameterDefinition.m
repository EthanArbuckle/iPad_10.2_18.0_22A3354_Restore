@implementation QDSchemaQDToolParameterDefinition

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
  v9.super_class = (Class)QDSchemaQDToolParameterDefinition;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDToolParameterDefinition entityType](self, "entityType", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[QDSchemaQDToolParameterDefinition deleteEntityType](self, "deleteEntityType");
  return v5;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)deleteKey
{
  -[QDSchemaQDToolParameterDefinition setKey:](self, "setKey:", 0);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)deleteName
{
  -[QDSchemaQDToolParameterDefinition setName:](self, "setName:", 0);
}

- (BOOL)hasEntityType
{
  return self->_entityType != 0;
}

- (void)deleteEntityType
{
  -[QDSchemaQDToolParameterDefinition setEntityType:](self, "setEntityType:", 0);
}

- (BOOL)hasDescription
{
  return self->_description != 0;
}

- (void)deleteDescription
{
  -[QDSchemaQDToolParameterDefinition setDescription:](self, "setDescription:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDToolParameterDefinitionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[QDSchemaQDToolParameterDefinition key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[QDSchemaQDToolParameterDefinition name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[QDSchemaQDToolParameterDefinition entityType](self, "entityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QDSchemaQDToolParameterDefinition entityType](self, "entityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[QDSchemaQDToolParameterDefinition description](self, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
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
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[QDSchemaQDToolParameterDefinition key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[QDSchemaQDToolParameterDefinition key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[QDSchemaQDToolParameterDefinition key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[QDSchemaQDToolParameterDefinition name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[QDSchemaQDToolParameterDefinition name](self, "name");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[QDSchemaQDToolParameterDefinition name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[QDSchemaQDToolParameterDefinition entityType](self, "entityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[QDSchemaQDToolParameterDefinition entityType](self, "entityType");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[QDSchemaQDToolParameterDefinition entityType](self, "entityType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[QDSchemaQDToolParameterDefinition description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[QDSchemaQDToolParameterDefinition description](self, "description");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[QDSchemaQDToolParameterDefinition description](self, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[QDSchemaQDEntityType hash](self->_entityType, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_description, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_description)
  {
    -[QDSchemaQDToolParameterDefinition description](self, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("description"));

  }
  if (self->_entityType)
  {
    -[QDSchemaQDToolParameterDefinition entityType](self, "entityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityType"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entityType"));

    }
  }
  if (self->_key)
  {
    -[QDSchemaQDToolParameterDefinition key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("key"));

  }
  if (self->_name)
  {
    -[QDSchemaQDToolParameterDefinition name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("name"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDToolParameterDefinition dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDToolParameterDefinition)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDToolParameterDefinition *v5;
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
    self = -[QDSchemaQDToolParameterDefinition initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDToolParameterDefinition)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDToolParameterDefinition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  QDSchemaQDEntityType *v11;
  void *v12;
  void *v13;
  QDSchemaQDToolParameterDefinition *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)QDSchemaQDToolParameterDefinition;
  v5 = -[QDSchemaQDToolParameterDefinition init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[QDSchemaQDToolParameterDefinition setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[QDSchemaQDToolParameterDefinition setName:](v5, "setName:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[QDSchemaQDEntityType initWithDictionary:]([QDSchemaQDEntityType alloc], "initWithDictionary:", v10);
      -[QDSchemaQDToolParameterDefinition setEntityType:](v5, "setEntityType:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[QDSchemaQDToolParameterDefinition setDescription:](v5, "setDescription:", v13);

    }
    v14 = v5;

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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (QDSchemaQDEntityType)entityType
{
  return self->_entityType;
}

- (void)setEntityType:(id)a3
{
  objc_storeStrong((id *)&self->_entityType, a3);
}

- (NSString)description
{
  return self->_description;
}

- (void)setDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasKey:(BOOL)a3
{
  self->_hasKey = a3;
}

- (void)setHasName:(BOOL)a3
{
  self->_hasName = a3;
}

- (void)setHasEntityType:(BOOL)a3
{
  self->_hasEntityType = a3;
}

- (void)setHasDescription:(BOOL)a3
{
  self->_hasDescription = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
