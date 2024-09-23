@implementation AWDWiFiMetricsManagerUserBlacklistEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsManagerUserBlacklistEvent setSsid:](self, "setSsid:", 0);
  -[AWDWiFiMetricsManagerUserBlacklistEvent setApuuid:](self, "setApuuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerUserBlacklistEvent;
  -[AWDWiFiMetricsManagerUserBlacklistEvent dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEventType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSecurityType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTrigger:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTrigger
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBlacklistDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_blacklistDuration = a3;
}

- (void)setHasBlacklistDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBlacklistDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasApuuid
{
  return self->_apuuid != 0;
}

- (void)setDstChange:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dstChange = a3;
}

- (void)setHasDstChange:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDstChange
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMoState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_moState = a3;
}

- (void)setHasMoState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMoState
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setLocState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_locState = a3;
}

- (void)setHasLocState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLocState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerUserBlacklistEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsManagerUserBlacklistEvent description](&v3, sel_description), -[AWDWiFiMetricsManagerUserBlacklistEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *ssid;
  $D65DA98B74D0B4CD8187A7085A798D60 v6;
  NSString *apuuid;
  char v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eventType), CFSTR("eventType"));
  ssid = self->_ssid;
  if (ssid)
    objc_msgSend(v3, "setObject:forKey:", ssid, CFSTR("ssid"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_trigger), CFSTR("trigger"));
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v6 & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_blacklistDuration), CFSTR("blacklistDuration"));
  apuuid = self->_apuuid;
  if (apuuid)
    objc_msgSend(v3, "setObject:forKey:", apuuid, CFSTR("apuuid"));
  v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_16;
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_moState), CFSTR("moState"));
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_17;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dstChange), CFSTR("dstChange"));
  v8 = (char)self->_has;
  if ((v8 & 0x40) != 0)
    goto LABEL_20;
LABEL_16:
  if ((v8 & 0x20) != 0)
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_locState), CFSTR("locState"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerUserBlacklistEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  $D65DA98B74D0B4CD8187A7085A798D60 v5;
  char v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_ssid)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  *(_BYTE *)&v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint64Field();
    *(_BYTE *)&v5 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v5 & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_apuuid)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = (char)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_16:
      if ((v6 & 0x20) == 0)
        return;
LABEL_20:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    goto LABEL_20;
}

- (void)copyTo:(id)a3
{
  char has;
  $D65DA98B74D0B4CD8187A7085A798D60 v6;
  char v7;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 72) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_eventType;
    *((_BYTE *)a3 + 72) |= 0x10u;
  }
  if (self->_ssid)
    objc_msgSend(a3, "setSsid:");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 15) = self->_securityType;
  *((_BYTE *)a3 + 72) |= 0x80u;
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
LABEL_9:
    *((_QWORD *)a3 + 4) = self->_trigger;
    *((_BYTE *)a3 + 72) |= 8u;
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_blacklistDuration;
    *((_BYTE *)a3 + 72) |= 1u;
  }
  if (self->_apuuid)
    objc_msgSend(a3, "setApuuid:");
  v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_dstChange;
    *((_BYTE *)a3 + 72) |= 2u;
    v7 = (char)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_16:
      if ((v7 & 0x20) == 0)
        return;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 14) = self->_moState;
  *((_BYTE *)a3 + 72) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 13) = self->_locState;
    *((_BYTE *)a3 + 72) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  $D65DA98B74D0B4CD8187A7085A798D60 v8;
  char v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 72) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_eventType;
    *(_BYTE *)(v5 + 72) |= 0x10u;
  }

  *(_QWORD *)(v6 + 64) = -[NSString copyWithZone:](self->_ssid, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 60) = self->_securityType;
  *(_BYTE *)(v6 + 72) |= 0x80u;
  *(_BYTE *)&v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) != 0)
  {
LABEL_7:
    *(_QWORD *)(v6 + 32) = self->_trigger;
    *(_BYTE *)(v6 + 72) |= 8u;
    *(_BYTE *)&v8 = self->_has;
  }
LABEL_8:
  if ((*(_BYTE *)&v8 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_blacklistDuration;
    *(_BYTE *)(v6 + 72) |= 1u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_apuuid, "copyWithZone:", a3);
  v9 = (char)self->_has;
  if ((v9 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_12;
LABEL_16:
    *(_DWORD *)(v6 + 56) = self->_moState;
    *(_BYTE *)(v6 + 72) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v6;
    goto LABEL_13;
  }
  *(_QWORD *)(v6 + 16) = self->_dstChange;
  *(_BYTE *)(v6 + 72) |= 2u;
  v9 = (char)self->_has;
  if ((v9 & 0x40) != 0)
    goto LABEL_16;
LABEL_12:
  if ((v9 & 0x20) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 52) = self->_locState;
    *(_BYTE *)(v6 + 72) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *ssid;
  NSString *apuuid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 72) & 4) != 0)
    {
      goto LABEL_47;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x10) == 0 || self->_eventType != *((_DWORD *)a3 + 12))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_47;
    }
    ssid = self->_ssid;
    if ((unint64_t)ssid | *((_QWORD *)a3 + 8))
    {
      v5 = -[NSString isEqual:](ssid, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if (has < 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x80) == 0 || self->_securityType != *((_DWORD *)a3 + 15))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x80) != 0)
    {
LABEL_47:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0 || self->_trigger != *((_QWORD *)a3 + 4))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 72) & 8) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_blacklistDuration != *((_QWORD *)a3 + 1))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 72) & 1) != 0)
    {
      goto LABEL_47;
    }
    apuuid = self->_apuuid;
    if ((unint64_t)apuuid | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSString isEqual:](apuuid, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_dstChange != *((_QWORD *)a3 + 2))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 72) & 2) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x40) == 0 || self->_moState != *((_DWORD *)a3 + 14))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_47;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 72) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x20) == 0 || self->_locState != *((_DWORD *)a3 + 13))
        goto LABEL_47;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_eventType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_ssid, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_8;
LABEL_11:
    v7 = 2654435761u * self->_trigger;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v6 = 2654435761 * self->_securityType;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_11;
LABEL_8:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_9:
    v8 = 2654435761u * self->_blacklistDuration;
    goto LABEL_13;
  }
LABEL_12:
  v8 = 0;
LABEL_13:
  v9 = -[NSString hash](self->_apuuid, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_15;
LABEL_18:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_16;
LABEL_19:
    v12 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761u * self->_dstChange;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_18;
LABEL_15:
  v11 = 2654435761 * self->_moState;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_19;
LABEL_16:
  v12 = 2654435761 * self->_locState;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  int v6;
  char v7;

  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 72);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_eventType = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 8))
    -[AWDWiFiMetricsManagerUserBlacklistEvent setSsid:](self, "setSsid:");
  v6 = *((char *)a3 + 72);
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_securityType = *((_DWORD *)a3 + 15);
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v6) = *((_BYTE *)a3 + 72);
  if ((v6 & 8) != 0)
  {
LABEL_9:
    self->_trigger = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
    LOBYTE(v6) = *((_BYTE *)a3 + 72);
  }
LABEL_10:
  if ((v6 & 1) != 0)
  {
    self->_blacklistDuration = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDWiFiMetricsManagerUserBlacklistEvent setApuuid:](self, "setApuuid:");
  v7 = *((_BYTE *)a3 + 72);
  if ((v7 & 2) != 0)
  {
    self->_dstChange = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)a3 + 72);
    if ((v7 & 0x40) == 0)
    {
LABEL_16:
      if ((v7 & 0x20) == 0)
        return;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)a3 + 72) & 0x40) == 0)
  {
    goto LABEL_16;
  }
  self->_moState = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 0x40u;
  if ((*((_BYTE *)a3 + 72) & 0x20) != 0)
  {
LABEL_17:
    self->_locState = *((_DWORD *)a3 + 13);
    *(_BYTE *)&self->_has |= 0x20u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (unint64_t)blacklistDuration
{
  return self->_blacklistDuration;
}

- (NSString)apuuid
{
  return self->_apuuid;
}

- (void)setApuuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)dstChange
{
  return self->_dstChange;
}

- (unsigned)moState
{
  return self->_moState;
}

- (unsigned)locState
{
  return self->_locState;
}

@end
