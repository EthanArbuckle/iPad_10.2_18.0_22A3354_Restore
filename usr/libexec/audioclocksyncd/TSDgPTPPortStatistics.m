@implementation TSDgPTPPortStatistics

- (TSDgPTPPortStatistics)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSDgPTPPortStatistics init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Do not call %@"), v3);

  return 0;
}

- (TSDgPTPPortStatistics)initWithPort:(id)a3
{
  id v4;
  TSDgPTPPortStatistics *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *portIdentifier;
  uint64_t v11;
  id v12;
  NSString *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  const __CFString *v72;
  objc_super v73;

  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)TSDgPTPPortStatistics;
  v5 = -[TSDgPTPPortStatistics init](&v73, "init");
  if (v5)
  {
    v5->_portType = objc_msgSend(v4, "portType");
    v6 = objc_opt_class(TSDgPTPEthernetPort);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = objc_alloc((Class)NSString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
      v9 = (NSString *)objc_msgSend(v7, "initWithFormat:", CFSTR("Ethernet|%@"), v8);
      portIdentifier = v5->_portIdentifier;
      v5->_portIdentifier = v9;
    }
    else
    {
      v11 = objc_opt_class(TSDgPTPUnicastLinkLayerPtPPort);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        v12 = objc_alloc((Class)NSString);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
        portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationAddressString"));
        v13 = (NSString *)objc_msgSend(v12, "initWithFormat:", CFSTR("LLPtP|%@|%@"), v8, portIdentifier);
      }
      else
      {
        v14 = objc_opt_class(TSDgPTPUnicastUDPv4PtPPort);
        if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0)
        {
          v15 = objc_alloc((Class)NSString);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
          portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationAddressString"));
          v13 = (NSString *)objc_msgSend(v15, "initWithFormat:", CFSTR("UDPv4PtP|%@|%@"), v8, portIdentifier);
        }
        else
        {
          v16 = objc_opt_class(TSDgPTPUnicastUDPv6PtPPort);
          if ((objc_opt_isKindOfClass(v4, v16) & 1) != 0)
          {
            v17 = objc_alloc((Class)NSString);
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
            portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationAddressString"));
            v13 = (NSString *)objc_msgSend(v17, "initWithFormat:", CFSTR("UDPv6PtP|%@|%@"), v8, portIdentifier);
          }
          else
          {
            v18 = objc_opt_class(TSDgPTPUnicastLinkLayerEtEPort);
            if ((objc_opt_isKindOfClass(v4, v18) & 1) != 0)
            {
              v19 = objc_alloc((Class)NSString);
              v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
              portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationAddressString"));
              v13 = (NSString *)objc_msgSend(v19, "initWithFormat:", CFSTR("LLEtE|%@|%@"), v8, portIdentifier);
            }
            else
            {
              v20 = objc_opt_class(TSDgPTPUnicastUDPv4EtEPort);
              if ((objc_opt_isKindOfClass(v4, v20) & 1) != 0)
              {
                v21 = objc_alloc((Class)NSString);
                v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
                portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationAddressString"));
                v13 = (NSString *)objc_msgSend(v21, "initWithFormat:", CFSTR("UDPv4EtE|%@|%@"), v8, portIdentifier);
              }
              else
              {
                v22 = objc_opt_class(TSDgPTPUnicastUDPv6EtEPort);
                if ((objc_opt_isKindOfClass(v4, v22) & 1) == 0)
                  goto LABEL_18;
                v23 = objc_alloc((Class)NSString);
                v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
                portIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationAddressString"));
                v13 = (NSString *)objc_msgSend(v23, "initWithFormat:", CFSTR("UDPv6EtE|%@|%@"), v8, portIdentifier);
              }
            }
          }
        }
      }
      v24 = v5->_portIdentifier;
      v5->_portIdentifier = v13;

    }
LABEL_18:
    v5->_portRole = objc_msgSend(v4, "portRole");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "iodProperties"));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ReceivedSyncCounter")));
      v5->_receivedSyncCounter = objc_msgSend(v27, "unsignedIntValue");

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ReceivedFollowUpCounter")));
      v5->_receivedFollowUpCounter = objc_msgSend(v28, "unsignedIntValue");

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ReceivedAnnounceCounter")));
      v5->_receivedAnnounceCounter = objc_msgSend(v29, "unsignedIntValue");

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ReceivedSignalCounter")));
      v5->_receivedSignalCounter = objc_msgSend(v30, "unsignedIntValue");

      v5->_receivedPacketDiscardCounter = 0;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SyncReceiptTimeoutCounter")));
      v5->_syncReceiptTimeoutCounter = objc_msgSend(v31, "unsignedIntValue");

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AnnounceReceiptTimeoutCounter")));
      v5->_announceReceiptTimeoutCounter = objc_msgSend(v32, "unsignedIntValue");

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AllowedLostResponsesExceededCounter")));
      v5->_allowedLostResponsesExceededCounter = objc_msgSend(v33, "unsignedIntValue");

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("TransmittedSyncCounter")));
      v5->_transmittedSyncCounter = objc_msgSend(v34, "unsignedIntValue");

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("TransmittedFollowUpCounter")));
      v5->_transmittedFollowUpCounter = objc_msgSend(v35, "unsignedIntValue");

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("TransmittedAnnounceCounter")));
      v5->_transmittedAnnounceCounter = objc_msgSend(v36, "unsignedIntValue");

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("TransmittedSignalCounter")));
      v5->_transmittedSignalCounter = objc_msgSend(v37, "unsignedIntValue");

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("TransmittedPacketDiscardCounter")));
      v5->_transmittedPacketDiscardCounter = objc_msgSend(v38, "unsignedIntValue");

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AttemptedSyncCounter")));
      v5->_attemptedSyncCounter = objc_msgSend(v39, "unsignedIntValue");

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AttemptedFollowUpCounter")));
      v5->_attemptedFollowUpCounter = objc_msgSend(v40, "unsignedIntValue");

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AttemptedAnnounceCounter")));
      v5->_attemptedAnnounceCounter = objc_msgSend(v41, "unsignedIntValue");

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AttemptedSignalCounter")));
      v5->_attemptedSignalCounter = objc_msgSend(v42, "unsignedIntValue");

      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("RawDelayExceededCounter")));
      v5->_rawDelayExceededCounter = objc_msgSend(v43, "unsignedIntValue");

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("RawDelayMeasurementCounter")));
      v5->_rawDelayMeasurementCounter = objc_msgSend(v44, "unsignedIntValue");

      v45 = objc_opt_class(TSDgPTPFDPtPPort);
      if ((objc_opt_isKindOfClass(v4, v45) & 1) != 0)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ReceivedPDelayRequestCounter")));
        v5->_receivedPDelayRequestCounter = objc_msgSend(v46, "unsignedIntValue");

        v71 = CFSTR("ReceivedPDelayResponseCounter");
        v72 = CFSTR("ReceivedPDelayResponseFollowUpCounter");
        v47 = CFSTR("AttemptedPDelayResponseCounter");
        v48 = CFSTR("TransmittedPDelayResponseFollowUpCounter");
        v69 = CFSTR("AttemptedPDelayRequestCounter");
        v70 = 124;
        v67 = CFSTR("TransmittedPDelayRequestCounter");
        v68 = 120;
        v65 = CFSTR("AttemptedPDelayResponseFollowUpCounter");
        v66 = 116;
        v64 = 112;
        v49 = 108;
        v50 = 104;
        v51 = 100;
        v52 = 96;
        v53 = CFSTR("TransmittedPDelayResponseCounter");
LABEL_23:
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v53));
        *(_DWORD *)((char *)&v5->super.isa + v52) = objc_msgSend(v55, "unsignedIntValue");

        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v48));
        *(_DWORD *)((char *)&v5->super.isa + v51) = objc_msgSend(v56, "unsignedIntValue");

        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v47));
        *(_DWORD *)((char *)&v5->super.isa + v50) = objc_msgSend(v57, "unsignedIntValue");

        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v65));
        *(_DWORD *)((char *)&v5->super.isa + v49) = objc_msgSend(v58, "unsignedIntValue");

        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v67));
        *(_DWORD *)((char *)&v5->super.isa + v64) = objc_msgSend(v59, "unsignedIntValue");

        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v69));
        *(_DWORD *)((char *)&v5->super.isa + v66) = objc_msgSend(v60, "unsignedIntValue");

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v71));
        *(_DWORD *)((char *)&v5->super.isa + v68) = objc_msgSend(v61, "unsignedIntValue");

        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v72));
        *(_DWORD *)((char *)&v5->super.isa + v70) = objc_msgSend(v62, "unsignedIntValue");

        goto LABEL_24;
      }
      v54 = objc_opt_class(TSDgPTPFDEtEPort);
      if ((objc_opt_isKindOfClass(v4, v54) & 1) != 0)
      {
        v71 = CFSTR("SupersededSyncCounter");
        v72 = CFSTR("SupersededDelayCounter");
        v47 = CFSTR("AttemptedDelayResponseCounter");
        v48 = CFSTR("TransmittedDelayResponseCounter");
        v69 = CFSTR("ReceivedDelayResponseCounter");
        v70 = 156;
        v67 = CFSTR("AttemptedDelayRequestCounter");
        v68 = 152;
        v65 = CFSTR("TransmittedDelayRequestCounter");
        v66 = 148;
        v64 = 144;
        v49 = 140;
        v50 = 136;
        v51 = 132;
        v52 = 128;
        v53 = CFSTR("ReceivedDelayRequestCounter");
        goto LABEL_23;
      }
    }
LABEL_24:

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
