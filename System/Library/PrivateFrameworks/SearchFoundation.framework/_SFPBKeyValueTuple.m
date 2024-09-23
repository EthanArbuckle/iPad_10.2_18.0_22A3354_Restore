@implementation _SFPBKeyValueTuple

- (_SFPBKeyValueTuple)initWithFacade:(id)a3
{
  id v4;
  _SFPBKeyValueTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBKeyValueTuple *v10;

  v4 = a3;
  v5 = -[_SFPBKeyValueTuple init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBKeyValueTuple setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBKeyValueTuple setValue:](v5, "setValue:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setKey:(id)a3
{
  NSString *v4;
  NSString *key;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  key = self->_key;
  self->_key = v4;

}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  value = self->_value;
  self->_value = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBKeyValueTupleReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBKeyValueTuple key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBKeyValueTuple value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

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
  -[_SFPBKeyValueTuple key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBKeyValueTuple key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBKeyValueTuple key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBKeyValueTuple value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBKeyValueTuple value](self, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBKeyValueTuple value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_key, "hash");
  return -[NSString hash](self->_value, "hash") ^ v3;
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
  if (self->_key)
  {
    -[_SFPBKeyValueTuple key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("key"));

  }
  if (self->_value)
  {
    -[_SFPBKeyValueTuple value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBKeyValueTuple dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBKeyValueTuple)initWithJSON:(id)a3
{
  void *v4;
  _SFPBKeyValueTuple *v5;
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
    self = -[_SFPBKeyValueTuple initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBKeyValueTuple)initWithDictionary:(id)a3
{
  id v4;
  _SFPBKeyValueTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBKeyValueTuple *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBKeyValueTuple;
  v5 = -[_SFPBKeyValueTuple init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBKeyValueTuple setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBKeyValueTuple setValue:](v5, "setValue:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
