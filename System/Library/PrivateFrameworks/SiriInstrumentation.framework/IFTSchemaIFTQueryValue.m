@implementation IFTSchemaIFTQueryValue

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
  v13.super_class = (Class)IFTSchemaIFTQueryValue;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTQueryValue typeIdentifier](self, "typeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTQueryValue deleteTypeIdentifier](self, "deleteTypeIdentifier");
  -[IFTSchemaIFTQueryValue query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTQueryValue deleteQuery](self, "deleteQuery");

  return v5;
}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

- (void)deleteTypeIdentifier
{
  -[IFTSchemaIFTQueryValue setTypeIdentifier:](self, "setTypeIdentifier:", 0);
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (void)deleteQuery
{
  -[IFTSchemaIFTQueryValue setQuery:](self, "setQuery:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTQueryValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IFTSchemaIFTQueryValue typeIdentifier](self, "typeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTQueryValue typeIdentifier](self, "typeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTQueryValue query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTQueryValue query](self, "query");
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
  -[IFTSchemaIFTQueryValue typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[IFTSchemaIFTQueryValue typeIdentifier](self, "typeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IFTSchemaIFTQueryValue typeIdentifier](self, "typeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[IFTSchemaIFTQueryValue query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IFTSchemaIFTQueryValue query](self, "query");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[IFTSchemaIFTQueryValue query](self, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
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

  v3 = -[IFTSchemaIFTTypeIdentifier hash](self->_typeIdentifier, "hash");
  return -[IFTSchemaIFTQuery hash](self->_query, "hash") ^ v3;
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
  if (self->_query)
  {
    -[IFTSchemaIFTQueryValue query](self, "query");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("query"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("query"));

    }
  }
  if (self->_typeIdentifier)
  {
    -[IFTSchemaIFTQueryValue typeIdentifier](self, "typeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("typeIdentifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("typeIdentifier"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTQueryValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTQueryValue)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTQueryValue *v5;
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
    self = -[IFTSchemaIFTQueryValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTQueryValue)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTQueryValue *v5;
  void *v6;
  IFTSchemaIFTTypeIdentifier *v7;
  void *v8;
  IFTSchemaIFTQuery *v9;
  IFTSchemaIFTQueryValue *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTQueryValue;
  v5 = -[IFTSchemaIFTQueryValue init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typeIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFTSchemaIFTTypeIdentifier initWithDictionary:]([IFTSchemaIFTTypeIdentifier alloc], "initWithDictionary:", v6);
      -[IFTSchemaIFTQueryValue setTypeIdentifier:](v5, "setTypeIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("query"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFTSchemaIFTQuery initWithDictionary:]([IFTSchemaIFTQuery alloc], "initWithDictionary:", v8);
      -[IFTSchemaIFTQueryValue setQuery:](v5, "setQuery:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (IFTSchemaIFTTypeIdentifier)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_typeIdentifier, a3);
}

- (IFTSchemaIFTQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)setHasTypeIdentifier:(BOOL)a3
{
  self->_hasTypeIdentifier = a3;
}

- (void)setHasQuery:(BOOL)a3
{
  self->_hasQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

@end
