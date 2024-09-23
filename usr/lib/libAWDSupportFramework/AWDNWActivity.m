@implementation AWDNWActivity

- (void)dealloc
{
  objc_super v3;

  -[AWDNWActivity setActivityUUID:](self, "setActivityUUID:", 0);
  -[AWDNWActivity setParentActivityUUID:](self, "setParentActivityUUID:", 0);
  -[AWDNWActivity setL2Report:](self, "setL2Report:", 0);
  -[AWDNWActivity setDeviceReport:](self, "setDeviceReport:", 0);
  -[AWDNWActivity setBundleID:](self, "setBundleID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivity;
  -[AWDNWActivity dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setActivityDomain:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activityDomain = a3;
}

- (void)setHasActivityDomain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivityDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setActivityLabel:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_activityLabel = a3;
}

- (void)setHasActivityLabel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActivityLabel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasActivityUUID
{
  return self->_activityUUID != 0;
}

- (BOOL)hasParentActivityUUID
{
  return self->_parentActivityUUID != 0;
}

- (void)setIsRetry:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isRetry = a3;
}

- (void)setHasIsRetry:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsRetry
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasL2Report
{
  return self->_l2Report != 0;
}

- (BOOL)hasDeviceReport
{
  return self->_deviceReport != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setInvestigationID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_investigationID = a3;
}

- (void)setHasInvestigationID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInvestigationID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivity;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNWActivity description](&v3, sel_description), -[AWDNWActivity dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *activityUUID;
  NSString *parentActivityUUID;
  AWDNWL2Report *l2Report;
  AWDNWDeviceReport *deviceReport;
  NSString *bundleID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_activityDomain), CFSTR("activityDomain"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_activityLabel), CFSTR("activityLabel"));
LABEL_5:
  activityUUID = self->_activityUUID;
  if (activityUUID)
    objc_msgSend(v3, "setObject:forKey:", activityUUID, CFSTR("activityUUID"));
  parentActivityUUID = self->_parentActivityUUID;
  if (parentActivityUUID)
    objc_msgSend(v3, "setObject:forKey:", parentActivityUUID, CFSTR("parentActivityUUID"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isRetry), CFSTR("isRetry"));
  l2Report = self->_l2Report;
  if (l2Report)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWL2Report dictionaryRepresentation](l2Report, "dictionaryRepresentation"), CFSTR("l2Report"));
  deviceReport = self->_deviceReport;
  if (deviceReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWDeviceReport dictionaryRepresentation](deviceReport, "dictionaryRepresentation"), CFSTR("deviceReport"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_investigationID), CFSTR("investigationID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_activityUUID)
    PBDataWriterWriteStringField();
  if (self->_parentActivityUUID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_l2Report)
    PBDataWriterWriteSubmessage();
  if (self->_deviceReport)
    PBDataWriterWriteSubmessage();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 84) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_activityDomain;
  *((_BYTE *)a3 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 2) = self->_activityLabel;
    *((_BYTE *)a3 + 84) |= 2u;
  }
LABEL_5:
  if (self->_activityUUID)
    objc_msgSend(a3, "setActivityUUID:");
  if (self->_parentActivityUUID)
    objc_msgSend(a3, "setParentActivityUUID:");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)a3 + 80) = self->_isRetry;
    *((_BYTE *)a3 + 84) |= 0x10u;
  }
  if (self->_l2Report)
    objc_msgSend(a3, "setL2Report:");
  if (self->_deviceReport)
    objc_msgSend(a3, "setDeviceReport:");
  if (self->_bundleID)
    objc_msgSend(a3, "setBundleID:");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_investigationID;
    *((_BYTE *)a3 + 84) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 84) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_activityDomain;
  *(_BYTE *)(v5 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 16) = self->_activityLabel;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
LABEL_5:

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_activityUUID, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_parentActivityUUID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 80) = self->_isRetry;
    *(_BYTE *)(v6 + 84) |= 0x10u;
  }

  *(_QWORD *)(v6 + 64) = -[AWDNWL2Report copyWithZone:](self->_l2Report, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 56) = -[AWDNWDeviceReport copyWithZone:](self->_deviceReport, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_investigationID;
    *(_BYTE *)(v6 + 84) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *activityUUID;
  NSString *parentActivityUUID;
  AWDNWL2Report *l2Report;
  AWDNWDeviceReport *deviceReport;
  NSString *bundleID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 84) & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
        goto LABEL_25;
    }
    else if ((*((_BYTE *)a3 + 84) & 8) != 0)
    {
      goto LABEL_25;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 84) & 1) == 0 || self->_activityDomain != *((_QWORD *)a3 + 1))
        goto LABEL_25;
    }
    else if ((*((_BYTE *)a3 + 84) & 1) != 0)
    {
      goto LABEL_25;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 84) & 2) == 0 || self->_activityLabel != *((_QWORD *)a3 + 2))
        goto LABEL_25;
    }
    else if ((*((_BYTE *)a3 + 84) & 2) != 0)
    {
      goto LABEL_25;
    }
    activityUUID = self->_activityUUID;
    if (!((unint64_t)activityUUID | *((_QWORD *)a3 + 5))
      || (v5 = -[NSString isEqual:](activityUUID, "isEqual:")) != 0)
    {
      parentActivityUUID = self->_parentActivityUUID;
      if (!((unint64_t)parentActivityUUID | *((_QWORD *)a3 + 9))
        || (v5 = -[NSString isEqual:](parentActivityUUID, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 0x10) != 0)
        {
          if ((*((_BYTE *)a3 + 84) & 0x10) != 0)
          {
            if (self->_isRetry)
            {
              if (!*((_BYTE *)a3 + 80))
                goto LABEL_25;
              goto LABEL_31;
            }
            if (!*((_BYTE *)a3 + 80))
            {
LABEL_31:
              l2Report = self->_l2Report;
              if (!((unint64_t)l2Report | *((_QWORD *)a3 + 8))
                || (v5 = -[AWDNWL2Report isEqual:](l2Report, "isEqual:")) != 0)
              {
                deviceReport = self->_deviceReport;
                if (!((unint64_t)deviceReport | *((_QWORD *)a3 + 7))
                  || (v5 = -[AWDNWDeviceReport isEqual:](deviceReport, "isEqual:")) != 0)
                {
                  bundleID = self->_bundleID;
                  if (!((unint64_t)bundleID | *((_QWORD *)a3 + 6))
                    || (v5 = -[NSString isEqual:](bundleID, "isEqual:")) != 0)
                  {
                    LOBYTE(v5) = (*((_BYTE *)a3 + 84) & 4) == 0;
                    if ((*(_BYTE *)&self->_has & 4) != 0)
                    {
                      if ((*((_BYTE *)a3 + 84) & 4) == 0 || self->_investigationID != *((_QWORD *)a3 + 3))
                        goto LABEL_25;
                      LOBYTE(v5) = 1;
                    }
                  }
                }
              }
              return v5;
            }
          }
        }
        else if ((*((_BYTE *)a3 + 84) & 0x10) == 0)
        {
          goto LABEL_31;
        }
LABEL_25:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  unint64_t v13;

  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v13 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761u * self->_activityDomain;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_activityLabel;
    goto LABEL_8;
  }
LABEL_7:
  v4 = 0;
LABEL_8:
  v5 = -[NSString hash](self->_activityUUID, "hash");
  v6 = -[NSString hash](self->_parentActivityUUID, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v7 = 2654435761 * self->_isRetry;
  else
    v7 = 0;
  v8 = -[AWDNWL2Report hash](self->_l2Report, "hash");
  v9 = -[AWDNWDeviceReport hash](self->_deviceReport, "hash");
  v10 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761u * self->_investigationID;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  AWDNWL2Report *l2Report;
  uint64_t v7;
  AWDNWDeviceReport *deviceReport;
  uint64_t v9;

  v5 = *((_BYTE *)a3 + 84);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)a3 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 84) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_activityDomain = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 84) & 2) != 0)
  {
LABEL_4:
    self->_activityLabel = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 5))
    -[AWDNWActivity setActivityUUID:](self, "setActivityUUID:");
  if (*((_QWORD *)a3 + 9))
    -[AWDNWActivity setParentActivityUUID:](self, "setParentActivityUUID:");
  if ((*((_BYTE *)a3 + 84) & 0x10) != 0)
  {
    self->_isRetry = *((_BYTE *)a3 + 80);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  l2Report = self->_l2Report;
  v7 = *((_QWORD *)a3 + 8);
  if (l2Report)
  {
    if (v7)
      -[AWDNWL2Report mergeFrom:](l2Report, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDNWActivity setL2Report:](self, "setL2Report:");
  }
  deviceReport = self->_deviceReport;
  v9 = *((_QWORD *)a3 + 7);
  if (deviceReport)
  {
    if (v9)
      -[AWDNWDeviceReport mergeFrom:](deviceReport, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDNWActivity setDeviceReport:](self, "setDeviceReport:");
  }
  if (*((_QWORD *)a3 + 6))
    -[AWDNWActivity setBundleID:](self, "setBundleID:");
  if ((*((_BYTE *)a3 + 84) & 4) != 0)
  {
    self->_investigationID = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)activityDomain
{
  return self->_activityDomain;
}

- (unint64_t)activityLabel
{
  return self->_activityLabel;
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)parentActivityUUID
{
  return self->_parentActivityUUID;
}

- (void)setParentActivityUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (AWDNWL2Report)l2Report
{
  return self->_l2Report;
}

- (void)setL2Report:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AWDNWDeviceReport)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)investigationID
{
  return self->_investigationID;
}

@end
