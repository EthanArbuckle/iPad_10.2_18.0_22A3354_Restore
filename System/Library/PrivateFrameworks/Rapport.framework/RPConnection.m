@implementation RPConnection

- (RPConnection)init
{
  RPConnection *v2;
  RPConnection *v3;
  RPCompanionLinkDevice *v4;
  RPCompanionLinkDevice *peerDeviceInfo;
  NSMutableArray *v6;
  NSMutableArray *sendArray;
  NSMutableArray *v8;
  NSMutableArray *receivedMessages;
  RPConnection *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RPConnection;
  v2 = -[RPConnection init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_flowControlReadEnabled = 1;
    v4 = objc_alloc_init(RPCompanionLinkDevice);
    peerDeviceInfo = v3->_peerDeviceInfo;
    v3->_peerDeviceInfo = v4;

    -[RPCompanionLinkDevice setDaemon:](v3->_peerDeviceInfo, "setDaemon:", 1);
    *(_QWORD *)&v3->_pairSetupFlags = 0x40000000000018;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sendArray = v3->_sendArray;
    v3->_sendArray = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    receivedMessages = v3->_receivedMessages;
    v3->_receivedMessages = v8;

    v3->_ucat = (LogCategory *)&gLogCategory_RPCnx;
    RandomBytes();
    v3->_readFrame.header = 0;
    *(_WORD *)&v3->_readFrame.receivingHeader = 0;
    v3->_readFrameBTPipeHighPriority.header = 0;
    *(_WORD *)&v3->_readFrameBTPipeHighPriority.receivingHeader = 0;
    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RPConnection;
  -[RPConnection dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  RPCompanionLinkDevice *v5;
  BOOL v6;
  id v7;
  unsigned int linkType;
  const char *v9;
  id v10;
  unint64_t trafficFlags;
  id v12;
  id *v13;
  id v14;
  unsigned int passwordType;
  const char *v16;
  id v17;
  unsigned int pairVerifyAuthType;
  const char *v19;
  id v20;
  id v21;
  NSError *v22;
  void *v23;
  id v24;
  NSString *peerIdentifier;
  int v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  NSString *v35;
  NSString *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  unsigned int v56;
  const char *v57;
  id v58;
  unsigned int v59;
  const char *v60;
  id v61;
  int v62;
  const char *v63;
  id v64;
  NSString *v65;
  NSString *v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  int v71;
  const char *v72;
  id v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  id v94;
  unsigned int flags;
  id v96;
  unsigned int v97;
  id v98;
  uint64_t v99;
  id v100;
  void *v101;
  id v102;
  CUBluetoothScalablePipe *v103;
  id v104;
  CUBLEConnection *v105;
  id v106;
  CUTCPConnection *v107;
  id v108;
  id v109;
  unint64_t retryCount;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  _QWORD v128[2];
  id v129;
  id v130;
  uint64_t v131;
  _BYTE v132[32];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v5 = self->_peerDeviceInfo;
  v6 = shouldPrintSensitiveData();
  v131 = 0;
  NSAppendPrintF();
  v130 = 0;
  retryCount = (unint64_t)_StateToString(self->_internalState);
  NSAppendPrintF();
  v7 = v130;

  linkType = self->_linkType;
  if (linkType)
  {
    v129 = v7;
    if (linkType > 0xB)
      v9 = "?";
    else
      v9 = off_1E5F4FCB8[linkType - 1];
    retryCount = (unint64_t)v9;
    NSAppendPrintF();
    v10 = v129;

    v7 = v10;
  }
  trafficFlags = self->_trafficFlags;
  if ((_DWORD)trafficFlags)
  {
    v128[1] = v7;
    retryCount = trafficFlags;
    v122 = &unk_1AF306EB4;
    NSAppendPrintF();
    v12 = v7;

    v7 = v12;
  }
  if (self->_pairVerifyCompleted)
  {
    if (self->_pairVerifyUsedIdentity)
    {
      v128[0] = v7;
      v13 = (id *)v128;
    }
    else
    {
      v127 = v7;
      v13 = &v127;
    }
  }
  else
  {
    if (!self->_mainStream)
      goto LABEL_15;
    v126 = v7;
    v13 = &v126;
  }
  NSAppendPrintF();
  v14 = *v13;

  v7 = v14;
LABEL_15:
  passwordType = self->_passwordType;
  if (passwordType)
  {
    if (passwordType > 0xB)
      v16 = "?";
    else
      v16 = off_1E5F4FD10[passwordType - 1];
    retryCount = (unint64_t)v16;
    NSAppendPrintF();
    v17 = v7;

    v7 = v17;
  }
  pairVerifyAuthType = self->_pairVerifyAuthType;
  if (pairVerifyAuthType)
  {
    if (pairVerifyAuthType > 0xA)
      v19 = "?";
    else
      v19 = off_1E5F4FD68[pairVerifyAuthType - 1];
    retryCount = (unint64_t)v19;
    NSAppendPrintF();
    v20 = v7;

    v7 = v20;
  }
  if (self->_retryCount > 0)
  {
    retryCount = self->_retryCount;
    NSAppendPrintF();
    v21 = v7;

    v7 = v21;
  }
  v22 = self->_stepError;
  v23 = v22;
  if (v22)
  {
    retryCount = (unint64_t)v22;
    NSAppendPrintF();
    v24 = v7;

    v7 = v24;
  }

  if (v6)
  {
    peerIdentifier = self->_peerIdentifier;
    if (peerIdentifier)
    {
      v26 = 0;
      v27 = self->_peerIdentifier;
    }
    else
    {
      -[RPEndpoint identifier](v5, "identifier", retryCount);
      v28 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v28;
      if (v28)
      {
        v26 = 0;
        v27 = (void *)v28;
      }
      else
      {
        -[RPCompanionLinkDevice publicIdentifier](v5, "publicIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 1;
      }
    }
    NSAppendPrintF();
    v29 = v7;

    if (v26)
    if (!peerIdentifier)

    -[RPEndpoint idsDeviceIdentifier](v5, "idsDeviceIdentifier", v27, v122);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
    {
      v123 = v30;
      NSAppendPrintF();
      v32 = v29;

      v29 = v32;
    }

    -[RPEndpoint name](v5, "name");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v33 = v29;

    -[RPEndpoint model](v5, "model", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v34 = v33;

    -[RPEndpoint accountID](v5, "accountID", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v7 = v34;

    v35 = self->_appID;
    v36 = v35;
    if (v35)
    {
      v114 = v35;
      NSAppendPrintF();
      v37 = v7;

      v7 = v37;
    }

    -[RPCompanionLinkDevice idsPersonalDeviceIdentifier](v5, "idsPersonalDeviceIdentifier", v114);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v38)
    {
      v115 = v38;
      NSAppendPrintF();
      v40 = v7;

      v7 = v40;
    }

    -[RPCompanionLinkDevice homeKitIdentifier](v5, "homeKitIdentifier");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    if (v41)
    {
      v115 = v41;
      NSAppendPrintF();
      v43 = v7;

      v7 = v43;
    }

    -[RPEndpoint mediaRemoteIdentifier](v5, "mediaRemoteIdentifier");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v44)
    {
      v115 = v44;
      NSAppendPrintF();
      v46 = v7;

      v7 = v46;
    }

    -[RPEndpoint mediaRouteIdentifier](v5, "mediaRouteIdentifier");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v47;
    if (v47)
    {
      v115 = v47;
      NSAppendPrintF();
      v49 = v7;

      v7 = v49;
    }

    -[RPCompanionLinkDevice mediaSystemIdentifier](v5, "mediaSystemIdentifier");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v50;
    if (v50)
    {
      v115 = v50;
      NSAppendPrintF();
      v52 = v7;

      v7 = v52;
    }

    -[RPCompanionLinkDevice mediaSystemName](v5, "mediaSystemName");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v53;
    if (v53)
    {
      v115 = v53;
      NSAppendPrintF();
      v55 = v7;

      v7 = v55;
    }

    v56 = -[RPCompanionLinkDevice mediaSystemRole](v5, "mediaSystemRole");
    if (v56)
    {
      if (v56 > 3)
        v57 = "?";
      else
        v57 = off_1E5F4FDB8[v56 - 1];
      v115 = (uint64_t)v57;
      NSAppendPrintF();
      v58 = v7;

      v7 = v58;
    }
    v59 = -[RPCompanionLinkDevice mediaSystemState](v5, "mediaSystemState", v115, v123);
    if (v59)
    {
      if (v59 > 4)
        v60 = "?";
      else
        v60 = off_1E5F4FDD0[v59 - 1];
      v116 = v60;
      NSAppendPrintF();
      v61 = v7;

      v7 = v61;
    }
    v62 = -[RPCompanionLinkDevice personalDeviceState](v5, "personalDeviceState", v116);
    if (v62)
    {
      if (v62 >= 8)
      {
        v63 = "-";
        if (v62 > 9)
          v63 = "U";
      }
      else
      {
        v63 = off_1E5F4FDF0[v62 - 1];
      }
      v117 = (uint64_t)v63;
      NSAppendPrintF();
      v64 = v7;

      v7 = v64;
    }
    v65 = self->_peerHomeKitUserIdentifier;
    v66 = v65;
    if (v65)
    {
      v117 = (uint64_t)v65;
      NSAppendPrintF();
      v67 = v7;

      v7 = v67;
    }

    -[RPCompanionLinkDevice publicIdentifier](v5, "publicIdentifier");
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = (void *)v68;
    if (v68)
    {
      v117 = v68;
      NSAppendPrintF();
      v70 = v7;

      v7 = v70;
    }

    v71 = -[RPCompanionLinkDevice personalRequestsState](v5, "personalRequestsState");
    if (v71)
    {
      if (v71 >= 8)
      {
        v72 = "-";
        if (v71 > 9)
          v72 = "U";
      }
      else
      {
        v72 = off_1E5F4FDF0[v71 - 1];
      }
      v117 = (uint64_t)v72;
      NSAppendPrintF();
      v73 = v7;

      v7 = v73;
    }
    -[RPCompanionLinkDevice roomName](v5, "roomName", v117);
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)v74;
    if (v74)
    {
      retryCount = v74;
      NSAppendPrintF();
      v76 = v7;

      v7 = v76;
    }

    -[RPEndpoint verifiedIdentity](v5, "verifiedIdentity");
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)v77;
    if (v77)
    {
      retryCount = v77;
      NSAppendPrintF();
      v79 = v7;

      v7 = v79;
    }

  }
  if (a3 <= 20)
  {
    if (self->_controlFlags)
    {
      retryCount = self->_controlFlags;
      v122 = &unk_1AF306F27;
      NSAppendPrintF();
      v80 = v7;

      v7 = v80;
    }
    -[RPCompanionLinkDevice deviceColor](v5, "deviceColor", retryCount, v122);
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v81;
    if (v81)
    {
      v118 = v81;
      NSAppendPrintF();
      v83 = v7;

      v7 = v83;
    }

    v84 = -[RPCompanionLinkDevice deviceCapabilityFlags](v5, "deviceCapabilityFlags");
    if ((_DWORD)v84)
    {
      v118 = v84;
      v124 = &unk_1AF3071AC;
      NSAppendPrintF();
      v85 = v7;

      v7 = v85;
    }
    -[RPEndpoint serviceTypes](v5, "serviceTypes", v118, v124);
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = (void *)v86;
    if (v86)
    {
      v119 = v86;
      NSAppendPrintF();
      v88 = v7;

      v7 = v88;
    }

    -[RPCompanionLinkDevice siriInfo](v5, "siriInfo");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v89)
    {
      v119 = objc_msgSend(v89, "count");
      NSAppendPrintF();
      v91 = v7;

      v7 = v91;
    }

    -[RPEndpoint sourceVersion](v5, "sourceVersion");
    v92 = objc_claimAutoreleasedReturnValue();
    v93 = (void *)v92;
    if (v92)
    {
      v119 = v92;
      NSAppendPrintF();
      v94 = v7;

      v7 = v94;
    }

    flags = self->_flags;
    if (flags)
    {
      v119 = RPCompanionLinkFlagsToShortString(flags, (uint64_t)v132);
      NSAppendPrintF();
      v96 = v7;

      v7 = v96;
    }
    v97 = -[RPCompanionLinkDevice flags](v5, "flags", v119);
    if (v97)
    {
      v120 = RPCompanionLinkFlagsToShortString(v97, (uint64_t)v132);
      NSAppendPrintF();
      v98 = v7;

      v7 = v98;
    }
    v99 = -[RPEndpoint statusFlags](v5, "statusFlags", v120);
    if (v99)
    {
      v121 = v99;
      v125 = &unk_1AF3071C2;
      NSAppendPrintF();
      v100 = v7;

      v7 = v100;
    }
    -[RPEndpoint verifiedAcl](v5, "verifiedAcl", v121, v125);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      NSAppendPrintF();
      v102 = v7;

      v7 = v102;
    }

    v103 = self->_btPipe;
    if (v103)
    {
      NSAppendPrintF();
      v104 = v7;

      v7 = v104;
    }

    v105 = self->_bleConnection;
    if (v105)
    {
      NSAppendPrintF();
      v106 = v7;

      v7 = v106;
    }

    v107 = self->_tcpConnection;
    if (v107)
    {
      NSAppendPrintF();
      v108 = v7;

      v7 = v108;
    }

  }
  v109 = v7;

  return v109;
}

- (id)_getCurrentProcessName
{
  NSString *appID;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  appID = self->_appID;
  if (appID)
  {
    v3 = appID;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = CFSTR("Unknown");
    }
  }
  return v3;
}

- (void)setFlowControlReadEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int var0;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_flowControlReadEnabled != v3)
  {
    self->_flowControlReadEnabled = v3;
    var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v3)
    {
      if (!self->_readFrame.readRequested)
        -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrame, self->_requestable);
      if (self->_btPipeHighPriority)
      {
        if (!self->_readFrameBTPipeHighPriority.readRequested)
          -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrameBTPipeHighPriority);
      }
    }
  }
}

- (int)flowControlWriteState
{
  return -[CUTCPConnection flowControlState](self->_tcpConnection, "flowControlState");
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");

  LogCategoryReplaceF();
}

- (void)setPresent:(BOOL)a3
{
  _BOOL4 v3;
  int var0;
  OS_dispatch_source *probeTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  _QWORD handler[5];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_present != v3)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_present = v3;
    if (v3)
    {
      probeTimer = self->_probeTimer;
      if (probeTimer)
      {
        v15 = probeTimer;
        dispatch_source_cancel(v15);
        v7 = self->_probeTimer;
        self->_probeTimer = 0;

LABEL_19:
      }
    }
    else
    {
      if (!self->_tcpConnection)
      {
        v14 = self->_ucat->var0;
        if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        RPErrorF();
        v15 = objc_claimAutoreleasedReturnValue();
        -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v15);
        goto LABEL_19;
      }
      v8 = self->_probeTimer;
      if (v8)
      {
        v9 = v8;
        dispatch_source_cancel(v9);
        v10 = self->_probeTimer;
        self->_probeTimer = 0;

      }
      v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v12 = self->_probeTimer;
      self->_probeTimer = v11;

      v13 = self->_probeTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __27__RPConnection_setPresent___block_invoke;
      handler[3] = &unk_1E5F4EC60;
      handler[4] = self;
      dispatch_source_set_event_handler(v13, handler);
      CUDispatchTimerSet();
      dispatch_resume((dispatch_object_t)self->_probeTimer);
    }
  }
}

uint64_t __27__RPConnection_setPresent___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "sendReachabilityProbe:", "not present");
}

- (void)setTrafficFlags:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_activateCalled)
    {
      dispatchQueue = self->_dispatchQueue;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __32__RPConnection_setTrafficFlags___block_invoke;
      v4[3] = &unk_1E5F4F450;
      v4[4] = self;
      v5 = a3;
      dispatch_async(dispatchQueue, v4);
    }
  }
}

uint64_t __32__RPConnection_setTrafficFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "setTrafficFlags:", *(unsigned int *)(a1 + 40));
}

- (void)activate
{
  int var0;
  int v4;
  int v5;
  int v6;
  NSString *identifierOverride;
  NSString *v8;
  NSString *v9;
  NSString *initiator;
  int v11;
  int linkType;
  RPCompanionLinkDevice *peerDeviceInfo;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t controlFlags;
  int v18;
  void *v19;
  unint64_t v20;
  void *v21;
  CUTCPConnection *tcpConnection;
  const char *v23;
  NSString *v24;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_activateCalled = 1;
  -[RPConnection _updateLinkInfo](self, "_updateLinkInfo");
  if (self->_bonjourPeerDevice)
  {
    self->_clientMode = 1;
    -[RPCompanionLinkDevice updateWithBonjourDevice:](self->_peerDeviceInfo, "updateWithBonjourDevice:");
    -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 4);
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      goto LABEL_20;
LABEL_21:
    identifierOverride = self->_identifierOverride;
    v8 = identifierOverride;
    v24 = v8;
    if (v8)
    {
      -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:", v8);
      objc_storeStrong((id *)&self->_peerIdentifier, identifierOverride);
    }
    else if (self->_peerIdentifier)
    {
      -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:");
    }
    self->_activatedTicks = mach_absolute_time();
    -[RPConnection _getCurrentProcessName](self, "_getCurrentProcessName");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    initiator = self->_initiator;
    self->_initiator = v9;

    -[RPConnection _run](self, "_run");
    return;
  }
  if (self->_destinationString)
  {
    self->_clientMode = 1;
    v4 = self->_ucat->var0;
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      goto LABEL_20;
    goto LABEL_21;
  }
  if (self->_blePeerIdentifier)
  {
    self->_clientMode = 1;
    -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 2);
    v5 = self->_ucat->var0;
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
      goto LABEL_20;
    goto LABEL_21;
  }
  if (self->_bleConnection)
  {
    self->_clientMode = 0;
    -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 2);
    objc_storeStrong((id *)&self->_requestable, self->_bleConnection);
    v6 = self->_ucat->var0;
    if (v6 > 30 || v6 == -1 && !_LogCategory_Initialize())
      goto LABEL_21;
    goto LABEL_29;
  }
  if (self->_btPipe)
  {
    self->_clientMode = GestaltGetDeviceClass() == 6;
    -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x41);
    objc_storeStrong((id *)&self->_requestable, self->_btPipe);
    v11 = self->_ucat->var0;
    if (v11 > 30 || v11 == -1 && !_LogCategory_Initialize())
      goto LABEL_21;
LABEL_29:
    RPDataLinkTypeToString(self->_linkType);
LABEL_20:
    LogPrintF();
    goto LABEL_21;
  }
  if (self->_tcpConnection)
  {
    self->_clientMode = 0;
    linkType = self->_linkType;
    peerDeviceInfo = self->_peerDeviceInfo;
    v14 = -[RPEndpoint statusFlags](peerDeviceInfo, "statusFlags");
    v15 = 4;
    if (linkType == 4)
      v15 = 8;
    -[RPEndpoint setStatusFlags:](peerDeviceInfo, "setStatusFlags:", v14 | v15);
    objc_storeStrong((id *)&self->_requestable, self->_tcpConnection);
    v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
    {
      controlFlags = self->_controlFlags;
      tcpConnection = self->_tcpConnection;
      v23 = RPDataLinkTypeToString(self->_linkType);
      v20 = controlFlags;
      v21 = &unk_1AF306F27;
      LogPrintF();
    }
    -[RPEndpoint ipAddress](self->_peerDeviceInfo, "ipAddress", v20, v21, tcpConnection, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

    }
    else if (self->_peerAddrString)
    {
      -[RPEndpoint setIpAddress:](self->_peerDeviceInfo, "setIpAddress:");
    }
    goto LABEL_21;
  }
  v18 = self->_ucat->var0;
  if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__RPConnection_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__RPConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)invalidateWithError:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__RPConnection_invalidateWithError___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __36__RPConnection_invalidateWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidateWithError:(id)a3
{
  id v4;
  int var0;
  int v6;
  id v7;
  id v8;

  v4 = a3;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    v8 = v4;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        v7 = v4;
        LogPrintF();
      }
    }
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", v8, v7);
    -[RPConnection _invalidated](self, "_invalidated");
    v4 = v8;
  }

}

- (void)_invalidate
{
  int var0;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", 0);
    -[RPConnection _invalidated](self, "_invalidated");
  }
}

- (void)_invalidateCore:(id)a3
{
  NSError *v4;
  OS_dispatch_source *idleTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *probeTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *retryTimer;
  NSObject *v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *startTimer;
  NSObject *v15;
  OS_dispatch_source *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  uint64_t v19;
  void *v20;
  NSError *stepError;
  NSError *v22;
  NSError *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  int var0;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void (**v34)(_QWORD, _QWORD);
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableArray *sendArray;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSMutableArray *receivedMessages;
  void *v48;
  NSError *v49;
  NSError *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)a3;
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    v6 = idleTimer;
    dispatch_source_cancel(v6);
    v7 = self->_idleTimer;
    self->_idleTimer = 0;

  }
  probeTimer = self->_probeTimer;
  if (probeTimer)
  {
    v9 = probeTimer;
    dispatch_source_cancel(v9);
    v10 = self->_probeTimer;
    self->_probeTimer = 0;

  }
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v12 = retryTimer;
    dispatch_source_cancel(v12);
    v13 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  startTimer = self->_startTimer;
  if (startTimer)
  {
    v15 = startTimer;
    dispatch_source_cancel(v15);
    v16 = self->_startTimer;
    self->_startTimer = 0;

  }
  -[CUBLEConnection invalidate](self->_bleConnection, "invalidate");
  -[CUTCPConnection invalidate](self->_tcpConnection, "invalidate");
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_readErrorHandler);
  if (v17)
  {
    if (v4)
      RPNestedErrorF();
    else
      NSErrorWithOSStatusF();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v17)[2](v17, v18);

  }
  if (self->_showPasswordCalled)
  {
    self->_showPasswordCalled = 0;
    v19 = MEMORY[0x1AF45BE48](self->_hidePasswordHandler);
    v20 = (void *)v19;
    if (v19)
      (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, 0);

  }
  stepError = v4;
  v50 = v4;
  if (v4 || (stepError = self->_stepError) != 0)
  {
    v22 = stepError;
  }
  else
  {
    RPErrorF();
    v22 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;
  -[RPConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v22);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v24 = self->_sendArray;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v29, "requestID");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v31)
          {
            v48 = (void *)v31;
            v49 = v23;
            LogPrintF();
          }
          else
          {
            objc_msgSend(v29, "eventID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v23;
            LogPrintF();

          }
        }
        objc_msgSend(v29, "timer", v48, v49);
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setTimer:", 0);
        if (v33)
          dispatch_source_cancel(v33);
        objc_msgSend(v29, "completion");
        v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setCompletion:", 0);
        if (v34)
        {
          ((void (**)(_QWORD, NSError *))v34)[2](v34, v23);
        }
        else
        {
          objc_msgSend(v29, "responseHandler");
          v35 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setResponseHandler:", 0);
          if (v35)
            ((void (**)(_QWORD, _QWORD, _QWORD, NSError *))v35)[2](v35, 0, 0, v23);

        }
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v26);
  }

  -[NSMutableArray removeAllObjects](self->_sendArray, "removeAllObjects");
  sendArray = self->_sendArray;
  self->_sendArray = 0;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v37 = self->_receivedMessages;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v52 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        v43 = self->_ucat->var0;
        if (v43 <= 60 && (v43 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v42, "requestID");
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = (void *)v44;
          if (v44)
          {
            v48 = (void *)v44;
            v49 = v23;
            LogPrintF();
          }
          else
          {
            objc_msgSend(v42, "eventID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v23;
            LogPrintF();

          }
        }
        objc_msgSend(v42, "responseHandler", v48, v49);
        v46 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setResponseHandler:", 0);
        if (v46)
          ((void (**)(_QWORD, _QWORD, _QWORD, NSError *))v46)[2](v46, 0, 0, v23);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v39);
  }

  -[NSMutableArray removeAllObjects](self->_receivedMessages, "removeAllObjects");
  receivedMessages = self->_receivedMessages;
  self->_receivedMessages = 0;

  -[RPConnection _logConnectionInvalidatedWithError:](self, "_logConnectionInvalidatedWithError:", v50);
}

- (void)_invalidated
{
  OS_dispatch_source *startTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  int var0;
  void (**invalidationHandler)(void);
  id authCompletionHandler;
  id configurePairingHandler;
  id flowControlWriteChangedHandler;
  id homeKitUserIdentifierHandler;
  id v12;
  id pairVerifyCompletion;
  id showPasswordHandler;
  id hidePasswordHandler;
  id v16;
  id promptForPasswordHandler;
  NSMutableArray *proxyDevices;
  id proxyDeviceUpdateHandler;
  id peerUpdatedHandler;
  id readErrorHandler;
  id receivedEventHandler;
  id receivedRequestHandler;
  id sessionStartHandler;
  id stateChangedHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone && !self->_bleConnection && !self->_tcpConnection)
  {
    -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
    -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
    startTimer = self->_startTimer;
    if (startTimer)
    {
      v4 = startTimer;
      dispatch_source_cancel(v4);
      v5 = self->_startTimer;
      self->_startTimer = 0;

    }
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    authCompletionHandler = self->_authCompletionHandler;
    self->_authCompletionHandler = 0;

    configurePairingHandler = self->_configurePairingHandler;
    self->_configurePairingHandler = 0;

    flowControlWriteChangedHandler = self->_flowControlWriteChangedHandler;
    self->_flowControlWriteChangedHandler = 0;

    homeKitUserIdentifierHandler = self->_homeKitUserIdentifierHandler;
    self->_homeKitUserIdentifierHandler = 0;

    v12 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    pairVerifyCompletion = self->_pairVerifyCompletion;
    self->_pairVerifyCompletion = 0;

    showPasswordHandler = self->_showPasswordHandler;
    self->_showPasswordHandler = 0;

    hidePasswordHandler = self->_hidePasswordHandler;
    self->_hidePasswordHandler = 0;

    v16 = self->_homeKitUserIdentifierHandler;
    self->_homeKitUserIdentifierHandler = 0;

    promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_promptForPasswordHandler = 0;

    -[NSMutableArray removeAllObjects](self->_proxyDevices, "removeAllObjects");
    proxyDevices = self->_proxyDevices;
    self->_proxyDevices = 0;

    proxyDeviceUpdateHandler = self->_proxyDeviceUpdateHandler;
    self->_proxyDeviceUpdateHandler = 0;

    peerUpdatedHandler = self->_peerUpdatedHandler;
    self->_peerUpdatedHandler = 0;

    readErrorHandler = self->_readErrorHandler;
    self->_readErrorHandler = 0;

    receivedEventHandler = self->_receivedEventHandler;
    self->_receivedEventHandler = 0;

    receivedRequestHandler = self->_receivedRequestHandler;
    self->_receivedRequestHandler = 0;

    sessionStartHandler = self->_sessionStartHandler;
    self->_sessionStartHandler = 0;

    stateChangedHandler = self->_stateChangedHandler;
    self->_stateChangedHandler = 0;

    self->_invalidateDone = 1;
  }
}

- (void)homeKitIdentityUpdated
{
  NSString *v3;
  int var0;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *v10;
  NSString *peerHomeKitUserIdentifier;
  NSData *homeKitIdentitySignature;
  NSString *v13;
  NSString *v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0 && (self->_flags & 1) == 0)
  {
    if ((self->_statusFlags & 0x80000) != 0)
    {
      -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = self->_peerHomeKitUserIdentifier;
      v8 = v6;
      v13 = v8;
      if (v7 == v8)
      {

        peerHomeKitUserIdentifier = v13;
        v3 = v13;
      }
      else
      {
        if ((v8 != 0) != (v7 == 0))
        {
          v9 = -[NSString isEqual:](v7, "isEqual:", v8);

          if ((v9 & 1) != 0)
          {
            v10 = v13;
LABEL_23:

            return;
          }
        }
        else
        {

        }
        v3 = v13;
        peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
        self->_peerHomeKitUserIdentifier = v3;
      }
    }
    else
    {
      v3 = (NSString *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[RPConnection _identityProofsAdd:update:](self, "_identityProofsAdd:update:", v3, 1);
      if (-[NSString count](v3, "count"))
      {
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        -[RPConnection sendEncryptedEventID:event:options:completion:](self, "sendEncryptedEventID:event:options:completion:", CFSTR("_systemInfoUpdate"), v3, 0, 0);
      }
      peerHomeKitUserIdentifier = self->_homeKitIdentityIdentifier;
      if (peerHomeKitUserIdentifier)
      {
        homeKitIdentitySignature = self->_homeKitIdentitySignature;
        if (homeKitIdentitySignature)
        {
          v14 = peerHomeKitUserIdentifier;
          -[RPConnection _identityProofsVerifyHomeKitSignature:identifier:](self, "_identityProofsVerifyHomeKitSignature:identifier:", homeKitIdentitySignature, peerHomeKitUserIdentifier);
          peerHomeKitUserIdentifier = v14;
        }
      }
    }

    v10 = v3;
    goto LABEL_23;
  }
}

- (void)_logConnectionInvalidatedWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v4 = a3;
  mach_absolute_time();
  v5 = UpTicksToSeconds();
  -[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkDevice mediaSystemIdentifier](self->_peerDeviceInfo, "mediaSystemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {

  }
  else
  {
    if ((v8 == 0) == (v9 != 0))
    {
      v11 = 0;
      v13 = v9;
      v12 = v8;
      goto LABEL_9;
    }
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if (!(_DWORD)v11)
      goto LABEL_12;
  }
  -[RPEndpoint model](self->_localDeviceInfo, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (GestaltProductTypeStringToDeviceClass() != 7)
  {
    v11 = 0;
    goto LABEL_11;
  }
  -[RPEndpoint model](self->_peerDeviceInfo, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = GestaltProductTypeStringToDeviceClass() == 7;
LABEL_9:

LABEL_11:
LABEL_12:

  -[RPEndpoint model](self->_localDeviceInfo, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = GestaltProductTypeStringToDeviceClass();
  RPDeviceClassToString(v15);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[RPEndpoint model](self->_peerDeviceInfo, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = GestaltProductTypeStringToDeviceClass();
  RPDeviceClassToString(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[RPConnectionMetrics sharedMetrics](RPConnectionMetrics, "sharedMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = self->_linkType;
  objc_msgSend(v19, "logConnectionWithDeviceModelFrom:deviceModelTo:error:initiator:isOnDemand:isStereoPair:lifetime:linkType:", v21, v18, v4, self->_initiator, (self->_controlFlags >> 9) & 1, v11, v5, v20);

}

- (void)_pairSetupInvalidate
{
  CUPairingStream *mainStream;
  CUPairingStream *highPriorityStream;
  CUPairingSession *pairSetupSession;

  mainStream = self->_mainStream;
  self->_mainStream = 0;

  highPriorityStream = self->_highPriorityStream;
  self->_highPriorityStream = 0;

  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", 0);
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", 0);
  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

}

- (void)_pairVerifyInvalidate
{
  NSData *identityKeyData;
  void *v4;
  rsize_t v5;
  NSData *identitySignature;
  void *v7;
  rsize_t v8;
  NSData *homeKitIdentitySignature;
  void *v10;
  rsize_t v11;
  NSData *v12;
  NSData *v13;
  NSString *homeKitIdentityIdentifier;
  NSData *v15;
  RPIdentity *identityVerified;
  CUPairingStream *mainStream;
  CUPairingStream *highPriorityStream;
  CUPairingSession *pairVerifySession;

  identityKeyData = self->_identityKeyData;
  if (identityKeyData)
  {
    v4 = -[NSData bytes](identityKeyData, "bytes");
    v5 = -[NSData length](self->_identityKeyData, "length");
    if (v4)
      memset_s(v4, v5, 0, v5);
  }
  identitySignature = self->_identitySignature;
  if (identitySignature)
  {
    v7 = -[NSData bytes](identitySignature, "bytes");
    v8 = -[NSData length](self->_identitySignature, "length");
    if (v7)
      memset_s(v7, v8, 0, v8);
  }
  homeKitIdentitySignature = self->_homeKitIdentitySignature;
  if (homeKitIdentitySignature)
  {
    v10 = -[NSData bytes](homeKitIdentitySignature, "bytes");
    v11 = -[NSData length](self->_homeKitIdentitySignature, "length");
    if (v10)
      memset_s(v10, v11, 0, v11);
  }
  v12 = self->_identityKeyData;
  self->_identityKeyData = 0;

  v13 = self->_identitySignature;
  self->_identitySignature = 0;

  homeKitIdentityIdentifier = self->_homeKitIdentityIdentifier;
  self->_homeKitIdentityIdentifier = 0;

  v15 = self->_homeKitIdentitySignature;
  self->_homeKitIdentitySignature = 0;

  identityVerified = self->_identityVerified;
  self->_identityVerified = 0;

  mainStream = self->_mainStream;
  self->_mainStream = 0;

  highPriorityStream = self->_highPriorityStream;
  self->_highPriorityStream = 0;

  self->_pairVerifyIdentityType = 0;
  -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", 0);
  -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", 0);
  -[CUPairingSession invalidate](self->_pairVerifySession, "invalidate");
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0;

}

- (id)_pairVerifySignData:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  id v7;
  RPIdentity *v8;
  char v9;
  int v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  id v22;
  RPIdentityDaemon *identityDaemon;
  int var0;
  id v25;
  id v27;
  id v28;

  v7 = a3;
  v8 = self->_forcedSelfIdentity;
  v9 = -[CUPairingSession peerAppFlags](self->_pairVerifySession, "peerAppFlags");
  if ((self->_controlFlags & 0x40) != 0 || (v9 & 1) != 0 || v8)
  {
    if (self->_clientMode)
    {
      if (!v8)
      {
LABEL_11:
        -[CUPairingSession copyIdentityHandler](self->_pairVerifySession, "copyIdentityHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[CUPairingSession copyIdentityHandler](self->_pairVerifySession, "copyIdentityHandler");
          v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v12[2](v12, 2, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v8 = objc_alloc_init(RPIdentity);
            objc_msgSend(v13, "altIRK");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[RPIdentity setDeviceIRKData:](v8, "setDeviceIRKData:", v14);

            objc_msgSend(v13, "publicKey");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[RPIdentity setEdPKData:](v8, "setEdPKData:", v15);

            objc_msgSend(v13, "secretKey");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[RPIdentity setEdSKData:](v8, "setEdSKData:", v16);

            if (v8)
              goto LABEL_14;
          }
          else
          {

          }
        }
        identityDaemon = self->_identityDaemon;
        v28 = 0;
        -[RPIdentityDaemon identityOfSelfAndReturnError:](identityDaemon, "identityOfSelfAndReturnError:", &v28);
        v8 = (RPIdentity *)objc_claimAutoreleasedReturnValue();
        v17 = v28;
        if (!v8)
        {
          var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          if (a5)
          {
            v17 = objc_retainAutorelease(v17);
            v8 = 0;
            v19 = 0;
            *a5 = v17;
          }
          else
          {
            v8 = 0;
            v19 = 0;
          }
          goto LABEL_33;
        }
LABEL_15:
        v18 = v17;
        v27 = v17;
        -[RPIdentity signData:error:](v8, "signData:error:", v7, &v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v27;

        if (v19)
        {
          self->_pairVerifyUsedIdentity = 1;
          v20 = self->_ucat->var0;
          if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v22 = v19;
        }
        else
        {
          v21 = self->_ucat->var0;
          if (v21 <= 90 && (v21 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          if (a5)
            *a5 = objc_retainAutorelease(v17);
        }

LABEL_33:
        goto LABEL_38;
      }
    }
    else
    {
      -[CUPairingSession setSelfAppFlags:](self->_pairVerifySession, "setSelfAppFlags:", -[CUPairingSession selfAppFlags](self->_pairVerifySession, "selfAppFlags") | 1);
      if (!v8)
        goto LABEL_11;
    }
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v10 = self->_ucat->var0;
  if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6714, 0);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v25;

  }
  v19 = 0;
LABEL_38:

  return v19;
}

- (BOOL)_pairVerifyVerifySignature:(id)a3 data:(id)a4 flags:(unsigned int)a5 error:(id *)a6
{
  id v10;
  id v11;
  RPIdentity *v12;
  char v13;
  unint64_t controlFlags;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v19;
  RPIdentityDaemon *identityDaemon;
  void *v21;
  int v22;
  int var0;
  BOOL v24;
  id v25;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = self->_forcedPeerIdentity;
  v13 = -[CUPairingSession peerAppFlags](self->_pairVerifySession, "peerAppFlags");
  controlFlags = self->_controlFlags;
  if ((controlFlags & 0x40) != 0 || (v13 & 1) != 0 || v12)
  {
    self->_pairVerifyUsedIdentity = 1;
    if (v12)
    {
      v16 = 0;
    }
    else
    {
      v17 = controlFlags & 0x400000000000;
      if (self->_pairVerifyAuthType != 8 && v17 == 0)
        v19 = 19498;
      else
        v19 = 19458;
      identityDaemon = self->_identityDaemon;
      v27 = 0;
      -[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:](identityDaemon, "resolveIdentityForSignature:data:typeFlags:error:", v10, v11, v19, &v27);
      v12 = (RPIdentity *)objc_claimAutoreleasedReturnValue();
      v16 = v27;
      if (!v12)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (a6)
        {
          v16 = objc_retainAutorelease(v16);
          v24 = 0;
          v12 = 0;
          *a6 = v16;
        }
        else
        {
          v24 = 0;
          v12 = 0;
        }
        goto LABEL_25;
      }
    }
    objc_storeStrong((id *)&self->_identityKeyData, a4);
    objc_storeStrong((id *)&self->_identitySignature, a3);
    objc_storeStrong((id *)&self->_identityVerified, v12);
    -[RPIdentity identifier](v12, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPEndpoint setVerifiedIdentity:](self->_peerDeviceInfo, "setVerifiedIdentity:", v21);

    self->_pairVerifyIdentityType = -[RPIdentity type](v12, "type");
    v22 = self->_ucat->var0;
    if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v24 = 1;
LABEL_25:

    goto LABEL_30;
  }
  v15 = self->_ucat->var0;
  if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6714, 0);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a6 = v25;

  }
  v24 = 0;
LABEL_30:

  return v24;
}

- (void)_pskPrepare:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSData *pskData;
  char v7;
  id v8;
  NSError *v9;
  NSData *v10;
  char v11;
  id v12;
  int v13;
  int var0;
  NSError *v15;
  NSError *v16;
  NSError *stepError;
  id v18;
  id v19;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D1B408]);
  pskData = self->_pskData;
  v19 = 0;
  v7 = objc_msgSend(v5, "prepareWithName:isClient:pskData:error:", CFSTR("main"), v3, pskData, &v19);
  v8 = v19;
  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_mainStream, v5);
    self->_mainAuthTagLength = objc_msgSend(v5, "authTagLength");
    if (self->_btPipeHighPriority)
    {
      v9 = (NSError *)objc_alloc_init(MEMORY[0x1E0D1B408]);
      v10 = self->_pskData;
      v18 = v8;
      v11 = -[NSError prepareWithName:isClient:pskData:error:](v9, "prepareWithName:isClient:pskData:error:", CFSTR("hipri"), v3, v10, &v18);
      v12 = v18;

      if ((v11 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_highPriorityStream, v9);
        self->_highPriorityAuthTagLength = -[NSError authTagLength](v9, "authTagLength");
      }
      else
      {
        var0 = self->_ucat->var0;
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (!self->_stepError)
        {
          RPNestedErrorF();
          v16 = (NSError *)objc_claimAutoreleasedReturnValue();
          stepError = self->_stepError;
          self->_stepError = v16;

        }
      }
      v8 = v12;
      goto LABEL_18;
    }
  }
  else
  {
    v13 = self->_ucat->var0;
    if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (!self->_stepError)
    {
      RPNestedErrorF();
      v15 = (NSError *)objc_claimAutoreleasedReturnValue();
      v9 = self->_stepError;
      self->_stepError = v15;
LABEL_18:

    }
  }

}

- (unint64_t)statusFlagsUsingIdentities:(id)a3
{
  return 0;
}

- (void)_run
{
  if (self->_clientMode)
    -[RPConnection _clientRun](self, "_clientRun");
  else
    -[RPConnection _serverRun](self, "_serverRun");
}

- (void)sessionStopped:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
}

- (void)tryPassword:(id)a3
{
  CUPairingSession *pairSetupSession;
  int var0;
  int v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientMode)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_13;
LABEL_9:
    LogPrintF();
    goto LABEL_13;
  }
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    -[CUPairingSession tryPIN:](pairSetupSession, "tryPIN:", v7);
    goto LABEL_13;
  }
  v6 = self->_ucat->var0;
  if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    goto LABEL_9;
LABEL_13:

}

- (void)_updateExternalState
{
  int internalState;
  _BOOL8 v4;
  int state;
  int var0;
  void (**stateChangedHandler)(id, _BOOL8);

  internalState = self->_internalState;
  v4 = internalState == 21 || internalState == 28;
  state = self->_state;
  if (state != v4)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_state = v4;
    stateChangedHandler = (void (**)(id, _BOOL8))self->_stateChangedHandler;
    if (stateChangedHandler)
      stateChangedHandler[2](stateChangedHandler, v4);
  }
}

- (void)_updateLinkInfo
{
  CUTCPConnection *tcpConnection;
  NSString *v4;
  NSString *peerAddrString;
  CUTCPConnection *v6;
  NSString *selfAddrString;
  CUTCPConnection *v8;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  CUBonjourDevice *bonjourPeerDevice;
  void *v17;
  char Int64Ranged;
  char v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  tcpConnection = self->_tcpConnection;
  if (tcpConnection)
  {
    -[CUTCPConnection peerAddr](tcpConnection, "peerAddr");
    v20 = 0;
    SockAddrToString();
    peerAddrString = self->_peerAddrString;
    self->_peerAddrString = 0;

    v6 = self->_tcpConnection;
    if (v6)
      -[CUTCPConnection selfAddr](v6, "selfAddr");
    v19 = 0;
    SockAddrToString();
  }
  else
  {
    v4 = self->_peerAddrString;
    self->_peerAddrString = 0;

  }
  selfAddrString = self->_selfAddrString;
  self->_selfAddrString = 0;

  v8 = self->_tcpConnection;
  if (v8)
  {
    v9 = -[CUTCPConnection netTransportType](v8, "netTransportType");
    if ((v9 & 2) != 0)
      v10 = 6;
    else
      v10 = 3;
    if ((v9 & 8) != 0)
      v11 = 8;
    else
      v11 = v10;
    if (v9 < 0)
      v12 = 5;
    else
      v12 = v11;
    if ((v9 & 1) != 0)
      v13 = 7;
    else
      v13 = v12;
    if ((v9 & 0x10) != 0)
      v14 = 9;
    else
      v14 = v13;
    if ((v9 & 4) != 0)
      v15 = 4;
    else
      v15 = v14;
  }
  else if (self->_blePeerIdentifier || self->_bleConnection)
  {
    v15 = 1;
  }
  else if (self->_btPipe)
  {
    v15 = 2;
  }
  else
  {
    bonjourPeerDevice = self->_bonjourPeerDevice;
    if (bonjourPeerDevice)
    {
      -[CUBonjourDevice deviceInfo](bonjourPeerDevice, "deviceInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      Int64Ranged = CFDictionaryGetInt64Ranged();

      if ((Int64Ranged & 4) != 0)
      {
        v15 = 4;
      }
      else if ((Int64Ranged & 0x10) != 0)
      {
        v15 = 9;
      }
      else if ((Int64Ranged & 1) != 0)
      {
        v15 = 7;
      }
      else if (Int64Ranged < 0)
      {
        v15 = 5;
      }
      else if ((Int64Ranged & 8) != 0)
      {
        v15 = 8;
      }
      else if ((Int64Ranged & 2) != 0)
      {
        v15 = 6;
      }
      else
      {
        v15 = 3;
      }
    }
    else if (self->_destinationString)
    {
      v15 = 3;
    }
    else
    {
      v15 = 0;
    }
  }
  if (v15 != self->_linkType)
    self->_linkType = v15;
}

- (void)_clientRun
{
  unsigned int internalState;
  int v4;
  NSError *stepError;
  int var0;
  OS_dispatch_source *startTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  unint64_t controlFlags;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  const char *v19;
  const char *v20;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      internalState = self->_internalState;
      switch(internalState)
      {
        case 0u:
          goto LABEL_38;
        case 0xAu:
          self->_internalState = 11;
          -[RPConnection _clientConnectStart](self, "_clientConnectStart");
          goto LABEL_64;
        case 0xBu:
          if (self->_stepError)
            goto LABEL_31;
          if (!self->_stepDone)
            goto LABEL_64;
          if (self->_preAuthEnabled)
          {
            v4 = 12;
            goto LABEL_63;
          }
LABEL_12:
          if (!self->_pskData)
            goto LABEL_62;
          v4 = 18;
          goto LABEL_63;
        case 0xCu:
          self->_internalState = 13;
          -[RPConnection _clientPreAuthStart](self, "_clientPreAuthStart");
          goto LABEL_64;
        case 0xDu:
          if (self->_stepError)
            goto LABEL_31;
          if (self->_stepDone)
            goto LABEL_12;
          goto LABEL_64;
        case 0xEu:
          self->_internalState = 15;
          -[RPConnection _clientPairSetupStart](self, "_clientPairSetupStart");
          goto LABEL_64;
        case 0xFu:
          if (!self->_stepError)
            goto LABEL_39;
          goto LABEL_31;
        case 0x10u:
          self->_internalState = 17;
          -[RPConnection _clientPairVerifyStart](self, "_clientPairVerifyStart");
          goto LABEL_64;
        case 0x11u:
          stepError = self->_stepError;
          if (stepError)
          {
            self->_pairVerifyFailed = 1;
            if (self->_pairVerifySession)
            {
              var0 = self->_ucat->var0;
              if (var0 <= 60)
              {
                if (var0 != -1)
                  goto LABEL_22;
                if (_LogCategory_Initialize())
                {
                  stepError = self->_stepError;
LABEL_22:
                  v19 = (const char *)stepError;
                  LogPrintF();
                }
              }
              v12 = MEMORY[0x1AF45BE48](self->_pairVerifyCompletion);
              v13 = (void *)v12;
              if (v12)
                (*(void (**)(uint64_t, NSError *))(v12 + 16))(v12, self->_stepError);

            }
            controlFlags = self->_controlFlags;
            if ((controlFlags & 0x400) != 0 || (controlFlags & 0x8000000000) != 0 || (self->_flags & 1) != 0)
            {
              v16 = self->_ucat->var0;
              if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              v4 = 14;
            }
            else
            {
              if ((self->_controlFlags & 0x240) != 0x200 || !self->_pairVerifyUsedIdentity)
              {
LABEL_31:
                self->_internalState = 22;
                goto LABEL_64;
              }
              v15 = self->_ucat->var0;
              if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
                LogPrintF();
LABEL_62:
              v4 = 16;
            }
            goto LABEL_63;
          }
LABEL_39:
          if (!self->_stepDone)
            goto LABEL_64;
          v4 = 19;
LABEL_63:
          self->_internalState = v4;
LABEL_64:
          v17 = self->_internalState;
          if (v17 == internalState)
            return;
          v18 = self->_ucat->var0;
          if (v18 > 30)
            goto LABEL_69;
          if (v18 != -1)
            goto LABEL_67;
          if (_LogCategory_Initialize())
          {
            v17 = self->_internalState;
LABEL_67:
            v19 = _StateToString(internalState);
            v20 = _StateToString(v17);
            LogPrintF();
          }
LABEL_69:
          -[RPConnection _updateExternalState](self, "_updateExternalState", v19, v20);
          break;
        case 0x12u:
          -[RPConnection _pskPrepare:](self, "_pskPrepare:", 1);
          startTimer = self->_startTimer;
          if (startTimer)
          {
            v8 = startTimer;
            dispatch_source_cancel(v8);
            v9 = self->_startTimer;
            self->_startTimer = 0;

          }
          v4 = 21;
          goto LABEL_63;
        case 0x13u:
          self->_internalState = 20;
          -[RPConnection _clientStartSession](self, "_clientStartSession");
          goto LABEL_64;
        case 0x14u:
          if (self->_stepError)
            goto LABEL_31;
          if (!self->_stepDone)
            goto LABEL_64;
          -[RPConnection _clientStarted](self, "_clientStarted");
          v4 = self->_internalState + 1;
          goto LABEL_63;
        case 0x15u:
          if (self->_stepError)
            goto LABEL_31;
          -[RPConnection _processSends](self, "_processSends");
          goto LABEL_64;
        case 0x16u:
          if (self->_stepError)
          {
            if (!-[RPConnection _clientError:](self, "_clientError:"))
              goto LABEL_64;
          }
          else
          {
            RPErrorF();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[RPConnection _clientError:](self, "_clientError:", v10);

            if (!v11)
              goto LABEL_64;
          }
          v4 = 23;
          goto LABEL_63;
        case 0x17u:
          self->_internalState = 24;
          ++self->_retryCount;
          -[RPConnection _clientRetryStart](self, "_clientRetryStart");
          goto LABEL_64;
        case 0x18u:
          if (self->_retryFired)
          {
            self->_retryFired = 0;
LABEL_38:
            self->_internalState = 10;
          }
          goto LABEL_64;
        default:
          goto LABEL_64;
      }
    }
  }
}

- (void)_clientConnectStart
{
  int var0;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_blePeerIdentifier)
  {
    -[RPConnection _clientConnectStartBLE](self, "_clientConnectStartBLE");
  }
  else if (self->_btPipe)
  {
    -[RPConnection _clientConnectStartBTPipe](self, "_clientConnectStartBTPipe");
  }
  else
  {
    -[RPConnection _clientConnectStartTCP](self, "_clientConnectStartTCP");
  }
}

- (void)_clientConnectStartBLE
{
  NSError *stepError;
  id v4;
  uint64_t bleConnectionPSM;
  const __CFString *label;
  int var0;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  -[CUBLEConnection invalidate](self->_bleConnection, "invalidate");
  v4 = objc_alloc_init(MEMORY[0x1E0D1B328]);
  objc_storeStrong((id *)&self->_bleConnection, v4);
  objc_msgSend(v4, "setClientBundleID:", self->_clientBundleID);
  objc_msgSend(v4, "setClientUseCase:", self->_bleClientUseCase);
  if (self->_bleConnectionPSM)
    bleConnectionPSM = self->_bleConnectionPSM;
  else
    bleConnectionPSM = 129;
  objc_msgSend(v4, "setDestinationPSM:", bleConnectionPSM);
  objc_msgSend(v4, "setDestinationUUID:", self->_blePeerIdentifier);
  objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("RPCnx");
  objc_msgSend(v4, "setLabel:", label);
  if (self->_clientBundleID)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "clientBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "clientUseCase"));
      v10 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__RPConnection__clientConnectStartBLE__block_invoke;
  v14[3] = &unk_1E5F4EC88;
  v14[4] = v4;
  v14[5] = self;
  objc_msgSend(v4, "setErrorHandler:", v14, v10, v11);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_2;
  v13[3] = &unk_1E5F4ECF8;
  v13[4] = v4;
  v13[5] = self;
  objc_msgSend(v4, "setInvalidationHandler:", v13);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __38__RPConnection__clientConnectStartBLE__block_invoke_3;
  v12[3] = &unk_1E5F4EC88;
  v12[4] = v4;
  v12[5] = self;
  objc_msgSend(v4, "activateWithCompletion:", v12);

}

_QWORD *__38__RPConnection__clientConnectStartBLE__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[58])
    return (_QWORD *)objc_msgSend(result, "_clientNetworkError:label:", a2, "BLE cnx error");
  return result;
}

uint64_t __38__RPConnection__clientConnectStartBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 464))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 288);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 40), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    v5 = *(void **)(v1 + 464);
    *(_QWORD *)(v1 + 464) = 0;

    v6 = *(_QWORD *)(v2 + 40);
    v7 = *(void **)(v6 + 248);
    *(_QWORD *)(v6 + 248) = 0;

    result = *(_QWORD *)(v2 + 40);
    if (*(_BYTE *)(result + 72))
      return objc_msgSend((id)result, "_invalidated");
  }
  return result;
}

void __38__RPConnection__clientConnectStartBLE__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3 == *(void **)(v4 + 464))
  {
    objc_storeStrong((id *)(v4 + 248), v3);
    v6 = a2;
    objc_msgSend(*(id *)(a1 + 40), "_clientConnectCompleted:", v6);

  }
}

- (void)_clientConnectStartBTPipe
{
  NSError *stepError;
  NSObject *dispatchQueue;
  _QWORD block[5];

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__RPConnection__clientConnectStartBTPipe__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__RPConnection__clientConnectStartBTPipe__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientConnectCompleted:", 0);
}

- (void)_clientConnectStartTCP
{
  NSError *stepError;
  id v4;
  unsigned int keepAliveSeconds;
  uint64_t v6;
  const __CFString *label;
  unint64_t controlFlags;
  int v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  -[CUTCPConnection invalidate](self->_tcpConnection, "invalidate");
  v4 = objc_alloc_init(MEMORY[0x1E0D1B460]);
  objc_storeStrong((id *)&self->_tcpConnection, v4);
  objc_msgSend(v4, "setConnectTimeoutSecs:", 30.0);
  objc_msgSend(v4, "setDataTimeoutSecs:", 20.0);
  objc_msgSend(v4, "setDestinationBonjour:", self->_bonjourPeerDevice);
  objc_msgSend(v4, "setDestinationString:", self->_destinationString);
  objc_msgSend(v4, "setDispatchQueue:", self->_dispatchQueue);
  keepAliveSeconds = self->_keepAliveSeconds;
  if (keepAliveSeconds)
    v6 = keepAliveSeconds;
  else
    v6 = 150;
  objc_msgSend(v4, "setKeepAliveIdleSeconds:", v6);
  objc_msgSend(v4, "setKeepAliveIntervalSeconds:", 10);
  objc_msgSend(v4, "setKeepAliveMaxCount:", 3);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("RPCnx");
  objc_msgSend(v4, "setLabel:", label);
  objc_msgSend(v4, "setTrafficFlags:", self->_trafficFlags);
  controlFlags = self->_controlFlags;
  if ((controlFlags & 1) != 0)
    v9 = 57;
  else
    v9 = 41;
  objc_msgSend(v4, "setFlags:", (controlFlags >> 12) & 0x80 | v9);
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__RPConnection__clientConnectStartTCP__block_invoke;
  v14[3] = &unk_1E5F4EC88;
  v14[4] = v4;
  v14[5] = self;
  objc_msgSend(v4, "setErrorHandler:", v14);
  if (self->_flowControlWriteChangedHandler)
  {
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_2;
    v13[3] = &unk_1E5F4ECF8;
    v13[4] = v4;
    v13[5] = self;
    objc_msgSend(v4, "setFlowControlChangedHandler:", v13);
  }
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_3;
  v12[3] = &unk_1E5F4ECF8;
  v12[4] = v4;
  v12[5] = self;
  objc_msgSend(v4, "setInvalidationHandler:", v12);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __38__RPConnection__clientConnectStartTCP__block_invoke_4;
  v11[3] = &unk_1E5F4EC88;
  v11[4] = v4;
  v11[5] = self;
  objc_msgSend(v4, "activateWithCompletion:", v11);

}

_QWORD *__38__RPConnection__clientConnectStartTCP__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[96])
    return (_QWORD *)objc_msgSend(result, "_clientNetworkError:label:", a2, "TCP cnx error");
  return result;
}

void __38__RPConnection__clientConnectStartTCP__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(void);
  void (**v3)(void);

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 768))
  {
    v2 = (void (**)(void))MEMORY[0x1AF45BE48](*(_QWORD *)(v1 + 552));
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __38__RPConnection__clientConnectStartTCP__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 768))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 288);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 40), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    v5 = *(void **)(v1 + 768);
    *(_QWORD *)(v1 + 768) = 0;

    v6 = *(_QWORD *)(v2 + 40);
    v7 = *(void **)(v6 + 248);
    *(_QWORD *)(v6 + 248) = 0;

    result = *(_QWORD *)(v2 + 40);
    if (*(_BYTE *)(result + 72))
      return objc_msgSend((id)result, "_invalidated");
  }
  return result;
}

void __38__RPConnection__clientConnectStartTCP__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3 == *(void **)(v4 + 768))
  {
    objc_storeStrong((id *)(v4 + 248), v3);
    v6 = a2;
    objc_msgSend(*(id *)(a1 + 40), "_clientConnectCompleted:", v6);

  }
}

- (void)_clientConnectCompleted:(id)a3
{
  id v4;
  int var0;
  void *v6;
  OS_dispatch_source *startTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  int v13;
  NSError *v14;
  NSError *stepError;
  int v16;
  id v17;
  _QWORD handler[5];

  v4 = a3;
  if (v4)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v17 = v4;
      LogPrintF();
    }
    if (!self->_stepError)
    {
      RPNestedErrorF();
      v14 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v14;

    }
  }
  else
  {
    -[RPConnection _updateLinkInfo](self, "_updateLinkInfo");
    if (self->_linkType == 4)
    {
      -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") & 0xFFFFFFFFFFEFFFE0);
      -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 8);
    }
    -[RPEndpoint ipAddress](self->_peerDeviceInfo, "ipAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else if (self->_peerAddrString)
    {
      -[RPEndpoint setIpAddress:](self->_peerDeviceInfo, "setIpAddress:");
    }
    startTimer = self->_startTimer;
    if (startTimer)
    {
      v8 = startTimer;
      dispatch_source_cancel(v8);
      v9 = self->_startTimer;
      self->_startTimer = 0;

    }
    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v11 = self->_startTimer;
    self->_startTimer = v10;

    v12 = self->_startTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__RPConnection__clientConnectCompleted___block_invoke;
    handler[3] = &unk_1E5F4EC60;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_startTimer);
    if (!self->_readFrame.readRequested)
    {
      v13 = self->_ucat->var0;
      if (v13 <= 40 && (v13 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrame, self->_requestable);
    }
    if (self->_btPipeHighPriority && !self->_readFrameBTPipeHighPriority.readRequested)
    {
      v16 = self->_ucat->var0;
      if (v16 <= 40 && (v16 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrameBTPipeHighPriority, self->_btPipeHighPriority);
    }
    self->_stepDone = 1;
  }
  -[RPConnection _run](self, "_run", v17);

}

uint64_t __40__RPConnection__clientConnectCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = 0;

  }
  v6 = *(_QWORD **)(a1 + 32);
  if (!v6[17])
  {
    RPErrorF();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 136);
    *(_QWORD *)(v8 + 136) = v7;

    v6 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v6, "_run");
}

- (BOOL)_clientError:(id)a3
{
  id v4;
  int var0;
  OS_dispatch_source *startTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  void *v9;
  uint64_t v10;
  int v11;
  CUBonjourDevice *bonjourPeerDevice;
  uint64_t retryCount;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  id v21;
  uint64_t v22;
  CUBonjourDevice *v23;

  v4 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v21 = v4;
    LogPrintF();
  }
  startTimer = self->_startTimer;
  if (startTimer)
  {
    v7 = startTimer;
    dispatch_source_cancel(v7);
    v8 = self->_startTimer;
    self->_startTimer = 0;

  }
  if (v4)
  {
    -[RPConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v4);
  }
  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v9);

  }
  -[CUBLEConnection invalidate](self->_bleConnection, "invalidate", v21);
  -[CUTCPConnection invalidate](self->_tcpConnection, "invalidate");
  if (self->_btPipe)
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", v4);
  v10 = objc_msgSend(v4, "code");
  if (v10 == -6776)
  {
    v11 = self->_ucat->var0;
    if (v11 > 30 || v11 == -1 && !_LogCategory_Initialize())
      goto LABEL_44;
    goto LABEL_33;
  }
  if ((self->_controlFlags & 0x200) != 0)
  {
    v16 = self->_ucat->var0;
    if (v16 > 30 || v16 == -1 && !_LogCategory_Initialize())
      goto LABEL_44;
LABEL_33:
    LogPrintF();
LABEL_44:
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v4);
    v18 = 0;
    goto LABEL_45;
  }
  bonjourPeerDevice = self->_bonjourPeerDevice;
  if (bonjourPeerDevice)
  {
    retryCount = self->_retryCount;
    if ((int)retryCount >= 10)
    {
      v14 = v10;
      v15 = self->_ucat->var0;
      if (v15 > 30)
        goto LABEL_39;
      if (v15 == -1)
      {
        if (!_LogCategory_Initialize())
        {
LABEL_39:
          if (v14 == -6754
            && (-[RPIdentity type](self->_identityResolved, "type") == 8
             || -[RPIdentity type](self->_identityResolved, "type") == 9))
          {
            v19 = mach_absolute_time();
            -[RPIdentity setDisabledUntilTicks:](self->_identityResolved, "setDisabledUntilTicks:", SecondsToUpTicks() + v19);
          }
          -[CUBonjourDevice reconfirm](self->_bonjourPeerDevice, "reconfirm", v22, v23);
          goto LABEL_44;
        }
        retryCount = self->_retryCount;
        bonjourPeerDevice = self->_bonjourPeerDevice;
      }
      v22 = retryCount;
      v23 = bonjourPeerDevice;
      LogPrintF();
      goto LABEL_39;
    }
  }
  v17 = self->_ucat->var0;
  if (!self->_present)
  {
    if (v17 > 30 || v17 == -1 && !_LogCategory_Initialize())
      goto LABEL_44;
    goto LABEL_33;
  }
  if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v18 = 1;
LABEL_45:

  return v18;
}

- (void)_clientNetworkError:(id)a3 label:(const char *)a4
{
  NSError *v6;
  NSError *stepError;
  const char *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "code") == -6758)
  {
    -[RPConnection sendReachabilityProbe:](self, "sendReachabilityProbe:", "client no ack");
  }
  else
  {
    if (!self->_stepError)
    {
      v8 = a4;
      RPNestedErrorF();
      v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v6;

    }
    -[RPConnection _run](self, "_run", v8);
  }

}

- (void)_clientPreAuthStart
{
  NSError *stepError;
  int var0;
  id v5;
  id v6;
  id v7;

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("602.1"), CFSTR("_sv"));
  var0 = self->_ucat->var0;
  if (var0 <= 30)
  {
    v5 = v7;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_5;
      v5 = v7;
    }
    v6 = v5;
    LogPrintF();
  }
LABEL_5:
  -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 10, v7, v6);

}

- (void)_clientPreAuthResponseWithData:(id)a3
{
  void *v4;
  int v5;
  int var0;
  int v7;
  NSError *stepError;

  v4 = (void *)OPACKDecodeData();
  if (!v4)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_22;
LABEL_12:
    LogPrintF();
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = self->_ucat->var0;
    if (v7 > 90 || v7 == -1 && !_LogCategory_Initialize())
      goto LABEL_22;
    goto LABEL_12;
  }
  v5 = self->_ucat->var0;
  if (self->_internalState != 13)
  {
    if (v5 > 60 || v5 == -1 && !_LogCategory_Initialize())
      goto LABEL_22;
    goto LABEL_12;
  }
  if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepDone = 1;
  -[RPConnection _run](self, "_run");
LABEL_22:

}

- (void)_clientPairSetupStart
{
  NSError *stepError;
  CUPairingSession *v4;
  CUPairingSession *pairSetupSession;
  const __CFString *label;
  int var0;
  id v8;
  const __CFString *password;
  CUPairingSession *v10;
  NSArray *v11;
  id v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  v4 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v4;

  -[CUPairingSession setDispatchQueue:](self->_pairSetupSession, "setDispatchQueue:", self->_dispatchQueue);
  -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", self->_pairSetupFlags);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("RPCnx");
  -[CUPairingSession setLabel:](self->_pairSetupSession, "setLabel:", label);
  -[CUPairingSession setSessionType:](self->_pairSetupSession, "setSessionType:", 1);
  if (-[NSArray count](self->_allowedMACAddresses, "count"))
    -[CUPairingSession setAllowedMACAddresses:](self->_pairSetupSession, "setAllowedMACAddresses:", self->_allowedMACAddresses);
  if ((self->_controlFlags & 0x1000000000) != 0)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E5F6A330, CFSTR("RPIdentityFeatureFlags"));
    -[CUPairingSession setAdditionalPeerInfo:](self->_pairSetupSession, "setAdditionalPeerInfo:", v8);

  }
  if (-[NSString length](self->_password, "length"))
  {
    password = (const __CFString *)self->_password;
    v10 = self->_pairSetupSession;
LABEL_14:
    -[CUPairingSession setFixedPIN:](v10, "setFixedPIN:", password);
    goto LABEL_16;
  }
  if (!self->_passwordType)
  {
    v10 = self->_pairSetupSession;
    password = CFSTR("public");
    goto LABEL_14;
  }
LABEL_16:
  if (self->_passwordType)
    -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
  v11 = self->_pairSetupACL;
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v11;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      v17 = MEMORY[0x1E0C9AAB0];
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18++));
        }
        while (v15 != v18);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:", v12);
  }

  v19 = MEMORY[0x1AF45BE48](self->_promptForPasswordHandler);
  v20 = (void *)v19;
  v21 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __37__RPConnection__clientPairSetupStart__block_invoke;
    v24[3] = &unk_1E5F4F9F8;
    v24[4] = self;
    v24[5] = v19;
    -[CUPairingSession setPromptForPINHandler:](self->_pairSetupSession, "setPromptForPINHandler:", v24);
  }

  if (self->_pairSetupAuthType == 8)
  {
    if ((self->_controlFlags & 0x800000000000) != 0)
      -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFBFFFE3);
    -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairSetupSession);
  }
  v23[0] = v21;
  v23[1] = 3221225472;
  v23[2] = __37__RPConnection__clientPairSetupStart__block_invoke_2;
  v23[3] = &unk_1E5F4FA20;
  v23[4] = self;
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", v23);
  v22[0] = v21;
  v22[1] = 3221225472;
  v22[2] = __37__RPConnection__clientPairSetupStart__block_invoke_3;
  v22[3] = &unk_1E5F4ECD0;
  v22[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", v22);
  -[CUPairingSession activate](self->_pairSetupSession, "activate");
}

uint64_t __37__RPConnection__clientPairSetupStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientPairSetupPromptWithFlags:throttleSeconds:handler:", a2, a3, *(_QWORD *)(a1 + 40));
}

void __37__RPConnection__clientPairSetupStart__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  objc_class *v5;
  id v6;
  _DWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v11 = objc_alloc_init(v5);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("_pd"));

  v7 = *(_DWORD **)(a1 + 32);
  if (v7[48] == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("_auTy"));

    v7 = *(_DWORD **)(a1 + 32);
  }
  if (v7[84])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("_pwTy"));

    v7 = *(_DWORD **)(a1 + 32);
  }
  if ((a2 & 1) != 0)
    v10 = 3;
  else
    v10 = 4;
  objc_msgSend(v7, "_sendFrameType:unencryptedObject:", v10, v11);

}

uint64_t __37__RPConnection__clientPairSetupStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientPairSetupCompleted:", a2);
}

- (void)_clientPairSetupWithData:(id)a3
{
  id v4;
  int var0;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  uint64_t TypedValue;
  const __CFString *v13;
  int v14;
  void *v15;

  v4 = a3;
  if (self->_pairSetupSession)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v15 = (void *)objc_msgSend(v4, "length");
      LogPrintF();
    }
    v6 = (void *)OPACKDecodeData();
    if (!v6)
    {
      v10 = RPErrorF();
      v8 = 0;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (CFDictionaryGetInt64Ranged())
      {
        CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue();
        v13 = &stru_1E5F528E0;
        if (TypedValue)
          v13 = (const __CFString *)TypedValue;
        v15 = (void *)v13;
      }
      else
      {
        CFDataGetTypeID();
        CFDictionaryGetTypedValue();
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v7);
LABEL_11:
          v9 = 0;
          goto LABEL_12;
        }
      }
      RPErrorF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      RPErrorF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  if (v9)
  {
    v14 = self->_ucat->var0;
    if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPConnection _clientPairSetupCompleted:](self, "_clientPairSetupCompleted:", v9, v9);
    }
    else
    {
      -[RPConnection _clientPairSetupCompleted:](self, "_clientPairSetupCompleted:", v9, v15);
    }
  }
  v8 = 0;
LABEL_12:

}

- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4 handler:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  CUPairingSession *pairSetupSession;
  unsigned int v9;
  int v10;
  void (**v11)(id, uint64_t, uint64_t);

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  pairSetupSession = self->_pairSetupSession;
  v11 = (void (**)(id, uint64_t, uint64_t))a5;
  v9 = -[CUPairingSession pinTypeActual](pairSetupSession, "pinTypeActual") - 1;
  if (v9 > 7)
    v10 = 0;
  else
    v10 = dword_1AF307438[v9];
  self->_passwordTypeActual = v10;
  v11[2](v11, v6, v5);

}

- (void)_clientPairSetupCompleted:(id)a3
{
  id v4;
  void *v5;
  CUPairingSession *pairSetupSession;
  CUPairingStream *v7;
  id v8;
  CUPairingStream *mainStream;
  CUPairingStream *v10;
  CUPairingSession *v11;
  CUPairingStream *v12;
  id v13;
  CUPairingStream *highPriorityStream;
  CUPairingStream *v15;
  unsigned int v16;
  int var0;
  int v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    pairSetupSession = self->_pairSetupSession;
    v23 = 0;
    -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", CFSTR("main"), &v23);
    v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    mainStream = self->_mainStream;
    self->_mainStream = v7;

    v10 = self->_mainStream;
    if (!v10)
    {
      v13 = v8;
      if (!v8)
        goto LABEL_23;
      goto LABEL_16;
    }
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](v10, "authTagLength");
    if (self->_btPipeHighPriority)
    {
      v11 = self->_pairSetupSession;
      v22 = v8;
      -[CUPairingSession openStreamWithName:error:](v11, "openStreamWithName:error:", CFSTR("hipri"), &v22);
      v12 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v13 = v22;

      highPriorityStream = self->_highPriorityStream;
      self->_highPriorityStream = v12;

      v15 = self->_highPriorityStream;
      if (!v15)
        goto LABEL_15;
      self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v15, "authTagLength");
    }
    else
    {
      v13 = v8;
    }
    self->_statusFlags &= 0xFFFFFFEFFFF51FFFLL;
    if ((-[CUPairingSession flags](self->_pairSetupSession, "flags") & 0x10) != 0)
    {
      v16 = self->_flags | 1;
    }
    else
    {
      self->_statusFlags |= 0x8000uLL;
      v16 = self->_flags & 0xFFFFFFFE;
    }
    self->_flags = v16;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_stepDone = 1;
LABEL_15:
    if (!v13)
      goto LABEL_23;
    goto LABEL_16;
  }
  v13 = v4;
LABEL_16:
  v18 = self->_ucat->var0;
  if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
  {
    v21 = v13;
    LogPrintF();
  }
  if (!self->_stepError)
    objc_storeStrong((id *)&self->_stepError, v13);
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v21);
LABEL_23:
  v19 = MEMORY[0x1AF45BE48](self->_authCompletionHandler);
  v20 = (void *)v19;
  if (v19)
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v13);

  -[RPConnection _run](self, "_run");
}

- (void)_clientPairVerifyStart
{
  NSError *stepError;
  CUPairingSession *v4;
  CUPairingSession *pairVerifySession;
  const __CFString *label;
  unint64_t controlFlags;
  void *v8;
  void *v9;
  uint64_t passwordType;
  int preferredIdentityType;
  uint64_t v12;
  unsigned int pairVerifyAuthType;
  CUPairingSession *v14;
  uint64_t v15;
  int var0;
  int v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  void *v22;
  uint64_t flags;
  void *v24;
  const char *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, char, void *);
  void *v32;
  RPConnection *v33;
  unsigned int v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
  self->_pairVerifyCompleted = 0;
  self->_pairVerifyUsedIdentity = 0;
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  v4 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = v4;

  -[CUPairingSession setDispatchQueue:](self->_pairVerifySession, "setDispatchQueue:", self->_dispatchQueue);
  -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", self->_pairVerifyFlags);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("RPCnx");
  -[CUPairingSession setLabel:](self->_pairVerifySession, "setLabel:", label);
  -[CUPairingSession setSessionType:](self->_pairVerifySession, "setSessionType:", 3);
  controlFlags = self->_controlFlags;
  if ((controlFlags & 0x20000000) != 0)
  {
    v35 = CFSTR("_cf");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", controlFlags & 0x20000000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setAppInfoSelf:](self->_pairVerifySession, "setAppInfoSelf:", v9);

    controlFlags = self->_controlFlags;
  }
  self->_pairVerifyAuthType = 0;
  passwordType = self->_passwordType;
  preferredIdentityType = self->_preferredIdentityType;
  v12 = MEMORY[0x1E0C809B0];
  if (preferredIdentityType == 2)
  {
    if ((controlFlags & 0xC00000000000) != 0)
    {
LABEL_8:
      self->_pairVerifyAuthType = 8;
      self->_pairSetupAuthType = 8;
      -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFE3);
LABEL_9:
      -[CUPairingSession setSelfAppFlags:](self->_pairVerifySession, "setSelfAppFlags:", 1);
      goto LABEL_32;
    }
  }
  else
  {
    if ((controlFlags & 0x8000000) != 0)
    {
      pairVerifyAuthType = 2;
      self->_pairVerifyAuthType = 2;
      goto LABEL_37;
    }
    switch(preferredIdentityType)
    {
      case 13:
        goto LABEL_8;
      case 9:
        self->_pairVerifyAuthType = 3;
        -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
        v14 = self->_pairVerifySession;
        v15 = -[CUPairingSession flags](v14, "flags") | 0x4000000;
        goto LABEL_31;
      case 8:
        goto LABEL_29;
    }
    if ((controlFlags & 0xC00000000000) != 0)
      goto LABEL_8;
    if (preferredIdentityType == 15 && self->_configurePairingHandler)
    {
      self->_pairVerifyAuthType = 9;
      -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
      -[CUPairingSession setSelfAppFlags:](self->_pairVerifySession, "setSelfAppFlags:", 1);
      (*((void (**)(void))self->_configurePairingHandler + 2))();
      goto LABEL_32;
    }
  }
  if (((controlFlags & 0x400) != 0 || (self->_flags & 1) != 0 || (controlFlags & 0x8000000000) != 0)
    && (_DWORD)passwordType)
  {
    if ((_DWORD)passwordType == 4)
    {
      self->_pairVerifyAuthType = 7;
      -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
      v14 = self->_pairVerifySession;
      v15 = -[CUPairingSession flags](v14, "flags") | 0x1000;
LABEL_31:
      -[CUPairingSession setFlags:](v14, "setFlags:", v15);
      goto LABEL_32;
    }
    if ((passwordType - 1) > 1)
      goto LABEL_32;
LABEL_29:
    self->_pairVerifyAuthType = 4;
    -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
    v14 = self->_pairVerifySession;
    v15 = -[CUPairingSession flags](v14, "flags") | 0xC;
    goto LABEL_31;
  }
  if ((controlFlags & 0x40) != 0 || !self->_pairVerifyFailed)
    goto LABEL_9;
LABEL_32:
  pairVerifyAuthType = self->_pairVerifyAuthType;
  if (pairVerifyAuthType == 8)
  {
    -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairVerifySession);
    if (GestaltGetDeviceClass() == 4)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v20 = "SessionPaired";
        v21 = "RPIdentity";
        LogPrintF();
      }
      pairVerifyAuthType = 1;
    }
    else
    {
      pairVerifyAuthType = 8;
    }
    v29 = v12;
    v30 = 3221225472;
    v31 = __38__RPConnection__clientPairVerifyStart__block_invoke;
    v32 = &unk_1E5F4FA48;
    v34 = pairVerifyAuthType;
    v33 = self;
    -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", &v29, v20, v21);
    goto LABEL_44;
  }
LABEL_37:
  GestaltGetDeviceClass();
  v29 = v12;
  v30 = 3221225472;
  v31 = __38__RPConnection__clientPairVerifyStart__block_invoke;
  v32 = &unk_1E5F4FA48;
  v34 = pairVerifyAuthType;
  v33 = self;
  -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", &v29);
  if (pairVerifyAuthType > 7 || ((1 << pairVerifyAuthType) & 0x98) == 0)
  {
LABEL_44:
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_2;
    v28[3] = &unk_1E5F4FA70;
    v28[4] = self;
    -[CUPairingSession setSignDataHandler:](self->_pairVerifySession, "setSignDataHandler:", v28);
    v27[0] = v12;
    v27[1] = 3221225472;
    v27[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_3;
    v27[3] = &unk_1E5F4FA98;
    v27[4] = self;
    -[CUPairingSession setVerifySignatureHandler:](self->_pairVerifySession, "setVerifySignatureHandler:", v27);
  }
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_4;
  v26[3] = &unk_1E5F4ECD0;
  v26[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", v26);
  v17 = self->_ucat->var0;
  if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
  {
    if (pairVerifyAuthType > 0xA)
      v18 = "?";
    else
      v18 = off_1E5F50000[pairVerifyAuthType];
    if (passwordType > 0xB)
      v19 = "?";
    else
      v19 = off_1E5F4FFA0[passwordType];
    v24 = &unk_1AF30738F;
    v25 = v19;
    v22 = &unk_1AF306F27;
    flags = self->_flags;
    v20 = v18;
    v21 = (const char *)self->_controlFlags;
    LogPrintF();
  }
  -[CUPairingSession activate](self->_pairVerifySession, "activate", v20, v21, v22, flags, v24, v25);
}

void __38__RPConnection__clientPairVerifyStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((a2 & 1) != 0)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("_auTy"));

    }
    v6 = 5;
  }
  else
  {
    v6 = 6;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("_pd"));
  objc_msgSend(*(id *)(a1 + 32), "_sendFrameType:unencryptedObject:", v6, v5);

}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifySignData:flags:error:", a3, a2, a4);
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifyVerifySignature:data:flags:error:", a4, a3, a2, a5);
}

uint64_t __38__RPConnection__clientPairVerifyStart__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientPairVerifyCompleted:", a2);
}

- (void)_clientPairVerifyWithData:(id)a3
{
  id v4;
  int var0;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  int v12;
  void *v13;

  v4 = a3;
  if (self->_pairVerifySession)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v13 = (void *)objc_msgSend(v4, "length");
      LogPrintF();
    }
    v6 = (void *)OPACKDecodeData();
    if (!v6)
    {
      v10 = RPErrorF();
      v8 = 0;
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CFDataGetTypeID();
      CFDictionaryGetTypedValue();
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v7);
LABEL_10:
        v9 = 0;
        goto LABEL_11;
      }
      RPErrorF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      RPErrorF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  if (v9)
  {
    v12 = self->_ucat->var0;
    if (v12 <= 60 && (v12 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPConnection _clientPairVerifyCompleted:](self, "_clientPairVerifyCompleted:", v9, v9);
    }
    else
    {
      -[RPConnection _clientPairVerifyCompleted:](self, "_clientPairVerifyCompleted:", v9, v13);
    }
  }
  v8 = 0;
LABEL_11:

}

- (void)_clientPairVerifyCompleted:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int Int64;
  CUPairingSession *v9;
  CUPairingStream *v10;
  id v11;
  CUPairingStream *v12;
  CUPairingSession *v13;
  CUPairingStream *v14;
  void *v15;
  CUPairingSession *pairVerifySession;
  CUPairingStream *v17;
  CUPairingStream *mainStream;
  CUPairingSession *v19;
  id v20;
  CUPairingStream *highPriorityStream;
  CUPairingStream *v22;
  CUPairingStream *v23;
  unint64_t v24;
  int pairVerifyAuthType;
  const char *v26;
  _BOOL4 pairVerifyUsedIdentity;
  const char *v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSString *v36;
  NSString *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  NSString *v45;
  NSString *peerHomeKitUserIdentifier;
  void *v47;
  RPIdentity *v48;
  void *v49;
  void *v50;
  void *v51;
  RPIdentity *identityVerified;
  RPIdentity *v53;
  void *v54;
  int var0;
  uint64_t v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t flags;
  void *v63;
  unint64_t statusFlags;
  void *v65;
  RPIdentity *v66;
  id v67;
  id v68;
  id v69;
  id v70;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if ((self->_controlFlags & 0x20000000) != 0
      && (-[CUPairingSession appInfoPeer](self->_pairVerifySession, "appInfoPeer"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          Int64 = CFDictionaryGetInt64(),
          v7,
          (Int64 & 0x20000000) != 0))
    {
      pairVerifySession = self->_pairVerifySession;
      v70 = 0;
      -[CUPairingSession openStreamWithName:type:error:](pairVerifySession, "openStreamWithName:type:error:", CFSTR("main"), 2, &v70);
      v17 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v11 = v70;
      mainStream = self->_mainStream;
      self->_mainStream = v17;

      if (!self->_btPipeHighPriority)
        goto LABEL_10;
      v19 = self->_pairVerifySession;
      v69 = v11;
      -[CUPairingSession openStreamWithName:type:error:](v19, "openStreamWithName:type:error:", CFSTR("hipri"), 2, &v69);
      v14 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v15 = v69;
    }
    else
    {
      v9 = self->_pairVerifySession;
      v68 = 0;
      -[CUPairingSession openStreamWithName:error:](v9, "openStreamWithName:error:", CFSTR("main"), &v68);
      v10 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v11 = v68;
      v12 = self->_mainStream;
      self->_mainStream = v10;

      if (!self->_btPipeHighPriority)
        goto LABEL_10;
      v13 = self->_pairVerifySession;
      v67 = v11;
      -[CUPairingSession openStreamWithName:error:](v13, "openStreamWithName:error:", CFSTR("hipri"), &v67);
      v14 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v15 = v67;
    }
    v20 = v15;

    highPriorityStream = self->_highPriorityStream;
    self->_highPriorityStream = v14;

    v22 = self->_highPriorityStream;
    v11 = v20;
    if (!v22)
      goto LABEL_52;
    self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v22, "authTagLength");
    v11 = v20;
LABEL_10:
    v23 = self->_mainStream;
    if (v23)
    {
      self->_mainAuthTagLength = -[CUPairingStream authTagLength](v23, "authTagLength");
      self->_pairVerifyCompleted = 1;
      -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") & 0xFFFFFF8FFFF50FFFLL);
      v24 = self->_statusFlags & 0xFFFFFF8FFFF50FFFLL;
      self->_statusFlags = v24;
      pairVerifyAuthType = self->_pairVerifyAuthType;
      v26 = "PSAuth";
      switch(pairVerifyAuthType)
      {
        case 0:
        case 1:
        case 2:
        case 8:
        case 9:
          switch(self->_pairVerifyIdentityType)
          {
            case 0:
            case 2:
              self->_flags &= ~1u;
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x80000);
              v24 = self->_statusFlags | 0x80000;
              self->_statusFlags = v24;
              pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              v28 = "(RPI-Owner)";
              goto LABEL_22;
            case 4:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000);
              v39 = self->_statusFlags | 0x4000;
              self->_statusFlags = v39;
              v26 = "(RPI-Family)";
              if ((v39 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 6:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x20000);
              v40 = self->_statusFlags | 0x20000;
              self->_statusFlags = v40;
              v26 = "(RPI-Friend)";
              if ((v40 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 0xC:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x1000000000);
              v41 = self->_statusFlags | 0x1000000000;
              self->_statusFlags = v41;
              v26 = "(RPI-SharedTVUser)";
              if ((v41 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 0xD:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000000000);
              v42 = self->_statusFlags | 0x2000000000;
              self->_statusFlags = v42;
              v26 = "(RPI-SessionPaired)";
              if ((v42 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 0xF:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000000000);
              v43 = self->_statusFlags | 0x4000000000;
              self->_statusFlags = v43;
              v26 = "(RPI-AdHocPaired)";
              if ((v43 & 0x80000) != 0)
                goto LABEL_36;
              goto LABEL_39;
            default:
              pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              v28 = "(RPI-?)";
LABEL_22:
              if (pairVerifyUsedIdentity)
                v26 = v28;
              else
                v26 = "(HK)";
              if ((v24 & 0x80000) == 0)
                goto LABEL_39;
LABEL_36:
              -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "identifier");
              v45 = (NSString *)objc_claimAutoreleasedReturnValue();
              peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
              self->_peerHomeKitUserIdentifier = v45;

              break;
          }
          goto LABEL_39;
        case 3:
          -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000);
          self->_statusFlags |= 0x2000uLL;
          -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "UUIDString");
          v31 = (NSString *)objc_claimAutoreleasedReturnValue();
          v32 = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v31;

          v26 = "HKShared";
          goto LABEL_39;
        case 4:
          -[CUPairingSession aclActual](self->_pairVerifySession, "aclActual");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = CFDictionaryGetInt64();

          if (v34)
          {
            -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "identifier");
            v36 = (NSString *)objc_claimAutoreleasedReturnValue();
            v37 = self->_peerHomeKitUserIdentifier;
            self->_peerHomeKitUserIdentifier = v36;

            v38 = 557056;
          }
          else
          {
            v38 = 0x8000;
          }
          -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | v38);
          self->_statusFlags |= v38;
          v26 = "CUPair";
LABEL_39:
          if ((pairVerifyAuthType - 3) <= 1 && !self->_identityVerified)
          {
            -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              v48 = objc_alloc_init(RPIdentity);
              objc_msgSend(v47, "publicKey");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setEdPKData:](v48, "setEdPKData:", v49);

              objc_msgSend(v47, "identifier");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "UUIDString");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setIdentifier:](v48, "setIdentifier:", v51);

              -[RPIdentity setType:](v48, "setType:", 8);
              identityVerified = self->_identityVerified;
              self->_identityVerified = v48;
              v53 = v48;

              -[RPIdentity identifier](self->_identityVerified, "identifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPEndpoint setVerifiedIdentity:](self->_peerDeviceInfo, "setVerifiedIdentity:", v54);

            }
          }
          break;
        case 5:
          break;
        case 6:
          v26 = "PSGuest";
          break;
        case 7:
          -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x20000);
          self->_statusFlags |= 0x20000uLL;
          v26 = "PV-AID";
          break;
        case 10:
          v26 = "AuthEnd";
          break;
        default:
          v26 = "?";
          break;
      }
      self->_stepDone = 1;
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v65 = &unk_1AF3071C2;
        v66 = self->_identityVerified;
        v63 = &unk_1AF30738F;
        statusFlags = self->_statusFlags;
        v61 = v26;
        flags = self->_flags;
        LogPrintF();
      }
      v56 = MEMORY[0x1AF45BE48](self->_authCompletionHandler);
      v57 = (void *)v56;
      if (v56 && pairVerifyAuthType)
        (*(void (**)(uint64_t, _QWORD))(v56 + 16))(v56, 0);

    }
LABEL_52:
    self->_pairVerifyFailed = v11 != 0;
    if (!v11)
      goto LABEL_60;
    goto LABEL_53;
  }
  v11 = v5;
  self->_pairVerifyFailed = 1;
LABEL_53:
  v58 = self->_ucat->var0;
  if (v58 <= 60 && (v58 != -1 || _LogCategory_Initialize()))
  {
    v61 = (const char *)v11;
    LogPrintF();
  }
  if (!self->_stepError)
    objc_storeStrong((id *)&self->_stepError, a3);
  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v61, flags, v63, statusFlags, v65, v66);
LABEL_60:
  v59 = MEMORY[0x1AF45BE48](self->_pairVerifyCompletion);
  v60 = (void *)v59;
  if (v59)
    (*(void (**)(uint64_t, id))(v59 + 16))(v59, v11);

  -[RPConnection _run](self, "_run");
}

- (void)_clientStartSession
{
  NSError *stepError;
  void *v4;
  int var0;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  -[RPConnection _systeminfo](self, "_systeminfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v9 = v4;
    LogPrintF();
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__RPConnection__clientStartSession__block_invoke;
  v10[3] = &unk_1E5F4FAC0;
  v10[4] = self;
  -[RPConnection _sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:](self, "_sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:", CFSTR("_systemInfo"), v4, 0, 0, 0, v10, v9);
  v6 = self->_statusFlags & 0x10000AE000;
  v7 = MEMORY[0x1AF45BE48](self->_proxyDeviceUpdateHandler);
  v8 = (void *)v7;
  if (v6 && v7)
    (*(void (**)(uint64_t))(v7 + 16))(v7);

}

void __35__RPConnection__clientStartSession__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  char v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v11)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "_receivedSystemInfo:xid:", v11, 0);
    if (!v8 && (v9 & 1) == 0)
    {
      RPErrorF();
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v8)
  {
    RPNestedErrorF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), v10);
  if (v8)

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_run");

}

- (void)_clientRetryStart
{
  OS_dispatch_source *retryTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v10;
  int var0;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  _QWORD handler[5];

  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v4 = retryTimer;
    dispatch_source_cancel(v4);
    v5 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  v6 = mach_absolute_time();
  if (self->_retryTicks)
  {
    UpTicksToSecondsF();
    v8 = v7;
  }
  else
  {
    v8 = -1.0;
  }
  self->_retryTicks = v6;
  if (v8 >= 10.0 || v8 < 0.0)
    v10 = 0.0;
  else
    v10 = 10.0 - v8;
  var0 = self->_ucat->var0;
  if (v10 <= 0.0)
  {
    if (v8 < 0.0)
    {
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
        goto LABEL_28;
    }
    else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_28;
    }
    LogPrintF();
LABEL_28:
    self->_retryFired = 1;
    return;
  }
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_retryFired = 0;
  v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v13 = self->_retryTimer;
  self->_retryTimer = v12;

  v14 = self->_retryTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __33__RPConnection__clientRetryStart__block_invoke;
  handler[3] = &unk_1E5F4EC60;
  handler[4] = self;
  dispatch_source_set_event_handler(v14, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_retryTimer);
}

uint64_t __33__RPConnection__clientRetryStart__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = mach_absolute_time();
  return objc_msgSend(*(id *)(a1 + 32), "_clientRetryFired");
}

- (void)_clientRetryFired
{
  OS_dispatch_source *retryTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  int var0;
  id v7;

  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v4 = retryTimer;
    dispatch_source_cancel(v4);
    v5 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  if (self->_present)
  {
    self->_retryFired = 1;
    -[RPConnection _run](self, "_run");
  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    RPErrorF();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v7);

  }
}

- (void)_clientStarted
{
  OS_dispatch_source *startTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  startTimer = self->_startTimer;
  if (startTimer)
  {
    v4 = startTimer;
    dispatch_source_cancel(v4);
    v5 = self->_startTimer;
    self->_startTimer = 0;

  }
  self->_retryCount = 0;
}

- (void)_serverRun
{
  unsigned int internalState;
  int v4;
  unsigned int v5;
  int var0;
  const char *v7;
  const char *v8;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      internalState = self->_internalState;
      switch(internalState)
      {
        case 0x19u:
          self->_internalState = 26;
          -[RPConnection _serverAccept](self, "_serverAccept");
          if (self->_pskData)
          {
            -[RPConnection _pskPrepare:](self, "_pskPrepare:", 0);
            -[RPConnection _serverStarted](self, "_serverStarted");
            v4 = 28;
            goto LABEL_14;
          }
          break;
        case 0x1Au:
          if (self->_stepError)
            goto LABEL_16;
          if (self->_stepDone)
          {
            self->_stepDone = 0;
            v4 = 27;
            goto LABEL_14;
          }
          break;
        case 0x1Bu:
          if (self->_stepError)
            goto LABEL_16;
          if (self->_stepDone)
          {
            self->_stepDone = 0;
            -[RPConnection _serverStarted](self, "_serverStarted");
            v4 = self->_internalState + 1;
LABEL_14:
            self->_internalState = v4;
          }
          break;
        case 0x1Cu:
          if (self->_stepError)
LABEL_16:
            self->_internalState = 29;
          else
            -[RPConnection _processSends](self, "_processSends");
          break;
        case 0x1Du:
          goto LABEL_7;
        default:
          if (!internalState)
LABEL_7:
            self->_internalState = 25;
          break;
      }
      v5 = self->_internalState;
      if (v5 == internalState)
        return;
      var0 = self->_ucat->var0;
      if (var0 <= 30)
      {
        if (var0 != -1)
          goto LABEL_20;
        if (_LogCategory_Initialize())
          break;
      }
LABEL_22:
      -[RPConnection _updateExternalState](self, "_updateExternalState", v7, v8);
    }
    v5 = self->_internalState;
LABEL_20:
    v7 = _StateToString(internalState);
    v8 = _StateToString(v5);
    LogPrintF();
    goto LABEL_22;
  }
}

- (void)_serverAccept
{
  OS_dispatch_source *startTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  NSError *stepError;
  _QWORD handler[5];

  startTimer = self->_startTimer;
  if (startTimer)
  {
    v4 = startTimer;
    dispatch_source_cancel(v4);
    v5 = self->_startTimer;
    self->_startTimer = 0;

  }
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v7 = self->_startTimer;
  self->_startTimer = v6;

  v8 = self->_startTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __29__RPConnection__serverAccept__block_invoke;
  handler[3] = &unk_1E5F4EC60;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_startTimer);
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
  self->_pairVerifyCompleted = 0;
  self->_pairVerifyUsedIdentity = 0;
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  -[RPConnection _updateLinkInfo](self, "_updateLinkInfo");
  if (self->_bleConnection)
  {
    -[RPConnection _serverAcceptBLE](self, "_serverAcceptBLE");
  }
  else if (self->_btPipe)
  {
    -[RPConnection _serverAcceptBTPipe](self, "_serverAcceptBTPipe");
  }
  else
  {
    -[RPConnection _serverAcceptTCP](self, "_serverAcceptTCP");
  }
}

void __29__RPConnection__serverAccept__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = 0;

  }
  v6 = *(void **)(a1 + 32);
  RPErrorF();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_serverError:", v7);

}

- (void)_serverAcceptBLE
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__RPConnection__serverAcceptBLE__block_invoke;
  v5[3] = &unk_1E5F4ECD0;
  v5[4] = self;
  -[CUBLEConnection setErrorHandler:](self->_bleConnection, "setErrorHandler:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __32__RPConnection__serverAcceptBLE__block_invoke_2;
  v4[3] = &unk_1E5F4EC60;
  v4[4] = self;
  -[CUBLEConnection setInvalidationHandler:](self->_bleConnection, "setInvalidationHandler:", v4);
  -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrame, self->_requestable);
}

uint64_t __32__RPConnection__serverAcceptBLE__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverNetworkError:label:", a2, "BLE cnx error");
}

uint64_t __32__RPConnection__serverAcceptBLE__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 288);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = *(void **)(v2 + 464);
  *(_QWORD *)(v2 + 464) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_serverAcceptBTPipe
{
  int var0;
  int v4;

  if (!self->_readFrame.readRequested)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrame, self->_requestable);
  }
  if (!self->_readFrameBTPipeHighPriority.readRequested)
  {
    v4 = self->_ucat->var0;
    if (v4 <= 40 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrameBTPipeHighPriority, self->_btPipeHighPriority);
  }
}

- (void)_serverAcceptTCP
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__RPConnection__serverAcceptTCP__block_invoke;
  v6[3] = &unk_1E5F4ECD0;
  v6[4] = self;
  -[CUTCPConnection setErrorHandler:](self->_tcpConnection, "setErrorHandler:", v6);
  if (self->_flowControlWriteChangedHandler)
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __32__RPConnection__serverAcceptTCP__block_invoke_2;
    v5[3] = &unk_1E5F4EC60;
    v5[4] = self;
    -[CUTCPConnection setFlowControlChangedHandler:](self->_tcpConnection, "setFlowControlChangedHandler:", v5);
  }
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __32__RPConnection__serverAcceptTCP__block_invoke_3;
  v4[3] = &unk_1E5F4EC60;
  v4[4] = self;
  -[CUTCPConnection setInvalidationHandler:](self->_tcpConnection, "setInvalidationHandler:", v4);
  -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", 0, &self->_readFrame, self->_requestable);
}

uint64_t __32__RPConnection__serverAcceptTCP__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverNetworkError:label:", a2, "TCP cnx error");
}

void __32__RPConnection__serverAcceptTCP__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(void);
  void (**v3)(void);

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 768))
  {
    v2 = (void (**)(void))MEMORY[0x1AF45BE48](*(_QWORD *)(v1 + 552));
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

uint64_t __32__RPConnection__serverAcceptTCP__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 288);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = *(void **)(v2 + 768);
  *(_QWORD *)(v2 + 768) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_serverError:(id)a3
{
  id v5;
  int var0;
  int v7;
  id v8;
  id v9;

  v5 = a3;
  var0 = self->_ucat->var0;
  v9 = v5;
  if (var0 <= 60)
  {
    if (var0 != -1 || (v7 = _LogCategory_Initialize(), v5 = v9, v7))
    {
      v8 = v5;
      LogPrintF();
      v5 = v9;
    }
  }
  if (self->_btPipe)
  {
    -[RPConnection _invalidateCore:](self, "_invalidateCore:", v5);
    if (!self->_stepError)
      objc_storeStrong((id *)&self->_stepError, a3);
    -[RPConnection _run](self, "_run", v8);
  }
  else
  {
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v5);
  }

}

- (void)_serverNetworkError:(id)a3 label:(const char *)a4
{
  void *v6;
  const char *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "code") == -6758)
  {
    -[RPConnection sendReachabilityProbe:](self, "sendReachabilityProbe:", "server no ack");
  }
  else
  {
    v7 = a4;
    RPNestedErrorF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _serverError:](self, "_serverError:", v6, v7);

  }
}

- (void)_serverPreAuthRequestWithData:(id)a3
{
  void *v4;
  char isKindOfClass;
  int v6;
  int var0;
  id v8;
  int v9;
  id v10;

  v4 = (void *)OPACKDecodeData();
  if (!v4)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_22;
LABEL_11:
    LogPrintF();
    goto LABEL_22;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = self->_ucat->var0;
  if ((isKindOfClass & 1) == 0)
  {
    if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
      goto LABEL_22;
    goto LABEL_11;
  }
  if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
  {
    v10 = v4;
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("602.1"), CFSTR("_sv"));
  v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
  {
    v10 = v8;
    LogPrintF();
  }
  -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 11, v8, v10);

LABEL_22:
}

- (BOOL)_serverPairingAllowed
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend((Class)getMCProfileConnectionClass[0](), "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getMCFeatureRemoteAppPairingAllowed[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "effectiveBoolValueForSetting:", v3);

  return v4 != 2;
}

- (void)_serverPairSetupWithData:(id)a3 start:(BOOL)a4
{
  void *v6;
  int passwordType;
  int var0;
  int v9;
  unsigned int Int64Ranged;
  unsigned int v11;
  CUPairingSession *v12;
  CUPairingSession *pairSetupSession;
  const __CFString *label;
  unsigned int v15;
  int DeviceClass;
  int v17;
  int v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  int v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  int v27;
  CUPairingSession *v28;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  CUPairingSession *v32;
  uint64_t v33;
  NSArray *v34;
  id v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void (**configurePairingHandler)(id, CUPairingSession *);
  uint64_t v44;
  void *v45;
  id v46;
  objc_class *v47;
  int v48;
  const char *v49;
  void *v50;
  const char *v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  _BYTE v61[128];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  v60 = 0;
  v6 = (void *)OPACKDecodeData();
  if (!v6)
  {
    v46 = RPErrorF();
    goto LABEL_93;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    RPErrorF();
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_98;
  }
  passwordType = self->_passwordType;
  if (!passwordType)
  {
    if ((-[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags") & 8) != 0)
      goto LABEL_7;
    passwordType = self->_passwordType;
  }
  if (passwordType != 3)
  {
    if ((self->_flags & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_7:
  if ((self->_flags & 0x4000) == 0)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v64[0] = CFSTR("_ec");
    v64[1] = CFSTR("_em");
    v65[0] = &unk_1E5F6A348;
    v65[1] = CFSTR("Non-home access not allowed");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v65;
    v21 = v64;
LABEL_37:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 4, v22);
LABEL_92:

LABEL_93:
    v45 = 0;
    goto LABEL_94;
  }
LABEL_12:
  v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_16:
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v11 = Int64Ranged;
  if (Int64Ranged <= 0xA
    && ((1 << Int64Ranged) & 0x426) != 0
    && !-[RPConnection _serverPairingAllowed](self, "_serverPairingAllowed"))
  {
    v18 = self->_ucat->var0;
    if (v18 <= 50 && (v18 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v62[0] = CFSTR("_ec");
    v62[1] = CFSTR("_em");
    v63[0] = &unk_1E5F6A348;
    v63[1] = CFSTR("Pairing not allowed");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = v63;
    v21 = v62;
    goto LABEL_37;
  }
  if (!a4 && self->_pairSetupSession)
    goto LABEL_88;
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  v12 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v12;

  -[CUPairingSession setDispatchQueue:](self->_pairSetupSession, "setDispatchQueue:", self->_dispatchQueue);
  -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", self->_pairSetupFlags);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("RPCnx");
  -[CUPairingSession setLabel:](self->_pairSetupSession, "setLabel:", label);
  -[CUPairingSession setSessionType:](self->_pairSetupSession, "setSessionType:", 2);
  v15 = CFDictionaryGetInt64Ranged();
  DeviceClass = GestaltGetDeviceClass();
  if (v11 == 10 && DeviceClass == 4 && !v15)
  {
    v17 = self->_ucat->var0;
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
    {
      v49 = "Invalid";
      v51 = "SessionPaired";
      LogPrintF();
    }
    v15 = 8;
  }
  v23 = self->_ucat->var0;
  if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
  {
    if (v11 > 0xB)
      v24 = "?";
    else
      v24 = off_1E5F4FFA0[v11];
    if (v15 > 0xA)
      v25 = "?";
    else
      v25 = off_1E5F50000[v15];
    v49 = v24;
    v51 = v25;
    LogPrintF();
  }
  if (v15 == 8)
  {
    self->_pairSetupAuthType = 8;
    self->_pairVerifyAuthType = 8;
    if (v11 == 1)
      v26 = 1;
    else
      v26 = 8;
    -[CUPairingSession setPinType:](self->_pairSetupSession, "setPinType:", v26, v49, v51);
    -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFBFFFE3);
    -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairSetupSession);
  }
  v27 = self->_passwordType;
  if (v27 == 2)
  {
    self->_pairSetupAuthType = 5;
    v28 = self->_pairSetupSession;
    v29 = 2;
    goto LABEL_60;
  }
  if (v27 != 1)
  {
    v30 = self->_password;
    if (!-[NSString length](v30, "length"))
    {
      -[RPCompanionLinkDevice password](self->_localDeviceInfo, "password");
      v31 = objc_claimAutoreleasedReturnValue();

      v30 = (NSString *)v31;
    }
    if (-[NSString length](v30, "length", v49))
    {
      self->_pairSetupAuthType = 5;
      -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", v30);
      -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
      -[CUPairingSession setPinType:](self->_pairSetupSession, "setPinType:", 5);
LABEL_72:

      goto LABEL_73;
    }
    switch(v11)
    {
      case 1u:
        self->_pairSetupAuthType = 5;
        v32 = self->_pairSetupSession;
        v33 = 1;
        break;
      case 0xAu:
        goto LABEL_72;
      case 2u:
        self->_pairSetupAuthType = 5;
        v32 = self->_pairSetupSession;
        v33 = 2;
        break;
      default:
        self->_pairSetupAuthType = 6;
        -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", CFSTR("public"));
        goto LABEL_72;
    }
    -[CUPairingSession setPinType:](v32, "setPinType:", v33);
    -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
    goto LABEL_72;
  }
  self->_pairSetupAuthType = 5;
  v28 = self->_pairSetupSession;
  v29 = 1;
LABEL_60:
  -[CUPairingSession setPinType:](v28, "setPinType:", v29, v49);
  -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
LABEL_73:
  v34 = self->_pairSetupACL;
  if (v34)
  {
    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v36 = v34;
    v37 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v57;
      v40 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v57 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
        }
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v38);
    }

    -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:", v35);
  }

  v42 = MEMORY[0x1E0C809B0];
  if (self->_showPasswordHandler)
  {
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke;
    v55[3] = &unk_1E5F4FAE8;
    v55[4] = self;
    -[CUPairingSession setShowPINHandlerEx:](self->_pairSetupSession, "setShowPINHandlerEx:", v55);
  }
  else
  {
    -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", -[CUPairingSession flags](self->_pairSetupSession, "flags") | 0x80);
  }
  if (self->_hidePasswordHandler)
  {
    v54[0] = v42;
    v54[1] = 3221225472;
    v54[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_2;
    v54[3] = &unk_1E5F4EC60;
    v54[4] = self;
    -[CUPairingSession setHidePINHandler:](self->_pairSetupSession, "setHidePINHandler:", v54);
  }
  v53[0] = v42;
  v53[1] = 3221225472;
  v53[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_3;
  v53[3] = &unk_1E5F4FA20;
  v53[4] = self;
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", v53);
  v52[0] = v42;
  v52[1] = 3221225472;
  v52[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_4;
  v52[3] = &unk_1E5F4ECD0;
  v52[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", v52);
  -[CUPairingSession activate](self->_pairSetupSession, "activate");
LABEL_88:
  configurePairingHandler = (void (**)(id, CUPairingSession *))self->_configurePairingHandler;
  if (configurePairingHandler)
    configurePairingHandler[2](configurePairingHandler, self->_pairSetupSession);
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v22 = (void *)v44;
    -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v44);
    goto LABEL_92;
  }
  RPErrorF();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_98:
  if (v45)
  {
    v48 = self->_ucat->var0;
    if (v48 <= 60 && (v48 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_94:

}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 400));
  v6 = (void *)v5;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 280) = 1;
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }

}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  id v4;

  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 408));
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 280))
    {
      *(_BYTE *)(v3 + 280) = 0;
      v4 = v2;
      v2[2](v2, 0);
      v2 = (void (**)(_QWORD, _QWORD))v4;
    }
  }

}

void __47__RPConnection__serverPairSetupWithData_start___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v7 = CFSTR("_pd");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendFrameType:unencryptedObject:", 4, v6);

}

uint64_t __47__RPConnection__serverPairSetupWithData_start___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverPairSetupCompleted:", a2);
}

- (void)_serverPairSetupCompleted:(id)a3
{
  id v4;
  void *v5;
  CUPairingSession *pairSetupSession;
  CUPairingStream *v7;
  id v8;
  CUPairingStream *mainStream;
  CUPairingStream *v10;
  CUPairingSession *v11;
  CUPairingStream *v12;
  id v13;
  CUPairingStream *highPriorityStream;
  CUPairingStream *v15;
  int var0;
  uint64_t pairSetupAuthType;
  const char *v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  id v27;
  id v28;
  id v29;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = v4;
  }
  else
  {
    pairSetupSession = self->_pairSetupSession;
    v29 = 0;
    -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", CFSTR("main"), &v29);
    v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
    v8 = v29;
    mainStream = self->_mainStream;
    self->_mainStream = v7;

    v10 = self->_mainStream;
    if (v10)
    {
      self->_mainAuthTagLength = -[CUPairingStream authTagLength](v10, "authTagLength");
      if (self->_btPipeHighPriority)
      {
        v11 = self->_pairSetupSession;
        v28 = v8;
        -[CUPairingSession openStreamWithName:error:](v11, "openStreamWithName:error:", CFSTR("hipri"), &v28);
        v12 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
        v13 = v28;

        highPriorityStream = self->_highPriorityStream;
        self->_highPriorityStream = v12;

        v15 = self->_highPriorityStream;
        if (!v15)
          goto LABEL_25;
        self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v15, "authTagLength");
      }
      else
      {
        v13 = v8;
      }
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        pairSetupAuthType = self->_pairSetupAuthType;
        if (pairSetupAuthType > 0xA)
          v18 = "?";
        else
          v18 = off_1E5F50000[pairSetupAuthType];
        v26 = v18;
        LogPrintF();
      }
      v19 = self->_pairSetupAuthType;
      if (v19 == 8)
      {
        v20 = self->_statusFlags & 0xFFFFFFDFFFFFEFFFLL | 0x2000000000;
      }
      else
      {
        if (v19 != 5)
        {
          self->_statusFlags = self->_statusFlags & 0xFFFFFFEFFFF50FFFLL | 0x1000;
          self->_flags |= 1u;
LABEL_21:
          if (self->_internalState == 26)
          {
            self->_stepDone = 1;
            v21 = MEMORY[0x1AF45BE48](self->_authCompletionHandler);
            v22 = (void *)v21;
            if (v21)
              (*(void (**)(uint64_t, id))(v21 + 16))(v21, v13);

            -[RPConnection _run](self, "_run");
          }
LABEL_25:
          if (!v13)
            goto LABEL_35;
          goto LABEL_26;
        }
        v20 = self->_statusFlags & 0xFFFFFFFFFFFF6FFFLL | 0x8000;
      }
      self->_statusFlags = v20;
      goto LABEL_21;
    }
    v13 = v8;
    if (!v8)
      goto LABEL_35;
  }
LABEL_26:
  v23 = self->_ucat->var0;
  if (v23 <= 60 && (v23 != -1 || _LogCategory_Initialize()))
  {
    v24 = self->_pairSetupAuthType;
    if (v24 > 0xA)
      v25 = "?";
    else
      v25 = off_1E5F50000[v24];
    v26 = v25;
    v27 = v13;
    LogPrintF();
  }
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v26, v27);

LABEL_35:
}

- (void)_serverPairVerifyWithData:(id)a3 start:(BOOL)a4
{
  void *v6;
  CUPairingSession *v7;
  CUPairingSession *pairVerifySession;
  const __CFString *label;
  unint64_t controlFlags;
  void *v11;
  void *v12;
  int Int64Ranged;
  int v14;
  CUPairingSession *v15;
  uint64_t v16;
  uint64_t v17;
  void (**configurePairingHandler)(id, CUPairingSession *);
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  int var0;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  int v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v6 = (void *)OPACKDecodeData();
  if (!v6)
  {
    v22 = RPErrorF();
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    RPErrorF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  if (a4 || !self->_pairVerifySession)
  {
    -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
    self->_pairVerifyUsedIdentity = 0;
    v7 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
    pairVerifySession = self->_pairVerifySession;
    self->_pairVerifySession = v7;

    if ((self->_controlFlags & 0xC0) != 0)
      -[CUPairingSession setSelfAppFlags:](self->_pairVerifySession, "setSelfAppFlags:", 1);
    -[CUPairingSession setDispatchQueue:](self->_pairVerifySession, "setDispatchQueue:", self->_dispatchQueue);
    -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", self->_pairVerifyFlags);
    if (self->_label)
      label = (const __CFString *)self->_label;
    else
      label = CFSTR("RPCnx");
    -[CUPairingSession setLabel:](self->_pairVerifySession, "setLabel:", label);
    -[CUPairingSession setSessionType:](self->_pairVerifySession, "setSessionType:", 4);
    controlFlags = self->_controlFlags;
    if ((controlFlags & 0x20000000) != 0)
    {
      v31 = CFSTR("_cf");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", controlFlags & 0x20000000);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setAppInfoSelf:](self->_pairVerifySession, "setAppInfoSelf:", v12);

    }
    Int64Ranged = CFDictionaryGetInt64Ranged();
    v14 = Int64Ranged;
    switch(Int64Ranged)
    {
      case 3:
        -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
        v15 = self->_pairVerifySession;
        v16 = -[CUPairingSession flags](v15, "flags") | 0x4000000;
        break;
      case 8:
        -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFE3);
        -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairVerifySession);
        goto LABEL_19;
      case 4:
        -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
        v15 = self->_pairVerifySession;
        v16 = -[CUPairingSession flags](v15, "flags") | 0xC;
        break;
      default:
LABEL_19:
        self->_pairVerifyAuthType = v14;
        self->_pairSetupAuthType = v14;
        v17 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke;
        v29[3] = &unk_1E5F4FA20;
        v29[4] = self;
        -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", v29);
        if ((v14 - 5) <= 0xFFFFFFFD)
        {
          v28[0] = v17;
          v28[1] = 3221225472;
          v28[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_2;
          v28[3] = &unk_1E5F4FA70;
          v28[4] = self;
          -[CUPairingSession setSignDataHandler:](self->_pairVerifySession, "setSignDataHandler:", v28);
          v27[0] = v17;
          v27[1] = 3221225472;
          v27[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_3;
          v27[3] = &unk_1E5F4FA98;
          v27[4] = self;
          -[CUPairingSession setVerifySignatureHandler:](self->_pairVerifySession, "setVerifySignatureHandler:", v27);
        }
        v26[0] = v17;
        v26[1] = 3221225472;
        v26[2] = __48__RPConnection__serverPairVerifyWithData_start___block_invoke_4;
        v26[3] = &unk_1E5F4ECD0;
        v26[4] = self;
        -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", v26);
        configurePairingHandler = (void (**)(id, CUPairingSession *))self->_configurePairingHandler;
        if (configurePairingHandler)
          configurePairingHandler[2](configurePairingHandler, self->_pairVerifySession);
        -[CUPairingSession activate](self->_pairVerifySession, "activate");
        goto LABEL_24;
    }
    -[CUPairingSession setFlags:](v15, "setFlags:", v16);
    goto LABEL_19;
  }
LABEL_24:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v19);

LABEL_26:
    v21 = 0;
    goto LABEL_27;
  }
  RPErrorF();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
  if (v21)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_27:

}

void __48__RPConnection__serverPairVerifyWithData_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v7 = CFSTR("_pd");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendFrameType:unencryptedObject:", 6, v6);

}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifySignData:flags:error:", a3, a2, a4);
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifyVerifySignature:data:flags:error:", a4, a3, a2, a5);
}

uint64_t __48__RPConnection__serverPairVerifyWithData_start___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverPairVerifyCompleted:", a2);
}

- (void)_serverPairVerifyCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int Int64;
  CUPairingSession *v8;
  CUPairingStream *v9;
  id v10;
  CUPairingStream *v11;
  CUPairingSession *v12;
  CUPairingStream *v13;
  void *v14;
  CUPairingSession *pairVerifySession;
  CUPairingStream *v16;
  CUPairingStream *mainStream;
  CUPairingSession *v18;
  id v19;
  CUPairingStream *highPriorityStream;
  CUPairingStream *v21;
  CUPairingStream *v22;
  unint64_t v23;
  int pairVerifyAuthType;
  const char *v25;
  _BOOL4 pairVerifyUsedIdentity;
  const char *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSString *v35;
  NSString *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  NSString *v44;
  NSString *peerHomeKitUserIdentifier;
  void *v46;
  RPIdentity *v47;
  void *v48;
  void *v49;
  void *v50;
  RPIdentity *identityVerified;
  RPIdentity *v52;
  void *v53;
  int var0;
  int v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  id flags;
  void *v62;
  unint64_t statusFlags;
  void *v64;
  RPIdentity *v65;
  id v66;
  id v67;
  id v68;
  id v69;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if ((self->_controlFlags & 0x20000000) != 0
      && (-[CUPairingSession appInfoPeer](self->_pairVerifySession, "appInfoPeer"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          Int64 = CFDictionaryGetInt64(),
          v6,
          (Int64 & 0x20000000) != 0))
    {
      pairVerifySession = self->_pairVerifySession;
      v69 = 0;
      -[CUPairingSession openStreamWithName:type:error:](pairVerifySession, "openStreamWithName:type:error:", CFSTR("main"), 2, &v69);
      v16 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v10 = v69;
      mainStream = self->_mainStream;
      self->_mainStream = v16;

      if (!self->_btPipeHighPriority)
        goto LABEL_10;
      v18 = self->_pairVerifySession;
      v68 = v10;
      -[CUPairingSession openStreamWithName:type:error:](v18, "openStreamWithName:type:error:", CFSTR("hipri"), 2, &v68);
      v13 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v14 = v68;
    }
    else
    {
      v8 = self->_pairVerifySession;
      v67 = 0;
      -[CUPairingSession openStreamWithName:error:](v8, "openStreamWithName:error:", CFSTR("main"), &v67);
      v9 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v10 = v67;
      v11 = self->_mainStream;
      self->_mainStream = v9;

      if (!self->_btPipeHighPriority)
        goto LABEL_10;
      v12 = self->_pairVerifySession;
      v66 = v10;
      -[CUPairingSession openStreamWithName:error:](v12, "openStreamWithName:error:", CFSTR("hipri"), &v66);
      v13 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
      v14 = v66;
    }
    v19 = v14;

    highPriorityStream = self->_highPriorityStream;
    self->_highPriorityStream = v13;

    v21 = self->_highPriorityStream;
    v10 = v19;
    if (!v21)
      goto LABEL_50;
    self->_highPriorityAuthTagLength = -[CUPairingStream authTagLength](v21, "authTagLength");
    v10 = v19;
LABEL_10:
    v22 = self->_mainStream;
    if (v22)
    {
      self->_mainAuthTagLength = -[CUPairingStream authTagLength](v22, "authTagLength");
      self->_pairVerifyCompleted = 1;
      -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") & 0xFFFFFF8FFFF50FFFLL);
      v23 = self->_statusFlags & 0xFFFFFF8FFFF50FFFLL;
      self->_statusFlags = v23;
      pairVerifyAuthType = self->_pairVerifyAuthType;
      v25 = "PSAuth";
      switch(pairVerifyAuthType)
      {
        case 0:
        case 1:
        case 2:
        case 8:
        case 9:
          switch(self->_pairVerifyIdentityType)
          {
            case 0:
            case 2:
              self->_flags &= ~1u;
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x80000);
              v23 = self->_statusFlags | 0x80000;
              self->_statusFlags = v23;
              pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              v27 = "(RPI-Owner)";
              goto LABEL_22;
            case 4:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000);
              v38 = self->_statusFlags | 0x4000;
              self->_statusFlags = v38;
              v25 = "(RPI-Family)";
              if ((v38 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 6:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x20000);
              v39 = self->_statusFlags | 0x20000;
              self->_statusFlags = v39;
              v25 = "(RPI-Friend)";
              if ((v39 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 0xC:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x1000000000);
              v40 = self->_statusFlags | 0x1000000000;
              self->_statusFlags = v40;
              v25 = "(RPI-SharedTVUser)";
              if ((v40 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 0xD:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000000000);
              v41 = self->_statusFlags | 0x2000000000;
              self->_statusFlags = v41;
              v25 = "(RPI-SessionPaired)";
              if ((v41 & 0x80000) == 0)
                goto LABEL_39;
              goto LABEL_36;
            case 0xF:
              -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x4000000000);
              v42 = self->_statusFlags | 0x4000000000;
              self->_statusFlags = v42;
              v25 = "(RPI-AdHocPaired)";
              if ((v42 & 0x80000) != 0)
                goto LABEL_36;
              goto LABEL_39;
            default:
              pairVerifyUsedIdentity = self->_pairVerifyUsedIdentity;
              v27 = "(RPI-?)";
LABEL_22:
              if (pairVerifyUsedIdentity)
                v25 = v27;
              else
                v25 = "(HK)";
              if ((v23 & 0x80000) == 0)
                goto LABEL_39;
LABEL_36:
              -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "identifier");
              v44 = (NSString *)objc_claimAutoreleasedReturnValue();
              peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
              self->_peerHomeKitUserIdentifier = v44;

              break;
          }
          goto LABEL_39;
        case 3:
          -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x2000);
          self->_statusFlags |= 0x2000uLL;
          -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "UUIDString");
          v30 = (NSString *)objc_claimAutoreleasedReturnValue();
          v31 = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v30;

          v25 = "HKShared";
          goto LABEL_39;
        case 4:
          -[CUPairingSession aclActual](self->_pairVerifySession, "aclActual");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = CFDictionaryGetInt64();

          if (v33)
          {
            -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "identifier");
            v35 = (NSString *)objc_claimAutoreleasedReturnValue();
            v36 = self->_peerHomeKitUserIdentifier;
            self->_peerHomeKitUserIdentifier = v35;

            v37 = 557056;
          }
          else
          {
            v37 = 0x8000;
          }
          -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | v37);
          self->_statusFlags |= v37;
          v25 = "CUPair";
LABEL_39:
          if ((pairVerifyAuthType - 3) <= 1 && !self->_identityVerified)
          {
            -[CUPairingSession pairedPeer](self->_pairVerifySession, "pairedPeer");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              v47 = objc_alloc_init(RPIdentity);
              objc_msgSend(v46, "publicKey");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setEdPKData:](v47, "setEdPKData:", v48);

              objc_msgSend(v46, "identifier");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "UUIDString");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPIdentity setIdentifier:](v47, "setIdentifier:", v50);

              -[RPIdentity setType:](v47, "setType:", 8);
              identityVerified = self->_identityVerified;
              self->_identityVerified = v47;
              v52 = v47;

              -[RPIdentity identifier](self->_identityVerified, "identifier");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[RPEndpoint setVerifiedIdentity:](self->_peerDeviceInfo, "setVerifiedIdentity:", v53);

            }
          }
          break;
        case 5:
          break;
        case 6:
          v25 = "PSGuest";
          break;
        case 7:
          v25 = "PV-AID";
          break;
        case 10:
          v25 = "AuthEnd";
          break;
        default:
          v25 = "?";
          break;
      }
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v64 = &unk_1AF3071C2;
        v65 = self->_identityVerified;
        v62 = &unk_1AF30738F;
        statusFlags = self->_statusFlags;
        v60 = v25;
        flags = (id)self->_flags;
        LogPrintF();
      }
      if (self->_internalState == 26)
      {
        self->_stepDone = 1;
        -[RPConnection _run](self, "_run");
      }
    }
LABEL_50:
    if (!v10)
      goto LABEL_62;
    goto LABEL_51;
  }
  v10 = v4;
LABEL_51:
  v55 = self->_ucat->var0;
  if (v55 <= 60 && (v55 != -1 || _LogCategory_Initialize()))
  {
    v56 = self->_pairVerifyAuthType;
    if (v56 > 0xA)
      v57 = "?";
    else
      v57 = off_1E5F50000[v56];
    v60 = v57;
    flags = v10;
    LogPrintF();
  }
  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v60, flags, v62, statusFlags, v64, v65);
  v58 = MEMORY[0x1AF45BE48](self->_pairVerifyCompletion);
  v59 = (void *)v58;
  if (v58)
    (*(void (**)(uint64_t, id))(v58 + 16))(v58, v10);

LABEL_62:
}

- (void)_serverStarted
{
  OS_dispatch_source *startTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  NSString *v6;
  NSString *peerIdentifier;

  startTimer = self->_startTimer;
  if (startTimer)
  {
    v4 = startTimer;
    dispatch_source_cancel(v4);
    v5 = self->_startTimer;
    self->_startTimer = 0;

  }
  if (!self->_peerIdentifier)
  {
    RandomBytes();
    NSPrintF();
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    peerIdentifier = self->_peerIdentifier;
    self->_peerIdentifier = v6;

  }
}

- (void)_processSends
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int var0;

  -[NSMutableArray firstObject](self->_sendArray, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", 0);
      objc_msgSend(v4, "requestID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "requestID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "request");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v4, "xpcID");
        objc_msgSend(v4, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPConnection _sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:](self, "_sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:", v6, v7, v8, v9, v4, v10);
      }
      else
      {
        objc_msgSend(v4, "eventID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          goto LABEL_8;
        }
        objc_msgSend(v4, "eventID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "eventData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "xid");
        objc_msgSend(v4, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "completion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPConnection _sendEncryptedEventID:data:xid:options:completion:](self, "_sendEncryptedEventID:data:xid:options:completion:", v6, v7, v12, v9, v10);
      }

LABEL_8:
      -[NSMutableArray firstObject](self->_sendArray, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v4);
  }
}

- (void)sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  void (**v14)(id, void *);
  int var0;
  int internalState;
  BOOL v17;
  int v18;
  void *v19;
  RPSendEntry *v20;
  unsigned int xidLast;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v9 = *(_QWORD *)&a5;
  v25 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, void *))a7;
  if (self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v14)
    {
      RPErrorF();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v19);

    }
  }
  else
  {
    internalState = self->_internalState;
    v17 = internalState == 28 || internalState == 21;
    if (v17 && !-[NSMutableArray count](self->_sendArray, "count"))
    {
      -[RPConnection _sendEncryptedEventID:data:xid:options:completion:](self, "_sendEncryptedEventID:data:xid:options:completion:", v25, v12, v9, v13, v14);
    }
    else
    {
      v18 = self->_ucat->var0;
      if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
      {
        v23 = v9;
        v24 = -[NSMutableArray count](self->_sendArray, "count");
        v22 = v25;
        LogPrintF();
      }
      v20 = objc_alloc_init(RPSendEntry);
      -[RPSendEntry setCompletion:](v20, "setCompletion:", v14);
      -[RPSendEntry setEventID:](v20, "setEventID:", v25);
      -[RPSendEntry setEventData:](v20, "setEventData:", v12);
      -[RPSendEntry setOptions:](v20, "setOptions:", v13);
      -[RPSendEntry setQueueTicks:](v20, "setQueueTicks:", mach_absolute_time());
      if (!(_DWORD)v9)
      {
        xidLast = self->_xidLast;
        if (xidLast + 1 > 1)
          v9 = xidLast + 1;
        else
          v9 = 1;
        self->_xidLast = v9;
      }
      -[RPSendEntry setXid:](v20, "setXid:", v9, v22, v23, v24);
      -[NSMutableArray addObject:](self->_sendArray, "addObject:", v20);

    }
  }

}

- (void)sendEncryptedEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  unsigned int xidLast;
  uint64_t v14;
  id v15;
  uint64_t Int64;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  xidLast = self->_xidLast;
  if (xidLast + 1 > 1)
    v14 = xidLast + 1;
  else
    v14 = 1;
  self->_xidLast = v14;
  v15 = a4;
  Int64 = CFDictionaryGetInt64();
  v17 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v15, CFSTR("_c"), v10, CFSTR("_i"), &unk_1E5F6A360, CFSTR("_t"), v18, CFSTR("_x"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (Int64)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_cht"));
  v22 = 0;
  v20 = (void *)MEMORY[0x1AF45B698](v19, 0, &v22);
  if (v20)
  {
    -[RPConnection sendEncryptedEventID:data:xid:options:completion:](self, "sendEncryptedEventID:data:xid:options:completion:", v10, v20, v14, v11, v12);
  }
  else if (v12)
  {
    RPErrorF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v21);

  }
}

- (void)_sendEncryptedEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id);
  CUBluetoothScalablePipe *btPipe;
  id v17;
  int var0;
  CUBluetoothScalablePipe *v19;
  int v20;
  uint64_t v21;
  unint64_t mainAuthTagLength;
  CUPairingStream *v23;
  CUPairingStream *v24;
  unint64_t v25;
  uint64_t Int64;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  int v32;
  uint64_t linkType;
  const char *v34;
  const char *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  const char *v45;
  const char *v46;
  int v47;
  uint64_t v48;
  id v49;
  void *v50;
  CUReadWriteRequestable *v51;
  _QWORD v52[4];
  id v53;
  void (**v54)(id, id);
  id v55;
  int v56;
  _QWORD v57[4];

  v9 = *(_QWORD *)&a5;
  v57[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, id))a7;
  btPipe = self->_btPipe;
  if (btPipe
    && -[CUBluetoothScalablePipe peerHostState](btPipe, "peerHostState") != 2
    && CFDictionaryGetInt64())
  {
    RPErrorF();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v15)
      v15[2](v15, v17);
    goto LABEL_45;
  }
  v51 = self->_requestable;
  v50 = v12;
  if (-[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 1 && CFDictionaryGetInt64())
  {
    v19 = self->_btPipeHighPriority;

    v20 = 1;
    v51 = v19;
  }
  else
  {
    v20 = 0;
  }
  v56 = 8;
  v21 = objc_msgSend(v13, "length");
  mainAuthTagLength = self->_mainAuthTagLength;
  v23 = self->_mainStream;
  if (v20)
  {
    v24 = self->_highPriorityStream;

    LOBYTE(v56) = 12;
    v25 = self->_highPriorityAuthTagLength + objc_msgSend(v13, "length");
    v23 = v24;
  }
  else
  {
    v25 = mainAuthTagLength + v21;
  }
  v49 = v14;
  Int64 = CFDictionaryGetInt64();
  if (v25 >> 24)
  {
    RPErrorF();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0;
LABEL_53:
    v29 = 0;
    goto LABEL_54;
  }
  v27 = Int64;
  BYTE1(v56) = BYTE2(v25);
  BYTE2(v56) = BYTE1(v25);
  HIBYTE(v56) = v25;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v56, 4);
  if (!v23)
  {
    RPErrorF();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  v48 = v9;
  v55 = 0;
  -[CUPairingStream encryptData:aadData:error:](v23, "encryptData:aadData:error:", v13, v28, &v55);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v55;
  if (v29)
  {
    if (!v27)
    {
      v30 = v50;
      if ((objc_msgSend(v30, "isEqual:", CFSTR("HIDRelay")) & 1) != 0
        || (objc_msgSend(v30, "isEqual:", CFSTR("synchSetupStateFromStereoCounterpart")) & 1) != 0
        || (objc_msgSend(v30, "isEqual:", CFSTR("_hidT")) & 1) != 0
        || objc_msgSend(v30, "isEqual:", CFSTR("_laData")))
      {

      }
      else
      {
        v47 = objc_msgSend(v30, "isEqual:", CFSTR("_siA"));

        if (!v47)
        {
          v31 = 30;
LABEL_24:
          v32 = self->_ucat->var0;
          if (v31 >= v32 && (v32 != -1 || _LogCategory_Initialize()))
          {
            linkType = self->_linkType;
            if (linkType > 0xB)
              v34 = "?";
            else
              v34 = off_1E5F50058[linkType];
            v35 = "";
            if (v20)
              v35 = "at high priority";
            v43 = v29;
            v44 = v25;
            v41 = v50;
            v42 = v48;
            v45 = v34;
            v46 = v35;
            LogPrintF();
          }
          +[RPConnectionMetrics sharedMetrics](RPConnectionMetrics, "sharedMetrics", v41, v42, v43, v44, v45, v46);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "logMessageForClient:length:linkType:", self->_initiator, v25, self->_linkType);

          v37 = objc_alloc_init(MEMORY[0x1E0D1B490]);
          v38 = v37;
          if (v15)
          {
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke;
            v52[3] = &unk_1E5F4ED70;
            v53 = v37;
            v54 = v15;
            objc_msgSend(v53, "setCompletion:", v52);

          }
          v57[0] = v28;
          v57[1] = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setDataArray:", v39);

          -[CUReadWriteRequestable writeWithRequest:](v51, "writeWithRequest:", v38);
          goto LABEL_37;
        }
      }
    }
    v31 = 10;
    goto LABEL_24;
  }
LABEL_54:
  v38 = 0;
LABEL_37:
  v12 = v50;
  if (v17)
  {
    v40 = self->_ucat->var0;
    if (v40 <= 90 && (v40 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v15)
      v15[2](v15, v17);
  }

  v14 = v49;
LABEL_45:

}

void __66__RPConnection__sendEncryptedEventID_data_xid_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = (id)v2;
  if (v2)
  {
    RPNestedErrorF();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

- (void)sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 responseHandler:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  int var0;
  int internalState;
  BOOL v18;
  int v19;
  void *v20;
  RPSendEntry *v21;
  double v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  _QWORD handler[7];

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    RPErrorF();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v20);

  }
  else
  {
    internalState = self->_internalState;
    v18 = internalState == 28 || internalState == 21;
    if (v18 && !-[NSMutableArray count](self->_sendArray, "count"))
    {
      -[RPConnection _sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:](self, "_sendEncryptedRequestID:request:xpcID:options:sendEntry:responseHandler:", v12, v13, v9, v14, 0, v15);
    }
    else
    {
      v19 = self->_ucat->var0;
      if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
      {
        v24 = v12;
        v25 = -[NSMutableArray count](self->_sendArray, "count");
        LogPrintF();
      }
      v21 = objc_alloc_init(RPSendEntry);
      -[RPSendEntry setOptions:](v21, "setOptions:", v14);
      -[RPSendEntry setQueueTicks:](v21, "setQueueTicks:", mach_absolute_time());
      -[RPSendEntry setRequestID:](v21, "setRequestID:", v12);
      -[RPSendEntry setRequest:](v21, "setRequest:", v13);
      -[RPSendEntry setXpcID:](v21, "setXpcID:", v9);
      -[RPSendEntry setResponseHandler:](v21, "setResponseHandler:", v15);
      if (v14)
      {
        CFDictionaryGetDouble();
        if (v22 > 0.0)
        {
          v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __77__RPConnection_sendEncryptedRequestID_request_xpcID_options_responseHandler___block_invoke;
          handler[3] = &unk_1E5F4FB10;
          handler[4] = v23;
          handler[5] = self;
          handler[6] = v21;
          dispatch_source_set_event_handler(v23, handler);
          CUDispatchTimerSet();
          dispatch_resume(v23);
          -[RPSendEntry setTimer:](v21, "setTimer:", v23);

        }
      }
      -[NSMutableArray addObject:](self->_sendArray, "addObject:", v21, v24, v25);

    }
  }

}

uint64_t __77__RPConnection_sendEncryptedRequestID_request_xpcID_options_responseHandler___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_timeoutForSendEntry:", *(_QWORD *)(a1 + 48));
}

- (void)_sendEncryptedRequestID:(id)a3 request:(id)a4 xpcID:(unsigned int)a5 options:(id)a6 sendEntry:(id)a7 responseHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CUBluetoothScalablePipe *btPipe;
  void *v19;
  int v20;
  CUReadWriteRequestable *v21;
  CUPairingStream *v22;
  id v23;
  CUBluetoothScalablePipe *v24;
  uint64_t v25;
  unsigned int xidLast;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t Int64;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  CUPairingStream *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSMutableDictionary *requests;
  NSMutableDictionary *v44;
  NSMutableDictionary *v45;
  NSObject *v46;
  uint64_t v47;
  NSString *label;
  uint64_t linkType;
  const char *v50;
  NSString *peerIdentifier;
  id v52;
  void *v53;
  int v54;
  int var0;
  uint64_t v56;
  const char *v57;
  const char *v58;
  void *v59;
  id v60;
  void *v61;
  void **v62;
  uint64_t v63;
  void *v64;
  CUBluetoothScalablePipe *v65;
  double v66;
  NSObject *v67;
  int v68;
  void *v69;
  os_signpost_id_t v70;
  CUPairingStream *v71;
  unint64_t v72;
  const char *v73;
  const char *v74;
  void *v75;
  id v76;
  unsigned int v77;
  void *v78;
  CUPairingStream *v79;
  os_signpost_id_t spid;
  CUBluetoothScalablePipe *v81;
  void *v82;
  CUPairingStream *v83;
  id v84;
  id v85;
  void *v86;
  _QWORD handler[7];
  int v88;
  id v89;
  int v90;
  int v91;
  uint64_t v92;
  _QWORD v93[2];
  uint8_t buf[4];
  int v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  NSString *v99;
  __int16 v100;
  unint64_t v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  int v105;
  __int16 v106;
  NSString *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v85 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  btPipe = self->_btPipe;
  if (!btPipe
    || -[CUBluetoothScalablePipe peerHostState](btPipe, "peerHostState") == 2
    || !CFDictionaryGetInt64())
  {
    v21 = self->_requestable;
    v22 = self->_mainStream;
    v77 = a5;
    if (-[CUBluetoothScalablePipe state](self->_btPipeHighPriority, "state") == 1
      && CFDictionaryGetInt64())
    {
      v23 = v16;
      v24 = self->_btPipeHighPriority;

      v25 = 1;
      v81 = v24;
    }
    else
    {
      v23 = v16;
      v81 = v21;
      v25 = 0;
    }
    xidLast = self->_xidLast;
    if (xidLast + 1 > 1)
      v27 = xidLast + 1;
    else
      v27 = 1;
    self->_xidLast = v27;
    spid = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)v28;
    objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v85, CFSTR("_c"), v14, CFSTR("_i"), &unk_1E5F6A378, CFSTR("_t"), v28, CFSTR("_x"), v30, CFSTR("_btHP"), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    Int64 = CFDictionaryGetInt64();
    if (Int64)
      objc_msgSend(v31, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_cht"));
    v16 = v23;
    if (CFDictionaryGetInt64())
      objc_msgSend(v31, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_pttEligible"));
    v91 = 0;
    v33 = (void *)MEMORY[0x1AF45B698](v31, 0, &v91);
    v34 = v33;
    v78 = v31;
    if (v33)
    {
      v84 = v17;
      v90 = 8;
      v35 = objc_msgSend(v33, "length");
      if ((_DWORD)v25)
      {
        v36 = v16;
        v37 = v14;
        v38 = self->_highPriorityStream;

        LOBYTE(v90) = 12;
        v39 = self->_highPriorityAuthTagLength + objc_msgSend(v34, "length");
        v22 = v38;
        v14 = v37;
        v16 = v36;
      }
      else
      {
        v39 = self->_mainAuthTagLength + v35;
      }
      v79 = v22;
      if (v39 >> 24)
      {
        RPErrorF();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v60 = 0;
        v82 = 0;
      }
      else
      {
        BYTE1(v90) = BYTE2(v39);
        BYTE2(v90) = BYTE1(v39);
        HIBYTE(v90) = v39;
        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v90, 4);
        v82 = (void *)v40;
        if (v22)
        {
          v41 = v40;
          v89 = 0;
          -[CUPairingStream encryptData:aadData:error:](v22, "encryptData:aadData:error:", v34, v40, &v89);
          v22 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
          v76 = v89;
          v83 = v22;
          if (v22)
          {
            v75 = v34;
            v22 = objc_alloc_init(RPRequestEntry);
            -[CUPairingStream setOptions:](v22, "setOptions:", v15);
            -[CUPairingStream setRequestID:](v22, "setRequestID:", v14);
            -[CUPairingStream setResponseHandler:](v22, "setResponseHandler:", v84);
            -[CUPairingStream setSendTicks:](v22, "setSendTicks:", mach_absolute_time());
            -[CUPairingStream setXpcID:](v22, "setXpcID:", v77);
            -[CUPairingStream setLength:](v22, "setLength:", v39);
            if (v16)
            {
              objc_msgSend(v16, "timer");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[CUPairingStream setTimer:](v22, "setTimer:", v42);

              objc_msgSend(v16, "setXidObj:", v86);
            }
            requests = self->_requests;
            if (!requests)
            {
              v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              v45 = self->_requests;
              self->_requests = v44;

              requests = self->_requests;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](requests, "setObject:forKeyedSubscript:", v22, v86);
            RPConnectionLog();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v46))
            {
              v47 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
              label = self->_label;
              linkType = self->_linkType;
              if (linkType > 0xB)
                v50 = "?";
              else
                v50 = off_1E5F50058[linkType];
              peerIdentifier = self->_peerIdentifier;
              *(_DWORD *)buf = 67110658;
              v95 = spid;
              v96 = 2080;
              v97 = v47;
              v98 = 2112;
              v99 = label;
              v100 = 2048;
              v101 = v39;
              v102 = 2080;
              v103 = v50;
              v104 = 1024;
              v105 = v25;
              v106 = 2112;
              v107 = peerIdentifier;
              _os_signpost_emit_with_name_impl(&dword_1AF28C000, v46, OS_SIGNPOST_INTERVAL_BEGIN, spid, "RPConnectionSendRequestTime", " enableTelemetry=YES {XID:0x%X, requestID=%{signpost.telemetry:string1}s, connectionID:%@, requestSize:%zu, linkType:%s, highPriority:%d, peer:%@, signpost.description:begin_time}", buf, 0x40u);
              v41 = (uint64_t)v82;
            }

            v52 = v14;
            v53 = v52;
            if (Int64)
            {
              v54 = 10;
            }
            else if ((objc_msgSend(v52, "isEqual:", CFSTR("_ftSm")) & 1) != 0)
            {
              v54 = 9;
            }
            else
            {
              v54 = 9;
              if ((objc_msgSend(v53, "isEqual:", CFSTR("_ftLg")) & 1) == 0)
              {
                if (objc_msgSend(v53, "isEqual:", CFSTR("_ftRs")))
                  v54 = 9;
                else
                  v54 = 30;
              }
            }

            var0 = self->_ucat->var0;
            if (v54 >= var0 && (var0 != -1 || _LogCategory_Initialize()))
            {
              v56 = self->_linkType;
              if (v56 > 0xB)
                v57 = "?";
              else
                v57 = off_1E5F50058[v56];
              v58 = "";
              if ((_DWORD)v25)
                v58 = "at high priority";
              v71 = v83;
              v72 = v39;
              v69 = v53;
              v70 = spid;
              v73 = v57;
              v74 = v58;
              LogPrintF();
            }
            +[RPConnectionMetrics sharedMetrics](RPConnectionMetrics, "sharedMetrics", v69, v70, v71, v72, v73, v74);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "logMessageForClient:length:linkType:", self->_initiator, v39, self->_linkType);

            v60 = objc_alloc_init(MEMORY[0x1E0D1B490]);
            if (v39)
            {
              v93[0] = v41;
              v93[1] = v83;
              v61 = (void *)MEMORY[0x1E0C99D20];
              v62 = (void **)v93;
              v63 = 2;
            }
            else
            {
              v92 = v41;
              v61 = (void *)MEMORY[0x1E0C99D20];
              v62 = (void **)&v92;
              v63 = 1;
            }
            objc_msgSend(v61, "arrayWithObjects:count:", v62, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v75;
            objc_msgSend(v60, "setDataArray:", v64);

            v65 = v81;
            -[CUBluetoothScalablePipe writeWithRequest:](v81, "writeWithRequest:", v60);
            v17 = v84;
            if (!v15 || (CFDictionaryGetDouble(), v66 <= 0.0))
            {
LABEL_59:
              v19 = v76;
              if (v76)
                goto LABEL_60;
              goto LABEL_65;
            }
            v67 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
            handler[0] = MEMORY[0x1E0C809B0];
            handler[1] = 3221225472;
            handler[2] = __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke;
            handler[3] = &unk_1E5F4FB38;
            handler[4] = v67;
            handler[5] = self;
            handler[6] = v86;
            v88 = spid;
            dispatch_source_set_event_handler(v67, handler);
            CUDispatchTimerSet();
            dispatch_resume(v67);
            -[CUPairingStream setTimer:](v22, "setTimer:", v67);

          }
          else
          {
            v60 = 0;
            v83 = 0;
            v17 = v84;
          }
          v65 = v81;
          goto LABEL_59;
        }
        RPErrorF();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0;
        v60 = 0;
      }
      v83 = 0;
      v17 = v84;
    }
    else
    {
      v79 = v22;
      RPErrorF();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v60 = 0;
      v82 = 0;
      v83 = 0;
    }
    v65 = v81;
    if (v19)
    {
LABEL_60:
      v68 = self->_ucat->var0;
      if (v68 <= 90 && (v68 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v19);
    }
LABEL_65:

    goto LABEL_66;
  }
  RPErrorF();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self->_ucat->var0;
  if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v19);
LABEL_66:

}

void __88__RPConnection__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_timeoutForXID:", *(_QWORD *)(a1 + 48));
  RPConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v4 && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(v5 + 632);
    v7 = *(_QWORD *)(v5 + 672);
    v8[0] = 67109634;
    v8[1] = v4;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_signpost_emit_with_name_impl(&dword_1AF28C000, v3, OS_SIGNPOST_INTERVAL_END, v4, "RPConnectionSendRequestTime", " enableTelemetry=YES {XID:0x%X, connectionID:%@, peer:%@, signpost.description:end_time, error:request_timed_out}", (uint8_t *)v8, 0x1Cu);
  }

}

- (void)_sendEncryptedResponse:(id)a3 error:(id)a4 xid:(id)a5 requestID:(id)a6 highPriority:(BOOL)a7 isChatty:(BOOL)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  CUReadWriteRequestable *v17;
  CUPairingStream *v18;
  CUBluetoothScalablePipe *btPipeHighPriority;
  CUBluetoothScalablePipe *v20;
  id v21;
  void *v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  int var0;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  CUPairingStream *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t linkType;
  const char *v44;
  const char *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSString *label;
  uint64_t v50;
  const char *v51;
  NSString *peerIdentifier;
  void *v53;
  void **v54;
  uint64_t v55;
  void *v56;
  int v57;
  uint64_t v58;
  id v59;
  unint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  _BOOL4 v64;
  id v65;
  BOOL v66;
  id v67;
  CUReadWriteRequestable *v68;
  CUPairingStream *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  int v75;
  int v76;
  void *v77;
  _QWORD v78[2];
  uint8_t buf[4];
  int v80;
  __int16 v81;
  NSString *v82;
  __int16 v83;
  unint64_t v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  _BOOL4 v88;
  __int16 v89;
  NSString *v90;
  uint64_t v91;

  v9 = a7;
  v91 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = self->_requestable;
  v18 = self->_mainStream;
  btPipeHighPriority = self->_btPipeHighPriority;
  v66 = a8;
  if (btPipeHighPriority && v9)
  {
    v20 = btPipeHighPriority;

    v17 = v20;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = v21;
  if (v14)
    v23 = 1;
  else
    v23 = v71 == 0;
  if (v23)
    v24 = (id)MEMORY[0x1E0C9AA70];
  else
    v24 = v71;
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("_c"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E5F6A390, CFSTR("_t"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, CFSTR("_x"));
  v25 = objc_msgSend(v15, "unsignedIntValue");
  if (v14)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v58 = v25;
      v59 = v14;
      LogPrintF();
    }
    RPEncodeNSError(v14, v22);
  }
  v76 = 0;
  v27 = (void *)MEMORY[0x1AF45B698](v22, 0, &v76);
  v28 = v27;
  if (!v27)
  {
    v69 = v18;
    RPErrorF();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    v18 = 0;
    v70 = 0;
    goto LABEL_53;
  }
  v68 = v17;
  v75 = 8;
  v29 = objc_msgSend(v27, "length");
  v64 = v9;
  if (v9)
  {
    LOBYTE(v75) = 12;
    v30 = self->_highPriorityAuthTagLength + objc_msgSend(v28, "length");
    v31 = v25;
    v32 = self->_highPriorityStream;

    v18 = v32;
    v25 = v31;
  }
  else
  {
    v30 = self->_mainAuthTagLength + v29;
  }
  v69 = v18;
  if (v30 >> 24)
  {
    RPErrorF();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    v18 = 0;
LABEL_62:
    v70 = 0;
    v17 = v68;
    goto LABEL_53;
  }
  BYTE1(v75) = BYTE2(v30);
  BYTE2(v75) = BYTE1(v30);
  HIBYTE(v75) = v30;
  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v75, 4);
  if (!v18)
  {
    RPErrorF();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    goto LABEL_62;
  }
  v33 = v22;
  v34 = v25;
  v35 = v14;
  v36 = v15;
  v74 = 0;
  -[CUPairingStream encryptData:aadData:error:](v18, "encryptData:aadData:error:", v28, v73, &v74);
  v37 = objc_claimAutoreleasedReturnValue();
  v72 = v74;
  v70 = (void *)v37;
  if (!v37)
  {
    v18 = 0;
    v70 = 0;
    v17 = v68;
    v15 = v36;
    v14 = v35;
    v22 = v33;
    goto LABEL_53;
  }
  v65 = v16;
  v38 = v16;
  v39 = v38;
  if (v66)
  {
    v40 = 10;
    v15 = v36;
  }
  else
  {
    v15 = v36;
    if ((objc_msgSend(v38, "isEqual:", CFSTR("_ftSm")) & 1) == 0)
    {
      v40 = 9;
      v14 = v35;
      if ((objc_msgSend(v39, "isEqual:", CFSTR("_ftLg")) & 1) == 0)
      {
        if (objc_msgSend(v39, "isEqual:", CFSTR("_ftRs")))
          v40 = 9;
        else
          v40 = 30;
      }
      goto LABEL_28;
    }
    v40 = 9;
  }
  v14 = v35;
LABEL_28:

  v41 = self->_ucat->var0;
  v42 = v34;
  v22 = v33;
  if (v40 >= v41 && (v41 != -1 || _LogCategory_Initialize()))
  {
    v67 = v15;
    linkType = self->_linkType;
    if (linkType > 0xB)
      v44 = "?";
    else
      v44 = off_1E5F50058[linkType];
    if (v64)
      v45 = " at high priority";
    else
      v45 = "";
    v62 = v45;
    v63 = objc_msgSend(v14, "code", v58, v59);
    v60 = v30;
    v61 = v44;
    v58 = v42;
    v59 = v70;
    LogPrintF();
    v15 = v67;
  }
  +[RPConnectionMetrics sharedMetrics](RPConnectionMetrics, "sharedMetrics", v58, v59, v60, v61, v62, v63);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "logMessageForClient:length:linkType:", self->_initiator, v30, self->_linkType);

  RPConnectionLog();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if ((_DWORD)v42 && os_signpost_enabled(v47))
  {
    label = self->_label;
    v50 = self->_linkType;
    if (v50 > 0xB)
      v51 = "?";
    else
      v51 = off_1E5F50058[v50];
    peerIdentifier = self->_peerIdentifier;
    *(_DWORD *)buf = 67110402;
    v80 = v42;
    v81 = 2112;
    v82 = label;
    v83 = 2048;
    v84 = v30;
    v85 = 2080;
    v86 = v51;
    v87 = 1024;
    v88 = v64;
    v89 = 2112;
    v90 = peerIdentifier;
    _os_signpost_emit_with_name_impl(&dword_1AF28C000, v48, OS_SIGNPOST_INTERVAL_END, v42, "RPConnectionClientResponseTime", " enableTelemetry=YES {XID:0x%X, connectionID:%@, responseSize:%zu, linkType:%s, highPriority:%d, peer:%@, signpost.description:end_time}", buf, 0x36u);
  }

  v18 = (CUPairingStream *)objc_alloc_init(MEMORY[0x1E0D1B490]);
  if (v30)
  {
    v78[0] = v73;
    v78[1] = v70;
    v53 = (void *)MEMORY[0x1E0C99D20];
    v54 = (void **)v78;
    v55 = 2;
  }
  else
  {
    v77 = v73;
    v53 = (void *)MEMORY[0x1E0C99D20];
    v54 = &v77;
    v55 = 1;
  }
  objc_msgSend(v53, "arrayWithObjects:count:", v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUPairingStream setDataArray:](v18, "setDataArray:", v56);

  v17 = v68;
  -[CUReadWriteRequestable writeWithRequest:](v68, "writeWithRequest:", v18);
  v16 = v65;
LABEL_53:
  if (v72)
  {
    v57 = self->_ucat->var0;
    if (v57 <= 90 && (v57 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4
{
  uint64_t v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int var0;
  const char *v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  const char *v20;
  id v21;
  unint64_t v22;
  int v23;
  void *v24;
  _QWORD v25[3];

  v4 = a3;
  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v23 = v4;
  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (!(v7 >> 24))
  {
    BYTE1(v23) = BYTE2(v7);
    BYTE2(v23) = BYTE1(v7);
    HIBYTE(v23) = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v23, 4);
    var0 = self->_ucat->var0;
    if (var0 > 9 || var0 == -1 && !_LogCategory_Initialize())
    {
LABEL_37:
      v12 = objc_alloc_init(MEMORY[0x1E0D1B490]);
      if (v8)
      {
        v25[0] = v9;
        v25[1] = v6;
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = (void **)v25;
        v15 = 2;
      }
      else
      {
        v24 = v9;
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = &v24;
        v15 = 1;
      }
      objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v19, v20, v21, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDataArray:", v16);

      -[CUReadWriteRequestable writeWithRequest:](self->_requestable, "writeWithRequest:", v12);
      v17 = 0;
      goto LABEL_41;
    }
    if ((int)v4 <= 47)
    {
      v11 = "Invalid";
      switch((int)v4)
      {
        case 0:
          goto LABEL_36;
        case 1:
          v11 = "NoOp";
          break;
        case 3:
          v11 = "PS_Start";
          break;
        case 4:
          v11 = "PS_Next";
          break;
        case 5:
          v11 = "PV_Start";
          break;
        case 6:
          v11 = "PV_Next";
          break;
        case 7:
          v11 = "U_OPACK";
          break;
        case 8:
          v11 = "E_OPACK";
          break;
        case 9:
          v11 = "P_OPACK";
          break;
        case 10:
          v11 = "PA_Req";
          break;
        case 11:
          v11 = "PA_Rsp";
          break;
        case 16:
          v11 = "SessionStartRequest";
          break;
        case 17:
          v11 = "SessionStartResponse";
          break;
        case 18:
          v11 = "SessionData";
          break;
        case 32:
          v11 = "FamilyIdentityRequest";
          break;
        case 33:
          v11 = "FamilyIdentityResponse";
          break;
        case 34:
          v11 = "FamilyIdentityUpdate";
          break;
        default:
          goto LABEL_35;
      }
      goto LABEL_36;
    }
    if ((int)v4 <= 63)
    {
      if ((_DWORD)v4 == 48)
      {
        v11 = "WatchIdentityRequest";
        goto LABEL_36;
      }
      if ((_DWORD)v4 == 49)
      {
        v11 = "WatchIdentityResponse";
        goto LABEL_36;
      }
    }
    else
    {
      switch((_DWORD)v4)
      {
        case '@':
          v11 = "FriendIdentityRequest";
          goto LABEL_36;
        case 'A':
          v11 = "FriendIdentityResponse";
          goto LABEL_36;
        case 'B':
          v11 = "FriendIdentityUpdate";
LABEL_36:
          v21 = v6;
          v22 = v8;
          v19 = v4;
          v20 = v11;
          LogPrintF();
          goto LABEL_37;
      }
    }
LABEL_35:
    v11 = "?";
    goto LABEL_36;
  }
  RPErrorF();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = self->_ucat->var0;
    if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_41:

}

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4;
  void *v6;
  int var0;
  int v8;

  v4 = a3;
  v8 = 0;
  v6 = (void *)MEMORY[0x1AF45B698](a4, 0, &v8);
  if (v6)
  {
    -[RPConnection _sendFrameType:body:](self, "_sendFrameType:body:", v4, v6);
  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      RPFrameTypeToString(v4);
      LogPrintF();
    }
  }

}

- (void)sendReachabilityProbe:(const char *)a3
{
  int var0;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[RPConnection _sendFrameType:body:](self, "_sendFrameType:body:", 1, 0);
}

- (void)processSendsUsingConnection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int var0;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  id v36;

  v36 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableArray firstObject](self->_sendArray, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", 0);
      objc_msgSend(v5, "options");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.0;
      v8 = 0.0;
      if (v6)
      {
        objc_msgSend(v5, "options");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionaryGetDouble();
        v8 = v10;

      }
      objc_msgSend(v5, "timer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && v8 > 0.0)
      {
        mach_absolute_time();
        objc_msgSend(v5, "queueTicks");
        UpTicksToSecondsF();
        v13 = v8 - v12;
        if (v13 > 1.0)
          v7 = v13;
        else
          v7 = 1.0;
        objc_msgSend(v5, "options");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("timeoutSeconds"));

        objc_msgSend(v5, "setOptions:", v15);
        objc_msgSend(v5, "timer");
        v17 = objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v17);

        objc_msgSend(v5, "setTimer:", 0);
      }
      objc_msgSend(v5, "requestID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v5, "requestID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "label");
          v35 = v7;
          v33 = v20;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        objc_msgSend(v5, "requestID", v33, v34, *(_QWORD *)&v35);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "request");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v5, "xpcID");
        objc_msgSend(v5, "options");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "responseHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "sendEncryptedRequestID:request:xpcID:options:responseHandler:", v24, v25, v26, v27, v28);

      }
      else
      {
        objc_msgSend(v5, "eventID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = self->_ucat->var0;
        if (v21)
        {
          if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v5, "eventID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "label");
            v33 = v23;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

          }
          objc_msgSend(v5, "eventID", v33, v34);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "eventData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "options");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "completion");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "sendEncryptedEventID:data:xid:options:completion:", v29, v30, 0, v31, v32);

        }
        else if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }

      -[NSMutableArray firstObject](self->_sendArray, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v5);
  }

}

- (void)_receiveStart:(id)a3 readFrame:(id *)a4 requestable:(id)a5
{
  id v8;
  id v9;
  int var0;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  RPConnection *v16;
  id v17;
  id v18;
  $738CAE1D9152FC04CF65D43528D85EB1 *v19;

  v8 = a3;
  v9 = a5;
  var0 = self->_ucat->var0;
  if (self->_flowControlReadEnabled)
  {
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    a4->var1 = 1;
    if (!v8)
      v8 = objc_alloc_init(MEMORY[0x1E0D1B428]);
    objc_msgSend(v8, "setBufferBytes:", a4);
    objc_msgSend(v8, "setBufferData:", 0);
    objc_msgSend(v8, "setMinLength:", 4);
    objc_msgSend(v8, "setMaxLength:", 4);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __52__RPConnection__receiveStart_readFrame_requestable___block_invoke;
    v15 = &unk_1E5F4FB60;
    v16 = self;
    v8 = v8;
    v17 = v8;
    v19 = a4;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v8, "setCompletion:", &v12);
    objc_msgSend(v11, "readWithRequest:", v8, v12, v13, v14, v15, v16);
    a4->var2 = 1;

  }
  else if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __52__RPConnection__receiveStart_readFrame_requestable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receiveCompletion:readFrame:requestable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_receiveCompletion:(id)a3 readFrame:(id *)a4 requestable:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int var0;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  $738CAE1D9152FC04CF65D43528D85EB1 *v28;

  v8 = a3;
  v9 = a5;
  a4->var2 = 0;
  objc_msgSend(v8, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v16 = MEMORY[0x1AF45BE48](self->_readErrorHandler);
    v17 = (void *)v16;
    if (v16)
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v10);

    goto LABEL_27;
  }
  if (!a4->var1)
  {
    v24 = 0;
    v14 = objc_msgSend(v8, "length");
    v23 = v14;
    v15 = self->_ucat->var0;
    if (v15 <= 9 && (v15 != -1 || _LogCategory_Initialize()))
    {
      v22 = v14;
      LogPrintF();
    }
    v20 = v8;
    goto LABEL_26;
  }
  v12 = self->_ucat->var0;
  v13 = (a4->var0.var1[0] << 16) | (a4->var0.var1[1] << 8) | a4->var0.var1[2];
  if (!(_DWORD)v13)
  {
    if (v12 <= 9 && (v12 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v23 = 0;
    v24 = objc_msgSend(v8, "statusFlags") & 1;
    v20 = (void *)MEMORY[0x1E0C99D50];
LABEL_26:
    objc_msgSend(v20, "data", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _receivedHeader:body:ctx:](self, "_receivedHeader:body:ctx:", a4, v21, &v23);

    -[RPConnection _receiveStart:readFrame:requestable:](self, "_receiveStart:readFrame:requestable:", v8, a4, v9);
    goto LABEL_27;
  }
  if (v12 <= 9 && (v12 != -1 || _LogCategory_Initialize()))
  {
    v22 = v13;
    LogPrintF();
  }
  a4->var1 = 0;
  objc_msgSend(v8, "setBufferBytes:", 0, v22);
  objc_msgSend(v8, "setBufferData:", 0);
  objc_msgSend(v8, "setMinLength:", v13);
  objc_msgSend(v8, "setMaxLength:", v13);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__RPConnection__receiveCompletion_readFrame_requestable___block_invoke;
  v25[3] = &unk_1E5F4FB60;
  v25[4] = self;
  v18 = v8;
  v26 = v18;
  v28 = a4;
  v19 = v9;
  v27 = v19;
  objc_msgSend(v18, "setCompletion:", v25);
  objc_msgSend(v19, "readWithRequest:", v18);
  a4->var2 = 1;

LABEL_27:
}

uint64_t __57__RPConnection__receiveCompletion_readFrame_requestable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receiveCompletion:readFrame:requestable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_receivedHeader:(id *)a3 body:(id)a4 ctx:(id *)a5
{
  id v8;
  uint64_t var0;
  int v10;
  const char *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  RPConnection *v17;
  id v18;
  uint64_t v19;
  RPConnection *v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  const char *v30;
  id v31;
  uint64_t v32;
  id v33;

  v8 = a4;
  ++self->_receivedFrameCountCurrent;
  var0 = a3->var0;
  v10 = self->_ucat->var0;
  v33 = v8;
  if (v10 > 9)
    goto LABEL_36;
  if (v10 == -1)
  {
    v12 = _LogCategory_Initialize();
    v8 = v33;
    if (!v12)
      goto LABEL_36;
  }
  if ((int)var0 <= 47)
  {
    v11 = "Invalid";
    switch((int)var0)
    {
      case 0:
        goto LABEL_35;
      case 1:
        v11 = "NoOp";
        break;
      case 3:
        v11 = "PS_Start";
        break;
      case 4:
        v11 = "PS_Next";
        break;
      case 5:
        v11 = "PV_Start";
        break;
      case 6:
        v11 = "PV_Next";
        break;
      case 7:
        v11 = "U_OPACK";
        break;
      case 8:
        v11 = "E_OPACK";
        break;
      case 9:
        v11 = "P_OPACK";
        break;
      case 10:
        v11 = "PA_Req";
        break;
      case 11:
        v11 = "PA_Rsp";
        break;
      case 16:
        v11 = "SessionStartRequest";
        break;
      case 17:
        v11 = "SessionStartResponse";
        break;
      case 18:
        v11 = "SessionData";
        break;
      case 32:
        v11 = "FamilyIdentityRequest";
        break;
      case 33:
        v11 = "FamilyIdentityResponse";
        break;
      case 34:
        v11 = "FamilyIdentityUpdate";
        break;
      default:
        goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ((int)var0 <= 63)
  {
    if ((_DWORD)var0 == 48)
    {
      v11 = "WatchIdentityRequest";
      goto LABEL_35;
    }
    if ((_DWORD)var0 == 49)
    {
      v11 = "WatchIdentityResponse";
      goto LABEL_35;
    }
LABEL_34:
    v11 = "?";
    goto LABEL_35;
  }
  if ((_DWORD)var0 == 64)
  {
    v11 = "FriendIdentityRequest";
    goto LABEL_35;
  }
  if ((_DWORD)var0 == 65)
  {
    v11 = "FriendIdentityResponse";
    goto LABEL_35;
  }
  if ((_DWORD)var0 != 66)
    goto LABEL_34;
  v11 = "FriendIdentityUpdate";
LABEL_35:
  v32 = objc_msgSend(v8, "length");
  v30 = v11;
  v31 = v33;
  v29 = var0;
  LogPrintF();
  v8 = v33;
LABEL_36:
  switch((int)var0)
  {
    case 1:
      goto LABEL_82;
    case 3:
      if (!self->_clientMode)
      {
        v17 = self;
        v18 = v8;
        v19 = 1;
        goto LABEL_61;
      }
      v14 = self->_ucat->var0;
      if (v14 <= 60)
      {
        if (v14 != -1)
          goto LABEL_80;
        v25 = _LogCategory_Initialize();
        v8 = v33;
        if (v25)
          goto LABEL_80;
      }
      goto LABEL_82;
    case 4:
      if (self->_clientMode)
      {
        -[RPConnection _clientPairSetupWithData:](self, "_clientPairSetupWithData:", v8);
      }
      else
      {
        v17 = self;
        v18 = v8;
        v19 = 0;
LABEL_61:
        -[RPConnection _serverPairSetupWithData:start:](v17, "_serverPairSetupWithData:start:", v18, v19, v29, v30, v31, v32);
      }
      goto LABEL_81;
    case 5:
      if (!self->_clientMode)
      {
        v20 = self;
        v21 = v8;
        v22 = 1;
        goto LABEL_64;
      }
      v15 = self->_ucat->var0;
      if (v15 <= 60)
      {
        if (v15 != -1)
          goto LABEL_80;
        v26 = _LogCategory_Initialize();
        v8 = v33;
        if (v26)
          goto LABEL_80;
      }
      goto LABEL_82;
    case 6:
      if (self->_clientMode)
      {
        -[RPConnection _clientPairVerifyWithData:](self, "_clientPairVerifyWithData:", v8);
      }
      else
      {
        v20 = self;
        v21 = v8;
        v22 = 0;
LABEL_64:
        -[RPConnection _serverPairVerifyWithData:start:](v20, "_serverPairVerifyWithData:start:", v21, v22, v29, v30, v31, v32);
      }
      goto LABEL_81;
    case 8:
    case 12:
      -[RPConnection _receivedHeader:encryptedObjectData:ctx:](self, "_receivedHeader:encryptedObjectData:ctx:", a3, v33, a5);
      goto LABEL_81;
    case 10:
      if (!self->_clientMode)
      {
        -[RPConnection _serverPreAuthRequestWithData:](self, "_serverPreAuthRequestWithData:", v8);
        goto LABEL_81;
      }
      v16 = self->_ucat->var0;
      if (v16 <= 60)
      {
        if (v16 != -1)
          goto LABEL_80;
        v27 = _LogCategory_Initialize();
        v8 = v33;
        if (v27)
          goto LABEL_80;
      }
      goto LABEL_82;
    case 11:
      if (self->_clientMode)
      {
        -[RPConnection _clientPreAuthResponseWithData:](self, "_clientPreAuthResponseWithData:", v8);
LABEL_81:
        v8 = v33;
        goto LABEL_82;
      }
      v23 = self->_ucat->var0;
      if (v23 <= 60)
      {
        if (v23 != -1 || (v28 = _LogCategory_Initialize(), v8 = v33, v28))
        {
LABEL_80:
          LogPrintF();
          goto LABEL_81;
        }
      }
LABEL_82:

      return;
    default:
      v13 = self->_ucat->var0;
      if (v13 > 60)
        goto LABEL_82;
      if (v13 == -1)
      {
        v24 = _LogCategory_Initialize();
        v8 = v33;
        if (!v24)
          goto LABEL_82;
      }
      objc_msgSend(v8, "length", v29, v30, v31, v32);
      goto LABEL_80;
  }
}

- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4 ctx:(id *)a5
{
  id v8;
  int var0;
  CUPairingStream *v10;
  CUPairingStream *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v8 = a4;
  var0 = a3->var0;
  v10 = self->_mainStream;
  if (var0 == 12)
  {
    v11 = self->_highPriorityStream;

    v10 = v11;
  }
  if (v10)
  {
    v24 = 0;
    -[CUPairingStream decryptData:aadBytes:aadLength:error:](v10, "decryptData:aadBytes:aadLength:error:", v8, a3, 4, &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;
    if (v12)
    {
      v14 = OPACKDecodeData();
      if (v14)
      {
        v15 = (void *)v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          RPErrorF();
          v22 = objc_claimAutoreleasedReturnValue();

          v13 = (id)v22;
          goto LABEL_9;
        }
        v16 = (void *)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, &unk_1E5F6A3A8);

        v18 = v16;
        -[RPConnection _receivedObject:ctx:](self, "_receivedObject:ctx:", v18, a5);

      }
      else
      {
        v20 = RPErrorF();
      }

    }
  }
  else
  {
    RPErrorF();
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  if (v13)
  {
    v19 = self->_ucat->var0;
    if (v19 <= 90 && (v19 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (void)_receivedObject:(id)a3 ctx:(id *)a4
{
  int Int64Ranged;
  void *v7;
  int var0;
  int v9;
  id v10;

  v10 = a3;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 3)
  {
    -[RPConnection _receivedResponse:ctx:](self, "_receivedResponse:ctx:", v10, a4);
    goto LABEL_10;
  }
  if (Int64Ranged == 2)
  {
    -[RPConnection _receivedRequest:ctx:](self, "_receivedRequest:ctx:", v10, a4);
    goto LABEL_10;
  }
  v7 = v10;
  if (Int64Ranged == 1)
  {
    -[RPConnection _receivedEvent:ctx:](self, "_receivedEvent:ctx:", v10, a4);
LABEL_10:
    v7 = v10;
    goto LABEL_11;
  }
  var0 = self->_ucat->var0;
  if (var0 <= 60)
  {
    if (var0 != -1 || (v9 = _LogCategory_Initialize(), v7 = v10, v9))
    {
      LogPrintF();
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_receivedEvent:(id)a3 ctx:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t Int64;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  int v14;
  int v15;
  int var0;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *peerAddrString;
  NSString *peerHomeKitUserIdentifier;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *selfAddrString;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSString *peerIdentifier;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void (**receivedEventHandler)(id, void *, void *, void *);
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[16];
  _QWORD v63[18];

  v63[16] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      goto LABEL_60;
    }
    Int64 = CFDictionaryGetInt64();
    NSDictionaryGetNSNumber();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");
    if (!Int64)
    {
      v12 = v8;
      if ((objc_msgSend(v12, "isEqual:", CFSTR("HIDRelay")) & 1) != 0
        || (objc_msgSend(v12, "isEqual:", CFSTR("synchSetupStateFromStereoCounterpart")) & 1) != 0
        || (objc_msgSend(v12, "isEqual:", CFSTR("_hidT")) & 1) != 0
        || objc_msgSend(v12, "isEqual:", CFSTR("_laData")))
      {

      }
      else
      {
        v47 = objc_msgSend(v12, "isEqual:", CFSTR("_siA"));

        if (!v47)
        {
          v13 = 30;
LABEL_10:
          v14 = self->_ucat->var0;
          if (v13 >= v14 && (v14 != -1 || _LogCategory_Initialize()))
          {
            v50 = objc_msgSend(v7, "count");
            peerIdentifier = self->_peerIdentifier;
            v48 = v8;
            v49 = v11;
            LogPrintF();
          }
          if (objc_msgSend(v8, "isEqual:", CFSTR("_systemInfoUpdate"), v48, v49, v50, peerIdentifier))
          {
            -[RPConnection _receivedSystemInfo:xid:](self, "_receivedSystemInfo:xid:", v7, 0);
          }
          else if (self->_receivedEventHandler)
          {
            v17 = (__CFString *)self->_peerIdentifier;
            if (!v17)
              v17 = CFSTR("?");
            v18 = v17;
            v61 = v10;
            if (objc_msgSend(v8, "isEqualToString:", CFSTR("ids-message")))
            {
              -[RPCompanionLinkDevice publicIdentifier](self->_peerDeviceInfo, "publicIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                -[RPCompanionLinkDevice publicIdentifier](self->_peerDeviceInfo, "publicIdentifier");
                v20 = objc_claimAutoreleasedReturnValue();

                v18 = (__CFString *)v20;
              }
            }
            v53 = v18;
            receivedEventHandler = (void (**)(id, void *, void *, void *))self->_receivedEventHandler;
            v62[0] = CFSTR("dlt");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_linkType);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v63[0] = v60;
            v62[1] = CFSTR("senderIDSCID");
            -[RPEndpoint idsCorrelationIdentifier](self->_peerDeviceInfo, "idsCorrelationIdentifier");
            v21 = objc_claimAutoreleasedReturnValue();
            v59 = (void *)v21;
            if (v21)
              v22 = (const __CFString *)v21;
            else
              v22 = &stru_1E5F528E0;
            v63[1] = v22;
            v62[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4->var0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v63[2] = v58;
            v62[3] = CFSTR("moreComing");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4->var1);
            v23 = objc_claimAutoreleasedReturnValue();
            v56 = (void *)v23;
            peerAddrString = (const __CFString *)self->_peerAddrString;
            peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
            if (!peerAddrString)
              peerAddrString = &stru_1E5F528E0;
            v63[3] = v23;
            v63[4] = peerAddrString;
            v62[4] = CFSTR("peerAddr");
            v62[5] = CFSTR("peerHomeKitUserIdentifier");
            if (peerHomeKitUserIdentifier)
              v26 = (const __CFString *)peerHomeKitUserIdentifier;
            else
              v26 = &stru_1E5F528E0;
            v63[5] = v26;
            v62[6] = CFSTR("peerVerifiedIdentity");
            -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
            v27 = objc_claimAutoreleasedReturnValue();
            v55 = (void *)v27;
            if (v27)
              v28 = (const __CFString *)v27;
            else
              v28 = CFSTR("?");
            selfAddrString = (const __CFString *)self->_selfAddrString;
            if (!selfAddrString)
              selfAddrString = &stru_1E5F528E0;
            v63[6] = v28;
            v63[7] = selfAddrString;
            v62[7] = CFSTR("selfAddr");
            v62[8] = CFSTR("senderAccountAltDSID");
            -[RPEndpoint accountAltDSID](self->_peerDeviceInfo, "accountAltDSID");
            v30 = objc_claimAutoreleasedReturnValue();
            v54 = (void *)v30;
            if (v30)
              v31 = (const __CFString *)v30;
            else
              v31 = &stru_1E5F528E0;
            v63[8] = v31;
            v62[9] = CFSTR("senderAccountID");
            -[RPEndpoint accountID](self->_peerDeviceInfo, "accountID");
            v32 = objc_claimAutoreleasedReturnValue();
            v52 = (void *)v32;
            if (v32)
              v33 = (const __CFString *)v32;
            else
              v33 = &stru_1E5F528E0;
            v63[9] = v33;
            v62[10] = CFSTR("senderDeviceName");
            -[RPEndpoint name](self->_peerDeviceInfo, "name");
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = (void *)v34;
            if (v34)
              v36 = (const __CFString *)v34;
            else
              v36 = &stru_1E5F528E0;
            v63[10] = v36;
            v63[11] = v18;
            v62[11] = CFSTR("senderID");
            v62[12] = CFSTR("senderIDS");
            -[RPEndpoint idsDeviceIdentifier](self->_peerDeviceInfo, "idsDeviceIdentifier");
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v37;
            if (v37)
              v39 = (const __CFString *)v37;
            else
              v39 = CFSTR("?");
            v63[12] = v39;
            v62[13] = CFSTR("senderModelID");
            -[RPEndpoint model](self->_peerDeviceInfo, "model");
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = (void *)v40;
            if (v40)
              v42 = (const __CFString *)v40;
            else
              v42 = CFSTR("?");
            v63[13] = v42;
            v62[14] = CFSTR("statusFlags");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags"));
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = (void *)v43;
            v62[15] = CFSTR("xid");
            v45 = &unk_1E5F6A3C0;
            if (v10)
              v45 = v10;
            v63[14] = v43;
            v63[15] = v45;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 16);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            receivedEventHandler[2](receivedEventHandler, v8, v7, v46);

            v10 = v61;
          }

LABEL_60:
          goto LABEL_61;
        }
      }
    }
    v13 = 10;
    goto LABEL_10;
  }
  v15 = self->_ucat->var0;
  if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_61:

}

- (void)_receivedRequest:(id)a3 ctx:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSString *label;
  NSString *peerIdentifier;
  id v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int var0;
  void (**receivedRequestHandler)(id, void *, void *, void *, _QWORD *);
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *peerAddrString;
  NSString *peerHomeKitUserIdentifier;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *selfAddrString;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void (**v63)(id, void *, void *, void *, _QWORD *);
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  BOOL v68;
  BOOL v69;
  uint64_t Int64;
  void *v71;
  void *v72;
  _QWORD v73[7];
  BOOL v74;
  BOOL v75;
  int v76;
  _QWORD v77[18];
  _QWORD v78[18];
  uint8_t buf[4];
  int v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  NSString *v84;
  __int16 v85;
  NSString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v76 = 0;
  NSDictionaryGetNSNumber();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");
  if ((_DWORD)v8)
  {
    v9 = v8;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
      {
        v72 = (void *)v11;
        Int64 = CFDictionaryGetInt64();
        v69 = Int64 != 0;
        v13 = CFDictionaryGetInt64();
        v68 = v13 != 0;
        v66 = CFDictionaryGetInt64();
        RPConnectionLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v14))
        {
          v15 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
          label = self->_label;
          peerIdentifier = self->_peerIdentifier;
          *(_DWORD *)buf = 67109890;
          v80 = v9;
          v81 = 2080;
          v82 = v15;
          v83 = 2112;
          v84 = label;
          v85 = 2112;
          v86 = peerIdentifier;
          _os_signpost_emit_with_name_impl(&dword_1AF28C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RPConnectionClientResponseTime", " enableTelemetry=YES {XID:0x%X, requestID=%{signpost.telemetry:string1}s, connectionID:%@, peer:%@, signpost.description:begin_time}", buf, 0x26u);
        }

        v18 = v10;
        v19 = v18;
        if (v13)
        {
          v20 = 10;
        }
        else if ((objc_msgSend(v18, "isEqual:", CFSTR("_ftSm")) & 1) != 0)
        {
          v20 = 9;
        }
        else
        {
          v20 = 9;
          if ((objc_msgSend(v19, "isEqual:", CFSTR("_ftLg")) & 1) == 0)
          {
            if (objc_msgSend(v19, "isEqual:", CFSTR("_ftRs")))
              v20 = 9;
            else
              v20 = 30;
          }
        }

        var0 = self->_ucat->var0;
        if (v20 >= var0 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v55 = objc_msgSend(v72, "count");
          v56 = self->_peerIdentifier;
          v53 = v19;
          v54 = v9;
          LogPrintF();
        }
        if (objc_msgSend(v19, "isEqual:", CFSTR("_ping"), v53, v54, v55, v56))
        {
          v12 = v72;
          -[RPConnection _sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:](self, "_sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:", v72, 0, v7, v19, Int64 != 0, v13 != 0);
        }
        else if (objc_msgSend(v19, "isEqual:", CFSTR("_systemInfo")))
        {
          v12 = v72;
          -[RPConnection _receivedSystemInfo:xid:](self, "_receivedSystemInfo:xid:", v72, v7);
        }
        else
        {
          receivedRequestHandler = (void (**)(id, void *, void *, void *, _QWORD *))self->_receivedRequestHandler;
          if (receivedRequestHandler)
          {
            v61 = v66 != 0;
            v77[0] = CFSTR("dlt");
            v63 = receivedRequestHandler;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_linkType);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v78[0] = v71;
            v77[1] = CFSTR("senderIDSCID");
            -[RPEndpoint idsCorrelationIdentifier](self->_peerDeviceInfo, "idsCorrelationIdentifier");
            v26 = objc_claimAutoreleasedReturnValue();
            v67 = (void *)v26;
            if (v26)
              v27 = (const __CFString *)v26;
            else
              v27 = &stru_1E5F528E0;
            v78[1] = v27;
            v77[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4->var0);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v78[2] = v65;
            v77[3] = CFSTR("chatty");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 != 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v78[3] = v64;
            v77[4] = CFSTR("moreComing");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4->var1);
            v28 = objc_claimAutoreleasedReturnValue();
            v62 = (void *)v28;
            peerAddrString = (const __CFString *)self->_peerAddrString;
            peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
            if (!peerAddrString)
              peerAddrString = &stru_1E5F528E0;
            v78[4] = v28;
            v78[5] = peerAddrString;
            v77[5] = CFSTR("peerAddr");
            v77[6] = CFSTR("peerHomeKitUserIdentifier");
            if (peerHomeKitUserIdentifier)
              v31 = (const __CFString *)peerHomeKitUserIdentifier;
            else
              v31 = &stru_1E5F528E0;
            v78[6] = v31;
            v77[7] = CFSTR("peerVerifiedIdentity");
            -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
            v32 = objc_claimAutoreleasedReturnValue();
            v60 = (void *)v32;
            if (v32)
              v33 = (const __CFString *)v32;
            else
              v33 = CFSTR("?");
            selfAddrString = (const __CFString *)self->_selfAddrString;
            if (!selfAddrString)
              selfAddrString = &stru_1E5F528E0;
            v78[7] = v33;
            v78[8] = selfAddrString;
            v77[8] = CFSTR("selfAddr");
            v77[9] = CFSTR("senderAccountAltDSID");
            -[RPEndpoint accountAltDSID](self->_peerDeviceInfo, "accountAltDSID");
            v35 = objc_claimAutoreleasedReturnValue();
            v59 = (void *)v35;
            if (v35)
              v36 = (const __CFString *)v35;
            else
              v36 = &stru_1E5F528E0;
            v78[9] = v36;
            v77[10] = CFSTR("senderAccountID");
            -[RPEndpoint accountID](self->_peerDeviceInfo, "accountID");
            v37 = objc_claimAutoreleasedReturnValue();
            v58 = (void *)v37;
            if (v37)
              v38 = (const __CFString *)v37;
            else
              v38 = &stru_1E5F528E0;
            v78[10] = v38;
            v77[11] = CFSTR("senderDeviceName");
            -[RPEndpoint name](self->_peerDeviceInfo, "name");
            v39 = objc_claimAutoreleasedReturnValue();
            v57 = (void *)v39;
            if (v39)
              v40 = (const __CFString *)v39;
            else
              v40 = &stru_1E5F528E0;
            v41 = (const __CFString *)self->_peerIdentifier;
            if (!v41)
              v41 = CFSTR("?");
            v78[11] = v40;
            v78[12] = v41;
            v77[12] = CFSTR("senderID");
            v77[13] = CFSTR("senderIDS");
            -[RPEndpoint idsDeviceIdentifier](self->_peerDeviceInfo, "idsDeviceIdentifier");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = (void *)v42;
            if (v42)
              v44 = (const __CFString *)v42;
            else
              v44 = CFSTR("?");
            v78[13] = v44;
            v77[14] = CFSTR("senderModelID");
            -[RPEndpoint model](self->_peerDeviceInfo, "model");
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = (void *)v45;
            if (v45)
              v47 = (const __CFString *)v45;
            else
              v47 = CFSTR("?");
            v78[14] = v47;
            v77[15] = CFSTR("statusFlags");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v78[15] = v48;
            v78[16] = v7;
            v77[16] = CFSTR("xid");
            v77[17] = CFSTR("_pttEligible");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v61);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v78[17] = v49;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 18);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v73[0] = MEMORY[0x1E0C809B0];
            v73[1] = 3221225472;
            v73[2] = __37__RPConnection__receivedRequest_ctx___block_invoke;
            v73[3] = &unk_1E5F4FB88;
            v73[4] = self;
            v73[5] = v19;
            v73[6] = v7;
            v74 = v69;
            v75 = v68;
            v63[2](v63, v19, v72, v50, v73);

            v12 = v72;
          }
          else
          {
            v51 = self->_ucat->var0;
            if (v51 <= 90 && (v51 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            RPErrorF();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[RPConnection _sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:](self, "_sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:", 0, v52, v7, v19, Int64 != 0, v13 != 0);

            v12 = v72;
          }
        }
      }
      else
      {
        v23 = self->_ucat->var0;
        if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
          LogPrintF();
      }

    }
    else
    {
      v22 = self->_ucat->var0;
      if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }

  }
  else
  {
    v21 = self->_ucat->var0;
    if (v21 <= 90 && (v21 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

void __37__RPConnection__receivedRequest_ctx___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 72))
  {
    v10 = **(_DWORD **)(v9 + 288);
    if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    objc_msgSend((id)v9, "_sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:", v11, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
  }

}

- (void)_receivedResponse:(id)a3 ctx:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int var0;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSString *label;
  uint64_t v23;
  NSString *v24;
  id v25;
  void *v26;
  int v27;
  void (**v28)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v29;
  int v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *peerAddrString;
  NSString *peerHomeKitUserIdentifier;
  const __CFString *v38;
  const __CFString *selfAddrString;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  NSString *peerIdentifier;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  uint64_t Int64;
  void (**v74)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD v78[15];
  _QWORD v79[15];
  uint8_t buf[4];
  int v81;
  __int16 v82;
  NSString *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  NSString *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  NSDictionaryGetNSNumber();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");
  if ((_DWORD)v8)
  {
    v9 = v8;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0, v7);
      objc_msgSend(v10, "requestID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timer");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimer:", 0);
      if (v13)
        dispatch_source_cancel(v13);
      CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
      {
        v76 = (void *)v14;
        mach_absolute_time();
        objc_msgSend(v10, "sendTicks");
        v75 = UpTicksToMilliseconds();
        RPDecodeNSError(v6);
        v77 = objc_claimAutoreleasedReturnValue();
        if (v77)
        {
          var0 = self->_ucat->var0;
          v15 = v76;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          {
            peerIdentifier = self->_peerIdentifier;
            v61 = v75;
            v58 = v9;
            v59 = v77;
            LogPrintF();
          }
          objc_msgSend(v10, "responseHandler", v58, v59, peerIdentifier, v61);
          v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v29 = (void *)v77;
          v28[2](v28, 0, 0, v77);
        }
        else
        {
          Int64 = CFDictionaryGetInt64();
          v71 = v12;
          v20 = CFDictionaryGetInt64();
          RPConnectionLog();
          v21 = objc_claimAutoreleasedReturnValue();
          v70 = v13;
          v72 = v11;
          if (os_signpost_enabled(v21))
          {
            label = self->_label;
            v23 = objc_msgSend(v10, "length");
            v24 = self->_peerIdentifier;
            *(_DWORD *)buf = 67110402;
            v81 = v9;
            v82 = 2112;
            v83 = label;
            v84 = 2048;
            v85 = v75;
            v86 = 2048;
            v87 = v23;
            v88 = 2048;
            v89 = Int64;
            v90 = 2112;
            v91 = v24;
            _os_signpost_emit_with_name_impl(&dword_1AF28C000, v21, OS_SIGNPOST_INTERVAL_END, v9, "RPConnectionSendRequestTime", " enableTelemetry=YES {XID:0x%X, connectionID:%@, rtt:%llu, requestSize:%zu, responseSize:%zu, peer:%@, signpost.description:end_time}", buf, 0x3Au);
          }

          v25 = v11;
          v26 = v25;
          if (v20)
          {
            v27 = 10;
          }
          else if ((objc_msgSend(v25, "isEqual:", CFSTR("_ftSm")) & 1) != 0)
          {
            v27 = 9;
          }
          else
          {
            v27 = 9;
            if ((objc_msgSend(v26, "isEqual:", CFSTR("_ftLg")) & 1) == 0)
            {
              if (objc_msgSend(v26, "isEqual:", CFSTR("_ftRs")))
                v27 = 9;
              else
                v27 = 30;
            }
          }

          v30 = self->_ucat->var0;
          if (v27 >= v30 && (v30 != -1 || _LogCategory_Initialize()))
          {
            v31 = objc_msgSend(v76, "count");
            v32 = self->_peerIdentifier;
            v62 = objc_msgSend(v10, "length");
            v63 = Int64;
            peerIdentifier = v32;
            v61 = v75;
            v58 = v9;
            v59 = v31;
            LogPrintF();
          }
          objc_msgSend(v10, "responseHandler", v58, v59, peerIdentifier, v61, v62, v63);
          v74 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v78[0] = CFSTR("dlt");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_linkType);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = v69;
          v78[1] = CFSTR("senderIDSCID");
          -[RPEndpoint idsCorrelationIdentifier](self->_peerDeviceInfo, "idsCorrelationIdentifier");
          v33 = objc_claimAutoreleasedReturnValue();
          v68 = (void *)v33;
          if (v33)
            v34 = (const __CFString *)v33;
          else
            v34 = &stru_1E5F528E0;
          v79[1] = v34;
          v78[2] = CFSTR("length");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4->var0);
          v35 = objc_claimAutoreleasedReturnValue();
          v67 = (void *)v35;
          peerAddrString = (const __CFString *)self->_peerAddrString;
          peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
          if (!peerAddrString)
            peerAddrString = &stru_1E5F528E0;
          v79[2] = v35;
          v79[3] = peerAddrString;
          v78[3] = CFSTR("peerAddr");
          v78[4] = CFSTR("peerHomeKitUserIdentifier");
          if (peerHomeKitUserIdentifier)
            v38 = (const __CFString *)peerHomeKitUserIdentifier;
          else
            v38 = &stru_1E5F528E0;
          selfAddrString = (const __CFString *)self->_selfAddrString;
          if (!selfAddrString)
            selfAddrString = &stru_1E5F528E0;
          v79[4] = v38;
          v79[5] = selfAddrString;
          v78[5] = CFSTR("selfAddr");
          v78[6] = CFSTR("peerVerifiedIdentity");
          -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
          v40 = objc_claimAutoreleasedReturnValue();
          v66 = (void *)v40;
          if (v40)
            v41 = (const __CFString *)v40;
          else
            v41 = CFSTR("?");
          v79[6] = v41;
          v78[7] = CFSTR("senderAccountAltDSID");
          -[RPEndpoint accountAltDSID](self->_peerDeviceInfo, "accountAltDSID");
          v42 = objc_claimAutoreleasedReturnValue();
          v65 = (void *)v42;
          if (v42)
            v43 = (const __CFString *)v42;
          else
            v43 = &stru_1E5F528E0;
          v79[7] = v43;
          v78[8] = CFSTR("senderAccountID");
          -[RPEndpoint accountID](self->_peerDeviceInfo, "accountID");
          v44 = objc_claimAutoreleasedReturnValue();
          v64 = (void *)v44;
          if (v44)
            v45 = (const __CFString *)v44;
          else
            v45 = &stru_1E5F528E0;
          v79[8] = v45;
          v78[9] = CFSTR("senderDeviceName");
          -[RPEndpoint name](self->_peerDeviceInfo, "name");
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)v46;
          if (v46)
            v48 = (const __CFString *)v46;
          else
            v48 = &stru_1E5F528E0;
          v49 = (const __CFString *)self->_peerIdentifier;
          if (!v49)
            v49 = CFSTR("?");
          v79[9] = v48;
          v79[10] = v49;
          v78[10] = CFSTR("senderID");
          v78[11] = CFSTR("senderIDS");
          -[RPEndpoint idsDeviceIdentifier](self->_peerDeviceInfo, "idsDeviceIdentifier");
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)v50;
          if (v50)
            v52 = (const __CFString *)v50;
          else
            v52 = CFSTR("?");
          v79[11] = v52;
          v78[12] = CFSTR("senderModelID");
          -[RPEndpoint model](self->_peerDeviceInfo, "model");
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v53;
          if (v53)
            v55 = (const __CFString *)v53;
          else
            v55 = CFSTR("?");
          v79[12] = v55;
          v78[13] = CFSTR("statusFlags");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v78[14] = CFSTR("xid");
          v79[13] = v56;
          v79[14] = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 15);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v76;
          ((void (**)(_QWORD, void *, void *, _QWORD))v74)[2](v74, v76, v57, 0);

          +[RPConnectionMetrics sharedMetrics](RPConnectionMetrics, "sharedMetrics");
          v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "logRequestOnLinkType:length:rtt:", self->_linkType, objc_msgSend(v10, "length") + Int64, v75);
          v12 = v71;
          v11 = v72;
          v13 = v70;
          v29 = 0;
        }

      }
      else
      {
        v19 = self->_ucat->var0;
        if (v19 <= 90 && (v19 != -1 || _LogCategory_Initialize()))
          LogPrintF();
      }

    }
    else
    {
      v18 = self->_ucat->var0;
      if (v18 <= 90 && (v18 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }

  }
  else
  {
    v17 = self->_ucat->var0;
    if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (void)_abortRequestsWithError:(id)a3
{
  id v4;
  NSMutableDictionary *requests;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  requests = self->_requests;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__RPConnection__abortRequestsWithError___block_invoke;
  v7[3] = &unk_1E5F4FBB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requests, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSMutableDictionary removeAllObjects](self->_requests, "removeAllObjects");

}

void __40__RPConnection__abortRequestsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 288);
  if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
  {
    v9 = objc_msgSend(v11, "unsignedIntValue");
    v10 = *(_QWORD *)(a1 + 40);
    LogPrintF();
  }
  objc_msgSend(v5, "timer", v9, v10);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimer:", 0);
  if (v7)
    dispatch_source_cancel(v7);
  objc_msgSend(v5, "responseHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseHandler:", 0);
  if (v8)
    v8[2](v8, 0, 0, *(_QWORD *)(a1 + 40));

}

- (void)_timeoutForSendEntry:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  int var0;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "xidObj");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPConnection _timeoutForXID:](self, "_timeoutForXID:", v4);
    goto LABEL_15;
  }
  mach_absolute_time();
  objc_msgSend(v15, "queueTicks");
  UpTicksToSecondsF();
  v6 = v5;
  v7 = -[NSMutableArray indexOfObject:](self->_sendArray, "indexOfObject:", v15);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", v7);
    var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      v11 = v15;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_13;
        v11 = v15;
      }
      objc_msgSend(v11, "requestID");
      v14 = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
LABEL_13:
    objc_msgSend(v15, "responseHandler", v13, v14);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    RPErrorF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v9)[2](v9, 0, 0, v12);

    goto LABEL_14;
  }
  v8 = self->_ucat->var0;
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v15, "requestID");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_14:

  }
LABEL_15:

}

- (void)_timeoutForXID:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int var0;
  uint64_t v8;
  int v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "unsignedIntValue");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0, v14);
    mach_absolute_time();
    objc_msgSend(v5, "sendTicks");
    UpTicksToSecondsF();
    var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      v8 = v6;
      if (var0 != -1 || _LogCategory_Initialize())
      {
        v13 = v8;
        v12 = v4;
        LogPrintF();
      }
    }
    objc_msgSend(v5, "responseHandler", v12, v13);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    RPErrorF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v10)[2](v10, 0, 0, v11);

  }
  else
  {
    v9 = self->_ucat->var0;
    if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (id)_identityProofDataClient
{
  CUPairingSession *v3;
  CUPairingSession *v4;
  int var0;
  void *v6;
  _BYTE __s[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = self->_pairVerifySession;
  v4 = v3;
  if (!v3)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if (-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](v3, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "IdentityProofClient-Salt", 24, "IdentityProofClient-Info", 24, 32, __s))
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_8;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", __s, 32);
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_9:

  return v6;
}

- (id)_identityProofDataServer
{
  CUPairingSession *v3;
  CUPairingSession *v4;
  int var0;
  void *v6;
  _BYTE __s[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = self->_pairVerifySession;
  v4 = v3;
  if (!v3)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if (-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](v3, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "IdentityProofServer-Salt", 24, "IdentityProofServer-Info", 24, 32, __s))
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_8;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", __s, 32);
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_9:

  return v6;
}

- (void)_identityProofsAdd:(id)a3 update:(BOOL)a4
{
  id v6;
  RPIdentityDaemon *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int var0;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[6];
  id v24;

  v6 = a3;
  v7 = self->_identityDaemon;
  if (v7)
  {
    if (self->_clientMode)
      -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
    else
      -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!a4)
      {
        -[RPIdentityDaemon identityOfSelfAndReturnError:](v7, "identityOfSelfAndReturnError:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v24 = 0;
          objc_msgSend(v9, "signData:error:", v8, &v24);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v24;
          var0 = self->_ucat->var0;
          if (var0 < 31 && (var0 != -1 || _LogCategory_Initialize()))
          {
            v21 = v12;
            LogPrintF();
          }
          if (v11)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("_sigRP"));

        }
        if ((self->_statusFlags & 0x8000) == 0)
        {
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __42__RPConnection__identityProofsAdd_update___block_invoke;
          v23[3] = &unk_1E5F4FBD8;
          v23[4] = self;
          v23[5] = v8;
          v14 = (void *)MEMORY[0x1AF45BE48](v23);
          -[RPIdentityDaemon getPairedIdentityWithCompletion:](v7, "getPairedIdentityWithCompletion:", v14);

        }
      }
      -[RPIdentityDaemon homeKitIdentity](v7, "homeKitIdentity", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v22 = 0;
        objc_msgSend(v15, "signData:error:", v8, &v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v22;
        v19 = self->_ucat->var0;
        if (v19 < 31 && (v19 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (v17)
        {
          objc_msgSend(v16, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("_idHKU"));

          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("_sigHKU"));
        }

      }
    }

  }
}

void __42__RPConnection__identityProofsAdd_update___block_invoke(int8x16_t *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  int8x16_t v10;

  v5 = a2;
  v6 = v5;
  if (v5 && !a3)
  {
    v7 = *(NSObject **)(a1[2].i64[0] + 544);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__RPConnection__identityProofsAdd_update___block_invoke_2;
    block[3] = &unk_1E5F4FB10;
    v9 = v5;
    v10 = vextq_s8(a1[2], a1[2], 8uLL);
    dispatch_async(v7, block);

  }
}

void __42__RPConnection__identityProofsAdd_update___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(v3, "signData:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = **(_DWORD **)(*(_QWORD *)(a1 + 48) + 288);
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
  {
    v8 = v6;
    v9 = objc_msgSend(v5, "length");
    LogPrintF();
  }
  if (v5)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("_sigPD"));
  if (objc_msgSend(v2, "count", v8, v9))
    objc_msgSend(*(id *)(a1 + 48), "sendEncryptedEventID:event:options:completion:", CFSTR("_systemInfoUpdate"), v2, 0, 0);

}

- (void)_identityProofsAddWithHomeKitUUID:(id)a3
{
  id v4;
  RPIdentityDaemon *v5;
  void *v6;
  int var0;
  _QWORD v8[6];

  v4 = a3;
  v5 = self->_identityDaemon;
  if (v5)
  {
    if (self->_clientMode)
      -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
    else
      -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke;
      v8[3] = &unk_1E5F4FBD8;
      v8[4] = self;
      v8[5] = v6;
      -[RPIdentityDaemon getPairingIdentityFromHomeWithAccessory:completion:](v5, "getPairingIdentityFromHomeWithAccessory:completion:", v4, v8);
    }

  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  _QWORD block[4];
  id v12;
  int8x16_t v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = a1[2].i64[0];
  if (!v5 || v6)
  {
    v10 = **(_DWORD **)(v8 + 288);
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    v9 = *(NSObject **)(v8 + 544);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_2;
    block[3] = &unk_1E5F4FB10;
    v12 = v5;
    v13 = vextq_s8(a1[2], a1[2], 8uLL);
    dispatch_async(v9, block);

  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  objc_msgSend(v2, "signData:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = **(_DWORD **)(*(_QWORD *)(a1 + 48) + 288);
    if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    {
      v10 = v5;
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("_idHKU"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("_sigHKU"));
    v9 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_3;
    v11[3] = &unk_1E5F4ECD0;
    v11[4] = v9;
    objc_msgSend(v9, "sendEncryptedEventID:event:options:completion:", CFSTR("_systemInfoUpdate"), v7, 0, v11);

  }
}

void __50__RPConnection__identityProofsAddWithHomeKitUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 288);
    if (v4 <= 30)
    {
      v6 = v3;
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = v6, v5))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }

}

- (void)_identityProofsVerify:(id)a3
{
  RPIdentityDaemon *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  int var0;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v4 = self->_identityDaemon;
  if (v4)
  {
    if (self->_clientMode)
      -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
    else
      -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((self->_statusFlags & 0x24000) == 0)
    {
      CFDataGetTypeID();
      CFDictionaryGetTypedValue();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v5)
      {
        if (v6)
        {
          objc_storeStrong((id *)&self->_identityKeyData, v5);
          objc_storeStrong((id *)&self->_identitySignature, v7);
          v8 = -[RPIdentityDaemon resolveIdentityTypesForSignature:data:typeFlags:](v4, "resolveIdentityTypesForSignature:data:typeFlags:", v7, v5, 3112);
          v9 = ((v8 << 11) & 0x4000 | (((v8 >> 5) & 1) << 17)) & 0xFFFFFFCFFFFFFFFFLL | ((((unint64_t)(v8 & 0xC00) >> 10) & 3) << 36);
          -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", v9 | -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags"));
          self->_statusFlags |= v9;
          var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF();
        }
      }

    }
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v5 && v11 && (self->_statusFlags & 0x8000) == 0)
    {
      -[RPIdentityDaemon resolveIdentityForSignature:data:typeFlags:error:](v4, "resolveIdentityForSignature:data:typeFlags:error:", v11, v5, 128, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x8000);
        objc_msgSend(v13, "acl");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPEndpoint setVerifiedAcl:](self->_peerDeviceInfo, "setVerifiedAcl:", v14);

        self->_statusFlags |= 0x8000uLL;
        v15 = self->_ucat->var0;
        if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
          LogPrintF();
      }

    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16 && v17)
    {
      objc_storeStrong((id *)&self->_homeKitIdentityIdentifier, v16);
      objc_storeStrong((id *)&self->_homeKitIdentitySignature, v18);
      -[RPConnection _identityProofsVerifyHomeKitSignature:identifier:](self, "_identityProofsVerifyHomeKitSignature:identifier:", v18, v16);
    }

  }
}

- (void)_identityProofsVerifyHomeKitSignature:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int var0;
  NSString *v13;
  NSString *peerHomeKitUserIdentifier;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  CUHomeKitManager *homeKitManager;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if ((self->_statusFlags & 0x80000) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[RPIdentityDaemon homeKitIdentity](self->_identityDaemon, "homeKitIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (self->_clientMode)
        -[RPConnection _identityProofDataServer](self, "_identityProofDataServer");
      else
        -[RPConnection _identityProofDataClient](self, "_identityProofDataClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v25 = 0;
        v10 = objc_msgSend(v8, "verifySignature:data:error:", v6, v9, &v25);
        v11 = v25;
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (v10)
        {
          -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") | 0x80000);
          self->_statusFlags |= 0x80000uLL;
          objc_msgSend(v8, "identifier");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          peerHomeKitUserIdentifier = self->_peerHomeKitUserIdentifier;
          self->_peerHomeKitUserIdentifier = v13;

          v15 = MEMORY[0x1AF45BE48](self->_peerUpdatedHandler);
          v16 = (void *)v15;
          if (v15)
            (*(void (**)(uint64_t))(v15 + 16))(v15);

        }
      }
    }
    else
    {
      v9 = 0;
    }

  }
  if (self->_homeKitManager)
  {
    v17 = self->_ucat->var0;
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v18 = objc_alloc_init(MEMORY[0x1E0D1B3E0]);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    objc_msgSend(v18, "setIdentifier:", v19);

    homeKitManager = self->_homeKitManager;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__RPConnection__identityProofsVerifyHomeKitSignature_identifier___block_invoke;
    v21[3] = &unk_1E5F4FC00;
    v21[4] = self;
    v22 = v7;
    v23 = v9;
    v24 = v6;
    -[CUHomeKitManager findPairedPeer:options:completion:](homeKitManager, "findPairedPeer:options:completion:", v18, 32, v21);

  }
}

void __65__RPConnection__identityProofsVerifyHomeKitSignature_identifier___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  _BYTE *v11;
  RPIdentity *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = **(_DWORD **)(a1[4] + 288);
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    v8 = (void *)a1[6];
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      v11 = (_BYTE *)a1[4];
      if (v11[320])
        objc_msgSend(v11, "_identityProofDataServer");
      else
        objc_msgSend(v11, "_identityProofDataClient");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_25;
    }
    v12 = objc_alloc_init(RPIdentity);
    objc_msgSend(v5, "publicKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPIdentity setEdPKData:](v12, "setEdPKData:", v13);

    v14 = a1[7];
    v24 = 0;
    v15 = -[RPIdentity verifySignature:data:error:](v12, "verifySignature:data:error:", v14, v9, &v24);
    v16 = v24;
    v17 = **(_DWORD **)(a1[4] + 288);
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v15)
    {
      objc_msgSend(*(id *)(a1[4] + 664), "setStatusFlags:", objc_msgSend(*(id *)(a1[4] + 664), "statusFlags") | 0x2000);
      *(_QWORD *)(a1[4] + 760) |= 0x2000uLL;
      v18 = a1[4];
      if (!*(_QWORD *)(v18 + 56))
      {
        objc_msgSend(v5, "identifierStr");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = a1[4];
        v21 = *(void **)(v20 + 56);
        *(_QWORD *)(v20 + 56) = v19;

        v18 = a1[4];
      }
      v22 = MEMORY[0x1AF45BE48](*(_QWORD *)(v18 + 680));
      v23 = (void *)v22;
      if (v22)
        (*(void (**)(uint64_t))(v22 + 16))(v22);

    }
  }
LABEL_25:

}

- (void)_idleTimerStart:(unsigned int)a3 repeat:(unsigned int)a4
{
  int var0;
  OS_dispatch_source *idleTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  _QWORD handler[6];

  self->_receivedFrameCountLast = self->_receivedFrameCountCurrent;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  idleTimer = self->_idleTimer;
  if (idleTimer)
  {
    v7 = idleTimer;
    dispatch_source_cancel(v7);
    v8 = self->_idleTimer;
    self->_idleTimer = 0;

  }
  v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v10 = self->_idleTimer;
  self->_idleTimer = v9;
  v11 = v9;

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39__RPConnection__idleTimerStart_repeat___block_invoke;
  handler[3] = &unk_1E5F4ECF8;
  handler[4] = v11;
  handler[5] = self;
  dispatch_source_set_event_handler(v11, handler);
  CUDispatchTimerSet();
  dispatch_activate(v11);

}

_QWORD *__39__RPConnection__idleTimerStart_repeat___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[10])
    return (_QWORD *)objc_msgSend(result, "_idleTimerFired");
  return result;
}

- (void)_idleTimerFired
{
  unint64_t receivedFrameCountCurrent;
  int var0;
  id v5;

  receivedFrameCountCurrent = self->_receivedFrameCountCurrent;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (receivedFrameCountCurrent == self->_receivedFrameCountLast)
  {
    RPErrorF();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[RPConnection _invalidateWithError:](self, "_invalidateWithError:", v5);

  }
  else
  {
    self->_receivedFrameCountLast = receivedFrameCountCurrent;
  }
}

- (BOOL)_receivedSystemInfo:(id)a3 xid:(id)a4
{
  id v6;
  id v7;
  unint64_t statusFlags;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int Int64;
  void *v15;
  int var0;
  __int16 Int64Ranged;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  int DeviceClass;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  RPCompanionLinkDevice *peerDeviceInfo;
  RPCloudDaemon *cloudDaemon;
  RPCompanionLinkDevice *v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  uint64_t v60;
  void *v61;
  char v62;
  RPIdentity *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void (**v69)(_QWORD, _QWORD);
  void (**sessionStartHandler)(id, _QWORD);
  id v71;
  void (**peerUpdatedHandler)(void);
  void *v73;
  uint64_t v74;
  void *v75;
  int v76;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  _QWORD v83[5];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  int v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  statusFlags = self->_statusFlags;
  v9 = statusFlags & 0x10000AE000;
  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0)
    -[RPConnection _identityProofsVerify:](self, "_identityProofsVerify:", v6);
  v97 = 0;
  if (v9)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[RPEndpoint setAccountAltDSID:](self->_peerDeviceInfo, "setAccountAltDSID:", v10);

    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[RPEndpoint setAccountID:](self->_peerDeviceInfo, "setAccountID:", v11);

    }
  }
  -[RPEndpoint setActivityLevel:](self->_peerDeviceInfo, "setActivityLevel:", CFDictionaryGetInt64Ranged());
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_storeStrong((id *)&self->_appID, v12);
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_storeStrong((id *)&self->_appInfoPeer, v13);

  Int64 = CFDictionaryGetInt64();
  v96 = 0;
  v96 = -[RPCompanionLinkDevice flags](self->_peerDeviceInfo, "flags");
  RPCompanionLinkFlagsWithUpdateBonjourFlags(&v96, Int64);
  -[RPCompanionLinkDevice setFlags:](self->_peerDeviceInfo, "setFlags:", v96);
  if (v9 || (self->_statusFlags & 0x2000000000) != 0)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 || v97 == -6756)
      -[RPConnection setServiceType:](self, "setServiceType:", v15);
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v78 = v15;
      LogPrintF();
    }
    if (v9)
    {
      Int64Ranged = CFDictionaryGetInt64Ranged();
      if (!v97)
        -[RPCompanionLinkDevice setFlags:](self->_peerDeviceInfo, "setFlags:", -[RPCompanionLinkDevice flags](self->_peerDeviceInfo, "flags") & 0xFFFFFD7F | Int64Ranged & 0x280);
    }
  }
  else
  {
    v15 = v12;
  }
  v18 = CFDictionaryGetInt64();
  if ((v18 & 0x200) != 0)
    self->_controlFlags |= v18 & 0x200;
  if (!v9)
  {
LABEL_32:
    if ((statusFlags & 0x80000) == 0)
      goto LABEL_38;
    goto LABEL_35;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v19 = objc_claimAutoreleasedReturnValue();

  if (!v19 && v97 != -6756)
  {
    v15 = 0;
    goto LABEL_32;
  }
  -[RPCompanionLinkDevice setDeviceColor:](self->_peerDeviceInfo, "setDeviceColor:", v19, v78);
  v15 = (void *)v19;
  if ((statusFlags & 0x80000) == 0)
    goto LABEL_38;
LABEL_35:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = objc_claimAutoreleasedReturnValue();

  if (v20 || v97 == -6756)
  {
    -[RPCompanionLinkDevice setRole:](self->_peerDeviceInfo, "setRole:", v20, v78);
    v15 = (void *)v20;
    if (v9)
      goto LABEL_39;
LABEL_48:
    v21 = 0;
    goto LABEL_49;
  }
  v15 = 0;
LABEL_38:
  if (!v9)
    goto LABEL_48;
LABEL_39:
  NSDictionaryGetNSUUID();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[RPCompanionLinkDevice setHomeKitIdentifier:](self->_peerDeviceInfo, "setHomeKitIdentifier:", v21);
    -[RPCompanionLinkDevice homeKitIdentifier](self->_peerDeviceInfo, "homeKitIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _identityProofsAddWithHomeKitUUID:](self, "_identityProofsAddWithHomeKitUUID:", v22);

  }
  v96 = 0;
  objc_opt_class();
  NSDictionaryGetNSArrayOfClass();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && self->_homeKitUserIdentifierHandler)
  {
    -[RPEndpoint setHomeKitUserIdentifiers:](self->_peerDeviceInfo, "setHomeKitUserIdentifiers:", v23);
    v24 = MEMORY[0x1AF45BE48](self->_homeKitUserIdentifierHandler);
    v25 = (void *)v24;
    if (v24)
      (*(void (**)(uint64_t))(v24 + 16))(v24);

  }
LABEL_49:
  if (!self->_identifierOverride)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v15 = 0;
      if (v9)
        goto LABEL_53;
LABEL_59:
      v29 = 0;
      v28 = 0;
      goto LABEL_60;
    }
    -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:", v26);
    objc_storeStrong((id *)&self->_peerIdentifier, v26);
    v15 = v26;
  }
  if (!v9)
    goto LABEL_59;
LABEL_53:
  CFStringGetTypeID();
  v27 = (id)CFDictionaryGetTypedValue();
  v28 = v27;
  v29 = v27 != 0;
  if ((statusFlags & 0x80000) == 0 || !v27)
  {
LABEL_60:
    if ((self->_statusFlags & 0x2000) != 0)
    {
      DeviceClass = GestaltGetDeviceClass();
      if (RPDeviceIsCommunal(DeviceClass))
      {
        v31 = self->_ucat->var0;
        if (v31 <= 30 && (v31 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          -[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:](self->_identityDaemon, "addSharedHomeIdentityWithRPMessage:", v6, v28);
        }
        else
        {
          -[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:](self->_identityDaemon, "addSharedHomeIdentityWithRPMessage:", v6, v78);
        }
      }
    }
    if (!v9)
      goto LABEL_92;
    goto LABEL_73;
  }
  if (!self->_pairVerifyCompleted || self->_pairVerifyIdentityType == 2)
  {
    v29 = 1;
    goto LABEL_60;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_dIRK"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_edPK")),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v33,
        v33))
  {
    v34 = self->_ucat->var0;
    if (v34 <= 30 && (v34 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPIdentityDaemon saveIdentityWithIDSDeviceID:message:error:](self->_identityDaemon, "saveIdentityWithIDSDeviceID:message:error:", v28, v6, 0, v28);
    }
    else
    {
      -[RPIdentityDaemon saveIdentityWithIDSDeviceID:message:error:](self->_identityDaemon, "saveIdentityWithIDSDeviceID:message:error:", v28, v6, 0, v78);
    }
  }
  v29 = 1;
LABEL_73:
  if (v29)
  {
    if (self->_clientMode)
    {
      -[RPCloudDaemon idsDeviceIDSelf](self->_cloudDaemon, "idsDeviceIDSelf");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqual:", v28);

      if (v36)
      {
        v37 = self->_ucat->var0;
        if (v37 <= 90 && (v37 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        -[CUBonjourDevice reconfirm](self->_bonjourPeerDevice, "reconfirm", v78);
        v41 = 0;
        goto LABEL_171;
      }
    }
    -[RPEndpoint setIdsDeviceIdentifier:](self->_peerDeviceInfo, "setIdsDeviceIdentifier:", v28, v78);
    peerDeviceInfo = self->_peerDeviceInfo;
    if (!peerDeviceInfo)
    {
      v93 = 0;
      v94 = 0;
      v95 = 0;
LABEL_83:
      cloudDaemon = self->_cloudDaemon;
      if (cloudDaemon)
      {
        -[RPCloudDaemon operatingSystemVersionForID:](cloudDaemon, "operatingSystemVersionForID:", v28);
      }
      else
      {
        v91 = 0uLL;
        v92 = 0;
      }
      v40 = self->_peerDeviceInfo;
      v89 = v91;
      v90 = v92;
      -[RPEndpoint setOperatingSystemVersion:](v40, "setOperatingSystemVersion:", &v89);
      goto LABEL_93;
    }
    -[RPEndpoint operatingSystemVersion](peerDeviceInfo, "operatingSystemVersion");
    if (!v93)
      goto LABEL_83;
LABEL_93:
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42 || v97 == -6756)
    {
      -[RPEndpoint setIdsCorrelationIdentifier:](self->_peerDeviceInfo, "setIdsCorrelationIdentifier:", v42, v78);

    }
    if (CFDictionaryGetInt64Ranged())
      -[RPCompanionLinkDevice setListeningPort:](self->_peerDeviceInfo, "setListeningPort:");
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43 || v97 == -6756)
    {
      -[RPEndpoint setMediaRemoteIdentifier:](self->_peerDeviceInfo, "setMediaRemoteIdentifier:", v43, v78);

    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44 || v97 == -6756)
    {
      -[RPEndpoint setMediaRouteIdentifier:](self->_peerDeviceInfo, "setMediaRouteIdentifier:", v44, v78);

    }
    NSDictionaryGetNSUUID();
    v45 = objc_claimAutoreleasedReturnValue();

    if (v45 || v97 == -6756)
    {
      -[RPCompanionLinkDevice setMediaSystemIdentifier:](self->_peerDeviceInfo, "setMediaSystemIdentifier:", v45, v78);
      v21 = (void *)v45;
    }
    else
    {
      v21 = 0;
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || v97 == -6756)
      -[RPCompanionLinkDevice setMediaSystemName:](self->_peerDeviceInfo, "setMediaSystemName:", v15, v78);
    else
      v15 = 0;
    v46 = CFDictionaryGetInt64Ranged();
    if (!v97)
      -[RPCompanionLinkDevice setMediaSystemRole:](self->_peerDeviceInfo, "setMediaSystemRole:", v46);
    v47 = CFDictionaryGetInt64Ranged();
    if (!v97)
      -[RPCompanionLinkDevice setMediaSystemState:](self->_peerDeviceInfo, "setMediaSystemState:", v47);
    goto LABEL_116;
  }
LABEL_92:
  if (v9)
    goto LABEL_93;
LABEL_116:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    -[RPEndpoint setModel:](self->_peerDeviceInfo, "setModel:", v48);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
    -[RPEndpoint setName:](self->_peerDeviceInfo, "setName:", v49);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
    -[RPCompanionLinkDevice setPublicIdentifier:](self->_peerDeviceInfo, "setPublicIdentifier:", v50);
  if (v9)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
      -[RPCompanionLinkDevice setRoomName:](self->_peerDeviceInfo, "setRoomName:", v51);
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
    {
      v81 = v21;
      v82 = v7;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v54 = v52;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v86;
        v80 = v9;
        while (2)
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v86 != v57)
              objc_enumerationMutation(v54);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v7 = v82;
              v9 = v80;
              goto LABEL_137;
            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
          v9 = v80;
          if (v56)
            continue;
          break;
        }
      }

      -[RPEndpoint setServiceTypes:](self->_peerDeviceInfo, "setServiceTypes:", v54);
      v7 = v82;
LABEL_137:
      v21 = v81;
    }

    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
      -[RPCompanionLinkDevice setSiriInfo:](self->_peerDeviceInfo, "setSiriInfo:", v59);

  }
  else
  {
    v51 = v50;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[RPEndpoint setSourceVersion:](self->_peerDeviceInfo, "setSourceVersion:", v15);
  if (v9)
  {
    v60 = CFDictionaryGetInt64();
    if (!v97)
      -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", v60 & 0x10000010100 | ((unint64_t)((~v60 & 0x10000080000) == 0) << 7) | -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags") & 0xFFFFFEFFFFFEFE7FLL);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
      -[RPCompanionLinkDevice setActiveUserAltDSID:](self->_peerDeviceInfo, "setActiveUserAltDSID:", v61);
    v62 = CFDictionaryGetInt64Ranged();
    if (!v97)
      -[RPCompanionLinkDevice setDeviceCapabilityFlags:](self->_peerDeviceInfo, "setDeviceCapabilityFlags:", -[RPCompanionLinkDevice deviceCapabilityFlags](self->_peerDeviceInfo, "deviceCapabilityFlags") & 0xFFFFFFFE | v62 & 1);

  }
  if ((-[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags", v78) & 0x2000000000) != 0)
  {
    v63 = objc_alloc_init(RPIdentity);
    -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPIdentity setIdentifier:](v63, "setIdentifier:", v64);

    -[RPEndpoint model](self->_peerDeviceInfo, "model");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPIdentity setModel:](v63, "setModel:", v65);

    -[RPEndpoint name](self->_peerDeviceInfo, "name");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPIdentity setName:](v63, "setName:", v66);

    -[RPIdentityDaemon updateSessionPairedIdentity:](self->_identityDaemon, "updateSessionPairedIdentity:", v63);
    -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPEndpoint setIdsDeviceIdentifier:](self->_peerDeviceInfo, "setIdsDeviceIdentifier:", v67);

    -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:", v68);

  }
  if (v7)
  {
    if (self->_internalState == 27)
    {
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __40__RPConnection__receivedSystemInfo_xid___block_invoke;
      v83[3] = &unk_1E5F4EC88;
      v83[4] = self;
      v84 = v7;
      v69 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](v83);
      sessionStartHandler = (void (**)(id, _QWORD))self->_sessionStartHandler;
      if (sessionStartHandler)
      {
        sessionStartHandler[2](sessionStartHandler, v69);
        v71 = self->_sessionStartHandler;
        self->_sessionStartHandler = 0;

      }
      else
      {
        v69[2](v69, 0);
      }

    }
    else
    {
      -[RPConnection _systeminfo](self, "_systeminfo");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPConnection _sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:](self, "_sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:", v73, 0, v7, CFSTR("_systemInfo"), 0, 0);

    }
  }
  else if (self->_state == 1)
  {
    peerUpdatedHandler = (void (**)(void))self->_peerUpdatedHandler;
    if (peerUpdatedHandler)
      peerUpdatedHandler[2]();
  }
  -[RPConnection proxyDeviceUpdateHandler](self, "proxyDeviceUpdateHandler");
  v74 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v74;
  if (v9 && v74)
    (*(void (**)(uint64_t))(v74 + 16))(v74);
  v76 = self->_ucat->var0;
  if (v76 <= 10 && (v76 != -1 || _LogCategory_Initialize()))
  {
    -[RPConnection descriptionWithLevel:](self, "descriptionWithLevel:", 10);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v41 = 1;
LABEL_171:

  return v41;
}

void __40__RPConnection__receivedSystemInfo_xid___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _DWORD **v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_systeminfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[36];
  if (v5 <= 10)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      v7 = v3;
      LogPrintF();
      v4 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v4, "_sendEncryptedResponse:error:xid:requestID:highPriority:isChatty:", v3, v8, *(_QWORD *)(a1 + 40), CFSTR("_systemInfo"), 0, 0, v7);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_run");

}

- (id)_systeminfo
{
  id v3;
  unint64_t statusFlags;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  BOOL v10;
  NSString *v11;
  NSDictionary *v12;
  void *v13;
  uint64_t v14;
  NSString *p_isa;
  int var0;
  __int16 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int DeviceClass;
  __CFString *v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  id v54;
  NSString *serviceType;
  unint64_t v57;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  statusFlags = self->_statusFlags;
  v5 = statusFlags & 0x10000AE000;
  -[RPEndpoint accountAltDSID](self->_localDeviceInfo, "accountAltDSID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((statusFlags & 0x10000AE000) != 0 && v6 != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_accAltDSID"));
  -[RPEndpoint accountID](self->_localDeviceInfo, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_accID"));
  v11 = self->_appID;

  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("_appID"));
  v12 = self->_appInfoSelf;

  if (v12)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("_appInfo"));
  v57 = 0;
  RPBonjourFlagsUpdateWithRPCompanionLinkFlags(&v57, -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v57);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("_bf"));

  if (v5 || (self->_statusFlags & 0x2000000000) != 0)
  {
    p_isa = self->_serviceType;

    if (p_isa)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", p_isa, CFSTR("_clSrv"));
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      serviceType = self->_serviceType;
      LogPrintF();
    }
    if (v5)
    {
      v17 = -[RPCompanionLinkDevice flags](self->_localDeviceInfo, "flags");
      v14 = v17 & 0x280;
      if ((v17 & 0x280) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("_clFl"));

      }
    }
  }
  else
  {
    p_isa = (NSString *)&v12->super.isa;
  }
  if ((self->_controlFlags & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_controlFlags & 0x200);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("_cf"));

  }
  if (v5)
  {
    -[RPCompanionLinkDevice deviceColor](self->_localDeviceInfo, "deviceColor", v14);
    v20 = objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      p_isa = 0;
      if ((statusFlags & 0x80000) == 0)
        goto LABEL_38;
      goto LABEL_33;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("_dC"));
    p_isa = (NSString *)v20;
  }
  if ((statusFlags & 0x80000) == 0)
    goto LABEL_38;
LABEL_33:
  -[RPCompanionLinkDevice role](self->_localDeviceInfo, "role", v14, serviceType);
  v21 = objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("_forcedRole"));
    p_isa = (NSString *)v21;
  }
  else
  {
    p_isa = 0;
  }
LABEL_38:
  if (v5)
  {
    -[RPCompanionLinkDevice homeKitIdentifier](self->_localDeviceInfo, "homeKitIdentifier", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("_hkID"));
    -[RPEndpoint homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers", serviceType);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[RPEndpoint homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("_hkUID"));

    }
    if (self->_btPipe)
    {
      DeviceClass = GestaltGetDeviceClass();
      v26 = CFSTR("BTPipe-Phone");
      if (DeviceClass == 6)
        v26 = CFSTR("BTPipe-Watch");
      p_isa = v26;

      goto LABEL_48;
    }
    -[RPEndpoint identifier](self->_localDeviceInfo, "identifier");
    p_isa = (NSString *)objc_claimAutoreleasedReturnValue();

    if (p_isa)
LABEL_48:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", p_isa, CFSTR("_i"));
  }
  if ((statusFlags & 0x80000) != 0 && self->_pairVerifyCompleted && self->_pairVerifyIdentityType != 2)
  {
    v29 = self->_ucat->var0;
    if (v29 > 30 || v29 == -1 && !_LogCategory_Initialize())
      goto LABEL_63;
LABEL_59:
    LogPrintF();
LABEL_63:
    -[RPIdentityDaemon addSelfIdentityInfoToMessage:flags:](self->_identityDaemon, "addSelfIdentityInfoToMessage:flags:", v3, 0, serviceType);
    goto LABEL_64;
  }
  if ((self->_statusFlags & 0x2000) != 0)
  {
    v27 = GestaltGetDeviceClass();
    if (!RPDeviceIsCommunal(v27))
    {
      v28 = self->_ucat->var0;
      if (v28 > 30 || v28 == -1 && !_LogCategory_Initialize())
        goto LABEL_63;
      goto LABEL_59;
    }
  }
LABEL_64:
  if (v5)
  {
    -[RPEndpoint idsDeviceIdentifier](self->_localDeviceInfo, "idsDeviceIdentifier", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("_idsID"));
    -[RPEndpoint idsCorrelationIdentifier](self->_localDeviceInfo, "idsCorrelationIdentifier", serviceType);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("_idsCID"));
    v32 = -[RPCompanionLinkDevice listeningPort](self->_localDeviceInfo, "listeningPort");
    if ((_DWORD)v32)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("_lP"));

    }
    -[RPEndpoint mediaRemoteIdentifier](self->_localDeviceInfo, "mediaRemoteIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("_mrID"));
    -[RPEndpoint mediaRouteIdentifier](self->_localDeviceInfo, "mediaRouteIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("_mRtID"));
    -[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("_msId"));
    -[RPCompanionLinkDevice mediaSystemName](self->_localDeviceInfo, "mediaSystemName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("_msNm"));
    v38 = -[RPCompanionLinkDevice mediaSystemRole](self->_localDeviceInfo, "mediaSystemRole");
    if ((_DWORD)v38)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("_msRo"));

    }
    v40 = -[RPCompanionLinkDevice mediaSystemState](self->_localDeviceInfo, "mediaSystemState");
    if ((_DWORD)v40)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("_msSt"));

    }
    -[RPCompanionLinkDevice activeUserAltDSID](self->_localDeviceInfo, "activeUserAltDSID");
    p_isa = (NSString *)objc_claimAutoreleasedReturnValue();

    if (p_isa)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", p_isa, CFSTR("_aaltDSID"));
    v42 = -[RPCompanionLinkDevice deviceCapabilityFlags](self->_localDeviceInfo, "deviceCapabilityFlags");
    if ((_DWORD)v42)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("_dCapF"));

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("model"), serviceType);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
  {
    -[RPEndpoint model](self->_localDeviceInfo, "model");
    v45 = objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("model"));
      p_isa = (NSString *)v45;
    }
    else
    {
      p_isa = 0;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    v47 = GestaltCopyAnswer();

    if (v47)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("name"));
      p_isa = (NSString *)v47;
    }
    else
    {
      p_isa = 0;
    }
  }
  -[RPCompanionLinkDevice publicIdentifier](self->_localDeviceInfo, "publicIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("_pubID"));
  if (v5)
  {
    -[RPCompanionLinkDevice roomName](self->_localDeviceInfo, "roomName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("_roomName"));
    -[RPEndpoint serviceTypes](self->_localDeviceInfo, "serviceTypes");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("_stA"));
    -[RPCompanionLinkDevice siriInfo](self->_localDeviceInfo, "siriInfo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("_siriInfo"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("602.1"), CFSTR("_sv"));
  if (self->_pairVerifyIdentityType == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[RPEndpoint activityLevel](self->_localDeviceInfo, "activityLevel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("_actLvl"));

  }
  if (v5)
  {
    v52 = -[RPEndpoint statusFlags](self->_localDeviceInfo, "statusFlags") & 0x10000010100;
    if (v52)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("_sf"));

    }
  }
  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0)
    -[RPConnection _identityProofsAdd:update:](self, "_identityProofsAdd:update:", v3, 0);
  v54 = v3;

  return v54;
}

- (id)_allowedMACAddressesForMCFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((Class)getMCProfileConnectionClass[0](), "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveValuesForUnionSetting:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(objc_retainAutorelease(v12), "UTF8String")
            && !TextToHardwareAddress())
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v15, 6);
            objc_msgSend(v6, "addObject:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_configureForSessionPairing:(id)a3
{
  id v4;
  RPIdentityDaemon *v5;
  int var0;
  uint64_t v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];

  v4 = a3;
  v5 = self->_identityDaemon;
  if (v5)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__RPConnection__configureForSessionPairing___block_invoke;
    v10[3] = &unk_1E5F4FC28;
    v10[4] = v5;
    v10[5] = self;
    objc_msgSend(v4, "setCopyIdentityHandler:", v10);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __44__RPConnection__configureForSessionPairing___block_invoke_2;
    v9[3] = &unk_1E5F4FC50;
    v9[4] = self;
    v9[5] = v5;
    objc_msgSend(v4, "setFindPeerHandler:", v9);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __44__RPConnection__configureForSessionPairing___block_invoke_3;
    v8[3] = &unk_1E5F4FC78;
    v8[4] = self;
    v8[5] = v5;
    objc_msgSend(v4, "setSavePeerHandler:", v8);
  }

}

id __44__RPConnection__configureForSessionPairing___block_invoke(uint64_t a1, char a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v6, "identityOfSelfAndReturnError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    v10 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 288);
    if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v11 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D1B3E8]);
    objc_msgSend(*(id *)(a1 + 32), "sessionPairingIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifier:", v12);

    objc_msgSend(v7, "deviceIRKData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAltIRK:", v13);

    objc_msgSend(v7, "edPKData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPublicKey:", v14);

    if ((a2 & 2) != 0)
    {
      objc_msgSend(v7, "edSKData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSecretKey:", v15);

    }
  }

  return v11;
}

uint64_t __44__RPConnection__configureForSessionPairing___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 288);
  if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
  {
    v26 = v7;
    v27 = a3;
    LogPrintF();
  }
  v9 = *(void **)(a1 + 40);
  v34 = 0;
  objc_msgSend(v9, "identitiesOfType:error:", 13, &v34, v26, v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v34;
  v12 = v11;
  if (v11)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = v10;
    v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v16)
    {
      v28 = v10;
      v29 = v7;
      v17 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqual:", v14);

          if (v21)
          {
            v16 = v19;
            goto LABEL_18;
          }
        }
        v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v16)
          continue;
        break;
      }
LABEL_18:
      v10 = v28;
      v7 = v29;
    }

    if (!a4 || v16)
    {
      objc_msgSend(v16, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "setName:", v22);

      objc_msgSend(v16, "model");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "setModel:", v23);

      objc_msgSend(v16, "edPKData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "setPublicKey:", v24);

    }
    else
    {
      RPErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return 0;
}

BOOL __44__RPConnection__configureForSessionPairing___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  RPIdentity *v5;
  void *v6;

  v3 = a2;
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 288);
  if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v5 = -[RPIdentity initWithPairedPeer:type:]([RPIdentity alloc], "initWithPairedPeer:type:", v3, 13);
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setStatusFlags:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "statusFlags") | 0x2000000000);
    -[RPIdentity identifier](v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "setVerifiedIdentity:", v6);

    objc_msgSend(*(id *)(a1 + 40), "addSessionPairedIdentity:", v5);
  }

  return v5 != 0;
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedMACAddresses, a3);
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
  objc_storeStrong((id *)&self->_pairSetupACL, a3);
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSDictionary)appInfoPeer
{
  return self->_appInfoPeer;
}

- (NSDictionary)appInfoSelf
{
  return self->_appInfoSelf;
}

- (void)setAppInfoSelf:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (int64_t)bleClientUseCase
{
  return self->_bleClientUseCase;
}

- (void)setBleClientUseCase:(int64_t)a3
{
  self->_bleClientUseCase = a3;
}

- (CUBLEConnection)bleConnection
{
  return self->_bleConnection;
}

- (void)setBleConnection:(id)a3
{
  objc_storeStrong((id *)&self->_bleConnection, a3);
}

- (NSUUID)blePeerIdentifier
{
  return self->_blePeerIdentifier;
}

- (void)setBlePeerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (unsigned)bleConnectionPSM
{
  return self->_bleConnectionPSM;
}

- (void)setBleConnectionPSM:(unsigned __int16)a3
{
  self->_bleConnectionPSM = a3;
}

- (CUBonjourDevice)bonjourPeerDevice
{
  return self->_bonjourPeerDevice;
}

- (void)setBonjourPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourPeerDevice, a3);
}

- (CUBluetoothScalablePipe)btPipe
{
  return self->_btPipe;
}

- (void)setBtPipe:(id)a3
{
  objc_storeStrong((id *)&self->_btPipe, a3);
}

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong(&self->_client, a3);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (BOOL)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(BOOL)a3
{
  self->_clientMode = a3;
}

- (RPCloudDaemon)cloudDaemon
{
  return self->_cloudDaemon;
}

- (void)setCloudDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_cloudDaemon, a3);
}

- (id)configurePairingHandler
{
  return self->_configurePairingHandler;
}

- (void)setConfigurePairingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (BOOL)flowControlReadEnabled
{
  return self->_flowControlReadEnabled;
}

- (id)flowControlWriteChangedHandler
{
  return self->_flowControlWriteChangedHandler;
}

- (void)setFlowControlWriteChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (RPIdentity)forcedPeerIdentity
{
  return self->_forcedPeerIdentity;
}

- (void)setForcedPeerIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_forcedPeerIdentity, a3);
}

- (RPIdentity)forcedSelfIdentity
{
  return self->_forcedSelfIdentity;
}

- (void)setForcedSelfIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_forcedSelfIdentity, a3);
}

- (CUHomeKitManager)homeKitManager
{
  return self->_homeKitManager;
}

- (void)setHomeKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitManager, a3);
}

- (id)homeKitUserIdentifierHandler
{
  return self->_homeKitUserIdentifierHandler;
}

- (void)setHomeKitUserIdentifierHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (NSString)identifierOverride
{
  return self->_identifierOverride;
}

- (void)setIdentifierOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (RPIdentityDaemon)identityDaemon
{
  return self->_identityDaemon;
}

- (void)setIdentityDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_identityDaemon, a3);
}

- (RPIdentity)identityResolved
{
  return self->_identityResolved;
}

- (void)setIdentityResolved:(id)a3
{
  objc_storeStrong((id *)&self->_identityResolved, a3);
}

- (RPIdentity)identityVerified
{
  return self->_identityVerified;
}

- (BOOL)invalidationHandled
{
  return self->_invalidationHandled;
}

- (void)setInvalidationHandled:(BOOL)a3
{
  self->_invalidationHandled = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (int)keepAliveSeconds
{
  return self->_keepAliveSeconds;
}

- (void)setKeepAliveSeconds:(int)a3
{
  self->_keepAliveSeconds = a3;
}

- (NSString)label
{
  return self->_label;
}

- (int)linkType
{
  return self->_linkType;
}

- (RPCompanionLinkDevice)localDeviceInfo
{
  return self->_localDeviceInfo;
}

- (void)setLocalDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceInfo, a3);
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNetLinkManager:(id)a3
{
  objc_storeStrong((id *)&self->_netLinkManager, a3);
}

- (int)pairVerifyAuthType
{
  return self->_pairVerifyAuthType;
}

- (id)pairVerifyCompletion
{
  return self->_pairVerifyCompletion;
}

- (void)setPairVerifyCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSString)peerAddrString
{
  return self->_peerAddrString;
}

- (RPCompanionLinkDevice)peerDeviceInfo
{
  return self->_peerDeviceInfo;
}

- (NSString)peerHomeKitUserIdentifier
{
  return self->_peerHomeKitUserIdentifier;
}

- (NSString)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (id)peerUpdatedHandler
{
  return self->_peerUpdatedHandler;
}

- (void)setPeerUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (BOOL)preAuthEnabled
{
  return self->_preAuthEnabled;
}

- (void)setPreAuthEnabled:(BOOL)a3
{
  self->_preAuthEnabled = a3;
}

- (int)preferredIdentityType
{
  return self->_preferredIdentityType;
}

- (void)setPreferredIdentityType:(int)a3
{
  self->_preferredIdentityType = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (id)proxyDeviceUpdateHandler
{
  return self->_proxyDeviceUpdateHandler;
}

- (void)setProxyDeviceUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (id)readErrorHandler
{
  return self->_readErrorHandler;
}

- (void)setReadErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 720);
}

- (NSMutableArray)receivedMessages
{
  return self->_receivedMessages;
}

- (void)setReceivedMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 728);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 736);
}

- (id)sessionStartHandler
{
  return self->_sessionStartHandler;
}

- (void)setSessionStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 744);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (CUTCPConnection)tcpConnection
{
  return self->_tcpConnection;
}

- (void)setTcpConnection:(id)a3
{
  objc_storeStrong((id *)&self->_tcpConnection, a3);
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (NSMutableArray)proxyDevices
{
  return self->_proxyDevices;
}

- (void)setProxyDevices:(id)a3
{
  objc_storeStrong((id *)&self->_proxyDevices, a3);
}

- (CUBluetoothScalablePipe)btPipeHighPriority
{
  return self->_btPipeHighPriority;
}

- (void)setBtPipeHighPriority:(id)a3
{
  objc_storeStrong((id *)&self->_btPipeHighPriority, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btPipeHighPriority, 0);
  objc_storeStrong((id *)&self->_proxyDevices, 0);
  objc_storeStrong((id *)&self->_tcpConnection, 0);
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_sessionStartHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_receivedMessages, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedEventHandler, 0);
  objc_storeStrong(&self->_readErrorHandler, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong(&self->_proxyDeviceUpdateHandler, 0);
  objc_storeStrong(&self->_peerUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDeviceInfo, 0);
  objc_storeStrong(&self->_pairVerifyCompletion, 0);
  objc_storeStrong((id *)&self->_netLinkManager, 0);
  objc_storeStrong((id *)&self->_localDeviceInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identityVerified, 0);
  objc_storeStrong((id *)&self->_identityResolved, 0);
  objc_storeStrong((id *)&self->_identityDaemon, 0);
  objc_storeStrong((id *)&self->_identifierOverride, 0);
  objc_storeStrong(&self->_homeKitUserIdentifierHandler, 0);
  objc_storeStrong((id *)&self->_homeKitManager, 0);
  objc_storeStrong((id *)&self->_forcedSelfIdentity, 0);
  objc_storeStrong((id *)&self->_forcedPeerIdentity, 0);
  objc_storeStrong(&self->_flowControlWriteChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);
  objc_storeStrong(&self->_configurePairingHandler, 0);
  objc_storeStrong((id *)&self->_cloudDaemon, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong(&self->_client, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
  objc_storeStrong((id *)&self->_bonjourPeerDevice, 0);
  objc_storeStrong((id *)&self->_blePeerIdentifier, 0);
  objc_storeStrong((id *)&self->_bleConnection, 0);
  objc_storeStrong((id *)&self->_appInfoSelf, 0);
  objc_storeStrong((id *)&self->_appInfoPeer, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_sendArray, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_requestable, 0);
  objc_storeStrong((id *)&self->_pairVerifySession, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_storeStrong((id *)&self->_mainStream, 0);
  objc_storeStrong((id *)&self->_homeKitIdentitySignature, 0);
  objc_storeStrong((id *)&self->_homeKitIdentityIdentifier, 0);
  objc_storeStrong((id *)&self->_highPriorityStream, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_startTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_probeTimer, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_selfAddrString, 0);
  objc_storeStrong((id *)&self->_peerHomeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_peerAddrString, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_identitySignature, 0);
  objc_storeStrong((id *)&self->_identityKeyData, 0);
}

@end
