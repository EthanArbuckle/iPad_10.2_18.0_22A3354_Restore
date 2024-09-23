@implementation NRLinkWired

- (id)copyStatusString
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NEVirtualInterface_s *virtualInterface;
  void *v8;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "nrUUID", self->super._nrUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "localInterfaceName", v6);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "listenerPortString", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassC", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v8 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "virtualInterfaceName", v8);

  }
  return v5;
}

- (void)invalidateLink
{
  void *v3;
  uint64_t v4;
  void *v5;
  NRCompanionProxyAgent *companionProxyAgent;
  NRCompanionProxyAgent *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NRLinkWired;
  -[NRLink invalidateLink](&v14, "invalidateLink");
  -[NRLinkWired invalidateIKESessionClassD](self, "invalidateIKESessionClassD");
  -[NRLinkWired invalidateIKESessionClassC](self, "invalidateIKESessionClassC");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeListener](self, "ikeListener"));

  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeListener](self, "ikeListener"));
    objc_msgSend(v5, "cancel");

    -[NRLinkWired setIkeListener:](self, "setIkeListener:", 0);
  }
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_10005DA9C((uint64_t)companionProxyAgent, v4);
    -[NRLink reportEvent:](self, "reportEvent:", 12003);
    v7 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired pairingClient](self, "pairingClient"));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NRLinkWired pairingClient](self, "pairingClient"));
    v10 = (void *)v9;
    if (v9)
    {
      sub_100006CA0(v9);
      sub_100006684((uint64_t)v10, 6, 0);
    }

    -[NRLinkWired setPairingClient:](self, "setPairingClient:", 0);
  }
  -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired pathEvaluator](self, "pathEvaluator"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired pathEvaluator](self, "pathEvaluator"));
    nw_path_evaluator_cancel(v12, v13);

    -[NRLinkWired setPathEvaluator:](self, "setPathEvaluator:", 0);
  }
}

- (id)copyDescriptionInner
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)NRLinkWired;
  v4 = -[NRLink copyDescriptionInner](&v9, "copyDescriptionInner");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@, %@ -> %@"), v4, v5, v6);

  return v7;
}

- (unsigned)metric
{
  return 40;
}

- (BOOL)start
{
  char *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int IsLevelEnabled;
  uint64_t v18;
  id v19;

  if (-[NRLink state](self, "state") == 8)
  {
    v3 = (char *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v3, "linkIsReady:", self);
LABEL_3:

    return 1;
  }
  if (-[NRLink startRequested](self, "startRequested"))
    return 1;
  -[NRLink setStartRequested:](self, "setStartRequested:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));

  if (!v5)
  {
    v16 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    IsLevelEnabled = _NRLogIsLevelEnabled(v16, 17);

    if (!IsLevelEnabled)
      return 0;
    v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
    v19 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v13, 17, "%@: Cannot start Wi-Fi link without local interface name", v19);

    goto LABEL_15;
  }
  if (-[NRLink state](self, "state") != 1)
  {
    v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    v11 = _NRLogIsLevelEnabled(v10, 17);

    if (!v11)
      return 0;
    v13 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
    v14 = -[NRLink copyDescription](self, "copyDescription");
    v15 = sub_10010E200(-[NRLink state](self, "state"));
    _NRLogWithArgs(v13, 17, "%@: Cannot start link in state %@", v14, v15);

LABEL_15:
    return 0;
  }
  -[NRLink reportEvent:](self, "reportEvent:", 3001);
  -[NRLink updateIKEv2Role:](self, "updateIKEv2Role:", &self->_isIKEResponder);
  if (-[NRLinkWired isIKEResponder](self, "isIKEResponder")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint")),
        v8,
        v8))
  {
    v9 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->super._nrUUID);
    v3 = v9;
    if (v9 && v9[12])
      -[NRLinkWired initiateConnection](self, "initiateConnection");
    else
      -[NRLinkWired initiatePairing](self, "initiatePairing");
    goto LABEL_3;
  }
  -[NRLinkWired cancelWithReason:](self, "cancelWithReason:", CFSTR("No remote outer endpoint present"));
  return 0;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  id v12;
  id v14;
  int v15;
  uint64_t v16;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v16);
    -[NRLink reportEvent:details:](self, "reportEvent:details:", 3005, v5);
    if (-[NRLink changeStateTo:](self, "changeStateTo:", 255))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      objc_msgSend(v7, "linkIsUnavailable:", self);

      -[NRLinkWired invalidateLink](self, "invalidateLink");
    }
    else
    {
      v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
      IsLevelEnabled = _NRLogIsLevelEnabled(v8, 1);

      if (IsLevelEnabled)
      {
        v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
        v12 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v11, 1, "%s%.30s:%-4d %@: link already cancelled: %@", ", "-[NRLinkWired cancelWithReason:]", 191, v12, self);

      }
    }
  }
  else
  {
    v14 = sub_1000C46B8();
    v15 = _NRLogIsLevelEnabled(v14, 17);

    if (!v15)
      goto LABEL_7;
    v5 = sub_1000C46B8();
    _NRLogWithArgs(v5, 17, "%s called with null reasonFormat", "-[NRLinkWired cancelWithReason:]");
  }

LABEL_7:
  return v4 != 0;
}

- (void)initiatePairing
{
  char *v3;
  NRPairingParameters *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  void *v15;
  char IsLevelEnabled;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;

  v3 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->super._nrUUID);
  v4 = objc_alloc_init(NRPairingParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
  if (v4)
    objc_storeStrong((id *)&v4->_localInterfaceName, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  if (v4)
    objc_storeStrong((id *)&v4->_localEndpoint, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
  v8 = v7;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_remoteEndpoint, v7);

    v4->_isResponder = self->_isIKEResponder;
  }
  else
  {

  }
  objc_initWeak(&location, self);
  v9 = sub_10000BD14((id *)[NRPairingClient alloc], self->super._queue, self->super._nrUUID, (__objc2_prot *)v4);
  objc_initWeak(&from, v9);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C579C;
  v20[3] = &unk_1001B7268;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  v10 = v20;
  v11 = v10;
  if (v9 && !*((_BYTE *)v9 + 10))
  {
    v12 = objc_retainBlock(v10);
    v13 = v9[18];
    v9[18] = v12;

  }
  sub_10000C08C((uint64_t)v9);
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), v9);
  v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
  IsLevelEnabled = _NRLogIsLevelEnabled(v15, 0);

  if ((IsLevelEnabled & 1) != 0)
  {
    v18 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
    v19 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v18, 0, "%s%.30s:%-4d %@: initiated pairing with %@", ", "-[NRLinkWired initiatePairing]", 243, v19, v3);

  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (BOOL)initiateConnection
{
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v10;
  const __CFString *v11;
  _QWORD v12[5];

  v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 0);

  if (IsLevelEnabled)
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    v7 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v6, 0, "%s%.30s:%-4d %@: initiating connection with peer", ", "-[NRLinkWired initiateConnection]", 248, v7);

  }
  if (self->_isIKEResponder)
    goto LABEL_4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));

  if (!v10)
  {
    v11 = CFSTR("No remote outer endpoint present");
    goto LABEL_15;
  }
  if (!-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
  {
    v11 = CFSTR("failed to setup virtual interface");
LABEL_15:
    -[NRLinkWired cancelWithReason:](self, "cancelWithReason:", v11);
    return 0;
  }
LABEL_4:
  if (self->_upgradeSessionAfterFirstUnlock || !-[NRLinkWired onlyAllowClassC](self, "onlyAllowClassC"))
  {
    -[NRLinkWired setupIPsecIfNecessary:](self, "setupIPsecIfNecessary:", 4);
  }
  else
  {
    objc_opt_self(NRDKeyManager);
    if (qword_1001E4AD8 != -1)
      dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
    v8 = (id)qword_1001E4AD0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C5790;
    v12[3] = &unk_1001B8AE0;
    v12[4] = self;
    sub_10014ACE0((uint64_t)v8, v12);

  }
  return 1;
}

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = a3;
  v5 = -[NRLink peerAvailabilityCheckInProgress](self, "peerAvailabilityCheckInProgress");
  v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0);

  if (v5)
  {
    if (IsLevelEnabled)
    {
      v18 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      v10 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v18, 0, "%s%.30s:%-4d %@: peer availability check already in progress, ignoring request", ", "-[NRLinkWired checkPeerAvailabilityWithForceAggressive:]", 276, v10);

    }
  }
  else
  {
    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      v12 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d %@: peer availability check requested (aggresive: %d)", ", "-[NRLinkWired checkPeerAvailabilityWithForceAggressive:]", 279, v12, v3);

    }
    v13 = !v3;
    if (v3)
      v14 = 5;
    else
      v14 = 3;
    if (v13)
      v15 = 3000;
    else
      v15 = 1000;
    self->super._peerAvailabilityCheckInProgress = 1;
    objc_initWeak(&location, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeSessionClassC](self, "ikeSessionClassC"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000C5654;
    v19[3] = &unk_1001B7978;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v16, "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v14, v15, v17, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkWired;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", -[NRLinkWired ikeSessionPointerForDataProtectionClass:](self, "ikeSessionPointerForDataProtectionClass:", v3));
}

- (id)ikeSessionPointerForDataProtectionClass:(unsigned __int8)a3
{
  int *v3;
  id *result;
  id v5;
  int IsLevelEnabled;
  id v7;
  void *String;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NRLinkWired *v15;
  SEL v16;
  uint64_t v17;

  if (a3 == 4)
  {
    v3 = &OBJC_IVAR___NRLinkWired__ikeSessionClassD;
    return (id *)((char *)&self->super.super.isa + *v3);
  }
  if (a3 == 3)
  {
    v3 = &OBJC_IVAR___NRLinkWired__ikeSessionClassC;
    return (id *)((char *)&self->super.super.isa + *v3);
  }
  HIDWORD(v17) = a3;
  v5 = sub_1000C46B8();
  IsLevelEnabled = _NRLogIsLevelEnabled(v5, 16);

  if (IsLevelEnabled)
  {
    v7 = sub_1000C46B8();
    String = (void *)NRDataProtectionClassCreateString(HIDWORD(v17));
    _NRLogWithArgs(v7, 16, "%s%.30s:%-4d ABORTING: Cannot copy IKE session pointer for %@", ", "-[NRLinkWired ikeSessionPointerForDataProtectionClass:]", 325, String);

  }
  v9 = _os_log_pack_size(22);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __error();
  v12 = _os_log_pack_fill(v10, v9, *v11, &_mh_execute_header, "%{public}s Cannot copy IKE session pointer for %@");
  v13 = NRDataProtectionClassCreateString(HIDWORD(v17));
  *(_DWORD *)v12 = 136446466;
  *(_QWORD *)(v12 + 4) = "-[NRLinkWired ikeSessionPointerForDataProtectionClass:]";
  *(_WORD *)(v12 + 12) = 2112;
  *(_QWORD *)(v12 + 14) = v13;
  v14 = sub_1000C46B8();
  v15 = (NRLinkWired *)_NRLogAbortWithPack(v14, v10);
  -[NRLinkWired invalidateIKESessionClassD](v15, v16);
  return result;
}

- (void)invalidateIKESessionClassD
{
  -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4);
}

- (void)invalidateIKESessionClassC
{
  -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 3);
}

- (void)restartIKESessionForDataProtectionClass:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int IsLevelEnabled;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  id String;

  v3 = a3;
  String = (id)NRDataProtectionClassCreateString(a3);
  if (self->super._state == 255)
  {
    v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
    IsLevelEnabled = _NRLogIsLevelEnabled(v12, 0);

    if (!IsLevelEnabled)
      goto LABEL_12;
    v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
    v16 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v15, 0, "%s%.30s:%-4d %@: Not restarting %@ session because cancelled", ", "-[NRLinkWired restartIKESessionForDataProtectionClass:]", 347, v16, String);
LABEL_11:

    goto LABEL_12;
  }
  -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", v3);
  if ((_DWORD)v3 == 3 && !-[NRLinkWired remoteClassCUnlocked](self, "remoteClassCUnlocked"))
  {
    v17 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    v18 = _NRLogIsLevelEnabled(v17, 0);

    if (!v18)
      goto LABEL_12;
    v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v19);
    v16 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v15, 0, "%s%.30s:%-4d %@: Not restarting %@ session because remote not unlocked", ", "-[NRLinkWired restartIKESessionForDataProtectionClass:]", 352, v16, String);
    goto LABEL_11;
  }
  v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  v8 = _NRLogIsLevelEnabled(v7, 0);

  if (v8)
  {
    v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v10, 0, "%s%.30s:%-4d %@: Restarting %@ session", ", "-[NRLinkWired restartIKESessionForDataProtectionClass:]", 355, v11, String);

  }
  -[NRLinkWired setupIPsecIfNecessary:](self, "setupIPsecIfNecessary:", v3);
LABEL_12:

}

- (void)setupIKECallbacks:(unsigned __int8)a3
{
  int v3;
  uint64_t v5;
  void *String;
  void *v7;
  id v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  uint64_t v33;
  id v34;
  id v35;
  int IsLevelEnabled;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  char v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  char v66;
  id location[2];

  v3 = a3;
  String = (void *)NRDataProtectionClassCreateString(a3);
  if (v3 == 3)
  {
    v7 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
    if (!v7)
    {
      v35 = sub_1000C46B8();
      IsLevelEnabled = _NRLogIsLevelEnabled(v35, 17);

      if (!IsLevelEnabled)
        goto LABEL_13;
      v10 = sub_1000C46B8();
      _NRLogWithArgs(v10, 17, "%s called with null _ikeSessionClassC");
      goto LABEL_12;
    }
  }
  else
  {
    if (v3 != 4)
    {
      v31 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      v32 = _NRLogIsLevelEnabled(v31, 17);

      if (v32)
      {
        v10 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v33);
        v34 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v10, 17, "%@: Cannot setup IKE callbacks for %@", v34, String);

        goto LABEL_12;
      }
LABEL_13:
      v25 = 0;
      goto LABEL_14;
    }
    v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
    if (!v7)
    {
      v8 = sub_1000C46B8();
      v9 = _NRLogIsLevelEnabled(v8, 17);

      if (v9)
      {
        v10 = sub_1000C46B8();
        _NRLogWithArgs(v10, 17, "%s called with null _ikeSessionClassD");
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  v11 = v7;
  objc_msgSend(v11, "setClientQueue:", self->super._queue);
  objc_initWeak(location, self);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000C489C;
  v62[3] = &unk_1001B7290;
  objc_copyWeak(&v65, location);
  v66 = v3;
  v12 = String;
  v63 = v12;
  v13 = v11;
  v64 = v13;
  objc_msgSend(v13, "setStateUpdateBlock:", v62);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000C4FC0;
  v57[3] = &unk_1001B72B8;
  objc_copyWeak(&v60, location);
  v14 = v12;
  v58 = v14;
  v15 = v13;
  v59 = v15;
  v61 = v3;
  objc_msgSend(v15, "setChildStateUpdateBlock:", v57);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000C50E4;
  v53[3] = &unk_1001B72E0;
  objc_copyWeak(&v56, location);
  v16 = v14;
  v54 = v16;
  v17 = v15;
  v55 = v17;
  objc_msgSend(v17, "setConfigurationUpdateBlock:", v53);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000C51B0;
  v49[3] = &unk_1001B7308;
  objc_copyWeak(&v52, location);
  v18 = v16;
  v50 = v18;
  v19 = v17;
  v51 = v19;
  objc_msgSend(v19, "setTrafficSelectorUpdateBlock:", v49);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000C529C;
  v45[3] = &unk_1001B7330;
  objc_copyWeak(&v48, location);
  v20 = v18;
  v46 = v20;
  v21 = v19;
  v47 = v21;
  objc_msgSend(v21, "setAdditionalAddressesUpdateBlock:", v45);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000C5368;
  v41[3] = &unk_1001B7928;
  objc_copyWeak(&v44, location);
  v22 = v20;
  v42 = v22;
  v23 = v21;
  v43 = v23;
  objc_msgSend(v23, "setShortDPDEventBlock:", v41);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000C5428;
  v37[3] = &unk_1001B7330;
  objc_copyWeak(&v40, location);
  v24 = v22;
  v38 = v24;
  v25 = v23;
  v39 = v25;
  objc_msgSend(v25, "setPrivateNotifyStatusEvent:", v37);
  v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
  LOBYTE(v11) = _NRLogIsLevelEnabled(v27, 0);

  if ((v11 & 1) != 0)
  {
    v29 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v28);
    v30 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v29, 0, "%s%.30s:%-4d %@: Setup IKE %@ %@ callbacks", ", "-[NRLinkWired setupIKECallbacks:]", 564, v30, v24, v25);

  }
  objc_destroyWeak(&v40);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v48);

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v56);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v65);
  objc_destroyWeak(location);

LABEL_14:
}

- (void)setupIPsecIfNecessary:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id *v7;
  id *v8;
  uint64_t v9;
  void *String;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned __int16 v21;
  void *v22;
  int IsLevelEnabled;
  uint64_t v24;
  id v25;
  void *v26;
  int v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v3 = a3;
  if (!-[NRLinkWired isIKEResponder](self, "isIKEResponder"))
  {
    v7 = -[NRLinkWired ikeSessionPointerForDataProtectionClass:](self, "ikeSessionPointerForDataProtectionClass:", v3);
    if (*v7)
      return;
    v8 = v7;
    String = (void *)NRDataProtectionClassCreateString(v3);
    if (self->super._state == 255)
    {
      v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      IsLevelEnabled = _NRLogIsLevelEnabled(v22, 0);

      if (!IsLevelEnabled)
      {
LABEL_28:

        return;
      }
      v13 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      v25 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v13, 0, "%s%.30s:%-4d %@: Not starting %@ initiator session because cancelled", ", "-[NRLinkWired setupIPsecIfNecessary:]", 582, v25, String);

    }
    else
    {
      v11 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->super._nrUUID);
      v13 = v11;
      if (!v11)
      {
        v42 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v12);
        v43 = _NRLogIsLevelEnabled(v42, 17);

        if (!v43)
          goto LABEL_27;
        v16 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v44);
        v29 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v16, 17, "%@: Not starting %@ IKE initiator session because localDevice is missing", v29, String);
        goto LABEL_18;
      }
      v14 = sub_100131288(v11, v3);

      if (v14)
      {
        v16 = sub_100112198();
        sub_100111E90(v13, v16);
        objc_msgSend(v16, "setRandomizeLocalPort:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
        objc_msgSend(v16, "setOutgoingInterfaceName:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
        objc_msgSend(v16, "setRemoteEndpoint:", v18);

        objc_msgSend(v16, "setRequestChildlessSA:", -[NRLink hasCompanionDatapath](self, "hasCompanionDatapath") ^ 1);
        if (qword_1001E4870 != -1)
          dispatch_once(&qword_1001E4870, &stru_1001B7BB0);
        if (byte_1001E4868)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
          v20 = objc_msgSend(v19, "addressFamily");

          if (v20 == (id)2)
          {
            LODWORD(v54) = 0;
            v53 = 0;
            v21 = 528;
          }
          else
          {
            v53 = 0;
            v54 = 0;
            v55 = 0;
            v21 = 7708;
          }
          v52 = v21 | 0x94110000;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NWAddressEndpoint endpointWithAddress:](NWAddressEndpoint, "endpointWithAddress:", &v52));
          objc_msgSend(v16, "setLocalEndpoint:", v30);

          objc_msgSend(v16, "setForceUDPEncapsulation:", 1);
        }
        v31 = sub_100112798(1, v13, v3);
        -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", v3);
        v32 = sub_100112420();
        objc_msgSend(v32, "setMode:", 2);
        objc_msgSend(v32, "setReplayWindowSize:", 4);
        sub_100112034(v13, v32);
        v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("terminus-Wired-%@"), String);
        v33 = objc_msgSend(objc_alloc((Class)NEIKEv2Session), "initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:kernelSASessionName:packetDelegate:", v16, v32, v31, self->super._queue, -[NRLink virtualInterface](self, "virtualInterface"), 0, v50, 0);
        v34 = *v8;
        *v8 = v33;

        if (*v8)
        {
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3015, CFSTR("%@ %@"), String, *v8);
          -[NRLinkWired setupIKECallbacks:](self, "setupIKECallbacks:", v3);
          v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
          v38 = _NRLogIsLevelEnabled(v37, 0);

          if (v38)
          {
            v40 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v39);
            v41 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v40, 0, "%s%.30s:%-4d %@: Connecting initiator %@ session %@", ", "-[NRLinkWired setupIPsecIfNecessary:]", 645, v41, String, *v8);

          }
          objc_msgSend(*v8, "connect");
        }
        else
        {
          v45 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
          v46 = _NRLogIsLevelEnabled(v45, 17);

          if (v46)
          {
            v48 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v47);
            v49 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v48, 17, "%@: Failed to create initiator %@ IKE session", v49, String);

          }
          -[NRLinkWired retrySetupIPsec:](self, "retrySetupIPsec:", v3);
        }

        goto LABEL_26;
      }
      v26 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
      v27 = _NRLogIsLevelEnabled(v26, 0);

      if (v27)
      {
        v16 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v28);
        v29 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v16, 0, "%s%.30s:%-4d %@: Not starting %@ IKE initiator session because we do not have keys %@", ", "-[NRLinkWired setupIPsecIfNecessary:]", 591, v29, String, v13);
LABEL_18:

LABEL_26:
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  objc_opt_self(NRIKEv2Listener);
  if (qword_1001E44D8 != -1)
    dispatch_once(&qword_1001E44D8, &stru_1001B5E70);
  v51 = (id)qword_1001E44D0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  sub_10001013C((uint64_t)v51, self, v5, v6);

}

- (void)retrySetupIPsec:(unsigned __int8)a3
{
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  unsigned __int8 v9;
  id location;

  -[NRLinkWired setSetupIPsecRetryCounter:](self, "setSetupIPsecRetryCounter:", -[NRLinkWired setupIPsecRetryCounter](self, "setupIPsecRetryCounter") + 1);
  if (-[NRLinkWired setupIPsecRetryCounter](self, "setupIPsecRetryCounter") > 4)
  {
    -[NRLinkWired cancelWithReason:](self, "cancelWithReason:", CFSTR("IKE session creation hit max retries"));
  }
  else
  {
    -[NRLink reportEvent:](self, "reportEvent:", 3026);
    objc_initWeak(&location, self);
    v5 = dispatch_time(0, 1000000000);
    v6 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C4848;
    block[3] = &unk_1001B7358;
    objc_copyWeak(&v8, &location);
    v9 = a3;
    dispatch_after(v5, v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void (**v19)(id, id, id, NEVirtualInterface_s *);
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  unsigned int v27;
  id v28;
  void *v29;
  id v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  _BYTE *v41;
  id v42;
  int v43;
  id v44;
  int IsLevelEnabled;
  id v46;
  int v47;
  id v48;
  int v49;
  id v50;
  int v51;
  id v52;

  v52 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v19 = (void (**)(id, id, id, NEVirtualInterface_s *))a8;
  if (v52)
  {
    if (!v14)
    {
      v44 = sub_1000C46B8();
      IsLevelEnabled = _NRLogIsLevelEnabled(v44, 17);

      if (!IsLevelEnabled)
        goto LABEL_31;
      v39 = sub_1000C46B8();
      _NRLogWithArgs(v39, 17, "%s called with null session");
      goto LABEL_30;
    }
    if (!v15)
    {
      v46 = sub_1000C46B8();
      v47 = _NRLogIsLevelEnabled(v46, 17);

      if (!v47)
        goto LABEL_31;
      v39 = sub_1000C46B8();
      _NRLogWithArgs(v39, 17, "%s called with null sessionConfig");
      goto LABEL_30;
    }
    if (!v17)
    {
      v48 = sub_1000C46B8();
      v49 = _NRLogIsLevelEnabled(v48, 17);

      if (!v49)
        goto LABEL_31;
      v39 = sub_1000C46B8();
      _NRLogWithArgs(v39, 17, "%s called with null validateAuthBlock");
      goto LABEL_30;
    }
    if (!v19)
    {
      v50 = sub_1000C46B8();
      v51 = _NRLogIsLevelEnabled(v50, 17);

      if (!v51)
        goto LABEL_31;
      v39 = sub_1000C46B8();
      _NRLogWithArgs(v39, 17, "%s called with null responseBlock");
      goto LABEL_30;
    }
    v20 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v18);
    v21 = _NRLogIsLevelEnabled(v20, 0);

    if (v21)
    {
      v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v22);
      v24 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v23, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@", ", "-[NRLinkWired requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 685, v24, v52, v14, v15, v16);

    }
    if (self->super._state != 255)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localIdentifier"));
      if (qword_1001E4920 != -1)
        dispatch_once(&qword_1001E4920, &stru_1001B7D88);
      v26 = (id)qword_1001E4918;
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (v27)
      {
        if (v16)
        {
          v28 = sub_100112420();
          objc_msgSend(v28, "setMode:", 2);
          objc_msgSend(v28, "setReplayWindowSize:", 4);
LABEL_25:
          v39 = (id)objc_claimAutoreleasedReturnValue(-[NRLinkWired respondToIKESession:dataProtectionClass:validateAuthBlock:](self, "respondToIKESession:dataProtectionClass:validateAuthBlock:", v14, 4, v17));
          goto LABEL_26;
        }
        if (!-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
        {
          v28 = 0;
          goto LABEL_25;
        }
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassD %@"), v14);
        goto LABEL_21;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localIdentifier"));
      if (qword_1001E4930 != -1)
        dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
      v30 = (id)qword_1001E4928;
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (v31)
      {
        if (v16)
        {
          v28 = sub_100112420();
          objc_msgSend(v28, "setMode:", 2);
          objc_msgSend(v28, "setReplayWindowSize:", 4);
LABEL_34:
          objc_opt_self(NRDKeyManager);
          if (qword_1001E4AD8 != -1)
            dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
          v40 = (id)qword_1001E4AD0;
          v41 = v40;
          if (v40)
          {
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v40 + 2));
            if (!v41[10])
            {
              v41[10] = 1;
              if (v41[8] == 4)
              {
                sub_10014A63C((uint64_t)v41);
                if (v41[9])
                {
                  v41[8] = 3;
                  sub_10014A8AC((uint64_t)v41);
                }
              }
            }
            if ((v41[8] & 0xFD) == 1)
            {
              v39 = (id)objc_claimAutoreleasedReturnValue(-[NRLinkWired respondToIKESession:dataProtectionClass:validateAuthBlock:](self, "respondToIKESession:dataProtectionClass:validateAuthBlock:", v14, 3, v17));

LABEL_26:
              if (-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
              {
                v19[2](v19, v39, v28, -[NRLink virtualInterface](self, "virtualInterface"));
LABEL_29:

                goto LABEL_30;
              }
LABEL_28:
              v19[2](v19, 0, 0, 0);
              goto LABEL_29;
            }
          }
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3020, CFSTR("ClassC %@"), v14);
          -[NRLinkWired sendClassCUnlockedNotify](self, "sendClassCUnlockedNotify");

LABEL_22:
          v39 = 0;
          goto LABEL_28;
        }
        if (!-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
        {
          v28 = 0;
          goto LABEL_34;
        }
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassC %@"), v14);
      }
      else
      {
        v33 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v32);
        v34 = _NRLogIsLevelEnabled(v33, 16);

        if (v34)
        {
          v36 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v35);
          v37 = -[NRLink copyDescription](self, "copyDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localIdentifier"));
          _NRLogWithArgs(v36, 16, "%s%.30s:%-4d %@: Unrecognized identifier %@", ", "-[NRLinkWired requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 728, v37, v38);

        }
      }
    }
LABEL_21:
    v28 = 0;
    goto LABEL_22;
  }
  v42 = sub_1000C46B8();
  v43 = _NRLogIsLevelEnabled(v42, 17);

  if (!v43)
    goto LABEL_31;
  v39 = sub_1000C46B8();
  _NRLogWithArgs(v39, 17, "%s called with null listener");
LABEL_30:

LABEL_31:
}

- (id)respondToIKESession:(id)a3 dataProtectionClass:(unsigned __int8)a4 validateAuthBlock:(id)a5
{
  uint64_t v6;
  id v9;
  uint64_t (**v10)(id, void *);
  id String;
  char *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v27;
  int IsLevelEnabled;

  v6 = a4;
  v9 = a3;
  v10 = (uint64_t (**)(id, void *))a5;
  if (v9)
  {
    String = (id)NRDataProtectionClassCreateString(v6);
    v12 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->super._nrUUID);
    v13 = sub_100131288(v12, v6);
    v14 = v13;
    if (v13)
      v15 = (void *)*((_QWORD *)v13 + 1);
    else
      v15 = 0;
    v16 = v15;

    if (!v16)
    {
      -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3019, CFSTR("%@ %@ %@"), String, v9, v12);
      v21 = 0;
LABEL_17:

      goto LABEL_18;
    }
    if ((_DWORD)v6 == 3)
    {
      if (v12)
      {
        v22 = sub_10014CFBC();
        dispatch_assert_queue_V2(v22);

        v18 = (void *)sub_100133920(v12, CFSTR("0"));
        v23 = sub_10014CFBC();
        dispatch_assert_queue_V2(v23);

        v20 = sub_100133AD8(v12, CFSTR("0"));
        goto LABEL_12;
      }
    }
    else
    {
      if ((_DWORD)v6 != 4)
      {
LABEL_13:
        v24 = sub_100112798(0, v12, v6);
        v25 = -[NRLinkWired copyNotifyPayloadsToSendWithProxy:](self, "copyNotifyPayloadsToSendWithProxy:", sub_100112F4C(v12));
        objc_msgSend(v24, "setCustomIKEAuthPrivateNotifies:", v25);
        if ((v10[2](v10, v24) & 1) != 0)
        {
          -[NRLinkWired invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", v6);
          objc_storeStrong(-[NRLinkWired ikeSessionPointerForDataProtectionClass:](self, "ikeSessionPointerForDataProtectionClass:", v6), a3);
          -[NRLinkWired setupIKECallbacks:](self, "setupIKECallbacks:", v6);
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016, CFSTR("%@ %@"), String, v9);
          v21 = v24;
        }
        else
        {
          -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021, CFSTR("%@ %@"), String, v9);
          v21 = 0;
        }

        goto LABEL_17;
      }
      if (v12)
      {
        v17 = sub_10014CFBC();
        dispatch_assert_queue_V2(v17);

        v18 = sub_1001331E8(v12, CFSTR("0"));
        v19 = sub_10014CFBC();
        dispatch_assert_queue_V2(v19);

        v20 = sub_100133714(v12, CFSTR("0"));
LABEL_12:

        goto LABEL_13;
      }
    }
    v20 = 0;
    v18 = 0;
    goto LABEL_12;
  }
  v27 = sub_1000C46B8();
  IsLevelEnabled = _NRLogIsLevelEnabled(v27, 17);

  if (!IsLevelEnabled)
  {
    v21 = 0;
    goto LABEL_19;
  }
  String = sub_1000C46B8();
  _NRLogWithArgs(String, 17, "%s called with null session", "-[NRLinkWired respondToIKESession:dataProtectionClass:validateAuthBlock:]");
  v21 = 0;
LABEL_18:

LABEL_19:
  return v21;
}

- (id)copyNotifyPayloadsToSendWithProxy:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  unsigned __int8 v22;
  void *v23;
  id v24;
  __int16 v26;

  v3 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v26 = 5632;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &v26, 2);
  v7 = objc_msgSend(objc_alloc((Class)NEIKEv2PrivateNotify), "initWithNotifyStatus:notifyData:", 48602, v6);
  objc_msgSend(v5, "addObject:", v7);

  if (qword_1001E4860 != -1)
    dispatch_once(&qword_1001E4860, &stru_1001B7B90);
  v8 = (id)qword_1001E4858;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));

  v10 = objc_msgSend(objc_alloc((Class)NEIKEv2PrivateNotify), "initWithNotifyStatus:notifyData:", 48603, v9);
  objc_msgSend(v5, "addObject:", v10);

  if (qword_1001E4850 != -1)
    dispatch_once(&qword_1001E4850, &stru_1001B7B70);
  v11 = (id)qword_1001E4848;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));

  v13 = objc_msgSend(objc_alloc((Class)NEIKEv2PrivateNotify), "initWithNotifyStatus:notifyData:", 48604, v12);
  objc_msgSend(v5, "addObject:", v13);

  v14 = sub_100112E3C();
  objc_msgSend(v5, "addObject:", v14);

  if (v3)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    v16 = sub_10012FFF4((uint64_t)NRDLocalDevice, v15);

    if (v16)
      v17 = (void *)*((_QWORD *)v16 + 16);
    else
      v17 = 0;
    v18 = v17;
    v19 = objc_msgSend(v18, "proxyCapability");

    if (v19 == (id)1)
    {
      if (v16)
        v20 = (void *)*((_QWORD *)v16 + 16);
      else
        v20 = 0;
      v21 = v20;
      v22 = objc_msgSend(v21, "hasCompanionDatapath");

      if ((v22 & 1) != 0)
        v23 = 0;
      else
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
      v24 = sub_100112FCC(v16, v23);
      objc_msgSend(v5, "addObject:", v24);

    }
  }
  return v5;
}

- (BOOL)sendControlData:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  int v12;
  id v13;
  id v14;
  int IsLevelEnabled;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  id v20;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NEIKEv2PrivateNotify), "initWithNotifyStatus:notifyData:", 50702, v4);
    v6 = v5 != 0;
    if (v5)
    {
      objc_initWeak(&location, self);
      v7 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
      v20 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000C46F8;
      v17[3] = &unk_1001B7978;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v7, "sendPrivateNotifies:maxRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v8, 10, 1000, v9, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = sub_1000C46B8();
      IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17);

      if (IsLevelEnabled)
      {
        v16 = sub_1000C46B8();
        _NRLogWithArgs(v16, 17, "NEIKEv2PrivateNotify init %u %@ failed", 50702, v4);

      }
    }

  }
  else
  {
    v11 = sub_1000C46B8();
    v12 = _NRLogIsLevelEnabled(v11, 17);

    if (v12)
    {
      v13 = sub_1000C46B8();
      _NRLogWithArgs(v13, 17, "%s called with null data", "-[NRLinkWired sendControlData:]");

    }
    v6 = 0;
  }

  return v6;
}

- (void)sendClassCUnlockedNotify
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[NRLink state](self, "state") == 8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLinkWired ikeSessionClassD](self, "ikeSessionClassD"));

    if (v3)
    {
      if (!-[NRLinkWired hasScheduledSendingLocalClassCUnlock](self, "hasScheduledSendingLocalClassCUnlock"))
      {
        -[NRLinkWired setHasScheduledSendingLocalClassCUnlock:](self, "setHasScheduledSendingLocalClassCUnlock:", 1);
        objc_initWeak(&location, self);
        objc_opt_self(NRDKeyManager);
        if (qword_1001E4AD8 != -1)
          dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
        v4 = (id)qword_1001E4AD0;
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 3221225472;
        v5[2] = sub_1000C440C;
        v5[3] = &unk_1001B7F28;
        objc_copyWeak(&v6, &location);
        sub_10014ACE0((uint64_t)v4, v5);

        objc_destroyWeak(&v6);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)upgradeSessionsIfNeeded
{
  dispatch_queue_t *v3;
  dispatch_queue_t *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  id v10;
  dispatch_queue_t *v11;

  if (self
    && self->_upgradeSessionAfterFirstUnlock
    && -[NRLinkWired sentLocalClassCUnlockNotify](self, "sentLocalClassCUnlockNotify")
    && -[NRLinkWired remoteClassCUnlocked](self, "remoteClassCUnlocked"))
  {
    objc_opt_self(NRDKeyManager);
    if (qword_1001E4AD8 != -1)
      dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
    v3 = (dispatch_queue_t *)(id)qword_1001E4AD0;
    if (!v3)
      goto LABEL_19;
    v4 = v3;
    dispatch_assert_queue_V2(v3[2]);
    if (!*((_BYTE *)v4 + 10))
    {
      *((_BYTE *)v4 + 10) = 1;
      if (*((_BYTE *)v4 + 8) == 4)
      {
        sub_10014A63C((uint64_t)v4);
        if (*((_BYTE *)v4 + 9))
        {
          *((_BYTE *)v4 + 8) = 3;
          sub_10014A8AC((uint64_t)v4);
        }
      }
    }
    v5 = (_BYTE)v4[1] & 0xFD;

    if (v5 == 1 && !-[NRLink ikeClassCEstablished](self, "ikeClassCEstablished"))
    {
      if (-[NRLink state](self, "state") == 8)
      {
        -[NRLinkWired suspend](self, "suspend");
        -[NRLinkWired invalidateIKESessionClassD](self, "invalidateIKESessionClassD");
        -[NRLinkWired setupIPsecIfNecessary:](self, "setupIPsecIfNecessary:", 3);
        return;
      }
      v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
      IsLevelEnabled = _NRLogIsLevelEnabled(v7, 16);

      if (IsLevelEnabled)
      {
        v11 = (dispatch_queue_t *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
        v10 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v11, 16, "%s%.30s:%-4d %@: both sides unlocked with unexpected link state", ", "-[NRLinkWired upgradeSessionsIfNeeded]", 948, v10);

        v3 = v11;
LABEL_19:

      }
    }
  }
}

- (void)handleNotifyCode:(unsigned __int16)a3 payload:(id)a4
{
  unsigned int v4;
  id v6;
  uint64_t v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  char v18;

  v4 = a3;
  v6 = a4;
  v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
  IsLevelEnabled = _NRLogIsLevelEnabled(v8, 1);

  if (IsLevelEnabled)
  {
    v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
    v12 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v11, 1, "%s%.30s:%-4d %@: Received notify code %u %@", ", "-[NRLinkWired handleNotifyCode:payload:]", 960, v12, v4, v6);

  }
  switch(v4)
  {
    case 0xBE3Du:
      v18 = 0;
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v6, "getBytes:length:", &v18, 1);
        if (v18 < 0 && !-[NRLinkWired remoteClassCUnlocked](self, "remoteClassCUnlocked"))
        {
          -[NRLinkWired setRemoteClassCUnlocked:](self, "setRemoteClassCUnlocked:", 1);
          objc_initWeak(&location, self);
          objc_opt_self(NRDKeyManager);
          if (qword_1001E4AD8 != -1)
            dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
          v14 = (id)qword_1001E4AD0;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1000C43B8;
          v15[3] = &unk_1001B7F28;
          objc_copyWeak(&v16, &location);
          sub_10014ACE0((uint64_t)v14, v15);

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }
      }
      break;
    case 0xC60Du:
      sub_10013C5A0((uint64_t)NRDLocalDevice, v6, self->super._nrUUID);
      -[NRLink checkProxyAgentWithForceUpdate:](self, "checkProxyAgentWithForceUpdate:", 0);
      break;
    case 0xC60Eu:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      objc_msgSend(v13, "linkDidReceiveData:data:", self, v6);

      break;
  }

}

- (BOOL)suspend
{
  uint64_t v3;
  NRCompanionProxyAgent *companionProxyAgent;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int IsLevelEnabled;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NRLinkWired;
  -[NRLink suspend](&v17, "suspend");
  if (self->super._state != 255)
  {
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_10005DA9C((uint64_t)companionProxyAgent, v3) & 1) != 0)
      {
        -[NRLink reportEvent:](self, "reportEvent:", 12003);
      }
      else
      {
        v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
        IsLevelEnabled = _NRLogIsLevelEnabled(v11, 16);

        if (IsLevelEnabled)
        {
          v14 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v13);
          v15 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v14, 16, "%s%.30s:%-4d %@: failed to unregister companion agent", ", "-[NRLinkWired suspend]", 1005, v15);

        }
      }
    }
    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9, CFSTR("(suspend)"));
    -[NRLink setInterfaceRank](self, "setInterfaceRank");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v9, "linkIsSuspended:", self);
    goto LABEL_10;
  }
  v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
  v7 = _NRLogIsLevelEnabled(v6, 1);

  if (v7)
  {
    v9 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v8);
    v10 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v9, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'", ", "-[NRLinkWired suspend]", 999, v10);

LABEL_10:
  }
  return 1;
}

- (BOOL)resume
{
  uint64_t v3;
  NRCompanionProxyAgent *companionProxyAgent;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int IsLevelEnabled;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  if (self->super._state == 255)
  {
    v6 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    v7 = 1;
    IsLevelEnabled = _NRLogIsLevelEnabled(v6, 1);

    if (IsLevelEnabled)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      v11 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'", ", "-[NRLinkWired resume]", 1022, v11);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NRLinkWired;
    if (-[NRLink resume](&v19, "resume"))
    {
      companionProxyAgent = self->super._companionProxyAgent;
      if (companionProxyAgent)
      {
        if ((sub_10005E5B8((uint64_t)companionProxyAgent, v3) & 1) != 0)
        {
          -[NRLink reportEvent:](self, "reportEvent:", 12002);
        }
        else
        {
          v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
          v13 = _NRLogIsLevelEnabled(v12, 16);

          if (v13)
          {
            v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
            v16 = -[NRLink copyDescription](self, "copyDescription");
            _NRLogWithArgs(v15, 16, "%s%.30s:%-4d %@: failed to register companion agent", ", "-[NRLinkWired resume]", 1033, v16);

          }
        }
      }
      -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 8, CFSTR("(resume)"));
      -[NRLink setInterfaceRank](self, "setInterfaceRank");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      objc_msgSend(v17, "linkIsReady:", self);

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (NEIKEv2Listener)ikeListener
{
  return *(NEIKEv2Listener **)((char *)&self->_listenerPort + 7);
}

- (void)setIkeListener:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_listenerPort + 7), a3);
}

- (NEIKEv2Session)ikeSessionClassD
{
  return *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
}

- (void)setIkeSessionClassD:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), a3);
}

- (NEIKEv2Session)ikeSessionClassC
{
  return *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7);
}

- (void)setIkeSessionClassC:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), a3);
}

- (NSString)listenerPortString
{
  return *(NSString **)((char *)&self->_ikeSessionClassC + 7);
}

- (void)setListenerPortString:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), a3);
}

- (BOOL)hasScheduledSendingLocalClassCUnlock
{
  return self->_hasScheduledSendingLocalClassCUnlock;
}

- (void)setHasScheduledSendingLocalClassCUnlock:(BOOL)a3
{
  self->_hasScheduledSendingLocalClassCUnlock = a3;
}

- (BOOL)sentLocalClassCUnlockNotify
{
  return self->_sentLocalClassCUnlockNotify;
}

- (void)setSentLocalClassCUnlockNotify:(BOOL)a3
{
  self->_sentLocalClassCUnlockNotify = a3;
}

- (OS_nw_path_evaluator)pathEvaluator
{
  return *(OS_nw_path_evaluator **)((char *)&self->_listenerPortString + 7);
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_listenerPortString + 7), a3);
}

- (BOOL)isIKEResponder
{
  return self->_isIKEResponder;
}

- (void)setIsIKEResponder:(BOOL)a3
{
  self->_isIKEResponder = a3;
}

- (NSUUID)randomUUID
{
  return *(NSUUID **)((char *)&self->_pathEvaluator + 7);
}

- (void)setRandomUUID:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_pathEvaluator + 7), a3);
}

- (BOOL)remoteClassCUnlocked
{
  return self->_remoteClassCUnlocked;
}

- (void)setRemoteClassCUnlocked:(BOOL)a3
{
  self->_remoteClassCUnlocked = a3;
}

- (NRPairingClient)pairingClient
{
  return *(NRPairingClient **)((char *)&self->_randomUUID + 7);
}

- (void)setPairingClient:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), a3);
}

- (BOOL)onlyAllowClassC
{
  return self->_onlyAllowClassC;
}

- (void)setOnlyAllowClassC:(BOOL)a3
{
  self->_onlyAllowClassC = a3;
}

- (unsigned)setupIPsecRetryCounter
{
  return *(_DWORD *)(&self->_onlyAllowClassC + 2);
}

- (void)setSetupIPsecRetryCounter:(unsigned int)a3
{
  *(_DWORD *)(&self->_onlyAllowClassC + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_randomUUID + 7), 0);
  objc_storeStrong((id *)((char *)&self->_pathEvaluator + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPortString + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPort + 7), 0);
  objc_storeStrong((id *)((char *)&self->_setupIPsecRetryCounter + 7), 0);
}

@end
