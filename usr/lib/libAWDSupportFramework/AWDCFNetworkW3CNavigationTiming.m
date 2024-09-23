@implementation AWDCFNetworkW3CNavigationTiming

- (void)dealloc
{
  objc_super v3;

  -[AWDCFNetworkW3CNavigationTiming setHostname:](self, "setHostname:", 0);
  -[AWDCFNetworkW3CNavigationTiming setUrl:](self, "setUrl:", 0);
  -[AWDCFNetworkW3CNavigationTiming setProcname:](self, "setProcname:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkW3CNavigationTiming;
  -[AWDCFNetworkW3CNavigationTiming dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setRedirectStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_redirectStart = a3;
}

- (void)setHasRedirectStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRedirectStart
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRedirectEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_redirectEnd = a3;
}

- (void)setHasRedirectEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRedirectEnd
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setFetchStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fetchStart = a3;
}

- (void)setHasFetchStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFetchStart
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDomainLookupStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_domainLookupStart = a3;
}

- (void)setHasDomainLookupStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDomainLookupStart
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDomainLookupEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_domainLookupEnd = a3;
}

- (void)setHasDomainLookupEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDomainLookupEnd
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setConnectStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectStart = a3;
}

- (void)setHasConnectStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectStart
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSecureConnectionStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_secureConnectionStart = a3;
}

- (void)setHasSecureConnectionStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSecureConnectionStart
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setConnectEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectEnd = a3;
}

- (void)setHasConnectEnd:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectEnd
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRequestStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_requestStart = a3;
}

- (void)setHasRequestStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRequestStart
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setResponseStart:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_responseStart = a3;
}

- (void)setHasResponseStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasResponseStart
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setResponseEnd:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_responseEnd = a3;
}

- (void)setHasResponseEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasResponseEnd
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRedirectCountW3C:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_redirectCountW3C = a3;
}

- (void)setHasRedirectCountW3C:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRedirectCountW3C
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRedirectCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_redirectCount = a3;
}

- (void)setHasRedirectCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRedirectCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsReused:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isReused = a3;
}

- (void)setHasIsReused:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsReused
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasHostname
{
  return self->_hostname != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setIsCellular:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isCellular = a3;
}

- (void)setHasIsCellular:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsCellular
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasProcname
{
  return self->_procname != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkW3CNavigationTiming;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCFNetworkW3CNavigationTiming description](&v3, sel_description), -[AWDCFNetworkW3CNavigationTiming dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  NSString *hostname;
  NSString *url;
  NSString *procname;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if (has < 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_redirectStart), CFSTR("redirectStart"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_redirectEnd), CFSTR("redirectEnd"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_fetchStart), CFSTR("fetchStart"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_domainLookupStart), CFSTR("domainLookupStart"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_domainLookupEnd), CFSTR("domainLookupEnd"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectStart), CFSTR("connectStart"));
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_secureConnectionStart), CFSTR("secureConnectionStart"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectEnd), CFSTR("connectEnd"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestStart), CFSTR("requestStart"));
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_responseStart), CFSTR("responseStart"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_responseEnd), CFSTR("responseEnd"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_redirectCountW3C), CFSTR("redirectCountW3C"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_redirectCount), CFSTR("redirectCount"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_16:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_isReused), CFSTR("isReused"));
LABEL_17:
  hostname = self->_hostname;
  if (hostname)
    objc_msgSend(v3, "setObject:forKey:", hostname, CFSTR("hostname"));
  url = self->_url;
  if (url)
    objc_msgSend(v3, "setObject:forKey:", url, CFSTR("url"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_isCellular), CFSTR("isCellular"));
  procname = self->_procname;
  if (procname)
    objc_msgSend(v3, "setObject:forKey:", procname, CFSTR("procname"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkW3CNavigationTimingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $2BFAA7ADE92F9A871E0AE5E476636506 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_3:
    PBDataWriterWriteUint64Field();
    *(_WORD *)&has = self->_has;
  }
LABEL_4:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    PBDataWriterWriteUint64Field();
    *(_WORD *)&has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_6:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_7;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt64Field();
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_17:
    PBDataWriterWriteInt64Field();
LABEL_18:
  if (self->_hostname)
    PBDataWriterWriteStringField();
  if (self->_url)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_procname)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  $2BFAA7ADE92F9A871E0AE5E476636506 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 16) = self->_timestamp;
  *((_WORD *)a3 + 80) |= 0x8000u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_3:
    *((_QWORD *)a3 + 11) = self->_redirectStart;
    *((_WORD *)a3 + 80) |= 0x400u;
    *(_WORD *)&has = self->_has;
  }
LABEL_4:
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *((_QWORD *)a3 + 10) = self->_redirectEnd;
    *((_WORD *)a3 + 80) |= 0x200u;
    *(_WORD *)&has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_6:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_7;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_6;
  }
  *((_QWORD *)a3 + 5) = self->_fetchStart;
  *((_WORD *)a3 + 80) |= 0x10u;
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 4) = self->_domainLookupStart;
  *((_WORD *)a3 + 80) |= 8u;
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 3) = self->_domainLookupEnd;
  *((_WORD *)a3 + 80) |= 4u;
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)a3 + 2) = self->_connectStart;
  *((_WORD *)a3 + 80) |= 2u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)a3 + 15) = self->_secureConnectionStart;
  *((_WORD *)a3 + 80) |= 0x4000u;
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)a3 + 1) = self->_connectEnd;
  *((_WORD *)a3 + 80) |= 1u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)a3 + 12) = self->_requestStart;
  *((_WORD *)a3 + 80) |= 0x800u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 14) = self->_responseStart;
  *((_WORD *)a3 + 80) |= 0x2000u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 13) = self->_responseEnd;
  *((_WORD *)a3 + 80) |= 0x1000u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 9) = self->_redirectCountW3C;
  *((_WORD *)a3 + 80) |= 0x100u;
  *(_WORD *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_37:
  *((_QWORD *)a3 + 8) = self->_redirectCount;
  *((_WORD *)a3 + 80) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((_QWORD *)a3 + 7) = self->_isReused;
    *((_WORD *)a3 + 80) |= 0x40u;
  }
LABEL_18:
  if (self->_hostname)
    objc_msgSend(a3, "setHostname:");
  if (self->_url)
    objc_msgSend(a3, "setUrl:");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_isCellular;
    *((_WORD *)a3 + 80) |= 0x20u;
  }
  if (self->_procname)
    objc_msgSend(a3, "setProcname:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if (has < 0)
  {
    *(_QWORD *)(v5 + 128) = self->_timestamp;
    *(_WORD *)(v5 + 160) |= 0x8000u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 88) = self->_redirectStart;
  *(_WORD *)(v5 + 160) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v5 + 80) = self->_redirectEnd;
  *(_WORD *)(v5 + 160) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(_QWORD *)(v5 + 40) = self->_fetchStart;
  *(_WORD *)(v5 + 160) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(_QWORD *)(v5 + 32) = self->_domainLookupStart;
  *(_WORD *)(v5 + 160) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(_QWORD *)(v5 + 24) = self->_domainLookupEnd;
  *(_WORD *)(v5 + 160) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(_QWORD *)(v5 + 16) = self->_connectStart;
  *(_WORD *)(v5 + 160) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(_QWORD *)(v5 + 120) = self->_secureConnectionStart;
  *(_WORD *)(v5 + 160) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(_QWORD *)(v5 + 8) = self->_connectEnd;
  *(_WORD *)(v5 + 160) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *(_QWORD *)(v5 + 96) = self->_requestStart;
  *(_WORD *)(v5 + 160) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *(_QWORD *)(v5 + 112) = self->_responseStart;
  *(_WORD *)(v5 + 160) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v5 + 104) = self->_responseEnd;
  *(_WORD *)(v5 + 160) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v5 + 72) = self->_redirectCountW3C;
  *(_WORD *)(v5 + 160) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  *(_QWORD *)(v5 + 64) = self->_redirectCount;
  *(_WORD *)(v5 + 160) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_16:
    *(_QWORD *)(v5 + 56) = self->_isReused;
    *(_WORD *)(v5 + 160) |= 0x40u;
  }
LABEL_17:

  *(_QWORD *)(v6 + 136) = -[NSString copyWithZone:](self->_hostname, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 152) = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_isCellular;
    *(_WORD *)(v6 + 160) |= 0x20u;
  }

  *(_QWORD *)(v6 + 144) = -[NSString copyWithZone:](self->_procname, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $2BFAA7ADE92F9A871E0AE5E476636506 has;
  __int16 v7;
  NSString *hostname;
  NSString *url;
  __int16 v10;
  NSString *procname;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_WORD *)a3 + 80);
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x8000) == 0 || self->_timestamp != *((_QWORD *)a3 + 16))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x8000) != 0)
    {
LABEL_88:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x400) == 0 || self->_redirectStart != *((_QWORD *)a3 + 11))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x400) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x200) == 0 || self->_redirectEnd != *((_QWORD *)a3 + 10))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x200) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_fetchStart != *((_QWORD *)a3 + 5))
        goto LABEL_88;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_domainLookupStart != *((_QWORD *)a3 + 4))
        goto LABEL_88;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_domainLookupEnd != *((_QWORD *)a3 + 3))
        goto LABEL_88;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_connectStart != *((_QWORD *)a3 + 2))
        goto LABEL_88;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x4000) == 0 || self->_secureConnectionStart != *((_QWORD *)a3 + 15))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x4000) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_connectEnd != *((_QWORD *)a3 + 1))
        goto LABEL_88;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x800) == 0 || self->_requestStart != *((_QWORD *)a3 + 12))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x800) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x2000) == 0 || self->_responseStart != *((_QWORD *)a3 + 14))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x2000) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x1000) == 0 || self->_responseEnd != *((_QWORD *)a3 + 13))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x1000) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 80) & 0x100) == 0 || self->_redirectCountW3C != *((_QWORD *)a3 + 9))
        goto LABEL_88;
    }
    else if ((*((_WORD *)a3 + 80) & 0x100) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_redirectCount != *((_QWORD *)a3 + 8))
        goto LABEL_88;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_88;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_isReused != *((_QWORD *)a3 + 7))
        goto LABEL_88;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_88;
    }
    hostname = self->_hostname;
    if (!((unint64_t)hostname | *((_QWORD *)a3 + 17)) || (v5 = -[NSString isEqual:](hostname, "isEqual:")) != 0)
    {
      url = self->_url;
      if (!((unint64_t)url | *((_QWORD *)a3 + 19)) || (v5 = -[NSString isEqual:](url, "isEqual:")) != 0)
      {
        v10 = *((_WORD *)a3 + 80);
        if ((*(_WORD *)&self->_has & 0x20) != 0)
        {
          if ((v10 & 0x20) == 0 || self->_isCellular != *((_QWORD *)a3 + 6))
            goto LABEL_88;
        }
        else if ((v10 & 0x20) != 0)
        {
          goto LABEL_88;
        }
        procname = self->_procname;
        if ((unint64_t)procname | *((_QWORD *)a3 + 18))
          LOBYTE(v5) = -[NSString isEqual:](procname, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;

  has = (__int16)self->_has;
  if (has < 0)
    v4 = 2654435761u * self->_timestamp;
  else
    v4 = 0;
  v25 = v4;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v23 = 2654435761u * self->_redirectStart;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_6:
      v5 = 2654435761u * self->_redirectEnd;
      if ((has & 0x10) != 0)
        goto LABEL_7;
      goto LABEL_20;
    }
  }
  else
  {
    v23 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
  }
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v22 = 2654435761u * self->_fetchStart;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v22 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v6 = 2654435761u * self->_domainLookupStart;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v21 = 2654435761u * self->_domainLookupEnd;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v21 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v7 = 2654435761u * self->_connectStart;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_11:
    v20 = 2654435761u * self->_secureConnectionStart;
    if ((has & 1) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v20 = 0;
  if ((has & 1) != 0)
  {
LABEL_12:
    v19 = 2654435761u * self->_connectEnd;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    v8 = 2654435761u * self->_requestStart;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    v17 = 2654435761u * self->_responseStart;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_15;
    goto LABEL_28;
  }
LABEL_27:
  v17 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_15:
    v9 = 2654435761u * self->_responseEnd;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_16;
LABEL_29:
    v10 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_17;
    goto LABEL_30;
  }
LABEL_28:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_29;
LABEL_16:
  v10 = 2654435761 * self->_redirectCountW3C;
  if ((has & 0x80) != 0)
  {
LABEL_17:
    v11 = 2654435761 * self->_redirectCount;
    goto LABEL_31;
  }
LABEL_30:
  v11 = 0;
LABEL_31:
  v24 = v11;
  if ((has & 0x40) != 0)
    v12 = 2654435761 * self->_isReused;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_hostname, "hash", v17);
  v14 = -[NSString hash](self->_url, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v15 = 2654435761 * self->_isCellular;
  else
    v15 = 0;
  return v23 ^ v25 ^ v5 ^ v22 ^ v6 ^ v21 ^ v7 ^ v20 ^ v19 ^ v8 ^ v18 ^ v9 ^ v10 ^ v24 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_procname, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v5;

  v5 = *((__int16 *)a3 + 80);
  if ((v5 & 0x80000000) == 0)
  {
    if ((v5 & 0x400) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  self->_timestamp = *((_QWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x8000u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 0x400) != 0)
  {
LABEL_3:
    self->_redirectStart = *((_QWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x400u;
    LOWORD(v5) = *((_WORD *)a3 + 80);
  }
LABEL_4:
  if ((v5 & 0x200) != 0)
  {
    self->_redirectEnd = *((_QWORD *)a3 + 10);
    *(_WORD *)&self->_has |= 0x200u;
    LOWORD(v5) = *((_WORD *)a3 + 80);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 8) == 0)
        goto LABEL_7;
      goto LABEL_28;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  self->_fetchStart = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  self->_domainLookupStart = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  self->_domainLookupEnd = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  self->_connectStart = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 0x4000) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  self->_secureConnectionStart = *((_QWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x4000u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  self->_connectEnd = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  self->_requestStart = *((_QWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  self->_responseStart = *((_QWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  self->_responseEnd = *((_QWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  self->_redirectCountW3C = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  LOWORD(v5) = *((_WORD *)a3 + 80);
  if ((v5 & 0x80) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_37:
  self->_redirectCount = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 80) & 0x40) != 0)
  {
LABEL_17:
    self->_isReused = *((_QWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_18:
  if (*((_QWORD *)a3 + 17))
    -[AWDCFNetworkW3CNavigationTiming setHostname:](self, "setHostname:");
  if (*((_QWORD *)a3 + 19))
    -[AWDCFNetworkW3CNavigationTiming setUrl:](self, "setUrl:");
  if ((*((_WORD *)a3 + 80) & 0x20) != 0)
  {
    self->_isCellular = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)a3 + 18))
    -[AWDCFNetworkW3CNavigationTiming setProcname:](self, "setProcname:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)redirectStart
{
  return self->_redirectStart;
}

- (unint64_t)redirectEnd
{
  return self->_redirectEnd;
}

- (unint64_t)fetchStart
{
  return self->_fetchStart;
}

- (unint64_t)domainLookupStart
{
  return self->_domainLookupStart;
}

- (unint64_t)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (unint64_t)connectStart
{
  return self->_connectStart;
}

- (unint64_t)secureConnectionStart
{
  return self->_secureConnectionStart;
}

- (unint64_t)connectEnd
{
  return self->_connectEnd;
}

- (unint64_t)requestStart
{
  return self->_requestStart;
}

- (unint64_t)responseStart
{
  return self->_responseStart;
}

- (unint64_t)responseEnd
{
  return self->_responseEnd;
}

- (int64_t)redirectCountW3C
{
  return self->_redirectCountW3C;
}

- (int64_t)redirectCount
{
  return self->_redirectCount;
}

- (int64_t)isReused
{
  return self->_isReused;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (int64_t)isCellular
{
  return self->_isCellular;
}

- (NSString)procname
{
  return self->_procname;
}

- (void)setProcname:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end
