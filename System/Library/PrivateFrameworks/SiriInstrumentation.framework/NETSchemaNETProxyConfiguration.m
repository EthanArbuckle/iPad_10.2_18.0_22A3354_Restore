@implementation NETSchemaNETProxyConfiguration

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsProxyConfigured:(BOOL)a3
{
  *(&self->_usingConfiguredProxy + 1) |= 1u;
  self->_isProxyConfigured = a3;
}

- (BOOL)hasIsProxyConfigured
{
  return *(&self->_usingConfiguredProxy + 1);
}

- (void)setHasIsProxyConfigured:(BOOL)a3
{
  *(&self->_usingConfiguredProxy + 1) = *(&self->_usingConfiguredProxy + 1) & 0xFE | a3;
}

- (void)deleteIsProxyConfigured
{
  -[NETSchemaNETProxyConfiguration setIsProxyConfigured:](self, "setIsProxyConfigured:", 0);
  *(&self->_usingConfiguredProxy + 1) &= ~1u;
}

- (void)setUsingConfiguredProxy:(BOOL)a3
{
  *(&self->_usingConfiguredProxy + 1) |= 2u;
  self->_usingConfiguredProxy = a3;
}

- (BOOL)hasUsingConfiguredProxy
{
  return (*((unsigned __int8 *)&self->_usingConfiguredProxy + 1) >> 1) & 1;
}

- (void)setHasUsingConfiguredProxy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_usingConfiguredProxy + 1) = *(&self->_usingConfiguredProxy + 1) & 0xFD | v3;
}

- (void)deleteUsingConfiguredProxy
{
  -[NETSchemaNETProxyConfiguration setUsingConfiguredProxy:](self, "setUsingConfiguredProxy:", 0);
  *(&self->_usingConfiguredProxy + 1) &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETProxyConfigurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *(&self->_usingConfiguredProxy + 1);
  v6 = v4;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    v5 = *(&self->_usingConfiguredProxy + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int isProxyConfigured;
  int v8;
  int usingConfiguredProxy;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  v5 = *((unsigned __int8 *)&self->_usingConfiguredProxy + 1);
  v6 = v4[10];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_10;
  if ((v5 & 1) != 0)
  {
    isProxyConfigured = self->_isProxyConfigured;
    if (isProxyConfigured != objc_msgSend(v4, "isProxyConfigured"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    v5 = *((unsigned __int8 *)&self->_usingConfiguredProxy + 1);
    v6 = v4[10];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    usingConfiguredProxy = self->_usingConfiguredProxy;
    if (usingConfiguredProxy != objc_msgSend(v4, "usingConfiguredProxy"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if (*(&self->_usingConfiguredProxy + 1))
  {
    v2 = 2654435761 * self->_isProxyConfigured;
    if ((*(&self->_usingConfiguredProxy + 1) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(&self->_usingConfiguredProxy + 1) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_usingConfiguredProxy;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(&self->_usingConfiguredProxy + 1);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETProxyConfiguration isProxyConfigured](self, "isProxyConfigured"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isProxyConfigured"));

    v4 = *(&self->_usingConfiguredProxy + 1);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETProxyConfiguration usingConfiguredProxy](self, "usingConfiguredProxy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("usingConfiguredProxy"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETProxyConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETProxyConfiguration)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETProxyConfiguration *v5;
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
    self = -[NETSchemaNETProxyConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETProxyConfiguration)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETProxyConfiguration *v5;
  void *v6;
  void *v7;
  NETSchemaNETProxyConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NETSchemaNETProxyConfiguration;
  v5 = -[NETSchemaNETProxyConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isProxyConfigured"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETProxyConfiguration setIsProxyConfigured:](v5, "setIsProxyConfigured:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usingConfiguredProxy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETProxyConfiguration setUsingConfiguredProxy:](v5, "setUsingConfiguredProxy:", objc_msgSend(v7, "BOOLValue"));
    v8 = v5;

  }
  return v5;
}

- (BOOL)isProxyConfigured
{
  return self->_isProxyConfigured;
}

- (BOOL)usingConfiguredProxy
{
  return self->_usingConfiguredProxy;
}

@end
