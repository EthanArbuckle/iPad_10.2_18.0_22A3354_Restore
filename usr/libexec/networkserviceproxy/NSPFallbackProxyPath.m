@implementation NSPFallbackProxyPath

- (void)setupSingleHopProxyRegistrations
{
  void *v3;
  NSPPrivacyProxySingleHopFallbackNetworkRegistration *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));

  if (!v3)
  {
    v4 = [NSPPrivacyProxySingleHopFallbackNetworkRegistration alloc];
    v5 = (void *)(-[NSPProxyPath forceFallback](self, "forceFallback")
                ? objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager singleHopProxyAgentUUID](NSPPrivacyProxyAgentManager, "singleHopProxyAgentUUID")): objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager singleHopFallbackProxyAgentUUID](NSPPrivacyProxyAgentManager, "singleHopFallbackProxyAgentUUID")));
    v6 = v5;
    v7 = sub_100045C4C((id *)&v4->super.super.isa, v5, self);
    -[NSPProxyPath setSingleHopRegistration:](self, "setSingleHopRegistration:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    if (!v8)
    {
      v12 = nplog_obj(v9, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = 136315138;
        v15 = "-[NSPFallbackProxyPath setupSingleHopProxyRegistrations]";
        _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null self.singleHopRegistration", (uint8_t *)&v14, 0xCu);
      }

    }
  }
}

- (void)setupMultiHopProxyRegistrations
{
  void *v3;
  NSPPrivacyProxyMultiHopFallbackNetworkRegistration *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));

  if (!v3)
  {
    v4 = [NSPPrivacyProxyMultiHopFallbackNetworkRegistration alloc];
    v5 = (void *)(-[NSPProxyPath forceFallback](self, "forceFallback")
                ? objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager multiHopProxyAgentUUID](NSPPrivacyProxyAgentManager, "multiHopProxyAgentUUID")): objc_claimAutoreleasedReturnValue(+[NSPPrivacyProxyAgentManager multiHopFallbackProxyAgentUUID](NSPPrivacyProxyAgentManager, "multiHopFallbackProxyAgentUUID")));
    v6 = v5;
    v7 = sub_1000451D4((id *)&v4->super.super.isa, v5, self);
    -[NSPProxyPath setMultiHopRegistration:](self, "setMultiHopRegistration:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
    if (!v8)
    {
      v12 = nplog_obj(v9, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = 136315138;
        v15 = "-[NSPFallbackProxyPath setupMultiHopProxyRegistrations]";
        _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null self.multiHopRegistration", (uint8_t *)&v14, 0xCu);
      }

    }
  }
}

- (void)resetSingleHopProxyAgent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  id v24;
  unsigned int v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  _BOOL4 v49;
  int v50;
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
  uint8_t buf[4];
  const char *v65;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (v3)
  {
    -[NSPFallbackProxyPath setupSingleHopProxyRegistrations](self, "setupSingleHopProxyRegistrations");
    v7 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v8 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v61 = (void *)v8;
    if (v8)
      v9 = *(void **)(v8 + 24);
    else
      v9 = 0;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tcpProxyFqdn"));
    v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v59 = (void *)v12;
    if (v12)
      v13 = *(void **)(v12 + 24);
    else
      v13 = 0;
    v14 = v13;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "proxyKeyInfos"));
    v15 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v56 = (void *)v15;
    if (v15)
      v16 = *(void **)(v15 + 24);
    else
      v16 = 0;
    v17 = v16;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "proxyVersion"));
    v18 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v54 = (void *)v18;
    if (v18)
      v19 = *(void **)(v18 + 24);
    else
      v19 = 0;
    v20 = v19;
    v21 = objc_msgSend(v20, "supportsResumption");
    v22 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v60 = v10;
    v52 = (void *)v22;
    v50 = v21;
    if (v22)
      v23 = *(void **)(v22 + 24);
    else
      v23 = 0;
    v24 = v23;
    v25 = objc_msgSend(v24, "algorithm");
    v26 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v27 = sub_10000B9B4(v26);
    v58 = v14;
    if (v27)
    {
      v28 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
      v47 = (void *)v28;
      if (v28)
        v29 = *(void **)(v28 + 48);
      else
        v29 = 0;
      v48 = v29;
    }
    else
    {
      v48 = 0;
    }
    v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v31 = (void *)v30;
    v55 = v17;
    v53 = v20;
    v51 = (void *)v26;
    v49 = v27;
    v32 = (void *)v7;
    if (v30)
      v33 = *(void **)(v30 + 24);
    else
      v33 = 0;
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tokenChallenge"));
    v36 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
    sub_100045C68((uint64_t)v32, v11, v57, v62, v50, v25 == 2, v48, v35 != 0, v36, v37);

    if (v49)
    {

    }
    v38 = -[NSPProxyPath singleHopRegistered](self, "singleHopRegistered");
    v39 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    if (v39)
    {
      v40 = (void *)v39;
      v41 = objc_msgSend(*(id *)(v39 + 24), "isRegistered");

      if (v38 == v41)
        return;
    }
    else if ((v38 & 1) == 0)
    {
      return;
    }
    v42 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath singleHopRegistration](self, "singleHopRegistration"));
    v43 = (void *)v42;
    if (v42)
      v44 = objc_msgSend(*(id *)(v42 + 24), "isRegistered");
    else
      v44 = 0;
    -[NSPProxyPath setSingleHopRegistered:](self, "setSingleHopRegistered:", v44);

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
    objc_msgSend(v63, "singleHopAgentRegistered:", self);

  }
  else
  {
    v45 = nplog_obj(v4, v5, v6);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v65 = "-[NSPFallbackProxyPath resetSingleHopProxyAgent]";
      _os_log_fault_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "%s called with null self.ingressProxy", buf, 0xCu);
    }

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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
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
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  char v81;
  char v82;
  void *v83;
  unsigned __int8 v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  _BOOL4 v93;
  void *v94;
  char v95;
  _BOOL4 v96;
  char v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
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
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint8_t buf[4];
  const char *v135;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));

  if (!v3)
  {
    v75 = nplog_obj(v4, v5, v6);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    {
LABEL_55:

      return;
    }
    *(_DWORD *)buf = 136315138;
    v135 = "-[NSPFallbackProxyPath resetMultiHopProxyAgent]";
    v77 = "%s called with null self.ingressProxy";
LABEL_58:
    _os_log_fault_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_FAULT, v77, buf, 0xCu);
    goto LABEL_55;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));

  if (!v7)
  {
    v78 = nplog_obj(v8, v9, v10);
    v76 = objc_claimAutoreleasedReturnValue(v78);
    if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
      goto LABEL_55;
    *(_DWORD *)buf = 136315138;
    v135 = "-[NSPFallbackProxyPath resetMultiHopProxyAgent]";
    v77 = "%s called with null self.egressProxy";
    goto LABEL_58;
  }
  -[NSPFallbackProxyPath setupMultiHopProxyRegistrations](self, "setupMultiHopProxyRegistrations");
  v11 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  v12 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v125 = (void *)v12;
  if (v12)
    v13 = *(void **)(v12 + 24);
  else
    v13 = 0;
  v14 = v13;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tcpProxyFqdn"));
  v16 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v131 = (void *)v15;
  v123 = (void *)v16;
  if (v16)
    v17 = *(void **)(v16 + 24);
  else
    v17 = 0;
  v18 = v17;
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tcpProxyFqdn"));
  v20 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v121 = (void *)v19;
  v122 = v18;
  v120 = (void *)v20;
  if (v20)
    v21 = *(void **)(v20 + 24);
  else
    v21 = 0;
  v22 = v21;
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "proxyKeyInfos"));
  v24 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v117 = (void *)v24;
  if (v24)
    v25 = *(void **)(v24 + 24);
  else
    v25 = 0;
  v26 = v25;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "proxyKeyInfos"));
  v28 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v114 = (void *)v28;
  if (v28)
    v29 = *(void **)(v28 + 24);
  else
    v29 = 0;
  v113 = v29;
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "proxyVersion"));
  v30 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v112 = (void *)v30;
  if (v30)
    v31 = *(void **)(v30 + 24);
  else
    v31 = 0;
  v111 = v31;
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "proxyVersion"));
  v32 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v110 = (void *)v32;
  if (v32)
    v33 = *(void **)(v32 + 24);
  else
    v33 = 0;
  v109 = v33;
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "allowedNextHops"));
  v34 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v108 = (void *)v34;
  if (v34)
    v35 = *(void **)(v34 + 24);
  else
    v35 = 0;
  v107 = v35;
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "allowedNextHops"));
  v36 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v106 = (void *)v36;
  if (v36)
    v37 = *(void **)(v36 + 24);
  else
    v37 = 0;
  v105 = v37;
  v97 = objc_msgSend(v105, "supportsResumption");
  v38 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v104 = (void *)v38;
  if (v38)
    v39 = *(void **)(v38 + 24);
  else
    v39 = 0;
  v103 = v39;
  v95 = objc_msgSend(v103, "supportsResumption");
  v40 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v102 = (void *)v40;
  v41 = (void *)v11;
  if (v40)
    v42 = *(void **)(v40 + 24);
  else
    v42 = 0;
  v101 = v42;
  v43 = objc_msgSend(v101, "algorithm");
  v44 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v100 = (void *)v44;
  if (v44)
    v45 = *(void **)(v44 + 24);
  else
    v45 = 0;
  v99 = v45;
  v46 = objc_msgSend(v99, "algorithm");
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v96 = sub_10000B9B4((uint64_t)v98);
  if (v96)
  {
    v47 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
    v80 = (void *)v47;
    if (v47)
      v48 = *(void **)(v47 + 48);
    else
      v48 = 0;
    v126 = v48;
  }
  else
  {
    v126 = 0;
  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v93 = sub_10000B9B4((uint64_t)v94);
  if (v93)
  {
    v49 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
    v79 = (void *)v49;
    if (v49)
      v50 = *(void **)(v49 + 48);
    else
      v50 = 0;
    v92 = v50;
  }
  else
  {
    v92 = 0;
  }
  v51 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v91 = (void *)v51;
  if (v51)
    v52 = *(void **)(v51 + 24);
  else
    v52 = 0;
  v90 = v52;
  v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "tokenChallenge"));
  v54 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath egressProxy](self, "egressProxy"));
  v124 = v14;
  v119 = v22;
  v89 = (void *)v54;
  if (v54)
    v55 = *(void **)(v54 + 24);
  else
    v55 = 0;
  v88 = v55;
  v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "tokenChallenge"));
  v84 = -[NSPProxyPath allowFailOpen](self, "allowFailOpen");
  v82 = -[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled");
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "geohashOverride"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  v81 = objc_msgSend(v85, "dnsFilteringHintEnabled");
  v57 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath ingressProxy](self, "ingressProxy"));
  v58 = (void *)v57;
  v132 = v41;
  v118 = (void *)v23;
  v115 = (void *)v27;
  v116 = v26;
  if (v57)
    v59 = *(void **)(v57 + 24);
  else
    v59 = 0;
  v60 = v56 != 0;
  v83 = (void *)v56;
  v61 = (void *)v53;
  v62 = v53 != 0;
  v63 = v46 == 2;
  v64 = v43 == 2;
  v65 = v59;
  v66 = objc_msgSend(v65, "fallbackSupportsUDPProxying");
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath configEpoch](self, "configEpoch"));
  sub_1000451F0((uint64_t)v132, v131, v121, v118, v115, v130, v129, v128, v127, v97, v95, v64, v63, v126, v92, v62, v60, v84, v82,
    v86,
    v81,
    v66,
    v67);

  if (v93)
  {

  }
  if (v96)
  {

  }
  v68 = -[NSPProxyPath multiHopRegistered](self, "multiHopRegistered");
  v69 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  if (v69)
  {
    v70 = (void *)v69;
    v71 = objc_msgSend(*(id *)(v69 + 24), "isRegistered");

    if (v68 == v71)
      return;
  }
  else if ((v68 & 1) == 0)
  {
    return;
  }
  v72 = objc_claimAutoreleasedReturnValue(-[NSPProxyPath multiHopRegistration](self, "multiHopRegistration"));
  v73 = (void *)v72;
  if (v72)
    v74 = objc_msgSend(*(id *)(v72 + 24), "isRegistered");
  else
    v74 = 0;
  -[NSPProxyPath setMultiHopRegistered:](self, "setMultiHopRegistered:", v74);

  v133 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyPath delegate](self, "delegate"));
  objc_msgSend(v133, "multiHopAgentRegistered:", self);

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
  v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:](NSPPrivacyProxyAgentManager, "proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:", v7, v6, v11, v15, -[NSPProxyPath proxyPathWeight](self, "proxyPathWeight"), 1);

  return v16;
}

@end
