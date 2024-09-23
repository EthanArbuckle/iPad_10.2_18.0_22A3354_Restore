@implementation _SFPBRFOptionalBool

- (_SFPBRFOptionalBool)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFOptionalBool *v5;
  _SFPBRFOptionalBool *v6;

  v4 = a3;
  v5 = -[_SFPBRFOptionalBool init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasValue"))
      -[_SFPBRFOptionalBool setValue:](v5, "setValue:", objc_msgSend(v4, "value"));
    v6 = v5;
  }

  return v5;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFOptionalBoolReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBRFOptionalBool value](self, "value"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int value;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    value = self->_value;
    v6 = value == objc_msgSend(v4, "value");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  if (self->_value)
    return 2654435761;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_value)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFOptionalBool value](self, "value"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("value"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFOptionalBool dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFOptionalBool)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFOptionalBool *v5;
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
    self = -[_SFPBRFOptionalBool initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFOptionalBool)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFOptionalBool *v5;
  void *v6;
  _SFPBRFOptionalBool *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFOptionalBool;
  v5 = -[_SFPBRFOptionalBool init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFOptionalBool setValue:](v5, "setValue:", objc_msgSend(v6, "BOOLValue"));
    v7 = v5;

  }
  return v5;
}

- (BOOL)value
{
  return self->_value;
}

@end
