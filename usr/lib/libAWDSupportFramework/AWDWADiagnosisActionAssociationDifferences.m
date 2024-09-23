@implementation AWDWADiagnosisActionAssociationDifferences

- (void)setNewBSSID:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_newBSSID = a3;
}

- (void)setHasNewBSSID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasNewBSSID
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setChangedChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_changedChannel = a3;
}

- (void)setHasChangedChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasChangedChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setChangedDNSPrimary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_changedDNSPrimary = a3;
}

- (void)setHasChangedDNSPrimary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasChangedDNSPrimary
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setChangedDNSSecondary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_changedDNSSecondary = a3;
}

- (void)setHasChangedDNSSecondary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasChangedDNSSecondary
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setChangedMAC:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_changedMAC = a3;
}

- (void)setHasChangedMAC:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasChangedMAC
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
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

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
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

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_24C10E4B0 + a3);
}

- (int)StringAsEventType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDiagnosisEventTypeMainDpsNotification")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDiagnosisEventTypePowerToggled")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDiagnosisEventTypeControlCenterToggled")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDiagnosisEventTypeLinkUp")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDiagnosisEventTypeRoamed")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kDiagnosisEventTypeIPConfigured")) & 1) != 0)
    return 5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kDiagnosisEventTypeLinkDown")))
    return 6;
  return 0;
}

- (void)setAdditionalInfo:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_additionalInfo = a3;
}

- (void)setHasAdditionalInfo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAdditionalInfo
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWADiagnosisActionAssociationDifferences;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWADiagnosisActionAssociationDifferences description](&v3, sel_description), -[AWDWADiagnosisActionAssociationDifferences dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t eventType;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if (has < 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_newBSSID), CFSTR("newBSSID"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedChannel), CFSTR("changedChannel"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedDNSPrimary), CFSTR("changedDNSPrimary"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedDNSSecondary), CFSTR("changedDNSSecondary"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedMAC), CFSTR("changedMAC"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_17:
    eventType = self->_eventType;
    if (eventType >= 7)
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    else
      v7 = (uint64_t)*(&off_24C10E4B0 + eventType);
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("eventType"));
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
    return v3;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 2) != 0)
LABEL_9:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_additionalInfo), CFSTR("additionalInfo"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWADiagnosisActionAssociationDifferencesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $26CDCC079C5A4B8C0C433C34490679B3 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_3:
    PBDataWriterWriteBOOLField();
    *(_BYTE *)&has = self->_has;
  }
LABEL_4:
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    *(_BYTE *)&has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_6:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteBOOLField();
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      return;
LABEL_16:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_16;
}

- (void)copyTo:(id)a3
{
  $26CDCC079C5A4B8C0C433C34490679B3 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 28) = self->_newBSSID;
  *((_BYTE *)a3 + 32) |= 0x80u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_3:
    *((_BYTE *)a3 + 24) = self->_changedChannel;
    *((_BYTE *)a3 + 32) |= 8u;
    *(_BYTE *)&has = self->_has;
  }
LABEL_4:
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *((_BYTE *)a3 + 25) = self->_changedDNSPrimary;
    *((_BYTE *)a3 + 32) |= 0x10u;
    *(_BYTE *)&has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_6:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_6;
  }
  *((_BYTE *)a3 + 26) = self->_changedDNSSecondary;
  *((_BYTE *)a3 + 32) |= 0x20u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)a3 + 27) = self->_changedMAC;
  *((_BYTE *)a3 + 32) |= 0x40u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)a3 + 1) = self->_timestamp;
  *((_BYTE *)a3 + 32) |= 1u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      return;
LABEL_16:
    *((_DWORD *)a3 + 4) = self->_additionalInfo;
    *((_BYTE *)a3 + 32) |= 2u;
    return;
  }
LABEL_15:
  *((_DWORD *)a3 + 5) = self->_eventType;
  *((_BYTE *)a3 + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if (has < 0)
  {
    *((_BYTE *)result + 28) = self->_newBSSID;
    *((_BYTE *)result + 32) |= 0x80u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 24) = self->_changedChannel;
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 25) = self->_changedDNSPrimary;
  *((_BYTE *)result + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 26) = self->_changedDNSSecondary;
  *((_BYTE *)result + 32) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)result + 27) = self->_changedMAC;
  *((_BYTE *)result + 32) |= 0x40u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 1) = self->_timestamp;
  *((_BYTE *)result + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_eventType;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 4) = self->_additionalInfo;
  *((_BYTE *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $26CDCC079C5A4B8C0C433C34490679B3 has;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 0x80) == 0)
      goto LABEL_56;
    if (self->_newBSSID)
    {
      if (!*((_BYTE *)a3 + 28))
        goto LABEL_56;
    }
    else if (*((_BYTE *)a3 + 28))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 8) == 0)
      goto LABEL_56;
    if (self->_changedChannel)
    {
      if (!*((_BYTE *)a3 + 24))
        goto LABEL_56;
    }
    else if (*((_BYTE *)a3 + 24))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 0x10) == 0)
      goto LABEL_56;
    if (self->_changedDNSPrimary)
    {
      if (!*((_BYTE *)a3 + 25))
        goto LABEL_56;
    }
    else if (*((_BYTE *)a3 + 25))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 0x20) == 0)
      goto LABEL_56;
    if (self->_changedDNSSecondary)
    {
      if (!*((_BYTE *)a3 + 26))
        goto LABEL_56;
    }
    else if (*((_BYTE *)a3 + 26))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
    if ((*((_BYTE *)a3 + 32) & 0x40) != 0)
      goto LABEL_56;
    goto LABEL_42;
  }
  if ((*((_BYTE *)a3 + 32) & 0x40) == 0)
    goto LABEL_56;
  if (self->_changedMAC)
  {
    if (!*((_BYTE *)a3 + 27))
      goto LABEL_56;
    goto LABEL_42;
  }
  if (*((_BYTE *)a3 + 27))
  {
LABEL_56:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_42:
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_eventType != *((_DWORD *)a3 + 5))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)a3 + 32) & 4) != 0)
  {
    goto LABEL_56;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 2) == 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_additionalInfo != *((_DWORD *)a3 + 4))
      goto LABEL_56;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v2 = 2654435761 * self->_newBSSID;
    if ((*(_BYTE *)&self->_has & 8) == 0)
    {
LABEL_3:
      v3 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_3;
  }
  v3 = 2654435761 * self->_changedChannel;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_changedDNSPrimary;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_changedDNSSecondary;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_changedMAC;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    v7 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_eventType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_additionalInfo;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((char *)a3 + 32);
  if ((v3 & 0x80000000) == 0)
  {
    if ((v3 & 8) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  self->_newBSSID = *((_BYTE *)a3 + 28);
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v3) = *((_BYTE *)a3 + 32);
  if ((v3 & 8) != 0)
  {
LABEL_3:
    self->_changedChannel = *((_BYTE *)a3 + 24);
    *(_BYTE *)&self->_has |= 8u;
    LOBYTE(v3) = *((_BYTE *)a3 + 32);
  }
LABEL_4:
  if ((v3 & 0x10) != 0)
  {
    self->_changedDNSPrimary = *((_BYTE *)a3 + 25);
    *(_BYTE *)&self->_has |= 0x10u;
    LOBYTE(v3) = *((_BYTE *)a3 + 32);
    if ((v3 & 0x20) == 0)
    {
LABEL_6:
      if ((v3 & 0x40) == 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_6;
  }
  self->_changedDNSSecondary = *((_BYTE *)a3 + 26);
  *(_BYTE *)&self->_has |= 0x20u;
  LOBYTE(v3) = *((_BYTE *)a3 + 32);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  self->_changedMAC = *((_BYTE *)a3 + 27);
  *(_BYTE *)&self->_has |= 0x40u;
  LOBYTE(v3) = *((_BYTE *)a3 + 32);
  if ((v3 & 1) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  self->_timestamp = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  LOBYTE(v3) = *((_BYTE *)a3 + 32);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 2) == 0)
      return;
LABEL_16:
    self->_additionalInfo = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_15:
  self->_eventType = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 32) & 2) != 0)
    goto LABEL_16;
}

- (BOOL)newBSSID
{
  return self->_newBSSID;
}

- (BOOL)changedChannel
{
  return self->_changedChannel;
}

- (BOOL)changedDNSPrimary
{
  return self->_changedDNSPrimary;
}

- (BOOL)changedDNSSecondary
{
  return self->_changedDNSSecondary;
}

- (BOOL)changedMAC
{
  return self->_changedMAC;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)additionalInfo
{
  return self->_additionalInfo;
}

@end
