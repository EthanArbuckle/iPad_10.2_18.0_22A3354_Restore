@implementation AWDDNSDomainStats

- (void)dealloc
{
  objc_super v3;

  -[AWDDNSDomainStats setDomain:](self, "setDomain:", 0);
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDDNSDomainStats;
  -[AWDDNSDomainStats dealloc](&v3, sel_dealloc);
}

- (int)networkType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_networkType;
  else
    return 0;
}

- (void)setNetworkType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNetworkType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (!a3)
    return CFSTR("NonCellular");
  if (a3 == 1)
    return CFSTR("Cellular");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsNetworkType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NonCellular")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("Cellular"));
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (unint64_t)answeredQuerySendCountsCount
{
  return self->_answeredQuerySendCounts.count;
}

- (unsigned)answeredQuerySendCounts
{
  return self->_answeredQuerySendCounts.list;
}

- (void)clearAnsweredQuerySendCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addAnsweredQuerySendCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)answeredQuerySendCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_answeredQuerySendCounts;
  unint64_t count;

  p_answeredQuerySendCounts = &self->_answeredQuerySendCounts;
  count = self->_answeredQuerySendCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_answeredQuerySendCounts->list[a3];
}

- (void)setAnsweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)unansweredQuerySendCountsCount
{
  return self->_unansweredQuerySendCounts.count;
}

- (unsigned)unansweredQuerySendCounts
{
  return self->_unansweredQuerySendCounts.list;
}

- (void)clearUnansweredQuerySendCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addUnansweredQuerySendCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)unansweredQuerySendCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_unansweredQuerySendCounts;
  unint64_t count;

  p_unansweredQuerySendCounts = &self->_unansweredQuerySendCounts;
  count = self->_unansweredQuerySendCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_unansweredQuerySendCounts->list[a3];
}

- (void)setUnansweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)responseLatencyMsCount
{
  return self->_responseLatencyMs.count;
}

- (unsigned)responseLatencyMs
{
  return self->_responseLatencyMs.list;
}

- (void)clearResponseLatencyMs
{
  PBRepeatedUInt32Clear();
}

- (void)addResponseLatencyMs:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)responseLatencyMsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_responseLatencyMs;
  unint64_t count;

  p_responseLatencyMs = &self->_responseLatencyMs;
  count = self->_responseLatencyMs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_responseLatencyMs->list[a3];
}

- (void)setResponseLatencyMs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (int)recordType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_recordType;
  else
    return 0;
}

- (void)setRecordType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recordType = a3;
}

- (void)setHasRecordType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)recordTypeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DD98[a3];
}

- (int)StringAsRecordType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Unspecified")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Any")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("A")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AAAA")))
    return 3;
  return 0;
}

- (unint64_t)negAnsweredQuerySendCountsCount
{
  return self->_negAnsweredQuerySendCounts.count;
}

- (unsigned)negAnsweredQuerySendCounts
{
  return self->_negAnsweredQuerySendCounts.list;
}

- (void)clearNegAnsweredQuerySendCounts
{
  PBRepeatedUInt32Clear();
}

- (void)addNegAnsweredQuerySendCount:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)negAnsweredQuerySendCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_negAnsweredQuerySendCounts;
  unint64_t count;

  p_negAnsweredQuerySendCounts = &self->_negAnsweredQuerySendCounts;
  count = self->_negAnsweredQuerySendCounts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_negAnsweredQuerySendCounts->list[a3];
}

- (void)setNegAnsweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)negResponseLatencyMsCount
{
  return self->_negResponseLatencyMs.count;
}

- (unsigned)negResponseLatencyMs
{
  return self->_negResponseLatencyMs.list;
}

- (void)clearNegResponseLatencyMs
{
  PBRepeatedUInt32Clear();
}

- (void)addNegResponseLatencyMs:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)negResponseLatencyMsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_negResponseLatencyMs;
  unint64_t count;

  p_negResponseLatencyMs = &self->_negResponseLatencyMs;
  count = self->_negResponseLatencyMs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_negResponseLatencyMs->list[a3];
}

- (void)setNegResponseLatencyMs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)unansweredQueryDurationMsCount
{
  return self->_unansweredQueryDurationMs.count;
}

- (unsigned)unansweredQueryDurationMs
{
  return self->_unansweredQueryDurationMs.list;
}

- (void)clearUnansweredQueryDurationMs
{
  PBRepeatedUInt32Clear();
}

- (void)addUnansweredQueryDurationMs:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)unansweredQueryDurationMsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_unansweredQueryDurationMs;
  unint64_t count;

  p_unansweredQueryDurationMs = &self->_unansweredQueryDurationMs;
  count = self->_unansweredQueryDurationMs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_unansweredQueryDurationMs->list[a3];
}

- (void)setUnansweredQueryDurationMs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)expiredAnswerStatesCount
{
  return self->_expiredAnswerStates.count;
}

- (unsigned)expiredAnswerStates
{
  return self->_expiredAnswerStates.list;
}

- (void)clearExpiredAnswerStates
{
  PBRepeatedUInt32Clear();
}

- (void)addExpiredAnswerState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)expiredAnswerStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_expiredAnswerStates;
  unint64_t count;

  p_expiredAnswerStates = &self->_expiredAnswerStates;
  count = self->_expiredAnswerStates.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_expiredAnswerStates->list[a3];
}

- (void)setExpiredAnswerStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)dnsOverTCPStatesCount
{
  return self->_dnsOverTCPStates.count;
}

- (unsigned)dnsOverTCPStates
{
  return self->_dnsOverTCPStates.list;
}

- (void)clearDnsOverTCPStates
{
  PBRepeatedUInt32Clear();
}

- (void)addDnsOverTCPState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)dnsOverTCPStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_dnsOverTCPStates;
  unint64_t count;

  p_dnsOverTCPStates = &self->_dnsOverTCPStates;
  count = self->_dnsOverTCPStates.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_dnsOverTCPStates->list[a3];
}

- (void)setDnsOverTCPStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDDNSDomainStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDDNSDomainStats description](&v3, sel_description), -[AWDDNSDomainStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  int networkType;
  const __CFString *v5;
  NSString *domain;
  uint64_t recordType;
  __CFString *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    networkType = self->_networkType;
    if (networkType)
    {
      if (networkType == 1)
        v5 = CFSTR("Cellular");
      else
        v5 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_networkType);
    }
    else
    {
      v5 = CFSTR("NonCellular");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("networkType"));
  }
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("answeredQuerySendCount"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("unansweredQuerySendCount"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("responseLatencyMs"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    recordType = self->_recordType;
    if (recordType >= 4)
      v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recordType);
    else
      v8 = off_24C10DD98[recordType];
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("recordType"));
  }
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("negAnsweredQuerySendCount"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("negResponseLatencyMs"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("unansweredQueryDurationMs"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("expiredAnswerState"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("dnsOverTCPState"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDNSDomainStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_dnsOverTCPStates;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_answeredQuerySendCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_answeredQuerySendCounts.count)
    {
      v4 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v4;
      }
      while (v4 < self->_answeredQuerySendCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_unansweredQuerySendCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_unansweredQuerySendCounts.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_unansweredQuerySendCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_responseLatencyMs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_responseLatencyMs.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_responseLatencyMs.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_negAnsweredQuerySendCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_negAnsweredQuerySendCounts.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_negAnsweredQuerySendCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_negResponseLatencyMs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_negResponseLatencyMs.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_negResponseLatencyMs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_unansweredQueryDurationMs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_unansweredQueryDurationMs.count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_unansweredQueryDurationMs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_expiredAnswerStates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_expiredAnswerStates.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_expiredAnswerStates.count);
    }
    PBDataWriterRecallMark();
  }
  p_dnsOverTCPStates = &self->_dnsOverTCPStates;
  if (p_dnsOverTCPStates->count)
  {
    PBDataWriterPlaceMark();
    if (p_dnsOverTCPStates->count)
    {
      v12 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v12;
      }
      while (v12 < p_dnsOverTCPStates->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  unint64_t v20;
  unint64_t v21;
  uint64_t ii;
  unint64_t v23;
  unint64_t v24;
  uint64_t jj;
  unint64_t v26;
  unint64_t v27;
  uint64_t kk;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 52) = self->_networkType;
    *((_BYTE *)a3 + 216) |= 1u;
  }
  if (self->_domain)
    objc_msgSend(a3, "setDomain:");
  if (-[AWDDNSDomainStats answeredQuerySendCountsCount](self, "answeredQuerySendCountsCount"))
  {
    objc_msgSend(a3, "clearAnsweredQuerySendCounts");
    v5 = -[AWDDNSDomainStats answeredQuerySendCountsCount](self, "answeredQuerySendCountsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addAnsweredQuerySendCount:", -[AWDDNSDomainStats answeredQuerySendCountAtIndex:](self, "answeredQuerySendCountAtIndex:", i));
    }
  }
  if (-[AWDDNSDomainStats unansweredQuerySendCountsCount](self, "unansweredQuerySendCountsCount"))
  {
    objc_msgSend(a3, "clearUnansweredQuerySendCounts");
    v8 = -[AWDDNSDomainStats unansweredQuerySendCountsCount](self, "unansweredQuerySendCountsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addUnansweredQuerySendCount:", -[AWDDNSDomainStats unansweredQuerySendCountAtIndex:](self, "unansweredQuerySendCountAtIndex:", j));
    }
  }
  if (-[AWDDNSDomainStats responseLatencyMsCount](self, "responseLatencyMsCount"))
  {
    objc_msgSend(a3, "clearResponseLatencyMs");
    v11 = -[AWDDNSDomainStats responseLatencyMsCount](self, "responseLatencyMsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addResponseLatencyMs:", -[AWDDNSDomainStats responseLatencyMsAtIndex:](self, "responseLatencyMsAtIndex:", k));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 53) = self->_recordType;
    *((_BYTE *)a3 + 216) |= 2u;
  }
  if (-[AWDDNSDomainStats negAnsweredQuerySendCountsCount](self, "negAnsweredQuerySendCountsCount"))
  {
    objc_msgSend(a3, "clearNegAnsweredQuerySendCounts");
    v14 = -[AWDDNSDomainStats negAnsweredQuerySendCountsCount](self, "negAnsweredQuerySendCountsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addNegAnsweredQuerySendCount:", -[AWDDNSDomainStats negAnsweredQuerySendCountAtIndex:](self, "negAnsweredQuerySendCountAtIndex:", m));
    }
  }
  if (-[AWDDNSDomainStats negResponseLatencyMsCount](self, "negResponseLatencyMsCount"))
  {
    objc_msgSend(a3, "clearNegResponseLatencyMs");
    v17 = -[AWDDNSDomainStats negResponseLatencyMsCount](self, "negResponseLatencyMsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addNegResponseLatencyMs:", -[AWDDNSDomainStats negResponseLatencyMsAtIndex:](self, "negResponseLatencyMsAtIndex:", n));
    }
  }
  if (-[AWDDNSDomainStats unansweredQueryDurationMsCount](self, "unansweredQueryDurationMsCount"))
  {
    objc_msgSend(a3, "clearUnansweredQueryDurationMs");
    v20 = -[AWDDNSDomainStats unansweredQueryDurationMsCount](self, "unansweredQueryDurationMsCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(a3, "addUnansweredQueryDurationMs:", -[AWDDNSDomainStats unansweredQueryDurationMsAtIndex:](self, "unansweredQueryDurationMsAtIndex:", ii));
    }
  }
  if (-[AWDDNSDomainStats expiredAnswerStatesCount](self, "expiredAnswerStatesCount"))
  {
    objc_msgSend(a3, "clearExpiredAnswerStates");
    v23 = -[AWDDNSDomainStats expiredAnswerStatesCount](self, "expiredAnswerStatesCount");
    if (v23)
    {
      v24 = v23;
      for (jj = 0; jj != v24; ++jj)
        objc_msgSend(a3, "addExpiredAnswerState:", -[AWDDNSDomainStats expiredAnswerStateAtIndex:](self, "expiredAnswerStateAtIndex:", jj));
    }
  }
  if (-[AWDDNSDomainStats dnsOverTCPStatesCount](self, "dnsOverTCPStatesCount"))
  {
    objc_msgSend(a3, "clearDnsOverTCPStates");
    v26 = -[AWDDNSDomainStats dnsOverTCPStatesCount](self, "dnsOverTCPStatesCount");
    if (v26)
    {
      v27 = v26;
      for (kk = 0; kk != v27; ++kk)
        objc_msgSend(a3, "addDnsOverTCPState:", -[AWDDNSDomainStats dnsOverTCPStateAtIndex:](self, "dnsOverTCPStateAtIndex:", kk));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 208) = self->_networkType;
    *(_BYTE *)(v5 + 216) |= 1u;
  }

  *(_QWORD *)(v6 + 200) = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 212) = self->_recordType;
    *(_BYTE *)(v6 + 216) |= 2u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  NSString *domain;

  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 216) & 1) == 0 || self->_networkType != *((_DWORD *)a3 + 52))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 216) & 1) != 0)
  {
    return 0;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)a3 + 25) && !-[NSString isEqual:](domain, "isEqual:")
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 216) & 2) == 0 || self->_recordType != *((_DWORD *)a3 + 53))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 216) & 2) != 0)
  {
    return 0;
  }
  if (PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    return PBRepeatedUInt32IsEqual();
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_networkType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_domain, "hash");
  v5 = PBRepeatedUInt32Hash();
  v6 = PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_recordType;
  else
    v8 = 0;
  v9 = v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedUInt32Hash();
  v10 = v4 ^ v3 ^ v9 ^ PBRepeatedUInt32Hash();
  v11 = PBRepeatedUInt32Hash();
  v12 = v11 ^ PBRepeatedUInt32Hash();
  return v10 ^ v12 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  uint64_t v20;
  uint64_t v21;
  uint64_t ii;
  uint64_t v23;
  uint64_t v24;
  uint64_t jj;
  uint64_t v26;
  uint64_t v27;
  uint64_t kk;

  if ((*((_BYTE *)a3 + 216) & 1) != 0)
  {
    self->_networkType = *((_DWORD *)a3 + 52);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 25))
    -[AWDDNSDomainStats setDomain:](self, "setDomain:");
  v5 = objc_msgSend(a3, "answeredQuerySendCountsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDDNSDomainStats addAnsweredQuerySendCount:](self, "addAnsweredQuerySendCount:", objc_msgSend(a3, "answeredQuerySendCountAtIndex:", i));
  }
  v8 = objc_msgSend(a3, "unansweredQuerySendCountsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[AWDDNSDomainStats addUnansweredQuerySendCount:](self, "addUnansweredQuerySendCount:", objc_msgSend(a3, "unansweredQuerySendCountAtIndex:", j));
  }
  v11 = objc_msgSend(a3, "responseLatencyMsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[AWDDNSDomainStats addResponseLatencyMs:](self, "addResponseLatencyMs:", objc_msgSend(a3, "responseLatencyMsAtIndex:", k));
  }
  if ((*((_BYTE *)a3 + 216) & 2) != 0)
  {
    self->_recordType = *((_DWORD *)a3 + 53);
    *(_BYTE *)&self->_has |= 2u;
  }
  v14 = objc_msgSend(a3, "negAnsweredQuerySendCountsCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[AWDDNSDomainStats addNegAnsweredQuerySendCount:](self, "addNegAnsweredQuerySendCount:", objc_msgSend(a3, "negAnsweredQuerySendCountAtIndex:", m));
  }
  v17 = objc_msgSend(a3, "negResponseLatencyMsCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[AWDDNSDomainStats addNegResponseLatencyMs:](self, "addNegResponseLatencyMs:", objc_msgSend(a3, "negResponseLatencyMsAtIndex:", n));
  }
  v20 = objc_msgSend(a3, "unansweredQueryDurationMsCount");
  if (v20)
  {
    v21 = v20;
    for (ii = 0; ii != v21; ++ii)
      -[AWDDNSDomainStats addUnansweredQueryDurationMs:](self, "addUnansweredQueryDurationMs:", objc_msgSend(a3, "unansweredQueryDurationMsAtIndex:", ii));
  }
  v23 = objc_msgSend(a3, "expiredAnswerStatesCount");
  if (v23)
  {
    v24 = v23;
    for (jj = 0; jj != v24; ++jj)
      -[AWDDNSDomainStats addExpiredAnswerState:](self, "addExpiredAnswerState:", objc_msgSend(a3, "expiredAnswerStateAtIndex:", jj));
  }
  v26 = objc_msgSend(a3, "dnsOverTCPStatesCount");
  if (v26)
  {
    v27 = v26;
    for (kk = 0; kk != v27; ++kk)
      -[AWDDNSDomainStats addDnsOverTCPState:](self, "addDnsOverTCPState:", objc_msgSend(a3, "dnsOverTCPStateAtIndex:", kk));
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

@end
