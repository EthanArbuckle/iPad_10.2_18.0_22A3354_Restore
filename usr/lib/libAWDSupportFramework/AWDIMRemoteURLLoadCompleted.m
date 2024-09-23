@implementation AWDIMRemoteURLLoadCompleted

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setNavigationStartToRedirectStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_navigationStartToRedirectStartMillis = a3;
}

- (void)setHasNavigationStartToRedirectStartMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNavigationStartToRedirectStartMillis
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRedirectStartToRedirectEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_redirectStartToRedirectEndMillis = a3;
}

- (void)setHasRedirectStartToRedirectEndMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRedirectStartToRedirectEndMillis
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRedirectEndToFetchStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_redirectEndToFetchStartMillis = a3;
}

- (void)setHasRedirectEndToFetchStartMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRedirectEndToFetchStartMillis
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setFetchStartToDomainLookupStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_fetchStartToDomainLookupStartMillis = a3;
}

- (void)setHasFetchStartToDomainLookupStartMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFetchStartToDomainLookupStartMillis
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDomainLookupStartToDomainLookupEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_domainLookupStartToDomainLookupEndMillis = a3;
}

- (void)setHasDomainLookupStartToDomainLookupEndMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDomainLookupStartToDomainLookupEndMillis
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDomainLookupEndToConnectStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_domainLookupEndToConnectStartMillis = a3;
}

- (void)setHasDomainLookupEndToConnectStartMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDomainLookupEndToConnectStartMillis
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setConnectStartToSecureConnectionStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_connectStartToSecureConnectionStartMillis = a3;
}

- (void)setHasConnectStartToSecureConnectionStartMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasConnectStartToSecureConnectionStartMillis
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setConnectStartToConnectEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectStartToConnectEndMillis = a3;
}

- (void)setHasConnectStartToConnectEndMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectStartToConnectEndMillis
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSecureConnectionStartToConnectEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_secureConnectionStartToConnectEndMillis = a3;
}

- (void)setHasSecureConnectionStartToConnectEndMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSecureConnectionStartToConnectEndMillis
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setConnectEndToRequestStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_connectEndToRequestStartMillis = a3;
}

- (void)setHasConnectEndToRequestStartMillis:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectEndToRequestStartMillis
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRequestStartToResponseStartMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_requestStartToResponseStartMillis = a3;
}

- (void)setHasRequestStartToResponseStartMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRequestStartToResponseStartMillis
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setResponseStartToResponseEndMillis:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_responseStartToResponseEndMillis = a3;
}

- (void)setHasResponseStartToResponseEndMillis:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasResponseStartToResponseEndMillis
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDIMRemoteURLLoadCompleted;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDIMRemoteURLLoadCompleted description](&v3, sel_description), -[AWDIMRemoteURLLoadCompleted dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_navigationStartToRedirectStartMillis), CFSTR("navigationStartToRedirectStartMillis"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_redirectStartToRedirectEndMillis), CFSTR("redirectStartToRedirectEndMillis"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_redirectEndToFetchStartMillis), CFSTR("redirectEndToFetchStartMillis"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_fetchStartToDomainLookupStartMillis), CFSTR("fetchStartToDomainLookupStartMillis"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_domainLookupStartToDomainLookupEndMillis), CFSTR("domainLookupStartToDomainLookupEndMillis"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_domainLookupEndToConnectStartMillis), CFSTR("domainLookupEndToConnectStartMillis"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectStartToSecureConnectionStartMillis), CFSTR("connectStartToSecureConnectionStartMillis"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectStartToConnectEndMillis), CFSTR("connectStartToConnectEndMillis"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_secureConnectionStartToConnectEndMillis), CFSTR("secureConnectionStartToConnectEndMillis"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_requestStartToResponseStartMillis), CFSTR("requestStartToResponseStartMillis"));
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectEndToRequestStartMillis), CFSTR("connectEndToRequestStartMillis"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x400) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_responseStartToResponseEndMillis), CFSTR("responseStartToResponseEndMillis"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMRemoteURLLoadCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return;
LABEL_27:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    goto LABEL_27;
}

- (void)copyTo:(id)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_QWORD *)a3 + 13) = self->_timestamp;
    *((_WORD *)a3 + 56) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 7) = self->_navigationStartToRedirectStartMillis;
  *((_WORD *)a3 + 56) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)a3 + 9) = self->_redirectStartToRedirectEndMillis;
  *((_WORD *)a3 + 56) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)a3 + 8) = self->_redirectEndToFetchStartMillis;
  *((_WORD *)a3 + 56) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)a3 + 6) = self->_fetchStartToDomainLookupStartMillis;
  *((_WORD *)a3 + 56) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)a3 + 5) = self->_domainLookupStartToDomainLookupEndMillis;
  *((_WORD *)a3 + 56) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)a3 + 4) = self->_domainLookupEndToConnectStartMillis;
  *((_WORD *)a3 + 56) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)a3 + 3) = self->_connectStartToSecureConnectionStartMillis;
  *((_WORD *)a3 + 56) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)a3 + 2) = self->_connectStartToConnectEndMillis;
  *((_WORD *)a3 + 56) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 12) = self->_secureConnectionStartToConnectEndMillis;
  *((_WORD *)a3 + 56) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 1) = self->_connectEndToRequestStartMillis;
  *((_WORD *)a3 + 56) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return;
LABEL_27:
    *((_QWORD *)a3 + 11) = self->_responseStartToResponseEndMillis;
    *((_WORD *)a3 + 56) |= 0x400u;
    return;
  }
LABEL_26:
  *((_QWORD *)a3 + 10) = self->_requestStartToResponseStartMillis;
  *((_WORD *)a3 + 56) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    goto LABEL_27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_QWORD *)result + 13) = self->_timestamp;
    *((_WORD *)result + 56) |= 0x1000u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 7) = self->_navigationStartToRedirectStartMillis;
  *((_WORD *)result + 56) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 9) = self->_redirectStartToRedirectEndMillis;
  *((_WORD *)result + 56) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 8) = self->_redirectEndToFetchStartMillis;
  *((_WORD *)result + 56) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 6) = self->_fetchStartToDomainLookupStartMillis;
  *((_WORD *)result + 56) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 5) = self->_domainLookupStartToDomainLookupEndMillis;
  *((_WORD *)result + 56) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 4) = self->_domainLookupEndToConnectStartMillis;
  *((_WORD *)result + 56) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 3) = self->_connectStartToSecureConnectionStartMillis;
  *((_WORD *)result + 56) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 2) = self->_connectStartToConnectEndMillis;
  *((_WORD *)result + 56) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 12) = self->_secureConnectionStartToConnectEndMillis;
  *((_WORD *)result + 56) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 1) = self->_connectEndToRequestStartMillis;
  *((_WORD *)result + 56) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      return result;
    goto LABEL_14;
  }
LABEL_27:
  *((_QWORD *)result + 10) = self->_requestStartToResponseStartMillis;
  *((_WORD *)result + 56) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    return result;
LABEL_14:
  *((_QWORD *)result + 11) = self->_responseStartToResponseEndMillis;
  *((_WORD *)result + 56) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 56);
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x1000) == 0 || self->_timestamp != *((_QWORD *)a3 + 13))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 56) & 0x1000) != 0)
    {
LABEL_66:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_navigationStartToRedirectStartMillis != *((_QWORD *)a3 + 7))
        goto LABEL_66;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x100) == 0 || self->_redirectStartToRedirectEndMillis != *((_QWORD *)a3 + 9))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 56) & 0x100) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_redirectEndToFetchStartMillis != *((_QWORD *)a3 + 8))
        goto LABEL_66;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_fetchStartToDomainLookupStartMillis != *((_QWORD *)a3 + 6))
        goto LABEL_66;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_domainLookupStartToDomainLookupEndMillis != *((_QWORD *)a3 + 5))
        goto LABEL_66;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_domainLookupEndToConnectStartMillis != *((_QWORD *)a3 + 4))
        goto LABEL_66;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_connectStartToSecureConnectionStartMillis != *((_QWORD *)a3 + 3))
        goto LABEL_66;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_connectStartToConnectEndMillis != *((_QWORD *)a3 + 2))
        goto LABEL_66;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x800) == 0 || self->_secureConnectionStartToConnectEndMillis != *((_QWORD *)a3 + 12))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 56) & 0x800) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_connectEndToRequestStartMillis != *((_QWORD *)a3 + 1))
        goto LABEL_66;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x200) == 0 || self->_requestStartToResponseStartMillis != *((_QWORD *)a3 + 10))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 56) & 0x200) != 0)
    {
      goto LABEL_66;
    }
    LOBYTE(v5) = (v7 & 0x400) == 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 56) & 0x400) == 0 || self->_responseStartToResponseEndMillis != *((_QWORD *)a3 + 11))
        goto LABEL_66;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_navigationStartToRedirectStartMillis;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_redirectStartToRedirectEndMillis;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_redirectEndToFetchStartMillis;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_fetchStartToDomainLookupStartMillis;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_domainLookupStartToDomainLookupEndMillis;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_domainLookupEndToConnectStartMillis;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_connectStartToSecureConnectionStartMillis;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_connectStartToConnectEndMillis;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_secureConnectionStartToConnectEndMillis;
    if ((has & 1) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((has & 1) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_connectEndToRequestStartMillis;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_13;
LABEL_26:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_14;
LABEL_27:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_26;
LABEL_13:
  v14 = 2654435761u * self->_requestStartToResponseStartMillis;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_27;
LABEL_14:
  v15 = 2654435761u * self->_responseStartToResponseEndMillis;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3;

  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x1000) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x1000u;
    v3 = *((_WORD *)a3 + 56);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_navigationStartToRedirectStartMillis = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_redirectStartToRedirectEndMillis = *((_QWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_redirectEndToFetchStartMillis = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_fetchStartToDomainLookupStartMillis = *((_QWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_domainLookupStartToDomainLookupEndMillis = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_domainLookupEndToConnectStartMillis = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_connectStartToSecureConnectionStartMillis = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 2) == 0)
  {
LABEL_10:
    if ((v3 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_connectStartToConnectEndMillis = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x800) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_secureConnectionStartToConnectEndMillis = *((_QWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 1) == 0)
  {
LABEL_12:
    if ((v3 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_connectEndToRequestStartMillis = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v3 = *((_WORD *)a3 + 56);
  if ((v3 & 0x200) == 0)
  {
LABEL_13:
    if ((v3 & 0x400) == 0)
      return;
LABEL_27:
    self->_responseStartToResponseEndMillis = *((_QWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x400u;
    return;
  }
LABEL_26:
  self->_requestStartToResponseStartMillis = *((_QWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 56) & 0x400) != 0)
    goto LABEL_27;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)navigationStartToRedirectStartMillis
{
  return self->_navigationStartToRedirectStartMillis;
}

- (unint64_t)redirectStartToRedirectEndMillis
{
  return self->_redirectStartToRedirectEndMillis;
}

- (unint64_t)redirectEndToFetchStartMillis
{
  return self->_redirectEndToFetchStartMillis;
}

- (unint64_t)fetchStartToDomainLookupStartMillis
{
  return self->_fetchStartToDomainLookupStartMillis;
}

- (unint64_t)domainLookupStartToDomainLookupEndMillis
{
  return self->_domainLookupStartToDomainLookupEndMillis;
}

- (unint64_t)domainLookupEndToConnectStartMillis
{
  return self->_domainLookupEndToConnectStartMillis;
}

- (unint64_t)connectStartToSecureConnectionStartMillis
{
  return self->_connectStartToSecureConnectionStartMillis;
}

- (unint64_t)connectStartToConnectEndMillis
{
  return self->_connectStartToConnectEndMillis;
}

- (unint64_t)secureConnectionStartToConnectEndMillis
{
  return self->_secureConnectionStartToConnectEndMillis;
}

- (unint64_t)connectEndToRequestStartMillis
{
  return self->_connectEndToRequestStartMillis;
}

- (unint64_t)requestStartToResponseStartMillis
{
  return self->_requestStartToResponseStartMillis;
}

- (unint64_t)responseStartToResponseEndMillis
{
  return self->_responseStartToResponseEndMillis;
}

@end
