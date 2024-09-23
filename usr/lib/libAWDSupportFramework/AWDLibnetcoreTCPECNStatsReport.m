@implementation AWDLibnetcoreTCPECNStatsReport

- (void)setTcpECNClientNegotiationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_tcpECNClientNegotiationEnabled = a3;
}

- (void)setHasTcpECNClientNegotiationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTcpECNClientNegotiationEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTcpECNServerNegotiationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_tcpECNServerNegotiationEnabled = a3;
}

- (void)setHasTcpECNServerNegotiationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTcpECNServerNegotiationEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTcpECNClientSetup:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_tcpECNClientSetup = a3;
}

- (void)setHasTcpECNClientSetup:(BOOL)a3
{
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTcpECNClientSetup
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTcpECNServerSetup:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_tcpECNServerSetup = a3;
}

- (void)setHasTcpECNServerSetup:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTcpECNServerSetup
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTcpECNClientSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_tcpECNClientSuccess = a3;
}

- (void)setHasTcpECNClientSuccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTcpECNClientSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTcpECNServerSuccess:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_tcpECNServerSuccess = a3;
}

- (void)setHasTcpECNServerSuccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTcpECNServerSuccess
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTcpECNNotSupportedPeer:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_tcpECNNotSupportedPeer = a3;
}

- (void)setHasTcpECNNotSupportedPeer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTcpECNNotSupportedPeer
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTcpECNSynLost:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tcpECNSynLost = a3;
}

- (void)setHasTcpECNSynLost:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTcpECNSynLost
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTcpECNSynAckLost:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tcpECNSynAckLost = a3;
}

- (void)setHasTcpECNSynAckLost:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTcpECNSynAckLost
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTcpECNRecvCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_tcpECNRecvCE = a3;
}

- (void)setHasTcpECNRecvCE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTcpECNRecvCE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTcpECNRecvECE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_tcpECNRecvECE = a3;
}

- (void)setHasTcpECNRecvECE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTcpECNRecvECE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTcpECNSentECE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_tcpECNSentECE = a3;
}

- (void)setHasTcpECNSentECE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTcpECNSentECE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTcpECNConnRecvCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_tcpECNConnRecvCE = a3;
}

- (void)setHasTcpECNConnRecvCE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTcpECNConnRecvCE
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTcpECNConnRecvECE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_tcpECNConnRecvECE = a3;
}

- (void)setHasTcpECNConnRecvECE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTcpECNConnRecvECE
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTcpECNConnPacketLossNoCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_tcpECNConnPacketLossNoCE = a3;
}

- (void)setHasTcpECNConnPacketLossNoCE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTcpECNConnPacketLossNoCE
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTcpECNConnPacketLossCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_tcpECNConnPacketLossCE = a3;
}

- (void)setHasTcpECNConnPacketLossCE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTcpECNConnPacketLossCE
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTcpECNConnNoPacketLossCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_tcpECNConnNoPacketLossCE = a3;
}

- (void)setHasTcpECNConnNoPacketLossCE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTcpECNConnNoPacketLossCE
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTcpECNFallbackSynLoss:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_tcpECNFallbackSynLoss = a3;
}

- (void)setHasTcpECNFallbackSynLoss:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTcpECNFallbackSynLoss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTcpECNFallbackReorder:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_tcpECNFallbackReorder = a3;
}

- (void)setHasTcpECNFallbackReorder:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTcpECNFallbackReorder
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTcpECNFallbackCE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_tcpECNFallbackCE = a3;
}

- (void)setHasTcpECNFallbackCE:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($3B6FF8093550D50F91F32B5E1EBCBE87)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTcpECNFallbackCE
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPECNStatsReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreTCPECNStatsReport description](&v3, sel_description), -[AWDLibnetcoreTCPECNStatsReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tcpECNClientNegotiationEnabled), CFSTR("tcpECNClientNegotiationEnabled"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tcpECNServerNegotiationEnabled), CFSTR("tcpECNServerNegotiationEnabled"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNClientSetup), CFSTR("tcpECNClientSetup"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNServerSetup), CFSTR("tcpECNServerSetup"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNClientSuccess), CFSTR("tcpECNClientSuccess"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNServerSuccess), CFSTR("tcpECNServerSuccess"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNNotSupportedPeer), CFSTR("tcpECNNotSupportedPeer"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNSynLost), CFSTR("tcpECNSynLost"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNSynAckLost), CFSTR("tcpECNSynAckLost"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNRecvCE), CFSTR("tcpECNRecvCE"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNRecvECE), CFSTR("tcpECNRecvECE"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNSentECE), CFSTR("tcpECNSentECE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNConnRecvCE), CFSTR("tcpECNConnRecvCE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNConnRecvECE), CFSTR("tcpECNConnRecvECE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNConnPacketLossNoCE), CFSTR("tcpECNConnPacketLossNoCE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNConnPacketLossCE), CFSTR("tcpECNConnPacketLossCE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNConnNoPacketLossCE), CFSTR("tcpECNConnNoPacketLossCE"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
LABEL_41:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNFallbackReorder), CFSTR("tcpECNFallbackReorder"));
    if ((*(_DWORD *)&self->_has & 0x80) == 0)
      return v3;
    goto LABEL_21;
  }
LABEL_40:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNFallbackSynLoss), CFSTR("tcpECNFallbackSynLoss"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_41;
LABEL_20:
  if ((*(_BYTE *)&has & 0x80) != 0)
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNFallbackCE), CFSTR("tcpECNFallbackCE"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPECNStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $3B6FF8093550D50F91F32B5E1EBCBE87 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x80) == 0)
      return;
LABEL_41:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_40:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
    goto LABEL_41;
}

- (void)copyTo:(id)a3
{
  $3B6FF8093550D50F91F32B5E1EBCBE87 has;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((_BYTE *)a3 + 152) = self->_tcpECNClientNegotiationEnabled;
    *((_DWORD *)a3 + 39) |= 0x40000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 153) = self->_tcpECNServerNegotiationEnabled;
  *((_DWORD *)a3 + 39) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)a3 + 1) = self->_tcpECNClientSetup;
  *((_DWORD *)a3 + 39) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)a3 + 15) = self->_tcpECNServerSetup;
  *((_DWORD *)a3 + 39) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 2) = self->_tcpECNClientSuccess;
  *((_DWORD *)a3 + 39) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 16) = self->_tcpECNServerSuccess;
  *((_DWORD *)a3 + 39) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 11) = self->_tcpECNNotSupportedPeer;
  *((_DWORD *)a3 + 39) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 18) = self->_tcpECNSynLost;
  *((_DWORD *)a3 + 39) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)a3 + 17) = self->_tcpECNSynAckLost;
  *((_DWORD *)a3 + 39) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)a3 + 12) = self->_tcpECNRecvCE;
  *((_DWORD *)a3 + 39) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)a3 + 13) = self->_tcpECNRecvECE;
  *((_DWORD *)a3 + 39) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)a3 + 14) = self->_tcpECNSentECE;
  *((_DWORD *)a3 + 39) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)a3 + 6) = self->_tcpECNConnRecvCE;
  *((_DWORD *)a3 + 39) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)a3 + 7) = self->_tcpECNConnRecvECE;
  *((_DWORD *)a3 + 39) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)a3 + 5) = self->_tcpECNConnPacketLossNoCE;
  *((_DWORD *)a3 + 39) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)a3 + 4) = self->_tcpECNConnPacketLossCE;
  *((_DWORD *)a3 + 39) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)a3 + 3) = self->_tcpECNConnNoPacketLossCE;
  *((_DWORD *)a3 + 39) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)a3 + 10) = self->_tcpECNFallbackSynLoss;
  *((_DWORD *)a3 + 39) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x80) == 0)
      return;
LABEL_41:
    *((_QWORD *)a3 + 8) = self->_tcpECNFallbackCE;
    *((_DWORD *)a3 + 39) |= 0x80u;
    return;
  }
LABEL_40:
  *((_QWORD *)a3 + 9) = self->_tcpECNFallbackReorder;
  *((_DWORD *)a3 + 39) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
    goto LABEL_41;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((_BYTE *)result + 152) = self->_tcpECNClientNegotiationEnabled;
    *((_DWORD *)result + 39) |= 0x40000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x80000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 153) = self->_tcpECNServerNegotiationEnabled;
  *((_DWORD *)result + 39) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 1) = self->_tcpECNClientSetup;
  *((_DWORD *)result + 39) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 15) = self->_tcpECNServerSetup;
  *((_DWORD *)result + 39) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 2) = self->_tcpECNClientSuccess;
  *((_DWORD *)result + 39) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 16) = self->_tcpECNServerSuccess;
  *((_DWORD *)result + 39) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)result + 11) = self->_tcpECNNotSupportedPeer;
  *((_DWORD *)result + 39) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)result + 18) = self->_tcpECNSynLost;
  *((_DWORD *)result + 39) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)result + 17) = self->_tcpECNSynAckLost;
  *((_DWORD *)result + 39) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)result + 12) = self->_tcpECNRecvCE;
  *((_DWORD *)result + 39) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)result + 13) = self->_tcpECNRecvECE;
  *((_DWORD *)result + 39) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)result + 14) = self->_tcpECNSentECE;
  *((_DWORD *)result + 39) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)result + 6) = self->_tcpECNConnRecvCE;
  *((_DWORD *)result + 39) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)result + 7) = self->_tcpECNConnRecvECE;
  *((_DWORD *)result + 39) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)result + 5) = self->_tcpECNConnPacketLossNoCE;
  *((_DWORD *)result + 39) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)result + 4) = self->_tcpECNConnPacketLossCE;
  *((_DWORD *)result + 39) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)result + 3) = self->_tcpECNConnNoPacketLossCE;
  *((_DWORD *)result + 39) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)result + 10) = self->_tcpECNFallbackSynLoss;
  *((_DWORD *)result + 39) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x80) == 0)
      return result;
    goto LABEL_21;
  }
LABEL_41:
  *((_QWORD *)result + 9) = self->_tcpECNFallbackReorder;
  *((_DWORD *)result + 39) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
    return result;
LABEL_21:
  *((_QWORD *)result + 8) = self->_tcpECNFallbackCE;
  *((_DWORD *)result + 39) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $3B6FF8093550D50F91F32B5E1EBCBE87 has;
  int v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *((_DWORD *)a3 + 39);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0)
      goto LABEL_107;
    if (self->_tcpECNClientNegotiationEnabled)
    {
      if (!*((_BYTE *)a3 + 152))
        goto LABEL_107;
    }
    else if (*((_BYTE *)a3 + 152))
    {
      goto LABEL_107;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    if ((v7 & 0x80000) != 0)
      goto LABEL_107;
    goto LABEL_18;
  }
  if ((v7 & 0x80000) == 0)
    goto LABEL_107;
  if (self->_tcpECNServerNegotiationEnabled)
  {
    if (!*((_BYTE *)a3 + 153))
      goto LABEL_107;
    goto LABEL_18;
  }
  if (*((_BYTE *)a3 + 153))
  {
LABEL_107:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_tcpECNClientSetup != *((_QWORD *)a3 + 1))
      goto LABEL_107;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_tcpECNServerSetup != *((_QWORD *)a3 + 15))
      goto LABEL_107;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_tcpECNClientSuccess != *((_QWORD *)a3 + 2))
      goto LABEL_107;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_tcpECNServerSuccess != *((_QWORD *)a3 + 16))
      goto LABEL_107;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_tcpECNNotSupportedPeer != *((_QWORD *)a3 + 11))
      goto LABEL_107;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_tcpECNSynLost != *((_QWORD *)a3 + 18))
      goto LABEL_107;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_tcpECNSynAckLost != *((_QWORD *)a3 + 17))
      goto LABEL_107;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_tcpECNRecvCE != *((_QWORD *)a3 + 12))
      goto LABEL_107;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_tcpECNRecvECE != *((_QWORD *)a3 + 13))
      goto LABEL_107;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_tcpECNSentECE != *((_QWORD *)a3 + 14))
      goto LABEL_107;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_tcpECNConnRecvCE != *((_QWORD *)a3 + 6))
      goto LABEL_107;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tcpECNConnRecvECE != *((_QWORD *)a3 + 7))
      goto LABEL_107;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_tcpECNConnPacketLossNoCE != *((_QWORD *)a3 + 5))
      goto LABEL_107;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_tcpECNConnPacketLossCE != *((_QWORD *)a3 + 4))
      goto LABEL_107;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_tcpECNConnNoPacketLossCE != *((_QWORD *)a3 + 3))
      goto LABEL_107;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_tcpECNFallbackSynLoss != *((_QWORD *)a3 + 10))
      goto LABEL_107;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_107;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_tcpECNFallbackReorder != *((_QWORD *)a3 + 9))
      goto LABEL_107;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_107;
  }
  LOBYTE(v5) = (*((_DWORD *)a3 + 39) & 0x80) == 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_tcpECNFallbackCE != *((_QWORD *)a3 + 8))
      goto LABEL_107;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $3B6FF8093550D50F91F32B5E1EBCBE87 has;
  uint64_t v3;
  uint64_t v4;
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
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v3 = 2654435761 * self->_tcpECNClientNegotiationEnabled;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_tcpECNServerNegotiationEnabled;
      if ((*(_BYTE *)&has & 1) != 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_tcpECNClientSetup;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  v5 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_5:
    v6 = 2654435761u * self->_tcpECNServerSetup;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  v6 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_tcpECNClientSuccess;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  v7 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_7:
    v8 = 2654435761u * self->_tcpECNServerSuccess;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  v8 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    v9 = 2654435761u * self->_tcpECNNotSupportedPeer;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_9:
    v10 = 2654435761u * self->_tcpECNSynLost;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    v11 = 2654435761u * self->_tcpECNSynAckLost;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v11 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    v12 = 2654435761u * self->_tcpECNRecvCE;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  v12 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    v13 = 2654435761u * self->_tcpECNRecvECE;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  v13 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    v14 = 2654435761u * self->_tcpECNSentECE;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  v14 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_14:
    v15 = 2654435761u * self->_tcpECNConnRecvCE;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v15 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_15:
    v16 = 2654435761u * self->_tcpECNConnRecvECE;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_16:
    v17 = 2654435761u * self->_tcpECNConnPacketLossNoCE;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  v17 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_17:
    v18 = 2654435761u * self->_tcpECNConnPacketLossCE;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  v18 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_18:
    v19 = 2654435761u * self->_tcpECNConnNoPacketLossCE;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  v19 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_19:
    v20 = 2654435761u * self->_tcpECNFallbackSynLoss;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_20;
LABEL_40:
    v21 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_21;
LABEL_41:
    v22 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_39:
  v20 = 0;
  if ((*(_WORD *)&has & 0x100) == 0)
    goto LABEL_40;
LABEL_20:
  v21 = 2654435761u * self->_tcpECNFallbackReorder;
  if ((*(_BYTE *)&has & 0x80) == 0)
    goto LABEL_41;
LABEL_21:
  v22 = 2654435761u * self->_tcpECNFallbackCE;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x40000) != 0)
  {
    self->_tcpECNClientNegotiationEnabled = *((_BYTE *)a3 + 152);
    *(_DWORD *)&self->_has |= 0x40000u;
    v3 = *((_DWORD *)a3 + 39);
    if ((v3 & 0x80000) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v3 & 0x80000) == 0)
  {
    goto LABEL_3;
  }
  self->_tcpECNServerNegotiationEnabled = *((_BYTE *)a3 + 153);
  *(_DWORD *)&self->_has |= 0x80000u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_tcpECNClientSetup = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x4000) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_tcpECNServerSetup = *((_QWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_tcpECNClientSuccess = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x8000) == 0)
  {
LABEL_7:
    if ((v3 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_tcpECNServerSuccess = *((_QWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x400) == 0)
  {
LABEL_8:
    if ((v3 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_tcpECNNotSupportedPeer = *((_QWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x20000) == 0)
  {
LABEL_9:
    if ((v3 & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_tcpECNSynLost = *((_QWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x10000) == 0)
  {
LABEL_10:
    if ((v3 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_tcpECNSynAckLost = *((_QWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x800) == 0)
  {
LABEL_11:
    if ((v3 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  self->_tcpECNRecvCE = *((_QWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x1000) == 0)
  {
LABEL_12:
    if ((v3 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  self->_tcpECNRecvECE = *((_QWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x2000) == 0)
  {
LABEL_13:
    if ((v3 & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  self->_tcpECNSentECE = *((_QWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x20) == 0)
  {
LABEL_14:
    if ((v3 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  self->_tcpECNConnRecvCE = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x40) == 0)
  {
LABEL_15:
    if ((v3 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  self->_tcpECNConnRecvECE = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x10) == 0)
  {
LABEL_16:
    if ((v3 & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_tcpECNConnPacketLossNoCE = *((_QWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 8) == 0)
  {
LABEL_17:
    if ((v3 & 4) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  self->_tcpECNConnPacketLossCE = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 4) == 0)
  {
LABEL_18:
    if ((v3 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  self->_tcpECNConnNoPacketLossCE = *((_QWORD *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x200) == 0)
  {
LABEL_19:
    if ((v3 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  self->_tcpECNFallbackSynLoss = *((_QWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v3 = *((_DWORD *)a3 + 39);
  if ((v3 & 0x100) == 0)
  {
LABEL_20:
    if ((v3 & 0x80) == 0)
      return;
LABEL_41:
    self->_tcpECNFallbackCE = *((_QWORD *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    return;
  }
LABEL_40:
  self->_tcpECNFallbackReorder = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)a3 + 39) & 0x80) != 0)
    goto LABEL_41;
}

- (BOOL)tcpECNClientNegotiationEnabled
{
  return self->_tcpECNClientNegotiationEnabled;
}

- (BOOL)tcpECNServerNegotiationEnabled
{
  return self->_tcpECNServerNegotiationEnabled;
}

- (unint64_t)tcpECNClientSetup
{
  return self->_tcpECNClientSetup;
}

- (unint64_t)tcpECNServerSetup
{
  return self->_tcpECNServerSetup;
}

- (unint64_t)tcpECNClientSuccess
{
  return self->_tcpECNClientSuccess;
}

- (unint64_t)tcpECNServerSuccess
{
  return self->_tcpECNServerSuccess;
}

- (unint64_t)tcpECNNotSupportedPeer
{
  return self->_tcpECNNotSupportedPeer;
}

- (unint64_t)tcpECNSynLost
{
  return self->_tcpECNSynLost;
}

- (unint64_t)tcpECNSynAckLost
{
  return self->_tcpECNSynAckLost;
}

- (unint64_t)tcpECNRecvCE
{
  return self->_tcpECNRecvCE;
}

- (unint64_t)tcpECNRecvECE
{
  return self->_tcpECNRecvECE;
}

- (unint64_t)tcpECNSentECE
{
  return self->_tcpECNSentECE;
}

- (unint64_t)tcpECNConnRecvCE
{
  return self->_tcpECNConnRecvCE;
}

- (unint64_t)tcpECNConnRecvECE
{
  return self->_tcpECNConnRecvECE;
}

- (unint64_t)tcpECNConnPacketLossNoCE
{
  return self->_tcpECNConnPacketLossNoCE;
}

- (unint64_t)tcpECNConnPacketLossCE
{
  return self->_tcpECNConnPacketLossCE;
}

- (unint64_t)tcpECNConnNoPacketLossCE
{
  return self->_tcpECNConnNoPacketLossCE;
}

- (unint64_t)tcpECNFallbackSynLoss
{
  return self->_tcpECNFallbackSynLoss;
}

- (unint64_t)tcpECNFallbackReorder
{
  return self->_tcpECNFallbackReorder;
}

- (unint64_t)tcpECNFallbackCE
{
  return self->_tcpECNFallbackCE;
}

@end
