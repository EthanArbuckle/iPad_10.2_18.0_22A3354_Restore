@implementation HALSchemaHALContextCollectorFetchStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsContextCollectorLocal:(BOOL)a3
{
  *(&self->_isContextCollectorLocal + 1) |= 1u;
  self->_isContextCollectorLocal = a3;
}

- (BOOL)hasIsContextCollectorLocal
{
  return *(&self->_isContextCollectorLocal + 1);
}

- (void)setHasIsContextCollectorLocal:(BOOL)a3
{
  *(&self->_isContextCollectorLocal + 1) = *(&self->_isContextCollectorLocal + 1) & 0xFE | a3;
}

- (void)deleteIsContextCollectorLocal
{
  -[HALSchemaHALContextCollectorFetchStarted setIsContextCollectorLocal:](self, "setIsContextCollectorLocal:", 0);
  *(&self->_isContextCollectorLocal + 1) &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALContextCollectorFetchStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isContextCollectorLocal + 1))
    PBDataWriterWriteBOOLField();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int isContextCollectorLocal;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if (*(&self->_isContextCollectorLocal + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isContextCollectorLocal + 1)
        || (isContextCollectorLocal = self->_isContextCollectorLocal,
            isContextCollectorLocal == objc_msgSend(v4, "isContextCollectorLocal")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (*(&self->_isContextCollectorLocal + 1))
    return 2654435761 * self->_isContextCollectorLocal;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(&self->_isContextCollectorLocal + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HALSchemaHALContextCollectorFetchStarted isContextCollectorLocal](self, "isContextCollectorLocal"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isContextCollectorLocal"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HALSchemaHALContextCollectorFetchStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HALSchemaHALContextCollectorFetchStarted)initWithJSON:(id)a3
{
  void *v4;
  HALSchemaHALContextCollectorFetchStarted *v5;
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
    self = -[HALSchemaHALContextCollectorFetchStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HALSchemaHALContextCollectorFetchStarted)initWithDictionary:(id)a3
{
  id v4;
  HALSchemaHALContextCollectorFetchStarted *v5;
  void *v6;
  HALSchemaHALContextCollectorFetchStarted *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HALSchemaHALContextCollectorFetchStarted;
  v5 = -[HALSchemaHALContextCollectorFetchStarted init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isContextCollectorLocal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[HALSchemaHALContextCollectorFetchStarted setIsContextCollectorLocal:](v5, "setIsContextCollectorLocal:", objc_msgSend(v6, "BOOLValue"));
    v7 = v5;

  }
  return v5;
}

- (BOOL)isContextCollectorLocal
{
  return self->_isContextCollectorLocal;
}

@end
