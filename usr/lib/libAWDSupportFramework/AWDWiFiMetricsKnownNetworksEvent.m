@implementation AWDWiFiMetricsKnownNetworksEvent

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiMetricsKnownNetworksEvent setOui:](self, "setOui:", 0);
  -[AWDWiFiMetricsKnownNetworksEvent setBundleID:](self, "setBundleID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsKnownNetworksEvent;
  -[AWDWiFiMetricsKnownNetworksEvent dealloc](&v3, sel_dealloc);
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

- (void)setEventType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNetworkTypeBitMap:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_networkTypeBitMap = a3;
}

- (void)setHasNetworkTypeBitMap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNetworkTypeBitMap
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNetworkSecurity:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_networkSecurity = a3;
}

- (void)setHasNetworkSecurity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNetworkSecurity
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasOui
{
  return self->_oui != 0;
}

- (void)setColocatedState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_colocatedState = a3;
}

- (void)setHasColocatedState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasColocatedState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSwitchedAwayFromCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_switchedAwayFromCount = a3;
}

- (void)setHasSwitchedAwayFromCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSwitchedAwayFromCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSwitchToCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_switchToCount = a3;
}

- (void)setHasSwitchToCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSwitchToCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNetworkScore:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_networkScore = a3;
}

- (void)setHasNetworkScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNetworkScore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsKnownNetworksEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiMetricsKnownNetworksEvent description](&v3, sel_description), -[AWDWiFiMetricsKnownNetworksEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSData *oui;
  char v6;
  NSString *bundleID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_eventType), CFSTR("eventType"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_networkTypeBitMap), CFSTR("networkTypeBitMap"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_networkSecurity), CFSTR("networkSecurity"));
LABEL_6:
  oui = self->_oui;
  if (oui)
    objc_msgSend(v3, "setObject:forKey:", oui, CFSTR("oui"));
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_colocatedState), CFSTR("colocatedState"));
    v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_switchedAwayFromCount), CFSTR("switchedAwayFromCount"));
  v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_switchToCount), CFSTR("switchToCount"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_networkScore), CFSTR("networkScore"));
LABEL_13:
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsKnownNetworksEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_oui)
    PBDataWriterWriteDataField();
  v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_10:
      if ((v5 & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  v5 = (char)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_bundleID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_eventType;
  *((_BYTE *)a3 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  *((_DWORD *)a3 + 10) = self->_networkTypeBitMap;
  *((_BYTE *)a3 + 64) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 9) = self->_networkSecurity;
    *((_BYTE *)a3 + 64) |= 0x10u;
  }
LABEL_6:
  if (self->_oui)
    objc_msgSend(a3, "setOui:");
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_colocatedState;
    *((_BYTE *)a3 + 64) |= 2u;
    v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  *((_DWORD *)a3 + 15) = self->_switchedAwayFromCount;
  *((_BYTE *)a3 + 64) |= 0x80u;
  v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_21:
  *((_DWORD *)a3 + 14) = self->_switchToCount;
  *((_BYTE *)a3 + 64) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)a3 + 8) = self->_networkScore;
    *((_BYTE *)a3 + 64) |= 8u;
  }
LABEL_13:
  if (self->_bundleID)
    objc_msgSend(a3, "setBundleID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_eventType;
  *(_BYTE *)(v5 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_14:
  *(_DWORD *)(v5 + 40) = self->_networkTypeBitMap;
  *(_BYTE *)(v5 + 64) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_networkSecurity;
    *(_BYTE *)(v5 + 64) |= 0x10u;
  }
LABEL_6:

  *(_QWORD *)(v6 + 48) = -[NSData copyWithZone:](self->_oui, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_colocatedState;
    *(_BYTE *)(v6 + 64) |= 2u;
    v8 = (char)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_8:
      if ((v8 & 0x40) == 0)
        goto LABEL_9;
LABEL_18:
      *(_DWORD *)(v6 + 56) = self->_switchToCount;
      *(_BYTE *)(v6 + 64) |= 0x40u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 60) = self->_switchedAwayFromCount;
  *(_BYTE *)(v6 + 64) |= 0x80u;
  v8 = (char)self->_has;
  if ((v8 & 0x40) != 0)
    goto LABEL_18;
LABEL_9:
  if ((v8 & 8) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 32) = self->_networkScore;
    *(_BYTE *)(v6 + 64) |= 8u;
  }
LABEL_11:

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSData *oui;
  NSString *bundleID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
      goto LABEL_47;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 4) == 0 || self->_eventType != *((_DWORD *)a3 + 7))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 4) != 0)
    {
      goto LABEL_47;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x20) == 0 || self->_networkTypeBitMap != *((_DWORD *)a3 + 10))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x20) != 0)
    {
      goto LABEL_47;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x10) == 0 || self->_networkSecurity != *((_DWORD *)a3 + 9))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_47;
    }
    oui = self->_oui;
    if ((unint64_t)oui | *((_QWORD *)a3 + 6))
    {
      v5 = -[NSData isEqual:](oui, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_colocatedState != *((_DWORD *)a3 + 6))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 2) != 0)
    {
      goto LABEL_47;
    }
    if (has < 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x80) == 0 || self->_switchedAwayFromCount != *((_DWORD *)a3 + 15))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x80) != 0)
    {
LABEL_47:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x40) == 0 || self->_switchToCount != *((_DWORD *)a3 + 14))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x40) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 8) == 0 || self->_networkScore != *((_DWORD *)a3 + 8))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 8) != 0)
    {
      goto LABEL_47;
    }
    bundleID = self->_bundleID;
    if ((unint64_t)bundleID | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSString isEqual:](bundleID, "isEqual:");
    else
      LOBYTE(v5) = 1;
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
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_eventType;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_networkTypeBitMap;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_networkSecurity;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSData hash](self->_oui, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = 2654435761 * self->_colocatedState;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
LABEL_12:
      v9 = 2654435761 * self->_switchedAwayFromCount;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_13;
LABEL_17:
      v10 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_14;
LABEL_18:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7 ^ -[NSString hash](self->_bundleID, "hash");
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_12;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_17;
LABEL_13:
  v10 = 2654435761 * self->_switchToCount;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_18;
LABEL_14:
  v11 = 2654435761 * self->_networkScore;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7 ^ -[NSString hash](self->_bundleID, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;

  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 64);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_eventType = *((_DWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  self->_networkTypeBitMap = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
  {
LABEL_5:
    self->_networkSecurity = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 6))
    -[AWDWiFiMetricsKnownNetworksEvent setOui:](self, "setOui:");
  v6 = *((_BYTE *)a3 + 64);
  if ((v6 & 2) != 0)
  {
    self->_colocatedState = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)a3 + 64);
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 0x80) == 0)
  {
    goto LABEL_10;
  }
  self->_switchedAwayFromCount = *((_DWORD *)a3 + 15);
  *(_BYTE *)&self->_has |= 0x80u;
  v6 = *((_BYTE *)a3 + 64);
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_21:
  self->_switchToCount = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 0x40u;
  if ((*((_BYTE *)a3 + 64) & 8) != 0)
  {
LABEL_12:
    self->_networkScore = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_13:
  if (*((_QWORD *)a3 + 2))
    -[AWDWiFiMetricsKnownNetworksEvent setBundleID:](self, "setBundleID:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (unsigned)networkTypeBitMap
{
  return self->_networkTypeBitMap;
}

- (unsigned)networkSecurity
{
  return self->_networkSecurity;
}

- (NSData)oui
{
  return self->_oui;
}

- (void)setOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unsigned)colocatedState
{
  return self->_colocatedState;
}

- (unsigned)switchedAwayFromCount
{
  return self->_switchedAwayFromCount;
}

- (unsigned)switchToCount
{
  return self->_switchToCount;
}

- (int)networkScore
{
  return self->_networkScore;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
