@implementation AWDWiFiMetricActiveProbeStats

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

- (void)setMinRTTSmallPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_minRTTSmallPktSize = a3;
}

- (void)setHasMinRTTSmallPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMinRTTSmallPktSize
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMaxRTTSmallPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_maxRTTSmallPktSize = a3;
}

- (void)setHasMaxRTTSmallPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMaxRTTSmallPktSize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAvgRTTSmallPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_avgRTTSmallPktSize = a3;
}

- (void)setHasAvgRTTSmallPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAvgRTTSmallPktSize
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPerSmallPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_perSmallPktSize = a3;
}

- (void)setHasPerSmallPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasPerSmallPktSize
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setMinRTTMediumPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_minRTTMediumPktSize = a3;
}

- (void)setHasMinRTTMediumPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMinRTTMediumPktSize
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMaxRTTMediumPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_maxRTTMediumPktSize = a3;
}

- (void)setHasMaxRTTMediumPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMaxRTTMediumPktSize
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAvgRTTMediumPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_avgRTTMediumPktSize = a3;
}

- (void)setHasAvgRTTMediumPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAvgRTTMediumPktSize
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPerMediumPktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_perMediumPktSize = a3;
}

- (void)setHasPerMediumPktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasPerMediumPktSize
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setMinRTTLargePktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_minRTTLargePktSize = a3;
}

- (void)setHasMinRTTLargePktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMinRTTLargePktSize
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMaxRTTLargePktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maxRTTLargePktSize = a3;
}

- (void)setHasMaxRTTLargePktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaxRTTLargePktSize
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAvgRTTLargePktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_avgRTTLargePktSize = a3;
}

- (void)setHasAvgRTTLargePktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAvgRTTLargePktSize
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPerLargePktSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_perLargePktSize = a3;
}

- (void)setHasPerLargePktSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPerLargePktSize
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricActiveProbeStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricActiveProbeStats description](&v3, sel_description), -[AWDWiFiMetricActiveProbeStats dictionaryRepresentation](self, "dictionaryRepresentation"));
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
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_minRTTSmallPktSize), CFSTR("minRTTSmallPktSize"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxRTTSmallPktSize), CFSTR("maxRTTSmallPktSize"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgRTTSmallPktSize), CFSTR("avgRTTSmallPktSize"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_perSmallPktSize), CFSTR("perSmallPktSize"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_minRTTMediumPktSize), CFSTR("minRTTMediumPktSize"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxRTTMediumPktSize), CFSTR("maxRTTMediumPktSize"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgRTTMediumPktSize), CFSTR("avgRTTMediumPktSize"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_perMediumPktSize), CFSTR("perMediumPktSize"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_minRTTLargePktSize), CFSTR("minRTTLargePktSize"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_avgRTTLargePktSize), CFSTR("avgRTTLargePktSize"));
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_maxRTTLargePktSize), CFSTR("maxRTTLargePktSize"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x400) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_perLargePktSize), CFSTR("perLargePktSize"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricActiveProbeStatsReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return;
LABEL_27:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    goto LABEL_27;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_minRTTSmallPktSize;
  *((_WORD *)a3 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 9) = self->_maxRTTSmallPktSize;
  *((_WORD *)a3 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 6) = self->_avgRTTSmallPktSize;
  *((_WORD *)a3 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 15) = self->_perSmallPktSize;
  *((_WORD *)a3 + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 11) = self->_minRTTMediumPktSize;
  *((_WORD *)a3 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 8) = self->_maxRTTMediumPktSize;
  *((_WORD *)a3 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 5) = self->_avgRTTMediumPktSize;
  *((_WORD *)a3 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 14) = self->_perMediumPktSize;
  *((_WORD *)a3 + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 10) = self->_minRTTLargePktSize;
  *((_WORD *)a3 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 7) = self->_maxRTTLargePktSize;
  *((_WORD *)a3 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return;
LABEL_27:
    *((_DWORD *)a3 + 13) = self->_perLargePktSize;
    *((_WORD *)a3 + 32) |= 0x400u;
    return;
  }
LABEL_26:
  *((_DWORD *)a3 + 4) = self->_avgRTTLargePktSize;
  *((_WORD *)a3 + 32) |= 2u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    goto LABEL_27;
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
    *((_WORD *)result + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 12) = self->_minRTTSmallPktSize;
  *((_WORD *)result + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 9) = self->_maxRTTSmallPktSize;
  *((_WORD *)result + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_avgRTTSmallPktSize;
  *((_WORD *)result + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 15) = self->_perSmallPktSize;
  *((_WORD *)result + 32) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 11) = self->_minRTTMediumPktSize;
  *((_WORD *)result + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 8) = self->_maxRTTMediumPktSize;
  *((_WORD *)result + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_avgRTTMediumPktSize;
  *((_WORD *)result + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 14) = self->_perMediumPktSize;
  *((_WORD *)result + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 10) = self->_minRTTLargePktSize;
  *((_WORD *)result + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 7) = self->_maxRTTLargePktSize;
  *((_WORD *)result + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return result;
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 4) = self->_avgRTTLargePktSize;
  *((_WORD *)result + 32) |= 2u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    return result;
LABEL_14:
  *((_DWORD *)result + 13) = self->_perLargePktSize;
  *((_WORD *)result + 32) |= 0x400u;
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
    v7 = *((_WORD *)a3 + 32);
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_66;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_66:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x200) == 0 || self->_minRTTSmallPktSize != *((_DWORD *)a3 + 12))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 32) & 0x200) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_maxRTTSmallPktSize != *((_DWORD *)a3 + 9))
        goto LABEL_66;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_avgRTTSmallPktSize != *((_DWORD *)a3 + 6))
        goto LABEL_66;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x1000) == 0 || self->_perSmallPktSize != *((_DWORD *)a3 + 15))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 32) & 0x1000) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x100) == 0 || self->_minRTTMediumPktSize != *((_DWORD *)a3 + 11))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 32) & 0x100) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_maxRTTMediumPktSize != *((_DWORD *)a3 + 8))
        goto LABEL_66;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_avgRTTMediumPktSize != *((_DWORD *)a3 + 5))
        goto LABEL_66;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x800) == 0 || self->_perMediumPktSize != *((_DWORD *)a3 + 14))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 32) & 0x800) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_minRTTLargePktSize != *((_DWORD *)a3 + 10))
        goto LABEL_66;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_maxRTTLargePktSize != *((_DWORD *)a3 + 7))
        goto LABEL_66;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_avgRTTLargePktSize != *((_DWORD *)a3 + 4))
        goto LABEL_66;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_66;
    }
    LOBYTE(v5) = (v7 & 0x400) == 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 32) & 0x400) == 0 || self->_perLargePktSize != *((_DWORD *)a3 + 13))
        goto LABEL_66;
      LOBYTE(v5) = 1;
    }
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_minRTTSmallPktSize;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_maxRTTSmallPktSize;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_avgRTTSmallPktSize;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_perSmallPktSize;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_minRTTMediumPktSize;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_maxRTTMediumPktSize;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_avgRTTMediumPktSize;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_perMediumPktSize;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_minRTTLargePktSize;
    if ((has & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_maxRTTLargePktSize;
    if ((has & 2) != 0)
      goto LABEL_13;
LABEL_26:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_14;
LABEL_27:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  v13 = 0;
  if ((has & 2) == 0)
    goto LABEL_26;
LABEL_13:
  v14 = 2654435761 * self->_avgRTTLargePktSize;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_27;
LABEL_14:
  v15 = 2654435761 * self->_perLargePktSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    v3 = *((_WORD *)a3 + 32);
    if ((v3 & 0x200) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)a3 + 32) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_minRTTSmallPktSize = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_maxRTTSmallPktSize = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_avgRTTSmallPktSize = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x1000) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_perSmallPktSize = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x1000u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_minRTTMediumPktSize = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_maxRTTMediumPktSize = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_avgRTTMediumPktSize = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x800) == 0)
  {
LABEL_10:
    if ((v3 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_perMediumPktSize = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x80) == 0)
  {
LABEL_11:
    if ((v3 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_minRTTLargePktSize = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 0x10) == 0)
  {
LABEL_12:
    if ((v3 & 2) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_maxRTTLargePktSize = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 32);
  if ((v3 & 2) == 0)
  {
LABEL_13:
    if ((v3 & 0x400) == 0)
      return;
LABEL_27:
    self->_perLargePktSize = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x400u;
    return;
  }
LABEL_26:
  self->_avgRTTLargePktSize = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 32) & 0x400) != 0)
    goto LABEL_27;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)minRTTSmallPktSize
{
  return self->_minRTTSmallPktSize;
}

- (unsigned)maxRTTSmallPktSize
{
  return self->_maxRTTSmallPktSize;
}

- (unsigned)avgRTTSmallPktSize
{
  return self->_avgRTTSmallPktSize;
}

- (unsigned)perSmallPktSize
{
  return self->_perSmallPktSize;
}

- (unsigned)minRTTMediumPktSize
{
  return self->_minRTTMediumPktSize;
}

- (unsigned)maxRTTMediumPktSize
{
  return self->_maxRTTMediumPktSize;
}

- (unsigned)avgRTTMediumPktSize
{
  return self->_avgRTTMediumPktSize;
}

- (unsigned)perMediumPktSize
{
  return self->_perMediumPktSize;
}

- (unsigned)minRTTLargePktSize
{
  return self->_minRTTLargePktSize;
}

- (unsigned)maxRTTLargePktSize
{
  return self->_maxRTTLargePktSize;
}

- (unsigned)avgRTTLargePktSize
{
  return self->_avgRTTLargePktSize;
}

- (unsigned)perLargePktSize
{
  return self->_perLargePktSize;
}

@end
