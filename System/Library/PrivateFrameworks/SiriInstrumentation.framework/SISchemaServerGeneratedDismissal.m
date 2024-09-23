@implementation SISchemaServerGeneratedDismissal

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setServerGeneratedDismissalReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serverGeneratedDismissalReason = a3;
}

- (BOOL)hasServerGeneratedDismissalReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasServerGeneratedDismissalReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteServerGeneratedDismissalReason
{
  -[SISchemaServerGeneratedDismissal setServerGeneratedDismissalReason:](self, "setServerGeneratedDismissalReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaServerGeneratedDismissalReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int serverGeneratedDismissalReason;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (serverGeneratedDismissalReason = self->_serverGeneratedDismissalReason,
            serverGeneratedDismissalReason == objc_msgSend(v4, "serverGeneratedDismissalReason")))
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
    return 2654435761 * self->_serverGeneratedDismissalReason;
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
    v4 = -[SISchemaServerGeneratedDismissal serverGeneratedDismissalReason](self, "serverGeneratedDismissalReason") - 1;
    if (v4 > 4)
      v5 = CFSTR("SERVERGENERATEDDISMISSALREASON_UNKNOWN");
    else
      v5 = off_1E5637160[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("serverGeneratedDismissalReason"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaServerGeneratedDismissal dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaServerGeneratedDismissal)initWithJSON:(id)a3
{
  void *v4;
  SISchemaServerGeneratedDismissal *v5;
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
    self = -[SISchemaServerGeneratedDismissal initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaServerGeneratedDismissal)initWithDictionary:(id)a3
{
  id v4;
  SISchemaServerGeneratedDismissal *v5;
  void *v6;
  SISchemaServerGeneratedDismissal *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaServerGeneratedDismissal;
  v5 = -[SISchemaServerGeneratedDismissal init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverGeneratedDismissalReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaServerGeneratedDismissal setServerGeneratedDismissalReason:](v5, "setServerGeneratedDismissalReason:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)serverGeneratedDismissalReason
{
  return self->_serverGeneratedDismissalReason;
}

@end
