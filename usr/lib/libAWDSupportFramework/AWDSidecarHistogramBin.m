@implementation AWDSidecarHistogramBin

- (void)setBinStart:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_binStart = a3;
}

- (void)setHasBinStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBinStart
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBinEnd:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_binEnd = a3;
}

- (void)setHasBinEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBinEnd
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setValue:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSidecarHistogramBin;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSidecarHistogramBin description](&v3, sel_description), -[AWDSidecarHistogramBin dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_binEnd), CFSTR("binEnd"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_binStart), CFSTR("binStart"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_value), CFSTR("value"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSidecarHistogramBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return;
LABEL_7:
      PBDataWriterWriteDoubleField();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_binStart;
    *((_BYTE *)a3 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return;
LABEL_7:
      *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_value;
      *((_BYTE *)a3 + 32) |= 4u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_binEnd;
  *((_BYTE *)a3 + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_binStart;
    *((_BYTE *)result + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_binEnd;
  *((_BYTE *)result + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_value;
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_binStart != *((double *)a3 + 2))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_binEnd != *((double *)a3 + 1))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_value != *((double *)a3 + 3))
        goto LABEL_16;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double binStart;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double binEnd;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double value;
  double v16;
  long double v17;
  double v18;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    binStart = self->_binStart;
    v6 = -binStart;
    if (binStart >= 0.0)
      v6 = self->_binStart;
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
    binEnd = self->_binEnd;
    v11 = -binEnd;
    if (binEnd >= 0.0)
      v11 = self->_binEnd;
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
    value = self->_value;
    v16 = -value;
    if (value >= 0.0)
      v16 = self->_value;
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

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_binStart = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        return;
LABEL_7:
      self->_value = *((double *)a3 + 3);
      *(_BYTE *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_binEnd = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 32) & 4) != 0)
    goto LABEL_7;
}

- (double)binStart
{
  return self->_binStart;
}

- (double)binEnd
{
  return self->_binEnd;
}

- (double)value
{
  return self->_value;
}

@end
