@implementation PEGASUSSchemaPEGASUSMultiturnExecution

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsRewrite:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isRewrite = a3;
}

- (BOOL)hasIsRewrite
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsRewrite:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsRewrite
{
  -[PEGASUSSchemaPEGASUSMultiturnExecution setIsRewrite:](self, "setIsRewrite:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTriggerError:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_triggerError = a3;
}

- (BOOL)hasTriggerError
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTriggerError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTriggerError
{
  -[PEGASUSSchemaPEGASUSMultiturnExecution setTriggerError:](self, "setTriggerError:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSMultiturnExecutionReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteBOOLField();
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
  $6EC73F1175EEBCF39126F6DC47B33907 has;
  unsigned int v6;
  int isRewrite;
  int v8;
  int triggerError;
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
    isRewrite = self->_isRewrite;
    if (isRewrite != objc_msgSend(v4, "isRewrite"))
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
    triggerError = self->_triggerError;
    if (triggerError != objc_msgSend(v4, "triggerError"))
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
    v2 = 2654435761 * self->_isRewrite;
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
  v3 = 2654435761 * self->_triggerError;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PEGASUSSchemaPEGASUSMultiturnExecution isRewrite](self, "isRewrite"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isRewrite"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = -[PEGASUSSchemaPEGASUSMultiturnExecution triggerError](self, "triggerError") - 1;
    if (v6 > 8)
      v7 = CFSTR("PEGASUSMULTITURNTRIGGERERROR_UNKNOWN");
    else
      v7 = off_1E563DA78[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("triggerError"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSMultiturnExecution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSMultiturnExecution)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSMultiturnExecution *v5;
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
    self = -[PEGASUSSchemaPEGASUSMultiturnExecution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSMultiturnExecution)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSMultiturnExecution *v5;
  void *v6;
  void *v7;
  PEGASUSSchemaPEGASUSMultiturnExecution *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEGASUSSchemaPEGASUSMultiturnExecution;
  v5 = -[PEGASUSSchemaPEGASUSMultiturnExecution init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRewrite"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSMultiturnExecution setIsRewrite:](v5, "setIsRewrite:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerError"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PEGASUSSchemaPEGASUSMultiturnExecution setTriggerError:](v5, "setTriggerError:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (BOOL)isRewrite
{
  return self->_isRewrite;
}

- (int)triggerError
{
  return self->_triggerError;
}

@end
