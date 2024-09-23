@implementation QoSMarkingController

- (id)createPolicySession
{
  return objc_alloc_init((Class)NEPolicySession);
}

- (BOOL)qosMarkingPolicyEnabled:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  int v16;
  id v17;
  _OWORD v18[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", v5));
  if (v6)
  {
    v7 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      v9 = sub_100061A68();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v10, v11))
      {
        memset(v18, 0, sizeof(v18));
        v12 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v10, (os_log_type_t)v11))
          v13 = v12;
        else
          v13 = 2;
        v16 = 138412290;
        v17 = v5;
        v14 = (_OWORD *)_os_log_send_and_compose_impl(v13, 0, v18, 256, &_mh_execute_header, v10, v11, "%@ not valid", &v16, 12);
        __SC_log_send2(3, v10, v11, 0, v14);
        if (v14 != v18)
          free(v14);
      }

      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)qosMarkingIsEnabled:(id)a3
{
  return -[QoSMarkingController qosMarkingPolicyEnabled:forKey:](self, "qosMarkingPolicyEnabled:forKey:", a3, kSCPropNetQoSMarkingEnabled);
}

- (BOOL)qosMarkingIsAppleAudioVideoCallsEnabled:(id)a3
{
  return -[QoSMarkingController qosMarkingPolicyEnabled:forKey:](self, "qosMarkingPolicyEnabled:forKey:", a3, kSCPropNetQoSMarkingAppleAudioVideoCalls);
}

- (id)qosMarkingAllowListAppIdentifiers:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  __int128 *v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  __int128 *v23;
  int v25;
  int v26;
  _WORD v27[8];
  _BYTE v28[128];
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", kSCPropNetQoSMarkingAllowListAppIdentifiers));
  if (v3 && (v4 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    v19 = sub_100061A68();
    v5 = objc_claimAutoreleasedReturnValue(v19);
    v20 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v5, v20))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v21 = (_sc_log > 0) | 2;
      v22 = os_log_type_enabled(v5, (os_log_type_t)v20) ? v21 : 2;
      v27[0] = 0;
      v26 = 2;
      v23 = (__int128 *)_os_log_send_and_compose_impl(v22, 0, &v33, 256, &_mh_execute_header, v5, v20, "QoSMarkingAllowListAppIdentifiers list not valid", v27, v26);
      __SC_log_send2(3, v5, v20, 0, v23);
      if (v23 != &v33)
        free(v23);
    }
LABEL_27:

    v12 = 0;
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = v3;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v9);
          if (v10)
          {
            v11 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0 || !objc_msgSend(v10, "length"))
            {
              v13 = sub_100061A68();
              v14 = objc_claimAutoreleasedReturnValue(v13);
              v15 = _SC_syslog_os_log_mapping(3);
              if (__SC_log_enabled(3, v14, v15))
              {
                v47 = 0u;
                v48 = 0u;
                v45 = 0u;
                v46 = 0u;
                v43 = 0u;
                v44 = 0u;
                v41 = 0u;
                v42 = 0u;
                v39 = 0u;
                v40 = 0u;
                v37 = 0u;
                v38 = 0u;
                v35 = 0u;
                v36 = 0u;
                v33 = 0u;
                v34 = 0u;
                v16 = (_sc_log > 0) | 2;
                if (os_log_type_enabled(v14, (os_log_type_t)v15))
                  v17 = v16;
                else
                  v17 = 2;
                v27[0] = 0;
                v25 = 2;
                v18 = (__int128 *)_os_log_send_and_compose_impl(v17, 0, &v33, 256, &_mh_execute_header, v14, v15, "QoSMarkingAllowListAppIdentifiers not valid", v27, v25);
                __SC_log_send2(3, v14, v15, 0, v18);
                if (v18 != &v33)
                  free(v18);
              }

              goto LABEL_27;
            }
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        if (v7)
          continue;
        break;
      }
    }

    v12 = v5;
  }

  return v12;
}

- (void)addAllowListPathPolicy:(id)a3 forPath:(id)a4 order:(unsigned int)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  __int128 *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  __int128 *v38;
  id v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  __int128 *v43;
  uint64_t v44;
  void *v45;
  id obj;
  id v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v54;
  id v55;
  __int16 v56;
  _BYTE v57[24];
  _QWORD v58[2];
  _BYTE v59[128];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;

  v7 = a3;
  v8 = a4;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_policySessions, "objectForKeyedSubscript:", v7));
  if (v52)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyRouteRule routeRuleWithAction:forInterfaceName:](NEPolicyRouteRule, "routeRuleWithAction:forInterfaceName:", 3, v7));
    v64 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult routeRules:](NEPolicyResult, "routeRules:", v10));

    v11 = objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
    v12 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", v8);
    v13 = v12;
    v49 = v11;
    if (v12 && objc_msgSend(v12, "count"))
    {
      v45 = v9;
      v47 = v8;
      v48 = v7;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v59, 16);
      if (!v14)
        goto LABEL_25;
      v15 = v14;
      v50 = *(_QWORD *)v61;
      while (1)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v61 != v50)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v17));
          v19 = objc_alloc((Class)NEPolicy);
          v58[0] = v18;
          v58[1] = v11;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 2));
          v21 = objc_msgSend(v19, "initWithOrder:result:conditions:", a5, v51, v20);

          v22 = objc_msgSend(v52, "addPolicy:", v21);
          v23 = sub_100061A68();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (v22)
          {
            v25 = _SC_syslog_os_log_mapping(5);
            if (!__SC_log_enabled(5, v24, v25))
              goto LABEL_23;
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            LODWORD(v26) = (_sc_log > 0) | 2;
            v65 = 0u;
            v66 = 0u;
            if (os_log_type_enabled(v24, (os_log_type_t)v25))
              v26 = v26;
            else
              v26 = 2;
            v27 = v24;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
            v54 = 138413058;
            v55 = v48;
            v56 = 1024;
            *(_DWORD *)v57 = a5;
            *(_WORD *)&v57[4] = 2112;
            *(_QWORD *)&v57[6] = v47;
            *(_WORD *)&v57[14] = 2112;
            *(_QWORD *)&v57[16] = v28;
            LODWORD(v44) = 38;
            v29 = (__int128 *)_os_log_send_and_compose_impl(v26, 0, &v65, 256, &_mh_execute_header, v27, v25, "QoS marking policy: %@: %u: allowlist path \"%@\" (%@)", &v54, v44);

            v30 = 5;
          }
          else
          {
            v25 = _SC_syslog_os_log_mapping(3);
            if (!__SC_log_enabled(3, v24, v25))
              goto LABEL_23;
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            LODWORD(v31) = (_sc_log > 0) | 2;
            v65 = 0u;
            v66 = 0u;
            if (os_log_type_enabled(v24, (os_log_type_t)v25))
              v31 = v31;
            else
              v31 = 2;
            v27 = v24;
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
            v54 = 138412802;
            v55 = v48;
            v56 = 2112;
            *(_QWORD *)v57 = v47;
            *(_WORD *)&v57[8] = 2112;
            *(_QWORD *)&v57[10] = v32;
            LODWORD(v44) = 32;
            v29 = (__int128 *)_os_log_send_and_compose_impl(v31, 0, &v65, 256, &_mh_execute_header, v27, v25, "QoS marking policy: %@: could not add allowlist policy for path \"%@\" (%@)", &v54, v44);

            v30 = 3;
          }
          __SC_log_send2(v30, v27, v25, 0, v29);
          if (v29 != &v65)
            free(v29);
          v11 = v49;
LABEL_23:

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v59, 16);
        if (!v15)
        {
LABEL_25:

          v8 = v47;
          v7 = v48;
          goto LABEL_40;
        }
      }
    }
    v33 = sub_100061A68();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v34, v35))
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v36 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v34, (os_log_type_t)v35))
        v37 = v36;
      else
        v37 = 2;
      v54 = 138412546;
      v55 = v7;
      v56 = 2112;
      *(_QWORD *)v57 = v8;
      v38 = (__int128 *)_os_log_send_and_compose_impl(v37, 0, &v65, 256, &_mh_execute_header, v34, v35, "QoS marking policy: %@: could not add path \"%@\", &v54, 22);
      __SC_log_send2(3, v34, v35, 0, v38);
      if (v38 != &v65)
        free(v38);
      v11 = v49;
    }

  }
  else
  {
    v39 = sub_100061A68();
    v11 = objc_claimAutoreleasedReturnValue(v39);
    v40 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v11, v40))
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v41 = (_sc_log > 0) | 2;
      v42 = os_log_type_enabled(v11, (os_log_type_t)v40) ? v41 : 2;
      v54 = 138412290;
      v55 = v7;
      v43 = (__int128 *)_os_log_send_and_compose_impl(v42, 0, &v65, 256, &_mh_execute_header, v11, v40, "QoS marking policy: %@: no session", &v54, 12);
      __SC_log_send2(3, v11, v40, 0, v43);
      if (v43 != &v65)
        free(v43);
    }
  }
LABEL_40:

}

- (void)addAllowListAppIdentifierPolicy:(id)a3 forApp:(id)a4 order:(unsigned int)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  __int128 *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  __int128 *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  __int128 *v42;
  uint64_t v43;
  void *v44;
  id obj;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v53;
  id v54;
  __int16 v55;
  _BYTE v56[24];
  _QWORD v57[2];
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;

  v7 = a3;
  v47 = a4;
  if (objc_msgSend(v47, "hasPrefix:", CFSTR("/")))
  {
    if (qword_10007E030 != -1)
      dispatch_once(&qword_10007E030, &stru_1000771E0);
    if (byte_10007E028)
      -[QoSMarkingController addAllowListPathPolicy:forPath:order:](self, "addAllowListPathPolicy:forPath:order:", v7, v47, a5);
    goto LABEL_44;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_policySessions, "objectForKeyedSubscript:", v7));
  if (v51)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyRouteRule routeRuleWithAction:forInterfaceName:](NEPolicyRouteRule, "routeRuleWithAction:forInterfaceName:", 3, v7));
    v63 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult routeRules:](NEPolicyResult, "routeRules:", v9));

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
    v10 = +[NEProcessInfo copyUUIDsForBundleID:uid:](NEProcessInfo, "copyUUIDsForBundleID:uid:", v47, 0);
    v11 = v10;
    if (v10 && objc_msgSend(v10, "count"))
    {
      v44 = v8;
      v46 = v7;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v11;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
      if (!v12)
        goto LABEL_29;
      v13 = v12;
      v48 = *(_QWORD *)v60;
      while (1)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v48)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition effectiveApplication:](NEPolicyCondition, "effectiveApplication:", v15));
          v17 = objc_alloc((Class)NEPolicy);
          v57[0] = v16;
          v57[1] = v49;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2));
          v19 = objc_msgSend(v17, "initWithOrder:result:conditions:", a5, v50, v18);

          v20 = objc_msgSend(v51, "addPolicy:", v19);
          v21 = sub_100061A68();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (v20)
          {
            v23 = _SC_syslog_os_log_mapping(5);
            if (!__SC_log_enabled(5, v22, v23))
              goto LABEL_27;
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            LODWORD(v24) = (_sc_log > 0) | 2;
            v64 = 0u;
            v65 = 0u;
            if (os_log_type_enabled(v22, (os_log_type_t)v23))
              v24 = v24;
            else
              v24 = 2;
            v25 = v22;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
            v53 = 138413058;
            v54 = v46;
            v55 = 1024;
            *(_DWORD *)v56 = a5;
            *(_WORD *)&v56[4] = 2112;
            *(_QWORD *)&v56[6] = v47;
            *(_WORD *)&v56[14] = 2112;
            *(_QWORD *)&v56[16] = v26;
            LODWORD(v43) = 38;
            v27 = (__int128 *)_os_log_send_and_compose_impl(v24, 0, &v64, 256, &_mh_execute_header, v25, v23, "QoS marking policy: %@: %u: allowlist bundleID \"%@\" (%@)", &v53, v43);

            v28 = 5;
          }
          else
          {
            v23 = _SC_syslog_os_log_mapping(3);
            if (!__SC_log_enabled(3, v22, v23))
              goto LABEL_27;
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            LODWORD(v29) = (_sc_log > 0) | 2;
            v64 = 0u;
            v65 = 0u;
            if (os_log_type_enabled(v22, (os_log_type_t)v23))
              v29 = v29;
            else
              v29 = 2;
            v25 = v22;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
            v53 = 138412802;
            v54 = v46;
            v55 = 2112;
            *(_QWORD *)v56 = v47;
            *(_WORD *)&v56[8] = 2112;
            *(_QWORD *)&v56[10] = v30;
            LODWORD(v43) = 32;
            v27 = (__int128 *)_os_log_send_and_compose_impl(v29, 0, &v64, 256, &_mh_execute_header, v25, v23, "QoS marking policy: %@: could not add allowlist policy for bundleID \"%@\" (%@)", &v53, v43);

            v28 = 3;
          }
          __SC_log_send2(v28, v25, v23, 0, v27);
          if (v27 != &v64)
            free(v27);
LABEL_27:

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
        if (!v13)
        {
LABEL_29:

          v7 = v46;
          goto LABEL_44;
        }
      }
    }
    v31 = sub_100061A68();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v32, v33))
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v34 = (_sc_log > 0) | 2;
      v35 = os_log_type_enabled(v32, (os_log_type_t)v33) ? v34 : 2;
      v53 = 138412546;
      v54 = v7;
      v55 = 2112;
      *(_QWORD *)v56 = v47;
      v36 = (__int128 *)_os_log_send_and_compose_impl(v35, 0, &v64, 256, &_mh_execute_header, v32, v33, "QoS marking policy: %@: could not add bundleID \"%@\", &v53, 22);
      __SC_log_send2(3, v32, v33, 0, v36);
      if (v36 != &v64)
        free(v36);
    }

  }
  else
  {
    v37 = sub_100061A68();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v39 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v38, v39))
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v40 = (_sc_log > 0) | 2;
      v41 = os_log_type_enabled(v38, (os_log_type_t)v39) ? v40 : 2;
      v53 = 138412290;
      v54 = v7;
      v42 = (__int128 *)_os_log_send_and_compose_impl(v41, 0, &v64, 256, &_mh_execute_header, v38, v39, "QoS marking policy: %@: no session", &v53, 12);
      __SC_log_send2(3, v38, v39, 0, v42);
      if (v42 != &v64)
        free(v42);
    }

  }
LABEL_44:

}

- (QoSMarkingController)init
{
  QoSMarkingController *v2;
  QoSMarkingController *v3;
  NSArray *interfaces;
  uint64_t v5;
  NSMutableDictionary *policySessions;
  uint64_t v7;
  NSMutableDictionary *requested;
  uint64_t v9;
  NSMutableDictionary *enabled;
  uint64_t v11;
  NSMutableDictionary *enabledAV;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)QoSMarkingController;
  v2 = -[QoSMarkingController init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    interfaces = v2->_interfaces;
    v2->_interfaces = 0;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    policySessions = v3->_policySessions;
    v3->_policySessions = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    requested = v3->_requested;
    v3->_requested = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    enabled = v3->_enabled;
    v3->_enabled = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    enabledAV = v3->_enabledAV;
    v3->_enabledAV = (NSMutableDictionary *)v11;

  }
  return v3;
}

- (void)updatePolicy:(id)a3 forInterface:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  __int128 *v21;
  int v22;
  int v23;
  int v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  __int128 *v32;
  id v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  int v37;
  int v38;
  NSObject *v39;
  int *v40;
  char *v41;
  __int128 *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  NSObject *v48;
  int *v49;
  char *v50;
  __int128 *v51;
  void *v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  unsigned int v57;
  uint64_t v58;
  const char *v59;
  __int128 *v60;
  void *v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  int v65;
  void *v66;
  unsigned int v67;
  uint64_t v68;
  __int128 *v69;
  NSObject *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *i;
  int v75;
  uint64_t v76;
  NSMutableDictionary *enabledAV;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *j;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *k;
  id v89;
  NSObject *v90;
  uint64_t v91;
  int v92;
  void *v93;
  unsigned int v94;
  uint64_t v95;
  __int128 *v96;
  const __CFString *NetworkInterfaceEntity;
  char v98;
  id v99;
  uint64_t v100;
  void *v101;
  unsigned int v102;
  uint64_t v103;
  __int128 *v104;
  const char *v105;
  unsigned int v106;
  int v107;
  int v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  unsigned int v114;
  void *v115;
  unsigned int v116;
  char v117;
  int v118;
  _BYTE v119[128];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  int v134;
  id v135;
  __int16 v136;
  char *v137;
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
  __int128 v153;
  _OWORD v154[2];

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_enabled, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    v9 = -[QoSMarkingController qosMarkingIsEnabled:](self, "qosMarkingIsEnabled:", v8);
    v10 = v9 ^ 1;
    v11 = -[QoSMarkingController qosMarkingIsAppleAudioVideoCallsEnabled:](self, "qosMarkingIsAppleAudioVideoCallsEnabled:", v8);
    if (v6)
    {
LABEL_3:
      LODWORD(v12) = -[QoSMarkingController qosMarkingIsEnabled:](self, "qosMarkingIsEnabled:", v6);
      v13 = v12 ^ 1;
      v116 = -[QoSMarkingController qosMarkingIsAppleAudioVideoCallsEnabled:](self, "qosMarkingIsAppleAudioVideoCallsEnabled:", v6);
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    v9 = 0;
    v10 = 0;
    if (v6)
      goto LABEL_3;
  }
  v116 = 0;
  LODWORD(v12) = 0;
  v13 = 0;
LABEL_6:
  if (v6)
    v14 = 1;
  else
    v14 = v9;
  v118 = v12;
  if (v14 == 1
    && ((v9 ^ v12) & 1) == 0
    && ((v10 ^ v13) & 1) == 0
    && ((v9 & v12) != 1 || (objc_msgSend(v8, "isEqual:", v6) & 1) != 0))
  {
    v15 = 0;
    if (!(_DWORD)v12)
      goto LABEL_134;
LABEL_60:
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[QoSMarkingController qosMarkingAllowListAppIdentifiers:](self, "qosMarkingAllowListAppIdentifiers:", v8));
    v12 = objc_claimAutoreleasedReturnValue(-[QoSMarkingController qosMarkingAllowListAppIdentifiers:](self, "qosMarkingAllowListAppIdentifiers:", v6));
    if (objc_msgSend(v52, "isEqual:", v12) && v11 == v116)
      goto LABEL_133;
    if (!-[NSMutableDictionary count](self->_enabled, "count"))
      sub_1000653BC("net.qos.policy.restricted", 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_enabled, "setObject:forKeyedSubscript:", v6, v7);
    v53 = sub_100061A68();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v55 = _SC_syslog_os_log_mapping(5);
    v115 = v52;
    if (__SC_log_enabled(5, v54, v55))
    {
      v56 = v8;
      v152 = 0u;
      v153 = 0u;
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v57 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v54, (os_log_type_t)v55))
        v58 = v57;
      else
        v58 = 2;
      v59 = "update";
      if (!v9)
        v59 = "add";
      LODWORD(v154[0]) = 138412546;
      *(_QWORD *)((char *)v154 + 4) = v7;
      WORD6(v154[0]) = 2080;
      *(_QWORD *)((char *)v154 + 14) = v59;
      LODWORD(v105) = 22;
      v60 = (__int128 *)_os_log_send_and_compose_impl(v58, 0, &v138, 256, &_mh_execute_header, v54, v55, "QoS marking policy: %@: %s", v154, v105);
      __SC_log_send2(5, v54, v55, 0, v60);
      if (v60 != &v138)
        free(v60);
      v8 = v56;
      v52 = v115;
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_policySessions, "objectForKeyedSubscript:", v7));
    if (!v61)
    {
      if (objc_msgSend((id)v12, "count"))
        v75 = 1;
      else
        v75 = v116;
      if (v75 != 1)
      {
        v61 = 0;
        LOBYTE(v71) = 1;
        goto LABEL_101;
      }
      v76 = objc_claimAutoreleasedReturnValue(-[QoSMarkingController createPolicySession](self, "createPolicySession"));
      if (!v76)
      {
        v99 = sub_100061A68();
        v70 = objc_claimAutoreleasedReturnValue(v99);
        v100 = _SC_syslog_os_log_mapping(3);
        if (__SC_log_enabled(3, v70, v100))
        {
          v101 = v8;
          v152 = 0u;
          v153 = 0u;
          v150 = 0u;
          v151 = 0u;
          v148 = 0u;
          v149 = 0u;
          v146 = 0u;
          v147 = 0u;
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v102 = (_sc_log > 0) | 2;
          if (os_log_type_enabled(v70, (os_log_type_t)v100))
            v103 = v102;
          else
            v103 = 2;
          LODWORD(v154[0]) = 138412290;
          *(_QWORD *)((char *)v154 + 4) = v7;
          LODWORD(v105) = 12;
          v104 = (__int128 *)_os_log_send_and_compose_impl(v103, 0, &v138, 256, &_mh_execute_header, v70, v100, "%@: failed to create policy session", v154, v105);
          __SC_log_send2(3, v70, v100, 0, v104);
          if (v104 != &v138)
            free(v104);
          v61 = 0;
          LOBYTE(v71) = 1;
          v8 = v101;
          v52 = v115;
        }
        else
        {
          v61 = 0;
          LOBYTE(v71) = 1;
        }
        goto LABEL_92;
      }
      v61 = (void *)v76;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_policySessions, "setObject:forKeyedSubscript:", v76, v7);
    }
    if ((objc_msgSend(v61, "removeAllPolicies") & 1) == 0)
    {
      v62 = sub_100061A68();
      v63 = objc_claimAutoreleasedReturnValue(v62);
      v64 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v63, v64))
      {
        v110 = v61;
        v65 = v15;
        v66 = v8;
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v67 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v63, (os_log_type_t)v64))
          v68 = v67;
        else
          v68 = 2;
        LODWORD(v154[0]) = 138412290;
        *(_QWORD *)((char *)v154 + 4) = v7;
        LODWORD(v105) = 12;
        v69 = (__int128 *)_os_log_send_and_compose_impl(v68, 0, &v138, 256, &_mh_execute_header, v63, v64, "%@: could not remove policies", v154, v105);
        __SC_log_send2(3, v63, v64, 0, v69);
        if (v69 != &v138)
          free(v69);
        v8 = v66;
        v15 = v65;
        v61 = v110;
        v52 = v115;
      }

    }
    if (objc_msgSend((id)v12, "count"))
    {
      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      v70 = (id)v12;
      v71 = -[NSObject countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v130, v129, 16);
      if (v71)
      {
        v111 = v61;
        v107 = v15;
        v72 = *(_QWORD *)v131;
        v73 = 2000;
        do
        {
          for (i = 0; i != v71; i = (char *)i + 1)
          {
            if (*(_QWORD *)v131 != v72)
              objc_enumerationMutation(v70);
            -[QoSMarkingController addAllowListAppIdentifierPolicy:forApp:order:](self, "addAllowListAppIdentifierPolicy:forApp:order:", v7, *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)i), (char *)i + v73);
          }
          v71 = -[NSObject countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v130, v129, 16);
          v73 = (v73 + (_DWORD)i);
        }
        while (v71);
        v15 = v107;
        v61 = v111;
        v52 = v115;
      }
LABEL_92:

      goto LABEL_101;
    }
    LOBYTE(v71) = 0;
LABEL_101:
    enabledAV = self->_enabledAV;
    if (v116)
    {
      if (!-[NSMutableDictionary count](enabledAV, "count"))
        sub_1000653BC("net.qos.policy.restrict_avapps", 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_enabledAV, "setObject:forKeyedSubscript:", v6, v7);
      if ((v71 & 1) != 0)
        goto LABEL_132;
      v117 = (char)v71;
      v112 = v61;
      v108 = v15;
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v78 = (id)qword_10007DFF8;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v125, v124, 16);
      if (v79)
      {
        v80 = v79;
        v81 = *(_QWORD *)v126;
        v82 = 1000;
        do
        {
          for (j = 0; j != v80; j = (char *)j + 1)
          {
            if (*(_QWORD *)v126 != v81)
              objc_enumerationMutation(v78);
            -[QoSMarkingController addAllowListAppIdentifierPolicy:forApp:order:](self, "addAllowListAppIdentifierPolicy:forApp:order:", v7, *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)j), (char *)j + v82);
          }
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v125, v124, 16);
          v82 = (v82 + (_DWORD)j);
        }
        while (v80);
      }

      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v71 = (id)qword_10007E000;
      v84 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v120, v119, 16);
      if (v84)
      {
        v85 = v84;
        v86 = *(_QWORD *)v121;
        v87 = 1500;
        do
        {
          for (k = 0; k != v85; k = (char *)k + 1)
          {
            if (*(_QWORD *)v121 != v86)
              objc_enumerationMutation(v71);
            -[QoSMarkingController addAllowListPathPolicy:forPath:order:](self, "addAllowListPathPolicy:forPath:order:", v7, *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)k), (char *)k + v87);
          }
          v85 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v120, v119, 16);
          v87 = (v87 + (_DWORD)k);
        }
        while (v85);
      }

      v15 = v108;
      v61 = v112;
      v52 = v115;
      LOBYTE(v71) = v117;
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](enabledAV, "removeObjectForKey:", v7);
      if (!-[NSMutableDictionary count](self->_enabledAV, "count"))
        sub_1000653BC("net.qos.policy.restrict_avapps", 1);
    }
    if ((v71 & 1) == 0 && (objc_msgSend(v61, "apply") & 1) == 0)
    {
      v89 = sub_100061A68();
      v90 = objc_claimAutoreleasedReturnValue(v89);
      v91 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v90, v91))
      {
        v113 = v61;
        v92 = v15;
        v93 = v8;
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v94 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v90, (os_log_type_t)v91))
          v95 = v94;
        else
          v95 = 2;
        LODWORD(v154[0]) = 138412290;
        *(_QWORD *)((char *)v154 + 4) = v7;
        LODWORD(v105) = 12;
        v96 = (__int128 *)_os_log_send_and_compose_impl(v95, 0, &v138, 256, &_mh_execute_header, v90, v91, "%@: could not apply new policies", v154, v105);
        __SC_log_send2(3, v90, v91, 0, v96);
        if (v96 != &v138)
          free(v96);
        v8 = v93;
        v15 = v92;
        v61 = v113;
        v52 = v115;
      }

    }
LABEL_132:

LABEL_133:
    LOBYTE(v12) = v118;
    goto LABEL_134;
  }
  v114 = v11;
  if ((_DWORD)v12)
  {

    v8 = 0;
  }
  else
  {
    if (!v6 && v8)
    {
      v16 = sub_100061A68();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = _SC_syslog_os_log_mapping(5);
      if (__SC_log_enabled(5, v17, v18))
      {
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v19 = (_sc_log > 0) | 2;
        if (os_log_type_enabled(v17, (os_log_type_t)v18))
          v20 = v19;
        else
          v20 = 2;
        LODWORD(v154[0]) = 138412290;
        *(_QWORD *)((char *)v154 + 4) = v7;
        v21 = (__int128 *)_os_log_send_and_compose_impl(v20, 0, &v138, 256, &_mh_execute_header, v17, v18, "QoS marking policy: %@: remove", v154, 12);
        __SC_log_send2(5, v17, v18, 0, v21);
        if (v21 != &v138)
          free(v21);
        LODWORD(v12) = v118;
      }

    }
    -[NSMutableDictionary removeObjectForKey:](self->_policySessions, "removeObjectForKey:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_enabled, "removeObjectForKey:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_enabledAV, "removeObjectForKey:", v7);
  }
  v22 = socket(2, 2, 0);
  if (v22 == -1)
  {
    v43 = sub_100061A68();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v45 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v44, v45))
    {
      v109 = v8;
      v152 = 0u;
      v153 = 0u;
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v46 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v44, (os_log_type_t)v45))
        v47 = v46;
      else
        v47 = 2;
      v48 = v44;
      v49 = __error();
      v50 = strerror(*v49);
      LODWORD(v154[0]) = 136315138;
      *(_QWORD *)((char *)v154 + 4) = v50;
      v51 = (__int128 *)_os_log_send_and_compose_impl(v47, 0, &v138, 256, &_mh_execute_header, v48, v45, "socket() failed: %s", (const char *)v154);

      __SC_log_send2(3, v48, v45, 0, v51);
      if (v51 != &v138)
        free(v51);
      v8 = v109;
      LODWORD(v12) = v118;
      v11 = v114;
    }

    v15 = 1;
    if ((_DWORD)v12)
      goto LABEL_60;
  }
  else
  {
    v23 = v22;
    v24 = v12 | (v6 == 0);
    v25 = sub_100061A68();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v26, v27))
    {
      v152 = 0u;
      v153 = 0u;
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v28 = (_sc_log > 0) | 2;
      if (os_log_type_enabled(v26, (os_log_type_t)v27))
        v29 = v28;
      else
        v29 = 2;
      if (v24)
        v30 = "enable";
      else
        v30 = "disable";
      v31 = " (default)";
      LODWORD(v154[0]) = 138412802;
      *(_QWORD *)((char *)v154 + 4) = v7;
      *(_QWORD *)((char *)v154 + 14) = v30;
      WORD6(v154[0]) = 2080;
      if (v6)
        v31 = "";
      WORD3(v154[1]) = 2080;
      *((_QWORD *)&v154[1] + 1) = v31;
      LODWORD(v105) = 32;
      v32 = (__int128 *)_os_log_send_and_compose_impl(v29, 0, &v138, 256, &_mh_execute_header, v26, v27, "QoS marking policy: %@: %s%s", v154, v105);
      __SC_log_send2(5, v26, v27, 0, v32);
      if (v32 != &v138)
        free(v32);
      v11 = v114;
    }

    v33 = -[__CFString UTF8String](objc_retainAutorelease(v7), "UTF8String");
    memset(v154, 0, sizeof(v154));
    __strlcpy_chk(v154, v33, 16, 16);
    LODWORD(v154[1]) = v24;
    if (ioctl(v23, 0xC02069B5uLL, v154) == -1)
    {
      v34 = sub_100061A68();
      v35 = objc_claimAutoreleasedReturnValue(v34);
      v36 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v35, v36))
      {
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v37 = (_sc_log > 0) | 2;
        v38 = os_log_type_enabled(v35, (os_log_type_t)v36) ? v37 : 2;
        v106 = v38;
        v39 = v35;
        v40 = __error();
        v41 = strerror(*v40);
        v134 = 136315394;
        v135 = v33;
        v136 = 2080;
        v137 = v41;
        LODWORD(v105) = 22;
        v42 = (__int128 *)_os_log_send_and_compose_impl(v106, 0, &v138, 256, &_mh_execute_header, v39, v36, "%s: ioctl(SIOCSQOSMARKINGENABLED) failed: %s", (const char *)&v134, v105);

        __SC_log_send2(3, v39, v36, 0, v42);
        if (v42 != &v138)
          free(v42);
      }

      v11 = v114;
    }
    close(v23);
    v15 = 1;
    LOBYTE(v12) = v118;
    if (v118)
      goto LABEL_60;
  }
LABEL_134:
  if (-[NSMutableDictionary count](self->_enabled, "count"))
  {
    if (!v15)
      goto LABEL_144;
  }
  else
  {
    sub_1000653BC("net.qos.policy.restrict_avapps", 0);
    sub_1000653BC("net.qos.policy.restricted", 0);
    if (!v15)
      goto LABEL_144;
  }
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, v7, kSCEntNetQoSMarkingPolicy);
  v98 = v12 ^ 1;
  if (!v6)
    v98 = 1;
  if ((v98 & 1) != 0)
    SCDynamicStoreRemoveValue(0, NetworkInterfaceEntity);
  else
    SCDynamicStoreSetValue(0, NetworkInterfaceEntity, v6);
  CFRelease(NetworkInterfaceEntity);
LABEL_144:

}

+ (id)sharedController
{
  if (qword_10007E018 != -1)
    dispatch_once(&qword_10007E018, &stru_1000771C0);
  return (id)qword_10007E010;
}

- (void)setInterfaces:(id)a3
{
  id v5;
  int v6;
  int v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  NSObject *v21;
  int *v22;
  char *v23;
  __int128 *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  char *v29;
  __int128 *v30;
  const char *v31;
  id v32;
  QoSMarkingController *v33;
  id obj;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  int v40;
  id v41;
  __int16 v42;
  char *v43;
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
  __int128 v59;
  __int128 v60;
  __int128 v61;

  v5 = a3;
  v6 = socket(2, 2, 0);
  if (v6 == -1)
  {
    v25 = sub_100061A68();
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(v25);
    v26 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v8, v26))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
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
      LODWORD(v27) = (_sc_log > 0) | 2;
      v27 = os_log_type_enabled(&v8->super, (os_log_type_t)v26) ? v27 : 2;
      v8 = v8;
      v28 = __error();
      v29 = strerror(*v28);
      LODWORD(v60) = 136315138;
      *(_QWORD *)((char *)&v60 + 4) = v29;
      v30 = (__int128 *)_os_log_send_and_compose_impl(v27, 0, &v44, 256, &_mh_execute_header, v8, v26, "socket() failed: %s", (const char *)&v60);

      __SC_log_send2(3, v8, v26, 0, v30);
      if (v30 != &v44)
        free(v30);
    }
  }
  else
  {
    v7 = v6;
    v33 = self;
    v8 = self->_interfaces;
    objc_storeStrong((id *)&self->_interfaces, a3);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v32 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(obj);
          v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i));
          v14 = objc_msgSend(v13, "UTF8String");
          v60 = 0u;
          v61 = 0u;
          __strlcpy_chk(&v60, v14, 16, 16);
          if (ioctl(v7, 0xC020699FuLL, &v60) == -1)
          {
            v16 = sub_100061A68();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            v18 = _SC_syslog_os_log_mapping(5);
            if (__SC_log_enabled(5, v17, v18))
            {
              v19 = v8;
              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v48 = 0u;
              v49 = 0u;
              v46 = 0u;
              v47 = 0u;
              LODWORD(v20) = (_sc_log > 0) | 2;
              v44 = 0u;
              v45 = 0u;
              if (os_log_type_enabled(v17, (os_log_type_t)v18))
                v20 = v20;
              else
                v20 = 2;
              v21 = v17;
              v22 = __error();
              v23 = strerror(*v22);
              v40 = 136315394;
              v41 = v14;
              v42 = 2080;
              v43 = v23;
              LODWORD(v31) = 22;
              v24 = (__int128 *)_os_log_send_and_compose_impl(v20, 0, &v44, 256, &_mh_execute_header, v21, v18, "%s: ioctl(SIOCGIFTYPE) failed: %s", (const char *)&v40, v31);

              __SC_log_send2(5, v21, v18, 0, v24);
              if (v24 != &v44)
                free(v24);
              v8 = v19;
            }

          }
          else if (*(_QWORD *)((char *)&v61 + 4) == 0x300000002
                 && !-[NSArray containsObject:](v8, "containsObject:", v13))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v33->_requested, "objectForKeyedSubscript:", v13));
            -[NSMutableDictionary removeObjectForKey:](v33->_requested, "removeObjectForKey:", v13);
            -[QoSMarkingController setPolicy:forInterface:](v33, "setPolicy:forInterface:", v15, v13);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      }
      while (v10);
    }

    close(v7);
    v5 = v32;
  }

}

- (void)setPolicy:(id)a3 forInterface:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
  {
    if (-[NSArray containsObject:](self->_interfaces, "containsObject:", v6))
      -[QoSMarkingController updatePolicy:forInterface:](self, "updatePolicy:forInterface:", v7, v6);
    -[NSMutableDictionary setObject:forKey:](self->_requested, "setObject:forKey:", v7, v6, v7);
  }
  else
  {
    -[QoSMarkingController updatePolicy:forInterface:](self, "updatePolicy:forInterface:", 0, v6);
    -[NSMutableDictionary removeObjectForKey:](self->_requested, "removeObjectForKey:", v6);
  }

}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (NSMutableDictionary)policySessions
{
  return self->_policySessions;
}

- (void)setPolicySessions:(id)a3
{
  objc_storeStrong((id *)&self->_policySessions, a3);
}

- (NSMutableDictionary)requested
{
  return self->_requested;
}

- (void)setRequested:(id)a3
{
  objc_storeStrong((id *)&self->_requested, a3);
}

- (NSMutableDictionary)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_enabled, a3);
}

- (NSMutableDictionary)enabledAV
{
  return self->_enabledAV;
}

- (void)setEnabledAV:(id)a3
{
  objc_storeStrong((id *)&self->_enabledAV, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledAV, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_requested, 0);
  objc_storeStrong((id *)&self->_policySessions, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
}

@end
