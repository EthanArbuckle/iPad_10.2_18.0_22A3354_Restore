@implementation TSgPTPPortStatistics

- (TSgPTPPortStatistics)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TSgPTPPortStatistics init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (TSgPTPPortStatistics)initWithDC:(id)a3
{
  id v4;
  TSgPTPPortStatistics *v5;
  uint64_t v6;
  NSString *portIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSgPTPPortStatistics;
  v5 = -[TSgPTPPortStatistics init](&v9, sel_init);
  if (v5)
  {
    v5->_portType = objc_msgSend(v4, "portType");
    objc_msgSend(v4, "portIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    portIdentifier = v5->_portIdentifier;
    v5->_portIdentifier = (NSString *)v6;

    v5->_portRole = objc_msgSend(v4, "portRole");
    v5->_receivedSyncCounter = objc_msgSend(v4, "receivedSyncCounter");
    v5->_receivedFollowUpCounter = objc_msgSend(v4, "receivedFollowUpCounter");
    v5->_receivedAnnounceCounter = objc_msgSend(v4, "receivedAnnounceCounter");
    v5->_receivedSignalCounter = objc_msgSend(v4, "receivedSignalCounter");
    v5->_receivedPacketDiscardCounter = objc_msgSend(v4, "receivedPacketDiscardCounter");
    v5->_syncReceiptTimeoutCounter = objc_msgSend(v4, "syncReceiptTimeoutCounter");
    v5->_announceReceiptTimeoutCounter = objc_msgSend(v4, "announceReceiptTimeoutCounter");
    v5->_allowedLostResponsesExceededCounter = objc_msgSend(v4, "allowedLostResponsesExceededCounter");
    v5->_transmittedSyncCounter = objc_msgSend(v4, "transmittedSyncCounter");
    v5->_transmittedFollowUpCounter = objc_msgSend(v4, "transmittedFollowUpCounter");
    v5->_transmittedAnnounceCounter = objc_msgSend(v4, "transmittedAnnounceCounter");
    v5->_transmittedSignalCounter = objc_msgSend(v4, "transmittedSignalCounter");
    v5->_transmittedPacketDiscardCounter = objc_msgSend(v4, "transmittedPacketDiscardCounter");
    v5->_attemptedSyncCounter = objc_msgSend(v4, "attemptedSyncCounter");
    v5->_attemptedFollowUpCounter = objc_msgSend(v4, "attemptedFollowUpCounter");
    v5->_attemptedAnnounceCounter = objc_msgSend(v4, "attemptedAnnounceCounter");
    v5->_attemptedSignalCounter = objc_msgSend(v4, "attemptedSignalCounter");
    v5->_rawDelayExceededCounter = objc_msgSend(v4, "rawDelayExceededCounter");
    v5->_rawDelayMeasurementCounter = objc_msgSend(v4, "rawDelayMeasurementCounter");
    v5->_receivedPDelayRequestCounter = objc_msgSend(v4, "receivedPDelayRequestCounter");
    v5->_transmittedPDelayResponseCounter = objc_msgSend(v4, "transmittedPDelayResponseCounter");
    v5->_transmittedPDelayResponseFollowUpCounter = objc_msgSend(v4, "transmittedPDelayResponseFollowUpCounter");
    v5->_attemptedPDelayResponseCounter = objc_msgSend(v4, "attemptedPDelayResponseCounter");
    v5->_attemptedPDelayResponseFollowUpCounter = objc_msgSend(v4, "attemptedPDelayResponseFollowUpCounter");
    v5->_transmittedPDelayRequestCounter = objc_msgSend(v4, "transmittedPDelayRequestCounter");
    v5->_attemptedPDelayRequestCounter = objc_msgSend(v4, "attemptedPDelayRequestCounter");
    v5->_receivedPDelayResponseCounter = objc_msgSend(v4, "receivedPDelayResponseCounter");
    v5->_receivedPDelayResponseFollowUpCounter = objc_msgSend(v4, "receivedPDelayResponseFollowUpCounter");
    v5->_receivedDelayRequestCounter = objc_msgSend(v4, "receivedDelayRequestCounter");
    v5->_transmittedDelayResponseCounter = objc_msgSend(v4, "transmittedDelayResponseCounter");
    v5->_attemptedDelayResponseCounter = objc_msgSend(v4, "attemptedDelayResponseCounter");
    v5->_transmittedDelayRequestCounter = objc_msgSend(v4, "transmittedDelayRequestCounter");
    v5->_attemptedDelayRequestCounter = objc_msgSend(v4, "attemptedDelayRequestCounter");
    v5->_receivedDelayResponseCounter = objc_msgSend(v4, "receivedDelayResponseCounter");
    v5->_supersededSyncCounter = objc_msgSend(v4, "supersededSyncCounter");
    v5->_supersededDelayCounter = objc_msgSend(v4, "supersededDelayCounter");
  }

  return v5;
}

- (NSString)portIdentifier
{
  return self->_portIdentifier;
}

- (int)portType
{
  return self->_portType;
}

- (int)portRole
{
  return self->_portRole;
}

- (unsigned)receivedSyncCounter
{
  return self->_receivedSyncCounter;
}

- (unsigned)receivedFollowUpCounter
{
  return self->_receivedFollowUpCounter;
}

- (unsigned)receivedAnnounceCounter
{
  return self->_receivedAnnounceCounter;
}

- (unsigned)receivedSignalCounter
{
  return self->_receivedSignalCounter;
}

- (unsigned)receivedPacketDiscardCounter
{
  return self->_receivedPacketDiscardCounter;
}

- (unsigned)syncReceiptTimeoutCounter
{
  return self->_syncReceiptTimeoutCounter;
}

- (unsigned)announceReceiptTimeoutCounter
{
  return self->_announceReceiptTimeoutCounter;
}

- (unsigned)allowedLostResponsesExceededCounter
{
  return self->_allowedLostResponsesExceededCounter;
}

- (unsigned)transmittedSyncCounter
{
  return self->_transmittedSyncCounter;
}

- (unsigned)transmittedFollowUpCounter
{
  return self->_transmittedFollowUpCounter;
}

- (unsigned)transmittedAnnounceCounter
{
  return self->_transmittedAnnounceCounter;
}

- (unsigned)transmittedSignalCounter
{
  return self->_transmittedSignalCounter;
}

- (unsigned)transmittedPacketDiscardCounter
{
  return self->_transmittedPacketDiscardCounter;
}

- (unsigned)attemptedSyncCounter
{
  return self->_attemptedSyncCounter;
}

- (unsigned)attemptedFollowUpCounter
{
  return self->_attemptedFollowUpCounter;
}

- (unsigned)attemptedAnnounceCounter
{
  return self->_attemptedAnnounceCounter;
}

- (unsigned)attemptedSignalCounter
{
  return self->_attemptedSignalCounter;
}

- (unsigned)rawDelayExceededCounter
{
  return self->_rawDelayExceededCounter;
}

- (unsigned)rawDelayMeasurementCounter
{
  return self->_rawDelayMeasurementCounter;
}

- (unsigned)receivedPDelayRequestCounter
{
  return self->_receivedPDelayRequestCounter;
}

- (unsigned)transmittedPDelayResponseCounter
{
  return self->_transmittedPDelayResponseCounter;
}

- (unsigned)transmittedPDelayResponseFollowUpCounter
{
  return self->_transmittedPDelayResponseFollowUpCounter;
}

- (unsigned)attemptedPDelayResponseCounter
{
  return self->_attemptedPDelayResponseCounter;
}

- (unsigned)attemptedPDelayResponseFollowUpCounter
{
  return self->_attemptedPDelayResponseFollowUpCounter;
}

- (unsigned)transmittedPDelayRequestCounter
{
  return self->_transmittedPDelayRequestCounter;
}

- (unsigned)attemptedPDelayRequestCounter
{
  return self->_attemptedPDelayRequestCounter;
}

- (unsigned)receivedPDelayResponseCounter
{
  return self->_receivedPDelayResponseCounter;
}

- (unsigned)receivedPDelayResponseFollowUpCounter
{
  return self->_receivedPDelayResponseFollowUpCounter;
}

- (unsigned)receivedDelayRequestCounter
{
  return self->_receivedDelayRequestCounter;
}

- (unsigned)transmittedDelayResponseCounter
{
  return self->_transmittedDelayResponseCounter;
}

- (unsigned)attemptedDelayResponseCounter
{
  return self->_attemptedDelayResponseCounter;
}

- (unsigned)transmittedDelayRequestCounter
{
  return self->_transmittedDelayRequestCounter;
}

- (unsigned)attemptedDelayRequestCounter
{
  return self->_attemptedDelayRequestCounter;
}

- (unsigned)receivedDelayResponseCounter
{
  return self->_receivedDelayResponseCounter;
}

- (unsigned)supersededSyncCounter
{
  return self->_supersededSyncCounter;
}

- (unsigned)supersededDelayCounter
{
  return self->_supersededDelayCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portIdentifier, 0);
}

@end
