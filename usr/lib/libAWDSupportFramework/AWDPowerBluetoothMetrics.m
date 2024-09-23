@implementation AWDPowerBluetoothMetrics

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setBtConnectedDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_btConnectedDuration = a3;
}

- (void)setHasBtConnectedDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBtConnectedDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBtTxDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_btTxDuration = a3;
}

- (void)setHasBtTxDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasBtTxDuration
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setBtRxDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_btRxDuration = a3;
}

- (void)setHasBtRxDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBtRxDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBtSleepDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_btSleepDuration = a3;
}

- (void)setHasBtSleepDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBtSleepDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBtOthersDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_btOthersDuration = a3;
}

- (void)setHasBtOthersDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBtOthersDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBtTotalPowerMicroWatt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_btTotalPowerMicroWatt = a3;
}

- (void)setHasBtTotalPowerMicroWatt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasBtTotalPowerMicroWatt
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBluetoothMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerBluetoothMetrics description](&v3, sel_description), -[AWDPowerBluetoothMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_btConnectedDuration), CFSTR("btConnectedDuration"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_btTxDuration), CFSTR("btTxDuration"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_btRxDuration), CFSTR("btRxDuration"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_btOthersDuration), CFSTR("btOthersDuration"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_btSleepDuration), CFSTR("btSleepDuration"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x20) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_btTotalPowerMicroWatt), CFSTR("btTotalPowerMicroWatt"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBluetoothMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_btConnectedDuration;
  *((_BYTE *)a3 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 9) = self->_btTxDuration;
  *((_BYTE *)a3 + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 6) = self->_btRxDuration;
  *((_BYTE *)a3 + 40) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 7) = self->_btSleepDuration;
  *((_BYTE *)a3 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      return;
LABEL_15:
    *((_DWORD *)a3 + 8) = self->_btTotalPowerMicroWatt;
    *((_BYTE *)a3 + 40) |= 0x20u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_btOthersDuration;
  *((_BYTE *)a3 + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 40) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_btConnectedDuration;
  *((_BYTE *)result + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 9) = self->_btTxDuration;
  *((_BYTE *)result + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 6) = self->_btRxDuration;
  *((_BYTE *)result + 40) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 7) = self->_btSleepDuration;
  *((_BYTE *)result + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_btOthersDuration;
  *((_BYTE *)result + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 8) = self->_btTotalPowerMicroWatt;
  *((_BYTE *)result + 40) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_btConnectedDuration != *((_DWORD *)a3 + 4))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x40) == 0 || self->_btTxDuration != *((_DWORD *)a3 + 9))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_btRxDuration != *((_DWORD *)a3 + 6))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 8) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x10) == 0 || self->_btSleepDuration != *((_DWORD *)a3 + 7))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_btOthersDuration != *((_DWORD *)a3 + 5))
        goto LABEL_36;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 0x20) == 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 0x20) == 0 || self->_btTotalPowerMicroWatt != *((_DWORD *)a3 + 8))
        goto LABEL_36;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_btConnectedDuration;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_btTxDuration;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_btRxDuration;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_btSleepDuration;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_btOthersDuration;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_btTotalPowerMicroWatt;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 40);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_btConnectedDuration = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_btTxDuration = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  self->_btRxDuration = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_btSleepDuration = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 40);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      return;
LABEL_15:
    self->_btTotalPowerMicroWatt = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 0x20u;
    return;
  }
LABEL_14:
  self->_btOthersDuration = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 40) & 0x20) != 0)
    goto LABEL_15;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)btConnectedDuration
{
  return self->_btConnectedDuration;
}

- (unsigned)btTxDuration
{
  return self->_btTxDuration;
}

- (unsigned)btRxDuration
{
  return self->_btRxDuration;
}

- (unsigned)btSleepDuration
{
  return self->_btSleepDuration;
}

- (unsigned)btOthersDuration
{
  return self->_btOthersDuration;
}

- (unsigned)btTotalPowerMicroWatt
{
  return self->_btTotalPowerMicroWatt;
}

@end
