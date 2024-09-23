@implementation AWDWiFiBlacklistingEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiBlacklistingEvent setOui:](self, "setOui:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiBlacklistingEvent;
  -[AWDWiFiBlacklistingEvent dealloc](&v3, sel_dealloc);
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

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setNetworkFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_networkFlags = a3;
}

- (void)setHasNetworkFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNetworkFlags
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSecurityType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBlacklistedReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_blacklistedReason = a3;
}

- (void)setHasBlacklistedReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBlacklistedReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBlacklistedSubreason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_blacklistedSubreason = a3;
}

- (void)setHasBlacklistedSubreason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBlacklistedSubreason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBlacklistedDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_blacklistedDuration = a3;
}

- (void)setHasBlacklistedDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBlacklistedDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUnblacklistingReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_unblacklistingReason = a3;
}

- (void)setHasUnblacklistingReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUnblacklistingReason
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiBlacklistingEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiBlacklistingEvent description](&v3, sel_description), -[AWDWiFiBlacklistingEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSData *oui;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  oui = self->_oui;
  if (oui)
    objc_msgSend(v3, "setObject:forKey:", oui, CFSTR("oui"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_networkFlags), CFSTR("networkFlags"));
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_blacklistedReason), CFSTR("blacklistedReason"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_blacklistedDuration), CFSTR("blacklistedDuration"));
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_blacklistedSubreason), CFSTR("blacklistedSubreason"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_17;
LABEL_10:
  if ((has & 0x40) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_unblacklistingReason), CFSTR("unblacklistingReason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiBlacklistingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_oui)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      return;
LABEL_17:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    goto LABEL_17;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 48) |= 1u;
  }
  if (self->_oui)
    objc_msgSend(a3, "setOui:");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_networkFlags;
    *((_BYTE *)a3 + 48) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 10) = self->_securityType;
  *((_BYTE *)a3 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 5) = self->_blacklistedReason;
  *((_BYTE *)a3 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 6) = self->_blacklistedSubreason;
  *((_BYTE *)a3 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      return;
    goto LABEL_11;
  }
LABEL_17:
  *((_DWORD *)a3 + 4) = self->_blacklistedDuration;
  *((_BYTE *)a3 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return;
LABEL_11:
  *((_DWORD *)a3 + 11) = self->_unblacklistingReason;
  *((_BYTE *)a3 + 48) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[NSData copyWithZone:](self->_oui, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_networkFlags;
    *(_BYTE *)(v6 + 48) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 40) = self->_securityType;
  *(_BYTE *)(v6 + 48) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v6 + 20) = self->_blacklistedReason;
  *(_BYTE *)(v6 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
LABEL_15:
    *(_DWORD *)(v6 + 16) = self->_blacklistedDuration;
    *(_BYTE *)(v6 + 48) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return (id)v6;
    goto LABEL_9;
  }
LABEL_14:
  *(_DWORD *)(v6 + 24) = self->_blacklistedSubreason;
  *(_BYTE *)(v6 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 0x40) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 44) = self->_unblacklistingReason;
    *(_BYTE *)(v6 + 48) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSData *oui;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    oui = self->_oui;
    if ((unint64_t)oui | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSData isEqual:](oui, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 0x10) == 0 || self->_networkFlags != *((_DWORD *)a3 + 7))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 0x10) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 0x20) == 0 || self->_securityType != *((_DWORD *)a3 + 10))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_blacklistedReason != *((_DWORD *)a3 + 5))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_blacklistedSubreason != *((_DWORD *)a3 + 6))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_39;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_blacklistedDuration != *((_DWORD *)a3 + 4))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_39;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 0x40) == 0;
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 0x40) == 0 || self->_unblacklistingReason != *((_DWORD *)a3 + 11))
        goto LABEL_39;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_oui, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_networkFlags;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_securityType;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_blacklistedReason;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_blacklistedSubreason;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_10;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_9:
  v9 = 2654435761 * self->_blacklistedDuration;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_10:
  v10 = 2654435761 * self->_unblacklistingReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDWiFiBlacklistingEvent setOui:](self, "setOui:");
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 0x10) != 0)
  {
    self->_networkFlags = *((_DWORD *)a3 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)a3 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_securityType = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  self->_blacklistedReason = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  self->_blacklistedSubreason = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      return;
    goto LABEL_11;
  }
LABEL_17:
  self->_blacklistedDuration = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 48) & 0x40) == 0)
    return;
LABEL_11:
  self->_unblacklistingReason = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)networkFlags
{
  return self->_networkFlags;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unsigned)blacklistedReason
{
  return self->_blacklistedReason;
}

- (unsigned)blacklistedSubreason
{
  return self->_blacklistedSubreason;
}

- (unsigned)blacklistedDuration
{
  return self->_blacklistedDuration;
}

- (unsigned)unblacklistingReason
{
  return self->_unblacklistingReason;
}

@end
