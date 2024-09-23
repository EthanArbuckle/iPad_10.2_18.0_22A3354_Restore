@implementation _SFPBRFTableSpacerColumnDefinition

- (_SFPBRFTableSpacerColumnDefinition)initWithFacade:(id)a3
{
  _SFPBRFTableSpacerColumnDefinition *v3;
  _SFPBRFTableSpacerColumnDefinition *v4;
  _SFPBRFTableSpacerColumnDefinition *v5;

  v3 = -[_SFPBRFTableSpacerColumnDefinition init](self, "init", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableSpacerColumnDefinitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTableSpacerColumnDefinition dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTableSpacerColumnDefinition)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTableSpacerColumnDefinition *v5;
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
    self = -[_SFPBRFTableSpacerColumnDefinition initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTableSpacerColumnDefinition)initWithDictionary:(id)a3
{
  _SFPBRFTableSpacerColumnDefinition *v3;
  _SFPBRFTableSpacerColumnDefinition *v4;
  _SFPBRFTableSpacerColumnDefinition *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFPBRFTableSpacerColumnDefinition;
  v3 = -[_SFPBRFTableSpacerColumnDefinition init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
