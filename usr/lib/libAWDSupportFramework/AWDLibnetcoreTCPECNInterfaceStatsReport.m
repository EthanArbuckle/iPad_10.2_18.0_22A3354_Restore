@implementation AWDLibnetcoreTCPECNInterfaceStatsReport

- (void)setInterfaceType:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasInterfaceType
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIpProtocol:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_ipProtocol = a3;
}

- (void)setHasIpProtocol:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasIpProtocol
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTcpECNIntClientSetup:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_tcpECNIntClientSetup = a3;
}

- (void)setHasTcpECNIntClientSetup:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasTcpECNIntClientSetup
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTcpECNIntServerSetup:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_tcpECNIntServerSetup = a3;
}

- (void)setHasTcpECNIntServerSetup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntServerSetup
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setTcpECNIntClientSuccess:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_tcpECNIntClientSuccess = a3;
}

- (void)setHasTcpECNIntClientSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTcpECNIntClientSuccess
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTcpECNIntServerSuccess:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_tcpECNIntServerSuccess = a3;
}

- (void)setHasTcpECNIntServerSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntServerSuccess
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setTcpECNIntNotSupportedPeer:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_tcpECNIntNotSupportedPeer = a3;
}

- (void)setHasTcpECNIntNotSupportedPeer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasTcpECNIntNotSupportedPeer
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTcpECNIntSynLost:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_tcpECNIntSynLost = a3;
}

- (void)setHasTcpECNIntSynLost:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntSynLost
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setTcpECNIntSynAckLost:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_tcpECNIntSynAckLost = a3;
}

- (void)setHasTcpECNIntSynAckLost:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntSynAckLost
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setTcpECNIntRecvCE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_tcpECNIntRecvCE = a3;
}

- (void)setHasTcpECNIntRecvCE:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntRecvCE
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setTcpECNIntRecvECE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_tcpECNIntRecvECE = a3;
}

- (void)setHasTcpECNIntRecvECE:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntRecvECE
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setTcpECNIntSentECE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_tcpECNIntSentECE = a3;
}

- (void)setHasTcpECNIntSentECE:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntSentECE
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTcpECNIntConnRecvCE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_tcpECNIntConnRecvCE = a3;
}

- (void)setHasTcpECNIntConnRecvCE:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTcpECNIntConnRecvCE
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTcpECNIntConnRecvECE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_tcpECNIntConnRecvECE = a3;
}

- (void)setHasTcpECNIntConnRecvECE:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasTcpECNIntConnRecvECE
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTcpECNIntConnPLNoCE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_tcpECNIntConnPLNoCE = a3;
}

- (void)setHasTcpECNIntConnPLNoCE:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasTcpECNIntConnPLNoCE
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTcpECNIntConnPLCE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_tcpECNIntConnPLCE = a3;
}

- (void)setHasTcpECNIntConnPLCE:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasTcpECNIntConnPLCE
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTcpECNIntConnNoPLCE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_tcpECNIntConnNoPLCE = a3;
}

- (void)setHasTcpECNIntConnNoPLCE:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasTcpECNIntConnNoPLCE
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTcpECNIntFallbackSynLoss:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_tcpECNIntFallbackSynLoss = a3;
}

- (void)setHasTcpECNIntFallbackSynLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackSynLoss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTcpECNIntFallbackReorder:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_tcpECNIntFallbackReorder = a3;
}

- (void)setHasTcpECNIntFallbackReorder:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackReorder
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTcpECNIntFallbackCE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_tcpECNIntFallbackCE = a3;
}

- (void)setHasTcpECNIntFallbackCE:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackCE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTcpECNIntOnAvgRTT:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_tcpECNIntOnAvgRTT = a3;
}

- (void)setHasTcpECNIntOnAvgRTT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnAvgRTT
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setTcpECNIntOnRTTVar:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_tcpECNIntOnRTTVar = a3;
}

- (void)setHasTcpECNIntOnRTTVar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnRTTVar
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setTcpECNIntOnOOBPer:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_tcpECNIntOnOOBPer = a3;
}

- (void)setHasTcpECNIntOnOOBPer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnOOBPer
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setTcpECNIntOnSACKE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_tcpECNIntOnSACKE = a3;
}

- (void)setHasTcpECNIntOnSACKE:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnSACKE
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTcpECNIntOnReorderPer:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_tcpECNIntOnReorderPer = a3;
}

- (void)setHasTcpECNIntOnReorderPer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnReorderPer
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setTcpECNIntRxmtPer:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_tcpECNIntRxmtPer = a3;
}

- (void)setHasTcpECNIntRxmtPer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntRxmtPer
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setTcpECNIntOffAvgRTT:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_tcpECNIntOffAvgRTT = a3;
}

- (void)setHasTcpECNIntOffAvgRTT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffAvgRTT
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTcpECNIntOffRTTVar:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_tcpECNIntOffRTTVar = a3;
}

- (void)setHasTcpECNIntOffRTTVar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffRTTVar
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setTcpECNIntOffOOBPer:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_tcpECNIntOffOOBPer = a3;
}

- (void)setHasTcpECNIntOffOOBPer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffOOBPer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTcpECNIntOffSACKE:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_tcpECNIntOffSACKE = a3;
}

- (void)setHasTcpECNIntOffSACKE:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffSACKE
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTcpECNIntOffReorderPer:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_tcpECNIntOffReorderPer = a3;
}

- (void)setHasTcpECNIntOffReorderPer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffReorderPer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTcpECNIntOffRxmtPer:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_tcpECNIntOffRxmtPer = a3;
}

- (void)setHasTcpECNIntOffRxmtPer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffRxmtPer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setTcpECNIntOnTotalTxPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_tcpECNIntOnTotalTxPkts = a3;
}

- (void)setHasTcpECNIntOnTotalTxPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalTxPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTcpECNIntOnTotalRxmtPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_tcpECNIntOnTotalRxmtPkts = a3;
}

- (void)setHasTcpECNIntOnTotalRxmtPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalRxmtPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setTcpECNIntOnTotalRxPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_tcpECNIntOnTotalRxPkts = a3;
}

- (void)setHasTcpECNIntOnTotalRxPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalRxPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setTcpECNIntOnTotalOOPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_tcpECNIntOnTotalOOPkts = a3;
}

- (void)setHasTcpECNIntOnTotalOOPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalOOPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setTcpECNIntOnDropRst:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_tcpECNIntOnDropRst = a3;
}

- (void)setHasTcpECNIntOnDropRst:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnDropRst
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setTcpECNIntOnDropRxmt:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_tcpECNIntOnDropRxmt = a3;
}

- (void)setHasTcpECNIntOnDropRxmt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnDropRxmt
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTcpECNIntOffTotalTxPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_tcpECNIntOffTotalTxPkts = a3;
}

- (void)setHasTcpECNIntOffTotalTxPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalTxPkts
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setTcpECNIntOffTotalRxmtPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_tcpECNIntOffTotalRxmtPkts = a3;
}

- (void)setHasTcpECNIntOffTotalRxmtPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalRxmtPkts
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTcpECNIntOffTotalRxPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_tcpECNIntOffTotalRxPkts = a3;
}

- (void)setHasTcpECNIntOffTotalRxPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalRxPkts
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTcpECNIntOffTotalOOPkts:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_tcpECNIntOffTotalOOPkts = a3;
}

- (void)setHasTcpECNIntOffTotalOOPkts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalOOPkts
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setTcpECNIntOffDropRst:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_tcpECNIntOffDropRst = a3;
}

- (void)setHasTcpECNIntOffDropRst:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffDropRst
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTcpECNIntOffDropRxmt:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_tcpECNIntOffDropRxmt = a3;
}

- (void)setHasTcpECNIntOffDropRxmt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffDropRxmt
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTcpECNIntTotalConnections:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_tcpECNIntTotalConnections = a3;
}

- (void)setHasTcpECNIntTotalConnections:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntTotalConnections
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setTcpUnsentDataAtSleepCnt:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_tcpUnsentDataAtSleepCnt = a3;
}

- (void)setHasTcpUnsentDataAtSleepCnt:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpUnsentDataAtSleepCnt
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (void)setTcpECNIntFallbackDropRst:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_tcpECNIntFallbackDropRst = a3;
}

- (void)setHasTcpECNIntFallbackDropRst:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackDropRst
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTcpECNIntFallbackDropRxmt:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_tcpECNIntFallbackDropRxmt = a3;
}

- (void)setHasTcpECNIntFallbackDropRxmt:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackDropRxmt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTcpECNIntFallbackSYNRst:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_tcpECNIntFallbackSYNRst = a3;
}

- (void)setHasTcpECNIntFallbackSYNRst:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackSYNRst
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPECNInterfaceStatsReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreTCPECNInterfaceStatsReport description](&v3, sel_description), -[AWDLibnetcoreTCPECNInterfaceStatsReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $E9537ED3C3FE9D68E134AF95349F1C12 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_interfaceType), CFSTR("interfaceType"));
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_54;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_ipProtocol), CFSTR("ipProtocol"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntClientSetup), CFSTR("tcpECNIntClientSetup"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntServerSetup), CFSTR("tcpECNIntServerSetup"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_7;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntClientSuccess), CFSTR("tcpECNIntClientSuccess"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntServerSuccess), CFSTR("tcpECNIntServerSuccess"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntNotSupportedPeer), CFSTR("tcpECNIntNotSupportedPeer"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_10;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntSynLost), CFSTR("tcpECNIntSynLost"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_11;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntSynAckLost), CFSTR("tcpECNIntSynAckLost"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_12;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntRecvCE), CFSTR("tcpECNIntRecvCE"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntRecvECE), CFSTR("tcpECNIntRecvECE"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntSentECE), CFSTR("tcpECNIntSentECE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntConnRecvCE), CFSTR("tcpECNIntConnRecvCE"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntConnRecvECE), CFSTR("tcpECNIntConnRecvECE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntConnPLNoCE), CFSTR("tcpECNIntConnPLNoCE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntConnPLCE), CFSTR("tcpECNIntConnPLCE"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntConnNoPLCE), CFSTR("tcpECNIntConnNoPLCE"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntFallbackSynLoss), CFSTR("tcpECNIntFallbackSynLoss"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntFallbackReorder), CFSTR("tcpECNIntFallbackReorder"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntFallbackCE), CFSTR("tcpECNIntFallbackCE"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnAvgRTT), CFSTR("tcpECNIntOnAvgRTT"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnRTTVar), CFSTR("tcpECNIntOnRTTVar"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnOOBPer), CFSTR("tcpECNIntOnOOBPer"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnSACKE), CFSTR("tcpECNIntOnSACKE"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_27;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnReorderPer), CFSTR("tcpECNIntOnReorderPer"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntRxmtPer), CFSTR("tcpECNIntRxmtPer"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffAvgRTT), CFSTR("tcpECNIntOffAvgRTT"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffRTTVar), CFSTR("tcpECNIntOffRTTVar"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffOOBPer), CFSTR("tcpECNIntOffOOBPer"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffSACKE), CFSTR("tcpECNIntOffSACKE"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffReorderPer), CFSTR("tcpECNIntOffReorderPer"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_34;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffRxmtPer), CFSTR("tcpECNIntOffRxmtPer"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_35;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnTotalTxPkts), CFSTR("tcpECNIntOnTotalTxPkts"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_36;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnTotalRxmtPkts), CFSTR("tcpECNIntOnTotalRxmtPkts"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnTotalRxPkts), CFSTR("tcpECNIntOnTotalRxPkts"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_38;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnTotalOOPkts), CFSTR("tcpECNIntOnTotalOOPkts"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnDropRst), CFSTR("tcpECNIntOnDropRst"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOnDropRxmt), CFSTR("tcpECNIntOnDropRxmt"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffTotalTxPkts), CFSTR("tcpECNIntOffTotalTxPkts"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_42;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffTotalRxmtPkts), CFSTR("tcpECNIntOffTotalRxmtPkts"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_43;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffTotalRxPkts), CFSTR("tcpECNIntOffTotalRxPkts"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffTotalOOPkts), CFSTR("tcpECNIntOffTotalOOPkts"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffDropRst), CFSTR("tcpECNIntOffDropRst"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_46;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntOffDropRxmt), CFSTR("tcpECNIntOffDropRxmt"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_47;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntTotalConnections), CFSTR("tcpECNIntTotalConnections"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpUnsentDataAtSleepCnt), CFSTR("tcpUnsentDataAtSleepCnt"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_49;
LABEL_99:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntFallbackDropRxmt), CFSTR("tcpECNIntFallbackDropRxmt"));
    if ((*(_QWORD *)&self->_has & 0x2000) == 0)
      return v3;
    goto LABEL_50;
  }
LABEL_98:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntFallbackDropRst), CFSTR("tcpECNIntFallbackDropRst"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
    goto LABEL_99;
LABEL_49:
  if ((*(_WORD *)&has & 0x2000) != 0)
LABEL_50:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_tcpECNIntFallbackSYNRst), CFSTR("tcpECNIntFallbackSYNRst"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPECNInterfaceStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E9537ED3C3FE9D68E134AF95349F1C12 has;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_7;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_9;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_10;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_11;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_12;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_13;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_27;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_34;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_35;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_36;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_38;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_42;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_43;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_46;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_47;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_49;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x2000) == 0)
      return;
LABEL_99:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_98:
  PBDataWriterWriteUint64Field();
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
    goto LABEL_99;
}

- (void)copyTo:(id)a3
{
  $E9537ED3C3FE9D68E134AF95349F1C12 has;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_interfaceType;
    *((_QWORD *)a3 + 50) |= 1uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_ipProtocol;
  *((_QWORD *)a3 + 50) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 3) = self->_tcpECNIntClientSetup;
  *((_QWORD *)a3 + 50) |= 4uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)a3 + 44) = self->_tcpECNIntServerSetup;
  *((_QWORD *)a3 + 50) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_7;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)a3 + 4) = self->_tcpECNIntClientSuccess;
  *((_QWORD *)a3 + 50) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)a3 + 45) = self->_tcpECNIntServerSuccess;
  *((_QWORD *)a3 + 50) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_9;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)a3 + 16) = self->_tcpECNIntNotSupportedPeer;
  *((_QWORD *)a3 + 50) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_10;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)a3 + 47) = self->_tcpECNIntSynLost;
  *((_QWORD *)a3 + 50) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_11;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 46) = self->_tcpECNIntSynAckLost;
  *((_QWORD *)a3 + 50) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_12;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)a3 + 40) = self->_tcpECNIntRecvCE;
  *((_QWORD *)a3 + 50) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_13;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)a3 + 41) = self->_tcpECNIntRecvECE;
  *((_QWORD *)a3 + 50) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 43) = self->_tcpECNIntSentECE;
  *((_QWORD *)a3 + 50) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 8) = self->_tcpECNIntConnRecvCE;
  *((_QWORD *)a3 + 50) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)a3 + 9) = self->_tcpECNIntConnRecvECE;
  *((_QWORD *)a3 + 50) |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)a3 + 7) = self->_tcpECNIntConnPLNoCE;
  *((_QWORD *)a3 + 50) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)a3 + 6) = self->_tcpECNIntConnPLCE;
  *((_QWORD *)a3 + 50) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)a3 + 5) = self->_tcpECNIntConnNoPLCE;
  *((_QWORD *)a3 + 50) |= 0x10uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)a3 + 15) = self->_tcpECNIntFallbackSynLoss;
  *((_QWORD *)a3 + 50) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)a3 + 13) = self->_tcpECNIntFallbackReorder;
  *((_QWORD *)a3 + 50) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)a3 + 10) = self->_tcpECNIntFallbackCE;
  *((_QWORD *)a3 + 50) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)a3 + 29) = self->_tcpECNIntOnAvgRTT;
  *((_QWORD *)a3 + 50) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)a3 + 33) = self->_tcpECNIntOnRTTVar;
  *((_QWORD *)a3 + 50) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)a3 + 32) = self->_tcpECNIntOnOOBPer;
  *((_QWORD *)a3 + 50) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)a3 + 35) = self->_tcpECNIntOnSACKE;
  *((_QWORD *)a3 + 50) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_27;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)a3 + 34) = self->_tcpECNIntOnReorderPer;
  *((_QWORD *)a3 + 50) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)a3 + 42) = self->_tcpECNIntRxmtPer;
  *((_QWORD *)a3 + 50) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)a3 + 17) = self->_tcpECNIntOffAvgRTT;
  *((_QWORD *)a3 + 50) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)a3 + 21) = self->_tcpECNIntOffRTTVar;
  *((_QWORD *)a3 + 50) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)a3 + 20) = self->_tcpECNIntOffOOBPer;
  *((_QWORD *)a3 + 50) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)a3 + 24) = self->_tcpECNIntOffSACKE;
  *((_QWORD *)a3 + 50) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_82;
  }
LABEL_81:
  *((_QWORD *)a3 + 22) = self->_tcpECNIntOffReorderPer;
  *((_QWORD *)a3 + 50) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_34;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)a3 + 23) = self->_tcpECNIntOffRxmtPer;
  *((_QWORD *)a3 + 50) |= 0x400000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_35;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)a3 + 39) = self->_tcpECNIntOnTotalTxPkts;
  *((_QWORD *)a3 + 50) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_36;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)a3 + 38) = self->_tcpECNIntOnTotalRxmtPkts;
  *((_QWORD *)a3 + 50) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)a3 + 37) = self->_tcpECNIntOnTotalRxPkts;
  *((_QWORD *)a3 + 50) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_38;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)a3 + 36) = self->_tcpECNIntOnTotalOOPkts;
  *((_QWORD *)a3 + 50) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_88;
  }
LABEL_87:
  *((_QWORD *)a3 + 30) = self->_tcpECNIntOnDropRst;
  *((_QWORD *)a3 + 50) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_89;
  }
LABEL_88:
  *((_QWORD *)a3 + 31) = self->_tcpECNIntOnDropRxmt;
  *((_QWORD *)a3 + 50) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_90;
  }
LABEL_89:
  *((_QWORD *)a3 + 28) = self->_tcpECNIntOffTotalTxPkts;
  *((_QWORD *)a3 + 50) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_42;
    goto LABEL_91;
  }
LABEL_90:
  *((_QWORD *)a3 + 27) = self->_tcpECNIntOffTotalRxmtPkts;
  *((_QWORD *)a3 + 50) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_43;
    goto LABEL_92;
  }
LABEL_91:
  *((_QWORD *)a3 + 26) = self->_tcpECNIntOffTotalRxPkts;
  *((_QWORD *)a3 + 50) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_93;
  }
LABEL_92:
  *((_QWORD *)a3 + 25) = self->_tcpECNIntOffTotalOOPkts;
  *((_QWORD *)a3 + 50) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_94;
  }
LABEL_93:
  *((_QWORD *)a3 + 18) = self->_tcpECNIntOffDropRst;
  *((_QWORD *)a3 + 50) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_46;
    goto LABEL_95;
  }
LABEL_94:
  *((_QWORD *)a3 + 19) = self->_tcpECNIntOffDropRxmt;
  *((_QWORD *)a3 + 50) |= 0x40000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_47;
    goto LABEL_96;
  }
LABEL_95:
  *((_QWORD *)a3 + 48) = self->_tcpECNIntTotalConnections;
  *((_QWORD *)a3 + 50) |= 0x800000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_97;
  }
LABEL_96:
  *((_QWORD *)a3 + 49) = self->_tcpUnsentDataAtSleepCnt;
  *((_QWORD *)a3 + 50) |= 0x1000000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_49;
    goto LABEL_98;
  }
LABEL_97:
  *((_QWORD *)a3 + 11) = self->_tcpECNIntFallbackDropRst;
  *((_QWORD *)a3 + 50) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x2000) == 0)
      return;
LABEL_99:
    *((_QWORD *)a3 + 14) = self->_tcpECNIntFallbackSYNRst;
    *((_QWORD *)a3 + 50) |= 0x2000uLL;
    return;
  }
LABEL_98:
  *((_QWORD *)a3 + 12) = self->_tcpECNIntFallbackDropRxmt;
  *((_QWORD *)a3 + 50) |= 0x800uLL;
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
    goto LABEL_99;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $E9537ED3C3FE9D68E134AF95349F1C12 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_interfaceType;
    *((_QWORD *)result + 50) |= 1uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_54;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_ipProtocol;
  *((_QWORD *)result + 50) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)result + 3) = self->_tcpECNIntClientSetup;
  *((_QWORD *)result + 50) |= 4uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_56;
  }
LABEL_55:
  *((_QWORD *)result + 44) = self->_tcpECNIntServerSetup;
  *((_QWORD *)result + 50) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_7;
    goto LABEL_57;
  }
LABEL_56:
  *((_QWORD *)result + 4) = self->_tcpECNIntClientSuccess;
  *((_QWORD *)result + 50) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)result + 45) = self->_tcpECNIntServerSuccess;
  *((_QWORD *)result + 50) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)result + 16) = self->_tcpECNIntNotSupportedPeer;
  *((_QWORD *)result + 50) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_10;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)result + 47) = self->_tcpECNIntSynLost;
  *((_QWORD *)result + 50) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_11;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)result + 46) = self->_tcpECNIntSynAckLost;
  *((_QWORD *)result + 50) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_12;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)result + 40) = self->_tcpECNIntRecvCE;
  *((_QWORD *)result + 50) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)result + 41) = self->_tcpECNIntRecvECE;
  *((_QWORD *)result + 50) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)result + 43) = self->_tcpECNIntSentECE;
  *((_QWORD *)result + 50) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)result + 8) = self->_tcpECNIntConnRecvCE;
  *((_QWORD *)result + 50) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)result + 9) = self->_tcpECNIntConnRecvECE;
  *((_QWORD *)result + 50) |= 0x100uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)result + 7) = self->_tcpECNIntConnPLNoCE;
  *((_QWORD *)result + 50) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)result + 6) = self->_tcpECNIntConnPLCE;
  *((_QWORD *)result + 50) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)result + 5) = self->_tcpECNIntConnNoPLCE;
  *((_QWORD *)result + 50) |= 0x10uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)result + 15) = self->_tcpECNIntFallbackSynLoss;
  *((_QWORD *)result + 50) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)result + 13) = self->_tcpECNIntFallbackReorder;
  *((_QWORD *)result + 50) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)result + 10) = self->_tcpECNIntFallbackCE;
  *((_QWORD *)result + 50) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)result + 29) = self->_tcpECNIntOnAvgRTT;
  *((_QWORD *)result + 50) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)result + 33) = self->_tcpECNIntOnRTTVar;
  *((_QWORD *)result + 50) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)result + 32) = self->_tcpECNIntOnOOBPer;
  *((_QWORD *)result + 50) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)result + 35) = self->_tcpECNIntOnSACKE;
  *((_QWORD *)result + 50) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_27;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)result + 34) = self->_tcpECNIntOnReorderPer;
  *((_QWORD *)result + 50) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)result + 42) = self->_tcpECNIntRxmtPer;
  *((_QWORD *)result + 50) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)result + 17) = self->_tcpECNIntOffAvgRTT;
  *((_QWORD *)result + 50) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)result + 21) = self->_tcpECNIntOffRTTVar;
  *((_QWORD *)result + 50) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_81;
  }
LABEL_80:
  *((_QWORD *)result + 20) = self->_tcpECNIntOffOOBPer;
  *((_QWORD *)result + 50) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_82;
  }
LABEL_81:
  *((_QWORD *)result + 24) = self->_tcpECNIntOffSACKE;
  *((_QWORD *)result + 50) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_83;
  }
LABEL_82:
  *((_QWORD *)result + 22) = self->_tcpECNIntOffReorderPer;
  *((_QWORD *)result + 50) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_34;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)result + 23) = self->_tcpECNIntOffRxmtPer;
  *((_QWORD *)result + 50) |= 0x400000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_35;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)result + 39) = self->_tcpECNIntOnTotalTxPkts;
  *((_QWORD *)result + 50) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_36;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)result + 38) = self->_tcpECNIntOnTotalRxmtPkts;
  *((_QWORD *)result + 50) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)result + 37) = self->_tcpECNIntOnTotalRxPkts;
  *((_QWORD *)result + 50) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_38;
    goto LABEL_88;
  }
LABEL_87:
  *((_QWORD *)result + 36) = self->_tcpECNIntOnTotalOOPkts;
  *((_QWORD *)result + 50) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_89;
  }
LABEL_88:
  *((_QWORD *)result + 30) = self->_tcpECNIntOnDropRst;
  *((_QWORD *)result + 50) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_90;
  }
LABEL_89:
  *((_QWORD *)result + 31) = self->_tcpECNIntOnDropRxmt;
  *((_QWORD *)result + 50) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_91;
  }
LABEL_90:
  *((_QWORD *)result + 28) = self->_tcpECNIntOffTotalTxPkts;
  *((_QWORD *)result + 50) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_42;
    goto LABEL_92;
  }
LABEL_91:
  *((_QWORD *)result + 27) = self->_tcpECNIntOffTotalRxmtPkts;
  *((_QWORD *)result + 50) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_43;
    goto LABEL_93;
  }
LABEL_92:
  *((_QWORD *)result + 26) = self->_tcpECNIntOffTotalRxPkts;
  *((_QWORD *)result + 50) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_94;
  }
LABEL_93:
  *((_QWORD *)result + 25) = self->_tcpECNIntOffTotalOOPkts;
  *((_QWORD *)result + 50) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_95;
  }
LABEL_94:
  *((_QWORD *)result + 18) = self->_tcpECNIntOffDropRst;
  *((_QWORD *)result + 50) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&has & 0x800000000000) == 0)
      goto LABEL_46;
    goto LABEL_96;
  }
LABEL_95:
  *((_QWORD *)result + 19) = self->_tcpECNIntOffDropRxmt;
  *((_QWORD *)result + 50) |= 0x40000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_47;
    goto LABEL_97;
  }
LABEL_96:
  *((_QWORD *)result + 48) = self->_tcpECNIntTotalConnections;
  *((_QWORD *)result + 50) |= 0x800000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_98;
  }
LABEL_97:
  *((_QWORD *)result + 49) = self->_tcpUnsentDataAtSleepCnt;
  *((_QWORD *)result + 50) |= 0x1000000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_49;
    goto LABEL_99;
  }
LABEL_98:
  *((_QWORD *)result + 11) = self->_tcpECNIntFallbackDropRst;
  *((_QWORD *)result + 50) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x2000) == 0)
      return result;
    goto LABEL_50;
  }
LABEL_99:
  *((_QWORD *)result + 12) = self->_tcpECNIntFallbackDropRxmt;
  *((_QWORD *)result + 50) |= 0x800uLL;
  if ((*(_QWORD *)&self->_has & 0x2000) == 0)
    return result;
LABEL_50:
  *((_QWORD *)result + 14) = self->_tcpECNIntFallbackSYNRst;
  *((_QWORD *)result + 50) |= 0x2000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $E9537ED3C3FE9D68E134AF95349F1C12 has;
  uint64_t v7;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_QWORD *)a3 + 50);
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_interfaceType != *((_QWORD *)a3 + 1))
        goto LABEL_246;
    }
    else if ((v7 & 1) != 0)
    {
LABEL_246:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_ipProtocol != *((_QWORD *)a3 + 2))
        goto LABEL_246;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_tcpECNIntClientSetup != *((_QWORD *)a3 + 3))
        goto LABEL_246;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x80000000000) != 0)
    {
      if ((v7 & 0x80000000000) == 0 || self->_tcpECNIntServerSetup != *((_QWORD *)a3 + 44))
        goto LABEL_246;
    }
    else if ((v7 & 0x80000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_tcpECNIntClientSuccess != *((_QWORD *)a3 + 4))
        goto LABEL_246;
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x100000000000) != 0)
    {
      if ((v7 & 0x100000000000) == 0 || self->_tcpECNIntServerSuccess != *((_QWORD *)a3 + 45))
        goto LABEL_246;
    }
    else if ((v7 & 0x100000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_tcpECNIntNotSupportedPeer != *((_QWORD *)a3 + 16))
        goto LABEL_246;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x400000000000) != 0)
    {
      if ((v7 & 0x400000000000) == 0 || self->_tcpECNIntSynLost != *((_QWORD *)a3 + 47))
        goto LABEL_246;
    }
    else if ((v7 & 0x400000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x200000000000) != 0)
    {
      if ((v7 & 0x200000000000) == 0 || self->_tcpECNIntSynAckLost != *((_QWORD *)a3 + 46))
        goto LABEL_246;
    }
    else if ((v7 & 0x200000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
    {
      if ((v7 & 0x8000000000) == 0 || self->_tcpECNIntRecvCE != *((_QWORD *)a3 + 40))
        goto LABEL_246;
    }
    else if ((v7 & 0x8000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
    {
      if ((v7 & 0x10000000000) == 0 || self->_tcpECNIntRecvECE != *((_QWORD *)a3 + 41))
        goto LABEL_246;
    }
    else if ((v7 & 0x10000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
    {
      if ((v7 & 0x40000000000) == 0 || self->_tcpECNIntSentECE != *((_QWORD *)a3 + 43))
        goto LABEL_246;
    }
    else if ((v7 & 0x40000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_tcpECNIntConnRecvCE != *((_QWORD *)a3 + 8))
        goto LABEL_246;
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_tcpECNIntConnRecvECE != *((_QWORD *)a3 + 9))
        goto LABEL_246;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_tcpECNIntConnPLNoCE != *((_QWORD *)a3 + 7))
        goto LABEL_246;
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_tcpECNIntConnPLCE != *((_QWORD *)a3 + 6))
        goto LABEL_246;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_tcpECNIntConnNoPLCE != *((_QWORD *)a3 + 5))
        goto LABEL_246;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_tcpECNIntFallbackSynLoss != *((_QWORD *)a3 + 15))
        goto LABEL_246;
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_tcpECNIntFallbackReorder != *((_QWORD *)a3 + 13))
        goto LABEL_246;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_tcpECNIntFallbackCE != *((_QWORD *)a3 + 10))
        goto LABEL_246;
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_tcpECNIntOnAvgRTT != *((_QWORD *)a3 + 29))
        goto LABEL_246;
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x100000000) != 0)
    {
      if ((v7 & 0x100000000) == 0 || self->_tcpECNIntOnRTTVar != *((_QWORD *)a3 + 33))
        goto LABEL_246;
    }
    else if ((v7 & 0x100000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_tcpECNIntOnOOBPer != *((_QWORD *)a3 + 32))
        goto LABEL_246;
    }
    else if ((v7 & 0x80000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x400000000) != 0)
    {
      if ((v7 & 0x400000000) == 0 || self->_tcpECNIntOnSACKE != *((_QWORD *)a3 + 35))
        goto LABEL_246;
    }
    else if ((v7 & 0x400000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x200000000) != 0)
    {
      if ((v7 & 0x200000000) == 0 || self->_tcpECNIntOnReorderPer != *((_QWORD *)a3 + 34))
        goto LABEL_246;
    }
    else if ((v7 & 0x200000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
    {
      if ((v7 & 0x20000000000) == 0 || self->_tcpECNIntRxmtPer != *((_QWORD *)a3 + 42))
        goto LABEL_246;
    }
    else if ((v7 & 0x20000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_tcpECNIntOffAvgRTT != *((_QWORD *)a3 + 17))
        goto LABEL_246;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_tcpECNIntOffRTTVar != *((_QWORD *)a3 + 21))
        goto LABEL_246;
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_tcpECNIntOffOOBPer != *((_QWORD *)a3 + 20))
        goto LABEL_246;
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_tcpECNIntOffSACKE != *((_QWORD *)a3 + 24))
        goto LABEL_246;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_tcpECNIntOffReorderPer != *((_QWORD *)a3 + 22))
        goto LABEL_246;
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_tcpECNIntOffRxmtPer != *((_QWORD *)a3 + 23))
        goto LABEL_246;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
    {
      if ((v7 & 0x4000000000) == 0 || self->_tcpECNIntOnTotalTxPkts != *((_QWORD *)a3 + 39))
        goto LABEL_246;
    }
    else if ((v7 & 0x4000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
    {
      if ((v7 & 0x2000000000) == 0 || self->_tcpECNIntOnTotalRxmtPkts != *((_QWORD *)a3 + 38))
        goto LABEL_246;
    }
    else if ((v7 & 0x2000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_tcpECNIntOnTotalRxPkts != *((_QWORD *)a3 + 37))
        goto LABEL_246;
    }
    else if ((v7 & 0x1000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x800000000) != 0)
    {
      if ((v7 & 0x800000000) == 0 || self->_tcpECNIntOnTotalOOPkts != *((_QWORD *)a3 + 36))
        goto LABEL_246;
    }
    else if ((v7 & 0x800000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_tcpECNIntOnDropRst != *((_QWORD *)a3 + 30))
        goto LABEL_246;
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_tcpECNIntOnDropRxmt != *((_QWORD *)a3 + 31))
        goto LABEL_246;
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_tcpECNIntOffTotalTxPkts != *((_QWORD *)a3 + 28))
        goto LABEL_246;
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_tcpECNIntOffTotalRxmtPkts != *((_QWORD *)a3 + 27))
        goto LABEL_246;
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_tcpECNIntOffTotalRxPkts != *((_QWORD *)a3 + 26))
        goto LABEL_246;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_tcpECNIntOffTotalOOPkts != *((_QWORD *)a3 + 25))
        goto LABEL_246;
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_tcpECNIntOffDropRst != *((_QWORD *)a3 + 18))
        goto LABEL_246;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_tcpECNIntOffDropRxmt != *((_QWORD *)a3 + 19))
        goto LABEL_246;
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x800000000000) != 0)
    {
      if ((v7 & 0x800000000000) == 0 || self->_tcpECNIntTotalConnections != *((_QWORD *)a3 + 48))
        goto LABEL_246;
    }
    else if ((v7 & 0x800000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_QWORD *)&has & 0x1000000000000) != 0)
    {
      if ((v7 & 0x1000000000000) == 0 || self->_tcpUnsentDataAtSleepCnt != *((_QWORD *)a3 + 49))
        goto LABEL_246;
    }
    else if ((v7 & 0x1000000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_tcpECNIntFallbackDropRst != *((_QWORD *)a3 + 11))
        goto LABEL_246;
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_tcpECNIntFallbackDropRxmt != *((_QWORD *)a3 + 12))
        goto LABEL_246;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_246;
    }
    LOBYTE(v5) = (*((_QWORD *)a3 + 50) & 0x2000) == 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_tcpECNIntFallbackSYNRst != *((_QWORD *)a3 + 14))
        goto LABEL_246;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $E9537ED3C3FE9D68E134AF95349F1C12 has;
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
  unint64_t v16;
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
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
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
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v52 = 2654435761u * self->_interfaceType;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v51 = 2654435761u * self->_ipProtocol;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else
  {
    v52 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v51 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v50 = 2654435761u * self->_tcpECNIntClientSetup;
    if ((*(_QWORD *)&has & 0x80000000000) != 0)
      goto LABEL_5;
    goto LABEL_54;
  }
LABEL_53:
  v50 = 0;
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
LABEL_5:
    v49 = 2654435761u * self->_tcpECNIntServerSetup;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_6;
    goto LABEL_55;
  }
LABEL_54:
  v49 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_6:
    v48 = 2654435761u * self->_tcpECNIntClientSuccess;
    if ((*(_QWORD *)&has & 0x100000000000) != 0)
      goto LABEL_7;
    goto LABEL_56;
  }
LABEL_55:
  v48 = 0;
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
LABEL_7:
    v47 = 2654435761u * self->_tcpECNIntServerSuccess;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_8;
    goto LABEL_57;
  }
LABEL_56:
  v47 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    v46 = 2654435761u * self->_tcpECNIntNotSupportedPeer;
    if ((*(_QWORD *)&has & 0x400000000000) != 0)
      goto LABEL_9;
    goto LABEL_58;
  }
LABEL_57:
  v46 = 0;
  if ((*(_QWORD *)&has & 0x400000000000) != 0)
  {
LABEL_9:
    v45 = 2654435761u * self->_tcpECNIntSynLost;
    if ((*(_QWORD *)&has & 0x200000000000) != 0)
      goto LABEL_10;
    goto LABEL_59;
  }
LABEL_58:
  v45 = 0;
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
  {
LABEL_10:
    v44 = 2654435761u * self->_tcpECNIntSynAckLost;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_11;
    goto LABEL_60;
  }
LABEL_59:
  v44 = 0;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_11:
    v43 = 2654435761u * self->_tcpECNIntRecvCE;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_12;
    goto LABEL_61;
  }
LABEL_60:
  v43 = 0;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
LABEL_12:
    v42 = 2654435761u * self->_tcpECNIntRecvECE;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_13;
    goto LABEL_62;
  }
LABEL_61:
  v42 = 0;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
LABEL_13:
    v41 = 2654435761u * self->_tcpECNIntSentECE;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_63;
  }
LABEL_62:
  v41 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_14:
    v40 = 2654435761u * self->_tcpECNIntConnRecvCE;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_15;
    goto LABEL_64;
  }
LABEL_63:
  v40 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    v39 = 2654435761u * self->_tcpECNIntConnRecvECE;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_16;
    goto LABEL_65;
  }
LABEL_64:
  v39 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_16:
    v38 = 2654435761u * self->_tcpECNIntConnPLNoCE;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_17;
    goto LABEL_66;
  }
LABEL_65:
  v38 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_17:
    v37 = 2654435761u * self->_tcpECNIntConnPLCE;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_18;
    goto LABEL_67;
  }
LABEL_66:
  v37 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_18:
    v36 = 2654435761u * self->_tcpECNIntConnNoPLCE;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_19;
    goto LABEL_68;
  }
LABEL_67:
  v36 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_19:
    v35 = 2654435761u * self->_tcpECNIntFallbackSynLoss;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_20;
    goto LABEL_69;
  }
LABEL_68:
  v35 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_20:
    v34 = 2654435761u * self->_tcpECNIntFallbackReorder;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_21;
    goto LABEL_70;
  }
LABEL_69:
  v34 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_21:
    v33 = 2654435761u * self->_tcpECNIntFallbackCE;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_70:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_22:
    v32 = 2654435761u * self->_tcpECNIntOnAvgRTT;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_23;
    goto LABEL_72;
  }
LABEL_71:
  v32 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_23:
    v31 = 2654435761u * self->_tcpECNIntOnRTTVar;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_24;
    goto LABEL_73;
  }
LABEL_72:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_24:
    v30 = 2654435761u * self->_tcpECNIntOnOOBPer;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_25;
    goto LABEL_74;
  }
LABEL_73:
  v30 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_25:
    v3 = 2654435761u * self->_tcpECNIntOnSACKE;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_26;
    goto LABEL_75;
  }
LABEL_74:
  v3 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_26:
    v4 = 2654435761u * self->_tcpECNIntOnReorderPer;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
      goto LABEL_27;
    goto LABEL_76;
  }
LABEL_75:
  v4 = 0;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
LABEL_27:
    v5 = 2654435761u * self->_tcpECNIntRxmtPer;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_28;
    goto LABEL_77;
  }
LABEL_76:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_28:
    v6 = 2654435761u * self->_tcpECNIntOffAvgRTT;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_29;
    goto LABEL_78;
  }
LABEL_77:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_29:
    v7 = 2654435761u * self->_tcpECNIntOffRTTVar;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_30;
    goto LABEL_79;
  }
LABEL_78:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_30:
    v8 = 2654435761u * self->_tcpECNIntOffOOBPer;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_31;
    goto LABEL_80;
  }
LABEL_79:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_31:
    v9 = 2654435761u * self->_tcpECNIntOffSACKE;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_32;
    goto LABEL_81;
  }
LABEL_80:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_32:
    v10 = 2654435761u * self->_tcpECNIntOffReorderPer;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_33;
    goto LABEL_82;
  }
LABEL_81:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_33:
    v11 = 2654435761u * self->_tcpECNIntOffRxmtPer;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_34;
    goto LABEL_83;
  }
LABEL_82:
  v11 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_34:
    v12 = 2654435761u * self->_tcpECNIntOnTotalTxPkts;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_35;
    goto LABEL_84;
  }
LABEL_83:
  v12 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_35:
    v13 = 2654435761u * self->_tcpECNIntOnTotalRxmtPkts;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_36;
    goto LABEL_85;
  }
LABEL_84:
  v13 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_36:
    v14 = 2654435761u * self->_tcpECNIntOnTotalRxPkts;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_37;
    goto LABEL_86;
  }
LABEL_85:
  v14 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_37:
    v15 = 2654435761u * self->_tcpECNIntOnTotalOOPkts;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_38;
    goto LABEL_87;
  }
LABEL_86:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_38:
    v16 = 2654435761u * self->_tcpECNIntOnDropRst;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_39;
    goto LABEL_88;
  }
LABEL_87:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_39:
    v17 = 2654435761u * self->_tcpECNIntOnDropRxmt;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_40;
    goto LABEL_89;
  }
LABEL_88:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_40:
    v18 = 2654435761u * self->_tcpECNIntOffTotalTxPkts;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_41;
    goto LABEL_90;
  }
LABEL_89:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_41:
    v19 = 2654435761u * self->_tcpECNIntOffTotalRxmtPkts;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_42;
    goto LABEL_91;
  }
LABEL_90:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_42:
    v20 = 2654435761u * self->_tcpECNIntOffTotalRxPkts;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_43;
    goto LABEL_92;
  }
LABEL_91:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_43:
    v21 = 2654435761u * self->_tcpECNIntOffTotalOOPkts;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_44;
    goto LABEL_93;
  }
LABEL_92:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_44:
    v22 = 2654435761u * self->_tcpECNIntOffDropRst;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_45;
    goto LABEL_94;
  }
LABEL_93:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_45:
    v23 = 2654435761u * self->_tcpECNIntOffDropRxmt;
    if ((*(_QWORD *)&has & 0x800000000000) != 0)
      goto LABEL_46;
    goto LABEL_95;
  }
LABEL_94:
  v23 = 0;
  if ((*(_QWORD *)&has & 0x800000000000) != 0)
  {
LABEL_46:
    v24 = 2654435761u * self->_tcpECNIntTotalConnections;
    if ((*(_QWORD *)&has & 0x1000000000000) != 0)
      goto LABEL_47;
    goto LABEL_96;
  }
LABEL_95:
  v24 = 0;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
LABEL_47:
    v25 = 2654435761u * self->_tcpUnsentDataAtSleepCnt;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_48;
    goto LABEL_97;
  }
LABEL_96:
  v25 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_48:
    v26 = 2654435761u * self->_tcpECNIntFallbackDropRst;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_49;
LABEL_98:
    v27 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_50;
LABEL_99:
    v28 = 0;
    return v51 ^ v52 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_97:
  v26 = 0;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_98;
LABEL_49:
  v27 = 2654435761u * self->_tcpECNIntFallbackDropRxmt;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_99;
LABEL_50:
  v28 = 2654435761u * self->_tcpECNIntFallbackSYNRst;
  return v51 ^ v52 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 1) != 0)
  {
    self->_interfaceType = *((_QWORD *)a3 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v3 = *((_QWORD *)a3 + 50);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_53;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_ipProtocol = *((_QWORD *)a3 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x80000000000) == 0)
      goto LABEL_5;
    goto LABEL_54;
  }
LABEL_53:
  self->_tcpECNIntClientSetup = *((_QWORD *)a3 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x80000000000) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_55;
  }
LABEL_54:
  self->_tcpECNIntServerSetup = *((_QWORD *)a3 + 44);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x100000000000) == 0)
      goto LABEL_7;
    goto LABEL_56;
  }
LABEL_55:
  self->_tcpECNIntClientSuccess = *((_QWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x100000000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_57;
  }
LABEL_56:
  self->_tcpECNIntServerSuccess = *((_QWORD *)a3 + 45);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x8000) == 0)
  {
LABEL_8:
    if ((v3 & 0x400000000000) == 0)
      goto LABEL_9;
    goto LABEL_58;
  }
LABEL_57:
  self->_tcpECNIntNotSupportedPeer = *((_QWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x400000000000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200000000000) == 0)
      goto LABEL_10;
    goto LABEL_59;
  }
LABEL_58:
  self->_tcpECNIntSynLost = *((_QWORD *)a3 + 47);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x200000000000) == 0)
  {
LABEL_10:
    if ((v3 & 0x8000000000) == 0)
      goto LABEL_11;
    goto LABEL_60;
  }
LABEL_59:
  self->_tcpECNIntSynAckLost = *((_QWORD *)a3 + 46);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x8000000000) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000000000) == 0)
      goto LABEL_12;
    goto LABEL_61;
  }
LABEL_60:
  self->_tcpECNIntRecvCE = *((_QWORD *)a3 + 40);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x10000000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x40000000000) == 0)
      goto LABEL_13;
    goto LABEL_62;
  }
LABEL_61:
  self->_tcpECNIntRecvECE = *((_QWORD *)a3 + 41);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x40000000000) == 0)
  {
LABEL_13:
    if ((v3 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_63;
  }
LABEL_62:
  self->_tcpECNIntSentECE = *((_QWORD *)a3 + 43);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x80) == 0)
  {
LABEL_14:
    if ((v3 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_64;
  }
LABEL_63:
  self->_tcpECNIntConnRecvCE = *((_QWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x100) == 0)
  {
LABEL_15:
    if ((v3 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_65;
  }
LABEL_64:
  self->_tcpECNIntConnRecvECE = *((_QWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x40) == 0)
  {
LABEL_16:
    if ((v3 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_66;
  }
LABEL_65:
  self->_tcpECNIntConnPLNoCE = *((_QWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x20) == 0)
  {
LABEL_17:
    if ((v3 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_67;
  }
LABEL_66:
  self->_tcpECNIntConnPLCE = *((_QWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x10) == 0)
  {
LABEL_18:
    if ((v3 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_68;
  }
LABEL_67:
  self->_tcpECNIntConnNoPLCE = *((_QWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x4000) == 0)
  {
LABEL_19:
    if ((v3 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_69;
  }
LABEL_68:
  self->_tcpECNIntFallbackSynLoss = *((_QWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x1000) == 0)
  {
LABEL_20:
    if ((v3 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_70;
  }
LABEL_69:
  self->_tcpECNIntFallbackReorder = *((_QWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x200) == 0)
  {
LABEL_21:
    if ((v3 & 0x10000000) == 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_70:
  self->_tcpECNIntFallbackCE = *((_QWORD *)a3 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_22:
    if ((v3 & 0x100000000) == 0)
      goto LABEL_23;
    goto LABEL_72;
  }
LABEL_71:
  self->_tcpECNIntOnAvgRTT = *((_QWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_23:
    if ((v3 & 0x80000000) == 0)
      goto LABEL_24;
    goto LABEL_73;
  }
LABEL_72:
  self->_tcpECNIntOnRTTVar = *((_QWORD *)a3 + 33);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_24:
    if ((v3 & 0x400000000) == 0)
      goto LABEL_25;
    goto LABEL_74;
  }
LABEL_73:
  self->_tcpECNIntOnOOBPer = *((_QWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_75;
  }
LABEL_74:
  self->_tcpECNIntOnSACKE = *((_QWORD *)a3 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x20000000000) == 0)
      goto LABEL_27;
    goto LABEL_76;
  }
LABEL_75:
  self->_tcpECNIntOnReorderPer = *((_QWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_77;
  }
LABEL_76:
  self->_tcpECNIntRxmtPer = *((_QWORD *)a3 + 42);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x10000) == 0)
  {
LABEL_28:
    if ((v3 & 0x100000) == 0)
      goto LABEL_29;
    goto LABEL_78;
  }
LABEL_77:
  self->_tcpECNIntOffAvgRTT = *((_QWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x100000) == 0)
  {
LABEL_29:
    if ((v3 & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_79;
  }
LABEL_78:
  self->_tcpECNIntOffRTTVar = *((_QWORD *)a3 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x80000) == 0)
  {
LABEL_30:
    if ((v3 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_80;
  }
LABEL_79:
  self->_tcpECNIntOffOOBPer = *((_QWORD *)a3 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x800000) == 0)
  {
LABEL_31:
    if ((v3 & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_81;
  }
LABEL_80:
  self->_tcpECNIntOffSACKE = *((_QWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x200000) == 0)
  {
LABEL_32:
    if ((v3 & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_82;
  }
LABEL_81:
  self->_tcpECNIntOffReorderPer = *((_QWORD *)a3 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x400000) == 0)
  {
LABEL_33:
    if ((v3 & 0x4000000000) == 0)
      goto LABEL_34;
    goto LABEL_83;
  }
LABEL_82:
  self->_tcpECNIntOffRxmtPer = *((_QWORD *)a3 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_34:
    if ((v3 & 0x2000000000) == 0)
      goto LABEL_35;
    goto LABEL_84;
  }
LABEL_83:
  self->_tcpECNIntOnTotalTxPkts = *((_QWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_35:
    if ((v3 & 0x1000000000) == 0)
      goto LABEL_36;
    goto LABEL_85;
  }
LABEL_84:
  self->_tcpECNIntOnTotalRxmtPkts = *((_QWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_36:
    if ((v3 & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_86;
  }
LABEL_85:
  self->_tcpECNIntOnTotalRxPkts = *((_QWORD *)a3 + 37);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_38;
    goto LABEL_87;
  }
LABEL_86:
  self->_tcpECNIntOnTotalOOPkts = *((_QWORD *)a3 + 36);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_38:
    if ((v3 & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_88;
  }
LABEL_87:
  self->_tcpECNIntOnDropRst = *((_QWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_39:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_89;
  }
LABEL_88:
  self->_tcpECNIntOnDropRxmt = *((_QWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_40:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_90;
  }
LABEL_89:
  self->_tcpECNIntOffTotalTxPkts = *((_QWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_41:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_42;
    goto LABEL_91;
  }
LABEL_90:
  self->_tcpECNIntOffTotalRxmtPkts = *((_QWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_42:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_43;
    goto LABEL_92;
  }
LABEL_91:
  self->_tcpECNIntOffTotalRxPkts = *((_QWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_43:
    if ((v3 & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_93;
  }
LABEL_92:
  self->_tcpECNIntOffTotalOOPkts = *((_QWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x20000) == 0)
  {
LABEL_44:
    if ((v3 & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_94;
  }
LABEL_93:
  self->_tcpECNIntOffDropRst = *((_QWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x40000) == 0)
  {
LABEL_45:
    if ((v3 & 0x800000000000) == 0)
      goto LABEL_46;
    goto LABEL_95;
  }
LABEL_94:
  self->_tcpECNIntOffDropRxmt = *((_QWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x800000000000) == 0)
  {
LABEL_46:
    if ((v3 & 0x1000000000000) == 0)
      goto LABEL_47;
    goto LABEL_96;
  }
LABEL_95:
  self->_tcpECNIntTotalConnections = *((_QWORD *)a3 + 48);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((v3 & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_97;
  }
LABEL_96:
  self->_tcpUnsentDataAtSleepCnt = *((_QWORD *)a3 + 49);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x400) == 0)
  {
LABEL_48:
    if ((v3 & 0x800) == 0)
      goto LABEL_49;
    goto LABEL_98;
  }
LABEL_97:
  self->_tcpECNIntFallbackDropRst = *((_QWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v3 = *((_QWORD *)a3 + 50);
  if ((v3 & 0x800) == 0)
  {
LABEL_49:
    if ((v3 & 0x2000) == 0)
      return;
LABEL_99:
    self->_tcpECNIntFallbackSYNRst = *((_QWORD *)a3 + 14);
    *(_QWORD *)&self->_has |= 0x2000uLL;
    return;
  }
LABEL_98:
  self->_tcpECNIntFallbackDropRxmt = *((_QWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  if ((*((_QWORD *)a3 + 50) & 0x2000) != 0)
    goto LABEL_99;
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (unint64_t)ipProtocol
{
  return self->_ipProtocol;
}

- (unint64_t)tcpECNIntClientSetup
{
  return self->_tcpECNIntClientSetup;
}

- (unint64_t)tcpECNIntServerSetup
{
  return self->_tcpECNIntServerSetup;
}

- (unint64_t)tcpECNIntClientSuccess
{
  return self->_tcpECNIntClientSuccess;
}

- (unint64_t)tcpECNIntServerSuccess
{
  return self->_tcpECNIntServerSuccess;
}

- (unint64_t)tcpECNIntNotSupportedPeer
{
  return self->_tcpECNIntNotSupportedPeer;
}

- (unint64_t)tcpECNIntSynLost
{
  return self->_tcpECNIntSynLost;
}

- (unint64_t)tcpECNIntSynAckLost
{
  return self->_tcpECNIntSynAckLost;
}

- (unint64_t)tcpECNIntRecvCE
{
  return self->_tcpECNIntRecvCE;
}

- (unint64_t)tcpECNIntRecvECE
{
  return self->_tcpECNIntRecvECE;
}

- (unint64_t)tcpECNIntSentECE
{
  return self->_tcpECNIntSentECE;
}

- (unint64_t)tcpECNIntConnRecvCE
{
  return self->_tcpECNIntConnRecvCE;
}

- (unint64_t)tcpECNIntConnRecvECE
{
  return self->_tcpECNIntConnRecvECE;
}

- (unint64_t)tcpECNIntConnPLNoCE
{
  return self->_tcpECNIntConnPLNoCE;
}

- (unint64_t)tcpECNIntConnPLCE
{
  return self->_tcpECNIntConnPLCE;
}

- (unint64_t)tcpECNIntConnNoPLCE
{
  return self->_tcpECNIntConnNoPLCE;
}

- (unint64_t)tcpECNIntFallbackSynLoss
{
  return self->_tcpECNIntFallbackSynLoss;
}

- (unint64_t)tcpECNIntFallbackReorder
{
  return self->_tcpECNIntFallbackReorder;
}

- (unint64_t)tcpECNIntFallbackCE
{
  return self->_tcpECNIntFallbackCE;
}

- (unint64_t)tcpECNIntOnAvgRTT
{
  return self->_tcpECNIntOnAvgRTT;
}

- (unint64_t)tcpECNIntOnRTTVar
{
  return self->_tcpECNIntOnRTTVar;
}

- (unint64_t)tcpECNIntOnOOBPer
{
  return self->_tcpECNIntOnOOBPer;
}

- (unint64_t)tcpECNIntOnSACKE
{
  return self->_tcpECNIntOnSACKE;
}

- (unint64_t)tcpECNIntOnReorderPer
{
  return self->_tcpECNIntOnReorderPer;
}

- (unint64_t)tcpECNIntRxmtPer
{
  return self->_tcpECNIntRxmtPer;
}

- (unint64_t)tcpECNIntOffAvgRTT
{
  return self->_tcpECNIntOffAvgRTT;
}

- (unint64_t)tcpECNIntOffRTTVar
{
  return self->_tcpECNIntOffRTTVar;
}

- (unint64_t)tcpECNIntOffOOBPer
{
  return self->_tcpECNIntOffOOBPer;
}

- (unint64_t)tcpECNIntOffSACKE
{
  return self->_tcpECNIntOffSACKE;
}

- (unint64_t)tcpECNIntOffReorderPer
{
  return self->_tcpECNIntOffReorderPer;
}

- (unint64_t)tcpECNIntOffRxmtPer
{
  return self->_tcpECNIntOffRxmtPer;
}

- (unint64_t)tcpECNIntOnTotalTxPkts
{
  return self->_tcpECNIntOnTotalTxPkts;
}

- (unint64_t)tcpECNIntOnTotalRxmtPkts
{
  return self->_tcpECNIntOnTotalRxmtPkts;
}

- (unint64_t)tcpECNIntOnTotalRxPkts
{
  return self->_tcpECNIntOnTotalRxPkts;
}

- (unint64_t)tcpECNIntOnTotalOOPkts
{
  return self->_tcpECNIntOnTotalOOPkts;
}

- (unint64_t)tcpECNIntOnDropRst
{
  return self->_tcpECNIntOnDropRst;
}

- (unint64_t)tcpECNIntOnDropRxmt
{
  return self->_tcpECNIntOnDropRxmt;
}

- (unint64_t)tcpECNIntOffTotalTxPkts
{
  return self->_tcpECNIntOffTotalTxPkts;
}

- (unint64_t)tcpECNIntOffTotalRxmtPkts
{
  return self->_tcpECNIntOffTotalRxmtPkts;
}

- (unint64_t)tcpECNIntOffTotalRxPkts
{
  return self->_tcpECNIntOffTotalRxPkts;
}

- (unint64_t)tcpECNIntOffTotalOOPkts
{
  return self->_tcpECNIntOffTotalOOPkts;
}

- (unint64_t)tcpECNIntOffDropRst
{
  return self->_tcpECNIntOffDropRst;
}

- (unint64_t)tcpECNIntOffDropRxmt
{
  return self->_tcpECNIntOffDropRxmt;
}

- (unint64_t)tcpECNIntTotalConnections
{
  return self->_tcpECNIntTotalConnections;
}

- (unint64_t)tcpUnsentDataAtSleepCnt
{
  return self->_tcpUnsentDataAtSleepCnt;
}

- (unint64_t)tcpECNIntFallbackDropRst
{
  return self->_tcpECNIntFallbackDropRst;
}

- (unint64_t)tcpECNIntFallbackDropRxmt
{
  return self->_tcpECNIntFallbackDropRxmt;
}

- (unint64_t)tcpECNIntFallbackSYNRst
{
  return self->_tcpECNIntFallbackSYNRst;
}

@end
