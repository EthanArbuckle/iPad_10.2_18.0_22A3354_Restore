@implementation WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences

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
  if (a3 < 7)
    return off_24CDDE648[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDiagnosisEventTypeMainDpsNotification")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDiagnosisEventTypePowerToggled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDiagnosisEventTypeControlCenterToggled")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDiagnosisEventTypeLinkUp")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDiagnosisEventTypeRoamed")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDiagnosisEventTypeIPConfigured")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kDiagnosisEventTypeLinkDown")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences;
  -[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWADiagnosisActionAssociationDifferences dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t eventType;
  __CFString *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if (has < 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_newBSSID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("newBSSID"));

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedChannel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("changedChannel"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedDNSPrimary);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("changedDNSPrimary"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedDNSSecondary);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("changedDNSSecondary"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changedMAC);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("changedMAC"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_17:
    eventType = self->_eventType;
    if (eventType >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_24CDDE648[eventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("eventType"));

    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
    return v3;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timestamp"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 2) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_additionalInfo);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("additionalInfo"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWADiagnosisActionAssociationDifferencesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if (has < 0)
  {
    PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 2) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if (has < 0)
  {
    v4[28] = self->_newBSSID;
    v4[32] |= 0x80u;
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
  v4[24] = self->_changedChannel;
  v4[32] |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4[25] = self->_changedDNSPrimary;
  v4[32] |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v4[26] = self->_changedDNSSecondary;
  v4[32] |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v4[27] = self->_changedMAC;
  v4[32] |= 0x40u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
LABEL_17:
    *((_DWORD *)v4 + 5) = self->_eventType;
    v4[32] |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *((_QWORD *)v4 + 1) = self->_timestamp;
  v4[32] |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 2) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 4) = self->_additionalInfo;
    v4[32] |= 2u;
  }
LABEL_10:

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
  id v4;
  $26CDCC079C5A4B8C0C433C34490679B3 has;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_56;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x80) == 0)
      goto LABEL_56;
    if (self->_newBSSID)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_56;
    if (self->_changedChannel)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
      goto LABEL_56;
    if (self->_changedDNSPrimary)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) == 0)
      goto LABEL_56;
    if (self->_changedDNSSecondary)
    {
      if (!*((_BYTE *)v4 + 26))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 26))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x40) != 0)
    {
      if (self->_changedMAC)
      {
        if (!*((_BYTE *)v4 + 27))
          goto LABEL_56;
        goto LABEL_42;
      }
      if (!*((_BYTE *)v4 + 27))
        goto LABEL_42;
    }
LABEL_56:
    v6 = 0;
    goto LABEL_57;
  }
  if ((*((_BYTE *)v4 + 32) & 0x40) != 0)
    goto LABEL_56;
LABEL_42:
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_eventType != *((_DWORD *)v4 + 5))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_56;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_additionalInfo != *((_DWORD *)v4 + 4))
      goto LABEL_56;
    v6 = 1;
  }
LABEL_57:

  return v6;
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
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if (v5 < 0)
  {
    self->_newBSSID = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 0x80u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_changedChannel = *((_BYTE *)v4 + 24);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_changedDNSPrimary = *((_BYTE *)v4 + 25);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_changedDNSSecondary = *((_BYTE *)v4 + 26);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_changedMAC = *((_BYTE *)v4 + 27);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
LABEL_17:
    self->_eventType = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_timestamp = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 2) != 0)
  {
LABEL_9:
    self->_additionalInfo = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_10:

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
