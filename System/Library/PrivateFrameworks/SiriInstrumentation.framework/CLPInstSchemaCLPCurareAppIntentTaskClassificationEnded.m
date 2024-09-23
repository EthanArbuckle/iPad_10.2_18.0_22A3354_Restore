@implementation CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSampleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sampleCount = a3;
}

- (BOOL)hasSampleCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSampleCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSampleCount
{
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setSampleCount:](self, "setSampleCount:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setClassifiedSampleCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_classifiedSampleCount = a3;
}

- (BOOL)hasClassifiedSampleCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasClassifiedSampleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteClassifiedSampleCount
{
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setClassifiedSampleCount:](self, "setClassifiedSampleCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPositiveCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_positiveCount = a3;
}

- (BOOL)hasPositiveCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPositiveCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePositiveCount
{
  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setPositiveCount:](self, "setPositiveCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCurareAppIntentTaskClassificationEndedReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteUint32Field();
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
  $D70A7E6EFD736AC9BDAA4A2AD7007843 has;
  unsigned int v6;
  unsigned int sampleCount;
  int v8;
  unsigned int classifiedSampleCount;
  int v10;
  unsigned int positiveCount;
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
    sampleCount = self->_sampleCount;
    if (sampleCount != objc_msgSend(v4, "sampleCount"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    classifiedSampleCount = self->_classifiedSampleCount;
    if (classifiedSampleCount == objc_msgSend(v4, "classifiedSampleCount"))
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
    positiveCount = self->_positiveCount;
    if (positiveCount != objc_msgSend(v4, "positiveCount"))
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
  v2 = 2654435761 * self->_sampleCount;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_classifiedSampleCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_positiveCount;
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
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded positiveCount](self, "positiveCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("positiveCount"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded classifiedSampleCount](self, "classifiedSampleCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("classifiedSampleCount"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded sampleCount](self, "sampleCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sampleCount"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded *v5;
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
    self = -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded;
  v5 = -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampleCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setSampleCount:](v5, "setSampleCount:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("classifiedSampleCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setClassifiedSampleCount:](v5, "setClassifiedSampleCount:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positiveCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPCurareAppIntentTaskClassificationEnded setPositiveCount:](v5, "setPositiveCount:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (unsigned)sampleCount
{
  return self->_sampleCount;
}

- (unsigned)classifiedSampleCount
{
  return self->_classifiedSampleCount;
}

- (unsigned)positiveCount
{
  return self->_positiveCount;
}

@end
