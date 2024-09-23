@implementation AWDPairedSyncSyncReport

- (void)dealloc
{
  objc_super v3;

  -[AWDPairedSyncSyncReport setGizmoBuild:](self, "setGizmoBuild:", 0);
  -[AWDPairedSyncSyncReport setGizmoHardware:](self, "setGizmoHardware:", 0);
  -[AWDPairedSyncSyncReport setActivityName:](self, "setActivityName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPairedSyncSyncReport;
  -[AWDPairedSyncSyncReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsAutomated:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isAutomated = a3;
}

- (void)setHasIsAutomated:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsAutomated
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasGizmoBuild
{
  return self->_gizmoBuild != 0;
}

- (BOOL)hasGizmoHardware
{
  return self->_gizmoHardware != 0;
}

- (void)setSyncDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_syncDuration = a3;
}

- (void)setHasSyncDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSyncDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasActivityName
{
  return self->_activityName != 0;
}

- (void)setSyncErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_syncErrorCode = a3;
}

- (void)setHasSyncErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSyncErrorCode
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimeoutCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_timeoutCount = a3;
}

- (void)setHasTimeoutCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimeoutCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSyncType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_syncType = a3;
}

- (void)setHasSyncType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSyncType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRecordCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_recordCount = a3;
}

- (void)setHasRecordCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRecordCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSyncByteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_syncByteCount = a3;
}

- (void)setHasSyncByteCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSyncByteCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDefaultByteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_defaultByteCount = a3;
}

- (void)setHasDefaultByteCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDefaultByteCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setUrgentByteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_urgentByteCount = a3;
}

- (void)setHasUrgentByteCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUrgentByteCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSawADropout:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sawADropout = a3;
}

- (void)setHasSawADropout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSawADropout
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPairedSyncSyncReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPairedSyncSyncReport description](&v3, sel_description), -[AWDPairedSyncSyncReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *gizmoBuild;
  NSString *gizmoHardware;
  NSString *activityName;
  __int16 v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAutomated), CFSTR("isAutomated"));
  gizmoBuild = self->_gizmoBuild;
  if (gizmoBuild)
    objc_msgSend(v3, "setObject:forKey:", gizmoBuild, CFSTR("gizmoBuild"));
  gizmoHardware = self->_gizmoHardware;
  if (gizmoHardware)
    objc_msgSend(v3, "setObject:forKey:", gizmoHardware, CFSTR("gizmoHardware"));
  if ((*(_WORD *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_syncDuration), CFSTR("syncDuration"));
  activityName = self->_activityName;
  if (activityName)
    objc_msgSend(v3, "setObject:forKey:", activityName, CFSTR("activityName"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncErrorCode), CFSTR("syncErrorCode"));
    v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_15:
      if ((v8 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_25;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_timeoutCount), CFSTR("timeoutCount"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_16:
    if ((v8 & 8) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncType), CFSTR("syncType"));
  v8 = (__int16)self->_has;
  if ((v8 & 8) == 0)
  {
LABEL_17:
    if ((v8 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_recordCount), CFSTR("recordCount"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_18:
    if ((v8 & 4) == 0)
      goto LABEL_19;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncByteCount), CFSTR("syncByteCount"));
  v8 = (__int16)self->_has;
  if ((v8 & 4) == 0)
  {
LABEL_19:
    if ((v8 & 0x100) == 0)
      goto LABEL_20;
LABEL_29:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_urgentByteCount), CFSTR("urgentByteCount"));
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_21;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_defaultByteCount), CFSTR("defaultByteCount"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
    goto LABEL_29;
LABEL_20:
  if ((v8 & 0x400) != 0)
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sawADropout), CFSTR("sawADropout"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPairedSyncSyncReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_gizmoBuild)
    PBDataWriterWriteStringField();
  if (self->_gizmoHardware)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_activityName)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (__int16)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_15:
      if ((v5 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0)
      goto LABEL_17;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v5 & 4) == 0)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_19:
    if ((v5 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_20:
    if ((v5 & 0x400) == 0)
      return;
LABEL_29:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    goto LABEL_29;
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 2u;
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    *((_BYTE *)a3 + 80) = self->_isAutomated;
    *((_WORD *)a3 + 42) |= 0x200u;
  }
  if (self->_gizmoBuild)
    objc_msgSend(a3, "setGizmoBuild:");
  if (self->_gizmoHardware)
    objc_msgSend(a3, "setGizmoHardware:");
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_syncDuration;
    *((_WORD *)a3 + 42) |= 1u;
  }
  if (self->_activityName)
    objc_msgSend(a3, "setActivityName:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_syncErrorCode;
    *((_WORD *)a3 + 42) |= 0x20u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_25;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 18) = self->_timeoutCount;
  *((_WORD *)a3 + 42) |= 0x80u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 17) = self->_syncType;
  *((_WORD *)a3 + 42) |= 0x40u;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_17:
    if ((v6 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 14) = self->_recordCount;
  *((_WORD *)a3 + 42) |= 8u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 15) = self->_syncByteCount;
  *((_WORD *)a3 + 42) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_defaultByteCount;
  *((_WORD *)a3 + 42) |= 4u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_20:
    if ((v6 & 0x400) == 0)
      return;
    goto LABEL_21;
  }
LABEL_29:
  *((_DWORD *)a3 + 19) = self->_urgentByteCount;
  *((_WORD *)a3 + 42) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    return;
LABEL_21:
  *((_BYTE *)a3 + 81) = self->_sawADropout;
  *((_WORD *)a3 + 42) |= 0x400u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 2u;
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_isAutomated;
    *(_WORD *)(v5 + 84) |= 0x200u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_gizmoBuild, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[NSString copyWithZone:](self->_gizmoHardware, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_syncDuration;
    *(_WORD *)(v6 + 84) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_activityName, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_syncErrorCode;
    *(_WORD *)(v6 + 84) |= 0x20u;
    v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_9:
      if ((v8 & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v6 + 72) = self->_timeoutCount;
  *(_WORD *)(v6 + 84) |= 0x80u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_10:
    if ((v8 & 8) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 68) = self->_syncType;
  *(_WORD *)(v6 + 84) |= 0x40u;
  v8 = (__int16)self->_has;
  if ((v8 & 8) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 56) = self->_recordCount;
  *(_WORD *)(v6 + 84) |= 8u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_12:
    if ((v8 & 4) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 60) = self->_syncByteCount;
  *(_WORD *)(v6 + 84) |= 0x10u;
  v8 = (__int16)self->_has;
  if ((v8 & 4) == 0)
  {
LABEL_13:
    if ((v8 & 0x100) == 0)
      goto LABEL_14;
LABEL_23:
    *(_DWORD *)(v6 + 76) = self->_urgentByteCount;
    *(_WORD *)(v6 + 84) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return (id)v6;
    goto LABEL_15;
  }
LABEL_22:
  *(_DWORD *)(v6 + 32) = self->_defaultByteCount;
  *(_WORD *)(v6 + 84) |= 4u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
    goto LABEL_23;
LABEL_14:
  if ((v8 & 0x400) != 0)
  {
LABEL_15:
    *(_BYTE *)(v6 + 81) = self->_sawADropout;
    *(_WORD *)(v6 + 84) |= 0x400u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 v6;
  NSString *gizmoBuild;
  NSString *gizmoHardware;
  __int16 has;
  __int16 v10;
  NSString *activityName;
  __int16 v12;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    v6 = *((_WORD *)a3 + 42);
    if ((*(_WORD *)&self->_has & 2) != 0)
    {
      if ((v6 & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_11;
    }
    else if ((v6 & 2) != 0)
    {
      goto LABEL_11;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x200) == 0)
        goto LABEL_11;
      if (self->_isAutomated)
      {
        if (!*((_BYTE *)a3 + 80))
          goto LABEL_11;
      }
      else if (*((_BYTE *)a3 + 80))
      {
        goto LABEL_11;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x200) != 0)
    {
      goto LABEL_11;
    }
    gizmoBuild = self->_gizmoBuild;
    if (!((unint64_t)gizmoBuild | *((_QWORD *)a3 + 5))
      || (v5 = -[NSString isEqual:](gizmoBuild, "isEqual:")) != 0)
    {
      gizmoHardware = self->_gizmoHardware;
      if (!((unint64_t)gizmoHardware | *((_QWORD *)a3 + 6))
        || (v5 = -[NSString isEqual:](gizmoHardware, "isEqual:")) != 0)
      {
        has = (__int16)self->_has;
        v10 = *((_WORD *)a3 + 42);
        if ((has & 1) != 0)
        {
          if ((v10 & 1) == 0 || self->_syncDuration != *((_QWORD *)a3 + 1))
            goto LABEL_11;
        }
        else if ((v10 & 1) != 0)
        {
          goto LABEL_11;
        }
        activityName = self->_activityName;
        if ((unint64_t)activityName | *((_QWORD *)a3 + 3))
        {
          v5 = -[NSString isEqual:](activityName, "isEqual:");
          if (!v5)
            return v5;
          has = (__int16)self->_has;
        }
        v12 = *((_WORD *)a3 + 42);
        if ((has & 0x20) != 0)
        {
          if ((v12 & 0x20) == 0 || self->_syncErrorCode != *((_DWORD *)a3 + 16))
            goto LABEL_11;
        }
        else if ((v12 & 0x20) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x80) != 0)
        {
          if ((v12 & 0x80) == 0 || self->_timeoutCount != *((_DWORD *)a3 + 18))
            goto LABEL_11;
        }
        else if ((v12 & 0x80) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x40) != 0)
        {
          if ((v12 & 0x40) == 0 || self->_syncType != *((_DWORD *)a3 + 17))
            goto LABEL_11;
        }
        else if ((v12 & 0x40) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 8) != 0)
        {
          if ((v12 & 8) == 0 || self->_recordCount != *((_DWORD *)a3 + 14))
            goto LABEL_11;
        }
        else if ((v12 & 8) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x10) != 0)
        {
          if ((v12 & 0x10) == 0 || self->_syncByteCount != *((_DWORD *)a3 + 15))
            goto LABEL_11;
        }
        else if ((v12 & 0x10) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 4) != 0)
        {
          if ((v12 & 4) == 0 || self->_defaultByteCount != *((_DWORD *)a3 + 8))
            goto LABEL_11;
        }
        else if ((v12 & 4) != 0)
        {
          goto LABEL_11;
        }
        if ((has & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_urgentByteCount != *((_DWORD *)a3 + 19))
            goto LABEL_11;
        }
        else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
        {
          goto LABEL_11;
        }
        LOBYTE(v5) = (v12 & 0x400) == 0;
        if ((has & 0x400) == 0)
          return v5;
        if ((*((_WORD *)a3 + 42) & 0x400) == 0)
          goto LABEL_11;
        if (self->_sawADropout)
        {
          if (!*((_BYTE *)a3 + 81))
            goto LABEL_11;
          goto LABEL_70;
        }
        if (!*((_BYTE *)a3 + 81))
        {
LABEL_70:
          LOBYTE(v5) = 1;
          return v5;
        }
LABEL_11:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  __int16 has;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isAutomated;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_gizmoBuild, "hash");
  v6 = -[NSString hash](self->_gizmoHardware, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_syncDuration;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_activityName, "hash");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v10 = 2654435761 * self->_syncErrorCode;
    if ((has & 0x80) != 0)
    {
LABEL_11:
      v11 = 2654435761 * self->_timeoutCount;
      if ((has & 0x40) != 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else
  {
    v10 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_11;
  }
  v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_syncType;
    if ((has & 8) != 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
  if ((has & 8) != 0)
  {
LABEL_13:
    v13 = 2654435761 * self->_recordCount;
    if ((has & 0x10) != 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  v13 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_14:
    v14 = 2654435761 * self->_syncByteCount;
    if ((has & 4) != 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  v14 = 0;
  if ((has & 4) != 0)
  {
LABEL_15:
    v15 = 2654435761 * self->_defaultByteCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_16;
LABEL_24:
    v16 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_17;
LABEL_25:
    v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_23:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_24;
LABEL_16:
  v16 = 2654435761 * self->_urgentByteCount;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_25;
LABEL_17:
  v17 = 2654435761 * self->_sawADropout;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;

  v5 = *((_WORD *)a3 + 42);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)a3 + 42);
  }
  if ((v5 & 0x200) != 0)
  {
    self->_isAutomated = *((_BYTE *)a3 + 80);
    *(_WORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDPairedSyncSyncReport setGizmoBuild:](self, "setGizmoBuild:");
  if (*((_QWORD *)a3 + 6))
    -[AWDPairedSyncSyncReport setGizmoHardware:](self, "setGizmoHardware:");
  if ((*((_WORD *)a3 + 42) & 1) != 0)
  {
    self->_syncDuration = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDPairedSyncSyncReport setActivityName:](self, "setActivityName:");
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x20) != 0)
  {
    self->_syncErrorCode = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x20u;
    v6 = *((_WORD *)a3 + 42);
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_25;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  self->_timeoutCount = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  self->_syncType = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 8) == 0)
  {
LABEL_17:
    if ((v6 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_27;
  }
LABEL_26:
  self->_recordCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x10) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_28;
  }
LABEL_27:
  self->_syncByteCount = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 4) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_29;
  }
LABEL_28:
  self->_defaultByteCount = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)a3 + 42);
  if ((v6 & 0x100) == 0)
  {
LABEL_20:
    if ((v6 & 0x400) == 0)
      return;
    goto LABEL_21;
  }
LABEL_29:
  self->_urgentByteCount = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 42) & 0x400) == 0)
    return;
LABEL_21:
  self->_sawADropout = *((_BYTE *)a3 + 81);
  *(_WORD *)&self->_has |= 0x400u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isAutomated
{
  return self->_isAutomated;
}

- (NSString)gizmoBuild
{
  return self->_gizmoBuild;
}

- (void)setGizmoBuild:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)gizmoHardware
{
  return self->_gizmoHardware;
}

- (void)setGizmoHardware:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)syncDuration
{
  return self->_syncDuration;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)syncErrorCode
{
  return self->_syncErrorCode;
}

- (unsigned)timeoutCount
{
  return self->_timeoutCount;
}

- (unsigned)syncType
{
  return self->_syncType;
}

- (unsigned)recordCount
{
  return self->_recordCount;
}

- (unsigned)syncByteCount
{
  return self->_syncByteCount;
}

- (unsigned)defaultByteCount
{
  return self->_defaultByteCount;
}

- (unsigned)urgentByteCount
{
  return self->_urgentByteCount;
}

- (BOOL)sawADropout
{
  return self->_sawADropout;
}

@end
