@implementation IHSchemaIHScore

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
  -[IHSchemaIHScore setScore:](self, "setScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setUpperBoundary:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_upperBoundary = a3;
}

- (BOOL)hasUpperBoundary
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUpperBoundary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteUpperBoundary
{
  double v2;

  LODWORD(v2) = 0;
  -[IHSchemaIHScore setUpperBoundary:](self, "setUpperBoundary:", v2);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setLowerBoundary:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lowerBoundary = a3;
}

- (BOOL)hasLowerBoundary
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLowerBoundary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteLowerBoundary
{
  double v2;

  LODWORD(v2) = 0;
  -[IHSchemaIHScore setLowerBoundary:](self, "setLowerBoundary:", v2);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return IHSchemaIHScoreReadFrom(self, (uint64_t)a3, v3);
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
    PBDataWriterWriteFloatField();
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
  $0267D0C0F3DDF09DCFE80E504D732A88 has;
  unsigned int v6;
  float score;
  float v8;
  int v9;
  float upperBoundary;
  float v11;
  int v12;
  float lowerBoundary;
  float v14;
  BOOL v15;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_13;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    score = self->_score;
    objc_msgSend(v4, "score");
    if (score != v8)
      goto LABEL_13;
    has = self->_has;
    v6 = v4[20];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      upperBoundary = self->_upperBoundary;
      objc_msgSend(v4, "upperBoundary");
      if (upperBoundary != v11)
        goto LABEL_13;
      has = self->_has;
      v6 = v4[20];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (!v12 || (lowerBoundary = self->_lowerBoundary, objc_msgSend(v4, "lowerBoundary"), lowerBoundary == v14))
      {
        v15 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  v15 = 0;
LABEL_14:

  return v15;
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
  float upperBoundary;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float lowerBoundary;
  double v16;
  long double v17;
  double v18;

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
    upperBoundary = self->_upperBoundary;
    v11 = upperBoundary;
    if (upperBoundary < 0.0)
      v11 = -upperBoundary;
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
    lowerBoundary = self->_lowerBoundary;
    v16 = lowerBoundary;
    if (lowerBoundary < 0.0)
      v16 = -lowerBoundary;
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
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[IHSchemaIHScore score](self, "score");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("score"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[IHSchemaIHScore lowerBoundary](self, "lowerBoundary");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("lowerBoundary"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[IHSchemaIHScore upperBoundary](self, "upperBoundary");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("upperBoundary"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IHSchemaIHScore dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IHSchemaIHScore)initWithJSON:(id)a3
{
  void *v4;
  IHSchemaIHScore *v5;
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
    self = -[IHSchemaIHScore initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IHSchemaIHScore)initWithDictionary:(id)a3
{
  id v4;
  IHSchemaIHScore *v5;
  void *v6;
  void *v7;
  void *v8;
  IHSchemaIHScore *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IHSchemaIHScore;
  v5 = -[IHSchemaIHScore init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[IHSchemaIHScore setScore:](v5, "setScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("upperBoundary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[IHSchemaIHScore setUpperBoundary:](v5, "setUpperBoundary:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lowerBoundary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[IHSchemaIHScore setLowerBoundary:](v5, "setLowerBoundary:");
    }
    v9 = v5;

  }
  return v5;
}

- (float)score
{
  return self->_score;
}

- (float)upperBoundary
{
  return self->_upperBoundary;
}

- (float)lowerBoundary
{
  return self->_lowerBoundary;
}

@end
