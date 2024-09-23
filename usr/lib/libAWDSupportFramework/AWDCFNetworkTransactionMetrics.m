@implementation AWDCFNetworkTransactionMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDCFNetworkTransactionMetrics setConnectionUUID:](self, "setConnectionUUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTransactionMetrics;
  -[AWDCFNetworkTransactionMetrics dealloc](&v3, sel_dealloc);
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

- (int)networkProtocolName
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_networkProtocolName;
  else
    return 1;
}

- (void)setNetworkProtocolName:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_networkProtocolName = a3;
}

- (void)setHasNetworkProtocolName:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasNetworkProtocolName
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)networkProtocolNameAsString:(int)a3
{
  if ((a3 - 1) >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D880[a3 - 1];
}

- (int)StringAsNetworkProtocolName:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("UNKNOWN_PROTOCOL_NAME")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("HTTP_1_0")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("HTTP_1_1")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("HTTP_2")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HTTP_3")))
    return 5;
  return 1;
}

- (int)networkLoadType
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_networkLoadType;
  else
    return 0;
}

- (void)setNetworkLoadType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_networkLoadType = a3;
}

- (void)setHasNetworkLoadType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasNetworkLoadType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)networkLoadTypeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D8A8[a3];
}

- (int)StringAsNetworkLoadType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLSessionTaskMetricsResourceFetchTypeUnknown")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLSessionTaskMetricsResourceFetchTypeNetworkLoad")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLSessionTaskMetricsResourceFetchTypeServerPush")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSURLSessionTaskMetricsResourceFetchTypeLocalCache")))
    return 3;
  return 0;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_reusedConnection = a3;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasReusedConnection
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setIsRedirected:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isRedirected = a3;
}

- (void)setHasIsRedirected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsRedirected
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setRequestStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_requestStart = a3;
}

- (void)setHasRequestStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRequestStart
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRequestEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_requestEnd = a3;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRequestEnd
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setResponseStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_responseStart = a3;
}

- (void)setHasResponseStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasResponseStart
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResponseEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_responseEnd = a3;
}

- (void)setHasResponseEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasResponseEnd
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTotalBytesWritten:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_totalBytesWritten = a3;
}

- (void)setHasTotalBytesWritten:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTotalBytesWritten
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTotalBytesRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalBytesRead = a3;
}

- (void)setHasTotalBytesRead:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalBytesRead
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasConnectionUUID
{
  return self->_connectionUUID != 0;
}

- (void)setApsRelayAttempted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_apsRelayAttempted = a3;
}

- (void)setHasApsRelayAttempted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasApsRelayAttempted
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setApsRelaySucceeded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_apsRelaySucceeded = a3;
}

- (void)setHasApsRelaySucceeded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasApsRelaySucceeded
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setTotalBytesExpectedToWrite:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalBytesExpectedToWrite = a3;
}

- (void)setHasTotalBytesExpectedToWrite:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalBytesExpectedToWrite
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTotalBytesExpectedToRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_totalBytesExpectedToRead = a3;
}

- (void)setHasTotalBytesExpectedToRead:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTotalBytesExpectedToRead
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)http3Status
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_http3Status;
  else
    return 1;
}

- (void)setHttp3Status:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_http3Status = a3;
}

- (void)setHasHttp3Status:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHttp3Status
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)http3StatusAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D8C8[a3 - 1];
}

- (int)StringAsHttp3Status:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NOT_ENABLED")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NO_KNOWLEDGE")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ALT_SVC")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("KNOWN_CAPABLE")))
    return 4;
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTransactionMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCFNetworkTransactionMetrics description](&v3, sel_description), -[AWDCFNetworkTransactionMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *connectionUUID;
  __int16 v6;
  unsigned int v7;
  __CFString *v8;
  unsigned int v9;
  __CFString *v10;
  uint64_t networkLoadType;
  __CFString *v12;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v7 = self->_networkProtocolName - 1;
  if (v7 >= 5)
    v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_networkProtocolName);
  else
    v8 = off_24C10D880[v7];
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("networkProtocolName"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_32:
  networkLoadType = self->_networkLoadType;
  if (networkLoadType >= 4)
    v12 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_networkLoadType);
  else
    v12 = off_24C10D8A8[networkLoadType];
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("networkLoadType"));
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reusedConnection), CFSTR("reusedConnection"));
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isRedirected), CFSTR("isRedirected"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestStart), CFSTR("requestStart"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestEnd), CFSTR("requestEnd"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_responseStart), CFSTR("responseStart"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_responseEnd), CFSTR("responseEnd"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalBytesWritten), CFSTR("totalBytesWritten"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_12:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalBytesRead), CFSTR("totalBytesRead"));
LABEL_13:
  connectionUUID = self->_connectionUUID;
  if (connectionUUID)
    objc_msgSend(v3, "setObject:forKey:", connectionUUID, CFSTR("connectionUUID"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_apsRelayAttempted), CFSTR("apsRelayAttempted"));
    v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_apsRelaySucceeded), CFSTR("apsRelaySucceeded"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0)
      goto LABEL_19;
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalBytesExpectedToRead), CFSTR("totalBytesExpectedToRead"));
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v3;
    goto LABEL_28;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalBytesExpectedToWrite), CFSTR("totalBytesExpectedToWrite"));
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
    goto LABEL_27;
LABEL_19:
  if ((v6 & 0x200) == 0)
    return v3;
LABEL_28:
  v9 = self->_http3Status - 1;
  if (v9 >= 4)
    v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_http3Status);
  else
    v10 = off_24C10D8C8[v9];
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("http3Status"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkTransactionMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_12:
    PBDataWriterWriteUint64Field();
LABEL_13:
  if (self->_connectionUUID)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_has;
    if ((v5 & 0x2000) == 0)
    {
LABEL_17:
      if ((v5 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_19:
    if ((v5 & 0x200) == 0)
      return;
LABEL_36:
    PBDataWriterWriteInt32Field();
    return;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    goto LABEL_36;
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 24) = self->_networkProtocolName;
  *((_WORD *)a3 + 52) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 23) = self->_networkLoadType;
  *((_WORD *)a3 + 52) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)a3 + 103) = self->_reusedConnection;
  *((_WORD *)a3 + 52) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)a3 + 102) = self->_isRedirected;
  *((_WORD *)a3 + 52) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 2) = self->_requestStart;
  *((_WORD *)a3 + 52) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 1) = self->_requestEnd;
  *((_WORD *)a3 + 52) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 4) = self->_responseStart;
  *((_WORD *)a3 + 52) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)a3 + 3) = self->_responseEnd;
  *((_WORD *)a3 + 52) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_31:
  *((_QWORD *)a3 + 9) = self->_totalBytesWritten;
  *((_WORD *)a3 + 52) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    *((_QWORD *)a3 + 8) = self->_totalBytesRead;
    *((_WORD *)a3 + 52) |= 0x80u;
  }
LABEL_13:
  if (self->_connectionUUID)
    objc_msgSend(a3, "setConnectionUUID:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
  {
    *((_BYTE *)a3 + 100) = self->_apsRelayAttempted;
    *((_WORD *)a3 + 52) |= 0x1000u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  *((_BYTE *)a3 + 101) = self->_apsRelaySucceeded;
  *((_WORD *)a3 + 52) |= 0x2000u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 7) = self->_totalBytesExpectedToWrite;
  *((_WORD *)a3 + 52) |= 0x40u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0)
      return;
    goto LABEL_20;
  }
LABEL_36:
  *((_QWORD *)a3 + 6) = self->_totalBytesExpectedToRead;
  *((_WORD *)a3 + 52) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    return;
LABEL_20:
  *((_DWORD *)a3 + 22) = self->_http3Status;
  *((_WORD *)a3 + 52) |= 0x200u;
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
  if ((has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_networkProtocolName;
  *(_WORD *)(v5 + 104) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 92) = self->_networkLoadType;
  *(_WORD *)(v5 + 104) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_5:
    if ((has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_BYTE *)(v5 + 103) = self->_reusedConnection;
  *(_WORD *)(v5 + 104) |= 0x8000u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_BYTE *)(v5 + 102) = self->_isRedirected;
  *(_WORD *)(v5 + 104) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(_QWORD *)(v5 + 16) = self->_requestStart;
  *(_WORD *)(v5 + 104) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_QWORD *)(v5 + 8) = self->_requestEnd;
  *(_WORD *)(v5 + 104) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_QWORD *)(v5 + 32) = self->_responseStart;
  *(_WORD *)(v5 + 104) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(_QWORD *)(v5 + 24) = self->_responseEnd;
  *(_WORD *)(v5 + 104) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  *(_QWORD *)(v5 + 72) = self->_totalBytesWritten;
  *(_WORD *)(v5 + 104) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 64) = self->_totalBytesRead;
    *(_WORD *)(v5 + 104) |= 0x80u;
  }
LABEL_13:

  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_connectionUUID, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x1000) != 0)
  {
    *(_BYTE *)(v6 + 100) = self->_apsRelayAttempted;
    *(_WORD *)(v6 + 104) |= 0x1000u;
    v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_15:
      if ((v8 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  *(_BYTE *)(v6 + 101) = self->_apsRelaySucceeded;
  *(_WORD *)(v6 + 104) |= 0x2000u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) == 0)
  {
LABEL_16:
    if ((v8 & 0x20) == 0)
      goto LABEL_17;
LABEL_34:
    *(_QWORD *)(v6 + 48) = self->_totalBytesExpectedToRead;
    *(_WORD *)(v6 + 104) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return (id)v6;
    goto LABEL_18;
  }
LABEL_33:
  *(_QWORD *)(v6 + 56) = self->_totalBytesExpectedToWrite;
  *(_WORD *)(v6 + 104) |= 0x40u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
    goto LABEL_34;
LABEL_17:
  if ((v8 & 0x200) != 0)
  {
LABEL_18:
    *(_DWORD *)(v6 + 88) = self->_http3Status;
    *(_WORD *)(v6 + 104) |= 0x200u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *connectionUUID;
  __int16 v9;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 52);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 5))
      goto LABEL_96;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_networkProtocolName != *((_DWORD *)a3 + 24))
      goto LABEL_96;
  }
  else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_networkLoadType != *((_DWORD *)a3 + 23))
      goto LABEL_96;
  }
  else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x8000) == 0)
      goto LABEL_96;
    if (self->_reusedConnection)
    {
      if (!*((_BYTE *)a3 + 103))
        goto LABEL_96;
    }
    else if (*((_BYTE *)a3 + 103))
    {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x8000) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x4000) == 0)
      goto LABEL_96;
    if (self->_isRedirected)
    {
      if (!*((_BYTE *)a3 + 102))
        goto LABEL_96;
    }
    else if (*((_BYTE *)a3 + 102))
    {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x4000) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_requestStart != *((_QWORD *)a3 + 2))
      goto LABEL_96;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_requestEnd != *((_QWORD *)a3 + 1))
      goto LABEL_96;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_responseStart != *((_QWORD *)a3 + 4))
      goto LABEL_96;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_responseEnd != *((_QWORD *)a3 + 3))
      goto LABEL_96;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_96;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_totalBytesWritten != *((_QWORD *)a3 + 9))
      goto LABEL_96;
  }
  else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_totalBytesRead != *((_QWORD *)a3 + 8))
      goto LABEL_96;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_96;
  }
  connectionUUID = self->_connectionUUID;
  if ((unint64_t)connectionUUID | *((_QWORD *)a3 + 10))
  {
    v5 = -[NSString isEqual:](connectionUUID, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)a3 + 52);
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x1000) == 0)
      goto LABEL_96;
    if (self->_apsRelayAttempted)
    {
      if (!*((_BYTE *)a3 + 100))
        goto LABEL_96;
    }
    else if (*((_BYTE *)a3 + 100))
    {
      goto LABEL_96;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x1000) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 0x2000) == 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x2000) != 0)
      goto LABEL_96;
    goto LABEL_82;
  }
  if ((*((_WORD *)a3 + 52) & 0x2000) == 0)
    goto LABEL_96;
  if (self->_apsRelaySucceeded)
  {
    if (!*((_BYTE *)a3 + 101))
      goto LABEL_96;
    goto LABEL_82;
  }
  if (*((_BYTE *)a3 + 101))
  {
LABEL_96:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_82:
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_totalBytesExpectedToWrite != *((_QWORD *)a3 + 7))
      goto LABEL_96;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_96;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_totalBytesExpectedToRead != *((_QWORD *)a3 + 6))
      goto LABEL_96;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_96;
  }
  LOBYTE(v5) = (v9 & 0x200) == 0;
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_http3Status != *((_DWORD *)a3 + 22))
      goto LABEL_96;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  __int16 v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v25;
  unint64_t v26;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_networkProtocolName;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_networkLoadType;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_reusedConnection;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isRedirected;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v9 = 2654435761u * self->_requestStart;
    if ((has & 1) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v9 = 0;
  if ((has & 1) != 0)
  {
LABEL_8:
    v10 = 2654435761u * self->_requestEnd;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v11 = 2654435761u * self->_responseStart;
    if ((has & 4) != 0)
      goto LABEL_10;
LABEL_20:
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v11 = 0;
  if ((has & 4) == 0)
    goto LABEL_20;
LABEL_10:
  v12 = 2654435761u * self->_responseEnd;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    v13 = 2654435761u * self->_totalBytesWritten;
    goto LABEL_22;
  }
LABEL_21:
  v13 = 0;
LABEL_22:
  v25 = v12;
  v26 = v13;
  v14 = v9;
  if ((has & 0x80) != 0)
    v15 = 2654435761u * self->_totalBytesRead;
  else
    v15 = 0;
  v16 = -[NSString hash](self->_connectionUUID, "hash");
  v17 = (__int16)self->_has;
  if ((v17 & 0x1000) != 0)
  {
    v18 = 2654435761 * self->_apsRelayAttempted;
    v19 = v25;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_27:
      v20 = 2654435761 * self->_apsRelaySucceeded;
      if ((v17 & 0x40) != 0)
        goto LABEL_28;
      goto LABEL_33;
    }
  }
  else
  {
    v18 = 0;
    v19 = v25;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_27;
  }
  v20 = 0;
  if ((v17 & 0x40) != 0)
  {
LABEL_28:
    v21 = 2654435761u * self->_totalBytesExpectedToWrite;
    if ((v17 & 0x20) != 0)
      goto LABEL_29;
LABEL_34:
    v22 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_30;
LABEL_35:
    v23 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v14 ^ v10 ^ v11 ^ v19 ^ v26 ^ v15 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v16;
  }
LABEL_33:
  v21 = 0;
  if ((v17 & 0x20) == 0)
    goto LABEL_34;
LABEL_29:
  v22 = 2654435761u * self->_totalBytesExpectedToRead;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_35;
LABEL_30:
  v23 = 2654435761 * self->_http3Status;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v14 ^ v10 ^ v11 ^ v19 ^ v26 ^ v15 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;

  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)a3 + 52);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_networkProtocolName = *((_DWORD *)a3 + 24);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x400) == 0)
  {
LABEL_4:
    if ((v5 & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_networkLoadType = *((_DWORD *)a3 + 23);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x8000) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_reusedConnection = *((_BYTE *)a3 + 103);
  *(_WORD *)&self->_has |= 0x8000u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_isRedirected = *((_BYTE *)a3 + 102);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_requestStart = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_requestEnd = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_responseStart = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_responseEnd = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_31:
  self->_totalBytesWritten = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 52) & 0x80) != 0)
  {
LABEL_12:
    self->_totalBytesRead = *((_QWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_13:
  if (*((_QWORD *)a3 + 10))
    -[AWDCFNetworkTransactionMetrics setConnectionUUID:](self, "setConnectionUUID:");
  v6 = *((_WORD *)a3 + 52);
  if ((v6 & 0x1000) != 0)
  {
    self->_apsRelayAttempted = *((_BYTE *)a3 + 100);
    *(_WORD *)&self->_has |= 0x1000u;
    v6 = *((_WORD *)a3 + 52);
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_35;
    }
  }
  else if ((*((_WORD *)a3 + 52) & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  self->_apsRelaySucceeded = *((_BYTE *)a3 + 101);
  *(_WORD *)&self->_has |= 0x2000u;
  v6 = *((_WORD *)a3 + 52);
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  self->_totalBytesExpectedToWrite = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)a3 + 52);
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0)
      return;
    goto LABEL_20;
  }
LABEL_36:
  self->_totalBytesExpectedToRead = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 52) & 0x200) == 0)
    return;
LABEL_20:
  self->_http3Status = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x200u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (BOOL)isRedirected
{
  return self->_isRedirected;
}

- (unint64_t)requestStart
{
  return self->_requestStart;
}

- (unint64_t)requestEnd
{
  return self->_requestEnd;
}

- (unint64_t)responseStart
{
  return self->_responseStart;
}

- (unint64_t)responseEnd
{
  return self->_responseEnd;
}

- (unint64_t)totalBytesWritten
{
  return self->_totalBytesWritten;
}

- (unint64_t)totalBytesRead
{
  return self->_totalBytesRead;
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)apsRelayAttempted
{
  return self->_apsRelayAttempted;
}

- (BOOL)apsRelaySucceeded
{
  return self->_apsRelaySucceeded;
}

- (unint64_t)totalBytesExpectedToWrite
{
  return self->_totalBytesExpectedToWrite;
}

- (unint64_t)totalBytesExpectedToRead
{
  return self->_totalBytesExpectedToRead;
}

@end
