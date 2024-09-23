@implementation LRSchemaLRPreprocessorInfo

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPreProcessorTriggerTimeNanosecondsSinceBoot:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_preProcessorTriggerTimeNanosecondsSinceBoot = a3;
}

- (BOOL)hasPreProcessorTriggerTimeNanosecondsSinceBoot
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPreProcessorTriggerTimeNanosecondsSinceBoot:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePreProcessorTriggerTimeNanosecondsSinceBoot
{
  -[LRSchemaLRPreprocessorInfo setPreProcessorTriggerTimeNanosecondsSinceBoot:](self, "setPreProcessorTriggerTimeNanosecondsSinceBoot:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setBootSessionUUIDChanged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bootSessionUUIDChanged = a3;
}

- (BOOL)hasBootSessionUUIDChanged
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasBootSessionUUIDChanged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteBootSessionUUIDChanged
{
  -[LRSchemaLRPreprocessorInfo setBootSessionUUIDChanged:](self, "setBootSessionUUIDChanged:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPreProcessorTriggerReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_preProcessorTriggerReason = a3;
}

- (BOOL)hasPreProcessorTriggerReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPreProcessorTriggerReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePreProcessorTriggerReason
{
  -[LRSchemaLRPreprocessorInfo setPreProcessorTriggerReason:](self, "setPreProcessorTriggerReason:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRPreprocessorInfoReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteBOOLField();
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $CF844E95485F655B844BD29E1E8848D3 has;
  unsigned int v6;
  unint64_t preProcessorTriggerTimeNanosecondsSinceBoot;
  int v8;
  int bootSessionUUIDChanged;
  int v10;
  int preProcessorTriggerReason;
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
    preProcessorTriggerTimeNanosecondsSinceBoot = self->_preProcessorTriggerTimeNanosecondsSinceBoot;
    if (preProcessorTriggerTimeNanosecondsSinceBoot != objc_msgSend(v4, "preProcessorTriggerTimeNanosecondsSinceBoot"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    bootSessionUUIDChanged = self->_bootSessionUUIDChanged;
    if (bootSessionUUIDChanged == objc_msgSend(v4, "bootSessionUUIDChanged"))
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
    preProcessorTriggerReason = self->_preProcessorTriggerReason;
    if (preProcessorTriggerReason != objc_msgSend(v4, "preProcessorTriggerReason"))
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
  v2 = 2654435761u * self->_preProcessorTriggerTimeNanosecondsSinceBoot;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_bootSessionUUIDChanged;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_preProcessorTriggerReason;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v8 = -[LRSchemaLRPreprocessorInfo preProcessorTriggerReason](self, "preProcessorTriggerReason") - 1;
    if (v8 > 2)
      v9 = CFSTR("LRPREPROCESSORTRIGGERREASON_UNKNOWN");
    else
      v9 = off_1E563B818[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("preProcessorTriggerReason"));
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LRSchemaLRPreprocessorInfo bootSessionUUIDChanged](self, "bootSessionUUIDChanged"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bootSessionUUIDChanged"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[LRSchemaLRPreprocessorInfo preProcessorTriggerTimeNanosecondsSinceBoot](self, "preProcessorTriggerTimeNanosecondsSinceBoot"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("preProcessorTriggerTimeNanosecondsSinceBoot"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LRSchemaLRPreprocessorInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LRSchemaLRPreprocessorInfo)initWithJSON:(id)a3
{
  void *v4;
  LRSchemaLRPreprocessorInfo *v5;
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
    self = -[LRSchemaLRPreprocessorInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LRSchemaLRPreprocessorInfo)initWithDictionary:(id)a3
{
  id v4;
  LRSchemaLRPreprocessorInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  LRSchemaLRPreprocessorInfo *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LRSchemaLRPreprocessorInfo;
  v5 = -[LRSchemaLRPreprocessorInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preProcessorTriggerTimeNanosecondsSinceBoot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRPreprocessorInfo setPreProcessorTriggerTimeNanosecondsSinceBoot:](v5, "setPreProcessorTriggerTimeNanosecondsSinceBoot:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bootSessionUUIDChanged"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRPreprocessorInfo setBootSessionUUIDChanged:](v5, "setBootSessionUUIDChanged:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preProcessorTriggerReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[LRSchemaLRPreprocessorInfo setPreProcessorTriggerReason:](v5, "setPreProcessorTriggerReason:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (unint64_t)preProcessorTriggerTimeNanosecondsSinceBoot
{
  return self->_preProcessorTriggerTimeNanosecondsSinceBoot;
}

- (BOOL)bootSessionUUIDChanged
{
  return self->_bootSessionUUIDChanged;
}

- (int)preProcessorTriggerReason
{
  return self->_preProcessorTriggerReason;
}

@end
