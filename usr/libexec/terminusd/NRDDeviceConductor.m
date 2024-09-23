@implementation NRDDeviceConductor

- (NSString)description
{
  id v3;
  NSUUID *nrUUID;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  if (self)
    nrUUID = self->_nrUUID;
  else
    nrUUID = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](nrUUID, "UUIDString"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("Conductor[%@]"), v5);

  return (NSString *)v6;
}

- (void)processAppStateChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EC06C;
  v7[3] = &unk_1001B8778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didUpdateDNSProxyState:(id)a3 state:(unsigned __int8)a4
{
  unsigned int v4;
  uint64_t v6;
  NRDiscoveryProxyServer *v7;
  NSUUID *nrUUID;
  void *v9;
  int IsLevelEnabled;
  uint64_t v11;
  NSUUID *v12;
  void *v13;
  NRDNSProxyServer *v14;
  NRDiscoveryProxyServer *discoveryProxyServer;
  NRDNSProxyClient *v16;
  NRDNSProxyClient *discoveryProxyClient;
  NRLinkDirectorMessage *v18;
  NSMutableSet *v19;
  NSMutableSet *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  id *p_dnsProxyServer;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  NWAddressEndpoint *serverEndpoint;
  NWAddressEndpoint *v31;
  void *v32;
  NRDNSProxyClient *v33;
  NRDNSProxyClient *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v4 = a4;
  v7 = (NRDiscoveryProxyServer *)a3;
  if (!v7)
    goto LABEL_30;
  if (self)
    nrUUID = self->_nrUUID;
  else
    nrUUID = 0;
  v9 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v6);
  IsLevelEnabled = _NRLogIsLevelEnabled(v9, 0);

  if (IsLevelEnabled)
  {
    if (self)
      v12 = self->_nrUUID;
    else
      v12 = 0;
    v13 = (void *)_NRCopyLogObjectForNRUUID(v12, v11);
    _NRLogWithArgs(v13, 0, "%s%.30s:%-4d received state update for %@ state: %d", ", "-[NRDDeviceConductor didUpdateDNSProxyState:state:]", 4549, v7, v4);

  }
  if (v4 != 4 && v4 != 2)
    goto LABEL_30;
  if (!self)
  {
    v16 = 0;
    discoveryProxyClient = 0;
    goto LABEL_15;
  }
  v14 = self->_dnsProxyServer;
  if (v14 == (NRDNSProxyServer *)v7)
  {

LABEL_22:
    v21 = objc_alloc_init((Class)NSMutableData);
    sub_1000EBEC8((uint64_t)self, v7, v21);
    v22 = sub_100022C18([NRLinkDirectorMessage alloc], self->_nrUUID);
    v23 = v22;
    if ((NRDiscoveryProxyServer *)self->_dnsProxyServer == v7)
    {
      sub_1000231F8((uint64_t)v22, 17, v21);
      if (v4 != 4)
      {
LABEL_29:
        sub_100024728((uint64_t)v23);

        goto LABEL_30;
      }
      p_dnsProxyServer = (id *)&self->_dnsProxyServer;
    }
    else
    {
      if (self->_discoveryProxyServer != v7)
        goto LABEL_29;
      sub_1000231F8((uint64_t)v22, 19, v21);
      if (v4 != 4)
        goto LABEL_29;
      p_dnsProxyServer = (id *)&self->_discoveryProxyServer;
    }
    objc_msgSend(*p_dnsProxyServer, "cancel");
    v25 = *p_dnsProxyServer;
    *p_dnsProxyServer = 0;

    goto LABEL_29;
  }
  discoveryProxyServer = self->_discoveryProxyServer;

  if (discoveryProxyServer == v7)
    goto LABEL_22;
  v16 = self->_dnsProxyClient;
  if (v16 != (NRDNSProxyClient *)v7)
  {
    discoveryProxyClient = self->_discoveryProxyClient;
LABEL_15:

    if (discoveryProxyClient != (NRDNSProxyClient *)v7)
      goto LABEL_30;
    if (v4 != 2)
    {
LABEL_17:
      v18 = [NRLinkDirectorMessage alloc];
      if (self)
      {
        v19 = (NSMutableSet *)sub_100022C18(v18, self->_nrUUID);
        v20 = v19;
        if ((NRDiscoveryProxyServer *)self->_dnsProxyClient == v7)
        {
          sub_100023678((uint64_t)v19, 16, 0);
          sub_1000EC044((uint64_t)self);
        }
        else if ((NRDiscoveryProxyServer *)self->_discoveryProxyClient == v7)
        {
          sub_100023678((uint64_t)v19, 18, 0);
          sub_1000EC058((uint64_t)self);
        }
      }
      else
      {
        v20 = (NSMutableSet *)sub_100022C18(v18, 0);
      }
      sub_100024728((uint64_t)v20);
      -[NRDiscoveryProxyServer cancel](v7, "cancel");
LABEL_48:

      goto LABEL_30;
    }
    goto LABEL_32;
  }

  if (v4 != 2)
    goto LABEL_17;
LABEL_32:
  if (self && (NRDiscoveryProxyServer *)self->_dnsProxyClient == v7)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = self->_availableLinks;
    v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v20);
          v32 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v32, "ikeClassDEstablished"))
          {
            v33 = self->_dnsProxyClient;
            v34 = v33;
            if (v33)
              serverEndpoint = v33->super._serverEndpoint;
            else
              serverEndpoint = 0;
            v31 = serverEndpoint;
            objc_msgSend(v32, "publishDNSConfig:", v31);

          }
        }
        v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v27);
    }
    goto LABEL_48;
  }
LABEL_30:

}

- (void)didStartTrackingNOI:(id)a3
{
  void *v4;
  int IsLevelEnabled;
  uint64_t v6;
  void *v7;
  NRAutoLinkUpgradeMonitor *v8;
  NSUUID *nrUUID;
  OS_dispatch_queue *v10;
  NRAutoLinkUpgradeMonitor *v11;
  NRAutoLinkUpgradeMonitor *v12;
  NRAutoLinkUpgradeMonitor *v13;
  NRAutoLinkUpgradeMonitor *v14;
  NRAutoLinkUpgradeMonitor *v15;
  NSNumber *v16;
  NSNumber *v17;
  NRAutoLinkUpgradeMonitor *aluMonitor;
  NRAutoLinkUpgradeMonitor *v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  NRAutoLinkUpgradeMonitor *v25;

  if (self && self->_isEnabled && self->_aluSupported)
  {
    v4 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, a2);
    IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0);

    if (IsLevelEnabled)
    {
      v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
      _NRLogWithArgs(v7, 0, "%s%.30s:%-4d AutoLinkUpgrade: Submitting start recommendation", ", "-[NRDDeviceConductor createALUMonitorIfNeeded]", 5179);

    }
    v8 = [NRAutoLinkUpgradeMonitor alloc];
    nrUUID = self->_nrUUID;
    v10 = self->_queue;
    v11 = (NRAutoLinkUpgradeMonitor *)sub_100067484((id *)&v8->super.isa, v10, nrUUID);

    v12 = self->_aluMonitor;
    if (!v12)
      goto LABEL_17;
    v13 = v12;
    v14 = self->_aluMonitor;
    v15 = v14;
    if (v14 && (v16 = v14->_lastReceivedAdviceID) != 0)
    {
      v17 = v16;
      aluMonitor = self->_aluMonitor;
      if (aluMonitor)
        aluMonitor = (NRAutoLinkUpgradeMonitor *)aluMonitor->_lastReceivedAdviceID;
      v19 = aluMonitor;
      v20 = -[NRAutoLinkUpgradeMonitor unsignedLongLongValue](v19, "unsignedLongLongValue");

      if (!v20)
        goto LABEL_17;
      v22 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v21);
      v23 = _NRLogIsLevelEnabled(v22, 1);

      if (!v23)
        goto LABEL_17;
      v13 = (NRAutoLinkUpgradeMonitor *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v24);
      _NRLogWithArgs(v13, 1, "%s%.30s:%-4d AutoLinkUpgrade: sending last received ALU advice to symptomsd", ", "-[NRDDeviceConductor createALUMonitorIfNeeded]", 5258);
    }
    else
    {

    }
LABEL_17:
    v25 = self->_aluMonitor;
    self->_aluMonitor = v11;

  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  NRDDeviceConductor *v3;
  void *v4;
  int IsLevelEnabled;
  uint64_t v6;
  NSUUID *nrUUID;
  void *v8;
  NRAutoLinkUpgradeMonitor *aluMonitor;
  NRLinkUpgradeReport *linkUpgradeReportWiFiInfra;
  NRLinkUpgradeReport *linkUpgradeReportForBTClassic;

  v3 = self;
  if (self)
    self = (NRDDeviceConductor *)self->_nrUUID;
  v4 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v4, 0);

  if (IsLevelEnabled)
  {
    if (v3)
      nrUUID = v3->_nrUUID;
    else
      nrUUID = 0;
    v8 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v6);
    _NRLogWithArgs(v8, 0, "%s%.30s:%-4d AutoLinkUpgrade: Re-submitting start recommendation", ", "-[NRDDeviceConductor didStopTrackingAllNOIs:]", 4984);

  }
  if (v3)
  {
    aluMonitor = v3->_aluMonitor;
    if (aluMonitor)
    {
      if (!-[NRAutoLinkUpgradeMonitor cancelled](v3->_aluMonitor, "cancelled"))
      {
        -[NRAutoLinkUpgradeMonitor setCancelled:](aluMonitor, "setCancelled:", 1);
        -[NRAutoLinkUpgradeMonitor setUpdateBlock:](aluMonitor, "setUpdateBlock:", 0);
        -[NRAutoLinkUpgradeMonitor invalidateAggregateStatsTimerSource](aluMonitor, "invalidateAggregateStatsTimerSource");
        -[NRAutoLinkUpgradeMonitor reportEvent:](aluMonitor, "reportEvent:", 30003);
      }
    }
    linkUpgradeReportWiFiInfra = v3->_linkUpgradeReportWiFiInfra;
    v3->_linkUpgradeReportWiFiInfra = 0;

    linkUpgradeReportForBTClassic = v3->_linkUpgradeReportForBTClassic;
    v3->_linkUpgradeReportForBTClassic = 0;

    *(_OWORD *)&v3->_effectiveALUAdvice = 0u;
    sub_1000EBDB0(v3);
  }
}

- (void)linkIsAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int IsLevelEnabled;
  NSUUID *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  _BYTE *v17;
  int latestPreferWiFiRequestType;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSUUID *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  NSUUID *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSUUID *StringFromNRLinkType;
  uint64_t v34;
  char *v35;
  NRLinkDirectorRequest *v36;
  NRLinkDirectorRequest *v37;
  int64_t v38;
  dispatch_time_t v39;
  NSObject *queue;
  uint64_t v41;
  id v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  NSUUID *v51;
  uint64_t v52;
  void *v53;
  unsigned __int8 *v54;
  uint64_t v55;
  int v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  id v61;
  int v62;
  id v63;
  unsigned __int8 *v64;
  uint64_t v65;
  int v66;
  void *v67;
  int v68;
  uint64_t v69;
  id v70;
  int v71;
  id v72;
  int *v73;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  _QWORD block[5];
  _QWORD v89[5];
  BOOL v90;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (self->_isEnabled)
    {
      v6 = objc_msgSend(v4, "state");
      v8 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      v9 = (void *)v8;
      if (v6 != 255)
      {
        IsLevelEnabled = _NRLogIsLevelEnabled(v8, 1);

        if (IsLevelEnabled)
        {
          v11 = self->_nrUUID;
          v13 = (void *)_NRCopyLogObjectForNRUUID(v11, v12);
          _NRLogWithArgs(v13, 1, "%s%.30s:%-4d link is available: %@", ", "-[NRDDeviceConductor linkIsAvailable:]", 5360, v4);

        }
        v14 = objc_msgSend(v4, "copyShortDescription");
        sub_100121E18(self->_nrUUID, 1004, 0, v14);

        -[NSMutableSet addObject:](self->_availableLinks, "addObject:", v4);
        objc_msgSend(v4, "setPolicyIdentifierString:", self->_policyIdentifier);
        objc_msgSend(v4, "setIsCompanionLink:", self->_isCompanionLink);
        sub_1000D7704((uint64_t)self, v4);
        switch(objc_msgSend(v4, "type"))
        {
          case 0u:
            v70 = sub_1000D5594();
            v71 = _NRLogIsLevelEnabled(v70, 16);

            if (v71)
            {
              v72 = sub_1000D5594();
              _NRLogWithArgs(v72, 16, "%s%.30s:%-4d ABORTING: %@ is available, but has no type", ", "-[NRDDeviceConductor linkIsAvailable:]", 5571, v4);

            }
            self = (NRDDeviceConductor *)_os_log_pack_size(22);
            v35 = (char *)block - ((__chkstk_darwin(self) + 15) & 0xFFFFFFFFFFFFFFF0);
            v73 = __error();
            v74 = _os_log_pack_fill(v35, self, *v73, &_mh_execute_header, "%{public}s %@ is available, but has no type");
            *(_DWORD *)v74 = 136446466;
            *(_QWORD *)(v74 + 4) = "-[NRDDeviceConductor linkIsAvailable:]";
            *(_WORD *)(v74 + 12) = 2112;
            *(_QWORD *)(v74 + 14) = v4;
            v75 = sub_1000D5594();
            _NRLogAbortWithPack(v75, v35);
            goto LABEL_78;
          case 1u:
            if (!self->_isPreferWiFiProvider)
              goto LABEL_56;
            if (self->_preferWiFiRequest)
              objc_msgSend(v4, "setSuspendWhenReady:", 1);
            objc_opt_self(NRDKeyManager);
            if (qword_1001E4AD8 != -1)
              dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
            v16 = (id)qword_1001E4AD0;
            v17 = v16;
            if (!v16)
              goto LABEL_49;
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v16 + 2));
            if (!v17[10])
            {
              v17[10] = 1;
              if (v17[8] == 4)
              {
                sub_10014A63C((uint64_t)v17);
                if (v17[9])
                {
                  v17[8] = 3;
                  sub_10014A8AC((uint64_t)v17);
                }
              }
            }
            if ((v17[8] & 0xFD) != 1)
            {
LABEL_49:

              goto LABEL_56;
            }
            latestPreferWiFiRequestType = self->_latestPreferWiFiRequestType;
            if (latestPreferWiFiRequestType == 2)
            {

            }
            else
            {

              if (latestPreferWiFiRequestType != 3)
                goto LABEL_56;
            }
            if (self->_latestPreferWiFiRequestType == 2)
            {
              v42 = sub_1000D4DBC((uint64_t)self);
              v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
              v44 = sub_100148DDC((_BOOL8)v43);

            }
            else
            {
              v44 = 0;
            }
            v89[0] = _NSConcreteStackBlock;
            v89[1] = 3221225472;
            v89[2] = sub_1000EBA50;
            v89[3] = &unk_1001B74A8;
            v89[4] = self;
            v90 = v44;
            sub_1000D78EC((uint64_t)self, v44, 0, 0, 1, v89);
LABEL_56:
            v45 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
            v46 = _NRLogIsLevelEnabled(v45, 1);

            if (v46)
            {
              v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v47);
              _NRLogWithArgs(v48, 1, "%s%.30s:%-4d Starting the Bluetooth link", ", "-[NRDDeviceConductor linkIsAvailable:]", 5413);

            }
LABEL_58:
            objc_msgSend(v4, "start");
            goto LABEL_59;
          case 2u:
            v34 = objc_opt_class(NRLinkWiFi);
            if ((objc_opt_isKindOfClass(v4, v34) & 1) == 0)
            {
              v64 = (unsigned __int8 *)sub_1000A315C((uint64_t)NRLinkDirector);
              if (!v64 || (v66 = v64[8], v64, !v66))
              {
                v67 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v65);
                v68 = _NRLogIsLevelEnabled(v67, 17);

                if (v68)
                {
                  StringFromNRLinkType = self->_nrUUID;
                  v31 = (void *)_NRCopyLogObjectForNRUUID(StringFromNRLinkType, v69);
                  _NRLogWithArgs(v31, 17, "Bad link %@", v4);
LABEL_27:

                }
                goto LABEL_59;
              }
            }
            v35 = (char *)v4;
            if (objc_msgSend(v35, "subtype") == 101)
            {
              dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
              if (self->_isAlwaysReachableOverWiFi)
              {
                v36 = objc_alloc_init(NRLinkDirectorRequest);
                v37 = v36;
                if (v36)
                {
                  v36->_type = 1;
                  v36->_requiredLinkType = 1;
                  *(_WORD *)&v36->_attemptImmediately = 257;
                }
                sub_1000D320C((uint64_t)self, v36);

              }
            }
            if (self->_isPreferWiFiProvider && !self->_isCoalescingLinkUpgradeRequest)
            {
              if (self->_supportsNAN || self->_supportsAWDL)
                v38 = 5000000000;
              else
                v38 = 1000000000;
              self->_isCoalescingLinkUpgradeRequest = 1;
              v39 = dispatch_time(0x8000000000000000, v38);
              queue = self->_queue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000EBB28;
              block[3] = &unk_1001B8AE0;
              block[4] = self;
              dispatch_after(v39, queue, block);
            }
            if (objc_msgSend(v35, "subtype") == 102)
            {
              if (self->_isCompanionLink)
                sub_1000D8588((uint64_t)self);
              else
                sub_1000D9D80((uint64_t)self);
              goto LABEL_43;
            }
            if (objc_msgSend(v35, "subtype") == 103 || objc_msgSend(v35, "subtype") == 104)
              goto LABEL_48;
            if (objc_msgSend(v35, "subtype") == 101)
            {
              if (self->_isAlwaysReachableOverWiFi || !self->_isCompanionLink)
              {
LABEL_48:
                objc_msgSend(v35, "start");

LABEL_59:
                sub_1000E96B0((uint64_t)self);
                sub_1000DAD34((uint64_t)self);
                goto LABEL_60;
              }
              v54 = (unsigned __int8 *)sub_1000A315C((uint64_t)NRLinkDirector);
              if (v54)
              {
                v56 = v54[8];

                if (v56)
                {
                  v57 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v55);
                  v58 = _NRLogIsLevelEnabled(v57, 0);

                  if (v58)
                  {
                    v60 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v59);
                    _NRLogWithArgs(v60, 0, "%s%.30s:%-4d Starting link for fixed interface mode", ", "-[NRDDeviceConductor linkIsAvailable:]", 5517);

                  }
                  goto LABEL_48;
                }
              }
LABEL_78:
              if (self->_pendingPreferWiFiRequest || self->_preferWiFiRequest || self->_bringUpWiFiImmediately)
              {
                v76 = sub_1000D4DBC((uint64_t)self);
                v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
                v78 = sub_10014725C((uint64_t)v77, self->_nrUUID);
                v79 = (void *)objc_claimAutoreleasedReturnValue(v78);

                if (v79)
                {
                  sub_1000D8588((uint64_t)self);
                }
                else
                {
                  v81 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v80);
                  v82 = _NRLogIsLevelEnabled(v81, 1);

                  if (v82)
                  {
                    v84 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v83);
                    _NRLogWithArgs(v84, 1, "%s%.30s:%-4d Enable WiFi without peer address. Ignoring availability", ", "-[NRDDeviceConductor linkIsAvailable:]", 5541);

                  }
                }
              }
              else
              {
                v85 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v55);
                v86 = _NRLogIsLevelEnabled(v85, 1);

                if (!v86)
                  goto LABEL_43;
                v79 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v87);
                _NRLogWithArgs(v79, 1, "%s%.30s:%-4d Neither do we have a prefer Wi-Fi request, nor do we need to bring up Wi-Fi immediately. Ignoring availability", ", "-[NRDDeviceConductor linkIsAvailable:]", 5535);
              }

            }
            else
            {
              v49 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v41);
              v50 = _NRLogIsLevelEnabled(v49, 17);

              if (v50)
              {
                v51 = self->_nrUUID;
                v53 = (void *)_NRCopyLogObjectForNRUUID(v51, v52);
                _NRLogWithArgs(v53, 17, "unsupported link subtype %@", v35);

                goto LABEL_59;
              }
            }
LABEL_43:

            goto LABEL_59;
          case 3u:
            v27 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
            v28 = _NRLogIsLevelEnabled(v27, 17);

            if (!v28)
              goto LABEL_59;
            v29 = self->_nrUUID;
            v31 = (void *)_NRCopyLogObjectForNRUUID(v29, v30);
            v32 = objc_msgSend(v4, "type");

            StringFromNRLinkType = (NSUUID *)createStringFromNRLinkType(v32);
            _NRLogWithArgs(v31, 17, "%@ link not supported yet", StringFromNRLinkType);
            goto LABEL_27;
          case 4u:
            sub_1000DAA00((uint64_t)self);
            goto LABEL_59;
          case 5u:
            goto LABEL_58;
          default:
            goto LABEL_59;
        }
      }
      v23 = _NRLogIsLevelEnabled(v8, 16);

      if (v23)
      {
        v24 = self->_nrUUID;
        v26 = (void *)_NRCopyLogObjectForNRUUID(v24, v25);
        _NRLogWithArgs(v26, 16, "%s%.30s:%-4d Ignoring link availability event as link was cancelled %@", ", "-[NRDDeviceConductor linkIsAvailable:]", 5355, v4);

      }
    }
    else
    {
      v19 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
      v20 = _NRLogIsLevelEnabled(v19, 1);

      if (v20)
      {
        v22 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v21);
        _NRLogWithArgs(v22, 1, "%s%.30s:%-4d Ignoring link availability event as conductor is disabled", ", "-[NRDDeviceConductor linkIsAvailable:]", 5350);

      }
    }
  }
  else
  {
    v61 = sub_1000D5594();
    v62 = _NRLogIsLevelEnabled(v61, 17);

    if (v62)
    {
      v63 = sub_1000D5594();
      _NRLogWithArgs(v63, 17, "%s called with null link", "-[NRDDeviceConductor linkIsAvailable:]");

    }
  }
LABEL_60:

}

- (void)linkIsReady:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  id v30;
  int v31;
  uint64_t v32;
  id v33;
  NRLinkUpgradeReport *v34;
  NSNumber *currentALUAdviceID;
  NRAutoLinkUpgradeMonitor *v36;
  NRQuickRelayAgent *quickRelayAgent;
  NRLinkDirectorRequest *v38;
  const char *v39;
  NRLinkDirectorRequest *v40;
  id v41;
  id *v42;
  id *v43;
  uint64_t v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  _BOOL4 isCurrentlyPairing;
  id v50;
  id v51;
  _UNKNOWN **v52;
  uint64_t v53;
  void *i;
  void *v55;
  id v56;
  _UNKNOWN **v57;
  NSMutableSet *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t v68;
  unsigned int v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  NSObject *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  NRDeviceEndpoint *discoveredEndpoint;
  uint64_t v86;
  NRDiscoveryClient *discoveryClient;
  NRDiscoveryClient *v88;
  id v89;
  int IsLevelEnabled;
  id v91;
  uint64_t v92;
  NRDDeviceConductor *v93;
  NSMutableSet *obj;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  void **newValue;
  uint64_t v105;
  void (*v106)(uint64_t);
  void *v107;
  NRDDeviceConductor *v108;

  v91 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v91)
  {
    v89 = sub_1000D5594();
    IsLevelEnabled = _NRLogIsLevelEnabled(v89, 17);

    if (!IsLevelEnabled)
      goto LABEL_95;
    v30 = sub_1000D5594();
    _NRLogWithArgs(v30, 17, "%s called with null link");
    goto LABEL_22;
  }
  if (!self->_isEnabled)
  {
    v27 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
    v28 = _NRLogIsLevelEnabled(v27, 1);

    if (!v28)
      goto LABEL_95;
    v30 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v29);
    _NRLogWithArgs(v30, 1, "%s%.30s:%-4d Ignoring link ready event as conductor is disabled");
LABEL_22:

    goto LABEL_95;
  }
  v6 = objc_msgSend(v91, "state");
  v8 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
  v9 = (void *)v8;
  if (v6 == 255)
  {
    v31 = _NRLogIsLevelEnabled(v8, 16);

    if (!v31)
      goto LABEL_95;
    v30 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v32);
    _NRLogWithArgs(v30, 16, "%s%.30s:%-4d Ignoring link ready event as link was cancelled %@", ", "-[NRDDeviceConductor linkIsReady:]", 5590, v91);
    goto LABEL_22;
  }
  v10 = _NRLogIsLevelEnabled(v8, 1);

  if (v10)
  {
    v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v11);
    _NRLogWithArgs(v12, 1, "%s%.30s:%-4d link is ready: %@", ", "-[NRDDeviceConductor linkIsReady:]", 5595, v91);

  }
  v13 = objc_msgSend(v91, "copyShortDescription");
  sub_1000D5060((uint64_t)self, 1005, CFSTR("%@"), v14, v15, v16, v17, v18, (uint64_t)v13);

  sub_1000E3160((void **)&self->super.isa);
  sub_1000E3DB8((uint64_t)self);
  if (objc_msgSend(v91, "suspendWhenReady"))
  {
    v20 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v19);
    v21 = _NRLogIsLevelEnabled(v20, 1);

    if (v21)
    {
      v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
      _NRLogWithArgs(v23, 1, "%s%.30s:%-4d Suspending link as it is ready: %@", ", "-[NRDDeviceConductor linkIsReady:]", 5601, v91);

    }
    objc_msgSend(v91, "setSuspendWhenReady:", 0);
    objc_msgSend(v91, "suspend");
  }
  if (objc_msgSend(v91, "type") == 1)
  {
    sub_1000D8F08((uint64_t)self);
    sub_10003064C((uint64_t)self->_quickRelayAgent);
    if (self->_alwaysOnWiFiQueryComplete && !self->_alwaysOnWiFiUpdateSent)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      if (!self->_isAlwaysReachableOverWiFi)
      {
        self->_alwaysOnWiFiQueryComplete = 1;
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        v25 = sub_1000D8AA8((uint64_t)self, 1, 0);
        v26 = v25;
        if (v25)
          self->_alwaysOnWiFiUpdateSent = sub_10009FA90((uint64_t)v25);

      }
    }
    sub_1000D3114((uint64_t)self, v24);
    goto LABEL_43;
  }
  if (objc_msgSend(v91, "type") == 2)
  {
    if (objc_msgSend(v91, "subtype") == 101)
    {
      v33 = sub_1000D8AA8((uint64_t)self, 2, 102);
      if (objc_msgSend(v33, "startRequested") && !self->_needsAWDL)
        objc_msgSend(v33, "cancelWithReason:", CFSTR("not needed anymore"));
      if (self->_preferWiFiRequest || (self->_effectiveALUAdvice & 4) != 0)
      {
        v34 = self->_linkUpgradeReportWiFiInfra;
        if (v34)
          v34->_flags |= 0x800u;

        if ((self->_effectiveALUAdvice & 4) != 0)
        {
          currentALUAdviceID = self->_currentALUAdviceID;
          v36 = self->_aluMonitor;
          sub_10006762C(v36, currentALUAdviceID);

        }
      }
LABEL_42:

    }
  }
  else if (objc_msgSend(v91, "type") == 4)
  {
    quickRelayAgent = self->_quickRelayAgent;
    if (quickRelayAgent && quickRelayAgent->_state.state != 2)
    {
      quickRelayAgent->_state.state = 2;
      -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
    }
    v38 = objc_alloc_init(NRLinkDirectorRequest);
    v40 = v38;
    if (v38)
    {
      v38->_type = 8;
      v38->_allowsSuspendedLink = 0;
      v38->_requiredLinkType = 1;
      newValue = _NSConcreteStackBlock;
      v105 = 3221225472;
      v106 = sub_1000DACB0;
      v107 = &unk_1001B8AE0;
      v108 = self;
      objc_setProperty_nonatomic_copy(v38, v39, &newValue, 48);
    }
    else
    {
      newValue = _NSConcreteStackBlock;
      v105 = 3221225472;
      v106 = sub_1000DACB0;
      v107 = &unk_1001B8AE0;
      v108 = self;
    }
    sub_1000D320C((uint64_t)self, v40);

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v33 = sub_1000D8AA8((uint64_t)self, 2, 101);
    if (objc_msgSend(v33, "state") == 8)
      objc_msgSend(v33, "checkPeerAvailabilityWithForceAggressive:", 1);
    goto LABEL_42;
  }
LABEL_43:
  sub_1000E4040((void **)&self->super.isa);
  sub_1000E4690((char *)self, v91);
  v41 = v91;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_helloMessageSent)
  {
    v42 = (id *)sub_100022B68([NRLinkDirectorMessage alloc], self->_nrUUID);
    v43 = v42;
    if (v42)
    {
      objc_storeStrong(v42 + 3, a3);
      sub_1000231F8((uint64_t)v43, 1, 0);
    }
    sub_100024728((uint64_t)v43);
    self->_helloMessageSent = 1;

  }
  sub_1000E12D4((uint64_t)self);
  sub_1000E7D54((uint64_t)self);
  if (objc_msgSend(v41, "type") == 1 && (sub_1000D4C80((uint64_t)self, 1) & 1) == 0)
  {
    sub_1000DA844((uint64_t)self, 1);
  }
  else
  {
    v45 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v44);
    v46 = _NRLogIsLevelEnabled(v45, 0);

    if (v46)
    {
      v48 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v47);
      _NRLogWithArgs(v48, 0, "%s%.30s:%-4d Update WiFi request already present", ", "-[NRDDeviceConductor linkIsReady:]", 5661);

    }
  }
  sub_1000E96B0((uint64_t)self);
  sub_1000DAD34((uint64_t)self);
  sub_1000E1540((uint64_t)self, v41);
  sub_1000DBB4C((uint64_t)self, v41);
  sub_1000DB7A8((uint64_t)self, v41);
  sub_1000DB998((uint64_t)self, v41);
  if (self->_hasPendingImmediateNetInfoUpdateMessage)
    sub_1000DD564((uint64_t)self);
  sub_1000DFCE8((unsigned int *)self);
  sub_1000DF834((uint64_t)self);
  isCurrentlyPairing = self->_isCurrentlyPairing;
  self->_isCurrentlyPairing = 0;
  if (isCurrentlyPairing && objc_msgSend(v41, "subtype") != 103)
  {
    discoveredEndpoint = self->_discoveredEndpoint;
    self->_discoveredEndpoint = 0;

    discoveryClient = self->_discoveryClient;
    if (discoveryClient)
    {
      sub_100119F6C((uint64_t)discoveryClient, v86);
      v88 = self->_discoveryClient;
      self->_discoveryClient = 0;

    }
    sub_1000D56B8((uint64_t)self, objc_msgSend(v41, "type"), (char)objc_msgSend(v41, "subtype"));
  }
  else if (sub_1000D5F48((uint64_t)self))
  {
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = self->_availableLinks;
    v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, &newValue, 16);
    if (v50)
    {
      v51 = v50;
      v52 = &APSConnectionOverrideNamedDelegatePort_ptr;
      v53 = *(_QWORD *)v100;
      v92 = *(_QWORD *)v100;
      v93 = self;
      do
      {
        for (i = 0; i != v51; i = (char *)i + 1)
        {
          if (*(_QWORD *)v100 != v53)
            objc_enumerationMutation(obj);
          v55 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v55, "state") != 8)
          {
            v56 = v51;
            v57 = v52;
            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            v58 = self->_availableLinks;
            v59 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
            if (v59)
            {
              v60 = v59;
              v61 = *(_QWORD *)v96;
LABEL_69:
              v62 = 0;
              while (1)
              {
                if (*(_QWORD *)v96 != v61)
                  objc_enumerationMutation(v58);
                v63 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v62);
                v64 = objc_msgSend(v63, "type");
                if (v64 == objc_msgSend(v55, "type"))
                {
                  v65 = objc_msgSend(v63, "subtype");
                  if (v65 == objc_msgSend(v55, "subtype")
                    && objc_msgSend(v63, "state") == 8)
                  {
                    break;
                  }
                }
                if (v60 == (id)++v62)
                {
                  v60 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
                  if (!v60)
                    goto LABEL_77;
                  goto LABEL_69;
                }
              }

              v52 = v57;
              v51 = v56;
              v53 = v92;
              self = v93;
            }
            else
            {
LABEL_77:

              v66 = objc_msgSend(v55, "type");
              v67 = objc_msgSend(v55, "subtype");
              self = v93;
              v52 = v57;
              v51 = v56;
              v53 = v92;
              if (!sub_1000D5F48((uint64_t)v93))
                continue;
              v69 = (v67 - 101);
              if (v69 >= 4)
              {
                if (v66 >= 6 || (v70 = 0x40300020100uLL >> (8 * v66), !(_BYTE)v70))
                {
LABEL_88:
                  v81 = (void *)_NRCopyLogObjectForNRUUID(v93->_nrUUID, v68);
                  v82 = _NRLogIsLevelEnabled(v81, 16);

                  if (v82)
                  {
                    v84 = (void *)_NRCopyLogObjectForNRUUID(v93->_nrUUID, v83);
                    _NRLogWithArgs(v84, 16, "%s%.30s:%-4d invalid link type/subtype %u/%u", ", "-[NRDDeviceConductor stopDiscoveryOverLinkType:subtype:]", 7452, v66, v67);

                  }
                  continue;
                }
              }
              else
              {
                LODWORD(v70) = 0x7060502u >> (8 * v69);
                if (!(_BYTE)v70)
                  goto LABEL_88;
              }
              v71 = (uint64_t)v93->_discoveryClient;
              if (v71)
              {
                v72 = *(void **)(v71 + 104);
                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52[153], "numberWithUnsignedChar:", v70));
                objc_msgSend(v72, "removeObject:", v73);

                if (*(_BYTE *)(v71 + 19))
                {
                  if (*(_BYTE *)(v71 + 20))
                  {
                    v74 = v52[153];
                    v75 = *(id *)(v71 + 168);
                    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "numberWithUnsignedChar:", v70));
                    v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", v76));

                    if (v77)
                    {
                      nw_browser_cancel(v77);
                      v78 = v52[153];
                      v79 = *(id *)(v71 + 168);
                      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "numberWithUnsignedChar:", v70));
                      objc_msgSend(v79, "setObject:forKeyedSubscript:", 0, v80);

                    }
                    sub_10011D96C(v71, v70);
                    self = v93;
                  }
                }
              }
            }
          }
        }
        v51 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, &newValue, 16);
      }
      while (v51);
    }

  }
  sub_1000E9B4C((uint64_t)self);
LABEL_95:

}

- (void)linkIsSuspended:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  NRQuickRelayAgent *quickRelayAgent;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  id v29;
  int IsLevelEnabled;
  uint64_t v31;
  id v32;
  id v33;

  v33 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v33)
  {
    v29 = sub_1000D5594();
    IsLevelEnabled = _NRLogIsLevelEnabled(v29, 17);

    if (!IsLevelEnabled)
      goto LABEL_17;
    v20 = sub_1000D5594();
    _NRLogWithArgs(v20, 17, "%s called with null link");
    goto LABEL_16;
  }
  if (self->_isEnabled)
  {
    if (objc_msgSend(v33, "state") == 255)
    {
      v26 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
      v27 = _NRLogIsLevelEnabled(v26, 16);

      if (v27)
      {
        v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v28);
        v20 = (id)v19;
        v31 = 5704;
        v32 = v33;
        v21 = "%s%.30s:%-4d Ignoring link suspended event as link was cancelled %@";
        v25 = 16;
        goto LABEL_15;
      }
    }
    else
    {
      queue = self->_queue;
      v7 = v33;
      dispatch_assert_queue_V2(queue);
      objc_msgSend(v7, "removePolicies");

      sub_1000E12D4((uint64_t)self);
      sub_1000DAD34((uint64_t)self);
      if (objc_msgSend(v7, "type") == 4)
      {
        quickRelayAgent = self->_quickRelayAgent;
        if (quickRelayAgent)
        {
          if (quickRelayAgent->_state.state != 1)
          {
            quickRelayAgent->_state.state = 1;
            -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
          }
        }
      }
      v9 = objc_msgSend(v7, "copyShortDescription");
      sub_1000D5060((uint64_t)self, 1006, CFSTR("%@"), v10, v11, v12, v13, v14, (uint64_t)v9);

      v16 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
      v17 = _NRLogIsLevelEnabled(v16, 1);

      if (v17)
      {
        v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v18);
        v20 = (id)v19;
        v31 = 5719;
        v32 = v7;
        v21 = "%s%.30s:%-4d link is suspended: %@";
LABEL_12:
        v25 = 1;
LABEL_15:
        _NRLogWithArgs(v19, v25, v21, ", "-[NRDDeviceConductor linkIsSuspended:]", v31, v32);
LABEL_16:

      }
    }
  }
  else
  {
    v22 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
    v23 = _NRLogIsLevelEnabled(v22, 1);

    if (v23)
    {
      v19 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v24);
      v20 = (id)v19;
      v31 = 5699;
      v21 = "%s%.30s:%-4d Ignoring link suspended event as conductor is disabled";
      goto LABEL_12;
    }
  }
LABEL_17:

}

- (void)linkIsUnavailable:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 isEnabled;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _BOOL4 v19;
  NRQuickRelayAgent *quickRelayAgent;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  NSMutableSet *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  char v49;
  id v50;
  uint64_t v51;
  void *v52;
  int v53;
  NSUUID *v54;
  uint64_t v55;
  void *v56;
  NSObject *queue;
  id v58;
  id v59;
  int IsLevelEnabled;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  _BYTE v67[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
  {
    v59 = sub_1000D5594();
    IsLevelEnabled = _NRLogIsLevelEnabled(v59, 17);

    if (!IsLevelEnabled)
      goto LABEL_81;
    v18 = sub_1000D5594();
    _NRLogWithArgs(v18, 17, "%s called with null link");
    goto LABEL_11;
  }
  isEnabled = self->_isEnabled;
  v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v5);
  v8 = _NRLogIsLevelEnabled(v7, 1);

  if (!isEnabled)
  {
    if (!v8)
      goto LABEL_81;
    v18 = (id)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    _NRLogWithArgs(v18, 1, "%s%.30s:%-4d Ignoring link unavailability event as conductor is disabled");
LABEL_11:

    goto LABEL_81;
  }
  if (v8)
  {
    v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    _NRLogWithArgs(v10, 1, "%s%.30s:%-4d link is unavailable: %@", ", "-[NRDDeviceConductor linkIsUnavailable:]", 5733, v4);

  }
  v11 = objc_msgSend(v4, "copyShortDescription");
  sub_1000D5060((uint64_t)self, 1007, CFSTR("%@"), v12, v13, v14, v15, v16, (uint64_t)v11);

  -[NSMutableSet removeObject:](self->_availableLinks, "removeObject:", v4);
  if (objc_msgSend(v4, "type") == 1)
  {
    sub_1000E0FAC((uint64_t)self);
    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v17 = (id)qword_1001E4708;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000E10BC;
    v66[3] = &unk_1001B8AE0;
    v66[4] = self;
    sub_1000AEC6C((uint64_t)v17, v66);
    goto LABEL_72;
  }
  if (objc_msgSend(v4, "type") != 2)
  {
    if (objc_msgSend(v4, "type") == 4)
    {
      quickRelayAgent = self->_quickRelayAgent;
      if (quickRelayAgent)
      {
        if (quickRelayAgent->_state.state != 1)
        {
          quickRelayAgent->_state.state = 1;
          -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
        }
      }
    }
    goto LABEL_73;
  }
  v19 = objc_msgSend(v4, "subtype") == 103 || objc_msgSend(v4, "subtype") == 102;
  v17 = sub_1000D8AA8((uint64_t)self, 2, 102);
  v21 = sub_1000D8AA8((uint64_t)self, 2, 103);
  if (v19)
  {
    if (objc_msgSend(v4, "startRequested"))
    {
      if (!self->_peerDeviceIsNearby)
        sub_1000E129C((uint64_t)self);
      goto LABEL_29;
    }
  }
  else
  {
    if ((objc_msgSend(v17, "state") == 255 || (objc_msgSend(v17, "startRequested") & 1) == 0)
      && (objc_msgSend(v21, "state") == 255 || !objc_msgSend(v21, "startRequested")))
    {
LABEL_29:
      if (self->_pendingPreferWiFiRequest)
        sub_1000D8BE4((uint64_t)self, 2u);
      if (self->_isPreferWiFiProvider)
      {
        if (self->_preferWiFiRequest && !self->_preferwiFiTimeoutSet)
        {
          v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
          v24 = _NRLogIsLevelEnabled(v23, 1);

          if (v24)
          {
            v32 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v25);
            _NRLogWithArgs(v32, 1, "%s%.30s:%-4d Wi-Fi link went away while servicing prefer Wi-Fi request", ", "-[NRDDeviceConductor linkIsUnavailable:]", 5803);

          }
          sub_1000DA624((uint64_t)self, CFSTR("Wi-Fi link went away"), v26, v27, v28, v29, v30, v31, v61);
          v33 = sub_1000D4DBC((uint64_t)self);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          self->_pendingPreferWiFiRequest = sub_100148DDC((_BOOL8)v34);

        }
        if (self->_preferwiFiTimeoutSet)
        {
          v35 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
          v36 = _NRLogIsLevelEnabled(v35, 0);

          if (v36)
          {
            v37 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
            _NRLogWithArgs(v37, 0, "%s%.30s:%-4d Not rejecting prefer wifi request as connection is in progress", ", "-[NRDDeviceConductor linkIsUnavailable:]", 5808);

          }
        }
      }
      if (self->_bringUpWiFiImmediately)
      {
        v38 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
        v39 = _NRLogIsLevelEnabled(v38, 1);

        if (v39)
        {
          v41 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v40);
          _NRLogWithArgs(v41, 1, "%s%.30s:%-4d Wi-Fi link went away when we need it immediately", ", "-[NRDDeviceConductor linkIsUnavailable:]", 5814);

        }
        sub_1000D9BA0((uint64_t)self);
      }
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v42 = self->_availableLinks;
      v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (v43)
      {
        v44 = v43;
        v45 = 0;
        v46 = *(_QWORD *)v63;
        while (2)
        {
          v47 = 0;
          v48 = v45;
          do
          {
            if (*(_QWORD *)v63 != v46)
              objc_enumerationMutation(v42);
            v45 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v47);

            if (objc_msgSend(v45, "type") == 1)
            {
              v49 = 0;
              goto LABEL_55;
            }
            v47 = (char *)v47 + 1;
            v48 = v45;
          }
          while (v44 != v47);
          v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
          if (v44)
            continue;
          break;
        }

      }
      v45 = 0;
      v49 = 1;
LABEL_55:

      v50 = sub_1000D8AA8((uint64_t)self, 2, 101);
      if (objc_msgSend(v17, "state") != 8 && objc_msgSend(v50, "state") != 8)
      {
        if (objc_msgSend(v17, "state") != 255
          && (objc_msgSend(v17, "startRequested") & 1) != 0
          || objc_msgSend(v50, "state") != 255 && objc_msgSend(v50, "startRequested"))
        {
          sub_1000D808C((uint64_t)self);
        }
        if ((v49 & 1) == 0)
        {
          v52 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v51);
          v53 = _NRLogIsLevelEnabled(v52, 1);

          if (v53)
          {
            v54 = self->_nrUUID;
            v56 = (void *)_NRCopyLogObjectForNRUUID(v54, v55);
            _NRLogWithArgs(v56, 1, "%s%.30s:%-4d Found BT link %@", ", "-[NRDDeviceConductor linkIsUnavailable:]", 5851, v45, (_QWORD)v62);

          }
          if (objc_msgSend(v45, "state") == 9 && !self->_preferwiFiTimeoutSet)
          {
            objc_msgSend(v45, "resume");
          }
          else if (objc_msgSend(v45, "state") == 1)
          {
            objc_msgSend(v45, "start");
          }
        }
      }

      goto LABEL_71;
    }
    sub_1000D834C((uint64_t)self);
  }
LABEL_71:

LABEL_72:
LABEL_73:
  queue = self->_queue;
  v58 = v4;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v58, "removePolicies");

  sub_1000E12D4((uint64_t)self);
  sub_1000DAD34((uint64_t)self);
  if (objc_msgSend(v58, "subtype") != 102
    && objc_msgSend(v58, "subtype") != 103
    && objc_msgSend(v58, "subtype") != 104
    && objc_msgSend(v58, "type") != 4
    || objc_msgSend(v58, "startRequested"))
  {
    sub_1000E1540((uint64_t)self, self->_primaryLink);
  }
  if (objc_msgSend(v58, "startRequested"))
    sub_1000E18BC((uint64_t)self);
LABEL_81:

}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  NSUUID *nrUUID;
  NSUUID *v12;
  uint64_t v13;
  void *v14;
  int IsLevelEnabled;
  NSUUID *v16;
  uint64_t v17;
  void *v18;
  NSUUID *v19;
  _QWORD *v20;
  uint64_t v21;
  unsigned __int16 *v22;
  void *v23;
  __objc2_class *v24;
  __objc2_prot *v25;
  NSUUID *v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSUUID *v30;
  uint64_t v31;
  void *v32;
  NSUUID *v33;
  uint64_t v34;
  void *v35;
  int v36;
  NSUUID *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id *v41;
  id *v42;
  id v43;
  _BYTE *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id *v55;
  NSObject *v56;
  BOOL v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  _QWORD *v69;
  unsigned __int16 *v70;
  void *v71;
  unsigned __int16 *v72;
  void *v73;
  unsigned __int16 *v74;
  void *v75;
  unsigned __int16 *v76;
  void *v77;
  _QWORD *v78;
  unsigned __int16 *v79;
  void *v80;
  unsigned __int16 *v81;
  void *v82;
  _QWORD *v83;
  unsigned __int16 *v84;
  void *v85;
  unsigned __int16 *v86;
  void *v87;
  unsigned __int16 *v88;
  void *v89;
  id v90;
  _QWORD *v91;
  unsigned __int16 *v92;
  void *v93;
  NSUUID *v94;
  NSUUID *forcedWoWUUID;
  id v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  id *v103;
  dispatch_time_t v104;
  NSObject *queue;
  unsigned __int16 *v106;
  void *v107;
  NRDDeviceConductor *v108;
  char v109;
  char *v110;
  char *v111;
  uint64_t v112;
  int v113;
  NRNetInfo *netInfo;
  char v115;
  uint64_t v116;
  int v117;
  unsigned __int16 *v118;
  void *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  id v123;
  id v124;
  NSData *v125;
  unsigned int v126;
  NSUUID *v127;
  uint64_t v128;
  void *v129;
  int v130;
  NSUUID *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  NSUUID *v135;
  uint64_t v136;
  void *v137;
  int v138;
  NSUUID *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  uint64_t v147;
  void *i;
  OS_dispatch_queue *v149;
  uint64_t v150;
  void *v151;
  OS_nw_agent *v152;
  void *v153;
  OS_nw_agent *v154;
  id v155;
  NSUUID *v156;
  uint64_t v157;
  void *v158;
  int v159;
  NSUUID *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  id v169;
  NSString *v170;
  id v171;
  id *v172;
  id v173;
  void *v174;
  id v175;
  OS_dispatch_queue *v176;
  uint64_t v177;
  OS_nw_agent *companionNWDescAgent;
  id v179;
  id v180;
  dispatch_data_t v181;
  id v182;
  id v183;
  id v184;
  void *v185;
  void **v186;
  void *v187;
  void (*v188)(uint64_t);
  void *v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unsigned int v198;
  const char *v199;
  NSMutableSet *v200;
  id v201;
  id v202;
  uint64_t v203;
  void *j;
  void *v205;
  void *v206;
  NSUUID *v207;
  NEVirtualInterface_s *catchAllInterface;
  void *v209;
  unsigned __int16 *v210;
  unsigned __int16 *v211;
  id v212;
  id v213;
  uint64_t v214;
  void *k;
  char v216;
  void *v217;
  void *v218;
  uint64_t v219;
  id v220;
  id v221;
  id v222;
  int v223;
  uint64_t v224;
  void *v225;
  int v226;
  unsigned __int8 v227;
  void *StringFromNRLinkType;
  NSUUID *v229;
  uint64_t v230;
  void *v231;
  int v232;
  NSUUID *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  _QWORD *v237;
  unsigned __int16 *v238;
  void *v239;
  unsigned __int16 *v240;
  void *v241;
  int v242;
  unsigned __int16 *v243;
  void *v244;
  unsigned __int16 *v245;
  void *v246;
  void *v247;
  unsigned int v248;
  unsigned __int16 *v249;
  void *v250;
  unsigned __int16 *v251;
  void *v252;
  unsigned __int16 *v253;
  void *v254;
  unsigned __int16 *v255;
  void *v256;
  __objc2_meth_list *v257;
  unsigned __int16 *v258;
  void *v259;
  unsigned __int16 *v260;
  void *v261;
  id v262;
  uint64_t v263;
  void *v264;
  int v265;
  uint64_t v266;
  void *v267;
  id v268;
  id v269;
  id v270;
  void *ii;
  NSString *v272;
  id v273;
  void *v274;
  void *v275;
  id v276;
  id v277;
  void *v278;
  void *v279;
  NRApplicationServiceClient *asClient;
  id v281;
  id v282;
  id *v283;
  NSObject *v284;
  NSObject *v285;
  id v286;
  int v287;
  unsigned __int16 *v288;
  void *v289;
  unsigned __int16 *v290;
  void *v291;
  id v292;
  char *v293;
  id v294;
  uint64_t v295;
  void *v296;
  int v297;
  uint64_t v298;
  void *v299;
  __objc2_prot *v300;
  __objc2_prot *v301;
  uint64_t v302;
  id v303;
  id v304;
  void *v305;
  NRApplicationServiceClient *v306;
  NRApplicationServiceClient *v307;
  NSMutableArray *asNamesForResolving;
  NSMutableArray *v309;
  unsigned int v310;
  id v311;
  void *v312;
  NRApplicationServiceClient *v313;
  uint64_t v314;
  id v315;
  void *v316;
  id v317;
  id v318;
  id v319;
  uint64_t v320;
  void *jj;
  __objc2_prot *v322;
  void *isa;
  uint64_t v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  id v328;
  int v329;
  unsigned __int16 *v330;
  unsigned __int16 *v331;
  unsigned __int16 *v332;
  id v333;
  id v334;
  id v335;
  uint64_t v336;
  void *m;
  unsigned __int8 v338;
  void *v339;
  void *v340;
  uint64_t v341;
  id v342;
  id v343;
  int v344;
  uint64_t v345;
  void *v346;
  int v347;
  unsigned __int8 v348;
  void *StringFromNRLinkSubtype;
  NSUUID *v350;
  uint64_t v351;
  void *v352;
  int v353;
  NSUUID *v354;
  uint64_t v355;
  void *v356;
  uint64_t v357;
  NSUUID *v358;
  uint64_t v359;
  void *v360;
  int v361;
  NSUUID *v362;
  uint64_t v363;
  void *v364;
  NRLink *v365;
  void *v366;
  NRLink *v367;
  void *v368;
  void *v369;
  void *v370;
  unsigned __int8 v371;
  NSUUID *v372;
  uint64_t v373;
  void *v374;
  int v375;
  NSUUID *v376;
  uint64_t v377;
  void *v378;
  NSUUID *v379;
  uint64_t v380;
  void *v381;
  int v382;
  NSUUID *v383;
  uint64_t v384;
  void *v385;
  void *v386;
  id v387;
  uint64_t v388;
  void *v389;
  uint64_t v390;
  void *v391;
  int v392;
  uint64_t v393;
  void *v394;
  id v395;
  void *v396;
  id v397;
  void *v398;
  int v399;
  uint64_t v400;
  void *v401;
  void *v402;
  uint64_t v403;
  void *v404;
  int v405;
  uint64_t v406;
  void *v407;
  uint64_t v408;
  void *v409;
  int v410;
  uint64_t v411;
  NSMutableSet *v412;
  id v413;
  id v414;
  id v415;
  uint64_t v416;
  void *n;
  void *v418;
  void *v419;
  void *v420;
  unsigned __int8 v421;
  const char *v422;
  id v423;
  void *v424;
  id v425;
  _QWORD *v426;
  id v427;
  char *v428;
  id *v429;
  id v430;
  void *v431;
  id v432;
  dispatch_data_t v433;
  uint64_t v434;
  id obj;
  char *obja;
  id objb;
  int objc;
  _QWORD *v439;
  id v440;
  id v441;
  id v442;
  id v443;
  id v444;
  id v445;
  NRDDeviceConductor *v446;
  id v447;
  int v448;
  void *v449;
  uint64_t v450;
  unsigned __int8 v451;
  id v452;
  unsigned __int8 v453;
  uint64_t v454;
  id v455;
  _QWORD v456[5];
  _QWORD *v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  _QWORD v478[5];
  id v479;
  _QWORD v480[5];
  char *v481;
  id v482;
  _BYTE v483[128];
  _BYTE v484[128];
  _BYTE v485[128];
  _BYTE v486[128];
  void *v487;
  void *v488;
  _BYTE v489[128];
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  void **block;
  uint64_t v499;
  void (*v500)(uint64_t);
  void *v501;
  NRDDeviceConductor *v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;

  v7 = a3;
  v425 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isEnabled)
  {
    v10 = objc_msgSend(v7, "state");
    nrUUID = self->_nrUUID;
    if (v10 != 255)
    {
      v12 = nrUUID;
      v14 = (void *)_NRCopyLogObjectForNRUUID(v12, v13);
      IsLevelEnabled = _NRLogIsLevelEnabled(v14, 1);

      if (IsLevelEnabled)
      {
        v16 = self->_nrUUID;
        v18 = (void *)_NRCopyLogObjectForNRUUID(v16, v17);
        objc_msgSend(v425, "length");
        v422 = "";
        _NRLogWithArgs(v18, 1, "%s%.30s:%-4d Received message of length %llu bytes on link %@");

      }
      v19 = self->_nrUUID;
      v20 = (_QWORD *)sub_100022CD4((uint64_t)NRLinkDirectorMessage, v425, v19);

      v426 = v20;
      if (!v20)
      {
        v65 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v21);
        v66 = _NRLogIsLevelEnabled(v65, 16);

        if (v66)
        {
          v68 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v67);
          _NRLogWithArgs(v68, 16, "%s%.30s:%-4d Failed to create message from received data", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 5908);

        }
LABEL_331:

        goto LABEL_332;
      }
      v446 = self;
      v22 = sub_1000238A4(v20, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

      v24 = &OBJC_METACLASS___NRAnalyticsLocalDevice;
      v25 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
      if (v23)
      {
        v26 = self->_nrUUID;
        v28 = (void *)_NRCopyLogObjectForNRUUID(v26, v27);
        v29 = _NRLogIsLevelEnabled(v28, 1);

        if (v29)
        {
          v30 = self->_nrUUID;
          v32 = (void *)_NRCopyLogObjectForNRUUID(v30, v31);
          _NRLogWithArgs(v32, 1, "%s%.30s:%-4d Received hello message", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 5913);

        }
        if (self->_helloMessageReceivedOnce)
        {
          v33 = self->_nrUUID;
          v35 = (void *)_NRCopyLogObjectForNRUUID(v33, v34);
          v36 = _NRLogIsLevelEnabled(v35, 1);

          if (v36)
          {
            v37 = self->_nrUUID;
            v39 = (void *)_NRCopyLogObjectForNRUUID(v37, v38);
            _NRLogWithArgs(v39, 1, "%s%.30s:%-4d The other side restarted", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 5919);

          }
          v40 = v7;
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          v41 = (id *)sub_100022B68([NRLinkDirectorMessage alloc], self->_nrUUID);
          v42 = v41;
          if (v41)
          {
            objc_storeStrong(v41 + 3, a3);
            sub_1000231F8((uint64_t)v42, 1, 0);
          }
          sub_100024728((uint64_t)v42);
          self->_helloMessageSent = 1;

          objc_opt_self(NRDKeyManager);
          v25 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
          if (qword_1001E4AD8 != -1)
            dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
          v24 = &OBJC_METACLASS___NRAnalyticsLocalDevice;
          v43 = (id)qword_1001E4AD0;
          if (v43)
          {
            v44 = v43;
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v43 + 2));
            if (!v44[10])
            {
              v44[10] = 1;
              if (v44[8] == 4)
              {
                sub_10014A63C((uint64_t)v44);
                if (v44[9])
                {
                  v44[8] = 3;
                  sub_10014A8AC((uint64_t)v44);
                }
              }
            }
            v45 = v44[8] & 0xFD;

            if (v45 == 1)
            {
              sub_1000DA624((uint64_t)self, CFSTR("Other side restarted"), v46, v47, v48, v49, v50, v51, (uint64_t)v422);
              if (self->_isPreferWiFiProvider)
              {
                dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
                objc_opt_self(NRLinkDirector);
                if (qword_1001E4710 != -1)
                  dispatch_once(&qword_1001E4710, &stru_1001B6E60);
                v52 = (id)qword_1001E4708;
                v53 = v52;
                if (v52)
                  v54 = (void *)*((_QWORD *)v52 + 6);
                else
                  v54 = 0;
                v55 = v54;

                if (v55)
                {
                  v56 = v55[3];
                  dispatch_assert_queue_V2(v56);

                  v57 = *((_DWORD *)v55 + 10) > 0;
                }
                else
                {
                  v57 = 0;
                }
                self->_pendingPreferWiFiRequest = v57;

              }
            }
          }
        }
        else
        {
          self->_helloMessageReceivedOnce = 1;
          v25 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
          v24 = &OBJC_METACLASS___NRAnalyticsLocalDevice;
        }
      }
      v69 = v426;
      v70 = sub_1000238A4(v426, 3);
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "firstObject"));

      if (v71
        || (v72 = sub_1000238A4(v426, 2),
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "firstObject")),
            v72,
            v69 = v426,
            v73,
            v73))
      {
        self->_latestWiFiAddressUpdateMsgIdentifier = sub_100021BEC((uint64_t)v69);
      }
      if (self->_supportsAWDL)
      {
        v74 = sub_1000238A4(v69, 10);
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "firstObject"));

        v69 = v426;
        if (v75)
          self->_latestAWDLAddressUpdateMsgIdentifier = sub_100021BEC((uint64_t)v426);
      }
      v76 = sub_1000238A4(v69, 7);
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "firstObject"));

      v78 = v426;
      if (v77
        || (v79 = sub_1000238A4(v426, 13),
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "firstObject")),
            v79,
            v78 = v426,
            v80,
            v80))
      {
        self->_latestPreferWiFiAckMsgIdentifier = sub_100021BEC((uint64_t)v78);
      }
      v81 = sub_1000238A4(v78, 5);
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "firstObject"));

      v83 = v426;
      if (v82
        || (v84 = sub_1000238A4(v426, 13),
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "firstObject")),
            v84,
            v83 = v426,
            v85,
            v85))
      {
        self->_latestPreferWiFiRequestMsgIdentifier = sub_100021BEC((uint64_t)v83);
      }
      v86 = sub_1000238A4(v83, 6);
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "firstObject"));

      if (v87)
        self->_latestDeviceLinkStateMsgIdentifier = sub_100021BEC((uint64_t)v426);
      v88 = sub_1000238A4(v426, 15);
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "firstObject"));

      if (v89)
        self->_latestCountryCodeMsgIdentifier = sub_100021BEC((uint64_t)v426);
      objc_opt_self(&v24[45]);
      if (qword_1001E4710 != -1)
        dispatch_once(&qword_1001E4710, &stru_1001B6E60);
      v90 = (id)qword_1001E4708;
      v478[0] = _NSConcreteStackBlock;
      v478[1] = 3221225472;
      v478[2] = sub_1000DBD2C;
      v478[3] = &unk_1001B8778;
      v478[4] = self;
      v91 = v426;
      v479 = v91;
      sub_1000AEC6C((uint64_t)v90, v478);

      v439 = v91;
      v92 = sub_1000238A4(v91, 8);
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firstObject"));

      if (v93 && !self->_handlesLinkRecommendations && !self->_didForceWoWMode)
      {
        if (!self->_forcedWoWUUID)
        {
          v94 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          forcedWoWUUID = self->_forcedWoWUUID;
          self->_forcedWoWUUID = v94;

        }
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        objc_opt_self(&v24[45]);
        if (qword_1001E4710 != -1)
          dispatch_once(&qword_1001E4710, &stru_1001B6E60);
        v96 = (id)qword_1001E4708;
        v97 = v96;
        if (v96)
          v98 = (void *)*((_QWORD *)v96 + 6);
        else
          v98 = 0;
        v99 = v98;

        sub_100147674((uint64_t)v99, 1, self->_forcedWoWUUID);
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        objc_opt_self(&v24[45]);
        if (qword_1001E4710 != -1)
          dispatch_once(&qword_1001E4710, &stru_1001B6E60);
        v100 = (id)qword_1001E4708;
        v101 = v100;
        if (v100)
          v102 = (void *)*((_QWORD *)v100 + 6);
        else
          v102 = 0;
        v103 = v102;

        sub_100148BF4(v103, 16, self->_forcedWoWUUID, &off_1001C4B10);
        v104 = dispatch_time(0x8000000000000000, 60000000000);
        queue = self->_queue;
        block = _NSConcreteStackBlock;
        v499 = 3221225472;
        v500 = sub_1000E05B0;
        v501 = &unk_1001B8AE0;
        v502 = self;
        dispatch_after(v104, queue, &block);
        self->_didForceWoWMode = 1;
        sub_100121E18(self->_nrUUID, 1029, 0, 0);
      }
      v106 = sub_1000238A4(v439, 11);
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "firstObject"));

      v424 = v107;
      v108 = self;
      if ((unint64_t)objc_msgSend(v107, "length") < 8)
      {
LABEL_109:
        v427 = v7;
        if (self->_supportsPathOverrides)
        {
          v118 = sub_1000238A4(v439, 12);
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "firstObject"));

          if (v119)
          {
            v120 = sub_100015F3C((char *)[NRNetInfo alloc], v119);
            v122 = v120;
            if (v120 && (v120[16] | 2) == 3)
              sub_1000DD234((uint64_t)self, v121);
            else
              sub_1000DD3A8((uint64_t)self);
            v124 = v119;
            CC_SHA256(objc_msgSend(v124, "bytes"), (CC_LONG)objc_msgSend(v124, "length"), (unsigned __int8 *)&block);
            v123 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &block, 32);
          }
          else
          {
            v122 = 0;
            v123 = 0;
          }

          v125 = v446->_lastReceivedNetInfoDataHash;
          v126 = objc_msgSend(v123, "isEqualToData:", v125);

          if (v126)
          {
            v127 = v446->_nrUUID;
            v129 = (void *)_NRCopyLogObjectForNRUUID(v127, v128);
            v130 = _NRLogIsLevelEnabled(v129, 1);

            if (v130)
            {
              v131 = v446->_nrUUID;
              v133 = (void *)_NRCopyLogObjectForNRUUID(v131, v132);
              _NRLogWithArgs(v133, 1, "%s%.30s:%-4d ignoring unchanged net-info update", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 6157);

            }
          }
          else if (v119)
          {
            v134 = (uint64_t)v446;
            v135 = v446->_nrUUID;
            v137 = (void *)_NRCopyLogObjectForNRUUID(v135, v136);
            v138 = _NRLogIsLevelEnabled(v137, 0);

            if (v138)
            {
              v139 = v446->_nrUUID;
              v141 = (void *)_NRCopyLogObjectForNRUUID(v139, v140);
              objc_msgSend(v119, "length");
              v422 = "";
              _NRLogWithArgs(v141, 0, "%s%.30s:%-4d Received net-info: %@ (%lu bytes)");

            }
            sub_1000DD418((uint64_t)v446, v122 == 0);
            if (v122)
            {
              v447 = v123;
              objc_storeStrong((id *)&v446->_lastReceivedNetInfoDataHash, v123);
              v142 = (void *)nw_path_override_info_create();
              nw_path_override_info_set_expensive(v142, (*((_DWORD *)v122 + 7) >> 3) & 1);
              nw_path_override_info_set_constrained(v142, (*((_DWORD *)v122 + 7) >> 4) & 1);
              nw_path_override_info_set_roaming(v142, (*((_DWORD *)v122 + 7) >> 5) & 1);
              nw_path_override_info_set_uses_wifi(v142, v122[16] == 1);
              nw_path_override_info_set_uses_cellular(v142, v122[16] == 2);
              v143 = *((id *)v122 + 16);
              v474 = 0u;
              v475 = 0u;
              v476 = 0u;
              v477 = 0u;
              v144 = v143;
              v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v474, v489, 16);
              if (v145)
              {
                v146 = v145;
                v147 = *(_QWORD *)v475;
                do
                {
                  for (i = 0; i != v146; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v475 != v147)
                      objc_enumerationMutation(v144);
                    nw_path_override_info_add_resolver_config(v142, *(_QWORD *)(*((_QWORD *)&v474 + 1) + 8 * (_QWORD)i));
                  }
                  v146 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v474, v489, 16);
                }
                while (v146);
              }

              v149 = v446->_queue;
              v150 = nw_agent_create_with_path_override_info(v142, "NetworkRelay path overrides", v149);
              v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
              objc_storeStrong((id *)&v446->_pathOverrideAgent, v151);

              v152 = v446->_pathOverrideAgent;
              v153 = (void *)nw_path_override_info_copy_data(v142);
              nw_agent_change_state(v152, 1, 1, v153);

              v503 = 0uLL;
              v154 = v446->_pathOverrideAgent;
              nw_agent_get_uuid(v154, &v503);

              v155 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v503);
              v156 = v446->_nrUUID;
              v158 = (void *)_NRCopyLogObjectForNRUUID(v156, v157);
              v159 = _NRLogIsLevelEnabled(v158, 0);

              if (v159)
              {
                v160 = v446->_nrUUID;
                v162 = (void *)_NRCopyLogObjectForNRUUID(v160, v161);
                v422 = "";
                _NRLogWithArgs(v162, 0, "%s%.30s:%-4d Published net-info agent: %@");

              }
              v163 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyRouteRule routeRuleWithAction:forType:](NEPolicyRouteRule, "routeRuleWithAction:forType:", 5, 6));
              v444 = v155;
              objc_msgSend(v163, "setNetworkAgentUUID:", v155);
              v164 = objc_alloc((Class)NEPolicy);
              v441 = v163;
              v488 = v163;
              v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v488, 1));
              v166 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult routeRules:](NEPolicyResult, "routeRules:", v165));
              v167 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
              v487 = v167;
              v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v487, 1));
              v452 = objc_msgSend(v164, "initWithOrder:result:conditions:", 10, v166, v168);

              objc_opt_self(NRDPolicySessionManager);
              if (qword_1001E4A20 != -1)
                dispatch_once(&qword_1001E4A20, &stru_1001B8590);
              v169 = (id)qword_1001E4A18;
              v170 = v446->_netInfoPolicyIdentifier;
              v171 = sub_100127310((uint64_t)v169, v170, v452);

              v172 = v122;
              v173 = v172[5];
              v174 = v173;
              if (v173)
              {
                CC_SHA256(objc_msgSend(v173, "bytes"), (CC_LONG)objc_msgSend(v173, "length"), (unsigned __int8 *)&block);
                v175 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &block, 32);
              }
              else
              {
                v175 = 0;
              }

              if (!-[NSData isEqualToData:](v446->_companionNWDescAgentDataHash, "isEqualToData:", v175))
              {
                obj = v175;
                if (!v446->_companionNWDescAgent)
                {
                  v176 = v446->_queue;
                  v177 = nw_agent_create("com.apple.networkrelay", "CompanionNetworkDescription", ", v176);
                  companionNWDescAgent = v446->_companionNWDescAgent;
                  v446->_companionNWDescAgent = (OS_nw_agent *)v177;

                }
                v179 = v172[5];

                v429 = v172;
                if (v179)
                {
                  v180 = v172[5];
                  v181 = dispatch_data_create(objc_msgSend(v180, "bytes"), (size_t)objc_msgSend(v180, "length"), (dispatch_queue_t)v446->_queue, 0);

                }
                else
                {
                  v181 = 0;
                }
                objc_opt_self(NRDPolicySessionManager);
                if (qword_1001E4A20 != -1)
                  dispatch_once(&qword_1001E4A20, &stru_1001B8590);
                v182 = (id)qword_1001E4A18;
                sub_100127618((uint64_t)v182, v446->_companionNWDescPolicyIdentifier);

                v433 = v181;
                nw_agent_change_state(v446->_companionNWDescAgent, 1, 1, v181);
                objc_storeStrong((id *)&v446->_companionNWDescAgentDataHash, v175);
                v490 = 0uLL;
                nw_agent_get_uuid(v446->_companionNWDescAgent, &v490);
                v183 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v490);
                v184 = objc_alloc((Class)NEPolicy);
                v431 = v183;
                v185 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](NEPolicyResult, "netAgentUUID:", v183));
                v186 = (void **)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
                block = v186;
                v187 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition platformBinary](NEPolicyCondition, "platformBinary"));
                v499 = (uint64_t)v187;
                v188 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue(+[NEPolicyCondition customEntitlement:](NEPolicyCondition, "customEntitlement:", CFSTR("com.apple.networkrelay.companionNetworkDescription")));
                v500 = v188;
                v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &block, 3));
                v190 = objc_msgSend(v184, "initWithOrder:result:conditions:", 10, v185, v189);

                objc_opt_self(NRDPolicySessionManager);
                if (qword_1001E4A20 != -1)
                  dispatch_once(&qword_1001E4A20, &stru_1001B8590);
                v172 = v429;
                v191 = (id)qword_1001E4A18;
                v192 = sub_100127310((uint64_t)v191, v446->_companionNWDescPolicyIdentifier, v190);

                v175 = obj;
              }

              objc_opt_self(NRDPolicySessionManager);
              if (qword_1001E4A20 != -1)
                dispatch_once(&qword_1001E4A20, &stru_1001B8590);
              v7 = v427;
              v193 = (id)qword_1001E4A18;
              v194 = (id *)v193;
              if (v193)
              {
                dispatch_assert_queue_V2(*((dispatch_queue_t *)v193 + 1));
                if ((objc_msgSend(v194[2], "apply") & 1) == 0)
                  sub_100109270(CFSTR("NRPolicySessionManager"), CFSTR("ApplyPolicy Failed"), 0, 1, CFSTR("Failed to apply policies"), v195, v196, v197, (uint64_t)v422);
              }

              if (*((_BYTE *)v172 + 9) && !v446->_hasNonCompanionClients)
                sub_1000DD564((uint64_t)v446);
              v198 = v122[16] - 1;
              if (v198 <= 2)
              {
                obja = v122;
                v199 = (const char *)dword_10015D07C[(char)v198];
                v472 = 0u;
                v473 = 0u;
                v470 = 0u;
                v471 = 0u;
                v200 = v446->_availableLinks;
                v201 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v200, "countByEnumeratingWithState:objects:count:", &v470, v486, 16);
                if (v201)
                {
                  v202 = v201;
                  v203 = *(_QWORD *)v471;
                  do
                  {
                    for (j = 0; j != v202; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v471 != v203)
                        objc_enumerationMutation(v200);
                      v205 = *(void **)(*((_QWORD *)&v470 + 1) + 8 * (_QWORD)j);
                      if (objc_msgSend(v205, "virtualInterface"))
                      {
                        v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "proxyAgentUUID"));

                        if (v206)
                          objc_msgSend(v205, "setInterfacePeerEgressFunctionalType:", v199);
                      }
                    }
                    v202 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v200, "countByEnumeratingWithState:objects:count:", &v470, v486, 16);
                  }
                  while (v202);
                }

                v7 = v427;
                v122 = obja;
                if (v446->_catchAllInterface)
                {
                  v207 = v446->_proxyAgentUUID;

                  if (v207)
                  {
                    catchAllInterface = v446->_catchAllInterface;
                    if (catchAllInterface)
                      v209 = (void *)NEVirtualInterfaceCopyName(catchAllInterface);
                    else
                      v209 = 0;
                    sub_100108458(v209, v199);

                  }
                }
              }

              v134 = (uint64_t)v446;
              v123 = v447;
              v25 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
            }
            else
            {
              sub_1000DD68C((uint64_t)v446);
            }
            sub_1000DD7D0(v134, 1);
          }

          v108 = v446;
        }
        v210 = sub_1000238A4(v439, 6);
        v211 = v210;
        if (v210 && objc_msgSend(v210, "count"))
        {
          v493 = 0u;
          v492 = 0u;
          v491 = 0u;
          v490 = 0u;
          v211 = v211;
          v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v490, &block, 16);
          if (v212)
          {
            v213 = v212;
            v445 = 0;
            v214 = *(_QWORD *)v491;
            do
            {
              for (k = 0; k != v213; k = (char *)k + 1)
              {
                if (*(_QWORD *)v491 != v214)
                  objc_enumerationMutation(v211);
                v218 = *(void **)(*((_QWORD *)&v490 + 1) + 8 * (_QWORD)k);
                LOBYTE(v503) = 0;
                if ((unint64_t)objc_msgSend(v218, "length") <= 1)
                  v219 = (uint64_t)objc_msgSend(v218, "length");
                else
                  v219 = 1;
                objc_msgSend(v218, "getBytes:length:", &v503, v219);
                v220 = v445;
                if (!v445)
                  v220 = objc_alloc_init((Class)NSMutableArray);
                if (v503 >= 8uLL)
                  v216 = 0;
                else
                  v216 = 0x202020504020100uLL >> (8 * v503);
                v217 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v216 & 7));
                v445 = v220;
                objc_msgSend(v220, "addObject:", v217);

              }
              v213 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v490, &block, 16);
            }
            while (v213);

            if (v220)
            {
              if (objc_msgSend(v220, "count"))
              {
                v468 = 0u;
                v469 = 0u;
                v466 = 0u;
                v467 = 0u;
                v445 = v220;
                v221 = objc_msgSend(v445, "countByEnumeratingWithState:objects:count:", &v466, v485, 16);
                if (v221)
                {
                  v222 = v221;
                  v223 = 0;
                  v453 = 0;
                  v224 = *(_QWORD *)v467;
                  while (1)
                  {
                    v225 = 0;
                    v448 = v223;
                    v226 = -v223;
                    do
                    {
                      if (*(_QWORD *)v467 != v224)
                        objc_enumerationMutation(v445);
                      v227 = objc_msgSend(*(id *)(*((_QWORD *)&v466 + 1) + 8 * (_QWORD)v225), "unsignedShortValue");
                      StringFromNRLinkType = (void *)createStringFromNRLinkType(v227);
                      v229 = v108->_nrUUID;
                      v231 = (void *)_NRCopyLogObjectForNRUUID(v229, v230);
                      v232 = _NRLogIsLevelEnabled(v231, 0);

                      if (v226 != (_DWORD)v225)
                      {
                        if (v232)
                        {
                          v233 = v446->_nrUUID;
                          v235 = (void *)_NRCopyLogObjectForNRUUID(v233, v236);
                          _NRLogWithArgs(v235, 0, "%s%.30s:%-4d Peer has link: %@", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 6243, StringFromNRLinkType);
LABEL_201:

                        }
                        v108 = v446;
                        goto LABEL_203;
                      }
                      v453 = v227;
                      v108 = v446;
                      if (v232)
                      {
                        v233 = v446->_nrUUID;
                        v235 = (void *)_NRCopyLogObjectForNRUUID(v233, v234);
                        _NRLogWithArgs(v235, 0, "%s%.30s:%-4d Peer has link: %@ (PRIMARY)", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 6241, StringFromNRLinkType);
                        v453 = v227;
                        goto LABEL_201;
                      }
LABEL_203:

                      v225 = (char *)v225 + 1;
                    }
                    while (v222 != v225);
                    v223 = v448 + (_DWORD)v222;
                    v222 = objc_msgSend(v445, "countByEnumeratingWithState:objects:count:", &v466, v485, 16);
                    if (!v222)
                      goto LABEL_340;
                  }
                }
                v453 = 0;
LABEL_340:

                v330 = sub_1000238A4(v439, 6);
                v331 = v330;
                if (v330 && objc_msgSend(v330, "count"))
                {
                  v493 = 0u;
                  v492 = 0u;
                  v491 = 0u;
                  v490 = 0u;
                  v332 = v331;
                  v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v490, &block, 16);
                  if (v333)
                  {
                    v334 = v333;
                    v335 = 0;
                    v336 = *(_QWORD *)v491;
                    do
                    {
                      for (m = 0; m != v334; m = (char *)m + 1)
                      {
                        if (*(_QWORD *)v491 != v336)
                          objc_enumerationMutation(v332);
                        v340 = *(void **)(*((_QWORD *)&v490 + 1) + 8 * (_QWORD)m);
                        LOBYTE(v503) = 0;
                        if ((unint64_t)objc_msgSend(v340, "length") <= 1)
                          v341 = (uint64_t)objc_msgSend(v340, "length");
                        else
                          v341 = 1;
                        objc_msgSend(v340, "getBytes:length:", &v503, v341);
                        if (!v335)
                          v335 = objc_alloc_init((Class)NSMutableArray);
                        if (v503 >= 8uLL)
                          v338 = 0;
                        else
                          v338 = 0x6867660000650000uLL >> (8 * v503);
                        v339 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v338));
                        objc_msgSend(v335, "addObject:", v339);

                      }
                      v334 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v490, &block, 16);
                    }
                    while (v334);
                  }
                  else
                  {
                    v335 = 0;
                  }

                  v108 = v446;
                }
                else
                {
                  v335 = 0;
                }

                v462 = 0u;
                v463 = 0u;
                v464 = 0u;
                v465 = 0u;
                v443 = v335;
                v342 = objc_msgSend(v443, "countByEnumeratingWithState:objects:count:", &v462, v484, 16);
                if (v342)
                {
                  v343 = v342;
                  v344 = 0;
                  v451 = 0;
                  v345 = *(_QWORD *)v463;
                  while (1)
                  {
                    v346 = 0;
                    objc = v344;
                    v347 = -v344;
                    do
                    {
                      if (*(_QWORD *)v463 != v345)
                        objc_enumerationMutation(v443);
                      v348 = objc_msgSend(*(id *)(*((_QWORD *)&v462 + 1) + 8 * (_QWORD)v346), "unsignedShortValue");
                      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype(v348);
                      v350 = v108->_nrUUID;
                      v352 = (void *)_NRCopyLogObjectForNRUUID(v350, v351);
                      v353 = _NRLogIsLevelEnabled(v352, 0);

                      if (v347 == (_DWORD)v346 && v348)
                      {
                        v451 = v348;
                        if (v353)
                        {
                          v354 = v446->_nrUUID;
                          v356 = (void *)_NRCopyLogObjectForNRUUID(v354, v355);
                          _NRLogWithArgs(v356, 0, "%s%.30s:%-4d Peer has link subtype: %@ (PRIMARY)", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 6258, StringFromNRLinkSubtype);
                          v451 = v348;
LABEL_367:

                        }
                      }
                      else if (v353)
                      {
                        v354 = v446->_nrUUID;
                        v356 = (void *)_NRCopyLogObjectForNRUUID(v354, v357);
                        _NRLogWithArgs(v356, 0, "%s%.30s:%-4d Peer has link subtype: %@", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 6260, StringFromNRLinkSubtype);
                        goto LABEL_367;
                      }

                      v346 = (char *)v346 + 1;
                      v108 = v446;
                    }
                    while (v343 != v346);
                    v344 = objc + (_DWORD)v343;
                    v343 = objc_msgSend(v443, "countByEnumeratingWithState:objects:count:", &v462, v484, 16);
                    if (!v343)
                      goto LABEL_378;
                  }
                }
                v451 = 0;
LABEL_378:

                v358 = v108->_nrUUID;
                v360 = (void *)_NRCopyLogObjectForNRUUID(v358, v359);
                v361 = _NRLogIsLevelEnabled(v360, 0);

                if (v361)
                {
                  v362 = v108->_nrUUID;
                  v364 = (void *)_NRCopyLogObjectForNRUUID(v362, v363);
                  v365 = v108->_primaryLink;
                  v366 = (void *)createStringFromNRLinkType(-[NRLink type](v365, "type"));
                  v367 = v108->_primaryLink;
                  v368 = (void *)createStringFromNRLinkSubtype(-[NRLink subtype](v367, "subtype"));
                  v369 = (void *)createStringFromNRLinkType(v453);
                  v370 = (void *)createStringFromNRLinkSubtype(v451);
                  _NRLogWithArgs(v364, 0, "%s%.30s:%-4d Our primary link: %@(%@), peer primary link: %@(%@)", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 6267, v366, v368, v369, v370);

                  v108 = v446;
                }
                v25 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
                if (!v108->_followsPeerPrimaryLink)
                  goto LABEL_412;
                v371 = v453;
                if (!v453)
                {
                  v372 = v108->_nrUUID;
                  v374 = (void *)_NRCopyLogObjectForNRUUID(v372, v373);
                  v375 = _NRLogIsLevelEnabled(v374, 17);

                  if (v375)
                  {
                    v376 = v108->_nrUUID;
                    v378 = (void *)_NRCopyLogObjectForNRUUID(v376, v377);
                    _NRLogWithArgs(v378, 17, "Received recommended Link type is invalid");

                  }
                  v371 = 1;
                }
                v379 = v108->_nrUUID;
                v381 = (void *)_NRCopyLogObjectForNRUUID(v379, v380);
                v382 = _NRLogIsLevelEnabled(v381, 1);

                if (v382)
                {
                  v383 = v108->_nrUUID;
                  v385 = (void *)_NRCopyLogObjectForNRUUID(v383, v384);
                  v386 = (void *)createStringFromNRLinkType(v371);
                  _NRLogWithArgs(v385, 1, "%s%.30s:%-4d Received a primary link recommendation from the peer: %@", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 6357, v386);

                }
                if (v371 != 2)
                {
                  if (v371 == 1)
                  {
                    dispatch_assert_queue_V2((dispatch_queue_t)v108->_queue);
                    dispatch_assert_queue_V2((dispatch_queue_t)v108->_queue);
                    v387 = sub_1000D8AA8((uint64_t)v108, 1, 0);
                    v389 = v387;
                    if (v387)
                    {
                      if (objc_msgSend(v387, "state") == 1)
                      {
                        v391 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v390);
                        v392 = _NRLogIsLevelEnabled(v391, 1);

                        if (v392)
                        {
                          v394 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v393);
                          _NRLogWithArgs(v394, 1, "%s%.30s:%-4d Starting link: %@", ", "-[NRDDeviceConductor resumeLinkOfType:]", 3213, v389);

                        }
                        objc_msgSend(v389, "start");
                        goto LABEL_411;
                      }
                      if (objc_msgSend(v389, "state") != 8)
                      {
                        if (objc_msgSend(v389, "state") == 9)
                        {
                          v404 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v403);
                          v405 = _NRLogIsLevelEnabled(v404, 1);

                          if (v405)
                          {
                            v407 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v406);
                            _NRLogWithArgs(v407, 1, "%s%.30s:%-4d Resuming link: %@", ", "-[NRDDeviceConductor resumeLinkOfType:]", 3230, v389);

                          }
                          objc_msgSend(v389, "resume");
                          goto LABEL_411;
                        }
                        objc_msgSend(v389, "setSuspendWhenReady:", 0);
                        v409 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v408);
                        v410 = _NRLogIsLevelEnabled(v409, 1);

                        if (v410)
                        {
                          v401 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v411);
                          _NRLogWithArgs(v401, 1, "%s%.30s:%-4d Cannot resume link as it is not suspended: %@", ", "-[NRDDeviceConductor resumeLinkOfType:]", 3226, v389);
                          goto LABEL_403;
                        }
                      }
                    }
                    else
                    {
                      v398 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v388);
                      v399 = _NRLogIsLevelEnabled(v398, 1);

                      if (v399)
                      {
                        v401 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v400);
                        v402 = (void *)createStringFromNRLinkType(1);
                        _NRLogWithArgs(v401, 1, "%s%.30s:%-4d Cannot resume link as no link of type '%@' is available", ", "-[NRDDeviceConductor resumeLinkOfType:]", 3208, v402);

LABEL_403:
                      }
                    }
LABEL_411:

                    sub_1000D8F08((uint64_t)v108);
                  }
LABEL_412:
                  v460 = 0u;
                  v461 = 0u;
                  v458 = 0u;
                  v459 = 0u;
                  v412 = v108->_availableLinks;
                  v413 = -[NSMutableSet copy](v412, "copy");

                  v414 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v458, v483, 16);
                  if (v414)
                  {
                    v415 = v414;
                    v416 = *(_QWORD *)v459;
                    do
                    {
                      for (n = 0; n != v415; n = (char *)n + 1)
                      {
                        if (*(_QWORD *)v459 != v416)
                          objc_enumerationMutation(v413);
                        v418 = *(void **)(*((_QWORD *)&v458 + 1) + 8 * (_QWORD)n);
                        if (objc_msgSend(v418, "state") == 8)
                        {
                          v419 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v418, "type")));
                          if (!objc_msgSend(v445, "containsObject:", v419)
                            || objc_msgSend(v418, "subtype")
                            && (v420 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v418, "subtype"))), v421 = objc_msgSend(v443, "containsObject:", v420), v420, (v421 & 1) == 0))
                          {
                            objc_msgSend(v418, "checkPeerAvailabilityWithForceAggressive:", 1);
                          }

                        }
                      }
                      v415 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v458, v483, 16);
                    }
                    while (v415);
                  }

                  v7 = v427;
                  v108 = v446;
                  goto LABEL_213;
                }
                dispatch_assert_queue_V2((dispatch_queue_t)v108->_queue);
                v395 = sub_1000D8AA8((uint64_t)v108, 2, 101);
                v396 = v395;
                if (v395 && objc_msgSend(v395, "state") == 8)
                {
                  v397 = v396;
                }
                else
                {
                  v397 = sub_1000D8AA8((uint64_t)v108, 2, 102);

                  if (!v397 || objc_msgSend(v397, "state") != 8)
                    goto LABEL_400;
                }
                sub_1000D816C((uint64_t)v108);
LABEL_400:

                goto LABEL_412;
              }
              v25 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
            }
            else
            {
              v445 = 0;
              v25 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
            }
LABEL_213:
            v237 = v439;
            v238 = sub_1000238A4(v439, 14);
            v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "firstObject"));

            if (v239)
            {
              v240 = sub_1000238A4(v439, 14);
              v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "firstObject"));

              LOBYTE(block) = 0;
              if (objc_msgSend(v241, "length") && (objc_msgSend(v241, "getBytes:length:", &block, 1), (_BYTE)block))
              {
                if (block >= 0xBu)
                {
                  if (block >= 0x15u)
                  {
                    if (block >= 0x1Fu)
                      v242 = block >= 0x29u ? 50 : 40;
                    else
                      v242 = 30;
                  }
                  else
                  {
                    v242 = 20;
                  }
                }
                else
                {
                  v242 = 10;
                }
              }
              else
              {
                v242 = 0;
              }

              v108->_lastSeenPeerThermalPressure = v242;
              v237 = v439;
              if (v108->_lastReportedPeerThermalPressure != v242)
                sub_1000DAD34((uint64_t)v108);
            }
            v243 = sub_1000238A4(v237, 22);
            v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "firstObject"));

            if (v244)
            {
              v245 = sub_1000238A4(v237, 22);
              v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v245, "firstObject"));

              if (v246 && objc_msgSend(v246, "length"))
              {
                LOBYTE(block) = 0;
                objc_msgSend(v246, "getBytes:length:", &block, 1);
                v247 = (block & 1) != 0 ? &__kCFBooleanTrue : &__kCFBooleanFalse;
              }
              else
              {
                v247 = 0;
              }

              v248 = objc_msgSend(v247, "BOOLValue");
              v108->_lastSeenPeerPluggedInState = v248;
              v237 = v439;
              if (v248 != v108->_lastReportedPluggedInState)
                sub_1000DAD34((uint64_t)v108);
            }
            v249 = sub_1000238A4(v237, 16);
            v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "firstObject"));

            if (v250)
              goto LABEL_234;
            v251 = sub_1000238A4(v237, 18);
            v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "firstObject"));

            if (v252)
              goto LABEL_234;
            v253 = sub_1000238A4(v237, 17);
            v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "firstObject"));

            if (v254
              || (v255 = sub_1000238A4(v237, 19),
                  v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v255, "firstObject")),
                  v255,
                  v256,
                  v256))
            {
LABEL_234:
              objc_opt_self(NRDKeyManager);
              if (qword_1001E4AD8 != -1)
                dispatch_once(&qword_1001E4AD8, &stru_1001B8968);
              v257 = v25[38].class_meths;
              v456[0] = _NSConcreteStackBlock;
              v456[1] = 3221225472;
              v456[2] = sub_1000DDEA4;
              v456[3] = &unk_1001B8778;
              v456[4] = v108;
              v237 = v439;
              v457 = v439;
              sub_10014ACE0((uint64_t)v257, v456);

            }
            v258 = sub_1000238A4(v237, 20);
            v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v258, "firstObject"));

            if (v259)
            {
              v260 = sub_1000238A4(v237, 20);
              v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v260, "firstObject"));

              if (v108)
              {
                v449 = v261;
                v262 = sub_1000DE974(v261);
                v264 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v263);
                v265 = _NRLogIsLevelEnabled(v264, 1);

                if (v265)
                {
                  v267 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v266);
                  _NRLogWithArgs(v267, 1, "%s%.30s:%-4d received resolve request %@", ", "-[NRDDeviceConductor handleIncomingResolveRequest:]", 8523, v262);

                }
                v493 = 0u;
                v492 = 0u;
                v491 = 0u;
                v490 = 0u;
                v268 = v262;
                v269 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v490, &block, 16);
                if (v269)
                {
                  v270 = v269;
                  v454 = *(_QWORD *)v491;
                  do
                  {
                    for (ii = 0; ii != v270; ii = (char *)ii + 1)
                    {
                      if (*(_QWORD *)v491 != v454)
                        objc_enumerationMutation(v268);
                      v274 = *(void **)(*((_QWORD *)&v490 + 1) + 8 * (_QWORD)ii);
                      v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "objectForKeyedSubscript:", v274));
                      v276 = objc_alloc_init((Class)NSMutableArray);
                      *(_QWORD *)&v503 = _NSConcreteStackBlock;
                      *((_QWORD *)&v503 + 1) = 3221225472;
                      *(_QWORD *)&v504 = sub_1000DF7F0;
                      *((_QWORD *)&v504 + 1) = &unk_1001B75E0;
                      *(_QWORD *)&v505 = v276;
                      v277 = v276;
                      nw_array_apply(v275, &v503);
                      v494 = 0uLL;
                      v278 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                      objc_msgSend(v278, "getUUIDBytes:", &v494);

                      v279 = (void *)nw_endpoint_create_application_service(objc_msgSend(v274, "UTF8String"), &v494);
                      nw_endpoint_set_public_keys(v279, v277);
                      sub_1000D2DA0((uint64_t)v108, v279);
                      asClient = v108->_asClient;
                      v281 = v274;
                      v282 = v279;
                      if (asClient && !asClient->_cancelled)
                      {
                        if ((-[NSMutableArray containsObject:](asClient->_asNamesForIncomingResolveRequests, "containsObject:", v281) & 1) == 0)-[NSMutableArray addObject:](asClient->_asNamesForIncomingResolveRequests, "addObject:", v281);
                        objc_opt_self(NRApplicationServiceManager);
                        if (qword_1001E47D8 != -1)
                          dispatch_once(&qword_1001E47D8, &stru_1001B7770);
                        v283 = (id *)qword_1001E47D0;
                        v284 = v282;
                        v285 = v284;
                        if (!v283)
                          goto LABEL_247;
                        if (v284)
                        {
                          if (nw_endpoint_get_type(v284) != (nw_endpoint_type_url|nw_endpoint_type_host))
                          {
                            if (qword_1001E47E8 != -1)
                              dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                            if (_NRLogIsLevelEnabled(qword_1001E47E0, 16))
                            {
                              if (qword_1001E47E8 != -1)
                                dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                              _NRLogWithArgs(qword_1001E47E0, 16, "%s%.30s:%-4d invalid endpoint type %@", ", "-[NRApplicationServiceManager addIncomingResolveRequestForEndpoint:]", 625, v285);
                            }
                            goto LABEL_247;
                          }
                          v272 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", nw_endpoint_get_application_service_name(v285));
                          v273 = (id)objc_claimAutoreleasedReturnValue(v272);
                          objc_msgSend(v283[7], "setObject:forKeyedSubscript:", v285, v273);
                          sub_1000F4D1C(v283);
                        }
                        else
                        {
                          if (qword_1001E47E8 != -1)
                            dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                          v286 = (id)qword_1001E47E0;
                          v287 = _NRLogIsLevelEnabled(v286, 17);

                          if (!v287)
                            goto LABEL_247;
                          if (qword_1001E47E8 != -1)
                            dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                          v273 = (id)qword_1001E47E0;
                          _NRLogWithArgs(v273, 17, "%s called with null asEndpoint", "-[NRApplicationServiceManager addIncomingResolveRequestForEndpoint:]");
                        }

LABEL_247:
                      }

                      v108 = v446;
                    }
                    v270 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v490, &block, 16);
                  }
                  while (v270);
                }

                sub_1000DEAEC((uint64_t)v108, 1);
                v7 = v427;
                v237 = v439;
                v261 = v449;
              }

            }
            v288 = sub_1000238A4(v237, 21);
            v289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v288, "firstObject"));

            if (v289)
            {
              v290 = sub_1000238A4(v237, 21);
              v291 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v290, "firstObject"));

              v292 = v291;
              if (v108)
              {
                v293 = sub_10012FFF4((uint64_t)NRDLocalDevice, v108->_nrUUID);
                v423 = v292;
                v294 = sub_1000DE974(v292);
                v296 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v295);
                v297 = _NRLogIsLevelEnabled(v296, 1);

                if (v297)
                {
                  v299 = (void *)_NRCopyLogObjectForNRUUID(v108->_nrUUID, v298);
                  _NRLogWithArgs(v299, 1, "%s%.30s:%-4d received resolve response %@", ", "-[NRDDeviceConductor handleIncomingResolveResponse:]", 8437, v294);

                }
                v497 = 0u;
                v496 = 0u;
                v495 = 0u;
                v494 = 0u;
                v440 = v294;
                objb = objc_msgSend(v440, "countByEnumeratingWithState:objects:count:", &v494, &v490, 16);
                if (objb)
                {
                  v434 = *(_QWORD *)v495;
                  v300 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
                  v301 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
                  v428 = v293;
                  do
                  {
                    v302 = 0;
                    do
                    {
                      if (*(_QWORD *)v495 != v434)
                        objc_enumerationMutation(v440);
                      v305 = *(void **)(*((_QWORD *)&v494 + 1) + 8 * v302);
                      v306 = v108->_asClient;
                      v307 = v306;
                      v450 = v302;
                      if (v306)
                        asNamesForResolving = v306->_asNamesForResolving;
                      else
                        asNamesForResolving = 0;
                      v309 = asNamesForResolving;
                      v310 = -[NSMutableArray containsObject:](v309, "containsObject:", v305);

                      if (v310)
                      {
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v108->_asNamesToResolvedEndpoints, "setObject:forKeyedSubscript:", 0, v305);
                        v311 = objc_alloc_init((Class)NSMutableArray);
                        v312 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v440, "objectForKeyedSubscript:", v305));
                        v480[0] = _NSConcreteStackBlock;
                        v480[1] = 3221225472;
                        v480[2] = sub_1000DEA54;
                        v480[3] = &unk_1001B75B8;
                        v480[4] = v108;
                        v481 = v293;
                        v482 = v311;
                        v304 = v311;
                        nw_array_apply(v312, v480);
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v108->_asNamesToResolvedEndpoints, "setObject:forKeyedSubscript:", v304, v305);
                        v313 = v108->_asClient;
                        v442 = v305;
                        v303 = v312;
                        if (v313 && !v313->_cancelled)
                        {
                          objc_opt_self(NRApplicationServiceManager);
                          if (qword_1001E47D8 != -1)
                            dispatch_once(&qword_1001E47D8, &stru_1001B7770);
                          v314 = qword_1001E47D0;
                          v455 = v442;
                          v315 = v303;
                          v316 = v315;
                          if (v314)
                          {
                            if (v315)
                            {
                              dispatch_assert_queue_V2(*(dispatch_queue_t *)(v314 + 8));
                              v317 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v314 + 40), "objectForKeyedSubscript:", v455));
                              if (objc_msgSend(v317, "count"))
                              {
                                v430 = v303;
                                v432 = v304;
                                v505 = 0u;
                                v506 = 0u;
                                v503 = 0u;
                                v504 = 0u;
                                v317 = v317;
                                v318 = objc_msgSend(v317, "countByEnumeratingWithState:objects:count:", &v503, &block, 16);
                                if (v318)
                                {
                                  v319 = v318;
                                  v320 = *(_QWORD *)v504;
                                  do
                                  {
                                    for (jj = 0; jj != v319; jj = (char *)jj + 1)
                                    {
                                      if (*(_QWORD *)v504 != v320)
                                        objc_enumerationMutation(v317);
                                      v327 = *(_QWORD *)(*((_QWORD *)&v503 + 1) + 8 * (_QWORD)jj);
                                      if (!v327 || !*(_BYTE *)(v327 + 48))
                                      {
                                        if (v300[28].name != (char *)-1)
                                          dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                                        if (_NRLogIsLevelEnabled(v301[28].isa, 2))
                                        {
                                          if (v300[28].name != (char *)-1)
                                            dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                                          v322 = v301;
                                          isa = v301[28].isa;
                                          if (v327)
                                            v324 = *(_QWORD *)(v327 + 40);
                                          else
                                            v324 = 0;
                                          v325 = isa;
                                          _NRLogWithArgs(v325, 2, "%s%.30s:%-4d triggering resolve response block for %@ (%p) with endpoints %@", ", "-[NRApplicationServiceManager reportResolveResultForASName:endpoint:]", 357, v455, v324, v316);

                                          v300 = &OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
                                          v301 = v322;
                                        }
                                        if (v327)
                                        {
                                          *(_BYTE *)(v327 + 48) = 1;
                                          v326 = *(_QWORD *)(v327 + 56);
                                        }
                                        else
                                        {
                                          v326 = 0;
                                        }
                                        (*(void (**)(uint64_t, void *))(v326 + 16))(v326, v316);
                                      }
                                    }
                                    v319 = objc_msgSend(v317, "countByEnumeratingWithState:objects:count:", &v503, &block, 16);
                                  }
                                  while (v319);
                                }

                                v7 = v427;
                                v303 = v430;
                                v304 = v432;
                              }
                              goto LABEL_283;
                            }
                            if (v300[28].name != (char *)-1)
                              dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                            v328 = v301[28].isa;
                            v329 = _NRLogIsLevelEnabled(v328, 17);

                            if (v329)
                            {
                              if (v300[28].name != (char *)-1)
                                dispatch_once(&qword_1001E47E8, &stru_1001B7808);
                              v317 = v301[28].isa;
                              _NRLogWithArgs(v317, 17, "%s called with null resolvedEndpoints", "-[NRApplicationServiceManager reportResolveResultForASName:endpoint:]");
LABEL_283:

                            }
                          }

                          v108 = v446;
                          v293 = v428;
                        }

                      }
                      v302 = v450 + 1;
                    }
                    while ((id)(v450 + 1) != objb);
                    objb = objc_msgSend(v440, "countByEnumeratingWithState:objects:count:", &v494, &v490, 16);
                  }
                  while (objb);
                }

                sub_1000DEAEC((uint64_t)v108, 1);
                v292 = v423;
              }

            }
            goto LABEL_331;
          }

        }
        v445 = 0;
        goto LABEL_213;
      }
      block = 0;
      objc_msgSend(v107, "getBytes:length:", &block, 8);
      v109 = (char)block;
      v110 = sub_10012FFF4((uint64_t)NRDLocalDevice, self->_nrUUID);
      v111 = v110;
      if (v110 && *((unsigned __int16 *)v110 + 14) >= 0x16u)
      {
        if ((v109 & 4) == 0)
        {
          if ((v109 & 8) == 0)
            goto LABEL_108;
          if (qword_1001E4798 != -1)
            dispatch_once(&qword_1001E4798, &stru_1001B7628);
          if (!_NRLogIsLevelEnabled(qword_1001E4790, 1))
            goto LABEL_90;
          if (qword_1001E4798 != -1)
            dispatch_once(&qword_1001E4798, &stru_1001B7628);
          v112 = qword_1001E4790;
          v113 = 3919;
          goto LABEL_89;
        }
        if (qword_1001E4798 != -1)
          dispatch_once(&qword_1001E4798, &stru_1001B7628);
        if (_NRLogIsLevelEnabled(qword_1001E4790, 1))
        {
          if (qword_1001E4798 != -1)
            dispatch_once(&qword_1001E4798, &stru_1001B7628);
          v116 = qword_1001E4790;
          v117 = 3916;
LABEL_104:
          _NRLogWithArgs(v116, 1, "%s%.30s:%-4d processing request flag for starting immediate net-info updates", ", "-[NRDDeviceConductor processReceivedRequestFlags:]", v117);
        }
      }
      else
      {
        if ((v109 & 2) == 0)
        {
          if ((v109 & 4) == 0)
            goto LABEL_108;
          if (qword_1001E4798 != -1)
            dispatch_once(&qword_1001E4798, &stru_1001B7628);
          if (!_NRLogIsLevelEnabled(qword_1001E4790, 1))
            goto LABEL_90;
          if (qword_1001E4798 != -1)
            dispatch_once(&qword_1001E4798, &stru_1001B7628);
          v112 = qword_1001E4790;
          v113 = 3927;
LABEL_89:
          _NRLogWithArgs(v112, 1, "%s%.30s:%-4d processing request flag for stopping immediate net-info updates", ", "-[NRDDeviceConductor processReceivedRequestFlags:]", v113);
LABEL_90:
          netInfo = self->_netInfo;
          if (netInfo)
          {
            v115 = 0;
LABEL_107:
            netInfo->_disableCoalescing = v115;
            goto LABEL_108;
          }
          goto LABEL_108;
        }
        if (qword_1001E4798 != -1)
          dispatch_once(&qword_1001E4798, &stru_1001B7628);
        if (_NRLogIsLevelEnabled(qword_1001E4790, 1))
        {
          if (qword_1001E4798 != -1)
            dispatch_once(&qword_1001E4798, &stru_1001B7628);
          v116 = qword_1001E4790;
          v117 = 3924;
          goto LABEL_104;
        }
      }
      netInfo = self->_netInfo;
      if (netInfo)
      {
        v115 = 1;
        goto LABEL_107;
      }
LABEL_108:

      goto LABEL_109;
    }
    v62 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v9);
    v63 = _NRLogIsLevelEnabled(v62, 16);

    if (v63)
    {
      v61 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v64);
      _NRLogWithArgs(v61, 16, "%s%.30s:%-4d Ignoring link receive data event as link was cancelled %@", ", "-[NRDDeviceConductor linkDidReceiveData:data:]", 5899, v7);
      goto LABEL_34;
    }
  }
  else
  {
    v58 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v8);
    v59 = _NRLogIsLevelEnabled(v58, 1);

    if (v59)
    {
      v61 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v60);
      _NRLogWithArgs(v61, 1, "%s%.30s:%-4d Ignoring link receive data event as conductor is disabled");
LABEL_34:

    }
  }
LABEL_332:

}

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  void *v10;
  NRNetInfo *netInfo;
  dispatch_queue_t *v12;
  unint64_t netInfoGenerationSent;
  unint64_t generation;
  id v15;

  v4 = a4;
  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
  IsLevelEnabled = _NRLogIsLevelEnabled(v7, 1);

  if (IsLevelEnabled)
  {
    v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
    _NRLogWithArgs(v10, 1, "%s%.30s:%-4d link: %@, IsAsleep: %d", ", "-[NRDDeviceConductor linkPeerIsAsleep:isAsleep:]", 6426, v15, v4);

  }
  self->_peerDeviceIsAsleep = v4;
  if (!v4 && self->_peerDeviceIsNearby)
  {
    netInfo = self->_netInfo;
    if (netInfo)
    {
      if (!netInfo->_isCoalescing)
      {
        netInfoGenerationSent = self->_netInfoGenerationSent;
        goto LABEL_11;
      }
      v12 = sub_100017F3C((dispatch_queue_t *)netInfo);

      if (v12)
      {
        netInfo = self->_netInfo;
        netInfoGenerationSent = self->_netInfoGenerationSent;
        if (!netInfo)
        {
          generation = 0;
          goto LABEL_12;
        }
LABEL_11:
        generation = netInfo->_generation;
LABEL_12:
        if (netInfoGenerationSent != generation)
          sub_1000DBB4C((uint64_t)self, self->_primaryLink);
      }
    }
    if (self->_sendThermalPressureUpdateWhenAwake)
      sub_1000DB7A8((uint64_t)self, self->_primaryLink);
    if (self->_sendDeviceStateUpdateWhenAwake)
      sub_1000DB998((uint64_t)self, self->_primaryLink);
  }
  sub_1000DAD34((uint64_t)self);

}

- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  unint64_t peerDeviceIsNearbyUpdateCounter;
  dispatch_time_t v13;
  NSObject *queue;
  id v15;
  int IsLevelEnabled;
  id v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  id v22;
  _QWORD block[6];

  v4 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((-[NSUUID isEqual:](self->_nrUUID, "isEqual:", v6) & 1) == 0)
  {
    v15 = sub_1000D5594();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 16);

    if (IsLevelEnabled)
    {
      v17 = sub_1000D5594();
      _NRLogWithArgs(v17, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: [self.nrUUID isEqual:nrUUID]", ", "-[NRDDeviceConductor pipeDidConnectForNRUUID:nrUUID:]", 6598);

    }
    v18 = _os_log_pack_size(12);
    v19 = (char *)&block[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = __error();
    v21 = _os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "%{public}s Assertion Failed: [self.nrUUID isEqual:nrUUID]");
    *(_DWORD *)v21 = 136446210;
    *(_QWORD *)(v21 + 4) = "-[NRDDeviceConductor pipeDidConnectForNRUUID:nrUUID:]";
    v22 = sub_1000D5594();
    _NRLogAbortWithPack(v22, v19);
  }
  v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
  v9 = _NRLogIsLevelEnabled(v8, 1);

  if (v9)
  {
    v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
    _NRLogWithArgs(v11, 1, "%s%.30s:%-4d PeerIsNearby: %d", ", "-[NRDDeviceConductor pipeDidConnectForNRUUID:nrUUID:]", 6599, v4);

  }
  self->_peerDeviceIsNearby = v4;
  ++self->_peerDeviceIsNearbyUpdateCounter;
  if (v4)
  {
    sub_10003064C((uint64_t)self->_quickRelayAgent);
    peerDeviceIsNearbyUpdateCounter = self->_peerDeviceIsNearbyUpdateCounter;
    v13 = dispatch_time(0x8000000000000000, 3000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DB684;
    block[3] = &unk_1001B74F8;
    block[4] = self;
    block[5] = peerDeviceIsNearbyUpdateCounter;
    dispatch_after(v13, queue, block);
  }
  sub_1000DAD34((uint64_t)self);

}

- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  int IsLevelEnabled;
  id v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  id v18;
  id v19;

  v4 = a3;
  v19 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_peerDidUnpairBluetooth != v4)
  {
    if ((-[NSUUID isEqual:](self->_nrUUID, "isEqual:", v19) & 1) == 0)
    {
      v11 = sub_1000D5594();
      IsLevelEnabled = _NRLogIsLevelEnabled(v11, 16);

      if (IsLevelEnabled)
      {
        v13 = sub_1000D5594();
        _NRLogWithArgs(v13, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: [self.nrUUID isEqual:nrUUID]", ", "-[NRDDeviceConductor peerDidUnpairBluetooth:nrUUID:]", 6641);

      }
      v14 = _os_log_pack_size(12);
      v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = __error();
      v17 = _os_log_pack_fill(v15, v14, *v16, &_mh_execute_header, "%{public}s Assertion Failed: [self.nrUUID isEqual:nrUUID]");
      *(_DWORD *)v17 = 136446210;
      *(_QWORD *)(v17 + 4) = "-[NRDDeviceConductor peerDidUnpairBluetooth:nrUUID:]";
      v18 = sub_1000D5594();
      _NRLogAbortWithPack(v18, v15);
    }
    v7 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    v8 = _NRLogIsLevelEnabled(v7, 1);

    if (v8)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
      _NRLogWithArgs(v10, 1, "%s%.30s:%-4d PeerHasUnregistered: %d", ", "-[NRDDeviceConductor peerDidUnpairBluetooth:nrUUID:]", 6642, v4);

    }
    self->_peerDidUnpairBluetooth = v4;
    sub_1000DAD34((uint64_t)self);
  }

}

- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3
{
  _BOOL4 v3;
  NRAnalyticsPhoneCallRelay *v5;
  NRAnalyticsPhoneCallRelay *phoneCallRelayAnalytics;
  uint64_t v7;
  uint64_t v8;
  NRAnalyticsPhoneCallRelay *v9;
  NRAnalyticsPhoneCallRelay *v10;
  NRAnalyticsPhoneCallRelay *v11;
  void *v12;
  int IsLevelEnabled;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id *v19;
  NSObject *v20;
  _BOOL4 preferWiFiRequest;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id *v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  id *v42;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isEnabled || !self->_supportsPhoneCallRelay || self->_hasPhoneCallRelayRequest == v3)
    return;
  if (!self->_phoneCallRelayAnalytics)
  {
    v5 = objc_alloc_init(NRAnalyticsPhoneCallRelay);
    phoneCallRelayAnalytics = self->_phoneCallRelayAnalytics;
    self->_phoneCallRelayAnalytics = v5;

  }
  v7 = mach_absolute_time();
  v9 = self->_phoneCallRelayAnalytics;
  if (v3)
  {
    if (v9)
      v9->_phoneCallRelayStart = v7;
  }
  else
  {
    if (v9)
    {
      v9->_phoneCallRelayEnd = v7;
      v10 = self->_phoneCallRelayAnalytics;
    }
    else
    {
      v10 = 0;
    }
    -[NRAnalyticsPhoneCallRelay submit](v10, "submit");
    v11 = self->_phoneCallRelayAnalytics;
    self->_phoneCallRelayAnalytics = 0;

  }
  v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v8);
  IsLevelEnabled = _NRLogIsLevelEnabled(v12, 0);

  if (IsLevelEnabled)
  {
    v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
    _NRLogWithArgs(v15, 0, "%s%.30s:%-4d deviceHasPhoneCallRelayRequest: %d", ", "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]", 6675, v3);

  }
  self->_hasPhoneCallRelayRequest = v3;
  if (self->_isPreferWiFiProvider)
  {
    if (v3)
      return;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v16 = (id)qword_1001E4708;
    v17 = v16;
    if (v16)
      v18 = (void *)*((_QWORD *)v16 + 6);
    else
      v18 = 0;
    v19 = v18;

    if (v19
      && (v20 = v19[3],
          dispatch_assert_queue_V2(v20),
          v20,
          *((int *)v19 + 10) >= 1))
    {
      preferWiFiRequest = self->_preferWiFiRequest;

      if (!preferWiFiRequest)
      {
        v23 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v22);
        v24 = _NRLogIsLevelEnabled(v23, 0);

        if (v24)
        {
          v26 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v25);
          _NRLogWithArgs(v26, 0, "%s%.30s:%-4d processing outstanding prefer Wi-Fi requests", ", "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]", 6682);

        }
        -[NRDDeviceConductor preferWiFiRequestAvailable](self, "preferWiFiRequestAvailable");
        return;
      }
    }
    else
    {

    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v31 = (id)qword_1001E4708;
    v32 = v31;
    if (v31)
      v33 = (void *)*((_QWORD *)v31 + 6);
    else
      v33 = 0;
    v42 = v33;

    v34 = v42;
    if (v42
      && (v35 = v42[3],
          dispatch_assert_queue_V2(v35),
          v35,
          v34 = v42,
          *((int *)v42 + 10) > 0))
    {

    }
    else
    {
      v36 = self->_preferWiFiRequest;

      if (v36)
      {
        v38 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v37);
        v39 = _NRLogIsLevelEnabled(v38, 0);

        if (v39)
        {
          v41 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v40);
          _NRLogWithArgs(v41, 0, "%s%.30s:%-4d processing deferred prefer Wi-Fi disable request", ", "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]", 6687);

        }
        -[NRDDeviceConductor preferWiFiRequestUnavailable](self, "preferWiFiRequestUnavailable");
      }
    }
  }
  else if (v3 && !self->_preferWiFiRequest && self->_pendingPreferWiFiRequest)
  {
    v27 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
    v28 = _NRLogIsLevelEnabled(v27, 0);

    if (v28)
    {
      v30 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v29);
      _NRLogWithArgs(v30, 0, "%s%.30s:%-4d resetting pending bit for prefer Wi-Fi request, as the device has a phone call relay request", ", "-[NRDDeviceConductor deviceHasPhoneCallRelayRequest:]", 6698);

    }
    self->_pendingPreferWiFiRequest = 0;
  }
}

- (void)apsIsConnected:(BOOL)a3
{
  _BOOL4 v3;
  NSUUID *nrUUID;
  _BOOL4 v6;
  void *v7;
  int IsLevelEnabled;
  uint64_t v9;
  void *v10;
  _BOOL4 apsIsConnected;
  NSUUID *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSUUID *v16;
  id v17;

  v3 = a3;
  if (self)
  {
    self->_hasReceivedFirstAPSIsConnectedUpdate = 1;
    if (self->_apsIsConnected == a3)
      return;
    nrUUID = self->_nrUUID;
    v6 = a3;
  }
  else
  {
    if (!a3)
      return;
    nrUUID = 0;
    v6 = 1;
  }
  v7 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v7, 0);

  if (IsLevelEnabled)
  {
    if (self)
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v9);
      apsIsConnected = self->_apsIsConnected;
    }
    else
    {
      v10 = (void *)_NRCopyLogObjectForNRUUID(0, v9);
      apsIsConnected = 0;
    }
    _NRLogWithArgs(v10, 0, "%s%.30s:%-4d apsIsConnected: %d -> %d", ", "-[NRDDeviceConductor apsIsConnected:]", 6714, apsIsConnected, v6);

  }
  if (self)
  {
    self->_apsIsConnected = v3;
    if (self->_isEnabled)
    {
      if (v3)
        sub_1000DAA00((uint64_t)self);
      return;
    }
    v12 = self->_nrUUID;
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)_NRCopyLogObjectForNRUUID(v12, v9);
  v14 = _NRLogIsLevelEnabled(v13, 0);

  if (v14)
  {
    if (self)
      v16 = self->_nrUUID;
    else
      v16 = 0;
    v17 = (id)_NRCopyLogObjectForNRUUID(v16, v15);
    _NRLogWithArgs(v17, 0, "%s%.30s:%-4d Ignoring apsIsConnected callback as conductor is disabled (apsIsConnected: %d)", ", "-[NRDDeviceConductor apsIsConnected:]", 6718, v6);

  }
}

- (void)deviceHasQuickRelayRequest:(id)a3 hasQuickRelayRequest:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSUUID *nrUUID;
  void *v9;
  int IsLevelEnabled;
  uint64_t v11;
  void *v12;
  id *v13;
  id *v14;
  _BYTE *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  NSUUID *v24;
  void *v25;
  int v26;
  NSUUID *v27;
  NSUUID *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSUUID *v32;
  unsigned __int8 v33;
  void *v34;
  int v35;
  uint64_t v36;
  NSUUID *v37;
  void *v38;
  id v39;

  v4 = a4;
  v6 = a3;
  v39 = v6;
  if (self)
  {
    if ((objc_msgSend(v6, "isEqual:", self->_nrUUID) & 1) != 0)
    {
      nrUUID = self->_nrUUID;
      if (self->_isEnabled)
      {
        v9 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v7);
        IsLevelEnabled = _NRLogIsLevelEnabled(v9, 0);

        if (IsLevelEnabled)
        {
          v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v11);
          _NRLogWithArgs(v12, 0, "%s%.30s:%-4d deviceHasQuickRelayRequest: %d -> %d", ", "-[NRDDeviceConductor deviceHasQuickRelayRequest:hasQuickRelayRequest:]", 6779, self->_hasQuickRelayRequest, v4);

        }
        self->_hasQuickRelayRequest = v4;
        if (!self->_hasReceivedFirstAPSIsConnectedUpdate)
        {
          objc_opt_self(NRLinkDirector);
          if (qword_1001E4710 != -1)
            dispatch_once(&qword_1001E4710, &stru_1001B6E60);
          v13 = (id *)(id)qword_1001E4708;
          v14 = v13;
          if (v13)
          {
            v15 = v13[7];
            if (v15)
              v16 = v15[32] != 0;
            else
              v16 = 0;
          }
          else
          {
            v15 = 0;
            v16 = 0;
          }
          self->_apsIsConnected = v16;

          v18 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v17);
          v19 = _NRLogIsLevelEnabled(v18, 0);

          if (v19)
          {
            v21 = _NRCopyLogObjectForNRUUID(self->_nrUUID, v20);
            v22 = (void *)v21;
            if (self->_apsIsConnected)
              v23 = "YES";
            else
              v23 = "NO";
            _NRLogWithArgs(v21, 0, "%s%.30s:%-4d force fetching apsIsConnected: %s", ", "-[NRDDeviceConductor deviceHasQuickRelayRequest:hasQuickRelayRequest:]", 6784, v23);

          }
        }
        sub_1000DAA00((uint64_t)self);
        goto LABEL_30;
      }
      goto LABEL_26;
    }
    v24 = self->_nrUUID;
  }
  else
  {
    v33 = objc_msgSend(v6, "isEqual:", 0);
    v24 = 0;
    nrUUID = 0;
    if ((v33 & 1) != 0)
    {
LABEL_26:
      v34 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v7);
      v35 = _NRLogIsLevelEnabled(v34, 0);

      if (v35)
      {
        if (self)
          v37 = self->_nrUUID;
        else
          v37 = 0;
        v38 = (void *)_NRCopyLogObjectForNRUUID(v37, v36);
        _NRLogWithArgs(v38, 0, "%s%.30s:%-4d Ignoring quick relay request as conductor is disabled (request: %d)", ", "-[NRDDeviceConductor deviceHasQuickRelayRequest:hasQuickRelayRequest:]", 6775, v4);

      }
      goto LABEL_30;
    }
  }
  v25 = (void *)_NRCopyLogObjectForNRUUID(v24, v7);
  v26 = _NRLogIsLevelEnabled(v25, 17);

  if (v26)
  {
    if (self)
      v27 = self->_nrUUID;
    else
      v27 = 0;
    v28 = v27;
    v30 = _NRCopyLogObjectForNRUUID(v28, v29);
    v31 = (void *)v30;
    if (self)
      v32 = self->_nrUUID;
    else
      v32 = 0;
    _NRLogWithArgs(v30, 17, "Received quick relay request for incorrect conductor (expected: %@, received: %@", v32, v39);

  }
LABEL_30:

}

- (void)deviceHasBTLinkUpgradeRequest:(BOOL)a3
{
  id v4;
  NRDevicePreferencesManager *v5;
  NRBTLinkPreferencesAgent *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NRDevicePreferencesManager *v10;
  NRBTLinkPreferencesAgent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  char v19;

  if (a3)
  {
    v4 = objc_alloc_init((Class)NRBluetoothLinkPreferences);
    objc_msgSend(v4, "setPacketsPerSecond:", &off_1001C4840);
    if (self)
    {
      v5 = self->_devicePreferencesManager;
      v6 = self->_btLinkPreferencesAgent;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRBTLinkPreferencesAgent agentUUID](v6, "agentUUID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      sub_100114D50((uint64_t)v5, v4, v8);

      v9 = (self->_effectiveALUAdvice >> 1) & 1;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000DA9AC;
      v18[3] = &unk_1001B74A8;
      v19 = v9;
      v18[4] = self;
      sub_1000D8878((uint64_t)self, 1, v9, v18);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "agentUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
      sub_100114D50(0, v4, v15);

    }
  }
  else if (self)
  {
    v10 = self->_devicePreferencesManager;
    v11 = self->_btLinkPreferencesAgent;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRBTLinkPreferencesAgent agentUUID](v11, "agentUUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    sub_100114E1C((uint64_t)v10, v13);

    sub_1000D8FF0((uint64_t)self, self->_linkUpgradeReportForBTClassic);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "agentUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
    sub_100114E1C(0, v17);

  }
}

- (void)reportBTLinkUpgradeClientAdded:(id)a3
{
  if (self)
    self = (NRDDeviceConductor *)self->_devicePreferencesManager;
  sub_100114B48((uint64_t)self, a3);
}

- (void)reportBTLinkUpgradeClientRemoved:(id)a3
{
  if (self)
    self = (NRDDeviceConductor *)self->_devicePreferencesManager;
  sub_100114C4C((uint64_t)self, a3);
}

- (BOOL)preferWiFiP2PRequestUpdated
{
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  BOOL result;
  NSUUID *nrUUID;
  void *v13;
  int IsLevelEnabled;
  uint64_t v15;
  void *v16;
  _BOOL4 preferWiFiRequest;
  _BOOL4 preferWiFiRequestInFlight;

  if (_NRIsAppleInternal(self))
  {
    if (self && self->_disablePreferWiFi)
      return 0;
    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v4 = (unsigned __int8 *)(id)qword_1001E4708;
    if (v4)
    {
      v5 = v4[8];

      if (v5)
        return 0;
    }
  }
  if (!self)
  {
    nrUUID = 0;
    goto LABEL_20;
  }
  if (!self->_preferWiFiRequest && !self->_preferWiFiRequestInFlight)
  {
    nrUUID = self->_nrUUID;
LABEL_20:
    v13 = (void *)_NRCopyLogObjectForNRUUID(nrUUID, v3);
    IsLevelEnabled = _NRLogIsLevelEnabled(v13, 0);

    result = 0;
    if (!IsLevelEnabled)
      return result;
    if (self)
    {
      v16 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v15);
      preferWiFiRequest = self->_preferWiFiRequest;
      preferWiFiRequestInFlight = self->_preferWiFiRequestInFlight;
    }
    else
    {
      v16 = (void *)_NRCopyLogObjectForNRUUID(0, v15);
      preferWiFiRequest = 0;
      preferWiFiRequestInFlight = 0;
    }
    _NRLogWithArgs(v16, 0, "%s%.30s:%-4d %d %d", ", "-[NRDDeviceConductor preferWiFiP2PRequestUpdated]", 6836, preferWiFiRequest, preferWiFiRequestInFlight);

    return 0;
  }
  if (self->_supportsAWDL)
  {
    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v6 = (id)qword_1001E4708;
    v7 = v6;
    if (v6)
      v8 = (void *)*((_QWORD *)v6 + 12);
    else
      v8 = 0;
    v9 = v8;
    v10 = sub_100061594((uint64_t)v9, 0);

    if (v10 != self->_p2pRequested)
    {
      -[NRDDeviceConductor preferWiFiRequestUnavailable](self, "preferWiFiRequestUnavailable");
      -[NRDDeviceConductor preferWiFiRequestAvailable](self, "preferWiFiRequestAvailable");
    }
  }
  return 1;
}

- (BOOL)preferWiFiRequestAvailable
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int IsLevelEnabled;
  uint64_t v7;
  BOOL result;
  void *v9;
  unsigned __int8 *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  BOOL v38;
  NRLinkDirectorRequest *v39;
  NRLinkDirectorRequest *v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_preferWiFiRequestInFlight = 0;
  if (!_NRIsAppleInternal(v3))
    goto LABEL_48;
  if (self->_disablePreferWiFi)
  {
    v5 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
    IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0);

    result = 0;
    if (IsLevelEnabled)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      _NRLogWithArgs(v9, 0, "%s%.30s:%-4d ignoring prefer Wi-Fi request as it is manually disabled");
LABEL_14:

      return 0;
    }
    return result;
  }
  objc_opt_self(NRLinkDirector);
  if (qword_1001E4710 != -1)
    dispatch_once(&qword_1001E4710, &stru_1001B6E60);
  v10 = (unsigned __int8 *)(id)qword_1001E4708;
  if (!v10 || (v11 = v10[8], v10, !v11))
  {
LABEL_48:
    if (self->_deviceSetupInProgress)
    {
      v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
      v16 = _NRLogIsLevelEnabled(v15, 0);

      result = 0;
      if (v16)
      {
        v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v17);
        _NRLogWithArgs(v9, 0, "%s%.30s:%-4d ignoring prefer Wi-Fi enable request as device setup is in progress");
        goto LABEL_14;
      }
    }
    else
    {
      if (self->_hasPhoneCallRelayRequest)
      {
        v18 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
        v19 = _NRLogIsLevelEnabled(v18, 0);

        if (v19)
        {
          v21 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v20);
          _NRLogWithArgs(v21, 0, "%s%.30s:%-4d ignoring prefer Wi-Fi enable request as we have an active phone call relay request", ", "-[NRDDeviceConductor preferWiFiRequestAvailable]", 6877);

        }
      }
      else
      {
        if (self->_supportsAWDL)
        {
          objc_opt_self(NRLinkDirector);
          if (qword_1001E4710 != -1)
            dispatch_once(&qword_1001E4710, &stru_1001B6E60);
          v22 = (id)qword_1001E4708;
          v23 = v22;
          if (v22)
            v24 = (void *)*((_QWORD *)v22 + 12);
          else
            v24 = 0;
          v25 = v24;
          self->_p2pRequested = sub_100061594((uint64_t)v25, 0);

        }
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        v26 = sub_1000D8AA8((uint64_t)self, 2, 101);
        v33 = v26;
        if (v26 && objc_msgSend(v26, "state") != 255)
          goto LABEL_32;
        if (!self->_p2pRequested)
          goto LABEL_38;
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        objc_opt_self(NRLinkDirector);
        if (qword_1001E4710 != -1)
          dispatch_once(&qword_1001E4710, &stru_1001B6E60);
        v34 = (id)qword_1001E4708;
        v35 = v34;
        v36 = v34 ? (void *)*((_QWORD *)v34 + 6) : 0;
        v37 = v36;

        v38 = sub_100148F4C((uint64_t)v37);
        if (v38)
        {
LABEL_32:
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          if (self->_isAlwaysReachableOverWiFi)
          {
            v39 = objc_alloc_init(NRLinkDirectorRequest);
            v40 = v39;
            if (v39)
            {
              v39->_type = 1;
              v39->_requiredLinkType = 1;
              *(_WORD *)&v39->_attemptImmediately = 257;
            }
            sub_1000D320C((uint64_t)self, v39);

          }
          if (sub_1000D78EC((uint64_t)self, 1, 1, 1, 0, 0))
          {
            objc_msgSend(v33, "start");
          }
          else
          {
            self->_pendingPreferWiFiRequest = 1;
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_1000DA8FC;
            v47[3] = &unk_1001B8AE0;
            v47[4] = self;
            sub_1000D78EC((uint64_t)self, 1, 0, 0, 0, v47);
            v42 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v41);
            v43 = _NRLogIsLevelEnabled(v42, 1);

            if (v43)
            {
              v45 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v44);
              _NRLogWithArgs(v45, 1, "%s%.30s:%-4d Enqueued prefer Wi-Fi request to be sent later", ", "-[NRDDeviceConductor preferWiFiRequestAvailable]", 6939);

            }
          }
        }
        else
        {
LABEL_38:
          sub_1000DA624((uint64_t)self, CFSTR("No Wi-Fi link available"), v27, v28, v29, v30, v31, v32, v46);
          self->_pendingPreferWiFiRequest = 1;
        }

      }
      return 1;
    }
    return result;
  }
  v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
  v13 = _NRLogIsLevelEnabled(v12, 0);

  result = 0;
  if (v13)
  {
    v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
    _NRLogWithArgs(v9, 0, "%s%.30s:%-4d ignoring prefer Wi-Fi request as fixed interface mode is enabled");
    goto LABEL_14;
  }
  return result;
}

- (BOOL)preferWiFiRequestUnavailable
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int IsLevelEnabled;
  uint64_t v7;
  BOOL result;
  void *v9;
  unsigned __int8 *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_preferWiFiRequestInFlight = 0;
  if (_NRIsAppleInternal(v3))
  {
    if (self->_disablePreferWiFi)
    {
      v5 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
      IsLevelEnabled = _NRLogIsLevelEnabled(v5, 0);

      result = 0;
      if (!IsLevelEnabled)
        return result;
      v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v7);
      _NRLogWithArgs(v9, 0, "%s%.30s:%-4d ignoring prefer Wi-Fi request as it is manually disabled");
LABEL_11:

      return 0;
    }
    objc_opt_self(NRLinkDirector);
    if (qword_1001E4710 != -1)
      dispatch_once(&qword_1001E4710, &stru_1001B6E60);
    v10 = (unsigned __int8 *)(id)qword_1001E4708;
    if (v10)
    {
      v11 = v10[8];

      if (v11)
      {
        v12 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
        v13 = _NRLogIsLevelEnabled(v12, 0);

        result = 0;
        if (!v13)
          return result;
        v9 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v14);
        _NRLogWithArgs(v9, 0, "%s%.30s:%-4d ignoring prefer Wi-Fi request as fixed interface mode is enabled");
        goto LABEL_11;
      }
    }
  }
  if (self->_hasPhoneCallRelayRequest)
  {
    v15 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v4);
    v16 = _NRLogIsLevelEnabled(v15, 0);

    if (v16)
    {
      v18 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v17);
      _NRLogWithArgs(v18, 0, "%s%.30s:%-4d ignoring prefer Wi-Fi disable request as we have an active phone call relay request", ", "-[NRDDeviceConductor preferWiFiRequestUnavailable]", 6970);

    }
  }
  else
  {
    self->_p2pRequested = 0;
    if (!sub_1000D78EC((uint64_t)self, 0, 1, 1, 0, 0) && !sub_1000D78EC((uint64_t)self, 0, 1, 1, 1, 0))
      sub_1000D78EC((uint64_t)self, 0, 1, 0, 0, 0);
    self->_pendingPreferWiFiRequest = 0;
    sub_1000D7A20((uint64_t)self, 0);
  }
  return 1;
}

- (void)directToCloudRequestAvailable
{
  if (self)
  {
    if (self->_allowsDirectToCloud)

  }
}

- (void)directToCloudRequestUnavailable
{
  uint64_t v3;
  NRAnalyticsDirectToCloud *directToCloudAnalytics;
  NRAnalyticsDirectToCloud *v5;
  NRAnalyticsDirectToCloud *v6;
  NRAnalyticsDirectToCloud *v7;
  unint64_t iRATManagerQueryEnd;
  NRAnalyticsDirectToCloud *v9;
  NRAnalyticsDirectToCloud *v10;

  if (self && self->_allowsDirectToCloud)
  {
    v3 = mach_absolute_time();
    directToCloudAnalytics = self->_directToCloudAnalytics;
    if (directToCloudAnalytics
      && (directToCloudAnalytics->_directToCloudRequestEnd = v3, (v5 = self->_directToCloudAnalytics) != 0))
    {
      self->_directToCloudRequestEndTime = v5->_directToCloudRequestEnd;
      v6 = v5;
      if (v6->_iRATManagerQueryStart)
      {
        v7 = self->_directToCloudAnalytics;
        if (v7)
        {
          iRATManagerQueryEnd = v7->_iRATManagerQueryEnd;

          if (iRATManagerQueryEnd)
            goto LABEL_13;
          v9 = self->_directToCloudAnalytics;
          if (!v9)
            goto LABEL_13;
        }
        else
        {

          v9 = self->_directToCloudAnalytics;
          if (!v9)
            goto LABEL_13;
        }
        v9->_iRATManagerQueryIncomplete = 1;
LABEL_13:
        -[NRAnalyticsDirectToCloud submit](self->_directToCloudAnalytics, "submit");
        v10 = self->_directToCloudAnalytics;
        self->_directToCloudAnalytics = 0;

        return;
      }
    }
    else
    {
      self->_directToCloudRequestEndTime = 0;
      v6 = 0;
    }

    goto LABEL_13;
  }
}

- (void)localAWDLEndpointChanged:(id)a3
{
  uint64_t v4;

  if (self && self->_isEnabled && self->_supportsAWDL)
  {
    sub_1000D2EC0((uint64_t)self);
    sub_1000D3114((uint64_t)self, v4);
  }
}

- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  uint64_t v6;
  NRApplicationServiceClient *v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v12 && self->_asClient == v7)
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0);

    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d starting browse for %@", ", "-[NRDDeviceConductor didStartBrowseRequestForASName:asClient:]", 8606, v12);

    }
    sub_1000D2168((uint64_t)self, 1, 0);
  }

}

- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  uint64_t v6;
  NRApplicationServiceClient *v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  NRApplicationServiceClient *asClient;
  NRApplicationServiceClient *v13;
  _BOOL4 qrAssertedForBrowse;
  id v15;

  v15 = a3;
  v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v15 && self->_asClient == v7)
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0);

    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d stopping browse for %@", ", "-[NRDDeviceConductor didStopBrowseRequestForASName:asClient:]", 8614, v15);

    }
    asClient = self->_asClient;
    if (asClient)
      asClient = (NRApplicationServiceClient *)asClient->_asNamesForBrowsing;
    v13 = asClient;
    if (-[NRApplicationServiceClient count](v13, "count"))
    {

    }
    else
    {
      qrAssertedForBrowse = self->_qrAssertedForBrowse;

      if (qrAssertedForBrowse)
      {
        self->_qrAssertedForBrowse = 0;
        -[NRQuickRelayAgent unassertAgentWithOptions:](self->_quickRelayAgent, "unassertAgentWithOptions:", 0);
      }
    }
  }

}

- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4
{
  uint64_t v6;
  NRApplicationServiceClient *v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v12 && self->_asClient == v7)
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0);

    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d starting resolve for %@", ", "-[NRDDeviceConductor didStartResolveRequestForASName:asClient:]", 8625, v12);

    }
    sub_1000D2168((uint64_t)self, 0, 1);
  }

}

- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4
{
  uint64_t v6;
  NRApplicationServiceClient *v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  NRApplicationServiceClient *asClient;
  NRApplicationServiceClient *v13;
  _BOOL4 qrAssertedForResolve;
  id v15;

  v15 = a3;
  v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v15 && self->_asClient == v7)
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0);

    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d stopping resolve for %@", ", "-[NRDDeviceConductor didStopResolveRequestForASName:asClient:]", 8633, v15);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_asNamesToResolvedEndpoints, "setObject:forKeyedSubscript:", 0, v15);
    asClient = self->_asClient;
    if (asClient)
      asClient = (NRApplicationServiceClient *)asClient->_asNamesForResolving;
    v13 = asClient;
    if (-[NRApplicationServiceClient count](v13, "count"))
    {

    }
    else
    {
      qrAssertedForResolve = self->_qrAssertedForResolve;

      if (qrAssertedForResolve)
      {
        self->_qrAssertedForResolve = 0;
        -[NRQuickRelayAgent unassertAgentWithOptions:](self->_quickRelayAgent, "unassertAgentWithOptions:", 0);
      }
    }
  }

}

- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4
{
  uint64_t v6;
  NRApplicationServiceClient *v7;
  void *v8;
  int IsLevelEnabled;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v12 && self->_asClient == v7)
  {
    v8 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v6);
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 0);

    if (IsLevelEnabled)
    {
      v11 = (void *)_NRCopyLogObjectForNRUUID(self->_nrUUID, v10);
      _NRLogWithArgs(v11, 0, "%s%.30s:%-4d resolve completed for %@", ", "-[NRDDeviceConductor didCompleteIncomingResolveRequestForASName:asClient:]", 8645, v12);

    }
    sub_1000D1DFC((uint64_t)self, v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyUsageTokenToTokenAgent, 0);
  objc_storeStrong((id *)&self->_asNamesToResolvedEndpoints, 0);
  objc_storeStrong((id *)&self->_endpointServiceUUID, 0);
  objc_storeStrong((id *)&self->_asClient, 0);
  objc_storeStrong((id *)&self->_linkUpgradeReportWiFiInfra, 0);
  objc_storeStrong((id *)&self->_linkUpgradeReportForBTClassic, 0);
  objc_storeStrong((id *)&self->_currentALUAdviceID, 0);
  objc_storeStrong((id *)&self->_aluMonitor, 0);
  objc_storeStrong((id *)&self->_discoveryProxyClient, 0);
  objc_storeStrong((id *)&self->_discoveryProxyServer, 0);
  objc_storeStrong((id *)&self->_dnsProxyServer, 0);
  objc_storeStrong((id *)&self->_dnsProxyClient, 0);
  objc_storeStrong((id *)&self->_proxyConfigurationPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_companionLinkMonitorPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_lastReceivedNetInfoDataHash, 0);
  objc_storeStrong((id *)&self->_companionNWDescAgentDataHash, 0);
  objc_storeStrong((id *)&self->_companionNWDescAgent, 0);
  objc_storeStrong((id *)&self->_pathOverrideAgent, 0);
  objc_storeStrong((id *)&self->_netInfo, 0);
  objc_storeStrong((id *)&self->_masqueProxyConfig, 0);
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_proxyAgentRegistration, 0);
  objc_storeStrong((id *)&self->_usedProxyNotifyPayload, 0);
  objc_storeStrong((id *)&self->_companionProxyConfigAgent, 0);
  objc_storeStrong((id *)&self->_linkTypesForLinkUpgrade, 0);
  objc_storeStrong((id *)&self->_discoveredEndpoint, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_lastActiveCompanionInterfaceName, 0);
  objc_storeStrong((id *)&self->_companionLinkViabilityAgent, 0);
  objc_storeStrong((id *)&self->_phoneCallRelayAnalytics, 0);
  objc_storeStrong((id *)&self->_preferWiFiAnalytics, 0);
  objc_storeStrong((id *)&self->_idsPathWatcherSource, 0);
  objc_storeStrong((id *)&self->_companionAgentRemovalPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_proxyCriteriaPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_flowDivertPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_companionNWDescPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_netInfoPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_directToCloudAnalytics, 0);
  objc_storeStrong((id *)&self->_addedPermittedClientPolicyIDArray, 0);
  objc_storeStrong((id *)&self->_forcedWoWUUID, 0);
  objc_storeStrong((id *)&self->_symptomsNOIManager, 0);
  objc_storeStrong((id *)&self->_btLinkPreferencesAgent, 0);
  objc_storeStrong((id *)&self->_quickRelayAgent, 0);
  objc_storeStrong((id *)&self->_devicePreferencesManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupInProgressConnections, 0);
  objc_storeStrong((id *)&self->_deviceMonitorConnections, 0);
  objc_storeStrong((id *)&self->_pendingNotifications, 0);
  objc_storeStrong((id *)&self->_xpcCommConnections, 0);
  objc_storeStrong((id *)&self->_lastSentWiFiSignature, 0);
  objc_storeStrong((id *)&self->_lastSentWiFiEndpoint, 0);
  objc_storeStrong((id *)&self->_primaryLink, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_availableLinks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

@end
