@implementation IFTSchemaIFTTypedValue

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
  v13.super_class = (Class)IFTSchemaIFTTypedValue;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTTypedValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTTypedValue deleteValue](self, "deleteValue");
  -[IFTSchemaIFTTypedValue collection](self, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTTypedValue deleteCollection](self, "deleteCollection");

  return v5;
}

- (void)setValue:(id)a3
{
  IFTSchemaIFTValue *v4;
  IFTSchemaIFTCollectionValue *collection;
  IFTSchemaIFTValue *value;

  v4 = (IFTSchemaIFTValue *)a3;
  collection = self->_collection;
  self->_collection = 0;

  self->_whichOneof_Typedvalue = v4 != 0;
  value = self->_value;
  self->_value = v4;

}

- (IFTSchemaIFTValue)value
{
  if (self->_whichOneof_Typedvalue == 1)
    return self->_value;
  else
    return (IFTSchemaIFTValue *)0;
}

- (void)deleteValue
{
  IFTSchemaIFTValue *value;

  if (self->_whichOneof_Typedvalue == 1)
  {
    self->_whichOneof_Typedvalue = 0;
    value = self->_value;
    self->_value = 0;

  }
}

- (void)setCollection:(id)a3
{
  IFTSchemaIFTCollectionValue *v4;
  IFTSchemaIFTValue *value;
  IFTSchemaIFTCollectionValue *collection;

  v4 = (IFTSchemaIFTCollectionValue *)a3;
  value = self->_value;
  self->_value = 0;

  self->_whichOneof_Typedvalue = 2 * (v4 != 0);
  collection = self->_collection;
  self->_collection = v4;

}

- (IFTSchemaIFTCollectionValue)collection
{
  if (self->_whichOneof_Typedvalue == 2)
    return self->_collection;
  else
    return (IFTSchemaIFTCollectionValue *)0;
}

- (void)deleteCollection
{
  IFTSchemaIFTCollectionValue *collection;

  if (self->_whichOneof_Typedvalue == 2)
  {
    self->_whichOneof_Typedvalue = 0;
    collection = self->_collection;
    self->_collection = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTTypedValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IFTSchemaIFTTypedValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTTypedValue value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTTypedValue collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTTypedValue collection](self, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichOneof_Typedvalue;
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichOneof_Typedvalue = self->_whichOneof_Typedvalue;
  if (whichOneof_Typedvalue != objc_msgSend(v4, "whichOneof_Typedvalue"))
    goto LABEL_13;
  -[IFTSchemaIFTTypedValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[IFTSchemaIFTTypedValue value](self, "value");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTTypedValue value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[IFTSchemaIFTTypedValue collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTTypedValue collection](self, "collection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[IFTSchemaIFTTypedValue collection](self, "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[IFTSchemaIFTValue hash](self->_value, "hash");
  return -[IFTSchemaIFTCollectionValue hash](self->_collection, "hash") ^ v3;
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
  if (self->_collection)
  {
    -[IFTSchemaIFTTypedValue collection](self, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("collection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("collection"));

    }
  }
  if (self->_value)
  {
    -[IFTSchemaIFTTypedValue value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("value"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("value"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTTypedValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTTypedValue)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTTypedValue *v5;
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
    self = -[IFTSchemaIFTTypedValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTTypedValue)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTTypedValue *v5;
  void *v6;
  IFTSchemaIFTValue *v7;
  void *v8;
  IFTSchemaIFTCollectionValue *v9;
  IFTSchemaIFTTypedValue *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTTypedValue;
  v5 = -[IFTSchemaIFTTypedValue init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTValue initWithDictionary:]([IFTSchemaIFTValue alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTTypedValue setValue:](v5, "setValue:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("collection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTCollectionValue initWithDictionary:]([IFTSchemaIFTCollectionValue alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTTypedValue setCollection:](v5, "setCollection:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichOneof_Typedvalue
{
  return self->_whichOneof_Typedvalue;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (BOOL)hasCollection
{
  return self->_hasCollection;
}

- (void)setHasCollection:(BOOL)a3
{
  self->_hasCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
