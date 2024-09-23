@implementation AWDWiFiMetricsManagerDeviceCount

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeviceCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deviceCount = a3;
}

- (void)setHasDeviceCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimeSinceBoot:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeSinceBoot = a3;
}

- (void)setHasTimeSinceBoot:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeSinceBoot
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDeviceIdentifierMap:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deviceIdentifierMap = a3;
}

- (void)setHasDeviceIdentifierMap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceIdentifierMap
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDeviceInitFailureReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_deviceInitFailureReason = a3;
}

- (void)setHasDeviceInitFailureReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeviceInitFailureReason
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerDeviceCount;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerDeviceCount description](&v3, sel_description), -[AWDWiFiMetricsManagerDeviceCount dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_deviceCount), CFSTR("deviceCount"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_deviceIdentifierMap), CFSTR("deviceIdentifierMap"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeSinceBoot), CFSTR("timeSinceBoot"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_deviceInitFailureReason), CFSTR("deviceInitFailureReason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerDeviceCountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_deviceCount;
  *((_BYTE *)a3 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_timeSinceBoot;
  *((_BYTE *)a3 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return;
LABEL_11:
    *((_DWORD *)a3 + 7) = self->_deviceIdentifierMap;
    *((_BYTE *)a3 + 36) |= 8u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 8) = self->_deviceInitFailureReason;
  *((_BYTE *)a3 + 36) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_timestamp;
    *((_BYTE *)result + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_deviceCount;
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_timeSinceBoot;
  *((_BYTE *)result + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_deviceInitFailureReason;
  *((_BYTE *)result + 36) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 7) = self->_deviceIdentifierMap;
  *((_BYTE *)result + 36) |= 8u;
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
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_deviceCount != *((_DWORD *)a3 + 6))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_timeSinceBoot != *((double *)a3 + 1))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 0x10) == 0 || self->_deviceInitFailureReason != *((_DWORD *)a3 + 8))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 36) & 0x10) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 36) & 8) == 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 8) == 0 || self->_deviceIdentifierMap != *((_DWORD *)a3 + 7))
        goto LABEL_26;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  uint64_t v5;
  double timeSinceBoot;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_deviceCount;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  timeSinceBoot = self->_timeSinceBoot;
  v7 = -timeSinceBoot;
  if (timeSinceBoot >= 0.0)
    v7 = self->_timeSinceBoot;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 0x10) != 0)
  {
    v11 = 2654435761 * self->_deviceInitFailureReason;
    if ((has & 8) != 0)
      goto LABEL_15;
LABEL_17:
    v12 = 0;
    return v5 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((has & 8) == 0)
    goto LABEL_17;
LABEL_15:
  v12 = 2654435761 * self->_deviceIdentifierMap;
  return v5 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 36);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_deviceCount = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_timeSinceBoot = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 36);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      return;
LABEL_11:
    self->_deviceIdentifierMap = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 8u;
    return;
  }
LABEL_10:
  self->_deviceInitFailureReason = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 36) & 8) != 0)
    goto LABEL_11;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)deviceCount
{
  return self->_deviceCount;
}

- (double)timeSinceBoot
{
  return self->_timeSinceBoot;
}

- (unsigned)deviceIdentifierMap
{
  return self->_deviceIdentifierMap;
}

- (unsigned)deviceInitFailureReason
{
  return self->_deviceInitFailureReason;
}

@end
