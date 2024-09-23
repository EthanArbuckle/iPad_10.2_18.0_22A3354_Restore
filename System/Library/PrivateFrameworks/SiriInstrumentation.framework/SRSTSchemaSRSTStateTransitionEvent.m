@implementation SRSTSchemaSRSTStateTransitionEvent

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCurrentState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_currentState = a3;
}

- (BOOL)hasCurrentState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCurrentState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCurrentState
{
  -[SRSTSchemaSRSTStateTransitionEvent setCurrentState:](self, "setCurrentState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPreviousState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_previousState = a3;
}

- (BOOL)hasPreviousState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPreviousState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePreviousState
{
  -[SRSTSchemaSRSTStateTransitionEvent setPreviousState:](self, "setPreviousState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reason = a3;
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteReason
{
  -[SRSTSchemaSRSTStateTransitionEvent setReason:](self, "setReason:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SRSTSchemaSRSTStateTransitionEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $6133FB21E486D1192714B286D6498F8D has;
  unsigned int v6;
  int currentState;
  int v8;
  int previousState;
  int v10;
  int reason;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    currentState = self->_currentState;
    if (currentState != objc_msgSend(v4, "currentState"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    previousState = self->_previousState;
    if (previousState == objc_msgSend(v4, "previousState"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    reason = self->_reason;
    if (reason != objc_msgSend(v4, "reason"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_currentState;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_previousState;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_reason;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[SRSTSchemaSRSTStateTransitionEvent currentState](self, "currentState") - 1;
    if (v5 > 8)
      v6 = CFSTR("SRSTSTATE_UNKNOWN");
    else
      v6 = off_1E5638058[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("currentState"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v7 = -[SRSTSchemaSRSTStateTransitionEvent previousState](self, "previousState") - 1;
  if (v7 > 8)
    v8 = CFSTR("SRSTSTATE_UNKNOWN");
  else
    v8 = off_1E5638058[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("previousState"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    v9 = -[SRSTSchemaSRSTStateTransitionEvent reason](self, "reason") - 1;
    if (v9 > 0x16)
      v10 = CFSTR("SRSTSTATETRANSITIONREASON_UNKNOWN");
    else
      v10 = off_1E56380A0[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("reason"));
  }
LABEL_17:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SRSTSchemaSRSTStateTransitionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SRSTSchemaSRSTStateTransitionEvent)initWithJSON:(id)a3
{
  void *v4;
  SRSTSchemaSRSTStateTransitionEvent *v5;
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
    self = -[SRSTSchemaSRSTStateTransitionEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SRSTSchemaSRSTStateTransitionEvent)initWithDictionary:(id)a3
{
  id v4;
  SRSTSchemaSRSTStateTransitionEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  SRSTSchemaSRSTStateTransitionEvent *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRSTSchemaSRSTStateTransitionEvent;
  v5 = -[SRSTSchemaSRSTStateTransitionEvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SRSTSchemaSRSTStateTransitionEvent setCurrentState:](v5, "setCurrentState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SRSTSchemaSRSTStateTransitionEvent setPreviousState:](v5, "setPreviousState:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SRSTSchemaSRSTStateTransitionEvent setReason:](v5, "setReason:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)currentState
{
  return self->_currentState;
}

- (int)previousState
{
  return self->_previousState;
}

- (int)reason
{
  return self->_reason;
}

@end
