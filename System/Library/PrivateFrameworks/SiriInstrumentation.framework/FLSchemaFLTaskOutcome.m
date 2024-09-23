@implementation FLSchemaFLTaskOutcome

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setTaskStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_taskStatus = a3;
}

- (BOOL)hasTaskStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTaskStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTaskStatus
{
  -[FLSchemaFLTaskOutcome setTaskStatus:](self, "setTaskStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setPromptStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_promptStatus = a3;
}

- (BOOL)hasPromptStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPromptStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePromptStatus
{
  -[FLSchemaFLTaskOutcome setPromptStatus:](self, "setPromptStatus:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLTaskOutcomeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $2253483FA3D948D437515F46B41F44B0 has;
  unsigned int v6;
  int taskStatus;
  int v8;
  int promptStatus;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    taskStatus = self->_taskStatus;
    if (taskStatus != objc_msgSend(v4, "taskStatus"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    promptStatus = self->_promptStatus;
    if (promptStatus != objc_msgSend(v4, "promptStatus"))
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_taskStatus;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_promptStatus;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[FLSchemaFLTaskOutcome promptStatus](self, "promptStatus") - 1;
    if (v5 > 3)
      v6 = CFSTR("FLTASKPROMPTSTATUS_UNKNOWN");
    else
      v6 = *(&off_1E563EA88 + v5);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("promptStatus"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v7 = -[FLSchemaFLTaskOutcome taskStatus](self, "taskStatus") - 1;
    if (v7 > 6)
      v8 = CFSTR("FLTASKSTATUS_UNKNOWN");
    else
      v8 = *(&off_1E563EAA8 + v7);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("taskStatus"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLTaskOutcome dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLTaskOutcome)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLTaskOutcome *v5;
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
    self = -[FLSchemaFLTaskOutcome initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLTaskOutcome)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLTaskOutcome *v5;
  void *v6;
  void *v7;
  FLSchemaFLTaskOutcome *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLSchemaFLTaskOutcome;
  v5 = -[FLSchemaFLTaskOutcome init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLTaskOutcome setTaskStatus:](v5, "setTaskStatus:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promptStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLTaskOutcome setPromptStatus:](v5, "setPromptStatus:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)taskStatus
{
  return self->_taskStatus;
}

- (int)promptStatus
{
  return self->_promptStatus;
}

@end
