@implementation ODMSiriSchemaODMSiriTaskCounts

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setCompletedSiriTaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_completedSiriTaskCount = a3;
}

- (BOOL)hasCompletedSiriTaskCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCompletedSiriTaskCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCompletedSiriTaskCount
{
  -[ODMSiriSchemaODMSiriTaskCounts setCompletedSiriTaskCount:](self, "setCompletedSiriTaskCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setFailedSiriTaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_failedSiriTaskCount = a3;
}

- (BOOL)hasFailedSiriTaskCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFailedSiriTaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteFailedSiriTaskCount
{
  -[ODMSiriSchemaODMSiriTaskCounts setFailedSiriTaskCount:](self, "setFailedSiriTaskCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setCancelledSiriTaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cancelledSiriTaskCount = a3;
}

- (BOOL)hasCancelledSiriTaskCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCancelledSiriTaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCancelledSiriTaskCount
{
  -[ODMSiriSchemaODMSiriTaskCounts setCancelledSiriTaskCount:](self, "setCancelledSiriTaskCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCompletedUITaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_completedUITaskCount = a3;
}

- (BOOL)hasCompletedUITaskCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasCompletedUITaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteCompletedUITaskCount
{
  -[ODMSiriSchemaODMSiriTaskCounts setCompletedUITaskCount:](self, "setCompletedUITaskCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriTaskCountsReadFrom(self, (uint64_t)a3);
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
  $5B605B65F046BB0EF3D84EBB9E06051F has;
  unsigned int v6;
  unsigned int completedSiriTaskCount;
  int v8;
  unsigned int failedSiriTaskCount;
  int v10;
  unsigned int cancelledSiriTaskCount;
  int v12;
  unsigned int completedUITaskCount;
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
    completedSiriTaskCount = self->_completedSiriTaskCount;
    if (completedSiriTaskCount != objc_msgSend(v4, "completedSiriTaskCount"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    failedSiriTaskCount = self->_failedSiriTaskCount;
    if (failedSiriTaskCount != objc_msgSend(v4, "failedSiriTaskCount"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    cancelledSiriTaskCount = self->_cancelledSiriTaskCount;
    if (cancelledSiriTaskCount == objc_msgSend(v4, "cancelledSiriTaskCount"))
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
    completedUITaskCount = self->_completedUITaskCount;
    if (completedUITaskCount != objc_msgSend(v4, "completedUITaskCount"))
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
    v2 = 2654435761 * self->_completedSiriTaskCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_failedSiriTaskCount;
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
  v4 = 2654435761 * self->_cancelledSiriTaskCount;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_completedUITaskCount;
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
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts cancelledSiriTaskCount](self, "cancelledSiriTaskCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("cancelledSiriTaskCount"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts completedUITaskCount](self, "completedUITaskCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("completedUITaskCount"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts completedSiriTaskCount](self, "completedSiriTaskCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("completedSiriTaskCount"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCounts failedSiriTaskCount](self, "failedSiriTaskCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("failedSiriTaskCount"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriTaskCounts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriTaskCounts)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriTaskCounts *v5;
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
    self = -[ODMSiriSchemaODMSiriTaskCounts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriTaskCounts)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriTaskCounts *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ODMSiriSchemaODMSiriTaskCounts *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODMSiriSchemaODMSiriTaskCounts;
  v5 = -[ODMSiriSchemaODMSiriTaskCounts init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedSiriTaskCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCounts setCompletedSiriTaskCount:](v5, "setCompletedSiriTaskCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failedSiriTaskCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCounts setFailedSiriTaskCount:](v5, "setFailedSiriTaskCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelledSiriTaskCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCounts setCancelledSiriTaskCount:](v5, "setCancelledSiriTaskCount:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedUITaskCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCounts setCompletedUITaskCount:](v5, "setCompletedUITaskCount:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (unsigned)completedSiriTaskCount
{
  return self->_completedSiriTaskCount;
}

- (unsigned)failedSiriTaskCount
{
  return self->_failedSiriTaskCount;
}

- (unsigned)cancelledSiriTaskCount
{
  return self->_cancelledSiriTaskCount;
}

- (unsigned)completedUITaskCount
{
  return self->_completedUITaskCount;
}

@end
