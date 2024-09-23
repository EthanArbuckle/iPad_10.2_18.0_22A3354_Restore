@implementation AgentController

+ (id)sharedController
{
  id v2;
  id v3;

  if (qword_10007DEA0 != -1)
    dispatch_once(&qword_10007DEA0, &stru_100076EB0);
  v2 = (id)qword_10007DE98;
  objc_sync_enter(v2);
  if ((objc_msgSend((id)qword_10007DE98, "isControllerReady") & 1) != 0
    || (objc_msgSend((id)qword_10007DE98, "initializeController") & 1) != 0)
  {
    objc_sync_exit(v2);

    v3 = (id)qword_10007DE98;
  }
  else
  {
    objc_sync_exit(v2);

    v3 = 0;
  }
  return v3;
}

- (AgentController)init
{
  AgentController *v2;
  AgentController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AgentController;
  v2 = -[AgentController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[AgentController initializeController](v2, "initializeController");
  return v3;
}

- (BOOL)initializeController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_queue_t v19;
  void *v20;
  const char *v22;
  os_log_t v23;
  NSObject *v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  _OWORD *v28;
  int v29;
  const char *v30;
  _OWORD v31[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));

  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController createPolicySession](self, "createPolicySession")),
        -[AgentController setPolicySession:](self, "setPolicySession:", v4),
        v4,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession")),
        v5,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[AgentController setFloatingProxyAgentList:](self, "setFloatingProxyAgentList:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      if (!v8)
        goto LABEL_14;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[AgentController setFloatingProxyAgentList_TCPConverter:](self, "setFloatingProxyAgentList_TCPConverter:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));
      if (!v11)
        goto LABEL_14;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[AgentController setFloatingDNSAgentList:](self, "setFloatingDNSAgentList:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
      if (!v14)
        goto LABEL_14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));

    if (v15
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary")),
          -[AgentController setPolicyDB:](self, "setPolicyDB:", v16),
          v16,
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB")),
          v17,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controllerQueue](self, "controllerQueue"));

      if (v18)
        return 1;
      v19 = dispatch_queue_create("IPMonitorAgentControllerQueue", 0);
      -[AgentController setControllerQueue:](self, "setControllerQueue:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controllerQueue](self, "controllerQueue"));
      if (v20)
        return 1;
      v22 = "Failed to create a queue";
    }
    else
    {
LABEL_14:
      v22 = "Failed to create a dictionary";
    }
  }
  else
  {
    v22 = "Failed to create a policy session";
  }
  v23 = sub_100007594();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = _SC_syslog_os_log_mapping(3);
  if (__SC_log_enabled(3, v24, v25))
  {
    memset(v31, 0, sizeof(v31));
    v26 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v24, (os_log_type_t)v25))
      v27 = v26;
    else
      v27 = 2;
    v29 = 136315138;
    v30 = v22;
    v28 = (_OWORD *)_os_log_send_and_compose_impl(v27, 0, v31, 256, &_mh_execute_header, v24, v25, "Error occured while initializing AgentController: %s", (const char *)&v29);
    __SC_log_send2(3, v24, v25, 0, v28);
    if (v28 != v31)
      free(v28);
  }

  _SC_crash(v22, 0, 0);
  return 0;
}

- (id)createPolicySession
{
  return objc_alloc_init((Class)NEPolicySession);
}

- (BOOL)isControllerReady
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
        if (v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
          if (v7)
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controllerQueue](self, "controllerQueue"));
            v9 = v8 != 0;

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dataForProxyArray:(__CFArray *)a3
{
  id v4;

  v4 = 0;
  _SCSerialize(a3, &v4, 0, 0);
  return v4;
}

- (id)dataForProxyDictionary:(__CFDictionary *)a3
{
  __CFDictionary *MutableCopy;
  void *ProxyAgentData;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  _OWORD *v11;
  _WORD v12[8];
  _OWORD v13[16];

  if (a3)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
    CFDictionaryRemoveValue(MutableCopy, kSCPropNetProxiesSupplementalMatchDomain);
    ProxyAgentData = (void *)SCNetworkProxiesCreateProxyAgentData(MutableCopy);
    CFRelease(MutableCopy);
    return ProxyAgentData;
  }
  else
  {
    v6 = sub_100007594();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v7, v8))
    {
      memset(v13, 0, sizeof(v13));
      v9 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v7, (os_log_type_t)v8))
        v10 = v9;
      else
        v10 = 2;
      v12[0] = 0;
      v11 = (_OWORD *)_os_log_send_and_compose_impl(v10, 0, v13, 256, &_mh_execute_header, v7, v8, "Invalid domain proxy dict", v12, 2);
      __SC_log_send2(5, v7, v8, 0, v11);
      if (v11 != v13)
        free(v11);
    }

    return 0;
  }
}

- (id)getProxyDataFromCurrentConfig:(__CFDictionary *)a3 domain:(id)a4
{
  id v6;
  void *v7;
  const __CFArray *Value;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const void *v13;
  const __CFDictionary *ValueAtIndex;
  const void *v15;
  os_log_t v16;
  NSObject *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  _OWORD *v21;
  void *v22;
  _WORD v24[8];
  _OWORD v25[16];

  v6 = a4;
  v7 = v6;
  if (!a3 || !v6)
  {
    v16 = sub_100007594();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v17, v18))
    {
      memset(v25, 0, sizeof(v25));
      v19 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v17, (os_log_type_t)v18))
        v20 = v19;
      else
        v20 = 2;
      v24[0] = 0;
      v21 = (_OWORD *)_os_log_send_and_compose_impl(v20, 0, v25, 256, &_mh_execute_header, v17, v18, "Invalid proxies/domain", v24, 2);
      __SC_log_send2(5, v17, v18, 0, v21);
      if (v21 != v25)
        free(v21);
    }

    goto LABEL_17;
  }
  Value = (const __CFArray *)CFDictionaryGetValue(a3, kSCPropNetProxiesSupplemental);
  if (!Value || (v9 = Value, Count = CFArrayGetCount(Value), Count < 1))
  {
LABEL_17:
    v22 = 0;
    goto LABEL_18;
  }
  v11 = Count;
  v12 = 0;
  v13 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, v12);
    v15 = CFDictionaryGetValue(ValueAtIndex, v13);
    if (v15)
    {
      if (CFEqual(v15, v7))
        break;
    }
    if (v11 == ++v12)
      goto LABEL_17;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyDictionary:](self, "dataForProxyDictionary:", ValueAtIndex));
LABEL_18:

  return v22;
}

- (BOOL)getIntValue:(void *)a3 valuePtr:(int *)a4
{
  CFTypeID v6;
  BOOL result;

  result = a3
        && (v6 = CFGetTypeID(a3), v6 == CFNumberGetTypeID())
        && CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, a4) != 0;
  return result;
}

- (int)countProxyEntriesEnabled:(__CFDictionary *)a3
{
  uint64_t v5;
  unsigned int v6;
  int result;
  os_log_t v9;
  NSObject *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  _WORD v15[8];
  _OWORD v16[16];
  _QWORD v17[9];

  v17[0] = kSCPropNetProxiesHTTPEnable;
  v17[1] = kSCPropNetProxiesHTTPSEnable;
  v17[2] = kSCPropNetProxiesProxyAutoConfigEnable;
  v17[3] = kSCPropNetProxiesFTPEnable;
  v17[4] = kSCPropNetProxiesGopherEnable;
  v17[5] = kSCPropNetProxiesRTSPEnable;
  v17[6] = kSCPropNetProxiesSOCKSEnable;
  v17[7] = kSCPropNetProxiesTransportConverterEnable;
  v17[8] = kSCPropNetProxiesProxyAutoDiscoveryEnable;
  if (a3)
  {
    v5 = 0;
    while (1)
    {
      LODWORD(v16[0]) = 0;
      v6 = -[AgentController getIntValue:valuePtr:](self, "getIntValue:valuePtr:", CFDictionaryGetValue(a3, (const void *)v17[v5]), v16);
      result = v16[0];
      if (v6 && SLODWORD(v16[0]) >= 1)
        break;
      if (++v5 == 9)
        return 0;
    }
  }
  else
  {
    v9 = sub_100007594();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v10, v11))
    {
      memset(v16, 0, sizeof(v16));
      v12 = (_sc_log > 0) | 2;
      v13 = os_log_type_enabled(v10, (os_log_type_t)v11) ? v12 : 2;
      v15[0] = 0;
      v14 = (_OWORD *)_os_log_send_and_compose_impl(v13, 0, v16, 256, &_mh_execute_header, v10, v11, "No proxies", v15, 2);
      __SC_log_send2(5, v10, v11, 0, v14);
      if (v14 != v16)
        free(v14);
    }

    return 0;
  }
  return result;
}

- (void)processSupplementalProxyChanges:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFArray *Value;
  CFIndex Count;
  os_log_t v10;
  NSObject *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  __int128 *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  CFIndex v21;
  const void *v22;
  const __CFDictionary *ValueAtIndex;
  void *v24;
  void *v25;
  os_log_t v26;
  NSObject *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  __int128 *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned __int8 v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  id v57;
  id v58;
  uint64_t v59;
  void *k;
  void *v61;
  os_log_t v62;
  NSObject *v63;
  uint64_t v64;
  unsigned int v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  __int128 *v69;
  id v70;
  id v71;
  uint64_t v72;
  void *m;
  CFIndex v74;
  const void *v75;
  const __CFDictionary *v76;
  const void *v77;
  const void *v78;
  id v79;
  id v80;
  char *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  os_log_t v86;
  NSObject *v87;
  uint64_t v88;
  NSObject *v89;
  unsigned int v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  __int128 *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  void *v100;
  id v101;
  const __CFArray *theArray;
  uint64_t v103;
  void *v104;
  const void *v105;
  void *v106;
  id v107;
  id v108;
  id obj;
  __CFDictionary *type;
  unsigned int typea;
  _BYTE v112[128];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  int v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;

  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v5, 1, 2));

    v101 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    type = a3;
    Value = (const __CFArray *)CFDictionaryGetValue(a3, kSCPropNetProxiesSupplemental);
    theArray = Value;
    if (Value)
      Count = CFArrayGetCount(Value);
    else
      Count = 0;
    v106 = v7;
    v107 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v103 = Count;
    if (Count >= 1)
    {
      v21 = 0;
      v22 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v21);
        v24 = (void *)CFDictionaryGetValue(ValueAtIndex, v22);
        if (v24)
        {
          v25 = v24;
          if (-[AgentController countProxyEntriesEnabled:](self, "countProxyEntriesEnabled:", ValueAtIndex))
          {
            objc_msgSend(v7, "addObject:", v25);
          }
          else
          {
            v26 = sub_100007594();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            v28 = _SC_syslog_os_log_mapping(6);
            if (__SC_log_enabled(6, v27, v28))
            {
              v149 = 0u;
              v148 = 0u;
              v147 = 0u;
              v146 = 0u;
              v145 = 0u;
              v144 = 0u;
              v143 = 0u;
              v142 = 0u;
              v141 = 0u;
              v139 = 0u;
              v140 = 0u;
              v137 = 0u;
              v138 = 0u;
              v136 = 0u;
              v29 = (_sc_log > 0) | 2;
              v134 = 0u;
              v135 = 0u;
              if (os_log_type_enabled(v27, (os_log_type_t)v28))
                v30 = v29;
              else
                v30 = 2;
              v132 = 138412290;
              v133 = v25;
              LODWORD(v97) = 12;
              v31 = (__int128 *)_os_log_send_and_compose_impl(v30, 0, &v134, 256, &_mh_execute_header, v27, v28, "Proxy settings on %@ are generic. Not recognizing as new domain", &v132, v97);
              __SC_log_send2(6, v27, v28, 0, v31);
              if (v31 != &v134)
                free(v31);
              v7 = v106;
            }

          }
        }
        ++v21;
      }
      while (v103 != v21);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    -[AgentController cleanConflictingAgentsFromList:new_list:agentDictionary:](self, "cleanConflictingAgentsFromList:new_list:agentDictionary:", v6, v7, v32);

    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v33 = v6;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v128, v127, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v129;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(_QWORD *)v129 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v7, "containsObject:", v38) & 1) == 0)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", v38));

            -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v40);
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v128, v127, 16);
      }
      while (v35);
    }

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    obj = v33;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v122, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v124;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(_QWORD *)v124 != v43)
            objc_enumerationMutation(obj);
          v45 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)j);
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", v45));

          if (v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "getAgentMapping"));
            v49 = v48;
            if (v48)
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "getAssociatedEntity"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getProxyDataFromCurrentConfig:domain:](self, "getProxyDataFromCurrentConfig:domain:", type, v50));

              if (!v51
                || (v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "getAgentData")),
                    v53 = objc_msgSend(v52, "isEqual:", v51),
                    v52,
                    (v53 & 1) == 0))
              {
                objc_msgSend(v107, "addObject:", v47);

LABEL_48:
                goto LABEL_49;
              }
            }
            else
            {
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "getAssociatedEntity"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getProxyDataFromCurrentConfig:domain:](self, "getProxyDataFromCurrentConfig:domain:", type, v54));

              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "getAgentData"));
              v56 = objc_msgSend(v55, "isEqual:", v51);

              if ((v56 & 1) == 0)
              {
                objc_msgSend(v47, "updateAgentData:", v51);
                objc_msgSend(v104, "addObject:", v47);
              }
            }

            objc_msgSend(v106, "removeObject:", v45);
            goto LABEL_48;
          }
LABEL_49:

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v122, 16);
      }
      while (v42);
    }

    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v20 = v107;
    v57 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v118, v117, 16);
    v108 = v20;
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v119;
      do
      {
        for (k = 0; k != v58; k = (char *)k + 1)
        {
          if (*(_QWORD *)v119 != v59)
            objc_enumerationMutation(v108);
          v61 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)k);
          v62 = sub_100007594();
          v63 = objc_claimAutoreleasedReturnValue(v62);
          v64 = _SC_syslog_os_log_mapping(6);
          if (__SC_log_enabled(6, v63, v64))
          {
            v149 = 0u;
            v148 = 0u;
            v147 = 0u;
            v146 = 0u;
            v145 = 0u;
            v144 = 0u;
            v143 = 0u;
            v142 = 0u;
            v141 = 0u;
            v139 = 0u;
            v140 = 0u;
            v137 = 0u;
            v138 = 0u;
            v136 = 0u;
            v65 = (_sc_log > 0) | 2;
            v134 = 0u;
            v135 = 0u;
            v66 = os_log_type_enabled(v63, (os_log_type_t)v64) ? v65 : 2;
            v67 = v63;
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "getAgentName"));
            v132 = 138412290;
            v133 = v68;
            LODWORD(v97) = 12;
            v69 = (__int128 *)_os_log_send_and_compose_impl(v66, 0, &v134, 256, &_mh_execute_header, v67, v64, "Destroying agent %@ because something changed!", &v132, v97);

            __SC_log_send2(6, v67, v64, 0, v69);
            if (v69 != &v134)
              free(v69);
          }

          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v61);
        }
        v20 = v108;
        v58 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v118, v117, 16);
      }
      while (v58);
    }

    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v16 = v104;
    v70 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
    v18 = v106;
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v114;
      do
      {
        for (m = 0; m != v71; m = (char *)m + 1)
        {
          if (*(_QWORD *)v114 != v72)
            objc_enumerationMutation(v16);
          -[AgentController publishToAgent:](self, "publishToAgent:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)m));
        }
        v71 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
      }
      while (v71);
    }

    if (v103 < 1)
    {
      v19 = v101;
      v17 = obj;
    }
    else
    {
      v74 = 0;
      v75 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
      v19 = v101;
      v105 = (const void *)kSCPropNetProxiesSupplementalMatchDomain;
      do
      {
        v76 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v74);
        v77 = CFDictionaryGetValue(v76, v75);
        if (v77)
        {
          v78 = v77;
          v79 = objc_msgSend(v18, "indexOfObject:", v77);
          if (v79 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v80 = v79;
            v81 = (char *)objc_msgSend(v19, "countForObject:", v78);
            if (v81)
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ #%lu"), v78, v81 + 1));
              v83 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyDictionary:](self, "dataForProxyDictionary:", v76));
              if (-[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(ProxyAgent), v82, 2, 6, v83))
              {
                v84 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
                v100 = v82;
                v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKey:", v82));

                v86 = sub_100007594();
                v87 = objc_claimAutoreleasedReturnValue(v86);
                v88 = _SC_syslog_os_log_mapping(6);
                typea = v88;
                if (__SC_log_enabled(6, v87, v88))
                {
                  v149 = 0u;
                  v148 = 0u;
                  v147 = 0u;
                  v146 = 0u;
                  v145 = 0u;
                  v144 = 0u;
                  v143 = 0u;
                  v142 = 0u;
                  v141 = 0u;
                  v139 = 0u;
                  v140 = 0u;
                  v137 = 0u;
                  v138 = 0u;
                  v136 = 0u;
                  v89 = v87;
                  v90 = (_sc_log > 0) | 2;
                  v134 = 0u;
                  v135 = 0u;
                  if (os_log_type_enabled(v89, (os_log_type_t)typea))
                    v91 = v90;
                  else
                    v91 = 2;
                  v99 = v89;
                  v92 = v89;
                  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "getAgentName"));
                  v132 = 138412290;
                  v133 = v93;
                  LODWORD(v98) = 12;
                  v94 = (__int128 *)_os_log_send_and_compose_impl(v91, 0, &v134, 256, &_mh_execute_header, v92, typea, "Duplicate Proxy agent %@", &v132, v98);

                  __SC_log_send2(6, v92, typea, 0, v94);
                  if (v94 != &v134)
                    free(v94);
                  v75 = v105;
                  v18 = v106;
                  v87 = v99;
                }

                v82 = v100;
                v19 = v101;
              }

            }
            else
            {
              v83 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyDictionary:](self, "dataForProxyDictionary:", v76));
              v95 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
              v96 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentWithSameDataAndSubType:data:subType:](self, "getAgentWithSameDataAndSubType:data:subType:", v95, v83, 2));

              if (v96)
              {
                -[AgentController spawnMappedFloatingAgent:entity:agentSubType:addPolicyOfType:updateData:](self, "spawnMappedFloatingAgent:entity:agentSubType:addPolicyOfType:updateData:", v96, v78, 2, 6, v83);

              }
              else
              {
                -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(ProxyAgent), v78, 2, 6, v83);
              }
              v19 = v101;
              v75 = v105;
            }
            objc_msgSend(v18, "removeObjectAtIndex:", v80);
            objc_msgSend(v19, "addObject:", v78);

          }
        }
        ++v74;
      }
      while (v103 != v74);
      v20 = v108;
      v17 = obj;
    }
  }
  else
  {
    v10 = sub_100007594();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = _SC_syslog_os_log_mapping(6);
    if (__SC_log_enabled(6, v11, v12))
    {
      v149 = 0u;
      v148 = 0u;
      v147 = 0u;
      v146 = 0u;
      v145 = 0u;
      v144 = 0u;
      v143 = 0u;
      v142 = 0u;
      v141 = 0u;
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      v134 = 0u;
      v13 = (_sc_log > 0) | 2;
      v14 = os_log_type_enabled(v11, (os_log_type_t)v12) ? v13 : 2;
      LOWORD(v132) = 0;
      v15 = (__int128 *)_os_log_send_and_compose_impl(v14, 0, &v134, 256, &_mh_execute_header, v11, v12, "No proxy config to process", &v132, 2);
      __SC_log_send2(6, v11, v12, 0, v15);
      if (v15 != &v134)
        free(v15);
    }

    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }

}

- (void)processScopedProxyChanges:(__CFDictionary *)a3
{
  void *v5;
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  CFIndex Count;
  CFIndex v9;
  const void **v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  _OWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFDictionary *v28;
  void *v29;
  int v30;
  id v31;
  _OWORD v32[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v5, 1, 1));

  v28 = a3;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kSCPropNetProxiesScoped);
  if (Value)
  {
    v7 = Value;
    Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      v9 = Count;
      v10 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v7, v10, 0);
      v11 = 0;
      while (1)
      {
        v12 = (id)v10[v11];
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%@"), "@", v12));
        if (-[AgentController countProxyEntriesEnabled:](self, "countProxyEntriesEnabled:", CFDictionaryGetValue(v7, v12)))
        {
          v14 = objc_msgSend(v29, "indexOfObject:", v13);
          v15 = SCNetworkProxiesCopyMatching(v28, 0, v12);
          if (v15)
          {
            v16 = (const void *)v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyArray:](self, "dataForProxyArray:", v15));
            CFRelease(v16);
          }
          else
          {
            v17 = 0;
          }
          if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v29, "removeObjectAtIndex:", v14);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v13));

            if (v24)
            {
              objc_msgSend(v24, "updateAgentData:", v17);
              if (objc_msgSend(v24, "shouldUpdateAgent"))
                -[AgentController publishToAgent:](self, "publishToAgent:", v24);
            }
            goto LABEL_18;
          }
          -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(ProxyAgent), v13, 1, 8, v17);
        }
        else
        {
          v18 = sub_100007594();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          v20 = _SC_syslog_os_log_mapping(6);
          if (__SC_log_enabled(6, v19, v20))
          {
            v21 = (_sc_log > 0) | 2;
            memset(v32, 0, sizeof(v32));
            v22 = os_log_type_enabled(v19, (os_log_type_t)v20) ? v21 : 2;
            v30 = 138412290;
            v31 = v12;
            LODWORD(v27) = 12;
            v23 = (_OWORD *)_os_log_send_and_compose_impl(v22, 0, v32, 256, &_mh_execute_header, v19, v20, "Proxy settings on %@ are generic. Skipping", &v30, v27);
            __SC_log_send2(6, v19, v20, 0, v23);
            if (v23 != v32)
              free(v23);
          }

          v17 = 0;
        }
        v24 = 0;
LABEL_18:

        if (v9 == ++v11)
        {
          free(v10);
          break;
        }
      }
    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v26, v29);

}

- (void)processServiceSpecificProxyChanges:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  const __CFDictionary *Value;
  const __CFDictionary *v8;
  CFIndex Count;
  CFIndex v10;
  const void **v11;
  uint64_t v12;
  id v13;
  void *v14;
  const void *v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  _OWORD *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  int v30;
  id v31;
  _OWORD v32[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v5, 1, 6));

  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kSCPropNetProxiesServices);
  if (Value)
  {
    v8 = Value;
    Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      v10 = Count;
      v11 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v8, v11, 0);
      v12 = 0;
      v28 = v6;
      while (1)
      {
        v13 = (id)v11[v12];
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%@"), "@", v13));
        if (-[AgentController countProxyEntriesEnabled:](self, "countProxyEntriesEnabled:", CFDictionaryGetValue(v8, v13)))
        {
          v15 = CFDictionaryGetValue(v8, v13);
          if (v15)
          {
            v29 = v15;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyArray:](self, "dataForProxyArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1)));
          }
          else
          {
            v16 = 0;
          }
          v23 = objc_msgSend(v6, "indexOfObject:", v14);
          if (v23 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v6, "removeObjectAtIndex:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v14));

            if (v24)
            {
              objc_msgSend(v24, "updateAgentData:", v16);
              if (objc_msgSend(v24, "shouldUpdateAgent"))
                -[AgentController publishToAgent:](self, "publishToAgent:", v24);
            }
            v6 = v28;
            goto LABEL_23;
          }
          -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(ProxyAgent), v14, 6, -1, v16);
        }
        else
        {
          v17 = sub_100007594();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          v19 = _SC_syslog_os_log_mapping(6);
          if (__SC_log_enabled(6, v18, v19))
          {
            v20 = (_sc_log > 0) | 2;
            memset(v32, 0, sizeof(v32));
            if (os_log_type_enabled(v18, (os_log_type_t)v19))
              v21 = v20;
            else
              v21 = 2;
            v30 = 138412290;
            v31 = v13;
            LODWORD(v27) = 12;
            v22 = (_OWORD *)_os_log_send_and_compose_impl(v21, 0, v32, 256, &_mh_execute_header, v18, v19, "Proxy settings on %@ are generic. Skipping", &v30, v27);
            __SC_log_send2(6, v18, v19, 0, v22);
            if (v22 != v32)
              free(v22);
            v6 = v28;
          }

          v16 = 0;
        }
        v24 = 0;
LABEL_23:

        if (v10 == ++v12)
        {
          free(v11);
          break;
        }
      }
    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v26, v6);

}

- (BOOL)isGlobalProxy:(__CFDictionary *)a3
{
  return CFDictionaryContainsKey(a3, kSCPropNetProxiesBypassAllowed) != 0;
}

- (BOOL)isTCPConverterProxyEnabled:(__CFDictionary *)a3
{
  void *v3;
  CFTypeID TypeID;
  BOOL result;
  void *value;
  int valuePtr;

  valuePtr = 0;
  value = 0;
  result = 0;
  if (CFDictionaryGetValueIfPresent(a3, kSCPropNetProxiesTransportConverterEnable, (const void **)&value))
  {
    v3 = value;
    TypeID = CFNumberGetTypeID();
    if (v3)
    {
      if (CFGetTypeID(v3) == TypeID && CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr) && valuePtr)
        return 1;
    }
  }
  return result;
}

- (void)processDefaultProxyChanges:(__CFDictionary *)a3
{
  const __CFArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned int v10;
  os_log_t v11;
  NSObject *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  uint64_t v18;
  os_log_t v19;
  NSObject *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  __int128 *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *values;
  _WORD v32[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  values = CFDictionaryCreateMutableCopy(0, 0, a3);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesScoped);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesServices);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)values, kSCPropNetProxiesSupplemental);
  v4 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    if (-[AgentController countProxyEntriesEnabled:](self, "countProxyEntriesEnabled:", values))
    {
      CFRelease(values);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForProxyArray:](self, "dataForProxyArray:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_defaultProxy")));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getAgentData"));
        v9 = objc_msgSend(v5, "isEqual:", v8);

        if ((v9 & 1) != 0)
          goto LABEL_29;
        -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v7);
      }
      v10 = -[AgentController isGlobalProxy:](self, "isGlobalProxy:", values);
      if (v10)
      {
        v11 = sub_100007594();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        v13 = _SC_syslog_os_log_mapping(6);
        if (__SC_log_enabled(6, v12, v13))
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v40 = 0u;
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v33 = 0u;
          v14 = (_sc_log > 0) | 2;
          v15 = os_log_type_enabled(v12, (os_log_type_t)v13) ? v14 : 2;
          v32[0] = 0;
          v16 = (__int128 *)_os_log_send_and_compose_impl(v15, 0, &v33, 256, &_mh_execute_header, v12, v13, "Global proxy detected...", v32, 2);
          __SC_log_send2(6, v12, v13, 0, v16);
          if (v16 != &v33)
            free(v16);
        }

        v17 = 7;
        v18 = 7;
      }
      else
      {
        v18 = 0;
        v17 = 3;
      }
      if ((v10 & -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(ProxyAgent), CFSTR("_defaultProxy"), v17, v18, v5)) == 1&& -[AgentController isTCPConverterProxyEnabled:](self, "isTCPConverterProxyEnabled:", values))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("_defaultProxy")));

        if (v26)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "getAgentData"));
          v29 = objc_msgSend(v5, "isEqual:", v28);

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));
            objc_msgSend(v30, "setObject:forKey:", v26, CFSTR("_defaultProxy"));

            sub_10004E900(1);
          }
        }
        goto LABEL_30;
      }
LABEL_29:
      v26 = v7;
LABEL_30:

      goto LABEL_31;
    }
    v19 = sub_100007594();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = _SC_syslog_os_log_mapping(6);
    if (__SC_log_enabled(6, v20, v21))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v40 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      v22 = (_sc_log > 0) | 2;
      v23 = os_log_type_enabled(v20, (os_log_type_t)v21) ? v22 : 2;
      v32[0] = 0;
      v24 = (__int128 *)_os_log_send_and_compose_impl(v23, 0, &v33, 256, &_mh_execute_header, v20, v21, "Proxy settings on defaultProxy are generic. Skipping", v32, 2);
      __SC_log_send2(6, v20, v21, 0, v24);
      if (v24 != &v33)
        free(v24);
    }

  }
  CFRelease(values);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", CFSTR("_defaultProxy")));

  if (v26)
    -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v26);
LABEL_31:

  CFRelease(v4);
}

- (void)applyPolicies
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  os_log_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  os_log_t v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  __int128 *v22;
  uint64_t v23;
  _WORD v24[8];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v3 = objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
    v6 = objc_msgSend(v5, "apply");

    if ((v6 & 1) == 0)
    {
      v7 = sub_100007594();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v8, v9))
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = (_sc_log > 0) | 2;
        v11 = os_log_type_enabled(v8, (os_log_type_t)v9) ? v10 : 2;
        v24[0] = 0;
        v12 = (__int128 *)_os_log_send_and_compose_impl(v11, 0, &v25, 256, &_mh_execute_header, v8, v9, "Failed to apply control policies", v24, 2);
        __SC_log_send2(3, v8, v9, 0, v12);
        if (v12 != &v25)
          free(v12);
      }

    }
  }
  v13 = objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
    v16 = objc_msgSend(v15, "apply");

    if ((v16 & 1) == 0)
    {
      v17 = sub_100007594();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v18, v19))
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v20 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v18, (os_log_type_t)v19))
          v21 = v20;
        else
          v21 = 2;
        v24[0] = 0;
        LODWORD(v23) = 2;
        v22 = (__int128 *)_os_log_send_and_compose_impl(v21, 0, &v25, 256, &_mh_execute_header, v18, v19, "Failed to apply policies", v24, v23);
        __SC_log_send2(3, v18, v19, 0, v22);
        if (v22 != &v25)
          free(v22);
      }

    }
  }
}

- (void)processProxyChanges
{
  uint64_t v3;
  const void *v4;
  os_log_t v5;
  NSObject *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  _OWORD *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  _WORD v19[8];
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[16];

  v3 = SCDynamicStoreCopyProxiesWithOptions(0, 0);
  if (v3)
  {
    v4 = (const void *)v3;
    -[AgentController processDefaultProxyChanges:](self, "processDefaultProxyChanges:", v3);
    -[AgentController processScopedProxyChanges:](self, "processScopedProxyChanges:", v4);
    -[AgentController processSupplementalProxyChanges:](self, "processSupplementalProxyChanges:", v4);
    -[AgentController processServiceSpecificProxyChanges:](self, "processServiceSpecificProxyChanges:", v4);
    -[AgentController applyPolicies](self, "applyPolicies");
    CFRelease(v4);
  }
  else
  {
    v5 = sub_100007594();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = _SC_syslog_os_log_mapping(6);
    if (__SC_log_enabled(6, v6, v7))
    {
      memset(v25, 0, sizeof(v25));
      v8 = (_sc_log > 0) | 2;
      v9 = os_log_type_enabled(v6, (os_log_type_t)v7) ? v8 : 2;
      v19[0] = 0;
      v10 = (_OWORD *)_os_log_send_and_compose_impl(v9, 0, v25, 256, &_mh_execute_header, v6, v7, "No proxy information", v19, 2);
      __SC_log_send2(6, v6, v7, 0, v10);
      if (v10 != v25)
        free(v10);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    v12 = objc_msgSend(v11, "copy");

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i)));
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      }
      while (v15);

      -[AgentController applyPolicies](self, "applyPolicies");
    }
    else
    {

    }
  }
}

- (void)freeResolverList:(resolverList *)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **var2;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **var4;

  if (a3)
  {
    if (a3->var0)
      free(a3->var0);
    var2 = a3->var2;
    if (var2)
      free(var2);
    var4 = a3->var4;
    if (var4)
      free(var4);
    free(a3);
  }
}

- (resolverList)copyResolverList:(id *)a3
{
  resolverList *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  unsigned int *p_var3;
  unsigned __int8 v10;
  os_log_t v11;
  NSObject *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int var3;
  unsigned int var5;
  _OWORD *v18;
  size_t var1;
  size_t v20;
  size_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  resolverList *p_var2;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  _OWORD v35[16];

  if (a3->var0 < 1 || !*(_QWORD *)(&a3->var0 + 1))
    return 0;
  v5 = (resolverList *)malloc_type_calloc(1uLL, 0x30uLL, 0x1080040C09FF9A2uLL);
  if (a3->var0 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = *(_QWORD *)(*(_QWORD *)(&a3->var0 + 1) + 8 * v6);
      v8 = -[AgentController isResolverMulticast:](self, "isResolverMulticast:", v7);
      p_var3 = &v5->var3;
      if ((v8 & 1) != 0
        || (v10 = -[AgentController isResolverPrivate:](self, "isResolverPrivate:", v7),
            p_var3 = &v5->var5,
            (v10 & 1) != 0)
        || !*(_QWORD *)v7 && (p_var3 = &v5->var1, *(int *)(v7 + 8) >= 1))
      {
        ++*p_var3;
      }
      ++v6;
    }
    while (v6 < a3->var0);
  }
  v11 = sub_100007594();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = _SC_syslog_os_log_mapping(6);
  if (__SC_log_enabled(6, v12, v13))
  {
    memset(v35, 0, sizeof(v35));
    v14 = (_sc_log > 0) | 2;
    v15 = os_log_type_enabled(v12, (os_log_type_t)v13) ? v14 : 2;
    var3 = v5->var3;
    var5 = v5->var5;
    v31 = 1024;
    v32 = var3;
    v33 = 1024;
    v34 = var5;
    v18 = (_OWORD *)_os_log_send_and_compose_impl(v15, 0, v35, 256, &_mh_execute_header, v12, v13, "Resolvers: %u default, %u multicast, %u private", &v30, 20, 67109632);
    __SC_log_send2(6, v12, v13, 0, v18);
    if (v18 != v35)
      free(v18);
  }

  var1 = v5->var1;
  if ((_DWORD)var1)
    v5->var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(var1, 8uLL, 0x2004093837F09uLL);
  v20 = v5->var3;
  if ((_DWORD)v20)
    v5->var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(v20, 8uLL, 0x2004093837F09uLL);
  v21 = v5->var5;
  if ((_DWORD)v21)
    v5->var4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_calloc(v21, 8uLL, 0x2004093837F09uLL);
  if (a3->var0 >= 1)
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    do
    {
      v26 = *(_QWORD *)(*(_QWORD *)(&a3->var0 + 1) + 8 * v22);
      if (-[AgentController isResolverMulticast:](self, "isResolverMulticast:", v26) && v23 < v5->var3)
      {
        v27 = v23++;
        p_var2 = (resolverList *)&v5->var2;
      }
      else if (-[AgentController isResolverPrivate:](self, "isResolverPrivate:", v26) && v24 < v5->var5)
      {
        v27 = v24++;
        p_var2 = (resolverList *)&v5->var4;
      }
      else
      {
        if (*(_QWORD *)v26 || *(int *)(v26 + 8) < 1 || v25 >= v5->var1)
          goto LABEL_39;
        v27 = v25++;
        p_var2 = v5;
      }
      p_var2->var0[v27] = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v26;
LABEL_39:
      ++v22;
    }
    while (v22 < a3->var0);
  }
  return v5;
}

- (id)dataForResolver:(id *)a3
{
  __CFDictionary *Mutable;
  __CFArray *v5;
  uint64_t v6;
  int *p_var1;
  os_log_t v8;
  NSObject *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  __int128 *v13;
  __CFArray *v14;
  uint64_t v15;
  void *v16;
  _WORD v18[8];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  if (!a3)
  {
    v8 = sub_100007594();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v9, v10))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = (_sc_log > 0) | 2;
      v12 = os_log_type_enabled(v9, (os_log_type_t)v10) ? v11 : 2;
      v18[0] = 0;
      v13 = (__int128 *)_os_log_send_and_compose_impl(v12, 0, &v19, 256, &_mh_execute_header, v9, v10, "Invalid dns resolver", v18, 2);
      __SC_log_send2(5, v9, v10, 0, v13);
      if (v13 != &v19)
        free(v13);
    }

    return 0;
  }
  if (*(int *)&a3->var3 < 1)
  {
    p_var1 = &a3->var1;
    if (a3->var1 <= 0)
      return 0;
    goto LABEL_17;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v5 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (*(int *)&a3->var3 >= 1)
  {
    v6 = 0;
    do
      CFArrayAppendValue(v5, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)&a3->var4 + 8 * v6++)));
    while (v6 < *(int *)&a3->var3);
  }
  CFDictionaryAddValue(Mutable, CFSTR("SearchDomains"), v5);
  CFRelease(v5);
  p_var1 = &a3->var1;
  if (a3->var1 > 0)
  {
    if (Mutable)
    {
LABEL_18:
      v14 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      if (*p_var1 >= 1)
      {
        v15 = 0;
        do
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          _SC_sockaddr_to_string(*(_QWORD *)(*(_QWORD *)(&a3->var1 + 1) + 8 * v15), &v19, 128);
          if ((_BYTE)v19)
            CFArrayAppendValue(v14, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v19));
          ++v15;
        }
        while (v15 < *p_var1);
      }
      CFDictionaryAddValue(Mutable, CFSTR("NameServers"), v14);
      CFRelease(v14);
      goto LABEL_24;
    }
LABEL_17:
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    goto LABEL_18;
  }
LABEL_24:
  if (Mutable)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", Mutable, 200, 0, 0));
    CFRelease(Mutable);
    return v16;
  }
  return 0;
}

- (id)getDNSDataFromCurrentConfig:(id *)a3 domain:(id)a4
{
  id v6;
  void *v7;
  uint64_t i;
  _QWORD *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  _OWORD *v16;
  void *v17;
  _WORD v19[8];
  _OWORD v20[16];

  v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    if (a3->var0 >= 1 && *(_QWORD *)(&a3->var0 + 1))
    {
      for (i = 0; i < a3->var0; ++i)
      {
        v9 = *(_QWORD **)(*(_QWORD *)(&a3->var0 + 1) + 8 * i);
        if (*v9
          && !-[AgentController isResolverMulticast:](self, "isResolverMulticast:", *(_QWORD *)(*(_QWORD *)(&a3->var0 + 1) + 8 * i)))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v9));
          if (objc_msgSend(v10, "isEqualToString:", v7))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v9));

            goto LABEL_20;
          }

        }
      }
    }
  }
  else
  {
    v11 = sub_100007594();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v12, v13))
    {
      memset(v20, 0, sizeof(v20));
      v14 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v12, (os_log_type_t)v13))
        v15 = v14;
      else
        v15 = 2;
      v19[0] = 0;
      v16 = (_OWORD *)_os_log_send_and_compose_impl(v15, 0, v20, 256, &_mh_execute_header, v12, v13, "Invalid dns_config/domain", v19, 2);
      __SC_log_send2(5, v12, v13, 0, v16);
      if (v16 != v20)
        free(v16);
    }

  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (BOOL)isResolverMulticast:(id *)a3
{
  char *var0;

  var0 = (char *)a3->var7.var0;
  if (var0)
    LOBYTE(var0) = strstr(var0, "mdns") != 0;
  return (char)var0;
}

- (BOOL)isResolverPrivate:(id *)a3
{
  char *var0;

  var0 = (char *)a3->var7.var0;
  if (var0)
    LOBYTE(var0) = strstr(var0, "pdns") != 0;
  return (char)var0;
}

- (void)processSupplementalDNSResolvers:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  id v37;
  uint64_t v38;
  void *k;
  void *v40;
  os_log_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  __int128 *v47;
  id v48;
  id v49;
  $AD714C75656D13D802AB8ABABE5301B7 *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *m;
  void *v55;
  uint64_t v56;
  _QWORD *v57;
  void *v58;
  id v59;
  id v60;
  char *v61;
  char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  os_log_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  __int128 *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id obj;
  void *type;
  unsigned int typea;
  $AD714C75656D13D802AB8ABABE5301B7 *v86;
  _BYTE v87[128];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  int v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;

  type = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v79 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v6, 2, 2));

  if (*(_QWORD *)(&a3->var0 + 1))
  {
    if (a3->var0 >= 1)
    {
      v8 = 0;
      do
      {
        v9 = *(_QWORD **)(*(_QWORD *)(&a3->var0 + 1) + 8 * v8);
        if (*v9
          && !-[AgentController isResolverPrivate:](self, "isResolverPrivate:", *(_QWORD *)(*(_QWORD *)(&a3->var0 + 1) + 8 * v8))&& !-[AgentController isResolverMulticast:](self, "isResolverMulticast:", v9))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *v9, 1));
          objc_msgSend(v5, "addObject:", v10);

        }
        ++v8;
      }
      while (v8 < a3->var0);
    }
  }
  else
  {
    a3->var0 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  -[AgentController cleanConflictingAgentsFromList:new_list:agentDictionary:](self, "cleanConflictingAgentsFromList:new_list:agentDictionary:", v7, v5, v11);

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v121, v120, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v122 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v5, "containsObject:", v17) & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v17));

          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v19);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v121, v120, 16);
    }
    while (v14);
  }
  v81 = v5;
  v86 = a3;

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v12;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v115, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v117 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v24));

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "getAgentMapping"));
          v28 = v27;
          if (v27)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "getAssociatedEntity"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getDNSDataFromCurrentConfig:domain:](self, "getDNSDataFromCurrentConfig:domain:", v86, v29));

            if (!v30
              || (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "getAgentData")),
                  v32 = objc_msgSend(v31, "isEqual:", v30),
                  v31,
                  (v32 & 1) == 0))
            {
              objc_msgSend(type, "addObject:", v26);

LABEL_33:
              goto LABEL_34;
            }
          }
          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "getAssociatedEntity"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getDNSDataFromCurrentConfig:domain:](self, "getDNSDataFromCurrentConfig:domain:", v86, v33));

            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "getAgentData"));
            v35 = objc_msgSend(v34, "isEqual:", v30);

            if ((v35 & 1) == 0)
            {
              objc_msgSend(v26, "updateAgentData:", v30);
              objc_msgSend(v80, "addObject:", v26);
            }
          }

          objc_msgSend(v81, "removeObject:", v24);
          goto LABEL_33;
        }
LABEL_34:

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v115, 16);
    }
    while (v21);
  }

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v82 = type;
  v36 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v111, v110, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(_QWORD *)v112 != v38)
          objc_enumerationMutation(v82);
        v40 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)k);
        v41 = sub_100007594();
        v42 = objc_claimAutoreleasedReturnValue(v41);
        v43 = _SC_syslog_os_log_mapping(6);
        if (__SC_log_enabled(6, v42, v43))
        {
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          LODWORD(v44) = (_sc_log > 0) | 2;
          v94 = 0u;
          v95 = 0u;
          v44 = os_log_type_enabled(v42, (os_log_type_t)v43) ? v44 : 2;
          v45 = v42;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "getAgentName"));
          v92 = 138412290;
          v93 = v46;
          LODWORD(v75) = 12;
          v47 = (__int128 *)_os_log_send_and_compose_impl(v44, 0, &v94, 256, &_mh_execute_header, v45, v43, "Destroying agent %@ because something changed!", &v92, v75);

          __SC_log_send2(6, v45, v43, 0, v47);
          if (v47 != &v94)
            free(v47);
        }

        -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v40);
      }
      v37 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v111, v110, 16);
    }
    while (v37);
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v48 = v80;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v88, v87, 16);
  v50 = v86;
  v51 = v81;
  if (v49)
  {
    v52 = v49;
    v53 = *(_QWORD *)v89;
    do
    {
      for (m = 0; m != v52; m = (char *)m + 1)
      {
        if (*(_QWORD *)v89 != v53)
          objc_enumerationMutation(v48);
        -[AgentController publishToAgent:](self, "publishToAgent:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)m));
      }
      v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v88, v87, 16);
    }
    while (v52);
  }

  v55 = v79;
  if (v86->var0 >= 1)
  {
    v56 = 0;
    do
    {
      v57 = *(_QWORD **)(*(_QWORD *)(&v50->var0 + 1) + 8 * v56);
      if (*v57
        && !-[AgentController isResolverPrivate:](self, "isResolverPrivate:", *(_QWORD *)(*(_QWORD *)(&v50->var0 + 1) + 8 * v56))&& !-[AgentController isResolverMulticast:](self, "isResolverMulticast:", v57))
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v57));
        v59 = objc_msgSend(v51, "indexOfObject:", v58);
        if (v59 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v60 = v59;
          v61 = (char *)objc_msgSend(v55, "countForObject:", v58);
          if (v61)
          {
            v62 = v61 + 1;
            v63 = objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v57));
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ #%lu"), v58, v62));
            if (-[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(DNSAgent), v64, 2, 6, v63))
            {
              v65 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKey:", v64));

              v67 = sub_100007594();
              v68 = objc_claimAutoreleasedReturnValue(v67);
              v69 = _SC_syslog_os_log_mapping(6);
              typea = v69;
              if (__SC_log_enabled(6, v68, v69))
              {
                v108 = 0u;
                v109 = 0u;
                v106 = 0u;
                v107 = 0u;
                v104 = 0u;
                v105 = 0u;
                v102 = 0u;
                v103 = 0u;
                v100 = 0u;
                v101 = 0u;
                v98 = 0u;
                v99 = 0u;
                v96 = 0u;
                v97 = 0u;
                v70 = v68;
                LODWORD(v68) = (_sc_log > 0) | 2;
                v94 = 0u;
                v95 = 0u;
                if (os_log_type_enabled(v70, (os_log_type_t)typea))
                  v68 = v68;
                else
                  v68 = 2;
                v78 = v70;
                v71 = v70;
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "getAgentName"));
                v92 = 138412290;
                v93 = v77;
                LODWORD(v76) = 12;
                v72 = (__int128 *)_os_log_send_and_compose_impl(v68, 0, &v94, 256, &_mh_execute_header, v71, typea, "Duplicate DNS agent %@", &v92, v76);

                __SC_log_send2(6, v71, typea, 0, v72);
                if (v72 != &v94)
                  free(v72);
                v55 = v79;
                v68 = (uint64_t)v78;
              }

            }
          }
          else
          {
            v63 = objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v57));
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentWithSameDataAndSubType:data:subType:](self, "getAgentWithSameDataAndSubType:data:subType:", v73, v63, 2));

            if (v74)
            {
              -[AgentController spawnMappedFloatingAgent:entity:agentSubType:addPolicyOfType:updateData:](self, "spawnMappedFloatingAgent:entity:agentSubType:addPolicyOfType:updateData:", v74, v58, 2, 6, v63);

            }
            else
            {
              -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(DNSAgent), v58, 2, 6, v63);
            }
          }
          objc_msgSend(v81, "removeObjectAtIndex:", v60);
          objc_msgSend(v55, "addObject:", v58);

          v58 = (void *)v63;
          v50 = v86;
        }

        v51 = v81;
      }
      ++v56;
    }
    while (v56 < v50->var0);
  }

}

- (void)processDNSResolvers:(id *)a3
{
  resolverList *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;

  v4 = -[AgentController copyResolverList:](self, "copyResolverList:", a3);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v5, 2, 3));

    if (v4->var1 && v4->var0)
    {
      v6 = 0;
      while (1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v4->var0[v6]));
        if (v6)
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_defaultDNS #%u"), v6 + 1));
        else
          v8 = CFSTR("_defaultDNS");
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

        if (!v10)
          goto LABEL_11;
        objc_msgSend(v32, "removeObject:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getAgentData"));
        v12 = objc_msgSend(v7, "isEqual:", v11);

        if ((v12 & 1) == 0)
          break;
LABEL_12:

        if (++v6 >= (unint64_t)v4->var1)
          goto LABEL_13;
      }
      -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v10);
LABEL_11:
      -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(DNSAgent), v8, 3, 0, v7);
      goto LABEL_12;
    }
LABEL_13:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v13, v32);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v14, 2, 4));

    if (v4->var3 && v4->var2)
    {
      v16 = 0;
      do
      {
        v17 = v4->var2[v16];
        if (v17)
        {
          if (*(_QWORD *)v17)
          {
            v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
            if (v18)
            {
              v19 = (void *)v18;
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v19));

              if (v21)
              {
                objc_msgSend(v15, "removeObject:", v19);

                v19 = (void *)v21;
              }
              else
              {
                -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(DNSAgent), v19, 4, 6, 0);
              }

            }
          }
        }
        ++v16;
      }
      while (v16 < v4->var3);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v22, v15);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v23, 2, 5));

    if (v4->var5 && v4->var4)
    {
      v25 = 0;
      do
      {
        v26 = v4->var4[v25];
        if (v26)
        {
          if (*(_QWORD *)v26)
          {
            v27 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
            if (v27)
            {
              v28 = (void *)v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
              v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v28));

              if (v30)
              {
                objc_msgSend(v24, "removeObject:", v28);

                v28 = (void *)v30;
              }
              else
              {
                -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(DNSAgent), v28, 5, 6, 0);
              }

            }
          }
        }
        ++v25;
      }
      while (v25 < v4->var5);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v31, v24);

  }
  -[AgentController freeResolverList:](self, "freeResolverList:", v4);
}

- (void)processScopedDNSResolvers:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 *(__cdecl **v8)(const void *, CC_LONG, unsigned __int8 *);
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  _BYTE v20[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v5, 2, 1));

  if (SHIDWORD(a3->var1.var1) >= 1 && *(_QWORD *)&a3->var2)
  {
    v7 = 0;
    v8 = &CC_SHA256_ptr;
    v9 = "@";
    do
    {
      v10 = *(_QWORD *)(*(_QWORD *)&a3->var2 + 8 * v7);
      v11 = sub_10002D76C(*(_DWORD *)(v10 + 64), (uint64_t)v20);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[172], "stringWithUTF8String:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[172], "stringWithFormat:", CFSTR("%s%@"), v9, v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v10));
        v15 = objc_msgSend(v6, "indexOfObject:", v13);
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(DNSAgent), v13, 1, 8, v14);
          v16 = 0;
        }
        else
        {
          v17 = v9;
          objc_msgSend(v6, "removeObjectAtIndex:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v13));

          if (v16)
          {
            objc_msgSend(v16, "updateAgentData:", v14);
            if (objc_msgSend(v16, "shouldUpdateAgent"))
              -[AgentController publishToAgent:](self, "publishToAgent:", v16);
          }
          v9 = v17;
          v8 = &CC_SHA256_ptr;
        }
      }
      else
      {
        v14 = 0;
        v16 = 0;
        v12 = 0;
        v13 = 0;
      }

      ++v7;
    }
    while (v7 < SHIDWORD(a3->var1.var1));
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v19, v6);

}

- (void)processServiceSpecificDNSResolvers:(id *)a3
{
  void *v5;
  uint64_t v6;
  unsigned __int8 *(__cdecl **v7)(const void *, CC_LONG, unsigned __int8 *);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  unsigned __int8 *(__cdecl **v16)(const void *, CC_LONG, unsigned __int8 *);
  void *v17;
  void *v18;
  id v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  v19 = (id)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v5, 2, 6));

  if (SLODWORD(a3->var4) >= 1 && *(unint64_t *)((char *)&a3->var4 + 4))
  {
    v6 = 0;
    v7 = &CC_SHA256_ptr;
    v8 = "@";
    do
    {
      v9 = *(_QWORD *)(*(unint64_t *)((char *)&a3->var4 + 4) + 8 * v6);
      v10 = *(unsigned int *)(v9 + 76);
      if ((_DWORD)v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[172], "stringWithFormat:", CFSTR("%s%u"), v8, v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataForResolver:](self, "dataForResolver:", v9));
        v13 = objc_msgSend(v19, "indexOfObject:", v11);
        if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          -[AgentController spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:](self, "spawnFloatingAgent:entity:agentSubType:addPolicyOfType:publishData:", objc_opt_class(DNSAgent), v11, 6, -1, v12);
          v14 = 0;
        }
        else
        {
          v15 = v8;
          v16 = v7;
          objc_msgSend(v19, "removeObjectAtIndex:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v11));

          if (v14)
          {
            objc_msgSend(v14, "updateAgentData:", v12);
            if (objc_msgSend(v14, "shouldUpdateAgent"))
              -[AgentController publishToAgent:](self, "publishToAgent:", v14);
          }
          v7 = v16;
          v8 = v15;
        }
      }
      else
      {
        v12 = 0;
        v14 = 0;
        v11 = 0;
      }

      ++v6;
    }
    while (v6 < SLODWORD(a3->var4));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  -[AgentController deleteAgentList:list:](self, "deleteAgentList:list:", v18, v19);

}

- (BOOL)isResolverOnion:(id *)a3
{
  return a3->var0.var1 && !strcmp(a3->var0.var0, "onion");
}

- (void)processOnionResolver:(id *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  __int128 *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  os_log_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  __int128 *v27;
  uint64_t v28;
  os_log_t v29;
  unsigned int v30;
  uint64_t v31;
  os_log_t v32;
  unsigned int v33;
  uint64_t v34;
  _WORD v35[8];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;

  if (!a3)
    goto LABEL_14;
  if (a3->var0 < 1)
  {
LABEL_6:
    if (qword_10007DEA8)
      return;
    v6 = objc_alloc((Class)NEPolicy);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult drop](NEPolicyResult, "drop"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition domain:](NEPolicyCondition, "domain:", CFSTR("onion")));
    v52 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
    v10 = objc_msgSend(v6, "initWithOrder:result:conditions:", 500, v7, v9);

    if (!v10)
      goto LABEL_36;
    v11 = objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
    qword_10007DEA8 = (uint64_t)objc_msgSend((id)v11, "addPolicy:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
    LOBYTE(v11) = objc_msgSend(v12, "apply");

    if ((v11 & 1) != 0)
    {
      v13 = sub_100007594();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = _SC_syslog_os_log_mapping(6);
      if (__SC_log_enabled(6, v14, v15))
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v16 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v14, (os_log_type_t)v15))
          v17 = v16;
        else
          v17 = 2;
        v35[0] = 0;
        v18 = (__int128 *)_os_log_send_and_compose_impl(v17, 0, &v36, 256, &_mh_execute_header, v14, v15, "Added a [.onion] drop policy", v35, 2);
        v19 = 6;
LABEL_33:
        __SC_log_send2(v19, v14, v15, 0, v18);
        if (v18 != &v36)
          free(v18);
      }
    }
    else
    {
      qword_10007DEA8 = 0;
      v32 = sub_100007594();
      v14 = objc_claimAutoreleasedReturnValue(v32);
      v15 = _SC_syslog_os_log_mapping(5);
      if (__SC_log_enabled(5, v14, v15))
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v33 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v14, (os_log_type_t)v15))
          v34 = v33;
        else
          v34 = 2;
        v35[0] = 0;
        v18 = (__int128 *)_os_log_send_and_compose_impl(v34, 0, &v36, 256, &_mh_execute_header, v14, v15, "Could not add a [.onion] drop policy", v35, 2);
        v19 = 5;
        goto LABEL_33;
      }
    }

    goto LABEL_36;
  }
  v5 = 0;
  while (!-[AgentController isResolverOnion:](self, "isResolverOnion:", *(_QWORD *)(*(_QWORD *)(&a3->var0 + 1) + 8 * v5)))
  {
    if (++v5 >= a3->var0)
      goto LABEL_6;
  }
LABEL_14:
  if (!qword_10007DEA8)
    return;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
  objc_msgSend(v20, "removePolicyWithID:", qword_10007DEA8);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
  v22 = objc_msgSend(v21, "apply");

  if ((v22 & 1) != 0)
  {
    qword_10007DEA8 = 0;
    v23 = sub_100007594();
    v10 = objc_claimAutoreleasedReturnValue(v23);
    v24 = _SC_syslog_os_log_mapping(6);
    if (__SC_log_enabled(6, v10, v24))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v25 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v10, (os_log_type_t)v24))
        v26 = v25;
      else
        v26 = 2;
      v35[0] = 0;
      v27 = (__int128 *)_os_log_send_and_compose_impl(v26, 0, &v36, 256, &_mh_execute_header, v10, v24, "Removed the [.onion] drop policy", v35, 2);
      v28 = 6;
      goto LABEL_26;
    }
  }
  else
  {
    v29 = sub_100007594();
    v10 = objc_claimAutoreleasedReturnValue(v29);
    v24 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v10, v24))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v30 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v10, (os_log_type_t)v24))
        v31 = v30;
      else
        v31 = 2;
      v35[0] = 0;
      v27 = (__int128 *)_os_log_send_and_compose_impl(v31, 0, &v36, 256, &_mh_execute_header, v10, v24, "Could not remove the [.onion] drop policy", v35, 2);
      v28 = 5;
LABEL_26:
      __SC_log_send2(v28, v10, v24, 0, v27);
      if (v27 != &v36)
        free(v27);
    }
  }
LABEL_36:

}

- (void)processDNSChanges
{
  uint64_t v3;
  os_log_t v4;
  NSObject *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _OWORD *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  _WORD v18[8];
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[16];

  v3 = dns_configuration_copy(self, a2);
  if (v3)
  {
    -[AgentController processDNSResolvers:](self, "processDNSResolvers:", v3);
    -[AgentController processScopedDNSResolvers:](self, "processScopedDNSResolvers:", v3);
    -[AgentController processSupplementalDNSResolvers:](self, "processSupplementalDNSResolvers:", v3);
    -[AgentController processServiceSpecificDNSResolvers:](self, "processServiceSpecificDNSResolvers:", v3);
  }
  else
  {
    v4 = sub_100007594();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = _SC_syslog_os_log_mapping(6);
    if (__SC_log_enabled(6, v5, v6))
    {
      memset(v24, 0, sizeof(v24));
      v7 = (_sc_log > 0) | 2;
      v8 = os_log_type_enabled(v5, (os_log_type_t)v6) ? v7 : 2;
      v18[0] = 0;
      v9 = (_OWORD *)_os_log_send_and_compose_impl(v8, 0, v24, 256, &_mh_execute_header, v5, v6, "No DNS configuration", v18, 2);
      __SC_log_send2(6, v5, v6, 0, v9);
      if (v9 != v24)
        free(v9);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    v11 = objc_msgSend(v10, "copy");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i)));
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      }
      while (v14);
    }

  }
  -[AgentController processOnionResolver:](self, "processOnionResolver:", v3);
  -[AgentController applyPolicies](self, "applyPolicies");
  if (v3)
    dns_configuration_free(v3);
}

- (const)copyConfigAgentData:(id)a3 uuid:(unsigned __int8)a4[16] length:(unint64_t *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  size_t v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  os_log_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned __int8 *v29;
  __int128 v31;
  char out[48];
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unsigned __int8 uu1[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v7 = a3;
  v8 = v7;
  if (!a5)
  {
    v26 = sub_100007594();
    v21 = objc_claimAutoreleasedReturnValue(v26);
    v22 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v21, v22))
    {
LABEL_26:

      v16 = 0;
      v14 = 0;
      goto LABEL_27;
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    *(_OWORD *)uu1 = 0u;
    v39 = 0u;
    v27 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v21, (os_log_type_t)v22))
      v28 = v27;
    else
      v28 = 2;
    v25 = _os_log_send_and_compose_impl(v28, 0, uu1, 256, &_mh_execute_header, v21, v22, "Invalid parameters for copying agent data");
LABEL_24:
    v29 = (unsigned __int8 *)v25;
    __SC_log_send2(5, v21, v22, 0, v25);
    if (v29 != uu1)
      free(v29);
    goto LABEL_26;
  }
  *a5 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (!v10)
  {
LABEL_10:

LABEL_14:
    memset(out, 0, 37);
    uuid_unparse(a4, out);
    v20 = sub_100007594();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v21, v22))
      goto LABEL_26;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    *(_OWORD *)uu1 = 0u;
    v39 = 0u;
    v23 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v21, (os_log_type_t)v22))
      v24 = v23;
    else
      v24 = 2;
    v25 = _os_log_send_and_compose_impl(v24, 0, uu1, 256, &_mh_execute_header, v21, v22, "Invalid config agent uuid %s specified", &v31);
    goto LABEL_24;
  }
  v11 = v10;
  v12 = *(_QWORD *)v35;
LABEL_4:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v12)
      objc_enumerationMutation(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1)
                                                                                                + 8 * v13)));
    memset(uu1, 0, sizeof(uu1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getAgentUUID"));
    objc_msgSend(v15, "getUUIDBytes:", uu1);

    if (!uuid_compare(uu1, a4))
      break;

    if (v11 == (id)++v13)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      if (v11)
        goto LABEL_4;
      goto LABEL_10;
    }
  }

  if (!v14)
    goto LABEL_14;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getAgentData"));
  v17 = objc_msgSend(v16, "length");
  if (v17)
  {
    v18 = (size_t)v17;
    *a5 = (unint64_t)v17;
    v19 = malloc_type_malloc((size_t)v17, 0xE3123B4CuLL);
    v16 = objc_retainAutorelease(v16);
    memcpy(v19, objc_msgSend(v16, "bytes"), v18);
    goto LABEL_28;
  }
LABEL_27:
  v19 = 0;
LABEL_28:

  return v19;
}

- (const)copyProxyAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4
{
  void *v7;
  const void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  v8 = -[AgentController copyConfigAgentData:uuid:length:](self, "copyConfigAgentData:uuid:length:", v7, a3, a4);

  return v8;
}

- (const)copyDNSAgentData:(unsigned __int8)a3[16] length:(unint64_t *)a4
{
  void *v7;
  const void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  v8 = -[AgentController copyConfigAgentData:uuid:length:](self, "copyConfigAgentData:uuid:length:", v7, a3, a4);

  return v8;
}

- (id)dataLengthSanityCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getAgentData"));
  if ((unint64_t)objc_msgSend(v4, "length") < 0x401)
  {
    v8 = 0;
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getAgentUUID"));
    objc_msgSend(v6, "getUUIDBytes:", v10);
    v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v10, 16);
    objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("OutOfBandDataUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0));

  }
  return v8;
}

- (id)sanitizeEntity:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(" #"));
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", v4));
  v6 = v5;

  return v6;
}

- (id)sanitizeInterfaceName:(id)a3
{
  id v3;
  char *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "rangeOfString:", CFSTR("@"));
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v4 + 1));
  v6 = v5;

  return v6;
}

- (int)entityInstanceNumber:(id)a3
{
  id v3;
  char *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "rangeOfString:", CFSTR(" #"));
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v4 + 2));
    v5 = objc_msgSend(v6, "intValue");

  }
  return v5;
}

- (void)cleanConflictingAgentsFromList:(id)a3 new_list:(id)a4 agentDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int v20;
  _BOOL4 v21;
  uint64_t v22;
  __int128 *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  os_log_t v31;
  NSObject *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  __int128 *v36;
  uint64_t v37;
  id v38;
  id obj;
  id obja;
  id v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;

  v8 = a3;
  v38 = a4;
  obj = v8;
  v41 = a5;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController sanitizeEntity:](self, "sanitizeEntity:", v13));
        if ((objc_msgSend(v14, "isEqualToString:", v13) & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v14));
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v13));

          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v16);
          v17 = sub_100007594();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          v19 = _SC_syslog_os_log_mapping(6);
          if (__SC_log_enabled(6, v18, v19))
          {
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v20 = (_sc_log > 0) | 2;
            v51 = 0u;
            v52 = 0u;
            v21 = os_log_type_enabled(v18, (os_log_type_t)v19);
            v47 = 138412546;
            v22 = v21 ? v20 : 2;
            v48 = v14;
            v49 = 2112;
            v50 = v13;
            LODWORD(v37) = 22;
            v23 = (__int128 *)_os_log_send_and_compose_impl(v22, 0, &v51, 256, &_mh_execute_header, v18, v19, "Removing conflicting domain: %@, %@", &v47, v37);
            __SC_log_send2(6, v18, v19, 0, v23);
            if (v23 != &v51)
              free(v23);
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
    }
    while (v10);
  }
  v24 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithArray:", v38);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obja = obj;
  v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(obja);
        v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
        if ((unint64_t)objc_msgSend(v24, "countForObject:", v29) >= 2)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v29));
          -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v30);
          v31 = sub_100007594();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          v33 = _SC_syslog_os_log_mapping(6);
          if (__SC_log_enabled(6, v32, v33))
          {
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v34 = (_sc_log > 0) | 2;
            v51 = 0u;
            v52 = 0u;
            if (os_log_type_enabled(v32, (os_log_type_t)v33))
              v35 = v34;
            else
              v35 = 2;
            v47 = 138412290;
            v48 = v29;
            LODWORD(v37) = 12;
            v36 = (__int128 *)_os_log_send_and_compose_impl(v35, 0, &v51, 256, &_mh_execute_header, v32, v33, "Removing domain %@ as it has duplicates in the current config", &v47, v37);
            __SC_log_send2(6, v32, v33, 0, v36);
            if (v36 != &v51)
              free(v36);
          }

        }
      }
      v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
    }
    while (v26);
  }

}

- (id)getAgentList:(id)a3 agentType:(unint64_t)a4 agentSubType:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "getAgentType") == (id)a4 && objc_msgSend(v14, "getAgentSubType") == (id)a5)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getAssociatedEntity"));
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)deleteAgentList:(id)a3 list:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11)));
        -[AgentController destroyFloatingAgent:](self, "destroyFloatingAgent:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }

}

- (id)getAgentWithSameDataAndSubType:(id)a3 data:(id)a4 subType:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v7 = a3;
  v8 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1)
                                                                                                  + 8 * v13)));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getAgentData"));
      v16 = objc_msgSend(v15, "isEqual:", v8);

      if (v16)
      {
        if (objc_msgSend(v14, "getAgentSubType") == (id)a5)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "getRegistrationObject"));

          if (v17)
            break;
        }
      }

      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v14 = 0;
  }

  return v14;
}

- (BOOL)addPolicyToFloatingAgent:(id)a3 domain:(id)a4 agentUUIDToUse:(id)a5 policyType:(int64_t)a6 useControlPolicySession:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  os_log_t v22;
  NSObject *v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  __int128 *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  os_log_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  __int128 *v48;
  BOOL v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  os_log_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  __int128 *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  os_log_t v77;
  NSObject *v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  __int128 *v82;
  os_log_t v83;
  NSObject *v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  __int128 *v88;
  id v89;
  os_log_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  void *v95;
  __int128 *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  os_log_t v108;
  NSObject *v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  void *v113;
  uint64_t v114;
  os_log_t v115;
  __int128 *v116;
  void *v118;
  id v119;
  unsigned int v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  NSObject *v128;
  id v129;
  void *v130;
  void *v131;
  NSObject *v132;
  NSObject *v133;
  int v134;
  void *v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = a4;
  v130 = v12;
  v15 = objc_msgSend(v12, "getAgentType");
  v16 = v15;
  if (v15 == (id)2)
    v17 = 0;
  else
    v17 = 5000;
  if (v15 == (id)2)
    v18 = 5000;
  else
    v18 = 0;
  v19 = -[AgentController entityInstanceNumber:](self, "entityInstanceNumber:", v14);
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController sanitizeEntity:](self, "sanitizeEntity:", v14));

  switch(a6)
  {
    case 0:
      v120 = v18;
      v20 = 0;
      v21 = v17 + 1000;
      goto LABEL_17;
    case 6:
      v120 = v18;
      v21 = v17 + 500;
      v20 = objc_claimAutoreleasedReturnValue(+[NEPolicyCondition domain:](NEPolicyCondition, "domain:", v131));
      v29 = 750;
      goto LABEL_19;
    case 7:
      v120 = v18;
      v21 = v17 + 1000;
      v20 = objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
LABEL_17:
      v29 = 1250;
      goto LABEL_19;
    case 8:
      v120 = v18;
      v21 = v17 | 0x64;
      v30 = objc_claimAutoreleasedReturnValue(-[AgentController sanitizeInterfaceName:](self, "sanitizeInterfaceName:", v131));

      v20 = objc_claimAutoreleasedReturnValue(+[NEPolicyCondition scopedInterface:](NEPolicyCondition, "scopedInterface:", v30));
      v29 = 250;
      v131 = (void *)v30;
LABEL_19:
      v31 = v21 + v19;
      v129 = v13;
      v32 = objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](NEPolicyResult, "netAgentUUID:", v13));
      v33 = objc_alloc((Class)NEPolicy);
      v34 = v33;
      v124 = (void *)v32;
      v128 = v20;
      if (v20)
      {
        v136 = v20;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v136, 1));
        v36 = objc_msgSend(v34, "initWithOrder:result:conditions:", v31, v32, v35);

        if (v36)
          goto LABEL_21;
LABEL_27:
        v42 = sub_100007594();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        v44 = _SC_syslog_os_log_mapping(5);
        v13 = v129;
        v28 = v130;
        if (__SC_log_enabled(5, v43, v44))
        {
          v151 = 0u;
          v152 = 0u;
          v149 = 0u;
          v150 = 0u;
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          LODWORD(v45) = (_sc_log > 0) | 2;
          v45 = os_log_type_enabled(v43, (os_log_type_t)v44) ? v45 : 2;
          v46 = v43;
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
          v134 = 138412290;
          v135 = v47;
          v48 = (__int128 *)_os_log_send_and_compose_impl(v45, 0, &v137, 256, &_mh_execute_header, v46, v44, "Could not create a policy for agent %@", &v134, 12);

          __SC_log_send2(5, v46, v44, 0, v48);
          if (v48 != &v137)
            free(v48);
        }

        v49 = 0;
        v23 = v128;
        goto LABEL_104;
      }
      v36 = objc_msgSend(v33, "initWithOrder:result:conditions:", v31, v32, 0);
      if (!v36)
        goto LABEL_27;
LABEL_21:
      if (v7)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));

        if (!v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController createPolicySession](self, "createPolicySession"));
          -[AgentController setControlPolicySession:](self, "setControlPolicySession:", v38);

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
          if (!v39)
          {
            v90 = sub_100007594();
            v91 = objc_claimAutoreleasedReturnValue(v90);
            v92 = _SC_syslog_os_log_mapping(5);
            v28 = v130;
            if (__SC_log_enabled(5, v91, v92))
            {
              v151 = 0u;
              v152 = 0u;
              v149 = 0u;
              v150 = 0u;
              v147 = 0u;
              v148 = 0u;
              v145 = 0u;
              v146 = 0u;
              v143 = 0u;
              v144 = 0u;
              v141 = 0u;
              v142 = 0u;
              v139 = 0u;
              v140 = 0u;
              v137 = 0u;
              v138 = 0u;
              LODWORD(v93) = (_sc_log > 0) | 2;
              v93 = os_log_type_enabled(v91, (os_log_type_t)v92) ? v93 : 2;
              v94 = v91;
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
              v134 = 138412290;
              v135 = v95;
              v96 = (__int128 *)_os_log_send_and_compose_impl(v93, 0, &v137, 256, &_mh_execute_header, v94, v92, "Could not create a control policy session for agent %@", &v134, 12);

              __SC_log_send2(5, v94, v92, 0, v96);
              if (v96 != &v137)
                free(v96);
            }

            goto LABEL_46;
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
          objc_msgSend(v40, "setPriority:", 100);

        }
        v41 = objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));
      }
      else
      {
        v41 = objc_claimAutoreleasedReturnValue(-[AgentController policySession](self, "policySession"));
      }
      v50 = (void *)v41;
      objc_msgSend(v130, "setPreferredPolicySession:", v41);

      v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "preferredPolicySession"));
      v52 = objc_msgSend((id)v51, "addPolicy:", v36);
      if (!v52)
      {
        v60 = sub_100007594();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        v62 = _SC_syslog_os_log_mapping(5);
        v28 = v130;
        if (__SC_log_enabled(5, v61, v62))
        {
          v63 = v51;
          v151 = 0u;
          v152 = 0u;
          v149 = 0u;
          v150 = 0u;
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          LODWORD(v51) = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v61, (os_log_type_t)v62))
            v51 = v51;
          else
            v51 = 2;
          v64 = v61;
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
          v134 = 138412290;
          v135 = v65;
          v66 = (__int128 *)_os_log_send_and_compose_impl(v51, 0, &v137, 256, &_mh_execute_header, v64, v62, "Could not add a netagent policy for agent %@", &v134, 12);

          __SC_log_send2(5, v64, v62, 0, v66);
          if (v66 != &v137)
            free(v66);
          v51 = v63;
        }

LABEL_46:
        v49 = 0;
        v23 = v128;
        v13 = v129;
        goto LABEL_104;
      }
      v119 = v52;
      v53 = (v17 + v29);
      v54 = objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", v120));

      v55 = objc_alloc((Class)NEPolicy);
      v56 = v55;
      v23 = v128;
      if (v128)
      {
        v133 = v128;
        v57 = v51;
        v58 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v133, 1));
        v59 = objc_msgSend(v56, "initWithOrder:result:conditions:", v53, v54, v58);

        v36 = (id)v58;
        v51 = v57;
      }
      else
      {
        v59 = objc_msgSend(v55, "initWithOrder:result:conditions:", v53, v54, 0);
      }
      v67 = (void *)v54;

      if (v59)
      {
        v68 = objc_msgSend((id)v51, "addPolicy:", v59);
        v13 = v129;
        if (v68)
        {
          v69 = v68;
          v121 = (void *)v54;
          if (v16 != (id)1)
          {
            v127 = (void *)v51;
            v89 = 0;
LABEL_84:
            v99 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
            v28 = v130;
            v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKey:", v100));

            if (!v101)
              v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v119));
            objc_msgSend(v101, "addObject:", v102);

            v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v69));
            objc_msgSend(v101, "addObject:", v103);

            if (v89)
            {
              v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v89));
              objc_msgSend(v101, "addObject:", v104);

            }
            v105 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
            v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
            objc_msgSend(v105, "setObject:forKey:", v101, v106);

            v49 = 1;
            goto LABEL_103;
          }
          v70 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &ne_privacy_proxy_netagent_id);
          v71 = objc_claimAutoreleasedReturnValue(+[NEPolicyResult removeNetworkAgentUUID:](NEPolicyResult, "removeNetworkAgentUUID:", v70));
          v72 = objc_alloc((Class)NEPolicy);
          v73 = v72;
          v118 = (void *)v71;
          if (v128)
          {
            v132 = v128;
            v74 = v51;
            v75 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v132, 1));
            v76 = objc_msgSend(v73, "initWithOrder:result:conditions:", v31, v71, v75);

            v59 = (id)v75;
            v51 = v74;
          }
          else
          {
            v76 = objc_msgSend(v72, "initWithOrder:result:conditions:", v31, v71, 0);
          }

          v97 = v121;
          if (v76)
          {
            v98 = objc_msgSend((id)v51, "addPolicy:", v76);
            if (v98)
            {
              v89 = v98;
              v127 = (void *)v51;

              v59 = v76;
              goto LABEL_84;
            }
            v107 = v70;
            v115 = sub_100007594();
            v109 = objc_claimAutoreleasedReturnValue(v115);
            v110 = _SC_syslog_os_log_mapping(5);
            if (__SC_log_enabled(5, v109, v110))
            {
              v111 = v51;
              v112 = v128;
              v151 = 0u;
              v152 = 0u;
              v149 = 0u;
              v150 = 0u;
              v147 = 0u;
              v148 = 0u;
              v145 = 0u;
              v146 = 0u;
              v143 = 0u;
              v144 = 0u;
              v141 = 0u;
              v142 = 0u;
              v139 = 0u;
              v140 = 0u;
              v137 = 0u;
              v138 = 0u;
              LODWORD(v51) = (_sc_log > 0) | 2;
              if (os_log_type_enabled(v109, (os_log_type_t)v110))
                v51 = v51;
              else
                v51 = 2;
              v109 = v109;
              v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
              v134 = 138412290;
              v135 = v113;
              v114 = _os_log_send_and_compose_impl(v51, 0, &v137, 256, &_mh_execute_header, v109, v110, "Could not add a privacy proxy removal policy for agent %@", &v134, 12, v118);
LABEL_99:
              v116 = (__int128 *)v114;

              __SC_log_send2(5, v109, v110, 0, v116);
              if (v116 != &v137)
                free(v116);
              v23 = v112;
              v51 = v111;
              v97 = v121;
            }
          }
          else
          {
            v107 = v70;
            v108 = sub_100007594();
            v109 = objc_claimAutoreleasedReturnValue(v108);
            v110 = _SC_syslog_os_log_mapping(5);
            if (__SC_log_enabled(5, v109, v110))
            {
              v111 = v51;
              v112 = v128;
              v151 = 0u;
              v152 = 0u;
              v149 = 0u;
              v150 = 0u;
              v147 = 0u;
              v148 = 0u;
              v145 = 0u;
              v146 = 0u;
              v143 = 0u;
              v144 = 0u;
              v141 = 0u;
              v142 = 0u;
              v139 = 0u;
              v140 = 0u;
              v137 = 0u;
              v138 = 0u;
              LODWORD(v51) = (_sc_log > 0) | 2;
              if (os_log_type_enabled(v109, (os_log_type_t)v110))
                v51 = v51;
              else
                v51 = 2;
              v109 = v109;
              v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
              v134 = 138412290;
              v135 = v113;
              v114 = _os_log_send_and_compose_impl(v51, 0, &v137, 256, &_mh_execute_header, v109, v110, "Could not create a policy for agent %@", &v134, 12, v118);
              goto LABEL_99;
            }
          }

          v49 = 0;
          v28 = v130;
LABEL_103:
          v13 = v129;
          goto LABEL_104;
        }
        v83 = sub_100007594();
        v84 = objc_claimAutoreleasedReturnValue(v83);
        v85 = _SC_syslog_os_log_mapping(5);
        v28 = v130;
        if (__SC_log_enabled(5, v84, v85))
        {
          v123 = v67;
          v126 = v51;
          v151 = 0u;
          v152 = 0u;
          v149 = 0u;
          v150 = 0u;
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          LODWORD(v51) = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v84, (os_log_type_t)v85))
            v51 = v51;
          else
            v51 = 2;
          v86 = v84;
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
          v134 = 138412290;
          v135 = v87;
          v88 = (__int128 *)_os_log_send_and_compose_impl(v51, 0, &v137, 256, &_mh_execute_header, v86, v85, "Could not add a skip policy for agent %@", &v134, 12);

          __SC_log_send2(5, v86, v85, 0, v88);
          if (v88 != &v137)
            free(v88);
          v51 = v126;
          v23 = v128;
          v67 = v123;
        }

      }
      else
      {
        v77 = sub_100007594();
        v78 = objc_claimAutoreleasedReturnValue(v77);
        v79 = _SC_syslog_os_log_mapping(5);
        v13 = v129;
        v28 = v130;
        if (__SC_log_enabled(5, v78, v79))
        {
          v122 = v67;
          v125 = v51;
          v151 = 0u;
          v152 = 0u;
          v149 = 0u;
          v150 = 0u;
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          LODWORD(v51) = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v78, (os_log_type_t)v79))
            v51 = v51;
          else
            v51 = 2;
          v80 = v78;
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "getAgentName"));
          v134 = 138412290;
          v135 = v81;
          v82 = (__int128 *)_os_log_send_and_compose_impl(v51, 0, &v137, 256, &_mh_execute_header, v80, v79, "Could not create a policy for agent %@", &v134, 12);

          __SC_log_send2(5, v80, v79, 0, v82);
          if (v82 != &v137)
            free(v82);
          v67 = v122;
          v51 = v125;
        }

      }
LABEL_71:
      v49 = 0;
LABEL_104:

      return v49;
    default:
      v22 = sub_100007594();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v24 = _SC_syslog_os_log_mapping(5);
      if (!__SC_log_enabled(5, v23, v24))
      {
        v49 = 0;
        v28 = v130;
        goto LABEL_104;
      }
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v25 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v23, (os_log_type_t)v24))
        v26 = v25;
      else
        v26 = 2;
      LOWORD(v134) = 0;
      v27 = (__int128 *)_os_log_send_and_compose_impl(v26, 0, &v137, 256, &_mh_execute_header, v23, v24, "Invalid policy condition specified", &v134, 2);
      __SC_log_send2(5, v23, v24, 0, v27);
      v28 = v130;
      if (v27 != &v137)
        free(v27);
      goto LABEL_71;
  }
}

- (BOOL)spawnFloatingAgent:(Class)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 publishData:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  os_log_t v19;
  NSObject *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  _OWORD *v24;
  void *v25;
  void *v26;
  BOOL v27;
  int v29;
  id v30;
  _OWORD v31[16];

  v12 = a4;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("EntityName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("AgentSubType"));

  v16 = objc_msgSend([a3 alloc], "initWithParameters:", v14);
  if (!-[AgentController registerAgent:](self, "registerAgent:", v16))
    goto LABEL_17;
  if (v13)
  {
    objc_msgSend(v16, "updateAgentData:", v13);
    -[AgentController publishToAgent:](self, "publishToAgent:", v16);
  }
  if ((a6 & 0x8000000000000000) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "agentUUID"));
    v18 = -[AgentController addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:](self, "addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:", v16, v12, v17, a6, a5 == 7);

    if ((v18 & 1) == 0)
    {
      -[AgentController unregisterAgent:](self, "unregisterAgent:", v16);
LABEL_17:
      v27 = 0;
      goto LABEL_18;
    }
  }
  v19 = sub_100007594();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = _SC_syslog_os_log_mapping(6);
  if (__SC_log_enabled(6, v20, v21))
  {
    memset(v31, 0, sizeof(v31));
    v22 = (_sc_log > 0) | 2;
    v23 = os_log_type_enabled(v20, (os_log_type_t)v21) ? v22 : 2;
    v29 = 138412290;
    v30 = v12;
    v24 = (_OWORD *)_os_log_send_and_compose_impl(v23, 0, v31, 256, &_mh_execute_header, v20, v21, "Spawning floating agent for %@", &v29, 12);
    __SC_log_send2(6, v20, v21, 0, v24);
    if (v24 != v31)
      free(v24);
  }

  if (objc_msgSend(v16, "getAgentType") == (id)1)
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
  else
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
  v26 = v25;
  objc_msgSend(v25, "setObject:forKey:", v16, v12);

  v27 = 1;
LABEL_18:

  return v27;
}

- (BOOL)spawnMappedFloatingAgent:(id)a3 entity:(id)a4 agentSubType:(unint64_t)a5 addPolicyOfType:(int64_t)a6 updateData:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _OWORD *v31;
  BOOL v33;
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  _OWORD v39[16];

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v15, "setValue:forKey:", v13, CFSTR("EntityName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("AgentSubType"));

  v17 = objc_msgSend(objc_alloc((Class)objc_opt_class(v12)), "initWithParameters:", v15);
  v18 = v17;
  if (v14)
    objc_msgSend(v17, "updateAgentData:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "agentUUID"));
  v20 = -[AgentController addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:](self, "addPolicyToFloatingAgent:domain:agentUUIDToUse:policyType:useControlPolicySession:", v18, v13, v19, a6, a5 == 7);

  if (v20)
  {
    if (objc_msgSend(v12, "getAgentType") == (id)1)
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
    else
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
    v22 = v21;
    objc_msgSend(v21, "setObject:forKey:", v18, v13);

    objc_msgSend(v18, "setAgentMapping:", v12);
    v23 = sub_100007594();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = _SC_syslog_os_log_mapping(6);
    if (__SC_log_enabled(6, v24, v25))
    {
      v33 = v20;
      v34 = v14;
      memset(v39, 0, sizeof(v39));
      v26 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v24, (os_log_type_t)v25))
        v27 = v26;
      else
        v27 = 2;
      v28 = v24;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getAgentName"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getAgentName"));
      v35 = 138412546;
      v36 = v29;
      v37 = 2112;
      v38 = v30;
      v31 = (_OWORD *)_os_log_send_and_compose_impl(v27, 0, v39, 256, &_mh_execute_header, v28, v25, "Mapped floating agent %@ to %@", &v35, 22);

      __SC_log_send2(6, v28, v25, 0, v31);
      if (v31 != v39)
        free(v31);
      v14 = v34;
      LOBYTE(v20) = v33;
    }

  }
  return v20;
}

- (BOOL)publishToAgent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 *v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 *v27;
  BOOL v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  os_log_t v32;
  unsigned int v33;
  uint64_t v34;
  __int128 *v35;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController dataLengthSanityCheck:](self, "dataLengthSanityCheck:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAgentData"));
    v7 = objc_msgSend(v6, "copy");

    objc_msgSend(v4, "updateAgentData:", v5);
    v8 = sub_100007594();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v9, v10))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v11 = (_sc_log > 0) | 2;
      v12 = os_log_type_enabled(v9, (os_log_type_t)v10) ? v11 : 2;
      v13 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAgentName"));
      v39 = 138412546;
      v40 = v14;
      v41 = 2048;
      v42 = objc_msgSend(v7, "length");
      v15 = (__int128 *)_os_log_send_and_compose_impl(v12, 0, &v43, 256, &_mh_execute_header, v13, v10, "Data too large for %@ (%lu bytes)!", &v39, 22);

      __SC_log_send2(5, v13, v10, 0, v15);
      if (v15 != &v43)
        free(v15);
    }

  }
  else
  {
    v7 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("registrationObject")));
  v17 = sub_100007594();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = _SC_syslog_os_log_mapping(5);
  v20 = __SC_log_enabled(5, v18, v19);
  if (!v16)
  {
    if (!v20)
      goto LABEL_33;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
      v30 = v29;
    else
      v30 = 2;
    LOWORD(v39) = 0;
    LODWORD(v37) = 2;
    v31 = _os_log_send_and_compose_impl(v30, 0, &v43, 256, &_mh_execute_header, v18, v19, "Config Agent not registered. Cannot Update", &v39, v37);
    goto LABEL_31;
  }
  if (v20)
  {
    v38 = v5;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v21 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
      v22 = v21;
    else
      v22 = 2;
    v23 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAgentName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAgentData"));
    v26 = objc_msgSend(v25, "length");
    v39 = 138412546;
    v40 = v24;
    v41 = 2048;
    v42 = v26;
    LODWORD(v37) = 22;
    v27 = (__int128 *)_os_log_send_and_compose_impl(v22, 0, &v43, 256, &_mh_execute_header, v23, v19, "Publishing data to agent %@ (%lu bytes)", &v39, v37);

    __SC_log_send2(5, v23, v19, 0, v27);
    if (v27 != &v43)
      free(v27);
    v5 = v38;
  }

  if ((objc_msgSend(v16, "updateNetworkAgent:", v4) & 1) != 0)
  {
    v28 = 1;
    if (!v7)
      goto LABEL_35;
    goto LABEL_34;
  }
  v32 = sub_100007594();
  v18 = objc_claimAutoreleasedReturnValue(v32);
  v19 = _SC_syslog_os_log_mapping(5);
  if (__SC_log_enabled(5, v18, v19))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v33 = (_sc_log > 0) | 2;
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
      v34 = v33;
    else
      v34 = 2;
    LOWORD(v39) = 0;
    LODWORD(v37) = 2;
    v31 = _os_log_send_and_compose_impl(v34, 0, &v43, 256, &_mh_execute_header, v18, v19, "Could not update config agent", &v39, v37);
LABEL_31:
    v35 = (__int128 *)v31;
    __SC_log_send2(5, v18, v19, 0, v31);
    if (v35 != &v43)
      free(v35);
  }
LABEL_33:

  v28 = 0;
  if (v7)
LABEL_34:
    objc_msgSend(v4, "updateAgentData:", v7);
LABEL_35:

  return v28;
}

- (BOOL)destroyFloatingAgent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  os_log_t v16;
  NSObject *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 *v26;
  void *v27;
  void *v28;
  os_log_t v29;
  NSObject *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  __int128 *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  AgentController *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  os_log_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  __int128 *v56;
  os_log_t v57;
  NSObject *v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  __int128 *v62;
  uint64_t v64;
  AgentController *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id obj;
  id obja;
  int v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAssociatedEntity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](self, "policyDB"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getAgentName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

    if (v9)
    {
      v65 = self;
      v67 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredPolicySession"));
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v66 = v9;
      obj = v9;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v93, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v95;
        v69 = *(_QWORD *)v95;
        do
        {
          v14 = 0;
          v70 = v12;
          do
          {
            if (*(_QWORD *)v95 != v13)
              objc_enumerationMutation(obj);
            v15 = objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v14), "unsignedIntegerValue");
            if ((objc_msgSend(v10, "removePolicyWithID:", v15) & 1) == 0)
            {
              v16 = sub_100007594();
              v17 = objc_claimAutoreleasedReturnValue(v16);
              v18 = _SC_syslog_os_log_mapping(5);
              if (__SC_log_enabled(5, v17, v18))
              {
                v91 = 0u;
                v92 = 0u;
                v89 = 0u;
                v90 = 0u;
                v87 = 0u;
                v88 = 0u;
                v85 = 0u;
                v86 = 0u;
                v83 = 0u;
                v84 = 0u;
                v81 = 0u;
                v82 = 0u;
                v79 = 0u;
                v80 = 0u;
                v19 = (_sc_log > 0) | 2;
                v77 = 0u;
                v78 = 0u;
                if (os_log_type_enabled(v17, (os_log_type_t)v18))
                  v20 = v19;
                else
                  v20 = 2;
                v21 = v17;
                v22 = v10;
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "policyWithID:", v15));
                v24 = v5;
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getAgentName"));
                v73 = 138412546;
                v74 = v23;
                v75 = 2112;
                v76 = v25;
                LODWORD(v64) = 22;
                v26 = (__int128 *)_os_log_send_and_compose_impl(v20, 0, &v77, 256, &_mh_execute_header, v21, v18, "Could not remove policy %@ for agent %@", &v73, v64);

                __SC_log_send2(5, v21, v18, 0, v26);
                if (v26 != &v77)
                  free(v26);
                v5 = v24;
                v10 = v22;
                v13 = v69;
                v12 = v70;
              }

            }
            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v93, 16);
        }
        while (v12);
      }

      self = v65;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController policyDB](v65, "policyDB"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getAgentName"));
      objc_msgSend(v27, "removeObjectForKey:", v28);

      v9 = v66;
      v6 = v67;
    }
    v29 = sub_100007594();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = _SC_syslog_os_log_mapping(6);
    if (__SC_log_enabled(6, v30, v31))
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v32 = (_sc_log > 0) | 2;
      v77 = 0u;
      v78 = 0u;
      v33 = os_log_type_enabled(v30, (os_log_type_t)v31) ? v32 : 2;
      v73 = 138412290;
      v74 = v6;
      LODWORD(v64) = 12;
      v34 = (__int128 *)_os_log_send_and_compose_impl(v33, 0, &v77, 256, &_mh_execute_header, v30, v31, "Destroying floating agent for %@", &v73, v64);
      __SC_log_send2(6, v30, v31, 0, v34);
      if (v34 != &v77)
        free(v34);
    }

    if (objc_msgSend(v5, "getAgentType") == (id)1)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      objc_msgSend(v35, "removeObjectForKey:", v6);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));
      objc_msgSend(v36, "removeObjectForKey:", v6);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList_TCPConverter](self, "floatingProxyAgentList_TCPConverter"));
      v38 = objc_msgSend(v37, "count");

      if (!v38)
        sub_10004E900(0);
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getAssociatedEntity"));
      objc_msgSend(v39, "removeObjectForKey:", v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getRegistrationObject"));

    if (v41)
      -[AgentController unregisterAgent:](self, "unregisterAgent:", v5);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](self, "controlPolicySession"));

    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingProxyAgentList](self, "floatingProxyAgentList"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v43, 1, 7));

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController floatingDNSAgentList](self, "floatingDNSAgentList"));
      v46 = self;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController getAgentList:agentType:agentSubType:](self, "getAgentList:agentType:agentSubType:", v45, 2, 7));

      if (!objc_msgSend(v44, "count") && !objc_msgSend(v47, "count"))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[AgentController controlPolicySession](v46, "controlPolicySession"));
        v49 = objc_msgSend(v48, "removeAllPolicies");

        if ((v49 & 1) == 0)
        {
          v68 = v6;
          v50 = sub_100007594();
          v51 = objc_claimAutoreleasedReturnValue(v50);
          v52 = _SC_syslog_os_log_mapping(3);
          if (__SC_log_enabled(3, v51, v52))
          {
            v91 = 0u;
            v92 = 0u;
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v79 = 0u;
            v80 = 0u;
            LODWORD(v53) = (_sc_log > 0) | 2;
            v77 = 0u;
            v78 = 0u;
            if (os_log_type_enabled(v51, (os_log_type_t)v52))
              v53 = v53;
            else
              v53 = 2;
            v54 = v51;
            obja = v5;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getAgentName"));
            v73 = 138412290;
            v74 = v55;
            LODWORD(v64) = 12;
            v56 = (__int128 *)_os_log_send_and_compose_impl(v53, 0, &v77, 256, &_mh_execute_header, v54, v52, "Could not remove policies for agent %@", &v73, v64);

            __SC_log_send2(3, v54, v52, 0, v56);
            if (v56 != &v77)
              free(v56);
            v5 = obja;
          }

          v6 = v68;
        }
        -[AgentController setControlPolicySession:](v46, "setControlPolicySession:", 0);
        v57 = sub_100007594();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        v59 = _SC_syslog_os_log_mapping(5);
        if (__SC_log_enabled(5, v58, v59))
        {
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v60 = (_sc_log > 0) | 2;
          v77 = 0u;
          v78 = 0u;
          if (os_log_type_enabled(v58, (os_log_type_t)v59))
            v61 = v60;
          else
            v61 = 2;
          LOWORD(v73) = 0;
          LODWORD(v64) = 2;
          v62 = (__int128 *)_os_log_send_and_compose_impl(v61, 0, &v77, 256, &_mh_execute_header, v58, v59, "Closed control policy session", &v73, v64);
          __SC_log_send2(5, v58, v59, 0, v62);
          if (v62 != &v77)
            free(v62);
        }

      }
    }

  }
  return v5 != 0;
}

- (BOOL)registerAgent:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  _OWORD *v11;
  _WORD v13[8];
  _OWORD v14[16];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NWNetworkAgentRegistration), "initWithNetworkAgentClass:", objc_opt_class(v3));
  v5 = objc_msgSend(v4, "registerNetworkAgent:", v3);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "addAgentRegistrationObject:", v4);
  }
  else
  {
    v6 = sub_100007594();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v7, v8))
    {
      memset(v14, 0, sizeof(v14));
      v9 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v7, (os_log_type_t)v8))
        v10 = v9;
      else
        v10 = 2;
      v13[0] = 0;
      v11 = (_OWORD *)_os_log_send_and_compose_impl(v10, 0, v14, 256, &_mh_execute_header, v7, v8, "Could not register config agent", v13, 2);
      __SC_log_send2(5, v7, v8, 0, v11);
      if (v11 != v14)
        free(v11);
    }

  }
  return v5;
}

- (BOOL)unregisterAgent:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  os_log_t v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  os_log_t v12;
  unsigned int v13;
  uint64_t v14;
  __int128 *v15;
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("registrationObject")));
  v4 = v3;
  if (!v3)
  {
    v6 = sub_100007594();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v7, v8))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v7, (os_log_type_t)v8))
        v10 = v9;
      else
        v10 = 2;
      LOWORD(v17[0]) = 0;
      v11 = _os_log_send_and_compose_impl(v10, 0, &v18, 256, &_mh_execute_header, v7, v8, "Config Agent not registered. Cannot unregister", v17, 2, v17[0]);
      goto LABEL_14;
    }
LABEL_16:

    v5 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "unregisterNetworkAgent") & 1) == 0)
  {
    v12 = sub_100007594();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    v8 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v7, v8))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v7, (os_log_type_t)v8))
        v14 = v13;
      else
        v14 = 2;
      LOWORD(v17[0]) = 0;
      v11 = _os_log_send_and_compose_impl(v14, 0, &v18, 256, &_mh_execute_header, v7, v8, "Could not unregister config agent", v17, 2, v17[0]);
LABEL_14:
      v15 = (__int128 *)v11;
      __SC_log_send2(5, v7, v8, 0, v11);
      if (v15 != &v18)
        free(v15);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v5 = 1;
LABEL_17:

  return v5;
}

- (OS_dispatch_queue)controllerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setControllerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)floatingProxyAgentList
{
  return self->_floatingProxyAgentList;
}

- (void)setFloatingProxyAgentList:(id)a3
{
  objc_storeStrong((id *)&self->_floatingProxyAgentList, a3);
}

- (NSMutableDictionary)floatingProxyAgentList_TCPConverter
{
  return self->_floatingProxyAgentList_TCPConverter;
}

- (void)setFloatingProxyAgentList_TCPConverter:(id)a3
{
  objc_storeStrong((id *)&self->_floatingProxyAgentList_TCPConverter, a3);
}

- (NSMutableDictionary)floatingDNSAgentList
{
  return self->_floatingDNSAgentList;
}

- (void)setFloatingDNSAgentList:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDNSAgentList, a3);
}

- (NSMutableDictionary)policyDB
{
  return self->_policyDB;
}

- (void)setPolicyDB:(id)a3
{
  objc_storeStrong((id *)&self->_policyDB, a3);
}

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
  objc_storeStrong((id *)&self->_policySession, a3);
}

- (NEPolicySession)controlPolicySession
{
  return self->_controlPolicySession;
}

- (void)setControlPolicySession:(id)a3
{
  objc_storeStrong((id *)&self->_controlPolicySession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPolicySession, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_policyDB, 0);
  objc_storeStrong((id *)&self->_floatingDNSAgentList, 0);
  objc_storeStrong((id *)&self->_floatingProxyAgentList_TCPConverter, 0);
  objc_storeStrong((id *)&self->_floatingProxyAgentList, 0);
  objc_storeStrong((id *)&self->_controllerQueue, 0);
}

@end
