@implementation SECC2MPNetworkEvent

- (void)setTriggers:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_triggers = a3;
}

- (void)setHasTriggers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTriggers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_reportFrequency = a3;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasReportFrequency
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_reportFrequencyBase = a3;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasReportFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasNetworkTaskDescription
{
  return self->_networkTaskDescription != 0;
}

- (BOOL)hasNetworkHostname
{
  return self->_networkHostname != 0;
}

- (BOOL)hasNetworkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort != 0;
}

- (BOOL)hasNetworkConnectionUuid
{
  return self->_networkConnectionUuid != 0;
}

- (void)setNetworkConnectionReused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_networkConnectionReused = a3;
}

- (void)setHasNetworkConnectionReused:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasNetworkConnectionReused
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasNetworkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier != 0;
}

- (BOOL)hasNetworkProtocolName
{
  return self->_networkProtocolName != 0;
}

- (void)setNetworkRequestHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_networkRequestHeaderSize = a3;
}

- (void)setHasNetworkRequestHeaderSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasNetworkRequestHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_networkRequestBodyBytesSent = a3;
}

- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3
{
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasNetworkRequestBodyBytesSent
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setNetworkResponseHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_networkResponseHeaderSize = a3;
}

- (void)setHasNetworkResponseHeaderSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasNetworkResponseHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_networkResponseBodyBytesReceived = a3;
}

- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNetworkResponseBodyBytesReceived
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNetworkPreviousAttemptCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_networkPreviousAttemptCount = a3;
}

- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNetworkPreviousAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasNetworkFatalError
{
  return self->_networkFatalError != 0;
}

- (void)setNetworkStatusCode:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_networkStatusCode = a3;
}

- (void)setHasNetworkStatusCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNetworkStatusCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasNetworkRequestUri
{
  return self->_networkRequestUri != 0;
}

- (void)setTimestampC2Init:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_timestampC2Init = a3;
}

- (void)setHasTimestampC2Init:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTimestampC2Init
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTimestampC2Start:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_timestampC2Start = a3;
}

- (void)setHasTimestampC2Start:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTimestampC2Start
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTimestampC2Now:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_timestampC2Now = a3;
}

- (void)setHasTimestampC2Now:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTimestampC2Now
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTimestampDnsStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_timestampDnsStart = a3;
}

- (void)setHasTimestampDnsStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTimestampDnsStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTimestampDnsEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_timestampDnsEnd = a3;
}

- (void)setHasTimestampDnsEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTimestampDnsEnd
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTimestampTcpStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timestampTcpStart = a3;
}

- (void)setHasTimestampTcpStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTimestampTcpStart
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTimestampTcpEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_timestampTcpEnd = a3;
}

- (void)setHasTimestampTcpEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTimestampTcpEnd
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTimestampSslStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timestampSslStart = a3;
}

- (void)setHasTimestampSslStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTimestampSslStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTimestampRequestStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_timestampRequestStart = a3;
}

- (void)setHasTimestampRequestStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTimestampRequestStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTimestampRequestEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_timestampRequestEnd = a3;
}

- (void)setHasTimestampRequestEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTimestampRequestEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTimestampResponseStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timestampResponseStart = a3;
}

- (void)setHasTimestampResponseStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTimestampResponseStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTimestampResponseEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_timestampResponseEnd = a3;
}

- (void)setHasTimestampResponseEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTimestampResponseEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasOptionsQualityOfService
{
  return self->_optionsQualityOfService != 0;
}

- (void)setOptionsOutOfProcess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_optionsOutOfProcess = a3;
}

- (void)setHasOptionsOutOfProcess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_optionsOutOfProcessForceDiscretionary = a3;
}

- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcessForceDiscretionary
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setOptionsAllowExpensiveAccess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_optionsAllowExpensiveAccess = a3;
}

- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasOptionsAllowExpensiveAccess
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_optionsAllowPowerNapScheduling = a3;
}

- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasOptionsAllowPowerNapScheduling
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_optionsTimeoutIntervalForRequest = a3;
}

- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_optionsTimeoutIntervalForResource = a3;
}

- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForResource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasOptionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier != 0;
}

- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier != 0;
}

- (void)setOptionsAppleIdContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_optionsAppleIdContext = a3;
}

- (void)setHasOptionsAppleIdContext:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasOptionsAppleIdContext
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setOptionsTlsPinningRequired:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_optionsTlsPinningRequired = a3;
}

- (void)setHasOptionsTlsPinningRequired:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasOptionsTlsPinningRequired
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPNetworkEvent;
  v3 = -[SECC2MPNetworkEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPNetworkEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $AF884E7ED10AB980613DA027D2B84F87 has;
  void *v5;
  NSString *networkTaskDescription;
  NSString *networkHostname;
  NSString *networkRemoteAddresssAndPort;
  NSString *networkConnectionUuid;
  void *v10;
  NSString *networkInterfaceIdentifier;
  NSString *networkProtocolName;
  $AF884E7ED10AB980613DA027D2B84F87 v13;
  void *v14;
  SECC2MPError *networkFatalError;
  void *v16;
  void *v17;
  NSString *networkRequestUri;
  $AF884E7ED10AB980613DA027D2B84F87 v19;
  void *v20;
  NSString *optionsQualityOfService;
  $AF884E7ED10AB980613DA027D2B84F87 v22;
  void *v23;
  NSString *optionsSourceApplicationBundleIdentifier;
  NSString *optionsSourceApplicationSecondaryIdentifier;
  $AF884E7ED10AB980613DA027D2B84F87 v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_triggers));
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("triggers"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportFrequency));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("report_frequency"));

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_reportFrequencyBase));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("report_frequency_base"));

  }
LABEL_5:
  networkTaskDescription = self->_networkTaskDescription;
  if (networkTaskDescription)
    objc_msgSend(v3, "setObject:forKey:", networkTaskDescription, CFSTR("network_task_description"));
  networkHostname = self->_networkHostname;
  if (networkHostname)
    objc_msgSend(v3, "setObject:forKey:", networkHostname, CFSTR("network_hostname"));
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if (networkRemoteAddresssAndPort)
    objc_msgSend(v3, "setObject:forKey:", networkRemoteAddresssAndPort, CFSTR("network_remote_addresss_and_port"));
  networkConnectionUuid = self->_networkConnectionUuid;
  if (networkConnectionUuid)
    objc_msgSend(v3, "setObject:forKey:", networkConnectionUuid, CFSTR("network_connection_uuid"));
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_networkConnectionReused));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("network_connection_reused"));

  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if (networkInterfaceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", networkInterfaceIdentifier, CFSTR("network_interface_identifier"));
  networkProtocolName = self->_networkProtocolName;
  if (networkProtocolName)
    objc_msgSend(v3, "setObject:forKey:", networkProtocolName, CFSTR("network_protocol_name"));
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_networkRequestHeaderSize));
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("network_request_header_size"));

    v13 = self->_has;
    if ((*(_BYTE *)&v13 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v13 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_67;
    }
  }
  else if ((*(_BYTE *)&v13 & 1) == 0)
  {
    goto LABEL_21;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_networkRequestBodyBytesSent));
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("network_request_body_bytes_sent"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v13 & 2) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_networkResponseHeaderSize));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("network_response_header_size"));

  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_68:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_networkResponseBodyBytesReceived));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("network_response_body_bytes_received"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_networkPreviousAttemptCount));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("network_previous_attempt_count"));

  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  if (networkFatalError)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPError dictionaryRepresentation](networkFatalError, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("network_fatal_error"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_networkStatusCode));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("network_status_code"));

  }
  networkRequestUri = self->_networkRequestUri;
  if (networkRequestUri)
    objc_msgSend(v3, "setObject:forKey:", networkRequestUri, CFSTR("network_request_uri"));
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x20) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampC2Init));
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("timestamp_c2_init"));

    v19 = self->_has;
    if ((*(_BYTE *)&v19 & 0x80) == 0)
    {
LABEL_33:
      if ((*(_BYTE *)&v19 & 0x40) == 0)
        goto LABEL_34;
      goto LABEL_72;
    }
  }
  else if ((*(_BYTE *)&v19 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampC2Start));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("timestamp_c2_start"));

  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v19 & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampC2Now));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("timestamp_c2_now"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v19 & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampDnsStart));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("timestamp_dns_start"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v19 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_75;
  }
LABEL_74:
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampDnsEnd));
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("timestamp_dns_end"));

  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v19 & 0x8000) == 0)
      goto LABEL_38;
    goto LABEL_76;
  }
LABEL_75:
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampTcpStart));
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("timestamp_tcp_start"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x8000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v19 & 0x4000) == 0)
      goto LABEL_39;
    goto LABEL_77;
  }
LABEL_76:
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampTcpEnd));
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("timestamp_tcp_end"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v19 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_78;
  }
LABEL_77:
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampSslStart));
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("timestamp_ssl_start"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v19 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_79;
  }
LABEL_78:
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampRequestStart));
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("timestamp_request_start"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v19 & 0x2000) == 0)
      goto LABEL_42;
    goto LABEL_80;
  }
LABEL_79:
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampRequestEnd));
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("timestamp_request_end"));

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v19 & 0x1000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_80:
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampResponseStart));
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("timestamp_response_start"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_43:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampResponseEnd));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("timestamp_response_end"));

  }
LABEL_44:
  optionsQualityOfService = self->_optionsQualityOfService;
  if (optionsQualityOfService)
    objc_msgSend(v3, "setObject:forKey:", optionsQualityOfService, CFSTR("options_quality_of_service"));
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x8000000) != 0)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_optionsOutOfProcess));
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("options_out_of_process"));

    v22 = self->_has;
    if ((*(_DWORD *)&v22 & 0x10000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v22 & 0x1000000) == 0)
        goto LABEL_49;
      goto LABEL_84;
    }
  }
  else if ((*(_DWORD *)&v22 & 0x10000000) == 0)
  {
    goto LABEL_48;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_optionsOutOfProcessForceDiscretionary));
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("options_out_of_process_force_discretionary"));

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v22 & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_85;
  }
LABEL_84:
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_optionsAllowExpensiveAccess));
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("options_allow_expensive_access"));

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v22 & 0x200000) == 0)
      goto LABEL_51;
    goto LABEL_86;
  }
LABEL_85:
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_optionsAllowPowerNapScheduling));
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("options_allow_power_nap_scheduling"));

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x200000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v22 & 0x400000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_86:
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_optionsTimeoutIntervalForRequest));
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("options_timeout_interval_for_request"));

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_52:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_optionsTimeoutIntervalForResource));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("options_timeout_interval_for_resource"));

  }
LABEL_53:
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if (optionsSourceApplicationBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", optionsSourceApplicationBundleIdentifier, CFSTR("options_source_application_bundle_identifier"));
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if (optionsSourceApplicationSecondaryIdentifier)
    objc_msgSend(v3, "setObject:forKey:", optionsSourceApplicationSecondaryIdentifier, CFSTR("options_source_application_secondary_identifier"));
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x4000000) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_optionsAppleIdContext));
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("options_apple_id_context"));

    v26 = self->_has;
  }
  if ((*(_DWORD *)&v26 & 0x20000000) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_optionsTlsPinningRequired));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("options_tls_pinning_required"));

  }
  v29 = v3;

  return v29;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001A1158((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $AF884E7ED10AB980613DA027D2B84F87 has;
  NSString *networkTaskDescription;
  NSString *networkHostname;
  NSString *networkRemoteAddresssAndPort;
  NSString *networkConnectionUuid;
  NSString *networkInterfaceIdentifier;
  NSString *networkProtocolName;
  $AF884E7ED10AB980613DA027D2B84F87 v11;
  SECC2MPError *networkFatalError;
  NSString *networkRequestUri;
  $AF884E7ED10AB980613DA027D2B84F87 v14;
  NSString *optionsQualityOfService;
  $AF884E7ED10AB980613DA027D2B84F87 v16;
  NSString *optionsSourceApplicationBundleIdentifier;
  NSString *optionsSourceApplicationSecondaryIdentifier;
  $AF884E7ED10AB980613DA027D2B84F87 v19;
  id v20;

  v20 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteUint64Field(v20, self->_triggers, 1);
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field(v20, self->_reportFrequency, 2);
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field(v20, self->_reportFrequencyBase, 3);
LABEL_5:
  networkTaskDescription = self->_networkTaskDescription;
  if (networkTaskDescription)
    PBDataWriterWriteStringField(v20, networkTaskDescription, 101);
  networkHostname = self->_networkHostname;
  if (networkHostname)
    PBDataWriterWriteStringField(v20, networkHostname, 102);
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if (networkRemoteAddresssAndPort)
    PBDataWriterWriteStringField(v20, networkRemoteAddresssAndPort, 103);
  networkConnectionUuid = self->_networkConnectionUuid;
  if (networkConnectionUuid)
    PBDataWriterWriteStringField(v20, networkConnectionUuid, 104);
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    PBDataWriterWriteBOOLField(v20, self->_networkConnectionReused, 105);
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if (networkInterfaceIdentifier)
    PBDataWriterWriteStringField(v20, networkInterfaceIdentifier, 106);
  networkProtocolName = self->_networkProtocolName;
  if (networkProtocolName)
    PBDataWriterWriteStringField(v20, networkProtocolName, 107);
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field(v20, self->_networkRequestHeaderSize, 108);
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v11 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_67;
    }
  }
  else if ((*(_BYTE *)&v11 & 1) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint64Field(v20, self->_networkRequestBodyBytesSent, 109);
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v11 & 2) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field(v20, self->_networkResponseHeaderSize, 110);
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v11 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_68:
  PBDataWriterWriteUint64Field(v20, self->_networkResponseBodyBytesReceived, 111);
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field(v20, self->_networkPreviousAttemptCount, 112);
LABEL_25:
  networkFatalError = self->_networkFatalError;
  if (networkFatalError)
    PBDataWriterWriteSubmessage(v20, networkFatalError, 113);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field(v20, self->_networkStatusCode, 114);
  networkRequestUri = self->_networkRequestUri;
  if (networkRequestUri)
    PBDataWriterWriteStringField(v20, networkRequestUri, 115);
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field(v20, self->_timestampC2Init, 201);
    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 0x80) == 0)
    {
LABEL_33:
      if ((*(_BYTE *)&v14 & 0x40) == 0)
        goto LABEL_34;
      goto LABEL_72;
    }
  }
  else if ((*(_BYTE *)&v14 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteUint64Field(v20, self->_timestampC2Start, 202);
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v14 & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field(v20, self->_timestampC2Now, 203);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v14 & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field(v20, self->_timestampDnsStart, 204);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field(v20, self->_timestampDnsEnd, 205);
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v14 & 0x8000) == 0)
      goto LABEL_38;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field(v20, self->_timestampTcpStart, 206);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_39;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field(v20, self->_timestampTcpEnd, 207);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v14 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field(v20, self->_timestampSslStart, 208);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v14 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field(v20, self->_timestampRequestStart, 209);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_42;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field(v20, self->_timestampRequestEnd, 210);
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v14 & 0x1000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_80:
  PBDataWriterWriteUint64Field(v20, self->_timestampResponseStart, 211);
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_43:
    PBDataWriterWriteUint64Field(v20, self->_timestampResponseEnd, 212);
LABEL_44:
  optionsQualityOfService = self->_optionsQualityOfService;
  if (optionsQualityOfService)
    PBDataWriterWriteStringField(v20, optionsQualityOfService, 301);
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField(v20, self->_optionsOutOfProcess, 302);
    v16 = self->_has;
    if ((*(_DWORD *)&v16 & 0x10000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v16 & 0x1000000) == 0)
        goto LABEL_49;
      goto LABEL_84;
    }
  }
  else if ((*(_DWORD *)&v16 & 0x10000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteBOOLField(v20, self->_optionsOutOfProcessForceDiscretionary, 303);
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v16 & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField(v20, self->_optionsAllowExpensiveAccess, 304);
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
      goto LABEL_51;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField(v20, self->_optionsAllowPowerNapScheduling, 305);
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v16 & 0x400000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_86:
  PBDataWriterWriteUint32Field(v20, self->_optionsTimeoutIntervalForRequest, 306);
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
LABEL_52:
    PBDataWriterWriteUint32Field(v20, self->_optionsTimeoutIntervalForResource, 307);
LABEL_53:
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if (optionsSourceApplicationBundleIdentifier)
    PBDataWriterWriteStringField(v20, optionsSourceApplicationBundleIdentifier, 308);
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if (optionsSourceApplicationSecondaryIdentifier)
    PBDataWriterWriteStringField(v20, optionsSourceApplicationSecondaryIdentifier, 309);
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField(v20, self->_optionsAppleIdContext, 310);
    v19 = self->_has;
  }
  if ((*(_DWORD *)&v19 & 0x20000000) != 0)
    PBDataWriterWriteBOOLField(v20, self->_optionsTlsPinningRequired, 311);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $AF884E7ED10AB980613DA027D2B84F87 has;
  $AF884E7ED10AB980613DA027D2B84F87 v6;
  $AF884E7ED10AB980613DA027D2B84F87 v7;
  $AF884E7ED10AB980613DA027D2B84F87 v8;
  $AF884E7ED10AB980613DA027D2B84F87 v9;
  _QWORD *v10;

  v4 = a3;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v4[18] = self->_triggers;
    *((_DWORD *)v4 + 70) |= 0x20000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_reportFrequency;
  *((_DWORD *)v4 + 70) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4[5] = self->_reportFrequencyBase;
    *((_DWORD *)v4 + 70) |= 0x10u;
  }
LABEL_5:
  v10 = v4;
  if (self->_networkTaskDescription)
  {
    objc_msgSend(v4, "setNetworkTaskDescription:");
    v4 = v10;
  }
  if (self->_networkHostname)
  {
    objc_msgSend(v10, "setNetworkHostname:");
    v4 = v10;
  }
  if (self->_networkRemoteAddresssAndPort)
  {
    objc_msgSend(v10, "setNetworkRemoteAddresssAndPort:");
    v4 = v10;
  }
  if (self->_networkConnectionUuid)
  {
    objc_msgSend(v10, "setNetworkConnectionUuid:");
    v4 = v10;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *((_BYTE *)v4 + 272) = self->_networkConnectionReused;
    *((_DWORD *)v4 + 70) |= 0x800000u;
  }
  if (self->_networkInterfaceIdentifier)
  {
    objc_msgSend(v10, "setNetworkInterfaceIdentifier:");
    v4 = v10;
  }
  if (self->_networkProtocolName)
  {
    objc_msgSend(v10, "setNetworkProtocolName:");
    v4 = v10;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((_DWORD *)v4 + 52) = self->_networkRequestHeaderSize;
    *((_DWORD *)v4 + 70) |= 0x80000u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_67;
    }
  }
  else if ((*(_BYTE *)&v6 & 1) == 0)
  {
    goto LABEL_21;
  }
  v4[1] = self->_networkRequestBodyBytesSent;
  *((_DWORD *)v4 + 70) |= 1u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_23;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 56) = self->_networkResponseHeaderSize;
  *((_DWORD *)v4 + 70) |= 0x100000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_68:
  v4[2] = self->_networkResponseBodyBytesReceived;
  *((_DWORD *)v4 + 70) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    *((_DWORD *)v4 + 46) = self->_networkPreviousAttemptCount;
    *((_DWORD *)v4 + 70) |= 0x40000u;
  }
LABEL_25:
  if (self->_networkFatalError)
  {
    objc_msgSend(v10, "setNetworkFatalError:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[3] = self->_networkStatusCode;
    *((_DWORD *)v4 + 70) |= 4u;
  }
  if (self->_networkRequestUri)
  {
    objc_msgSend(v10, "setNetworkRequestUri:");
    v4 = v10;
  }
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) != 0)
  {
    v4[6] = self->_timestampC2Init;
    *((_DWORD *)v4 + 70) |= 0x20u;
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 0x80) == 0)
    {
LABEL_33:
      if ((*(_BYTE *)&v7 & 0x40) == 0)
        goto LABEL_34;
      goto LABEL_72;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  v4[8] = self->_timestampC2Start;
  *((_DWORD *)v4 + 70) |= 0x80u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_73;
  }
LABEL_72:
  v4[7] = self->_timestampC2Now;
  *((_DWORD *)v4 + 70) |= 0x40u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_36;
    goto LABEL_74;
  }
LABEL_73:
  v4[10] = self->_timestampDnsStart;
  *((_DWORD *)v4 + 70) |= 0x200u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_75;
  }
LABEL_74:
  v4[9] = self->_timestampDnsEnd;
  *((_DWORD *)v4 + 70) |= 0x100u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_38;
    goto LABEL_76;
  }
LABEL_75:
  v4[17] = self->_timestampTcpStart;
  *((_DWORD *)v4 + 70) |= 0x10000u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_39;
    goto LABEL_77;
  }
LABEL_76:
  v4[16] = self->_timestampTcpEnd;
  *((_DWORD *)v4 + 70) |= 0x8000u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_78;
  }
LABEL_77:
  v4[15] = self->_timestampSslStart;
  *((_DWORD *)v4 + 70) |= 0x4000u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v7 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_79;
  }
LABEL_78:
  v4[12] = self->_timestampRequestStart;
  *((_DWORD *)v4 + 70) |= 0x800u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_42;
    goto LABEL_80;
  }
LABEL_79:
  v4[11] = self->_timestampRequestEnd;
  *((_DWORD *)v4 + 70) |= 0x400u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v7 & 0x1000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_80:
  v4[14] = self->_timestampResponseStart;
  *((_DWORD *)v4 + 70) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_43:
    v4[13] = self->_timestampResponseEnd;
    *((_DWORD *)v4 + 70) |= 0x1000u;
  }
LABEL_44:
  if (self->_optionsQualityOfService)
  {
    objc_msgSend(v10, "setOptionsQualityOfService:");
    v4 = v10;
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) != 0)
  {
    *((_BYTE *)v4 + 276) = self->_optionsOutOfProcess;
    *((_DWORD *)v4 + 70) |= 0x8000000u;
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x10000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v8 & 0x1000000) == 0)
        goto LABEL_49;
      goto LABEL_84;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
    goto LABEL_48;
  }
  *((_BYTE *)v4 + 277) = self->_optionsOutOfProcessForceDiscretionary;
  *((_DWORD *)v4 + 70) |= 0x10000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
      goto LABEL_50;
    goto LABEL_85;
  }
LABEL_84:
  *((_BYTE *)v4 + 273) = self->_optionsAllowExpensiveAccess;
  *((_DWORD *)v4 + 70) |= 0x1000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v8 & 0x200000) == 0)
      goto LABEL_51;
    goto LABEL_86;
  }
LABEL_85:
  *((_BYTE *)v4 + 274) = self->_optionsAllowPowerNapScheduling;
  *((_DWORD *)v4 + 70) |= 0x2000000u;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_86:
  *((_DWORD *)v4 + 66) = self->_optionsTimeoutIntervalForRequest;
  *((_DWORD *)v4 + 70) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_52:
    *((_DWORD *)v4 + 67) = self->_optionsTimeoutIntervalForResource;
    *((_DWORD *)v4 + 70) |= 0x400000u;
  }
LABEL_53:
  if (self->_optionsSourceApplicationBundleIdentifier)
  {
    objc_msgSend(v10, "setOptionsSourceApplicationBundleIdentifier:");
    v4 = v10;
  }
  if (self->_optionsSourceApplicationSecondaryIdentifier)
  {
    objc_msgSend(v10, "setOptionsSourceApplicationSecondaryIdentifier:");
    v4 = v10;
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
  {
    *((_BYTE *)v4 + 275) = self->_optionsAppleIdContext;
    *((_DWORD *)v4 + 70) |= 0x4000000u;
    v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x20000000) != 0)
  {
    *((_BYTE *)v4 + 278) = self->_optionsTlsPinningRequired;
    *((_DWORD *)v4 + 70) |= 0x20000000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $AF884E7ED10AB980613DA027D2B84F87 has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  $AF884E7ED10AB980613DA027D2B84F87 v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  $AF884E7ED10AB980613DA027D2B84F87 v25;
  id v26;
  void *v27;
  $AF884E7ED10AB980613DA027D2B84F87 v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  $AF884E7ED10AB980613DA027D2B84F87 v33;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v5[18] = self->_triggers;
    *((_DWORD *)v5 + 70) |= 0x20000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_reportFrequency;
  *((_DWORD *)v5 + 70) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5[5] = self->_reportFrequencyBase;
    *((_DWORD *)v5 + 70) |= 0x10u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_networkTaskDescription, "copyWithZone:", a3);
  v9 = (void *)v6[29];
  v6[29] = v8;

  v10 = -[NSString copyWithZone:](self->_networkHostname, "copyWithZone:", a3);
  v11 = (void *)v6[21];
  v6[21] = v10;

  v12 = -[NSString copyWithZone:](self->_networkRemoteAddresssAndPort, "copyWithZone:", a3);
  v13 = (void *)v6[25];
  v6[25] = v12;

  v14 = -[NSString copyWithZone:](self->_networkConnectionUuid, "copyWithZone:", a3);
  v15 = (void *)v6[19];
  v6[19] = v14;

  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *((_BYTE *)v6 + 272) = self->_networkConnectionReused;
    *((_DWORD *)v6 + 70) |= 0x800000u;
  }
  v16 = -[NSString copyWithZone:](self->_networkInterfaceIdentifier, "copyWithZone:", a3);
  v17 = (void *)v6[22];
  v6[22] = v16;

  v18 = -[NSString copyWithZone:](self->_networkProtocolName, "copyWithZone:", a3);
  v19 = (void *)v6[24];
  v6[24] = v18;

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000) != 0)
  {
    *((_DWORD *)v6 + 52) = self->_networkRequestHeaderSize;
    *((_DWORD *)v6 + 70) |= 0x80000u;
    v20 = self->_has;
    if ((*(_BYTE *)&v20 & 1) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&v20 & 0x100000) == 0)
        goto LABEL_10;
      goto LABEL_45;
    }
  }
  else if ((*(_BYTE *)&v20 & 1) == 0)
  {
    goto LABEL_9;
  }
  v6[1] = self->_networkRequestBodyBytesSent;
  *((_DWORD *)v6 + 70) |= 1u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v20 & 2) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 56) = self->_networkResponseHeaderSize;
  *((_DWORD *)v6 + 70) |= 0x100000u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 2) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v20 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_46:
  v6[2] = self->_networkResponseBodyBytesReceived;
  *((_DWORD *)v6 + 70) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 46) = self->_networkPreviousAttemptCount;
    *((_DWORD *)v6 + 70) |= 0x40000u;
  }
LABEL_13:
  v21 = -[SECC2MPError copyWithZone:](self->_networkFatalError, "copyWithZone:", a3);
  v22 = (void *)v6[20];
  v6[20] = v21;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6[3] = self->_networkStatusCode;
    *((_DWORD *)v6 + 70) |= 4u;
  }
  v23 = -[NSString copyWithZone:](self->_networkRequestUri, "copyWithZone:", a3);
  v24 = (void *)v6[27];
  v6[27] = v23;

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x20) != 0)
  {
    v6[6] = self->_timestampC2Init;
    *((_DWORD *)v6 + 70) |= 0x20u;
    v25 = self->_has;
    if ((*(_BYTE *)&v25 & 0x80) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v25 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v25 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  v6[8] = self->_timestampC2Start;
  *((_DWORD *)v6 + 70) |= 0x80u;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v25 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  v6[7] = self->_timestampC2Now;
  *((_DWORD *)v6 + 70) |= 0x40u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v25 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  v6[10] = self->_timestampDnsStart;
  *((_DWORD *)v6 + 70) |= 0x200u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v25 & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  v6[9] = self->_timestampDnsEnd;
  *((_DWORD *)v6 + 70) |= 0x100u;
  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v25 & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_54;
  }
LABEL_53:
  v6[17] = self->_timestampTcpStart;
  *((_DWORD *)v6 + 70) |= 0x10000u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v25 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  v6[16] = self->_timestampTcpEnd;
  *((_DWORD *)v6 + 70) |= 0x8000u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v25 & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  v6[15] = self->_timestampSslStart;
  *((_DWORD *)v6 + 70) |= 0x4000u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v25 & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_57;
  }
LABEL_56:
  v6[12] = self->_timestampRequestStart;
  *((_DWORD *)v6 + 70) |= 0x800u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v25 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_58;
  }
LABEL_57:
  v6[11] = self->_timestampRequestEnd;
  *((_DWORD *)v6 + 70) |= 0x400u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v25 & 0x1000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_58:
  v6[14] = self->_timestampResponseStart;
  *((_DWORD *)v6 + 70) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_27:
    v6[13] = self->_timestampResponseEnd;
    *((_DWORD *)v6 + 70) |= 0x1000u;
  }
LABEL_28:
  v26 = -[NSString copyWithZone:](self->_optionsQualityOfService, "copyWithZone:", a3);
  v27 = (void *)v6[30];
  v6[30] = v26;

  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x8000000) != 0)
  {
    *((_BYTE *)v6 + 276) = self->_optionsOutOfProcess;
    *((_DWORD *)v6 + 70) |= 0x8000000u;
    v28 = self->_has;
    if ((*(_DWORD *)&v28 & 0x10000000) == 0)
    {
LABEL_30:
      if ((*(_DWORD *)&v28 & 0x1000000) == 0)
        goto LABEL_31;
      goto LABEL_62;
    }
  }
  else if ((*(_DWORD *)&v28 & 0x10000000) == 0)
  {
    goto LABEL_30;
  }
  *((_BYTE *)v6 + 277) = self->_optionsOutOfProcessForceDiscretionary;
  *((_DWORD *)v6 + 70) |= 0x10000000u;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v28 & 0x2000000) == 0)
      goto LABEL_32;
    goto LABEL_63;
  }
LABEL_62:
  *((_BYTE *)v6 + 273) = self->_optionsAllowExpensiveAccess;
  *((_DWORD *)v6 + 70) |= 0x1000000u;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v28 & 0x200000) == 0)
      goto LABEL_33;
    goto LABEL_64;
  }
LABEL_63:
  *((_BYTE *)v6 + 274) = self->_optionsAllowPowerNapScheduling;
  *((_DWORD *)v6 + 70) |= 0x2000000u;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v28 & 0x400000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_64:
  *((_DWORD *)v6 + 66) = self->_optionsTimeoutIntervalForRequest;
  *((_DWORD *)v6 + 70) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_34:
    *((_DWORD *)v6 + 67) = self->_optionsTimeoutIntervalForResource;
    *((_DWORD *)v6 + 70) |= 0x400000u;
  }
LABEL_35:
  v29 = -[NSString copyWithZone:](self->_optionsSourceApplicationBundleIdentifier, "copyWithZone:", a3);
  v30 = (void *)v6[31];
  v6[31] = v29;

  v31 = -[NSString copyWithZone:](self->_optionsSourceApplicationSecondaryIdentifier, "copyWithZone:", a3);
  v32 = (void *)v6[32];
  v6[32] = v31;

  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x4000000) != 0)
  {
    *((_BYTE *)v6 + 275) = self->_optionsAppleIdContext;
    *((_DWORD *)v6 + 70) |= 0x4000000u;
    v33 = self->_has;
  }
  if ((*(_DWORD *)&v33 & 0x20000000) != 0)
  {
    *((_BYTE *)v6 + 278) = self->_optionsTlsPinningRequired;
    *((_DWORD *)v6 + 70) |= 0x20000000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $AF884E7ED10AB980613DA027D2B84F87 has;
  int v6;
  NSString *networkTaskDescription;
  NSString *networkHostname;
  NSString *networkRemoteAddresssAndPort;
  NSString *networkConnectionUuid;
  int v11;
  NSString *networkInterfaceIdentifier;
  NSString *networkProtocolName;
  $AF884E7ED10AB980613DA027D2B84F87 v14;
  int v15;
  SECC2MPError *networkFatalError;
  NSString *networkRequestUri;
  NSString *optionsQualityOfService;
  NSString *optionsSourceApplicationBundleIdentifier;
  NSString *optionsSourceApplicationSecondaryIdentifier;
  $AF884E7ED10AB980613DA027D2B84F87 v21;
  int v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_193;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_triggers != *((_QWORD *)v4 + 18))
      goto LABEL_193;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_reportFrequency != *((_QWORD *)v4 + 4))
      goto LABEL_193;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_reportFrequencyBase != *((_QWORD *)v4 + 5))
      goto LABEL_193;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_193;
  }
  networkTaskDescription = self->_networkTaskDescription;
  if ((unint64_t)networkTaskDescription | *((_QWORD *)v4 + 29)
    && !-[NSString isEqual:](networkTaskDescription, "isEqual:"))
  {
    goto LABEL_193;
  }
  networkHostname = self->_networkHostname;
  if ((unint64_t)networkHostname | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](networkHostname, "isEqual:"))
      goto LABEL_193;
  }
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if ((unint64_t)networkRemoteAddresssAndPort | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](networkRemoteAddresssAndPort, "isEqual:"))
      goto LABEL_193;
  }
  networkConnectionUuid = self->_networkConnectionUuid;
  if ((unint64_t)networkConnectionUuid | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](networkConnectionUuid, "isEqual:"))
      goto LABEL_193;
  }
  v11 = *((_DWORD *)v4 + 70);
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    if ((v11 & 0x800000) == 0)
      goto LABEL_193;
    if (self->_networkConnectionReused)
    {
      if (!*((_BYTE *)v4 + 272))
        goto LABEL_193;
    }
    else if (*((_BYTE *)v4 + 272))
    {
      goto LABEL_193;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_193;
  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if ((unint64_t)networkInterfaceIdentifier | *((_QWORD *)v4 + 22)
    && !-[NSString isEqual:](networkInterfaceIdentifier, "isEqual:"))
  {
    goto LABEL_193;
  }
  networkProtocolName = self->_networkProtocolName;
  if ((unint64_t)networkProtocolName | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](networkProtocolName, "isEqual:"))
      goto LABEL_193;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_networkRequestHeaderSize != *((_DWORD *)v4 + 52))
      goto LABEL_193;
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_networkRequestBodyBytesSent != *((_QWORD *)v4 + 1))
      goto LABEL_193;
  }
  else if ((v15 & 1) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v15 & 0x100000) == 0 || self->_networkResponseHeaderSize != *((_DWORD *)v4 + 56))
      goto LABEL_193;
  }
  else if ((v15 & 0x100000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_BYTE *)&v14 & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_networkResponseBodyBytesReceived != *((_QWORD *)v4 + 2))
      goto LABEL_193;
  }
  else if ((v15 & 2) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_networkPreviousAttemptCount != *((_DWORD *)v4 + 46))
      goto LABEL_193;
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_193;
  }
  networkFatalError = self->_networkFatalError;
  if ((unint64_t)networkFatalError | *((_QWORD *)v4 + 20))
  {
    if (!-[SECC2MPError isEqual:](networkFatalError, "isEqual:"))
      goto LABEL_193;
    v14 = self->_has;
    v15 = *((_DWORD *)v4 + 70);
  }
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_networkStatusCode != *((_QWORD *)v4 + 3))
      goto LABEL_193;
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_193;
  }
  networkRequestUri = self->_networkRequestUri;
  if ((unint64_t)networkRequestUri | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](networkRequestUri, "isEqual:"))
      goto LABEL_193;
    v14 = self->_has;
    v15 = *((_DWORD *)v4 + 70);
  }
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_timestampC2Init != *((_QWORD *)v4 + 6))
      goto LABEL_193;
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_timestampC2Start != *((_QWORD *)v4 + 8))
      goto LABEL_193;
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_timestampC2Now != *((_QWORD *)v4 + 7))
      goto LABEL_193;
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_timestampDnsStart != *((_QWORD *)v4 + 10))
      goto LABEL_193;
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_timestampDnsEnd != *((_QWORD *)v4 + 9))
      goto LABEL_193;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0 || self->_timestampTcpStart != *((_QWORD *)v4 + 17))
      goto LABEL_193;
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0 || self->_timestampTcpEnd != *((_QWORD *)v4 + 16))
      goto LABEL_193;
  }
  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0 || self->_timestampSslStart != *((_QWORD *)v4 + 15))
      goto LABEL_193;
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
    if ((v15 & 0x800) == 0 || self->_timestampRequestStart != *((_QWORD *)v4 + 12))
      goto LABEL_193;
  }
  else if ((v15 & 0x800) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_timestampRequestEnd != *((_QWORD *)v4 + 11))
      goto LABEL_193;
  }
  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_timestampResponseStart != *((_QWORD *)v4 + 14))
      goto LABEL_193;
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0 || self->_timestampResponseEnd != *((_QWORD *)v4 + 13))
      goto LABEL_193;
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_193;
  }
  optionsQualityOfService = self->_optionsQualityOfService;
  if ((unint64_t)optionsQualityOfService | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](optionsQualityOfService, "isEqual:"))
      goto LABEL_193;
    v14 = self->_has;
    v15 = *((_DWORD *)v4 + 70);
  }
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0)
      goto LABEL_193;
    if (self->_optionsOutOfProcess)
    {
      if (!*((_BYTE *)v4 + 276))
        goto LABEL_193;
    }
    else if (*((_BYTE *)v4 + 276))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    if ((v15 & 0x10000000) == 0)
      goto LABEL_193;
    if (self->_optionsOutOfProcessForceDiscretionary)
    {
      if (!*((_BYTE *)v4 + 277))
        goto LABEL_193;
    }
    else if (*((_BYTE *)v4 + 277))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x10000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    if ((v15 & 0x1000000) == 0)
      goto LABEL_193;
    if (self->_optionsAllowExpensiveAccess)
    {
      if (!*((_BYTE *)v4 + 273))
        goto LABEL_193;
    }
    else if (*((_BYTE *)v4 + 273))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x1000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0)
      goto LABEL_193;
    if (self->_optionsAllowPowerNapScheduling)
    {
      if (!*((_BYTE *)v4 + 274))
        goto LABEL_193;
    }
    else if (*((_BYTE *)v4 + 274))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    if ((v15 & 0x200000) == 0 || self->_optionsTimeoutIntervalForRequest != *((_DWORD *)v4 + 66))
      goto LABEL_193;
  }
  else if ((v15 & 0x200000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x400000) != 0)
  {
    if ((v15 & 0x400000) == 0 || self->_optionsTimeoutIntervalForResource != *((_DWORD *)v4 + 67))
      goto LABEL_193;
  }
  else if ((v15 & 0x400000) != 0)
  {
    goto LABEL_193;
  }
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if ((unint64_t)optionsSourceApplicationBundleIdentifier | *((_QWORD *)v4 + 31)
    && !-[NSString isEqual:](optionsSourceApplicationBundleIdentifier, "isEqual:"))
  {
    goto LABEL_193;
  }
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if ((unint64_t)optionsSourceApplicationSecondaryIdentifier | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](optionsSourceApplicationSecondaryIdentifier, "isEqual:"))
      goto LABEL_193;
  }
  v21 = self->_has;
  v22 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&v21 & 0x4000000) != 0)
  {
    if ((v22 & 0x4000000) == 0)
      goto LABEL_193;
    if (self->_optionsAppleIdContext)
    {
      if (!*((_BYTE *)v4 + 275))
        goto LABEL_193;
    }
    else if (*((_BYTE *)v4 + 275))
    {
      goto LABEL_193;
    }
  }
  else if ((v22 & 0x4000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v21 & 0x20000000) != 0)
  {
    if ((v22 & 0x20000000) != 0)
    {
      if (self->_optionsTlsPinningRequired)
      {
        if (!*((_BYTE *)v4 + 278))
          goto LABEL_193;
      }
      else if (*((_BYTE *)v4 + 278))
      {
        goto LABEL_193;
      }
      v23 = 1;
      goto LABEL_194;
    }
LABEL_193:
    v23 = 0;
    goto LABEL_194;
  }
  v23 = (v22 & 0x20000000) == 0;
LABEL_194:

  return v23;
}

- (unint64_t)hash
{
  $AF884E7ED10AB980613DA027D2B84F87 has;
  $AF884E7ED10AB980613DA027D2B84F87 v4;
  $AF884E7ED10AB980613DA027D2B84F87 v5;
  $AF884E7ED10AB980613DA027D2B84F87 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  $AF884E7ED10AB980613DA027D2B84F87 v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSUInteger v41;
  NSUInteger v42;
  uint64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    v50 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v49 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v50 = 2654435761u * self->_triggers;
  if ((*(_BYTE *)&has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v49 = 2654435761u * self->_reportFrequency;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_4:
    v48 = 2654435761u * self->_reportFrequencyBase;
    goto LABEL_8;
  }
LABEL_7:
  v48 = 0;
LABEL_8:
  v47 = -[NSString hash](self->_networkTaskDescription, "hash");
  v46 = -[NSString hash](self->_networkHostname, "hash");
  v45 = -[NSString hash](self->_networkRemoteAddresssAndPort, "hash");
  v44 = -[NSString hash](self->_networkConnectionUuid, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    v43 = 2654435761 * self->_networkConnectionReused;
  else
    v43 = 0;
  v42 = -[NSString hash](self->_networkInterfaceIdentifier, "hash");
  v41 = -[NSString hash](self->_networkProtocolName, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
    v40 = 2654435761 * self->_networkRequestHeaderSize;
    if ((*(_BYTE *)&v4 & 1) != 0)
    {
LABEL_13:
      v39 = 2654435761u * self->_networkRequestBodyBytesSent;
      if ((*(_DWORD *)&v4 & 0x100000) != 0)
        goto LABEL_14;
      goto LABEL_19;
    }
  }
  else
  {
    v40 = 0;
    if ((*(_BYTE *)&v4 & 1) != 0)
      goto LABEL_13;
  }
  v39 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_14:
    v38 = 2654435761 * self->_networkResponseHeaderSize;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_15;
LABEL_20:
    v37 = 0;
    if ((*(_DWORD *)&v4 & 0x40000) != 0)
      goto LABEL_16;
    goto LABEL_21;
  }
LABEL_19:
  v38 = 0;
  if ((*(_BYTE *)&v4 & 2) == 0)
    goto LABEL_20;
LABEL_15:
  v37 = 2654435761u * self->_networkResponseBodyBytesReceived;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_16:
    v36 = 2654435761 * self->_networkPreviousAttemptCount;
    goto LABEL_22;
  }
LABEL_21:
  v36 = 0;
LABEL_22:
  v35 = -[SECC2MPError hash](self->_networkFatalError, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v34 = 2654435761u * self->_networkStatusCode;
  else
    v34 = 0;
  v33 = -[NSString hash](self->_networkRequestUri, "hash");
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) != 0)
  {
    v32 = 2654435761u * self->_timestampC2Init;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
    {
LABEL_27:
      v31 = 2654435761u * self->_timestampC2Start;
      if ((*(_BYTE *)&v5 & 0x40) != 0)
        goto LABEL_28;
      goto LABEL_40;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
      goto LABEL_27;
  }
  v31 = 0;
  if ((*(_BYTE *)&v5 & 0x40) != 0)
  {
LABEL_28:
    v30 = 2654435761u * self->_timestampC2Now;
    if ((*(_WORD *)&v5 & 0x200) != 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_40:
  v30 = 0;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
LABEL_29:
    v29 = 2654435761u * self->_timestampDnsStart;
    if ((*(_WORD *)&v5 & 0x100) != 0)
      goto LABEL_30;
    goto LABEL_42;
  }
LABEL_41:
  v29 = 0;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
LABEL_30:
    v28 = 2654435761u * self->_timestampDnsEnd;
    if ((*(_DWORD *)&v5 & 0x10000) != 0)
      goto LABEL_31;
    goto LABEL_43;
  }
LABEL_42:
  v28 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_31:
    v27 = 2654435761u * self->_timestampTcpStart;
    if ((*(_WORD *)&v5 & 0x8000) != 0)
      goto LABEL_32;
    goto LABEL_44;
  }
LABEL_43:
  v27 = 0;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_32:
    v26 = 2654435761u * self->_timestampTcpEnd;
    if ((*(_WORD *)&v5 & 0x4000) != 0)
      goto LABEL_33;
    goto LABEL_45;
  }
LABEL_44:
  v26 = 0;
  if ((*(_WORD *)&v5 & 0x4000) != 0)
  {
LABEL_33:
    v25 = 2654435761u * self->_timestampSslStart;
    if ((*(_WORD *)&v5 & 0x800) != 0)
      goto LABEL_34;
    goto LABEL_46;
  }
LABEL_45:
  v25 = 0;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
LABEL_34:
    v24 = 2654435761u * self->_timestampRequestStart;
    if ((*(_WORD *)&v5 & 0x400) != 0)
      goto LABEL_35;
    goto LABEL_47;
  }
LABEL_46:
  v24 = 0;
  if ((*(_WORD *)&v5 & 0x400) != 0)
  {
LABEL_35:
    v23 = 2654435761u * self->_timestampRequestEnd;
    if ((*(_WORD *)&v5 & 0x2000) != 0)
      goto LABEL_36;
LABEL_48:
    v22 = 0;
    if ((*(_WORD *)&v5 & 0x1000) != 0)
      goto LABEL_37;
    goto LABEL_49;
  }
LABEL_47:
  v23 = 0;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
    goto LABEL_48;
LABEL_36:
  v22 = 2654435761u * self->_timestampResponseStart;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_37:
    v21 = 2654435761u * self->_timestampResponseEnd;
    goto LABEL_50;
  }
LABEL_49:
  v21 = 0;
LABEL_50:
  v19 = -[NSString hash](self->_optionsQualityOfService, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    v7 = 2654435761 * self->_optionsOutOfProcess;
    if ((*(_DWORD *)&v6 & 0x10000000) != 0)
    {
LABEL_52:
      v8 = 2654435761 * self->_optionsOutOfProcessForceDiscretionary;
      if ((*(_DWORD *)&v6 & 0x1000000) != 0)
        goto LABEL_53;
      goto LABEL_59;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_DWORD *)&v6 & 0x10000000) != 0)
      goto LABEL_52;
  }
  v8 = 0;
  if ((*(_DWORD *)&v6 & 0x1000000) != 0)
  {
LABEL_53:
    v9 = 2654435761 * self->_optionsAllowExpensiveAccess;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0)
      goto LABEL_54;
    goto LABEL_60;
  }
LABEL_59:
  v9 = 0;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
LABEL_54:
    v10 = 2654435761 * self->_optionsAllowPowerNapScheduling;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
      goto LABEL_55;
LABEL_61:
    v11 = 0;
    if ((*(_DWORD *)&v6 & 0x400000) != 0)
      goto LABEL_56;
    goto LABEL_62;
  }
LABEL_60:
  v10 = 0;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
    goto LABEL_61;
LABEL_55:
  v11 = 2654435761 * self->_optionsTimeoutIntervalForRequest;
  if ((*(_DWORD *)&v6 & 0x400000) != 0)
  {
LABEL_56:
    v12 = 2654435761 * self->_optionsTimeoutIntervalForResource;
    goto LABEL_63;
  }
LABEL_62:
  v12 = 0;
LABEL_63:
  v13 = -[NSString hash](self->_optionsSourceApplicationBundleIdentifier, "hash", v19);
  v14 = -[NSString hash](self->_optionsSourceApplicationSecondaryIdentifier, "hash");
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x4000000) != 0)
  {
    v16 = 2654435761 * self->_optionsAppleIdContext;
    if ((*(_DWORD *)&v15 & 0x20000000) != 0)
      goto LABEL_65;
LABEL_67:
    v17 = 0;
    return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
  }
  v16 = 0;
  if ((*(_DWORD *)&v15 & 0x20000000) == 0)
    goto LABEL_67;
LABEL_65:
  v17 = 2654435761 * self->_optionsTlsPinningRequired;
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;
  int v6;
  int v7;
  SECC2MPError *networkFatalError;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  unint64_t *v13;

  v4 = (unint64_t *)a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 70);
  if ((v6 & 0x20000) != 0)
  {
    self->_triggers = v4[18];
    *(_DWORD *)&self->_has |= 0x20000u;
    v6 = *((_DWORD *)v4 + 70);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_reportFrequency = v4[4];
  *(_DWORD *)&self->_has |= 8u;
  if ((v4[35] & 0x10) != 0)
  {
LABEL_4:
    self->_reportFrequencyBase = v4[5];
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_5:
  v13 = v4;
  if (v4[29])
  {
    -[SECC2MPNetworkEvent setNetworkTaskDescription:](self, "setNetworkTaskDescription:");
    v5 = v13;
  }
  if (v5[21])
  {
    -[SECC2MPNetworkEvent setNetworkHostname:](self, "setNetworkHostname:");
    v5 = v13;
  }
  if (v5[25])
  {
    -[SECC2MPNetworkEvent setNetworkRemoteAddresssAndPort:](self, "setNetworkRemoteAddresssAndPort:");
    v5 = v13;
  }
  if (v5[19])
  {
    -[SECC2MPNetworkEvent setNetworkConnectionUuid:](self, "setNetworkConnectionUuid:");
    v5 = v13;
  }
  if ((*((_BYTE *)v5 + 282) & 0x80) != 0)
  {
    self->_networkConnectionReused = *((_BYTE *)v5 + 272);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (v5[22])
  {
    -[SECC2MPNetworkEvent setNetworkInterfaceIdentifier:](self, "setNetworkInterfaceIdentifier:");
    v5 = v13;
  }
  if (v5[24])
  {
    -[SECC2MPNetworkEvent setNetworkProtocolName:](self, "setNetworkProtocolName:");
    v5 = v13;
  }
  v7 = *((_DWORD *)v5 + 70);
  if ((v7 & 0x80000) != 0)
  {
    self->_networkRequestHeaderSize = *((_DWORD *)v5 + 52);
    *(_DWORD *)&self->_has |= 0x80000u;
    v7 = *((_DWORD *)v5 + 70);
    if ((v7 & 1) == 0)
    {
LABEL_21:
      if ((v7 & 0x100000) == 0)
        goto LABEL_22;
      goto LABEL_33;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_21;
  }
  self->_networkRequestBodyBytesSent = v5[1];
  *(_DWORD *)&self->_has |= 1u;
  v7 = *((_DWORD *)v5 + 70);
  if ((v7 & 0x100000) == 0)
  {
LABEL_22:
    if ((v7 & 2) == 0)
      goto LABEL_23;
    goto LABEL_34;
  }
LABEL_33:
  self->_networkResponseHeaderSize = *((_DWORD *)v5 + 56);
  *(_DWORD *)&self->_has |= 0x100000u;
  v7 = *((_DWORD *)v5 + 70);
  if ((v7 & 2) == 0)
  {
LABEL_23:
    if ((v7 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_34:
  self->_networkResponseBodyBytesReceived = v5[2];
  *(_DWORD *)&self->_has |= 2u;
  if ((v5[35] & 0x40000) != 0)
  {
LABEL_24:
    self->_networkPreviousAttemptCount = *((_DWORD *)v5 + 46);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  v9 = v5[20];
  if (networkFatalError)
  {
    if (!v9)
      goto LABEL_39;
    -[SECC2MPError mergeFrom:](networkFatalError, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_39;
    -[SECC2MPNetworkEvent setNetworkFatalError:](self, "setNetworkFatalError:");
  }
  v5 = v13;
LABEL_39:
  if ((v5[35] & 4) != 0)
  {
    self->_networkStatusCode = v5[3];
    *(_DWORD *)&self->_has |= 4u;
  }
  if (v5[27])
  {
    -[SECC2MPNetworkEvent setNetworkRequestUri:](self, "setNetworkRequestUri:");
    v5 = v13;
  }
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x20) != 0)
  {
    self->_timestampC2Init = v5[6];
    *(_DWORD *)&self->_has |= 0x20u;
    v10 = *((_DWORD *)v5 + 70);
    if ((v10 & 0x80) == 0)
    {
LABEL_45:
      if ((v10 & 0x40) == 0)
        goto LABEL_46;
      goto LABEL_76;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_45;
  }
  self->_timestampC2Start = v5[8];
  *(_DWORD *)&self->_has |= 0x80u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x40) == 0)
  {
LABEL_46:
    if ((v10 & 0x200) == 0)
      goto LABEL_47;
    goto LABEL_77;
  }
LABEL_76:
  self->_timestampC2Now = v5[7];
  *(_DWORD *)&self->_has |= 0x40u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x200) == 0)
  {
LABEL_47:
    if ((v10 & 0x100) == 0)
      goto LABEL_48;
    goto LABEL_78;
  }
LABEL_77:
  self->_timestampDnsStart = v5[10];
  *(_DWORD *)&self->_has |= 0x200u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x100) == 0)
  {
LABEL_48:
    if ((v10 & 0x10000) == 0)
      goto LABEL_49;
    goto LABEL_79;
  }
LABEL_78:
  self->_timestampDnsEnd = v5[9];
  *(_DWORD *)&self->_has |= 0x100u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x10000) == 0)
  {
LABEL_49:
    if ((v10 & 0x8000) == 0)
      goto LABEL_50;
    goto LABEL_80;
  }
LABEL_79:
  self->_timestampTcpStart = v5[17];
  *(_DWORD *)&self->_has |= 0x10000u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x8000) == 0)
  {
LABEL_50:
    if ((v10 & 0x4000) == 0)
      goto LABEL_51;
    goto LABEL_81;
  }
LABEL_80:
  self->_timestampTcpEnd = v5[16];
  *(_DWORD *)&self->_has |= 0x8000u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x4000) == 0)
  {
LABEL_51:
    if ((v10 & 0x800) == 0)
      goto LABEL_52;
    goto LABEL_82;
  }
LABEL_81:
  self->_timestampSslStart = v5[15];
  *(_DWORD *)&self->_has |= 0x4000u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x800) == 0)
  {
LABEL_52:
    if ((v10 & 0x400) == 0)
      goto LABEL_53;
    goto LABEL_83;
  }
LABEL_82:
  self->_timestampRequestStart = v5[12];
  *(_DWORD *)&self->_has |= 0x800u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x400) == 0)
  {
LABEL_53:
    if ((v10 & 0x2000) == 0)
      goto LABEL_54;
    goto LABEL_84;
  }
LABEL_83:
  self->_timestampRequestEnd = v5[11];
  *(_DWORD *)&self->_has |= 0x400u;
  v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x2000) == 0)
  {
LABEL_54:
    if ((v10 & 0x1000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_84:
  self->_timestampResponseStart = v5[14];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((v5[35] & 0x1000) != 0)
  {
LABEL_55:
    self->_timestampResponseEnd = v5[13];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_56:
  if (v5[30])
  {
    -[SECC2MPNetworkEvent setOptionsQualityOfService:](self, "setOptionsQualityOfService:");
    v5 = v13;
  }
  v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x8000000) != 0)
  {
    self->_optionsOutOfProcess = *((_BYTE *)v5 + 276);
    *(_DWORD *)&self->_has |= 0x8000000u;
    v11 = *((_DWORD *)v5 + 70);
    if ((v11 & 0x10000000) == 0)
    {
LABEL_60:
      if ((v11 & 0x1000000) == 0)
        goto LABEL_61;
      goto LABEL_88;
    }
  }
  else if ((v11 & 0x10000000) == 0)
  {
    goto LABEL_60;
  }
  self->_optionsOutOfProcessForceDiscretionary = *((_BYTE *)v5 + 277);
  *(_DWORD *)&self->_has |= 0x10000000u;
  v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x1000000) == 0)
  {
LABEL_61:
    if ((v11 & 0x2000000) == 0)
      goto LABEL_62;
    goto LABEL_89;
  }
LABEL_88:
  self->_optionsAllowExpensiveAccess = *((_BYTE *)v5 + 273);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_62:
    if ((v11 & 0x200000) == 0)
      goto LABEL_63;
    goto LABEL_90;
  }
LABEL_89:
  self->_optionsAllowPowerNapScheduling = *((_BYTE *)v5 + 274);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x200000) == 0)
  {
LABEL_63:
    if ((v11 & 0x400000) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_90:
  self->_optionsTimeoutIntervalForRequest = *((_DWORD *)v5 + 66);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((v5[35] & 0x400000) != 0)
  {
LABEL_64:
    self->_optionsTimeoutIntervalForResource = *((_DWORD *)v5 + 67);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_65:
  if (v5[31])
  {
    -[SECC2MPNetworkEvent setOptionsSourceApplicationBundleIdentifier:](self, "setOptionsSourceApplicationBundleIdentifier:");
    v5 = v13;
  }
  if (v5[32])
  {
    -[SECC2MPNetworkEvent setOptionsSourceApplicationSecondaryIdentifier:](self, "setOptionsSourceApplicationSecondaryIdentifier:");
    v5 = v13;
  }
  v12 = *((_DWORD *)v5 + 70);
  if ((v12 & 0x4000000) != 0)
  {
    self->_optionsAppleIdContext = *((_BYTE *)v5 + 275);
    *(_DWORD *)&self->_has |= 0x4000000u;
    v12 = *((_DWORD *)v5 + 70);
  }
  if ((v12 & 0x20000000) != 0)
  {
    self->_optionsTlsPinningRequired = *((_BYTE *)v5 + 278);
    *(_DWORD *)&self->_has |= 0x20000000u;
  }

}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (NSString)networkTaskDescription
{
  return self->_networkTaskDescription;
}

- (void)setNetworkTaskDescription:(id)a3
{
  objc_storeStrong((id *)&self->_networkTaskDescription, a3);
}

- (NSString)networkHostname
{
  return self->_networkHostname;
}

- (void)setNetworkHostname:(id)a3
{
  objc_storeStrong((id *)&self->_networkHostname, a3);
}

- (NSString)networkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort;
}

- (void)setNetworkRemoteAddresssAndPort:(id)a3
{
  objc_storeStrong((id *)&self->_networkRemoteAddresssAndPort, a3);
}

- (NSString)networkConnectionUuid
{
  return self->_networkConnectionUuid;
}

- (void)setNetworkConnectionUuid:(id)a3
{
  objc_storeStrong((id *)&self->_networkConnectionUuid, a3);
}

- (BOOL)networkConnectionReused
{
  return self->_networkConnectionReused;
}

- (NSString)networkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier;
}

- (void)setNetworkInterfaceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkInterfaceIdentifier, a3);
}

- (NSString)networkProtocolName
{
  return self->_networkProtocolName;
}

- (void)setNetworkProtocolName:(id)a3
{
  objc_storeStrong((id *)&self->_networkProtocolName, a3);
}

- (unsigned)networkRequestHeaderSize
{
  return self->_networkRequestHeaderSize;
}

- (unint64_t)networkRequestBodyBytesSent
{
  return self->_networkRequestBodyBytesSent;
}

- (unsigned)networkResponseHeaderSize
{
  return self->_networkResponseHeaderSize;
}

- (unint64_t)networkResponseBodyBytesReceived
{
  return self->_networkResponseBodyBytesReceived;
}

- (unsigned)networkPreviousAttemptCount
{
  return self->_networkPreviousAttemptCount;
}

- (SECC2MPError)networkFatalError
{
  return self->_networkFatalError;
}

- (void)setNetworkFatalError:(id)a3
{
  objc_storeStrong((id *)&self->_networkFatalError, a3);
}

- (unint64_t)networkStatusCode
{
  return self->_networkStatusCode;
}

- (NSString)networkRequestUri
{
  return self->_networkRequestUri;
}

- (void)setNetworkRequestUri:(id)a3
{
  objc_storeStrong((id *)&self->_networkRequestUri, a3);
}

- (unint64_t)timestampC2Init
{
  return self->_timestampC2Init;
}

- (unint64_t)timestampC2Start
{
  return self->_timestampC2Start;
}

- (unint64_t)timestampC2Now
{
  return self->_timestampC2Now;
}

- (unint64_t)timestampDnsStart
{
  return self->_timestampDnsStart;
}

- (unint64_t)timestampDnsEnd
{
  return self->_timestampDnsEnd;
}

- (unint64_t)timestampTcpStart
{
  return self->_timestampTcpStart;
}

- (unint64_t)timestampTcpEnd
{
  return self->_timestampTcpEnd;
}

- (unint64_t)timestampSslStart
{
  return self->_timestampSslStart;
}

- (unint64_t)timestampRequestStart
{
  return self->_timestampRequestStart;
}

- (unint64_t)timestampRequestEnd
{
  return self->_timestampRequestEnd;
}

- (unint64_t)timestampResponseStart
{
  return self->_timestampResponseStart;
}

- (unint64_t)timestampResponseEnd
{
  return self->_timestampResponseEnd;
}

- (NSString)optionsQualityOfService
{
  return self->_optionsQualityOfService;
}

- (void)setOptionsQualityOfService:(id)a3
{
  objc_storeStrong((id *)&self->_optionsQualityOfService, a3);
}

- (BOOL)optionsOutOfProcess
{
  return self->_optionsOutOfProcess;
}

- (BOOL)optionsOutOfProcessForceDiscretionary
{
  return self->_optionsOutOfProcessForceDiscretionary;
}

- (BOOL)optionsAllowExpensiveAccess
{
  return self->_optionsAllowExpensiveAccess;
}

- (BOOL)optionsAllowPowerNapScheduling
{
  return self->_optionsAllowPowerNapScheduling;
}

- (unsigned)optionsTimeoutIntervalForRequest
{
  return self->_optionsTimeoutIntervalForRequest;
}

- (unsigned)optionsTimeoutIntervalForResource
{
  return self->_optionsTimeoutIntervalForResource;
}

- (NSString)optionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier;
}

- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationBundleIdentifier, a3);
}

- (NSString)optionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier;
}

- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationSecondaryIdentifier, a3);
}

- (BOOL)optionsAppleIdContext
{
  return self->_optionsAppleIdContext;
}

- (BOOL)optionsTlsPinningRequired
{
  return self->_optionsTlsPinningRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsQualityOfService, 0);
  objc_storeStrong((id *)&self->_networkTaskDescription, 0);
  objc_storeStrong((id *)&self->_networkRequestUri, 0);
  objc_storeStrong((id *)&self->_networkRemoteAddresssAndPort, 0);
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_networkInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_networkHostname, 0);
  objc_storeStrong((id *)&self->_networkFatalError, 0);
  objc_storeStrong((id *)&self->_networkConnectionUuid, 0);
}

@end
