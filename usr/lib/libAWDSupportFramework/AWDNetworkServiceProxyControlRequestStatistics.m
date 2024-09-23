@implementation AWDNetworkServiceProxyControlRequestStatistics

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyControlRequestStatistics;
  -[AWDNetworkServiceProxyControlRequestStatistics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)interfaceType
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_interfaceType;
  else
    return 1;
}

- (void)setInterfaceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DE10[a3 - 1];
}

- (int)StringAsInterfaceType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_WIFI")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_CELLULAR")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_WIRED")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyInterfaceType_VIRTUAL")))
    return 4;
  return 1;
}

- (int)requestType
{
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    return self->_requestType;
  else
    return 1;
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_requestType = a3;
}

- (void)setHasRequestType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRequestType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("NetworkServiceProxyControlRequestType_WALDO_REFRESH");
  if (a3 == 2)
    return CFSTR("NetworkServiceProxyControlRequestType_DAYPASS_REQUEST");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsRequestType:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyControlRequestType_WALDO_REFRESH")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyControlRequestType_DAYPASS_REQUEST")))return 2;
    else
      return 1;
  }
  return v4;
}

- (void)setRequestCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_requestCount = a3;
}

- (void)setHasRequestCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRequestCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setResultSuccessCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_resultSuccessCount = a3;
}

- (void)setHasResultSuccessCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasResultSuccessCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setResultNetworkUnavailableCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_resultNetworkUnavailableCount = a3;
}

- (void)setHasResultNetworkUnavailableCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasResultNetworkUnavailableCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResultServerUnreachableCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_resultServerUnreachableCount = a3;
}

- (void)setHasResultServerUnreachableCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasResultServerUnreachableCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setResultSendFailureCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_resultSendFailureCount = a3;
}

- (void)setHasResultSendFailureCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResultSendFailureCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setResultResponseTimeoutCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_resultResponseTimeoutCount = a3;
}

- (void)setHasResultResponseTimeoutCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasResultResponseTimeoutCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setResultConnectionResetCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_resultConnectionResetCount = a3;
}

- (void)setHasResultConnectionResetCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasResultConnectionResetCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setResultCertificateFailureCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_resultCertificateFailureCount = a3;
}

- (void)setHasResultCertificateFailureCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasResultCertificateFailureCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setResultUnknownErrorCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_resultUnknownErrorCount = a3;
}

- (void)setHasResultUnknownErrorCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResultUnknownErrorCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (unint64_t)responseTimeBucketsCount
{
  return self->_responseTimeBuckets.count;
}

- (unsigned)responseTimeBuckets
{
  return self->_responseTimeBuckets.list;
}

- (void)clearResponseTimeBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addResponseTimeBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)responseTimeBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_responseTimeBuckets;
  unint64_t count;

  p_responseTimeBuckets = &self->_responseTimeBuckets;
  count = self->_responseTimeBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_responseTimeBuckets->list[a3];
}

- (void)setResponseTimeBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (int)protocolType
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_protocolType;
  else
    return 1;
}

- (void)setProtocolType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_protocolType = a3;
}

- (void)setHasProtocolType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasProtocolType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)protocolTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DE30[a3 - 1];
}

- (int)StringAsProtocolType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyProtocolType_IPv4")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyProtocolType_IPv6")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NetworkServiceProxyProtocolType_NAT64")))
    return 3;
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyControlRequestStatistics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNetworkServiceProxyControlRequestStatistics description](&v3, sel_description), -[AWDNetworkServiceProxyControlRequestStatistics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  unsigned int v5;
  __CFString *v6;
  unsigned int v7;
  __CFString *v8;
  int requestType;
  const __CFString *v11;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v7 = self->_interfaceType - 1;
  if (v7 >= 4)
    v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interfaceType);
  else
    v8 = off_24C10DE10[v7];
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("interface_type"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_25:
  requestType = self->_requestType;
  if (requestType == 1)
  {
    v11 = CFSTR("NetworkServiceProxyControlRequestType_WALDO_REFRESH");
  }
  else if (requestType == 2)
  {
    v11 = CFSTR("NetworkServiceProxyControlRequestType_DAYPASS_REQUEST");
  }
  else
  {
    v11 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestType);
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("request_type"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestCount), CFSTR("request_count"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultSuccessCount), CFSTR("result_success_count"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultNetworkUnavailableCount), CFSTR("result_network_unavailable_count"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerUnreachableCount), CFSTR("result_server_unreachable_count"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultSendFailureCount), CFSTR("result_send_failure_count"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultResponseTimeoutCount), CFSTR("result_response_timeout_count"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultConnectionResetCount), CFSTR("result_connection_reset_count"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultCertificateFailureCount), CFSTR("result_certificate_failure_count"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_13:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultUnknownErrorCount), CFSTR("result_unknown_error_count"));
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("response_time_buckets"));
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v5 = self->_protocolType - 1;
    if (v5 >= 3)
      v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_protocolType);
    else
      v6 = off_24C10DE30[v5];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("protocol_type"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkServiceProxyControlRequestStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  unint64_t v5;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_13:
    PBDataWriterWriteUint64Field();
LABEL_14:
  if (self->_responseTimeBuckets.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_responseTimeBuckets.count);
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_QWORD *)a3 + 13) = self->_timestamp;
    *((_WORD *)a3 + 62) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 28) = self->_interfaceType;
  *((_WORD *)a3 + 62) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 30) = self->_requestType;
  *((_WORD *)a3 + 62) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 4) = self->_requestCount;
  *((_WORD *)a3 + 62) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 11) = self->_resultSuccessCount;
  *((_WORD *)a3 + 62) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 7) = self->_resultNetworkUnavailableCount;
  *((_WORD *)a3 + 62) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 10) = self->_resultServerUnreachableCount;
  *((_WORD *)a3 + 62) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 9) = self->_resultSendFailureCount;
  *((_WORD *)a3 + 62) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 8) = self->_resultResponseTimeoutCount;
  *((_WORD *)a3 + 62) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
LABEL_31:
    *((_QWORD *)a3 + 5) = self->_resultCertificateFailureCount;
    *((_WORD *)a3 + 62) |= 2u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_30:
  *((_QWORD *)a3 + 6) = self->_resultConnectionResetCount;
  *((_WORD *)a3 + 62) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_31;
LABEL_12:
  if ((has & 0x100) != 0)
  {
LABEL_13:
    *((_QWORD *)a3 + 12) = self->_resultUnknownErrorCount;
    *((_WORD *)a3 + 62) |= 0x100u;
  }
LABEL_14:
  if (-[AWDNetworkServiceProxyControlRequestStatistics responseTimeBucketsCount](self, "responseTimeBucketsCount"))
  {
    objc_msgSend(a3, "clearResponseTimeBuckets");
    v6 = -[AWDNetworkServiceProxyControlRequestStatistics responseTimeBucketsCount](self, "responseTimeBucketsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addResponseTimeBuckets:", -[AWDNetworkServiceProxyControlRequestStatistics responseTimeBucketsAtIndex:](self, "responseTimeBucketsAtIndex:", i));
    }
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((_DWORD *)a3 + 29) = self->_protocolType;
    *((_WORD *)a3 + 62) |= 0x800u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int16 has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_QWORD *)(v4 + 104) = self->_timestamp;
    *(_WORD *)(v4 + 124) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 112) = self->_interfaceType;
  *(_WORD *)(v4 + 124) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v4 + 120) = self->_requestType;
  *(_WORD *)(v4 + 124) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(_QWORD *)(v4 + 32) = self->_requestCount;
  *(_WORD *)(v4 + 124) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(_QWORD *)(v4 + 88) = self->_resultSuccessCount;
  *(_WORD *)(v4 + 124) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v4 + 56) = self->_resultNetworkUnavailableCount;
  *(_WORD *)(v4 + 124) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_QWORD *)(v4 + 80) = self->_resultServerUnreachableCount;
  *(_WORD *)(v4 + 124) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *(_QWORD *)(v4 + 72) = self->_resultSendFailureCount;
  *(_WORD *)(v4 + 124) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(_QWORD *)(v4 + 64) = self->_resultResponseTimeoutCount;
  *(_WORD *)(v4 + 124) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *(_QWORD *)(v4 + 48) = self->_resultConnectionResetCount;
  *(_WORD *)(v4 + 124) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_27:
  *(_QWORD *)(v4 + 40) = self->_resultCertificateFailureCount;
  *(_WORD *)(v4 + 124) |= 2u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    *(_QWORD *)(v4 + 96) = self->_resultUnknownErrorCount;
    *(_WORD *)(v4 + 124) |= 0x100u;
  }
LABEL_14:
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_protocolType;
    *(_WORD *)(v5 + 124) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  __int16 has;
  __int16 v7;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 62);
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 62) & 0x200) == 0 || self->_timestamp != *((_QWORD *)a3 + 13))
        goto LABEL_67;
    }
    else if ((*((_WORD *)a3 + 62) & 0x200) != 0)
    {
LABEL_67:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 62) & 0x400) == 0 || self->_interfaceType != *((_DWORD *)a3 + 28))
        goto LABEL_67;
    }
    else if ((*((_WORD *)a3 + 62) & 0x400) != 0)
    {
      goto LABEL_67;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 62) & 0x1000) == 0 || self->_requestType != *((_DWORD *)a3 + 30))
        goto LABEL_67;
    }
    else if ((*((_WORD *)a3 + 62) & 0x1000) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_requestCount != *((_QWORD *)a3 + 4))
        goto LABEL_67;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_resultSuccessCount != *((_QWORD *)a3 + 11))
        goto LABEL_67;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_resultNetworkUnavailableCount != *((_QWORD *)a3 + 7))
        goto LABEL_67;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_resultServerUnreachableCount != *((_QWORD *)a3 + 10))
        goto LABEL_67;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_resultSendFailureCount != *((_QWORD *)a3 + 9))
        goto LABEL_67;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_resultResponseTimeoutCount != *((_QWORD *)a3 + 8))
        goto LABEL_67;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_resultConnectionResetCount != *((_QWORD *)a3 + 6))
        goto LABEL_67;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_67;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_resultCertificateFailureCount != *((_QWORD *)a3 + 5))
        goto LABEL_67;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_67;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 62) & 0x100) == 0 || self->_resultUnknownErrorCount != *((_QWORD *)a3 + 12))
        goto LABEL_67;
    }
    else if ((*((_WORD *)a3 + 62) & 0x100) != 0)
    {
      goto LABEL_67;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      LOBYTE(IsEqual) = (*((_WORD *)a3 + 62) & 0x800) == 0;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
      {
        if ((*((_WORD *)a3 + 62) & 0x800) == 0 || self->_protocolType != *((_DWORD *)a3 + 29))
          goto LABEL_67;
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v18 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v17 = 2654435761 * self->_interfaceType;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  v17 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_4:
    v16 = 2654435761 * self->_requestType;
    if ((has & 1) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v16 = 0;
  if ((has & 1) != 0)
  {
LABEL_5:
    v15 = 2654435761u * self->_requestCount;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v15 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v14 = 2654435761u * self->_resultSuccessCount;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v4 = 2654435761u * self->_resultNetworkUnavailableCount;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v5 = 2654435761u * self->_resultServerUnreachableCount;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v6 = 2654435761u * self->_resultSendFailureCount;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v7 = 2654435761u * self->_resultResponseTimeoutCount;
    if ((has & 4) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    v8 = 2654435761u * self->_resultConnectionResetCount;
    if ((has & 2) != 0)
      goto LABEL_12;
LABEL_24:
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_23:
  v8 = 0;
  if ((has & 2) == 0)
    goto LABEL_24;
LABEL_12:
  v9 = 2654435761u * self->_resultCertificateFailureCount;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    v10 = 2654435761u * self->_resultUnknownErrorCount;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
LABEL_26:
  v11 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v12 = 2654435761 * self->_protocolType;
  else
    v12 = 0;
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x200) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x200u;
    v5 = *((_WORD *)a3 + 62);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*((_WORD *)a3 + 62) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_interfaceType = *((_DWORD *)a3 + 28);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_requestType = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_requestCount = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_resultSuccessCount = *((_QWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_resultNetworkUnavailableCount = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_resultServerUnreachableCount = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_resultSendFailureCount = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_resultResponseTimeoutCount = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  self->_resultConnectionResetCount = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 62);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_30:
  self->_resultCertificateFailureCount = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 62) & 0x100) != 0)
  {
LABEL_13:
    self->_resultUnknownErrorCount = *((_QWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_14:
  v6 = objc_msgSend(a3, "responseTimeBucketsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDNetworkServiceProxyControlRequestStatistics addResponseTimeBuckets:](self, "addResponseTimeBuckets:", objc_msgSend(a3, "responseTimeBucketsAtIndex:", i));
  }
  if ((*((_WORD *)a3 + 62) & 0x800) != 0)
  {
    self->_protocolType = *((_DWORD *)a3 + 29);
    *(_WORD *)&self->_has |= 0x800u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (unint64_t)resultSuccessCount
{
  return self->_resultSuccessCount;
}

- (unint64_t)resultNetworkUnavailableCount
{
  return self->_resultNetworkUnavailableCount;
}

- (unint64_t)resultServerUnreachableCount
{
  return self->_resultServerUnreachableCount;
}

- (unint64_t)resultSendFailureCount
{
  return self->_resultSendFailureCount;
}

- (unint64_t)resultResponseTimeoutCount
{
  return self->_resultResponseTimeoutCount;
}

- (unint64_t)resultConnectionResetCount
{
  return self->_resultConnectionResetCount;
}

- (unint64_t)resultCertificateFailureCount
{
  return self->_resultCertificateFailureCount;
}

- (unint64_t)resultUnknownErrorCount
{
  return self->_resultUnknownErrorCount;
}

@end
