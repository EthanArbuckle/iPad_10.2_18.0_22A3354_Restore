@implementation NRLinkWiFi

- (id)copyStatusString
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NEVirtualInterface_s *virtualInterface;
  void *v8;
  uint64_t v9;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "nrUUID", self->super._nrUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "localInterfaceName", v6);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "listenerPortString", *(_QWORD *)((char *)&self->_notifyToken + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassC", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v8 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "virtualInterfaceName", v8);

  }
  v9 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
  if (v9)
    v9 = *(_QWORD *)(v9 + 120);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %llu"), "symptomsAdvisoryFalsePositives", v9);
  return v5;
}

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5 wifiInterfaceName:(id)a6 localOuterEndpoint:(id)a7 remoteOuterEndpoint:(id)a8 listenerPortString:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char *v22;
  char *v23;
  NRAnalyticsCmpnLinkWiFi *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NRLinkWiFi *v30;
  id v32;
  int IsLevelEnabled;
  id v34;
  id v35;
  int v36;
  id v37;
  int v38;
  id v39;
  int v40;
  id v41;
  int v42;
  id v43;
  int v44;
  id v45;
  int v46;
  id v47;
  objc_super v48;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!v15)
  {
    v32 = sub_100032FF0();
    IsLevelEnabled = _NRLogIsLevelEnabled(v32, 17);

    if (!IsLevelEnabled)
      goto LABEL_26;
    v34 = sub_100032FF0();
    _NRLogWithArgs(v34, 17, "%s called with null queue");
LABEL_22:

    v30 = 0;
    goto LABEL_9;
  }
  if (!v16)
  {
    v35 = sub_100032FF0();
    v36 = _NRLogIsLevelEnabled(v35, 17);

    if (!v36)
      goto LABEL_26;
    v34 = sub_100032FF0();
    _NRLogWithArgs(v34, 17, "%s called with null linkDelegate");
    goto LABEL_22;
  }
  if (!v17)
  {
    v37 = sub_100032FF0();
    v38 = _NRLogIsLevelEnabled(v37, 17);

    if (!v38)
      goto LABEL_26;
    v34 = sub_100032FF0();
    _NRLogWithArgs(v34, 17, "%s called with null nrUUID");
    goto LABEL_22;
  }
  if ((_NRIsUUIDNonZero(v17) & 1) == 0)
  {
    v39 = sub_100032FF0();
    v40 = _NRLogIsLevelEnabled(v39, 17);

    if (!v40)
      goto LABEL_26;
    v34 = sub_100032FF0();
    _NRLogWithArgs(v34, 17, "called with all-zero nrUUID");
    goto LABEL_22;
  }
  if (!v18)
  {
    v41 = sub_100032FF0();
    v42 = _NRLogIsLevelEnabled(v41, 17);

    if (!v42)
      goto LABEL_26;
    v34 = sub_100032FF0();
    _NRLogWithArgs(v34, 17, "%s called with null wifiInterfaceName");
    goto LABEL_22;
  }
  if (!v19)
  {
    v43 = sub_100032FF0();
    v44 = _NRLogIsLevelEnabled(v43, 17);

    if (v44)
    {
      v34 = sub_100032FF0();
      _NRLogWithArgs(v34, 17, "%s called with null localOuterEndpoint");
      goto LABEL_22;
    }
LABEL_26:
    v30 = 0;
    goto LABEL_9;
  }
  v48.receiver = self;
  v48.super_class = (Class)NRLinkWiFi;
  v22 = -[NRLink initLinkWithQueue:linkDelegate:nrUUID:](&v48, "initLinkWithQueue:linkDelegate:nrUUID:", v15, v16, v17);
  if (!v22)
  {
    v45 = sub_100032FF0();
    v46 = _NRLogIsLevelEnabled(v45, 17);

    if (v46)
    {
      v47 = sub_100032FF0();
      _NRLogWithArgs(v47, 17, "[NRLink initLinkWithQueue:] failed");

    }
    self = 0;
    goto LABEL_26;
  }
  v23 = v22;
  objc_msgSend(v22, "setType:", 2);
  objc_msgSend(v23, "setSubtype:", 101);
  objc_msgSend(v23, "setLocalInterfaceName:", v18);
  objc_msgSend(v23, "setLocalOuterEndpoint:", v19);
  objc_msgSend(v23, "setRemoteOuterEndpoint:", v20);
  objc_storeStrong((id *)(v23 + 239), a9);
  *(_DWORD *)(v23 + 231) = -1;
  v24 = objc_alloc_init(NRAnalyticsCmpnLinkWiFi);
  v25 = *(void **)(v23 + 271);
  *(_QWORD *)(v23 + 271) = v24;

  v26 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v27 = *(void **)(v23 + 279);
  *(_QWORD *)(v23 + 279) = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
  objc_msgSend(v23, "reportEvent:details:", 3000, v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "linkDelegate"));
  objc_msgSend(v29, "linkIsAvailable:", v23);

  self = v23;
  v30 = self;
LABEL_9:

  return v30;
}

- (void)setIsPrimary:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;

  v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NRLinkWiFi;
  -[NRLink setIsPrimary:](&v21, "setIsPrimary:");
  objc_opt_self(NRLinkDirector);
  if (qword_1001E4710 != -1)
    dispatch_once(&qword_1001E4710, &stru_1001B6E60);
  v5 = (id)qword_1001E4708;
  v6 = v5;
  if (v5)
    v7 = (void *)*((_QWORD *)v5 + 6);
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v3)
  {
    if (self)
      v10 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    else
      v10 = 0;
    sub_100148BF4(v8, 32, v10, &off_1001C4A98);

    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v11 = (id)qword_1001E4708;
    v12 = v11;
    if (v11)
      v13 = (void *)*((_QWORD *)v11 + 6);
    else
      v13 = 0;
    v14 = v13;
    v15 = v14;
    if (self)
      v16 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    else
      v16 = 0;
    v17 = 1;
  }
  else
  {
    if (self)
      v18 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    else
      v18 = 0;
    sub_100148B30(v8, v18);

    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v19 = (id)qword_1001E4708;
    v12 = v19;
    if (v19)
      v20 = (void *)*((_QWORD *)v19 + 6);
    else
      v20 = 0;
    v14 = v20;
    v15 = v14;
    if (self)
      v16 = *(NRAnalyticsCmpnLinkWiFi **)((char *)&self->_linkAnalytics + 7);
    else
      v16 = 0;
    v17 = 0;
  }
  sub_100147674((uint64_t)v14, v17, v16);

}

- (void)invalidateLink
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int IsLevelEnabled;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NRCompanionProxyAgent *companionProxyAgent;
  NRCompanionProxyAgent *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  objc_super v25;
  objc_super v26;

  v25.receiver = self;
  v25.super_class = (Class)NRLinkWiFi;
  -[NRLink invalidateLink](&v25, "invalidateLink");
  if (self)
  {
    v26.receiver = self;
    v26.super_class = (Class)NRLinkWiFi;
    -[NRLink invalidateIKESessionForClass:](&v26, "invalidateIKESessionForClass:", 3);
    -[NRLink setIkeClassDEstablished:](self, "setIkeClassDEstablished:", 0);
    self->super._peerAvailabilityCheckInProgress = 0;
    -[NRLink invalidateIKESession:](self, "invalidateIKESession:", (char *)&self->_ikeListener + 7);
    v5 = *(NSString **)((char *)&self->_listenerPortString + 7);
    if (v5)
    {
      objc_msgSend(v5, "cancel");
      v6 = *(NSString **)((char *)&self->_listenerPortString + 7);
      *(NSString **)((char *)&self->_listenerPortString + 7) = 0;

    }
    v7 = *(NSObject **)((char *)&self->_pairingClient + 7);
    if (v7)
    {
      nw_browser_cancel(v7);
      v8 = *(NRPairingClient **)((char *)&self->_pairingClient + 7);
      *(NRPairingClient **)((char *)&self->_pairingClient + 7) = 0;

      v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      IsLevelEnabled = _NRLogIsLevelEnabled(v10, 0);

      if (IsLevelEnabled)
      {
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
        v13 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v12, 0, "%s%.30s:%-4d %@: stopped AWDL browser", ", "-[NRLinkWiFi stopAWDLBrowser]", 489, v13);

      }
    }
    sub_100035790((uint64_t)self, v4);
    v14 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
    if (v14)
    {
      objc_msgSend(v14, "setDelegate:", 0);
      objc_msgSend(*(id *)((char *)&self->_ikeSessionClassC + 7), "destroy");
      v15 = *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7);
      *(NEIKEv2Session **)((char *)&self->_ikeSessionClassC + 7) = 0;

    }
  }
  else
  {
    sub_100035790(0, v3);
  }
  if (-[NRLink virtualInterface](self, "virtualInterface"))
  {
    NEVirtualInterfaceSetRankNever(-[NRLink virtualInterface](self, "virtualInterface"), 1);
    NEVirtualInterfaceUpdateAdHocService(-[NRLink virtualInterface](self, "virtualInterface"));
  }
  -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
    sub_10005DA9C((uint64_t)companionProxyAgent, v16);
    -[NRLink reportEvent:](self, "reportEvent:", 12003);
    v18 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;

  }
  objc_opt_self(NRLinkDirector);
  if (qword_1001E4710 != -1)
    dispatch_once(&qword_1001E4710, &stru_1001B6E60);
  v19 = (id)qword_1001E4708;
  v20 = v19;
  if (v19)
    v21 = (void *)*((_QWORD *)v19 + 6);
  else
    v21 = 0;
  v22 = v21;
  sub_100147674((uint64_t)v22, 0, *(void **)((char *)&self->_linkAnalytics + 7));

  *(unsigned int *)((char *)&self->_ikeRetryCounter + 3) = 0;
  *(_DWORD *)(&self->_ikeRetryBackoffScheduled + 2) = 0;
  *(unsigned int *)((char *)&self->_startRetryCounter + 3) = 0;
  v23 = *(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7);
  if (v23)
  {
    sub_100006CA0(*(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7));
    sub_100006684(v23, 6, 0);
    v24 = *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7);
    *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7) = 0;

  }
}

- (void)refreshCompanionProxyAgent
{
  void *v3;
  int IsLevelEnabled;
  uint64_t v5;
  id v6;
  id v7;

  if (self->super._state == 255)
  {
    v3 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
    IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1);

    if (IsLevelEnabled)
    {
      v7 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v5);
      v6 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v7, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'refreshCompanionProxyAgent'", ", "-[NRLinkWiFi refreshCompanionProxyAgent]", 213, v6);

    }
  }
  else
  {
    sub_10005F064((uint64_t)self->super._companionProxyAgent, (uint64_t)a2);
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
  v9.super_class = (Class)NRLinkWiFi;
  v4 = -[NRLink copyDescriptionInner](&v9, "copyDescriptionInner");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@, %@ -> %@"), v4, v5, v6);

  return v7;
}

- (unsigned)metric
{
  return 100;
}

- (BOOL)start
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;

  v3 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[NRLink state](self, "state") == 255)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1);

    if (!IsLevelEnabled)
      return 0;
    v10 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@: Ignoring start request as link is cancelled", ", "-[NRLinkWiFi start]", 305, v11);
    goto LABEL_8;
  }
  if (-[NRLink state](self, "state") == 8)
  {
    v5 = (char *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v5, "linkIsReady:", self);
LABEL_4:

    return 1;
  }
  if (-[NRLink state](self, "state") != 9)
  {
    if (-[NRLink startRequested](self, "startRequested"))
      return 1;
    -[NRLink updateIKEv2Role:](self, "updateIKEv2Role:", &self->_isResponder);
    if (!self)
      return 0;
    if (!self->_isResponder)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](self, "remoteOuterEndpoint"));

      if (!v12)
        return 0;
      v13 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->super._nrUUID);
      v10 = v13;
      if (v13 && v13[13] || -[NRLink ikev2Role](self, "ikev2Role"))
      {

      }
      else
      {
        v24 = objc_claimAutoreleasedReturnValue(-[NRLink peerToken](self, "peerToken"));
        if (!v24)
          goto LABEL_9;
        v25 = (void *)v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localToken](self, "localToken"));

        if (!v26)
          return 0;
      }
    }
    -[NRLink setStartRequested:](self, "setStartRequested:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));

    if (v14)
    {
      if (-[NRLink state](self, "state") == 1)
      {
        v17 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->super._nrUUID);
        v5 = v17;
        if (v17 && v17[13])
          sub_100035F18((uint64_t)self, v18);
        else
          sub_100035C7C((uint64_t)self);
        if (-[NRLink subtype](self, "subtype") == 102)
          sub_100036204((uint64_t)self);
        goto LABEL_4;
      }
      v19 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
      v20 = _NRLogIsLevelEnabled(v19, 17);

      if (!v20)
        return 0;
      v10 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v21);
      v22 = -[NRLink copyDescription](self, "copyDescription");
      v23 = sub_10010E200(-[NRLink state](self, "state"));
      _NRLogWithArgs(v10, 17, "%@: Cannot start link in state %@", v22, v23);

      goto LABEL_9;
    }
    v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v15);
    v28 = _NRLogIsLevelEnabled(v27, 17);

    if (!v28)
      return 0;
    v10 = (char *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v29);
    v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v10, 17, "%@: Cannot start Wi-Fi link without wifiInterfaceName", v11);
LABEL_8:

LABEL_9:
    return 0;
  }
  return -[NRLinkWiFi resume](self, "resume");
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int IsLevelEnabled;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v34;
  int v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t *v42;
  _BYTE v43[128];
  uint64_t v44;

  v4 = a3;
  if (v4)
  {
    v42 = &v44;
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v44);
    v6 = -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 255, v5);
    v8 = _NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
    v9 = (void *)v8;
    if ((v6 & 1) != 0)
    {
      IsLevelEnabled = _NRLogIsLevelEnabled(v8, 16);

      if (IsLevelEnabled)
      {
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v11);
        v13 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v12, 16, "%s%.30s:%-4d %@: Cancelling due to %@, dumping last status:", ", "-[NRLinkWiFi cancelWithReason:]", 387, v13, v5);

      }
      v37 = v5;
      v36 = -[NRLinkWiFi copyStatusString](self, "copyStatusString");
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsSeparatedByString:", CFSTR("\n")));
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v15)
      {
        v17 = v15;
        v18 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v18)
              objc_enumerationMutation(v14);
            v20 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
            v22 = _NRLogIsLevelEnabled(v21, 16);

            if (v22)
            {
              v23 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v16);
              v24 = -[NRLink copyDescription](self, "copyDescription");
              _NRLogWithArgs(v23, 16, "%s%.30s:%-4d %@: %@", ", "-[NRLinkWiFi cancelWithReason:]", 391, v24, v20);

            }
          }
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v17);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      objc_msgSend(v28, "linkIsUnavailable:", self);

      -[NRLinkWiFi invalidateLink](self, "invalidateLink");
      v29 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
      if (v29)
        *(_QWORD *)(v29 + 128) = *(unsigned int *)((char *)&self->_ikeRetryCounter + 3);
      -[NRLink linkTotalReadyTimeInSec](self, "linkTotalReadyTimeInSec");
      v31 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
      if (v31)
      {
        *(_QWORD *)(v31 + 16) = v30;
        v32 = *(NWNetworkOfInterestManager **)((char *)&self->_symptomsNOIManager + 7);
      }
      else
      {
        v32 = 0;
      }
      v5 = v37;
      v27 = v36;
      objc_msgSend(v32, "submit");
      goto LABEL_21;
    }
    v25 = _NRLogIsLevelEnabled(v8, 0);

    if (v25)
    {
      v27 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v26);
      v14 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v27, 0, "%s%.30s:%-4d %@: link already cancelled", ", "-[NRLinkWiFi cancelWithReason:]", 383, v14);
LABEL_21:

    }
  }
  else
  {
    v34 = sub_100032FF0();
    v35 = _NRLogIsLevelEnabled(v34, 17);

    if (!v35)
      goto LABEL_23;
    v5 = sub_100032FF0();
    _NRLogWithArgs(v5, 17, "%s called with null reasonFormat", "-[NRLinkWiFi cancelWithReason:]");
  }

LABEL_23:
  return v4 != 0;
}

- (void)didStartTrackingNOI:(id)a3
{
  void *v4;
  int IsLevelEnabled;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  id v29;
  char v30;
  id v31;
  void *v32;
  int v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD handler[4];
  id v38;
  id location;

  v4 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0);

  if (IsLevelEnabled)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
    v8 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v7, 0, "%s%.30s:%-4d %@: submitting live-link monitor preferences", ", "-[NRLinkWiFi didStartTrackingNOI:]", 705, v8);

  }
  v9 = mach_absolute_time();
  v11 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
  if (v11)
    *(_QWORD *)(v11 + 112) = v9;
  if (*(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3) == -1)
  {
    if (!&_symptom_new)
    {
      v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v10);
      v16 = _NRLogIsLevelEnabled(v15, 16);

      if (v16)
      {
        v36 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v17);
        v18 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v36, 16, "%s%.30s:%-4d %@: SymptomReporterFramework not present, skipping.", ", "-[NRLinkWiFi startSymptomsMonitor]", 600, v18);

      }
      return;
    }
    if (qword_1001E48C0 != -1)
      dispatch_once(&qword_1001E48C0, &stru_1001B7CA0);
    v12 = symptom_new(qword_1001E48B8, 438273);
    if (!v12)
    {
      if (qword_1001E45E0 != -1)
        dispatch_once(&qword_1001E45E0, &stru_1001B6608);
      if (_NRLogIsLevelEnabled(qword_1001E45D8, 17))
      {
        if (qword_1001E45E0 != -1)
          dispatch_once(&qword_1001E45E0, &stru_1001B6608);
        _NRLogWithArgs(qword_1001E45D8, 17, "symptom_new failed");
      }
      return;
    }
    v13 = v12;
    if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
      v14 = (void *)NEVirtualInterfaceCopyName(-[NRLink virtualInterface](self, "virtualInterface"));
    else
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](self, "localInterfaceName"));
    v19 = v14;
    symptom_set_additional_qualifier(v13, 0, objc_msgSend(v14, "length"), objc_msgSend(v14, "UTF8String"));
    if (symptom_send(v13))
    {
      v21 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
      v22 = _NRLogIsLevelEnabled(v21, 17);

      if (v22)
      {
        v24 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v23);
        v25 = -[NRLink copyDescription](self, "copyDescription");
        _NRLogWithArgs(v24, 17, "%@: failed to send symptom to start link monitoring", v25);

      }
      goto LABEL_37;
    }
    objc_initWeak(&location, self);
    v26 = objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100035AC8;
    handler[3] = &unk_1001B8990;
    objc_copyWeak(&v38, &location);
    v27 = notify_register_dispatch("com.apple.symptoms.liveLinkHasAdvice", (int *)((char *)&self->_symptomsAdvisoryCounter + 3), v26, handler);

    if (v27 || *(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3) == -1)
    {
      if (qword_1001E45E0 != -1)
        dispatch_once(&qword_1001E45E0, &stru_1001B6608);
      v29 = (id)qword_1001E45D8;
      v30 = _NRLogIsLevelEnabled(v29, 17);

      if ((v30 & 1) == 0)
        goto LABEL_36;
      if (qword_1001E45E0 != -1)
        dispatch_once(&qword_1001E45E0, &stru_1001B6608);
      v31 = (id)qword_1001E45D8;
      _NRLogWithArgs(v31, 17, "notify_register_dispatch (status: %u, token: %d) failed", v27, *(unsigned int *)((char *)&self->_symptomsAdvisoryCounter + 3));
    }
    else
    {
      v32 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v28);
      v33 = _NRLogIsLevelEnabled(v32, 0);

      if (!v33)
      {
LABEL_36:
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
LABEL_37:

        return;
      }
      v31 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v34);
      v35 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v31, 0, "%s%.30s:%-4d %@: successfully sent symptom to start link monitoring on interface: %@", ", "-[NRLinkWiFi startSymptomsMonitor]", 656, v35, v19);

    }
    goto LABEL_36;
  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  uint64_t v4;
  void *v5;
  int IsLevelEnabled;
  uint64_t v7;
  void *v8;
  id v9;

  if (-[NRLink state](self, "state", a3) != 255)
  {
    v5 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v4);
    IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0);

    if (IsLevelEnabled)
    {
      v8 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v7);
      v9 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v8, 0, "%s%.30s:%-4d %@: re-submitting live-link monitor preferences", ", "-[NRLinkWiFi didStopTrackingAllNOIs:]", 717, v9);

    }
    sub_100035790((uint64_t)self, v7);
    sub_1000353EC((char *)self);
  }
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
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = a3;
  v5 = -[NRLink peerAvailabilityCheckInProgress](self, "peerAvailabilityCheckInProgress");
  v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
  IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0);

  if (v5)
  {
    if (IsLevelEnabled)
    {
      v17 = (id)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      v10 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v17, 0, "%s%.30s:%-4d %@: peer availability check already in progress, ignoring request", ", "-[NRLinkWiFi checkPeerAvailabilityWithForceAggressive:]", 727, v10);

    }
  }
  else
  {
    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
      v12 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d %@: peer availability check requested (aggresive: %d)", ", "-[NRLinkWiFi checkPeerAvailabilityWithForceAggressive:]", 730, v12, v3);

    }
    self->super._peerAvailabilityCheckInProgress = 1;
    objc_initWeak(&location, self);
    v13 = *(id *)((char *)&self->_ikeListener + 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
    if (v3)
      v15 = 1000;
    else
      v15 = 3000;
    if (v3)
      v16 = 5;
    else
      v16 = 3;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100035610;
    v18[3] = &unk_1001B7978;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v13, "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v16, v15, v14, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  char *v17;
  uint64_t (**v18)(id, void *);
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  int state;
  void *v28;
  id v29;
  unsigned int v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  uint64_t (**v35)(id, void *);
  char *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  id *v50;
  uint64_t (**v51)(id, void *);
  id v52;
  unsigned __int8 v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  char *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  int IsLevelEnabled;
  id v66;
  id v67;
  int v68;
  id v69;
  int v70;
  id v71;
  int v72;
  id v73;
  int v74;
  id v75;
  int v76;
  id v77;
  uint64_t v78;
  int *v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id v83;
  char *v84;
  id v85;
  id v86;
  id v87;
  objc_super v88;
  id v89;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (char *)a6;
  v18 = (uint64_t (**)(id, void *))a7;
  v19 = a8;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v19;
  if (!v14)
  {
    v64 = sub_100032FF0();
    IsLevelEnabled = _NRLogIsLevelEnabled(v64, 17);

    if (!IsLevelEnabled)
      goto LABEL_56;
    v66 = sub_100032FF0();
    _NRLogWithArgs(v66, 17, "%s called with null listener");
LABEL_48:

    goto LABEL_56;
  }
  if (!v15)
  {
    v67 = sub_100032FF0();
    v68 = _NRLogIsLevelEnabled(v67, 17);

    if (!v68)
      goto LABEL_56;
    v66 = sub_100032FF0();
    _NRLogWithArgs(v66, 17, "%s called with null session");
    goto LABEL_48;
  }
  if (!v16)
  {
    v69 = sub_100032FF0();
    v70 = _NRLogIsLevelEnabled(v69, 17);

    if (!v70)
      goto LABEL_56;
    v66 = sub_100032FF0();
    _NRLogWithArgs(v66, 17, "%s called with null sessionConfig");
    goto LABEL_48;
  }
  if (!v18)
  {
    v71 = sub_100032FF0();
    v72 = _NRLogIsLevelEnabled(v71, 17);

    if (!v72)
      goto LABEL_56;
    v66 = sub_100032FF0();
    _NRLogWithArgs(v66, 17, "%s called with null validateAuthBlock");
    goto LABEL_48;
  }
  if (v19)
  {
    v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    v23 = _NRLogIsLevelEnabled(v22, 0);

    if (v23)
    {
      v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      v26 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v25, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@", ", "-[NRLinkWiFi requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1117, v26, v14, v15, v16, v17);

    }
    state = self->super._state;
    v87 = v15;
    if (state == 255)
      goto LABEL_53;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    v86 = a4;
    if (qword_1001E4930 != -1)
      dispatch_once(&qword_1001E4930, &stru_1001B7DA8);
    v29 = (id)qword_1001E4928;
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
    {
      v34 = v16;
      v35 = v18;
      v36 = v17;
      v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
      v38 = _NRLogIsLevelEnabled(v37, 16);

      if (v38)
      {
        v40 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v39);
        v41 = -[NRLink copyDescription](self, "copyDescription");
        v42 = v34;
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localIdentifier"));
        _NRLogWithArgs(v40, 16, "%s%.30s:%-4d %@: Unrecognized identifier %@", ", "-[NRLinkWiFi requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1164, v41, v43);

        v33 = 0;
        v44 = 0;
        v17 = v36;
        v18 = v35;
        v16 = v42;
      }
      else
      {
        v33 = 0;
        v44 = 0;
        v17 = v36;
        v18 = v35;
        v16 = v34;
      }
      goto LABEL_54;
    }
    if (v17)
    {
      v32 = v17;
      v33 = sub_100112420();
      objc_msgSend(v33, "setMode:", 2);
      objc_msgSend(v33, "setReplayWindowSize:", 4);
    }
    else
    {
      if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
      {
LABEL_52:
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassC %@"), v15);
LABEL_53:
        v33 = 0;
        v44 = 0;
        goto LABEL_54;
      }
      v32 = 0;
      v33 = 0;
    }
    v45 = *(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7);
    if (v45)
    {
      sub_100006CA0(*(uint64_t *)((char *)&self->_randomUUIDForWiFiAssertion + 7));
      sub_100006684(v45, 6, 0);
      v46 = *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7);
      *(NSUUID **)((char *)&self->_randomUUIDForWiFiAssertion + 7) = 0;

    }
    v47 = *(id *)((char *)&self->_symptomsNOIManager + 7);
    if (v47)
      ++v47[8];

    v48 = mach_absolute_time();
    v49 = *(uint64_t *)((char *)&self->_symptomsNOIManager + 7);
    v17 = v32;
    if (v49)
      *(_QWORD *)(v49 + 32) = v48;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    v50 = (id *)sub_10012FFF4((uint64_t)NRDLocalDevice, v15);

    if (v50)
    {
      v44 = sub_100112798(0, v50, 3);
      if (sub_100112F4C(v50))
      {
        v83 = v16;
        v51 = v18;
        v85 = v14;
        v52 = v50[16];
        v53 = objc_msgSend(v52, "hasCompanionDatapath");

        v84 = v17;
        if ((v53 & 1) != 0)
          v54 = 0;
        else
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
        v55 = sub_100112FCC(v50, v54);
        v89 = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
        objc_msgSend(v44, "setCustomIKEAuthPrivateNotifies:", v56);

        v17 = v84;
        v14 = v85;
        v18 = v51;
        v16 = v83;
      }
      if ((v18[2](v18, v44) & 1) != 0)
      {
        v88.receiver = self;
        v88.super_class = (Class)NRLinkWiFi;
        -[NRLink invalidateIKESessionForClass:](&v88, "invalidateIKESessionForClass:", 3);
        -[NRLink setIkeClassDEstablished:](self, "setIkeClassDEstablished:", 0);
        self->super._peerAvailabilityCheckInProgress = 0;
        -[NRLink invalidateIKESession:](self, "invalidateIKESession:", (char *)&self->_ikeListener + 7);
        objc_storeStrong((id *)((char *)&self->_ikeListener + 7), v86);
        sub_1000331A0((uint64_t)self);
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016, CFSTR("ClassC %@"), v87);

        if (-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
        {
          ((void (**)(_QWORD, void *, id, NEVirtualInterface_s *))v21)[2](v21, v44, v33, -[NRLink virtualInterface](self, "virtualInterface"));
LABEL_55:

          v15 = v87;
          goto LABEL_56;
        }
        v58 = v17;
        v59 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v57);
        v60 = _NRLogIsLevelEnabled(v59, 17);

        if (v60)
        {
          v62 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v61);
          v63 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v62, 17, "%@: Failed to setup virtual interface", v63);

        }
        v17 = v58;
      }
      else
      {
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021, CFSTR("ClassC %@"), v87);

      }
LABEL_54:
      v21[2](v21, 0, 0, 0);
      goto LABEL_55;
    }
    v75 = sub_100032FF0();
    v76 = _NRLogIsLevelEnabled(v75, 16);

    if (v76)
    {
      v77 = sub_100032FF0();
      _NRLogWithArgs(v77, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLinkWiFi requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 1142);

    }
    v78 = _os_log_pack_size(12);
    v17 = (char *)&v82 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    v79 = __error();
    v80 = _os_log_pack_fill(v17, v78, *v79, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
    *(_DWORD *)v80 = 136446210;
    *(_QWORD *)(v80 + 4) = "-[NRLinkWiFi requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBl"
                           "ock:responseBlock:]";
    v81 = sub_100032FF0();
    _NRLogAbortWithPack(v81, v17);
    goto LABEL_52;
  }
  v73 = sub_100032FF0();
  v74 = _NRLogIsLevelEnabled(v73, 17);

  if (v74)
  {
    v66 = sub_100032FF0();
    _NRLogWithArgs(v66, 17, "%s called with null responseBlock");
    goto LABEL_48;
  }
LABEL_56:

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
      v7 = *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7);
      v20 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](self, "queue"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100033030;
      v17[3] = &unk_1001B7978;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v7, "sendPrivateNotifies:maxRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v8, 10, 1000, v9, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = sub_100032FF0();
      IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17);

      if (IsLevelEnabled)
      {
        v16 = sub_100032FF0();
        _NRLogWithArgs(v16, 17, "NEIKEv2PrivateNotify init %u %@ failed", 50702, v4);

      }
    }

  }
  else
  {
    v11 = sub_100032FF0();
    v12 = _NRLogIsLevelEnabled(v11, 17);

    if (v12)
    {
      v13 = sub_100032FF0();
      _NRLogWithArgs(v13, 17, "%s called with null data", "-[NRLinkWiFi sendControlData:]");

    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)suspend
{
  uint64_t v3;
  uint64_t v4;
  NRCompanionProxyAgent *companionProxyAgent;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NRLinkWiFi;
  -[NRLink suspend](&v18, "suspend");
  if (self->super._state != 255)
  {
    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9, CFSTR("(suspend)"));
    companionProxyAgent = self->super._companionProxyAgent;
    if (companionProxyAgent)
    {
      if ((sub_10005DA9C((uint64_t)companionProxyAgent, v4) & 1) != 0)
      {
        -[NRLink reportEvent:](self, "reportEvent:", 12003);
      }
      else
      {
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v6);
        IsLevelEnabled = _NRLogIsLevelEnabled(v12, 16);

        if (IsLevelEnabled)
        {
          v15 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v14);
          v16 = -[NRLink copyDescription](self, "copyDescription");
          _NRLogWithArgs(v15, 16, "%s%.30s:%-4d %@: failed to unregister companion agent", ", "-[NRLinkWiFi suspend]", 1240, v16);

        }
      }
    }
    -[NRLink setInterfaceRank](self, "setInterfaceRank");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
    objc_msgSend(v10, "linkIsSuspended:", self);
    goto LABEL_10;
  }
  v7 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v3);
  v8 = _NRLogIsLevelEnabled(v7, 1);

  if (v8)
  {
    v10 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v9);
    v11 = -[NRLink copyDescription](self, "copyDescription");
    _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'", ", "-[NRLinkWiFi suspend]", 1232, v11);

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
      _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'", ", "-[NRLinkWiFi resume]", 1256, v11);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NRLinkWiFi;
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
            _NRLogWithArgs(v15, 16, "%s%.30s:%-4d %@: failed to register companion agent", ", "-[NRLinkWiFi resume]", 1267, v16);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pairingClient + 7), 0);
  objc_storeStrong((id *)((char *)&self->_randomUUIDForWiFiAssertion + 7), 0);
  objc_storeStrong((id *)((char *)&self->_linkAnalytics + 7), 0);
  objc_storeStrong((id *)((char *)&self->_symptomsNOIManager + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassC + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPortString + 7), 0);
  objc_storeStrong((id *)((char *)&self->_notifyToken + 7), 0);
}

@end
