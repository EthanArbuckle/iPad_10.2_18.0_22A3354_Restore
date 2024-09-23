@implementation PFAPreprocessorExecutionMetrics

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setExecutionTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_executionTimeInNs = a3;
}

- (BOOL)hasExecutionTimeInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExecutionTimeInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExecutionTimeInNs
{
  -[PFAPreprocessorExecutionMetrics setExecutionTimeInNs:](self, "setExecutionTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setStagedMessageCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_stagedMessageCount = a3;
}

- (BOOL)hasStagedMessageCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStagedMessageCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteStagedMessageCount
{
  -[PFAPreprocessorExecutionMetrics setStagedMessageCount:](self, "setStagedMessageCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setProcessedMessageCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_processedMessageCount = a3;
}

- (BOOL)hasProcessedMessageCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasProcessedMessageCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteProcessedMessageCount
{
  -[PFAPreprocessorExecutionMetrics setProcessedMessageCount:](self, "setProcessedMessageCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return PFAPreprocessorExecutionMetricsReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $82E73C503E51D24CD32F198C27686DFA has;
  unsigned int v6;
  unint64_t executionTimeInNs;
  int v8;
  unsigned int stagedMessageCount;
  int v10;
  unsigned int processedMessageCount;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    executionTimeInNs = self->_executionTimeInNs;
    if (executionTimeInNs != objc_msgSend(v4, "executionTimeInNs"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    stagedMessageCount = self->_stagedMessageCount;
    if (stagedMessageCount == objc_msgSend(v4, "stagedMessageCount"))
    {
      has = self->_has;
      v6 = v4[24];
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
    processedMessageCount = self->_processedMessageCount;
    if (processedMessageCount != objc_msgSend(v4, "processedMessageCount"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v2;
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
  v2 = 2654435761u * self->_executionTimeInNs;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_stagedMessageCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_processedMessageCount;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PFAPreprocessorExecutionMetrics processedMessageCount](self, "processedMessageCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("processedMessageCount"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PFAPreprocessorExecutionMetrics executionTimeInNs](self, "executionTimeInNs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("executionTimeInNs"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PFAPreprocessorExecutionMetrics stagedMessageCount](self, "stagedMessageCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("stagedMessageCount"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PFAPreprocessorExecutionMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PFAPreprocessorExecutionMetrics)initWithJSON:(id)a3
{
  void *v4;
  PFAPreprocessorExecutionMetrics *v5;
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
    self = -[PFAPreprocessorExecutionMetrics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PFAPreprocessorExecutionMetrics)initWithDictionary:(id)a3
{
  id v4;
  PFAPreprocessorExecutionMetrics *v5;
  void *v6;
  void *v7;
  void *v8;
  PFAPreprocessorExecutionMetrics *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFAPreprocessorExecutionMetrics;
  v5 = -[PFAPreprocessorExecutionMetrics init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionTimeInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAPreprocessorExecutionMetrics setExecutionTimeInNs:](v5, "setExecutionTimeInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stagedMessageCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAPreprocessorExecutionMetrics setStagedMessageCount:](v5, "setStagedMessageCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processedMessageCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PFAPreprocessorExecutionMetrics setProcessedMessageCount:](v5, "setProcessedMessageCount:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (unint64_t)executionTimeInNs
{
  return self->_executionTimeInNs;
}

- (unsigned)stagedMessageCount
{
  return self->_stagedMessageCount;
}

- (unsigned)processedMessageCount
{
  return self->_processedMessageCount;
}

@end
