@implementation AWDNetworkServiceProxyRequestStatistics

- (void)dealloc
{
  objc_super v3;

  -[AWDNetworkServiceProxyRequestStatistics setFirstPartyServiceName:](self, "setFirstPartyServiceName:", 0);
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyRequestStatistics;
  -[AWDNetworkServiceProxyRequestStatistics dealloc](&v3, sel_dealloc);
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

- (int)interfaceType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_interfaceType;
  else
    return 1;
}

- (void)setInterfaceType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInterfaceType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DE80[a3 - 1];
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

- (BOOL)hasFirstPartyServiceName
{
  return self->_firstPartyServiceName != 0;
}

- (void)setRequestCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_requestCount = a3;
}

- (void)setHasRequestCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRequestCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRequestFailedCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_requestFailedCount = a3;
}

- (void)setHasRequestFailedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRequestFailedCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDirectConnectionCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_directConnectionCount = a3;
}

- (void)setHasDirectConnectionCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDirectConnectionCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDirectConnectionFailedCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_directConnectionFailedCount = a3;
}

- (void)setHasDirectConnectionFailedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDirectConnectionFailedCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)firstByteBucketsCount
{
  return self->_firstByteBuckets.count;
}

- (unsigned)firstByteBuckets
{
  return self->_firstByteBuckets.list;
}

- (void)clearFirstByteBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addFirstByteBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)firstByteBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_firstByteBuckets;
  unint64_t count;

  p_firstByteBuckets = &self->_firstByteBuckets;
  count = self->_firstByteBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_firstByteBuckets->list[a3];
}

- (void)setFirstByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)lastByteBucketsCount
{
  return self->_lastByteBuckets.count;
}

- (unsigned)lastByteBuckets
{
  return self->_lastByteBuckets.list;
}

- (void)clearLastByteBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addLastByteBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)lastByteBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_lastByteBuckets;
  unint64_t count;

  p_lastByteBuckets = &self->_lastByteBuckets;
  count = self->_lastByteBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_lastByteBuckets->list[a3];
}

- (void)setLastByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)directConnectionFirstByteBucketsCount
{
  return self->_directConnectionFirstByteBuckets.count;
}

- (unsigned)directConnectionFirstByteBuckets
{
  return self->_directConnectionFirstByteBuckets.list;
}

- (void)clearDirectConnectionFirstByteBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addDirectConnectionFirstByteBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)directConnectionFirstByteBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_directConnectionFirstByteBuckets;
  unint64_t count;

  p_directConnectionFirstByteBuckets = &self->_directConnectionFirstByteBuckets;
  count = self->_directConnectionFirstByteBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_directConnectionFirstByteBuckets->list[a3];
}

- (void)setDirectConnectionFirstByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)directConnectionLastByteBucketsCount
{
  return self->_directConnectionLastByteBuckets.count;
}

- (unsigned)directConnectionLastByteBuckets
{
  return self->_directConnectionLastByteBuckets.list;
}

- (void)clearDirectConnectionLastByteBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addDirectConnectionLastByteBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)directConnectionLastByteBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_directConnectionLastByteBuckets;
  unint64_t count;

  p_directConnectionLastByteBuckets = &self->_directConnectionLastByteBuckets;
  count = self->_directConnectionLastByteBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_directConnectionLastByteBuckets->list[a3];
}

- (void)setDirectConnectionLastByteBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)udpRttBucketsCount
{
  return self->_udpRttBuckets.count;
}

- (unsigned)udpRttBuckets
{
  return self->_udpRttBuckets.list;
}

- (void)clearUdpRttBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addUdpRttBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)udpRttBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_udpRttBuckets;
  unint64_t count;

  p_udpRttBuckets = &self->_udpRttBuckets;
  count = self->_udpRttBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_udpRttBuckets->list[a3];
}

- (void)setUdpRttBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (int)protocolType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_protocolType;
  else
    return 1;
}

- (void)setProtocolType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_protocolType = a3;
}

- (void)setHasProtocolType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasProtocolType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)protocolTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DEA0[a3 - 1];
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
  v3.super_class = (Class)AWDNetworkServiceProxyRequestStatistics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNetworkServiceProxyRequestStatistics description](&v3, sel_description), -[AWDNetworkServiceProxyRequestStatistics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  NSString *firstPartyServiceName;
  char v8;
  unsigned int v9;
  __CFString *v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5 = self->_interfaceType - 1;
    if (v5 >= 4)
      v6 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interfaceType);
    else
      v6 = off_24C10DE80[v5];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("interface_type"));
  }
  firstPartyServiceName = self->_firstPartyServiceName;
  if (firstPartyServiceName)
    objc_msgSend(v3, "setObject:forKey:", firstPartyServiceName, CFSTR("first_party_service_name"));
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_requestCount), CFSTR("request_count"));
    v8 = (char)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_12:
      if ((v8 & 2) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_requestFailedCount), CFSTR("request_failed_count"));
  v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_13:
    if ((v8 & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_directConnectionCount), CFSTR("direct_connection_count"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_directConnectionFailedCount), CFSTR("direct_connection_failed_count"));
LABEL_15:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("first_byte_buckets"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("last_byte_buckets"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("direct_connection_first_byte_buckets"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("direct_connection_last_byte_buckets"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("udp_rtt_buckets"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v9 = self->_protocolType - 1;
    if (v9 >= 3)
      v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_protocolType);
    else
      v10 = off_24C10DEA0[v9];
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("protocol_type"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkServiceProxyRequestStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_firstPartyServiceName)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  v5 = (char)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field();
LABEL_12:
  if (self->_firstByteBuckets.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_firstByteBuckets.count);
  }
  if (self->_lastByteBuckets.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_lastByteBuckets.count);
  }
  if (self->_directConnectionFirstByteBuckets.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v8;
    }
    while (v8 < self->_directConnectionFirstByteBuckets.count);
  }
  if (self->_directConnectionLastByteBuckets.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < self->_directConnectionLastByteBuckets.count);
  }
  if (self->_udpRttBuckets.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < self->_udpRttBuckets.count);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 16) = self->_timestamp;
    *((_BYTE *)a3 + 168) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 38) = self->_interfaceType;
    *((_BYTE *)a3 + 168) |= 8u;
  }
  if (self->_firstPartyServiceName)
    objc_msgSend(a3, "setFirstPartyServiceName:");
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 40) = self->_requestCount;
    *((_BYTE *)a3 + 168) |= 0x20u;
    v6 = (char)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
LABEL_37:
      *((_DWORD *)a3 + 34) = self->_directConnectionCount;
      *((_BYTE *)a3 + 168) |= 2u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 41) = self->_requestFailedCount;
  *((_BYTE *)a3 + 168) |= 0x40u;
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
    goto LABEL_37;
LABEL_10:
  if ((v6 & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 35) = self->_directConnectionFailedCount;
    *((_BYTE *)a3 + 168) |= 4u;
  }
LABEL_12:
  if (-[AWDNetworkServiceProxyRequestStatistics firstByteBucketsCount](self, "firstByteBucketsCount"))
  {
    objc_msgSend(a3, "clearFirstByteBuckets");
    v7 = -[AWDNetworkServiceProxyRequestStatistics firstByteBucketsCount](self, "firstByteBucketsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addFirstByteBuckets:", -[AWDNetworkServiceProxyRequestStatistics firstByteBucketsAtIndex:](self, "firstByteBucketsAtIndex:", i));
    }
  }
  if (-[AWDNetworkServiceProxyRequestStatistics lastByteBucketsCount](self, "lastByteBucketsCount"))
  {
    objc_msgSend(a3, "clearLastByteBuckets");
    v10 = -[AWDNetworkServiceProxyRequestStatistics lastByteBucketsCount](self, "lastByteBucketsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addLastByteBuckets:", -[AWDNetworkServiceProxyRequestStatistics lastByteBucketsAtIndex:](self, "lastByteBucketsAtIndex:", j));
    }
  }
  if (-[AWDNetworkServiceProxyRequestStatistics directConnectionFirstByteBucketsCount](self, "directConnectionFirstByteBucketsCount"))
  {
    objc_msgSend(a3, "clearDirectConnectionFirstByteBuckets");
    v13 = -[AWDNetworkServiceProxyRequestStatistics directConnectionFirstByteBucketsCount](self, "directConnectionFirstByteBucketsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(a3, "addDirectConnectionFirstByteBuckets:", -[AWDNetworkServiceProxyRequestStatistics directConnectionFirstByteBucketsAtIndex:](self, "directConnectionFirstByteBucketsAtIndex:", k));
    }
  }
  if (-[AWDNetworkServiceProxyRequestStatistics directConnectionLastByteBucketsCount](self, "directConnectionLastByteBucketsCount"))
  {
    objc_msgSend(a3, "clearDirectConnectionLastByteBuckets");
    v16 = -[AWDNetworkServiceProxyRequestStatistics directConnectionLastByteBucketsCount](self, "directConnectionLastByteBucketsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(a3, "addDirectConnectionLastByteBuckets:", -[AWDNetworkServiceProxyRequestStatistics directConnectionLastByteBucketsAtIndex:](self, "directConnectionLastByteBucketsAtIndex:", m));
    }
  }
  if (-[AWDNetworkServiceProxyRequestStatistics udpRttBucketsCount](self, "udpRttBucketsCount"))
  {
    objc_msgSend(a3, "clearUdpRttBuckets");
    v19 = -[AWDNetworkServiceProxyRequestStatistics udpRttBucketsCount](self, "udpRttBucketsCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(a3, "addUdpRttBuckets:", -[AWDNetworkServiceProxyRequestStatistics udpRttBucketsAtIndex:](self, "udpRttBucketsAtIndex:", n));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 39) = self->_protocolType;
    *((_BYTE *)a3 + 168) |= 0x10u;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 128) = self->_timestamp;
    *(_BYTE *)(v5 + 168) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_interfaceType;
    *(_BYTE *)(v5 + 168) |= 8u;
  }

  *(_QWORD *)(v6 + 144) = -[NSString copyWithZone:](self->_firstPartyServiceName, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_requestCount;
    *(_BYTE *)(v6 + 168) |= 0x20u;
    v8 = (char)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_7:
      if ((v8 & 2) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 164) = self->_requestFailedCount;
  *(_BYTE *)(v6 + 168) |= 0x40u;
  v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_8:
    if ((v8 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_15:
  *(_DWORD *)(v6 + 136) = self->_directConnectionCount;
  *(_BYTE *)(v6 + 168) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 140) = self->_directConnectionFailedCount;
    *(_BYTE *)(v6 + 168) |= 4u;
  }
LABEL_10:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 156) = self->_protocolType;
    *(_BYTE *)(v6 + 168) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  char has;
  NSString *firstPartyServiceName;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 168) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 16))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 168) & 1) != 0)
    {
LABEL_44:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 168) & 8) == 0 || self->_interfaceType != *((_DWORD *)a3 + 38))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 168) & 8) != 0)
    {
      goto LABEL_44;
    }
    firstPartyServiceName = self->_firstPartyServiceName;
    if ((unint64_t)firstPartyServiceName | *((_QWORD *)a3 + 18))
    {
      IsEqual = -[NSString isEqual:](firstPartyServiceName, "isEqual:");
      if (!IsEqual)
        return IsEqual;
      has = (char)self->_has;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 168) & 0x20) == 0 || self->_requestCount != *((_DWORD *)a3 + 40))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 168) & 0x20) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 168) & 0x40) == 0 || self->_requestFailedCount != *((_DWORD *)a3 + 41))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 168) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 168) & 2) == 0 || self->_directConnectionCount != *((_DWORD *)a3 + 34))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 168) & 2) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 168) & 4) == 0 || self->_directConnectionFailedCount != *((_DWORD *)a3 + 35))
        goto LABEL_44;
    }
    else if ((*((_BYTE *)a3 + 168) & 4) != 0)
    {
      goto LABEL_44;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        IsEqual = PBRepeatedUInt32IsEqual();
        if (IsEqual)
        {
          IsEqual = PBRepeatedUInt32IsEqual();
          if (IsEqual)
          {
            IsEqual = PBRepeatedUInt32IsEqual();
            if (IsEqual)
            {
              LOBYTE(IsEqual) = (*((_BYTE *)a3 + 168) & 0x10) == 0;
              if ((*(_BYTE *)&self->_has & 0x10) != 0)
              {
                if ((*((_BYTE *)a3 + 168) & 0x10) == 0 || self->_protocolType != *((_DWORD *)a3 + 39))
                  goto LABEL_44;
                LOBYTE(IsEqual) = 1;
              }
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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v16 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v15 = 2654435761 * self->_interfaceType;
      goto LABEL_6;
    }
  }
  v15 = 0;
LABEL_6:
  v14 = -[NSString hash](self->_firstPartyServiceName, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v13 = 2654435761 * self->_requestCount;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_8:
      v3 = 2654435761 * self->_requestFailedCount;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_9;
LABEL_13:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_10;
      goto LABEL_14;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_9:
  v4 = 2654435761 * self->_directConnectionCount;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_10:
    v5 = 2654435761 * self->_directConnectionFailedCount;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
LABEL_15:
  v6 = PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt32Hash();
  v8 = PBRepeatedUInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  v10 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v11 = 2654435761 * self->_protocolType;
  else
    v11 = 0;
  return v15 ^ v16 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  uint64_t v16;
  uint64_t v17;
  uint64_t m;
  uint64_t v19;
  uint64_t v20;
  uint64_t n;

  v5 = *((_BYTE *)a3 + 168);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 16);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 168);
  }
  if ((v5 & 8) != 0)
  {
    self->_interfaceType = *((_DWORD *)a3 + 38);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 18))
    -[AWDNetworkServiceProxyRequestStatistics setFirstPartyServiceName:](self, "setFirstPartyServiceName:");
  v6 = *((_BYTE *)a3 + 168);
  if ((v6 & 0x20) != 0)
  {
    self->_requestCount = *((_DWORD *)a3 + 40);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)a3 + 168);
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)a3 + 168) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_requestFailedCount = *((_DWORD *)a3 + 41);
  *(_BYTE *)&self->_has |= 0x40u;
  v6 = *((_BYTE *)a3 + 168);
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_32:
  self->_directConnectionCount = *((_DWORD *)a3 + 34);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 168) & 4) != 0)
  {
LABEL_11:
    self->_directConnectionFailedCount = *((_DWORD *)a3 + 35);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_12:
  v7 = objc_msgSend(a3, "firstByteBucketsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[AWDNetworkServiceProxyRequestStatistics addFirstByteBuckets:](self, "addFirstByteBuckets:", objc_msgSend(a3, "firstByteBucketsAtIndex:", i));
  }
  v10 = objc_msgSend(a3, "lastByteBucketsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[AWDNetworkServiceProxyRequestStatistics addLastByteBuckets:](self, "addLastByteBuckets:", objc_msgSend(a3, "lastByteBucketsAtIndex:", j));
  }
  v13 = objc_msgSend(a3, "directConnectionFirstByteBucketsCount");
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[AWDNetworkServiceProxyRequestStatistics addDirectConnectionFirstByteBuckets:](self, "addDirectConnectionFirstByteBuckets:", objc_msgSend(a3, "directConnectionFirstByteBucketsAtIndex:", k));
  }
  v16 = objc_msgSend(a3, "directConnectionLastByteBucketsCount");
  if (v16)
  {
    v17 = v16;
    for (m = 0; m != v17; ++m)
      -[AWDNetworkServiceProxyRequestStatistics addDirectConnectionLastByteBuckets:](self, "addDirectConnectionLastByteBuckets:", objc_msgSend(a3, "directConnectionLastByteBucketsAtIndex:", m));
  }
  v19 = objc_msgSend(a3, "udpRttBucketsCount");
  if (v19)
  {
    v20 = v19;
    for (n = 0; n != v20; ++n)
      -[AWDNetworkServiceProxyRequestStatistics addUdpRttBuckets:](self, "addUdpRttBuckets:", objc_msgSend(a3, "udpRttBucketsAtIndex:", n));
  }
  if ((*((_BYTE *)a3 + 168) & 0x10) != 0)
  {
    self->_protocolType = *((_DWORD *)a3 + 39);
    *(_BYTE *)&self->_has |= 0x10u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)firstPartyServiceName
{
  return self->_firstPartyServiceName;
}

- (void)setFirstPartyServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (unsigned)requestCount
{
  return self->_requestCount;
}

- (unsigned)requestFailedCount
{
  return self->_requestFailedCount;
}

- (unsigned)directConnectionCount
{
  return self->_directConnectionCount;
}

- (unsigned)directConnectionFailedCount
{
  return self->_directConnectionFailedCount;
}

@end
