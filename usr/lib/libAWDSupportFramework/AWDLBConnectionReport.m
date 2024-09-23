@implementation AWDLBConnectionReport

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDLBConnectionReport;
  -[AWDLBConnectionReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setConnectionAttemptCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_connectionAttemptCount = a3;
}

- (void)setHasConnectionAttemptCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasConnectionAttemptCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConnectionSuccessMptcpCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_connectionSuccessMptcpCount = a3;
}

- (void)setHasConnectionSuccessMptcpCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasConnectionSuccessMptcpCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setConnectionSuccessTcpCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_connectionSuccessTcpCount = a3;
}

- (void)setHasConnectionSuccessTcpCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasConnectionSuccessTcpCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setConnectionFailureCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_connectionFailureCount = a3;
}

- (void)setHasConnectionFailureCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasConnectionFailureCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setConnectionCellularFallbackCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_connectionCellularFallbackCount = a3;
}

- (void)setHasConnectionCellularFallbackCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasConnectionCellularFallbackCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)connectionReadyTimesCount
{
  return self->_connectionReadyTimes.count;
}

- (int64_t)connectionReadyTimes
{
  return self->_connectionReadyTimes.list;
}

- (void)clearConnectionReadyTimes
{
  PBRepeatedInt64Clear();
}

- (void)addConnectionReadyTimes:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)connectionReadyTimesAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_connectionReadyTimes;
  unint64_t count;

  p_connectionReadyTimes = &self->_connectionReadyTimes;
  count = self->_connectionReadyTimes.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_connectionReadyTimes->list[a3];
}

- (void)setConnectionReadyTimes:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (void)setSuspensionCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_suspensionCount = a3;
}

- (void)setHasSuspensionCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSuspensionCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setResumptionSuccessCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_resumptionSuccessCount = a3;
}

- (void)setHasResumptionSuccessCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasResumptionSuccessCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setResumptionFailureCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_resumptionFailureCount = a3;
}

- (void)setHasResumptionFailureCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasResumptionFailureCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)resumptionFailureErrorsCount
{
  return self->_resumptionFailureErrors.count;
}

- (int)resumptionFailureErrors
{
  return self->_resumptionFailureErrors.list;
}

- (void)clearResumptionFailureErrors
{
  PBRepeatedInt32Clear();
}

- (void)addResumptionFailureErrors:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)resumptionFailureErrorsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_resumptionFailureErrors;
  unint64_t count;

  p_resumptionFailureErrors = &self->_resumptionFailureErrors;
  count = self->_resumptionFailureErrors.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_resumptionFailureErrors->list[a3];
}

- (void)setResumptionFailureErrors:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)resumptionSuccessTimesCount
{
  return self->_resumptionSuccessTimes.count;
}

- (int64_t)resumptionSuccessTimes
{
  return self->_resumptionSuccessTimes.list;
}

- (void)clearResumptionSuccessTimes
{
  PBRepeatedInt64Clear();
}

- (void)addResumptionSuccessTimes:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)resumptionSuccessTimesAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_resumptionSuccessTimes;
  unint64_t count;

  p_resumptionSuccessTimes = &self->_resumptionSuccessTimes;
  count = self->_resumptionSuccessTimes.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_resumptionSuccessTimes->list[a3];
}

- (void)setResumptionSuccessTimes:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)resumptionFailureTimesCount
{
  return self->_resumptionFailureTimes.count;
}

- (int64_t)resumptionFailureTimes
{
  return self->_resumptionFailureTimes.list;
}

- (void)clearResumptionFailureTimes
{
  PBRepeatedInt64Clear();
}

- (void)addResumptionFailureTimes:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)resumptionFailureTimesAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_resumptionFailureTimes;
  unint64_t count;

  p_resumptionFailureTimes = &self->_resumptionFailureTimes;
  count = self->_resumptionFailureTimes.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_resumptionFailureTimes->list[a3];
}

- (void)setResumptionFailureTimes:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (void)setUpgradeSuccessAndPrimaryCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_upgradeSuccessAndPrimaryCount = a3;
}

- (void)setHasUpgradeSuccessAndPrimaryCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUpgradeSuccessAndPrimaryCount
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setUpgradeSuccessAndNotNeededCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_upgradeSuccessAndNotNeededCount = a3;
}

- (void)setHasUpgradeSuccessAndNotNeededCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasUpgradeSuccessAndNotNeededCount
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setConnectionDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionDuration = a3;
}

- (void)setHasConnectionDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBytesSent:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bytesSent = a3;
}

- (void)setHasBytesSent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBytesSent
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBytesReceived:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bytesReceived = a3;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBytesReceived
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setClientConnectionCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clientConnectionCount = a3;
}

- (void)setHasClientConnectionCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClientConnectionCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLBConnectionReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLBConnectionReport description](&v3, sel_description), -[AWDLBConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  __int16 v5;
  __int16 v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionAttemptCount), CFSTR("connection_attempt_count"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionSuccessMptcpCount), CFSTR("connection_success_mptcp_count"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionSuccessTcpCount), CFSTR("connection_success_tcp_count"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionFailureCount), CFSTR("connection_failure_count"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_connectionCellularFallbackCount), CFSTR("connection_cellular_fallback_count"));
LABEL_8:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt64NSArray(), CFSTR("connection_ready_times"));
  v5 = (__int16)self->_has;
  if ((v5 & 0x1000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_suspensionCount), CFSTR("suspension_count"));
    v5 = (__int16)self->_has;
    if ((v5 & 0x800) == 0)
    {
LABEL_10:
      if ((v5 & 0x400) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resumptionSuccessCount), CFSTR("resumption_success_count"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resumptionFailureCount), CFSTR("resumption_failure_count"));
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("resumption_failure_errors"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt64NSArray(), CFSTR("resumption_success_times"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt64NSArray(), CFSTR("resumption_failure_times"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_upgradeSuccessAndPrimaryCount), CFSTR("upgrade_success_and_primary_count"));
    v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_14:
      if ((v6 & 8) == 0)
        goto LABEL_15;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_upgradeSuccessAndNotNeededCount), CFSTR("upgrade_success_and_not_needed_count"));
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_15:
    if ((v6 & 2) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_connectionDuration), CFSTR("connection_duration"));
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_16:
    if ((v6 & 1) == 0)
      goto LABEL_17;
LABEL_33:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bytesReceived), CFSTR("bytes_received"));
    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_18;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bytesSent), CFSTR("bytes_sent"));
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_33;
LABEL_17:
  if ((v6 & 4) != 0)
LABEL_18:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_clientConnectionCount), CFSTR("client_connection_count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLBConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  unint64_t v5;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int16 v10;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:
  if (self->_connectionReadyTimes.count)
  {
    PBDataWriterPlaceMark();
    if (self->_connectionReadyTimes.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v5;
      }
      while (v5 < self->_connectionReadyTimes.count);
    }
    PBDataWriterRecallMark();
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (__int16)self->_has;
    if ((v6 & 0x800) == 0)
    {
LABEL_15:
      if ((v6 & 0x400) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_16:
    PBDataWriterWriteInt32Field();
LABEL_17:
  if (self->_resumptionFailureErrors.count)
  {
    PBDataWriterPlaceMark();
    if (self->_resumptionFailureErrors.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_resumptionFailureErrors.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_resumptionSuccessTimes.count)
  {
    PBDataWriterPlaceMark();
    if (self->_resumptionSuccessTimes.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v8;
      }
      while (v8 < self->_resumptionSuccessTimes.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_resumptionFailureTimes.count)
  {
    PBDataWriterPlaceMark();
    if (self->_resumptionFailureTimes.count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v9;
      }
      while (v9 < self->_resumptionFailureTimes.count);
    }
    PBDataWriterRecallMark();
  }
  v10 = (__int16)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v10 = (__int16)self->_has;
    if ((v10 & 0x2000) == 0)
    {
LABEL_34:
      if ((v10 & 8) == 0)
        goto LABEL_35;
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt32Field();
  v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_35:
    if ((v10 & 2) == 0)
      goto LABEL_36;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt64Field();
  v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_36:
    if ((v10 & 1) == 0)
      goto LABEL_37;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  v10 = (__int16)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_37:
    if ((v10 & 4) == 0)
      return;
    goto LABEL_38;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 4) == 0)
    return;
LABEL_38:
  PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  __int16 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  __int16 v19;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 17) = self->_timestamp;
    *((_WORD *)a3 + 92) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 36) = self->_connectionAttemptCount;
  *((_WORD *)a3 + 92) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 39) = self->_connectionSuccessMptcpCount;
  *((_WORD *)a3 + 92) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
LABEL_40:
    *((_DWORD *)a3 + 38) = self->_connectionFailureCount;
    *((_WORD *)a3 + 92) |= 0x80u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_39:
  *((_DWORD *)a3 + 40) = self->_connectionSuccessTcpCount;
  *((_WORD *)a3 + 92) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_40;
LABEL_6:
  if ((has & 0x40) != 0)
  {
LABEL_7:
    *((_DWORD *)a3 + 37) = self->_connectionCellularFallbackCount;
    *((_WORD *)a3 + 92) |= 0x40u;
  }
LABEL_8:
  if (-[AWDLBConnectionReport connectionReadyTimesCount](self, "connectionReadyTimesCount"))
  {
    objc_msgSend(a3, "clearConnectionReadyTimes");
    v6 = -[AWDLBConnectionReport connectionReadyTimesCount](self, "connectionReadyTimesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addConnectionReadyTimes:", -[AWDLBConnectionReport connectionReadyTimesAtIndex:](self, "connectionReadyTimesAtIndex:", i));
    }
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x1000) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_14;
LABEL_43:
    *((_DWORD *)a3 + 42) = self->_resumptionSuccessCount;
    *((_WORD *)a3 + 92) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 43) = self->_suspensionCount;
  *((_WORD *)a3 + 92) |= 0x1000u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x800) != 0)
    goto LABEL_43;
LABEL_14:
  if ((v9 & 0x400) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 41) = self->_resumptionFailureCount;
    *((_WORD *)a3 + 92) |= 0x400u;
  }
LABEL_16:
  if (-[AWDLBConnectionReport resumptionFailureErrorsCount](self, "resumptionFailureErrorsCount"))
  {
    objc_msgSend(a3, "clearResumptionFailureErrors");
    v10 = -[AWDLBConnectionReport resumptionFailureErrorsCount](self, "resumptionFailureErrorsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addResumptionFailureErrors:", -[AWDLBConnectionReport resumptionFailureErrorsAtIndex:](self, "resumptionFailureErrorsAtIndex:", j));
    }
  }
  if (-[AWDLBConnectionReport resumptionSuccessTimesCount](self, "resumptionSuccessTimesCount"))
  {
    objc_msgSend(a3, "clearResumptionSuccessTimes");
    v13 = -[AWDLBConnectionReport resumptionSuccessTimesCount](self, "resumptionSuccessTimesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(a3, "addResumptionSuccessTimes:", -[AWDLBConnectionReport resumptionSuccessTimesAtIndex:](self, "resumptionSuccessTimesAtIndex:", k));
    }
  }
  if (-[AWDLBConnectionReport resumptionFailureTimesCount](self, "resumptionFailureTimesCount"))
  {
    objc_msgSend(a3, "clearResumptionFailureTimes");
    v16 = -[AWDLBConnectionReport resumptionFailureTimesCount](self, "resumptionFailureTimesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(a3, "addResumptionFailureTimes:", -[AWDLBConnectionReport resumptionFailureTimesAtIndex:](self, "resumptionFailureTimesAtIndex:", m));
    }
  }
  v19 = (__int16)self->_has;
  if ((v19 & 0x4000) != 0)
  {
    *((_DWORD *)a3 + 45) = self->_upgradeSuccessAndPrimaryCount;
    *((_WORD *)a3 + 92) |= 0x4000u;
    v19 = (__int16)self->_has;
    if ((v19 & 0x2000) == 0)
    {
LABEL_30:
      if ((v19 & 8) == 0)
        goto LABEL_31;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_30;
  }
  *((_DWORD *)a3 + 44) = self->_upgradeSuccessAndNotNeededCount;
  *((_WORD *)a3 + 92) |= 0x2000u;
  v19 = (__int16)self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_31:
    if ((v19 & 2) == 0)
      goto LABEL_32;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)a3 + 16) = self->_connectionDuration;
  *((_WORD *)a3 + 92) |= 8u;
  v19 = (__int16)self->_has;
  if ((v19 & 2) == 0)
  {
LABEL_32:
    if ((v19 & 1) == 0)
      goto LABEL_33;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)a3 + 14) = self->_bytesSent;
  *((_WORD *)a3 + 92) |= 2u;
  v19 = (__int16)self->_has;
  if ((v19 & 1) == 0)
  {
LABEL_33:
    if ((v19 & 4) == 0)
      return;
    goto LABEL_34;
  }
LABEL_49:
  *((_QWORD *)a3 + 13) = self->_bytesReceived;
  *((_WORD *)a3 + 92) |= 1u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return;
LABEL_34:
  *((_QWORD *)a3 + 15) = self->_clientConnectionCount;
  *((_WORD *)a3 + 92) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  __int16 v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_QWORD *)(v4 + 136) = self->_timestamp;
    *(_WORD *)(v4 + 184) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 144) = self->_connectionAttemptCount;
  *(_WORD *)(v4 + 184) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v4 + 156) = self->_connectionSuccessMptcpCount;
  *(_WORD *)(v4 + 184) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v4 + 160) = self->_connectionSuccessTcpCount;
  *(_WORD *)(v4 + 184) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_24:
  *(_DWORD *)(v4 + 152) = self->_connectionFailureCount;
  *(_WORD *)(v4 + 184) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    *(_DWORD *)(v4 + 148) = self->_connectionCellularFallbackCount;
    *(_WORD *)(v4 + 184) |= 0x40u;
  }
LABEL_8:
  PBRepeatedInt64Copy();
  v7 = (__int16)self->_has;
  if ((v7 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 172) = self->_suspensionCount;
    *(_WORD *)(v5 + 184) |= 0x1000u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_10:
      if ((v7 & 0x400) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 168) = self->_resumptionSuccessCount;
  *(_WORD *)(v5 + 184) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 164) = self->_resumptionFailureCount;
    *(_WORD *)(v5 + 184) |= 0x400u;
  }
LABEL_12:
  PBRepeatedInt32Copy();
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  v8 = (__int16)self->_has;
  if ((v8 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 180) = self->_upgradeSuccessAndPrimaryCount;
    *(_WORD *)(v5 + 184) |= 0x4000u;
    v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_14:
      if ((v8 & 8) == 0)
        goto LABEL_15;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v5 + 176) = self->_upgradeSuccessAndNotNeededCount;
  *(_WORD *)(v5 + 184) |= 0x2000u;
  v8 = (__int16)self->_has;
  if ((v8 & 8) == 0)
  {
LABEL_15:
    if ((v8 & 2) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v5 + 128) = self->_connectionDuration;
  *(_WORD *)(v5 + 184) |= 8u;
  v8 = (__int16)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_16:
    if ((v8 & 1) == 0)
      goto LABEL_17;
LABEL_33:
    *(_QWORD *)(v5 + 104) = self->_bytesReceived;
    *(_WORD *)(v5 + 184) |= 1u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_18;
  }
LABEL_32:
  *(_QWORD *)(v5 + 112) = self->_bytesSent;
  *(_WORD *)(v5 + 184) |= 2u;
  v8 = (__int16)self->_has;
  if ((v8 & 1) != 0)
    goto LABEL_33;
LABEL_17:
  if ((v8 & 4) != 0)
  {
LABEL_18:
    *(_QWORD *)(v5 + 120) = self->_clientConnectionCount;
    *(_WORD *)(v5 + 184) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  __int16 has;
  __int16 v7;
  __int16 v8;
  __int16 v9;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 92);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 17))
        goto LABEL_80;
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_80:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_connectionAttemptCount != *((_DWORD *)a3 + 36))
        goto LABEL_80;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_80;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 92) & 0x100) == 0 || self->_connectionSuccessMptcpCount != *((_DWORD *)a3 + 39))
        goto LABEL_80;
    }
    else if ((*((_WORD *)a3 + 92) & 0x100) != 0)
    {
      goto LABEL_80;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 92) & 0x200) == 0 || self->_connectionSuccessTcpCount != *((_DWORD *)a3 + 40))
        goto LABEL_80;
    }
    else if ((*((_WORD *)a3 + 92) & 0x200) != 0)
    {
      goto LABEL_80;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_connectionFailureCount != *((_DWORD *)a3 + 38))
        goto LABEL_80;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_80;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_connectionCellularFallbackCount != *((_DWORD *)a3 + 37))
        goto LABEL_80;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_80;
    }
    IsEqual = PBRepeatedInt64IsEqual();
    if (IsEqual)
    {
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
      {
        if ((*((_WORD *)a3 + 92) & 0x1000) == 0 || self->_suspensionCount != *((_DWORD *)a3 + 43))
          goto LABEL_80;
      }
      else if ((*((_WORD *)a3 + 92) & 0x1000) != 0)
      {
        goto LABEL_80;
      }
      if ((*(_WORD *)&self->_has & 0x800) != 0)
      {
        if ((*((_WORD *)a3 + 92) & 0x800) == 0 || self->_resumptionSuccessCount != *((_DWORD *)a3 + 42))
          goto LABEL_80;
      }
      else if ((*((_WORD *)a3 + 92) & 0x800) != 0)
      {
        goto LABEL_80;
      }
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 92) & 0x400) == 0 || self->_resumptionFailureCount != *((_DWORD *)a3 + 41))
          goto LABEL_80;
      }
      else if ((*((_WORD *)a3 + 92) & 0x400) != 0)
      {
        goto LABEL_80;
      }
      IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        IsEqual = PBRepeatedInt64IsEqual();
        if (IsEqual)
        {
          IsEqual = PBRepeatedInt64IsEqual();
          if (IsEqual)
          {
            v8 = (__int16)self->_has;
            v9 = *((_WORD *)a3 + 92);
            if ((v8 & 0x4000) != 0)
            {
              if ((*((_WORD *)a3 + 92) & 0x4000) == 0 || self->_upgradeSuccessAndPrimaryCount != *((_DWORD *)a3 + 45))
                goto LABEL_80;
            }
            else if ((*((_WORD *)a3 + 92) & 0x4000) != 0)
            {
              goto LABEL_80;
            }
            if ((*(_WORD *)&self->_has & 0x2000) != 0)
            {
              if ((*((_WORD *)a3 + 92) & 0x2000) == 0 || self->_upgradeSuccessAndNotNeededCount != *((_DWORD *)a3 + 44))
                goto LABEL_80;
            }
            else if ((*((_WORD *)a3 + 92) & 0x2000) != 0)
            {
              goto LABEL_80;
            }
            if ((v8 & 8) != 0)
            {
              if ((v9 & 8) == 0 || self->_connectionDuration != *((_QWORD *)a3 + 16))
                goto LABEL_80;
            }
            else if ((v9 & 8) != 0)
            {
              goto LABEL_80;
            }
            if ((v8 & 2) != 0)
            {
              if ((v9 & 2) == 0 || self->_bytesSent != *((_QWORD *)a3 + 14))
                goto LABEL_80;
            }
            else if ((v9 & 2) != 0)
            {
              goto LABEL_80;
            }
            if ((v8 & 1) != 0)
            {
              if ((v9 & 1) == 0 || self->_bytesReceived != *((_QWORD *)a3 + 13))
                goto LABEL_80;
            }
            else if ((v9 & 1) != 0)
            {
              goto LABEL_80;
            }
            LOBYTE(IsEqual) = (v9 & 4) == 0;
            if ((v8 & 4) != 0)
            {
              if ((v9 & 4) == 0 || self->_clientConnectionCount != *((_QWORD *)a3 + 15))
                goto LABEL_80;
              LOBYTE(IsEqual) = 1;
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v24 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_connectionAttemptCount;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v24 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v22 = 2654435761 * self->_connectionSuccessMptcpCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v22 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    v21 = 2654435761 * self->_connectionSuccessTcpCount;
    if ((has & 0x80) != 0)
      goto LABEL_6;
LABEL_12:
    v20 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v21 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_12;
LABEL_6:
  v20 = 2654435761 * self->_connectionFailureCount;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_connectionCellularFallbackCount;
    goto LABEL_14;
  }
LABEL_13:
  v4 = 0;
LABEL_14:
  v5 = PBRepeatedInt64Hash();
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    v6 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_16;
LABEL_19:
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_17;
    goto LABEL_20;
  }
  v6 = 2654435761 * self->_suspensionCount;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_19;
LABEL_16:
  v7 = 2654435761 * self->_resumptionSuccessCount;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_17:
    v8 = 2654435761 * self->_resumptionFailureCount;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
LABEL_21:
  v9 = PBRepeatedInt32Hash();
  v10 = PBRepeatedInt64Hash();
  v11 = PBRepeatedInt64Hash();
  v12 = (__int16)self->_has;
  if ((v12 & 0x4000) != 0)
  {
    v13 = 2654435761 * self->_upgradeSuccessAndPrimaryCount;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_23:
      v14 = 2654435761 * self->_upgradeSuccessAndNotNeededCount;
      if ((v12 & 8) != 0)
        goto LABEL_24;
      goto LABEL_30;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_23;
  }
  v14 = 0;
  if ((v12 & 8) != 0)
  {
LABEL_24:
    v15 = 2654435761 * self->_connectionDuration;
    if ((v12 & 2) != 0)
      goto LABEL_25;
    goto LABEL_31;
  }
LABEL_30:
  v15 = 0;
  if ((v12 & 2) != 0)
  {
LABEL_25:
    v16 = 2654435761 * self->_bytesSent;
    if ((v12 & 1) != 0)
      goto LABEL_26;
LABEL_32:
    v17 = 0;
    if ((v12 & 4) != 0)
      goto LABEL_27;
LABEL_33:
    v18 = 0;
    return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_31:
  v16 = 0;
  if ((v12 & 1) == 0)
    goto LABEL_32;
LABEL_26:
  v17 = 2654435761 * self->_bytesReceived;
  if ((v12 & 4) == 0)
    goto LABEL_33;
LABEL_27:
  v18 = 2654435761 * self->_clientConnectionCount;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  uint64_t v16;
  uint64_t v17;
  uint64_t m;
  __int16 v19;

  v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)a3 + 92);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_connectionAttemptCount = *((_DWORD *)a3 + 36);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  self->_connectionSuccessMptcpCount = *((_DWORD *)a3 + 39);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  self->_connectionSuccessTcpCount = *((_DWORD *)a3 + 40);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)a3 + 92);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_36:
  self->_connectionFailureCount = *((_DWORD *)a3 + 38);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 92) & 0x40) != 0)
  {
LABEL_7:
    self->_connectionCellularFallbackCount = *((_DWORD *)a3 + 37);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_8:
  v6 = objc_msgSend(a3, "connectionReadyTimesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDLBConnectionReport addConnectionReadyTimes:](self, "addConnectionReadyTimes:", objc_msgSend(a3, "connectionReadyTimesAtIndex:", i));
  }
  v9 = *((_WORD *)a3 + 92);
  if ((v9 & 0x1000) != 0)
  {
    self->_suspensionCount = *((_DWORD *)a3 + 43);
    *(_WORD *)&self->_has |= 0x1000u;
    v9 = *((_WORD *)a3 + 92);
    if ((v9 & 0x800) == 0)
    {
LABEL_13:
      if ((v9 & 0x400) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_WORD *)a3 + 92) & 0x800) == 0)
  {
    goto LABEL_13;
  }
  self->_resumptionSuccessCount = *((_DWORD *)a3 + 42);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)a3 + 92) & 0x400) != 0)
  {
LABEL_14:
    self->_resumptionFailureCount = *((_DWORD *)a3 + 41);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_15:
  v10 = objc_msgSend(a3, "resumptionFailureErrorsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[AWDLBConnectionReport addResumptionFailureErrors:](self, "addResumptionFailureErrors:", objc_msgSend(a3, "resumptionFailureErrorsAtIndex:", j));
  }
  v13 = objc_msgSend(a3, "resumptionSuccessTimesCount");
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[AWDLBConnectionReport addResumptionSuccessTimes:](self, "addResumptionSuccessTimes:", objc_msgSend(a3, "resumptionSuccessTimesAtIndex:", k));
  }
  v16 = objc_msgSend(a3, "resumptionFailureTimesCount");
  if (v16)
  {
    v17 = v16;
    for (m = 0; m != v17; ++m)
      -[AWDLBConnectionReport addResumptionFailureTimes:](self, "addResumptionFailureTimes:", objc_msgSend(a3, "resumptionFailureTimesAtIndex:", m));
  }
  v19 = *((_WORD *)a3 + 92);
  if ((v19 & 0x4000) != 0)
  {
    self->_upgradeSuccessAndPrimaryCount = *((_DWORD *)a3 + 45);
    *(_WORD *)&self->_has |= 0x4000u;
    v19 = *((_WORD *)a3 + 92);
    if ((v19 & 0x2000) == 0)
    {
LABEL_26:
      if ((v19 & 8) == 0)
        goto LABEL_27;
      goto LABEL_43;
    }
  }
  else if ((*((_WORD *)a3 + 92) & 0x2000) == 0)
  {
    goto LABEL_26;
  }
  self->_upgradeSuccessAndNotNeededCount = *((_DWORD *)a3 + 44);
  *(_WORD *)&self->_has |= 0x2000u;
  v19 = *((_WORD *)a3 + 92);
  if ((v19 & 8) == 0)
  {
LABEL_27:
    if ((v19 & 2) == 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  self->_connectionDuration = *((_QWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 8u;
  v19 = *((_WORD *)a3 + 92);
  if ((v19 & 2) == 0)
  {
LABEL_28:
    if ((v19 & 1) == 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  self->_bytesSent = *((_QWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 2u;
  v19 = *((_WORD *)a3 + 92);
  if ((v19 & 1) == 0)
  {
LABEL_29:
    if ((v19 & 4) == 0)
      return;
    goto LABEL_30;
  }
LABEL_45:
  self->_bytesReceived = *((_QWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 92) & 4) == 0)
    return;
LABEL_30:
  self->_clientConnectionCount = *((_QWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)connectionAttemptCount
{
  return self->_connectionAttemptCount;
}

- (int)connectionSuccessMptcpCount
{
  return self->_connectionSuccessMptcpCount;
}

- (int)connectionSuccessTcpCount
{
  return self->_connectionSuccessTcpCount;
}

- (int)connectionFailureCount
{
  return self->_connectionFailureCount;
}

- (int)connectionCellularFallbackCount
{
  return self->_connectionCellularFallbackCount;
}

- (int)suspensionCount
{
  return self->_suspensionCount;
}

- (int)resumptionSuccessCount
{
  return self->_resumptionSuccessCount;
}

- (int)resumptionFailureCount
{
  return self->_resumptionFailureCount;
}

- (int)upgradeSuccessAndPrimaryCount
{
  return self->_upgradeSuccessAndPrimaryCount;
}

- (int)upgradeSuccessAndNotNeededCount
{
  return self->_upgradeSuccessAndNotNeededCount;
}

- (int64_t)connectionDuration
{
  return self->_connectionDuration;
}

- (int64_t)bytesSent
{
  return self->_bytesSent;
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (int64_t)clientConnectionCount
{
  return self->_clientConnectionCount;
}

@end
