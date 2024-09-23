@implementation NSPQuicProxyPath

- (NSPQuicProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13
{
  _BOOL8 v13;
  _BOOL8 v14;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSPQuicProxyPath *v28;
  NSPQuicProxyPath *v29;
  NSPQuicProxyPath *v30;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  int v36;
  objc_super v37;
  uint8_t buf[4];
  const char *v39;

  v13 = a8;
  v14 = a7;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a12;
  v23 = a13;
  v27 = v23;
  if (!v20)
  {
    v32 = nplog_obj(v23, v24, v25, v26);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v30 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v39 = "-[NSPQuicProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forc"
          "eFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v34 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, v34, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v21)
  {
    v35 = nplog_obj(v23, v24, v25, v26);
    v33 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v39 = "-[NSPQuicProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forc"
          "eFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v34 = "%s called with null egressProxy";
    goto LABEL_12;
  }
  v37.receiver = self;
  v37.super_class = (Class)NSPQuicProxyPath;
  *(_WORD *)((char *)&v36 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v36) = a9;
  v28 = -[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:](&v37, "initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFallback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:", v19, v20, v21, a6, v14, v13, v36, v22, v23);
  v29 = v28;
  if (v28)
    objc_storeWeak((id *)&v28->_quicProxyPathDelegate, v19);
  self = v29;
  v30 = self;
LABEL_6:

  return v30;
}

- (void)setupSingleHopProxyRegistrations
{
  void *v3;
  NSPPrivacyProxySingleHopNetworkRegistration *v4;
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));

  if (!v3)
  {
    v4 = [NSPPrivacyProxySingleHopNetworkRegistration alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager singleHopProxyAgentUUID](NSPPrivacyProxyAgentManager, "singleHopProxyAgentUUID"));
    v6 = sub_100044438((id *)&v4->super.super.isa, v5, self);
    -[NSPProxyPath setSingleHopRegistration:](self, "setSingleHopRegistration:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    if (!v7)
    {
      v11 = nplog_obj(v8, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v13 = 136315138;
        v14 = "-[NSPQuicProxyPath setupSingleHopProxyRegistrations]";
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s called with null self.singleHopRegistration", (uint8_t *)&v13, 0xCu);
      }

    }
  }
}

- (void)setupMultiHopProxyRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSPPrivacyProxyMultiHopNetworkRegistration *v7;
  id *v8;
  id *v9;
  void *v10;
  id *v11;
  NSPPrivacyProxyMultiHopNetworkRegistration *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const char *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));

  if (!v3)
  {
    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));

      if (!v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        -[NSPProxyPath setNonDefaultAgentUUID:](self, "setNonDefaultAgentUUID:", v5);

      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
      v7 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v8 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
      v9 = v8;
      if (v8)
        v8 = (id *)v8[3];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vendor"));
      v11 = sub_100042190((id *)&v7->super.super.isa, v6, 0, v10, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v11);

    }
    else
    {
      v12 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID](NSPPrivacyProxyAgentManager, "multiHopProxyAgentUUID"));
      v9 = sub_1000436D0((id *)&v12->super.super.isa, v6, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v9);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (!v13)
    {
      v17 = nplog_obj(v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v19 = 136315138;
        v20 = "-[NSPQuicProxyPath setupMultiHopProxyRegistrations]";
        _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%s called with null self.multiHopRegistration", (uint8_t *)&v19, 0xCu);
      }

    }
  }
}

- (void)setupNetworkSpecificMultiHopProxyRegistrations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSPPrivacyProxyMultiHopNetworkRegistration *v9;
  id *v10;
  id *v11;
  void *v12;
  id *v13;
  NSPPrivacyProxyMultiHopNetworkRegistration *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  unsigned int v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  char v70;
  char v71;
  char v72;
  id v73;
  char v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  void *v78;
  unsigned int v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  char v91;
  char v92;
  unsigned __int8 v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  _BOOL4 v103;
  void *v104;
  char v105;
  _BOOL4 v106;
  char v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint8_t buf[4];
  const char *v146;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));

  if (!v5)
  {
    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));

      if (!v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        -[NSPProxyPath setNonDefaultAgentUUID:](self, "setNonDefaultAgentUUID:", v7);

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath nonDefaultAgentUUID](self, "nonDefaultAgentUUID"));
      v9 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v10 = (id *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      v11 = v10;
      if (v10)
        v10 = (id *)v10[3];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vendor"));
      v13 = sub_100042190((id *)&v9->super.super.isa, v8, v4, v12, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v13);

    }
    else
    {
      v14 = [NSPPrivacyProxyMultiHopNetworkRegistration alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID](NSPPrivacyProxyAgentManager, "multiHopProxyAgentUUID"));
      v11 = sub_1000436D0((id *)&v14->super.super.isa, v8, self);
      -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v11);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (!v15)
    {
      v88 = nplog_obj(v16, v17, v18);
      v85 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v146 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
        v86 = "%s called with null self.multiHopRegistration";
        goto LABEL_72;
      }
      goto LABEL_73;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v19)
  {
    v84 = nplog_obj(v20, v21, v22);
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v146 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
      v86 = "%s called with null self.ingressProxy";
LABEL_72:
      _os_log_fault_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_FAULT, v86, buf, 0xCu);
    }
LABEL_73:

    goto LABEL_65;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));

  if (!v23)
  {
    v87 = nplog_obj(v24, v25, v26);
    v85 = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v146 = "-[NSPQuicProxyPath setupNetworkSpecificMultiHopProxyRegistrations:]";
      v86 = "%s called with null self.egressProxy";
      goto LABEL_72;
    }
    goto LABEL_73;
  }
  if (-[NSPProxyPath allowFallback](self, "allowFallback"))
  {
    v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID](NSPPrivacyProxyAgentManager, "multiHopFallbackProxyAgentUUID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "multiHopFallbackProxyConfigHash:", self));

  }
  else
  {
    v143 = 0;
    v144 = 0;
  }
  v28 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  v29 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v135 = (void *)v29;
  if (v29)
    v30 = *(void **)(v29 + 24);
  else
    v30 = 0;
  v134 = v30;
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "proxyURL"));
  v31 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v132 = (void *)v31;
  if (v31)
    v32 = *(void **)(v31 + 24);
  else
    v32 = 0;
  v131 = v32;
  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "proxyURL"));
  v34 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v129 = (void *)v34;
  if (v34)
    v35 = *(void **)(v34 + 24);
  else
    v35 = 0;
  v128 = v35;
  v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "proxyKeyInfos"));
  v37 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v126 = (void *)v37;
  if (v37)
    v38 = *(void **)(v37 + 24);
  else
    v38 = 0;
  v125 = v38;
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "proxyKeyInfos"));
  v39 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v124 = (void *)v39;
  if (v39)
    v40 = *(void **)(v39 + 24);
  else
    v40 = 0;
  v123 = v40;
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "proxyVersion"));
  v41 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v122 = (void *)v41;
  if (v41)
    v42 = *(void **)(v41 + 24);
  else
    v42 = 0;
  v121 = v42;
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "proxyVersion"));
  v43 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v120 = (void *)v43;
  if (v43)
    v44 = *(void **)(v43 + 24);
  else
    v44 = 0;
  v119 = v44;
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "allowedNextHops"));
  v45 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v118 = (void *)v45;
  if (v45)
    v46 = *(void **)(v45 + 24);
  else
    v46 = 0;
  v117 = v46;
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "allowedNextHops"));
  v47 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v116 = (void *)v47;
  if (v47)
    v48 = *(void **)(v47 + 24);
  else
    v48 = 0;
  v115 = v48;
  v107 = objc_msgSend(v115, "supportsResumption");
  v49 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v114 = (void *)v49;
  if (v49)
    v50 = *(void **)(v49 + 24);
  else
    v50 = 0;
  v113 = v50;
  v105 = objc_msgSend(v113, "supportsResumption");
  v51 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v112 = (void *)v51;
  if (v51)
    v52 = *(void **)(v51 + 24);
  else
    v52 = 0;
  v111 = v52;
  v53 = objc_msgSend(v111, "algorithm");
  v54 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v110 = (void *)v54;
  if (v54)
    v55 = *(void **)(v54 + 24);
  else
    v55 = 0;
  v109 = v55;
  v56 = objc_msgSend(v109, "algorithm");
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v106 = sub_10000B9B4((uint64_t)v108);
  if (v106)
  {
    v57 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v90 = (void *)v57;
    if (v57)
      v58 = *(void **)(v57 + 48);
    else
      v58 = 0;
    v137 = v58;
  }
  else
  {
    v137 = 0;
  }
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v103 = sub_10000B9B4((uint64_t)v104);
  if (v103)
  {
    v59 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v89 = (void *)v59;
    if (v59)
      v60 = *(void **)(v59 + 48);
    else
      v60 = 0;
    v102 = v60;
  }
  else
  {
    v102 = 0;
  }
  v61 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v101 = (void *)v61;
  if (v61)
    v62 = *(void **)(v61 + 24);
  else
    v62 = 0;
  v100 = v62;
  v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "tokenChallenge"));
  v64 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v99 = (void *)v64;
  if (v64)
    v65 = *(void **)(v64 + 24);
  else
    v65 = 0;
  v98 = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "tokenChallenge"));
  v93 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
  v92 = -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled");
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "geohashOverride"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  v91 = objc_msgSend(v95, "dnsFilteringHintEnabled");
  v67 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v68 = (void *)v67;
  v136 = (void *)v28;
  v130 = (void *)v33;
  v127 = (void *)v36;
  if (v67)
    v69 = *(void **)(v67 + 24);
  else
    v69 = 0;
  v94 = (void *)v63;
  v70 = v63 != 0;
  v71 = v56 == 2;
  v72 = v53 == 2;
  v73 = v69;
  v74 = objc_msgSend(v73, "fallbackSupportsUDPProxying");
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  sub_1000436EC((uint64_t)v136, v133, v130, v127, v142, v141, v140, v139, v138, v107, v105, v72, v71, v137, v102, v70, v66 != 0, v144, v93,
    v92,
    v96,
    v91,
    0,
    0,
    v143,
    v74,
    v75);

  if (v103)
  {

  }
  if (v106)
  {

  }
  v76 = -[NSPProxyPath multiHopRegistered](self, "multiHopRegistered");
  v77 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  if (v77)
  {
    v78 = (void *)v77;
    v79 = objc_msgSend(*(id *)(v77 + 24), "isRegistered");

    if (v76 != v79)
    {
LABEL_61:
      v80 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
      v81 = (void *)v80;
      if (v80)
        v82 = objc_msgSend(*(id *)(v80 + 24), "isRegistered");
      else
        v82 = 0;
      -[NSPProxyPath setMultiHopRegistered:](self, "setMultiHopRegistered:", v82);

      v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
      objc_msgSend(v83, "multiHopAgentRegistered:", self);

    }
  }
  else if ((v76 & 1) != 0)
  {
    goto LABEL_61;
  }

LABEL_65:
}

- (void)tearDownMultiHopRegistration
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  sub_100043354((uint64_t)v2);

}

- (void)resetSingleHopProxyAgent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  id v28;
  unsigned int v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  unsigned __int8 v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  _BOOL4 v59;
  int v60;
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
  uint8_t buf[4];
  const char *v76;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (v3)
  {
    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
      return;
    -[NSPQuicProxyPath setupSingleHopProxyRegistrations](self, "setupSingleHopProxyRegistrations");
    if (-[NSPProxyPath allowFallback](self, "allowFallback"))
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentUUID](NSPPrivacyProxyAgentManager, "singleHopFallbackProxyAgentUUID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "singleHopFallbackProxyConfigHash:", self));

    }
    else
    {
      v74 = 0;
      v72 = 0;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v9 = sub_1000435D4((uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v71 = (void *)v12;
    if (v12)
      v13 = *(void **)(v12 + 24);
    else
      v13 = 0;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyURL"));
    v16 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v69 = (void *)v16;
    if (v16)
      v17 = *(void **)(v16 + 24);
    else
      v17 = 0;
    v18 = v17;
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "proxyKeyInfos"));
    v19 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v67 = (void *)v19;
    if (v19)
      v20 = *(void **)(v19 + 24);
    else
      v20 = 0;
    v21 = v20;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "proxyVersion"));
    v22 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v58 = (void *)v10;
    v65 = (void *)v22;
    if (v22)
      v23 = *(void **)(v22 + 24);
    else
      v23 = 0;
    v24 = v23;
    v25 = objc_msgSend(v24, "supportsResumption");
    v26 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v70 = v14;
    v63 = (void *)v26;
    v60 = v25;
    if (v26)
      v27 = *(void **)(v26 + 24);
    else
      v27 = 0;
    v28 = v27;
    v29 = objc_msgSend(v28, "algorithm");
    v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v31 = sub_10000B9B4(v30);
    v66 = v21;
    if (v31)
    {
      v32 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      v56 = (void *)v32;
      if (v32)
        v33 = *(void **)(v32 + 48);
      else
        v33 = 0;
      v57 = v33;
    }
    else
    {
      v57 = 0;
    }
    v34 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v35 = (void *)v34;
    v64 = v24;
    v61 = (void *)v30;
    v62 = v28;
    v59 = v31;
    v36 = (void *)v11;
    if (v34)
      v37 = *(void **)(v34 + 24);
    else
      v37 = 0;
    v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "tokenChallenge"));
    v40 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
    sub_100044454((uint64_t)v36, v15, v68, v73, v60, v29 == 2, v57, v39 != 0, v72, v40, v74, v41);

    if (v59)
    {

    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v43 = sub_1000435D4((uint64_t)v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

    v45 = -[NSPProxyPath singleHopRegistered](self, "singleHopRegistered");
    v46 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v47 = (void *)v46;
    if (v46)
    {
      v48 = v58;
      if (v45 != objc_msgSend(*(id *)(v46 + 24), "isRegistered"))
      {
LABEL_27:

        goto LABEL_39;
      }
    }
    else
    {
      v48 = v58;
      if ((v45 & 1) != 0)
        goto LABEL_27;
    }
    v51 = objc_msgSend(v44, "isEqualToData:", v48);

    if ((v51 & 1) != 0)
    {
LABEL_42:

      return;
    }
LABEL_39:
    v52 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v53 = (void *)v52;
    if (v52)
      v54 = objc_msgSend(*(id *)(v52 + 24), "isRegistered");
    else
      v54 = 0;
    -[NSPProxyPath setSingleHopRegistered:](self, "setSingleHopRegistered:", v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    objc_msgSend(v55, "singleHopAgentRegistered:", self);

    goto LABEL_42;
  }
  v49 = nplog_obj(v4, v5, v6);
  v50 = objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v76 = "-[NSPQuicProxyPath resetSingleHopProxyAgent]";
    _os_log_fault_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_FAULT, "%s called with null self.ingressProxy", buf, 0xCu);
  }

}

- (void)resetMultiHopProxyAgent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  char v63;
  char v64;
  id v65;
  char v66;
  void *v67;
  unsigned int v68;
  uint64_t v69;
  void *v70;
  unsigned int v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  char v86;
  unsigned __int8 v87;
  unsigned int v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  _BOOL4 v96;
  void *v97;
  char v98;
  char v99;
  _BOOL4 v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint8_t buf[4];
  const char *v140;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v3)
  {
    v76 = nplog_obj(v4, v5, v6);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
      goto LABEL_72;
    *(_DWORD *)buf = 136315138;
    v140 = "-[NSPQuicProxyPath resetMultiHopProxyAgent]";
    v78 = "%s called with null self.ingressProxy";
LABEL_74:
    _os_log_fault_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_FAULT, v78, buf, 0xCu);
    goto LABEL_72;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));

  if (v7)
  {
    -[NSPQuicProxyPath setupMultiHopProxyRegistrations](self, "setupMultiHopProxyRegistrations");
    if (-[NSPProxyPath allowFallback](self, "allowFallback"))
    {
      if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
      {
        v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID](NSPPrivacyProxyAgentManager, "multiHopProxyAgentUUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "multiHopQUICProxyConfigHash:", self));
      }
      else
      {
        v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID](NSPPrivacyProxyAgentManager, "multiHopFallbackProxyAgentUUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "multiHopFallbackProxyConfigHash:", self));
      }
      v129 = (void *)v12;

    }
    else
    {
      v128 = 0;
      v129 = 0;
    }
    if (-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC"))
    {
      v138 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPQuicProxyPath quicProxyPathDelegate](self, "quicProxyPathDelegate"));
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alternatePreferredPathAgentUUIDs:", self));

    }
    v14 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    v15 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v125 = (void *)v15;
    v95 = (void *)v14;
    if (v15)
      v16 = *(void **)(v15 + 24);
    else
      v16 = 0;
    v17 = v16;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "proxyURL"));
    v19 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v123 = (void *)v19;
    if (v19)
      v20 = *(void **)(v19 + 24);
    else
      v20 = 0;
    v21 = v20;
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "proxyURL"));
    v23 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v121 = (void *)v23;
    v122 = (void *)v22;
    if (v23)
      v24 = *(void **)(v23 + 24);
    else
      v24 = 0;
    v25 = v24;
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "proxyKeyInfos"));
    v27 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v118 = (void *)v27;
    if (v27)
      v28 = *(void **)(v27 + 24);
    else
      v28 = 0;
    v29 = v28;
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "proxyKeyInfos"));
    v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v116 = (void *)v30;
    if (v30)
      v31 = *(void **)(v30 + 24);
    else
      v31 = 0;
    v32 = v31;
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "proxyVersion"));
    v33 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v115 = (void *)v33;
    if (v33)
      v34 = *(void **)(v33 + 24);
    else
      v34 = 0;
    v114 = v34;
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "proxyVersion"));
    v35 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v113 = (void *)v35;
    if (v35)
      v36 = *(void **)(v35 + 24);
    else
      v36 = 0;
    v112 = v36;
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "allowedNextHops"));
    v37 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v111 = (void *)v37;
    if (v37)
      v38 = *(void **)(v37 + 24);
    else
      v38 = 0;
    v110 = v38;
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "allowedNextHops"));
    v39 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v109 = (void *)v39;
    if (v39)
      v40 = *(void **)(v39 + 24);
    else
      v40 = 0;
    v108 = v40;
    v99 = objc_msgSend(v108, "supportsResumption");
    v41 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v107 = (void *)v41;
    if (v41)
      v42 = *(void **)(v41 + 24);
    else
      v42 = 0;
    v106 = v42;
    v98 = objc_msgSend(v106, "supportsResumption");
    v43 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v105 = (void *)v43;
    v44 = (void *)v18;
    if (v43)
      v45 = *(void **)(v43 + 24);
    else
      v45 = 0;
    v104 = v45;
    v46 = objc_msgSend(v104, "algorithm");
    v47 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v103 = (void *)v47;
    if (v47)
      v48 = *(void **)(v47 + 24);
    else
      v48 = 0;
    v102 = v48;
    v49 = objc_msgSend(v102, "algorithm");
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v100 = sub_10000B9B4((uint64_t)v101);
    if (v100)
    {
      v50 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      v83 = (void *)v50;
      if (v50)
        v51 = *(void **)(v50 + 48);
      else
        v51 = 0;
      v127 = v51;
    }
    else
    {
      v127 = 0;
    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v96 = sub_10000B9B4((uint64_t)v97);
    if (v96)
    {
      v52 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
      v82 = (void *)v52;
      if (v52)
        v53 = *(void **)(v52 + 48);
      else
        v53 = 0;
      v126 = v53;
    }
    else
    {
      v126 = 0;
    }
    v54 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v94 = (void *)v54;
    if (v54)
      v55 = *(void **)(v54 + 24);
    else
      v55 = 0;
    v93 = v55;
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "tokenChallenge"));
    v56 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v92 = (void *)v56;
    if (v56)
      v57 = *(void **)(v56 + 24);
    else
      v57 = 0;
    v91 = v57;
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "tokenChallenge"));
    v87 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
    v86 = -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled");
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "geohashOverride"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    v84 = objc_msgSend(v89, "dnsFilteringHintEnabled");
    v88 = -[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC");
    v120 = v25;
    if (v88)
    {
      v58 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
      v81 = (void *)v58;
      if (v58)
        v59 = *(void **)(v58 + 24);
      else
        v59 = 0;
      v80 = v59;
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "preferredPathPatterns"));
    }
    else
    {
      v85 = 0;
    }
    v60 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v61 = (void *)v60;
    v124 = v17;
    v119 = (void *)v26;
    v117 = v29;
    if (v60)
      v62 = *(void **)(v60 + 24);
    else
      v62 = 0;
    v63 = v49 == 2;
    v64 = v46 == 2;
    v65 = v62;
    v66 = objc_msgSend(v65, "fallbackSupportsUDPProxying");
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
    sub_1000436EC((uint64_t)v95, v44, v122, v119, v137, v136, v135, v134, v133, v99, v98, v64, v63, v127, v126, v132 != 0, v131 != 0, v128, v87,
      v86,
      v130,
      v84,
      v85,
      v138,
      v129,
      v66,
      v67);

    if (v88)
    {

    }
    if (v96)
    {

    }
    if (v100)
    {

    }
    v68 = -[NSPProxyPath multiHopRegistered](self, "multiHopRegistered");
    v69 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (v69)
    {
      v70 = (void *)v69;
      v71 = objc_msgSend(*(id *)(v69 + 24), "isRegistered");

      if (v68 != v71)
      {
LABEL_65:
        v72 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
        v73 = (void *)v72;
        if (v72)
          v74 = objc_msgSend(*(id *)(v72 + 24), "isRegistered");
        else
          v74 = 0;
        -[NSPProxyPath setMultiHopRegistered:](self, "setMultiHopRegistered:", v74);

        v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
        objc_msgSend(v75, "multiHopAgentRegistered:", self);

      }
    }
    else if ((v68 & 1) != 0)
    {
      goto LABEL_65;
    }

    return;
  }
  v79 = nplog_obj(v8, v9, v10);
  v77 = objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v140 = "-[NSPQuicProxyPath resetMultiHopProxyAgent]";
    v78 = "%s called with null self.egressProxy";
    goto LABEL_74;
  }
LABEL_72:

}

- (void)enableFallback:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NSPProxyPath allowFallback](self, "allowFallback") != a3)
  {
    -[NSPProxyPath setAllowFallback:](self, "setAllowFallback:", v3);
    -[NSPQuicProxyPath resetSingleHopProxyAgent](self, "resetSingleHopProxyAgent");
    -[NSPQuicProxyPath resetMultiHopProxyAgent](self, "resetMultiHopProxyAgent");
  }
}

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v9 = (void *)v8;
  if (v8)
    v10 = *(void **)(v8 + 24);
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v13 = (void *)v12;
  if (v12)
    v14 = *(void **)(v12 + 24);
  else
    v14 = 0;
  v15 = v14;
  v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:](NSPPrivacyProxyAgentManager, "proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:", v7, v6, v11, v15, -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"), 0);

  return v16;
}

- (NSPQUICProxyPathDelegate)quicProxyPathDelegate
{
  return (NSPQUICProxyPathDelegate *)objc_loadWeakRetained((id *)&self->_quicProxyPathDelegate);
}

- (void)setQuicProxyPathDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_quicProxyPathDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_quicProxyPathDelegate);
}

@end
