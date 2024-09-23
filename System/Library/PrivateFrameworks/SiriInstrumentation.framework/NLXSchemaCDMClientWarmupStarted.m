@implementation NLXSchemaCDMClientWarmupStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setServiceGraphName:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serviceGraphName = a3;
}

- (BOOL)hasServiceGraphName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasServiceGraphName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteServiceGraphName
{
  -[NLXSchemaCDMClientWarmupStarted setServiceGraphName:](self, "setServiceGraphName:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMClientWarmupStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int serviceGraphName;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (serviceGraphName = self->_serviceGraphName,
            serviceGraphName == objc_msgSend(v4, "serviceGraphName")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_serviceGraphName;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[NLXSchemaCDMClientWarmupStarted serviceGraphName](self, "serviceGraphName") - 1;
    if (v4 > 6)
      v5 = CFSTR("CDMSERVICEGRAPHNAME_UNKNOWN");
    else
      v5 = off_1E563A118[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("serviceGraphName"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMClientWarmupStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMClientWarmupStarted)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMClientWarmupStarted *v5;
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
    self = -[NLXSchemaCDMClientWarmupStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMClientWarmupStarted)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMClientWarmupStarted *v5;
  void *v6;
  NLXSchemaCDMClientWarmupStarted *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMClientWarmupStarted;
  v5 = -[NLXSchemaCDMClientWarmupStarted init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceGraphName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMClientWarmupStarted setServiceGraphName:](v5, "setServiceGraphName:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)serviceGraphName
{
  return self->_serviceGraphName;
}

@end
