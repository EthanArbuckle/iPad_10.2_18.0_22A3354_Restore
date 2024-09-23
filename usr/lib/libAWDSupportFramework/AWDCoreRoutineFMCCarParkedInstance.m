@implementation AWDCoreRoutineFMCCarParkedInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineFMCCarParkedInstance setParkingId:](self, "setParkingId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCCarParkedInstance;
  -[AWDCoreRoutineFMCCarParkedInstance dealloc](&v3, sel_dealloc);
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

- (BOOL)hasParkingId
{
  return self->_parkingId != 0;
}

- (void)setTriggerTypes:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_triggerTypes = a3;
}

- (void)setHasTriggerTypes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTriggerTypes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setUserAssistanceRequired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_userAssistanceRequired = a3;
}

- (void)setHasUserAssistanceRequired:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserAssistanceRequired
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHorizontalAccuracy:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setQualityIndicator:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_qualityIndicator = a3;
}

- (void)setHasQualityIndicator:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQualityIndicator
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCCarParkedInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineFMCCarParkedInstance description](&v3, sel_description), -[AWDCoreRoutineFMCCarParkedInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *parkingId;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  parkingId = self->_parkingId;
  if (parkingId)
    objc_msgSend(v3, "setObject:forKey:", parkingId, CFSTR("parkingId"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_triggerTypes), CFSTR("triggerTypes"));
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_userAssistanceRequired), CFSTR("userAssistanceRequired"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_qualityIndicator), CFSTR("qualityIndicator"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_horizontalAccuracy), CFSTR("horizontalAccuracy"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 4) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_locationType), CFSTR("locationType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineFMCCarParkedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_parkingId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      return;
LABEL_15:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_15;
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
  }
  if (self->_parkingId)
    objc_msgSend(a3, "setParkingId:");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_triggerTypes;
    *((_BYTE *)a3 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)a3 + 40) = self->_userAssistanceRequired;
  *((_BYTE *)a3 + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 4) = self->_horizontalAccuracy;
  *((_BYTE *)a3 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      return;
    goto LABEL_10;
  }
LABEL_15:
  *((_DWORD *)a3 + 8) = self->_qualityIndicator;
  *((_BYTE *)a3 + 44) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_locationType;
  *((_BYTE *)a3 + 44) |= 4u;
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
    *(_BYTE *)(v5 + 44) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_parkingId, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_triggerTypes;
    *(_BYTE *)(v6 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 40) = self->_userAssistanceRequired;
  *(_BYTE *)(v6 + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_13:
    *(_DWORD *)(v6 + 32) = self->_qualityIndicator;
    *(_BYTE *)(v6 + 44) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v6;
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 16) = self->_horizontalAccuracy;
  *(_BYTE *)(v6 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 20) = self->_locationType;
    *(_BYTE *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *parkingId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    goto LABEL_37;
  }
  parkingId = self->_parkingId;
  if ((unint64_t)parkingId | *((_QWORD *)a3 + 3))
  {
    v5 = -[NSString isEqual:](parkingId, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_triggerTypes != *((_DWORD *)a3 + 9))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 0x20) == 0)
  {
    if ((*((_BYTE *)a3 + 44) & 0x20) != 0)
      goto LABEL_37;
    goto LABEL_23;
  }
  if ((*((_BYTE *)a3 + 44) & 0x20) == 0)
    goto LABEL_37;
  if (self->_userAssistanceRequired)
  {
    if (!*((_BYTE *)a3 + 40))
      goto LABEL_37;
    goto LABEL_23;
  }
  if (*((_BYTE *)a3 + 40))
  {
LABEL_37:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_23:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_horizontalAccuracy != *((_DWORD *)a3 + 4))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)a3 + 44) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_qualityIndicator != *((_DWORD *)a3 + 8))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)a3 + 44) & 8) != 0)
  {
    goto LABEL_37;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_locationType != *((_DWORD *)a3 + 5))
      goto LABEL_37;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_parkingId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_triggerTypes;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_userAssistanceRequired;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_horizontalAccuracy;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_8:
  v8 = 2654435761 * self->_qualityIndicator;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_9:
  v9 = 2654435761 * self->_locationType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDCoreRoutineFMCCarParkedInstance setParkingId:](self, "setParkingId:");
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_triggerTypes = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_userAssistanceRequired = *((_BYTE *)a3 + 40);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  self->_horizontalAccuracy = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      return;
    goto LABEL_10;
  }
LABEL_15:
  self->_qualityIndicator = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 44) & 4) == 0)
    return;
LABEL_10:
  self->_locationType = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)parkingId
{
  return self->_parkingId;
}

- (void)setParkingId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)triggerTypes
{
  return self->_triggerTypes;
}

- (BOOL)userAssistanceRequired
{
  return self->_userAssistanceRequired;
}

- (int)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (int)qualityIndicator
{
  return self->_qualityIndicator;
}

- (int)locationType
{
  return self->_locationType;
}

@end
