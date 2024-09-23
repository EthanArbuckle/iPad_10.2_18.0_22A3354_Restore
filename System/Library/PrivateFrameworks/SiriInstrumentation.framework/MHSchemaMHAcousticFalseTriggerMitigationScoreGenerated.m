@implementation MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setScore:](self, "setScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setAudioDurationInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioDurationInNs = a3;
}

- (BOOL)hasAudioDurationInNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAudioDurationInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteAudioDurationInNs
{
  -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setAudioDurationInNs:](self, "setAudioDurationInNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setThreshold:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_threshold = a3;
}

- (BOOL)hasThreshold
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setThreshold:](self, "setThreshold:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHAcousticFalseTriggerMitigationScoreGeneratedReadFrom(self, (uint64_t)a3, v3);
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
    PBDataWriterWriteUint64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $37A4565187484B8D455B7FFABF87F840 has;
  unsigned int v6;
  float score;
  float v8;
  int v9;
  unint64_t audioDurationInNs;
  int v11;
  float threshold;
  float v13;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  has = self->_has;
  v6 = v4[28];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_13;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    score = self->_score;
    objc_msgSend(v4, "score");
    if (score != v8)
      goto LABEL_13;
    has = self->_has;
    v6 = v4[28];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      audioDurationInNs = self->_audioDurationInNs;
      if (audioDurationInNs != objc_msgSend(v4, "audioDurationInNs"))
        goto LABEL_13;
      has = self->_has;
      v6 = v4[28];
    }
    v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (!v11 || (threshold = self->_threshold, objc_msgSend(v4, "threshold"), threshold == v13))
      {
        v14 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float score;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float threshold;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    score = self->_score;
    v6 = score;
    if (score < 0.0)
      v6 = -score;
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
    v9 = 2654435761u * self->_audioDurationInNs;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_16:
    v14 = 0;
    return v9 ^ v4 ^ v14;
  }
  v9 = 0;
  if ((has & 4) == 0)
    goto LABEL_16;
LABEL_11:
  threshold = self->_threshold;
  v11 = threshold;
  if (threshold < 0.0)
    v11 = -threshold;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
  return v9 ^ v4 ^ v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
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
    -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated score](self, "score");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("score"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated audioDurationInNs](self, "audioDurationInNs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioDurationInNs"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated threshold](self, "threshold");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("threshold"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *v5;
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
    self = -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *v5;
  void *v6;
  void *v7;
  void *v8;
  MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated;
  v5 = -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setScore:](v5, "setScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioDurationInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setAudioDurationInNs:](v5, "setAudioDurationInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("threshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setThreshold:](v5, "setThreshold:");
    }
    v9 = v5;

  }
  return v5;
}

- (float)score
{
  return self->_score;
}

- (unint64_t)audioDurationInNs
{
  return self->_audioDurationInNs;
}

- (float)threshold
{
  return self->_threshold;
}

@end
