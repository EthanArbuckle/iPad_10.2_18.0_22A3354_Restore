@implementation NSPServer

- (NSPServer)init
{
  id v2;
  NSPServerFlowDivert *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSPDNSProxy *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_source_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  _QWORD *v23;
  xpc_connection_t mach_service;
  void *v25;
  xpc_connection_t v26;
  void *v27;
  void *v28;
  NSPServer *v29;
  void *v30;
  xpc_type_t type;
  _xpc_connection_s *v32;
  uint64_t v33;
  NSObject *v34;
  _xpc_connection_s *v35;
  _QWORD *v36;
  _xpc_connection_s *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  _xpc_connection_s *v41;
  _QWORD *v42;
  id inited;
  uint64_t v44;
  void *v45;
  CFPropertyListRef v46;
  void *v47;
  uint64_t v48;
  uint64_t isKindOfClass;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  NSPToggleStats *v55;
  void *v56;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  void **v62;
  uint64_t v63;
  void (*v64)(uint64_t, void *);
  void *v65;
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD handler[4];
  id v70;
  objc_super v71;
  id location;
  __int128 buf;
  _DWORD *(*v74)(uint64_t, uint64_t);
  void *v75;
  id v76;

  v71.receiver = self;
  v71.super_class = (Class)NSPServer;
  v2 = -[NSPServer init](&v71, "init");
  if (!v2)
  {
LABEL_21:
    v29 = (NSPServer *)v2;
    goto LABEL_22;
  }
  v3 = objc_alloc_init(NSPServerFlowDivert);
  v4 = (void *)*((_QWORD *)v2 + 34);
  *((_QWORD *)v2 + 34) = v3;

  if (!*((_QWORD *)v2 + 34))
  {
    v58 = nplog_obj(v5, v6, v7);
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "%s called with null _serverFlowDivert", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_31;
  }
  v8 = objc_alloc_init(NSPDNSProxy);
  v9 = (void *)*((_QWORD *)v2 + 47);
  *((_QWORD *)v2 + 47) = v8;

  if (!*((_QWORD *)v2 + 47))
  {
    v60 = nplog_obj(v10, v11, v12);
    v59 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "%s called with null _dnsProxy", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_31;
  }
  v13 = NPGetInternalQueue(v10);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v14);
  v16 = (void *)*((_QWORD *)v2 + 31);
  *((_QWORD *)v2 + 31) = v15;

  if (!*((_QWORD *)v2 + 31))
  {
    v61 = nplog_obj(v17, v18, v19);
    v59 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "%s called with null _termSource", (uint8_t *)&buf, 0xCu);
    }
LABEL_31:

    goto LABEL_8;
  }
  v20 = objc_alloc_init((Class)NSMutableSet);
  v21 = (void *)*((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = v20;

  *((_DWORD *)v2 + 7) = 0;
  v22 = *((_QWORD *)v2 + 31);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005F584;
  handler[3] = &unk_1000F5450;
  v23 = v2;
  v70 = v23;
  dispatch_source_set_event_handler(v22, handler);
  dispatch_resume(*((dispatch_object_t *)v2 + 31));
  mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(CFSTR("com.apple.networkserviceproxy"), "UTF8String"), 0, 1uLL);
  v25 = (void *)v23[32];
  v23[32] = mach_service;

  v26 = xpc_connection_create_mach_service("com.apple.networkserviceproxy.fetch-token", 0, 1uLL);
  v27 = (void *)v23[33];
  v23[33] = v26;

  v28 = (void *)v23[32];
  if (v28)
  {
    if (xpc_get_type(v28) == (xpc_type_t)&_xpc_type_connection)
    {
      v30 = (void *)v23[33];
      if (v30)
      {
        type = xpc_get_type(v30);
        if (type == (xpc_type_t)&_xpc_type_connection)
        {
          v32 = (_xpc_connection_s *)v23[32];
          v33 = NPGetInternalQueue(type);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          xpc_connection_set_target_queue(v32, v34);

          v35 = (_xpc_connection_s *)v23[32];
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_10000221C;
          v67[3] = &unk_1000F5FE0;
          v36 = v23;
          v68 = v36;
          xpc_connection_set_event_handler(v35, v67);
          v37 = (_xpc_connection_s *)v23[33];
          v39 = NPGetInternalQueue(v38);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          xpc_connection_set_target_queue(v37, v40);

          v41 = (_xpc_connection_s *)v23[33];
          v62 = _NSConcreteStackBlock;
          v63 = 3221225472;
          v64 = sub_10005F618;
          v65 = &unk_1000F5FE0;
          v42 = v36;
          v66 = v42;
          xpc_connection_set_event_handler(v41, &v62);
          inited = objc_initWeak(&location, v42);
          v44 = NPGetInternalQueue(inited);
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          *(_QWORD *)&buf = _NSConcreteStackBlock;
          *((_QWORD *)&buf + 1) = 3221225472;
          v74 = sub_100071B80;
          v75 = &unk_1000F6550;
          objc_copyWeak(&v76, &location);
          os_state_add_handler(v45, &buf);

          objc_destroyWeak(&v76);
          objc_destroyWeak(&location);
          objc_opt_self(NSPServer);
          if (os_variant_allows_internal_security_policies("com.apple.networkserviceproxy"))
          {
            v46 = CFPreferencesCopyAppValue(CFSTR("NSPOutageIntervalSeconds"), kCFPreferencesCurrentApplication);
            v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
            if (v47
              && (v48 = objc_opt_class(NSNumber),
                  isKindOfClass = objc_opt_isKindOfClass(v47, v48),
                  (isKindOfClass & 1) != 0))
            {
              v52 = nplog_obj(isKindOfClass, v50, v51);
              v53 = objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138543362;
                *(_QWORD *)((char *)&buf + 4) = v47;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Detected outage interval in preferences file: %{public}@", (uint8_t *)&buf, 0xCu);
              }

              v54 = objc_msgSend(v47, "unsignedIntegerValue", v62, v63, v64, v65);
            }
            else
            {
              v54 = 0;
            }

          }
          else
          {
            v54 = 0;
          }
          v42[39] = v54;
          v55 = objc_alloc_init(NSPToggleStats);
          v56 = (void *)v42[42];
          v42[42] = v55;

          goto LABEL_21;
        }
      }
    }
  }

LABEL_8:
  v29 = 0;
LABEL_22:

  return v29;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NSPServerCommands));
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NWPathEvaluator *v11;
  id v12;
  NWPathEvaluator *primaryPhysicalInterfaceEvaluator;
  NWPathEvaluator *v14;
  id v15;
  NSObject *v16;
  objc_super v17;
  _QWORD block[6];
  _QWORD v19[5];
  id v20;

  v10 = a3;
  v11 = (NWPathEvaluator *)a4;
  v12 = a5;
  if (self)
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  else
    primaryPhysicalInterfaceEvaluator = 0;
  v14 = primaryPhysicalInterfaceEvaluator;
  if (v14 != v11 || !objc_msgSend(v10, "isEqualToString:", CFSTR("path")))
  {

    goto LABEL_8;
  }

  if (a6 != self)
  {
LABEL_8:
    v17.receiver = self;
    v17.super_class = (Class)NSPServer;
    -[NSPServer observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_9;
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10000312C;
  v19[4] = sub_100054A8C;
  v20 = (id)os_transaction_create("com.apple.networkserviceproxy.handlePathChange");
  v15 = sub_100054A70(self);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062C6C;
  block[3] = &unk_1000F5428;
  block[4] = self;
  block[5] = v19;
  dispatch_async(v16, block);

  _Block_object_dispose(v19, 8);
LABEL_9:

}

- (void)configFetched:(id)a3
{
  id v4;

  if (self)
  {
    if (self->_configOutage)
    {
      self->_configOutage = 0;
      v4 = (id)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy](self->_configurationManager, "mergeProxyTrafficStateWithCurrentPolicy", a3));
      -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", self->_configurationManager, v4, 1);
      sub_1000639C4((uint64_t)self);

    }
  }
}

- (void)configEnabled:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  SEL v10;
  id Property;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSPServerODoH *v21;
  NWPathEvaluator *primaryPhysicalInterfaceEvaluator;
  NWPathEvaluator *v23;
  void *v24;
  NSPToggleStats *toggleStats;
  id *v26;
  NSPServiceStatusManager *v27;
  NSPConfiguration *configuration;
  NSPConfiguration *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NWInterface *v34;
  NWInterface *v35;
  NWPathEvaluator *v36;
  NWPathEvaluator *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NWInterface *v48;
  NWInterface *v49;
  NWPathEvaluator *v50;
  NWPathEvaluator *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  NSString *lastGeohash;
  void *v80;
  void *v81;
  void *v82;
  id inited;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  TRIClient *v104;
  TRIClient *trialClient;
  uint64_t v106;
  uint64_t v107;
  TRIClient *v108;
  uint64_t v109;
  void *v110;
  TRINotificationToken *v111;
  TRINotificationToken *trialNotificationToken;
  uint64_t v113;
  NSObject *v114;
  OS_dispatch_source *v115;
  OS_dispatch_source *toggleStatsTimer;
  OS_dispatch_source *v117;
  NSObject *v118;
  dispatch_time_t v119;
  OS_dispatch_source *v120;
  NSObject *v121;
  uintptr_t linkQualityMonitoringSocket;
  uint64_t v123;
  NSObject *v124;
  OS_dispatch_source *v125;
  OS_dispatch_source *linkQualityMonitoringSource;
  OS_dispatch_source *v127;
  NSObject *v128;
  OS_dispatch_source *v129;
  NSObject *v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  int *v137;
  char *v138;
  uint64_t v139;
  NSObject *v140;
  id v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint8_t v145[8];
  uint64_t v146;
  void (*v147)(uint64_t, void *);
  void *v148;
  id v149[2];
  id location;
  int v151;
  __int128 handler;
  void *v153;
  void *v154;
  id v155[2];
  __int128 buf;
  void *v157;
  void *v158;
  NSPServer *v159;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Privacy proxy configuration enabled", (uint8_t *)&buf, 2u);
  }

  if (self)
  {
    self->_isRunning = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager currentConfiguration](self->_configurationManager, "currentConfiguration"));
    objc_storeStrong((id *)&self->_configuration, v9);

    Property = objc_getProperty(self, v10, 272, 1);
  }
  else
  {

    Property = 0;
  }
  sub_10009BE28((uint64_t)Property, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  v15 = objc_msgSend(v14, "addPoliciesForProbing");

  if ((v15 & 1) == 0)
  {
    v19 = nplog_obj(v16, v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to add probing policies", (uint8_t *)&buf, 2u);
    }

  }
  v21 = [NSPServerODoH alloc];
  if (self)
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  else
    primaryPhysicalInterfaceEvaluator = 0;
  v23 = primaryPhysicalInterfaceEvaluator;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](v23, "path"));
  if (self)
    toggleStats = self->_toggleStats;
  else
    toggleStats = 0;
  v26 = sub_10004B18C((id *)&v21->super.isa, self, v24, toggleStats);
  sub_100064D18((uint64_t)self, v26);

  v27 = [NSPServiceStatusManager alloc];
  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v29 = configuration;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v29, "userTier"));
  v31 = objc_msgSend(v30, "unsignedIntValue");
  if (!self)
  {
    v141 = -[NSPServiceStatusManager initFromPreferencesWithUserTier:effectiveUserTier:delegate:](v27, "initFromPreferencesWithUserTier:effectiveUserTier:delegate:", v31, objc_msgSend(0, "effectiveUserTier"), 0);
    sub_1000230EC(0, v141);

    objc_msgSend(0, "proxyTokenFetchEnabled:", v4);
    goto LABEL_51;
  }
  v32 = -[NSPServiceStatusManager initFromPreferencesWithUserTier:effectiveUserTier:delegate:](v27, "initFromPreferencesWithUserTier:effectiveUserTier:delegate:", v31, -[NSPConfigurationManager effectiveUserTier](self->_configurationManager, "effectiveUserTier"), self);
  sub_1000230EC((uint64_t)self, v32);

  if (self->_proxyOutage)
    sub_10006AC2C((uint64_t)self, 1, v33);
  if (self->_proxyNetworkOutage)
    sub_10006ACDC((uint64_t)self, 1, v33);
  if (self->_odohOutageRestoreDate)
    sub_10006A074((uint64_t)self, 1, v33);
  if (self->_odohAuthOutageRestoreDate)
    sub_100069E28((uint64_t)self, 1, v33);
  if (self->_captiveOutage)
  {
    v34 = self->_primaryInterface;
    if (v34)
    {
      v35 = v34;
      v36 = self->_primaryPhysicalInterfaceEvaluator;
      if (v36)
      {
        v37 = v36;
        v38 = sub_1000630B8((uint64_t)self);

        if (v38)
        {
          v42 = nplog_obj(v39, v40, v41);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = self;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%@ Primary interface changed to non Wi-Fi, reporting service active ...", (uint8_t *)&buf, 0xCu);
          }

          sub_10006315C((uint64_t)self, 0, v44);
          goto LABEL_35;
        }
      }
      else
      {

      }
    }
    if (self->_captiveOutage && sub_10006FDDC((uint64_t)self))
    {
      sub_10006FD9C((uint64_t)self);
      v46 = NPGetInternalQueue(v45);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v157 = sub_1000722E8;
      v158 = &unk_1000F5450;
      v159 = self;
      dispatch_async(v47, &buf);

    }
  }
LABEL_35:
  if (self->_captiveOutageWaitingForUserActivity)
  {
    v48 = self->_primaryInterface;
    if (v48)
    {
      v49 = v48;
      v50 = self->_primaryPhysicalInterfaceEvaluator;
      if (v50)
      {
        v51 = v50;
        v52 = sub_1000630B8((uint64_t)self);

        if (v52)
        {
          v56 = nplog_obj(v53, v54, v55);
          v57 = objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(handler) = 138412290;
            *(_QWORD *)((char *)&handler + 4) = self;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%@ Primary interface changed to non Wi-Fi, removing the pending outage notification ...", (uint8_t *)&handler, 0xCu);
          }

          self->_captiveOutageWaitingForUserActivity = 0;
          sub_1000639C4((uint64_t)self);
          sub_10006F374((uint64_t)self);
        }
      }
      else
      {

      }
    }
  }
  -[NSPServer proxyTokenFetchEnabled:](self, "proxyTokenFetchEnabled:", v4);

  objc_initWeak(&location, self);
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v157 = sub_1000602B4;
  v158 = &unk_1000F6098;
  objc_copyWeak((id *)&v159, &location);
  xpc_activity_register("com.apple.networkserviceproxy.metadata-refresh-12h", XPC_ACTIVITY_CHECK_IN, &buf);
  *(_QWORD *)&handler = _NSConcreteStackBlock;
  *((_QWORD *)&handler + 1) = 3221225472;
  v153 = sub_100060414;
  v154 = &unk_1000F6098;
  objc_copyWeak(v155, &location);
  xpc_activity_register("com.apple.networkserviceproxy.metadata-refresh-22h", XPC_ACTIVITY_CHECK_IN, &handler);
  *(_QWORD *)v145 = _NSConcreteStackBlock;
  v146 = 3221225472;
  v147 = sub_100060574;
  v148 = &unk_1000F6098;
  objc_copyWeak(v149, &location);
  xpc_activity_register("com.apple.networkserviceproxy.publish-daily-stats", XPC_ACTIVITY_CHECK_IN, v145);
  objc_destroyWeak(v149);
  objc_destroyWeak(v155);
  objc_destroyWeak((id *)&v159);
  objc_destroyWeak(&location);
  v59 = NPGetInternalQueue(v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v157 = sub_10006FF28;
  v158 = &unk_1000F6438;
  v159 = self;
  v61 = CNPluginMonitorStart(0, v60, &buf);

  v65 = nplog_obj(v62, v63, v64);
  v66 = objc_claimAutoreleasedReturnValue(v65);
  v67 = v66;
  if (v61)
  {
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      LODWORD(handler) = 138412290;
      *(_QWORD *)((char *)&handler + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%@: Started CNPluginMonitor", (uint8_t *)&handler, 0xCu);
    }
  }
  else if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    LODWORD(handler) = 138412290;
    *(_QWORD *)((char *)&handler + 4) = self;
    _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%@: Failed to start CNPluginMonitor", (uint8_t *)&handler, 0xCu);
  }

  v69 = NPGetInternalQueue(v68);
  v70 = objc_claimAutoreleasedReturnValue(v69);
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v157 = sub_10006EE6C;
  v158 = &unk_1000F5FE0;
  v159 = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v70, &buf);

  v74 = nplog_obj(v71, v72, v73);
  v75 = objc_claimAutoreleasedReturnValue(v74);
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(handler) = 138412290;
    *(_QWORD *)((char *)&handler + 4) = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "%@ registered for apps installation/uninstallation event", (uint8_t *)&handler, 0xCu);
  }

LABEL_51:
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
  objc_msgSend(v76, "setDelegate:", self);

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
  v78 = v77;
  if (self)
    lastGeohash = self->_lastGeohash;
  else
    lastGeohash = 0;
  objc_msgSend(v77, "setLastGeohash:", lastGeohash);

  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
  v81 = v80;
  if (self)
  {
    objc_msgSend(v80, "setLastCountryPlusTimezone:", self->_lastCountryPlusTimezone);

    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
    objc_msgSend(v82, "start");

    inited = objc_initWeak((id *)&handler, self);
    v84 = NPGetInternalQueue(inited);
    v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v157 = sub_100072320;
    v158 = &unk_1000F65A0;
    objc_copyWeak((id *)&v159, (id *)&handler);
    self->_userActivityNotificationHandle = IOPMScheduleUserActivityLevelNotification(v85, &buf);

    if (!self->_userActivityNotificationHandle)
    {
      v89 = nplog_obj(v86, v87, v88);
      v90 = objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v145 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "Failed to register for user activity notifications", v145, 2u);
      }

    }
    objc_destroyWeak((id *)&v159);
    objc_destroyWeak((id *)&handler);
  }
  else
  {
    objc_msgSend(v80, "setLastCountryPlusTimezone:", 0);

    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
    objc_msgSend(v142, "start");

  }
  sub_100064D28((id *)&self->super.isa);
  sub_100064E40((uint64_t *)self);
  sub_10005FE50((uint64_t)self);
  if (self)
  {
    if (self->_configOutage)
      -[NSPServer checkPrivacyProxyConnectivityOnInterface:proxyConnectivityCheckType:completionHandler:](self, "checkPrivacyProxyConnectivityOnInterface:proxyConnectivityCheckType:completionHandler:", 0, 3, 0);
    sub_1000625E4((uint64_t)self);
    if (self->_linkQualityMonitoringSocket == -1)
    {
      v93 = socket(32, 3, 1);
      self->_linkQualityMonitoringSocket = v93;
      if ((_DWORD)v93 == -1)
      {
        v101 = nplog_obj(v93, v94, v95);
        v102 = objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          v137 = __error();
          v138 = strerror(*v137);
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v138;
          _os_log_error_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "failed to create link quality monitoring socket %s", (uint8_t *)&buf, 0xCu);
        }

      }
      else
      {
        v151 = 1;
        *(_QWORD *)v145 = 0x100000001;
        LODWORD(v146) = 2;
        v96 = ioctl(v93, 0x800C6502uLL, v145);
        if ((_DWORD)v96 || (v96 = ioctl(self->_linkQualityMonitoringSocket, 0x8004667EuLL, &v151), (_DWORD)v96))
        {
          v99 = nplog_obj(v96, v97, v98);
          v100 = objc_claimAutoreleasedReturnValue(v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "failed to set ioctl on link quality monitoring socket", (uint8_t *)&buf, 2u);
          }

          close(self->_linkQualityMonitoringSocket);
          self->_linkQualityMonitoringSocket = -1;
        }
        else
        {
          linkQualityMonitoringSocket = self->_linkQualityMonitoringSocket;
          v123 = NPGetInternalQueue(v96);
          v124 = objc_claimAutoreleasedReturnValue(v123);
          v125 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, linkQualityMonitoringSocket, 0, v124);
          linkQualityMonitoringSource = self->_linkQualityMonitoringSource;
          self->_linkQualityMonitoringSource = v125;

          if (self->_linkQualityMonitoringSource)
          {
            objc_initWeak(&location, self);
            v127 = self->_linkQualityMonitoringSource;
            *(_QWORD *)&buf = _NSConcreteStackBlock;
            *((_QWORD *)&buf + 1) = 3221225472;
            v157 = sub_100071EF4;
            v158 = &unk_1000F57C0;
            v128 = v127;
            objc_copyWeak((id *)&v159, &location);
            dispatch_source_set_cancel_handler(v128, &buf);

            v129 = self->_linkQualityMonitoringSource;
            *(_QWORD *)&handler = _NSConcreteStackBlock;
            *((_QWORD *)&handler + 1) = 3221225472;
            v153 = sub_100071F30;
            v154 = &unk_1000F57C0;
            v130 = v129;
            objc_copyWeak(v155, &location);
            dispatch_source_set_event_handler(v130, &handler);

            objc_destroyWeak(v155);
            objc_destroyWeak((id *)&v159);
            objc_destroyWeak(&location);
            v131 = self->_linkQualityMonitoringSource;
          }
          else
          {
            v131 = 0;
          }
          dispatch_resume(v131);
          v135 = nplog_obj(v132, v133, v134);
          v136 = objc_claimAutoreleasedReturnValue(v135);
          if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location) = 0;
            _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "registered for link quality changes", (uint8_t *)&location, 2u);
          }

          sub_100063234((uint64_t)self);
        }
      }
    }
    sub_100064FB4((id *)&self->super.isa, v91, v92);
    if (self->_trialClient
      || (v104 = (TRIClient *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 265)), trialClient = self->_trialClient, self->_trialClient = v104, trialClient, self->_trialClient))
    {
      if (!self->_trialNotificationToken)
      {
        objc_initWeak((id *)&handler, self);
        v108 = self->_trialClient;
        v109 = NPGetInternalQueue(v108);
        v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v157 = sub_1000722F0;
        v158 = &unk_1000F6578;
        objc_copyWeak((id *)&v159, (id *)&handler);
        v111 = (TRINotificationToken *)objc_claimAutoreleasedReturnValue(-[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:](v108, "addUpdateHandlerForNamespaceName:queue:usingBlock:", CFSTR("NETWORK_SERVICE_PROXY_CONFIG_UPDATE"), v110, &buf));
        trialNotificationToken = self->_trialNotificationToken;
        self->_trialNotificationToken = v111;

        objc_destroyWeak((id *)&v159);
        objc_destroyWeak((id *)&handler);
      }
    }
    else
    {
      v139 = nplog_obj(v103, v106, v107);
      v140 = objc_claimAutoreleasedReturnValue(v139);
      if (os_log_type_enabled(v140, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[NSPServer setupTrialUpdateHandler]";
        _os_log_fault_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_FAULT, "%s called with null self.trialClient", (uint8_t *)&buf, 0xCu);
      }

    }
    if (!self->_toggleStatsTimer)
    {
      v113 = NPGetInternalQueue(v103);
      v114 = objc_claimAutoreleasedReturnValue(v113);
      v115 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v114);
      toggleStatsTimer = self->_toggleStatsTimer;
      self->_toggleStatsTimer = v115;

      v117 = self->_toggleStatsTimer;
      if (v117)
      {
        v118 = v117;
        v119 = dispatch_time(0, 600000000000);
        dispatch_source_set_timer(v118, v119, 0x8BB2C97000uLL, 0);

        objc_initWeak((id *)&handler, self);
        v120 = self->_toggleStatsTimer;
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v157 = sub_10005F83C;
        v158 = &unk_1000F57C0;
        v121 = v120;
        objc_copyWeak((id *)&v159, (id *)&handler);
        dispatch_source_set_event_handler(v121, &buf);

        dispatch_resume((dispatch_object_t)self->_toggleStatsTimer);
        objc_destroyWeak((id *)&v159);
        objc_destroyWeak((id *)&handler);
      }
    }
  }
  else
  {
    sub_1000625E4(0);
    sub_100064FB4(0, v143, v144);
  }
  sub_1000651CC((id *)&self->super.isa);
}

- (void)configDisabled:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *proxyOutageRestoreTimer;
  SEL v10;
  id Property;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSPServerODoH *odohManager;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *toggleStatsTimer;
  uint8_t v21[16];

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Privacy proxy configuration disabled", v21, 2u);
  }

  sub_10000D354((uint64_t)self, 0);
  if (self)
  {
    self->_isRunning = 0;
    *(_WORD *)&self->_captiveOutage = 0;
    *(_DWORD *)&self->_systemIncompatible = 0;
    self->_proxyNetworkOutage = 0;
    objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0);
    proxyOutageRestoreTimer = self->_proxyOutageRestoreTimer;
    if (proxyOutageRestoreTimer)
    {
      dispatch_source_cancel(proxyOutageRestoreTimer);
      objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0);
    }
    sub_100065744((uint64_t)self);
    -[NSPServiceStatusManager reportServiceDisabledShouldReport:](self->_serviceStatusManager, "reportServiceDisabledShouldReport:", 0);
    +[NSPServiceStatusManager removeFromPreferences](NSPServiceStatusManager, "removeFromPreferences");
    objc_storeStrong((id *)&self->_serviceStatusManager, 0);
    Property = objc_getProperty(self, v10, 272, 1);
  }
  else
  {
    sub_100065744(0);
    objc_msgSend(0, "reportServiceDisabledShouldReport:", 0);
    +[NSPServiceStatusManager removeFromPreferences](NSPServiceStatusManager, "removeFromPreferences");
    Property = 0;
  }
  sub_10009BD94((uint64_t)Property, 1);
  sub_100060920((uint64_t)self);
  -[NSPServer proxyTokenFetchDisabled:](self, "proxyTokenFetchDisabled:", v4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v12, "remove:", 1);

  if (self)
    odohManager = self->_odohManager;
  else
    odohManager = 0;
  sub_10004B948(odohManager, v13, v14);
  sub_100064D18((uint64_t)self, 0);
  sub_10004E974((uint64_t)NSPServerODoH);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyLocationMonitor sharedMonitor](NSPPrivacyProxyLocationMonitor, "sharedMonitor"));
  objc_msgSend(v16, "stop");

  sub_1000657BC((uint64_t)self, v17, v18);
  sub_100065858((uint64_t)self);
  +[NSPDeviceIdentityCertificate removeFromPreferences](NSPDeviceIdentityCertificate, "removeFromPreferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPDeviceIdentityCertificate sharedDeviceIdentity](NSPDeviceIdentityCertificate, "sharedDeviceIdentity"));
  objc_msgSend(v19, "resetDeviceIdentityInfo");

  if (self)
  {
    CNPluginMonitorStop();
    sub_1000658A0((uint64_t)self);
    sub_100065970((uint64_t)self);
    sub_1000659AC((uint64_t)NSPServer);
    sub_100065A58((uint64_t)self);
    if (self->_userActivityNotificationHandle)
      IOPMUnregisterNotification();
    -[NSPToggleStats resetStats](self->_toggleStats, "resetStats");
    toggleStatsTimer = self->_toggleStatsTimer;
    if (toggleStatsTimer)
    {
      dispatch_source_cancel(toggleStatsTimer);
      objc_storeStrong((id *)&self->_toggleStatsTimer, 0);
    }
  }
  else
  {
    sub_1000659AC((uint64_t)NSPServer);
    objc_msgSend(0, "resetStats");
  }
}

- (void)configurationRestart:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "server configuration reset", v9, 2u);
  }

  -[NSPServer configDisabled:](self, "configDisabled:", v4);
  -[NSPServer configEnabled:](self, "configEnabled:", v4);

}

- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4
{
  if (self)
    self = (NSPServer *)self->_configuration;
  return -[NSPServer fetchDateIsWithinStart:end:](self, "fetchDateIsWithinStart:end:", a3, a4);
}

- (BOOL)subscriberTierIsProhibited:(id)a3
{
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = NSSelectorFromString(CFSTR("isCloudPrivateRelayAllowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  if ((objc_opt_respondsToSelector(v4, v3) & 1) != 0 && !objc_msgSend(v4, "performSelector:", v3))
  {
    v9 = nplog_obj(0, v5, v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Privacy proxy prohibited by profile", v11, 2u);
    }

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)suspendPrivacyProxyTemporarily:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  id Property;
  uint8_t v11[16];

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Privacy proxy suspended temporarily", v11, 2u);
  }

  if (self)
  {
    self->_isRunning = 0;
    Property = objc_getProperty(self, v9, 272, 1);
  }
  else
  {
    Property = 0;
  }
  sub_10009BD94((uint64_t)Property, 1);
  sub_100060920((uint64_t)self);
  -[NSPServer proxyTokenFetchDisabled:](self, "proxyTokenFetchDisabled:", v4);

}

- (void)resumePrivacyProxy:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  id Property;
  uint8_t v12[16];

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "resume privacy proxy", v12, 2u);
  }

  if (self)
  {
    self->_isRunning = 1;
    Property = objc_getProperty(self, v9, 272, 1);
  }
  else
  {
    Property = 0;
  }
  sub_10009BE28((uint64_t)Property, (uint64_t)v9, v10);
  -[NSPServer proxyTokenFetchEnabled:](self, "proxyTokenFetchEnabled:", v4);

}

- (void)proxyTokenFetchEnabled:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Proxy token fetch enabled", v9, 2u);
  }

  -[NSPServer authInfoChanged:](self, "authInfoChanged:", v4);
  -[NSPServer proxyInfoChanged:](self, "proxyInfoChanged:", v4);

}

- (void)proxyTokenFetchDisabled:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPServiceStatusManager *v6;
  NSPConfiguration *configuration;
  NSPConfiguration *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Proxy token fetch disabled", v11, 2u);
  }

  sub_10000BB1C((uint64_t)self, 0);
  if (self)
  {
    v6 = self->_serviceStatusManager;
    configuration = self->_configuration;
  }
  else
  {
    v6 = 0;
    configuration = 0;
  }
  v8 = configuration;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v8, "proxyConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "regionId"));
  -[NSPServiceStatusManager reportUnsupportedRegion:](v6, "reportUnsupportedRegion:", v10);

}

- (void)userTierChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPConfiguration *configuration;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSPServiceStatusManager *v15;
  NSPConfigurationManager *v16;
  NSPServiceStatusManager *v17;
  NSPConfiguration *v18;
  void *v19;
  NSPConfigurationManager *v20;
  NSPConfiguration *v21;
  void *v22;
  unsigned __int8 v23;
  NSPServiceStatusManager *v24;
  NSPConfiguration *v25;
  NSPConfiguration *v26;
  void *v27;
  void *v28;
  NSPServiceStatusManager *v29;
  NSPConfigurationManager *configurationManager;
  NSPConfiguration *v31;
  uint8_t v32[16];
  uint8_t buf[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "user tier changed", buf, 2u);
  }

  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](configuration, "userTier"));
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 != (id)2)
  {
    +[NSPServiceStatusManager removeFromPreferences](NSPServiceStatusManager, "removeFromPreferences");
    v29 = [NSPServiceStatusManager alloc];
    if (self)
      configurationManager = self->_configurationManager;
    else
      configurationManager = 0;
    v24 = -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:](v29, "initWithUserTier:effectiveUserTier:delegate:", 1, -[NSPConfigurationManager effectiveUserTier](configurationManager, "effectiveUserTier"), self);
    sub_1000230EC((uint64_t)self, v24);
    goto LABEL_31;
  }
  if (self)
  {
    if (self->_isMPTCPConverterProxy)
    {
      v12 = nplog_obj(v9, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "stopping proxying TCP socket flows to MPTCP converter proxy", v32, 2u);
      }

      sub_1000661BC(self, v14);
    }
    v15 = [NSPServiceStatusManager alloc];
    v16 = self->_configurationManager;
  }
  else
  {
    v15 = [NSPServiceStatusManager alloc];
    v16 = 0;
  }
  v17 = -[NSPServiceStatusManager initWithUserTier:effectiveUserTier:delegate:](v15, "initWithUserTier:effectiveUserTier:delegate:", 2, -[NSPConfigurationManager effectiveUserTier](v16, "effectiveUserTier"), self);
  sub_1000230EC((uint64_t)self, v17);

  if (self)
    v18 = self->_configuration;
  else
    v18 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v18, "proxyConfiguration"));

  if (v19)
  {
    if (self)
      v20 = self->_configurationManager;
    else
      v20 = 0;
    if (!-[NSPConfigurationManager configurationSubscriberPoliciesCount](v20, "configurationSubscriberPoliciesCount"))
    {
      if (self)
      {
        v24 = self->_serviceStatusManager;
        v31 = self->_configuration;
      }
      else
      {
        v24 = 0;
        v31 = 0;
      }
      v26 = v31;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v26, "proxyConfiguration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "regionId"));
      -[NSPServiceStatusManager reportSubscriberUnsupportedRegion:](v24, "reportSubscriberUnsupportedRegion:", v28);
      goto LABEL_30;
    }
    if (self)
      v21 = self->_configuration;
    else
      v21 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v21, "proxyConfiguration"));
    v23 = objc_msgSend(v22, "enabled");

    if ((v23 & 1) == 0)
    {
      if (self)
      {
        v24 = self->_serviceStatusManager;
        v25 = self->_configuration;
      }
      else
      {
        v24 = 0;
        v25 = 0;
      }
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v26, "proxyConfiguration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "regionId"));
      -[NSPServiceStatusManager reportUnsupportedRegion:](v24, "reportUnsupportedRegion:", v28);
LABEL_30:

LABEL_31:
    }
  }
  sub_100066270((uint64_t)self);
  sub_100062538(self);
  sub_1000663C0((uint64_t)self);
}

- (void)userPreferredTierChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPConfiguration *configuration;
  void *v7;
  unsigned int v8;
  _BOOL8 v9;
  NSPToggleStats *toggleStats;
  uint8_t v11[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "user preferred tier changed", v11, 2u);
  }

  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userPreferredTier](configuration, "userPreferredTier"));
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v9 = v8 == 2;
  if (self)
  {
    -[NSPPrivacyProxyAgentManager sendRTCReportForPrivacyProxyToggleState:](self->_privacyProxyAgentManager, "sendRTCReportForPrivacyProxyToggleState:", v9);
    toggleStats = self->_toggleStats;
  }
  else
  {
    objc_msgSend(0, "sendRTCReportForPrivacyProxyToggleState:", v9);
    toggleStats = 0;
  }
  if (v8 == 2)
    -[NSPToggleStats sendToggleOnStats](toggleStats, "sendToggleOnStats");
  else
    -[NSPToggleStats sendToggleOffStats](toggleStats, "sendToggleOffStats");
}

- (void)effectiveUserTierChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPServiceStatusManager *v6;
  NSPConfigurationManager *v7;
  NSPConfiguration *configuration;
  void *v9;
  NSPConfigurationManager *v10;
  NSPConfiguration *v11;
  NSPServiceStatusManager *v12;
  void *v13;
  NSPConfigurationManager *configurationManager;
  unint64_t v15;
  NSPConfiguration *v16;
  NSPConfiguration *v17;
  void *v18;
  NSPConfigurationManager *v19;
  id v20;
  id v21;
  NSPConfigurationManager *v22;
  NSPConfigurationManager *v23;
  NSPConfigurationManager *v24;
  void *v25;
  uint8_t v26[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "effective user tier changed", v26, 2u);
  }

  if (self)
  {
    v6 = self->_serviceStatusManager;
    v7 = self->_configurationManager;
    -[NSPServiceStatusManager handleEffectiveUserTierChange:](v6, "handleEffectiveUserTierChange:", -[NSPConfigurationManager effectiveUserTier](v7, "effectiveUserTier"));

    configuration = self->_configuration;
  }
  else
  {
    objc_msgSend(0, "handleEffectiveUserTierChange:", objc_msgSend(0, "effectiveUserTier"));

    configuration = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](configuration, "proxyConfiguration"));

  if (v9)
  {
    v10 = self ? self->_configurationManager : 0;
    if ((id)-[NSPConfigurationManager effectiveUserTier](v10, "effectiveUserTier") == (id)1)
    {
      if (self)
        v11 = self->_configuration;
      else
        v11 = 0;
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager userTier](v12, "userTier"));
      if (objc_msgSend(v13, "unsignedIntegerValue") != (id)2)
        goto LABEL_18;
      if (self)
        configurationManager = self->_configurationManager;
      else
        configurationManager = 0;
      v15 = -[NSPConfigurationManager configurationSubscriberPoliciesCount](configurationManager, "configurationSubscriberPoliciesCount");

      if (!v15)
      {
        if (self)
        {
          v12 = self->_serviceStatusManager;
          v16 = self->_configuration;
        }
        else
        {
          v12 = 0;
          v16 = 0;
        }
        v17 = v16;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v17, "proxyConfiguration"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "regionId"));
        -[NSPServiceStatusManager reportSubscriberUnsupportedRegion:](v12, "reportSubscriberUnsupportedRegion:", v18);

LABEL_18:
      }
    }
  }
  if (self)
    v19 = self->_configurationManager;
  else
    v19 = 0;
  v20 = -[NSPConfigurationManager effectiveUserTier](v19, "effectiveUserTier");
  v21 = v20;
  if (self)
  {
    -[NSPPrivacyProxyAgentManager handleTierChange:](self->_privacyProxyAgentManager, "handleTierChange:", v20 == (id)2);
    if (v21 == (id)2 && self->_captiveOutage)
    {
      objc_storeStrong((id *)&self->_captiveEvaluatedSSID, 0);
      sub_100066AEC((uint64_t)self);
      return;
    }
    v22 = self->_configurationManager;
    v23 = self->_configurationManager;
  }
  else
  {
    objc_msgSend(0, "handleTierChange:", v20 == (id)2);
    v22 = 0;
    v23 = 0;
  }
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy](v24, "mergeProxyTrafficStateWithCurrentPolicy"));
  -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", v22, v25, 1);

}

- (void)authInfoChanged:(id)a3
{
  NSPConfiguration *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  NSObject *v8;
  NSPConfiguration *configuration;
  NSPConfiguration *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSPConfiguration *v14;
  void *v15;
  NSPConfiguration *v16;
  void *v17;
  void *v18;
  void *v19;
  NSPConfiguration *v20;
  void *v21;
  void *v22;
  char *v23;
  id v24;
  char *i;
  NSPConfiguration *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSPConfiguration *v31;
  NSPConfiguration *v32;
  NSPConfiguration *v33;
  void *v34;
  void *v35;
  NSPConfiguration *v36;
  NSPConfiguration *v37;
  void *v38;
  void *v39;
  id v40;
  NSPConfiguration *v41;
  void *v42;
  NSPConfiguration *v43;
  void *v44;
  void *v45;
  void *v46;
  NSPConfiguration *v47;
  void *v48;
  void *v49;
  void *v50;
  NSPConfiguration *v51;
  NSPConfiguration *v52;
  void *v53;
  uint8_t buf[16];

  v7 = nplog_obj(self, a2, a3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Auth info updated", buf, 2u);
  }

  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v10 = configuration;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v10, "proxyConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authInfo"));
  v13 = objc_msgSend(v12, "authType");
  if (v13)
  {
    v14 = self ? self->_configuration : 0;
    v3 = v14;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v3, "proxyConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authURL"));
    if (v15)
    {

LABEL_15:
      if (self)
        v20 = self->_configuration;
      else
        v20 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v20, "proxyConfiguration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "authInfo"));
      v23 = (char *)objc_msgSend(v22, "accessTokenTypesCount");

      if (v23)
      {
        v24 = objc_alloc_init((Class)NSMutableArray);
        for (i = 0; i != v23; ++i)
        {
          if (self)
            v26 = self->_configuration;
          else
            v26 = 0;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v26, "proxyConfiguration"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "authInfo"));
          v29 = objc_msgSend(v28, "accessTokenTypesAtIndex:", i);

          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v29));
          objc_msgSend(v24, "addObject:", v30);

        }
      }
      else
      {
        v24 = 0;
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyTokenManager sharedTokenManager](NSPPrivacyTokenManager, "sharedTokenManager"));
      if (self)
        v31 = self->_configuration;
      else
        v31 = 0;
      v51 = v31;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v51, "proxyConfiguration"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "authInfo"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "authURL"));
      if (self)
        v32 = self->_configuration;
      else
        v32 = 0;
      v47 = v32;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v47, "proxyConfiguration"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "authInfo"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "accessTokenURL"));
      if (self)
        v33 = self->_configuration;
      else
        v33 = 0;
      v43 = v33;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v43, "proxyConfiguration"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "authInfo"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "accessTokenBlockedIssuers"));
      if (self)
        v36 = self->_configuration;
      else
        v36 = 0;
      v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v37, "proxyConfiguration"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "authInfo"));
      v40 = objc_msgSend(v39, "authType");
      if (self)
        v41 = self->_configuration;
      else
        v41 = 0;
      objc_msgSend(v53, "updateTokenFetchURL:accessTokenURL:accessTokenTypes:accessTokenBlockedIssuers:authenticationType:ignoreInvalidCerts:", v48, v44, v24, v35, v40, -[NSPConfiguration ignoreInvalidCerts](v41, "ignoreInvalidCerts"));

      return;
    }
  }
  v52 = v10;
  if (self)
    v16 = self->_configuration;
  else
    v16 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v16, "proxyConfiguration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accessTokenURL"));

  if (v13)
  {

  }
  if (v19)
    goto LABEL_15;
}

- (void)proxyInfoChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPConfiguration *configuration;
  void *v7;
  void *v8;
  id v9;
  NSPPrivacyProxyAgentManager *privacyProxyAgentManager;
  NSPConfigurationManager *configurationManager;
  id v12;
  NSPPrivacyProxyAgentManager *v13;
  NSPPrivacyProxyAgentManager *v14;
  NWPathEvaluator *primaryPhysicalInterfaceEvaluator;
  NSPConfigurationManager *v16;
  NSPConfiguration *v17;
  NSPConfiguration *v18;
  void *v19;
  id v20;
  NSPConfiguration *v21;
  NSPConfiguration *v22;
  void *v23;
  NSPConfiguration *v24;
  NSPConfiguration *v25;
  void *v26;
  int primaryInterfaceLinkQuality;
  NSPPrivacyProxyAgentManager *v28;
  NSPConfiguration *v29;
  NSPConfiguration *v30;
  NSPConfiguration *v31;
  NSPConfiguration *v32;
  NSPConfiguration *v33;
  NSPConfiguration *v34;
  void *v35;
  void *v36;
  NSPConfiguration *v37;
  NSPConfiguration *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSPConfiguration *v44;
  void *v45;
  void *v46;
  NSPConfiguration *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  NSPConfiguration *v51;
  NSPConfigurationManager *v52;
  void *v53;
  void *v54;
  void *v55;
  NWPathEvaluator *v56;
  NSPConfiguration *v57;
  NSPPrivacyProxyAgentManager *v58;
  NSPPrivacyProxyAgentManager *v59;
  uint8_t buf[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Proxy info updated", buf, 2u);
  }

  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](configuration, "proxyConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "proxies"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    sub_10000BB1C((uint64_t)self, 0);
    return;
  }
  if (self)
  {
    privacyProxyAgentManager = self->_privacyProxyAgentManager;
    if (privacyProxyAgentManager)
      goto LABEL_23;
    configurationManager = self->_configurationManager;
  }
  else
  {
    configurationManager = 0;
  }
  v12 = -[NSPConfigurationManager effectiveUserTier](configurationManager, "effectiveUserTier");
  v13 = [NSPPrivacyProxyAgentManager alloc];
  if (self)
  {
    v14 = -[NSPPrivacyProxyAgentManager initWithDelegate:toggleStats:](v13, "initWithDelegate:toggleStats:", self, self->_toggleStats);
    objc_storeStrong((id *)&self->_privacyProxyAgentManager, v14);

    v58 = self->_privacyProxyAgentManager;
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  }
  else
  {

    v58 = 0;
    primaryPhysicalInterfaceEvaluator = 0;
  }
  v56 = primaryPhysicalInterfaceEvaluator;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](v56, "path"));
  if (self)
    v16 = self->_configurationManager;
  else
    v16 = 0;
  v52 = v16;
  v50 = -[NSPConfigurationManager policyIncludesUnlimited](v52, "policyIncludesUnlimited");
  if (self)
    v17 = self->_configuration;
  else
    v17 = 0;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashSharingEnabledStatus](v18, "geohashSharingEnabledStatus"));
  v20 = objc_msgSend(v19, "BOOLValue");
  if (self)
    v21 = self->_configuration;
  else
    v21 = 0;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v22, "geohashOverride"));
  if (self)
    v24 = self->_configuration;
  else
    v24 = 0;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration epoch](v25, "epoch"));
  if (self)
    primaryInterfaceLinkQuality = self->_primaryInterfaceLinkQuality;
  else
    primaryInterfaceLinkQuality = 0;
  LODWORD(v41) = primaryInterfaceLinkQuality;
  -[NSPPrivacyProxyAgentManager setupWithPath:subscriber:unlimited:geohashSharingEnabled:geohashOverride:configEpoch:linkQuality:](v58, "setupWithPath:subscriber:unlimited:geohashSharingEnabled:geohashOverride:configEpoch:linkQuality:", v54, v12 == (id)2, v50, v20, v23, v26, v41);

  if (!self)
  {
    objc_msgSend(0, "useDefaultNetworkInterface:", objc_msgSend(0, "usesDefaultConfigurationServer") ^ 1);
    v59 = 0;
    v29 = 0;
    goto LABEL_24;
  }
  v28 = self->_privacyProxyAgentManager;
  -[NSPPrivacyProxyAgentManager useDefaultNetworkInterface:](v28, "useDefaultNetworkInterface:", -[NSPServer usesDefaultConfigurationServer](self, "usesDefaultConfigurationServer") ^ 1);

  privacyProxyAgentManager = self->_privacyProxyAgentManager;
LABEL_23:
  v59 = privacyProxyAgentManager;
  v29 = self->_configuration;
LABEL_24:
  v57 = v29;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v57, "proxyConfiguration"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "proxies"));
  if (self)
    v30 = self->_configuration;
  else
    v30 = 0;
  v51 = v30;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v51, "proxyConfiguration"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "resolvers"));
  if (self)
    v31 = self->_configuration;
  else
    v31 = 0;
  v47 = v31;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v47, "proxyConfiguration"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "pathWeights"));
  if (self)
    v32 = self->_configuration;
  else
    v32 = 0;
  v44 = v32;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v44, "proxyConfiguration"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "fallbackPathWeights"));
  if (self)
    v33 = self->_configuration;
  else
    v33 = 0;
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v34, "proxyConfiguration"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "obliviousConfigs"));
  if (self)
    v37 = self->_configuration;
  else
    v37 = 0;
  v38 = v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v38, "proxyConfiguration"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "proxiedContentMaps"));
  -[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:](v59, "updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousConfigs:proxiedContentMaps:", v53, v48, v45, v42, v36, v40);

}

- (void)policiesUpdated:(id)a3 policy:(id)a4 resolverInfoChanged:(BOOL)a5
{
  _BOOL4 v5;
  NSPServer *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSPServer *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  NSPToggleStats *v25;
  NSPOutageReasonStats *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  NSPServerODoH *v31;
  unsigned __int8 v32;
  NSPPrivacyProxyAgentManager *privacyProxyAgentManager;
  const char *v34;
  id v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;
  SEL v40;
  id v41;
  NSObject *v42;
  _BOOL8 v43;
  _BOOL8 v44;
  Class isa;
  NSPOutageReasonStats *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSPPrivacyProxyAgentManager *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  NSPConfiguration *v72;
  void *v73;
  NSPServer *v74;
  _BOOL8 v75;
  uint64_t v76;
  uint64_t v77;
  NSPServerODoH *odohManager;
  NSPConfiguration *v79;
  NSPServerODoH *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  unsigned int v91;
  void *v92;
  uint64_t v93;
  void *v94;
  SEL v95;
  _QWORD *Property;
  void *v97;
  id v98;
  NSPPrivacyProxyAgentManager *v99;
  void *v100;
  NSPPrivacyProxyAgentManager *v101;
  void *v102;
  unsigned __int8 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  NSPServiceStatusManager *v108;
  NSObject *p_super;
  uint64_t v110;
  NSPConfiguration *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  unsigned int v117;
  void *v118;
  uint8_t buf[4];
  NSPServer *v120;

  v5 = a5;
  v7 = (NSPServer *)a4;
  v10 = nplog_obj(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v120 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "privacy proxy policies updated - %@", buf, 0xCu);
  }

  if (v7)
  {
    v12 = v7;
    if (!self)
    {
LABEL_13:

      goto LABEL_14;
    }
    v13 = -[NSPPrivacyProxyAgentManager isMultiHopProxyAgentRegistered](self->_privacyProxyAgentManager, "isMultiHopProxyAgentRegistered");
    if (!v13)
    {
      v19 = nplog_obj(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v18 = "defer policy installation until multiHop agents are ready";
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (self->_systemIncompatible)
    {
      v16 = nplog_obj(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v18 = "defer policy installation until system compatible";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, buf, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (self->_fraudAlert)
    {
      v47 = nplog_obj(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v47);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v18 = "defer policy installation, token limit reached";
      goto LABEL_11;
    }
    if (self->_configOutage)
    {
      v48 = nplog_obj(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v48);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v18 = "defer policy installation until config outage is resolved";
      goto LABEL_11;
    }
    if (self->_tokenOutage)
    {
      v49 = nplog_obj(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v49);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v18 = "defer policy installtion until token outage is resolved";
      goto LABEL_11;
    }
    if (self->_proxyOutage)
    {
      v51 = nplog_obj(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v51);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v18 = "defer policy installation until proxy outage is resolved";
      goto LABEL_11;
    }
    if (self->_proxyNetworkOutage)
    {
      v52 = nplog_obj(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v52);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v18 = "defer policy installation until proxy network outage is resolved";
      goto LABEL_11;
    }
    v53 = sub_1000638C0((uint64_t)self, v12);
    if ((_DWORD)v53)
    {
      if (self->_odohOutage)
      {
        v56 = nplog_obj(v53, v54, v55);
        v17 = objc_claimAutoreleasedReturnValue(v56);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        *(_WORD *)buf = 0;
        v18 = "defer policy installation until odoh outage is resolved";
        goto LABEL_11;
      }
      if (self->_odohAuthOutage)
      {
        v57 = nplog_obj(v53, v54, v55);
        v17 = objc_claimAutoreleasedReturnValue(v57);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        *(_WORD *)buf = 0;
        v18 = "defer policy installation until odoh auth outage is resolved";
        goto LABEL_11;
      }
    }
    if (self->_captiveOutage)
    {
      v58 = nplog_obj(v53, v54, v55);
      v17 = objc_claimAutoreleasedReturnValue(v58);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v18 = "defer policy installation until captive outage is resolved";
      goto LABEL_11;
    }

    v59 = self->_privacyProxyAgentManager;
    -[NSPPrivacyProxyAgentManager handleUnlimitedChange:](v59, "handleUnlimitedChange:", sub_100068430((_BOOL8)self, v12));

    if (-[NSPPrivacyProxyAgentManager isSingleHopProxyAgentRegistered](self->_privacyProxyAgentManager, "isSingleHopProxyAgentRegistered"))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](self->_configuration, "proxyConfiguration"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bootstrapResolver"));

      v62 = sub_10004BD30((uint64_t)self->_odohManager, v61);
      if ((v62 & 1) == 0)
      {
        v65 = nplog_obj(v62, v63, v64);
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v120 = self;
          _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@ failed to register bootstrap DNS network agent", buf, 0xCu);
        }

      }
    }
    v67 = sub_1000638C0((uint64_t)self, v12);
    if ((v67 & 1) != 0)
    {
      if (v5)
      {
        v70 = nplog_obj(v67, v68, v69);
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          v72 = self->_configuration;
          v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v72, "proxyConfiguration"));
          v74 = (NSPServer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "resolvers"));
          *(_DWORD *)buf = 138412290;
          v120 = v74;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "privacy proxy resolver info updated %@", buf, 0xCu);

        }
        v75 = -[NSPPrivacyProxyAgentManager isSingleHopProxyAgentRegistered](self->_privacyProxyAgentManager, "isSingleHopProxyAgentRegistered");
        if (!v75)
        {
          v114 = nplog_obj(v75, v76, v77);
          v42 = objc_claimAutoreleasedReturnValue(v114);
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            goto LABEL_122;
          *(_DWORD *)buf = 138412290;
          v120 = self;
          v87 = "%@ single hop proxy agent is not active, unable to set DNS policies";
          goto LABEL_116;
        }
        odohManager = self->_odohManager;
        v79 = self->_configuration;
        v80 = odohManager;
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v79, "proxyConfiguration"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "resolvers"));
        sub_10004B8F0((uint64_t)v80, v82);

      }
      v83 = sub_10004C93C((uint64_t)self->_odohManager);
      if ((v83 & 1) == 0)
      {
        v86 = nplog_obj(v83, v84, v85);
        v42 = objc_claimAutoreleasedReturnValue(v86);
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          goto LABEL_122;
        *(_DWORD *)buf = 138412290;
        v120 = self;
        v87 = "%@ failed to register DNS network agent";
LABEL_116:
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v87, buf, 0xCu);
        goto LABEL_122;
      }
    }
    else
    {
      sub_10004BA2C((uint64_t)self->_odohManager);
      sub_100065744((uint64_t)self);
    }
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration inProcessFlowDivert](self->_configuration, "inProcessFlowDivert"));

    if (v88)
    {
      v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration inProcessFlowDivert](self->_configuration, "inProcessFlowDivert"));
      v91 = objc_msgSend(v90, "BOOLValue");

    }
    else
    {
      v91 = 1;
    }
    v26 = (NSPOutageReasonStats *)objc_getProperty(self, v89, 48, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager pausedBundleIDs](self->_serviceStatusManager, "pausedBundleIDs"));
    v117 = v91;
    v116 = v92;
    if (v92)
    {
      if (v26)
      {
        v93 = objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats arrayByAddingObjectsFromArray:](v26, "arrayByAddingObjectsFromArray:", v92));

        v26 = (NSPOutageReasonStats *)v93;
      }
      else
      {
        v26 = v92;
      }
    }
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager pausedProcessPaths](self->_serviceStatusManager, "pausedProcessPaths"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
    Property = objc_getProperty(self, v95, 272, 1);
    if (Property)
      v97 = (void *)Property[2];
    else
      v97 = 0;
    v98 = v97;
    v99 = self->_privacyProxyAgentManager;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager ingressProxyURL](v99, "ingressProxyURL"));
    v101 = self->_privacyProxyAgentManager;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager ingressFallbackProxyURL](v101, "ingressFallbackProxyURL"));
    v103 = objc_msgSend(v94, "set:flowDivertHandle:inProcessFlowDivert:ingressProxyURL:ingressFallbackProxyURL:exceptionBundleIDs:exceptionProcessPaths:", v12, v98, v117, v100, v102, v26, v118);

    if ((v103 & 1) != 0)
    {
      v107 = -[NSPConfigurationManager configurationSubscriberPoliciesCount](self->_configurationManager, "configurationSubscriberPoliciesCount");
      v108 = self->_serviceStatusManager;
      p_super = &v108->super;
      if (v107)
      {
        -[NSPServiceStatusManager reportServiceActiveShouldReport:](v108, "reportServiceActiveShouldReport:", self->_userTierChangedFromNonSettingsApp);
      }
      else
      {
        v111 = self->_configuration;
        v112 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](v111, "proxyConfiguration"));
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "regionId"));
        -[NSObject reportSubscriberUnsupportedRegion:](p_super, "reportSubscriberUnsupportedRegion:", v113);

      }
    }
    else
    {
      v110 = nplog_obj(v104, v105, v106);
      p_super = objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v120 = self;
        _os_log_error_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%@ failed to set privacy proxy policies", buf, 0xCu);
      }
    }

    goto LABEL_113;
  }
LABEL_14:
  if (!self)
  {
    v20 = objc_msgSend(0, "isNetworkOutage");
    v21 = objc_msgSend(0, "isServiceOutage");
    if (v7)
      goto LABEL_118;
    v24 = v21;
    v26 = 0;
    goto LABEL_95;
  }
  v20 = -[NSPServiceStatusManager isNetworkOutage](self->_serviceStatusManager, "isNetworkOutage");
  v21 = (id)-[NSPServiceStatusManager isServiceOutage](self->_serviceStatusManager, "isServiceOutage");
  v24 = v21;
  if (self->_systemIncompatible)
  {
    -[NSPServiceStatusManager reportSystemIncompatibility](self->_serviceStatusManager, "reportSystemIncompatibility");
    v25 = self->_toggleStats;
    -[NSPToggleStats setSystemIncompatibleCount:](v25, "setSystemIncompatibleCount:", (char *)-[NSPToggleStats systemIncompatibleCount](v25, "systemIncompatibleCount") + 1);
LABEL_19:
    v26 = 0;
LABEL_20:
    v27 = 1;
LABEL_21:

    goto LABEL_22;
  }
  if (self->_fraudAlert)
  {
    -[NSPServiceStatusManager reportFraudAlert](self->_serviceStatusManager, "reportFraudAlert");
    v25 = self->_toggleStats;
    -[NSPToggleStats setFraudAlertCount:](v25, "setFraudAlertCount:", (char *)-[NSPToggleStats fraudAlertCount](v25, "fraudAlertCount") + 1);
    goto LABEL_19;
  }
  if (self->_captiveOutage)
  {
    v46 = self->_lastCaptiveOutageReasonStats;
LABEL_42:
    v26 = v46;
    -[NSPServiceStatusManager reportServiceOutageWithType:outageReasonStats:](self->_serviceStatusManager, "reportServiceOutageWithType:outageReasonStats:", 2, v46);
    v25 = self->_toggleStats;
    -[NSPToggleStats setNetworkOutageCount:](v25, "setNetworkOutageCount:", (char *)-[NSPToggleStats networkOutageCount](v25, "networkOutageCount") + 1);
    v27 = 0;
    goto LABEL_21;
  }
  if (self->_proxyOutage)
  {
    v26 = (NSPOutageReasonStats *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager lastProxyOutageReason](self->_privacyProxyAgentManager, "lastProxyOutageReason"));
    -[NSPServiceStatusManager reportServiceOutageWithType:outageReasonStats:](self->_serviceStatusManager, "reportServiceOutageWithType:outageReasonStats:", 5, v26);
    v25 = self->_toggleStats;
    -[NSPToggleStats setProxyOutageCount:](v25, "setProxyOutageCount:", (char *)-[NSPToggleStats proxyOutageCount](v25, "proxyOutageCount") + 1);
    goto LABEL_20;
  }
  if (self->_proxyNetworkOutage)
  {
    v46 = (NSPOutageReasonStats *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager lastProxyOutageReason](self->_privacyProxyAgentManager, "lastProxyOutageReason"));
    goto LABEL_42;
  }
  if (self->_odohOutage || self->_odohAuthOutage)
  {
    v50 = sub_10004E168((id *)&self->_odohManager->super.isa);
    v26 = (NSPOutageReasonStats *)objc_claimAutoreleasedReturnValue(v50);
    -[NSPServiceStatusManager reportServiceOutageWithType:outageReasonStats:](self->_serviceStatusManager, "reportServiceOutageWithType:outageReasonStats:", 4, v26);
    v25 = self->_toggleStats;
    -[NSPToggleStats setOdohOutageCount:](v25, "setOdohOutageCount:", (char *)-[NSPToggleStats odohOutageCount](v25, "odohOutageCount") + 1);
    goto LABEL_20;
  }
  if (self->_tokenOutage)
  {
    v26 = (NSPOutageReasonStats *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager lastTokenOutageReason](self->_privacyProxyAgentManager, "lastTokenOutageReason"));
    -[NSPServiceStatusManager reportServiceOutageWithType:outageReasonStats:](self->_serviceStatusManager, "reportServiceOutageWithType:outageReasonStats:", 3, v26);
    v25 = self->_toggleStats;
    -[NSPToggleStats setTokenOutageCount:](v25, "setTokenOutageCount:", (char *)-[NSPToggleStats tokenOutageCount](v25, "tokenOutageCount") + 1);
    goto LABEL_20;
  }
  if (self->_configOutage)
  {
    v26 = self->_lastConfigOutageReasonStats;
    v27 = 1;
    -[NSPServiceStatusManager reportServiceOutageWithType:outageReasonStats:](self->_serviceStatusManager, "reportServiceOutageWithType:outageReasonStats:", 1, v26);
    v25 = self->_toggleStats;
    -[NSPToggleStats setConfigOutageCount:](v25, "setConfigOutageCount:", (char *)-[NSPToggleStats configOutageCount](v25, "configOutageCount") + 1);
    goto LABEL_21;
  }
  v26 = 0;
  if (v7)
  {
LABEL_113:

    goto LABEL_35;
  }
LABEL_95:
  v27 = 1;
LABEL_22:
  v28 = nplog_obj(v21, v22, v23);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "remove policies", buf, 2u);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v30, "remove:", 0);

  if (self)
    v31 = self->_odohManager;
  else
    v31 = 0;
  sub_10004BA2C((uint64_t)v31);
  if (v27)
    v32 = v24;
  else
    v32 = v20;
  if (v26 && (v32 & 1) == 0)
  {
    if (self)
      privacyProxyAgentManager = self->_privacyProxyAgentManager;
    else
      privacyProxyAgentManager = 0;
    -[NSPPrivacyProxyAgentManager sendRTCReportForServiceOutage:](privacyProxyAgentManager, "sendRTCReportForServiceOutage:", v26);
  }

  if (self)
  {
LABEL_35:
    v35 = objc_getProperty(self, v34, 376, 1);
    v36 = sub_100041724((uint64_t)v35);
    if ((_DWORD)v36)
    {
      v39 = objc_getProperty(self, v37, 376, 1);
      sub_100041454((uint64_t)v39, -[NSPServer isSubscriberUnlimited](self, "isSubscriberUnlimited"));

      v41 = objc_getProperty(self, v40, 272, 1);
LABEL_37:
      v42 = v41;
      v43 = -[NSPServer isSubscriberUnlimited](self, "isSubscriberUnlimited");
      if (v42)
      {
        v44 = v43;
        isa = v42[3].isa;
        if (isa)
          NEFlowDirectorRedirectDNSToLoopback(isa, v44);
      }
      goto LABEL_122;
    }
    goto LABEL_120;
  }
LABEL_118:
  v36 = sub_100041724(0);
  if ((v36 & 1) != 0)
  {
    sub_100041454(0, (int)objc_msgSend(0, "isSubscriberUnlimited"));
    v41 = 0;
    goto LABEL_37;
  }
LABEL_120:
  v115 = nplog_obj(v36, v37, v38);
  v42 = objc_claimAutoreleasedReturnValue(v115);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "DNS proxy not supported on this platform", buf, 2u);
  }
LABEL_122:

}

- (void)configUpdated:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPPrivacyProxyAgentManager *v6;
  uint64_t v7;
  uint64_t v8;
  NSPPrivacyProxyAgentManager *privacyProxyAgentManager;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Configuration updated", v12, 2u);
  }

  sub_100062748((uint64_t)self);
  sub_1000651CC((id *)&self->super.isa);
  if (self)
  {
    v6 = self->_privacyProxyAgentManager;
    -[NSPPrivacyProxyAgentManager useDefaultNetworkInterface:](v6, "useDefaultNetworkInterface:", -[NSPServer usesDefaultConfigurationServer](self, "usesDefaultConfigurationServer") ^ 1);

    sub_10004D9F4((id *)&self->_odohManager->super.isa, v7, v8);
    privacyProxyAgentManager = self->_privacyProxyAgentManager;
  }
  else
  {
    objc_msgSend(0, "useDefaultNetworkInterface:", objc_msgSend(0, "usesDefaultConfigurationServer") ^ 1);
    sub_10004D9F4(0, v10, v11);
    privacyProxyAgentManager = 0;
  }
  -[NSPPrivacyProxyAgentManager handleConfigChange](privacyProxyAgentManager, "handleConfigChange");
}

- (void)geohashSettingsChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPPrivacyProxyAgentManager *v6;
  NSPConfiguration *configuration;
  NSPConfiguration *v8;
  void *v9;
  id v10;
  NSPConfiguration *v11;
  NSPConfiguration *v12;
  void *v13;
  uint8_t v14[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Geohash settings changed", v14, 2u);
  }

  if (self)
  {
    v6 = self->_privacyProxyAgentManager;
    configuration = self->_configuration;
  }
  else
  {
    v6 = 0;
    configuration = 0;
  }
  v8 = configuration;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashSharingEnabledStatus](v8, "geohashSharingEnabledStatus"));
  v10 = objc_msgSend(v9, "BOOLValue");
  if (self)
    v11 = self->_configuration;
  else
    v11 = 0;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration geohashOverride](v12, "geohashOverride"));
  -[NSPPrivacyProxyAgentManager updateGeohashSharingPreference:geohashOverride:](v6, "updateGeohashSharingPreference:geohashOverride:", v10, v13);

}

- (void)configEpochChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSPPrivacyProxyAgentManager *v6;
  NSPConfiguration *configuration;
  NSPConfiguration *v8;
  void *v9;
  uint8_t v10[16];

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Config epoch changed", v10, 2u);
  }

  if (self)
  {
    v6 = self->_privacyProxyAgentManager;
    configuration = self->_configuration;
  }
  else
  {
    v6 = 0;
    configuration = 0;
  }
  v8 = configuration;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration epoch](v8, "epoch"));
  -[NSPPrivacyProxyAgentManager updateConfigEpoch:](v6, "updateConfigEpoch:", v9);

}

- (void)privateAccessTokensEnabledChanged:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = nplog_obj(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Private Access Tokens settings changed", v5, 2u);
  }

}

- (void)cloudSubscriptionChanged:(BOOL)a3 configManager:(id)a4
{
  if (a3)
  {
    sub_100064D28((id *)&self->super.isa);
    sub_100064E40((uint64_t *)self);
  }
  else
  {
    sub_100065858((uint64_t)self);
  }
}

- (void)badTokenInfoForProxy:(id)a3
{
  NSPConfiguration *configuration;
  NSPConfiguration *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSPConfiguration *v15;
  NSPConfiguration *v16;
  void *v17;
  void *v18;
  NSPConfiguration *v19;
  void *v20;
  double v21;
  double v22;
  NSPBadTokenInfoStats *v23;
  NSPConfiguration *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSPConfiguration *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v6 = configuration;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configurationFetchDate](v6, "configurationFetchDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v8, 1, 2));

  v13 = nplog_obj(v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      v15 = self->_configuration;
    else
      v15 = 0;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration etag](v16, "etag"));
    *(_DWORD *)buf = 138412546;
    v32 = v17;
    v33 = 2112;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received bad token info for configuration tag[%@] with fetch date %@", buf, 0x16u);

  }
  -[NSPServer refreshProxyInfo:](self, "refreshProxyInfo:", 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  if (self)
    v19 = self->_configuration;
  else
    v19 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configurationFetchDate](v19, "configurationFetchDate"));
  objc_msgSend(v18, "timeIntervalSinceDate:", v20);
  v22 = v21;

  v23 = objc_alloc_init(NSPBadTokenInfoStats);
  if (self)
    v24 = self->_configuration;
  else
    v24 = 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration userTier](v24, "userTier"));
  v26 = objc_msgSend(v25, "intValue");
  if (v26 >= 3)
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v26));
  else
    v27 = *(&off_1000F65C0 + (int)v26);
  -[NSPBadTokenInfoStats setTierType:](v23, "setTierType:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vendor"));
  -[NSPBadTokenInfoStats setTokenProxy:](v23, "setTokenProxy:", v28);

  if (self)
    v29 = self->_configuration;
  else
    v29 = 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration etag](v29, "etag"));
  -[NSPBadTokenInfoStats setConfigTag:](v23, "setConfigTag:", v30);

  -[NSPBadTokenInfoStats setConfigAgeHours:](v23, "setConfigAgeHours:", (unint64_t)(v22 / 3600.0));
  -[NSPProxyAnalytics sendAnalytics](v23, "sendAnalytics");

}

- (void)refreshProxyInfo:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  NSPConfigurationManager *configurationManager;
  NSPConfigurationManager *v8;
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = nplog_obj(self, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ received refresh proxy information", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3032000000;
  v12 = sub_10000312C;
  v13 = sub_100054A8C;
  v14 = (id)os_transaction_create("com.apple.networkserviceproxy.refreshProxyInfo");
  if (self)
    configurationManager = self->_configurationManager;
  else
    configurationManager = 0;
  v8 = configurationManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100068BF4;
  v9[3] = &unk_1000F6170;
  v9[4] = &buf;
  -[NSPConfigurationManager refreshConfigurationWithReason:completionHandler:](v8, "refreshConfigurationWithReason:completionHandler:", a3, v9);

  _Block_object_dispose(&buf, 8);
}

- (void)multiHopProxyAgentRegistered:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSPConfigurationManager *configurationManager;
  void *v9;
  NSPConfigurationManager *v10;
  NSPConfigurationManager *v11;
  int v12;
  const char *v13;

  v3 = a3;
  v5 = nplog_obj(self, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "is not";
    if (v3)
      v7 = "is";
    v12 = 136315138;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "multiHop proxy agent %s registered", (uint8_t *)&v12, 0xCu);
  }

  if (v3)
  {
    if (self)
      configurationManager = self->_configurationManager;
    else
      configurationManager = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy](configurationManager, "mergeProxyTrafficStateWithCurrentPolicy"));
    if (self)
      v10 = self->_configurationManager;
    else
      v10 = 0;
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", v10, v9, 1);

  }
  else
  {
    if (self)
      v11 = self->_configurationManager;
    else
      v11 = 0;
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", v11, 0, 0);
  }
}

- (void)singleHopProxyAgentRegistered:(BOOL)a3
{
  NSPServerODoH *odohManager;

  if (a3)
  {
    if (self)
    {
      sub_10004BA2C((uint64_t)self->_odohManager);
      odohManager = self->_odohManager;
    }
    else
    {
      sub_10004BA2C(0);
      odohManager = 0;
    }
    sub_10004C93C((uint64_t)odohManager);
  }
}

- (void)obliviousHopAgentRegisteredForHostname:(id)a3 processes:(id)a4 agentUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  v13 = nplog_obj(v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v15)
    {
      v20 = 138412802;
      v21 = v7;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v8;
      v16 = "Adding policies for oblivious agent for %@ (%@), limited to %@";
      v17 = v14;
      v18 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, v18);
    }
  }
  else if (v15)
  {
    v20 = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v9;
    v16 = "Adding policies for oblivious agent for %@ (%@)";
    v17 = v14;
    v18 = 22;
    goto LABEL_6;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v19, "addObliviousProxyAgent:processes:hostname:", v9, v8, v7);

}

- (void)obliviousHopAgentUnregisteredForHostname:(id)a3 agentUUID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v9 = nplog_obj(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing policies for oblivious agent for %@ (%@)", (uint8_t *)&v12, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v11, "removeObliviousProxyAgent:forHostname:apply:", v6, v5, 1);

}

- (void)proxiedContentMaps:(id)a3 registeredForAgentUUID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v9 = nplog_obj(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding policies for proxied content for %@", (uint8_t *)&v12, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v11, "addProxiedContentAgent:maps:", v5, v6);

}

- (void)networkDiscoveredProxyPaths:(id)a3 registeredForAgentUUID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v9 = nplog_obj(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding policy for network discovered agent for %@", (uint8_t *)&v12, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v11, "addNetworkDiscoveryProxyAgent:with:", v5, v6);

}

- (void)proxiedContentMapsUnregisteredForAgentUUID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a3;
  v6 = nplog_obj(v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing policies for proxied content for %@", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v8, "removeProxiedContentAgent:apply:", v3, 1);

}

- (void)tokenIssuanceLimitReached
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  NSPConfigurationManager *configurationManager;
  uint8_t v7[16];

  if (!self || !self->_fraudAlert)
  {
    v4 = nplog_obj(self, a2, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting fraud alert", v7, 2u);
    }

    if (self)
    {
      self->_fraudAlert = 1;
      configurationManager = self->_configurationManager;
    }
    else
    {
      configurationManager = 0;
    }
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", configurationManager, 0, 0);
    sub_1000639C4((uint64_t)self);
  }
  sub_100062748((uint64_t)self);
}

- (void)tokenIssuanceAllowed
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (self && self->_fraudAlert)
  {
    v4 = nplog_obj(self, a2, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting token issuance allowed", v7, 2u);
    }

    self->_fraudAlert = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy](self->_configurationManager, "mergeProxyTrafficStateWithCurrentPolicy"));
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", self->_configurationManager, v6, 1);
    sub_1000639C4((uint64_t)self);

  }
}

- (void)checkPrivacyProxyConnectivityOnInterface:(id)a3 proxyConnectivityCheckType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSPServerODoH *odohManager;
  id *v19;
  id *v20;
  NSPPrivacyProxyAgentManager *privacyProxyAgentManager;
  NSPPrivacyProxyAgentManager *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSMutableSet *interfacesBeingChecked;
  NSPConfiguration *configuration;
  NSPConfiguration *v30;
  void *v31;
  NSPConfigurationManager *configurationManager;
  NSPConfigurationManager *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NSPServer *v38;
  id v39;
  id v40;
  id v41;
  _BYTE *v42;
  id v43[2];
  id location;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interfaceName"));
  v13 = nplog_obj(v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ received check proxy connectivity for interface %@", buf, 0x16u);
  }

  v15 = 0;
  v16 = 4;
  v17 = 5;
  switch(a4)
  {
    case 1uLL:
      goto LABEL_15;
    case 2uLL:
      if (self)
        privacyProxyAgentManager = self->_privacyProxyAgentManager;
      else
        privacyProxyAgentManager = 0;
      v22 = privacyProxyAgentManager;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyAgentManager lastProxyOutageReason](v22, "lastProxyOutageReason"));

      v17 = 3;
      if (!v10)
        goto LABEL_24;
      goto LABEL_16;
    case 3uLL:
      v15 = 0;
      v17 = 10;
      goto LABEL_15;
    case 4uLL:
    case 5uLL:
      goto LABEL_4;
    case 6uLL:
      v15 = 0;
      v17 = 12;
      if (!v10)
        goto LABEL_24;
      goto LABEL_16;
    default:
      v16 = 0;
      v17 = 0;
      v15 = 0;
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
LABEL_4:
        if (self)
          odohManager = self->_odohManager;
        else
          odohManager = 0;
        v19 = odohManager;
        v20 = sub_10004E168(v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v20);

        v17 = v16;
        if (!v10)
          goto LABEL_24;
      }
      else
      {
LABEL_15:
        if (!v10)
        {
LABEL_24:
          if (self)
            configuration = self->_configuration;
          else
            configuration = 0;
          v30 = configuration;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration etag](v30, "etag"));

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v46 = sub_10000312C;
          v47 = sub_100054A8C;
          v48 = (id)os_transaction_create("com.apple.networkserviceproxy.checkPrivacyProxyConnectivity");
          objc_initWeak(&location, self);
          if (self)
            configurationManager = self->_configurationManager;
          else
            configurationManager = 0;
          v33 = configurationManager;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100069898;
          v35[3] = &unk_1000F6198;
          objc_copyWeak(v43, &location);
          v36 = v10;
          v34 = v31;
          v43[1] = (id)a4;
          v37 = v34;
          v38 = self;
          v39 = v8;
          v40 = v15;
          v41 = v9;
          v42 = buf;
          -[NSPConfigurationManager refreshConfigurationWithReason:completionHandler:](v33, "refreshConfigurationWithReason:completionHandler:", v17, v35);

          objc_destroyWeak(v43);
          objc_destroyWeak(&location);
          _Block_object_dispose(buf, 8);

          goto LABEL_29;
        }
      }
LABEL_16:
      if (!self)
      {
        v23 = objc_msgSend(0, "containsObject:", v10);
        if ((v23 & 1) != 0)
          goto LABEL_18;
        interfacesBeingChecked = 0;
        goto LABEL_23;
      }
      v23 = -[NSMutableSet containsObject:](self->_interfacesBeingChecked, "containsObject:", v10);
      if (!(_DWORD)v23)
      {
        interfacesBeingChecked = self->_interfacesBeingChecked;
LABEL_23:
        -[NSMutableSet addObject:](interfacesBeingChecked, "addObject:", v10);
        goto LABEL_24;
      }
LABEL_18:
      v26 = nplog_obj(v23, v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%@ already checking connectivity for interface %@", buf, 0x16u);
      }

      if (v9)
        (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
LABEL_29:

      return;
  }
}

- (void)handleDNSAgentErrorReport:(id)a3 error:(int)a4
{
  if (self)
    self = (NSPServer *)self->_privacyProxyAgentManager;
  -[NSPServer sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:](self, "sendRTCReportWithFailureType:errorCode:url:ingressProxy:egressProxy:", 1002, *(_QWORD *)&a4, a3, 0, 0);
}

- (void)reportPrivacyProxySuccessOnInterface:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSMutableSet *interfacesBeingChecked;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  char v25;
  uint64_t v26;
  void *k;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  char v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  unsigned __int8 v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  NSPServer *v54;
  __int16 v55;
  void *v56;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interfaceName"));
  v8 = nplog_obj(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v54 = self;
    v55 = 2112;
    v56 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ reported proxy success on interface %@", buf, 0x16u);
  }

  if (v5)
  {
    if (self)
    {
      if (!-[NSMutableSet containsObject:](self->_interfacesBeingChecked, "containsObject:", v5))
        goto LABEL_8;
      interfacesBeingChecked = self->_interfacesBeingChecked;
    }
    else
    {
      v44 = objc_msgSend(0, "containsObject:", v5);
      interfacesBeingChecked = 0;
      if ((v44 & 1) == 0)
      {
        if (objc_msgSend(v4, "type") == (id)1 || objc_msgSend(v4, "type") == (id)2)
          goto LABEL_60;
        v45 = v4;
LABEL_59:

        goto LABEL_60;
      }
    }
    -[NSMutableSet removeObject:](interfacesBeingChecked, "removeObject:", v5);
  }
LABEL_8:
  if (objc_msgSend(v4, "type") == (id)1)
  {
    if (self)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self->_serviceStatusManager, "serviceStatus"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "networkStatuses"));

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
      if (v13)
      {
        v14 = v13;
        v15 = v5;
        v16 = 0;
        v17 = 0;
        v18 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v18)
              objc_enumerationMutation(v12);
            v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v20, "networkType") == 1)
            {
              if (!objc_msgSend(v20, "networkStatus"))
                goto LABEL_38;
              if (objc_msgSend(v20, "networkStatus") == (id)2)
              {
                v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "networkName"));

                v17 = 1;
                v16 = (void *)v21;
              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
        }
        while (v14);

        if ((v17 & 1) != 0)
        {
          -[NSPServiceStatusManager reportActiveOnWiFiName:](self->_serviceStatusManager, "reportActiveOnWiFiName:", v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
          objc_msgSend(v12, "wifiDisabled:", 0);
LABEL_38:
          v5 = v15;
LABEL_40:

LABEL_41:
          goto LABEL_60;
        }
        goto LABEL_61;
      }
      goto LABEL_39;
    }
    goto LABEL_60;
  }
  if (objc_msgSend(v4, "type") != (id)2)
  {
    v30 = v4;
    if (self)
    {
      v31 = v30;
      if (objc_msgSend(v30, "type") == (id)3)
      {
        v47 = v5;
        v48 = v4;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "interfaceName"));
        v46 = sub_100071378(v32);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self->_serviceStatusManager, "serviceStatus"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "networkStatuses"));

        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
        if (v35)
        {
          v36 = v35;
          v37 = 0;
          v38 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v36; j = (char *)j + 1)
            {
              if (*(_QWORD *)v50 != v38)
                objc_enumerationMutation(v34);
              v40 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v40, "networkType") == 3)
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "networkName"));
                v42 = objc_msgSend(v41, "isEqualToString:", v32);

                if (v42)
                {
                  if (!objc_msgSend(v40, "networkStatus"))
                    goto LABEL_57;
                  v37 |= objc_msgSend(v40, "networkStatus") == (id)2;
                }
              }
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
          }
          while (v36);

          v43 = (void *)v46;
          if ((v37 & 1) != 0)
          {
            -[NSPServiceStatusManager reportActiveOnInterfaceName:displayName:type:](self->_serviceStatusManager, "reportActiveOnInterfaceName:displayName:type:", v32, v46, 3);
            sub_1000663C0((uint64_t)self);
          }
        }
        else
        {
LABEL_57:

          v43 = (void *)v46;
        }

        v5 = v47;
        v4 = v48;
      }
    }
    goto LABEL_59;
  }
  if (self)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSPServiceStatusManager serviceStatus](self->_serviceStatusManager, "serviceStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "networkStatuses"));

    v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
    if (v23)
    {
      v24 = v23;
      v15 = v5;
      v16 = 0;
      v25 = 0;
      v26 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(v12);
          v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)k);
          if (objc_msgSend(v28, "networkType") == 2)
          {
            if (!objc_msgSend(v28, "networkStatus"))
              goto LABEL_38;
            if (objc_msgSend(v28, "networkStatus") == (id)2)
            {
              v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "networkName"));

              v25 = 1;
              v16 = (void *)v29;
            }
          }
        }
        v24 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
      }
      while (v24);

      if ((v25 & 1) != 0)
      {
        -[NSPServiceStatusManager reportActiveOnCellularName:](self->_serviceStatusManager, "reportActiveOnCellularName:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
        objc_msgSend(v12, "cellularDisabled:", 0);
        goto LABEL_38;
      }
LABEL_61:
      v5 = v15;
      goto LABEL_41;
    }
LABEL_39:
    v16 = 0;
    goto LABEL_40;
  }
LABEL_60:

}

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  if (self)
    self = (NSPServer *)self->_serviceStatusManager;
  -[NSPServer reportActivityForApp:path:](self, "reportActivityForApp:path:", a3, a4);
}

- (void)tokenFetchOutage
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  NSPConfigurationManager *configurationManager;
  uint8_t v7[16];

  if (!self || !self->_tokenOutage)
  {
    v4 = nplog_obj(self, a2, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting token fetch outage", v7, 2u);
    }

    if (self)
    {
      self->_tokenOutage = 1;
      configurationManager = self->_configurationManager;
    }
    else
    {
      configurationManager = 0;
    }
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", configurationManager, 0, 0);
    sub_1000639C4((uint64_t)self);
  }
}

- (void)tokenFetchActive
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (self && self->_tokenOutage)
  {
    v4 = nplog_obj(self, a2, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reporting token fetch active", v7, 2u);
    }

    self->_tokenOutage = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy](self->_configurationManager, "mergeProxyTrafficStateWithCurrentPolicy"));
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", self->_configurationManager, v6, 1);
    sub_1000639C4((uint64_t)self);

  }
}

- (void)proxyConnectivityOutage
{
  uint64_t v2;

  sub_10006AC2C((uint64_t)self, 0, v2);
}

- (void)proxyConnectivityNetworkOutage
{
  uint64_t v2;

  sub_10006ACDC((uint64_t)self, 0, v2);
}

- (void)proxyConnectivityActive
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  NSObject *proxyOutageRestoreTimer;
  void *v7;
  uint8_t v8[16];

  if (self && (self->_proxyOutage || self->_proxyNetworkOutage))
  {
    v4 = nplog_obj(self, a2, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restore proxy connectivity", v8, 2u);
    }

    proxyOutageRestoreTimer = self->_proxyOutageRestoreTimer;
    *(_WORD *)&self->_proxyOutage = 0;
    if (proxyOutageRestoreTimer)
    {
      dispatch_source_cancel(proxyOutageRestoreTimer);
      objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0);
    }
    objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationManager mergeProxyTrafficStateWithCurrentPolicy](self->_configurationManager, "mergeProxyTrafficStateWithCurrentPolicy"));
    -[NSPServer policiesUpdated:policy:resolverInfoChanged:](self, "policiesUpdated:policy:resolverInfoChanged:", self->_configurationManager, v7, 1);
    sub_100062748((uint64_t)self);
    -[NSPPrivacyProxyAgentManager resetProxyErrors](self->_privacyProxyAgentManager, "resetProxyErrors");
    sub_1000639C4((uint64_t)self);

  }
}

- (void)preferredProxyAgentRegistered:(id)a3 agentUUID:(id)a4 domainFilter:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSPConfiguration *configuration;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration preferredPathRoutingEnabledStatus](configuration, "preferredPathRoutingEnabledStatus"));
  v13 = objc_msgSend(v12, "BOOLValue");

  v17 = nplog_obj(v14, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v19)
    {
      v20 = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding policies for preferred agent %@ / %@", (uint8_t *)&v20, 0x16u);
    }

    v18 = objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
    -[NSObject addPreferredProxy:agentUUID:withDomainFilter:](v18, "addPreferredProxy:agentUUID:withDomainFilter:", v8, v9, v10);
  }
  else if (v19)
  {
    v20 = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping adding policies preferred agent %@ / %@, feature disabled", (uint8_t *)&v20, 0x16u);
  }

}

- (void)preferredProxyAgentUnregistered:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a3;
  v6 = nplog_obj(v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing policies for preferred agent %@", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v8, "removePreferredProxy:apply:", v3, 1);

}

- (BOOL)networkDiscoveredProxyInTrustedProxyList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSPConfiguration *configuration;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  BOOL v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "port"));

    if (v6)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      if (self)
        configuration = self->_configuration;
      else
        configuration = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](configuration, "proxyConfiguration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trustedNetworkDiscoveredProxies"));

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v33;
        v13 = CFSTR(":");
        v14 = &AnalyticsSendEventLazy_ptr;
        do
        {
          v15 = 0;
          v31 = v11;
          do
          {
            if (*(_QWORD *)v33 != v12)
              objc_enumerationMutation(v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v15), "componentsSeparatedByString:", v13));
            if ((unint64_t)objc_msgSend(v16, "count") >= 2)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 0));
              v18 = objc_opt_class(v14[148]);
              isKindOfClass = objc_opt_isKindOfClass(v17, v18);

              if ((isKindOfClass & 1) != 0)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 0));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 1));
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v21, "integerValue")));

                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
                if ((objc_msgSend(v23, "isEqualToString:", v20) & 1) != 0)
                {
                  v24 = v12;
                  v25 = v13;
                  v26 = v9;
                  v27 = v4;
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "port"));

                  v29 = v28 == v22;
                  v4 = v27;
                  v9 = v26;
                  v13 = v25;
                  v12 = v24;
                  v11 = v31;
                  if (v29)
                  {

                    LOBYTE(v5) = 1;
                    goto LABEL_22;
                  }
                }
                else
                {

                }
                v14 = &AnalyticsSendEventLazy_ptr;
              }
            }

            v15 = (char *)v15 + 1;
          }
          while (v11 != v15);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v11);
      }
      LOBYTE(v5) = 0;
LABEL_22:

    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)canIgnoreInvalidCertsOnInternalBuild
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend(objc_alloc((Class)NSPConfiguration), "initFromPreferences");
  if (v2 && os_variant_allows_internal_security_policies("com.apple.networkserviceproxy"))
    v3 = objc_msgSend(v2, "ignoreInvalidCerts");
  else
    v3 = 0;

  return v3;
}

- (BOOL)usesDefaultConfigurationServer
{
  NSPConfiguration *configuration;
  NSPConfiguration *v4;
  void *v5;
  NSPConfigurationManager *configurationManager;
  unsigned int v7;

  if (self)
    configuration = self->_configuration;
  else
    configuration = 0;
  v4 = configuration;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration configServerHost](v4, "configServerHost"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("mask-api.icloud.com")))
  {
    if (self)
      configurationManager = self->_configurationManager;
    else
      configurationManager = 0;
    v7 = !-[NSPConfigurationManager environmentUsesNonDefaultServer](configurationManager, "environmentUsesNonDefaultServer");
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)didUpdateSignificantLocation
{
  NSPConfigurationManager *configurationManager;
  NSPConfigurationManager *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_10000312C;
  v6[4] = sub_100054A8C;
  v7 = (id)os_transaction_create("com.apple.networkserviceproxy.didUpdateSignificantLocation");
  if (self)
    configurationManager = self->_configurationManager;
  else
    configurationManager = 0;
  v4 = configurationManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006DFF0;
  v5[3] = &unk_1000F6170;
  v5[4] = v6;
  -[NSPConfigurationManager refreshConfigurationWithReason:completionHandler:](v4, "refreshConfigurationWithReason:completionHandler:", 7, v5);

  _Block_object_dispose(v6, 8);
}

- (void)didUpdateCountryPlusTimezone:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NSPServer *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v8 = nplog_obj(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ country+timezone updated to [%@]", (uint8_t *)&v10, 0x16u);
  }

  if (self)
    objc_storeStrong((id *)&self->_lastCountryPlusTimezone, a3);
  sub_1000639C4((uint64_t)self);

}

- (void)didUpdateGeohash:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NSPServer *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v8 = nplog_obj(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ Geohash updated to [%@]", (uint8_t *)&v10, 0x16u);
  }

  if (self)
    objc_storeStrong((id *)&self->_lastGeohash, a3);
  sub_1000639C4((uint64_t)self);

}

- (BOOL)isSubscriberUnlimited
{
  if (self)
    self = (NSPServer *)self->_configurationManager;
  return -[NSPServer policyIncludesUnlimited](self, "policyIncludesUnlimited");
}

- (void)requestAccessTokenWithCompletionHandler:(id)a3
{
  sub_10006DC64(self, 0, 0, a3);
}

- (void)networkSignatureChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  nw_endpoint_t host;
  NSObject *v14;
  OS_nw_resolver *v15;
  OS_nw_resolver *dnsProbeResolver;
  OS_nw_resolver *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23[2];
  id location;

  if (self)
  {
    sub_100070324((uint64_t)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfiguration proxyConfiguration](self->_configuration, "proxyConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dnsProbe"));

    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](self->_primaryPhysicalInterfaceEvaluator, "path"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interface"));

      v10 = objc_claimAutoreleasedReturnValue(-[NSObject cInterface](v9, "cInterface"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NWPathEvaluator path](self->_primaryPhysicalInterfaceEvaluator, "path"));
      v12 = objc_msgSend(v11, "status");

      if (v12 == (id)1)
      {
        if (v10)
        {
          host = nw_endpoint_create_host((const char *)objc_msgSend(v4, "UTF8String"), "443");
          v14 = nw_parameters_create();
          nw_parameters_require_interface(v14, v10);
          v15 = (OS_nw_resolver *)nw_resolver_create_with_endpoint(host, v14);
          dnsProbeResolver = self->_dnsProbeResolver;
          self->_dnsProbeResolver = v15;

          objc_initWeak(&location, self);
          v17 = self->_dnsProbeResolver;
          v18 = NPGetInternalQueue(v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100070364;
          v21[3] = &unk_1000F6460;
          objc_copyWeak(v23, &location);
          v22 = v10;
          nw_resolver_set_update_handler(v17, v19, v21);

          objc_destroyWeak(v23);
          objc_destroyWeak(&location);

        }
      }

    }
    else
    {
      v20 = nplog_obj(v5, v6, v7);
      v9 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21[0]) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "No DNS probe configured, ignoring", (uint8_t *)v21, 2u);
      }
    }

  }
}

- (void)disableWiFiNetwork:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  CWFInterface *wifiInterface;
  void *v10;
  CWFInterface *v11;
  CWFInterface *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSPServiceStatusManager *serviceStatusManager;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving preference to disable on Wi-Fi network: %@", buf, 0xCu);
  }

  if (self)
    wifiInterface = self->_wifiInterface;
  else
    wifiInterface = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](wifiInterface, "currentKnownNetworkProfile"));
  objc_msgSend(v10, "setPrivacyProxyEnabled:", 0);
  if (self)
    v11 = self->_wifiInterface;
  else
    v11 = 0;
  v21 = 0;
  v12 = v11;
  -[CWFInterface updateKnownNetworkProfile:properties:error:](v12, "updateKnownNetworkProfile:properties:error:", v10, 0, &v21);
  v13 = v21;

  if (v13)
  {
    v17 = nplog_obj(v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v4;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to save preference to disable on Wi-Fi network %@: %@", buf, 0x16u);
    }

  }
  if (self)
    serviceStatusManager = self->_serviceStatusManager;
  else
    serviceStatusManager = 0;
  -[NSPServiceStatusManager reportDisabledOnWiFiName:](serviceStatusManager, "reportDisabledOnWiFiName:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v20, "wifiDisabled:", 1);

}

- (void)disableCellularNetwork:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  CoreTelephonyClient *cellularClient;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  v7 = nplog_obj(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving preference to disable on cellular network: %@", buf, 0xCu);
  }

  if (!self || (cellularClient = self->_cellularClient) == 0)
  {
    v10 = objc_alloc((Class)CoreTelephonyClient);
    v11 = sub_100054A70(self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v10, "initWithQueue:", v12);
    v14 = v13;
    if (self)
    {
      objc_storeStrong((id *)&self->_cellularClient, v13);

      cellularClient = self->_cellularClient;
    }
    else
    {

      cellularClient = 0;
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007118C;
  v16[3] = &unk_1000F6528;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  -[CoreTelephonyClient getCurrentDataSubscriptionContext:](cellularClient, "getCurrentDataSubscriptionContext:", v16);

}

- (void)disableInterface:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5;
  __CFError *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __CFError *v14;
  __CFError *v15;
  SCPreferencesRef v16;
  uint64_t v17;
  uint64_t v18;
  const __SCPreferences *v19;
  __CFError *v20;
  const __SCNetworkSet *v21;
  uint64_t v22;
  uint64_t v23;
  const __SCNetworkSet *v24;
  const __CFArray *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFArray *v28;
  CFIndex Count;
  CFIndex v30;
  CFIndex v31;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v34;
  CFStringRef BSDName;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSPServiceStatusManager *serviceStatusManager;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  CFErrorRef v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  id v66;
  CFErrorRef Error;
  id v68;
  CFErrorRef v69;
  id v70;
  CFErrorRef v71;
  id v72;
  unsigned int v73;
  uint8_t buf[4];
  CFErrorRef v75;

  v5 = *(_QWORD *)&a5;
  v8 = (__CFError *)a3;
  v9 = a4;
  v12 = nplog_obj(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving preference to disable on interface %@", buf, 0xCu);
  }

  v14 = v8;
  v15 = v14;
  if (!self)
  {

    serviceStatusManager = 0;
    goto LABEL_32;
  }
  v16 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, CFSTR("networkserviceproxy"), 0, kSCPreferencesUseEntitlementAuthorization);
  if (!v16)
  {
    v37 = nplog_obj(0, v17, v18);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v66 = v9;
      Error = SCCopyLastError();
      *(_DWORD *)buf = 138412290;
      v75 = Error;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to create SCPreferences: %@", buf, 0xCu);

      v9 = v66;
    }

    goto LABEL_31;
  }
  v19 = v16;
  v20 = v15;
  v21 = SCNetworkSetCopyCurrent(v19);
  if (!v21)
  {
    v39 = nplog_obj(0, v22, v23);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v68 = v9;
      v69 = SCCopyLastError();
      *(_DWORD *)buf = 138412290;
      v75 = v69;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to get current set: %@", buf, 0xCu);

      v9 = v68;
    }

    goto LABEL_26;
  }
  v24 = v21;
  v25 = SCNetworkSetCopyServices(v21);
  if (!v25)
  {
    v41 = nplog_obj(0, v26, v27);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v70 = v9;
      v71 = SCCopyLastError();
      *(_DWORD *)buf = 138412290;
      v75 = v71;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to copy services: %@", buf, 0xCu);

      v9 = v70;
    }

    CFRelease(v24);
LABEL_26:

    goto LABEL_27;
  }
  v28 = v25;
  v73 = v5;
  Count = CFArrayGetCount(v25);
  if (Count < 1)
  {
    v34 = 0;
    goto LABEL_34;
  }
  v30 = Count;
  v72 = v9;
  v31 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v28, v31);
    if (!SCNetworkServiceGetEnabled(ValueAtIndex))
      goto LABEL_14;
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (!Interface)
      goto LABEL_14;
    v34 = Interface;
    BSDName = SCNetworkInterfaceGetBSDName(Interface);
    v36 = (void *)objc_claimAutoreleasedReturnValue(BSDName);
    if (v36)
    {
      if ((-[__CFError isEqualToString:](v20, "isEqualToString:", v36) & 1) != 0)
        break;
    }

LABEL_14:
    if (v30 == ++v31)
    {
      v34 = 0;
      goto LABEL_16;
    }
  }
  CFRetain(v34);

LABEL_16:
  v9 = v72;
LABEL_34:
  CFRelease(v24);
  CFRelease(v28);

  v5 = v73;
  if (!v34)
  {
LABEL_27:
    v46 = nplog_obj(v43, v44, v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to get interface from preferences", buf, 2u);
    }
    goto LABEL_29;
  }
  v50 = SCNetworkInterfaceSetDisablePrivateRelay(v34, 1);
  if ((_DWORD)v50)
  {
    CFRelease(v34);
    v53 = SCPreferencesCommitChanges(v19);
    if ((_DWORD)v53)
    {
      v56 = SCPreferencesApplyChanges(v19);
      if (!(_DWORD)v56)
      {
        v59 = nplog_obj(v56, v57, v58);
        v47 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v60 = v9;
          v61 = SCCopyLastError();
          *(_DWORD *)buf = 138412290;
          v75 = v61;
          v62 = "Failed to apply SCPreferences: %@";
          goto LABEL_45;
        }
        goto LABEL_29;
      }
    }
    else
    {
      v65 = nplog_obj(v53, v54, v55);
      v47 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v60 = v9;
        v61 = SCCopyLastError();
        *(_DWORD *)buf = 138412290;
        v75 = v61;
        v62 = "Failed to commit SCPreferences: %@";
LABEL_45:
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v62, buf, 0xCu);

        v9 = v60;
      }
LABEL_29:

    }
  }
  else
  {
    v63 = nplog_obj(v50, v51, v52);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v75 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Failed to disable private relay on %{public}@", buf, 0xCu);
    }

    CFRelease(v34);
  }
  CFRelease(v19);
LABEL_31:

  serviceStatusManager = self->_serviceStatusManager;
LABEL_32:
  -[NSPServiceStatusManager reportDisabledOnInterfaceName:displayName:type:](serviceStatusManager, "reportDisabledOnInterfaceName:displayName:type:", v15, v9, v5, v72);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyPolicyHandler sharedHandler](NSPPrivacyProxyPolicyHandler, "sharedHandler"));
  objc_msgSend(v49, "interface:disabled:", v15, 1);

}

- (id)getSavedPrivateCloudComputeEnvironment
{
  if (self)
    self = (NSPServer *)self->_privateCloudComputeEnvironment;
  return self;
}

- (void)updateSavedPrivateCloudComputeEnvironment:(id)a3
{
  id v5;
  NSString *privateCloudComputeEnvironment;
  NSString *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v5 = a3;
  if (self)
    privateCloudComputeEnvironment = self->_privateCloudComputeEnvironment;
  else
    privateCloudComputeEnvironment = 0;
  v7 = privateCloudComputeEnvironment;
  v10 = (unint64_t)v5;
  v8 = v7;
  v9 = (void *)v8;
  if (!(v10 | v8) || v10 && v8 && objc_msgSend((id)v10, "isEqual:", v8))
  {

  }
  else
  {

    if (self)
      objc_storeStrong((id *)&self->_privateCloudComputeEnvironment, a3);
    sub_1000639C4((uint64_t)self);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsProxy, 0);
  objc_storeStrong((id *)&self->_privateCloudComputeEnvironment, 0);
  objc_storeStrong((id *)&self->_lastCountryPlusTimezone, 0);
  objc_storeStrong((id *)&self->_lastGeohash, 0);
  objc_storeStrong((id *)&self->_toggleStatsTimer, 0);
  objc_storeStrong((id *)&self->_toggleStats, 0);
  objc_storeStrong((id *)&self->_linkQualityMonitoringSource, 0);
  objc_storeStrong((id *)&self->_lastConfigOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_lastCaptiveOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_captiveEvaluationRetryTimer, 0);
  objc_storeStrong((id *)&self->_serverFlowDivert, 0);
  objc_storeStrong((id *)&self->_tokenFetchListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_termSource, 0);
  objc_storeStrong((id *)&self->_odohAuthOutageRestoreDate, 0);
  objc_storeStrong((id *)&self->_trialNotificationToken, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_odohOutageRestoreDate, 0);
  objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0);
  objc_storeStrong((id *)&self->_odohManager, 0);
  objc_storeStrong((id *)&self->_odohAuthOutageRestoreTimer, 0);
  objc_storeStrong((id *)&self->_odohOutageRestoreTimer, 0);
  objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0);
  objc_storeStrong((id *)&self->_subscriptionCheckRetryDate, 0);
  objc_storeStrong((id *)&self->_subscriptionCheckRetryTimer, 0);
  objc_storeStrong((id *)&self->_featureChangeToken, 0);
  objc_storeStrong((id *)&self->_cellularClient, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_dnsProbeResolver, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_captiveEvaluatedSSID, 0);
  objc_storeStrong((id *)&self->_primaryInterface, 0);
  objc_storeStrong((id *)&self->_interfacesBeingChecked, 0);
  objc_storeStrong((id *)&self->_serviceStatusManager, 0);
  objc_storeStrong((id *)&self->_privacyProxyAgentManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_currentCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
