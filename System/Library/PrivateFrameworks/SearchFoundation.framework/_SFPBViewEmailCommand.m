@implementation _SFPBViewEmailCommand

- (_SFPBViewEmailCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBViewEmailCommand *v5;
  _SFPBViewEmailCommand *v6;

  v4 = a3;
  v5 = -[_SFPBViewEmailCommand init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasPlaceHolderProperty"))
      -[_SFPBViewEmailCommand setPlaceHolderProperty:](v5, "setPlaceHolderProperty:", objc_msgSend(v4, "placeHolderProperty"));
    v6 = v5;
  }

  return v5;
}

- (void)setPlaceHolderProperty:(BOOL)a3
{
  self->_placeHolderProperty = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBViewEmailCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBViewEmailCommand placeHolderProperty](self, "placeHolderProperty"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int placeHolderProperty;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    placeHolderProperty = self->_placeHolderProperty;
    v6 = placeHolderProperty == objc_msgSend(v4, "placeHolderProperty");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  if (self->_placeHolderProperty)
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
  if (self->_placeHolderProperty)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBViewEmailCommand placeHolderProperty](self, "placeHolderProperty"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("placeHolderProperty"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBViewEmailCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBViewEmailCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBViewEmailCommand *v5;
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
    self = -[_SFPBViewEmailCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBViewEmailCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBViewEmailCommand *v5;
  void *v6;
  _SFPBViewEmailCommand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBViewEmailCommand;
  v5 = -[_SFPBViewEmailCommand init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placeHolderProperty"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBViewEmailCommand setPlaceHolderProperty:](v5, "setPlaceHolderProperty:", objc_msgSend(v6, "BOOLValue"));
    v7 = v5;

  }
  return v5;
}

- (BOOL)placeHolderProperty
{
  return self->_placeHolderProperty;
}

@end
