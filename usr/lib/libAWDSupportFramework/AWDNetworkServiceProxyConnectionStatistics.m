@implementation AWDNetworkServiceProxyConnectionStatistics

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyConnectionStatistics;
  -[AWDNetworkServiceProxyConnectionStatistics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)interfaceType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    return self->_interfaceType;
  else
    return 1;
}

- (void)setInterfaceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasInterfaceType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DDD8[a3 - 1];
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

- (void)setConnectionCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_connectionCount = a3;
}

- (void)setHasConnectionCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConnectionCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTfoSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tfoSuccessCount = a3;
}

- (void)setHasTfoSuccessCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTfoSuccessCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMptcpSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_mptcpSuccessCount = a3;
}

- (void)setHasMptcpSuccessCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMptcpSuccessCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRestrictedNetworkCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_restrictedNetworkCount = a3;
}

- (void)setHasRestrictedNetworkCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRestrictedNetworkCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCaptivePresentCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_captivePresentCount = a3;
}

- (void)setHasCaptivePresentCount:(BOOL)a3
{
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCaptivePresentCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setResultSuccessCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_resultSuccessCount = a3;
}

- (void)setHasResultSuccessCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasResultSuccessCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setResultNetworkUnavailableCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_resultNetworkUnavailableCount = a3;
}

- (void)setHasResultNetworkUnavailableCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasResultNetworkUnavailableCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setResultServerUnreachableCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_resultServerUnreachableCount = a3;
}

- (void)setHasResultServerUnreachableCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasResultServerUnreachableCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setResultSendFailureCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_resultSendFailureCount = a3;
}

- (void)setHasResultSendFailureCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasResultSendFailureCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setResultResponseTimeoutCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_resultResponseTimeoutCount = a3;
}

- (void)setHasResultResponseTimeoutCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasResultResponseTimeoutCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setResultConnectionResetCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_resultConnectionResetCount = a3;
}

- (void)setHasResultConnectionResetCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasResultConnectionResetCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setResultServerBusyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_resultServerBusyCount = a3;
}

- (void)setHasResultServerBusyCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasResultServerBusyCount
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setResultServerOfflineCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_resultServerOfflineCount = a3;
}

- (void)setHasResultServerOfflineCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasResultServerOfflineCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setResultServerDetachedCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_resultServerDetachedCount = a3;
}

- (void)setHasResultServerDetachedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasResultServerDetachedCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setResultServerInterruptCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_resultServerInterruptCount = a3;
}

- (void)setHasResultServerInterruptCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasResultServerInterruptCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setResultServerSessionExpiredCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_resultServerSessionExpiredCount = a3;
}

- (void)setHasResultServerSessionExpiredCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasResultServerSessionExpiredCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setResultUnknownErrorCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_resultUnknownErrorCount = a3;
}

- (void)setHasResultUnknownErrorCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasResultUnknownErrorCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRestrictedNetworkFailedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_restrictedNetworkFailedCount = a3;
}

- (void)setHasRestrictedNetworkFailedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasRestrictedNetworkFailedCount
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setCaptivePresentFailedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_captivePresentFailedCount = a3;
}

- (void)setHasCaptivePresentFailedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasCaptivePresentFailedCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAlternatePathCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_alternatePathCount = a3;
}

- (void)setHasAlternatePathCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAlternatePathCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setExceededMssCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_exceededMssCount = a3;
}

- (void)setHasExceededMssCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasExceededMssCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (unint64_t)connectionDurationBucketsCount
{
  return self->_connectionDurationBuckets.count;
}

- (unsigned)connectionDurationBuckets
{
  return self->_connectionDurationBuckets.list;
}

- (void)clearConnectionDurationBuckets
{
  PBRepeatedUInt32Clear();
}

- (void)addConnectionDurationBuckets:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)connectionDurationBucketsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_connectionDurationBuckets;
  unint64_t count;

  p_connectionDurationBuckets = &self->_connectionDurationBuckets;
  count = self->_connectionDurationBuckets.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_connectionDurationBuckets->list[a3];
}

- (void)setConnectionDurationBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (int)protocolType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    return self->_protocolType;
  else
    return 1;
}

- (void)setProtocolType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_protocolType = a3;
}

- (void)setHasProtocolType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasProtocolType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)protocolTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DDF8[a3 - 1];
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

- (void)setResultServerOrphanedCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_resultServerOrphanedCount = a3;
}

- (void)setHasResultServerOrphanedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($9970266CB1C3DB0A09F8AFAECC0F0C8E)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasResultServerOrphanedCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNetworkServiceProxyConnectionStatistics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNetworkServiceProxyConnectionStatistics description](&v3, sel_description), -[AWDNetworkServiceProxyConnectionStatistics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v5;
  unsigned int v6;
  __CFString *v7;
  unsigned int v8;
  __CFString *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  v8 = self->_interfaceType - 1;
  if (v8 >= 4)
    v9 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interfaceType);
  else
    v9 = off_24C10DDD8[v8];
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("interface_type"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionCount), CFSTR("connection_count"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tfoSuccessCount), CFSTR("tfo_success_count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_mptcpSuccessCount), CFSTR("mptcp_success_count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_restrictedNetworkCount), CFSTR("restricted_network_count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_captivePresentCount), CFSTR("captive_present_count"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultSuccessCount), CFSTR("result_success_count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultNetworkUnavailableCount), CFSTR("result_network_unavailable_count"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerUnreachableCount), CFSTR("result_server_unreachable_count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultSendFailureCount), CFSTR("result_send_failure_count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultResponseTimeoutCount), CFSTR("result_response_timeout_count"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultConnectionResetCount), CFSTR("result_connection_reset_count"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerBusyCount), CFSTR("result_server_busy_count"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerOfflineCount), CFSTR("result_server_offline_count"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerDetachedCount), CFSTR("result_server_detached_count"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerInterruptCount), CFSTR("result_server_interrupt_count"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerSessionExpiredCount), CFSTR("result_server_session_expired_count"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultUnknownErrorCount), CFSTR("result_unknown_error_count"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_restrictedNetworkFailedCount), CFSTR("restricted_network_failed_count"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_captivePresentFailedCount), CFSTR("captive_present_failed_count"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_alternatePathCount), CFSTR("alternate_path_count"));
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_24:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_exceededMssCount), CFSTR("exceeded_mss_count"));
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("connection_duration_buckets"));
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
    v6 = self->_protocolType - 1;
    if (v6 >= 3)
      v7 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_protocolType);
    else
      v7 = off_24C10DDF8[v6];
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("protocol_type"));
    v5 = self->_has;
  }
  if ((*(_WORD *)&v5 & 0x1000) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resultServerOrphanedCount), CFSTR("result_server_orphaned_count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNetworkServiceProxyConnectionStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has;
  unint64_t v5;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v6;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_connectionDurationBuckets.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_connectionDurationBuckets.count);
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v9;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((_QWORD *)a3 + 22) = self->_timestamp;
    *((_DWORD *)a3 + 52) |= 0x40000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 49) = self->_interfaceType;
  *((_DWORD *)a3 + 52) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 5) = self->_connectionCount;
  *((_DWORD *)a3 + 52) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)a3 + 21) = self->_tfoSuccessCount;
  *((_DWORD *)a3 + 52) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)a3 + 6) = self->_mptcpSuccessCount;
  *((_DWORD *)a3 + 52) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 7) = self->_restrictedNetworkCount;
  *((_DWORD *)a3 + 52) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)a3 + 4) = self->_captivePresentCount;
  *((_DWORD *)a3 + 52) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)a3 + 19) = self->_resultSuccessCount;
  *((_DWORD *)a3 + 52) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)a3 + 9) = self->_resultNetworkUnavailableCount;
  *((_DWORD *)a3 + 52) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)a3 + 18) = self->_resultServerUnreachableCount;
  *((_DWORD *)a3 + 52) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)a3 + 11) = self->_resultSendFailureCount;
  *((_DWORD *)a3 + 52) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)a3 + 10) = self->_resultResponseTimeoutCount;
  *((_DWORD *)a3 + 52) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)a3 + 8) = self->_resultConnectionResetCount;
  *((_DWORD *)a3 + 52) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)a3 + 12) = self->_resultServerBusyCount;
  *((_DWORD *)a3 + 52) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)a3 + 15) = self->_resultServerOfflineCount;
  *((_DWORD *)a3 + 52) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)a3 + 13) = self->_resultServerDetachedCount;
  *((_DWORD *)a3 + 52) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)a3 + 14) = self->_resultServerInterruptCount;
  *((_DWORD *)a3 + 52) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 17) = self->_resultServerSessionExpiredCount;
  *((_DWORD *)a3 + 52) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 20) = self->_resultUnknownErrorCount;
  *((_DWORD *)a3 + 52) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 51) = self->_restrictedNetworkFailedCount;
  *((_DWORD *)a3 + 52) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_23;
LABEL_55:
    *((_DWORD *)a3 + 46) = self->_alternatePathCount;
    *((_DWORD *)a3 + 52) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_54:
  *((_DWORD *)a3 + 47) = self->_captivePresentFailedCount;
  *((_DWORD *)a3 + 52) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
    goto LABEL_55;
LABEL_23:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_24:
    *((_DWORD *)a3 + 48) = self->_exceededMssCount;
    *((_DWORD *)a3 + 52) |= 0x200000u;
  }
LABEL_25:
  if (-[AWDNetworkServiceProxyConnectionStatistics connectionDurationBucketsCount](self, "connectionDurationBucketsCount"))
  {
    objc_msgSend(a3, "clearConnectionDurationBuckets");
    v6 = -[AWDNetworkServiceProxyConnectionStatistics connectionDurationBucketsCount](self, "connectionDurationBucketsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addConnectionDurationBuckets:", -[AWDNetworkServiceProxyConnectionStatistics connectionDurationBucketsAtIndex:](self, "connectionDurationBucketsAtIndex:", i));
    }
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    *((_DWORD *)a3 + 50) = self->_protocolType;
    *((_DWORD *)a3 + 52) |= 0x800000u;
    v9 = self->_has;
  }
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    *((_QWORD *)a3 + 16) = self->_resultServerOrphanedCount;
    *((_DWORD *)a3 + 52) |= 0x1000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *(_QWORD *)(v4 + 176) = self->_timestamp;
    *(_DWORD *)(v4 + 208) |= 0x40000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 196) = self->_interfaceType;
  *(_DWORD *)(v4 + 208) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v4 + 40) = self->_connectionCount;
  *(_DWORD *)(v4 + 208) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  *(_QWORD *)(v4 + 168) = self->_tfoSuccessCount;
  *(_DWORD *)(v4 + 208) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *(_QWORD *)(v4 + 48) = self->_mptcpSuccessCount;
  *(_DWORD *)(v4 + 208) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *(_QWORD *)(v4 + 56) = self->_restrictedNetworkCount;
  *(_DWORD *)(v4 + 208) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *(_QWORD *)(v4 + 32) = self->_captivePresentCount;
  *(_DWORD *)(v4 + 208) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *(_QWORD *)(v4 + 152) = self->_resultSuccessCount;
  *(_DWORD *)(v4 + 208) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *(_QWORD *)(v4 + 72) = self->_resultNetworkUnavailableCount;
  *(_DWORD *)(v4 + 208) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *(_QWORD *)(v4 + 144) = self->_resultServerUnreachableCount;
  *(_DWORD *)(v4 + 208) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  *(_QWORD *)(v4 + 88) = self->_resultSendFailureCount;
  *(_DWORD *)(v4 + 208) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  *(_QWORD *)(v4 + 80) = self->_resultResponseTimeoutCount;
  *(_DWORD *)(v4 + 208) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  *(_QWORD *)(v4 + 64) = self->_resultConnectionResetCount;
  *(_DWORD *)(v4 + 208) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  *(_QWORD *)(v4 + 96) = self->_resultServerBusyCount;
  *(_DWORD *)(v4 + 208) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  *(_QWORD *)(v4 + 120) = self->_resultServerOfflineCount;
  *(_DWORD *)(v4 + 208) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  *(_QWORD *)(v4 + 104) = self->_resultServerDetachedCount;
  *(_DWORD *)(v4 + 208) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  *(_QWORD *)(v4 + 112) = self->_resultServerInterruptCount;
  *(_DWORD *)(v4 + 208) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  *(_QWORD *)(v4 + 136) = self->_resultServerSessionExpiredCount;
  *(_DWORD *)(v4 + 208) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  *(_QWORD *)(v4 + 160) = self->_resultUnknownErrorCount;
  *(_DWORD *)(v4 + 208) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v4 + 204) = self->_restrictedNetworkFailedCount;
  *(_DWORD *)(v4 + 208) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v4 + 188) = self->_captivePresentFailedCount;
  *(_DWORD *)(v4 + 208) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_51:
  *(_DWORD *)(v4 + 184) = self->_alternatePathCount;
  *(_DWORD *)(v4 + 208) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_24:
    *(_DWORD *)(v4 + 192) = self->_exceededMssCount;
    *(_DWORD *)(v4 + 208) |= 0x200000u;
  }
LABEL_25:
  PBRepeatedUInt32Copy();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_protocolType;
    *(_DWORD *)(v5 + 208) |= 0x800000u;
    v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    *(_QWORD *)(v5 + 128) = self->_resultServerOrphanedCount;
    *(_DWORD *)(v5 + 208) |= 0x1000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has;
  int v7;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v8;
  int v9;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 52);
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_timestamp != *((_QWORD *)a3 + 22))
        goto LABEL_127;
    }
    else if ((v7 & 0x40000) != 0)
    {
LABEL_127:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_interfaceType != *((_DWORD *)a3 + 49))
        goto LABEL_127;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_connectionCount != *((_QWORD *)a3 + 5))
        goto LABEL_127;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_tfoSuccessCount != *((_QWORD *)a3 + 21))
        goto LABEL_127;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_mptcpSuccessCount != *((_QWORD *)a3 + 6))
        goto LABEL_127;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_restrictedNetworkCount != *((_QWORD *)a3 + 7))
        goto LABEL_127;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_captivePresentCount != *((_QWORD *)a3 + 4))
        goto LABEL_127;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_resultSuccessCount != *((_QWORD *)a3 + 19))
        goto LABEL_127;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_resultNetworkUnavailableCount != *((_QWORD *)a3 + 9))
        goto LABEL_127;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_resultServerUnreachableCount != *((_QWORD *)a3 + 18))
        goto LABEL_127;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_resultSendFailureCount != *((_QWORD *)a3 + 11))
        goto LABEL_127;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_resultResponseTimeoutCount != *((_QWORD *)a3 + 10))
        goto LABEL_127;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_resultConnectionResetCount != *((_QWORD *)a3 + 8))
        goto LABEL_127;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_resultServerBusyCount != *((_QWORD *)a3 + 12))
        goto LABEL_127;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_resultServerOfflineCount != *((_QWORD *)a3 + 15))
        goto LABEL_127;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_resultServerDetachedCount != *((_QWORD *)a3 + 13))
        goto LABEL_127;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_resultServerInterruptCount != *((_QWORD *)a3 + 14))
        goto LABEL_127;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_resultServerSessionExpiredCount != *((_QWORD *)a3 + 17))
        goto LABEL_127;
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_resultUnknownErrorCount != *((_QWORD *)a3 + 20))
        goto LABEL_127;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_restrictedNetworkFailedCount != *((_DWORD *)a3 + 51))
        goto LABEL_127;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_captivePresentFailedCount != *((_DWORD *)a3 + 47))
        goto LABEL_127;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_alternatePathCount != *((_DWORD *)a3 + 46))
        goto LABEL_127;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_127;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_exceededMssCount != *((_DWORD *)a3 + 48))
        goto LABEL_127;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_127;
    }
    IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      v8 = self->_has;
      v9 = *((_DWORD *)a3 + 52);
      if ((*(_DWORD *)&v8 & 0x800000) != 0)
      {
        if ((v9 & 0x800000) == 0 || self->_protocolType != *((_DWORD *)a3 + 50))
          goto LABEL_127;
      }
      else if ((v9 & 0x800000) != 0)
      {
        goto LABEL_127;
      }
      LOBYTE(IsEqual) = (*((_DWORD *)a3 + 52) & 0x1000) == 0;
      if ((*(_WORD *)&v8 & 0x1000) != 0)
      {
        if ((v9 & 0x1000) == 0 || self->_resultServerOrphanedCount != *((_QWORD *)a3 + 16))
          goto LABEL_127;
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $9970266CB1C3DB0A09F8AFAECC0F0C8E has;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $9970266CB1C3DB0A09F8AFAECC0F0C8E v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v31 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
LABEL_3:
      v30 = 2654435761 * self->_interfaceType;
      if ((*(_BYTE *)&has & 2) != 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else
  {
    v31 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_3;
  }
  v30 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_4:
    v29 = 2654435761u * self->_connectionCount;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  v29 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_5:
    v28 = 2654435761u * self->_tfoSuccessCount;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  v28 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_6:
    v27 = 2654435761u * self->_mptcpSuccessCount;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  v27 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_7:
    v26 = 2654435761u * self->_restrictedNetworkCount;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  v26 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_8:
    v25 = 2654435761u * self->_captivePresentCount;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  v25 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_9:
    v24 = 2654435761u * self->_resultSuccessCount;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  v24 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_10:
    v23 = 2654435761u * self->_resultNetworkUnavailableCount;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  v23 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    v22 = 2654435761u * self->_resultServerUnreachableCount;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_12:
    v21 = 2654435761u * self->_resultSendFailureCount;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_13:
    v20 = 2654435761u * self->_resultResponseTimeoutCount;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_14:
    v19 = 2654435761u * self->_resultConnectionResetCount;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  v19 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    v18 = 2654435761u * self->_resultServerBusyCount;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  v18 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    v17 = 2654435761u * self->_resultServerOfflineCount;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  v17 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_17:
    v4 = 2654435761u * self->_resultServerDetachedCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  v4 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_18:
    v5 = 2654435761u * self->_resultServerInterruptCount;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  v5 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_19:
    v6 = 2654435761u * self->_resultServerSessionExpiredCount;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_20:
    v7 = 2654435761u * self->_resultUnknownErrorCount;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_21:
    v8 = 2654435761 * self->_restrictedNetworkFailedCount;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    v9 = 2654435761 * self->_captivePresentFailedCount;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_23;
LABEL_46:
    v10 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_45:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0)
    goto LABEL_46;
LABEL_23:
  v10 = 2654435761 * self->_alternatePathCount;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_24:
    v11 = 2654435761 * self->_exceededMssCount;
    goto LABEL_48;
  }
LABEL_47:
  v11 = 0;
LABEL_48:
  v12 = PBRepeatedUInt32Hash();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    v14 = 2654435761 * self->_protocolType;
    if ((*(_WORD *)&v13 & 0x1000) != 0)
      goto LABEL_50;
LABEL_52:
    v15 = 0;
    return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  v14 = 0;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
    goto LABEL_52;
LABEL_50:
  v15 = 2654435761u * self->_resultServerOrphanedCount;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;

  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x40000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 22);
    *(_DWORD *)&self->_has |= 0x40000u;
    v5 = *((_DWORD *)a3 + 52);
    if ((v5 & 0x400000) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((v5 & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  self->_interfaceType = *((_DWORD *)a3 + 49);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  self->_connectionCount = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x20000) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  self->_tfoSuccessCount = *((_QWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  self->_mptcpSuccessCount = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  self->_restrictedNetworkCount = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  self->_captivePresentCount = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  self->_resultSuccessCount = *((_QWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  self->_resultNetworkUnavailableCount = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  self->_resultServerUnreachableCount = *((_QWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  self->_resultSendFailureCount = *((_QWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  self->_resultResponseTimeoutCount = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  self->_resultConnectionResetCount = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  self->_resultServerBusyCount = *((_QWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x800) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  self->_resultServerOfflineCount = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  self->_resultServerDetachedCount = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x400) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  self->_resultServerInterruptCount = *((_QWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((v5 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  self->_resultServerSessionExpiredCount = *((_QWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x10000) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  self->_resultUnknownErrorCount = *((_QWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  self->_restrictedNetworkFailedCount = *((_DWORD *)a3 + 51);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  self->_captivePresentFailedCount = *((_DWORD *)a3 + 47);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)a3 + 52);
  if ((v5 & 0x80000) == 0)
  {
LABEL_23:
    if ((v5 & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_54:
  self->_alternatePathCount = *((_DWORD *)a3 + 46);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 52) & 0x200000) != 0)
  {
LABEL_24:
    self->_exceededMssCount = *((_DWORD *)a3 + 48);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_25:
  v6 = objc_msgSend(a3, "connectionDurationBucketsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDNetworkServiceProxyConnectionStatistics addConnectionDurationBuckets:](self, "addConnectionDurationBuckets:", objc_msgSend(a3, "connectionDurationBucketsAtIndex:", i));
  }
  v9 = *((_DWORD *)a3 + 52);
  if ((v9 & 0x800000) != 0)
  {
    self->_protocolType = *((_DWORD *)a3 + 50);
    *(_DWORD *)&self->_has |= 0x800000u;
    v9 = *((_DWORD *)a3 + 52);
  }
  if ((v9 & 0x1000) != 0)
  {
    self->_resultServerOrphanedCount = *((_QWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)connectionCount
{
  return self->_connectionCount;
}

- (unint64_t)tfoSuccessCount
{
  return self->_tfoSuccessCount;
}

- (unint64_t)mptcpSuccessCount
{
  return self->_mptcpSuccessCount;
}

- (unint64_t)restrictedNetworkCount
{
  return self->_restrictedNetworkCount;
}

- (unint64_t)captivePresentCount
{
  return self->_captivePresentCount;
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

- (unint64_t)resultServerBusyCount
{
  return self->_resultServerBusyCount;
}

- (unint64_t)resultServerOfflineCount
{
  return self->_resultServerOfflineCount;
}

- (unint64_t)resultServerDetachedCount
{
  return self->_resultServerDetachedCount;
}

- (unint64_t)resultServerInterruptCount
{
  return self->_resultServerInterruptCount;
}

- (unint64_t)resultServerSessionExpiredCount
{
  return self->_resultServerSessionExpiredCount;
}

- (unint64_t)resultUnknownErrorCount
{
  return self->_resultUnknownErrorCount;
}

- (unsigned)restrictedNetworkFailedCount
{
  return self->_restrictedNetworkFailedCount;
}

- (unsigned)captivePresentFailedCount
{
  return self->_captivePresentFailedCount;
}

- (unsigned)alternatePathCount
{
  return self->_alternatePathCount;
}

- (unsigned)exceededMssCount
{
  return self->_exceededMssCount;
}

- (unint64_t)resultServerOrphanedCount
{
  return self->_resultServerOrphanedCount;
}

@end
