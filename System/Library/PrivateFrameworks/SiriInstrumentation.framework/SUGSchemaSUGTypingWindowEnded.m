@implementation SUGSchemaSUGTypingWindowEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setTypingWindowEndReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_typingWindowEndReason = a3;
}

- (BOOL)hasTypingWindowEndReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTypingWindowEndReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTypingWindowEndReason
{
  -[SUGSchemaSUGTypingWindowEnded setTypingWindowEndReason:](self, "setTypingWindowEndReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGTypingWindowEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int typingWindowEndReason;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (typingWindowEndReason = self->_typingWindowEndReason,
            typingWindowEndReason == objc_msgSend(v4, "typingWindowEndReason")))
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
    return 2654435761 * self->_typingWindowEndReason;
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
    v4 = -[SUGSchemaSUGTypingWindowEnded typingWindowEndReason](self, "typingWindowEndReason") - 1;
    if (v4 > 2)
      v5 = CFSTR("SUGTYPINGWINDOWENDREASON_UNKNOWN");
    else
      v5 = *(&off_1E563F118 + v4);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("typingWindowEndReason"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGTypingWindowEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGTypingWindowEnded)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGTypingWindowEnded *v5;
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
    self = -[SUGSchemaSUGTypingWindowEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGTypingWindowEnded)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGTypingWindowEnded *v5;
  void *v6;
  SUGSchemaSUGTypingWindowEnded *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUGSchemaSUGTypingWindowEnded;
  v5 = -[SUGSchemaSUGTypingWindowEnded init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typingWindowEndReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGTypingWindowEnded setTypingWindowEndReason:](v5, "setTypingWindowEndReason:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)typingWindowEndReason
{
  return self->_typingWindowEndReason;
}

@end
