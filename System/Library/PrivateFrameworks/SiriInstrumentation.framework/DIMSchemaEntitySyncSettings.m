@implementation DIMSchemaEntitySyncSettings

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsMediaEntitySyncEnabled:(BOOL)a3
{
  *(&self->_isMediaEntitySyncEnabled + 1) |= 1u;
  self->_isMediaEntitySyncEnabled = a3;
}

- (BOOL)hasIsMediaEntitySyncEnabled
{
  return *(&self->_isMediaEntitySyncEnabled + 1);
}

- (void)setHasIsMediaEntitySyncEnabled:(BOOL)a3
{
  *(&self->_isMediaEntitySyncEnabled + 1) = *(&self->_isMediaEntitySyncEnabled + 1) & 0xFE | a3;
}

- (void)deleteIsMediaEntitySyncEnabled
{
  -[DIMSchemaEntitySyncSettings setIsMediaEntitySyncEnabled:](self, "setIsMediaEntitySyncEnabled:", 0);
  *(&self->_isMediaEntitySyncEnabled + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaEntitySyncSettingsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isMediaEntitySyncEnabled + 1))
    PBDataWriterWriteBOOLField();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isMediaEntitySyncEnabled;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if (*(&self->_isMediaEntitySyncEnabled + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isMediaEntitySyncEnabled + 1)
        || (isMediaEntitySyncEnabled = self->_isMediaEntitySyncEnabled,
            isMediaEntitySyncEnabled == objc_msgSend(v4, "isMediaEntitySyncEnabled")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (*(&self->_isMediaEntitySyncEnabled + 1))
    return 2654435761 * self->_isMediaEntitySyncEnabled;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(&self->_isMediaEntitySyncEnabled + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DIMSchemaEntitySyncSettings isMediaEntitySyncEnabled](self, "isMediaEntitySyncEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isMediaEntitySyncEnabled"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DIMSchemaEntitySyncSettings dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (DIMSchemaEntitySyncSettings)initWithJSON:(id)a3
{
  void *v4;
  DIMSchemaEntitySyncSettings *v5;
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
    self = -[DIMSchemaEntitySyncSettings initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DIMSchemaEntitySyncSettings)initWithDictionary:(id)a3
{
  id v4;
  DIMSchemaEntitySyncSettings *v5;
  void *v6;
  DIMSchemaEntitySyncSettings *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIMSchemaEntitySyncSettings;
  v5 = -[DIMSchemaEntitySyncSettings init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaEntitySyncEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaEntitySyncSettings setIsMediaEntitySyncEnabled:](v5, "setIsMediaEntitySyncEnabled:", objc_msgSend(v6, "BOOLValue"));
    v7 = v5;

  }
  return v5;
}

- (BOOL)isMediaEntitySyncEnabled
{
  return self->_isMediaEntitySyncEnabled;
}

@end
