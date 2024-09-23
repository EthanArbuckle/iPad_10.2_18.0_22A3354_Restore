@implementation CLPInstSchemaCLPNLv4TaskEvaluationEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAccuracyOnTheFirstUserParseCount:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accuracyOnTheFirstUserParseCount = a3;
}

- (BOOL)hasAccuracyOnTheFirstUserParseCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAccuracyOnTheFirstUserParseCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAccuracyOnTheFirstUserParseCount
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setAccuracyOnTheFirstUserParseCount:](self, "setAccuracyOnTheFirstUserParseCount:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAccuracyOnAnyUserParse:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_accuracyOnAnyUserParse = a3;
}

- (BOOL)hasAccuracyOnAnyUserParse
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAccuracyOnAnyUserParse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAccuracyOnAnyUserParse
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setAccuracyOnAnyUserParse:](self, "setAccuracyOnAnyUserParse:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setEvaluationCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_evaluationCount = a3;
}

- (BOOL)hasEvaluationCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEvaluationCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteEvaluationCount
{
  -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setEvaluationCount:](self, "setEvaluationCount:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4TaskEvaluationEndedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteDoubleField();
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
  $9B896259364FDDFB8CBEC698B742B77E has;
  unsigned int v6;
  double accuracyOnTheFirstUserParseCount;
  double v8;
  int v9;
  double accuracyOnAnyUserParse;
  double v11;
  int v12;
  unsigned int evaluationCount;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    accuracyOnTheFirstUserParseCount = self->_accuracyOnTheFirstUserParseCount;
    objc_msgSend(v4, "accuracyOnTheFirstUserParseCount");
    if (accuracyOnTheFirstUserParseCount != v8)
      goto LABEL_14;
    has = self->_has;
    v6 = v4[28];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v9)
  {
    accuracyOnAnyUserParse = self->_accuracyOnAnyUserParse;
    objc_msgSend(v4, "accuracyOnAnyUserParse");
    if (accuracyOnAnyUserParse == v11)
    {
      has = self->_has;
      v6 = v4[28];
      goto LABEL_10;
    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v12)
  {
    evaluationCount = self->_evaluationCount;
    if (evaluationCount != objc_msgSend(v4, "evaluationCount"))
      goto LABEL_14;
  }
  v14 = 1;
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double accuracyOnTheFirstUserParseCount;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double accuracyOnAnyUserParse;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    accuracyOnTheFirstUserParseCount = self->_accuracyOnTheFirstUserParseCount;
    v6 = -accuracyOnTheFirstUserParseCount;
    if (accuracyOnTheFirstUserParseCount >= 0.0)
      v6 = self->_accuracyOnTheFirstUserParseCount;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    accuracyOnAnyUserParse = self->_accuracyOnAnyUserParse;
    v11 = -accuracyOnAnyUserParse;
    if (accuracyOnAnyUserParse >= 0.0)
      v11 = self->_accuracyOnAnyUserParse;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
    v14 = 2654435761 * self->_evaluationCount;
  else
    v14 = 0;
  return v9 ^ v4 ^ v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[CLPInstSchemaCLPNLv4TaskEvaluationEnded accuracyOnTheFirstUserParseCount](self, "accuracyOnTheFirstUserParseCount");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("accuracyOnTheFirstUserParseCount"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CLPInstSchemaCLPNLv4TaskEvaluationEnded accuracyOnAnyUserParse](self, "accuracyOnAnyUserParse");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("accuracyOnAnyUserParse"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4TaskEvaluationEnded evaluationCount](self, "evaluationCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("evaluationCount"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPNLv4TaskEvaluationEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPNLv4TaskEvaluationEnded)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPNLv4TaskEvaluationEnded *v5;
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
    self = -[CLPInstSchemaCLPNLv4TaskEvaluationEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPNLv4TaskEvaluationEnded)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPNLv4TaskEvaluationEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  CLPInstSchemaCLPNLv4TaskEvaluationEnded *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLPInstSchemaCLPNLv4TaskEvaluationEnded;
  v5 = -[CLPInstSchemaCLPNLv4TaskEvaluationEnded init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accuracyOnTheFirstUserParseCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setAccuracyOnTheFirstUserParseCount:](v5, "setAccuracyOnTheFirstUserParseCount:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accuracyOnAnyUserParse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setAccuracyOnAnyUserParse:](v5, "setAccuracyOnAnyUserParse:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CLPInstSchemaCLPNLv4TaskEvaluationEnded setEvaluationCount:](v5, "setEvaluationCount:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (double)accuracyOnTheFirstUserParseCount
{
  return self->_accuracyOnTheFirstUserParseCount;
}

- (double)accuracyOnAnyUserParse
{
  return self->_accuracyOnAnyUserParse;
}

- (unsigned)evaluationCount
{
  return self->_evaluationCount;
}

@end
