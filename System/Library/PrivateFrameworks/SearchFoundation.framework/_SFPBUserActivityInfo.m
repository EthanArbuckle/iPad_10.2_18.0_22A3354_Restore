@implementation _SFPBUserActivityInfo

- (_SFPBUserActivityInfo)initWithFacade:(id)a3
{
  id v4;
  _SFPBUserActivityInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBURL *v11;
  void *v12;
  _SFPBURL *v13;
  _SFPBUserActivityInfo *v14;

  v4 = a3;
  v5 = -[_SFPBUserActivityInfo init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasValueType"))
      -[_SFPBUserActivityInfo setValueType:](v5, "setValueType:", objc_msgSend(v4, "valueType"));
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserActivityInfo setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserActivityInfo setStringValue:](v5, "setStringValue:", v9);

    }
    objc_msgSend(v4, "urlValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBURL alloc];
      objc_msgSend(v4, "urlValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBURL initWithNSURL:](v11, "initWithNSURL:", v12);
      -[_SFPBUserActivityInfo setUrlValue:](v5, "setUrlValue:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setValueType:(int)a3
{
  self->_valueType = a3;
}

- (void)setKey:(id)a3
{
  NSString *v4;
  NSString *key;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  key = self->_key;
  self->_key = v4;

}

- (void)setStringValue:(id)a3
{
  NSString *v4;
  NSString *stringValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (void)setUrlValue:(id)a3
{
  objc_storeStrong((id *)&self->_urlValue, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBUserActivityInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_SFPBUserActivityInfo valueType](self, "valueType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBUserActivityInfo key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBUserActivityInfo stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBUserActivityInfo urlValue](self, "urlValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int valueType;
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
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  valueType = self->_valueType;
  if (valueType != objc_msgSend(v4, "valueType"))
    goto LABEL_18;
  -[_SFPBUserActivityInfo key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_SFPBUserActivityInfo key](self, "key");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBUserActivityInfo key](self, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBUserActivityInfo stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_SFPBUserActivityInfo stringValue](self, "stringValue");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBUserActivityInfo stringValue](self, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBUserActivityInfo urlValue](self, "urlValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_SFPBUserActivityInfo urlValue](self, "urlValue");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[_SFPBUserActivityInfo urlValue](self, "urlValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = 2654435761 * self->_valueType;
  v4 = -[NSString hash](self->_key, "hash");
  v5 = v4 ^ -[NSString hash](self->_stringValue, "hash");
  return v5 ^ -[_SFPBURL hash](self->_urlValue, "hash") ^ v3;
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
  uint64_t v11;
  __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_key)
  {
    -[_SFPBUserActivityInfo key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("key"));

  }
  if (self->_stringValue)
  {
    -[_SFPBUserActivityInfo stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("stringValue"));

  }
  if (self->_urlValue)
  {
    -[_SFPBUserActivityInfo urlValue](self, "urlValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("urlValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("urlValue"));

    }
  }
  if (self->_valueType)
  {
    v11 = -[_SFPBUserActivityInfo valueType](self, "valueType");
    if ((_DWORD)v11)
    {
      if ((_DWORD)v11 == 1)
      {
        v12 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("valueType"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBUserActivityInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBUserActivityInfo)initWithJSON:(id)a3
{
  void *v4;
  _SFPBUserActivityInfo *v5;
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
    self = -[_SFPBUserActivityInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBUserActivityInfo)initWithDictionary:(id)a3
{
  id v4;
  _SFPBUserActivityInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBURL *v12;
  _SFPBUserActivityInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBUserActivityInfo;
  v5 = -[_SFPBUserActivityInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBUserActivityInfo setValueType:](v5, "setValueType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[_SFPBUserActivityInfo setKey:](v5, "setKey:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stringValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[_SFPBUserActivityInfo setStringValue:](v5, "setStringValue:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urlValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v11);
      -[_SFPBUserActivityInfo setUrlValue:](v5, "setUrlValue:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (int)valueType
{
  return self->_valueType;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (_SFPBURL)urlValue
{
  return self->_urlValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
