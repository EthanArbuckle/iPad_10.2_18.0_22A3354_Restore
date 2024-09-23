@implementation IFTSchemaIFTValue

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
  v19.super_class = (Class)IFTSchemaIFTValue;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTValue primitive](self, "primitive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTValue deletePrimitive](self, "deletePrimitive");
  -[IFTSchemaIFTValue enumeration](self, "enumeration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTValue deleteEnumeration](self, "deleteEnumeration");
  -[IFTSchemaIFTValue entity](self, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTValue deleteEntity](self, "deleteEntity");
  -[IFTSchemaIFTValue query](self, "query");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTValue deleteQuery](self, "deleteQuery");

  return v5;
}

- (void)setPrimitive:(id)a3
{
  IFTSchemaIFTPrimitiveValue *v4;
  IFTSchemaIFTEnumerationValue *enumeration;
  IFTSchemaIFTEntityValue *entity;
  IFTSchemaIFTQueryValue *query;
  IFTSchemaIFTPrimitiveValue *primitive;

  v4 = (IFTSchemaIFTPrimitiveValue *)a3;
  enumeration = self->_enumeration;
  self->_enumeration = 0;

  entity = self->_entity;
  self->_entity = 0;

  query = self->_query;
  self->_query = 0;

  self->_whichOneof_Value = v4 != 0;
  primitive = self->_primitive;
  self->_primitive = v4;

}

- (IFTSchemaIFTPrimitiveValue)primitive
{
  if (self->_whichOneof_Value == 1)
    return self->_primitive;
  else
    return (IFTSchemaIFTPrimitiveValue *)0;
}

- (void)deletePrimitive
{
  IFTSchemaIFTPrimitiveValue *primitive;

  if (self->_whichOneof_Value == 1)
  {
    self->_whichOneof_Value = 0;
    primitive = self->_primitive;
    self->_primitive = 0;

  }
}

- (void)setEnumeration:(id)a3
{
  IFTSchemaIFTEnumerationValue *v4;
  IFTSchemaIFTPrimitiveValue *primitive;
  IFTSchemaIFTEntityValue *entity;
  IFTSchemaIFTQueryValue *query;
  IFTSchemaIFTEnumerationValue *enumeration;

  v4 = (IFTSchemaIFTEnumerationValue *)a3;
  primitive = self->_primitive;
  self->_primitive = 0;

  entity = self->_entity;
  self->_entity = 0;

  query = self->_query;
  self->_query = 0;

  self->_whichOneof_Value = 2 * (v4 != 0);
  enumeration = self->_enumeration;
  self->_enumeration = v4;

}

- (IFTSchemaIFTEnumerationValue)enumeration
{
  if (self->_whichOneof_Value == 2)
    return self->_enumeration;
  else
    return (IFTSchemaIFTEnumerationValue *)0;
}

- (void)deleteEnumeration
{
  IFTSchemaIFTEnumerationValue *enumeration;

  if (self->_whichOneof_Value == 2)
  {
    self->_whichOneof_Value = 0;
    enumeration = self->_enumeration;
    self->_enumeration = 0;

  }
}

- (void)setEntity:(id)a3
{
  IFTSchemaIFTEntityValue *v4;
  IFTSchemaIFTPrimitiveValue *primitive;
  IFTSchemaIFTEnumerationValue *enumeration;
  IFTSchemaIFTQueryValue *query;
  unint64_t v8;
  IFTSchemaIFTEntityValue *entity;

  v4 = (IFTSchemaIFTEntityValue *)a3;
  primitive = self->_primitive;
  self->_primitive = 0;

  enumeration = self->_enumeration;
  self->_enumeration = 0;

  query = self->_query;
  self->_query = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichOneof_Value = v8;
  entity = self->_entity;
  self->_entity = v4;

}

- (IFTSchemaIFTEntityValue)entity
{
  if (self->_whichOneof_Value == 3)
    return self->_entity;
  else
    return (IFTSchemaIFTEntityValue *)0;
}

- (void)deleteEntity
{
  IFTSchemaIFTEntityValue *entity;

  if (self->_whichOneof_Value == 3)
  {
    self->_whichOneof_Value = 0;
    entity = self->_entity;
    self->_entity = 0;

  }
}

- (void)setQuery:(id)a3
{
  IFTSchemaIFTQueryValue *v4;
  IFTSchemaIFTPrimitiveValue *primitive;
  IFTSchemaIFTEnumerationValue *enumeration;
  IFTSchemaIFTEntityValue *entity;
  IFTSchemaIFTQueryValue *query;

  v4 = (IFTSchemaIFTQueryValue *)a3;
  primitive = self->_primitive;
  self->_primitive = 0;

  enumeration = self->_enumeration;
  self->_enumeration = 0;

  entity = self->_entity;
  self->_entity = 0;

  self->_whichOneof_Value = 4 * (v4 != 0);
  query = self->_query;
  self->_query = v4;

}

- (IFTSchemaIFTQueryValue)query
{
  if (self->_whichOneof_Value == 4)
    return self->_query;
  else
    return (IFTSchemaIFTQueryValue *)0;
}

- (void)deleteQuery
{
  IFTSchemaIFTQueryValue *query;

  if (self->_whichOneof_Value == 4)
  {
    self->_whichOneof_Value = 0;
    query = self->_query;
    self->_query = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTValueReadFrom(self, (uint64_t)a3);
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
  id v12;

  v12 = a3;
  -[IFTSchemaIFTValue primitive](self, "primitive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTValue primitive](self, "primitive");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTValue enumeration](self, "enumeration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTValue enumeration](self, "enumeration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTValue entity](self, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTValue entity](self, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTValue query](self, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IFTSchemaIFTValue query](self, "query");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Value;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichOneof_Value = self->_whichOneof_Value;
  if (whichOneof_Value != objc_msgSend(v4, "whichOneof_Value"))
    goto LABEL_23;
  -[IFTSchemaIFTValue primitive](self, "primitive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primitive");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[IFTSchemaIFTValue primitive](self, "primitive");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTValue primitive](self, "primitive");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primitive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[IFTSchemaIFTValue enumeration](self, "enumeration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[IFTSchemaIFTValue enumeration](self, "enumeration");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTValue enumeration](self, "enumeration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumeration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[IFTSchemaIFTValue entity](self, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[IFTSchemaIFTValue entity](self, "entity");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IFTSchemaIFTValue entity](self, "entity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[IFTSchemaIFTValue query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTValue query](self, "query");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[IFTSchemaIFTValue query](self, "query");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[IFTSchemaIFTPrimitiveValue hash](self->_primitive, "hash");
  v4 = -[IFTSchemaIFTEnumerationValue hash](self->_enumeration, "hash") ^ v3;
  v5 = -[IFTSchemaIFTEntityValue hash](self->_entity, "hash");
  return v4 ^ v5 ^ -[IFTSchemaIFTQueryValue hash](self->_query, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entity)
  {
    -[IFTSchemaIFTValue entity](self, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entity"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entity"));

    }
  }
  if (self->_enumeration)
  {
    -[IFTSchemaIFTValue enumeration](self, "enumeration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("enumeration"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("enumeration"));

    }
  }
  if (self->_primitive)
  {
    -[IFTSchemaIFTValue primitive](self, "primitive");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("primitive"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("primitive"));

    }
  }
  if (self->_query)
  {
    -[IFTSchemaIFTValue query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("query"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("query"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTValue)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTValue *v5;
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
    self = -[IFTSchemaIFTValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTValue)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTValue *v5;
  void *v6;
  IFTSchemaIFTPrimitiveValue *v7;
  void *v8;
  IFTSchemaIFTEnumerationValue *v9;
  void *v10;
  IFTSchemaIFTEntityValue *v11;
  void *v12;
  IFTSchemaIFTQueryValue *v13;
  IFTSchemaIFTValue *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTValue;
  v5 = -[IFTSchemaIFTValue init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primitive"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTPrimitiveValue initWithDictionary:]([IFTSchemaIFTPrimitiveValue alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTValue setPrimitive:](v5, "setPrimitive:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enumeration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTEnumerationValue initWithDictionary:]([IFTSchemaIFTEnumerationValue alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTValue setEnumeration:](v5, "setEnumeration:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFTSchemaIFTEntityValue initWithDictionary:]([IFTSchemaIFTEntityValue alloc], "initWithDictionary:", v10);
      -[IFTSchemaIFTValue setEntity:](v5, "setEntity:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("query"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[IFTSchemaIFTQueryValue initWithDictionary:]([IFTSchemaIFTQueryValue alloc], "initWithDictionary:", v12);
      -[IFTSchemaIFTValue setQuery:](v5, "setQuery:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Value
{
  return self->_whichOneof_Value;
}

- (BOOL)hasPrimitive
{
  return self->_hasPrimitive;
}

- (void)setHasPrimitive:(BOOL)a3
{
  self->_hasPrimitive = a3;
}

- (BOOL)hasEnumeration
{
  return self->_hasEnumeration;
}

- (void)setHasEnumeration:(BOOL)a3
{
  self->_hasEnumeration = a3;
}

- (BOOL)hasEntity
{
  return self->_hasEntity;
}

- (void)setHasEntity:(BOOL)a3
{
  self->_hasEntity = a3;
}

- (BOOL)hasQuery
{
  return self->_hasQuery;
}

- (void)setHasQuery:(BOOL)a3
{
  self->_hasQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_enumeration, 0);
  objc_storeStrong((id *)&self->_primitive, 0);
}

@end
