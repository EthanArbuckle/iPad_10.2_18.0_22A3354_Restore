@implementation LCServiceConfigurationRequest

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceConfigurationRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LCServiceConfigurationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LCServiceConfigurationRequest)initWithJSON:(id)a3
{
  void *v4;
  LCServiceConfigurationRequest *v5;
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
    self = -[LCServiceConfigurationRequest initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LCServiceConfigurationRequest)initWithDictionary:(id)a3
{
  LCServiceConfigurationRequest *v3;
  LCServiceConfigurationRequest *v4;
  LCServiceConfigurationRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LCServiceConfigurationRequest;
  v3 = -[LCServiceConfigurationRequest init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
