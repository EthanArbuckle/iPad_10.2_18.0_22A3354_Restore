@implementation TSgPTPFDEtEPort

- (TSgPTPFDEtEPort)initWithImplDC:(id)a3
{
  id v5;
  TSgPTPFDEtEPort *v6;
  TSgPTPFDEtEPort *v7;
  id *p_impl;
  TSgPTPPortStatistics *v9;
  uint64_t v10;
  TSgPTPPortStatistics *statistics;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v15 = "[portImpl isKindOfClass:[TSDgPTPFDEtEPort class]]";
      v16 = 2048;
      v17 = 0;
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      v24 = 1024;
      v25 = 2705;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v7 = 0;
    goto LABEL_4;
  }
  v13.receiver = self;
  v13.super_class = (Class)TSgPTPFDEtEPort;
  v6 = -[TSgPTPNetworkPort initWithImplDC:](&v13, sel_initWithImplDC_, v5);
  v7 = v6;
  if (v6)
  {
    p_impl = (id *)&v6->_impl;
    objc_storeStrong((id *)&v6->_impl, a3);
    objc_msgSend(*p_impl, "addObserver:forKeyPath:options:context:", v7, CFSTR("statistics"), 0, v7);
    v9 = [TSgPTPPortStatistics alloc];
    objc_msgSend(*p_impl, "statistics");
    self = (TSgPTPFDEtEPort *)objc_claimAutoreleasedReturnValue();
    v10 = -[TSgPTPPortStatistics initWithDC:](v9, "initWithDC:", self);
    statistics = v7->_statistics;
    v7->_statistics = (TSgPTPPortStatistics *)v10;

LABEL_4:
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  TSgPTPPortStatistics *v13;
  void *v14;
  TSgPTPPortStatistics *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == self && *((id *)a6 + 6) == v11 && objc_msgSend(v10, "isEqualToString:", CFSTR("statistics")))
  {
    v13 = [TSgPTPPortStatistics alloc];
    objc_msgSend(*((id *)a6 + 6), "statistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TSgPTPPortStatistics initWithDC:](v13, "initWithDC:", v14);
    objc_msgSend(a6, "setStatistics:", v15);

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TSgPTPFDEtEPort;
    -[TSgPTPFDEtEPort observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_TSF_TSDgPTPFDEtEPort removeObserver:forKeyPath:context:](self->_impl, "removeObserver:forKeyPath:context:", self, CFSTR("statistics"), self);
  v3.receiver = self;
  v3.super_class = (Class)TSgPTPFDEtEPort;
  -[TSgPTPPort dealloc](&v3, sel_dealloc);
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
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
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  objc_super v86;

  v6 = a3;
  v7 = a4;
  v86.receiver = a1;
  v86.super_class = (Class)&OBJC_METACLASS___TSgPTPFDEtEPort;
  objc_msgSendSuper2(&v86, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PropagationDelayLimit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Propagation Delay Limit: %u\n"), v7, objc_msgSend(v11, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LinkPropagationDelay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Propagation Delay: %u\n"), v7, objc_msgSend(v12, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MaximumPropagationDelay"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Maximum Propagation Delay: %u\n"), v7, objc_msgSend(v13, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MinimumPropagationDelay"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Minimum Propagation Delay: %u\n"), v7, objc_msgSend(v14, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MaximumRawDelay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Maximum Raw Delay: %u\n"), v7, objc_msgSend(v15, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MinimumRawDelay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Minimum Raw Delay: %u\n"), v7, objc_msgSend(v16, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RemoteClockIdentity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Clock Identity: 0x%016llx\n"), v7, objc_msgSend(v17, "unsignedLongLongValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RemotePortNumber"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Port Number: %u\n"), v7, objc_msgSend(v18, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RemoteIsSameDevice"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "BOOLValue"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Is Same Device: %@\n"), v7, v20);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MultipleRemotes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "BOOLValue"))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Multiple Remotes: %@\n"), v7, v22);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LocalAnnounceLogMeanInterval"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Announce Log Mean Interval: %hhd\n"), v7, (int)objc_msgSend(v23, "charValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RemoteAnnounceLogMeanInterval"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Announce Log Mean Interval: %hhd\n"), v7, (int)objc_msgSend(v24, "charValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LocalSyncLogMeanInterval"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Sync Log Mean Interval: %hhd\n"), v7, (int)objc_msgSend(v25, "charValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RemoteSyncLogMeanInterval"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Sync Log Mean Interval: %hhd\n"), v7, (int)objc_msgSend(v26, "charValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReceivedDelayRequestCounter"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Delay Request Count:              %u\n"), v7, objc_msgSend(v27, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TransmittedDelayResponseCounter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Delay Response Count:          %u\n"), v7, objc_msgSend(v28, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AttemptedDelayResponseCounter"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Attempted Delay Response Count:          %u\n"), v7, objc_msgSend(v29, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TransmittedDelayRequestCounter"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Delay Request Count:        %u\n"), v7, objc_msgSend(v30, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AttemptedDelayRequestCounter"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Attempted Delay Request Count:        %u\n"), v7, objc_msgSend(v31, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReceivedDelayResponseCounter"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Delay Response Count:          %u\n"), v7, objc_msgSend(v32, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReceivedSyncCounter"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Sync Count: %u\n"), v7, objc_msgSend(v33, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReceivedFollowUpCounter"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Followup Count: %u\n"), v7, objc_msgSend(v34, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReceivedAnnounceCounter"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Announce Count: %u\n"), v7, objc_msgSend(v35, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ReceivedSignalCounter"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Signal Count: %u\n"), v7, objc_msgSend(v36, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncReceiptTimeoutCounter"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Receipt Timeout Count: %u\n"), v7, objc_msgSend(v37, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FollowUpReceiptTimeoutCounter"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    FollowUp Receipt Timeout Count: %u\n"), v7, objc_msgSend(v38, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AnnounceReceiptTimeoutCounter"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Receipt Timeout Count: %u\n"), v7, objc_msgSend(v39, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AllowedLostResponsesExceededCounter"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Allowed Lost Responses Exceeded Count: %u\n"), v7, objc_msgSend(v40, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupersededSyncCounter"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Superseded Sync Count: %u\n"), v7, objc_msgSend(v41, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SupersededDelayCounter"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Superseded Delay Count: %u\n"), v7, objc_msgSend(v42, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TransmittedSyncCounter"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Sync Count: %u\n"), v7, objc_msgSend(v43, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TransmittedFollowUpCounter"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Followup Count: %u\n"), v7, objc_msgSend(v44, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TransmittedAnnounceCounter"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Announce Count: %u\n"), v7, objc_msgSend(v45, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TransmittedSignalCounter"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Signal Count: %u\n"), v7, objc_msgSend(v46, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AttemptedSyncCounter"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Attempted Sync Count: %u\n"), v7, objc_msgSend(v47, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AttemptedFollowUpCounter"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Attempted Followup Count: %u\n"), v7, objc_msgSend(v48, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AttemptedAnnounceCounter"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Attempted Announce Count: %u\n"), v7, objc_msgSend(v49, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AttemptedSignalCounter"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Attempted Signal Count: %u\n"), v7, objc_msgSend(v50, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RawDelayExceededCounter"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Raw Delay Exceeded Count: %u\n"), v7, objc_msgSend(v51, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RawDelayMeasurementCounter"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Raw Delay Measurement Count: %u\n"), v7, objc_msgSend(v52, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardUnimplementedCounter"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Unimplemented Count: %u\n"), v7, objc_msgSend(v53, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidLengthCounter"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Length Count: %u\n"), v7, objc_msgSend(v54, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidCallbackCounter"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Callback Count: %u\n"), v7, objc_msgSend(v55, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardOverrideMismatchCounter"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Override Mismatch Count: %u\n"), v7, objc_msgSend(v56, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidEthertypeCounter"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Ethertype Count: %u\n"), v7, objc_msgSend(v57, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidAnnounceCounter"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Announce Count: %u\n"), v7, objc_msgSend(v58, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardPortIdMismatchCounter"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard PortIdentity Mismatch Count: %u\n"), v7, objc_msgSend(v59, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardNotAsCapableCounter"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Not ASCapable Count: %u\n"), v7, objc_msgSend(v60, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardNoDomainCounter"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard No Domain Count: %u\n"), v7, objc_msgSend(v61, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidSignalTLVCounter"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Signal TLV Count: %u\n"), v7, objc_msgSend(v62, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidSignalTargetCounter"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Signal Target Count: %u\n"), v7, objc_msgSend(v63, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidTimestampCounter"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Timestamp Count: %u\n"), v7, objc_msgSend(v64, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidTransportCounter"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid Transport Count: %u\n"), v7, objc_msgSend(v65, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardDuplicateCounter"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Duplicate Count: %u\n"), v7, objc_msgSend(v66, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardRoleMismatchCounter"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Role Mismatch Count: %u\n"), v7, objc_msgSend(v67, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardUnknownTypeCounter"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Unknown Type Count: %u\n"), v7, objc_msgSend(v68, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardDomainMismatchCounter"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Domain Mismatch Count: %u\n"), v7, objc_msgSend(v69, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardFollowUpMismatchCounter"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard FollowUp Mismatch Count: %u\n"), v7, objc_msgSend(v70, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RxPacketDiscardInvalidFollowUpTLVCounter"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Packet Discard Invalid FollowUp TLV Count: %u\n"), v7, objc_msgSend(v71, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TxPacketInvalidFutureTimestampCounter"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Packet Invalid Future Timestamp Count: %u\n"), v7, objc_msgSend(v72, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TxPacketFailedBuildCounter"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Packet Failed Build Count: %u\n"), v7, objc_msgSend(v73, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TxPacketFailedNetworkSendCounter"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Packet Failed Network Send Count: %u\n"), v7, objc_msgSend(v74, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TxPacketDiscardInvalidTimestampCounter"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Packet Discard Invalid Timestamp Count: %u\n"), v7, objc_msgSend(v75, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TxPacketDiscardUnimplementedCounter"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Transmitted Packet Discard Unimplemented Count: %u\n"), v7, objc_msgSend(v76, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardPPMLimitCounter"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Discard PPM Limit Count: %u\n"), v7, objc_msgSend(v77, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardTimestampsOutOfOrderCounter"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Discard Timestamps Out of Order Count: %u\n"), v7, objc_msgSend(v78, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardOutOfBoundsCounter"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Discard Timestamps Out of Bounds Count: %u\n"), v7, objc_msgSend(v79, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDiscardDelayLimitExceededCounter"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Discard Delay Limit Exceeded Count: %u\n"), v7, objc_msgSend(v80, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetDroppedLimitCounter"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Filter Reset Dropped Limit Count: %u\n"), v7, objc_msgSend(v81, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementFilterResetOutOfBoundsCounter"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Filter Reset Out of Bounds Count: %u\n"), v7, objc_msgSend(v82, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementDroppedCounter"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Dropped Count: %u\n"), v7, objc_msgSend(v83, "unsignedIntValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SyncMeasurementSuccessCounter"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Sync Measurement Success Count: %u\n"), v7, objc_msgSend(v84, "unsignedIntValue"));

  }
  return v8;
}

- (TSgPTPPortStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
