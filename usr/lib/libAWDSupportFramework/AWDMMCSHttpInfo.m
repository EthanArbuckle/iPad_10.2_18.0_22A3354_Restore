@implementation AWDMMCSHttpInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDMMCSHttpInfo setLocatorScheme:](self, "setLocatorScheme:", 0);
  -[AWDMMCSHttpInfo setLocatorHostname:](self, "setLocatorHostname:", 0);
  -[AWDMMCSHttpInfo setErrorDomain:](self, "setErrorDomain:", 0);
  -[AWDMMCSHttpInfo setTcpInfos:](self, "setTcpInfos:", 0);
  -[AWDMMCSHttpInfo setHttpErrors:](self, "setHttpErrors:", 0);
  -[AWDMMCSHttpInfo setInterfaceIdentifier:](self, "setInterfaceIdentifier:", 0);
  -[AWDMMCSHttpInfo setLocatorPeerAddress:](self, "setLocatorPeerAddress:", 0);
  -[AWDMMCSHttpInfo setNetworkUsed:](self, "setNetworkUsed:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSHttpInfo;
  -[AWDMMCSHttpInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)hasLocatorScheme
{
  return self->_locatorScheme != 0;
}

- (BOOL)hasLocatorHostname
{
  return self->_locatorHostname != 0;
}

- (void)setLocatorPort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_locatorPort = a3;
}

- (void)setHasLocatorPort:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocatorPort
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setConnectionReused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_connectionReused = a3;
}

- (void)setHasConnectionReused:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasConnectionReused
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setStartTime:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasStartTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setResponseReceivedDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_responseReceivedDuration = a3;
}

- (void)setHasResponseReceivedDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasResponseReceivedDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHttpStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_httpStatus = a3;
}

- (void)setHasHttpStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHttpStatus
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRequestSize:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_requestSize = a3;
}

- (void)setHasRequestSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRequestSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setResponseSize:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_responseSize = a3;
}

- (void)setHasResponseSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasResponseSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTransactionComplete:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_transactionComplete = a3;
}

- (void)setHasTransactionComplete:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTransactionComplete
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTimedOut:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_timedOut = a3;
}

- (void)setHasTimedOut:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTimedOut
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCancelled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasCancelled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)clearTcpInfos
{
  -[NSMutableArray removeAllObjects](self->_tcpInfos, "removeAllObjects");
}

- (void)addTcpInfo:(id)a3
{
  NSMutableArray *tcpInfos;

  tcpInfos = self->_tcpInfos;
  if (!tcpInfos)
  {
    tcpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_tcpInfos = tcpInfos;
  }
  -[NSMutableArray addObject:](tcpInfos, "addObject:", a3);
}

- (unint64_t)tcpInfosCount
{
  return -[NSMutableArray count](self->_tcpInfos, "count");
}

- (id)tcpInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tcpInfos, "objectAtIndex:", a3);
}

+ (Class)tcpInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearHttpErrors
{
  -[NSMutableArray removeAllObjects](self->_httpErrors, "removeAllObjects");
}

- (void)addHttpError:(id)a3
{
  NSMutableArray *httpErrors;

  httpErrors = self->_httpErrors;
  if (!httpErrors)
  {
    httpErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_httpErrors = httpErrors;
  }
  -[NSMutableArray addObject:](httpErrors, "addObject:", a3);
}

- (unint64_t)httpErrorsCount
{
  return -[NSMutableArray count](self->_httpErrors, "count");
}

- (id)httpErrorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_httpErrors, "objectAtIndex:", a3);
}

+ (Class)httpErrorType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInterfaceIdentifier
{
  return self->_interfaceIdentifier != 0;
}

- (BOOL)hasLocatorPeerAddress
{
  return self->_locatorPeerAddress != 0;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_requiresPowerPluggedIn = a3;
}

- (void)setHasRequiresPowerPluggedIn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasRequiresPowerPluggedIn
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setAllowsPowerNapScheduling:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_allowsPowerNapScheduling = a3;
}

- (void)setHasAllowsPowerNapScheduling:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAllowsPowerNapScheduling
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAllowsCellular:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_allowsCellular = a3;
}

- (void)setHasAllowsCellular:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAllowsCellular
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setForceNondiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_forceNondiscretionary = a3;
}

- (void)setHasForceNondiscretionary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasForceNondiscretionary
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setFastFail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_fastFail = a3;
}

- (void)setHasFastFail:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasFastFail
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setQualityOfService:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_qualityOfService = a3;
}

- (void)setHasQualityOfService:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasQualityOfService
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProxyUsed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_proxyUsed = a3;
}

- (void)setHasProxyUsed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasProxyUsed
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setFinalTryInRequest:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_finalTryInRequest = a3;
}

- (void)setHasFinalTryInRequest:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasFinalTryInRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setInlineEdgeComplete:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_inlineEdgeComplete = a3;
}

- (void)setHasInlineEdgeComplete:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasInlineEdgeComplete
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAdaptiveTcpReadTimeout:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_adaptiveTcpReadTimeout = a3;
}

- (void)setHasAdaptiveTcpReadTimeout:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAdaptiveTcpReadTimeout
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAdaptiveTcpWriteTimeout:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_adaptiveTcpWriteTimeout = a3;
}

- (void)setHasAdaptiveTcpWriteTimeout:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAdaptiveTcpWriteTimeout
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPowerPluggedInWhenQueued:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_powerPluggedInWhenQueued = a3;
}

- (void)setHasPowerPluggedInWhenQueued:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasPowerPluggedInWhenQueued
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPowerPluggedInAtStart:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_powerPluggedInAtStart = a3;
}

- (void)setHasPowerPluggedInAtStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasPowerPluggedInAtStart
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPowerPluggedInAtEnd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_powerPluggedInAtEnd = a3;
}

- (void)setHasPowerPluggedInAtEnd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasPowerPluggedInAtEnd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasNetworkUsed
{
  return self->_networkUsed != 0;
}

- (void)setNetworkServiceType:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_networkServiceType = a3;
}

- (void)setHasNetworkServiceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($A066514945FF1DC5778C75FAFFDDB194)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNetworkServiceType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSHttpInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMMCSHttpInfo description](&v3, sel_description), -[AWDMMCSHttpInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *locatorScheme;
  NSString *locatorHostname;
  $A066514945FF1DC5778C75FAFFDDB194 has;
  NSString *errorDomain;
  $A066514945FF1DC5778C75FAFFDDB194 v9;
  void *v10;
  NSMutableArray *tcpInfos;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *httpErrors;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSString *interfaceIdentifier;
  NSString *locatorPeerAddress;
  $A066514945FF1DC5778C75FAFFDDB194 v24;
  NSString *networkUsed;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  locatorScheme = self->_locatorScheme;
  if (locatorScheme)
    objc_msgSend(v3, "setObject:forKey:", locatorScheme, CFSTR("locatorScheme"));
  locatorHostname = self->_locatorHostname;
  if (locatorHostname)
    objc_msgSend(v4, "setObject:forKey:", locatorHostname, CFSTR("locatorHostname"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_locatorPort), CFSTR("locatorPort"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_8;
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_connectionReused), CFSTR("connectionReused"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_startTime), CFSTR("startTime"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_responseReceivedDuration), CFSTR("responseReceivedDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_67:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_duration), CFSTR("duration"));
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_11:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_httpStatus), CFSTR("httpStatus"));
LABEL_12:
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v4, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode), CFSTR("errorCode"));
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v9 & 0x800) == 0)
        goto LABEL_17;
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&v9 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_requestSize), CFSTR("requestSize"));
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v9 & 0x4000000) == 0)
      goto LABEL_18;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_responseSize), CFSTR("responseSize"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0)
      goto LABEL_19;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_transactionComplete), CFSTR("transactionComplete"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v9 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_73:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_timedOut), CFSTR("timedOut"));
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
LABEL_20:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cancelled), CFSTR("cancelled"));
LABEL_21:
  if (-[NSMutableArray count](self->_tcpInfos, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_tcpInfos, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    tcpInfos = self->_tcpInfos;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpInfos, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(tcpInfos);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpInfos, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v13);
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("tcpInfo"));

  }
  if (-[NSMutableArray count](self->_httpErrors, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_httpErrors, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    httpErrors = self->_httpErrors;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](httpErrors, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(httpErrors);
          objc_msgSend(v16, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](httpErrors, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v19);
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("httpError"));

  }
  interfaceIdentifier = self->_interfaceIdentifier;
  if (interfaceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", interfaceIdentifier, CFSTR("interfaceIdentifier"));
  locatorPeerAddress = self->_locatorPeerAddress;
  if (locatorPeerAddress)
    objc_msgSend(v4, "setObject:forKey:", locatorPeerAddress, CFSTR("locatorPeerAddress"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x1000000) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_requiresPowerPluggedIn), CFSTR("requiresPowerPluggedIn"));
    v24 = self->_has;
    if ((*(_WORD *)&v24 & 0x2000) == 0)
    {
LABEL_45:
      if ((*(_WORD *)&v24 & 0x1000) == 0)
        goto LABEL_46;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v24 & 0x2000) == 0)
  {
    goto LABEL_45;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsPowerNapScheduling), CFSTR("allowsPowerNapScheduling"));
  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x1000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v24 & 0x40000) == 0)
      goto LABEL_47;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsCellular), CFSTR("allowsCellular"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x40000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v24 & 0x10000) == 0)
      goto LABEL_48;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_forceNondiscretionary), CFSTR("forceNondiscretionary"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x10000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v24 & 0x200) == 0)
      goto LABEL_49;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fastFail), CFSTR("fastFail"));
  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x200) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v24 & 0x800000) == 0)
      goto LABEL_50;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_qualityOfService), CFSTR("qualityOfService"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x800000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v24 & 0x20000) == 0)
      goto LABEL_51;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_proxyUsed), CFSTR("proxyUsed"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x20000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v24 & 0x80000) == 0)
      goto LABEL_52;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_finalTryInRequest), CFSTR("finalTryInRequest"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x80000) == 0)
  {
LABEL_52:
    if ((*(_BYTE *)&v24 & 0x10) == 0)
      goto LABEL_53;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_inlineEdgeComplete), CFSTR("inlineEdgeComplete"));
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 0x10) == 0)
  {
LABEL_53:
    if ((*(_BYTE *)&v24 & 0x20) == 0)
      goto LABEL_54;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_adaptiveTcpReadTimeout), CFSTR("adaptiveTcpReadTimeout"));
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 0x20) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v24 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_adaptiveTcpWriteTimeout), CFSTR("adaptiveTcpWriteTimeout"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x400000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v24 & 0x200000) == 0)
      goto LABEL_56;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_powerPluggedInWhenQueued), CFSTR("powerPluggedInWhenQueued"));
  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x200000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v24 & 0x100000) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_87:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_powerPluggedInAtStart), CFSTR("powerPluggedInAtStart"));
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
LABEL_57:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_powerPluggedInAtEnd), CFSTR("powerPluggedInAtEnd"));
LABEL_58:
  networkUsed = self->_networkUsed;
  if (networkUsed)
    objc_msgSend(v4, "setObject:forKey:", networkUsed, CFSTR("networkUsed"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_networkServiceType), CFSTR("networkServiceType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSHttpInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $A066514945FF1DC5778C75FAFFDDB194 has;
  $A066514945FF1DC5778C75FAFFDDB194 v5;
  NSMutableArray *tcpInfos;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *httpErrors;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  $A066514945FF1DC5778C75FAFFDDB194 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_locatorScheme)
    PBDataWriterWriteStringField();
  if (self->_locatorHostname)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_8;
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_63:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v5 & 0x800) == 0)
        goto LABEL_17;
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&v5 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt32Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v5 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
LABEL_20:
    PBDataWriterWriteBOOLField();
LABEL_21:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  tcpInfos = self->_tcpInfos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpInfos, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(tcpInfos);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpInfos, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  httpErrors = self->_httpErrors;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](httpErrors, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(httpErrors);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](httpErrors, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }
  if (self->_interfaceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_locatorPeerAddress)
    PBDataWriterWriteStringField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x2000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v16 & 0x1000) == 0)
        goto LABEL_42;
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v16 & 0x40000) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v16 & 0x10000) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x10000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v16 & 0x200) == 0)
      goto LABEL_45;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v16 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v16 & 0x20000) == 0)
      goto LABEL_47;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v16 & 0x80000) == 0)
      goto LABEL_48;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x80000) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v16 & 0x10) == 0)
      goto LABEL_49;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x10) == 0)
  {
LABEL_49:
    if ((*(_BYTE *)&v16 & 0x20) == 0)
      goto LABEL_50;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x20) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v16 & 0x400000) == 0)
      goto LABEL_51;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x400000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
      goto LABEL_52;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v16 & 0x100000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
LABEL_53:
    PBDataWriterWriteBOOLField();
LABEL_54:
  if (self->_networkUsed)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
}

- (void)copyTo:(id)a3
{
  $A066514945FF1DC5778C75FAFFDDB194 has;
  $A066514945FF1DC5778C75FAFFDDB194 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  $A066514945FF1DC5778C75FAFFDDB194 v13;

  if (self->_locatorScheme)
    objc_msgSend(a3, "setLocatorScheme:");
  if (self->_locatorHostname)
    objc_msgSend(a3, "setLocatorHostname:");
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_locatorPort;
    *((_DWORD *)a3 + 42) |= 0x100u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_8;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)a3 + 155) = self->_connectionReused;
  *((_DWORD *)a3 + 42) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 4) = self->_startTime;
  *((_DWORD *)a3 + 42) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 3) = self->_responseReceivedDuration;
  *((_DWORD *)a3 + 42) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_57:
  *((_QWORD *)a3 + 1) = self->_duration;
  *((_DWORD *)a3 + 42) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 18) = self->_httpStatus;
    *((_DWORD *)a3 + 42) |= 0x80u;
  }
LABEL_12:
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_errorCode;
    *((_DWORD *)a3 + 42) |= 0x40u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v6 & 0x800) == 0)
        goto LABEL_17;
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 33) = self->_requestSize;
  *((_DWORD *)a3 + 42) |= 0x400u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 34) = self->_responseSize;
  *((_DWORD *)a3 + 42) |= 0x800u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
      goto LABEL_19;
LABEL_63:
    *((_BYTE *)a3 + 165) = self->_timedOut;
    *((_DWORD *)a3 + 42) |= 0x2000000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_62:
  *((_BYTE *)a3 + 166) = self->_transactionComplete;
  *((_DWORD *)a3 + 42) |= 0x4000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
    goto LABEL_63;
LABEL_19:
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
LABEL_20:
    *((_BYTE *)a3 + 154) = self->_cancelled;
    *((_DWORD *)a3 + 42) |= 0x4000u;
  }
LABEL_21:
  if (-[AWDMMCSHttpInfo tcpInfosCount](self, "tcpInfosCount"))
  {
    objc_msgSend(a3, "clearTcpInfos");
    v7 = -[AWDMMCSHttpInfo tcpInfosCount](self, "tcpInfosCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addTcpInfo:", -[AWDMMCSHttpInfo tcpInfoAtIndex:](self, "tcpInfoAtIndex:", i));
    }
  }
  if (-[AWDMMCSHttpInfo httpErrorsCount](self, "httpErrorsCount"))
  {
    objc_msgSend(a3, "clearHttpErrors");
    v10 = -[AWDMMCSHttpInfo httpErrorsCount](self, "httpErrorsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addHttpError:", -[AWDMMCSHttpInfo httpErrorAtIndex:](self, "httpErrorAtIndex:", j));
    }
  }
  if (self->_interfaceIdentifier)
    objc_msgSend(a3, "setInterfaceIdentifier:");
  if (self->_locatorPeerAddress)
    objc_msgSend(a3, "setLocatorPeerAddress:");
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
    *((_BYTE *)a3 + 164) = self->_requiresPowerPluggedIn;
    *((_DWORD *)a3 + 42) |= 0x1000000u;
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_35:
      if ((*(_WORD *)&v13 & 0x1000) == 0)
        goto LABEL_36;
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_35;
  }
  *((_BYTE *)a3 + 153) = self->_allowsPowerNapScheduling;
  *((_DWORD *)a3 + 42) |= 0x2000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_37;
    goto LABEL_68;
  }
LABEL_67:
  *((_BYTE *)a3 + 152) = self->_allowsCellular;
  *((_DWORD *)a3 + 42) |= 0x1000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
      goto LABEL_38;
    goto LABEL_69;
  }
LABEL_68:
  *((_BYTE *)a3 + 158) = self->_forceNondiscretionary;
  *((_DWORD *)a3 + 42) |= 0x40000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v13 & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_70;
  }
LABEL_69:
  *((_BYTE *)a3 + 156) = self->_fastFail;
  *((_DWORD *)a3 + 42) |= 0x10000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v13 & 0x800000) == 0)
      goto LABEL_40;
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)a3 + 32) = self->_qualityOfService;
  *((_DWORD *)a3 + 42) |= 0x200u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
      goto LABEL_41;
    goto LABEL_72;
  }
LABEL_71:
  *((_BYTE *)a3 + 163) = self->_proxyUsed;
  *((_DWORD *)a3 + 42) |= 0x800000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x80000) == 0)
      goto LABEL_42;
    goto LABEL_73;
  }
LABEL_72:
  *((_BYTE *)a3 + 157) = self->_finalTryInRequest;
  *((_DWORD *)a3 + 42) |= 0x20000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&v13 & 0x10) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  *((_BYTE *)a3 + 159) = self->_inlineEdgeComplete;
  *((_DWORD *)a3 + 42) |= 0x80000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 10) = self->_adaptiveTcpReadTimeout;
  *((_DWORD *)a3 + 42) |= 0x10u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
      goto LABEL_45;
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 11) = self->_adaptiveTcpWriteTimeout;
  *((_DWORD *)a3 + 42) |= 0x20u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
      goto LABEL_46;
    goto LABEL_77;
  }
LABEL_76:
  *((_BYTE *)a3 + 162) = self->_powerPluggedInWhenQueued;
  *((_DWORD *)a3 + 42) |= 0x400000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v13 & 0x100000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_77:
  *((_BYTE *)a3 + 161) = self->_powerPluggedInAtStart;
  *((_DWORD *)a3 + 42) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_47:
    *((_BYTE *)a3 + 160) = self->_powerPluggedInAtEnd;
    *((_DWORD *)a3 + 42) |= 0x100000u;
  }
LABEL_48:
  if (self->_networkUsed)
    objc_msgSend(a3, "setNetworkUsed:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_networkServiceType;
    *((_DWORD *)a3 + 42) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  $A066514945FF1DC5778C75FAFFDDB194 has;
  $A066514945FF1DC5778C75FAFFDDB194 v7;
  NSMutableArray *tcpInfos;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *httpErrors;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  $A066514945FF1DC5778C75FAFFDDB194 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 112) = -[NSString copyWithZone:](self->_locatorScheme, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_locatorHostname, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_locatorPort;
    *(_DWORD *)(v5 + 168) |= 0x100u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 155) = self->_connectionReused;
  *(_DWORD *)(v5 + 168) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  *(_QWORD *)(v5 + 32) = self->_startTime;
  *(_DWORD *)(v5 + 168) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  *(_QWORD *)(v5 + 24) = self->_responseReceivedDuration;
  *(_DWORD *)(v5 + 168) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_51:
  *(_QWORD *)(v5 + 8) = self->_duration;
  *(_DWORD *)(v5 + 168) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 72) = self->_httpStatus;
    *(_DWORD *)(v5 + 168) |= 0x80u;
  }
LABEL_8:

  *(_QWORD *)(v5 + 56) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_errorCode;
    *(_DWORD *)(v5 + 168) |= 0x40u;
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x400) == 0)
    {
LABEL_10:
      if ((*(_WORD *)&v7 & 0x800) == 0)
        goto LABEL_11;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v7 & 0x400) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 132) = self->_requestSize;
  *(_DWORD *)(v5 + 168) |= 0x400u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 136) = self->_responseSize;
  *(_DWORD *)(v5 + 168) |= 0x800u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  *(_BYTE *)(v5 + 166) = self->_transactionComplete;
  *(_DWORD *)(v5 + 168) |= 0x4000000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_57:
  *(_BYTE *)(v5 + 165) = self->_timedOut;
  *(_DWORD *)(v5 + 168) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_14:
    *(_BYTE *)(v5 + 154) = self->_cancelled;
    *(_DWORD *)(v5 + 168) |= 0x4000u;
  }
LABEL_15:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  tcpInfos = self->_tcpInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpInfos, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(tcpInfos);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTcpInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tcpInfos, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  httpErrors = self->_httpErrors;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](httpErrors, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(httpErrors);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addHttpError:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](httpErrors, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_interfaceIdentifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = -[NSString copyWithZone:](self->_locatorPeerAddress, "copyWithZone:", a3);
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x1000000) != 0)
  {
    *(_BYTE *)(v5 + 164) = self->_requiresPowerPluggedIn;
    *(_DWORD *)(v5 + 168) |= 0x1000000u;
    v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x2000) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v20 & 0x1000) == 0)
        goto LABEL_32;
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
    goto LABEL_31;
  }
  *(_BYTE *)(v5 + 153) = self->_allowsPowerNapScheduling;
  *(_DWORD *)(v5 + 168) |= 0x2000u;
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x1000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v20 & 0x40000) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  *(_BYTE *)(v5 + 152) = self->_allowsCellular;
  *(_DWORD *)(v5 + 168) |= 0x1000u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v20 & 0x10000) == 0)
      goto LABEL_34;
    goto LABEL_63;
  }
LABEL_62:
  *(_BYTE *)(v5 + 158) = self->_forceNondiscretionary;
  *(_DWORD *)(v5 + 168) |= 0x40000u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v20 & 0x200) == 0)
      goto LABEL_35;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v5 + 156) = self->_fastFail;
  *(_DWORD *)(v5 + 168) |= 0x10000u;
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v20 & 0x800000) == 0)
      goto LABEL_36;
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v5 + 128) = self->_qualityOfService;
  *(_DWORD *)(v5 + 168) |= 0x200u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x800000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v20 & 0x20000) == 0)
      goto LABEL_37;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 163) = self->_proxyUsed;
  *(_DWORD *)(v5 + 168) |= 0x800000u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v20 & 0x80000) == 0)
      goto LABEL_38;
    goto LABEL_67;
  }
LABEL_66:
  *(_BYTE *)(v5 + 157) = self->_finalTryInRequest;
  *(_DWORD *)(v5 + 168) |= 0x20000u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&v20 & 0x10) == 0)
      goto LABEL_39;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v5 + 159) = self->_inlineEdgeComplete;
  *(_DWORD *)(v5 + 168) |= 0x80000u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x10) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&v20 & 0x20) == 0)
      goto LABEL_40;
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v5 + 40) = self->_adaptiveTcpReadTimeout;
  *(_DWORD *)(v5 + 168) |= 0x10u;
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 0x20) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v20 & 0x400000) == 0)
      goto LABEL_41;
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v5 + 44) = self->_adaptiveTcpWriteTimeout;
  *(_DWORD *)(v5 + 168) |= 0x20u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x400000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v20 & 0x200000) == 0)
      goto LABEL_42;
    goto LABEL_71;
  }
LABEL_70:
  *(_BYTE *)(v5 + 162) = self->_powerPluggedInWhenQueued;
  *(_DWORD *)(v5 + 168) |= 0x400000u;
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x200000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v20 & 0x100000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_71:
  *(_BYTE *)(v5 + 161) = self->_powerPluggedInAtStart;
  *(_DWORD *)(v5 + 168) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_43:
    *(_BYTE *)(v5 + 160) = self->_powerPluggedInAtEnd;
    *(_DWORD *)(v5 + 168) |= 0x100000u;
  }
LABEL_44:

  *(_QWORD *)(v5 + 120) = -[NSString copyWithZone:](self->_networkUsed, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_networkServiceType;
    *(_DWORD *)(v5 + 168) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *locatorScheme;
  NSString *locatorHostname;
  $A066514945FF1DC5778C75FAFFDDB194 has;
  int v9;
  NSString *errorDomain;
  int v11;
  NSMutableArray *tcpInfos;
  NSMutableArray *httpErrors;
  NSString *interfaceIdentifier;
  NSString *locatorPeerAddress;
  $A066514945FF1DC5778C75FAFFDDB194 v16;
  int v17;
  NSString *networkUsed;
  int v19;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  locatorScheme = self->_locatorScheme;
  if ((unint64_t)locatorScheme | *((_QWORD *)a3 + 14))
  {
    v5 = -[NSString isEqual:](locatorScheme, "isEqual:");
    if (!v5)
      return v5;
  }
  locatorHostname = self->_locatorHostname;
  if ((unint64_t)locatorHostname | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSString isEqual:](locatorHostname, "isEqual:");
    if (!v5)
      return v5;
  }
  has = self->_has;
  v9 = *((_DWORD *)a3 + 42);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_locatorPort != *((_DWORD *)a3 + 26))
      goto LABEL_77;
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0)
      goto LABEL_77;
    if (self->_connectionReused)
    {
      if (!*((_BYTE *)a3 + 155))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 155))
    {
      goto LABEL_77;
    }
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_startTime != *((_QWORD *)a3 + 4))
      goto LABEL_77;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_responseReceivedDuration != *((_QWORD *)a3 + 3))
      goto LABEL_77;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
      goto LABEL_77;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_httpStatus != *((_DWORD *)a3 + 18))
      goto LABEL_77;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)a3 + 7))
  {
    v5 = -[NSString isEqual:](errorDomain, "isEqual:");
    if (!v5)
      return v5;
    has = self->_has;
  }
  v11 = *((_DWORD *)a3 + 42);
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_errorCode != *((_DWORD *)a3 + 12))
      goto LABEL_77;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0 || self->_requestSize != *((_DWORD *)a3 + 33))
      goto LABEL_77;
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_responseSize != *((_DWORD *)a3 + 34))
      goto LABEL_77;
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0)
      goto LABEL_77;
    if (self->_transactionComplete)
    {
      if (!*((_BYTE *)a3 + 166))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 166))
    {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v11 & 0x2000000) == 0)
      goto LABEL_77;
    if (self->_timedOut)
    {
      if (!*((_BYTE *)a3 + 165))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 165))
    {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x2000000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0)
      goto LABEL_77;
    if (self->_cancelled)
    {
      if (!*((_BYTE *)a3 + 154))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 154))
    {
      goto LABEL_77;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_77;
  }
  tcpInfos = self->_tcpInfos;
  if ((unint64_t)tcpInfos | *((_QWORD *)a3 + 18))
  {
    v5 = -[NSMutableArray isEqual:](tcpInfos, "isEqual:");
    if (!v5)
      return v5;
  }
  httpErrors = self->_httpErrors;
  if ((unint64_t)httpErrors | *((_QWORD *)a3 + 8))
  {
    v5 = -[NSMutableArray isEqual:](httpErrors, "isEqual:");
    if (!v5)
      return v5;
  }
  interfaceIdentifier = self->_interfaceIdentifier;
  if ((unint64_t)interfaceIdentifier | *((_QWORD *)a3 + 10))
  {
    v5 = -[NSString isEqual:](interfaceIdentifier, "isEqual:");
    if (!v5)
      return v5;
  }
  locatorPeerAddress = self->_locatorPeerAddress;
  if ((unint64_t)locatorPeerAddress | *((_QWORD *)a3 + 12))
  {
    v5 = -[NSString isEqual:](locatorPeerAddress, "isEqual:");
    if (!v5)
      return v5;
  }
  v16 = self->_has;
  v17 = *((_DWORD *)a3 + 42);
  if ((*(_DWORD *)&v16 & 0x1000000) != 0)
  {
    if ((v17 & 0x1000000) == 0)
      goto LABEL_77;
    if (self->_requiresPowerPluggedIn)
    {
      if (!*((_BYTE *)a3 + 164))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 164))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x1000000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&v16 & 0x2000) != 0)
  {
    if ((v17 & 0x2000) == 0)
      goto LABEL_77;
    if (self->_allowsPowerNapScheduling)
    {
      if (!*((_BYTE *)a3 + 153))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 153))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x2000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0)
      goto LABEL_77;
    if (self->_allowsCellular)
    {
      if (!*((_BYTE *)a3 + 152))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 152))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x40000) != 0)
  {
    if ((v17 & 0x40000) == 0)
      goto LABEL_77;
    if (self->_forceNondiscretionary)
    {
      if (!*((_BYTE *)a3 + 158))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 158))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x40000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    if ((v17 & 0x10000) == 0)
      goto LABEL_77;
    if (self->_fastFail)
    {
      if (!*((_BYTE *)a3 + 156))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 156))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x10000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_qualityOfService != *((_DWORD *)a3 + 32))
      goto LABEL_77;
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x800000) != 0)
  {
    if ((v17 & 0x800000) == 0)
      goto LABEL_77;
    if (self->_proxyUsed)
    {
      if (!*((_BYTE *)a3 + 163))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 163))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x800000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    if ((v17 & 0x20000) == 0)
      goto LABEL_77;
    if (self->_finalTryInRequest)
    {
      if (!*((_BYTE *)a3 + 157))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 157))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x20000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    if ((v17 & 0x80000) == 0)
      goto LABEL_77;
    if (self->_inlineEdgeComplete)
    {
      if (!*((_BYTE *)a3 + 159))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 159))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x80000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_adaptiveTcpReadTimeout != *((_DWORD *)a3 + 10))
      goto LABEL_77;
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_BYTE *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_adaptiveTcpWriteTimeout != *((_DWORD *)a3 + 11))
      goto LABEL_77;
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x400000) != 0)
  {
    if ((v17 & 0x400000) == 0)
      goto LABEL_77;
    if (self->_powerPluggedInWhenQueued)
    {
      if (!*((_BYTE *)a3 + 162))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 162))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x400000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0)
      goto LABEL_77;
    if (self->_powerPluggedInAtStart)
    {
      if (!*((_BYTE *)a3 + 161))
        goto LABEL_77;
    }
    else if (*((_BYTE *)a3 + 161))
    {
      goto LABEL_77;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_DWORD *)&v16 & 0x100000) == 0)
  {
    if ((v17 & 0x100000) == 0)
      goto LABEL_194;
LABEL_77:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v17 & 0x100000) == 0)
    goto LABEL_77;
  if (self->_powerPluggedInAtEnd)
  {
    if (!*((_BYTE *)a3 + 160))
      goto LABEL_77;
    goto LABEL_194;
  }
  if (*((_BYTE *)a3 + 160))
    goto LABEL_77;
LABEL_194:
  networkUsed = self->_networkUsed;
  if ((unint64_t)networkUsed | *((_QWORD *)a3 + 15))
  {
    v5 = -[NSString isEqual:](networkUsed, "isEqual:");
    if (!v5)
      return v5;
    v16 = self->_has;
  }
  v19 = *((_DWORD *)a3 + 42);
  LOBYTE(v5) = (v19 & 2) == 0;
  if ((*(_BYTE *)&v16 & 2) == 0)
    return v5;
  if ((v19 & 2) == 0 || self->_networkServiceType != *((_QWORD *)a3 + 2))
    goto LABEL_77;
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  $A066514945FF1DC5778C75FAFFDDB194 has;
  $A066514945FF1DC5778C75FAFFDDB194 v4;
  $A066514945FF1DC5778C75FAFFDDB194 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  NSUInteger v41;

  v41 = -[NSString hash](self->_locatorScheme, "hash");
  v40 = -[NSString hash](self->_locatorHostname, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    v39 = 2654435761 * self->_locatorPort;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      v38 = 2654435761 * self->_connectionReused;
      if ((*(_BYTE *)&has & 8) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v39 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_3;
  }
  v38 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_4:
    v37 = 2654435761 * self->_startTime;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v37 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_5:
    v36 = 2654435761 * self->_responseReceivedDuration;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v35 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v36 = 0;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_12;
LABEL_6:
  v35 = 2654435761 * self->_duration;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_7:
    v34 = 2654435761 * self->_httpStatus;
    goto LABEL_14;
  }
LABEL_13:
  v34 = 0;
LABEL_14:
  v33 = -[NSString hash](self->_errorDomain, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
    v32 = 2654435761 * self->_errorCode;
    if ((*(_WORD *)&v4 & 0x400) != 0)
    {
LABEL_16:
      v31 = 2654435761 * self->_requestSize;
      if ((*(_WORD *)&v4 & 0x800) != 0)
        goto LABEL_17;
      goto LABEL_23;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_16;
  }
  v31 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_17:
    v30 = 2654435761 * self->_responseSize;
    if ((*(_DWORD *)&v4 & 0x4000000) != 0)
      goto LABEL_18;
    goto LABEL_24;
  }
LABEL_23:
  v30 = 0;
  if ((*(_DWORD *)&v4 & 0x4000000) != 0)
  {
LABEL_18:
    v29 = 2654435761 * self->_transactionComplete;
    if ((*(_DWORD *)&v4 & 0x2000000) != 0)
      goto LABEL_19;
LABEL_25:
    v28 = 0;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_20;
    goto LABEL_26;
  }
LABEL_24:
  v29 = 0;
  if ((*(_DWORD *)&v4 & 0x2000000) == 0)
    goto LABEL_25;
LABEL_19:
  v28 = 2654435761 * self->_timedOut;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_20:
    v27 = 2654435761 * self->_cancelled;
    goto LABEL_27;
  }
LABEL_26:
  v27 = 0;
LABEL_27:
  v26 = -[NSMutableArray hash](self->_tcpInfos, "hash");
  v25 = -[NSMutableArray hash](self->_httpErrors, "hash");
  v24 = -[NSString hash](self->_interfaceIdentifier, "hash");
  v23 = -[NSString hash](self->_locatorPeerAddress, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) != 0)
  {
    v22 = 2654435761 * self->_requiresPowerPluggedIn;
    if ((*(_WORD *)&v5 & 0x2000) != 0)
    {
LABEL_29:
      v21 = 2654435761 * self->_allowsPowerNapScheduling;
      if ((*(_WORD *)&v5 & 0x1000) != 0)
        goto LABEL_30;
      goto LABEL_44;
    }
  }
  else
  {
    v22 = 0;
    if ((*(_WORD *)&v5 & 0x2000) != 0)
      goto LABEL_29;
  }
  v21 = 0;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_30:
    v20 = 2654435761 * self->_allowsCellular;
    if ((*(_DWORD *)&v5 & 0x40000) != 0)
      goto LABEL_31;
    goto LABEL_45;
  }
LABEL_44:
  v20 = 0;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
LABEL_31:
    v19 = 2654435761 * self->_forceNondiscretionary;
    if ((*(_DWORD *)&v5 & 0x10000) != 0)
      goto LABEL_32;
    goto LABEL_46;
  }
LABEL_45:
  v19 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_32:
    v18 = 2654435761 * self->_fastFail;
    if ((*(_WORD *)&v5 & 0x200) != 0)
      goto LABEL_33;
    goto LABEL_47;
  }
LABEL_46:
  v18 = 0;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
LABEL_33:
    v17 = 2654435761 * self->_qualityOfService;
    if ((*(_DWORD *)&v5 & 0x800000) != 0)
      goto LABEL_34;
    goto LABEL_48;
  }
LABEL_47:
  v17 = 0;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_34:
    v16 = 2654435761 * self->_proxyUsed;
    if ((*(_DWORD *)&v5 & 0x20000) != 0)
      goto LABEL_35;
    goto LABEL_49;
  }
LABEL_48:
  v16 = 0;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
LABEL_35:
    v6 = 2654435761 * self->_finalTryInRequest;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
      goto LABEL_36;
    goto LABEL_50;
  }
LABEL_49:
  v6 = 0;
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
LABEL_36:
    v7 = 2654435761 * self->_inlineEdgeComplete;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
      goto LABEL_37;
    goto LABEL_51;
  }
LABEL_50:
  v7 = 0;
  if ((*(_BYTE *)&v5 & 0x10) != 0)
  {
LABEL_37:
    v8 = 2654435761 * self->_adaptiveTcpReadTimeout;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_38;
    goto LABEL_52;
  }
LABEL_51:
  v8 = 0;
  if ((*(_BYTE *)&v5 & 0x20) != 0)
  {
LABEL_38:
    v9 = 2654435761 * self->_adaptiveTcpWriteTimeout;
    if ((*(_DWORD *)&v5 & 0x400000) != 0)
      goto LABEL_39;
    goto LABEL_53;
  }
LABEL_52:
  v9 = 0;
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
LABEL_39:
    v10 = 2654435761 * self->_powerPluggedInWhenQueued;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
      goto LABEL_40;
LABEL_54:
    v11 = 0;
    if ((*(_DWORD *)&v5 & 0x100000) != 0)
      goto LABEL_41;
    goto LABEL_55;
  }
LABEL_53:
  v10 = 0;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
    goto LABEL_54;
LABEL_40:
  v11 = 2654435761 * self->_powerPluggedInAtStart;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
LABEL_41:
    v12 = 2654435761 * self->_powerPluggedInAtEnd;
    goto LABEL_56;
  }
LABEL_55:
  v12 = 0;
LABEL_56:
  v13 = -[NSString hash](self->_networkUsed, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v14 = 2654435761 * self->_networkServiceType;
  else
    v14 = 0;
  return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)a3 + 14))
    -[AWDMMCSHttpInfo setLocatorScheme:](self, "setLocatorScheme:");
  if (*((_QWORD *)a3 + 11))
    -[AWDMMCSHttpInfo setLocatorHostname:](self, "setLocatorHostname:");
  v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 0x100) != 0)
  {
    self->_locatorPort = *((_DWORD *)a3 + 26);
    *(_DWORD *)&self->_has |= 0x100u;
    v5 = *((_DWORD *)a3 + 42);
    if ((v5 & 0x8000) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_61;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_7;
  }
  self->_connectionReused = *((_BYTE *)a3 + 155);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_62;
  }
LABEL_61:
  self->_startTime = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_63;
  }
LABEL_62:
  self->_responseReceivedDuration = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_63:
  self->_duration = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)a3 + 42) & 0x80) != 0)
  {
LABEL_11:
    self->_httpStatus = *((_DWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_12:
  if (*((_QWORD *)a3 + 7))
    -[AWDMMCSHttpInfo setErrorDomain:](self, "setErrorDomain:");
  v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x40) != 0)
  {
    self->_errorCode = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x40u;
    v6 = *((_DWORD *)a3 + 42);
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x800) == 0)
        goto LABEL_17;
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  self->_requestSize = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x800) == 0)
  {
LABEL_17:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  self->_responseSize = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_18:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  self->_transactionComplete = *((_BYTE *)a3 + 166);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v6 = *((_DWORD *)a3 + 42);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_19:
    if ((v6 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_69:
  self->_timedOut = *((_BYTE *)a3 + 165);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)a3 + 42) & 0x4000) != 0)
  {
LABEL_20:
    self->_cancelled = *((_BYTE *)a3 + 154);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_21:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 18);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[AWDMMCSHttpInfo addTcpInfo:](self, "addTcpInfo:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[AWDMMCSHttpInfo addHttpError:](self, "addHttpError:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }
  if (*((_QWORD *)a3 + 10))
    -[AWDMMCSHttpInfo setInterfaceIdentifier:](self, "setInterfaceIdentifier:");
  if (*((_QWORD *)a3 + 12))
    -[AWDMMCSHttpInfo setLocatorPeerAddress:](self, "setLocatorPeerAddress:");
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x1000000) != 0)
  {
    self->_requiresPowerPluggedIn = *((_BYTE *)a3 + 164);
    *(_DWORD *)&self->_has |= 0x1000000u;
    v17 = *((_DWORD *)a3 + 42);
    if ((v17 & 0x2000) == 0)
    {
LABEL_41:
      if ((v17 & 0x1000) == 0)
        goto LABEL_42;
      goto LABEL_73;
    }
  }
  else if ((v17 & 0x2000) == 0)
  {
    goto LABEL_41;
  }
  self->_allowsPowerNapScheduling = *((_BYTE *)a3 + 153);
  *(_DWORD *)&self->_has |= 0x2000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x1000) == 0)
  {
LABEL_42:
    if ((v17 & 0x40000) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  self->_allowsCellular = *((_BYTE *)a3 + 152);
  *(_DWORD *)&self->_has |= 0x1000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x40000) == 0)
  {
LABEL_43:
    if ((v17 & 0x10000) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  self->_forceNondiscretionary = *((_BYTE *)a3 + 158);
  *(_DWORD *)&self->_has |= 0x40000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x10000) == 0)
  {
LABEL_44:
    if ((v17 & 0x200) == 0)
      goto LABEL_45;
    goto LABEL_76;
  }
LABEL_75:
  self->_fastFail = *((_BYTE *)a3 + 156);
  *(_DWORD *)&self->_has |= 0x10000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x200) == 0)
  {
LABEL_45:
    if ((v17 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_77;
  }
LABEL_76:
  self->_qualityOfService = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x200u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x800000) == 0)
  {
LABEL_46:
    if ((v17 & 0x20000) == 0)
      goto LABEL_47;
    goto LABEL_78;
  }
LABEL_77:
  self->_proxyUsed = *((_BYTE *)a3 + 163);
  *(_DWORD *)&self->_has |= 0x800000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x20000) == 0)
  {
LABEL_47:
    if ((v17 & 0x80000) == 0)
      goto LABEL_48;
    goto LABEL_79;
  }
LABEL_78:
  self->_finalTryInRequest = *((_BYTE *)a3 + 157);
  *(_DWORD *)&self->_has |= 0x20000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x80000) == 0)
  {
LABEL_48:
    if ((v17 & 0x10) == 0)
      goto LABEL_49;
    goto LABEL_80;
  }
LABEL_79:
  self->_inlineEdgeComplete = *((_BYTE *)a3 + 159);
  *(_DWORD *)&self->_has |= 0x80000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x10) == 0)
  {
LABEL_49:
    if ((v17 & 0x20) == 0)
      goto LABEL_50;
    goto LABEL_81;
  }
LABEL_80:
  self->_adaptiveTcpReadTimeout = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x20) == 0)
  {
LABEL_50:
    if ((v17 & 0x400000) == 0)
      goto LABEL_51;
    goto LABEL_82;
  }
LABEL_81:
  self->_adaptiveTcpWriteTimeout = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x400000) == 0)
  {
LABEL_51:
    if ((v17 & 0x200000) == 0)
      goto LABEL_52;
    goto LABEL_83;
  }
LABEL_82:
  self->_powerPluggedInWhenQueued = *((_BYTE *)a3 + 162);
  *(_DWORD *)&self->_has |= 0x400000u;
  v17 = *((_DWORD *)a3 + 42);
  if ((v17 & 0x200000) == 0)
  {
LABEL_52:
    if ((v17 & 0x100000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_83:
  self->_powerPluggedInAtStart = *((_BYTE *)a3 + 161);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 42) & 0x100000) != 0)
  {
LABEL_53:
    self->_powerPluggedInAtEnd = *((_BYTE *)a3 + 160);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_54:
  if (*((_QWORD *)a3 + 15))
    -[AWDMMCSHttpInfo setNetworkUsed:](self, "setNetworkUsed:");
  if ((*((_BYTE *)a3 + 168) & 2) != 0)
  {
    self->_networkServiceType = *((_QWORD *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
  }
}

- (NSString)locatorScheme
{
  return self->_locatorScheme;
}

- (void)setLocatorScheme:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)locatorHostname
{
  return self->_locatorHostname;
}

- (void)setLocatorHostname:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unsigned)locatorPort
{
  return self->_locatorPort;
}

- (BOOL)connectionReused
{
  return self->_connectionReused;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)responseReceivedDuration
{
  return self->_responseReceivedDuration;
}

- (int64_t)duration
{
  return self->_duration;
}

- (int)httpStatus
{
  return self->_httpStatus;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)requestSize
{
  return self->_requestSize;
}

- (int)responseSize
{
  return self->_responseSize;
}

- (BOOL)transactionComplete
{
  return self->_transactionComplete;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (NSMutableArray)tcpInfos
{
  return self->_tcpInfos;
}

- (void)setTcpInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSMutableArray)httpErrors
{
  return self->_httpErrors;
}

- (void)setHttpErrors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)interfaceIdentifier
{
  return self->_interfaceIdentifier;
}

- (void)setInterfaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)locatorPeerAddress
{
  return self->_locatorPeerAddress;
}

- (void)setLocatorPeerAddress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (BOOL)allowsPowerNapScheduling
{
  return self->_allowsPowerNapScheduling;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (BOOL)forceNondiscretionary
{
  return self->_forceNondiscretionary;
}

- (BOOL)fastFail
{
  return self->_fastFail;
}

- (int)qualityOfService
{
  return self->_qualityOfService;
}

- (BOOL)proxyUsed
{
  return self->_proxyUsed;
}

- (BOOL)finalTryInRequest
{
  return self->_finalTryInRequest;
}

- (BOOL)inlineEdgeComplete
{
  return self->_inlineEdgeComplete;
}

- (int)adaptiveTcpReadTimeout
{
  return self->_adaptiveTcpReadTimeout;
}

- (int)adaptiveTcpWriteTimeout
{
  return self->_adaptiveTcpWriteTimeout;
}

- (BOOL)powerPluggedInWhenQueued
{
  return self->_powerPluggedInWhenQueued;
}

- (BOOL)powerPluggedInAtStart
{
  return self->_powerPluggedInAtStart;
}

- (BOOL)powerPluggedInAtEnd
{
  return self->_powerPluggedInAtEnd;
}

- (NSString)networkUsed
{
  return self->_networkUsed;
}

- (void)setNetworkUsed:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (int64_t)networkServiceType
{
  return self->_networkServiceType;
}

@end
