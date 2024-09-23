@implementation AWDWiFiMetricHotspotTransportType

- (void)setWifi:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_wifi = a3;
}

- (void)setHasWifi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWifi
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bt = a3;
}

- (void)setHasBt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBt
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUsb:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_usb = a3;
}

- (void)setHasUsb:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUsb
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricHotspotTransportType;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricHotspotTransportType description](&v3, sel_description), -[AWDWiFiMetricHotspotTransportType dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wifi), CFSTR("wifi"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usb), CFSTR("usb"));
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bt), CFSTR("bt"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricHotspotTransportTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      return;
LABEL_9:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_8:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_9;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_wifi;
    *((_BYTE *)a3 + 28) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_bt;
  *((_BYTE *)a3 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      return;
LABEL_9:
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 1u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 5) = self->_usb;
  *((_BYTE *)a3 + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_wifi;
    *((_BYTE *)result + 28) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_bt;
  *((_BYTE *)result + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_usb;
  *((_BYTE *)result + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 1) = self->_timestamp;
  *((_BYTE *)result + 28) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 8) == 0 || self->_wifi != *((_DWORD *)a3 + 6))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 28) & 8) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_bt != *((_DWORD *)a3 + 4))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 28) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 4) == 0 || self->_usb != *((_DWORD *)a3 + 5))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 28) & 4) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_21;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761 * self->_wifi;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_bt;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_usb;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761u * self->_timestamp;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 8) != 0)
  {
    self->_wifi = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 8u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bt = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0)
      return;
LABEL_9:
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    return;
  }
LABEL_8:
  self->_usb = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 28) & 1) != 0)
    goto LABEL_9;
}

- (unsigned)wifi
{
  return self->_wifi;
}

- (unsigned)bt
{
  return self->_bt;
}

- (unsigned)usb
{
  return self->_usb;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
