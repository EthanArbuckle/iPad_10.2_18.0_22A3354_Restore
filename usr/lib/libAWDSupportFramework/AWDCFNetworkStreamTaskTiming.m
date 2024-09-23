@implementation AWDCFNetworkStreamTaskTiming

- (void)dealloc
{
  objc_super v3;

  -[AWDCFNetworkStreamTaskTiming setProcname:](self, "setProcname:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkStreamTaskTiming;
  -[AWDCFNetworkStreamTaskTiming dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTaskCreationStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_taskCreationStart = a3;
}

- (void)setHasTaskCreationStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTaskCreationStart
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setResumeStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_resumeStart = a3;
}

- (void)setHasResumeStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasResumeStart
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setConnectionInit:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionInit = a3;
}

- (void)setHasConnectionInit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionInit
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDomainLookupStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_domainLookupStart = a3;
}

- (void)setHasDomainLookupStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDomainLookupStart
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDomainLookupEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_domainLookupEnd = a3;
}

- (void)setHasDomainLookupEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDomainLookupEnd
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setConnectStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectStart = a3;
}

- (void)setHasConnectStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectStart
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSecureConnectionStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_secureConnectionStart = a3;
}

- (void)setHasSecureConnectionStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSecureConnectionStart
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setConnectEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectEnd = a3;
}

- (void)setHasConnectEnd:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectEnd
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setConnected:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnected
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFirstWrite:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_firstWrite = a3;
}

- (void)setHasFirstWrite:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFirstWrite
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setFirstRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_firstRead = a3;
}

- (void)setHasFirstRead:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFirstRead
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsCellular:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isCellular = a3;
}

- (void)setHasIsCellular:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsCellular
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasProcname
{
  return self->_procname != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkStreamTaskTiming;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCFNetworkStreamTaskTiming description](&v3, sel_description), -[AWDCFNetworkStreamTaskTiming dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *procname;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_taskCreationStart), CFSTR("taskCreationStart"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resumeStart), CFSTR("resumeStart"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionInit), CFSTR("connectionInit"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_domainLookupStart), CFSTR("domainLookupStart"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_domainLookupEnd), CFSTR("domainLookupEnd"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectStart), CFSTR("connectStart"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_secureConnectionStart), CFSTR("secureConnectionStart"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectEnd), CFSTR("connectEnd"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connected), CFSTR("connected"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_firstWrite), CFSTR("firstWrite"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_firstRead), CFSTR("firstRead"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_isCellular), CFSTR("isCellular"));
LABEL_15:
  procname = self->_procname;
  if (procname)
    objc_msgSend(v3, "setObject:forKey:", procname, CFSTR("procname"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkStreamTaskTimingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_14:
    PBDataWriterWriteInt64Field();
LABEL_15:
  if (self->_procname)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  NSString *procname;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_QWORD *)a3 + 13) = self->_timestamp;
    *((_WORD *)a3 + 60) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 12) = self->_taskCreationStart;
  *((_WORD *)a3 + 60) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 10) = self->_resumeStart;
  *((_WORD *)a3 + 60) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 4) = self->_connectionInit;
  *((_WORD *)a3 + 60) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 6) = self->_domainLookupStart;
  *((_WORD *)a3 + 60) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 5) = self->_domainLookupEnd;
  *((_WORD *)a3 + 60) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 2) = self->_connectStart;
  *((_WORD *)a3 + 60) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 11) = self->_secureConnectionStart;
  *((_WORD *)a3 + 60) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 1) = self->_connectEnd;
  *((_WORD *)a3 + 60) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 3) = self->_connected;
  *((_WORD *)a3 + 60) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 8) = self->_firstWrite;
  *((_WORD *)a3 + 60) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_28:
  *((_QWORD *)a3 + 7) = self->_firstRead;
  *((_WORD *)a3 + 60) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    *((_QWORD *)a3 + 9) = self->_isCellular;
    *((_WORD *)a3 + 60) |= 0x100u;
  }
LABEL_15:
  procname = self->_procname;
  if (procname)
    objc_msgSend(a3, "setProcname:", procname);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_timestamp;
    *(_WORD *)(v5 + 120) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 96) = self->_taskCreationStart;
  *(_WORD *)(v5 + 120) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *(_QWORD *)(v5 + 80) = self->_resumeStart;
  *(_WORD *)(v5 + 120) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *(_QWORD *)(v5 + 32) = self->_connectionInit;
  *(_WORD *)(v5 + 120) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *(_QWORD *)(v5 + 48) = self->_domainLookupStart;
  *(_WORD *)(v5 + 120) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *(_QWORD *)(v5 + 40) = self->_domainLookupEnd;
  *(_WORD *)(v5 + 120) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v5 + 16) = self->_connectStart;
  *(_WORD *)(v5 + 120) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *(_QWORD *)(v5 + 88) = self->_secureConnectionStart;
  *(_WORD *)(v5 + 120) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *(_QWORD *)(v5 + 8) = self->_connectEnd;
  *(_WORD *)(v5 + 120) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *(_QWORD *)(v5 + 24) = self->_connected;
  *(_WORD *)(v5 + 120) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
LABEL_27:
    *(_QWORD *)(v5 + 56) = self->_firstRead;
    *(_WORD *)(v5 + 120) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  *(_QWORD *)(v5 + 64) = self->_firstWrite;
  *(_WORD *)(v5 + 120) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x100) != 0)
  {
LABEL_14:
    *(_QWORD *)(v5 + 72) = self->_isCellular;
    *(_WORD *)(v5 + 120) |= 0x100u;
  }
LABEL_15:

  v6[14] = -[NSString copyWithZone:](self->_procname, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *procname;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 60);
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x1000) == 0 || self->_timestamp != *((_QWORD *)a3 + 13))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 60) & 0x1000) != 0)
    {
LABEL_69:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x800) == 0 || self->_taskCreationStart != *((_QWORD *)a3 + 12))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 60) & 0x800) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x200) == 0 || self->_resumeStart != *((_QWORD *)a3 + 10))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 60) & 0x200) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_connectionInit != *((_QWORD *)a3 + 4))
        goto LABEL_69;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_domainLookupStart != *((_QWORD *)a3 + 6))
        goto LABEL_69;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_domainLookupEnd != *((_QWORD *)a3 + 5))
        goto LABEL_69;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_connectStart != *((_QWORD *)a3 + 2))
        goto LABEL_69;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x400) == 0 || self->_secureConnectionStart != *((_QWORD *)a3 + 11))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 60) & 0x400) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_connectEnd != *((_QWORD *)a3 + 1))
        goto LABEL_69;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_connected != *((_QWORD *)a3 + 3))
        goto LABEL_69;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_firstWrite != *((_QWORD *)a3 + 8))
        goto LABEL_69;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_69;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_firstRead != *((_QWORD *)a3 + 7))
        goto LABEL_69;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_69;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 60) & 0x100) == 0 || self->_isCellular != *((_QWORD *)a3 + 9))
        goto LABEL_69;
    }
    else if ((*((_WORD *)a3 + 60) & 0x100) != 0)
    {
      goto LABEL_69;
    }
    procname = self->_procname;
    if ((unint64_t)procname | *((_QWORD *)a3 + 14))
      LOBYTE(v5) = -[NSString isEqual:](procname, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_taskCreationStart;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_resumeStart;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_connectionInit;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_domainLookupStart;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_domainLookupEnd;
    if ((has & 2) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_connectStart;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_secureConnectionStart;
    if ((has & 1) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((has & 1) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_connectEnd;
    if ((has & 4) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_connected;
    if ((has & 0x80) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_firstWrite;
    if ((has & 0x40) != 0)
      goto LABEL_13;
LABEL_26:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_14;
LABEL_27:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_procname, "hash");
  }
LABEL_25:
  v13 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_26;
LABEL_13:
  v14 = 2654435761u * self->_firstRead;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_27;
LABEL_14:
  v15 = 2654435761 * self->_isCellular;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_procname, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x1000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x1000u;
    v3 = *((_WORD *)a3 + 60);
    if ((v3 & 0x800) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)a3 + 60) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_taskCreationStart = *((_QWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x200) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_resumeStart = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_connectionInit = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_domainLookupStart = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  self->_domainLookupEnd = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_connectStart = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x400) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_secureConnectionStart = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 4) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_connectEnd = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 4) == 0)
  {
LABEL_11:
    if ((v3 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_connected = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x80) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_firstWrite = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 60);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_28:
  self->_firstRead = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 60) & 0x100) != 0)
  {
LABEL_14:
    self->_isCellular = *((_QWORD *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_15:
  if (*((_QWORD *)a3 + 14))
    -[AWDCFNetworkStreamTaskTiming setProcname:](self, "setProcname:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)taskCreationStart
{
  return self->_taskCreationStart;
}

- (unint64_t)resumeStart
{
  return self->_resumeStart;
}

- (unint64_t)connectionInit
{
  return self->_connectionInit;
}

- (unint64_t)domainLookupStart
{
  return self->_domainLookupStart;
}

- (unint64_t)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (unint64_t)connectStart
{
  return self->_connectStart;
}

- (unint64_t)secureConnectionStart
{
  return self->_secureConnectionStart;
}

- (unint64_t)connectEnd
{
  return self->_connectEnd;
}

- (unint64_t)connected
{
  return self->_connected;
}

- (unint64_t)firstWrite
{
  return self->_firstWrite;
}

- (unint64_t)firstRead
{
  return self->_firstRead;
}

- (int64_t)isCellular
{
  return self->_isCellular;
}

- (NSString)procname
{
  return self->_procname;
}

- (void)setProcname:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
