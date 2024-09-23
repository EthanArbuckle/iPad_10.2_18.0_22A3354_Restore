@implementation AWDWRMULCACoexStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setULCAHasCoexBand:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_uLCAHasCoexBand = a3;
}

- (void)setHasULCAHasCoexBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasULCAHasCoexBand
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setULCAPriCarULFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_uLCAPriCarULFreq = a3;
}

- (void)setHasULCAPriCarULFreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasULCAPriCarULFreq
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setULCAPriCarDLFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_uLCAPriCarDLFreq = a3;
}

- (void)setHasULCAPriCarDLFreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasULCAPriCarDLFreq
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setULCAPriCarULBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_uLCAPriCarULBW = a3;
}

- (void)setHasULCAPriCarULBW:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasULCAPriCarULBW
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setULCAPriCarDLBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_uLCAPriCarDLBW = a3;
}

- (void)setHasULCAPriCarDLBW:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasULCAPriCarDLBW
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setULCACriCarULFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uLCACriCarULFreq = a3;
}

- (void)setHasULCACriCarULFreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasULCACriCarULFreq
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setULCACriCarDLFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uLCACriCarDLFreq = a3;
}

- (void)setHasULCACriCarDLFreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasULCACriCarDLFreq
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setULCACriCarULBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_uLCACriCarULBW = a3;
}

- (void)setHasULCACriCarULBW:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasULCACriCarULBW
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setULCACriCarDLBW:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_uLCACriCarDLBW = a3;
}

- (void)setHasULCACriCarDLBW:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasULCACriCarDLBW
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWRMULCACoexStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWRMULCACoexStats description](&v3, sel_description), -[AWDWRMULCACoexStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uLCAHasCoexBand), CFSTR("ULCAHasCoexBand"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCAPriCarULFreq), CFSTR("ULCAPriCarULFreq"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCAPriCarDLFreq), CFSTR("ULCAPriCarDLFreq"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCAPriCarULBW), CFSTR("ULCAPriCarULBW"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCAPriCarDLBW), CFSTR("ULCAPriCarDLBW"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCACriCarULFreq), CFSTR("ULCACriCarULFreq"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCACriCarULBW), CFSTR("ULCACriCarULBW"));
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCACriCarDLFreq), CFSTR("ULCACriCarDLFreq"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 2) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_uLCACriCarDLBW), CFSTR("ULCACriCarDLBW"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMULCACoexStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return;
LABEL_21:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_21;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 48) = self->_uLCAHasCoexBand;
  *((_WORD *)a3 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 11) = self->_uLCAPriCarULFreq;
  *((_WORD *)a3 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_uLCAPriCarDLFreq;
  *((_WORD *)a3 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_uLCAPriCarULBW;
  *((_WORD *)a3 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 8) = self->_uLCAPriCarDLBW;
  *((_WORD *)a3 + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 7) = self->_uLCACriCarULFreq;
  *((_WORD *)a3 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 5) = self->_uLCACriCarDLFreq;
  *((_WORD *)a3 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return;
LABEL_21:
    *((_DWORD *)a3 + 4) = self->_uLCACriCarDLBW;
    *((_WORD *)a3 + 26) |= 2u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 6) = self->_uLCACriCarULBW;
  *((_WORD *)a3 + 26) |= 8u;
  if ((*(_WORD *)&self->_has & 2) != 0)
    goto LABEL_21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_WORD *)result + 26) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 48) = self->_uLCAHasCoexBand;
  *((_WORD *)result + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_uLCAPriCarULFreq;
  *((_WORD *)result + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_uLCAPriCarDLFreq;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_uLCAPriCarULBW;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_uLCAPriCarDLBW;
  *((_WORD *)result + 26) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_uLCACriCarULFreq;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 5) = self->_uLCACriCarDLFreq;
  *((_WORD *)result + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      return result;
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_uLCACriCarULBW;
  *((_WORD *)result + 26) |= 8u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_11:
  *((_DWORD *)result + 4) = self->_uLCACriCarDLBW;
  *((_WORD *)result + 26) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 26);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_54;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0)
      goto LABEL_54;
    goto LABEL_15;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0)
    goto LABEL_54;
  if (self->_uLCAHasCoexBand)
  {
    if (!*((_BYTE *)a3 + 48))
      goto LABEL_54;
    goto LABEL_15;
  }
  if (*((_BYTE *)a3 + 48))
  {
LABEL_54:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_uLCAPriCarULFreq != *((_DWORD *)a3 + 11))
      goto LABEL_54;
  }
  else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_uLCAPriCarDLFreq != *((_DWORD *)a3 + 9))
      goto LABEL_54;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_uLCAPriCarULBW != *((_DWORD *)a3 + 10))
      goto LABEL_54;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_uLCAPriCarDLBW != *((_DWORD *)a3 + 8))
      goto LABEL_54;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_uLCACriCarULFreq != *((_DWORD *)a3 + 7))
      goto LABEL_54;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_uLCACriCarDLFreq != *((_DWORD *)a3 + 5))
      goto LABEL_54;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_uLCACriCarULBW != *((_DWORD *)a3 + 6))
      goto LABEL_54;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_54;
  }
  LOBYTE(v5) = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_uLCACriCarDLBW != *((_DWORD *)a3 + 4))
      goto LABEL_54;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_uLCAHasCoexBand;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_uLCAPriCarULFreq;
    if ((has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_uLCAPriCarDLFreq;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_uLCAPriCarULBW;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_uLCAPriCarDLBW;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_uLCACriCarULFreq;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_uLCACriCarDLFreq;
    if ((has & 8) != 0)
      goto LABEL_10;
LABEL_20:
    v11 = 0;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_21:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  v10 = 0;
  if ((has & 8) == 0)
    goto LABEL_20;
LABEL_10:
  v11 = 2654435761 * self->_uLCACriCarULBW;
  if ((has & 2) == 0)
    goto LABEL_21;
LABEL_11:
  v12 = 2654435761 * self->_uLCACriCarDLBW;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v3 = *((_WORD *)a3 + 26);
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_uLCAHasCoexBand = *((_BYTE *)a3 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_uLCAPriCarULFreq = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_uLCAPriCarDLFreq = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_uLCAPriCarULBW = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_uLCAPriCarDLBW = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_uLCACriCarULFreq = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  self->_uLCACriCarDLFreq = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0)
      return;
LABEL_21:
    self->_uLCACriCarDLBW = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_20:
  self->_uLCACriCarULBW = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 26) & 2) != 0)
    goto LABEL_21;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)uLCAHasCoexBand
{
  return self->_uLCAHasCoexBand;
}

- (unsigned)uLCAPriCarULFreq
{
  return self->_uLCAPriCarULFreq;
}

- (unsigned)uLCAPriCarDLFreq
{
  return self->_uLCAPriCarDLFreq;
}

- (unsigned)uLCAPriCarULBW
{
  return self->_uLCAPriCarULBW;
}

- (unsigned)uLCAPriCarDLBW
{
  return self->_uLCAPriCarDLBW;
}

- (unsigned)uLCACriCarULFreq
{
  return self->_uLCACriCarULFreq;
}

- (unsigned)uLCACriCarDLFreq
{
  return self->_uLCACriCarDLFreq;
}

- (unsigned)uLCACriCarULBW
{
  return self->_uLCACriCarULBW;
}

- (unsigned)uLCACriCarDLBW
{
  return self->_uLCACriCarDLBW;
}

@end
