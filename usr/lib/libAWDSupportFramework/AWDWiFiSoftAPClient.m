@implementation AWDWiFiSoftAPClient

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

- (void)setFamilyDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_familyDevice = a3;
}

- (void)setHasFamilyDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFamilyDevice
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setJoinedByAutoHS:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_joinedByAutoHS = a3;
}

- (void)setHasJoinedByAutoHS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasJoinedByAutoHS
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSwitchedToAnotherNetwork:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_switchedToAnotherNetwork = a3;
}

- (void)setHasSwitchedToAnotherNetwork:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSwitchedToAnotherNetwork
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setFailureReason:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFailureReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRssi:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRssi
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEnhancedSecurityType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enhancedSecurityType = a3;
}

- (void)setHasEnhancedSecurityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnhancedSecurityType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSoftAPClient;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiSoftAPClient description](&v3, sel_description), -[AWDWiFiSoftAPClient dictionaryRepresentation](self, "dictionaryRepresentation"));
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
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_familyDevice), CFSTR("familyDevice"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_joinedByAutoHS), CFSTR("joinedByAutoHS"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_switchedToAnotherNetwork), CFSTR("switchedToAnotherNetwork"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rssi), CFSTR("rssi"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_failureReason), CFSTR("failureReason"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 2) != 0)
LABEL_8:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enhancedSecurityType), CFSTR("enhancedSecurityType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiSoftAPClientReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      return;
LABEL_15:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 28) = self->_familyDevice;
  *((_BYTE *)a3 + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)a3 + 29) = self->_joinedByAutoHS;
  *((_BYTE *)a3 + 32) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)a3 + 30) = self->_switchedToAnotherNetwork;
  *((_BYTE *)a3 + 32) |= 0x40u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 5) = self->_failureReason;
  *((_BYTE *)a3 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      return;
LABEL_15:
    *((_DWORD *)a3 + 4) = self->_enhancedSecurityType;
    *((_BYTE *)a3 + 32) |= 2u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 6) = self->_rssi;
  *((_BYTE *)a3 + 32) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
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
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 28) = self->_familyDevice;
  *((_BYTE *)result + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 29) = self->_joinedByAutoHS;
  *((_BYTE *)result + 32) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 30) = self->_switchedToAnotherNetwork;
  *((_BYTE *)result + 32) |= 0x40u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 5) = self->_failureReason;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 6) = self->_rssi;
  *((_BYTE *)result + 32) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 4) = self->_enhancedSecurityType;
  *((_BYTE *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 0x10) == 0)
      goto LABEL_45;
    if (self->_familyDevice)
    {
      if (!*((_BYTE *)a3 + 28))
        goto LABEL_45;
    }
    else if (*((_BYTE *)a3 + 28))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 0x20) == 0)
      goto LABEL_45;
    if (self->_joinedByAutoHS)
    {
      if (!*((_BYTE *)a3 + 29))
        goto LABEL_45;
    }
    else if (*((_BYTE *)a3 + 29))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 0x20) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    if ((*((_BYTE *)a3 + 32) & 0x40) != 0)
      goto LABEL_45;
    goto LABEL_31;
  }
  if ((*((_BYTE *)a3 + 32) & 0x40) == 0)
    goto LABEL_45;
  if (self->_switchedToAnotherNetwork)
  {
    if (!*((_BYTE *)a3 + 30))
      goto LABEL_45;
    goto LABEL_31;
  }
  if (*((_BYTE *)a3 + 30))
  {
LABEL_45:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_31:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_failureReason != *((_DWORD *)a3 + 5))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)a3 + 32) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 8) == 0 || self->_rssi != *((_DWORD *)a3 + 6))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)a3 + 32) & 8) != 0)
  {
    goto LABEL_45;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_enhancedSecurityType != *((_DWORD *)a3 + 4))
      goto LABEL_45;
    LOBYTE(v5) = 1;
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
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_familyDevice;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_joinedByAutoHS;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_switchedToAnotherNetwork;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_failureReason;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_rssi;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_enhancedSecurityType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_familyDevice = *((_BYTE *)a3 + 28);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_joinedByAutoHS = *((_BYTE *)a3 + 29);
  *(_BYTE *)&self->_has |= 0x20u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  self->_switchedToAnotherNetwork = *((_BYTE *)a3 + 30);
  *(_BYTE *)&self->_has |= 0x40u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_failureReason = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0)
      return;
LABEL_15:
    self->_enhancedSecurityType = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_14:
  self->_rssi = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 32) & 2) != 0)
    goto LABEL_15;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)familyDevice
{
  return self->_familyDevice;
}

- (BOOL)joinedByAutoHS
{
  return self->_joinedByAutoHS;
}

- (BOOL)switchedToAnotherNetwork
{
  return self->_switchedToAnotherNetwork;
}

- (unsigned)failureReason
{
  return self->_failureReason;
}

- (unsigned)rssi
{
  return self->_rssi;
}

- (unsigned)enhancedSecurityType
{
  return self->_enhancedSecurityType;
}

@end
