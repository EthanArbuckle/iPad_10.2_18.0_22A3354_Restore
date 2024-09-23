@implementation NETSchemaNETDebugNetworkInterface

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NETSchemaNETDebugNetworkInterface;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETDebugNetworkInterface networkInterface](self, "networkInterface", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[NETSchemaNETDebugNetworkInterface deleteNetworkInterface](self, "deleteNetworkInterface");
  return v5;
}

- (void)setRttCurrent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rttCurrent = a3;
}

- (BOOL)hasRttCurrent
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasRttCurrent:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteRttCurrent
{
  -[NETSchemaNETDebugNetworkInterface setRttCurrent:](self, "setRttCurrent:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setRttSmoothed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rttSmoothed = a3;
}

- (BOOL)hasRttSmoothed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasRttSmoothed:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRttSmoothed
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setRttSmoothed:](self, "setRttSmoothed:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFD;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRttVariance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rttVariance = a3;
}

- (BOOL)hasRttVariance
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasRttVariance:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRttVariance
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setRttVariance:](self, "setRttVariance:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFFB;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setRttBest:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rttBest = a3;
}

- (BOOL)hasRttBest
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRttBest:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteRttBest
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setRttBest:](self, "setRttBest:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFF7;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setPacketsSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_packetsSent = a3;
}

- (BOOL)hasPacketsSent
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasPacketsSent:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deletePacketsSent
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setPacketsSent:](self, "setPacketsSent:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFEF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setPacketsReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_packetsReceived = a3;
}

- (BOOL)hasPacketsReceived
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasPacketsReceived:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deletePacketsReceived
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setPacketsReceived:](self, "setPacketsReceived:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFDF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setBytesSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_bytesSent = a3;
}

- (BOOL)hasBytesSent
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasBytesSent:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteBytesSent
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setBytesSent:](self, "setBytesSent:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFFBF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setBytesRetransmitted:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_bytesRetransmitted = a3;
}

- (BOOL)hasBytesRetransmitted
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasBytesRetransmitted:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteBytesRetransmitted
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setBytesRetransmitted:](self, "setBytesRetransmitted:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFF7F;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setBytesUnacked:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_bytesUnacked = a3;
}

- (BOOL)hasBytesUnacked
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasBytesUnacked:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteBytesUnacked
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setBytesUnacked:](self, "setBytesUnacked:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFEFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_bytesReceived = a3;
}

- (BOOL)hasBytesReceived
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasBytesReceived:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteBytesReceived
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setBytesReceived:](self, "setBytesReceived:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFDFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setDuplicateBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_duplicateBytesReceived = a3;
}

- (BOOL)hasDuplicateBytesReceived
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasDuplicateBytesReceived:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteDuplicateBytesReceived
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setDuplicateBytesReceived:](self, "setDuplicateBytesReceived:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xFBFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setOutOfOrderBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_outOfOrderBytesReceived = a3;
}

- (BOOL)hasOutOfOrderBytesReceived
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasOutOfOrderBytesReceived:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteOutOfOrderBytesReceived
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setOutOfOrderBytesReceived:](self, "setOutOfOrderBytesReceived:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xF7FF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setSendBufferBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_sendBufferBytes = a3;
}

- (BOOL)hasSendBufferBytes
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasSendBufferBytes:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteSendBufferBytes
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setSendBufferBytes:](self, "setSendBufferBytes:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xEFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setSendBandwidth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_sendBandwidth = a3;
}

- (BOOL)hasSendBandwidth
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasSendBandwidth:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteSendBandwidth
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setSendBandwidth:](self, "setSendBandwidth:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xDFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setSynRetransmits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_synRetransmits = a3;
}

- (BOOL)hasSynRetransmits
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasSynRetransmits:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteSynRetransmits
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setSynRetransmits:](self, "setSynRetransmits:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0xBFFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setTfoSynDataAcked:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_tfoSynDataAcked = a3;
}

- (BOOL)hasTfoSynDataAcked
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasTfoSynDataAcked:(BOOL)a3
{
  __int16 v3;
  int v4;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)deleteTfoSynDataAcked
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setTfoSynDataAcked:](self, "setTfoSynDataAcked:", 0);
  has = self->_has;
  v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_has = *(_WORD *)&has & 0x7FFF;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (void)setSubflowSwitchCount:(unsigned int)a3
{
  *((_BYTE *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_subflowSwitchCount = a3;
}

- (BOOL)hasSubflowSwitchCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasSubflowSwitchCount:(BOOL)a3
{
  int v3;
  unsigned int v4;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = self->_has;
  *((_BYTE *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (void)deleteSubflowSwitchCount
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  unsigned int v4;

  -[NETSchemaNETDebugNetworkInterface setSubflowSwitchCount:](self, "setSubflowSwitchCount:", 0);
  has = self->_has;
  v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_has = has;
  *((_BYTE *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasNetworkInterface
{
  return self->_networkInterface != 0;
}

- (void)deleteNetworkInterface
{
  -[NETSchemaNETDebugNetworkInterface setNetworkInterface:](self, "setNetworkInterface:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugNetworkInterfaceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  $05ABC51B9D84A52C5925A35586C8713B v9;
  id v10;

  v10 = a3;
  has = self->_has;
  v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v9 = self->_has;
    v5 = *(_DWORD *)&v9 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&v9 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x10000) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field();
LABEL_19:
  -[NETSchemaNETDebugNetworkInterface networkInterface](self, "networkInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v6)
  {
    -[NETSchemaNETDebugNetworkInterface networkInterface](self, "networkInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int rttCurrent;
  int v9;
  unsigned int rttSmoothed;
  int v11;
  unsigned int rttVariance;
  int v13;
  unsigned int rttBest;
  int v15;
  unint64_t packetsSent;
  int v17;
  unint64_t packetsReceived;
  int v19;
  unint64_t bytesSent;
  int v21;
  unint64_t bytesRetransmitted;
  int v23;
  unint64_t bytesUnacked;
  int v25;
  unint64_t bytesReceived;
  int v27;
  unint64_t duplicateBytesReceived;
  int v29;
  unint64_t outOfOrderBytesReceived;
  int v31;
  unint64_t sendBufferBytes;
  int v33;
  unint64_t sendBandwidth;
  int v35;
  unsigned int synRetransmits;
  int v37;
  unsigned int tfoSynDataAcked;
  int v39;
  unsigned int subflowSwitchCount;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  BOOL v49;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_74;
  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  v6 = *(_WORD *)&self->_has & 1;
  v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
  if (v6 != (v4[64] & 1))
    goto LABEL_74;
  if (v6)
  {
    rttCurrent = self->_rttCurrent;
    if (rttCurrent != objc_msgSend(v4, "rttCurrent"))
      goto LABEL_74;
    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
  }
  v9 = (v5 >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      rttSmoothed = self->_rttSmoothed;
      if (rttSmoothed != objc_msgSend(v4, "rttSmoothed"))
        goto LABEL_74;
      v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
    }
    v11 = (v5 >> 2) & 1;
    if (v11 == ((v7 >> 2) & 1))
    {
      if (v11)
      {
        rttVariance = self->_rttVariance;
        if (rttVariance != objc_msgSend(v4, "rttVariance"))
          goto LABEL_74;
        v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
        v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
      }
      v13 = (v5 >> 3) & 1;
      if (v13 == ((v7 >> 3) & 1))
      {
        if (v13)
        {
          rttBest = self->_rttBest;
          if (rttBest != objc_msgSend(v4, "rttBest"))
            goto LABEL_74;
          v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
          v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
        }
        v15 = (v5 >> 4) & 1;
        if (v15 == ((v7 >> 4) & 1))
        {
          if (v15)
          {
            packetsSent = self->_packetsSent;
            if (packetsSent != objc_msgSend(v4, "packetsSent"))
              goto LABEL_74;
            v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
            v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
          }
          v17 = (v5 >> 5) & 1;
          if (v17 == ((v7 >> 5) & 1))
          {
            if (v17)
            {
              packetsReceived = self->_packetsReceived;
              if (packetsReceived != objc_msgSend(v4, "packetsReceived"))
                goto LABEL_74;
              v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
              v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
            }
            v19 = (v5 >> 6) & 1;
            if (v19 == ((v7 >> 6) & 1))
            {
              if (v19)
              {
                bytesSent = self->_bytesSent;
                if (bytesSent != objc_msgSend(v4, "bytesSent"))
                  goto LABEL_74;
                v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
              }
              v21 = (v5 >> 7) & 1;
              if (v21 == ((v7 >> 7) & 1))
              {
                if (v21)
                {
                  bytesRetransmitted = self->_bytesRetransmitted;
                  if (bytesRetransmitted != objc_msgSend(v4, "bytesRetransmitted"))
                    goto LABEL_74;
                  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                  v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                }
                v23 = (v5 >> 8) & 1;
                if (v23 == ((v7 >> 8) & 1))
                {
                  if (v23)
                  {
                    bytesUnacked = self->_bytesUnacked;
                    if (bytesUnacked != objc_msgSend(v4, "bytesUnacked"))
                      goto LABEL_74;
                    v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                    v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                  }
                  v25 = (v5 >> 9) & 1;
                  if (v25 == ((v7 >> 9) & 1))
                  {
                    if (v25)
                    {
                      bytesReceived = self->_bytesReceived;
                      if (bytesReceived != objc_msgSend(v4, "bytesReceived"))
                        goto LABEL_74;
                      v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                      v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                    }
                    v27 = (v5 >> 10) & 1;
                    if (v27 == ((v7 >> 10) & 1))
                    {
                      if (v27)
                      {
                        duplicateBytesReceived = self->_duplicateBytesReceived;
                        if (duplicateBytesReceived != objc_msgSend(v4, "duplicateBytesReceived"))
                          goto LABEL_74;
                        v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                        v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                      }
                      v29 = (v5 >> 11) & 1;
                      if (v29 == ((v7 >> 11) & 1))
                      {
                        if (v29)
                        {
                          outOfOrderBytesReceived = self->_outOfOrderBytesReceived;
                          if (outOfOrderBytesReceived != objc_msgSend(v4, "outOfOrderBytesReceived"))
                            goto LABEL_74;
                          v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                          v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                        }
                        v31 = (v5 >> 12) & 1;
                        if (v31 == ((v7 >> 12) & 1))
                        {
                          if (v31)
                          {
                            sendBufferBytes = self->_sendBufferBytes;
                            if (sendBufferBytes != objc_msgSend(v4, "sendBufferBytes"))
                              goto LABEL_74;
                            v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                            v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                          }
                          v33 = (v5 >> 13) & 1;
                          if (v33 == ((v7 >> 13) & 1))
                          {
                            if (v33)
                            {
                              sendBandwidth = self->_sendBandwidth;
                              if (sendBandwidth != objc_msgSend(v4, "sendBandwidth"))
                                goto LABEL_74;
                              v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                              v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                            }
                            v35 = (v5 >> 14) & 1;
                            if (v35 == ((v7 >> 14) & 1))
                            {
                              if (v35)
                              {
                                synRetransmits = self->_synRetransmits;
                                if (synRetransmits != objc_msgSend(v4, "synRetransmits"))
                                  goto LABEL_74;
                                v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                                v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                              }
                              v37 = (v5 >> 15) & 1;
                              if (v37 == ((v7 >> 15) & 1))
                              {
                                if (v37)
                                {
                                  tfoSynDataAcked = self->_tfoSynDataAcked;
                                  if (tfoSynDataAcked != objc_msgSend(v4, "tfoSynDataAcked"))
                                    goto LABEL_74;
                                  v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                                  v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                                }
                                v39 = HIWORD(v5) & 1;
                                if (v39 == (HIWORD(v7) & 1))
                                {
                                  if (!v39
                                    || (subflowSwitchCount = self->_subflowSwitchCount,
                                        subflowSwitchCount == objc_msgSend(v4, "subflowSwitchCount")))
                                  {
                                    -[NETSchemaNETDebugNetworkInterface networkInterface](self, "networkInterface");
                                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v4, "networkInterface");
                                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                                    v43 = v42;
                                    if ((v41 == 0) != (v42 != 0))
                                    {
                                      -[NETSchemaNETDebugNetworkInterface networkInterface](self, "networkInterface");
                                      v44 = objc_claimAutoreleasedReturnValue();
                                      if (!v44)
                                      {

LABEL_77:
                                        v49 = 1;
                                        goto LABEL_75;
                                      }
                                      v45 = (void *)v44;
                                      -[NETSchemaNETDebugNetworkInterface networkInterface](self, "networkInterface");
                                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v4, "networkInterface");
                                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                                      v48 = objc_msgSend(v46, "isEqual:", v47);

                                      if ((v48 & 1) != 0)
                                        goto LABEL_77;
                                    }
                                    else
                                    {

                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_74:
  v49 = 0;
LABEL_75:

  return v49;
}

- (unint64_t)hash
{
  $05ABC51B9D84A52C5925A35586C8713B has;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  has = self->_has;
  v3 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4 = 2654435761 * self->_rttCurrent;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_rttSmoothed;
      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v4 = 0;
    if ((v3 & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_rttVariance;
    if ((v3 & 8) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_rttBest;
    if ((v3 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761u * self->_packetsSent;
    if ((v3 & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v8 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    v9 = 2654435761u * self->_packetsReceived;
    if ((v3 & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v9 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    v10 = 2654435761u * self->_bytesSent;
    if ((v3 & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    v11 = 2654435761u * self->_bytesRetransmitted;
    if ((v3 & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v11 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    v12 = 2654435761u * self->_bytesUnacked;
    if ((v3 & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v12 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_11:
    v13 = 2654435761u * self->_bytesReceived;
    if ((v3 & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v13 = 0;
  if ((v3 & 0x400) != 0)
  {
LABEL_12:
    v14 = 2654435761u * self->_duplicateBytesReceived;
    if ((v3 & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v14 = 0;
  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    v15 = 2654435761u * self->_outOfOrderBytesReceived;
    if ((v3 & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v15 = 0;
  if ((v3 & 0x1000) != 0)
  {
LABEL_14:
    v16 = 2654435761u * self->_sendBufferBytes;
    if ((v3 & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v16 = 0;
  if ((v3 & 0x2000) != 0)
  {
LABEL_15:
    v17 = 2654435761u * self->_sendBandwidth;
    if ((v3 & 0x4000) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v17 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_16:
    v18 = 2654435761 * self->_synRetransmits;
    if ((v3 & 0x8000) != 0)
      goto LABEL_17;
LABEL_34:
    v19 = 0;
    if ((v3 & 0x10000) != 0)
      goto LABEL_18;
LABEL_35:
    v20 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NETSchemaNETNetworkInterface hash](self->_networkInterface, "hash");
  }
LABEL_33:
  v18 = 0;
  if ((v3 & 0x8000) == 0)
    goto LABEL_34;
LABEL_17:
  v19 = 2654435761 * self->_tfoSynDataAcked;
  if ((v3 & 0x10000) == 0)
    goto LABEL_35;
LABEL_18:
  v20 = 2654435761 * self->_subflowSwitchCount;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NETSchemaNETNetworkInterface hash](self->_networkInterface, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  $05ABC51B9D84A52C5925A35586C8713B v13;
  int v14;
  void *v15;
  void *v17;
  $05ABC51B9D84A52C5925A35586C8713B v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesReceived](self, "bytesReceived"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("bytesReceived"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesRetransmitted](self, "bytesRetransmitted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bytesRetransmitted"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesSent](self, "bytesSent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("bytesSent"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesUnacked](self, "bytesUnacked"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("bytesUnacked"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface duplicateBytesReceived](self, "duplicateBytesReceived"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duplicateBytesReceived"));

  }
LABEL_7:
  if (self->_networkInterface)
  {
    -[NETSchemaNETDebugNetworkInterface networkInterface](self, "networkInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("networkInterface"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("networkInterface"));

    }
  }
  v13 = self->_has;
  v14 = *(_DWORD *)&v13 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface outOfOrderBytesReceived](self, "outOfOrderBytesReceived"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("outOfOrderBytesReceived"));

    v18 = self->_has;
    v14 = *(_DWORD *)&v18 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(_BYTE *)&v18 & 0x20) == 0)
    {
LABEL_19:
      if ((v14 & 0x10) == 0)
        goto LABEL_20;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface packetsReceived](self, "packetsReceived"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("packetsReceived"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_20:
    if ((v14 & 8) == 0)
      goto LABEL_21;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface packetsSent](self, "packetsSent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("packetsSent"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_21:
    if ((v14 & 1) == 0)
      goto LABEL_22;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttBest](self, "rttBest"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("rttBest"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_22:
    if ((v14 & 2) == 0)
      goto LABEL_23;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttCurrent](self, "rttCurrent"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("rttCurrent"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_23:
    if ((v14 & 4) == 0)
      goto LABEL_24;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttSmoothed](self, "rttSmoothed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("rttSmoothed"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_24:
    if ((v14 & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttVariance](self, "rttVariance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("rttVariance"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_25:
    if ((v14 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface sendBandwidth](self, "sendBandwidth"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("sendBandwidth"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_26:
    if ((v14 & 0x10000) == 0)
      goto LABEL_27;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface sendBufferBytes](self, "sendBufferBytes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("sendBufferBytes"));

  v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v14 & 0x10000) == 0)
  {
LABEL_27:
    if ((v14 & 0x4000) == 0)
      goto LABEL_28;
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface synRetransmits](self, "synRetransmits"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("synRetransmits"));

    if ((*(_WORD *)&self->_has & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface subflowSwitchCount](self, "subflowSwitchCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("subflowSwitchCount"));

  LOWORD(v14) = self->_has;
  if ((v14 & 0x4000) != 0)
    goto LABEL_41;
LABEL_28:
  if ((v14 & 0x8000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface tfoSynDataAcked](self, "tfoSynDataAcked"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("tfoSynDataAcked"));

  }
LABEL_30:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETDebugNetworkInterface dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NETSchemaNETDebugNetworkInterface)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETDebugNetworkInterface *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[NETSchemaNETDebugNetworkInterface initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETDebugNetworkInterface)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETDebugNetworkInterface *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NETSchemaNETNetworkInterface *v29;
  NETSchemaNETDebugNetworkInterface *v30;
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
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NETSchemaNETDebugNetworkInterface;
  v5 = -[NETSchemaNETDebugNetworkInterface init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rttCurrent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setRttCurrent:](v5, "setRttCurrent:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rttSmoothed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setRttSmoothed:](v5, "setRttSmoothed:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rttVariance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setRttVariance:](v5, "setRttVariance:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rttBest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setRttBest:](v5, "setRttBest:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("packetsSent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setPacketsSent:](v5, "setPacketsSent:", objc_msgSend(v10, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("packetsReceived"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setPacketsReceived:](v5, "setPacketsReceived:", objc_msgSend(v11, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesSent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setBytesSent:](v5, "setBytesSent:", objc_msgSend(v12, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesRetransmitted"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setBytesRetransmitted:](v5, "setBytesRetransmitted:", objc_msgSend(v13, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesUnacked"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setBytesUnacked:](v5, "setBytesUnacked:", objc_msgSend(v14, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesReceived"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setBytesReceived:](v5, "setBytesReceived:", objc_msgSend(v15, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duplicateBytesReceived"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setDuplicateBytesReceived:](v5, "setDuplicateBytesReceived:", objc_msgSend(v16, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outOfOrderBytesReceived"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setOutOfOrderBytesReceived:](v5, "setOutOfOrderBytesReceived:", objc_msgSend(v17, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sendBufferBytes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setSendBufferBytes:](v5, "setSendBufferBytes:", objc_msgSend(v18, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sendBandwidth"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setSendBandwidth:](v5, "setSendBandwidth:", objc_msgSend(v19, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("synRetransmits"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setSynRetransmits:](v5, "setSynRetransmits:", objc_msgSend(v20, "unsignedIntValue"));
    v34 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tfoSynDataAcked"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setTfoSynDataAcked:](v5, "setTfoSynDataAcked:", objc_msgSend(v21, "unsignedIntValue"));
    v33 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subflowSwitchCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETDebugNetworkInterface setSubflowSwitchCount:](v5, "setSubflowSwitchCount:", objc_msgSend(v22, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkInterface"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v11;
      v24 = v10;
      v25 = v20;
      v26 = v18;
      v27 = v16;
      v28 = v14;
      v29 = -[NETSchemaNETNetworkInterface initWithDictionary:]([NETSchemaNETNetworkInterface alloc], "initWithDictionary:", v23);
      -[NETSchemaNETDebugNetworkInterface setNetworkInterface:](v5, "setNetworkInterface:", v29);

      v14 = v28;
      v16 = v27;
      v18 = v26;
      v20 = v25;
      v10 = v24;
      v11 = v32;
    }
    v30 = v5;

  }
  return v5;
}

- (unsigned)rttCurrent
{
  return self->_rttCurrent;
}

- (unsigned)rttSmoothed
{
  return self->_rttSmoothed;
}

- (unsigned)rttVariance
{
  return self->_rttVariance;
}

- (unsigned)rttBest
{
  return self->_rttBest;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)bytesRetransmitted
{
  return self->_bytesRetransmitted;
}

- (unint64_t)bytesUnacked
{
  return self->_bytesUnacked;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (unint64_t)duplicateBytesReceived
{
  return self->_duplicateBytesReceived;
}

- (unint64_t)outOfOrderBytesReceived
{
  return self->_outOfOrderBytesReceived;
}

- (unint64_t)sendBufferBytes
{
  return self->_sendBufferBytes;
}

- (unint64_t)sendBandwidth
{
  return self->_sendBandwidth;
}

- (unsigned)synRetransmits
{
  return self->_synRetransmits;
}

- (unsigned)tfoSynDataAcked
{
  return self->_tfoSynDataAcked;
}

- (unsigned)subflowSwitchCount
{
  return self->_subflowSwitchCount;
}

- (NETSchemaNETNetworkInterface)networkInterface
{
  return self->_networkInterface;
}

- (void)setNetworkInterface:(id)a3
{
  objc_storeStrong((id *)&self->_networkInterface, a3);
}

- (void)setHasNetworkInterface:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInterface, 0);
}

@end
