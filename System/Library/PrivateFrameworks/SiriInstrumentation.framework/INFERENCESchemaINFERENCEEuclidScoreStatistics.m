@implementation INFERENCESchemaINFERENCEEuclidScoreStatistics

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMinScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minScore = a3;
}

- (BOOL)hasMinScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMinScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMinScore
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMinScore:](self, "setMinScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMaxScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxScore = a3;
}

- (BOOL)hasMaxScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMaxScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMaxScore
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMaxScore:](self, "setMaxScore:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMedianScore:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_medianScore = a3;
}

- (BOOL)hasMedianScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMedianScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMedianScore
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMedianScore:](self, "setMedianScore:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setMeanScore:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_meanScore = a3;
}

- (BOOL)hasMeanScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasMeanScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteMeanScore
{
  double v2;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMeanScore:](self, "setMeanScore:", v2);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCEEuclidScoreStatisticsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteFloatField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteFloatField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $5011D2D92284F9F883878F94E33FF1D2 has;
  unsigned int v6;
  float minScore;
  float v8;
  int v9;
  float maxScore;
  float v11;
  int v12;
  float medianScore;
  float v14;
  int v15;
  float meanScore;
  float v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_17;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    minScore = self->_minScore;
    objc_msgSend(v4, "minScore");
    if (minScore != v8)
      goto LABEL_17;
    has = self->_has;
    v6 = v4[24];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      maxScore = self->_maxScore;
      objc_msgSend(v4, "maxScore");
      if (maxScore != v11)
        goto LABEL_17;
      has = self->_has;
      v6 = v4[24];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        medianScore = self->_medianScore;
        objc_msgSend(v4, "medianScore");
        if (medianScore != v14)
          goto LABEL_17;
        has = self->_has;
        v6 = v4[24];
      }
      v15 = (*(unsigned int *)&has >> 3) & 1;
      if (v15 == ((v6 >> 3) & 1))
      {
        if (!v15 || (meanScore = self->_meanScore, objc_msgSend(v4, "meanScore"), meanScore == v17))
        {
          v18 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  v18 = 0;
LABEL_18:

  return v18;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float minScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float maxScore;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float medianScore;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  float meanScore;
  double v21;
  long double v22;
  double v23;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    minScore = self->_minScore;
    v6 = minScore;
    if (minScore < 0.0)
      v6 = -minScore;
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
    maxScore = self->_maxScore;
    v11 = maxScore;
    if (maxScore < 0.0)
      v11 = -maxScore;
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
  {
    medianScore = self->_medianScore;
    v16 = medianScore;
    if (medianScore < 0.0)
      v16 = -medianScore;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 8) != 0)
  {
    meanScore = self->_meanScore;
    v21 = meanScore;
    if (meanScore < 0.0)
      v21 = -meanScore;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19;
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
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEEuclidScoreStatistics maxScore](self, "maxScore");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("maxScore"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics medianScore](self, "medianScore");
      objc_msgSend(v12, "numberWithFloat:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("medianScore"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEEuclidScoreStatistics meanScore](self, "meanScore");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("meanScore"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEEuclidScoreStatistics minScore](self, "minScore");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("minScore"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEEuclidScoreStatistics dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEEuclidScoreStatistics)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEEuclidScoreStatistics *v5;
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
    self = -[INFERENCESchemaINFERENCEEuclidScoreStatistics initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEEuclidScoreStatistics)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEEuclidScoreStatistics *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  INFERENCESchemaINFERENCEEuclidScoreStatistics *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCEEuclidScoreStatistics;
  v5 = -[INFERENCESchemaINFERENCEEuclidScoreStatistics init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMinScore:](v5, "setMinScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMaxScore:](v5, "setMaxScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("medianScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMedianScore:](v5, "setMedianScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("meanScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMeanScore:](v5, "setMeanScore:");
    }
    v10 = v5;

  }
  return v5;
}

- (float)minScore
{
  return self->_minScore;
}

- (float)maxScore
{
  return self->_maxScore;
}

- (float)medianScore
{
  return self->_medianScore;
}

- (float)meanScore
{
  return self->_meanScore;
}

@end
