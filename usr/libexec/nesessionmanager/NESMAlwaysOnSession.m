@implementation NESMAlwaysOnSession

- (NESMAlwaysOnSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6;
  id v7;
  NESMAlwaysOnSession *v8;
  NESMAlwaysOnSession *v9;
  NSMutableDictionary *VPNSessions;
  NESMPolicySession *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t interface_names;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  __int128 v28;
  uint64_t *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ifstate;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  NESMIKEv2VPNSession *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  CoreTelephonyClient *v61;
  CoreTelephonyClient *CTClient;
  NESMAlwaysOnSession *v63;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  __int128 v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;
  uint8_t buf[4];
  NESMAlwaysOnSession *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  id v79;

  v6 = a3;
  v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)NESMAlwaysOnSession;
  v8 = -[NESMSession initWithConfiguration:andServer:](&v73, "initWithConfiguration:andServer:", v6, v7);
  v9 = v8;
  if (!v8)
    goto LABEL_41;
  v8->_retryIntervalMin = 5;
  v8->_retryIntervalMax = 600;
  v8->_retryIntervalMultipler = 2;
  v8->_retriesMax = 3;
  VPNSessions = v8->_VPNSessions;
  v8->_VPNSessions = 0;

  v9->_stopped = 1;
  v11 = [NESMPolicySession alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v13 = objc_msgSend(v6, "grade");
  if (v11)
    v11 = (NESMPolicySession *)sub_10002EB54((id *)&v11->super.isa, v12, 3, v13, (void *)1, (void *)1);
  -[NESMSession setPolicySession:](v9, "setPolicySession:", v11);

  sub_10007AAF8(v9);
  v14 = ne_log_large_obj();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v75 = v9;
    v76 = 2080;
    v77 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
    v78 = 2112;
    v79 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@:%s: Configuration %@", buf, 0x20u);
  }

  v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
  if (!v17)
  {
    v43 = ne_log_obj(0, v16);
    v35 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v75 = v9;
      v76 = 2080;
      v77 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
      v44 = "%@:%s: Failed to allocate VPN sessions";
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v44, buf, 0x16u);
    }
LABEL_46:

    v63 = 0;
    goto LABEL_47;
  }
  v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
  if (!v18)
  {
    v45 = ne_log_obj(0, v19);
    v35 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v75 = v9;
      v76 = 2080;
      v77 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
      v44 = "%@:%s: Failed to allocate VPN session retry counters";
      goto LABEL_32;
    }
    goto LABEL_46;
  }
  v20 = v18;
  objc_storeStrong((id *)&v9->_VPNSessionRetryCounters, v18);
  v21 = nwi_state_copy();
  if (v21)
  {
    v22 = v21;
    interface_names = nwi_state_get_interface_names(v21, 0, 0);
    if ((_DWORD)interface_names
      && (v24 = interface_names,
          (v25 = malloc_type_calloc(interface_names, 8uLL, 0x50040EE9192B6uLL)) != 0))
    {
      v26 = v25;
      v71 = v20;
      v72 = v17;
      v27 = nwi_state_get_interface_names(v22, v25, v24);
      v70 = v26;
      if (v27)
      {
        v29 = (uint64_t *)v26;
        v30 = 0;
        v31 = v27;
        *(_QWORD *)&v28 = 138412802;
        v69 = v28;
        do
        {
          v32 = *v29;
          if (*v29
            && (ifstate = nwi_state_get_ifstate(v22, *v29)) != 0
            && (v34 = ifstate, !nwi_ifstate_get_vpn_server())
            && (nwi_ifstate_get_flags(v34) & 3) != 0
            && (nwi_ifstate_get_flags(v34) & 4) != 0)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v32));
            v37 = sub_10000A02C((NESMIKEv2VPNSession *)v9, v36);
            v35 = objc_claimAutoreleasedReturnValue(v37);

            if (v35)
            {
              if (objc_msgSend(v72, "count"))
              {
                -[NSObject setIsSecondaryInterface:](v35, "setIsSecondaryInterface:", 1);
                -[NSObject setIsSecondaryConnection:](v35, "setIsSecondaryConnection:", 1);
              }
              v38 = v36;
              v39 = objc_msgSend(v72, "setObject:forKeyedSubscript:", v35, v36, v69);
              v41 = ne_log_obj(v39, v40);
              v42 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v69;
                v75 = v9;
                v76 = 2080;
                v77 = "-[NESMAlwaysOnSession initWithConfiguration:andServer:]";
                v78 = 2112;
                v79 = v38;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%@:%s: Set up VPN Session over %@", buf, 0x20u);
              }

              v36 = v38;
            }

          }
          else
          {
            v35 = v30;
          }
          ++v29;
          v30 = v35;
          --v31;
        }
        while (v31);
      }
      else
      {
        v35 = 0;
      }
      free(v70);
      v20 = v71;
      v17 = v72;
    }
    else
    {
      v35 = 0;
    }
    nwi_state_release(v22);
  }
  else
  {
    v35 = 0;
  }
  objc_storeStrong((id *)&v9->_VPNSessions, v17);
  sub_10000A274(v9, v46);
  v47 = objc_msgSend(objc_alloc((Class)NEPolicySession), "initWithSessionName:", CFSTR("AOVPN control"));
  -[NESMSession setControlPolicySession:](v9, "setControlPolicySession:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v9, "controlPolicySession"));
  if (!v48)
  {
    v64 = ne_log_obj(v49, v50);
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
LABEL_45:

      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v66 = "Failed to create the control policy session";
LABEL_49:
    _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v66, buf, 2u);
    goto LABEL_45;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v9, "controlPolicySession"));
  objc_msgSend(v51, "setPriority:", 100);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession controlPolicySession](v9, "controlPolicySession"));
  objc_msgSend(v52, "lockSessionToCurrentProcess");

  v53 = objc_msgSend(objc_alloc((Class)NEPolicySession), "initWithSessionName:", CFSTR("AOVPN high"));
  -[NESMSession setHighPolicySession:](v9, "setHighPolicySession:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v9, "highPolicySession"));
  if (!v54)
  {
    v67 = ne_log_obj(v55, v56);
    v65 = objc_claimAutoreleasedReturnValue(v67);
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)buf = 0;
    v66 = "Failed to create AOVPN high policy session";
    goto LABEL_49;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v9, "highPolicySession"));
  objc_msgSend(v57, "setPriority:", 400);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession highPolicySession](v9, "highPolicySession"));
  objc_msgSend(v58, "lockSessionToCurrentProcess");

  v9->_carrierBundleIMSUseIPSec = 0;
  v9->_carrierBundleNATKeepAliveIntervalOverCell = 110;
  v59 = objc_alloc((Class)CoreTelephonyClient);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](v9, "queue"));
  v61 = (CoreTelephonyClient *)objc_msgSend(v59, "initWithQueue:", v60);
  CTClient = v9->_CTClient;
  v9->_CTClient = v61;

  -[CoreTelephonyClient setDelegate:](v9->_CTClient, "setDelegate:", v9);
LABEL_41:
  v63 = v9;
LABEL_47:

  return v63;
}

- (void)dealloc
{
  const char *v3;
  SEL v4;
  void *v5;
  const char *v6;
  char v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[16];

  if (self)
  {
    if (objc_getProperty(self, a2, 360, 1))
    {
      objc_msgSend(objc_getProperty(self, v3, 360, 1), "removeObserver:forKeyPath:", self, CFSTR("path"));
      objc_setProperty_atomic(self, v4, 0, 360);
    }
    self->_IDSNexusIfIndex = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
    v7 = sub_10002F5BC(v5, v6);

    if ((v7 & 1) == 0)
    {
      v10 = ne_log_obj(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", buf, 2u);
      }

    }
    objc_setProperty_atomic(self, v9, 0, 376);
  }
  v12.receiver = self;
  v12.super_class = (Class)NESMAlwaysOnSession;
  -[NESMSession dealloc](&v12, "dealloc");
}

- (int)type
{
  return 3;
}

- (void)handleInitializeState
{
  const char *v3;
  id Property;
  id v5;
  const char *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id obj;
  _QWORD block[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];

  v23.receiver = self;
  v23.super_class = (Class)NESMAlwaysOnSession;
  -[NESMSession handleInitializeState](&v23, "handleInitializeState");
  sub_1000086DC((uint64_t)self);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (self)
    Property = objc_getProperty(self, v3, 400, 1);
  else
    Property = 0;
  obj = Property;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9);
        if (self)
          v11 = objc_getProperty(self, v6, 400, 1);
        else
          v11 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000B320;
        block[3] = &unk_1000BEB80;
        v18 = v12;
        v14 = v12;
        dispatch_async(v13, block);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v7 = v15;
    }
    while (v15);
  }

}

- (void)handleStartMessage:(id)a3
{
  const char *v4;
  id v5;
  SEL v6;
  id Property;
  id v8;
  id v9;
  const char *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v5 = a3;
  if (self)
  {
    objc_setProperty_atomic(self, v4, v5, 392);
    self->_stopped = 0;
    v26.receiver = self;
    v26.super_class = (Class)NESMAlwaysOnSession;
    -[NESMSession handleStartMessage:](&v26, "handleStartMessage:", v5);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    Property = objc_getProperty(self, v6, 400, 1);
  }
  else
  {
    v26.receiver = 0;
    v26.super_class = (Class)NESMAlwaysOnSession;
    -[NESMSession handleStartMessage:](&v26, "handleStartMessage:", v5);
    Property = 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
  }
  v8 = Property;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v13);
        if (self)
          v15 = objc_getProperty(self, v10, 400, 1);
        else
          v15 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14));
        if (objc_msgSend(v16, "state") == (id)1)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "queue"));
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10000B314;
          v19[3] = &unk_1000BEB58;
          v20 = v16;
          v21 = v5;
          dispatch_async(v17, v19);

        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v11 = v18;
    }
    while (v18);
  }

}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3;
  SEL v5;
  id Property;
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id obj;
  _QWORD block[4];
  id v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v3 = *(_QWORD *)&a3;
  if (self)
  {
    self->_stopped = 1;
    objc_setProperty_atomic(self, a2, 0, 392);
    v26.receiver = self;
    v26.super_class = (Class)NESMAlwaysOnSession;
    -[NESMSession handleStopMessageWithReason:](&v26, "handleStopMessageWithReason:", v3);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    Property = objc_getProperty(self, v5, 400, 1);
  }
  else
  {
    v26.receiver = 0;
    v26.super_class = (Class)NESMAlwaysOnSession;
    -[NESMSession handleStopMessageWithReason:](&v26, "handleStopMessageWithReason:", *(_QWORD *)&a3);
    Property = 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
  }
  obj = Property;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v11);
        if (self)
          v13 = objc_getProperty(self, v8, 400, 1);
        else
          v13 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000B304;
        block[3] = &unk_1000BECF8;
        v20 = v14;
        v21 = v3;
        v16 = v14;
        dispatch_async(v15, block);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v9 = v17;
    }
    while (v17);
  }

}

- (void)handleWakeup
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B134;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[5];
  id v19;
  objc_super v20;
  uint8_t buf[4];
  NESMAlwaysOnSession *v22;
  __int16 v23;
  const char *v24;

  v4 = a3;
  if (!v4)
  {
    -[NESMSession setConfiguration:](self, "setConfiguration:", 0);
    -[NESMSession setConfigurationSignature:](self, "setConfigurationSignature:", 0);
    sub_100008EA4(self, v16);
    goto LABEL_15;
  }
  v5 = -[NESMSession status](self, "status");
  if (self && v5 == 4 && self->_stopped)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
    if (!-[NSObject isEnabled](v6, "isEnabled"))
    {
      v7 = objc_msgSend(v4, "isEnabled");

      if (!v7)
        goto LABEL_10;
      self->_stopped = 0;
      v10 = ne_log_obj(v8, v9);
      v6 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v22 = self;
        v23 = 2080;
        v24 = "-[NESMAlwaysOnSession handleUpdateConfiguration:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@:%s: Enabling config in Reasserting state, clearing STOPPED", buf, 0x16u);
      }
    }

  }
LABEL_10:
  v20.receiver = self;
  v20.super_class = (Class)NESMAlwaysOnSession;
  if (!-[NESMSession handleUpdateConfiguration:](&v20, "handleUpdateConfiguration:", v4))
  {
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  sub_100008EA4(self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alwaysOnVPN"));
  v13 = objc_msgSend(v12, "isEnabled");

  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000AE70;
    v18[3] = &unk_1000BEB58;
    v18[4] = self;
    v19 = v4;
    dispatch_async(v14, v18);

  }
  v15 = 1;
LABEL_16:

  return v15;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  const char *v6;
  const char *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v27;
  xpc_object_t xdict;
  xpc_object_t v29;
  id obj;
  _QWORD block[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD v74[6];
  _QWORD v75[6];
  uint64_t v76;
  void *v77;
  _BYTE v78[128];

  v29 = a3;
  xdict = xpc_dictionary_create_reply(v29);
  if (a4 == 2)
  {
    self = -[NESMAlwaysOnSession copyExtendedStatus](self, "copyExtendedStatus");
    if (!self)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    if (self)
    {
      v68 = 0;
      v69 = &v68;
      v70 = 0x3032000000;
      v71 = sub_10000AC9C;
      v72 = sub_10000ACAC;
      v73 = 0;
      v64 = 0;
      v65 = &v64;
      v66 = 0x2020000000;
      v67 = 0;
      v60 = 0;
      v61 = &v60;
      v62 = 0x2020000000;
      v63 = 0;
      v56 = 0;
      v57 = &v56;
      v58 = 0x2020000000;
      v59 = 0;
      v52 = 0;
      v53 = &v52;
      v54 = 0x2020000000;
      v55 = 0;
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v51 = 0;
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = objc_getProperty(self, v6, 400, 1);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v78, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v41 != v9)
              objc_enumerationMutation(obj);
            v11 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
            v12 = objc_getProperty(self, v7, 400, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queue"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000ACB4;
            block[3] = &unk_1000BD450;
            v32 = v13;
            v33 = &v68;
            v34 = &v64;
            v35 = &v60;
            v36 = &v56;
            v37 = &v52;
            v38 = &v48;
            v39 = &v44;
            v15 = v13;
            dispatch_sync(v14, block);

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v78, 16);
        }
        while (v8);
      }

      v76 = kSCEntNetVPN;
      v74[0] = CFSTR("BytesIn");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v65[3]));
      v75[0] = v16;
      v74[1] = CFSTR("BytesOut");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v61[3]));
      v75[1] = v17;
      v74[2] = CFSTR("PacketsIn");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v57[3]));
      v75[2] = v18;
      v74[3] = CFSTR("PacketsOut");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v53[3]));
      v75[3] = v19;
      v74[4] = CFSTR("ErrorsIn");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v49[3]));
      v75[4] = v20;
      v74[5] = CFSTR("ErrorsOut");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v45[3]));
      v75[5] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v75, v74, 6));
      v77 = v22;
      v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1));
      v24 = (void *)v69[5];
      v69[5] = v23;

      self = (NESMAlwaysOnSession *)(id)v69[5];
      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&v48, 8);
      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);
      _Block_object_dispose(&v68, 8);

    }
    if (self)
    {
LABEL_13:
      v25 = (void *)_CFXPCCreateXPCObjectFromCFObject(self);
      xpc_dictionary_set_value(xdict, "SessionInfo", v25);

    }
  }
LABEL_14:
  remote_connection = xpc_dictionary_get_remote_connection(v29);
  v27 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v27, xdict);

}

- (id)copyExtendedStatus
{
  const char *v3;
  id v4;
  id Property;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id obj;
  _QWORD block[4];
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (v4)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    if (self)
      Property = objc_getProperty(self, v3, 400, 1);
    else
      Property = 0;
    obj = Property;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10);
          if (self)
            v12 = objc_getProperty(self, v7, 400, 1);
          else
            v12 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000AC54;
          block[3] = &unk_1000BE878;
          v20 = v13;
          v21 = v4;
          v22 = v11;
          v15 = v13;
          dispatch_sync(v14, block);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v8 = v16;
      }
      while (v16);
    }

  }
  return v4;
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v18;
  uint8_t buf[4];
  NESMAlwaysOnSession *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;

  v8 = a3;
  v10 = ne_log_obj(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v20 = self;
    v21 = 2080;
    v22 = "-[NESMAlwaysOnSession handleChangeEventForInterface:newFlags:previousFlags:]";
    v23 = 2112;
    v24 = v8;
    v25 = 1024;
    v26 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@:%s: Enter (ifName %@, flags %X)", buf, 0x26u);
  }

  v18.receiver = self;
  v18.super_class = (Class)NESMAlwaysOnSession;
  -[NESMSession handleChangeEventForInterface:newFlags:previousFlags:](&v18, "handleChangeEventForInterface:newFlags:previousFlags:", v8, a4, a5);
  v12 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009574;
  v14[3] = &unk_1000BE8A0;
  v14[4] = self;
  v15 = v8;
  v16 = a4;
  v17 = a5;
  v13 = v8;
  dispatch_async(v12, v14);

}

- (void)setStatus:(int)a3
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  char **v7;
  id Property;
  id v9;
  id v10;
  const char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NESMAlwaysOnSession *v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  id v30;
  id v31;
  id v32;
  const char *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  unsigned int v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  const char *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  unsigned int v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  objc_super v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  objc_super v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  objc_super v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _QWORD v89[2];
  uint8_t buf[4];
  NESMAlwaysOnSession *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  id v97;
  _BYTE v98[128];

  v4 = ne_log_obj(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v91 = self;
    v92 = 2080;
    v93 = "-[NESMAlwaysOnSession setStatus:]";
    v94 = 2080;
    v95 = ne_session_status_to_string(a3);
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@:%s: Enter (new status %s)", buf, 0x20u);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v7 = &selRef_sharedConnection;
  if (self)
    Property = objc_getProperty(self, v6, 400, 1);
  else
    Property = 0;
  v9 = Property;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v84;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v84 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v14);
        if (self)
          v16 = objc_getProperty(self, v11, *((int *)v7 + 253), 1);
        else
          v16 = 0;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v15));
        v19 = ne_log_obj(v17, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = (NESMAlwaysOnSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "interfaceName"));
          v22 = (const char *)objc_msgSend(v17, "connectCount");
          v23 = objc_msgSend(v17, "connectedCount");
          v24 = objc_msgSend(v17, "disconnectedCount");
          *(_DWORD *)buf = 138413058;
          v91 = v21;
          v92 = 2048;
          v93 = v22;
          v94 = 2048;
          v95 = (uint64_t)v23;
          v96 = 2048;
          v97 = v24;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "AlwaysOn Stats [%@]: connect %ld, connected %ld, disconnected %ld", buf, 0x2Au);

          v7 = &selRef_sharedConnection;
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
      v12 = v25;
    }
    while (v25);
  }

  v89[1] = 0;
  v89[0] = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
  objc_msgSend(v27, "getUUIDBytes:", v89);

  switch(a3)
  {
    case 1:
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      if (self)
        v50 = objc_getProperty(self, v29, *((int *)v7 + 253), 1);
      else
        v50 = 0;
      v51 = v50;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      if (v52)
      {
        v54 = v52;
        v55 = *(_QWORD *)v79;
        do
        {
          v56 = 0;
          do
          {
            if (*(_QWORD *)v79 != v55)
              objc_enumerationMutation(v51);
            v57 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v56);
            if (self)
              v58 = objc_getProperty(self, v53, *((int *)v7 + 253), 1);
            else
              v58 = 0;
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v57));
            v60 = objc_msgSend(v59, "status");

            if (v60 != 1)
            {

              return;
            }
            v56 = (char *)v56 + 1;
          }
          while (v54 != v56);
          v61 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
          v54 = v61;
        }
        while (v61);
      }

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EF6C((uint64_t)v62);

      if (self && self->_stopped)
      {
        v67 = ne_log_obj(v63, v64);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v91 = self;
          v92 = 2080;
          v93 = "-[NESMAlwaysOnSession setStatus:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: DISCONNECTED", buf, 0x16u);
        }

        v77.receiver = self;
        v77.super_class = (Class)NESMAlwaysOnSession;
        -[NESMSession setStatus:](&v77, "setStatus:", 1);
      }
      else
      {
        v65 = ne_log_obj(v63, v64);
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v91 = self;
          v92 = 2080;
          v93 = "-[NESMAlwaysOnSession setStatus:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: REASSERTING", buf, 0x16u);
        }

        v76.receiver = self;
        v76.super_class = (Class)NESMAlwaysOnSession;
        -[NESMSession setStatus:](&v76, "setStatus:", 4);
      }
      break;
    case 2:
    case 4:
    case 5:
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      if (self)
        v30 = objc_getProperty(self, v29, *((int *)v7 + 253), 1);
      else
        v30 = 0;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      if (v32)
      {
        v34 = v32;
        v35 = *(_QWORD *)v73;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v73 != v35)
              objc_enumerationMutation(v31);
            v37 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v36);
            if (self)
              v38 = objc_getProperty(self, v33, *((int *)v7 + 253), 1);
            else
              v38 = 0;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v37));
            v40 = objc_msgSend(v39, "status");

            if (v40 == 3)
            {

              return;
            }
            v36 = (char *)v36 + 1;
          }
          while (v34 != v36);
          v41 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          v34 = v41;
        }
        while (v41);
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EF6C((uint64_t)v42);

      v45 = ne_log_obj(v43, v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v69 = ne_session_status_to_string(a3);
        *(_DWORD *)buf = 138412802;
        v91 = self;
        v92 = 2080;
        v93 = "-[NESMAlwaysOnSession setStatus:]";
        v94 = 2080;
        v95 = v69;
        _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: %s", buf, 0x20u);
      }

      v71.receiver = self;
      v71.super_class = (Class)NESMAlwaysOnSession;
      -[NESMSession setStatus:](&v71, "setStatus:", a3);
      break;
    case 3:
      v47 = ne_log_obj(v28, v29);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v91 = self;
        v92 = 2080;
        v93 = "-[NESMAlwaysOnSession setStatus:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%@:%s: Status to Client: CONNECTED", buf, 0x16u);
      }

      v82.receiver = self;
      v82.super_class = (Class)NESMAlwaysOnSession;
      -[NESMSession setStatus:](&v82, "setStatus:", 3);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      sub_10002EE84((uint64_t)v49);

      break;
    default:
      return;
  }
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009440;
  v6[3] = &unk_1000BEA98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  const char *v11;
  id v12;
  id Property;
  id v14;
  unsigned int v15;
  const char *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t IDSNexusIfIndex;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  unint64_t v51;
  __int16 v52;
  id v53;

  v9 = a3;
  v10 = a4;
  v12 = a5;
  if (self)
    Property = objc_getProperty(self, v11, 360, 1);
  else
    Property = 0;
  v14 = Property;
  if (v14 == v10)
  {
    v15 = objc_msgSend(v9, "isEqualToString:", CFSTR("path"));

    if (!v15)
      goto LABEL_30;
    if (self)
      v17 = objc_getProperty(self, v16, 360, 1);
    else
      v17 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
    v19 = objc_msgSend(v18, "status");
    if (v19 == (id)1)
    {
      if (self)
        IDSNexusIfIndex = self->_IDSNexusIfIndex;
      else
        IDSNexusIfIndex = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interface"));
      v23 = objc_msgSend(v22, "interfaceIndex");

      if ((id)IDSNexusIfIndex == v23)
        goto LABEL_29;
      v26 = ne_log_obj(v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        if (self)
          v28 = self->_IDSNexusIfIndex;
        else
          v28 = 0;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interface"));
        v50 = 134218240;
        v51 = v28;
        v52 = 2048;
        v53 = objc_msgSend(v29, "interfaceIndex");
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "IDS Nexus interface changed %ld -> %ld", (uint8_t *)&v50, 0x16u);

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interface"));
      v31 = objc_msgSend(v30, "interfaceIndex");
      if (self)
        self->_IDSNexusIfIndex = (unint64_t)v31;

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interface"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "interfaceName"));
      v35 = sub_100042164((uint64_t)v32, v34);

      if ((v35 & 1) != 0)
        goto LABEL_29;
      v38 = ne_log_obj(v36, v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interface"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interfaceName"));
        v50 = 138412290;
        v51 = (unint64_t)v41;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to add IDS Nexus policy for %@", (uint8_t *)&v50, 0xCu);

      }
    }
    else
    {
      v42 = ne_log_obj(v19, v20);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v50) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "IDS Nexus interface unusable", (uint8_t *)&v50, 2u);
      }

      if (self)
        self->_IDSNexusIfIndex = 0;
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
      v46 = sub_10002F5BC(v44, v45);

      if ((v46 & 1) != 0)
        goto LABEL_29;
      v49 = ne_log_obj(v47, v48);
      v39 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v50) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to clear Nexus policy", (uint8_t *)&v50, 2u);
      }
    }

LABEL_29:
    goto LABEL_30;
  }

LABEL_30:
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[9];

  if (a3 <= 5 && ((1 << a3) & 0x27) != 0)
  {
    block[7] = v3;
    block[8] = v4;
    v6 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008E74;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (void)handleCaptiveNetworkPluginsChanged
{
  -[NESMAlwaysOnSession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 2);
}

- (void)handleInstalledAppsChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[NESMAlwaysOnSession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 2);
  v3 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008AB0;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)supportsDefaultDrop
{
  return 1;
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v4 = a3;
  v6 = ne_log_obj(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed: %@", (uint8_t *)&v8, 0xCu);
  }

  sub_1000086DC((uint64_t)self);
  -[NESMAlwaysOnSession handleNetworkDetectionNotification:](self, "handleNetworkDetectionNotification:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_VPNSessionRetryCounters, 0);
  objc_storeStrong((id *)&self->_VPNSessions, 0);
  objc_storeStrong((id *)&self->_lastStartMessage, 0);
  objc_storeStrong((id *)&self->_CTClient, 0);
  objc_storeStrong((id *)&self->_IDSNexusDomain, 0);
  objc_storeStrong((id *)&self->_IDSNexusPathEvaluator, 0);
}

+ (BOOL)hasRequiredFrameworks
{
  id v2;
  _BYTE *v3;
  BOOL v4;

  if (!objc_opt_class(CoreTelephonyClient))
    return 0;
  v2 = sub_10004EDE8((uint64_t)NESMServer);
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
    v4 = v3[8] & 1;
  else
    v4 = 0;

  return v4;
}

@end
