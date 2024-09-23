@implementation _SFPBCommandReference

- (_SFPBCommandReference)initWithFacade:(id)a3
{
  id v4;
  _SFPBCommandReference *v5;
  void *v6;
  void *v7;
  _SFPBCommandReference *v8;

  v4 = a3;
  v5 = -[_SFPBCommandReference init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "referenceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "referenceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCommandReference setReferenceIdentifier:](v5, "setReferenceIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)setReferenceIdentifier:(id)a3
{
  NSString *v4;
  NSString *referenceIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  referenceIdentifier = self->_referenceIdentifier;
  self->_referenceIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCommandReferenceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBCommandReference referenceIdentifier](self, "referenceIdentifier");
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
    -[_SFPBCommandReference referenceIdentifier](self, "referenceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referenceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBCommandReference referenceIdentifier](self, "referenceIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBCommandReference referenceIdentifier](self, "referenceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "referenceIdentifier");
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
  return -[NSString hash](self->_referenceIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_referenceIdentifier)
  {
    -[_SFPBCommandReference referenceIdentifier](self, "referenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("referenceIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCommandReference dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCommandReference)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCommandReference *v5;
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
    self = -[_SFPBCommandReference initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCommandReference)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCommandReference *v5;
  void *v6;
  void *v7;
  _SFPBCommandReference *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBCommandReference;
  v5 = -[_SFPBCommandReference init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBCommandReference setReferenceIdentifier:](v5, "setReferenceIdentifier:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
}

@end
