@implementation ODMSiriSchemaODMSiriTaskCountsReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ODMSiriSchemaODMSiriTaskCountsReported;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODMSiriSchemaODMSiriTaskCountsReported dimensions](self, "dimensions", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[ODMSiriSchemaODMSiriTaskCountsReported deleteDimensions](self, "deleteDimensions");
  return v5;
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

- (void)deleteDimensions
{
  -[ODMSiriSchemaODMSiriTaskCountsReported setDimensions:](self, "setDimensions:", 0);
}

- (void)setTaskType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_taskType = a3;
}

- (BOOL)hasTaskType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTaskType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTaskType
{
  -[ODMSiriSchemaODMSiriTaskCountsReported setTaskType:](self, "setTaskType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCompletedSiriTaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_completedSiriTaskCount = a3;
}

- (BOOL)hasCompletedSiriTaskCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCompletedSiriTaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCompletedSiriTaskCount
{
  -[ODMSiriSchemaODMSiriTaskCountsReported setCompletedSiriTaskCount:](self, "setCompletedSiriTaskCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setFailedSiriTaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_failedSiriTaskCount = a3;
}

- (BOOL)hasFailedSiriTaskCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasFailedSiriTaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteFailedSiriTaskCount
{
  -[ODMSiriSchemaODMSiriTaskCountsReported setFailedSiriTaskCount:](self, "setFailedSiriTaskCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setCancelledSiriTaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_cancelledSiriTaskCount = a3;
}

- (BOOL)hasCancelledSiriTaskCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasCancelledSiriTaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteCancelledSiriTaskCount
{
  -[ODMSiriSchemaODMSiriTaskCountsReported setCancelledSiriTaskCount:](self, "setCancelledSiriTaskCount:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setCompletedUITaskCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_completedUITaskCount = a3;
}

- (BOOL)hasCompletedUITaskCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasCompletedUITaskCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteCompletedUITaskCount
{
  -[ODMSiriSchemaODMSiriTaskCountsReported setCompletedUITaskCount:](self, "setCompletedUITaskCount:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  return ODMSiriSchemaODMSiriTaskCountsReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[ODMSiriSchemaODMSiriTaskCountsReported dimensions](self, "dimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODMSiriSchemaODMSiriTaskCountsReported dimensions](self, "dimensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteUint32Field();
      v7 = v8;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    v7 = v8;
  }
LABEL_10:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $B3B962E6FB435CC010E16CF148D05632 has;
  unsigned int v14;
  int taskType;
  int v16;
  unsigned int completedSiriTaskCount;
  int v18;
  unsigned int failedSiriTaskCount;
  int v20;
  unsigned int cancelledSiriTaskCount;
  int v22;
  unsigned int completedUITaskCount;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[ODMSiriSchemaODMSiriTaskCountsReported dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_28;
  }
  -[ODMSiriSchemaODMSiriTaskCountsReported dimensions](self, "dimensions");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODMSiriSchemaODMSiriTaskCountsReported dimensions](self, "dimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dimensions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_28:
    v24 = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    taskType = self->_taskType;
    if (taskType != objc_msgSend(v4, "taskType"))
      goto LABEL_28;
    has = self->_has;
    v14 = v4[36];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_28;
  if (v16)
  {
    completedSiriTaskCount = self->_completedSiriTaskCount;
    if (completedSiriTaskCount != objc_msgSend(v4, "completedSiriTaskCount"))
      goto LABEL_28;
    has = self->_has;
    v14 = v4[36];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_28;
  if (v18)
  {
    failedSiriTaskCount = self->_failedSiriTaskCount;
    if (failedSiriTaskCount != objc_msgSend(v4, "failedSiriTaskCount"))
      goto LABEL_28;
    has = self->_has;
    v14 = v4[36];
  }
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_28;
  if (v20)
  {
    cancelledSiriTaskCount = self->_cancelledSiriTaskCount;
    if (cancelledSiriTaskCount == objc_msgSend(v4, "cancelledSiriTaskCount"))
    {
      has = self->_has;
      v14 = v4[36];
      goto LABEL_24;
    }
    goto LABEL_28;
  }
LABEL_24:
  v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1))
    goto LABEL_28;
  if (v22)
  {
    completedUITaskCount = self->_completedUITaskCount;
    if (completedUITaskCount != objc_msgSend(v4, "completedUITaskCount"))
      goto LABEL_28;
  }
  v24 = 1;
LABEL_29:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[ODMSiriSchemaODMSiriAggregationDimensions hash](self->_dimensions, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_taskType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_completedSiriTaskCount;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_failedSiriTaskCount;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_cancelledSiriTaskCount;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761 * self->_completedUITaskCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported cancelledSiriTaskCount](self, "cancelledSiriTaskCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("cancelledSiriTaskCount"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported completedSiriTaskCount](self, "completedSiriTaskCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("completedSiriTaskCount"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported completedUITaskCount](self, "completedUITaskCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("completedUITaskCount"));

  }
LABEL_5:
  if (self->_dimensions)
  {
    -[ODMSiriSchemaODMSiriTaskCountsReported dimensions](self, "dimensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("dimensions"));

    }
  }
  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[ODMSiriSchemaODMSiriTaskCountsReported failedSiriTaskCount](self, "failedSiriTaskCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("failedSiriTaskCount"));

    v11 = (char)self->_has;
  }
  if ((v11 & 1) != 0)
  {
    v13 = -[ODMSiriSchemaODMSiriTaskCountsReported taskType](self, "taskType") - 1;
    if (v13 > 3)
      v14 = CFSTR("ODMSIRITASKTYPE_UNKNOWN");
    else
      v14 = off_1E5639EB8[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("taskType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODMSiriSchemaODMSiriTaskCountsReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODMSiriSchemaODMSiriTaskCountsReported)initWithJSON:(id)a3
{
  void *v4;
  ODMSiriSchemaODMSiriTaskCountsReported *v5;
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
    self = -[ODMSiriSchemaODMSiriTaskCountsReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODMSiriSchemaODMSiriTaskCountsReported)initWithDictionary:(id)a3
{
  id v4;
  ODMSiriSchemaODMSiriTaskCountsReported *v5;
  void *v6;
  ODMSiriSchemaODMSiriAggregationDimensions *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ODMSiriSchemaODMSiriTaskCountsReported *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODMSiriSchemaODMSiriTaskCountsReported;
  v5 = -[ODMSiriSchemaODMSiriTaskCountsReported init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODMSiriSchemaODMSiriAggregationDimensions initWithDictionary:]([ODMSiriSchemaODMSiriAggregationDimensions alloc], "initWithDictionary:", v6);
      -[ODMSiriSchemaODMSiriTaskCountsReported setDimensions:](v5, "setDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCountsReported setTaskType:](v5, "setTaskType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedSiriTaskCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCountsReported setCompletedSiriTaskCount:](v5, "setCompletedSiriTaskCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failedSiriTaskCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCountsReported setFailedSiriTaskCount:](v5, "setFailedSiriTaskCount:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelledSiriTaskCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCountsReported setCancelledSiriTaskCount:](v5, "setCancelledSiriTaskCount:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completedUITaskCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODMSiriSchemaODMSiriTaskCountsReported setCompletedUITaskCount:](v5, "setCompletedUITaskCount:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v5;

  }
  return v5;
}

- (ODMSiriSchemaODMSiriAggregationDimensions)dimensions
{
  return self->_dimensions;
}

- (void)setDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_dimensions, a3);
}

- (int)taskType
{
  return self->_taskType;
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

- (void)setHasDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
