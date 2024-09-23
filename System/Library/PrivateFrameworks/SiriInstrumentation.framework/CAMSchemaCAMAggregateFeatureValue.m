@implementation CAMSchemaCAMAggregateFeatureValue

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMean:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mean = a3;
}

- (BOOL)hasMean
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMean:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMean
{
  -[CAMSchemaCAMAggregateFeatureValue setMean:](self, "setMean:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setVariance:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_variance = a3;
}

- (BOOL)hasVariance
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVariance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteVariance
{
  -[CAMSchemaCAMAggregateFeatureValue setVariance:](self, "setVariance:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumInteractions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numInteractions = a3;
}

- (BOOL)hasNumInteractions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumInteractions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumInteractions
{
  -[CAMSchemaCAMAggregateFeatureValue setNumInteractions:](self, "setNumInteractions:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMAggregateFeatureValueReadFrom(self, (uint64_t)a3);
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
  $295280EE8465769CEA813BC5362DD9E9 has;
  unsigned int v6;
  double mean;
  double v8;
  int v9;
  double variance;
  double v11;
  int v12;
  unsigned int numInteractions;
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
    mean = self->_mean;
    objc_msgSend(v4, "mean");
    if (mean != v8)
      goto LABEL_14;
    has = self->_has;
    v6 = v4[28];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v9)
  {
    variance = self->_variance;
    objc_msgSend(v4, "variance");
    if (variance == v11)
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
    numInteractions = self->_numInteractions;
    if (numInteractions != objc_msgSend(v4, "numInteractions"))
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
  double mean;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double variance;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    mean = self->_mean;
    v6 = -mean;
    if (mean >= 0.0)
      v6 = self->_mean;
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
    variance = self->_variance;
    v11 = -variance;
    if (variance >= 0.0)
      v11 = self->_variance;
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
    v14 = 2654435761 * self->_numInteractions;
  else
    v14 = 0;
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CAMSchemaCAMAggregateFeatureValue numInteractions](self, "numInteractions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("numInteractions"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMSchemaCAMAggregateFeatureValue mean](self, "mean");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("mean"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMSchemaCAMAggregateFeatureValue variance](self, "variance");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("variance"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CAMSchemaCAMAggregateFeatureValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CAMSchemaCAMAggregateFeatureValue)initWithJSON:(id)a3
{
  void *v4;
  CAMSchemaCAMAggregateFeatureValue *v5;
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
    self = -[CAMSchemaCAMAggregateFeatureValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CAMSchemaCAMAggregateFeatureValue)initWithDictionary:(id)a3
{
  id v4;
  CAMSchemaCAMAggregateFeatureValue *v5;
  void *v6;
  void *v7;
  void *v8;
  CAMSchemaCAMAggregateFeatureValue *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMSchemaCAMAggregateFeatureValue;
  v5 = -[CAMSchemaCAMAggregateFeatureValue init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mean"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[CAMSchemaCAMAggregateFeatureValue setMean:](v5, "setMean:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("variance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[CAMSchemaCAMAggregateFeatureValue setVariance:](v5, "setVariance:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numInteractions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CAMSchemaCAMAggregateFeatureValue setNumInteractions:](v5, "setNumInteractions:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = v5;

  }
  return v5;
}

- (double)mean
{
  return self->_mean;
}

- (double)variance
{
  return self->_variance;
}

- (unsigned)numInteractions
{
  return self->_numInteractions;
}

@end
