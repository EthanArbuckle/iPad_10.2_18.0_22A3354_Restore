@implementation NRDevicePairingManagerContext

- (void)dealloc
{
  objc_super v3;

  sub_1000FF18C((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRDevicePairingManagerContext;
  -[NRDevicePairingManagerContext dealloc](&v3, "dealloc");
}

- (NSString)description
{
  if (self)
    self = (NRDevicePairingManagerContext *)self->_info;
  return -[NRDevicePairingManagerContext description](self, "description");
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (self)
  {
    if (self->_centralManager)
    {
      v6 = v4;
      v5 = objc_msgSend(v4, "state") == (id)5;
      v4 = v6;
      if (v5)
      {
        sub_1000FEA30((id *)&self->super.isa);
        v4 = v6;
      }
    }
  }

}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  CBScalablePipeManager *v4;
  CBScalablePipeManager *v5;
  id v6;
  CBScalablePipeManager *pipeManager;
  CBScalablePipeManager *v8;
  void *v9;
  CBScalablePipeManager *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  v4 = (CBScalablePipeManager *)a3;
  v5 = v4;
  if (self)
  {
    if (self->_pipeManager != v4)
      goto LABEL_3;
  }
  else if (v4)
  {
    goto LABEL_3;
  }
  v6 = -[CBScalablePipeManager state](v4, "state");
  if (v6)
  {
    if (v6 == (id)5)
    {
      if (self)
        pipeManager = self->_pipeManager;
      else
        pipeManager = 0;
      v11[0] = CBScalablePipeOptionTransport;
      v11[1] = CBScalablePipeOptionStayConnectedWhenIdle;
      v12[0] = &off_1001C4870;
      v12[1] = &__kCFBooleanTrue;
      v11[2] = CBScalablePipeOptionRequiresEncryption;
      v12[2] = &__kCFBooleanFalse;
      v8 = pipeManager;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
      -[CBScalablePipeManager registerEndpoint:type:priority:options:](v8, "registerEndpoint:type:priority:options:", CFSTR("com.apple.terminusPairing"), 1, 2, v9);

    }
    else
    {
      if (self)
        v10 = self->_pipeManager;
      else
        v10 = 0;
      -[CBScalablePipeManager unregisterEndpoint:](v10, "unregisterEndpoint:", CFSTR("com.apple.terminusPairing"));
    }
  }
LABEL_3:

}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSMutableDictionary *cbUUIDCandidateMappings;
  id v10;
  NSMutableDictionary *pairingCandidates;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int fd;
  int v20;
  unsigned int v21;
  NSObject *v22;
  dispatch_source_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  int v28;
  id v29;
  int IsLevelEnabled;
  id v31;
  int v32;
  id v33;
  int v34;
  id v35;
  id v36;
  int v37;
  id v38;
  int v39;
  id v40;
  int v41;
  id v42;
  id v43;
  int v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD handler[5];

  v45 = a3;
  v6 = a4;
  if (v45)
  {
    if (!v6)
    {
      v29 = sub_1000FBA50();
      IsLevelEnabled = _NRLogIsLevelEnabled(v29, 17);

      if (!IsLevelEnabled)
        goto LABEL_33;
      v8 = sub_1000FBA50();
      _NRLogWithArgs(v8, 17, "%s called with null pipe");
      goto LABEL_32;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peer"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

    if (!v8)
    {
      v31 = sub_1000FBA50();
      v32 = _NRLogIsLevelEnabled(v31, 17);

      if (!v32)
      {
        v8 = 0;
        goto LABEL_32;
      }
      v10 = sub_1000FBA50();
      _NRLogWithArgs(v10, 17, "%s called with null cbUUID", "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidConnect:]");
      goto LABEL_31;
    }
    if (self)
      cbUUIDCandidateMappings = self->_cbUUIDCandidateMappings;
    else
      cbUUIDCandidateMappings = 0;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cbUUIDCandidateMappings, "objectForKeyedSubscript:", v8));
    if (self)
      pairingCandidates = self->_pairingCandidates;
    else
      pairingCandidates = 0;
    v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pairingCandidates, "objectForKeyedSubscript:", v10));
    if (!v12)
    {
      if (qword_1001E4820 != -1)
        dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
      if (_NRLogIsLevelEnabled(qword_1001E4818, 0))
      {
        if (qword_1001E4820 != -1)
          dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
        _NRLogWithArgs(qword_1001E4818, 0, "%s%.30s:%-4d %@ BT pipe for unknown %@ connected", ", "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidConnect:]", 815, self, v8);
      }
      goto LABEL_30;
    }
    if (qword_1001E4820 != -1)
      dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
    if (_NRLogIsLevelEnabled(qword_1001E4818, 0))
    {
      if (qword_1001E4820 != -1)
        dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
      _NRLogWithArgs(qword_1001E4818, 0, "%s%.30s:%-4d %@ BT pipe for %@ connected", ", "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidConnect:]", 837, self, v8);
    }
    v13 = v6;
    if (*(_QWORD *)(v12 + 72))
      sub_1000FE73C(v12);
    objc_storeStrong((id *)(v12 + 72), a4);
    v14 = objc_msgSend(v13, "channel");
    *(_QWORD *)(v12 + 80) = v14;
    if (v14)
    {
      v15 = os_channel_ring_id(v14, 2);
      v16 = os_channel_rx_ring(*(_QWORD *)(v12 + 80), v15);
      *(_QWORD *)(v12 + 88) = v16;
      if (v16)
      {
        v17 = os_channel_ring_id(*(_QWORD *)(v12 + 80), 0);
        v18 = os_channel_tx_ring(*(_QWORD *)(v12 + 80), v17);
        *(_QWORD *)(v12 + 96) = v18;
        if (v18)
        {
          fd = os_channel_get_fd(*(_QWORD *)(v12 + 80));
          v20 = fd;
          if ((fd & 0x80000000) != 0)
          {
            v40 = sub_1000FBA50();
            v41 = _NRLogIsLevelEnabled(v40, 17);

            if (v41)
            {
              v42 = sub_1000FBA50();
              _NRLogWithArgs(v42, 17, "os_channel_get_fd failed: %d", v20);

            }
            goto LABEL_23;
          }
          v21 = fd;
          v22 = *(id *)(v12 + 24);
          v23 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v21, 0, v22);
          v24 = *(void **)(v12 + 104);
          *(_QWORD *)(v12 + 104) = v23;

          v25 = *(NSObject **)(v12 + 104);
          if (v25)
          {
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_1000FE824;
            handler[3] = &unk_1001B8AE0;
            handler[4] = v12;
            dispatch_source_set_event_handler(v25, handler);
            v26 = *(NSObject **)(v12 + 104);
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = nullsub_12;
            v46[3] = &unk_1001B8AE0;
            v47 = v13;
            dispatch_source_set_cancel_handler(v26, v46);
            dispatch_resume(*(dispatch_object_t *)(v12 + 104));
            sub_1000FD83C(v12);

LABEL_23:
LABEL_30:

LABEL_31:
            goto LABEL_32;
          }
          v43 = sub_1000FBA50();
          v44 = _NRLogIsLevelEnabled(v43, 17);

          if (!v44)
            goto LABEL_23;
          v35 = sub_1000FBA50();
          _NRLogWithArgs(v35, 17, "Failed to created read input source for pipe %@", v13);
        }
        else
        {
          v38 = sub_1000FBA50();
          v39 = _NRLogIsLevelEnabled(v38, 17);

          if (!v39)
            goto LABEL_23;
          v35 = sub_1000FBA50();
          _NRLogWithArgs(v35, 17, "Pipe has no output ring %@", v13);
        }
      }
      else
      {
        v36 = sub_1000FBA50();
        v37 = _NRLogIsLevelEnabled(v36, 17);

        if (!v37)
          goto LABEL_23;
        v35 = sub_1000FBA50();
        _NRLogWithArgs(v35, 17, "Pipe has no input ring %@", v13);
      }
    }
    else
    {
      v33 = sub_1000FBA50();
      v34 = _NRLogIsLevelEnabled(v33, 17);

      if (!v34)
        goto LABEL_23;
      v35 = sub_1000FBA50();
      _NRLogWithArgs(v35, 17, "Pipe has no channel %@", v13);
    }

    goto LABEL_23;
  }
  v27 = sub_1000FBA50();
  v28 = _NRLogIsLevelEnabled(v27, 17);

  if (!v28)
    goto LABEL_33;
  v8 = sub_1000FBA50();
  _NRLogWithArgs(v8, 17, "%s called with null pipeManager");
LABEL_32:

LABEL_33:
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSMutableDictionary *cbUUIDCandidateMappings;
  id v13;
  NSMutableDictionary *pairingCandidates;
  void *v15;
  id v16;
  int v17;
  id v18;
  int IsLevelEnabled;
  id v20;
  int v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  if (v22)
  {
    if (!v8)
    {
      v18 = sub_1000FBA50();
      IsLevelEnabled = _NRLogIsLevelEnabled(v18, 17);

      if (!IsLevelEnabled)
        goto LABEL_25;
      v11 = sub_1000FBA50();
      _NRLogWithArgs(v11, 17, "%s called with null pipe");
      goto LABEL_24;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peer"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));

    if (v11)
    {
      if (self)
        cbUUIDCandidateMappings = self->_cbUUIDCandidateMappings;
      else
        cbUUIDCandidateMappings = 0;
      v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cbUUIDCandidateMappings, "objectForKeyedSubscript:", v11));
      if (self)
        pairingCandidates = self->_pairingCandidates;
      else
        pairingCandidates = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pairingCandidates, "objectForKeyedSubscript:", v13));
      if (v15)
      {
        if (qword_1001E4820 != -1)
          dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
        if (_NRLogIsLevelEnabled(qword_1001E4818, 0))
        {
          if (qword_1001E4820 != -1)
            dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
          _NRLogWithArgs(qword_1001E4818, 0, "%s%.30s:%-4d %@ BT pipe for %@ disconnected error %@", ", "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidDisconnect:error:]", 858, self, v11, v9);
        }
        sub_1000FE73C((uint64_t)v15);
      }
      else
      {
        if (qword_1001E4820 != -1)
          dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
        if (_NRLogIsLevelEnabled(qword_1001E4818, 0))
        {
          if (qword_1001E4820 != -1)
            dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
          _NRLogWithArgs(qword_1001E4818, 0, "%s%.30s:%-4d %@ BT pipe for unknown %@ disconnected error %@", ", "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidDisconnect:error:]", 854, self, v11, v9);
        }
      }

    }
    else
    {
      v20 = sub_1000FBA50();
      v21 = _NRLogIsLevelEnabled(v20, 17);

      if (!v21)
      {
        v11 = 0;
        goto LABEL_24;
      }
      v13 = sub_1000FBA50();
      _NRLogWithArgs(v13, 17, "%s called with null cbUUID", "-[NRDevicePairingManagerContext scalablePipeManager:pipeDidDisconnect:error:]");
    }

  }
  else
  {
    v16 = sub_1000FBA50();
    v17 = _NRLogIsLevelEnabled(v16, 17);

    if (!v17)
      goto LABEL_25;
    v11 = sub_1000FBA50();
    _NRLogWithArgs(v11, 17, "%s called with null pipeManager");
  }
LABEL_24:

LABEL_25:
}

- (void)requestConfigurationForListener:(id)a3 session:(id)a4 sessionConfig:(id)a5 childConfig:(id)a6 validateAuthBlock:(id)a7 responseBlock:(id)a8
{
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char *v22;
  id v23;
  unsigned int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id *v30;
  void *v31;
  NSMutableDictionary *pairingCandidates;
  id *v33;
  id *v34;
  NRDevicePairingCandidateContext *v35;
  id *v36;
  NSMutableDictionary *v37;
  void *v38;
  NSMutableDictionary *cbUUIDCandidateMappings;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  int IsLevelEnabled;
  id v48;
  id v49;
  int v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id *v54;
  id v55;
  int v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id *v61;
  id v62;
  id v63;
  id v64;
  NRDevicePairingManagerContext *v65;
  void *v66;
  _QWORD v67[2];

  v14 = (char *)a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (qword_1001E4820 != -1)
    dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
  if (_NRLogIsLevelEnabled(qword_1001E4818, 0))
  {
    if (qword_1001E4820 != -1)
      dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
    _NRLogWithArgs(qword_1001E4818, 0, "%s%.30s:%-4d %@: Got config request for listener %@ session %@ sessionConfig %@", ", "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 876, self, v14, v15, v16);
  }
  if (v17)
  {
    v46 = sub_1000FBA50();
    IsLevelEnabled = _NRLogIsLevelEnabled(v46, 16);

    if (IsLevelEnabled)
    {
      v48 = sub_1000FBA50();
      _NRLogWithArgs(v48, 16, "%s%.30s:%-4d Unexpectedly received child config %@", ", "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 882, v17);

    }
    goto LABEL_41;
  }
  v65 = self;
  v66 = 0;
  v20 = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
  v22 = v14;
  if (qword_1001E4970 != -1)
    dispatch_once(&qword_1001E4970, &stru_1001B7E28);
  v23 = (id)qword_1001E4968;
  v24 = objc_msgSend(v21, "isEqual:", v23);

  if (!v24)
  {
    v14 = v22;
    if (qword_1001E4820 != -1)
      dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
    v15 = v20;
    v17 = v66;
    if (_NRLogIsLevelEnabled(qword_1001E4818, 16))
    {
      if (qword_1001E4820 != -1)
        dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
      v31 = v18;
      v43 = (id)qword_1001E4818;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
      _NRLogWithArgs(v43, 16, "%s%.30s:%-4d Unrecognized local identifier %@", ", "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 930, v44);

      v30 = 0;
      goto LABEL_42;
    }
LABEL_41:
    v30 = 0;
    v31 = v18;
    goto LABEL_42;
  }
  v67[0] = 0;
  v67[1] = 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "remoteIdentifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifierData"));

  if (objc_msgSend(v26, "length") == (id)16)
  {
    objc_msgSend(v26, "getBytes:length:", v67, 16);
    v27 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v67);
    v28 = objc_msgSend(objc_alloc((Class)NEIKEv2AuthenticationProtocol), "initWithMethod:", 13);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localIdentifier"));
    v64 = v28;
    v30 = (id *)sub_10011268C(0, v29, v28);

    v31 = v18;
    if (!(*((unsigned int (**)(id, id *))v18 + 2))(v18, v30))
    {
      v33 = v30;
      v30 = 0;
      goto LABEL_37;
    }
    if (v65)
      pairingCandidates = v65->_pairingCandidates;
    else
      pairingCandidates = 0;
    v63 = v27;
    v33 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pairingCandidates, "objectForKeyedSubscript:", v27));
    if (v33)
    {
LABEL_23:
      v41 = v20;
      sub_1000FBC2C((uint64_t)NRDevicePairingCandidateContext, v33 + 15);
      v42 = v33[15];
      v33[15] = v41;

      sub_1000FBD84((uint64_t)v33);
      v27 = v63;
LABEL_37:

      v14 = v22;
      v15 = v20;
      v17 = v66;

      goto LABEL_42;
    }
    v34 = (id *)objc_msgSend(objc_alloc((Class)NRDevicePairingCandidate), "initInternalWithUUID:", v63);
    if (v34)
    {
      v33 = v34;
      v62 = v63;
      objc_msgSend(v33, "setCbUUID:");
      v35 = [NRDevicePairingCandidateContext alloc];
      v61 = v33;
      if (v65)
      {
        v36 = sub_1000FBA90((id *)&v35->super.isa, v33, v65->_queue, v65);
        if (v36)
        {
          v33 = v36;
          v37 = v65->_pairingCandidates;
          goto LABEL_20;
        }
      }
      else
      {
        v54 = sub_1000FBA90((id *)&v35->super.isa, v33, 0, 0);
        if (v54)
        {
          v33 = v54;
          v37 = 0;
LABEL_20:
          -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v33, v62);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "uuid"));
          if (v65)
          {
            cbUUIDCandidateMappings = v65->_cbUUIDCandidateMappings;
LABEL_22:
            v40 = v62;
            -[NSMutableDictionary setObject:forKeyedSubscript:](cbUUIDCandidateMappings, "setObject:forKeyedSubscript:", v38, v62);

            goto LABEL_23;
          }
LABEL_53:
          cbUUIDCandidateMappings = 0;
          goto LABEL_22;
        }
      }
      v55 = sub_1000FBA50();
      v56 = _NRLogIsLevelEnabled(v55, 16);

      if (v56)
      {
        v57 = sub_1000FBA50();
        _NRLogWithArgs(v57, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (pairingCandidate) != ((void *)0)", ", "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 923);

      }
      v38 = (void *)_os_log_pack_size(12);
      v22 = (char *)&v60 - ((__chkstk_darwin(v38) + 15) & 0xFFFFFFFFFFFFFFF0);
      v58 = *__error();
      v53 = _os_log_pack_fill(v22, v38, v58, &_mh_execute_header, "%{public}s Assertion Failed: (pairingCandidate) != ((void *)0)");
    }
    else
    {
      v49 = sub_1000FBA50();
      v50 = _NRLogIsLevelEnabled(v49, 16);

      if (v50)
      {
        v51 = sub_1000FBA50();
        _NRLogWithArgs(v51, 16, "%s%.30s:%-4d ABORTING: Assertion Failed: (candidateInfo) != ((void *)0)", ", "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 908);

      }
      v38 = (void *)_os_log_pack_size(12);
      v22 = (char *)&v60 - ((__chkstk_darwin(v38) + 15) & 0xFFFFFFFFFFFFFFF0);
      v52 = *__error();
      v53 = _os_log_pack_fill(v22, v38, v52, &_mh_execute_header, "%{public}s Assertion Failed: (candidateInfo) != ((void *)0)");
    }
    *(_DWORD *)v53 = 136446210;
    *(_QWORD *)(v53 + 4) = "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childCo"
                           "nfig:validateAuthBlock:responseBlock:]";
    v59 = sub_1000FBA50();
    _NRLogAbortWithPack(v59, v22);
    goto LABEL_53;
  }
  if (qword_1001E4820 != -1)
    dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
  v14 = v22;
  v15 = v20;
  if (_NRLogIsLevelEnabled(qword_1001E4818, 16))
  {
    v17 = v66;
    if (qword_1001E4820 != -1)
      dispatch_once(&qword_1001E4820, &stru_1001B7AB0);
    v31 = v18;
    v45 = (id)qword_1001E4818;
    _NRLogWithArgs(v45, 16, "%s%.30s:%-4d Remote identifier length %zu != %zu", ", "-[NRDevicePairingManagerContext requestConfigurationForListener:session:sessionConfig:childConfig:validateAuthBlock:responseBlock:]", 891, (size_t)objc_msgSend(v26, "length"), 0x10uLL);

    v30 = 0;
  }
  else
  {
    v30 = 0;
    v17 = v66;
    v31 = v18;

  }
LABEL_42:
  (*((void (**)(id, id *, _QWORD, _QWORD))v19 + 2))(v19, v30, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_cbUUIDCandidateMappings, 0);
  objc_storeStrong((id *)&self->_pairingCandidates, 0);
  objc_storeStrong((id *)&self->_pairingTarget, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_managerConnection);
}

@end
