@implementation ODDSiriSchemaODDTaskCounts

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSiriTasksStarted:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_siriTasksStarted = a3;
}

- (BOOL)hasSiriTasksStarted
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSiriTasksStarted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSiriTasksStarted
{
  -[ODDSiriSchemaODDTaskCounts setSiriTasksStarted:](self, "setSiriTasksStarted:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSiriTasksCompleted:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_siriTasksCompleted = a3;
}

- (BOOL)hasSiriTasksCompleted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSiriTasksCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSiriTasksCompleted
{
  -[ODDSiriSchemaODDTaskCounts setSiriTasksCompleted:](self, "setSiriTasksCompleted:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setFlowTasksStarted:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_flowTasksStarted = a3;
}

- (BOOL)hasFlowTasksStarted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasFlowTasksStarted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteFlowTasksStarted
{
  -[ODDSiriSchemaODDTaskCounts setFlowTasksStarted:](self, "setFlowTasksStarted:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setFlowTasksCompleted:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_flowTasksCompleted = a3;
}

- (BOOL)hasFlowTasksCompleted
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasFlowTasksCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteFlowTasksCompleted
{
  -[ODDSiriSchemaODDTaskCounts setFlowTasksCompleted:](self, "setFlowTasksCompleted:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDTaskCountsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $88F4253F97AC9EBD5DA60F4455FC9840 has;
  unsigned int v6;
  unsigned int siriTasksStarted;
  int v8;
  unsigned int siriTasksCompleted;
  int v10;
  unsigned int flowTasksStarted;
  int v12;
  unsigned int flowTasksCompleted;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    siriTasksStarted = self->_siriTasksStarted;
    if (siriTasksStarted != objc_msgSend(v4, "siriTasksStarted"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    siriTasksCompleted = self->_siriTasksCompleted;
    if (siriTasksCompleted != objc_msgSend(v4, "siriTasksCompleted"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    flowTasksStarted = self->_flowTasksStarted;
    if (flowTasksStarted == objc_msgSend(v4, "flowTasksStarted"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    flowTasksCompleted = self->_flowTasksCompleted;
    if (flowTasksCompleted != objc_msgSend(v4, "flowTasksCompleted"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_siriTasksStarted;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_siriTasksCompleted;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_flowTasksStarted;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_flowTasksCompleted;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts flowTasksCompleted](self, "flowTasksCompleted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("flowTasksCompleted"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts siriTasksCompleted](self, "siriTasksCompleted"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriTasksCompleted"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts flowTasksStarted](self, "flowTasksStarted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("flowTasksStarted"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODDSiriSchemaODDTaskCounts siriTasksStarted](self, "siriTasksStarted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("siriTasksStarted"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDTaskCounts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDTaskCounts)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDTaskCounts *v5;
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
    self = -[ODDSiriSchemaODDTaskCounts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDTaskCounts)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDTaskCounts *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ODDSiriSchemaODDTaskCounts *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODDSiriSchemaODDTaskCounts;
  v5 = -[ODDSiriSchemaODDTaskCounts init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriTasksStarted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDTaskCounts setSiriTasksStarted:](v5, "setSiriTasksStarted:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriTasksCompleted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDTaskCounts setSiriTasksCompleted:](v5, "setSiriTasksCompleted:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowTasksStarted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDTaskCounts setFlowTasksStarted:](v5, "setFlowTasksStarted:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowTasksCompleted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDTaskCounts setFlowTasksCompleted:](v5, "setFlowTasksCompleted:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (unsigned)siriTasksStarted
{
  return self->_siriTasksStarted;
}

- (unsigned)siriTasksCompleted
{
  return self->_siriTasksCompleted;
}

- (unsigned)flowTasksStarted
{
  return self->_flowTasksStarted;
}

- (unsigned)flowTasksCompleted
{
  return self->_flowTasksCompleted;
}

@end
