@implementation AWDFaceTimeCallEnded

- (void)dealloc
{
  objc_super v3;

  -[AWDFaceTimeCallEnded setGuid:](self, "setGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallEnded;
  -[AWDFaceTimeCallEnded dealloc](&v3, sel_dealloc);
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setEndedReason:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_endedReason = a3;
}

- (void)setHasEndedReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasEndedReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setGenericError:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_genericError = a3;
}

- (void)setHasGenericError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasGenericError
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setViceroyError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_viceroyError = a3;
}

- (void)setHasViceroyError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasViceroyError
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setGameKitError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_gameKitError = a3;
}

- (void)setHasGameKitError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasGameKitError
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMessageDeliveryError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_messageDeliveryError = a3;
}

- (void)setHasMessageDeliveryError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasMessageDeliveryError
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setConferenceMiscError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_conferenceMiscError = a3;
}

- (void)setHasConferenceMiscError:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasConferenceMiscError
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRegistrationError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_registrationError = a3;
}

- (void)setHasRegistrationError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasRegistrationError
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setRelayError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_relayError = a3;
}

- (void)setHasRelayError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasRelayError
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setInvitationServiceError:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_invitationServiceError = a3;
}

- (void)setHasInvitationServiceError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasInvitationServiceError
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCallDuration:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCallDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDiagnosticPingMin:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_diagnosticPingMin = a3;
}

- (void)setHasDiagnosticPingMin:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasDiagnosticPingMin
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDiagnosticPingAvg:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_diagnosticPingAvg = a3;
}

- (void)setHasDiagnosticPingAvg:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasDiagnosticPingAvg
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDiagnosticPingMax:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_diagnosticPingMax = a3;
}

- (void)setHasDiagnosticPingMax:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasDiagnosticPingMax
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDiagnosticPingPacketLoss:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_diagnosticPingPacketLoss = a3;
}

- (void)setHasDiagnosticPingPacketLoss:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasDiagnosticPingPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsNetworkEnabled:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_isNetworkEnabled = a3;
}

- (void)setHasIsNetworkEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasIsNetworkEnabled
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIsNetworkActive:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_isNetworkActive = a3;
}

- (void)setHasIsNetworkActive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasIsNetworkActive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsNetworkReachable:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_isNetworkReachable = a3;
}

- (void)setHasIsNetworkReachable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasIsNetworkReachable
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setNetworkCheckResult:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_networkCheckResult = a3;
}

- (void)setHasNetworkCheckResult:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasNetworkCheckResult
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setFrontCameraCaptureDuration:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_frontCameraCaptureDuration = a3;
}

- (void)setHasFrontCameraCaptureDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasFrontCameraCaptureDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBackCameraCaptureDuration:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_backCameraCaptureDuration = a3;
}

- (void)setHasBackCameraCaptureDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBackCameraCaptureDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDataRate:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_dataRate = a3;
}

- (void)setHasDataRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDataRate
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setGksError:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_gksError = a3;
}

- (void)setHasGksError:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasGksError
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setConnectDuration:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasConnectDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRemoteNetworkConnection:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_remoteNetworkConnection = a3;
}

- (void)setHasRemoteNetworkConnection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasRemoteNetworkConnection
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setLocalNetworkConnection:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_localNetworkConnection = a3;
}

- (void)setHasLocalNetworkConnection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasLocalNetworkConnection
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setUsesRelay:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_usesRelay = a3;
}

- (void)setHasUsesRelay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasUsesRelay
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCurrentNatType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_currentNatType = a3;
}

- (void)setHasCurrentNatType:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCurrentNatType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRemoteNatType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_remoteNatType = a3;
}

- (void)setHasRemoteNatType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasRemoteNatType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setRelayConnectDuration:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_relayConnectDuration = a3;
}

- (void)setHasRelayConnectDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasRelayConnectDuration
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsInitiator:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_isInitiator = a3;
}

- (void)setHasIsInitiator:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasIsInitiator
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIsVideoInterrupted:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_isVideoInterrupted = a3;
}

- (void)setHasIsVideoInterrupted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIsVideoInterrupted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsAudioInterrupted:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_isAudioInterrupted = a3;
}

- (void)setHasIsAudioInterrupted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasIsAudioInterrupted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsCallUpgrade:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_isCallUpgrade = a3;
}

- (void)setHasIsCallUpgrade:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasIsCallUpgrade
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasLinkQuality
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setGksReturnCode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_gksReturnCode = a3;
}

- (void)setHasGksReturnCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasGksReturnCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsVideo:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIsVideo
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setOnLockScreen:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_onLockScreen = a3;
}

- (void)setHasOnLockScreen:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($2E1D1250F3007657D3C99B0A38770238)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasOnLockScreen
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallEnded;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDFaceTimeCallEnded description](&v3, sel_description), -[AWDFaceTimeCallEnded dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guid;
  $2E1D1250F3007657D3C99B0A38770238 has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  guid = self->_guid;
  if (guid)
    objc_msgSend(v3, "setObject:forKey:", guid, CFSTR("guid"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_6;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_endedReason), CFSTR("endedReason"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_genericError), CFSTR("genericError"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_viceroyError), CFSTR("viceroyError"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_gameKitError), CFSTR("gameKitError"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_messageDeliveryError), CFSTR("messageDeliveryError"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_conferenceMiscError), CFSTR("conferenceMiscError"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_registrationError), CFSTR("registrationError"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_relayError), CFSTR("relayError"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_invitationServiceError), CFSTR("invitationServiceError"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_callDuration), CFSTR("callDuration"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_diagnosticPingMin), CFSTR("diagnosticPingMin"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_diagnosticPingAvg), CFSTR("diagnosticPingAvg"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_diagnosticPingMax), CFSTR("diagnosticPingMax"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_diagnosticPingPacketLoss), CFSTR("diagnosticPingPacketLoss"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkEnabled), CFSTR("isNetworkEnabled"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkActive), CFSTR("isNetworkActive"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isNetworkReachable), CFSTR("isNetworkReachable"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_networkCheckResult), CFSTR("networkCheckResult"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_frontCameraCaptureDuration), CFSTR("frontCameraCaptureDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_backCameraCaptureDuration), CFSTR("backCameraCaptureDuration"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_dataRate), CFSTR("dataRate"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_gksError), CFSTR("gksError"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectDuration), CFSTR("connectDuration"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteNetworkConnection), CFSTR("remoteNetworkConnection"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_localNetworkConnection), CFSTR("localNetworkConnection"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_connectionType), CFSTR("connectionType"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_usesRelay), CFSTR("usesRelay"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_currentNatType), CFSTR("currentNatType"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteNatType), CFSTR("remoteNatType"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_relayConnectDuration), CFSTR("relayConnectDuration"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isInitiator), CFSTR("isInitiator"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isVideoInterrupted), CFSTR("isVideoInterrupted"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isAudioInterrupted), CFSTR("isAudioInterrupted"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_39;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isCallUpgrade), CFSTR("isCallUpgrade"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_40;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkQuality), CFSTR("linkQuality"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_41;
LABEL_81:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_isVideo), CFSTR("isVideo"));
    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      return v4;
    goto LABEL_42;
  }
LABEL_80:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_gksReturnCode), CFSTR("gksReturnCode"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
    goto LABEL_81;
LABEL_41:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
LABEL_42:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_onLockScreen), CFSTR("onLockScreen"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFaceTimeCallEndedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $2E1D1250F3007657D3C99B0A38770238 has;

  if (self->_guid)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_6;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_19;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_20;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_24;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_28;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_29;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_33;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_34;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_35;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_36;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_37;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_39;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_40;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      return;
LABEL_81:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
    goto LABEL_81;
}

- (void)copyTo:(id)a3
{
  $2E1D1250F3007657D3C99B0A38770238 has;

  if (self->_guid)
    objc_msgSend(a3, "setGuid:");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *(_QWORD *)((char *)a3 + 180) |= 1uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_6;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 15) = self->_endedReason;
  *(_QWORD *)((char *)a3 + 180) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 18) = self->_genericError;
  *(_QWORD *)((char *)a3 + 180) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 44) = self->_viceroyError;
  *(_QWORD *)((char *)a3 + 180) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 17) = self->_gameKitError;
  *(_QWORD *)((char *)a3 + 180) |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 35) = self->_messageDeliveryError;
  *(_QWORD *)((char *)a3 + 180) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 6) = self->_conferenceMiscError;
  *(_QWORD *)((char *)a3 + 180) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 38) = self->_registrationError;
  *(_QWORD *)((char *)a3 + 180) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 40) = self->_relayError;
  *(_QWORD *)((char *)a3 + 180) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 24) = self->_invitationServiceError;
  *(_QWORD *)((char *)a3 + 180) |= 0x40000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 5) = self->_callDuration;
  *(_QWORD *)((char *)a3 + 180) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 13) = self->_diagnosticPingMin;
  *(_QWORD *)((char *)a3 + 180) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 11) = self->_diagnosticPingAvg;
  *(_QWORD *)((char *)a3 + 180) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 12) = self->_diagnosticPingMax;
  *(_QWORD *)((char *)a3 + 180) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 14) = self->_diagnosticPingPacketLoss;
  *(_QWORD *)((char *)a3 + 180) |= 0x800uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 29) = self->_isNetworkEnabled;
  *(_QWORD *)((char *)a3 + 180) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 28) = self->_isNetworkActive;
  *(_QWORD *)((char *)a3 + 180) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 30) = self->_isNetworkReachable;
  *(_QWORD *)((char *)a3 + 180) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 36) = self->_networkCheckResult;
  *(_QWORD *)((char *)a3 + 180) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 16) = self->_frontCameraCaptureDuration;
  *(_QWORD *)((char *)a3 + 180) |= 0x2000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 4) = self->_backCameraCaptureDuration;
  *(_QWORD *)((char *)a3 + 180) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 10) = self->_dataRate;
  *(_QWORD *)((char *)a3 + 180) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 19) = self->_gksError;
  *(_QWORD *)((char *)a3 + 180) |= 0x10000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 7) = self->_connectDuration;
  *(_QWORD *)((char *)a3 + 180) |= 0x10uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 42) = self->_remoteNetworkConnection;
  *(_QWORD *)((char *)a3 + 180) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)a3 + 34) = self->_localNetworkConnection;
  *(_QWORD *)((char *)a3 + 180) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)a3 + 8) = self->_connectionType;
  *(_QWORD *)((char *)a3 + 180) |= 0x20uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)a3 + 43) = self->_usesRelay;
  *(_QWORD *)((char *)a3 + 180) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)a3 + 9) = self->_currentNatType;
  *(_QWORD *)((char *)a3 + 180) |= 0x40uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 41) = self->_remoteNatType;
  *(_QWORD *)((char *)a3 + 180) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 39) = self->_relayConnectDuration;
  *(_QWORD *)((char *)a3 + 180) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 27) = self->_isInitiator;
  *(_QWORD *)((char *)a3 + 180) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 32) = self->_isVideoInterrupted;
  *(_QWORD *)((char *)a3 + 180) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 25) = self->_isAudioInterrupted;
  *(_QWORD *)((char *)a3 + 180) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_39;
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 26) = self->_isCallUpgrade;
  *(_QWORD *)((char *)a3 + 180) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_40;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 33) = self->_linkQuality;
  *(_QWORD *)((char *)a3 + 180) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)a3 + 20) = self->_gksReturnCode;
  *(_QWORD *)((char *)a3 + 180) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      return;
    goto LABEL_42;
  }
LABEL_81:
  *((_DWORD *)a3 + 31) = self->_isVideo;
  *(_QWORD *)((char *)a3 + 180) |= 0x2000000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
    return;
LABEL_42:
  *((_DWORD *)a3 + 37) = self->_onLockScreen;
  *(_QWORD *)((char *)a3 + 180) |= 0x80000000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  $2E1D1250F3007657D3C99B0A38770238 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_QWORD *)(v5 + 180) |= 1uLL;
    has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_endedReason;
  *(_QWORD *)(v5 + 180) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_5;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 72) = self->_genericError;
  *(_QWORD *)(v5 + 180) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_6;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 176) = self->_viceroyError;
  *(_QWORD *)(v5 + 180) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 68) = self->_gameKitError;
  *(_QWORD *)(v5 + 180) |= 0x4000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 140) = self->_messageDeliveryError;
  *(_QWORD *)(v5 + 180) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 24) = self->_conferenceMiscError;
  *(_QWORD *)(v5 + 180) |= 8uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 152) = self->_registrationError;
  *(_QWORD *)(v5 + 180) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 160) = self->_relayError;
  *(_QWORD *)(v5 + 180) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 96) = self->_invitationServiceError;
  *(_QWORD *)(v5 + 180) |= 0x40000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v5 + 20) = self->_callDuration;
  *(_QWORD *)(v5 + 180) |= 4uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 52) = self->_diagnosticPingMin;
  *(_QWORD *)(v5 + 180) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 44) = self->_diagnosticPingAvg;
  *(_QWORD *)(v5 + 180) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 48) = self->_diagnosticPingMax;
  *(_QWORD *)(v5 + 180) |= 0x200uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v5 + 56) = self->_diagnosticPingPacketLoss;
  *(_QWORD *)(v5 + 180) |= 0x800uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 116) = self->_isNetworkEnabled;
  *(_QWORD *)(v5 + 180) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 112) = self->_isNetworkActive;
  *(_QWORD *)(v5 + 180) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 120) = self->_isNetworkReachable;
  *(_QWORD *)(v5 + 180) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v5 + 144) = self->_networkCheckResult;
  *(_QWORD *)(v5 + 180) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 64) = self->_frontCameraCaptureDuration;
  *(_QWORD *)(v5 + 180) |= 0x2000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 16) = self->_backCameraCaptureDuration;
  *(_QWORD *)(v5 + 180) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v5 + 40) = self->_dataRate;
  *(_QWORD *)(v5 + 180) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v5 + 76) = self->_gksError;
  *(_QWORD *)(v5 + 180) |= 0x10000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v5 + 28) = self->_connectDuration;
  *(_QWORD *)(v5 + 180) |= 0x10uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v5 + 168) = self->_remoteNetworkConnection;
  *(_QWORD *)(v5 + 180) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v5 + 136) = self->_localNetworkConnection;
  *(_QWORD *)(v5 + 180) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v5 + 32) = self->_connectionType;
  *(_QWORD *)(v5 + 180) |= 0x20uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v5 + 172) = self->_usesRelay;
  *(_QWORD *)(v5 + 180) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 36) = self->_currentNatType;
  *(_QWORD *)(v5 + 180) |= 0x40uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v5 + 164) = self->_remoteNatType;
  *(_QWORD *)(v5 + 180) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 156) = self->_relayConnectDuration;
  *(_QWORD *)(v5 + 180) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 108) = self->_isInitiator;
  *(_QWORD *)(v5 + 180) |= 0x200000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 128) = self->_isVideoInterrupted;
  *(_QWORD *)(v5 + 180) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 100) = self->_isAudioInterrupted;
  *(_QWORD *)(v5 + 180) |= 0x80000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 104) = self->_isCallUpgrade;
  *(_QWORD *)(v5 + 180) |= 0x100000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 132) = self->_linkQuality;
  *(_QWORD *)(v5 + 180) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_39;
LABEL_79:
    *(_DWORD *)(v5 + 124) = self->_isVideo;
    *(_QWORD *)(v5 + 180) |= 0x2000000uLL;
    if ((*(_QWORD *)&self->_has & 0x80000000) == 0)
      return (id)v5;
    goto LABEL_40;
  }
LABEL_78:
  *(_DWORD *)(v5 + 80) = self->_gksReturnCode;
  *(_QWORD *)(v5 + 180) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
    goto LABEL_79;
LABEL_39:
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_40:
    *(_DWORD *)(v5 + 148) = self->_onLockScreen;
    *(_QWORD *)(v5 + 180) |= 0x80000000uLL;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *guid;
  $2E1D1250F3007657D3C99B0A38770238 has;
  uint64_t v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((_QWORD *)a3 + 11)) || (v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      has = self->_has;
      v8 = *(_QWORD *)((char *)a3 + 180);
      if ((*(_BYTE *)&has & 1) != 0)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
          goto LABEL_199;
      }
      else if ((v8 & 1) != 0)
      {
LABEL_199:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_WORD *)&has & 0x1000) != 0)
      {
        if ((v8 & 0x1000) == 0 || self->_endedReason != *((_DWORD *)a3 + 15))
          goto LABEL_199;
      }
      else if ((v8 & 0x1000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_WORD *)&has & 0x8000) != 0)
      {
        if ((v8 & 0x8000) == 0 || self->_genericError != *((_DWORD *)a3 + 18))
          goto LABEL_199;
      }
      else if ((v8 & 0x8000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_QWORD *)&has & 0x4000000000) != 0)
      {
        if ((v8 & 0x4000000000) == 0 || self->_viceroyError != *((_DWORD *)a3 + 44))
          goto LABEL_199;
      }
      else if ((v8 & 0x4000000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_WORD *)&has & 0x4000) != 0)
      {
        if ((v8 & 0x4000) == 0 || self->_gameKitError != *((_DWORD *)a3 + 17))
          goto LABEL_199;
      }
      else if ((v8 & 0x4000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x20000000) != 0)
      {
        if ((v8 & 0x20000000) == 0 || self->_messageDeliveryError != *((_DWORD *)a3 + 35))
          goto LABEL_199;
      }
      else if ((v8 & 0x20000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_BYTE *)&has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_conferenceMiscError != *((_DWORD *)a3 + 6))
          goto LABEL_199;
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_QWORD *)&has & 0x100000000) != 0)
      {
        if ((v8 & 0x100000000) == 0 || self->_registrationError != *((_DWORD *)a3 + 38))
          goto LABEL_199;
      }
      else if ((v8 & 0x100000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_QWORD *)&has & 0x400000000) != 0)
      {
        if ((v8 & 0x400000000) == 0 || self->_relayError != *((_DWORD *)a3 + 40))
          goto LABEL_199;
      }
      else if ((v8 & 0x400000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x40000) != 0)
      {
        if ((v8 & 0x40000) == 0 || self->_invitationServiceError != *((_DWORD *)a3 + 24))
          goto LABEL_199;
      }
      else if ((v8 & 0x40000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_BYTE *)&has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_callDuration != *((_DWORD *)a3 + 5))
          goto LABEL_199;
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_WORD *)&has & 0x400) != 0)
      {
        if ((v8 & 0x400) == 0 || self->_diagnosticPingMin != *((_DWORD *)a3 + 13))
          goto LABEL_199;
      }
      else if ((v8 & 0x400) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_WORD *)&has & 0x100) != 0)
      {
        if ((v8 & 0x100) == 0 || self->_diagnosticPingAvg != *((_DWORD *)a3 + 11))
          goto LABEL_199;
      }
      else if ((v8 & 0x100) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_WORD *)&has & 0x200) != 0)
      {
        if ((v8 & 0x200) == 0 || self->_diagnosticPingMax != *((_DWORD *)a3 + 12))
          goto LABEL_199;
      }
      else if ((v8 & 0x200) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_WORD *)&has & 0x800) != 0)
      {
        if ((v8 & 0x800) == 0 || self->_diagnosticPingPacketLoss != *((_DWORD *)a3 + 14))
          goto LABEL_199;
      }
      else if ((v8 & 0x800) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x800000) != 0)
      {
        if ((v8 & 0x800000) == 0 || self->_isNetworkEnabled != *((_DWORD *)a3 + 29))
          goto LABEL_199;
      }
      else if ((v8 & 0x800000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x400000) != 0)
      {
        if ((v8 & 0x400000) == 0 || self->_isNetworkActive != *((_DWORD *)a3 + 28))
          goto LABEL_199;
      }
      else if ((v8 & 0x400000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x1000000) != 0)
      {
        if ((v8 & 0x1000000) == 0 || self->_isNetworkReachable != *((_DWORD *)a3 + 30))
          goto LABEL_199;
      }
      else if ((v8 & 0x1000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x40000000) != 0)
      {
        if ((v8 & 0x40000000) == 0 || self->_networkCheckResult != *((_DWORD *)a3 + 36))
          goto LABEL_199;
      }
      else if ((v8 & 0x40000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_WORD *)&has & 0x2000) != 0)
      {
        if ((v8 & 0x2000) == 0 || self->_frontCameraCaptureDuration != *((_DWORD *)a3 + 16))
          goto LABEL_199;
      }
      else if ((v8 & 0x2000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_BYTE *)&has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_backCameraCaptureDuration != *((_DWORD *)a3 + 4))
          goto LABEL_199;
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_BYTE *)&has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_dataRate != *((_DWORD *)a3 + 10))
          goto LABEL_199;
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x10000) != 0)
      {
        if ((v8 & 0x10000) == 0 || self->_gksError != *((_DWORD *)a3 + 19))
          goto LABEL_199;
      }
      else if ((v8 & 0x10000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_BYTE *)&has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_connectDuration != *((_DWORD *)a3 + 7))
          goto LABEL_199;
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_QWORD *)&has & 0x1000000000) != 0)
      {
        if ((v8 & 0x1000000000) == 0 || self->_remoteNetworkConnection != *((_DWORD *)a3 + 42))
          goto LABEL_199;
      }
      else if ((v8 & 0x1000000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x10000000) != 0)
      {
        if ((v8 & 0x10000000) == 0 || self->_localNetworkConnection != *((_DWORD *)a3 + 34))
          goto LABEL_199;
      }
      else if ((v8 & 0x10000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_BYTE *)&has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_connectionType != *((_DWORD *)a3 + 8))
          goto LABEL_199;
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_QWORD *)&has & 0x2000000000) != 0)
      {
        if ((v8 & 0x2000000000) == 0 || self->_usesRelay != *((_DWORD *)a3 + 43))
          goto LABEL_199;
      }
      else if ((v8 & 0x2000000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_BYTE *)&has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_currentNatType != *((_DWORD *)a3 + 9))
          goto LABEL_199;
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_QWORD *)&has & 0x800000000) != 0)
      {
        if ((v8 & 0x800000000) == 0 || self->_remoteNatType != *((_DWORD *)a3 + 41))
          goto LABEL_199;
      }
      else if ((v8 & 0x800000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_QWORD *)&has & 0x200000000) != 0)
      {
        if ((v8 & 0x200000000) == 0 || self->_relayConnectDuration != *((_DWORD *)a3 + 39))
          goto LABEL_199;
      }
      else if ((v8 & 0x200000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x200000) != 0)
      {
        if ((v8 & 0x200000) == 0 || self->_isInitiator != *((_DWORD *)a3 + 27))
          goto LABEL_199;
      }
      else if ((v8 & 0x200000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x4000000) != 0)
      {
        if ((v8 & 0x4000000) == 0 || self->_isVideoInterrupted != *((_DWORD *)a3 + 32))
          goto LABEL_199;
      }
      else if ((v8 & 0x4000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x80000) != 0)
      {
        if ((v8 & 0x80000) == 0 || self->_isAudioInterrupted != *((_DWORD *)a3 + 25))
          goto LABEL_199;
      }
      else if ((v8 & 0x80000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x100000) != 0)
      {
        if ((v8 & 0x100000) == 0 || self->_isCallUpgrade != *((_DWORD *)a3 + 26))
          goto LABEL_199;
      }
      else if ((v8 & 0x100000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x8000000) != 0)
      {
        if ((v8 & 0x8000000) == 0 || self->_linkQuality != *((_DWORD *)a3 + 33))
          goto LABEL_199;
      }
      else if ((v8 & 0x8000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x20000) != 0)
      {
        if ((v8 & 0x20000) == 0 || self->_gksReturnCode != *((_DWORD *)a3 + 20))
          goto LABEL_199;
      }
      else if ((v8 & 0x20000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x2000000) != 0)
      {
        if ((v8 & 0x2000000) == 0 || self->_isVideo != *((_DWORD *)a3 + 31))
          goto LABEL_199;
      }
      else if ((v8 & 0x2000000) != 0)
      {
        goto LABEL_199;
      }
      if ((*(_DWORD *)&has & 0x80000000) != 0)
      {
        if ((v8 & 0x80000000) == 0 || self->_onLockScreen != *((_DWORD *)a3 + 37))
          goto LABEL_199;
        LOBYTE(v5) = 1;
      }
      else
      {
        LOBYTE(v5) = (int)v8 >= 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $2E1D1250F3007657D3C99B0A38770238 has;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  NSUInteger v44;

  v44 = -[NSString hash](self->_guid, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v43 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_3:
      v42 = 2654435761 * self->_endedReason;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_43;
    }
  }
  else
  {
    v43 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_3;
  }
  v42 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v41 = 2654435761 * self->_genericError;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_5;
    goto LABEL_44;
  }
LABEL_43:
  v41 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_5:
    v40 = 2654435761 * self->_viceroyError;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_6;
    goto LABEL_45;
  }
LABEL_44:
  v40 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_6:
    v39 = 2654435761 * self->_gameKitError;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  v39 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_7:
    v38 = 2654435761 * self->_messageDeliveryError;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  v38 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_8:
    v37 = 2654435761 * self->_conferenceMiscError;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  v37 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_9:
    v36 = 2654435761 * self->_registrationError;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  v36 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_10:
    v35 = 2654435761 * self->_relayError;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_49:
  v35 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_11:
    v34 = 2654435761 * self->_invitationServiceError;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_50:
  v34 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_12:
    v33 = 2654435761 * self->_callDuration;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_52;
  }
LABEL_51:
  v33 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_13:
    v32 = 2654435761 * self->_diagnosticPingMin;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_14;
    goto LABEL_53;
  }
LABEL_52:
  v32 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_14:
    v31 = 2654435761 * self->_diagnosticPingAvg;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_15;
    goto LABEL_54;
  }
LABEL_53:
  v31 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_15:
    v4 = 2654435761 * self->_diagnosticPingMax;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_16;
    goto LABEL_55;
  }
LABEL_54:
  v4 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    v5 = 2654435761 * self->_diagnosticPingPacketLoss;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_17;
    goto LABEL_56;
  }
LABEL_55:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_17:
    v6 = 2654435761 * self->_isNetworkEnabled;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_18;
    goto LABEL_57;
  }
LABEL_56:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_18:
    v7 = 2654435761 * self->_isNetworkActive;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_19;
    goto LABEL_58;
  }
LABEL_57:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_19:
    v8 = 2654435761 * self->_isNetworkReachable;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_20;
    goto LABEL_59;
  }
LABEL_58:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_20:
    v9 = 2654435761 * self->_networkCheckResult;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_21;
    goto LABEL_60;
  }
LABEL_59:
  v9 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_21:
    v10 = 2654435761 * self->_frontCameraCaptureDuration;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_22;
    goto LABEL_61;
  }
LABEL_60:
  v10 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_22:
    v11 = 2654435761 * self->_backCameraCaptureDuration;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_23;
    goto LABEL_62;
  }
LABEL_61:
  v11 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_23:
    v12 = 2654435761 * self->_dataRate;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_24;
    goto LABEL_63;
  }
LABEL_62:
  v12 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_24:
    v13 = 2654435761 * self->_gksError;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_25;
    goto LABEL_64;
  }
LABEL_63:
  v13 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_25:
    v14 = 2654435761 * self->_connectDuration;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_26;
    goto LABEL_65;
  }
LABEL_64:
  v14 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_26:
    v15 = 2654435761 * self->_remoteNetworkConnection;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_27;
    goto LABEL_66;
  }
LABEL_65:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_27:
    v16 = 2654435761 * self->_localNetworkConnection;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_28;
    goto LABEL_67;
  }
LABEL_66:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_28:
    v17 = 2654435761 * self->_connectionType;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_29;
    goto LABEL_68;
  }
LABEL_67:
  v17 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
LABEL_29:
    v18 = 2654435761 * self->_usesRelay;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_30;
    goto LABEL_69;
  }
LABEL_68:
  v18 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_30:
    v19 = 2654435761 * self->_currentNatType;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_31;
    goto LABEL_70;
  }
LABEL_69:
  v19 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_31:
    v20 = 2654435761 * self->_remoteNatType;
    if ((*(_QWORD *)&has & 0x200000000) != 0)
      goto LABEL_32;
    goto LABEL_71;
  }
LABEL_70:
  v20 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_32:
    v21 = 2654435761 * self->_relayConnectDuration;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_33;
    goto LABEL_72;
  }
LABEL_71:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_33:
    v22 = 2654435761 * self->_isInitiator;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_34;
    goto LABEL_73;
  }
LABEL_72:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_34:
    v23 = 2654435761 * self->_isVideoInterrupted;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_35;
    goto LABEL_74;
  }
LABEL_73:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_35:
    v24 = 2654435761 * self->_isAudioInterrupted;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_36;
    goto LABEL_75;
  }
LABEL_74:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_36:
    v25 = 2654435761 * self->_isCallUpgrade;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_37;
    goto LABEL_76;
  }
LABEL_75:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_37:
    v26 = 2654435761 * self->_linkQuality;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_38;
    goto LABEL_77;
  }
LABEL_76:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_38:
    v27 = 2654435761 * self->_gksReturnCode;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_39;
LABEL_78:
    v28 = 0;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_40;
LABEL_79:
    v29 = 0;
    return v43 ^ v44 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_77:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
    goto LABEL_78;
LABEL_39:
  v28 = 2654435761 * self->_isVideo;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
    goto LABEL_79;
LABEL_40:
  v29 = 2654435761 * self->_onLockScreen;
  return v43 ^ v44 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;

  if (*((_QWORD *)a3 + 11))
    -[AWDFaceTimeCallEnded setGuid:](self, "setGuid:");
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v5 = *(_QWORD *)((char *)a3 + 180);
    if ((v5 & 0x1000) == 0)
    {
LABEL_5:
      if ((v5 & 0x8000) == 0)
        goto LABEL_6;
      goto LABEL_46;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  self->_endedReason = *((_DWORD *)a3 + 15);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x8000) == 0)
  {
LABEL_6:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_7;
    goto LABEL_47;
  }
LABEL_46:
  self->_genericError = *((_DWORD *)a3 + 18);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_47:
  self->_viceroyError = *((_DWORD *)a3 + 44);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x4000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_9;
    goto LABEL_49;
  }
LABEL_48:
  self->_gameKitError = *((_DWORD *)a3 + 17);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_50;
  }
LABEL_49:
  self->_messageDeliveryError = *((_DWORD *)a3 + 35);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_11;
    goto LABEL_51;
  }
LABEL_50:
  self->_conferenceMiscError = *((_DWORD *)a3 + 6);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_12;
    goto LABEL_52;
  }
LABEL_51:
  self->_registrationError = *((_DWORD *)a3 + 38);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_53;
  }
LABEL_52:
  self->_relayError = *((_DWORD *)a3 + 40);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x40000) == 0)
  {
LABEL_13:
    if ((v5 & 4) == 0)
      goto LABEL_14;
    goto LABEL_54;
  }
LABEL_53:
  self->_invitationServiceError = *((_DWORD *)a3 + 24);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_54:
  self->_callDuration = *((_DWORD *)a3 + 5);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x400) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_56;
  }
LABEL_55:
  self->_diagnosticPingMin = *((_DWORD *)a3 + 13);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_56:
  self->_diagnosticPingAvg = *((_DWORD *)a3 + 11);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_58;
  }
LABEL_57:
  self->_diagnosticPingMax = *((_DWORD *)a3 + 12);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x800) == 0)
  {
LABEL_18:
    if ((v5 & 0x800000) == 0)
      goto LABEL_19;
    goto LABEL_59;
  }
LABEL_58:
  self->_diagnosticPingPacketLoss = *((_DWORD *)a3 + 14);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x800000) == 0)
  {
LABEL_19:
    if ((v5 & 0x400000) == 0)
      goto LABEL_20;
    goto LABEL_60;
  }
LABEL_59:
  self->_isNetworkEnabled = *((_DWORD *)a3 + 29);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x400000) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_61;
  }
LABEL_60:
  self->_isNetworkActive = *((_DWORD *)a3 + 28);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_22;
    goto LABEL_62;
  }
LABEL_61:
  self->_isNetworkReachable = *((_DWORD *)a3 + 30);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  self->_networkCheckResult = *((_DWORD *)a3 + 36);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x2000) == 0)
  {
LABEL_23:
    if ((v5 & 2) == 0)
      goto LABEL_24;
    goto LABEL_64;
  }
LABEL_63:
  self->_frontCameraCaptureDuration = *((_DWORD *)a3 + 16);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 2) == 0)
  {
LABEL_24:
    if ((v5 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_65;
  }
LABEL_64:
  self->_backCameraCaptureDuration = *((_DWORD *)a3 + 4);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x80) == 0)
  {
LABEL_25:
    if ((v5 & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_66;
  }
LABEL_65:
  self->_dataRate = *((_DWORD *)a3 + 10);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x10000) == 0)
  {
LABEL_26:
    if ((v5 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_67;
  }
LABEL_66:
  self->_gksError = *((_DWORD *)a3 + 19);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x10) == 0)
  {
LABEL_27:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_28;
    goto LABEL_68;
  }
LABEL_67:
  self->_connectDuration = *((_DWORD *)a3 + 7);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_29;
    goto LABEL_69;
  }
LABEL_68:
  self->_remoteNetworkConnection = *((_DWORD *)a3 + 42);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_70;
  }
LABEL_69:
  self->_localNetworkConnection = *((_DWORD *)a3 + 34);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x20) == 0)
  {
LABEL_30:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_31;
    goto LABEL_71;
  }
LABEL_70:
  self->_connectionType = *((_DWORD *)a3 + 8);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_72;
  }
LABEL_71:
  self->_usesRelay = *((_DWORD *)a3 + 43);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x40) == 0)
  {
LABEL_32:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_33;
    goto LABEL_73;
  }
LABEL_72:
  self->_currentNatType = *((_DWORD *)a3 + 9);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_34;
    goto LABEL_74;
  }
LABEL_73:
  self->_remoteNatType = *((_DWORD *)a3 + 41);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000) == 0)
      goto LABEL_35;
    goto LABEL_75;
  }
LABEL_74:
  self->_relayConnectDuration = *((_DWORD *)a3 + 39);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x200000) == 0)
  {
LABEL_35:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_36;
    goto LABEL_76;
  }
LABEL_75:
  self->_isInitiator = *((_DWORD *)a3 + 27);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x80000) == 0)
      goto LABEL_37;
    goto LABEL_77;
  }
LABEL_76:
  self->_isVideoInterrupted = *((_DWORD *)a3 + 32);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x80000) == 0)
  {
LABEL_37:
    if ((v5 & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  self->_isAudioInterrupted = *((_DWORD *)a3 + 25);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x100000) == 0)
  {
LABEL_38:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_39;
    goto LABEL_79;
  }
LABEL_78:
  self->_isCallUpgrade = *((_DWORD *)a3 + 26);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x20000) == 0)
      goto LABEL_40;
    goto LABEL_80;
  }
LABEL_79:
  self->_linkQuality = *((_DWORD *)a3 + 33);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x20000) == 0)
  {
LABEL_40:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_81;
  }
LABEL_80:
  self->_gksReturnCode = *((_DWORD *)a3 + 20);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *(_QWORD *)((char *)a3 + 180);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x80000000) == 0)
      return;
    goto LABEL_42;
  }
LABEL_81:
  self->_isVideo = *((_DWORD *)a3 + 31);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  if ((*(_QWORD *)((_BYTE *)a3 + 180) & 0x80000000) == 0)
    return;
LABEL_42:
  self->_onLockScreen = *((_DWORD *)a3 + 37);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)endedReason
{
  return self->_endedReason;
}

- (int)genericError
{
  return self->_genericError;
}

- (unsigned)viceroyError
{
  return self->_viceroyError;
}

- (unsigned)gameKitError
{
  return self->_gameKitError;
}

- (unsigned)messageDeliveryError
{
  return self->_messageDeliveryError;
}

- (unsigned)conferenceMiscError
{
  return self->_conferenceMiscError;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (unsigned)relayError
{
  return self->_relayError;
}

- (unsigned)invitationServiceError
{
  return self->_invitationServiceError;
}

- (unsigned)callDuration
{
  return self->_callDuration;
}

- (unsigned)diagnosticPingMin
{
  return self->_diagnosticPingMin;
}

- (unsigned)diagnosticPingAvg
{
  return self->_diagnosticPingAvg;
}

- (unsigned)diagnosticPingMax
{
  return self->_diagnosticPingMax;
}

- (unsigned)diagnosticPingPacketLoss
{
  return self->_diagnosticPingPacketLoss;
}

- (unsigned)isNetworkEnabled
{
  return self->_isNetworkEnabled;
}

- (unsigned)isNetworkActive
{
  return self->_isNetworkActive;
}

- (unsigned)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (unsigned)networkCheckResult
{
  return self->_networkCheckResult;
}

- (unsigned)frontCameraCaptureDuration
{
  return self->_frontCameraCaptureDuration;
}

- (unsigned)backCameraCaptureDuration
{
  return self->_backCameraCaptureDuration;
}

- (unsigned)dataRate
{
  return self->_dataRate;
}

- (int)gksError
{
  return self->_gksError;
}

- (unsigned)connectDuration
{
  return self->_connectDuration;
}

- (unsigned)remoteNetworkConnection
{
  return self->_remoteNetworkConnection;
}

- (unsigned)localNetworkConnection
{
  return self->_localNetworkConnection;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)usesRelay
{
  return self->_usesRelay;
}

- (unsigned)currentNatType
{
  return self->_currentNatType;
}

- (unsigned)remoteNatType
{
  return self->_remoteNatType;
}

- (unsigned)relayConnectDuration
{
  return self->_relayConnectDuration;
}

- (unsigned)isInitiator
{
  return self->_isInitiator;
}

- (unsigned)isVideoInterrupted
{
  return self->_isVideoInterrupted;
}

- (unsigned)isAudioInterrupted
{
  return self->_isAudioInterrupted;
}

- (unsigned)isCallUpgrade
{
  return self->_isCallUpgrade;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (int)gksReturnCode
{
  return self->_gksReturnCode;
}

- (unsigned)isVideo
{
  return self->_isVideo;
}

- (unsigned)onLockScreen
{
  return self->_onLockScreen;
}

@end
