@implementation NLXSchemaMARRSRepetitionDetectionEvaluated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setRepetitionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_repetitionType = a3;
}

- (BOOL)hasRepetitionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRepetitionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRepetitionType
{
  -[NLXSchemaMARRSRepetitionDetectionEvaluated setRepetitionType:](self, "setRepetitionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRuleType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ruleType = a3;
}

- (BOOL)hasRuleType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRuleType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRuleType
{
  -[NLXSchemaMARRSRepetitionDetectionEvaluated setRuleType:](self, "setRuleType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNoRepetitionConfidence:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_noRepetitionConfidence = a3;
}

- (BOOL)hasNoRepetitionConfidence
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNoRepetitionConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNoRepetitionConfidence
{
  double v2;

  LODWORD(v2) = 0;
  -[NLXSchemaMARRSRepetitionDetectionEvaluated setNoRepetitionConfidence:](self, "setNoRepetitionConfidence:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setFullRepetitionConfidence:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_fullRepetitionConfidence = a3;
}

- (BOOL)hasFullRepetitionConfidence
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasFullRepetitionConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteFullRepetitionConfidence
{
  double v2;

  LODWORD(v2) = 0;
  -[NLXSchemaMARRSRepetitionDetectionEvaluated setFullRepetitionConfidence:](self, "setFullRepetitionConfidence:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setPartialRepetitionConfidence:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_partialRepetitionConfidence = a3;
}

- (BOOL)hasPartialRepetitionConfidence
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasPartialRepetitionConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deletePartialRepetitionConfidence
{
  double v2;

  LODWORD(v2) = 0;
  -[NLXSchemaMARRSRepetitionDetectionEvaluated setPartialRepetitionConfidence:](self, "setPartialRepetitionConfidence:", v2);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return NLXSchemaMARRSRepetitionDetectionEvaluatedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteFloatField();
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $CC871E1465C82D8B397C1939E477F1ED has;
  unsigned int v6;
  int repetitionType;
  int v8;
  int ruleType;
  int v10;
  float noRepetitionConfidence;
  float v12;
  int v13;
  float fullRepetitionConfidence;
  float v15;
  int v16;
  float partialRepetitionConfidence;
  float v18;
  BOOL v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_21;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    repetitionType = self->_repetitionType;
    if (repetitionType != objc_msgSend(v4, "repetitionType"))
      goto LABEL_21;
    has = self->_has;
    v6 = v4[28];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      ruleType = self->_ruleType;
      if (ruleType != objc_msgSend(v4, "ruleType"))
        goto LABEL_21;
      has = self->_has;
      v6 = v4[28];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        noRepetitionConfidence = self->_noRepetitionConfidence;
        objc_msgSend(v4, "noRepetitionConfidence");
        if (noRepetitionConfidence != v12)
          goto LABEL_21;
        has = self->_has;
        v6 = v4[28];
      }
      v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          fullRepetitionConfidence = self->_fullRepetitionConfidence;
          objc_msgSend(v4, "fullRepetitionConfidence");
          if (fullRepetitionConfidence != v15)
            goto LABEL_21;
          has = self->_has;
          v6 = v4[28];
        }
        v16 = (*(unsigned int *)&has >> 4) & 1;
        if (v16 == ((v6 >> 4) & 1))
        {
          if (!v16
            || (partialRepetitionConfidence = self->_partialRepetitionConfidence,
                objc_msgSend(v4, "partialRepetitionConfidence"),
                partialRepetitionConfidence == v18))
          {
            v19 = 1;
            goto LABEL_22;
          }
        }
      }
    }
  }
LABEL_21:
  v19 = 0;
LABEL_22:

  return v19;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  float noRepetitionConfidence;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  float fullRepetitionConfidence;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float partialRepetitionConfidence;
  double v18;
  long double v19;
  double v20;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_repetitionType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_ruleType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  noRepetitionConfidence = self->_noRepetitionConfidence;
  v7 = noRepetitionConfidence;
  if (noRepetitionConfidence < 0.0)
    v7 = -noRepetitionConfidence;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    fullRepetitionConfidence = self->_fullRepetitionConfidence;
    v13 = fullRepetitionConfidence;
    if (fullRepetitionConfidence < 0.0)
      v13 = -fullRepetitionConfidence;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 0x10) != 0)
  {
    partialRepetitionConfidence = self->_partialRepetitionConfidence;
    v18 = partialRepetitionConfidence;
    if (partialRepetitionConfidence < 0.0)
      v18 = -partialRepetitionConfidence;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v5 ^ v4 ^ v10 ^ v11 ^ v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaMARRSRepetitionDetectionEvaluated fullRepetitionConfidence](self, "fullRepetitionConfidence");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("fullRepetitionConfidence"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[NLXSchemaMARRSRepetitionDetectionEvaluated noRepetitionConfidence](self, "noRepetitionConfidence");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("noRepetitionConfidence"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_16:
    v15 = -[NLXSchemaMARRSRepetitionDetectionEvaluated repetitionType](self, "repetitionType") - 1;
    if (v15 > 2)
      v16 = CFSTR("MARRSREPETITIONTYPE_UNKNOWN");
    else
      v16 = off_1E5632068[v15];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("repetitionType"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_12;
    goto LABEL_6;
  }
LABEL_15:
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[NLXSchemaMARRSRepetitionDetectionEvaluated partialRepetitionConfidence](self, "partialRepetitionConfidence");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("partialRepetitionConfidence"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_16;
LABEL_5:
  if ((has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v5 = -[NLXSchemaMARRSRepetitionDetectionEvaluated ruleType](self, "ruleType");
  v6 = CFSTR("MARRSREPETITIONDETECTIONRULETYPE_OTHER");
  if (v5 == 1)
    v6 = CFSTR("MARRSREPETITIONDETECTIONRULETYPE_SKIPPED");
  if (v5 == 2)
    v7 = CFSTR("MARRSREPETITIONDETECTIONRULETYPE_TIME_GAP_EXCEEDED");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ruleType"));
LABEL_12:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaMARRSRepetitionDetectionEvaluated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaMARRSRepetitionDetectionEvaluated)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaMARRSRepetitionDetectionEvaluated *v5;
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
    self = -[NLXSchemaMARRSRepetitionDetectionEvaluated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaMARRSRepetitionDetectionEvaluated)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaMARRSRepetitionDetectionEvaluated *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NLXSchemaMARRSRepetitionDetectionEvaluated *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaMARRSRepetitionDetectionEvaluated;
  v5 = -[NLXSchemaMARRSRepetitionDetectionEvaluated init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repetitionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setRepetitionType:](v5, "setRepetitionType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ruleType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setRuleType:](v5, "setRuleType:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("noRepetitionConfidence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setNoRepetitionConfidence:](v5, "setNoRepetitionConfidence:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullRepetitionConfidence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setFullRepetitionConfidence:](v5, "setFullRepetitionConfidence:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("partialRepetitionConfidence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[NLXSchemaMARRSRepetitionDetectionEvaluated setPartialRepetitionConfidence:](v5, "setPartialRepetitionConfidence:");
    }
    v11 = v5;

  }
  return v5;
}

- (int)repetitionType
{
  return self->_repetitionType;
}

- (int)ruleType
{
  return self->_ruleType;
}

- (float)noRepetitionConfidence
{
  return self->_noRepetitionConfidence;
}

- (float)fullRepetitionConfidence
{
  return self->_fullRepetitionConfidence;
}

- (float)partialRepetitionConfidence
{
  return self->_partialRepetitionConfidence;
}

@end
