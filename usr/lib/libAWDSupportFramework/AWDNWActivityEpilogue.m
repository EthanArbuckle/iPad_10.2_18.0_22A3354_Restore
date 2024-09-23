@implementation AWDNWActivityEpilogue

- (void)dealloc
{
  objc_super v3;

  -[AWDNWActivityEpilogue setActivity:](self, "setActivity:", 0);
  -[AWDNWActivityEpilogue setL2Report:](self, "setL2Report:", 0);
  -[AWDNWActivityEpilogue setDeviceReport:](self, "setDeviceReport:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivityEpilogue;
  -[AWDNWActivityEpilogue dealloc](&v3, sel_dealloc);
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

- (BOOL)hasActivity
{
  return self->_activity != 0;
}

- (void)setDurationMsecs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_durationMsecs = a3;
}

- (void)setHasDurationMsecs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationMsecs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFragmentsQuenched:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fragmentsQuenched = a3;
}

- (void)setHasFragmentsQuenched:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFragmentsQuenched
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)completionReason
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_completionReason;
  else
    return 0;
}

- (void)setCompletionReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_completionReason = a3;
}

- (void)setHasCompletionReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCompletionReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)completionReasonAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DB18[a3];
}

- (int)StringAsCompletionReason:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ACTIVITY_COMPLETION_REASON_INVALID")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ACTIVITY_COMPLETION_REASON_NONE")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ACTIVITY_COMPLETION_REASON_SUCCESS")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ACTIVITY_COMPLETION_REASON_FAILURE")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ACTIVITY_COMPLETION_REASON_CANCELLED")))
    return 4;
  return 0;
}

- (BOOL)hasL2Report
{
  return self->_l2Report != 0;
}

- (BOOL)hasDeviceReport
{
  return self->_deviceReport != 0;
}

- (void)setUnderlyingErrorDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_underlyingErrorDomain = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setUnderlyingErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_underlyingErrorCode = a3;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUnderlyingErrorCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNWActivityEpilogue;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNWActivityEpilogue description](&v3, sel_description), -[AWDNWActivityEpilogue dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDNWActivity *activity;
  char has;
  uint64_t completionReason;
  __CFString *v7;
  AWDNWL2Report *l2Report;
  AWDNWDeviceReport *deviceReport;
  char v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  activity = self->_activity;
  if (activity)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWActivity dictionaryRepresentation](activity, "dictionaryRepresentation"), CFSTR("activity"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_durationMsecs), CFSTR("durationMsecs"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_fragmentsQuenched), CFSTR("fragmentsQuenched"));
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_11:
  completionReason = self->_completionReason;
  if (completionReason >= 5)
    v7 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_completionReason);
  else
    v7 = off_24C10DB18[completionReason];
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("completionReason"));
LABEL_15:
  l2Report = self->_l2Report;
  if (l2Report)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWL2Report dictionaryRepresentation](l2Report, "dictionaryRepresentation"), CFSTR("l2Report"));
  deviceReport = self->_deviceReport;
  if (deviceReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWDeviceReport dictionaryRepresentation](deviceReport, "dictionaryRepresentation"), CFSTR("deviceReport"));
  v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_underlyingErrorDomain), CFSTR("underlyingErrorDomain"));
    v10 = (char)self->_has;
  }
  if ((v10 & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_underlyingErrorCode), CFSTR("underlyingErrorCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWActivityEpilogueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_activity)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:
  if (self->_l2Report)
    PBDataWriterWriteSubmessage();
  if (self->_deviceReport)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 0x10) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 72) |= 4u;
  }
  if (self->_activity)
    objc_msgSend(a3, "setActivity:");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_durationMsecs;
    *((_BYTE *)a3 + 72) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 2) = self->_fragmentsQuenched;
  *((_BYTE *)a3 + 72) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 10) = self->_completionReason;
    *((_BYTE *)a3 + 72) |= 8u;
  }
LABEL_9:
  if (self->_l2Report)
    objc_msgSend(a3, "setL2Report:");
  if (self->_deviceReport)
    objc_msgSend(a3, "setDeviceReport:");
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_underlyingErrorDomain;
    *((_BYTE *)a3 + 72) |= 0x20u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_underlyingErrorCode;
    *((_BYTE *)a3 + 72) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 72) |= 4u;
  }

  *(_QWORD *)(v6 + 32) = -[AWDNWActivity copyWithZone:](self->_activity, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_durationMsecs;
    *(_BYTE *)(v6 + 72) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 16) = self->_fragmentsQuenched;
  *(_BYTE *)(v6 + 72) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 40) = self->_completionReason;
    *(_BYTE *)(v6 + 72) |= 8u;
  }
LABEL_7:

  *(_QWORD *)(v6 + 56) = -[AWDNWL2Report copyWithZone:](self->_l2Report, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[AWDNWDeviceReport copyWithZone:](self->_deviceReport, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_underlyingErrorDomain;
    *(_BYTE *)(v6 + 72) |= 0x20u;
    v8 = (char)self->_has;
  }
  if ((v8 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_underlyingErrorCode;
    *(_BYTE *)(v6 + 72) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  AWDNWActivity *activity;
  AWDNWL2Report *l2Report;
  AWDNWDeviceReport *deviceReport;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 72) & 4) != 0)
    {
LABEL_38:
      LOBYTE(v5) = 0;
      return v5;
    }
    activity = self->_activity;
    if ((unint64_t)activity | *((_QWORD *)a3 + 4))
    {
      v5 = -[AWDNWActivity isEqual:](activity, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_durationMsecs != *((_QWORD *)a3 + 1))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 72) & 1) != 0)
    {
      goto LABEL_38;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_fragmentsQuenched != *((_QWORD *)a3 + 2))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 72) & 2) != 0)
    {
      goto LABEL_38;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0 || self->_completionReason != *((_DWORD *)a3 + 10))
        goto LABEL_38;
    }
    else if ((*((_BYTE *)a3 + 72) & 8) != 0)
    {
      goto LABEL_38;
    }
    l2Report = self->_l2Report;
    if (!((unint64_t)l2Report | *((_QWORD *)a3 + 7))
      || (v5 = -[AWDNWL2Report isEqual:](l2Report, "isEqual:")) != 0)
    {
      deviceReport = self->_deviceReport;
      if (!((unint64_t)deviceReport | *((_QWORD *)a3 + 6))
        || (v5 = -[AWDNWDeviceReport isEqual:](deviceReport, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 0x20) != 0)
        {
          if ((*((_BYTE *)a3 + 72) & 0x20) == 0 || self->_underlyingErrorDomain != *((_DWORD *)a3 + 17))
            goto LABEL_38;
        }
        else if ((*((_BYTE *)a3 + 72) & 0x20) != 0)
        {
          goto LABEL_38;
        }
        LOBYTE(v5) = (*((_BYTE *)a3 + 72) & 0x10) == 0;
        if ((*(_BYTE *)&self->_has & 0x10) != 0)
        {
          if ((*((_BYTE *)a3 + 72) & 0x10) == 0 || self->_underlyingErrorCode != *((_DWORD *)a3 + 16))
            goto LABEL_38;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDNWActivity hash](self->_activity, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v5 = 2654435761u * self->_durationMsecs;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761u * self->_fragmentsQuenched;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_completionReason;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  v8 = -[AWDNWL2Report hash](self->_l2Report, "hash");
  v9 = -[AWDNWDeviceReport hash](self->_deviceReport, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v10 = 2654435761 * self->_underlyingErrorDomain;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_13;
LABEL_15:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_15;
LABEL_13:
  v11 = 2654435761 * self->_underlyingErrorCode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  AWDNWActivity *activity;
  uint64_t v6;
  char v7;
  AWDNWL2Report *l2Report;
  uint64_t v9;
  AWDNWDeviceReport *deviceReport;
  uint64_t v11;
  char v12;

  if ((*((_BYTE *)a3 + 72) & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  activity = self->_activity;
  v6 = *((_QWORD *)a3 + 4);
  if (activity)
  {
    if (v6)
      -[AWDNWActivity mergeFrom:](activity, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDNWActivityEpilogue setActivity:](self, "setActivity:");
  }
  v7 = *((_BYTE *)a3 + 72);
  if ((v7 & 1) != 0)
  {
    self->_durationMsecs = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)a3 + 72);
    if ((v7 & 2) == 0)
    {
LABEL_10:
      if ((v7 & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 72) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_fragmentsQuenched = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 72) & 8) != 0)
  {
LABEL_11:
    self->_completionReason = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  l2Report = self->_l2Report;
  v9 = *((_QWORD *)a3 + 7);
  if (l2Report)
  {
    if (v9)
      -[AWDNWL2Report mergeFrom:](l2Report, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDNWActivityEpilogue setL2Report:](self, "setL2Report:");
  }
  deviceReport = self->_deviceReport;
  v11 = *((_QWORD *)a3 + 6);
  if (deviceReport)
  {
    if (v11)
      -[AWDNWDeviceReport mergeFrom:](deviceReport, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDNWActivityEpilogue setDeviceReport:](self, "setDeviceReport:");
  }
  v12 = *((_BYTE *)a3 + 72);
  if ((v12 & 0x20) != 0)
  {
    self->_underlyingErrorDomain = *((_DWORD *)a3 + 17);
    *(_BYTE *)&self->_has |= 0x20u;
    v12 = *((_BYTE *)a3 + 72);
  }
  if ((v12 & 0x10) != 0)
  {
    self->_underlyingErrorCode = *((_DWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 0x10u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDNWActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)durationMsecs
{
  return self->_durationMsecs;
}

- (unint64_t)fragmentsQuenched
{
  return self->_fragmentsQuenched;
}

- (AWDNWL2Report)l2Report
{
  return self->_l2Report;
}

- (void)setL2Report:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AWDNWDeviceReport)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (int)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

@end
