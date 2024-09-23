@implementation NRLinkFixedInterface

- (id)copyStatusString
{
  id v3;
  void *v4;
  id v5;
  NEVirtualInterface_s *virtualInterface;
  void *v7;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink description](self, "description"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "nrUUID", self->super._nrUUID);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "localInterfaceName", self->super._localInterfaceName);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "listenerPortString", *(NEIKEv2Session **)((char *)&self->_ikeSessionClassD + 7));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "ikeSessionClassD", *(NEIKEv2Listener **)((char *)&self->_ikeListener + 7));
  virtualInterface = self->super._virtualInterface;
  if (virtualInterface)
  {
    v7 = (void *)NEVirtualInterfaceCopyName(virtualInterface);
    objc_msgSend(v5, "appendFormat:", CFSTR("\n %35s = %@"), "virtualInterfaceName", v7);

  }
  return v5;
}

- (void)invalidateLink
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NRCompanionProxyAgent *companionProxyAgent;
  NRCompanionProxyAgent *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NRLinkFixedInterface;
  -[NRLink invalidateLink](&v10, "invalidateLink");
  if (!self)
  {
    objc_msgSend(0, "invalidateVirtualInterface");
    companionProxyAgent = (NRCompanionProxyAgent *)MEMORY[0x58];
    if (!MEMORY[0x58])
      return;
    goto LABEL_7;
  }
  -[NRLinkFixedInterface invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4);
  v3 = *(NSNumber **)((char *)&self->_listenerPort + 7);
  if (v3)
  {
    objc_msgSend(v3, "cancel");
    v4 = *(NSNumber **)((char *)&self->_listenerPort + 7);
    *(NSNumber **)((char *)&self->_listenerPort + 7) = 0;

  }
  -[NRLink invalidateVirtualInterface](self, "invalidateVirtualInterface");
  v6 = *(uint64_t *)((char *)&self->_listenerPortString + 7);
  if (v6)
  {
    nw_path_evaluator_cancel(v6, v5);
    v7 = *(NSString **)((char *)&self->_listenerPortString + 7);
    *(NSString **)((char *)&self->_listenerPortString + 7) = 0;

  }
  companionProxyAgent = self->super._companionProxyAgent;
  if (companionProxyAgent)
  {
LABEL_7:
    sub_10005DA9C((uint64_t)companionProxyAgent, v5);
    -[NRLink reportEvent:](self, "reportEvent:", 12003);
    v9 = self->super._companionProxyAgent;
    self->super._companionProxyAgent = 0;

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
  v9.super_class = (Class)NRLinkFixedInterface;
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
  NRLinkFixedInterface *v2;
  void *v3;
  BOOL v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *evaluator_for_endpoint;
  void *v16;
  uint64_t v17;
  const char *v18;
  id v19;
  id v20;
  const __CFString *v21;
  id v22;
  int IsLevelEnabled;
  id v24;
  int v25;
  id v26;
  char *v27;
  int *v28;
  uint64_t v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id location;

  v2 = self;
  if (-[NRLink state](self, "state") != 8)
  {
    if (-[NRLink state](v2, "state") == 9)
      return -[NRLinkFixedInterface resume](v2, "resume");
    if (-[NRLink startRequested](v2, "startRequested"))
      return 1;
    -[NRLink setStartRequested:](v2, "setStartRequested:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](v2, "localInterfaceName"));

    if (!v6)
    {
      v22 = sub_100062CF4();
      IsLevelEnabled = _NRLogIsLevelEnabled(v22, 17);

      if (!IsLevelEnabled)
        return 0;
      v20 = sub_100062CF4();
      _NRLogWithArgs(v20, 17, "Cannot start Wi-Fi link without wifiInterfaceName");
LABEL_22:

      return 0;
    }
    if (-[NRLink state](v2, "state") == 1)
    {
      -[NRLink reportEvent:](v2, "reportEvent:", 3001);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](v2, "nrUUID"));
      v8 = sub_10012FFF4((uint64_t)NRDLocalDevice, v7);

      if (v8)
      {
        -[NRLink setIkev2Role:](v2, "setIkev2Role:", sub_10010DF88(v8));
        if (-[NRLink ikev2Role](v2, "ikev2Role") == 2
          && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](v2, "remoteOuterEndpoint")),
              v9,
              !v9))
        {
          v21 = CFSTR("No remote outer endpoint present");
        }
        else
        {
          if (-[NRLink setupVirtualInterface](v2, "setupVirtualInterface"))
          {
            v10 = nw_parameters_create();
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localInterfaceName](v2, "localInterfaceName"));
            v12 = nw_interface_create_with_name(objc_msgSend(v11, "UTF8String"));
            nw_parameters_require_interface(v10, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink remoteOuterEndpoint](v2, "remoteOuterEndpoint"));
            v14 = objc_msgSend(v13, "copyCEndpoint");
            evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(v14, v10);

            objc_initWeak(&location, v2);
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink queue](v2, "queue"));
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100064BEC;
            v32[3] = &unk_1001B7850;
            objc_copyWeak(&v33, &location);
            nw_path_evaluator_set_update_handler(evaluator_for_endpoint, v16, v32);

            nw_path_evaluator_start(evaluator_for_endpoint);
            if (v2)
              objc_storeStrong((id *)((char *)&v2->_listenerPortString + 7), evaluator_for_endpoint);
            sub_100064414((char *)v2, v17);
            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);

            v5 = 1;
            goto LABEL_27;
          }
          v21 = CFSTR("failed to setup virtual interface");
        }
        -[NRLinkFixedInterface cancelWithReason:](v2, "cancelWithReason:", v21);
        v5 = 0;
LABEL_27:

        return v5;
      }
      v24 = sub_100062CF4();
      v25 = _NRLogIsLevelEnabled(v24, 16);

      v18 = "-[NRLinkFixedInterface start]";
      if (v25)
      {
        v26 = sub_100062CF4();
        _NRLogWithArgs(v26, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLinkFixedInterface start]", 153);

      }
      v2 = (NRLinkFixedInterface *)_os_log_pack_size(12);
      v27 = (char *)&v32[-1] - ((__chkstk_darwin(v2) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = __error();
      v29 = _os_log_pack_fill(v27, v2, *v28, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
      *(_DWORD *)v29 = 136446210;
      *(_QWORD *)(v29 + 4) = "-[NRLinkFixedInterface start]";
      v30 = sub_100062CF4();
      _NRLogAbortWithPack(v30, v27);
      __break(1u);
    }
    else
    {
      if (qword_1001E4650 != -1)
        dispatch_once(&qword_1001E4650, &stru_1001B6990);
      v18 = (const char *)&OBJC_PROTOCOL___CBScalablePipeManagerDelegate;
      if (!_NRLogIsLevelEnabled(qword_1001E4648, 17))
        return 0;
      if (qword_1001E4650 == -1)
        goto LABEL_21;
    }
    dispatch_once(&qword_1001E4650, &stru_1001B6990);
LABEL_21:
    v19 = *((id *)v18 + 201);
    v20 = sub_10010E200(-[NRLink state](v2, "state"));
    _NRLogWithArgs(v19, 17, "Cannot start link in state %@", v20);

    goto LABEL_22;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](v2, "linkDelegate"));
  objc_msgSend(v3, "linkIsReady:", v2);

  return 1;
}

- (BOOL)cancelWithReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v8;
  int IsLevelEnabled;
  id v10;
  uint64_t v11;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v11);
    -[NRLink reportEvent:details:](self, "reportEvent:details:", 3005, v5);
    if (-[NRLink changeStateTo:](self, "changeStateTo:", 255))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink linkDelegate](self, "linkDelegate"));
      objc_msgSend(v6, "linkIsUnavailable:", self);

      -[NRLinkFixedInterface invalidateLink](self, "invalidateLink");
    }
    else
    {
      if (qword_1001E4650 != -1)
        dispatch_once(&qword_1001E4650, &stru_1001B6990);
      if (_NRLogIsLevelEnabled(qword_1001E4648, 1))
      {
        if (qword_1001E4650 != -1)
          dispatch_once(&qword_1001E4650, &stru_1001B6990);
        _NRLogWithArgs(qword_1001E4648, 1, "%s%.30s:%-4d link already cancelled: %@", ", "-[NRLinkFixedInterface cancelWithReason:]", 207, self);
      }
    }

  }
  else
  {
    v8 = sub_100062CF4();
    IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17);

    if (IsLevelEnabled)
    {
      v10 = sub_100062CF4();
      _NRLogWithArgs(v10, 17, "%s called with null reasonFormat", "-[NRLinkFixedInterface cancelWithReason:]");

    }
  }

  return v4 != 0;
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  int v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NRLinkFixedInterface;
  -[NRLink invalidateIKESessionForClass:](&v5, "invalidateIKESessionForClass:");
  -[NRLink invalidateIKESession:](self, "invalidateIKESession:", sub_100064A94((uint64_t)self, v3));
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  char *v14;
  id v15;
  id v16;
  id v17;
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
  id v32;
  char *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id *v43;
  id v44;
  unsigned __int8 v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  int IsLevelEnabled;
  id v52;
  id v53;
  int v54;
  id v55;
  int v56;
  id v57;
  int v58;
  id v59;
  int v60;
  id v61;
  int v62;
  id v63;
  uint64_t v64;
  int *v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  char *v70;
  id v71;
  id v72;
  _QWORD v73[2];

  v14 = (char *)a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (uint64_t (**)(id, void *))a7;
  v19 = a8;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v19;
  if (!v14)
  {
    v50 = sub_100062CF4();
    IsLevelEnabled = _NRLogIsLevelEnabled(v50, 17);

    if (!IsLevelEnabled)
      goto LABEL_45;
    v52 = sub_100062CF4();
    _NRLogWithArgs(v52, 17, "%s called with null listener");
LABEL_37:

    goto LABEL_45;
  }
  if (!v15)
  {
    v53 = sub_100062CF4();
    v54 = _NRLogIsLevelEnabled(v53, 17);

    if (!v54)
      goto LABEL_45;
    v52 = sub_100062CF4();
    _NRLogWithArgs(v52, 17, "%s called with null session");
    goto LABEL_37;
  }
  if (!v16)
  {
    v55 = sub_100062CF4();
    v56 = _NRLogIsLevelEnabled(v55, 17);

    if (!v56)
      goto LABEL_45;
    v52 = sub_100062CF4();
    _NRLogWithArgs(v52, 17, "%s called with null sessionConfig");
    goto LABEL_37;
  }
  if (!v18)
  {
    v57 = sub_100062CF4();
    v58 = _NRLogIsLevelEnabled(v57, 17);

    if (!v58)
      goto LABEL_45;
    v52 = sub_100062CF4();
    _NRLogWithArgs(v52, 17, "%s called with null validateAuthBlock");
    goto LABEL_37;
  }
  if (v19)
  {
    v22 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v20);
    v23 = _NRLogIsLevelEnabled(v22, 0);

    if (v23)
    {
      v25 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v24);
      v26 = -[NRLink copyDescription](self, "copyDescription");
      _NRLogWithArgs(v25, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@ childConfig %@", ", "-[NRLinkFixedInterface requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 542, v26, v14, v15, v16, v17);

    }
    state = self->super._state;
    v72 = v15;
    if (state == 255)
      goto LABEL_42;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    v71 = a4;
    if (qword_1001E4920 != -1)
      dispatch_once(&qword_1001E4920, &stru_1001B7D88);
    v29 = (id)qword_1001E4918;
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
    {
      v33 = v14;
      v34 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v31);
      v35 = _NRLogIsLevelEnabled(v34, 16);

      if (v35)
      {
        v37 = (void *)_NRCopyLogObjectForNRUUID(self->super._nrUUID, v36);
        v38 = -[NRLink copyDescription](self, "copyDescription");
        v39 = v17;
        v40 = v16;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
        _NRLogWithArgs(v37, 16, "%s%.30s:%-4d %@: Unrecognized identifier %@", ", "-[NRLinkFixedInterface requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 587, v38, v41);

        v16 = v40;
        v17 = v39;

      }
      v42 = 0;
      v32 = 0;
      v14 = v33;
      goto LABEL_43;
    }
    if (v17)
    {
      v32 = sub_100112420();
      objc_msgSend(v32, "setMode:", 2);
      objc_msgSend(v32, "setReplayWindowSize:", 4);
    }
    else
    {
      if (-[NRLink hasCompanionDatapath](self, "hasCompanionDatapath"))
      {
LABEL_41:
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3024, CFSTR("ClassD %@"), v15);
LABEL_42:
        v42 = 0;
        v32 = 0;
        goto LABEL_43;
      }
      v32 = 0;
    }
    v15 = (id)objc_claimAutoreleasedReturnValue(-[NRLink nrUUID](self, "nrUUID"));
    v43 = (id *)sub_10012FFF4((uint64_t)NRDLocalDevice, v15);

    if (v43)
    {
      v68 = v17;
      v42 = sub_100112798(0, v43, 4);
      v44 = v43[16];
      v45 = objc_msgSend(v44, "hasCompanionDatapath");

      v69 = v16;
      v70 = v14;
      if ((v45 & 1) != 0)
        v46 = 0;
      else
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[NRLink localOuterEndpoint](self, "localOuterEndpoint"));
      v47 = sub_100112FCC(v43, v46);
      v73[0] = v47;
      v48 = sub_100112E3C();
      v73[1] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 2));
      objc_msgSend(v42, "setCustomIKEAuthPrivateNotifies:", v49);

      if ((v18[2](v18, v42) & 1) != 0)
      {
        -[NRLinkFixedInterface invalidateIKESessionForClass:](self, "invalidateIKESessionForClass:", 4);
        objc_storeStrong((id *)((char *)&self->_ikeListener + 7), v71);
        sub_100062E74(self);
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3016, CFSTR("ClassD %@"), v72);

        v16 = v69;
        v14 = v70;
        v17 = v68;
        if (-[NRLink setupVirtualInterface](self, "setupVirtualInterface"))
        {
          ((void (**)(_QWORD, void *, id, NEVirtualInterface_s *))v21)[2](v21, v42, v32, -[NRLink virtualInterface](self, "virtualInterface"));
LABEL_44:

          v15 = v72;
          goto LABEL_45;
        }
      }
      else
      {
        -[NRLink reportEvent:detailsFormat:](self, "reportEvent:detailsFormat:", 3021, CFSTR("ClassD %@"), v72);

        v16 = v69;
        v14 = v70;
        v17 = v68;
      }
LABEL_43:
      v21[2](v21, 0, 0, 0);
      goto LABEL_44;
    }
    v61 = sub_100062CF4();
    v62 = _NRLogIsLevelEnabled(v61, 16);

    if (v62)
    {
      v63 = sub_100062CF4();
      _NRLogWithArgs(v63, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (localDevice) != ((void *)0)", ", "-[NRLinkFixedInterface requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 563);

    }
    v64 = _os_log_pack_size(12);
    v14 = (char *)&v68 - ((__chkstk_darwin(v64) + 15) & 0xFFFFFFFFFFFFFFF0);
    v65 = __error();
    v66 = _os_log_pack_fill(v14, v64, *v65, &_mh_execute_header, "%{public}s Assertion Failed: (localDevice) != ((void *)0)");
    *(_DWORD *)v66 = 136446210;
    *(_QWORD *)(v66 + 4) = "-[NRLinkFixedInterface requestConfigurationForListener:session:sessionConfig:childConfig:vali"
                           "dateAuthBlock:responseBlock:]";
    v67 = sub_100062CF4();
    _NRLogAbortWithPack(v67, v14);
    goto LABEL_41;
  }
  v59 = sub_100062CF4();
  v60 = _NRLogIsLevelEnabled(v59, 17);

  if (v60)
  {
    v52 = sub_100062CF4();
    _NRLogWithArgs(v52, 17, "%s called with null responseBlock");
    goto LABEL_37;
  }
LABEL_45:

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
      v17[2] = sub_100062D34;
      v17[3] = &unk_1001B7978;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v7, "sendPrivateNotifies:maxRetries:retryIntervalInMilliseconds:callbackQueue:callback:", v8, 10, 1000, v9, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = sub_100062CF4();
      IsLevelEnabled = _NRLogIsLevelEnabled(v14, 17);

      if (IsLevelEnabled)
      {
        v16 = sub_100062CF4();
        _NRLogWithArgs(v16, 17, "NEIKEv2PrivateNotify init %u %@ failed", 50702, v4);

      }
    }

  }
  else
  {
    v11 = sub_100062CF4();
    v12 = _NRLogIsLevelEnabled(v11, 17);

    if (v12)
    {
      v13 = sub_100062CF4();
      _NRLogWithArgs(v13, 17, "%s called with null data", "-[NRLinkFixedInterface sendControlData:]");

    }
    v6 = 0;
  }

  return v6;
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
  v17.super_class = (Class)NRLinkFixedInterface;
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
          _NRLogWithArgs(v14, 16, "%s%.30s:%-4d %@: failed to unregister companion agent", ", "-[NRLinkFixedInterface suspend]", 658, v15);

        }
      }
    }
    -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 9, CFSTR("(suspend)"));
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
    _NRLogWithArgs(v9, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'suspend'", ", "-[NRLinkFixedInterface suspend]", 652, v10);

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
      _NRLogWithArgs(v10, 1, "%s%.30s:%-4d %@: Already cancelled. Ignoring 'resume'", ", "-[NRLinkFixedInterface resume]", 674, v11);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)NRLinkFixedInterface;
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
            _NRLogWithArgs(v15, 16, "%s%.30s:%-4d %@: failed to register companion agent", ", "-[NRLinkFixedInterface resume]", 685, v16);

          }
        }
      }
      -[NRLink changeStateTo:details:](self, "changeStateTo:details:", 8, CFSTR("(resume)"));
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
  objc_storeStrong((id *)((char *)&self->_listenerPortString + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeSessionClassD + 7), 0);
  objc_storeStrong((id *)((char *)&self->_ikeListener + 7), 0);
  objc_storeStrong((id *)((char *)&self->_listenerPort + 7), 0);
  objc_storeStrong((id *)(&self->_hasScheduledSendingLocalClassCUnlock + 7), 0);
}

@end
