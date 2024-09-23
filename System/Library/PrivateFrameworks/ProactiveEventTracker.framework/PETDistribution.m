@implementation PETDistribution

- (void)setMin:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_min = a3;
}

- (void)setHasMin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMin
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMax:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMax
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMean:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mean = a3;
}

- (void)setHasMean:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMean
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setVariance:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_variance = a3;
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

- (BOOL)hasVariance
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PETDistribution;
  -[PETDistribution description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETDistribution dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_min);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("min"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mean);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("mean"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_max);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("max"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_variance);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("variance"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PETDistributionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_min;
    *((_BYTE *)v4 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      v4[2] = *(_QWORD *)&self->_mean;
      *((_BYTE *)v4 + 40) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(_QWORD *)&self->_max;
  *((_BYTE *)v4 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    v4[4] = *(_QWORD *)&self->_variance;
    *((_BYTE *)v4 + 40) |= 8u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_min;
    *((_BYTE *)result + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_max;
  *((_BYTE *)result + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_mean;
  *((_BYTE *)result + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_variance;
  *((_BYTE *)result + 40) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_min != *((double *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_max != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_mean != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 40) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_variance != *((double *)v4 + 4))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
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
  if ((has & 4) != 0)
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
  if ((has & 1) != 0)
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
  if ((has & 2) != 0)
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

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_min = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_mean = *((double *)v4 + 2);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 40) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_max = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 8) != 0)
  {
LABEL_5:
    self->_variance = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:

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
