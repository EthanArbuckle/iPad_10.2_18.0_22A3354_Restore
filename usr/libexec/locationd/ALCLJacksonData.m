@implementation ALCLJacksonData

- (void)setLsest:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lsest = a3;
}

- (void)setHasLsest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLsest
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSumest:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sumest = a3;
}

- (void)setHasSumest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSumest
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFPal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fPal = a3;
}

- (void)setHasFPal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFPal
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLJacksonData;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLJacksonData description](&v3, "description"), -[ALCLJacksonData dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nPairs), CFSTR("nPairs"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(float *)&v4 = self->_sumest;
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("sumest"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_4;
  }
  *(float *)&v4 = self->_lsest;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("lsest"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fPal), CFSTR("fPal"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100549368((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteUint32Field(a3, self->_nPairs, 1);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField(a3, 2, self->_lsest);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      PBDataWriterWriteUint32Field(a3, self->_fPal, 4);
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField(a3, 3, self->_sumest);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 4) = self->_nPairs;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = LODWORD(self->_lsest);
    *((_BYTE *)a3 + 24) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      *((_DWORD *)a3 + 2) = self->_fPal;
      *((_BYTE *)a3 + 24) |= 1u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = LODWORD(self->_sumest);
  *((_BYTE *)a3 + 24) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_nPairs;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_lsest);
    *((_BYTE *)result + 24) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = LODWORD(self->_sumest);
  *((_BYTE *)result + 24) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 2) = self->_fPal;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_nPairs != *((_DWORD *)a3 + 4))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_lsest != *((float *)a3 + 3))
        goto LABEL_17;
    }
    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
      goto LABEL_17;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 4) == 0 || self->_sumest != *((float *)a3 + 5))
        goto LABEL_17;
    }
    else if ((*((_BYTE *)a3 + 24) & 4) != 0)
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_fPal != *((_DWORD *)a3 + 2))
        goto LABEL_17;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unsigned int nPairs;
  char has;
  unint64_t v5;
  float lsest;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  float sumest;
  float v12;
  float v13;
  float v14;
  uint64_t v15;

  nPairs = self->_nPairs;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    lsest = self->_lsest;
    v7 = -lsest;
    if (lsest >= 0.0)
      v7 = self->_lsest;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 4) != 0)
  {
    sumest = self->_sumest;
    v12 = -sumest;
    if (sumest >= 0.0)
      v12 = self->_sumest;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 1) != 0)
    v15 = 2654435761 * self->_fPal;
  else
    v15 = 0;
  return v5 ^ v10 ^ v15 ^ (2654435761 * nPairs);
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_nPairs = *((_DWORD *)a3 + 4);
  v3 = *((_BYTE *)a3 + 24);
  if ((v3 & 2) != 0)
  {
    self->_lsest = *((float *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 24);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        return;
LABEL_7:
      self->_fPal = *((_DWORD *)a3 + 2);
      *(_BYTE *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_sumest = *((float *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
    goto LABEL_7;
}

- (unsigned)nPairs
{
  return self->_nPairs;
}

- (void)setNPairs:(unsigned int)a3
{
  self->_nPairs = a3;
}

- (float)lsest
{
  return self->_lsest;
}

- (float)sumest
{
  return self->_sumest;
}

- (unsigned)fPal
{
  return self->_fPal;
}

@end
