@implementation AWDNWConnectionReport

- (void)dealloc
{
  objc_super v3;

  -[AWDNWConnectionReport setProcessName:](self, "setProcessName:", 0);
  -[AWDNWConnectionReport setActivities:](self, "setActivities:", 0);
  -[AWDNWConnectionReport setConnectionUUID:](self, "setConnectionUUID:", 0);
  -[AWDNWConnectionReport setL2Report:](self, "setL2Report:", 0);
  -[AWDNWConnectionReport setDeviceReport:](self, "setDeviceReport:", 0);
  -[AWDNWConnectionReport setBundleID:](self, "setBundleID:", 0);
  -[AWDNWConnectionReport setEffectiveBundleID:](self, "setEffectiveBundleID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNWConnectionReport;
  -[AWDNWConnectionReport dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasTimestamp
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setTriggeredPath:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 0x10u;
  self->_triggeredPath = a3;
}

- (void)setHasTriggeredPath:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xEF | v3;
}

- (BOOL)hasTriggeredPath
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setSystemProxyConfigured:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_systemProxyConfigured = a3;
}

- (void)setHasSystemProxyConfigured:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSystemProxyConfigured
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (void)setCustomProxyConfigured:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_customProxyConfigured = a3;
}

- (void)setHasCustomProxyConfigured:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCustomProxyConfigured
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (int)usedProxyType
{
  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
    return self->_usedProxyType;
  else
    return 0;
}

- (void)setUsedProxyType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_usedProxyType = a3;
}

- (void)setHasUsedProxyType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasUsedProxyType
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (id)usedProxyTypeAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DB40[a3];
}

- (int)StringAsUsedProxyType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_PROXY_TYPE_NONE")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_PROXY_TYPE_DIRECT")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_PROXY_TYPE_HTTP")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_PROXY_TYPE_HTTPS")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_PROXY_TYPE_SOCKS")))
    return 4;
  return 0;
}

- (void)setFallbackEligible:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_fallbackEligible = a3;
}

- (void)setHasFallbackEligible:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFallbackEligible
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setWeakFallback:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 0x40u;
  self->_weakFallback = a3;
}

- (void)setHasWeakFallback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xBF | v3;
}

- (BOOL)hasWeakFallback
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 6) & 1;
}

- (void)setUsedFallback:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 0x20u;
  self->_usedFallback = a3;
}

- (void)setHasUsedFallback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xDF | v3;
}

- (BOOL)hasUsedFallback
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 5) & 1;
}

- (void)setResolutionRequired:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_resolutionRequired = a3;
}

- (void)setHasResolutionRequired:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasResolutionRequired
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (void)setTlsConfigured:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 2u;
  self->_tlsConfigured = a3;
}

- (void)setHasTlsConfigured:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xFD | v3;
}

- (BOOL)hasTlsConfigured
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setTfoConfigured:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_tfoConfigured = a3;
}

- (void)setHasTfoConfigured:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasTfoConfigured
{
  return *(_QWORD *)&self->_has >> 63;
}

- (void)setMultipathConfigured:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_multipathConfigured = a3;
}

- (void)setHasMultipathConfigured:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMultipathConfigured
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setTrafficClass:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_trafficClass = a3;
}

- (void)setHasTrafficClass:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasTrafficClass
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (int)failureReason
{
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
    return self->_failureReason;
  else
    return 0;
}

- (void)setFailureReason:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasFailureReason
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (id)failureReasonAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DB68[a3];
}

- (int)StringAsFailureReason:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_FAILURE_REASON_NONE")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_FAILURE_REASON_PATH")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_FAILURE_REASON_RESOLVER")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_FAILURE_REASON_FLOW")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_FAILURE_REASON_TLS")))
    return 4;
  return 0;
}

- (void)setPathTriggerMilliseconds:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_pathTriggerMilliseconds = a3;
}

- (void)setHasPathTriggerMilliseconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasPathTriggerMilliseconds
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setResolutionMilliseconds:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_resolutionMilliseconds = a3;
}

- (void)setHasResolutionMilliseconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasResolutionMilliseconds
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (void)setProxyMilliseconds:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_proxyMilliseconds = a3;
}

- (void)setHasProxyMilliseconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasProxyMilliseconds
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setFlowConnectMilliseconds:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_flowConnectMilliseconds = a3;
}

- (void)setHasFlowConnectMilliseconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasFlowConnectMilliseconds
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (void)setTlsMilliseconds:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_tlsMilliseconds = a3;
}

- (void)setHasTlsMilliseconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasTlsMilliseconds
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setFlowDurationMilliseconds:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_flowDurationMilliseconds = a3;
}

- (void)setHasFlowDurationMilliseconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasFlowDurationMilliseconds
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (void)setIpv4AddressCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_ipv4AddressCount = a3;
}

- (void)setHasIpv4AddressCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasIpv4AddressCount
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setIpv6AddressCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_ipv6AddressCount = a3;
}

- (void)setHasIpv6AddressCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasIpv6AddressCount
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (void)setSynthesizedIPv6Address:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_synthesizedIPv6Address = a3;
}

- (void)setHasSynthesizedIPv6Address:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSynthesizedIPv6Address
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (int)firstAddressFamily
{
  if ((*(_QWORD *)&self->_has & 0x80000000000) != 0)
    return self->_firstAddressFamily;
  else
    return 0;
}

- (void)setFirstAddressFamily:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_firstAddressFamily = a3;
}

- (void)setHasFirstAddressFamily:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstAddressFamily
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (id)firstAddressFamilyAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DB90[a3];
}

- (int)StringAsFirstAddressFamily:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ADDRESS_FAMILY_OTHER")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ADDRESS_FAMILY_IPV4")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ADDRESS_FAMILY_IPV6")))
    return 2;
  return 0;
}

- (int)connectedAddressFamily
{
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
    return self->_connectedAddressFamily;
  else
    return 0;
}

- (void)setConnectedAddressFamily:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_connectedAddressFamily = a3;
}

- (void)setHasConnectedAddressFamily:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasConnectedAddressFamily
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (id)connectedAddressFamilyAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DB90[a3];
}

- (int)StringAsConnectedAddressFamily:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ADDRESS_FAMILY_OTHER")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ADDRESS_FAMILY_IPV4")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_ADDRESS_FAMILY_IPV6")))
    return 2;
  return 0;
}

- (void)setConnectedAddressIndex:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_connectedAddressIndex = a3;
}

- (void)setHasConnectedAddressIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasConnectedAddressIndex
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (int)connectedInterfaceType
{
  if ((*(_QWORD *)&self->_has & 0x4000000000) != 0)
    return self->_connectedInterfaceType;
  else
    return 0;
}

- (void)setConnectedInterfaceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_connectedInterfaceType = a3;
}

- (void)setHasConnectedInterfaceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasConnectedInterfaceType
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (id)connectedInterfaceTypeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DBA8[a3];
}

- (int)StringAsConnectedInterfaceType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_INTERFACE_TYPE_OTHER")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_INTERFACE_TYPE_WIFI")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_INTERFACE_TYPE_CELLULAR")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_INTERFACE_TYPE_WIRED")))
    return 3;
  return 0;
}

- (void)setConnectionReuseCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_connectionReuseCount = a3;
}

- (void)setHasConnectionReuseCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasConnectionReuseCount
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setDataStallCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_dataStallCount = a3;
}

- (void)setHasDataStallCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasDataStallCount
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (int)connectionMode
{
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
    return self->_connectionMode;
  else
    return 0;
}

- (void)setConnectionMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_connectionMode = a3;
}

- (void)setHasConnectionMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasConnectionMode
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (id)connectionModeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DBC8[a3];
}

- (int)StringAsConnectionMode:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_CONNECTION_MODE_NONE")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_CONNECTION_MODE_STREAM")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_CONNECTION_MODE_DATAGRAM")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_CONNECTION_MODE_MESSAGE")))
    return 3;
  return 0;
}

- (int)appleHost
{
  if ((*(_QWORD *)&self->_has & 0x1000000000) != 0)
    return self->_appleHost;
  else
    return 0;
}

- (void)setAppleHost:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_appleHost = a3;
}

- (void)setHasAppleHost:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasAppleHost
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (id)appleHostAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DBE8[a3];
}

- (int)StringAsAppleHost:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_HOST_NONE")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_HOST_APPLE_COM")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_HOST_ICLOUD_COM")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_HOST_MZSTATIC_COM")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_HOST_ME_COM")))
    return 4;
  return 0;
}

- (int)appleApp
{
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
    return self->_appleApp;
  else
    return 0;
}

- (void)setAppleApp:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_appleApp = a3;
}

- (void)setHasAppleApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasAppleApp
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (id)appleAppAsString:(int)a3
{
  if (a3 >= 0xA)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DC10[a3];
}

- (int)StringAsAppleApp:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_NONE")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_MESSAGES")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_SAFARI")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_MAIL")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_MAPS")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_PHOTOS")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_MUSIC")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_APP_STORE")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_ITUNES_STORE")) & 1) != 0)
    return 8;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_APPLE_APP_SIRI")))
    return 9;
  return 0;
}

- (int)tlsVersion
{
  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
    return self->_tlsVersion;
  else
    return 0;
}

- (void)setTlsVersion:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_tlsVersion = a3;
}

- (void)setHasTlsVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTlsVersion
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (id)tlsVersionAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DC60[a3];
}

- (int)StringAsTlsVersion:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TLS_VERSION_NONE")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TLS_VERSION_SSL_3")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TLS_VERSION_TLS_1_0")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TLS_VERSION_TLS_1_1")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TLS_VERSION_TLS_1_2")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TLS_VERSION_TLS_1_3")) & 1) != 0)
    return 5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TLS_VERSION_DTLS_1_0")))
    return 6;
  return 0;
}

- (int)stackLevel
{
  if ((*(_QWORD *)&self->_has & 0x100000000000) != 0)
    return self->_stackLevel;
  else
    return 0;
}

- (void)setStackLevel:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_stackLevel = a3;
}

- (void)setHasStackLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasStackLevel
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (id)stackLevelAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DC98[a3];
}

- (int)StringAsStackLevel:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_STACK_LEVEL_UNDEFINED")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_STACK_LEVEL_APPLICATION_SOCKET")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_STACK_LEVEL_APPLICATION")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_STACK_LEVEL_TRANSPORT")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_STACK_LEVEL_INTERNET")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_STACK_LEVEL_LINK")))
    return 5;
  return 0;
}

- (void)setIpv4Available:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_ipv4Available = a3;
}

- (void)setHasIpv4Available:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIpv4Available
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (void)setIpv6Available:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_ipv6Available = a3;
}

- (void)setHasIpv6Available:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIpv6Available
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setIpv4DNSServerCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_ipv4DNSServerCount = a3;
}

- (void)setHasIpv4DNSServerCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasIpv4DNSServerCount
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (void)setIpv6DNSServerCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_ipv6DNSServerCount = a3;
}

- (void)setHasIpv6DNSServerCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasIpv6DNSServerCount
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setTlsVersionTimeout:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 8u;
  self->_tlsVersionTimeout = a3;
}

- (void)setHasTlsVersionTimeout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xF7 | v3;
}

- (BOOL)hasTlsVersionTimeout
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)setSynthesizedExtraIPv6Address:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_synthesizedExtraIPv6Address = a3;
}

- (void)setHasSynthesizedExtraIPv6Address:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSynthesizedExtraIPv6Address
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setBytesIn:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_bytesIn = a3;
}

- (void)setHasBytesIn:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasBytesIn
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (void)setBytesOut:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_bytesOut = a3;
}

- (void)setHasBytesOut:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasBytesOut
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (void)setBytesDuplicate:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_bytesDuplicate = a3;
}

- (void)setHasBytesDuplicate:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasBytesDuplicate
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setBytesOutOfOrder:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_bytesOutOfOrder = a3;
}

- (void)setHasBytesOutOfOrder:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasBytesOutOfOrder
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setBytesRetransmitted:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_bytesRetransmitted = a3;
}

- (void)setHasBytesRetransmitted:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasBytesRetransmitted
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (void)setPacketsIn:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_packetsIn = a3;
}

- (void)setHasPacketsIn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasPacketsIn
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setPacketsOut:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_packetsOut = a3;
}

- (void)setHasPacketsOut:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasPacketsOut
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setCurrentRTT:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_currentRTT = a3;
}

- (void)setHasCurrentRTT:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCurrentRTT
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setSmoothedRTT:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_smoothedRTT = a3;
}

- (void)setHasSmoothedRTT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasSmoothedRTT
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (void)setBestRTT:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_bestRTT = a3;
}

- (void)setHasBestRTT:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasBestRTT
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRTTvariance:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_rTTvariance = a3;
}

- (void)setHasRTTvariance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasRTTvariance
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setSynRetransmissionCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_synRetransmissionCount = a3;
}

- (void)setHasSynRetransmissionCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasSynRetransmissionCount
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (void)setTfoUsed:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 1u;
  self->_tfoUsed = a3;
}

- (void)setHasTfoUsed:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xFE | a3;
}

- (BOOL)hasTfoUsed
{
  return *((_BYTE *)&self->_has + 8) & 1;
}

- (void)setMultipathServiceType:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_multipathServiceType = a3;
}

- (void)setHasMultipathServiceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasMultipathServiceType
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setFirstParty:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_firstParty = a3;
}

- (void)setHasFirstParty:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstParty
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (void)setMultipathBytesInCell:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_multipathBytesInCell = a3;
}

- (void)setHasMultipathBytesInCell:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasMultipathBytesInCell
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setMultipathBytesOutCell:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_multipathBytesOutCell = a3;
}

- (void)setHasMultipathBytesOutCell:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasMultipathBytesOutCell
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (void)setMultipathBytesInWiFi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_multipathBytesInWiFi = a3;
}

- (void)setHasMultipathBytesInWiFi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasMultipathBytesInWiFi
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (void)setMultipathBytesOutWiFi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_multipathBytesOutWiFi = a3;
}

- (void)setHasMultipathBytesOutWiFi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasMultipathBytesOutWiFi
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (void)setMultipathBytesInInitial:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_multipathBytesInInitial = a3;
}

- (void)setHasMultipathBytesInInitial:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasMultipathBytesInInitial
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setMultipathBytesOutInitial:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_multipathBytesOutInitial = a3;
}

- (void)setHasMultipathBytesOutInitial:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasMultipathBytesOutInitial
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (void)setSecondsSinceInterfaceChange:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_secondsSinceInterfaceChange = a3;
}

- (void)setHasSecondsSinceInterfaceChange:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasSecondsSinceInterfaceChange
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setIsDaemon:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_isDaemon = a3;
}

- (void)setHasIsDaemon:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsDaemon
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (void)clearActivities
{
  -[NSMutableArray removeAllObjects](self->_activities, "removeAllObjects");
}

- (void)addActivities:(id)a3
{
  NSMutableArray *activities;

  activities = self->_activities;
  if (!activities)
  {
    activities = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_activities = activities;
  }
  -[NSMutableArray addObject:](activities, "addObject:", a3);
}

- (unint64_t)activitiesCount
{
  return -[NSMutableArray count](self->_activities, "count");
}

- (id)activitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_activities, "objectAtIndex:", a3);
}

+ (Class)activitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasConnectionUUID
{
  return self->_connectionUUID != 0;
}

- (void)setTlsHandshakeTimedOut:(BOOL)a3
{
  *((_BYTE *)&self->_has + 8) |= 4u;
  self->_tlsHandshakeTimedOut = a3;
}

- (void)setHasTlsHandshakeTimedOut:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)&self->_has + 8) = *((_BYTE *)&self->_has + 8) & 0xFB | v3;
}

- (BOOL)hasTlsHandshakeTimedOut
{
  return ((unint64_t)*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setIsPathExpensive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_isPathExpensive = a3;
}

- (void)setHasIsPathExpensive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsPathExpensive
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setIsPathConstrained:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_isPathConstrained = a3;
}

- (void)setHasIsPathConstrained:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsPathConstrained
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (void)setProhibitsExpensive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_prohibitsExpensive = a3;
}

- (void)setHasProhibitsExpensive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProhibitsExpensive
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (void)setProhibitsConstrained:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_prohibitsConstrained = a3;
}

- (void)setHasProhibitsConstrained:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasProhibitsConstrained
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (BOOL)hasL2Report
{
  return self->_l2Report != 0;
}

- (BOOL)hasDeviceReport
{
  return self->_deviceReport != 0;
}

- (int)transportProtocol
{
  if ((*(_QWORD *)&self->_has & 0x400000000000) != 0)
    return self->_transportProtocol;
  else
    return 0;
}

- (void)setTransportProtocol:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_transportProtocol = a3;
}

- (void)setHasTransportProtocol:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTransportProtocol
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (id)transportProtocolAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DCC8[a3];
}

- (int)StringAsTransportProtocol:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TRANSPORT_PROTOCOL_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TRANSPORT_PROTOCOL_TCP")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TRANSPORT_PROTOCOL_UDP")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_TRANSPORT_PROTOCOL_QUIC")))
    return 3;
  return 0;
}

- (int)dnsProtocol
{
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
    return self->_dnsProtocol;
  else
    return 0;
}

- (void)setDnsProtocol:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_dnsProtocol = a3;
}

- (void)setHasDnsProtocol:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasDnsProtocol
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (id)dnsProtocolAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DCE8[a3];
}

- (int)StringAsDnsProtocol:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROTOCOL_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROTOCOL_UDP")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROTOCOL_TCP")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROTOCOL_TLS")) & 1) != 0)
    return 3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROTOCOL_HTTPS")))
    return 4;
  return 0;
}

- (int)dnsProvider
{
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
    return self->_dnsProvider;
  else
    return 0;
}

- (void)setDnsProvider:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_dnsProvider = a3;
}

- (void)setHasDnsProvider:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasDnsProvider
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (id)dnsProviderAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DD10[a3];
}

- (int)StringAsDnsProvider:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROVIDER_UNKNOWN")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROVIDER_CLOUDFLARE")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROVIDER_GOOGLE")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NW_DNS_PROVIDER_QUAD9")))
    return 3;
  return 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasEffectiveBundleID
{
  return self->_effectiveBundleID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNWConnectionReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNWConnectionReport description](&v3, sel_description), -[AWDNWConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t has;
  char v5;
  NSString *processName;
  NSMutableArray *activities;
  NSString *connectionUUID;
  $91423A175C3B0984E6914260A00A17D0 *p_has;
  uint64_t v10;
  AWDNWL2Report *l2Report;
  AWDNWDeviceReport *deviceReport;
  uint64_t v13;
  uint64_t usedProxyType;
  __CFString *v15;
  uint64_t transportProtocol;
  __CFString *v17;
  uint64_t failureReason;
  __CFString *v19;
  uint64_t dnsProtocol;
  __CFString *v21;
  uint64_t firstAddressFamily;
  __CFString *v23;
  uint64_t dnsProvider;
  __CFString *v25;
  uint64_t connectedAddressFamily;
  __CFString *v27;
  NSString *bundleID;
  NSString *effectiveBundleID;
  uint64_t connectedInterfaceType;
  __CFString *v32;
  uint64_t connectionMode;
  __CFString *v34;
  uint64_t appleHost;
  __CFString *v36;
  uint64_t appleApp;
  __CFString *v38;
  uint64_t tlsVersion;
  __CFString *v40;
  uint64_t stackLevel;
  __CFString *v42;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (uint64_t)self->_has;
  }
  v5 = *((_BYTE *)&self->_has + 8);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_triggeredPath), CFSTR("triggeredPath"));
    has = (uint64_t)self->_has;
    v5 = *((_BYTE *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0)
        goto LABEL_6;
      goto LABEL_89;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_systemProxyConfigured), CFSTR("systemProxyConfigured"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0)
      goto LABEL_7;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_customProxyConfigured), CFSTR("customProxyConfigured"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_8;
    goto LABEL_100;
  }
LABEL_90:
  usedProxyType = self->_usedProxyType;
  if (usedProxyType >= 5)
    v15 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_usedProxyType);
  else
    v15 = off_24C10DB40[usedProxyType];
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("usedProxyType"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fallbackEligible), CFSTR("fallbackEligible"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_weakFallback), CFSTR("weakFallback"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_11;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_usedFallback), CFSTR("usedFallback"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_resolutionRequired), CFSTR("resolutionRequired"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_13;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tlsConfigured), CFSTR("tlsConfigured"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_14;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tfoConfigured), CFSTR("tfoConfigured"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0)
      goto LABEL_15;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_multipathConfigured), CFSTR("multipathConfigured"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0)
      goto LABEL_16;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_trafficClass), CFSTR("trafficClass"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0)
      goto LABEL_17;
    goto LABEL_116;
  }
LABEL_108:
  failureReason = self->_failureReason;
  if (failureReason >= 5)
    v19 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_failureReason);
  else
    v19 = off_24C10DB68[failureReason];
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("failureReason"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0)
      goto LABEL_18;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_pathTriggerMilliseconds), CFSTR("pathTriggerMilliseconds"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_resolutionMilliseconds), CFSTR("resolutionMilliseconds"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_proxyMilliseconds), CFSTR("proxyMilliseconds"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_flowConnectMilliseconds), CFSTR("flowConnectMilliseconds"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tlsMilliseconds), CFSTR("tlsMilliseconds"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_flowDurationMilliseconds), CFSTR("flowDurationMilliseconds"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ipv4AddressCount), CFSTR("ipv4AddressCount"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ipv6AddressCount), CFSTR("ipv6AddressCount"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0)
      goto LABEL_26;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_synthesizedIPv6Address), CFSTR("synthesizedIPv6Address"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0)
      goto LABEL_27;
    goto LABEL_133;
  }
LABEL_125:
  firstAddressFamily = self->_firstAddressFamily;
  if (firstAddressFamily >= 3)
    v23 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_firstAddressFamily);
  else
    v23 = off_24C10DB90[firstAddressFamily];
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("firstAddressFamily"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_144;
  }
LABEL_133:
  connectedAddressFamily = self->_connectedAddressFamily;
  if (connectedAddressFamily >= 3)
    v27 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectedAddressFamily);
  else
    v27 = off_24C10DB90[connectedAddressFamily];
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("connectedAddressFamily"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0)
      goto LABEL_29;
    goto LABEL_145;
  }
LABEL_144:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectedAddressIndex), CFSTR("connectedAddressIndex"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_149;
  }
LABEL_145:
  connectedInterfaceType = self->_connectedInterfaceType;
  if (connectedInterfaceType >= 4)
    v32 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectedInterfaceType);
  else
    v32 = off_24C10DBA8[connectedInterfaceType];
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("connectedInterfaceType"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionReuseCount), CFSTR("connectionReuseCount"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0)
      goto LABEL_32;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dataStallCount), CFSTR("dataStallCount"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0)
      goto LABEL_33;
    goto LABEL_155;
  }
LABEL_151:
  connectionMode = self->_connectionMode;
  if (connectionMode >= 4)
    v34 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionMode);
  else
    v34 = off_24C10DBC8[connectionMode];
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("connectionMode"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0)
      goto LABEL_34;
    goto LABEL_159;
  }
LABEL_155:
  appleHost = self->_appleHost;
  if (appleHost >= 5)
    v36 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_appleHost);
  else
    v36 = off_24C10DBE8[appleHost];
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("appleHost"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_163;
  }
LABEL_159:
  appleApp = self->_appleApp;
  if (appleApp >= 0xA)
    v38 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_appleApp);
  else
    v38 = off_24C10DC10[appleApp];
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("appleApp"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0)
      goto LABEL_36;
    goto LABEL_167;
  }
LABEL_163:
  tlsVersion = self->_tlsVersion;
  if (tlsVersion >= 7)
    v40 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tlsVersion);
  else
    v40 = off_24C10DC60[tlsVersion];
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("tlsVersion"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_37;
    goto LABEL_171;
  }
LABEL_167:
  stackLevel = self->_stackLevel;
  if (stackLevel >= 6)
    v42 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_stackLevel);
  else
    v42 = off_24C10DC98[stackLevel];
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("stackLevel"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_38;
    goto LABEL_172;
  }
LABEL_171:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ipv4Available), CFSTR("ipv4Available"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_173;
  }
LABEL_172:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ipv6Available), CFSTR("ipv6Available"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_174;
  }
LABEL_173:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ipv4DNSServerCount), CFSTR("ipv4DNSServerCount"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v5 & 8) == 0)
      goto LABEL_41;
    goto LABEL_175;
  }
LABEL_174:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ipv6DNSServerCount), CFSTR("ipv6DNSServerCount"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((v5 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_176;
  }
LABEL_175:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tlsVersionTimeout), CFSTR("tlsVersionTimeout"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0)
      goto LABEL_43;
    goto LABEL_177;
  }
LABEL_176:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_synthesizedExtraIPv6Address), CFSTR("synthesizedExtraIPv6Address"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0)
      goto LABEL_44;
    goto LABEL_178;
  }
LABEL_177:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesIn), CFSTR("bytesIn"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0)
      goto LABEL_45;
    goto LABEL_179;
  }
LABEL_178:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesOut), CFSTR("bytesOut"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_180;
  }
LABEL_179:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesDuplicate), CFSTR("bytesDuplicate"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_181;
  }
LABEL_180:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesOutOfOrder), CFSTR("bytesOutOfOrder"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0)
      goto LABEL_48;
    goto LABEL_182;
  }
LABEL_181:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesRetransmitted), CFSTR("bytesRetransmitted"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0)
      goto LABEL_49;
    goto LABEL_183;
  }
LABEL_182:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsIn), CFSTR("packetsIn"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0)
      goto LABEL_50;
    goto LABEL_184;
  }
LABEL_183:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsOut), CFSTR("packetsOut"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0)
      goto LABEL_51;
    goto LABEL_185;
  }
LABEL_184:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_currentRTT), CFSTR("currentRTT"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0)
      goto LABEL_52;
    goto LABEL_186;
  }
LABEL_185:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_smoothedRTT), CFSTR("smoothedRTT"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0)
      goto LABEL_53;
    goto LABEL_187;
  }
LABEL_186:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bestRTT), CFSTR("bestRTT"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0)
      goto LABEL_54;
    goto LABEL_188;
  }
LABEL_187:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rTTvariance), CFSTR("RTTvariance"));
  has = (uint64_t)self->_has;
  v5 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v5 & 1) == 0)
      goto LABEL_55;
    goto LABEL_189;
  }
LABEL_188:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_synRetransmissionCount), CFSTR("synRetransmissionCount"));
  has = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0)
      goto LABEL_56;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tfoUsed), CFSTR("tfoUsed"));
  has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathServiceType), CFSTR("multipathServiceType"));
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_192;
  }
LABEL_191:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_firstParty), CFSTR("firstParty"));
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_193;
  }
LABEL_192:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInCell), CFSTR("multipathBytesInCell"));
  has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0)
      goto LABEL_60;
    goto LABEL_194;
  }
LABEL_193:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutCell), CFSTR("multipathBytesOutCell"));
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0)
      goto LABEL_61;
    goto LABEL_195;
  }
LABEL_194:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInWiFi), CFSTR("multipathBytesInWiFi"));
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0)
      goto LABEL_62;
    goto LABEL_196;
  }
LABEL_195:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutWiFi), CFSTR("multipathBytesOutWiFi"));
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_197;
  }
LABEL_196:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInInitial), CFSTR("multipathBytesInInitial"));
  has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0)
      goto LABEL_64;
    goto LABEL_198;
  }
LABEL_197:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutInitial), CFSTR("multipathBytesOutInitial"));
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_198:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_secondsSinceInterfaceChange), CFSTR("secondsSinceInterfaceChange"));
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
LABEL_65:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDaemon), CFSTR("isDaemon"));
LABEL_66:
  processName = self->_processName;
  if (processName)
    objc_msgSend(v3, "setObject:forKey:", processName, CFSTR("processName"));
  activities = self->_activities;
  if (activities)
    objc_msgSend(v3, "setObject:forKey:", activities, CFSTR("activities"));
  connectionUUID = self->_connectionUUID;
  if (connectionUUID)
    objc_msgSend(v3, "setObject:forKey:", connectionUUID, CFSTR("connectionUUID"));
  p_has = &self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tlsHandshakeTimedOut), CFSTR("tlsHandshakeTimedOut"));
  v10 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPathExpensive), CFSTR("isPathExpensive"));
    v10 = (uint64_t)self->_has;
    if ((v10 & 0x40000000000000) == 0)
    {
LABEL_76:
      if ((v10 & 0x400000000000000) == 0)
        goto LABEL_77;
      goto LABEL_94;
    }
  }
  else if ((v10 & 0x40000000000000) == 0)
  {
    goto LABEL_76;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPathConstrained), CFSTR("isPathConstrained"));
  v10 = (uint64_t)self->_has;
  if ((v10 & 0x400000000000000) == 0)
  {
LABEL_77:
    if ((v10 & 0x200000000000000) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }
LABEL_94:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_prohibitsExpensive), CFSTR("prohibitsExpensive"));
  if ((*(_QWORD *)&self->_has & 0x200000000000000) != 0)
LABEL_78:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_prohibitsConstrained), CFSTR("prohibitsConstrained"));
LABEL_79:
  l2Report = self->_l2Report;
  if (l2Report)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWL2Report dictionaryRepresentation](l2Report, "dictionaryRepresentation"), CFSTR("l2Report"));
  deviceReport = self->_deviceReport;
  if (deviceReport)
    objc_msgSend(v3, "setObject:forKey:", -[AWDNWDeviceReport dictionaryRepresentation](deviceReport, "dictionaryRepresentation"), CFSTR("deviceReport"));
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x400000000000) != 0)
  {
    transportProtocol = self->_transportProtocol;
    if (transportProtocol >= 4)
      v17 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transportProtocol);
    else
      v17 = off_24C10DCC8[transportProtocol];
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("transportProtocol"));
    v13 = (uint64_t)self->_has;
    if ((v13 & 0x10000000000) == 0)
    {
LABEL_85:
      if ((v13 & 0x20000000000) == 0)
        goto LABEL_137;
      goto LABEL_129;
    }
  }
  else if ((v13 & 0x10000000000) == 0)
  {
    goto LABEL_85;
  }
  dnsProtocol = self->_dnsProtocol;
  if (dnsProtocol >= 5)
    v21 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dnsProtocol);
  else
    v21 = off_24C10DCE8[dnsProtocol];
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("dnsProtocol"));
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
  {
LABEL_129:
    dnsProvider = self->_dnsProvider;
    if (dnsProvider >= 4)
      v25 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dnsProvider);
    else
      v25 = off_24C10DD10[dnsProvider];
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("dnsProvider"));
  }
LABEL_137:
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  effectiveBundleID = self->_effectiveBundleID;
  if (effectiveBundleID)
    objc_msgSend(v3, "setObject:forKey:", effectiveBundleID, CFSTR("effectiveBundleID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $91423A175C3B0984E6914260A00A17D0 *p_has;
  uint64_t has;
  char v6;
  NSMutableArray *activities;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  $91423A175C3B0984E6914260A00A17D0 *v12;
  uint64_t v13;
  $91423A175C3B0984E6914260A00A17D0 *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_has = &self->_has;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = *(_QWORD *)p_has;
  }
  v6 = *((_BYTE *)p_has + 8);
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (uint64_t)self->_has;
    v6 = *((_BYTE *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0)
        goto LABEL_6;
      goto LABEL_99;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0)
      goto LABEL_7;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_8;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x40) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_11;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_13;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_14;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0)
      goto LABEL_15;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0)
      goto LABEL_16;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0)
      goto LABEL_17;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0)
      goto LABEL_18;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0)
      goto LABEL_26;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0)
      goto LABEL_27;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0)
      goto LABEL_29;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0)
      goto LABEL_32;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0)
      goto LABEL_33;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0)
      goto LABEL_34;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0)
      goto LABEL_36;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_37;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_38;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v6 & 8) == 0)
      goto LABEL_41;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0)
      goto LABEL_43;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0)
      goto LABEL_44;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0)
      goto LABEL_45;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0)
      goto LABEL_48;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0)
      goto LABEL_49;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0)
      goto LABEL_50;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0)
      goto LABEL_51;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0)
      goto LABEL_52;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0)
      goto LABEL_53;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0)
      goto LABEL_54;
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v6 & 1) == 0)
      goto LABEL_55;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0)
      goto LABEL_56;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0)
      goto LABEL_60;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0)
      goto LABEL_61;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0)
      goto LABEL_62;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0)
      goto LABEL_64;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_157:
  PBDataWriterWriteUint64Field();
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
LABEL_65:
    PBDataWriterWriteBOOLField();
LABEL_66:
  if (self->_processName)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  activities = self->_activities;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(activities);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  if (self->_connectionUUID)
    PBDataWriterWriteStringField();
  v12 = &self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
    PBDataWriterWriteBOOLField();
  v13 = *(_QWORD *)v12;
  if ((*(_QWORD *)v12 & 0x80000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = (uint64_t)self->_has;
    if ((v13 & 0x40000000000000) == 0)
    {
LABEL_81:
      if ((v13 & 0x400000000000000) == 0)
        goto LABEL_82;
      goto LABEL_161;
    }
  }
  else if ((v13 & 0x40000000000000) == 0)
  {
    goto LABEL_81;
  }
  PBDataWriterWriteBOOLField();
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x400000000000000) == 0)
  {
LABEL_82:
    if ((v13 & 0x200000000000000) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_161:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x200000000000000) != 0)
LABEL_83:
    PBDataWriterWriteBOOLField();
LABEL_84:
  if (self->_l2Report)
    PBDataWriterWriteSubmessage();
  if (self->_deviceReport)
    PBDataWriterWriteSubmessage();
  v14 = &self->_has;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x400000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v15 = *(_QWORD *)v14;
    if ((*(_QWORD *)v14 & 0x10000000000) == 0)
    {
LABEL_90:
      if ((v15 & 0x20000000000) == 0)
        goto LABEL_92;
      goto LABEL_91;
    }
  }
  else if ((v15 & 0x10000000000) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
LABEL_91:
    PBDataWriterWriteInt32Field();
LABEL_92:
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_effectiveBundleID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  uint64_t has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  $91423A175C3B0984E6914260A00A17D0 *p_has;
  uint64_t v12;

  has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    *((_QWORD *)a3 + 33) = self->_timestamp;
    *((_QWORD *)a3 + 53) |= 0x100000000uLL;
    has = (uint64_t)self->_has;
  }
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x10) != 0)
  {
    *((_BYTE *)a3 + 420) = self->_triggeredPath;
    *((_BYTE *)a3 + 432) |= 0x10u;
    has = (uint64_t)self->_has;
    v6 = *((_BYTE *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0)
        goto LABEL_6;
      goto LABEL_95;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)a3 + 414) = self->_systemProxyConfigured;
  *((_QWORD *)a3 + 53) |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0)
      goto LABEL_7;
    goto LABEL_96;
  }
LABEL_95:
  *((_BYTE *)a3 + 400) = self->_customProxyConfigured;
  *((_QWORD *)a3 + 53) |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_8;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 99) = self->_usedProxyType;
  *((_QWORD *)a3 + 53) |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_98;
  }
LABEL_97:
  *((_BYTE *)a3 + 401) = self->_fallbackEligible;
  *((_QWORD *)a3 + 53) |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x40) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_99;
  }
LABEL_98:
  *((_BYTE *)a3 + 422) = self->_weakFallback;
  *((_BYTE *)a3 + 432) |= 0x40u;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_11;
    goto LABEL_100;
  }
LABEL_99:
  *((_BYTE *)a3 + 421) = self->_usedFallback;
  *((_BYTE *)a3 + 432) |= 0x20u;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_101;
  }
LABEL_100:
  *((_BYTE *)a3 + 411) = self->_resolutionRequired;
  *((_QWORD *)a3 + 53) |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_13;
    goto LABEL_102;
  }
LABEL_101:
  *((_BYTE *)a3 + 417) = self->_tlsConfigured;
  *((_BYTE *)a3 + 432) |= 2u;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_14;
    goto LABEL_103;
  }
LABEL_102:
  *((_BYTE *)a3 + 415) = self->_tfoConfigured;
  *((_QWORD *)a3 + 53) |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0)
      goto LABEL_15;
    goto LABEL_104;
  }
LABEL_103:
  *((_BYTE *)a3 + 408) = self->_multipathConfigured;
  *((_QWORD *)a3 + 53) |= 0x100000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0)
      goto LABEL_16;
    goto LABEL_105;
  }
LABEL_104:
  *((_QWORD *)a3 + 35) = self->_trafficClass;
  *((_QWORD *)a3 + 53) |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0)
      goto LABEL_17;
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)a3 + 90) = self->_failureReason;
  *((_QWORD *)a3 + 53) |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0)
      goto LABEL_18;
    goto LABEL_107;
  }
LABEL_106:
  *((_QWORD *)a3 + 26) = self->_pathTriggerMilliseconds;
  *((_QWORD *)a3 + 53) |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_108;
  }
LABEL_107:
  *((_QWORD *)a3 + 29) = self->_resolutionMilliseconds;
  *((_QWORD *)a3 + 53) |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_109;
  }
LABEL_108:
  *((_QWORD *)a3 + 27) = self->_proxyMilliseconds;
  *((_QWORD *)a3 + 53) |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_110;
  }
LABEL_109:
  *((_QWORD *)a3 + 11) = self->_flowConnectMilliseconds;
  *((_QWORD *)a3 + 53) |= 0x400uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_111;
  }
LABEL_110:
  *((_QWORD *)a3 + 34) = self->_tlsMilliseconds;
  *((_QWORD *)a3 + 53) |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_112;
  }
LABEL_111:
  *((_QWORD *)a3 + 12) = self->_flowDurationMilliseconds;
  *((_QWORD *)a3 + 53) |= 0x800uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_113;
  }
LABEL_112:
  *((_QWORD *)a3 + 13) = self->_ipv4AddressCount;
  *((_QWORD *)a3 + 53) |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_114;
  }
LABEL_113:
  *((_QWORD *)a3 + 15) = self->_ipv6AddressCount;
  *((_QWORD *)a3 + 53) |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0)
      goto LABEL_26;
    goto LABEL_115;
  }
LABEL_114:
  *((_BYTE *)a3 + 413) = self->_synthesizedIPv6Address;
  *((_QWORD *)a3 + 53) |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0)
      goto LABEL_27;
    goto LABEL_116;
  }
LABEL_115:
  *((_DWORD *)a3 + 91) = self->_firstAddressFamily;
  *((_QWORD *)a3 + 53) |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)a3 + 78) = self->_connectedAddressFamily;
  *((_QWORD *)a3 + 53) |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0)
      goto LABEL_29;
    goto LABEL_118;
  }
LABEL_117:
  *((_QWORD *)a3 + 7) = self->_connectedAddressIndex;
  *((_QWORD *)a3 + 53) |= 0x40uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)a3 + 79) = self->_connectedInterfaceType;
  *((_QWORD *)a3 + 53) |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_120;
  }
LABEL_119:
  *((_QWORD *)a3 + 8) = self->_connectionReuseCount;
  *((_QWORD *)a3 + 53) |= 0x80uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0)
      goto LABEL_32;
    goto LABEL_121;
  }
LABEL_120:
  *((_QWORD *)a3 + 10) = self->_dataStallCount;
  *((_QWORD *)a3 + 53) |= 0x200uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0)
      goto LABEL_33;
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)a3 + 80) = self->_connectionMode;
  *((_QWORD *)a3 + 53) |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0)
      goto LABEL_34;
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)a3 + 75) = self->_appleHost;
  *((_QWORD *)a3 + 53) |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)a3 + 74) = self->_appleApp;
  *((_QWORD *)a3 + 53) |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0)
      goto LABEL_36;
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)a3 + 97) = self->_tlsVersion;
  *((_QWORD *)a3 + 53) |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_37;
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)a3 + 96) = self->_stackLevel;
  *((_QWORD *)a3 + 53) |= 0x100000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_38;
    goto LABEL_127;
  }
LABEL_126:
  *((_BYTE *)a3 + 403) = self->_ipv4Available;
  *((_QWORD *)a3 + 53) |= 0x8000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_128;
  }
LABEL_127:
  *((_BYTE *)a3 + 404) = self->_ipv6Available;
  *((_QWORD *)a3 + 53) |= 0x10000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_129;
  }
LABEL_128:
  *((_QWORD *)a3 + 14) = self->_ipv4DNSServerCount;
  *((_QWORD *)a3 + 53) |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v6 & 8) == 0)
      goto LABEL_41;
    goto LABEL_130;
  }
LABEL_129:
  *((_QWORD *)a3 + 16) = self->_ipv6DNSServerCount;
  *((_QWORD *)a3 + 53) |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((v6 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_131;
  }
LABEL_130:
  *((_BYTE *)a3 + 419) = self->_tlsVersionTimeout;
  *((_BYTE *)a3 + 432) |= 8u;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0)
      goto LABEL_43;
    goto LABEL_132;
  }
LABEL_131:
  *((_BYTE *)a3 + 412) = self->_synthesizedExtraIPv6Address;
  *((_QWORD *)a3 + 53) |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0)
      goto LABEL_44;
    goto LABEL_133;
  }
LABEL_132:
  *((_QWORD *)a3 + 3) = self->_bytesIn;
  *((_QWORD *)a3 + 53) |= 4uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0)
      goto LABEL_45;
    goto LABEL_134;
  }
LABEL_133:
  *((_QWORD *)a3 + 4) = self->_bytesOut;
  *((_QWORD *)a3 + 53) |= 8uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_135;
  }
LABEL_134:
  *((_QWORD *)a3 + 2) = self->_bytesDuplicate;
  *((_QWORD *)a3 + 53) |= 2uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_136;
  }
LABEL_135:
  *((_QWORD *)a3 + 5) = self->_bytesOutOfOrder;
  *((_QWORD *)a3 + 53) |= 0x10uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0)
      goto LABEL_48;
    goto LABEL_137;
  }
LABEL_136:
  *((_QWORD *)a3 + 6) = self->_bytesRetransmitted;
  *((_QWORD *)a3 + 53) |= 0x20uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0)
      goto LABEL_49;
    goto LABEL_138;
  }
LABEL_137:
  *((_QWORD *)a3 + 24) = self->_packetsIn;
  *((_QWORD *)a3 + 53) |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0)
      goto LABEL_50;
    goto LABEL_139;
  }
LABEL_138:
  *((_QWORD *)a3 + 25) = self->_packetsOut;
  *((_QWORD *)a3 + 53) |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0)
      goto LABEL_51;
    goto LABEL_140;
  }
LABEL_139:
  *((_QWORD *)a3 + 9) = self->_currentRTT;
  *((_QWORD *)a3 + 53) |= 0x100uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0)
      goto LABEL_52;
    goto LABEL_141;
  }
LABEL_140:
  *((_QWORD *)a3 + 31) = self->_smoothedRTT;
  *((_QWORD *)a3 + 53) |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0)
      goto LABEL_53;
    goto LABEL_142;
  }
LABEL_141:
  *((_QWORD *)a3 + 1) = self->_bestRTT;
  *((_QWORD *)a3 + 53) |= 1uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0)
      goto LABEL_54;
    goto LABEL_143;
  }
LABEL_142:
  *((_QWORD *)a3 + 28) = self->_rTTvariance;
  *((_QWORD *)a3 + 53) |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v6 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v6 & 1) == 0)
      goto LABEL_55;
    goto LABEL_144;
  }
LABEL_143:
  *((_QWORD *)a3 + 32) = self->_synRetransmissionCount;
  *((_QWORD *)a3 + 53) |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0)
      goto LABEL_56;
    goto LABEL_145;
  }
LABEL_144:
  *((_BYTE *)a3 + 416) = self->_tfoUsed;
  *((_BYTE *)a3 + 432) |= 1u;
  has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_146;
  }
LABEL_145:
  *((_QWORD *)a3 + 23) = self->_multipathServiceType;
  *((_QWORD *)a3 + 53) |= 0x400000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_147;
  }
LABEL_146:
  *((_BYTE *)a3 + 402) = self->_firstParty;
  *((_QWORD *)a3 + 53) |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_148;
  }
LABEL_147:
  *((_QWORD *)a3 + 17) = self->_multipathBytesInCell;
  *((_QWORD *)a3 + 53) |= 0x10000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0)
      goto LABEL_60;
    goto LABEL_149;
  }
LABEL_148:
  *((_QWORD *)a3 + 20) = self->_multipathBytesOutCell;
  *((_QWORD *)a3 + 53) |= 0x80000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0)
      goto LABEL_61;
    goto LABEL_150;
  }
LABEL_149:
  *((_QWORD *)a3 + 19) = self->_multipathBytesInWiFi;
  *((_QWORD *)a3 + 53) |= 0x40000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0)
      goto LABEL_62;
    goto LABEL_151;
  }
LABEL_150:
  *((_QWORD *)a3 + 22) = self->_multipathBytesOutWiFi;
  *((_QWORD *)a3 + 53) |= 0x200000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_152;
  }
LABEL_151:
  *((_QWORD *)a3 + 18) = self->_multipathBytesInInitial;
  *((_QWORD *)a3 + 53) |= 0x20000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0)
      goto LABEL_64;
    goto LABEL_153;
  }
LABEL_152:
  *((_QWORD *)a3 + 21) = self->_multipathBytesOutInitial;
  *((_QWORD *)a3 + 53) |= 0x100000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_153:
  *((_QWORD *)a3 + 30) = self->_secondsSinceInterfaceChange;
  *((_QWORD *)a3 + 53) |= 0x20000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_65:
    *((_BYTE *)a3 + 405) = self->_isDaemon;
    *((_QWORD *)a3 + 53) |= 0x20000000000000uLL;
  }
LABEL_66:
  if (self->_processName)
    objc_msgSend(a3, "setProcessName:");
  if (-[AWDNWConnectionReport activitiesCount](self, "activitiesCount"))
  {
    objc_msgSend(a3, "clearActivities");
    v7 = -[AWDNWConnectionReport activitiesCount](self, "activitiesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addActivities:", -[AWDNWConnectionReport activitiesAtIndex:](self, "activitiesAtIndex:", i));
    }
  }
  if (self->_connectionUUID)
    objc_msgSend(a3, "setConnectionUUID:");
  if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
  {
    *((_BYTE *)a3 + 418) = self->_tlsHandshakeTimedOut;
    *((_BYTE *)a3 + 432) |= 4u;
  }
  v10 = (uint64_t)self->_has;
  if ((v10 & 0x80000000000000) != 0)
  {
    *((_BYTE *)a3 + 407) = self->_isPathExpensive;
    *((_QWORD *)a3 + 53) |= 0x80000000000000uLL;
    v10 = (uint64_t)self->_has;
    if ((v10 & 0x40000000000000) == 0)
    {
LABEL_78:
      if ((v10 & 0x400000000000000) == 0)
        goto LABEL_79;
      goto LABEL_157;
    }
  }
  else if ((v10 & 0x40000000000000) == 0)
  {
    goto LABEL_78;
  }
  *((_BYTE *)a3 + 406) = self->_isPathConstrained;
  *((_QWORD *)a3 + 53) |= 0x40000000000000uLL;
  v10 = (uint64_t)self->_has;
  if ((v10 & 0x400000000000000) == 0)
  {
LABEL_79:
    if ((v10 & 0x200000000000000) == 0)
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_157:
  *((_BYTE *)a3 + 410) = self->_prohibitsExpensive;
  *((_QWORD *)a3 + 53) |= 0x400000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000000000) != 0)
  {
LABEL_80:
    *((_BYTE *)a3 + 409) = self->_prohibitsConstrained;
    *((_QWORD *)a3 + 53) |= 0x200000000000000uLL;
  }
LABEL_81:
  if (self->_l2Report)
    objc_msgSend(a3, "setL2Report:");
  if (self->_deviceReport)
    objc_msgSend(a3, "setDeviceReport:");
  p_has = &self->_has;
  v12 = (uint64_t)self->_has;
  if ((v12 & 0x400000000000) != 0)
  {
    *((_DWORD *)a3 + 98) = self->_transportProtocol;
    *((_QWORD *)a3 + 53) |= 0x400000000000uLL;
    v12 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x10000000000) == 0)
    {
LABEL_87:
      if ((v12 & 0x20000000000) == 0)
        goto LABEL_89;
      goto LABEL_88;
    }
  }
  else if ((v12 & 0x10000000000) == 0)
  {
    goto LABEL_87;
  }
  *((_DWORD *)a3 + 86) = self->_dnsProtocol;
  *((_QWORD *)a3 + 53) |= 0x10000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
  {
LABEL_88:
    *((_DWORD *)a3 + 87) = self->_dnsProvider;
    *((_QWORD *)a3 + 53) |= 0x20000000000uLL;
  }
LABEL_89:
  if (self->_bundleID)
    objc_msgSend(a3, "setBundleID:");
  if (self->_effectiveBundleID)
    objc_msgSend(a3, "setEffectiveBundleID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t has;
  char v8;
  NSMutableArray *activities;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  $91423A175C3B0984E6914260A00A17D0 *p_has;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    *(_QWORD *)(v5 + 264) = self->_timestamp;
    *(_QWORD *)(v5 + 424) |= 0x100000000uLL;
    has = (uint64_t)self->_has;
  }
  v8 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 420) = self->_triggeredPath;
    *(_BYTE *)(v5 + 432) |= 0x10u;
    has = (uint64_t)self->_has;
    v8 = *((_BYTE *)&self->_has + 8);
    if ((has & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x1000000000000) == 0)
        goto LABEL_6;
      goto LABEL_87;
    }
  }
  else if ((has & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v5 + 414) = self->_systemProxyConfigured;
  *(_QWORD *)(v5 + 424) |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000) == 0)
      goto LABEL_7;
    goto LABEL_88;
  }
LABEL_87:
  *(_BYTE *)(v5 + 400) = self->_customProxyConfigured;
  *(_QWORD *)(v5 + 424) |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000) == 0)
  {
LABEL_7:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_8;
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 396) = self->_usedProxyType;
  *(_QWORD *)(v5 + 424) |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v8 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_90;
  }
LABEL_89:
  *(_BYTE *)(v5 + 401) = self->_fallbackEligible;
  *(_QWORD *)(v5 + 424) |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 0x40) == 0)
  {
LABEL_9:
    if ((v8 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_91;
  }
LABEL_90:
  *(_BYTE *)(v5 + 422) = self->_weakFallback;
  *(_BYTE *)(v5 + 432) |= 0x40u;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_11;
    goto LABEL_92;
  }
LABEL_91:
  *(_BYTE *)(v5 + 421) = self->_usedFallback;
  *(_BYTE *)(v5 + 432) |= 0x20u;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v8 & 2) == 0)
      goto LABEL_12;
    goto LABEL_93;
  }
LABEL_92:
  *(_BYTE *)(v5 + 411) = self->_resolutionRequired;
  *(_QWORD *)(v5 + 424) |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 2) == 0)
  {
LABEL_12:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_13;
    goto LABEL_94;
  }
LABEL_93:
  *(_BYTE *)(v5 + 417) = self->_tlsConfigured;
  *(_BYTE *)(v5 + 432) |= 2u;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_14;
    goto LABEL_95;
  }
LABEL_94:
  *(_BYTE *)(v5 + 415) = self->_tfoConfigured;
  *(_QWORD *)(v5 + 424) |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x400000000) == 0)
      goto LABEL_15;
    goto LABEL_96;
  }
LABEL_95:
  *(_BYTE *)(v5 + 408) = self->_multipathConfigured;
  *(_QWORD *)(v5 + 424) |= 0x100000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400000000) == 0)
  {
LABEL_15:
    if ((has & 0x40000000000) == 0)
      goto LABEL_16;
    goto LABEL_97;
  }
LABEL_96:
  *(_QWORD *)(v5 + 280) = self->_trafficClass;
  *(_QWORD *)(v5 + 424) |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000) == 0)
      goto LABEL_17;
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v5 + 360) = self->_failureReason;
  *(_QWORD *)(v5 + 424) |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000) == 0)
  {
LABEL_17:
    if ((has & 0x10000000) == 0)
      goto LABEL_18;
    goto LABEL_99;
  }
LABEL_98:
  *(_QWORD *)(v5 + 208) = self->_pathTriggerMilliseconds;
  *(_QWORD *)(v5 + 424) |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000) == 0)
  {
LABEL_18:
    if ((has & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_100;
  }
LABEL_99:
  *(_QWORD *)(v5 + 232) = self->_resolutionMilliseconds;
  *(_QWORD *)(v5 + 424) |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_101;
  }
LABEL_100:
  *(_QWORD *)(v5 + 216) = self->_proxyMilliseconds;
  *(_QWORD *)(v5 + 424) |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_102;
  }
LABEL_101:
  *(_QWORD *)(v5 + 88) = self->_flowConnectMilliseconds;
  *(_QWORD *)(v5 + 424) |= 0x400uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000) == 0)
  {
LABEL_21:
    if ((has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_103;
  }
LABEL_102:
  *(_QWORD *)(v5 + 272) = self->_tlsMilliseconds;
  *(_QWORD *)(v5 + 424) |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_104;
  }
LABEL_103:
  *(_QWORD *)(v5 + 96) = self->_flowDurationMilliseconds;
  *(_QWORD *)(v5 + 424) |= 0x800uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_105;
  }
LABEL_104:
  *(_QWORD *)(v5 + 104) = self->_ipv4AddressCount;
  *(_QWORD *)(v5 + 424) |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000) == 0)
  {
LABEL_24:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_106;
  }
LABEL_105:
  *(_QWORD *)(v5 + 120) = self->_ipv6AddressCount;
  *(_QWORD *)(v5 + 424) |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((has & 0x80000000000) == 0)
      goto LABEL_26;
    goto LABEL_107;
  }
LABEL_106:
  *(_BYTE *)(v5 + 413) = self->_synthesizedIPv6Address;
  *(_QWORD *)(v5 + 424) |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000000) == 0)
      goto LABEL_27;
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v5 + 364) = self->_firstAddressFamily;
  *(_QWORD *)(v5 + 424) |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000000000) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v5 + 312) = self->_connectedAddressFamily;
  *(_QWORD *)(v5 + 424) |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 0x4000000000) == 0)
      goto LABEL_29;
    goto LABEL_110;
  }
LABEL_109:
  *(_QWORD *)(v5 + 56) = self->_connectedAddressIndex;
  *(_QWORD *)(v5 + 424) |= 0x40uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x4000000000) == 0)
  {
LABEL_29:
    if ((has & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v5 + 316) = self->_connectedInterfaceType;
  *(_QWORD *)(v5 + 424) |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80) == 0)
  {
LABEL_30:
    if ((has & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_112;
  }
LABEL_111:
  *(_QWORD *)(v5 + 64) = self->_connectionReuseCount;
  *(_QWORD *)(v5 + 424) |= 0x80uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200) == 0)
  {
LABEL_31:
    if ((has & 0x8000000000) == 0)
      goto LABEL_32;
    goto LABEL_113;
  }
LABEL_112:
  *(_QWORD *)(v5 + 80) = self->_dataStallCount;
  *(_QWORD *)(v5 + 424) |= 0x200uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000) == 0)
  {
LABEL_32:
    if ((has & 0x1000000000) == 0)
      goto LABEL_33;
    goto LABEL_114;
  }
LABEL_113:
  *(_DWORD *)(v5 + 320) = self->_connectionMode;
  *(_QWORD *)(v5 + 424) |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000) == 0)
  {
LABEL_33:
    if ((has & 0x800000000) == 0)
      goto LABEL_34;
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v5 + 300) = self->_appleHost;
  *(_QWORD *)(v5 + 424) |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_116;
  }
LABEL_115:
  *(_DWORD *)(v5 + 296) = self->_appleApp;
  *(_QWORD *)(v5 + 424) |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x200000000000) == 0)
  {
LABEL_35:
    if ((has & 0x100000000000) == 0)
      goto LABEL_36;
    goto LABEL_117;
  }
LABEL_116:
  *(_DWORD *)(v5 + 388) = self->_tlsVersion;
  *(_QWORD *)(v5 + 424) |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100000000000) == 0)
  {
LABEL_36:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_37;
    goto LABEL_118;
  }
LABEL_117:
  *(_DWORD *)(v5 + 384) = self->_stackLevel;
  *(_QWORD *)(v5 + 424) |= 0x100000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_38;
    goto LABEL_119;
  }
LABEL_118:
  *(_BYTE *)(v5 + 403) = self->_ipv4Available;
  *(_QWORD *)(v5 + 424) |= 0x8000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_120;
  }
LABEL_119:
  *(_BYTE *)(v5 + 404) = self->_ipv6Available;
  *(_QWORD *)(v5 + 424) |= 0x10000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x2000) == 0)
  {
LABEL_39:
    if ((has & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_121;
  }
LABEL_120:
  *(_QWORD *)(v5 + 112) = self->_ipv4DNSServerCount;
  *(_QWORD *)(v5 + 424) |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000) == 0)
  {
LABEL_40:
    if ((v8 & 8) == 0)
      goto LABEL_41;
    goto LABEL_122;
  }
LABEL_121:
  *(_QWORD *)(v5 + 128) = self->_ipv6DNSServerCount;
  *(_QWORD *)(v5 + 424) |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((v8 & 8) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_123;
  }
LABEL_122:
  *(_BYTE *)(v5 + 419) = self->_tlsVersionTimeout;
  *(_BYTE *)(v5 + 432) |= 8u;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((has & 4) == 0)
      goto LABEL_43;
    goto LABEL_124;
  }
LABEL_123:
  *(_BYTE *)(v5 + 412) = self->_synthesizedExtraIPv6Address;
  *(_QWORD *)(v5 + 424) |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 4) == 0)
  {
LABEL_43:
    if ((has & 8) == 0)
      goto LABEL_44;
    goto LABEL_125;
  }
LABEL_124:
  *(_QWORD *)(v5 + 24) = self->_bytesIn;
  *(_QWORD *)(v5 + 424) |= 4uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 8) == 0)
  {
LABEL_44:
    if ((has & 2) == 0)
      goto LABEL_45;
    goto LABEL_126;
  }
LABEL_125:
  *(_QWORD *)(v5 + 32) = self->_bytesOut;
  *(_QWORD *)(v5 + 424) |= 8uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 2) == 0)
  {
LABEL_45:
    if ((has & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_127;
  }
LABEL_126:
  *(_QWORD *)(v5 + 16) = self->_bytesDuplicate;
  *(_QWORD *)(v5 + 424) |= 2uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_128;
  }
LABEL_127:
  *(_QWORD *)(v5 + 40) = self->_bytesOutOfOrder;
  *(_QWORD *)(v5 + 424) |= 0x10uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x800000) == 0)
      goto LABEL_48;
    goto LABEL_129;
  }
LABEL_128:
  *(_QWORD *)(v5 + 48) = self->_bytesRetransmitted;
  *(_QWORD *)(v5 + 424) |= 0x20uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x800000) == 0)
  {
LABEL_48:
    if ((has & 0x1000000) == 0)
      goto LABEL_49;
    goto LABEL_130;
  }
LABEL_129:
  *(_QWORD *)(v5 + 192) = self->_packetsIn;
  *(_QWORD *)(v5 + 424) |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x1000000) == 0)
  {
LABEL_49:
    if ((has & 0x100) == 0)
      goto LABEL_50;
    goto LABEL_131;
  }
LABEL_130:
  *(_QWORD *)(v5 + 200) = self->_packetsOut;
  *(_QWORD *)(v5 + 424) |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x100) == 0)
  {
LABEL_50:
    if ((has & 0x40000000) == 0)
      goto LABEL_51;
    goto LABEL_132;
  }
LABEL_131:
  *(_QWORD *)(v5 + 72) = self->_currentRTT;
  *(_QWORD *)(v5 + 424) |= 0x100uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x40000000) == 0)
  {
LABEL_51:
    if ((has & 1) == 0)
      goto LABEL_52;
    goto LABEL_133;
  }
LABEL_132:
  *(_QWORD *)(v5 + 248) = self->_smoothedRTT;
  *(_QWORD *)(v5 + 424) |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 1) == 0)
  {
LABEL_52:
    if ((has & 0x8000000) == 0)
      goto LABEL_53;
    goto LABEL_134;
  }
LABEL_133:
  *(_QWORD *)(v5 + 8) = self->_bestRTT;
  *(_QWORD *)(v5 + 424) |= 1uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x8000000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000) == 0)
      goto LABEL_54;
    goto LABEL_135;
  }
LABEL_134:
  *(_QWORD *)(v5 + 224) = self->_rTTvariance;
  *(_QWORD *)(v5 + 424) |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_BYTE *)&self->_has + 8);
  if ((has & 0x80000000) == 0)
  {
LABEL_54:
    if ((v8 & 1) == 0)
      goto LABEL_55;
    goto LABEL_136;
  }
LABEL_135:
  *(_QWORD *)(v5 + 256) = self->_synRetransmissionCount;
  *(_QWORD *)(v5 + 424) |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 1) == 0)
  {
LABEL_55:
    if ((has & 0x400000) == 0)
      goto LABEL_56;
    goto LABEL_137;
  }
LABEL_136:
  *(_BYTE *)(v5 + 416) = self->_tfoUsed;
  *(_BYTE *)(v5 + 432) |= 1u;
  has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_56:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_138;
  }
LABEL_137:
  *(_QWORD *)(v5 + 184) = self->_multipathServiceType;
  *(_QWORD *)(v5 + 424) |= 0x400000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_139;
  }
LABEL_138:
  *(_BYTE *)(v5 + 402) = self->_firstParty;
  *(_QWORD *)(v5 + 424) |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_58:
    if ((has & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_140;
  }
LABEL_139:
  *(_QWORD *)(v5 + 136) = self->_multipathBytesInCell;
  *(_QWORD *)(v5 + 424) |= 0x10000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_59:
    if ((has & 0x40000) == 0)
      goto LABEL_60;
    goto LABEL_141;
  }
LABEL_140:
  *(_QWORD *)(v5 + 160) = self->_multipathBytesOutCell;
  *(_QWORD *)(v5 + 424) |= 0x80000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_60:
    if ((has & 0x200000) == 0)
      goto LABEL_61;
    goto LABEL_142;
  }
LABEL_141:
  *(_QWORD *)(v5 + 152) = self->_multipathBytesInWiFi;
  *(_QWORD *)(v5 + 424) |= 0x40000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_61:
    if ((has & 0x20000) == 0)
      goto LABEL_62;
    goto LABEL_143;
  }
LABEL_142:
  *(_QWORD *)(v5 + 176) = self->_multipathBytesOutWiFi;
  *(_QWORD *)(v5 + 424) |= 0x200000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_144;
  }
LABEL_143:
  *(_QWORD *)(v5 + 144) = self->_multipathBytesInInitial;
  *(_QWORD *)(v5 + 424) |= 0x20000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x20000000) == 0)
      goto LABEL_64;
    goto LABEL_145;
  }
LABEL_144:
  *(_QWORD *)(v5 + 168) = self->_multipathBytesOutInitial;
  *(_QWORD *)(v5 + 424) |= 0x100000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_145:
  *(_QWORD *)(v5 + 240) = self->_secondsSinceInterfaceChange;
  *(_QWORD *)(v5 + 424) |= 0x20000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
  {
LABEL_65:
    *(_BYTE *)(v5 + 405) = self->_isDaemon;
    *(_QWORD *)(v5 + 424) |= 0x20000000000000uLL;
  }
LABEL_66:

  *(_QWORD *)(v6 + 376) = -[NSString copyWithZone:](self->_processName, "copyWithZone:", a3);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  activities = self->_activities;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(activities);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addActivities:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activities, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  *(_QWORD *)(v6 + 328) = -[NSString copyWithZone:](self->_connectionUUID, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
  {
    *(_BYTE *)(v6 + 418) = self->_tlsHandshakeTimedOut;
    *(_BYTE *)(v6 + 432) |= 4u;
  }
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x80000000000000) != 0)
  {
    *(_BYTE *)(v6 + 407) = self->_isPathExpensive;
    *(_QWORD *)(v6 + 424) |= 0x80000000000000uLL;
    v15 = (uint64_t)self->_has;
    if ((v15 & 0x40000000000000) == 0)
    {
LABEL_77:
      if ((v15 & 0x400000000000000) == 0)
        goto LABEL_78;
      goto LABEL_149;
    }
  }
  else if ((v15 & 0x40000000000000) == 0)
  {
    goto LABEL_77;
  }
  *(_BYTE *)(v6 + 406) = self->_isPathConstrained;
  *(_QWORD *)(v6 + 424) |= 0x40000000000000uLL;
  v15 = (uint64_t)self->_has;
  if ((v15 & 0x400000000000000) == 0)
  {
LABEL_78:
    if ((v15 & 0x200000000000000) == 0)
      goto LABEL_80;
    goto LABEL_79;
  }
LABEL_149:
  *(_BYTE *)(v6 + 410) = self->_prohibitsExpensive;
  *(_QWORD *)(v6 + 424) |= 0x400000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000000000) != 0)
  {
LABEL_79:
    *(_BYTE *)(v6 + 409) = self->_prohibitsConstrained;
    *(_QWORD *)(v6 + 424) |= 0x200000000000000uLL;
  }
LABEL_80:

  *(_QWORD *)(v6 + 368) = -[AWDNWL2Report copyWithZone:](self->_l2Report, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 336) = -[AWDNWDeviceReport copyWithZone:](self->_deviceReport, "copyWithZone:", a3);
  p_has = &self->_has;
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x400000000000) == 0)
  {
    if ((v17 & 0x10000000000) == 0)
      goto LABEL_82;
LABEL_152:
    *(_DWORD *)(v6 + 344) = self->_dnsProtocol;
    *(_QWORD *)(v6 + 424) |= 0x10000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x20000000000) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
  *(_DWORD *)(v6 + 392) = self->_transportProtocol;
  *(_QWORD *)(v6 + 424) |= 0x400000000000uLL;
  v17 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000000) != 0)
    goto LABEL_152;
LABEL_82:
  if ((v17 & 0x20000000000) != 0)
  {
LABEL_83:
    *(_DWORD *)(v6 + 348) = self->_dnsProvider;
    *(_QWORD *)(v6 + 424) |= 0x20000000000uLL;
  }
LABEL_84:

  *(_QWORD *)(v6 + 304) = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 352) = -[NSString copyWithZone:](self->_effectiveBundleID, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  uint64_t has;
  uint64_t v7;
  uint64_t v8;
  NSString *processName;
  NSMutableArray *activities;
  NSString *connectionUUID;
  uint64_t v12;
  uint64_t v13;
  AWDNWL2Report *l2Report;
  AWDNWDeviceReport *deviceReport;
  uint64_t v16;
  uint64_t v17;
  NSString *bundleID;
  NSString *effectiveBundleID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)a3 + 53);
  if ((has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_timestamp != *((_QWORD *)a3 + 33))
      goto LABEL_440;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((_BYTE *)&self->_has + 8) & 0x10) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 0x10) == 0)
      goto LABEL_440;
    if (self->_triggeredPath)
    {
      if (!*((_BYTE *)a3 + 420))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 420))
    {
      goto LABEL_440;
    }
  }
  else if ((*((_BYTE *)a3 + 432) & 0x10) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v7 & 0x4000000000000000) == 0)
      goto LABEL_440;
    if (self->_systemProxyConfigured)
    {
      if (!*((_BYTE *)a3 + 414))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 414))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x4000000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0)
      goto LABEL_440;
    if (self->_customProxyConfigured)
    {
      if (!*((_BYTE *)a3 + 400))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 400))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v7 & 0x800000000000) == 0 || self->_usedProxyType != *((_DWORD *)a3 + 99))
      goto LABEL_440;
  }
  else if ((v7 & 0x800000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v7 & 0x2000000000000) == 0)
      goto LABEL_440;
    if (self->_fallbackEligible)
    {
      if (!*((_BYTE *)a3 + 401))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 401))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x2000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((_BYTE *)&self->_has + 8) & 0x40) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 0x40) == 0)
      goto LABEL_440;
    if (self->_weakFallback)
    {
      if (!*((_BYTE *)a3 + 422))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 422))
    {
      goto LABEL_440;
    }
  }
  else if ((*((_BYTE *)a3 + 432) & 0x40) != 0)
  {
    goto LABEL_440;
  }
  if ((*((_BYTE *)&self->_has + 8) & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 0x20) == 0)
      goto LABEL_440;
    if (self->_usedFallback)
    {
      if (!*((_BYTE *)a3 + 421))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 421))
    {
      goto LABEL_440;
    }
  }
  else if ((*((_BYTE *)a3 + 432) & 0x20) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v7 & 0x800000000000000) == 0)
      goto LABEL_440;
    if (self->_resolutionRequired)
    {
      if (!*((_BYTE *)a3 + 411))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 411))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x800000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((_BYTE *)&self->_has + 8) & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 2) == 0)
      goto LABEL_440;
    if (self->_tlsConfigured)
    {
      if (!*((_BYTE *)a3 + 417))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 417))
    {
      goto LABEL_440;
    }
  }
  else if ((*((_BYTE *)a3 + 432) & 2) != 0)
  {
    goto LABEL_440;
  }
  if (has < 0)
  {
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_440;
    if (self->_tfoConfigured)
    {
      if (!*((_BYTE *)a3 + 415))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 415))
    {
      goto LABEL_440;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v7 & 0x100000000000000) == 0)
      goto LABEL_440;
    if (self->_multipathConfigured)
    {
      if (!*((_BYTE *)a3 + 408))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 408))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x100000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_trafficClass != *((_QWORD *)a3 + 35))
      goto LABEL_440;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_failureReason != *((_DWORD *)a3 + 90))
      goto LABEL_440;
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_pathTriggerMilliseconds != *((_QWORD *)a3 + 26))
      goto LABEL_440;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_resolutionMilliseconds != *((_QWORD *)a3 + 29))
      goto LABEL_440;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_proxyMilliseconds != *((_QWORD *)a3 + 27))
      goto LABEL_440;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_flowConnectMilliseconds != *((_QWORD *)a3 + 11))
      goto LABEL_440;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_tlsMilliseconds != *((_QWORD *)a3 + 34))
      goto LABEL_440;
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_flowDurationMilliseconds != *((_QWORD *)a3 + 12))
      goto LABEL_440;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_ipv4AddressCount != *((_QWORD *)a3 + 13))
      goto LABEL_440;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_ipv6AddressCount != *((_QWORD *)a3 + 15))
      goto LABEL_440;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_440;
    if (self->_synthesizedIPv6Address)
    {
      if (!*((_BYTE *)a3 + 413))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 413))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x2000000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_firstAddressFamily != *((_DWORD *)a3 + 91))
      goto LABEL_440;
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0 || self->_connectedAddressFamily != *((_DWORD *)a3 + 78))
      goto LABEL_440;
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_connectedAddressIndex != *((_QWORD *)a3 + 7))
      goto LABEL_440;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_connectedInterfaceType != *((_DWORD *)a3 + 79))
      goto LABEL_440;
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_connectionReuseCount != *((_QWORD *)a3 + 8))
      goto LABEL_440;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_dataStallCount != *((_QWORD *)a3 + 10))
      goto LABEL_440;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_connectionMode != *((_DWORD *)a3 + 80))
      goto LABEL_440;
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_appleHost != *((_DWORD *)a3 + 75))
      goto LABEL_440;
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_appleApp != *((_DWORD *)a3 + 74))
      goto LABEL_440;
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_tlsVersion != *((_DWORD *)a3 + 97))
      goto LABEL_440;
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0 || self->_stackLevel != *((_DWORD *)a3 + 96))
      goto LABEL_440;
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v7 & 0x8000000000000) == 0)
      goto LABEL_440;
    if (self->_ipv4Available)
    {
      if (!*((_BYTE *)a3 + 403))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 403))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x8000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v7 & 0x10000000000000) == 0)
      goto LABEL_440;
    if (self->_ipv6Available)
    {
      if (!*((_BYTE *)a3 + 404))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 404))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x10000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_ipv4DNSServerCount != *((_QWORD *)a3 + 14))
      goto LABEL_440;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_ipv6DNSServerCount != *((_QWORD *)a3 + 16))
      goto LABEL_440;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((_BYTE *)&self->_has + 8) & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 8) == 0)
      goto LABEL_440;
    if (self->_tlsVersionTimeout)
    {
      if (!*((_BYTE *)a3 + 419))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 419))
    {
      goto LABEL_440;
    }
  }
  else if ((*((_BYTE *)a3 + 432) & 8) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_440;
    if (self->_synthesizedExtraIPv6Address)
    {
      if (!*((_BYTE *)a3 + 412))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 412))
    {
      goto LABEL_440;
    }
  }
  else if ((v7 & 0x1000000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bytesIn != *((_QWORD *)a3 + 3))
      goto LABEL_440;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_bytesOut != *((_QWORD *)a3 + 4))
      goto LABEL_440;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bytesDuplicate != *((_QWORD *)a3 + 2))
      goto LABEL_440;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_440;
  }
  v8 = *((_QWORD *)a3 + 53);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_bytesOutOfOrder != *((_QWORD *)a3 + 5))
      goto LABEL_440;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_bytesRetransmitted != *((_QWORD *)a3 + 6))
      goto LABEL_440;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_packetsIn != *((_QWORD *)a3 + 24))
      goto LABEL_440;
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_packetsOut != *((_QWORD *)a3 + 25))
      goto LABEL_440;
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_currentRTT != *((_QWORD *)a3 + 9))
      goto LABEL_440;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0 || self->_smoothedRTT != *((_QWORD *)a3 + 31))
      goto LABEL_440;
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_bestRTT != *((_QWORD *)a3 + 1))
      goto LABEL_440;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0 || self->_rTTvariance != *((_QWORD *)a3 + 28))
      goto LABEL_440;
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v8 & 0x80000000) == 0 || self->_synRetransmissionCount != *((_QWORD *)a3 + 32))
      goto LABEL_440;
  }
  else if ((v8 & 0x80000000) != 0)
  {
    goto LABEL_440;
  }
  if ((*((_BYTE *)&self->_has + 8) & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 1) == 0)
      goto LABEL_440;
    if (self->_tfoUsed)
    {
      if (!*((_BYTE *)a3 + 416))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 416))
    {
      goto LABEL_440;
    }
  }
  else if ((*((_BYTE *)a3 + 432) & 1) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_multipathServiceType != *((_QWORD *)a3 + 23))
      goto LABEL_440;
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_440;
    if (self->_firstParty)
    {
      if (!*((_BYTE *)a3 + 402))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 402))
    {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x4000000000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_multipathBytesInCell != *((_QWORD *)a3 + 17))
      goto LABEL_440;
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_multipathBytesOutCell != *((_QWORD *)a3 + 20))
      goto LABEL_440;
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_multipathBytesInWiFi != *((_QWORD *)a3 + 19))
      goto LABEL_440;
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_multipathBytesOutWiFi != *((_QWORD *)a3 + 22))
      goto LABEL_440;
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_multipathBytesInInitial != *((_QWORD *)a3 + 18))
      goto LABEL_440;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_multipathBytesOutInitial != *((_QWORD *)a3 + 21))
      goto LABEL_440;
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0 || self->_secondsSinceInterfaceChange != *((_QWORD *)a3 + 30))
      goto LABEL_440;
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_440;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v8 & 0x20000000000000) == 0)
      goto LABEL_440;
    if (self->_isDaemon)
    {
      if (!*((_BYTE *)a3 + 405))
        goto LABEL_440;
    }
    else if (*((_BYTE *)a3 + 405))
    {
      goto LABEL_440;
    }
  }
  else if ((v8 & 0x20000000000000) != 0)
  {
    goto LABEL_440;
  }
  processName = self->_processName;
  if (!((unint64_t)processName | *((_QWORD *)a3 + 47))
    || (v5 = -[NSString isEqual:](processName, "isEqual:")) != 0)
  {
    activities = self->_activities;
    if (!((unint64_t)activities | *((_QWORD *)a3 + 36))
      || (v5 = -[NSMutableArray isEqual:](activities, "isEqual:")) != 0)
    {
      connectionUUID = self->_connectionUUID;
      if (!((unint64_t)connectionUUID | *((_QWORD *)a3 + 41))
        || (v5 = -[NSString isEqual:](connectionUUID, "isEqual:")) != 0)
      {
        v12 = (uint64_t)self->_has;
        v13 = *((_QWORD *)a3 + 53);
        if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 432) & 4) == 0)
            goto LABEL_440;
          if (self->_tlsHandshakeTimedOut)
          {
            if (!*((_BYTE *)a3 + 418))
              goto LABEL_440;
          }
          else if (*((_BYTE *)a3 + 418))
          {
            goto LABEL_440;
          }
        }
        else if ((*((_BYTE *)a3 + 432) & 4) != 0)
        {
          goto LABEL_440;
        }
        if ((v12 & 0x80000000000000) != 0)
        {
          if ((v13 & 0x80000000000000) == 0)
            goto LABEL_440;
          if (self->_isPathExpensive)
          {
            if (!*((_BYTE *)a3 + 407))
              goto LABEL_440;
          }
          else if (*((_BYTE *)a3 + 407))
          {
            goto LABEL_440;
          }
        }
        else if ((v13 & 0x80000000000000) != 0)
        {
          goto LABEL_440;
        }
        if ((v12 & 0x40000000000000) != 0)
        {
          if ((v13 & 0x40000000000000) == 0)
            goto LABEL_440;
          if (self->_isPathConstrained)
          {
            if (!*((_BYTE *)a3 + 406))
              goto LABEL_440;
          }
          else if (*((_BYTE *)a3 + 406))
          {
            goto LABEL_440;
          }
        }
        else if ((v13 & 0x40000000000000) != 0)
        {
          goto LABEL_440;
        }
        if ((v12 & 0x400000000000000) != 0)
        {
          if ((v13 & 0x400000000000000) == 0)
            goto LABEL_440;
          if (self->_prohibitsExpensive)
          {
            if (!*((_BYTE *)a3 + 410))
              goto LABEL_440;
          }
          else if (*((_BYTE *)a3 + 410))
          {
            goto LABEL_440;
          }
        }
        else if ((v13 & 0x400000000000000) != 0)
        {
          goto LABEL_440;
        }
        if ((v12 & 0x200000000000000) != 0)
        {
          if ((v13 & 0x200000000000000) == 0)
            goto LABEL_440;
          if (self->_prohibitsConstrained)
          {
            if (!*((_BYTE *)a3 + 409))
              goto LABEL_440;
          }
          else if (*((_BYTE *)a3 + 409))
          {
            goto LABEL_440;
          }
        }
        else if ((v13 & 0x200000000000000) != 0)
        {
          goto LABEL_440;
        }
        l2Report = self->_l2Report;
        if (!((unint64_t)l2Report | *((_QWORD *)a3 + 46))
          || (v5 = -[AWDNWL2Report isEqual:](l2Report, "isEqual:")) != 0)
        {
          deviceReport = self->_deviceReport;
          if (!((unint64_t)deviceReport | *((_QWORD *)a3 + 42))
            || (v5 = -[AWDNWDeviceReport isEqual:](deviceReport, "isEqual:")) != 0)
          {
            v16 = (uint64_t)self->_has;
            v17 = *((_QWORD *)a3 + 53);
            if ((v16 & 0x400000000000) != 0)
            {
              if ((v17 & 0x400000000000) == 0 || self->_transportProtocol != *((_DWORD *)a3 + 98))
                goto LABEL_440;
            }
            else if ((v17 & 0x400000000000) != 0)
            {
              goto LABEL_440;
            }
            if ((v16 & 0x10000000000) != 0)
            {
              if ((v17 & 0x10000000000) == 0 || self->_dnsProtocol != *((_DWORD *)a3 + 86))
                goto LABEL_440;
            }
            else if ((v17 & 0x10000000000) != 0)
            {
              goto LABEL_440;
            }
            if ((v16 & 0x20000000000) != 0)
            {
              if ((v17 & 0x20000000000) == 0 || self->_dnsProvider != *((_DWORD *)a3 + 87))
                goto LABEL_440;
              goto LABEL_436;
            }
            if ((v17 & 0x20000000000) == 0)
            {
LABEL_436:
              bundleID = self->_bundleID;
              if (!((unint64_t)bundleID | *((_QWORD *)a3 + 38))
                || (v5 = -[NSString isEqual:](bundleID, "isEqual:")) != 0)
              {
                effectiveBundleID = self->_effectiveBundleID;
                if ((unint64_t)effectiveBundleID | *((_QWORD *)a3 + 44))
                  LOBYTE(v5) = -[NSString isEqual:](effectiveBundleID, "isEqual:");
                else
                  LOBYTE(v5) = 1;
              }
              return v5;
            }
LABEL_440:
            LOBYTE(v5) = 0;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t has;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;

  has = (uint64_t)self->_has;
  if ((has & 0x100000000) != 0)
  {
    v84 = 2654435761u * self->_timestamp;
    if ((*((_BYTE *)&self->_has + 8) & 0x10) != 0)
    {
LABEL_3:
      v83 = 2654435761 * self->_triggeredPath;
      if ((has & 0x4000000000000000) != 0)
        goto LABEL_4;
      goto LABEL_67;
    }
  }
  else
  {
    v84 = 0;
    if ((*((_BYTE *)&self->_has + 8) & 0x10) != 0)
      goto LABEL_3;
  }
  v83 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_4:
    v82 = 2654435761 * self->_systemProxyConfigured;
    if ((has & 0x1000000000000) != 0)
      goto LABEL_5;
    goto LABEL_68;
  }
LABEL_67:
  v82 = 0;
  if ((has & 0x1000000000000) != 0)
  {
LABEL_5:
    v81 = 2654435761 * self->_customProxyConfigured;
    if ((has & 0x800000000000) != 0)
      goto LABEL_6;
    goto LABEL_69;
  }
LABEL_68:
  v81 = 0;
  if ((has & 0x800000000000) != 0)
  {
LABEL_6:
    v80 = 2654435761 * self->_usedProxyType;
    if ((has & 0x2000000000000) != 0)
      goto LABEL_7;
    goto LABEL_70;
  }
LABEL_69:
  v80 = 0;
  if ((has & 0x2000000000000) != 0)
  {
LABEL_7:
    v79 = 2654435761 * self->_fallbackEligible;
    if ((*((_BYTE *)&self->_has + 8) & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_71;
  }
LABEL_70:
  v79 = 0;
  if ((*((_BYTE *)&self->_has + 8) & 0x40) != 0)
  {
LABEL_8:
    v78 = 2654435761 * self->_weakFallback;
    if ((*((_BYTE *)&self->_has + 8) & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_72;
  }
LABEL_71:
  v78 = 0;
  if ((*((_BYTE *)&self->_has + 8) & 0x20) != 0)
  {
LABEL_9:
    v77 = 2654435761 * self->_usedFallback;
    if ((has & 0x800000000000000) != 0)
      goto LABEL_10;
    goto LABEL_73;
  }
LABEL_72:
  v77 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_10:
    v76 = 2654435761 * self->_resolutionRequired;
    if ((*((_BYTE *)&self->_has + 8) & 2) != 0)
      goto LABEL_11;
    goto LABEL_74;
  }
LABEL_73:
  v76 = 0;
  if ((*((_BYTE *)&self->_has + 8) & 2) != 0)
  {
LABEL_11:
    v75 = 2654435761 * self->_tlsConfigured;
    if (has < 0)
      goto LABEL_12;
    goto LABEL_75;
  }
LABEL_74:
  v75 = 0;
  if (has < 0)
  {
LABEL_12:
    v74 = 2654435761 * self->_tfoConfigured;
    if ((has & 0x100000000000000) != 0)
      goto LABEL_13;
    goto LABEL_76;
  }
LABEL_75:
  v74 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_13:
    v73 = 2654435761 * self->_multipathConfigured;
    if ((has & 0x400000000) != 0)
      goto LABEL_14;
    goto LABEL_77;
  }
LABEL_76:
  v73 = 0;
  if ((has & 0x400000000) != 0)
  {
LABEL_14:
    v72 = 2654435761u * self->_trafficClass;
    if ((has & 0x40000000000) != 0)
      goto LABEL_15;
    goto LABEL_78;
  }
LABEL_77:
  v72 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_15:
    v71 = 2654435761 * self->_failureReason;
    if ((has & 0x2000000) != 0)
      goto LABEL_16;
    goto LABEL_79;
  }
LABEL_78:
  v71 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_16:
    v70 = 2654435761u * self->_pathTriggerMilliseconds;
    if ((has & 0x10000000) != 0)
      goto LABEL_17;
    goto LABEL_80;
  }
LABEL_79:
  v70 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_17:
    v69 = 2654435761u * self->_resolutionMilliseconds;
    if ((has & 0x4000000) != 0)
      goto LABEL_18;
    goto LABEL_81;
  }
LABEL_80:
  v69 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_18:
    v68 = 2654435761u * self->_proxyMilliseconds;
    if ((has & 0x400) != 0)
      goto LABEL_19;
    goto LABEL_82;
  }
LABEL_81:
  v68 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_19:
    v67 = 2654435761u * self->_flowConnectMilliseconds;
    if ((has & 0x200000000) != 0)
      goto LABEL_20;
    goto LABEL_83;
  }
LABEL_82:
  v67 = 0;
  if ((has & 0x200000000) != 0)
  {
LABEL_20:
    v66 = 2654435761u * self->_tlsMilliseconds;
    if ((has & 0x800) != 0)
      goto LABEL_21;
    goto LABEL_84;
  }
LABEL_83:
  v66 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_21:
    v65 = 2654435761u * self->_flowDurationMilliseconds;
    if ((has & 0x1000) != 0)
      goto LABEL_22;
    goto LABEL_85;
  }
LABEL_84:
  v65 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_22:
    v64 = 2654435761u * self->_ipv4AddressCount;
    if ((has & 0x4000) != 0)
      goto LABEL_23;
    goto LABEL_86;
  }
LABEL_85:
  v64 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_23:
    v63 = 2654435761u * self->_ipv6AddressCount;
    if ((has & 0x2000000000000000) != 0)
      goto LABEL_24;
    goto LABEL_87;
  }
LABEL_86:
  v63 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_24:
    v62 = 2654435761 * self->_synthesizedIPv6Address;
    if ((has & 0x80000000000) != 0)
      goto LABEL_25;
    goto LABEL_88;
  }
LABEL_87:
  v62 = 0;
  if ((has & 0x80000000000) != 0)
  {
LABEL_25:
    v61 = 2654435761 * self->_firstAddressFamily;
    if ((has & 0x2000000000) != 0)
      goto LABEL_26;
    goto LABEL_89;
  }
LABEL_88:
  v61 = 0;
  if ((has & 0x2000000000) != 0)
  {
LABEL_26:
    v60 = 2654435761 * self->_connectedAddressFamily;
    if ((has & 0x40) != 0)
      goto LABEL_27;
    goto LABEL_90;
  }
LABEL_89:
  v60 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_27:
    v59 = 2654435761u * self->_connectedAddressIndex;
    if ((has & 0x4000000000) != 0)
      goto LABEL_28;
    goto LABEL_91;
  }
LABEL_90:
  v59 = 0;
  if ((has & 0x4000000000) != 0)
  {
LABEL_28:
    v58 = 2654435761 * self->_connectedInterfaceType;
    if ((has & 0x80) != 0)
      goto LABEL_29;
    goto LABEL_92;
  }
LABEL_91:
  v58 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_29:
    v57 = 2654435761u * self->_connectionReuseCount;
    if ((has & 0x200) != 0)
      goto LABEL_30;
    goto LABEL_93;
  }
LABEL_92:
  v57 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_30:
    v56 = 2654435761u * self->_dataStallCount;
    if ((has & 0x8000000000) != 0)
      goto LABEL_31;
    goto LABEL_94;
  }
LABEL_93:
  v56 = 0;
  if ((has & 0x8000000000) != 0)
  {
LABEL_31:
    v55 = 2654435761 * self->_connectionMode;
    if ((has & 0x1000000000) != 0)
      goto LABEL_32;
    goto LABEL_95;
  }
LABEL_94:
  v55 = 0;
  if ((has & 0x1000000000) != 0)
  {
LABEL_32:
    v54 = 2654435761 * self->_appleHost;
    if ((has & 0x800000000) != 0)
      goto LABEL_33;
    goto LABEL_96;
  }
LABEL_95:
  v54 = 0;
  if ((has & 0x800000000) != 0)
  {
LABEL_33:
    v53 = 2654435761 * self->_appleApp;
    if ((has & 0x200000000000) != 0)
      goto LABEL_34;
    goto LABEL_97;
  }
LABEL_96:
  v53 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_34:
    v52 = 2654435761 * self->_tlsVersion;
    if ((has & 0x100000000000) != 0)
      goto LABEL_35;
    goto LABEL_98;
  }
LABEL_97:
  v52 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_35:
    v51 = 2654435761 * self->_stackLevel;
    if ((has & 0x8000000000000) != 0)
      goto LABEL_36;
    goto LABEL_99;
  }
LABEL_98:
  v51 = 0;
  if ((has & 0x8000000000000) != 0)
  {
LABEL_36:
    v50 = 2654435761 * self->_ipv4Available;
    if ((has & 0x10000000000000) != 0)
      goto LABEL_37;
    goto LABEL_100;
  }
LABEL_99:
  v50 = 0;
  if ((has & 0x10000000000000) != 0)
  {
LABEL_37:
    v49 = 2654435761 * self->_ipv6Available;
    if ((has & 0x2000) != 0)
      goto LABEL_38;
    goto LABEL_101;
  }
LABEL_100:
  v49 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_38:
    v48 = 2654435761u * self->_ipv4DNSServerCount;
    if ((has & 0x8000) != 0)
      goto LABEL_39;
    goto LABEL_102;
  }
LABEL_101:
  v48 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_39:
    v47 = 2654435761u * self->_ipv6DNSServerCount;
    if ((*((_BYTE *)&self->_has + 8) & 8) != 0)
      goto LABEL_40;
    goto LABEL_103;
  }
LABEL_102:
  v47 = 0;
  if ((*((_BYTE *)&self->_has + 8) & 8) != 0)
  {
LABEL_40:
    v46 = 2654435761 * self->_tlsVersionTimeout;
    if ((has & 0x1000000000000000) != 0)
      goto LABEL_41;
    goto LABEL_104;
  }
LABEL_103:
  v46 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_41:
    v45 = 2654435761 * self->_synthesizedExtraIPv6Address;
    if ((has & 4) != 0)
      goto LABEL_42;
    goto LABEL_105;
  }
LABEL_104:
  v45 = 0;
  if ((has & 4) != 0)
  {
LABEL_42:
    v44 = 2654435761u * self->_bytesIn;
    if ((has & 8) != 0)
      goto LABEL_43;
    goto LABEL_106;
  }
LABEL_105:
  v44 = 0;
  if ((has & 8) != 0)
  {
LABEL_43:
    v43 = 2654435761u * self->_bytesOut;
    if ((has & 2) != 0)
      goto LABEL_44;
    goto LABEL_107;
  }
LABEL_106:
  v43 = 0;
  if ((has & 2) != 0)
  {
LABEL_44:
    v42 = 2654435761u * self->_bytesDuplicate;
    if ((has & 0x10) != 0)
      goto LABEL_45;
    goto LABEL_108;
  }
LABEL_107:
  v42 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_45:
    v41 = 2654435761u * self->_bytesOutOfOrder;
    if ((has & 0x20) != 0)
      goto LABEL_46;
    goto LABEL_109;
  }
LABEL_108:
  v41 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_46:
    v40 = 2654435761u * self->_bytesRetransmitted;
    if ((has & 0x800000) != 0)
      goto LABEL_47;
    goto LABEL_110;
  }
LABEL_109:
  v40 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_47:
    v39 = 2654435761u * self->_packetsIn;
    if ((has & 0x1000000) != 0)
      goto LABEL_48;
    goto LABEL_111;
  }
LABEL_110:
  v39 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_48:
    v38 = 2654435761u * self->_packetsOut;
    if ((has & 0x100) != 0)
      goto LABEL_49;
    goto LABEL_112;
  }
LABEL_111:
  v38 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_49:
    v37 = 2654435761u * self->_currentRTT;
    if ((has & 0x40000000) != 0)
      goto LABEL_50;
    goto LABEL_113;
  }
LABEL_112:
  v37 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_50:
    v36 = 2654435761u * self->_smoothedRTT;
    if ((has & 1) != 0)
      goto LABEL_51;
    goto LABEL_114;
  }
LABEL_113:
  v36 = 0;
  if ((has & 1) != 0)
  {
LABEL_51:
    v35 = 2654435761u * self->_bestRTT;
    if ((has & 0x8000000) != 0)
      goto LABEL_52;
    goto LABEL_115;
  }
LABEL_114:
  v35 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_52:
    v34 = 2654435761u * self->_rTTvariance;
    if ((has & 0x80000000) != 0)
      goto LABEL_53;
    goto LABEL_116;
  }
LABEL_115:
  v34 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_53:
    v33 = 2654435761u * self->_synRetransmissionCount;
    if ((*((_BYTE *)&self->_has + 8) & 1) != 0)
      goto LABEL_54;
    goto LABEL_117;
  }
LABEL_116:
  v33 = 0;
  if ((*((_BYTE *)&self->_has + 8) & 1) != 0)
  {
LABEL_54:
    v32 = 2654435761 * self->_tfoUsed;
    if ((has & 0x400000) != 0)
      goto LABEL_55;
    goto LABEL_118;
  }
LABEL_117:
  v32 = 0;
  if ((has & 0x400000) != 0)
  {
LABEL_55:
    v31 = 2654435761u * self->_multipathServiceType;
    if ((has & 0x4000000000000) != 0)
      goto LABEL_56;
    goto LABEL_119;
  }
LABEL_118:
  v31 = 0;
  if ((has & 0x4000000000000) != 0)
  {
LABEL_56:
    v30 = 2654435761 * self->_firstParty;
    if ((has & 0x10000) != 0)
      goto LABEL_57;
    goto LABEL_120;
  }
LABEL_119:
  v30 = 0;
  if ((has & 0x10000) != 0)
  {
LABEL_57:
    v29 = 2654435761u * self->_multipathBytesInCell;
    if ((has & 0x80000) != 0)
      goto LABEL_58;
    goto LABEL_121;
  }
LABEL_120:
  v29 = 0;
  if ((has & 0x80000) != 0)
  {
LABEL_58:
    v28 = 2654435761u * self->_multipathBytesOutCell;
    if ((has & 0x40000) != 0)
      goto LABEL_59;
    goto LABEL_122;
  }
LABEL_121:
  v28 = 0;
  if ((has & 0x40000) != 0)
  {
LABEL_59:
    v27 = 2654435761u * self->_multipathBytesInWiFi;
    if ((has & 0x200000) != 0)
      goto LABEL_60;
    goto LABEL_123;
  }
LABEL_122:
  v27 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_60:
    v26 = 2654435761u * self->_multipathBytesOutWiFi;
    if ((has & 0x20000) != 0)
      goto LABEL_61;
    goto LABEL_124;
  }
LABEL_123:
  v26 = 0;
  if ((has & 0x20000) != 0)
  {
LABEL_61:
    v25 = 2654435761u * self->_multipathBytesInInitial;
    if ((has & 0x100000) != 0)
      goto LABEL_62;
    goto LABEL_125;
  }
LABEL_124:
  v25 = 0;
  if ((has & 0x100000) != 0)
  {
LABEL_62:
    v24 = 2654435761u * self->_multipathBytesOutInitial;
    if ((has & 0x20000000) != 0)
      goto LABEL_63;
LABEL_126:
    v23 = 0;
    if ((has & 0x20000000000000) != 0)
      goto LABEL_64;
    goto LABEL_127;
  }
LABEL_125:
  v24 = 0;
  if ((has & 0x20000000) == 0)
    goto LABEL_126;
LABEL_63:
  v23 = 2654435761u * self->_secondsSinceInterfaceChange;
  if ((has & 0x20000000000000) != 0)
  {
LABEL_64:
    v22 = 2654435761 * self->_isDaemon;
    goto LABEL_128;
  }
LABEL_127:
  v22 = 0;
LABEL_128:
  v21 = -[NSString hash](self->_processName, "hash");
  v20 = -[NSMutableArray hash](self->_activities, "hash");
  v4 = -[NSString hash](self->_connectionUUID, "hash");
  v5 = (uint64_t)self->_has;
  if ((*((_BYTE *)&self->_has + 8) & 4) != 0)
  {
    v6 = 2654435761 * self->_tlsHandshakeTimedOut;
    if ((v5 & 0x80000000000000) != 0)
    {
LABEL_130:
      v7 = 2654435761 * self->_isPathExpensive;
      if ((v5 & 0x40000000000000) != 0)
        goto LABEL_131;
      goto LABEL_136;
    }
  }
  else
  {
    v6 = 0;
    if ((v5 & 0x80000000000000) != 0)
      goto LABEL_130;
  }
  v7 = 0;
  if ((v5 & 0x40000000000000) != 0)
  {
LABEL_131:
    v8 = 2654435761 * self->_isPathConstrained;
    if ((v5 & 0x400000000000000) != 0)
      goto LABEL_132;
LABEL_137:
    v9 = 0;
    if ((v5 & 0x200000000000000) != 0)
      goto LABEL_133;
    goto LABEL_138;
  }
LABEL_136:
  v8 = 0;
  if ((v5 & 0x400000000000000) == 0)
    goto LABEL_137;
LABEL_132:
  v9 = 2654435761 * self->_prohibitsExpensive;
  if ((v5 & 0x200000000000000) != 0)
  {
LABEL_133:
    v10 = 2654435761 * self->_prohibitsConstrained;
    goto LABEL_139;
  }
LABEL_138:
  v10 = 0;
LABEL_139:
  v11 = -[AWDNWL2Report hash](self->_l2Report, "hash");
  v12 = -[AWDNWDeviceReport hash](self->_deviceReport, "hash");
  v13 = (uint64_t)self->_has;
  if ((v13 & 0x400000000000) == 0)
  {
    v14 = 0;
    if ((v13 & 0x10000000000) != 0)
      goto LABEL_141;
LABEL_144:
    v15 = 0;
    if ((v13 & 0x20000000000) != 0)
      goto LABEL_142;
LABEL_145:
    v16 = 0;
    goto LABEL_146;
  }
  v14 = 2654435761 * self->_transportProtocol;
  if ((v13 & 0x10000000000) == 0)
    goto LABEL_144;
LABEL_141:
  v15 = 2654435761 * self->_dnsProtocol;
  if ((v13 & 0x20000000000) == 0)
    goto LABEL_145;
LABEL_142:
  v16 = 2654435761 * self->_dnsProvider;
LABEL_146:
  v17 = v83 ^ v84 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  v18 = v14 ^ v15 ^ v16 ^ -[NSString hash](self->_bundleID, "hash");
  return v17 ^ v18 ^ -[NSString hash](self->_effectiveBundleID, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  AWDNWL2Report *l2Report;
  uint64_t v14;
  AWDNWDeviceReport *deviceReport;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x100000000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 33);
    *(_QWORD *)&self->_has |= 0x100000000uLL;
    v5 = *((_QWORD *)a3 + 53);
  }
  v6 = *((_BYTE *)a3 + 432);
  if ((v6 & 0x10) != 0)
  {
    self->_triggeredPath = *((_BYTE *)a3 + 420);
    *((_BYTE *)&self->_has + 8) |= 0x10u;
    v5 = *((_QWORD *)a3 + 53);
    v6 = *((_BYTE *)a3 + 432);
    if ((v5 & 0x4000000000000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x1000000000000) == 0)
        goto LABEL_6;
      goto LABEL_89;
    }
  }
  else if ((v5 & 0x4000000000000000) == 0)
  {
    goto LABEL_5;
  }
  self->_systemProxyConfigured = *((_BYTE *)a3 + 414);
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x1000000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800000000000) == 0)
      goto LABEL_7;
    goto LABEL_90;
  }
LABEL_89:
  self->_customProxyConfigured = *((_BYTE *)a3 + 400);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x2000000000000) == 0)
      goto LABEL_8;
    goto LABEL_91;
  }
LABEL_90:
  self->_usedProxyType = *((_DWORD *)a3 + 99);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x2000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_92;
  }
LABEL_91:
  self->_fallbackEligible = *((_BYTE *)a3 + 401);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v6 & 0x40) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_93;
  }
LABEL_92:
  self->_weakFallback = *((_BYTE *)a3 + 422);
  *((_BYTE *)&self->_has + 8) |= 0x40u;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x800000000000000) == 0)
      goto LABEL_11;
    goto LABEL_94;
  }
LABEL_93:
  self->_usedFallback = *((_BYTE *)a3 + 421);
  *((_BYTE *)&self->_has + 8) |= 0x20u;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x800000000000000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_95;
  }
LABEL_94:
  self->_resolutionRequired = *((_BYTE *)a3 + 411);
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x8000000000000000) == 0)
      goto LABEL_13;
    goto LABEL_96;
  }
LABEL_95:
  self->_tlsConfigured = *((_BYTE *)a3 + 417);
  *((_BYTE *)&self->_has + 8) |= 2u;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x8000000000000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100000000000000) == 0)
      goto LABEL_14;
    goto LABEL_97;
  }
LABEL_96:
  self->_tfoConfigured = *((_BYTE *)a3 + 415);
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x100000000000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_15;
    goto LABEL_98;
  }
LABEL_97:
  self->_multipathConfigured = *((_BYTE *)a3 + 408);
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_16;
    goto LABEL_99;
  }
LABEL_98:
  self->_trafficClass = *((_QWORD *)a3 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_17;
    goto LABEL_100;
  }
LABEL_99:
  self->_failureReason = *((_DWORD *)a3 + 90);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_18;
    goto LABEL_101;
  }
LABEL_100:
  self->_pathTriggerMilliseconds = *((_QWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_102;
  }
LABEL_101:
  self->_resolutionMilliseconds = *((_QWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_103;
  }
LABEL_102:
  self->_proxyMilliseconds = *((_QWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x400) == 0)
  {
LABEL_20:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_21;
    goto LABEL_104;
  }
LABEL_103:
  self->_flowConnectMilliseconds = *((_QWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_105;
  }
LABEL_104:
  self->_tlsMilliseconds = *((_QWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x800) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_106;
  }
LABEL_105:
  self->_flowDurationMilliseconds = *((_QWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_107;
  }
LABEL_106:
  self->_ipv4AddressCount = *((_QWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_25;
    goto LABEL_108;
  }
LABEL_107:
  self->_ipv6AddressCount = *((_QWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x80000000000) == 0)
      goto LABEL_26;
    goto LABEL_109;
  }
LABEL_108:
  self->_synthesizedIPv6Address = *((_BYTE *)a3 + 413);
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_27;
    goto LABEL_110;
  }
LABEL_109:
  self->_firstAddressFamily = *((_DWORD *)a3 + 91);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_111;
  }
LABEL_110:
  self->_connectedAddressFamily = *((_DWORD *)a3 + 78);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x40) == 0)
  {
LABEL_28:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_29;
    goto LABEL_112;
  }
LABEL_111:
  self->_connectedAddressIndex = *((_QWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_113;
  }
LABEL_112:
  self->_connectedInterfaceType = *((_DWORD *)a3 + 79);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x80) == 0)
  {
LABEL_30:
    if ((v5 & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_114;
  }
LABEL_113:
  self->_connectionReuseCount = *((_QWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x200) == 0)
  {
LABEL_31:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_32;
    goto LABEL_115;
  }
LABEL_114:
  self->_dataStallCount = *((_QWORD *)a3 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_33;
    goto LABEL_116;
  }
LABEL_115:
  self->_connectionMode = *((_DWORD *)a3 + 80);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_34;
    goto LABEL_117;
  }
LABEL_116:
  self->_appleHost = *((_DWORD *)a3 + 75);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_118;
  }
LABEL_117:
  self->_appleApp = *((_DWORD *)a3 + 74);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x100000000000) == 0)
      goto LABEL_36;
    goto LABEL_119;
  }
LABEL_118:
  self->_tlsVersion = *((_DWORD *)a3 + 97);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x8000000000000) == 0)
      goto LABEL_37;
    goto LABEL_120;
  }
LABEL_119:
  self->_stackLevel = *((_DWORD *)a3 + 96);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x8000000000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x10000000000000) == 0)
      goto LABEL_38;
    goto LABEL_121;
  }
LABEL_120:
  self->_ipv4Available = *((_BYTE *)a3 + 403);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_122;
  }
LABEL_121:
  self->_ipv6Available = *((_BYTE *)a3 + 404);
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x2000) == 0)
  {
LABEL_39:
    if ((v5 & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_123;
  }
LABEL_122:
  self->_ipv4DNSServerCount = *((_QWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x8000) == 0)
  {
LABEL_40:
    if ((v6 & 8) == 0)
      goto LABEL_41;
    goto LABEL_124;
  }
LABEL_123:
  self->_ipv6DNSServerCount = *((_QWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v6 & 8) == 0)
  {
LABEL_41:
    if ((v5 & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_125;
  }
LABEL_124:
  self->_tlsVersionTimeout = *((_BYTE *)a3 + 419);
  *((_BYTE *)&self->_has + 8) |= 8u;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((v5 & 4) == 0)
      goto LABEL_43;
    goto LABEL_126;
  }
LABEL_125:
  self->_synthesizedExtraIPv6Address = *((_BYTE *)a3 + 412);
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 4) == 0)
  {
LABEL_43:
    if ((v5 & 8) == 0)
      goto LABEL_44;
    goto LABEL_127;
  }
LABEL_126:
  self->_bytesIn = *((_QWORD *)a3 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 8) == 0)
  {
LABEL_44:
    if ((v5 & 2) == 0)
      goto LABEL_45;
    goto LABEL_128;
  }
LABEL_127:
  self->_bytesOut = *((_QWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 2) == 0)
  {
LABEL_45:
    if ((v5 & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_129;
  }
LABEL_128:
  self->_bytesDuplicate = *((_QWORD *)a3 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x10) == 0)
  {
LABEL_46:
    if ((v5 & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_130;
  }
LABEL_129:
  self->_bytesOutOfOrder = *((_QWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x20) == 0)
  {
LABEL_47:
    if ((v5 & 0x800000) == 0)
      goto LABEL_48;
    goto LABEL_131;
  }
LABEL_130:
  self->_bytesRetransmitted = *((_QWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x800000) == 0)
  {
LABEL_48:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_49;
    goto LABEL_132;
  }
LABEL_131:
  self->_packetsIn = *((_QWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_49:
    if ((v5 & 0x100) == 0)
      goto LABEL_50;
    goto LABEL_133;
  }
LABEL_132:
  self->_packetsOut = *((_QWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x100) == 0)
  {
LABEL_50:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_51;
    goto LABEL_134;
  }
LABEL_133:
  self->_currentRTT = *((_QWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_51:
    if ((v5 & 1) == 0)
      goto LABEL_52;
    goto LABEL_135;
  }
LABEL_134:
  self->_smoothedRTT = *((_QWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 1) == 0)
  {
LABEL_52:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_53;
    goto LABEL_136;
  }
LABEL_135:
  self->_bestRTT = *((_QWORD *)a3 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_53:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_54;
    goto LABEL_137;
  }
LABEL_136:
  self->_rTTvariance = *((_QWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  v6 = *((_BYTE *)a3 + 432);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_54:
    if ((v6 & 1) == 0)
      goto LABEL_55;
    goto LABEL_138;
  }
LABEL_137:
  self->_synRetransmissionCount = *((_QWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((*((_BYTE *)a3 + 432) & 1) == 0)
  {
LABEL_55:
    if ((v5 & 0x400000) == 0)
      goto LABEL_56;
    goto LABEL_139;
  }
LABEL_138:
  self->_tfoUsed = *((_BYTE *)a3 + 416);
  *((_BYTE *)&self->_has + 8) |= 1u;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x400000) == 0)
  {
LABEL_56:
    if ((v5 & 0x4000000000000) == 0)
      goto LABEL_57;
    goto LABEL_140;
  }
LABEL_139:
  self->_multipathServiceType = *((_QWORD *)a3 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v5 & 0x10000) == 0)
      goto LABEL_58;
    goto LABEL_141;
  }
LABEL_140:
  self->_firstParty = *((_BYTE *)a3 + 402);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x10000) == 0)
  {
LABEL_58:
    if ((v5 & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_142;
  }
LABEL_141:
  self->_multipathBytesInCell = *((_QWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x80000) == 0)
  {
LABEL_59:
    if ((v5 & 0x40000) == 0)
      goto LABEL_60;
    goto LABEL_143;
  }
LABEL_142:
  self->_multipathBytesOutCell = *((_QWORD *)a3 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x40000) == 0)
  {
LABEL_60:
    if ((v5 & 0x200000) == 0)
      goto LABEL_61;
    goto LABEL_144;
  }
LABEL_143:
  self->_multipathBytesInWiFi = *((_QWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x200000) == 0)
  {
LABEL_61:
    if ((v5 & 0x20000) == 0)
      goto LABEL_62;
    goto LABEL_145;
  }
LABEL_144:
  self->_multipathBytesOutWiFi = *((_QWORD *)a3 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x20000) == 0)
  {
LABEL_62:
    if ((v5 & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_146;
  }
LABEL_145:
  self->_multipathBytesInInitial = *((_QWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x100000) == 0)
  {
LABEL_63:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_64;
    goto LABEL_147;
  }
LABEL_146:
  self->_multipathBytesOutInitial = *((_QWORD *)a3 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *((_QWORD *)a3 + 53);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_64:
    if ((v5 & 0x20000000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_147:
  self->_secondsSinceInterfaceChange = *((_QWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  if ((*((_QWORD *)a3 + 53) & 0x20000000000000) != 0)
  {
LABEL_65:
    self->_isDaemon = *((_BYTE *)a3 + 405);
    *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  }
LABEL_66:
  if (*((_QWORD *)a3 + 47))
    -[AWDNWConnectionReport setProcessName:](self, "setProcessName:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 36);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        -[AWDNWConnectionReport addActivities:](self, "addActivities:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  if (*((_QWORD *)a3 + 41))
    -[AWDNWConnectionReport setConnectionUUID:](self, "setConnectionUUID:");
  if ((*((_BYTE *)a3 + 432) & 4) != 0)
  {
    self->_tlsHandshakeTimedOut = *((_BYTE *)a3 + 418);
    *((_BYTE *)&self->_has + 8) |= 4u;
  }
  v12 = *((_QWORD *)a3 + 53);
  if ((v12 & 0x80000000000000) != 0)
  {
    self->_isPathExpensive = *((_BYTE *)a3 + 407);
    *(_QWORD *)&self->_has |= 0x80000000000000uLL;
    v12 = *((_QWORD *)a3 + 53);
    if ((v12 & 0x40000000000000) == 0)
    {
LABEL_81:
      if ((v12 & 0x400000000000000) == 0)
        goto LABEL_82;
      goto LABEL_151;
    }
  }
  else if ((v12 & 0x40000000000000) == 0)
  {
    goto LABEL_81;
  }
  self->_isPathConstrained = *((_BYTE *)a3 + 406);
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v12 = *((_QWORD *)a3 + 53);
  if ((v12 & 0x400000000000000) == 0)
  {
LABEL_82:
    if ((v12 & 0x200000000000000) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_151:
  self->_prohibitsExpensive = *((_BYTE *)a3 + 410);
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  if ((*((_QWORD *)a3 + 53) & 0x200000000000000) != 0)
  {
LABEL_83:
    self->_prohibitsConstrained = *((_BYTE *)a3 + 409);
    *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  }
LABEL_84:
  l2Report = self->_l2Report;
  v14 = *((_QWORD *)a3 + 46);
  if (l2Report)
  {
    if (v14)
      -[AWDNWL2Report mergeFrom:](l2Report, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDNWConnectionReport setL2Report:](self, "setL2Report:");
  }
  deviceReport = self->_deviceReport;
  v16 = *((_QWORD *)a3 + 42);
  if (deviceReport)
  {
    if (v16)
      -[AWDNWDeviceReport mergeFrom:](deviceReport, "mergeFrom:");
  }
  else if (v16)
  {
    -[AWDNWConnectionReport setDeviceReport:](self, "setDeviceReport:");
  }
  v17 = (uint64_t *)((char *)a3 + 424);
  v18 = *((_QWORD *)a3 + 53);
  if ((v18 & 0x400000000000) != 0)
  {
    self->_transportProtocol = *((_DWORD *)a3 + 98);
    *(_QWORD *)&self->_has |= 0x400000000000uLL;
    v18 = *v17;
    if ((*v17 & 0x10000000000) == 0)
    {
LABEL_162:
      if ((v18 & 0x20000000000) == 0)
        goto LABEL_164;
      goto LABEL_163;
    }
  }
  else if ((v18 & 0x10000000000) == 0)
  {
    goto LABEL_162;
  }
  self->_dnsProtocol = *((_DWORD *)a3 + 86);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  if ((*((_QWORD *)a3 + 53) & 0x20000000000) != 0)
  {
LABEL_163:
    self->_dnsProvider = *((_DWORD *)a3 + 87);
    *(_QWORD *)&self->_has |= 0x20000000000uLL;
  }
LABEL_164:
  if (*((_QWORD *)a3 + 38))
    -[AWDNWConnectionReport setBundleID:](self, "setBundleID:");
  if (*((_QWORD *)a3 + 44))
    -[AWDNWConnectionReport setEffectiveBundleID:](self, "setEffectiveBundleID:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)triggeredPath
{
  return self->_triggeredPath;
}

- (BOOL)systemProxyConfigured
{
  return self->_systemProxyConfigured;
}

- (BOOL)customProxyConfigured
{
  return self->_customProxyConfigured;
}

- (BOOL)fallbackEligible
{
  return self->_fallbackEligible;
}

- (BOOL)weakFallback
{
  return self->_weakFallback;
}

- (BOOL)usedFallback
{
  return self->_usedFallback;
}

- (BOOL)resolutionRequired
{
  return self->_resolutionRequired;
}

- (BOOL)tlsConfigured
{
  return self->_tlsConfigured;
}

- (BOOL)tfoConfigured
{
  return self->_tfoConfigured;
}

- (BOOL)multipathConfigured
{
  return self->_multipathConfigured;
}

- (unint64_t)trafficClass
{
  return self->_trafficClass;
}

- (unint64_t)pathTriggerMilliseconds
{
  return self->_pathTriggerMilliseconds;
}

- (unint64_t)resolutionMilliseconds
{
  return self->_resolutionMilliseconds;
}

- (unint64_t)proxyMilliseconds
{
  return self->_proxyMilliseconds;
}

- (unint64_t)flowConnectMilliseconds
{
  return self->_flowConnectMilliseconds;
}

- (unint64_t)tlsMilliseconds
{
  return self->_tlsMilliseconds;
}

- (unint64_t)flowDurationMilliseconds
{
  return self->_flowDurationMilliseconds;
}

- (unint64_t)ipv4AddressCount
{
  return self->_ipv4AddressCount;
}

- (unint64_t)ipv6AddressCount
{
  return self->_ipv6AddressCount;
}

- (BOOL)synthesizedIPv6Address
{
  return self->_synthesizedIPv6Address;
}

- (unint64_t)connectedAddressIndex
{
  return self->_connectedAddressIndex;
}

- (unint64_t)connectionReuseCount
{
  return self->_connectionReuseCount;
}

- (unint64_t)dataStallCount
{
  return self->_dataStallCount;
}

- (BOOL)ipv4Available
{
  return self->_ipv4Available;
}

- (BOOL)ipv6Available
{
  return self->_ipv6Available;
}

- (unint64_t)ipv4DNSServerCount
{
  return self->_ipv4DNSServerCount;
}

- (unint64_t)ipv6DNSServerCount
{
  return self->_ipv6DNSServerCount;
}

- (BOOL)tlsVersionTimeout
{
  return self->_tlsVersionTimeout;
}

- (BOOL)synthesizedExtraIPv6Address
{
  return self->_synthesizedExtraIPv6Address;
}

- (unint64_t)bytesIn
{
  return self->_bytesIn;
}

- (unint64_t)bytesOut
{
  return self->_bytesOut;
}

- (unint64_t)bytesDuplicate
{
  return self->_bytesDuplicate;
}

- (unint64_t)bytesOutOfOrder
{
  return self->_bytesOutOfOrder;
}

- (unint64_t)bytesRetransmitted
{
  return self->_bytesRetransmitted;
}

- (unint64_t)packetsIn
{
  return self->_packetsIn;
}

- (unint64_t)packetsOut
{
  return self->_packetsOut;
}

- (unint64_t)currentRTT
{
  return self->_currentRTT;
}

- (unint64_t)smoothedRTT
{
  return self->_smoothedRTT;
}

- (unint64_t)bestRTT
{
  return self->_bestRTT;
}

- (unint64_t)rTTvariance
{
  return self->_rTTvariance;
}

- (unint64_t)synRetransmissionCount
{
  return self->_synRetransmissionCount;
}

- (BOOL)tfoUsed
{
  return self->_tfoUsed;
}

- (unint64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (BOOL)firstParty
{
  return self->_firstParty;
}

- (unint64_t)multipathBytesInCell
{
  return self->_multipathBytesInCell;
}

- (unint64_t)multipathBytesOutCell
{
  return self->_multipathBytesOutCell;
}

- (unint64_t)multipathBytesInWiFi
{
  return self->_multipathBytesInWiFi;
}

- (unint64_t)multipathBytesOutWiFi
{
  return self->_multipathBytesOutWiFi;
}

- (unint64_t)multipathBytesInInitial
{
  return self->_multipathBytesInInitial;
}

- (unint64_t)multipathBytesOutInitial
{
  return self->_multipathBytesOutInitial;
}

- (unint64_t)secondsSinceInterfaceChange
{
  return self->_secondsSinceInterfaceChange;
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (BOOL)tlsHandshakeTimedOut
{
  return self->_tlsHandshakeTimedOut;
}

- (BOOL)isPathExpensive
{
  return self->_isPathExpensive;
}

- (BOOL)isPathConstrained
{
  return self->_isPathConstrained;
}

- (BOOL)prohibitsExpensive
{
  return self->_prohibitsExpensive;
}

- (BOOL)prohibitsConstrained
{
  return self->_prohibitsConstrained;
}

- (AWDNWL2Report)l2Report
{
  return self->_l2Report;
}

- (void)setL2Report:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (AWDNWDeviceReport)deviceReport
{
  return self->_deviceReport;
}

- (void)setDeviceReport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (NSString)effectiveBundleID
{
  return self->_effectiveBundleID;
}

- (void)setEffectiveBundleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

@end
