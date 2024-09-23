@implementation CLCKVO2MaxSessionAttributes

- (void)setStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMeanMaxMets:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_meanMaxMets = a3;
}

- (void)setHasMeanMaxMets:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMeanMaxMets
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPrior:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_prior = a3;
}

- (void)setHasPrior:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrior
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHardwareType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_hardwareType = a3;
}

- (void)setHasHardwareType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHardwareType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBetaBlockerUse:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_betaBlockerUse = a3;
}

- (void)setHasBetaBlockerUse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasBetaBlockerUse
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAlgorithmVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_algorithmVersion = a3;
}

- (void)setHasAlgorithmVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAlgorithmVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionAttributes;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLCKVO2MaxSessionAttributes description](&v3, "description"), -[CLCKVO2MaxSessionAttributes dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime), CFSTR("startTime"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_meanMaxMets), CFSTR("meanMaxMets"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_prior), CFSTR("prior"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_betaBlockerUse), CFSTR("betaBlockerUse"));
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hardwareType), CFSTR("hardwareType"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 8) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_algorithmVersion), CFSTR("algorithmVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10108A4E4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1, self->_startTime);
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField(a3, 2, self->_meanMaxMets);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteDoubleField(a3, 3, self->_prior);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field(a3, self->_hardwareType, 4);
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      return;
LABEL_13:
    PBDataWriterWriteInt32Field(a3, self->_algorithmVersion, 6);
    return;
  }
LABEL_12:
  PBDataWriterWriteBOOLField(a3, self->_betaBlockerUse, 5);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_13;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_startTime;
    *((_BYTE *)a3 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_meanMaxMets;
  *((_BYTE *)a3 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_prior;
  *((_BYTE *)a3 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 9) = self->_hardwareType;
  *((_BYTE *)a3 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      return;
LABEL_13:
    *((_DWORD *)a3 + 8) = self->_algorithmVersion;
    *((_BYTE *)a3 + 44) |= 8u;
    return;
  }
LABEL_12:
  *((_BYTE *)a3 + 40) = self->_betaBlockerUse;
  *((_BYTE *)a3 + 44) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_startTime;
    *((_BYTE *)result + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_meanMaxMets;
  *((_BYTE *)result + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_prior;
  *((_BYTE *)result + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 9) = self->_hardwareType;
  *((_BYTE *)result + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)result + 40) = self->_betaBlockerUse;
  *((_BYTE *)result + 44) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 8) = self->_algorithmVersion;
  *((_BYTE *)result + 44) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_startTime != *((double *)a3 + 3))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 44) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_meanMaxMets != *((double *)a3 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_prior != *((double *)a3 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 44) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_hardwareType != *((_DWORD *)a3 + 9))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x20) != 0)
      goto LABEL_34;
    goto LABEL_30;
  }
  if ((*((_BYTE *)a3 + 44) & 0x20) == 0)
    goto LABEL_34;
  if (self->_betaBlockerUse)
  {
    if (!*((_BYTE *)a3 + 40))
      goto LABEL_34;
    goto LABEL_30;
  }
  if (*((_BYTE *)a3 + 40))
  {
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_30:
  LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_algorithmVersion != *((_DWORD *)a3 + 8))
      goto LABEL_34;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double meanMaxMets;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double prior;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    startTime = self->_startTime;
    v6 = -startTime;
    if (startTime >= 0.0)
      v6 = self->_startTime;
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
    meanMaxMets = self->_meanMaxMets;
    v11 = -meanMaxMets;
    if (meanMaxMets >= 0.0)
      v11 = self->_meanMaxMets;
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
    prior = self->_prior;
    v16 = -prior;
    if (prior >= 0.0)
      v16 = self->_prior;
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
  if ((has & 0x10) == 0)
  {
    v19 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_27;
LABEL_30:
    v20 = 0;
    if ((has & 8) != 0)
      goto LABEL_28;
LABEL_31:
    v21 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
  }
  v19 = 2654435761 * self->_hardwareType;
  if ((has & 0x20) == 0)
    goto LABEL_30;
LABEL_27:
  v20 = 2654435761 * self->_betaBlockerUse;
  if ((has & 8) == 0)
    goto LABEL_31;
LABEL_28:
  v21 = 2654435761 * self->_algorithmVersion;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_startTime = *((double *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 44);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_meanMaxMets = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  self->_prior = *((double *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  self->_hardwareType = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0)
      return;
LABEL_13:
    self->_algorithmVersion = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
    return;
  }
LABEL_12:
  self->_betaBlockerUse = *((_BYTE *)a3 + 40);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 44) & 8) != 0)
    goto LABEL_13;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)meanMaxMets
{
  return self->_meanMaxMets;
}

- (double)prior
{
  return self->_prior;
}

- (unsigned)hardwareType
{
  return self->_hardwareType;
}

- (BOOL)betaBlockerUse
{
  return self->_betaBlockerUse;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

@end
