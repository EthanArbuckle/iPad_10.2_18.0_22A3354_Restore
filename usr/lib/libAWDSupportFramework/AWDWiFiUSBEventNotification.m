@implementation AWDWiFiUSBEventNotification

- (void)setUsbAction:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_usbAction = a3;
}

- (void)setHasUsbAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUsbAction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUsbTotal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_usbTotal = a3;
}

- (void)setHasUsbTotal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUsbTotal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDurationSinceUSBEventInSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_durationSinceUSBEventInSeconds = a3;
}

- (void)setHasDurationSinceUSBEventInSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationSinceUSBEventInSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsVendorApple:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isVendorApple = a3;
}

- (void)setHasIsVendorApple:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsVendorApple
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSmartCCADesenseSupported:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_smartCCADesenseSupported = a3;
}

- (void)setHasSmartCCADesenseSupported:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSmartCCADesenseSupported
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiUSBEventNotification;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiUSBEventNotification description](&v3, sel_description), -[AWDWiFiUSBEventNotification dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usbAction), CFSTR("usbAction"));
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
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usbTotal), CFSTR("usbTotal"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVendorApple), CFSTR("isVendorApple"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_durationSinceUSBEventInSeconds), CFSTR("durationSinceUSBEventInSeconds"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_smartCCADesenseSupported), CFSTR("smartCCADesenseSupported"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiUSBEventNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
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
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return;
LABEL_11:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_usbAction;
    *((_BYTE *)a3 + 28) |= 2u;
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
  *((_DWORD *)a3 + 5) = self->_usbTotal;
  *((_BYTE *)a3 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_QWORD *)a3 + 1) = self->_durationSinceUSBEventInSeconds;
  *((_BYTE *)a3 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return;
LABEL_11:
    *((_BYTE *)a3 + 25) = self->_smartCCADesenseSupported;
    *((_BYTE *)a3 + 28) |= 0x10u;
    return;
  }
LABEL_10:
  *((_BYTE *)a3 + 24) = self->_isVendorApple;
  *((_BYTE *)a3 + 28) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
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
    *((_DWORD *)result + 4) = self->_usbAction;
    *((_BYTE *)result + 28) |= 2u;
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
  *((_DWORD *)result + 5) = self->_usbTotal;
  *((_BYTE *)result + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 1) = self->_durationSinceUSBEventInSeconds;
  *((_BYTE *)result + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_BYTE *)result + 24) = self->_isVendorApple;
  *((_BYTE *)result + 28) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_6:
  *((_BYTE *)result + 25) = self->_smartCCADesenseSupported;
  *((_BYTE *)result + 28) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_usbAction != *((_DWORD *)a3 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)a3 + 28) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 4) == 0 || self->_usbTotal != *((_DWORD *)a3 + 5))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)a3 + 28) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_durationSinceUSBEventInSeconds != *((_QWORD *)a3 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)a3 + 28) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 8) != 0)
    {
      if (self->_isVendorApple)
      {
        if (!*((_BYTE *)a3 + 24))
          goto LABEL_27;
        goto LABEL_25;
      }
      if (!*((_BYTE *)a3 + 24))
        goto LABEL_25;
    }
LABEL_27:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 28) & 8) != 0)
    goto LABEL_27;
LABEL_25:
  LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 0x10) == 0)
      goto LABEL_27;
    if (self->_smartCCADesenseSupported)
    {
      if (!*((_BYTE *)a3 + 25))
        goto LABEL_27;
    }
    else if (*((_BYTE *)a3 + 25))
    {
      goto LABEL_27;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_usbAction;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_usbTotal;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_durationSinceUSBEventInSeconds;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_isVendorApple;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_smartCCADesenseSupported;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 2) != 0)
  {
    self->_usbAction = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_usbTotal = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_durationSinceUSBEventInSeconds = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      return;
LABEL_11:
    self->_smartCCADesenseSupported = *((_BYTE *)a3 + 25);
    *(_BYTE *)&self->_has |= 0x10u;
    return;
  }
LABEL_10:
  self->_isVendorApple = *((_BYTE *)a3 + 24);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 28) & 0x10) != 0)
    goto LABEL_11;
}

- (unsigned)usbAction
{
  return self->_usbAction;
}

- (unsigned)usbTotal
{
  return self->_usbTotal;
}

- (unint64_t)durationSinceUSBEventInSeconds
{
  return self->_durationSinceUSBEventInSeconds;
}

- (BOOL)isVendorApple
{
  return self->_isVendorApple;
}

- (BOOL)smartCCADesenseSupported
{
  return self->_smartCCADesenseSupported;
}

@end
