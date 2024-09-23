@implementation AWDCoreRoutineModelAlgorithmInstance

- (void)setType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEfficacy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_efficacy = a3;
}

- (void)setHasEfficacy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEfficacy
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSource:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSource
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setUncertainty:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uncertainty = a3;
}

- (void)setHasUncertainty:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasUncertainty
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDistanceFromTruth:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_distanceFromTruth = a3;
}

- (void)setHasDistanceFromTruth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDistanceFromTruth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAddressComponentMatches:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_addressComponentMatches = a3;
}

- (void)setHasAddressComponentMatches:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAddressComponentMatches
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPreviousType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_previousType = a3;
}

- (void)setHasPreviousType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPreviousType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTruthType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_truthType = a3;
}

- (void)setHasTruthType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTruthType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTruthSource:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_truthSource = a3;
}

- (void)setHasTruthSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTruthSource
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsRotted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isRotted = a3;
}

- (void)setHasIsRotted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsRotted
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelAlgorithmInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineModelAlgorithmInstance description](&v3, sel_description), -[AWDCoreRoutineModelAlgorithmInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_type), CFSTR("type"));
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_efficacy), CFSTR("efficacy"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_source), CFSTR("source"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_uncertainty), CFSTR("uncertainty"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_distanceFromTruth), CFSTR("distanceFromTruth"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_addressComponentMatches), CFSTR("addressComponentMatches"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_previousType), CFSTR("previousType"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_truthSource), CFSTR("truthSource"));
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_truthType), CFSTR("truthType"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x200) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isRotted), CFSTR("isRotted"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineModelAlgorithmInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      return;
LABEL_21:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_type;
    *((_WORD *)a3 + 30) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_efficacy;
  *((_WORD *)a3 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_source;
  *((_WORD *)a3 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_uncertainty;
  *((_WORD *)a3 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_distanceFromTruth;
  *((_WORD *)a3 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 1) = self->_addressComponentMatches;
  *((_WORD *)a3 + 30) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 9) = self->_previousType;
  *((_WORD *)a3 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 12) = self->_truthType;
  *((_WORD *)a3 + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      return;
LABEL_21:
    *((_BYTE *)a3 + 56) = self->_isRotted;
    *((_WORD *)a3 + 30) |= 0x200u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 11) = self->_truthSource;
  *((_WORD *)a3 + 30) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    goto LABEL_21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 13) = self->_type;
    *((_WORD *)result + 30) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_efficacy;
  *((_WORD *)result + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_source;
  *((_WORD *)result + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_uncertainty;
  *((_WORD *)result + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_distanceFromTruth;
  *((_WORD *)result + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 1) = self->_addressComponentMatches;
  *((_WORD *)result + 30) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_previousType;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 12) = self->_truthType;
  *((_WORD *)result + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 11) = self->_truthSource;
  *((_WORD *)result + 30) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    return result;
LABEL_11:
  *((_BYTE *)result + 56) = self->_isRotted;
  *((_WORD *)result + 30) |= 0x200u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 30);
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x100) == 0 || self->_type != *((_DWORD *)a3 + 13))
        goto LABEL_49;
    }
    else if ((*((_WORD *)a3 + 30) & 0x100) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_efficacy != *((_DWORD *)a3 + 8))
        goto LABEL_49;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_source != *((_DWORD *)a3 + 10))
        goto LABEL_49;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_uncertainty != *((double *)a3 + 3))
        goto LABEL_49;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_distanceFromTruth != *((double *)a3 + 2))
        goto LABEL_49;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_addressComponentMatches != *((_QWORD *)a3 + 1))
        goto LABEL_49;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_previousType != *((_DWORD *)a3 + 9))
        goto LABEL_49;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_truthType != *((_DWORD *)a3 + 12))
        goto LABEL_49;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_truthSource != *((_DWORD *)a3 + 11))
        goto LABEL_49;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_49;
    }
    LOBYTE(v5) = (v7 & 0x200) == 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x200) == 0)
      {
LABEL_49:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_isRotted)
      {
        if (!*((_BYTE *)a3 + 56))
          goto LABEL_49;
      }
      else if (*((_BYTE *)a3 + 56))
      {
        goto LABEL_49;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double uncertainty;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double distanceFromTruth;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4 = 2654435761 * self->_type;
    if ((has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_efficacy;
      if ((has & 0x20) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((has & 4) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_source;
  if ((has & 4) == 0)
    goto LABEL_12;
LABEL_5:
  uncertainty = self->_uncertainty;
  v8 = -uncertainty;
  if (uncertainty >= 0.0)
    v8 = self->_uncertainty;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((has & 2) != 0)
  {
    distanceFromTruth = self->_distanceFromTruth;
    v14 = -distanceFromTruth;
    if (distanceFromTruth >= 0.0)
      v14 = self->_distanceFromTruth;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((has & 1) != 0)
  {
    v17 = 2654435761u * self->_addressComponentMatches;
    if ((has & 0x10) != 0)
    {
LABEL_25:
      v18 = 2654435761 * self->_previousType;
      if ((has & 0x80) != 0)
        goto LABEL_26;
      goto LABEL_31;
    }
  }
  else
  {
    v17 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_25;
  }
  v18 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_26:
    v19 = 2654435761 * self->_truthType;
    if ((has & 0x40) != 0)
      goto LABEL_27;
LABEL_32:
    v20 = 0;
    if ((has & 0x200) != 0)
      goto LABEL_28;
LABEL_33:
    v21 = 0;
    return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_31:
  v19 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_32;
LABEL_27:
  v20 = 2654435761 * self->_truthSource;
  if ((has & 0x200) == 0)
    goto LABEL_33;
LABEL_28:
  v21 = 2654435761 * self->_isRotted;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x100) != 0)
  {
    self->_type = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x100u;
    v3 = *((_WORD *)a3 + 30);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_efficacy = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_source = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_uncertainty = *((double *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_distanceFromTruth = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_addressComponentMatches = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_previousType = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  self->_truthType = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x40) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0)
      return;
LABEL_21:
    self->_isRotted = *((_BYTE *)a3 + 56);
    *(_WORD *)&self->_has |= 0x200u;
    return;
  }
LABEL_20:
  self->_truthSource = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 30) & 0x200) != 0)
    goto LABEL_21;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)efficacy
{
  return self->_efficacy;
}

- (unsigned)source
{
  return self->_source;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)distanceFromTruth
{
  return self->_distanceFromTruth;
}

- (unint64_t)addressComponentMatches
{
  return self->_addressComponentMatches;
}

- (unsigned)previousType
{
  return self->_previousType;
}

- (unsigned)truthType
{
  return self->_truthType;
}

- (unsigned)truthSource
{
  return self->_truthSource;
}

- (BOOL)isRotted
{
  return self->_isRotted;
}

@end
