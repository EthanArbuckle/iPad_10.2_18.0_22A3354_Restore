@implementation WiFiAnalyticsAWDWASymptomsDnsStats

- (void)setTotalDnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalDnsServers = a3;
}

- (void)setHasTotalDnsServers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalDnsServers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNumIpv4DnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numIpv4DnsServers = a3;
}

- (void)setHasNumIpv4DnsServers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumIpv4DnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNumIpv6DnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numIpv6DnsServers = a3;
}

- (void)setHasNumIpv6DnsServers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNumIpv6DnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setNumLocalDnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numLocalDnsServers = a3;
}

- (void)setHasNumLocalDnsServers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumLocalDnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNumRemoteDnsServers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numRemoteDnsServers = a3;
}

- (void)setHasNumRemoteDnsServers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumRemoteDnsServers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)configType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_configType;
  else
    return 0;
}

- (void)setConfigType:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_configType = a3;
}

- (void)setHasConfigType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConfigType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)configTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CDDD7D8 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConfigType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDnsServerConfigTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kDnsServerConfigTypeAutomatic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kDnsServerConfigTypeManual")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNetscoreAtStudyStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_netscoreAtStudyStart = a3;
}

- (void)setHasNetscoreAtStudyStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNetscoreAtStudyStart
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setStallscoreAtStudyStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_stallscoreAtStudyStart = a3;
}

- (void)setHasStallscoreAtStudyStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasStallscoreAtStudyStart
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setImpactedServersAtStudyStart:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_impactedServersAtStudyStart = a3;
}

- (void)setHasImpactedServersAtStudyStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasImpactedServersAtStudyStart
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNetscoreHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_netscoreHealthBeforeDecision = a3;
}

- (void)setHasNetscoreHealthBeforeDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNetscoreHealthBeforeDecision
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setStallscoreHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_stallscoreHealthBeforeDecision = a3;
}

- (void)setHasStallscoreHealthBeforeDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasStallscoreHealthBeforeDecision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLanHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lanHealthBeforeDecision = a3;
}

- (void)setHasLanHealthBeforeDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLanHealthBeforeDecision
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setWanHealthBeforeDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_wanHealthBeforeDecision = a3;
}

- (void)setHasWanHealthBeforeDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasWanHealthBeforeDecision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsCaptiveServerIPResolved:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isCaptiveServerIPResolved = a3;
}

- (void)setHasIsCaptiveServerIPResolved:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsCaptiveServerIPResolved
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSymptomsDnsscreenStateOn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_symptomsDnsscreenStateOn = a3;
}

- (void)setHasSymptomsDnsscreenStateOn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasSymptomsDnsscreenStateOn
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (int)symptomsDnsRecommendation
{
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    return self->_symptomsDnsRecommendation;
  else
    return 0;
}

- (void)setSymptomsDnsRecommendation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_symptomsDnsRecommendation = a3;
}

- (void)setHasSymptomsDnsRecommendation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSymptomsDnsRecommendation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)symptomsDnsRecommendationAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CDDD7F0 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSymptomsDnsRecommendation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsRecoveryTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsRecoveryTypeReset")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsRecoveryTypeReassoc")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)suppressedReason
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_suppressedReason;
  else
    return 0;
}

- (void)setSuppressedReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_suppressedReason = a3;
}

- (void)setHasSuppressedReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSuppressedReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)suppressedReasonAsString:(int)a3
{
  if (a3 < 0xB)
    return *(&off_24CDDD808 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuppressedReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsNotSuppressed")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsBudgetThresholdReached")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsSymptomsConditionsRecovered")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsPeerDiagnosticsStudy")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsAWDLActivitySuspected")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsCriticalAppInUse")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsWiFiDisassociatedDuringStudy")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsAverageCcaAboveThreshold")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsWiFiInterfaceNotPrimary")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsWiFiNetworkIsCaptive")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("kSymptomsDnsServerConfigurationInvalid")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNetscoreAtStudyEnd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_netscoreAtStudyEnd = a3;
}

- (void)setHasNetscoreAtStudyEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNetscoreAtStudyEnd
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setStallscoreAtStudyEnd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_stallscoreAtStudyEnd = a3;
}

- (void)setHasStallscoreAtStudyEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasStallscoreAtStudyEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setImpactedServersAtStudyEnd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_impactedServersAtStudyEnd = a3;
}

- (void)setHasImpactedServersAtStudyEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasImpactedServersAtStudyEnd
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNetscoreHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_netscoreHealthAfterDecision = a3;
}

- (void)setHasNetscoreHealthAfterDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNetscoreHealthAfterDecision
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setStallscoreHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_stallscoreHealthAfterDecision = a3;
}

- (void)setHasStallscoreHealthAfterDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasStallscoreHealthAfterDecision
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setLanHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_lanHealthAfterDecision = a3;
}

- (void)setHasLanHealthAfterDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLanHealthAfterDecision
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setWanHealthAfterDecision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_wanHealthAfterDecision = a3;
}

- (void)setHasWanHealthAfterDecision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasWanHealthAfterDecision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSymptomsDnsTimeSincePreviousTriggerMinutes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_symptomsDnsTimeSincePreviousTriggerMinutes = a3;
}

- (void)setHasSymptomsDnsTimeSincePreviousTriggerMinutes:(BOOL)a3
{
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasSymptomsDnsTimeSincePreviousTriggerMinutes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDpsNotificationReceivedDuringStudy:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_dpsNotificationReceivedDuringStudy = a3;
}

- (void)setHasDpsNotificationReceivedDuringStudy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasDpsNotificationReceivedDuringStudy
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSlowWiFiNotificationReceivedDuringStudy:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_slowWiFiNotificationReceivedDuringStudy = a3;
}

- (void)setHasSlowWiFiNotificationReceivedDuringStudy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasSlowWiFiNotificationReceivedDuringStudy
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsPingEnqueueFailing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isPingEnqueueFailing = a3;
}

- (void)setHasIsPingEnqueueFailing:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($F3D7C730B717C29F2620BA54A0CAA3FF)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsPingEnqueueFailing
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWASymptomsDnsStats;
  -[WiFiAnalyticsAWDWASymptomsDnsStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAnalyticsAWDWASymptomsDnsStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $F3D7C730B717C29F2620BA54A0CAA3FF has;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t configType;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t symptomsDnsRecommendation;
  void *v25;
  uint64_t suppressedReason;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalDnsServers);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("totalDnsServers"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numIpv4DnsServers);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("numIpv4DnsServers"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numIpv6DnsServers);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numIpv6DnsServers"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numLocalDnsServers);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("numLocalDnsServers"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numRemoteDnsServers);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("numRemoteDnsServers"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_36:
  configType = self->_configType;
  if (configType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_configType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = *(&off_24CDDD7D8 + configType);
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("configType"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_netscoreAtStudyStart);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("netscoreAtStudyStart"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stallscoreAtStudyStart);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("stallscoreAtStudyStart"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_impactedServersAtStudyStart);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("impactedServersAtStudyStart"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_netscoreHealthBeforeDecision);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("netscoreHealthBeforeDecision"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stallscoreHealthBeforeDecision);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("stallscoreHealthBeforeDecision"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lanHealthBeforeDecision);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("lanHealthBeforeDecision"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wanHealthBeforeDecision);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("wanHealthBeforeDecision"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCaptiveServerIPResolved);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("isCaptiveServerIPResolved"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_symptomsDnsscreenStateOn);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("symptomsDnsscreenStateOn"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_49:
  symptomsDnsRecommendation = self->_symptomsDnsRecommendation;
  if (symptomsDnsRecommendation >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_symptomsDnsRecommendation);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = *(&off_24CDDD7F0 + symptomsDnsRecommendation);
  }
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("symptomsDnsRecommendation"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_53:
  suppressedReason = self->_suppressedReason;
  if (suppressedReason >= 0xB)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suppressedReason);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = *(&off_24CDDD808 + suppressedReason);
  }
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("suppressedReason"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_netscoreAtStudyEnd);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("netscoreAtStudyEnd"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stallscoreAtStudyEnd);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("stallscoreAtStudyEnd"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_impactedServersAtStudyEnd);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("impactedServersAtStudyEnd"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_netscoreHealthAfterDecision);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("netscoreHealthAfterDecision"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_stallscoreHealthAfterDecision);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("stallscoreHealthAfterDecision"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lanHealthAfterDecision);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("lanHealthAfterDecision"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_wanHealthAfterDecision);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("wanHealthAfterDecision"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_symptomsDnsTimeSincePreviousTriggerMinutes);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("symptomsDnsTimeSincePreviousTriggerMinutes"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_28;
LABEL_66:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_slowWiFiNotificationReceivedDuringStudy);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("slowWiFiNotificationReceivedDuringStudy"));

    if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dpsNotificationReceivedDuringStudy);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("dpsNotificationReceivedDuringStudy"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
    goto LABEL_66;
LABEL_28:
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPingEnqueueFailing);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isPingEnqueueFailing"));

  }
LABEL_30:
  v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWASymptomsDnsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $F3D7C730B717C29F2620BA54A0CAA3FF has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_28;
LABEL_57:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
    goto LABEL_57;
LABEL_28:
  if ((*(_DWORD *)&has & 0x2000000) != 0)
LABEL_29:
    PBDataWriterWriteBOOLField();
LABEL_30:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $F3D7C730B717C29F2620BA54A0CAA3FF has;

  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v4[23] = self->_totalDnsServers;
    v4[28] |= 0x100000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_numIpv4DnsServers;
  v4[28] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  v4[14] = self->_numIpv6DnsServers;
  v4[28] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  v4[15] = self->_numLocalDnsServers;
  v4[28] |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  v4[16] = self->_numRemoteDnsServers;
  v4[28] |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  v4[4] = self->_configType;
  v4[28] |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  v4[10] = self->_netscoreAtStudyStart;
  v4[28] |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  v4[18] = self->_stallscoreAtStudyStart;
  v4[28] |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  v4[6] = self->_impactedServersAtStudyStart;
  v4[28] |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  v4[12] = self->_netscoreHealthBeforeDecision;
  v4[28] |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  v4[20] = self->_stallscoreHealthBeforeDecision;
  v4[28] |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  v4[8] = self->_lanHealthBeforeDecision;
  v4[28] |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  v4[25] = self->_wanHealthBeforeDecision;
  v4[28] |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  *((_BYTE *)v4 + 105) = self->_isCaptiveServerIPResolved;
  v4[28] |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  *((_BYTE *)v4 + 108) = self->_symptomsDnsscreenStateOn;
  v4[28] |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  v4[22] = self->_symptomsDnsRecommendation;
  v4[28] |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  v4[21] = self->_suppressedReason;
  v4[28] |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  v4[9] = self->_netscoreAtStudyEnd;
  v4[28] |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  v4[17] = self->_stallscoreAtStudyEnd;
  v4[28] |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  v4[5] = self->_impactedServersAtStudyEnd;
  v4[28] |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  v4[11] = self->_netscoreHealthAfterDecision;
  v4[28] |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  v4[19] = self->_stallscoreHealthAfterDecision;
  v4[28] |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  v4[7] = self->_lanHealthAfterDecision;
  v4[28] |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  v4[24] = self->_wanHealthAfterDecision;
  v4[28] |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)v4 + 1) = self->_symptomsDnsTimeSincePreviousTriggerMinutes;
  v4[28] |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_28;
LABEL_57:
    *((_BYTE *)v4 + 107) = self->_slowWiFiNotificationReceivedDuringStudy;
    v4[28] |= 0x4000000u;
    if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_56:
  *((_BYTE *)v4 + 104) = self->_dpsNotificationReceivedDuringStudy;
  v4[28] |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
    goto LABEL_57;
LABEL_28:
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_29:
    *((_BYTE *)v4 + 106) = self->_isPingEnqueueFailing;
    v4[28] |= 0x2000000u;
  }
LABEL_30:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $F3D7C730B717C29F2620BA54A0CAA3FF has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *((_DWORD *)result + 23) = self->_totalDnsServers;
    *((_DWORD *)result + 28) |= 0x100000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 13) = self->_numIpv4DnsServers;
  *((_DWORD *)result + 28) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 14) = self->_numIpv6DnsServers;
  *((_DWORD *)result + 28) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 15) = self->_numLocalDnsServers;
  *((_DWORD *)result + 28) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 16) = self->_numRemoteDnsServers;
  *((_DWORD *)result + 28) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 4) = self->_configType;
  *((_DWORD *)result + 28) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 10) = self->_netscoreAtStudyStart;
  *((_DWORD *)result + 28) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 18) = self->_stallscoreAtStudyStart;
  *((_DWORD *)result + 28) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 6) = self->_impactedServersAtStudyStart;
  *((_DWORD *)result + 28) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 12) = self->_netscoreHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 20) = self->_stallscoreHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 8) = self->_lanHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 25) = self->_wanHealthBeforeDecision;
  *((_DWORD *)result + 28) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  *((_BYTE *)result + 105) = self->_isCaptiveServerIPResolved;
  *((_DWORD *)result + 28) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  *((_BYTE *)result + 108) = self->_symptomsDnsscreenStateOn;
  *((_DWORD *)result + 28) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 22) = self->_symptomsDnsRecommendation;
  *((_DWORD *)result + 28) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 21) = self->_suppressedReason;
  *((_DWORD *)result + 28) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 9) = self->_netscoreAtStudyEnd;
  *((_DWORD *)result + 28) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 17) = self->_stallscoreAtStudyEnd;
  *((_DWORD *)result + 28) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 5) = self->_impactedServersAtStudyEnd;
  *((_DWORD *)result + 28) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 11) = self->_netscoreHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 19) = self->_stallscoreHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 7) = self->_lanHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 24) = self->_wanHealthAfterDecision;
  *((_DWORD *)result + 28) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)result + 1) = self->_symptomsDnsTimeSincePreviousTriggerMinutes;
  *((_DWORD *)result + 28) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)result + 104) = self->_dpsNotificationReceivedDuringStudy;
  *((_DWORD *)result + 28) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      return result;
    goto LABEL_29;
  }
LABEL_57:
  *((_BYTE *)result + 107) = self->_slowWiFiNotificationReceivedDuringStudy;
  *((_DWORD *)result + 28) |= 0x4000000u;
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
    return result;
LABEL_29:
  *((_BYTE *)result + 106) = self->_isPingEnqueueFailing;
  *((_DWORD *)result + 28) |= 0x2000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $F3D7C730B717C29F2620BA54A0CAA3FF has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_152;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 28);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_totalDnsServers != *((_DWORD *)v4 + 23))
      goto LABEL_152;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_numIpv4DnsServers != *((_DWORD *)v4 + 13))
      goto LABEL_152;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_numIpv6DnsServers != *((_DWORD *)v4 + 14))
      goto LABEL_152;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_numLocalDnsServers != *((_DWORD *)v4 + 15))
      goto LABEL_152;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_numRemoteDnsServers != *((_DWORD *)v4 + 16))
      goto LABEL_152;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_configType != *((_DWORD *)v4 + 4))
      goto LABEL_152;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_netscoreAtStudyStart != *((_DWORD *)v4 + 10))
      goto LABEL_152;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_stallscoreAtStudyStart != *((_DWORD *)v4 + 18))
      goto LABEL_152;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_impactedServersAtStudyStart != *((_DWORD *)v4 + 6))
      goto LABEL_152;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_netscoreHealthBeforeDecision != *((_DWORD *)v4 + 12))
      goto LABEL_152;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_stallscoreHealthBeforeDecision != *((_DWORD *)v4 + 20))
      goto LABEL_152;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lanHealthBeforeDecision != *((_DWORD *)v4 + 8))
      goto LABEL_152;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_wanHealthBeforeDecision != *((_DWORD *)v4 + 25))
      goto LABEL_152;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0)
      goto LABEL_152;
    if (self->_isCaptiveServerIPResolved)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_152;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0)
      goto LABEL_152;
    if (self->_symptomsDnsscreenStateOn)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_152;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_symptomsDnsRecommendation != *((_DWORD *)v4 + 22))
      goto LABEL_152;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_suppressedReason != *((_DWORD *)v4 + 21))
      goto LABEL_152;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_netscoreAtStudyEnd != *((_DWORD *)v4 + 9))
      goto LABEL_152;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_stallscoreAtStudyEnd != *((_DWORD *)v4 + 17))
      goto LABEL_152;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_impactedServersAtStudyEnd != *((_DWORD *)v4 + 5))
      goto LABEL_152;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_netscoreHealthAfterDecision != *((_DWORD *)v4 + 11))
      goto LABEL_152;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_stallscoreHealthAfterDecision != *((_DWORD *)v4 + 19))
      goto LABEL_152;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lanHealthAfterDecision != *((_DWORD *)v4 + 7))
      goto LABEL_152;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_wanHealthAfterDecision != *((_DWORD *)v4 + 24))
      goto LABEL_152;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_symptomsDnsTimeSincePreviousTriggerMinutes != *((_QWORD *)v4 + 1))
      goto LABEL_152;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0)
      goto LABEL_152;
    if (self->_dpsNotificationReceivedDuringStudy)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_152;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0)
      goto LABEL_152;
    if (self->_slowWiFiNotificationReceivedDuringStudy)
    {
      if (!*((_BYTE *)v4 + 107))
        goto LABEL_152;
    }
    else if (*((_BYTE *)v4 + 107))
    {
      goto LABEL_152;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_152;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) != 0)
    {
      if (self->_isPingEnqueueFailing)
      {
        if (!*((_BYTE *)v4 + 106))
          goto LABEL_152;
      }
      else if (*((_BYTE *)v4 + 106))
      {
        goto LABEL_152;
      }
      v7 = 1;
      goto LABEL_153;
    }
LABEL_152:
    v7 = 0;
    goto LABEL_153;
  }
  v7 = (v6 & 0x2000000) == 0;
LABEL_153:

  return v7;
}

- (unint64_t)hash
{
  $F3D7C730B717C29F2620BA54A0CAA3FF has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v31 = 2654435761 * self->_totalDnsServers;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_numIpv4DnsServers;
      if ((*(_WORD *)&has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else
  {
    v31 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_numIpv6DnsServers;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  v4 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_numLocalDnsServers;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  v5 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_numRemoteDnsServers;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  v6 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_configType;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_netscoreAtStudyStart;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  v8 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_9:
    v9 = 2654435761 * self->_stallscoreAtStudyStart;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  v9 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_10:
    v10 = 2654435761 * self->_impactedServersAtStudyStart;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  v10 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v11 = 2654435761 * self->_netscoreHealthBeforeDecision;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_stallscoreHealthBeforeDecision;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  v12 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_13:
    v13 = 2654435761 * self->_lanHealthBeforeDecision;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_14:
    v14 = 2654435761 * self->_wanHealthBeforeDecision;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_15:
    v15 = 2654435761 * self->_isCaptiveServerIPResolved;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_16:
    v16 = 2654435761 * self->_symptomsDnsscreenStateOn;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    v17 = 2654435761 * self->_symptomsDnsRecommendation;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_18:
    v18 = 2654435761 * self->_suppressedReason;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  v18 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_19:
    v19 = 2654435761 * self->_netscoreAtStudyEnd;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  v19 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_20:
    v20 = 2654435761 * self->_stallscoreAtStudyEnd;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  v20 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_21:
    v21 = 2654435761 * self->_impactedServersAtStudyEnd;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  v21 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_22:
    v22 = 2654435761 * self->_netscoreHealthAfterDecision;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_23:
    v23 = 2654435761 * self->_stallscoreHealthAfterDecision;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  v23 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_24:
    v24 = 2654435761 * self->_lanHealthAfterDecision;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_25:
    v25 = 2654435761 * self->_wanHealthAfterDecision;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  v25 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_26:
    v26 = 2654435761u * self->_symptomsDnsTimeSincePreviousTriggerMinutes;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_27;
    goto LABEL_55;
  }
LABEL_54:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_27:
    v27 = 2654435761 * self->_dpsNotificationReceivedDuringStudy;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_28;
LABEL_56:
    v28 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_29;
LABEL_57:
    v29 = 0;
    return v3 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_55:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
    goto LABEL_56;
LABEL_28:
  v28 = 2654435761 * self->_slowWiFiNotificationReceivedDuringStudy;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
    goto LABEL_57;
LABEL_29:
  v29 = 2654435761 * self->_isPingEnqueueFailing;
  return v3 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x100000) != 0)
  {
    self->_totalDnsServers = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_has |= 0x100000u;
    v5 = *((_DWORD *)v4 + 28);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_numIpv4DnsServers = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  self->_numIpv6DnsServers = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x1000) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  self->_numLocalDnsServers = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  self->_numRemoteDnsServers = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  self->_configType = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  self->_netscoreAtStudyStart = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  self->_stallscoreAtStudyStart = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  self->_impactedServersAtStudyStart = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  self->_netscoreHealthBeforeDecision = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x20000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  self->_stallscoreHealthBeforeDecision = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  self->_lanHealthBeforeDecision = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x400000) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  self->_wanHealthBeforeDecision = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  self->_isCaptiveServerIPResolved = *((_BYTE *)v4 + 105);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  self->_symptomsDnsscreenStateOn = *((_BYTE *)v4 + 108);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  self->_symptomsDnsRecommendation = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x40000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  self->_suppressedReason = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  self->_netscoreAtStudyEnd = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x4000) == 0)
  {
LABEL_20:
    if ((v5 & 4) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  self->_stallscoreAtStudyEnd = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_21:
    if ((v5 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  self->_impactedServersAtStudyEnd = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  self->_netscoreHealthAfterDecision = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x10000) == 0)
  {
LABEL_23:
    if ((v5 & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  self->_stallscoreHealthAfterDecision = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_24:
    if ((v5 & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  self->_lanHealthAfterDecision = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x200000) == 0)
  {
LABEL_25:
    if ((v5 & 1) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  self->_wanHealthAfterDecision = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_26:
    if ((v5 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  self->_symptomsDnsTimeSincePreviousTriggerMinutes = *((_QWORD *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x800000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_28;
LABEL_57:
    self->_slowWiFiNotificationReceivedDuringStudy = *((_BYTE *)v4 + 107);
    *(_DWORD *)&self->_has |= 0x4000000u;
    if ((*((_DWORD *)v4 + 28) & 0x2000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_56:
  self->_dpsNotificationReceivedDuringStudy = *((_BYTE *)v4 + 104);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x4000000) != 0)
    goto LABEL_57;
LABEL_28:
  if ((v5 & 0x2000000) != 0)
  {
LABEL_29:
    self->_isPingEnqueueFailing = *((_BYTE *)v4 + 106);
    *(_DWORD *)&self->_has |= 0x2000000u;
  }
LABEL_30:

}

- (unsigned)totalDnsServers
{
  return self->_totalDnsServers;
}

- (unsigned)numIpv4DnsServers
{
  return self->_numIpv4DnsServers;
}

- (unsigned)numIpv6DnsServers
{
  return self->_numIpv6DnsServers;
}

- (unsigned)numLocalDnsServers
{
  return self->_numLocalDnsServers;
}

- (unsigned)numRemoteDnsServers
{
  return self->_numRemoteDnsServers;
}

- (unsigned)netscoreAtStudyStart
{
  return self->_netscoreAtStudyStart;
}

- (unsigned)stallscoreAtStudyStart
{
  return self->_stallscoreAtStudyStart;
}

- (unsigned)impactedServersAtStudyStart
{
  return self->_impactedServersAtStudyStart;
}

- (unsigned)netscoreHealthBeforeDecision
{
  return self->_netscoreHealthBeforeDecision;
}

- (unsigned)stallscoreHealthBeforeDecision
{
  return self->_stallscoreHealthBeforeDecision;
}

- (unsigned)lanHealthBeforeDecision
{
  return self->_lanHealthBeforeDecision;
}

- (unsigned)wanHealthBeforeDecision
{
  return self->_wanHealthBeforeDecision;
}

- (BOOL)isCaptiveServerIPResolved
{
  return self->_isCaptiveServerIPResolved;
}

- (BOOL)symptomsDnsscreenStateOn
{
  return self->_symptomsDnsscreenStateOn;
}

- (unsigned)netscoreAtStudyEnd
{
  return self->_netscoreAtStudyEnd;
}

- (unsigned)stallscoreAtStudyEnd
{
  return self->_stallscoreAtStudyEnd;
}

- (unsigned)impactedServersAtStudyEnd
{
  return self->_impactedServersAtStudyEnd;
}

- (unsigned)netscoreHealthAfterDecision
{
  return self->_netscoreHealthAfterDecision;
}

- (unsigned)stallscoreHealthAfterDecision
{
  return self->_stallscoreHealthAfterDecision;
}

- (unsigned)lanHealthAfterDecision
{
  return self->_lanHealthAfterDecision;
}

- (unsigned)wanHealthAfterDecision
{
  return self->_wanHealthAfterDecision;
}

- (unint64_t)symptomsDnsTimeSincePreviousTriggerMinutes
{
  return self->_symptomsDnsTimeSincePreviousTriggerMinutes;
}

- (BOOL)dpsNotificationReceivedDuringStudy
{
  return self->_dpsNotificationReceivedDuringStudy;
}

- (BOOL)slowWiFiNotificationReceivedDuringStudy
{
  return self->_slowWiFiNotificationReceivedDuringStudy;
}

- (BOOL)isPingEnqueueFailing
{
  return self->_isPingEnqueueFailing;
}

@end
