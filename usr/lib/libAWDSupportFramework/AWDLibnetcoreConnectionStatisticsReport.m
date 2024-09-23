@implementation AWDLibnetcoreConnectionStatisticsReport

- (void)setTimeToDNSResolvedMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_timeToDNSResolvedMsecs = a3;
}

- (void)setHasTimeToDNSResolvedMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasTimeToDNSResolvedMsecs
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setDNSAnswersCached:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_dNSAnswersCached = a3;
}

- (void)setHasDNSAnswersCached:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasDNSAnswersCached
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setTimeToConnectionEstablishmentMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_timeToConnectionEstablishmentMsecs = a3;
}

- (void)setHasTimeToConnectionEstablishmentMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasTimeToConnectionEstablishmentMsecs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setIPAddressAttemptCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_iPAddressAttemptCount = a3;
}

- (void)setHasIPAddressAttemptCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIPAddressAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setFlowDurationMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_flowDurationMsecs = a3;
}

- (void)setHasFlowDurationMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasFlowDurationMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)connectedInterfaceType
{
  if ((*((_BYTE *)&self->_has + 4) & 8) != 0)
    return self->_connectedInterfaceType;
  else
    return 0;
}

- (void)setConnectedInterfaceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_connectedInterfaceType = a3;
}

- (void)setHasConnectedInterfaceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasConnectedInterfaceType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (id)connectedInterfaceTypeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DAD0[a3];
}

- (int)StringAsConnectedInterfaceType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_OTHER")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_WIFI")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_CELLULAR")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_WIRED")))
    return 3;
  return 0;
}

- (void)setKernelReportedStalls:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_kernelReportedStalls = a3;
}

- (void)setHasKernelReportedStalls:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportedStalls
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setKernelReportingConnectionStalled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_kernelReportingConnectionStalled = a3;
}

- (void)setHasKernelReportingConnectionStalled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportingConnectionStalled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setKernelReportingReadStalled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_kernelReportingReadStalled = a3;
}

- (void)setHasKernelReportingReadStalled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportingReadStalled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setKernelReportingWriteStalled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_kernelReportingWriteStalled = a3;
}

- (void)setHasKernelReportingWriteStalled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportingWriteStalled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setBytesIn:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_bytesIn = a3;
}

- (void)setHasBytesIn:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBytesIn
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBytesOut:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_bytesOut = a3;
}

- (void)setHasBytesOut:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasBytesOut
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setBytesDuplicate:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_bytesDuplicate = a3;
}

- (void)setHasBytesDuplicate:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBytesDuplicate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBytesOutOfOrder:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_bytesOutOfOrder = a3;
}

- (void)setHasBytesOutOfOrder:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasBytesOutOfOrder
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setBytesRetransmitted:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_bytesRetransmitted = a3;
}

- (void)setHasBytesRetransmitted:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasBytesRetransmitted
{
  return *((_BYTE *)&self->_has + 1) & 1;
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
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPacketsIn
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
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
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasPacketsOut
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setPacketsDuplicate:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_packetsDuplicate = a3;
}

- (void)setHasPacketsDuplicate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPacketsDuplicate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPacketsOutOfOrder:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_packetsOutOfOrder = a3;
}

- (void)setHasPacketsOutOfOrder:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPacketsOutOfOrder
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setPacketsRetransmitted:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_packetsRetransmitted = a3;
}

- (void)setHasPacketsRetransmitted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasPacketsRetransmitted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCurrentRTTMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_currentRTTMsecs = a3;
}

- (void)setHasCurrentRTTMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCurrentRTTMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSmoothedRTTMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_smoothedRTTMsecs = a3;
}

- (void)setHasSmoothedRTTMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSmoothedRTTMsecs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setBestRTTMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_bestRTTMsecs = a3;
}

- (void)setHasBestRTTMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBestRTTMsecs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRTTvariance
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSynRetransmissionCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_synRetransmissionCount = a3;
}

- (void)setHasSynRetransmissionCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSynRetransmissionCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setConnectionReuseCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_connectionReuseCount = a3;
}

- (void)setHasConnectionReuseCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasConnectionReuseCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAppReportingDataStallCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_appReportingDataStallCount = a3;
}

- (void)setHasAppReportingDataStallCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAppReportingDataStallCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAppDataStallTimerMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_appDataStallTimerMsecs = a3;
}

- (void)setHasAppDataStallTimerMsecs:(BOOL)a3
{
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAppDataStallTimerMsecs
{
  return *(_DWORD *)&self->_has & 1;
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
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTrafficClass
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTcpFastOpen:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_tcpFastOpen = a3;
}

- (void)setHasTcpFastOpen:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpFastOpen
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setCellularFallback:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_cellularFallback = a3;
}

- (void)setHasCellularFallback:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasCellularFallback
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCellularRRCConnected:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_cellularRRCConnected = a3;
}

- (void)setHasCellularRRCConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasCellularRRCConnected
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setConnected:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasConnected
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (int)interfaceType
{
  if ((*((_BYTE *)&self->_has + 4) & 0x10) != 0)
    return self->_interfaceType;
  else
    return 0;
}

- (void)setInterfaceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasInterfaceType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10DAD0[a3];
}

- (int)StringAsInterfaceType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_OTHER")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_WIFI")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_CELLULAR")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("INTERFACE_TYPE_WIRED")))
    return 3;
  return 0;
}

- (void)setTimeToDNSStartMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_timeToDNSStartMsecs = a3;
}

- (void)setHasTimeToDNSStartMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasTimeToDNSStartMsecs
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setDNSResolvedTimeMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_dNSResolvedTimeMsecs = a3;
}

- (void)setHasDNSResolvedTimeMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDNSResolvedTimeMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTimeToConnectionStartMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_timeToConnectionStartMsecs = a3;
}

- (void)setHasTimeToConnectionStartMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasTimeToConnectionStartMsecs
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setConnectionEstablishmentTimeMsecs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_connectionEstablishmentTimeMsecs = a3;
}

- (void)setHasConnectionEstablishmentTimeMsecs:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasConnectionEstablishmentTimeMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBetterRouteEventCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_betterRouteEventCount = a3;
}

- (void)setHasBetterRouteEventCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBetterRouteEventCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMultipathServiceType:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_multipathServiceType = a3;
}

- (void)setHasMultipathServiceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMultipathServiceType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setFirstParty:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_firstParty = a3;
}

- (void)setHasFirstParty:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setMultipathBytesInCell:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_multipathBytesInCell = a3;
}

- (void)setHasMultipathBytesInCell:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasMultipathBytesInCell
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMultipathBytesOutCell:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_multipathBytesOutCell = a3;
}

- (void)setHasMultipathBytesOutCell:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMultipathBytesOutCell
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMultipathBytesInWiFi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_multipathBytesInWiFi = a3;
}

- (void)setHasMultipathBytesInWiFi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasMultipathBytesInWiFi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMultipathBytesOutWiFi:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_multipathBytesOutWiFi = a3;
}

- (void)setHasMultipathBytesOutWiFi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMultipathBytesOutWiFi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMultipathBytesInInitial:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_multipathBytesInInitial = a3;
}

- (void)setHasMultipathBytesInInitial:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasMultipathBytesInInitial
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setMultipathBytesOutInitial:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_multipathBytesOutInitial = a3;
}

- (void)setHasMultipathBytesOutInitial:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMultipathBytesOutInitial
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreConnectionStatisticsReport;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDLibnetcoreConnectionStatisticsReport description](&v3, sel_description), -[AWDLibnetcoreConnectionStatisticsReport dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $13AFF146FFF692FEAF73A0FE35206A83 has;
  uint64_t connectedInterfaceType;
  __CFString *v7;
  uint64_t interfaceType;
  __CFString *v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeToDNSResolvedMsecs), CFSTR("timeToDNSResolved_msecs"));
    has = self->_has;
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_52;
    }
  }
  else if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dNSAnswersCached), CFSTR("DNSAnswersCached"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeToConnectionEstablishmentMsecs), CFSTR("timeToConnectionEstablishment_msecs"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_iPAddressAttemptCount), CFSTR("IPAddressAttemptCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_7;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_flowDurationMsecs), CFSTR("flowDuration_msecs"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_59;
  }
LABEL_55:
  connectedInterfaceType = self->_connectedInterfaceType;
  if (connectedInterfaceType >= 4)
    v7 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectedInterfaceType);
  else
    v7 = off_24C10DAD0[connectedInterfaceType];
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("connectedInterfaceType"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_9;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_kernelReportedStalls), CFSTR("kernelReportedStalls"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_10;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_kernelReportingConnectionStalled), CFSTR("kernelReportingConnectionStalled"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_11;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_kernelReportingReadStalled), CFSTR("kernelReportingReadStalled"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_kernelReportingWriteStalled), CFSTR("kernelReportingWriteStalled"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesIn), CFSTR("bytesIn"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesOut), CFSTR("bytesOut"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesDuplicate), CFSTR("bytesDuplicate"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesOutOfOrder), CFSTR("bytesOutOfOrder"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesRetransmitted), CFSTR("bytesRetransmitted"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_18;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsIn), CFSTR("packetsIn"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsOut), CFSTR("packetsOut"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_20;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsDuplicate), CFSTR("packetsDuplicate"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_21;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsOutOfOrder), CFSTR("packetsOutOfOrder"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_packetsRetransmitted), CFSTR("packetsRetransmitted"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_currentRTTMsecs), CFSTR("currentRTT_msecs"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_24;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_smoothedRTTMsecs), CFSTR("smoothedRTT_msecs"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bestRTTMsecs), CFSTR("bestRTT_msecs"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rTTvariance), CFSTR("RTTvariance"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_synRetransmissionCount), CFSTR("synRetransmissionCount"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_28;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionReuseCount), CFSTR("connectionReuseCount"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_29;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_appReportingDataStallCount), CFSTR("appReportingDataStallCount"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_appDataStallTimerMsecs), CFSTR("appDataStallTimer_msecs"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_31;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_trafficClass), CFSTR("trafficClass"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_32;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_tcpFastOpen), CFSTR("tcpFastOpen"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_33;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cellularFallback), CFSTR("cellularFallback"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_34;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cellularRRCConnected), CFSTR("cellularRRCConnected"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_35;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_connected), CFSTR("connected"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_90;
  }
LABEL_86:
  interfaceType = self->_interfaceType;
  if (interfaceType >= 4)
    v9 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_interfaceType);
  else
    v9 = off_24C10DAD0[interfaceType];
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("interfaceType"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeToDNSStartMsecs), CFSTR("timeToDNSStart_msecs"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_38;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dNSResolvedTimeMsecs), CFSTR("DNSResolvedTime_msecs"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timeToConnectionStartMsecs), CFSTR("timeToConnectionStart_msecs"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_40;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_connectionEstablishmentTimeMsecs), CFSTR("connectionEstablishmentTime_msecs"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_41;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_betterRouteEventCount), CFSTR("betterRouteEventCount"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathServiceType), CFSTR("multipathServiceType"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_43;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_firstParty), CFSTR("firstParty"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_44;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInCell), CFSTR("multipathBytesInCell"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_45;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutCell), CFSTR("multipathBytesOutCell"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_46;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInWiFi), CFSTR("multipathBytesInWiFi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_47;
LABEL_101:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesInInitial), CFSTR("multipathBytesInInitial"));
    if ((*(_QWORD *)&self->_has & 0x80000) == 0)
      return v3;
    goto LABEL_48;
  }
LABEL_100:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutWiFi), CFSTR("multipathBytesOutWiFi"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
    goto LABEL_101;
LABEL_47:
  if ((*(_DWORD *)&has & 0x80000) != 0)
LABEL_48:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_multipathBytesOutInitial), CFSTR("multipathBytesOutInitial"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreConnectionStatisticsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $13AFF146FFF692FEAF73A0FE35206A83 has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_32;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_33;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_34;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_35;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_40;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_43;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_44;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_46;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_47;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      return;
LABEL_95:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_94:
  PBDataWriterWriteUint64Field();
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
    goto LABEL_95;
}

- (void)copyTo:(id)a3
{
  $13AFF146FFF692FEAF73A0FE35206A83 has;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    *((_QWORD *)a3 + 33) = self->_timeToDNSResolvedMsecs;
    *(_QWORD *)((char *)a3 + 308) |= 0x100000000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)a3 + 299) = self->_dNSAnswersCached;
  *(_QWORD *)((char *)a3 + 308) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)a3 + 31) = self->_timeToConnectionEstablishmentMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)a3 + 15) = self->_iPAddressAttemptCount;
  *(_QWORD *)((char *)a3 + 308) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)a3 + 14) = self->_flowDurationMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 72) = self->_connectedInterfaceType;
  *(_QWORD *)((char *)a3 + 308) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  *((_BYTE *)a3 + 301) = self->_kernelReportedStalls;
  *(_QWORD *)((char *)a3 + 308) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)a3 + 302) = self->_kernelReportingConnectionStalled;
  *(_QWORD *)((char *)a3 + 308) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  *((_BYTE *)a3 + 303) = self->_kernelReportingReadStalled;
  *(_QWORD *)((char *)a3 + 308) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)a3 + 304) = self->_kernelReportingWriteStalled;
  *(_QWORD *)((char *)a3 + 308) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)a3 + 6) = self->_bytesIn;
  *(_QWORD *)((char *)a3 + 308) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)a3 + 7) = self->_bytesOut;
  *(_QWORD *)((char *)a3 + 308) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)a3 + 5) = self->_bytesDuplicate;
  *(_QWORD *)((char *)a3 + 308) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)a3 + 8) = self->_bytesOutOfOrder;
  *(_QWORD *)((char *)a3 + 308) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)a3 + 9) = self->_bytesRetransmitted;
  *(_QWORD *)((char *)a3 + 308) |= 0x100uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)a3 + 24) = self->_packetsIn;
  *(_QWORD *)((char *)a3 + 308) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)a3 + 25) = self->_packetsOut;
  *(_QWORD *)((char *)a3 + 308) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)a3 + 23) = self->_packetsDuplicate;
  *(_QWORD *)((char *)a3 + 308) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)a3 + 26) = self->_packetsOutOfOrder;
  *(_QWORD *)((char *)a3 + 308) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)a3 + 27) = self->_packetsRetransmitted;
  *(_QWORD *)((char *)a3 + 308) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)a3 + 12) = self->_currentRTTMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x800uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)a3 + 29) = self->_smoothedRTTMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)a3 + 3) = self->_bestRTTMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)a3 + 28) = self->_rTTvariance;
  *(_QWORD *)((char *)a3 + 308) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)a3 + 30) = self->_synRetransmissionCount;
  *(_QWORD *)((char *)a3 + 308) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)a3 + 11) = self->_connectionReuseCount;
  *(_QWORD *)((char *)a3 + 308) |= 0x400uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)a3 + 2) = self->_appReportingDataStallCount;
  *(_QWORD *)((char *)a3 + 308) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)a3 + 1) = self->_appDataStallTimerMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 1uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)a3 + 35) = self->_trafficClass;
  *(_QWORD *)((char *)a3 + 308) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_32;
    goto LABEL_79;
  }
LABEL_78:
  *((_BYTE *)a3 + 305) = self->_tcpFastOpen;
  *(_QWORD *)((char *)a3 + 308) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_33;
    goto LABEL_80;
  }
LABEL_79:
  *((_BYTE *)a3 + 296) = self->_cellularFallback;
  *(_QWORD *)((char *)a3 + 308) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_34;
    goto LABEL_81;
  }
LABEL_80:
  *((_BYTE *)a3 + 297) = self->_cellularRRCConnected;
  *(_QWORD *)((char *)a3 + 308) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_35;
    goto LABEL_82;
  }
LABEL_81:
  *((_BYTE *)a3 + 298) = self->_connected;
  *(_QWORD *)((char *)a3 + 308) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)a3 + 73) = self->_interfaceType;
  *(_QWORD *)((char *)a3 + 308) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  *((_QWORD *)a3 + 34) = self->_timeToDNSStartMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)a3 + 13) = self->_dNSResolvedTimeMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x1000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)a3 + 32) = self->_timeToConnectionStartMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_40;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)a3 + 10) = self->_connectionEstablishmentTimeMsecs;
  *(_QWORD *)((char *)a3 + 308) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  *((_QWORD *)a3 + 4) = self->_betterRouteEventCount;
  *(_QWORD *)((char *)a3 + 308) |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_89;
  }
LABEL_88:
  *((_QWORD *)a3 + 22) = self->_multipathServiceType;
  *(_QWORD *)((char *)a3 + 308) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_43;
    goto LABEL_90;
  }
LABEL_89:
  *((_BYTE *)a3 + 300) = self->_firstParty;
  *(_QWORD *)((char *)a3 + 308) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_44;
    goto LABEL_91;
  }
LABEL_90:
  *((_QWORD *)a3 + 16) = self->_multipathBytesInCell;
  *(_QWORD *)((char *)a3 + 308) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  *((_QWORD *)a3 + 19) = self->_multipathBytesOutCell;
  *(_QWORD *)((char *)a3 + 308) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_46;
    goto LABEL_93;
  }
LABEL_92:
  *((_QWORD *)a3 + 18) = self->_multipathBytesInWiFi;
  *(_QWORD *)((char *)a3 + 308) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_47;
    goto LABEL_94;
  }
LABEL_93:
  *((_QWORD *)a3 + 21) = self->_multipathBytesOutWiFi;
  *(_QWORD *)((char *)a3 + 308) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      return;
LABEL_95:
    *((_QWORD *)a3 + 20) = self->_multipathBytesOutInitial;
    *(_QWORD *)((char *)a3 + 308) |= 0x80000uLL;
    return;
  }
LABEL_94:
  *((_QWORD *)a3 + 17) = self->_multipathBytesInInitial;
  *(_QWORD *)((char *)a3 + 308) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
    goto LABEL_95;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $13AFF146FFF692FEAF73A0FE35206A83 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    *((_QWORD *)result + 33) = self->_timeToDNSResolvedMsecs;
    *(_QWORD *)((char *)result + 308) |= 0x100000000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_52;
    }
  }
  else if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 299) = self->_dNSAnswersCached;
  *(_QWORD *)((char *)result + 308) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)result + 31) = self->_timeToConnectionEstablishmentMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_54;
  }
LABEL_53:
  *((_QWORD *)result + 15) = self->_iPAddressAttemptCount;
  *(_QWORD *)((char *)result + 308) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_7;
    goto LABEL_55;
  }
LABEL_54:
  *((_QWORD *)result + 14) = self->_flowDurationMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 72) = self->_connectedInterfaceType;
  *(_QWORD *)((char *)result + 308) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_9;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)result + 301) = self->_kernelReportedStalls;
  *(_QWORD *)((char *)result + 308) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_10;
    goto LABEL_58;
  }
LABEL_57:
  *((_BYTE *)result + 302) = self->_kernelReportingConnectionStalled;
  *(_QWORD *)((char *)result + 308) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x200000000000) == 0)
      goto LABEL_11;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)result + 303) = self->_kernelReportingReadStalled;
  *(_QWORD *)((char *)result + 308) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_60;
  }
LABEL_59:
  *((_BYTE *)result + 304) = self->_kernelReportingWriteStalled;
  *(_QWORD *)((char *)result + 308) |= 0x200000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)result + 6) = self->_bytesIn;
  *(_QWORD *)((char *)result + 308) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)result + 7) = self->_bytesOut;
  *(_QWORD *)((char *)result + 308) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)result + 5) = self->_bytesDuplicate;
  *(_QWORD *)((char *)result + 308) |= 0x10uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_64;
  }
LABEL_63:
  *((_QWORD *)result + 8) = self->_bytesOutOfOrder;
  *(_QWORD *)((char *)result + 308) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)result + 9) = self->_bytesRetransmitted;
  *(_QWORD *)((char *)result + 308) |= 0x100uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_18;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)result + 24) = self->_packetsIn;
  *(_QWORD *)((char *)result + 308) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)result + 25) = self->_packetsOut;
  *(_QWORD *)((char *)result + 308) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_20;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)result + 23) = self->_packetsDuplicate;
  *(_QWORD *)((char *)result + 308) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_21;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)result + 26) = self->_packetsOutOfOrder;
  *(_QWORD *)((char *)result + 308) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)result + 27) = self->_packetsRetransmitted;
  *(_QWORD *)((char *)result + 308) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_71;
  }
LABEL_70:
  *((_QWORD *)result + 12) = self->_currentRTTMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x800uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_24;
    goto LABEL_72;
  }
LABEL_71:
  *((_QWORD *)result + 29) = self->_smoothedRTTMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_73;
  }
LABEL_72:
  *((_QWORD *)result + 3) = self->_bestRTTMsecs;
  *(_QWORD *)((char *)result + 308) |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_74;
  }
LABEL_73:
  *((_QWORD *)result + 28) = self->_rTTvariance;
  *(_QWORD *)((char *)result + 308) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)result + 30) = self->_synRetransmissionCount;
  *(_QWORD *)((char *)result + 308) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_28;
    goto LABEL_76;
  }
LABEL_75:
  *((_QWORD *)result + 11) = self->_connectionReuseCount;
  *(_QWORD *)((char *)result + 308) |= 0x400uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_29;
    goto LABEL_77;
  }
LABEL_76:
  *((_QWORD *)result + 2) = self->_appReportingDataStallCount;
  *(_QWORD *)((char *)result + 308) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)result + 1) = self->_appDataStallTimerMsecs;
  *(_QWORD *)((char *)result + 308) |= 1uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x400000000000) == 0)
      goto LABEL_31;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)result + 35) = self->_trafficClass;
  *(_QWORD *)((char *)result + 308) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_32;
    goto LABEL_80;
  }
LABEL_79:
  *((_BYTE *)result + 305) = self->_tcpFastOpen;
  *(_QWORD *)((char *)result + 308) |= 0x400000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_33;
    goto LABEL_81;
  }
LABEL_80:
  *((_BYTE *)result + 296) = self->_cellularFallback;
  *(_QWORD *)((char *)result + 308) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_34;
    goto LABEL_82;
  }
LABEL_81:
  *((_BYTE *)result + 297) = self->_cellularRRCConnected;
  *(_QWORD *)((char *)result + 308) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_35;
    goto LABEL_83;
  }
LABEL_82:
  *((_BYTE *)result + 298) = self->_connected;
  *(_QWORD *)((char *)result + 308) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)result + 73) = self->_interfaceType;
  *(_QWORD *)((char *)result + 308) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_85;
  }
LABEL_84:
  *((_QWORD *)result + 34) = self->_timeToDNSStartMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_38;
    goto LABEL_86;
  }
LABEL_85:
  *((_QWORD *)result + 13) = self->_dNSResolvedTimeMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x1000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_87;
  }
LABEL_86:
  *((_QWORD *)result + 32) = self->_timeToConnectionStartMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_40;
    goto LABEL_88;
  }
LABEL_87:
  *((_QWORD *)result + 10) = self->_connectionEstablishmentTimeMsecs;
  *(_QWORD *)((char *)result + 308) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_41;
    goto LABEL_89;
  }
LABEL_88:
  *((_QWORD *)result + 4) = self->_betterRouteEventCount;
  *(_QWORD *)((char *)result + 308) |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_90;
  }
LABEL_89:
  *((_QWORD *)result + 22) = self->_multipathServiceType;
  *(_QWORD *)((char *)result + 308) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_43;
    goto LABEL_91;
  }
LABEL_90:
  *((_BYTE *)result + 300) = self->_firstParty;
  *(_QWORD *)((char *)result + 308) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_44;
    goto LABEL_92;
  }
LABEL_91:
  *((_QWORD *)result + 16) = self->_multipathBytesInCell;
  *(_QWORD *)((char *)result + 308) |= 0x8000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_45;
    goto LABEL_93;
  }
LABEL_92:
  *((_QWORD *)result + 19) = self->_multipathBytesOutCell;
  *(_QWORD *)((char *)result + 308) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_46;
    goto LABEL_94;
  }
LABEL_93:
  *((_QWORD *)result + 18) = self->_multipathBytesInWiFi;
  *(_QWORD *)((char *)result + 308) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_47;
    goto LABEL_95;
  }
LABEL_94:
  *((_QWORD *)result + 21) = self->_multipathBytesOutWiFi;
  *(_QWORD *)((char *)result + 308) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      return result;
    goto LABEL_48;
  }
LABEL_95:
  *((_QWORD *)result + 17) = self->_multipathBytesInInitial;
  *(_QWORD *)((char *)result + 308) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000) == 0)
    return result;
LABEL_48:
  *((_QWORD *)result + 20) = self->_multipathBytesOutInitial;
  *(_QWORD *)((char *)result + 308) |= 0x80000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $13AFF146FFF692FEAF73A0FE35206A83 has;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = self->_has;
  v7 = *(_QWORD *)((char *)a3 + 308);
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_timeToDNSResolvedMsecs != *((_QWORD *)a3 + 33))
      goto LABEL_266;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_266;
    if (self->_dNSAnswersCached)
    {
      if (!*((_BYTE *)a3 + 299))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 299))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_timeToConnectionEstablishmentMsecs != *((_QWORD *)a3 + 31))
      goto LABEL_266;
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_iPAddressAttemptCount != *((_QWORD *)a3 + 15))
      goto LABEL_266;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_flowDurationMsecs != *((_QWORD *)a3 + 14))
      goto LABEL_266;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_connectedInterfaceType != *((_DWORD *)a3 + 72))
      goto LABEL_266;
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_266;
    if (self->_kernelReportedStalls)
    {
      if (!*((_BYTE *)a3 + 301))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 301))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0)
      goto LABEL_266;
    if (self->_kernelReportingConnectionStalled)
    {
      if (!*((_BYTE *)a3 + 302))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 302))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_266;
    if (self->_kernelReportingReadStalled)
    {
      if (!*((_BYTE *)a3 + 303))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 303))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_266;
    if (self->_kernelReportingWriteStalled)
    {
      if (!*((_BYTE *)a3 + 304))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 304))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_bytesIn != *((_QWORD *)a3 + 6))
      goto LABEL_266;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_bytesOut != *((_QWORD *)a3 + 7))
      goto LABEL_266;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bytesDuplicate != *((_QWORD *)a3 + 5))
      goto LABEL_266;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_bytesOutOfOrder != *((_QWORD *)a3 + 8))
      goto LABEL_266;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_bytesRetransmitted != *((_QWORD *)a3 + 9))
      goto LABEL_266;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_packetsIn != *((_QWORD *)a3 + 24))
      goto LABEL_266;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_packetsOut != *((_QWORD *)a3 + 25))
      goto LABEL_266;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_packetsDuplicate != *((_QWORD *)a3 + 23))
      goto LABEL_266;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_packetsOutOfOrder != *((_QWORD *)a3 + 26))
      goto LABEL_266;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_packetsRetransmitted != *((_QWORD *)a3 + 27))
      goto LABEL_266;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_currentRTTMsecs != *((_QWORD *)a3 + 12))
      goto LABEL_266;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_smoothedRTTMsecs != *((_QWORD *)a3 + 29))
      goto LABEL_266;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bestRTTMsecs != *((_QWORD *)a3 + 3))
      goto LABEL_266;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_rTTvariance != *((_QWORD *)a3 + 28))
      goto LABEL_266;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_synRetransmissionCount != *((_QWORD *)a3 + 30))
      goto LABEL_266;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_connectionReuseCount != *((_QWORD *)a3 + 11))
      goto LABEL_266;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_appReportingDataStallCount != *((_QWORD *)a3 + 2))
      goto LABEL_266;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_appDataStallTimerMsecs != *((_QWORD *)a3 + 1))
      goto LABEL_266;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_trafficClass != *((_QWORD *)a3 + 35))
      goto LABEL_266;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x400000000000) != 0)
  {
    if ((v7 & 0x400000000000) == 0)
      goto LABEL_266;
    if (self->_tcpFastOpen)
    {
      if (!*((_BYTE *)a3 + 305))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 305))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x400000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_266;
    if (self->_cellularFallback)
    {
      if (!*((_BYTE *)a3 + 296))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 296))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_266;
    if (self->_cellularRRCConnected)
    {
      if (!*((_BYTE *)a3 + 297))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 297))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_266;
    if (self->_connected)
    {
      if (!*((_BYTE *)a3 + 298))
        goto LABEL_266;
    }
    else if (*((_BYTE *)a3 + 298))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_interfaceType != *((_DWORD *)a3 + 73))
      goto LABEL_266;
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_timeToDNSStartMsecs != *((_QWORD *)a3 + 34))
      goto LABEL_266;
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_dNSResolvedTimeMsecs != *((_QWORD *)a3 + 13))
      goto LABEL_266;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_timeToConnectionStartMsecs != *((_QWORD *)a3 + 32))
      goto LABEL_266;
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_connectionEstablishmentTimeMsecs != *((_QWORD *)a3 + 10))
      goto LABEL_266;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_betterRouteEventCount != *((_QWORD *)a3 + 4))
      goto LABEL_266;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_multipathServiceType != *((_QWORD *)a3 + 22))
      goto LABEL_266;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
    if ((v7 & 0x20000000000) != 0)
      goto LABEL_266;
    goto LABEL_237;
  }
  if ((v7 & 0x20000000000) == 0)
    goto LABEL_266;
  if (self->_firstParty)
  {
    if (!*((_BYTE *)a3 + 300))
      goto LABEL_266;
    goto LABEL_237;
  }
  if (*((_BYTE *)a3 + 300))
  {
LABEL_266:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_237:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_multipathBytesInCell != *((_QWORD *)a3 + 16))
      goto LABEL_266;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_multipathBytesOutCell != *((_QWORD *)a3 + 19))
      goto LABEL_266;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_multipathBytesInWiFi != *((_QWORD *)a3 + 18))
      goto LABEL_266;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_multipathBytesOutWiFi != *((_QWORD *)a3 + 21))
      goto LABEL_266;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_multipathBytesInInitial != *((_QWORD *)a3 + 17))
      goto LABEL_266;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_266;
  }
  v8 = *(_QWORD *)((char *)a3 + 308);
  LOBYTE(v5) = (v8 & 0x80000) == 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_multipathBytesOutInitial != *((_QWORD *)a3 + 20))
      goto LABEL_266;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $13AFF146FFF692FEAF73A0FE35206A83 has;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    v50 = 2654435761u * self->_timeToDNSResolvedMsecs;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
    {
LABEL_3:
      v49 = 2654435761 * self->_dNSAnswersCached;
      if ((*(_DWORD *)&has & 0x40000000) != 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else
  {
    v50 = 0;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_3;
  }
  v49 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_4:
    v48 = 2654435761u * self->_timeToConnectionEstablishmentMsecs;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  v48 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_5:
    v47 = 2654435761u * self->_iPAddressAttemptCount;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  v47 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    v46 = 2654435761u * self->_flowDurationMsecs;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  v46 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_7:
    v45 = 2654435761 * self->_connectedInterfaceType;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  v45 = 0;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
LABEL_8:
    v44 = 2654435761 * self->_kernelReportedStalls;
    if ((*(_QWORD *)&has & 0x80000000000) != 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  v44 = 0;
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
LABEL_9:
    v43 = 2654435761 * self->_kernelReportingConnectionStalled;
    if ((*(_QWORD *)&has & 0x100000000000) != 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  v43 = 0;
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
LABEL_10:
    v42 = 2654435761 * self->_kernelReportingReadStalled;
    if ((*(_QWORD *)&has & 0x200000000000) != 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  v42 = 0;
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
  {
LABEL_11:
    v41 = 2654435761 * self->_kernelReportingWriteStalled;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  v41 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_12:
    v40 = 2654435761u * self->_bytesIn;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  v40 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_13:
    v39 = 2654435761u * self->_bytesOut;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  v39 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_14:
    v38 = 2654435761u * self->_bytesDuplicate;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  v38 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_15:
    v37 = 2654435761u * self->_bytesOutOfOrder;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  v37 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_16:
    v36 = 2654435761u * self->_bytesRetransmitted;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  v36 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_17:
    v35 = 2654435761u * self->_packetsIn;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_18:
    v34 = 2654435761u * self->_packetsOut;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_19:
    v33 = 2654435761u * self->_packetsDuplicate;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_20:
    v32 = 2654435761u * self->_packetsOutOfOrder;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_21:
    v31 = 2654435761u * self->_packetsRetransmitted;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  v31 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_22:
    v30 = 2654435761u * self->_currentRTTMsecs;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_23:
    v3 = 2654435761u * self->_smoothedRTTMsecs;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  v3 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_24:
    v4 = 2654435761u * self->_bestRTTMsecs;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_25:
    v5 = 2654435761u * self->_rTTvariance;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_26:
    v6 = 2654435761u * self->_synRetransmissionCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  v6 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_27:
    v7 = 2654435761u * self->_connectionReuseCount;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  v7 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_28:
    v8 = 2654435761u * self->_appReportingDataStallCount;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  v8 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_29:
    v9 = 2654435761u * self->_appDataStallTimerMsecs;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  v9 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_30:
    v10 = 2654435761u * self->_trafficClass;
    if ((*(_QWORD *)&has & 0x400000000000) != 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  v10 = 0;
  if ((*(_QWORD *)&has & 0x400000000000) != 0)
  {
LABEL_31:
    v11 = 2654435761 * self->_tcpFastOpen;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_32;
    goto LABEL_79;
  }
LABEL_78:
  v11 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_32:
    v12 = 2654435761 * self->_cellularFallback;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_33;
    goto LABEL_80;
  }
LABEL_79:
  v12 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_33:
    v13 = 2654435761 * self->_cellularRRCConnected;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_34;
    goto LABEL_81;
  }
LABEL_80:
  v13 = 0;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_34:
    v14 = 2654435761 * self->_connected;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_35;
    goto LABEL_82;
  }
LABEL_81:
  v14 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_35:
    v15 = 2654435761 * self->_interfaceType;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  v15 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_36:
    v16 = 2654435761u * self->_timeToDNSStartMsecs;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  v16 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_37:
    v17 = 2654435761u * self->_dNSResolvedTimeMsecs;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_38:
    v18 = 2654435761u * self->_timeToConnectionStartMsecs;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_39;
    goto LABEL_86;
  }
LABEL_85:
  v18 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_39:
    v19 = 2654435761u * self->_connectionEstablishmentTimeMsecs;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_40;
    goto LABEL_87;
  }
LABEL_86:
  v19 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_40:
    v20 = 2654435761u * self->_betterRouteEventCount;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_41:
    v21 = 2654435761u * self->_multipathServiceType;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
      goto LABEL_42;
    goto LABEL_89;
  }
LABEL_88:
  v21 = 0;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
LABEL_42:
    v22 = 2654435761 * self->_firstParty;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_43;
    goto LABEL_90;
  }
LABEL_89:
  v22 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_43:
    v23 = 2654435761u * self->_multipathBytesInCell;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_44;
    goto LABEL_91;
  }
LABEL_90:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_44:
    v24 = 2654435761u * self->_multipathBytesOutCell;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_45:
    v25 = 2654435761u * self->_multipathBytesInWiFi;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_46;
    goto LABEL_93;
  }
LABEL_92:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_46:
    v26 = 2654435761u * self->_multipathBytesOutWiFi;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_47;
LABEL_94:
    v27 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_48;
LABEL_95:
    v28 = 0;
    return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_93:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_94;
LABEL_47:
  v27 = 2654435761u * self->_multipathBytesInInitial;
  if ((*(_DWORD *)&has & 0x80000) == 0)
    goto LABEL_95;
LABEL_48:
  v28 = 2654435761u * self->_multipathBytesOutInitial;
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x100000000) != 0)
  {
    self->_timeToDNSResolvedMsecs = *((_QWORD *)a3 + 33);
    *(_QWORD *)&self->_has |= 0x100000000uLL;
    v3 = *(_QWORD *)((char *)a3 + 308);
    if ((v3 & 0x10000000000) == 0)
    {
LABEL_3:
      if ((v3 & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else if ((v3 & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_dNSAnswersCached = *((_BYTE *)a3 + 299);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_4:
    if ((v3 & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  self->_timeToConnectionEstablishmentMsecs = *((_QWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x4000) == 0)
  {
LABEL_5:
    if ((v3 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  self->_iPAddressAttemptCount = *((_QWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x2000) == 0)
  {
LABEL_6:
    if ((v3 & 0x800000000) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  self->_flowDurationMsecs = *((_QWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  self->_connectedInterfaceType = *((_DWORD *)a3 + 72);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x40000000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x80000000000) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  self->_kernelReportedStalls = *((_BYTE *)a3 + 301);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x80000000000) == 0)
  {
LABEL_9:
    if ((v3 & 0x100000000000) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  self->_kernelReportingConnectionStalled = *((_BYTE *)a3 + 302);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x100000000000) == 0)
  {
LABEL_10:
    if ((v3 & 0x200000000000) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  self->_kernelReportingReadStalled = *((_BYTE *)a3 + 303);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x200000000000) == 0)
  {
LABEL_11:
    if ((v3 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  self->_kernelReportingWriteStalled = *((_BYTE *)a3 + 304);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x20) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  self->_bytesIn = *((_QWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  self->_bytesOut = *((_QWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x10) == 0)
  {
LABEL_14:
    if ((v3 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  self->_bytesDuplicate = *((_QWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x80) == 0)
  {
LABEL_15:
    if ((v3 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  self->_bytesOutOfOrder = *((_QWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x100) == 0)
  {
LABEL_16:
    if ((v3 & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  self->_bytesRetransmitted = *((_QWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x800000) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000000) == 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  self->_packetsIn = *((_QWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_18:
    if ((v3 & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  self->_packetsOut = *((_QWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x400000) == 0)
  {
LABEL_19:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  self->_packetsDuplicate = *((_QWORD *)a3 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  self->_packetsOutOfOrder = *((_QWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_21:
    if ((v3 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  self->_packetsRetransmitted = *((_QWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x800) == 0)
  {
LABEL_22:
    if ((v3 & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  self->_currentRTTMsecs = *((_QWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_23:
    if ((v3 & 4) == 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  self->_smoothedRTTMsecs = *((_QWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 4) == 0)
  {
LABEL_24:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  self->_bestRTTMsecs = *((_QWORD *)a3 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  self->_rTTvariance = *((_QWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  self->_synRetransmissionCount = *((_QWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x400) == 0)
  {
LABEL_27:
    if ((v3 & 2) == 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  self->_connectionReuseCount = *((_QWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 2) == 0)
  {
LABEL_28:
    if ((v3 & 1) == 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  self->_appReportingDataStallCount = *((_QWORD *)a3 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 1) == 0)
  {
LABEL_29:
    if ((v3 & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  self->_appDataStallTimerMsecs = *((_QWORD *)a3 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x400000000000) == 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  self->_trafficClass = *((_QWORD *)a3 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x400000000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x2000000000) == 0)
      goto LABEL_32;
    goto LABEL_79;
  }
LABEL_78:
  self->_tcpFastOpen = *((_BYTE *)a3 + 305);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x4000000000) == 0)
      goto LABEL_33;
    goto LABEL_80;
  }
LABEL_79:
  self->_cellularFallback = *((_BYTE *)a3 + 296);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_33:
    if ((v3 & 0x8000000000) == 0)
      goto LABEL_34;
    goto LABEL_81;
  }
LABEL_80:
  self->_cellularRRCConnected = *((_BYTE *)a3 + 297);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x8000000000) == 0)
  {
LABEL_34:
    if ((v3 & 0x1000000000) == 0)
      goto LABEL_35;
    goto LABEL_82;
  }
LABEL_81:
  self->_connected = *((_BYTE *)a3 + 298);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_35:
    if ((v3 & 0x200000000) == 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  self->_interfaceType = *((_DWORD *)a3 + 73);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_36:
    if ((v3 & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  self->_timeToDNSStartMsecs = *((_QWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x1000) == 0)
  {
LABEL_37:
    if ((v3 & 0x80000000) == 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  self->_dNSResolvedTimeMsecs = *((_QWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_38:
    if ((v3 & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_86;
  }
LABEL_85:
  self->_timeToConnectionStartMsecs = *((_QWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x200) == 0)
  {
LABEL_39:
    if ((v3 & 8) == 0)
      goto LABEL_40;
    goto LABEL_87;
  }
LABEL_86:
  self->_connectionEstablishmentTimeMsecs = *((_QWORD *)a3 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 8) == 0)
  {
LABEL_40:
    if ((v3 & 0x200000) == 0)
      goto LABEL_41;
    goto LABEL_88;
  }
LABEL_87:
  self->_betterRouteEventCount = *((_QWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x200000) == 0)
  {
LABEL_41:
    if ((v3 & 0x20000000000) == 0)
      goto LABEL_42;
    goto LABEL_89;
  }
LABEL_88:
  self->_multipathServiceType = *((_QWORD *)a3 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_42:
    if ((v3 & 0x8000) == 0)
      goto LABEL_43;
    goto LABEL_90;
  }
LABEL_89:
  self->_firstParty = *((_BYTE *)a3 + 300);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x8000) == 0)
  {
LABEL_43:
    if ((v3 & 0x40000) == 0)
      goto LABEL_44;
    goto LABEL_91;
  }
LABEL_90:
  self->_multipathBytesInCell = *((_QWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x40000) == 0)
  {
LABEL_44:
    if ((v3 & 0x20000) == 0)
      goto LABEL_45;
    goto LABEL_92;
  }
LABEL_91:
  self->_multipathBytesOutCell = *((_QWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x20000) == 0)
  {
LABEL_45:
    if ((v3 & 0x100000) == 0)
      goto LABEL_46;
    goto LABEL_93;
  }
LABEL_92:
  self->_multipathBytesInWiFi = *((_QWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x100000) == 0)
  {
LABEL_46:
    if ((v3 & 0x10000) == 0)
      goto LABEL_47;
    goto LABEL_94;
  }
LABEL_93:
  self->_multipathBytesOutWiFi = *((_QWORD *)a3 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v3 = *(_QWORD *)((char *)a3 + 308);
  if ((v3 & 0x10000) == 0)
  {
LABEL_47:
    if ((v3 & 0x80000) == 0)
      return;
LABEL_95:
    self->_multipathBytesOutInitial = *((_QWORD *)a3 + 20);
    *(_QWORD *)&self->_has |= 0x80000uLL;
    return;
  }
LABEL_94:
  self->_multipathBytesInInitial = *((_QWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  if ((*(_QWORD *)((_BYTE *)a3 + 308) & 0x80000) != 0)
    goto LABEL_95;
}

- (unint64_t)timeToDNSResolvedMsecs
{
  return self->_timeToDNSResolvedMsecs;
}

- (BOOL)dNSAnswersCached
{
  return self->_dNSAnswersCached;
}

- (unint64_t)timeToConnectionEstablishmentMsecs
{
  return self->_timeToConnectionEstablishmentMsecs;
}

- (unint64_t)iPAddressAttemptCount
{
  return self->_iPAddressAttemptCount;
}

- (unint64_t)flowDurationMsecs
{
  return self->_flowDurationMsecs;
}

- (BOOL)kernelReportedStalls
{
  return self->_kernelReportedStalls;
}

- (BOOL)kernelReportingConnectionStalled
{
  return self->_kernelReportingConnectionStalled;
}

- (BOOL)kernelReportingReadStalled
{
  return self->_kernelReportingReadStalled;
}

- (BOOL)kernelReportingWriteStalled
{
  return self->_kernelReportingWriteStalled;
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

- (unint64_t)packetsDuplicate
{
  return self->_packetsDuplicate;
}

- (unint64_t)packetsOutOfOrder
{
  return self->_packetsOutOfOrder;
}

- (unint64_t)packetsRetransmitted
{
  return self->_packetsRetransmitted;
}

- (unint64_t)currentRTTMsecs
{
  return self->_currentRTTMsecs;
}

- (unint64_t)smoothedRTTMsecs
{
  return self->_smoothedRTTMsecs;
}

- (unint64_t)bestRTTMsecs
{
  return self->_bestRTTMsecs;
}

- (unint64_t)rTTvariance
{
  return self->_rTTvariance;
}

- (unint64_t)synRetransmissionCount
{
  return self->_synRetransmissionCount;
}

- (unint64_t)connectionReuseCount
{
  return self->_connectionReuseCount;
}

- (unint64_t)appReportingDataStallCount
{
  return self->_appReportingDataStallCount;
}

- (unint64_t)appDataStallTimerMsecs
{
  return self->_appDataStallTimerMsecs;
}

- (unint64_t)trafficClass
{
  return self->_trafficClass;
}

- (BOOL)tcpFastOpen
{
  return self->_tcpFastOpen;
}

- (BOOL)cellularFallback
{
  return self->_cellularFallback;
}

- (BOOL)cellularRRCConnected
{
  return self->_cellularRRCConnected;
}

- (BOOL)connected
{
  return self->_connected;
}

- (unint64_t)timeToDNSStartMsecs
{
  return self->_timeToDNSStartMsecs;
}

- (unint64_t)dNSResolvedTimeMsecs
{
  return self->_dNSResolvedTimeMsecs;
}

- (unint64_t)timeToConnectionStartMsecs
{
  return self->_timeToConnectionStartMsecs;
}

- (unint64_t)connectionEstablishmentTimeMsecs
{
  return self->_connectionEstablishmentTimeMsecs;
}

- (unint64_t)betterRouteEventCount
{
  return self->_betterRouteEventCount;
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

@end
