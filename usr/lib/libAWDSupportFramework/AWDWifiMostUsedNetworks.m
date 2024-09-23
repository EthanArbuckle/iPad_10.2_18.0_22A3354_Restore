@implementation AWDWifiMostUsedNetworks

- (void)dealloc
{
  objc_super v3;

  -[AWDWifiMostUsedNetworks setApOui:](self, "setApOui:", 0);
  -[AWDWifiMostUsedNetworks setBundleID:](self, "setBundleID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMostUsedNetworks;
  -[AWDWifiMostUsedNetworks dealloc](&v3, sel_dealloc);
}

- (void)setApOUI:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_apOUI = a3;
}

- (void)setHasApOUI:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApOUI
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSecurityType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTimeUsed:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeUsed = a3;
}

- (void)setHasTimeUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeUsed
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasApOui
{
  return self->_apOui != 0;
}

- (void)setTimeUsedMinutes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_timeUsedMinutes = a3;
}

- (void)setHasTimeUsedMinutes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasTimeUsedMinutes
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setNetworkScoreBitMap:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_networkScoreBitMap = a3;
}

- (void)setHasNetworkScoreBitMap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNetworkScoreBitMap
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSwitchedAwayFromCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_switchedAwayFromCount = a3;
}

- (void)setHasSwitchedAwayFromCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSwitchedAwayFromCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSwitchToCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_switchToCount = a3;
}

- (void)setHasSwitchToCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSwitchToCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNetworkScore:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_networkScore = a3;
}

- (void)setHasNetworkScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNetworkScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWifiMostUsedNetworks;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWifiMostUsedNetworks description](&v3, sel_description), -[AWDWifiMostUsedNetworks dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSData *apOui;
  $A3B061B97E82196ABF4B92F2EAE2AE9E v6;
  NSString *bundleID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_apOUI), CFSTR("apOUI"));
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_securityType), CFSTR("securityType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeUsed), CFSTR("timeUsed"));
LABEL_5:
  apOui = self->_apOui;
  if (apOui)
    objc_msgSend(v3, "setObject:forKey:", apOui, CFSTR("ap_oui"));
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_timeUsedMinutes), CFSTR("timeUsedMinutes"));
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_networkScoreBitMap), CFSTR("networkScoreBitMap"));
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_switchedAwayFromCount), CFSTR("switchedAwayFromCount"));
    *(_BYTE *)&v6 = self->_has;
    if ((*(_BYTE *)&v6 & 0x20) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v6 & 4) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_switchToCount), CFSTR("switchToCount"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_networkScore), CFSTR("networkScore"));
LABEL_14:
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiMostUsedNetworksReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  $A3B061B97E82196ABF4B92F2EAE2AE9E v5;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_apOui)
    PBDataWriterWriteDataField();
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
    PBDataWriterWriteUint32Field();
    *(_BYTE *)&v5 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v5 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    *(_BYTE *)&v5 = self->_has;
    if ((*(_BYTE *)&v5 & 0x20) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v5 & 4) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&v5 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field();
LABEL_14:
  if (self->_bundleID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  $A3B061B97E82196ABF4B92F2EAE2AE9E v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_apOUI;
    *((_BYTE *)a3 + 64) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_securityType;
  *((_BYTE *)a3 + 64) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_timeUsed;
    *((_BYTE *)a3 + 64) |= 1u;
  }
LABEL_5:
  if (self->_apOui)
    objc_msgSend(a3, "setApOui:");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 15) = self->_timeUsedMinutes;
  *((_BYTE *)a3 + 64) |= 0x80u;
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)a3 + 11) = self->_networkScoreBitMap;
    *((_BYTE *)a3 + 64) |= 8u;
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_switchedAwayFromCount;
    *((_BYTE *)a3 + 64) |= 0x40u;
    *(_BYTE *)&v6 = self->_has;
    if ((*(_BYTE *)&v6 & 0x20) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v6 & 4) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)a3 + 13) = self->_switchToCount;
  *((_BYTE *)a3 + 64) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    *((_DWORD *)a3 + 10) = self->_networkScore;
    *((_BYTE *)a3 + 64) |= 4u;
  }
LABEL_14:
  if (self->_bundleID)
    objc_msgSend(a3, "setBundleID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  $A3B061B97E82196ABF4B92F2EAE2AE9E v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_apOUI;
    *(_BYTE *)(v5 + 64) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_securityType;
  *(_BYTE *)(v5 + 64) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_timeUsed;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
LABEL_5:

  *(_QWORD *)(v6 + 24) = -[NSData copyWithZone:](self->_apOui, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 60) = self->_timeUsedMinutes;
  *(_BYTE *)(v6 + 64) |= 0x80u;
  *(_BYTE *)&v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 44) = self->_networkScoreBitMap;
    *(_BYTE *)(v6 + 64) |= 8u;
    *(_BYTE *)&v8 = self->_has;
  }
LABEL_8:
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v8 & 0x20) == 0)
      goto LABEL_10;
LABEL_17:
    *(_DWORD *)(v6 + 52) = self->_switchToCount;
    *(_BYTE *)(v6 + 64) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 56) = self->_switchedAwayFromCount;
  *(_BYTE *)(v6 + 64) |= 0x40u;
  *(_BYTE *)&v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) != 0)
    goto LABEL_17;
LABEL_10:
  if ((*(_BYTE *)&v8 & 4) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 40) = self->_networkScore;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
LABEL_12:

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSData *apOui;
  NSString *bundleID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_apOUI != *((_DWORD *)a3 + 4))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 2) != 0)
    {
      goto LABEL_47;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x10) == 0 || self->_securityType != *((_DWORD *)a3 + 12))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_47;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_timeUsed != *((double *)a3 + 1))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
      goto LABEL_47;
    }
    apOui = self->_apOui;
    if ((unint64_t)apOui | *((_QWORD *)a3 + 3))
    {
      v5 = -[NSData isEqual:](apOui, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if (has < 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x80) == 0 || self->_timeUsedMinutes != *((_DWORD *)a3 + 15))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x80) != 0)
    {
LABEL_47:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 8) == 0 || self->_networkScoreBitMap != *((_DWORD *)a3 + 11))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 8) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x40) == 0 || self->_switchedAwayFromCount != *((_DWORD *)a3 + 14))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x40) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 0x20) == 0 || self->_switchToCount != *((_DWORD *)a3 + 13))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 0x20) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 4) == 0 || self->_networkScore != *((_DWORD *)a3 + 10))
        goto LABEL_47;
    }
    else if ((*((_BYTE *)a3 + 64) & 4) != 0)
    {
      goto LABEL_47;
    }
    bundleID = self->_bundleID;
    if ((unint64_t)bundleID | *((_QWORD *)a3 + 4))
      LOBYTE(v5) = -[NSString isEqual:](bundleID, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double timeUsed;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    goto LABEL_13;
  }
  v3 = 2654435761 * self->_apOUI;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_securityType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  timeUsed = self->_timeUsed;
  v6 = -timeUsed;
  if (timeUsed >= 0.0)
    v6 = self->_timeUsed;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  v10 = -[NSData hash](self->_apOui, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    v11 = 2654435761 * self->_timeUsedMinutes;
    if ((*(_BYTE *)&self->_has & 8) == 0)
    {
LABEL_15:
      v12 = 0;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_16;
      goto LABEL_21;
    }
  }
  else
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_15;
  }
  v12 = 2654435761 * self->_networkScoreBitMap;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_16:
    v13 = 2654435761 * self->_switchedAwayFromCount;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_17;
LABEL_22:
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_18;
LABEL_23:
    v15 = 0;
    return v4 ^ v3 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10 ^ -[NSString hash](self->_bundleID, "hash");
  }
LABEL_21:
  v13 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_22;
LABEL_17:
  v14 = 2654435761 * self->_switchToCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_23;
LABEL_18:
  v15 = 2654435761 * self->_networkScore;
  return v4 ^ v3 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10 ^ -[NSString hash](self->_bundleID, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  int v6;

  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 2) != 0)
  {
    self->_apOUI = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 64);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_securityType = *((_DWORD *)a3 + 12);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
LABEL_4:
    self->_timeUsed = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 3))
    -[AWDWifiMostUsedNetworks setApOui:](self, "setApOui:");
  v6 = *((char *)a3 + 64);
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_timeUsedMinutes = *((_DWORD *)a3 + 15);
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v6) = *((_BYTE *)a3 + 64);
  if ((v6 & 8) != 0)
  {
LABEL_9:
    self->_networkScoreBitMap = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 8u;
    LOBYTE(v6) = *((_BYTE *)a3 + 64);
  }
LABEL_10:
  if ((v6 & 0x40) != 0)
  {
    self->_switchedAwayFromCount = *((_DWORD *)a3 + 14);
    *(_BYTE *)&self->_has |= 0x40u;
    LOBYTE(v6) = *((_BYTE *)a3 + 64);
    if ((v6 & 0x20) == 0)
    {
LABEL_12:
      if ((v6 & 4) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  self->_switchToCount = *((_DWORD *)a3 + 13);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)a3 + 64) & 4) != 0)
  {
LABEL_13:
    self->_networkScore = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_14:
  if (*((_QWORD *)a3 + 4))
    -[AWDWifiMostUsedNetworks setBundleID:](self, "setBundleID:");
}

- (unsigned)apOUI
{
  return self->_apOUI;
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (double)timeUsed
{
  return self->_timeUsed;
}

- (NSData)apOui
{
  return self->_apOui;
}

- (void)setApOui:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)timeUsedMinutes
{
  return self->_timeUsedMinutes;
}

- (unsigned)networkScoreBitMap
{
  return self->_networkScoreBitMap;
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
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
