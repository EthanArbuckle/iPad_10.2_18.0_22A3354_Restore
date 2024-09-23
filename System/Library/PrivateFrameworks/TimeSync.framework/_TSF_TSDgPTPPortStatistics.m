@implementation _TSF_TSDgPTPPortStatistics

- (_TSF_TSDgPTPPortStatistics)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_TSF_TSDgPTPPortStatistics init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (_TSF_TSDgPTPPortStatistics)initWithPort:(id)a3
{
  id v4;
  _TSF_TSDgPTPPortStatistics *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *portIdentifier;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSString *v17;
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
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  const __CFString *v63;
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)_TSF_TSDgPTPPortStatistics;
  v5 = -[_TSF_TSDgPTPPortStatistics init](&v64, sel_init);
  if (v5)
  {
    v5->_portType = objc_msgSend(v4, "portType");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "interfaceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithFormat:", CFSTR("Ethernet|%@"), v7);
      portIdentifier = v5->_portIdentifier;
      v5->_portIdentifier = (NSString *)v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v4, "interfaceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "destinationAddressString");
        portIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "initWithFormat:", CFSTR("LLPtP|%@|%@"), v7, portIdentifier);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v4, "interfaceName");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "destinationAddressString");
          portIdentifier = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v12, "initWithFormat:", CFSTR("UDPv4PtP|%@|%@"), v7, portIdentifier);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v4, "interfaceName");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "destinationAddressString");
            portIdentifier = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v13, "initWithFormat:", CFSTR("UDPv6PtP|%@|%@"), v7, portIdentifier);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v4, "interfaceName");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "destinationAddressString");
              portIdentifier = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v14, "initWithFormat:", CFSTR("LLEtE|%@|%@"), v7, portIdentifier);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v4, "interfaceName");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "destinationAddressString");
                portIdentifier = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v15, "initWithFormat:", CFSTR("UDPv4EtE|%@|%@"), v7, portIdentifier);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_18;
                v16 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v4, "interfaceName");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "destinationAddressString");
                portIdentifier = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v16, "initWithFormat:", CFSTR("UDPv6EtE|%@|%@"), v7, portIdentifier);
              }
            }
          }
        }
      }
      v17 = v5->_portIdentifier;
      v5->_portIdentifier = (NSString *)v11;

    }
LABEL_18:
    v5->_portRole = objc_msgSend(v4, "portRole");
    objc_msgSend(v4, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iodProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ReceivedSyncCounter"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_receivedSyncCounter = objc_msgSend(v20, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ReceivedFollowUpCounter"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_receivedFollowUpCounter = objc_msgSend(v21, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ReceivedAnnounceCounter"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_receivedAnnounceCounter = objc_msgSend(v22, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ReceivedSignalCounter"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_receivedSignalCounter = objc_msgSend(v23, "unsignedIntValue");

      v5->_receivedPacketDiscardCounter = 0;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("SyncReceiptTimeoutCounter"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_syncReceiptTimeoutCounter = objc_msgSend(v24, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AnnounceReceiptTimeoutCounter"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_announceReceiptTimeoutCounter = objc_msgSend(v25, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AllowedLostResponsesExceededCounter"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_allowedLostResponsesExceededCounter = objc_msgSend(v26, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TransmittedSyncCounter"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_transmittedSyncCounter = objc_msgSend(v27, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TransmittedFollowUpCounter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_transmittedFollowUpCounter = objc_msgSend(v28, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TransmittedAnnounceCounter"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_transmittedAnnounceCounter = objc_msgSend(v29, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TransmittedSignalCounter"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_transmittedSignalCounter = objc_msgSend(v30, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TransmittedPacketDiscardCounter"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_transmittedPacketDiscardCounter = objc_msgSend(v31, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AttemptedSyncCounter"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_attemptedSyncCounter = objc_msgSend(v32, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AttemptedFollowUpCounter"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_attemptedFollowUpCounter = objc_msgSend(v33, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AttemptedAnnounceCounter"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_attemptedAnnounceCounter = objc_msgSend(v34, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AttemptedSignalCounter"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_attemptedSignalCounter = objc_msgSend(v35, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("RawDelayExceededCounter"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_rawDelayExceededCounter = objc_msgSend(v36, "unsignedIntValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("RawDelayMeasurementCounter"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_rawDelayMeasurementCounter = objc_msgSend(v37, "unsignedIntValue");

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ReceivedPDelayRequestCounter"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_receivedPDelayRequestCounter = objc_msgSend(v38, "unsignedIntValue");

        v62 = CFSTR("ReceivedPDelayResponseCounter");
        v63 = CFSTR("ReceivedPDelayResponseFollowUpCounter");
        v39 = CFSTR("AttemptedPDelayResponseCounter");
        v40 = CFSTR("TransmittedPDelayResponseFollowUpCounter");
        v60 = CFSTR("AttemptedPDelayRequestCounter");
        v61 = 124;
        v58 = CFSTR("TransmittedPDelayRequestCounter");
        v59 = 120;
        v56 = CFSTR("AttemptedPDelayResponseFollowUpCounter");
        v57 = 116;
        v55 = 112;
        v41 = 108;
        v42 = 104;
        v43 = 100;
        v44 = 96;
        v45 = CFSTR("TransmittedPDelayResponseCounter");
LABEL_23:
        objc_msgSend(v19, "objectForKeyedSubscript:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v44) = objc_msgSend(v46, "unsignedIntValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", v40);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v43) = objc_msgSend(v47, "unsignedIntValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", v39);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v42) = objc_msgSend(v48, "unsignedIntValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", v56);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v41) = objc_msgSend(v49, "unsignedIntValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", v58);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v55) = objc_msgSend(v50, "unsignedIntValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", v60);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v57) = objc_msgSend(v51, "unsignedIntValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", v62);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v59) = objc_msgSend(v52, "unsignedIntValue");

        objc_msgSend(v19, "objectForKeyedSubscript:", v63);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)((char *)&v5->super.isa + v61) = objc_msgSend(v53, "unsignedIntValue");

        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = CFSTR("SupersededSyncCounter");
        v63 = CFSTR("SupersededDelayCounter");
        v39 = CFSTR("AttemptedDelayResponseCounter");
        v40 = CFSTR("TransmittedDelayResponseCounter");
        v60 = CFSTR("ReceivedDelayResponseCounter");
        v61 = 156;
        v58 = CFSTR("AttemptedDelayRequestCounter");
        v59 = 152;
        v56 = CFSTR("TransmittedDelayRequestCounter");
        v57 = 148;
        v55 = 144;
        v41 = 140;
        v42 = 136;
        v43 = 132;
        v44 = 128;
        v45 = CFSTR("ReceivedDelayRequestCounter");
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
