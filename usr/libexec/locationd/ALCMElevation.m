@implementation ALCMElevation

- (void)setElevationDescended:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_elevationDescended = a3;
}

- (void)setHasElevationDescended:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElevationDescended
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)gradeType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_gradeType;
  else
    return 0;
}

- (void)setGradeType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_gradeType = a3;
}

- (void)setHasGradeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGradeType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)gradeTypeAsString:(int)a3
{
  if (a3 >= 4)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_10213D7E8[a3];
}

- (int)StringAsGradeType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Uphill")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Flat")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Downhill")))
    return 3;
  return 0;
}

- (void)setVerticalSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_verticalSpeed = a3;
}

- (void)setHasVerticalSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVerticalSpeed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)rawGradeType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_rawGradeType;
  else
    return 0;
}

- (void)setRawGradeType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rawGradeType = a3;
}

- (void)setHasRawGradeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRawGradeType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)rawGradeTypeAsString:(int)a3
{
  if (a3 >= 4)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_10213D7E8[a3];
}

- (int)StringAsRawGradeType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Uphill")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Flat")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Downhill")))
    return 3;
  return 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (!a3)
    return CFSTR("Phone");
  if (a3 == 1)
    return CFSTR("Watch");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsSource:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Phone")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("Watch"));
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCMElevation;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCMElevation description](&v3, "description"), -[ALCMElevation dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;
  char has;
  uint64_t gradeType;
  __CFString *v7;
  uint64_t rawGradeType;
  __CFString *v9;
  int source;
  const __CFString *v11;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended), CFSTR("elevationAscended"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationDescended), CFSTR("elevationDescended"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  gradeType = self->_gradeType;
  if (gradeType >= 4)
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_gradeType);
  else
    v7 = off_10213D7E8[gradeType];
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("gradeType"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(float *)&v4 = self->_verticalSpeed;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("verticalSpeed"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return v3;
    goto LABEL_17;
  }
LABEL_13:
  rawGradeType = self->_rawGradeType;
  if (rawGradeType >= 4)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rawGradeType);
  else
    v9 = off_10213D7E8[rawGradeType];
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rawGradeType"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_17:
    source = self->_source;
    if (source)
    {
      if (source == 1)
        v11 = CFSTR("Watch");
      else
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
    }
    else
    {
      v11 = CFSTR("Phone");
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("source"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100496E28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteUint32Field(a3, self->_elevationAscended, 1);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_elevationDescended, 2);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_gradeType, 3);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteFloatField(a3, 4, self->_verticalSpeed);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return;
LABEL_11:
    PBDataWriterWriteInt32Field(a3, self->_source, 6);
    return;
  }
LABEL_10:
  PBDataWriterWriteInt32Field(a3, self->_rawGradeType, 5);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_elevationDescended;
    *((_BYTE *)a3 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_gradeType;
  *((_BYTE *)a3 + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 7) = LODWORD(self->_verticalSpeed);
  *((_BYTE *)a3 + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return;
LABEL_11:
    *((_DWORD *)a3 + 6) = self->_source;
    *((_BYTE *)a3 + 32) |= 8u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_rawGradeType;
  *((_BYTE *)a3 + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_elevationAscended;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 3) = self->_elevationDescended;
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_gradeType;
  *((_BYTE *)result + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 7) = LODWORD(self->_verticalSpeed);
  *((_BYTE *)result + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_rawGradeType;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 6) = self->_source;
  *((_BYTE *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2))
    {
LABEL_27:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_elevationDescended != *((_DWORD *)a3 + 3))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_27;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_gradeType != *((_DWORD *)a3 + 4))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
      goto LABEL_27;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 0x10) == 0 || self->_verticalSpeed != *((float *)a3 + 7))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 32) & 0x10) != 0)
    {
      goto LABEL_27;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_rawGradeType != *((_DWORD *)a3 + 5))
        goto LABEL_27;
    }
    else if ((*((_BYTE *)a3 + 32) & 4) != 0)
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 8) == 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 8) == 0 || self->_source != *((_DWORD *)a3 + 6))
        goto LABEL_27;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  unsigned int elevationAscended;
  unint64_t v7;
  float verticalSpeed;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;

  has = (char)self->_has;
  if ((has & 1) != 0)
    v4 = 2654435761 * self->_elevationDescended;
  else
    v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_gradeType;
  else
    v5 = 0;
  elevationAscended = self->_elevationAscended;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    verticalSpeed = self->_verticalSpeed;
    v9 = -verticalSpeed;
    if (verticalSpeed >= 0.0)
      v9 = self->_verticalSpeed;
    v10 = floorf(v9 + 0.5);
    v11 = (float)(v9 - v10) * 1.8447e19;
    v7 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabsf(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 4) != 0)
  {
    v12 = 2654435761 * self->_rawGradeType;
    if ((has & 8) != 0)
      goto LABEL_17;
LABEL_19:
    v13 = 0;
    return v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ (2654435761 * elevationAscended);
  }
  v12 = 0;
  if ((has & 8) == 0)
    goto LABEL_19;
LABEL_17:
  v13 = 2654435761 * self->_source;
  return v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ (2654435761 * elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_elevationAscended = *((_DWORD *)a3 + 2);
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 1) != 0)
  {
    self->_elevationDescended = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_gradeType = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_verticalSpeed = *((float *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      return;
LABEL_11:
    self->_source = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 8u;
    return;
  }
LABEL_10:
  self->_rawGradeType = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 32) & 8) != 0)
    goto LABEL_11;
}

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (void)setElevationAscended:(unsigned int)a3
{
  self->_elevationAscended = a3;
}

- (unsigned)elevationDescended
{
  return self->_elevationDescended;
}

- (float)verticalSpeed
{
  return self->_verticalSpeed;
}

@end
