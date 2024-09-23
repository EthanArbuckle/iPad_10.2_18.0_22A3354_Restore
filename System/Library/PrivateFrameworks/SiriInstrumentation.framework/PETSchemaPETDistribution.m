@implementation PETSchemaPETDistribution

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setMin:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_min = a3;
}

- (BOOL)hasMin
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMin:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteMin
{
  -[PETSchemaPETDistribution setMin:](self, "setMin:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setMax:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_max = a3;
}

- (BOOL)hasMax
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMax:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteMax
{
  -[PETSchemaPETDistribution setMax:](self, "setMax:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMean:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mean = a3;
}

- (BOOL)hasMean
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMean:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMean
{
  -[PETSchemaPETDistribution setMean:](self, "setMean:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setVariance:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_variance = a3;
}

- (BOOL)hasVariance
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasVariance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteVariance
{
  -[PETSchemaPETDistribution setVariance:](self, "setVariance:", 0.0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETDistributionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $F24AAE7391E9563EE5E23ADB8AA5D10A has;
  unsigned int v6;
  double min;
  double v8;
  int v9;
  double max;
  double v11;
  int v12;
  double mean;
  double v14;
  int v15;
  double variance;
  double v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_17;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    min = self->_min;
    objc_msgSend(v4, "min");
    if (min != v8)
      goto LABEL_17;
    has = self->_has;
    v6 = v4[40];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      max = self->_max;
      objc_msgSend(v4, "max");
      if (max != v11)
        goto LABEL_17;
      has = self->_has;
      v6 = v4[40];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        mean = self->_mean;
        objc_msgSend(v4, "mean");
        if (mean != v14)
          goto LABEL_17;
        has = self->_has;
        v6 = v4[40];
      }
      v15 = (*(unsigned int *)&has >> 3) & 1;
      if (v15 == ((v6 >> 3) & 1))
      {
        if (!v15 || (variance = self->_variance, objc_msgSend(v4, "variance"), variance == v17))
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
  double min;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double max;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double mean;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double variance;
  double v21;
  long double v22;
  double v23;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    min = self->_min;
    v6 = -min;
    if (min >= 0.0)
      v6 = self->_min;
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
    max = self->_max;
    v11 = -max;
    if (max >= 0.0)
      v11 = self->_max;
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
    mean = self->_mean;
    v16 = -mean;
    if (mean >= 0.0)
      v16 = self->_mean;
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
    variance = self->_variance;
    v21 = -variance;
    if (variance >= 0.0)
      v21 = self->_variance;
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
    -[PETSchemaPETDistribution max](self, "max");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("max"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v12 = (void *)MEMORY[0x1E0CB37E8];
      -[PETSchemaPETDistribution min](self, "min");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("min"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PETSchemaPETDistribution mean](self, "mean");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mean"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PETSchemaPETDistribution variance](self, "variance");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("variance"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PETSchemaPETDistribution dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PETSchemaPETDistribution)initWithJSON:(id)a3
{
  void *v4;
  PETSchemaPETDistribution *v5;
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
    self = -[PETSchemaPETDistribution initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PETSchemaPETDistribution)initWithDictionary:(id)a3
{
  id v4;
  PETSchemaPETDistribution *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PETSchemaPETDistribution *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PETSchemaPETDistribution;
  v5 = -[PETSchemaPETDistribution init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      -[PETSchemaPETDistribution setMin:](v5, "setMin:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("max"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[PETSchemaPETDistribution setMax:](v5, "setMax:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mean"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[PETSchemaPETDistribution setMean:](v5, "setMean:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("variance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      -[PETSchemaPETDistribution setVariance:](v5, "setVariance:");
    }
    v10 = v5;

  }
  return v5;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)mean
{
  return self->_mean;
}

- (double)variance
{
  return self->_variance;
}

@end
