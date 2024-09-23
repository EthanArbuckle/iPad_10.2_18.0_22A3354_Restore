@implementation INFERENCESchemaINFERENCEResolverConfig

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEResolverConfig;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEResolverConfig contactConfig](self, "contactConfig", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[INFERENCESchemaINFERENCEResolverConfig deleteContactConfig](self, "deleteContactConfig");
  return v5;
}

- (void)setContactConfig:(id)a3
{
  self->_whichConfigurationtype = 2 * (a3 != 0);
  objc_storeStrong((id *)&self->_contactConfig, a3);
}

- (INFERENCESchemaINFERENCEContactResolverConfig)contactConfig
{
  if (self->_whichConfigurationtype == 2)
    return self->_contactConfig;
  else
    return (INFERENCESchemaINFERENCEContactResolverConfig *)0;
}

- (void)deleteContactConfig
{
  INFERENCESchemaINFERENCEContactResolverConfig *contactConfig;

  if (self->_whichConfigurationtype == 2)
  {
    self->_whichConfigurationtype = 0;
    contactConfig = self->_contactConfig;
    self->_contactConfig = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEResolverConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[INFERENCESchemaINFERENCEResolverConfig contactConfig](self, "contactConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCEResolverConfig contactConfig](self, "contactConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichConfigurationtype;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    whichConfigurationtype = self->_whichConfigurationtype;
    if (whichConfigurationtype == objc_msgSend(v4, "whichConfigurationtype"))
    {
      -[INFERENCESchemaINFERENCEResolverConfig contactConfig](self, "contactConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[INFERENCESchemaINFERENCEResolverConfig contactConfig](self, "contactConfig");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[INFERENCESchemaINFERENCEResolverConfig contactConfig](self, "contactConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contactConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  return -[INFERENCESchemaINFERENCEContactResolverConfig hash](self->_contactConfig, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactConfig)
  {
    -[INFERENCESchemaINFERENCEResolverConfig contactConfig](self, "contactConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactConfig"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("contactConfig"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEResolverConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEResolverConfig)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEResolverConfig *v5;
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
    self = -[INFERENCESchemaINFERENCEResolverConfig initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEResolverConfig)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEResolverConfig *v5;
  void *v6;
  INFERENCESchemaINFERENCEContactResolverConfig *v7;
  INFERENCESchemaINFERENCEResolverConfig *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INFERENCESchemaINFERENCEResolverConfig;
  v5 = -[INFERENCESchemaINFERENCEResolverConfig init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactConfig"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCEContactResolverConfig initWithDictionary:]([INFERENCESchemaINFERENCEContactResolverConfig alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEResolverConfig setContactConfig:](v5, "setContactConfig:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (unint64_t)whichConfigurationtype
{
  return self->_whichConfigurationtype;
}

- (BOOL)hasContactConfig
{
  return self->_hasContactConfig;
}

- (void)setHasContactConfig:(BOOL)a3
{
  self->_hasContactConfig = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactConfig, 0);
}

@end
