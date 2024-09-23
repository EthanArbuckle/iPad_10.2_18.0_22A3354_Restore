@implementation NSPPrivacyProxyPolicyHandler

- (NSPPrivacyProxyPolicyHandler)init
{
  NSPPrivacyProxyPolicyHandler *v2;
  NSPPrivacyProxyPolicyHandler *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)NSPPrivacyProxyPolicyHandler;
  v2 = -[NSPPrivacyProxyPolicyHandler init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_policy, 0);
    objc_storeStrong((id *)&v3->_flowDivertHandle, 0);
    v3->_inProcessFlowDivert = 0;
    v4 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_mainPolicyIDs, v4);

    v5 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_interfacePolicyIDs, v5);

    v6 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_domainFilterPolicyIDs, v6);

    v7 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_domainFilterIDs, v7);

    v8 = sub_100090D34((uint64_t)v3, CFSTR("nsp_privacy_proxy_policy_session"), 300);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_storeStrong((id *)&v3->_session, v9);

    v10 = sub_100090D34((uint64_t)v3, CFSTR("nsp_privacy_proxy_policy_control_session"), 100);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_storeStrong((id *)&v3->_controlSession, v11);

    v12 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_safariTechnologyPreviewPolicyIDs, v12);

    v13 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_safariBundlePolicyIDs, v13);

    v14 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_mailAppPolicyIDs, v14);

    v15 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_probePolicyIDs, v15);

    v16 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_obliviousAgentPolicyIDs, v16);

    v17 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_proxiedContentPolicyIDs, v17);

    v18 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_networkSpecificProxyPolicyIDs, v18);

    v19 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&v3->_proxiedContentNotifyFlags, v19);

    v20 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_mptcpProxyPolicyIDs, v20);

    v21 = objc_alloc_init((Class)NSMutableArray);
    objc_storeStrong((id *)&v3->_networkToolProxyPolicyIDs, v21);

  }
  return v3;
}

+ (id)sharedHandler
{
  if (qword_100112F08 != -1)
    dispatch_once(&qword_100112F08, &stru_1000F6B08);
  return (id)qword_100112F00;
}

- (BOOL)set:(id)a3 flowDivertHandle:(id)a4 inProcessFlowDivert:(BOOL)a5 ingressProxyURL:(id)a6 ingressFallbackProxyURL:(id)a7 exceptionBundleIDs:(id)a8 exceptionProcessPaths:(id)a9
{
  id v15;
  id v16;
  NSPPrivacyProxyPolicyHandler *v17;
  NSPPrivacyProxyPolicy *policy;
  int inProcessFlowDivert;
  NSString *ingressProxyURL;
  NEFlowDivertFileHandle *flowDivertHandle;
  NSString *ingressFallbackProxyURL;
  NSArray *exceptionProcessPaths;
  NSArray *v24;
  NSString *v25;
  NSString *v26;
  NEFlowDivertFileHandle *v27;
  NSPPrivacyProxyPolicy *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSMutableArray *v49;
  void *v50;
  uint64_t v51;
  NEPolicySession *session;
  NEPolicySession *v53;
  unsigned int v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  NSPPrivacyProxyPolicyHandler *v74;
  __int16 v75;
  id v76;
  uint8_t v77[4];
  NSPPrivacyProxyPolicyHandler *v78;

  v15 = a3;
  v16 = a4;
  v64 = a6;
  v65 = a7;
  v66 = a8;
  v67 = a9;
  v17 = self;
  objc_sync_enter(v17);
  v62 = v15;
  sub_10003E048((uint64_t)v17, v15);
  v63 = v16;
  sub_10000D354((uint64_t)v17, v16);
  if (v17)
  {
    v17->_inProcessFlowDivert = a5;
    objc_storeStrong((id *)&v17->_ingressProxyURL, a6);
    objc_storeStrong((id *)&v17->_ingressFallbackProxyURL, a7);
    objc_storeStrong((id *)&v17->_exceptionBundleIDs, a8);
    objc_storeStrong((id *)&v17->_exceptionProcessPaths, a9);
  }
  sub_1000911E0((id *)&v17->super.isa);
  sub_100091890((id *)&v17->super.isa);
  sub_1000919BC((id *)&v17->super.isa);
  sub_100091AE8((uint64_t)v17);
  -[NSPPrivacyProxyPolicyHandler removePoliciesForMPTCPConverterProxy:](v17, "removePoliciesForMPTCPConverterProxy:", 0);
  sub_100091C18((id *)&v17->super.isa);
  if (v17)
  {
    policy = v17->_policy;
    inProcessFlowDivert = v17->_inProcessFlowDivert;
    flowDivertHandle = v17->_flowDivertHandle;
    ingressProxyURL = v17->_ingressProxyURL;
    ingressFallbackProxyURL = v17->_ingressFallbackProxyURL;
    exceptionProcessPaths = v17->_exceptionProcessPaths;
    v24 = v17->_exceptionBundleIDs;
    v25 = ingressFallbackProxyURL;
    v26 = ingressProxyURL;
    v27 = flowDivertHandle;
    v28 = policy;
    v29 = sub_1000805FC((uint64_t)NSPPrivacyProxyPolicySerialization, v28, v27, inProcessFlowDivert, v26, v25, v24, exceptionProcessPaths);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v29);

    if (v68 && (v30 = objc_msgSend(v68, "count")) != 0)
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v33 = v68;
      v34 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      v37 = v34;
      if (v34)
      {
        v38 = *(_QWORD *)v70;
        while (2)
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v70 != v38)
              objc_enumerationMutation(v33);
            v40 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v39);
            v41 = nplog_obj(v34, v35, v36);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v74 = v17;
              v75 = 2112;
              v76 = v40;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%@ adding policy %@", buf, 0x16u);
            }

            v43 = -[NEPolicySession addPolicy:](v17->_session, "addPolicy:", v40);
            v46 = nplog_obj(v43, v44, v45);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            v48 = v47;
            if (!v43)
            {
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v74 = v17;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@ failed to add policy", buf, 0xCu);
              }

              goto LABEL_28;
            }
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v74 = v17;
              v75 = 2048;
              v76 = v43;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%@ added policy %lu", buf, 0x16u);
            }

            v49 = v17->_mainPolicyIDs;
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v43));
            -[NSMutableArray addObject:](v49, "addObject:", v50);

            v39 = (char *)v39 + 1;
          }
          while (v37 != v39);
          v34 = -[NSObject countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
          v37 = v34;
          if (v34)
            continue;
          break;
        }
      }

      if ((sub_100092444((void **)&v17->super.isa) & 1) != 0)
      {
        if ((sub_1000926D0((uint64_t)v17) & 1) != 0)
        {
          if ((sub_100092974((void **)&v17->super.isa) & 1) != 0)
          {
            if ((sub_100092C9C((void **)&v17->super.isa) & 1) != 0)
            {

LABEL_31:
              session = v17->_session;
              goto LABEL_32;
            }
            sub_100091C18((id *)&v17->super.isa);
          }
          else
          {
            sub_100091AE8((uint64_t)v17);
          }
        }
        else
        {
          sub_1000919BC((id *)&v17->super.isa);
        }
      }
      else
      {
        sub_100091890((id *)&v17->super.isa);
      }
    }
    else
    {
      v51 = nplog_obj(v30, v31, v32);
      v33 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v17;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%@ there are no privacy proxy policies to add", buf, 0xCu);
      }
LABEL_28:

    }
  }
  sub_1000911E0((id *)&v17->super.isa);
  if (v17)
    goto LABEL_31;
  session = 0;
LABEL_32:
  v53 = session;
  v54 = -[NEPolicySession apply](v53, "apply");

  if (v54)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](NEFileHandleMaintainer, "sharedMaintainer"));
    objc_msgSend(v55, "commit");

    v59 = nplog_obj(v56, v57, v58);
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v77 = 138412290;
      v78 = v17;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%@ sucessfully applied all the policies", v77, 0xCu);
    }

  }
  objc_sync_exit(v17);

  return v54;
}

- (void)remove:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NEPolicySession *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *k;
  void *v19;
  NEPolicySession *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *m;
  void *v25;
  NEPolicySession *v26;
  NSMutableDictionary *v27;
  id v28;
  uint64_t v29;
  void *n;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *ii;
  void *v36;
  NEPolicySession *v37;
  NSMutableDictionary *v38;
  id v39;
  uint64_t v40;
  void *jj;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *kk;
  void *v47;
  NEPolicySession *v48;
  NEPolicySession *session;
  NEPolicySession *v50;
  NSPPrivacyProxyPolicyHandler *obj;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  sub_1000911E0((id *)&obj->super.isa);
  sub_100091890((id *)&obj->super.isa);
  sub_1000919BC((id *)&obj->super.isa);
  sub_100091AE8((uint64_t)obj);
  sub_100091C18((id *)&obj->super.isa);
  if (v3)
  {
    if (obj)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v4 = obj->_probePolicyIDs;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v69 != v6)
              objc_enumerationMutation(v4);
            v8 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
            v9 = obj->_session;
            -[NEPolicySession removePolicyWithID:](v9, "removePolicyWithID:", objc_msgSend(v8, "unsignedIntegerValue"));

          }
          v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        }
        while (v5);
      }

      -[NSMutableArray removeAllObjects](obj->_probePolicyIDs, "removeAllObjects");
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](obj->_domainFilterPolicyIDs, "allValues"));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v11; j = (char *)j + 1)
          {
            if (*(_QWORD *)v61 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, &v68, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v57;
              do
              {
                for (k = 0; k != v16; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v57 != v17)
                    objc_enumerationMutation(v15);
                  v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k);
                  v20 = obj->_session;
                  -[NEPolicySession removePolicyWithID:](v20, "removePolicyWithID:", objc_msgSend(v19, "unsignedIntegerValue"));

                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, &v68, 16);
              }
              while (v16);
            }

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
        }
        while (v11);
      }

      -[NSMutableDictionary removeAllObjects](obj->_domainFilterPolicyIDs, "removeAllObjects");
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](obj->_domainFilterIDs, "allValues"));
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, &v64, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v53;
        do
        {
          for (m = 0; m != v22; m = (char *)m + 1)
          {
            if (*(_QWORD *)v53 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)m);
            v26 = obj->_session;
            -[NEPolicySession removeDomainFilterWithID:](v26, "removeDomainFilterWithID:", objc_msgSend(v25, "unsignedIntegerValue"));

          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, &v64, 16);
        }
        while (v22);
      }

      -[NSMutableDictionary removeAllObjects](obj->_domainFilterIDs, "removeAllObjects");
      if (-[NSMutableDictionary count](obj->_obliviousAgentPolicyIDs, "count"))
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v27 = obj->_obliviousAgentPolicyIDs;
        v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v65;
          do
          {
            for (n = 0; n != v28; n = (char *)n + 1)
            {
              if (*(_QWORD *)v65 != v29)
                objc_enumerationMutation(v27);
              v31 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)n);
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](obj->_obliviousAgentPolicyIDs, "objectForKeyedSubscript:", v31));
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, &v68, 16);
              if (v33)
              {
                v34 = *(_QWORD *)v61;
                do
                {
                  for (ii = 0; ii != v33; ii = (char *)ii + 1)
                  {
                    if (*(_QWORD *)v61 != v34)
                      objc_enumerationMutation(v32);
                    v36 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)ii);
                    v37 = obj->_controlSession;
                    -[NEPolicySession removePolicyWithID:](v37, "removePolicyWithID:", objc_msgSend(v36, "unsignedIntegerValue"));

                  }
                  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, &v68, 16);
                }
                while (v33);
              }

            }
            v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
          }
          while (v28);
        }

        -[NSMutableDictionary removeAllObjects](obj->_obliviousAgentPolicyIDs, "removeAllObjects");
      }
      if (-[NSMutableDictionary count](obj->_proxiedContentPolicyIDs, "count"))
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v38 = obj->_proxiedContentPolicyIDs;
        v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v65;
          do
          {
            for (jj = 0; jj != v39; jj = (char *)jj + 1)
            {
              if (*(_QWORD *)v65 != v40)
                objc_enumerationMutation(v38);
              v42 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)jj);
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](obj->_proxiedContentPolicyIDs, "objectForKeyedSubscript:", v42));
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, &v68, 16);
              if (v44)
              {
                v45 = *(_QWORD *)v61;
                do
                {
                  for (kk = 0; kk != v44; kk = (char *)kk + 1)
                  {
                    if (*(_QWORD *)v61 != v45)
                      objc_enumerationMutation(v43);
                    v47 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)kk);
                    v48 = obj->_session;
                    -[NEPolicySession removePolicyWithID:](v48, "removePolicyWithID:", objc_msgSend(v47, "unsignedIntegerValue"));

                  }
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v60, &v68, 16);
                }
                while (v44);
              }

            }
            v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
          }
          while (v39);
        }

        -[NSMutableDictionary removeAllObjects](obj->_proxiedContentPolicyIDs, "removeAllObjects");
        -[NSMutableDictionary removeAllObjects](obj->_proxiedContentNotifyFlags, "removeAllObjects");
        sub_10009495C((id *)&obj->super.isa);
      }
    }
    -[NSPPrivacyProxyPolicyHandler removePoliciesForMPTCPConverterProxy:](obj, "removePoliciesForMPTCPConverterProxy:", 0);
  }
  if (obj)
    session = obj->_session;
  else
    session = 0;
  v50 = session;
  -[NEPolicySession apply](v50, "apply");

  sub_10003E048((uint64_t)obj, 0);
  sub_10000D354((uint64_t)obj, 0);
  if (obj)
    obj->_inProcessFlowDivert = 0;
  objc_sync_exit(obj);

}

- (id)currentPolicy
{
  NSPPrivacyProxyPolicyHandler *v2;
  NSPPrivacyProxyPolicy *policy;
  NSPPrivacyProxyPolicy *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && (policy = v2->_policy) != 0)
  {
    v4 = policy;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyPolicy dictionaryRepresentation](v4, "dictionaryRepresentation"));

  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)addPreferredProxy:(id)a3 agentUUID:(id)a4 withDomainFilter:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSPPrivacyProxyPolicyHandler *v12;
  NEPolicySession *session;
  NEPolicySession *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSMutableDictionary *domainFilterIDs;
  NSMutableDictionary *v23;
  NEPolicySession *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NEPolicySession *v35;
  NEPolicySession *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  NSMutableDictionary *domainFilterPolicyIDs;
  NSMutableDictionary *v46;
  NEPolicySession *v47;
  NEPolicySession *v48;
  uint64_t v49;
  NSObject *v50;
  NEPolicySession *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  _BYTE v65[14];

  v8 = a3;
  v53 = a4;
  v9 = a5;
  v54 = v9;
  v55 = v8;
  if (v8)
  {
    v12 = self;
    objc_sync_enter(v12);
    -[NSPPrivacyProxyPolicyHandler removePreferredProxy:apply:](v12, "removePreferredProxy:apply:", v8, 0);
    if (v12)
      session = v12->_session;
    else
      session = 0;
    v14 = session;
    v15 = -[NEPolicySession addDomainFilterWithData:](v14, "addDomainFilterWithData:", v54);

    if (v15)
    {
      v19 = nplog_obj(v16, v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v63 = (const char *)v12;
        v64 = 1024;
        *(_DWORD *)v65 = (_DWORD)v15;
        *(_WORD *)&v65[4] = 2112;
        *(_QWORD *)&v65[6] = v55;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ added domain filter %u for %@", buf, 0x1Cu);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
      if (v12)
        domainFilterIDs = v12->_domainFilterIDs;
      else
        domainFilterIDs = 0;
      v23 = domainFilterIDs;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v21, v55);

      v24 = (NEPolicySession *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v25 = sub_1000806F0((uint64_t)NSPPrivacyProxyPolicySerialization, v53, (uint64_t)v15);
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(v25);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      v29 = v26;
      if (v26)
      {
        v30 = *(_QWORD *)v58;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v58 != v30)
              objc_enumerationMutation(obj);
            v32 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v31);
            v33 = nplog_obj(v26, v27, v28);
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v63 = (const char *)v12;
              v64 = 2112;
              *(_QWORD *)v65 = v32;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%@ adding domain filter policy %@", buf, 0x16u);
            }

            if (v12)
              v35 = v12->_session;
            else
              v35 = 0;
            v36 = v35;
            v37 = -[NEPolicySession addPolicy:](v36, "addPolicy:", v32);

            if (v37)
            {
              v41 = nplog_obj(v38, v39, v40);
              v42 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v63 = (const char *)v12;
                v64 = 1024;
                *(_DWORD *)v65 = (_DWORD)v37;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%@ added domain filter policy %u", buf, 0x12u);
              }

              v43 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v37));
              -[NEPolicySession addObject:](v24, "addObject:", v43);
            }
            else
            {
              v44 = nplog_obj(v38, v39, v40);
              v43 = objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v63 = (const char *)v12;
                _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@ failed to add domain filter policy", buf, 0xCu);
              }
            }

            v31 = (char *)v31 + 1;
          }
          while (v29 != v31);
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          v29 = v26;
        }
        while (v26);
      }

      if (v12)
        domainFilterPolicyIDs = v12->_domainFilterPolicyIDs;
      else
        domainFilterPolicyIDs = 0;
      v46 = domainFilterPolicyIDs;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v24, v55);

      if (v12)
        v47 = v12->_session;
      else
        v47 = 0;
      v48 = v47;
      -[NEPolicySession apply](v48, "apply");

    }
    else
    {
      v49 = nplog_obj(v16, v17, v18);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = (const char *)v12;
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@ failed to add domain filter", buf, 0xCu);
      }

      if (v12)
        v51 = v12->_session;
      else
        v51 = 0;
      v24 = v51;
      -[NEPolicySession apply](v24, "apply");
    }

    objc_sync_exit(v12);
  }
  else
  {
    v52 = nplog_obj(v9, v10, v11);
    v12 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "-[NSPPrivacyProxyPolicyHandler addPreferredProxy:agentUUID:withDomainFilter:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_FAULT, "%s called with null proxyName", buf, 0xCu);
    }
  }

}

- (void)removePreferredProxy:(id)a3 apply:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSPPrivacyProxyPolicyHandler *v9;
  NSMutableDictionary *domainFilterPolicyIDs;
  NSMutableDictionary *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NEPolicySession *session;
  void *v18;
  NEPolicySession *v19;
  id v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *domainFilterIDs;
  NSMutableDictionary *v24;
  void *v25;
  NEPolicySession *v26;
  NEPolicySession *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  NEPolicySession *v30;
  NEPolicySession *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;

  v4 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    if (v9)
      domainFilterPolicyIDs = v9->_domainFilterPolicyIDs;
    else
      domainFilterPolicyIDs = 0;
    v11 = domainFilterPolicyIDs;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v8));

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v13);
          if (v9)
            session = v9->_session;
          else
            session = 0;
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v16);
          v19 = session;
          -[NEPolicySession removePolicyWithID:](v19, "removePolicyWithID:", objc_msgSend(v18, "unsignedIntegerValue", (_QWORD)v33));

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        v14 = v20;
      }
      while (v20);
    }

    if (v9)
      v21 = v9->_domainFilterPolicyIDs;
    else
      v21 = 0;
    v22 = v21;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", 0, v8);

    if (v9)
      domainFilterIDs = v9->_domainFilterIDs;
    else
      domainFilterIDs = 0;
    v24 = domainFilterIDs;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v8));

    if (v25)
    {
      if (v9)
        v26 = v9->_session;
      else
        v26 = 0;
      v27 = v26;
      -[NEPolicySession removeDomainFilterWithID:](v27, "removeDomainFilterWithID:", objc_msgSend(v25, "unsignedIntegerValue"));

      if (v9)
        v28 = v9->_domainFilterIDs;
      else
        v28 = 0;
      v29 = v28;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", 0, v8);

    }
    if (objc_msgSend(v13, "count", (_QWORD)v33) && v4)
    {
      if (v9)
        v30 = v9->_session;
      else
        v30 = 0;
      v31 = v30;
      -[NEPolicySession apply](v31, "apply");

    }
    objc_sync_exit(v9);
  }
  else
  {
    v32 = nplog_obj(0, v6, v7);
    v9 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[NSPPrivacyProxyPolicyHandler removePreferredProxy:apply:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_FAULT, "%s called with null proxyName", buf, 0xCu);
    }
  }

}

- (void)wifiDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSPPrivacyProxyPolicyHandler *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (!obj)
  {
    if (!v3)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (obj->_wifiDisabled != v3)
  {
    obj->_wifiDisabled = v3;
LABEL_4:
    sub_100093894(obj);
  }
LABEL_5:
  objc_sync_exit(obj);

}

- (void)cellularDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSPPrivacyProxyPolicyHandler *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (!obj)
  {
    if (!v3)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (obj->_cellularDisabled != v3)
  {
    obj->_cellularDisabled = v3;
LABEL_4:
    sub_100093894(obj);
  }
LABEL_5:
  objc_sync_exit(obj);

}

- (void)interface:(id)a3 disabled:(BOOL)a4
{
  NSPPrivacyProxyPolicyHandler *v6;
  id v7;
  char v8;
  NSMutableSet *disabledInterfaces;
  NSMutableSet *v10;
  unsigned __int8 v11;
  NSMutableSet *v12;
  NSMutableSet *v13;
  NSMutableSet *v14;
  unsigned int v15;
  id v16;

  v16 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (a4)
  {
    if (v6 && v6->_disabledInterfaces
      || (v7 = objc_alloc_init((Class)NSMutableSet), sub_10002304C((uint64_t)v6, v7), v7, v6))
    {
      v8 = 0;
      disabledInterfaces = v6->_disabledInterfaces;
    }
    else
    {
      disabledInterfaces = 0;
      v8 = 1;
    }
    v10 = disabledInterfaces;
    v11 = -[NSMutableSet containsObject:](v10, "containsObject:", v16);

    if ((v11 & 1) == 0)
    {
      if ((v8 & 1) != 0)
        v12 = 0;
      else
        v12 = v6->_disabledInterfaces;
      v13 = v12;
      -[NSMutableSet addObject:](v13, "addObject:", v16);
      goto LABEL_14;
    }
  }
  else if (v6)
  {
    if (v6->_disabledInterfaces)
    {
      v14 = v6->_disabledInterfaces;
      v15 = -[NSMutableSet containsObject:](v14, "containsObject:", v16);

      if (v15)
      {
        v13 = v6->_disabledInterfaces;
        -[NSMutableSet removeObject:](v13, "removeObject:", v16);
LABEL_14:

        sub_100093894(v6);
      }
    }
  }
  objc_sync_exit(v6);

}

- (void)replaceDisabledInterfaces:(id)a3
{
  id v4;
  NSPPrivacyProxyPolicyHandler *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableSet *disabledInterfaces;
  NSMutableSet *v12;
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init((Class)NSMutableSet);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    if (v5)
      disabledInterfaces = v5->_disabledInterfaces;
    else
      disabledInterfaces = 0;
  }
  else
  {
    v6 = 0;
    if (!v5)
      goto LABEL_15;
    disabledInterfaces = v5->_disabledInterfaces;
    if (!disabledInterfaces)
      goto LABEL_15;
  }
  v12 = disabledInterfaces;
  v13 = -[NSMutableSet isEqualToSet:](v12, "isEqualToSet:", v6);

  if ((v13 & 1) == 0)
  {
    sub_10002304C((uint64_t)v5, v6);
    sub_100093894(v5);
  }
LABEL_15:

  objc_sync_exit(v5);
}

- (void)setCaptivePortalExceptionHostname:(id)a3
{
  NSPPrivacyProxyPolicyHandler *v5;
  NSString *v6;
  NSString *v7;
  NSString *captiveNetworkExceptionHostname;
  NSString *v9;
  unsigned __int8 v10;
  NSString *v11;

  v11 = (NSString *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5)
  {
    v6 = v5->_captiveNetworkExceptionHostname;
    v7 = v11;
    if (v6 != v11)
    {
      captiveNetworkExceptionHostname = v5->_captiveNetworkExceptionHostname;
      goto LABEL_4;
    }
LABEL_10:

    goto LABEL_11;
  }
  v7 = v11;
  if (!v11)
    goto LABEL_10;
  v6 = 0;
  captiveNetworkExceptionHostname = 0;
LABEL_4:
  v9 = captiveNetworkExceptionHostname;
  v10 = -[NSString isEqualToString:](v9, "isEqualToString:", v11);

  if ((v10 & 1) == 0)
  {
    if (v5)
      objc_storeStrong((id *)&v5->_captiveNetworkExceptionHostname, a3);
    sub_100093894(v5);
  }
LABEL_11:
  objc_sync_exit(v5);

}

- (void)addObliviousProxyAgent:(id)a3 processes:(id)a4 hostname:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSPPrivacyProxyPolicyHandler *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NEPolicySession *controlSession;
  NEPolicySession *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  NSMutableDictionary *obliviousAgentPolicyIDs;
  NSMutableDictionary *v38;
  NEPolicySession *v39;
  NEPolicySession *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];

  v8 = a3;
  v46 = a4;
  v9 = a5;
  v44 = v8;
  v45 = v9;
  if (!v8)
  {
    v41 = nplog_obj(v9, v10, v11);
    v13 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 136315138;
    v52 = "-[NSPPrivacyProxyPolicyHandler addObliviousProxyAgent:processes:hostname:]";
    v42 = "%s called with null agentUUID";
LABEL_32:
    _os_log_fault_impl((void *)&_mh_execute_header, &v13->super, OS_LOG_TYPE_FAULT, v42, buf, 0xCu);
    goto LABEL_27;
  }
  v12 = v9;
  if (!v9)
  {
    v43 = nplog_obj(0, v10, v11);
    v13 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 136315138;
    v52 = "-[NSPPrivacyProxyPolicyHandler addObliviousProxyAgent:processes:hostname:]";
    v42 = "%s called with null hostname";
    goto LABEL_32;
  }
  v13 = self;
  objc_sync_enter(v13);
  -[NSPPrivacyProxyPolicyHandler removeObliviousProxyAgent:forHostname:apply:](v13, "removeObliviousProxyAgent:forHostname:apply:", v8, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = sub_1000815BC((uint64_t)NSPPrivacyProxyPolicySerialization, v12, v46, v8);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  v20 = v17;
  if (v17)
  {
    v21 = *(_QWORD *)v48;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v48 != v21)
          objc_enumerationMutation(v16);
        v23 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v22);
        v24 = nplog_obj(v17, v18, v19);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v52 = (const char *)v13;
          v53 = 2112;
          v54 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ adding oblivious agent policy %@", buf, 0x16u);
        }

        if (v13)
          controlSession = v13->_controlSession;
        else
          controlSession = 0;
        v27 = controlSession;
        v28 = -[NEPolicySession addPolicy:](v27, "addPolicy:", v23);

        if (v28)
        {
          v32 = nplog_obj(v29, v30, v31);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v52 = (const char *)v13;
            v53 = 1024;
            LODWORD(v54) = (_DWORD)v28;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%@ added oblivious agent policy %u", buf, 0x12u);
          }

          v34 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v28));
          objc_msgSend(v14, "addObject:", v34);
        }
        else
        {
          v35 = nplog_obj(v29, v30, v31);
          v34 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = (const char *)v13;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@ failed to add oblivious agent policy", buf, 0xCu);
          }
        }

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      v20 = v17;
    }
    while (v17);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v45, v44));
  if (v13)
    obliviousAgentPolicyIDs = v13->_obliviousAgentPolicyIDs;
  else
    obliviousAgentPolicyIDs = 0;
  v38 = obliviousAgentPolicyIDs;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v14, v36);

  if (v13)
    v39 = v13->_controlSession;
  else
    v39 = 0;
  v40 = v39;
  -[NEPolicySession apply](v40, "apply");

  objc_sync_exit(v13);
LABEL_27:

}

- (void)removeObliviousProxyAgent:(id)a3 forHostname:(id)a4 apply:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSPPrivacyProxyPolicyHandler *v12;
  void *v13;
  NSMutableDictionary *obliviousAgentPolicyIDs;
  NSMutableDictionary *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  NEPolicySession *controlSession;
  void *v22;
  NEPolicySession *v23;
  id v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NEPolicySession *v30;
  NEPolicySession *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  _BOOL4 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];

  v5 = a5;
  v8 = a3;
  v11 = a4;
  if (v11)
  {
    v12 = self;
    objc_sync_enter(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v11, v8));
    v35 = v5;
    if (v12)
      obliviousAgentPolicyIDs = v12->_obliviousAgentPolicyIDs;
    else
      obliviousAgentPolicyIDs = 0;
    v15 = obliviousAgentPolicyIDs;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v13));

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v37;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v17);
          if (v12)
            controlSession = v12->_controlSession;
          else
            controlSession = 0;
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v20);
          v23 = controlSession;
          -[NEPolicySession removePolicyWithID:](v23, "removePolicyWithID:", objc_msgSend(v22, "unsignedIntegerValue"));

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v24 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        v18 = v24;
      }
      while (v24);
    }

    if (v12)
      v25 = v12->_obliviousAgentPolicyIDs;
    else
      v25 = 0;
    v26 = v25;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", 0, v13);

    v27 = objc_msgSend(v17, "count");
    if (v27 && v35)
    {
      if (v12)
        v30 = v12->_controlSession;
      else
        v30 = 0;
      v31 = v30;
      -[NEPolicySession apply](v31, "apply");

    }
    v32 = nplog_obj(v27, v28, v29);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v41 = (const char *)v12;
      v42 = 2112;
      v43 = v11;
      v44 = 2112;
      v45 = v8;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@ removed oblivious agent policies for %@ (%@)", buf, 0x20u);
    }

    objc_sync_exit(v12);
  }
  else
  {
    v34 = nplog_obj(0, v9, v10);
    v12 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[NSPPrivacyProxyPolicyHandler removeObliviousProxyAgent:forHostname:apply:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_FAULT, "%s called with null hostname", buf, 0xCu);
    }
  }

}

- (void)addNetworkDiscoveryProxyAgent:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSPPrivacyProxyPolicyHandler *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  NEPolicySession *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NEPolicySession *session;
  NEPolicySession *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  NSMutableDictionary *networkSpecificProxyPolicyIDs;
  NSMutableDictionary *v45;
  NEPolicySession *v46;
  NEPolicySession *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSMutableDictionary *obj;
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
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  uint64_t v69;

  v6 = a3;
  v7 = a4;
  v49 = v7;
  v50 = v6;
  if (v6)
  {
    v10 = self;
    objc_sync_enter(v10);
    if (v10 && -[NSMutableDictionary count](v10->_networkSpecificProxyPolicyIDs, "count", v49))
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = v10->_networkSpecificProxyPolicyIDs;
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v61 != v12)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_networkSpecificProxyPolicyIDs, "objectForKeyedSubscript:", v14));
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v57;
              do
              {
                for (j = 0; j != v16; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v57 != v17)
                    objc_enumerationMutation(v15);
                  v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j);
                  v20 = v10->_session;
                  -[NEPolicySession removePolicyWithID:](v20, "removePolicyWithID:", objc_msgSend(v19, "unsignedIntegerValue"));

                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
              }
              while (v16);
            }

          }
          v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
        }
        while (v11);
      }

      -[NSMutableDictionary removeAllObjects](v10->_networkSpecificProxyPolicyIDs, "removeAllObjects");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v49));
    v22 = sub_100080934((uint64_t)NSPPrivacyProxyPolicySerialization, v50, v49);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v23 = (id)objc_claimAutoreleasedReturnValue(v22);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    v27 = v24;
    if (v24)
    {
      v28 = *(_QWORD *)v53;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v53 != v28)
            objc_enumerationMutation(v23);
          v30 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v29);
          v31 = nplog_obj(v24, v25, v26);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v67 = (const char *)v10;
            v68 = 2112;
            v69 = v30;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@ adding network based proxy policy %@", buf, 0x16u);
          }

          if (v10)
            session = v10->_session;
          else
            session = 0;
          v34 = session;
          v35 = -[NEPolicySession addPolicy:](v34, "addPolicy:", v30);

          if (v35)
          {
            v39 = nplog_obj(v36, v37, v38);
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v67 = (const char *)v10;
              v68 = 1024;
              LODWORD(v69) = (_DWORD)v35;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@ added network based proxy policy %u", buf, 0x12u);
            }

            v41 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v35));
            objc_msgSend(v21, "addObject:", v41);
          }
          else
          {
            v42 = nplog_obj(v36, v37, v38);
            v41 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v67 = (const char *)v10;
              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@ failed to add network based proxy policy", buf, 0xCu);
            }
          }

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        v27 = v24;
      }
      while (v24);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "UUIDString"));
    if (v10)
      networkSpecificProxyPolicyIDs = v10->_networkSpecificProxyPolicyIDs;
    else
      networkSpecificProxyPolicyIDs = 0;
    v45 = networkSpecificProxyPolicyIDs;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v21, v43);

    if (v10)
      v46 = v10->_session;
    else
      v46 = 0;
    v47 = v46;
    -[NEPolicySession apply](v47, "apply");

    objc_sync_exit(v10);
  }
  else
  {
    v48 = nplog_obj(v7, v8, v9);
    v10 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v67 = "-[NSPPrivacyProxyPolicyHandler addNetworkDiscoveryProxyAgent:with:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v10->super, OS_LOG_TYPE_FAULT, "%s called with null agentUUID", buf, 0xCu);
    }
  }

}

- (void)addProxiedContentAgent:(id)a3 maps:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSPPrivacyProxyPolicyHandler *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NEPolicySession *session;
  NEPolicySession *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  NSMutableDictionary *proxiedContentPolicyIDs;
  NSMutableDictionary *v32;
  NEPolicySession *v33;
  NEPolicySession *v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  void *v44;
  NSMutableDictionary *v45;
  NSMutableDictionary *proxiedContentNotifyFlags;
  NSMutableDictionary *v47;
  NSMutableDictionary *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id obj;
  void *v55;
  uint64_t v56;
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
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  uint64_t v74;
  _BYTE v75[128];

  v6 = a3;
  v7 = a4;
  v51 = v7;
  v52 = v6;
  if (v6)
  {
    v10 = self;
    objc_sync_enter(v10);
    -[NSPPrivacyProxyPolicyHandler removeProxiedContentAgent:apply:](v10, "removeProxiedContentAgent:apply:", v6, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = sub_100081E6C((uint64_t)NSPPrivacyProxyPolicySerialization, v6, v51);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(v11);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    v15 = v12;
    if (v12)
    {
      v16 = *(_QWORD *)v66;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v66 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)v17);
          v19 = nplog_obj(v12, v13, v14);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v72 = (const char *)v10;
            v73 = 2112;
            v74 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ adding proxied content policy %@", buf, 0x16u);
          }

          if (v10)
            session = v10->_session;
          else
            session = 0;
          v22 = session;
          v23 = -[NEPolicySession addPolicy:](v22, "addPolicy:", v18);

          if (v23)
          {
            v27 = nplog_obj(v24, v25, v26);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v72 = (const char *)v10;
              v73 = 1024;
              LODWORD(v74) = (_DWORD)v23;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@ added proxied content policy %u", buf, 0x12u);
            }

            v29 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v23));
            objc_msgSend(v55, "addObject:", v29);
          }
          else
          {
            v30 = nplog_obj(v24, v25, v26);
            v29 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v72 = (const char *)v10;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@ failed to add proxied content policy", buf, 0xCu);
            }
          }

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        v15 = v12;
      }
      while (v12);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "UUIDString"));
    if (v10)
      proxiedContentPolicyIDs = v10->_proxiedContentPolicyIDs;
    else
      proxiedContentPolicyIDs = 0;
    v32 = proxiedContentPolicyIDs;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v55, v50);

    if (v10)
      v33 = v10->_session;
    else
      v33 = 0;
    v34 = v33;
    -[NEPolicySession apply](v34, "apply");

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v53 = v51;
    v35 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v35)
    {
      v36 = 0;
      v56 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v56)
            objc_enumerationMutation(v53);
          v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v38, "supportsReverseProxying"))
          {
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "processes"));
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
            if (v40)
            {
              v41 = *(_QWORD *)v58;
              do
              {
                for (j = 0; j != v40; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v58 != v41)
                    objc_enumerationMutation(v39);
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000FF968, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j)));
                  v44 = v43;
                  if (v43)
                    v36 |= (unint64_t)objc_msgSend(v43, "unsignedLongLongValue");

                }
                v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
              }
              while (v40);
            }

          }
        }
        v35 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v35);

      if (v36)
      {
        v45 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v36));
        if (v10)
          proxiedContentNotifyFlags = v10->_proxiedContentNotifyFlags;
        else
          proxiedContentNotifyFlags = 0;
        v47 = proxiedContentNotifyFlags;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v45, v50);

LABEL_51:
        sub_10009495C((id *)&v10->super.isa);

        objc_sync_exit(v10);
        goto LABEL_52;
      }
    }
    else
    {

    }
    if (v10)
      v48 = v10->_proxiedContentNotifyFlags;
    else
      v48 = 0;
    v45 = v48;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", 0, v50);
    goto LABEL_51;
  }
  v49 = nplog_obj(v7, v8, v9);
  v10 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v72 = "-[NSPPrivacyProxyPolicyHandler addProxiedContentAgent:maps:]";
    _os_log_fault_impl((void *)&_mh_execute_header, &v10->super, OS_LOG_TYPE_FAULT, "%s called with null agentUUID", buf, 0xCu);
  }
LABEL_52:

}

- (void)removeProxiedContentAgent:(id)a3 apply:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSPPrivacyProxyPolicyHandler *v9;
  void *v10;
  NSMutableDictionary *proxiedContentPolicyIDs;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NEPolicySession *session;
  void *v19;
  NEPolicySession *v20;
  id v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *proxiedContentNotifyFlags;
  NSMutableDictionary *v25;
  NEPolicySession *v26;
  NEPolicySession *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;

  v4 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    if (v9)
      proxiedContentPolicyIDs = v9->_proxiedContentPolicyIDs;
    else
      proxiedContentPolicyIDs = 0;
    v12 = proxiedContentPolicyIDs;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v10));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v30;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v14);
          if (v9)
            session = v9->_session;
          else
            session = 0;
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v17);
          v20 = session;
          -[NEPolicySession removePolicyWithID:](v20, "removePolicyWithID:", objc_msgSend(v19, "unsignedIntegerValue", (_QWORD)v29));

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v15 = v21;
      }
      while (v21);
    }

    if (v9)
      v22 = v9->_proxiedContentPolicyIDs;
    else
      v22 = 0;
    v23 = v22;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", 0, v10);

    if (v9)
      proxiedContentNotifyFlags = v9->_proxiedContentNotifyFlags;
    else
      proxiedContentNotifyFlags = 0;
    v25 = proxiedContentNotifyFlags;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", 0, v10);

    if (objc_msgSend(v14, "count") && v4)
    {
      if (v9)
        v26 = v9->_session;
      else
        v26 = 0;
      v27 = v26;
      -[NEPolicySession apply](v27, "apply");

    }
    sub_10009495C((id *)&v9->super.isa);

    objc_sync_exit(v9);
  }
  else
  {
    v28 = nplog_obj(0, v6, v7);
    v9 = (NSPPrivacyProxyPolicyHandler *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[NSPPrivacyProxyPolicyHandler removeProxiedContentAgent:apply:]";
      _os_log_fault_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_FAULT, "%s called with null agentUUID", buf, 0xCu);
    }
  }

}

- (BOOL)addPoliciesForProbing
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NEPolicySession *session;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSMutableArray *probePolicyIDs;
  NSMutableArray *v23;
  void *v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  NSPPrivacyProxyPolicyHandler *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];

  v3 = sub_10008364C((uint64_t)NSPPrivacyProxyPolicySerialization);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v5)
  {
    v9 = v5;
    v10 = *(_QWORD *)v29;
    *(_QWORD *)&v8 = 138412546;
    v27 = v8;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v11);
        v13 = nplog_obj(v5, v6, v7);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v27;
          v33 = self;
          v34 = 2112;
          v35 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ adding probe policy %@", buf, 0x16u);
        }

        if (self)
          session = self->_session;
        else
          session = 0;
        v16 = -[NEPolicySession addPolicy:](session, "addPolicy:", v12, v27, (_QWORD)v28);
        v19 = nplog_obj(v16, v17, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = v20;
        if (!v16)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v33 = self;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@ failed to add probe policy", buf, 0xCu);
          }

          v25 = 0;
          goto LABEL_24;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v27;
          v33 = self;
          v34 = 2048;
          v35 = v16;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ added probe policy %lu", buf, 0x16u);
        }

        if (self)
          probePolicyIDs = self->_probePolicyIDs;
        else
          probePolicyIDs = 0;
        v23 = probePolicyIDs;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16));
        -[NSMutableArray addObject:](v23, "addObject:", v24);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      v9 = v5;
      if (v5)
        continue;
      break;
    }
  }
  v25 = 1;
LABEL_24:

  return v25;
}

- (void)handleAppInstallation:(id)a3
{
  id v4;
  NSPPrivacyProxyPolicyHandler *v5;
  NSMutableArray *safariTechnologyPreviewPolicyIDs;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  NEPolicySession *session;
  NEPolicySession *v53;
  int v54;
  NSPPrivacyProxyPolicyHandler *v55;
  __int16 v56;
  const __CFString *v57;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!objc_msgSend(v4, "containsObject:", CFSTR("com.apple.SafariTechnologyPreview")))
    goto LABEL_14;
  if (v5)
    safariTechnologyPreviewPolicyIDs = v5->_safariTechnologyPreviewPolicyIDs;
  else
    safariTechnologyPreviewPolicyIDs = 0;
  v7 = safariTechnologyPreviewPolicyIDs;
  v8 = -[NSMutableArray count](v7, "count");

  if (!v8)
  {
    v12 = nplog_obj(v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v54 = 138412546;
      v55 = v5;
      v56 = 2112;
      v57 = CFSTR("com.apple.SafariTechnologyPreview");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ adding policies for '%@'", (uint8_t *)&v54, 0x16u);
    }

    v14 = sub_100092444((void **)&v5->super.isa);
    if ((v14 & 1) != 0)
    {
      v17 = nplog_obj(v14, v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v54 = 138412546;
        v55 = v5;
        v56 = 2112;
        v57 = CFSTR("com.apple.SafariTechnologyPreview");
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ successfully added policies for '%@'", (uint8_t *)&v54, 0x16u);
      }

      v19 = 1;
LABEL_15:
      if (objc_msgSend(v4, "containsObject:", CFSTR("com.apple.mobilesafari")))
      {
        v22 = sub_1000919BC((id *)&v5->super.isa);
        v25 = nplog_obj(v22, v23, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v54 = 138412290;
          v55 = v5;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@ adding policies for Safari Bundles", (uint8_t *)&v54, 0xCu);
        }

        v27 = sub_1000926D0((uint64_t)v5);
        if ((v27 & 1) != 0)
        {
          v30 = nplog_obj(v27, v28, v29);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v54 = 138412290;
            v55 = v5;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@ successfully added policies for Safari Bundles", (uint8_t *)&v54, 0xCu);
          }

          v19 = 1;
        }
        else
        {
          v32 = nplog_obj(v27, v28, v29);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v54 = 138412290;
            v55 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@ failed to add policies for Safari Bundles", (uint8_t *)&v54, 0xCu);
          }

          sub_1000919BC((id *)&v5->super.isa);
        }
      }
      v34 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.mobilemail"));
      if ((_DWORD)v34)
      {
        v37 = nplog_obj(v34, v35, v36);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v54 = 138412546;
          v55 = v5;
          v56 = 2112;
          v57 = CFSTR("com.apple.mobilemail");
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ '%@' was installed", (uint8_t *)&v54, 0x16u);
        }

        v39 = sub_100091AE8((uint64_t)v5);
        v40 = v39;
        v43 = nplog_obj(v39, v41, v42);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v54 = 138412290;
          v55 = v5;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%@ adding policies for Mail App", (uint8_t *)&v54, 0xCu);
        }

        v45 = sub_100092974((void **)&v5->super.isa);
        if ((v45 & 1) != 0)
        {
          v48 = nplog_obj(v45, v46, v47);
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v54 = 138412290;
            v55 = v5;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%@ successfully added policies for Mail App", (uint8_t *)&v54, 0xCu);
          }

LABEL_38:
          if (v5)
            session = v5->_session;
          else
            session = 0;
          v53 = session;
          -[NEPolicySession apply](v53, "apply");

          goto LABEL_41;
        }
        v50 = nplog_obj(v45, v46, v47);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v54 = 138412290;
          v55 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%@ failed to add policies for Mail App", (uint8_t *)&v54, 0xCu);
        }

        sub_100091AE8((uint64_t)v5);
        v19 |= v40;
      }
      if (!v19)
        goto LABEL_41;
      goto LABEL_38;
    }
    v20 = nplog_obj(v14, v15, v16);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v54 = 138412546;
      v55 = v5;
      v56 = 2112;
      v57 = CFSTR("com.apple.SafariTechnologyPreview");
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@ failed to add policies for '%@'", (uint8_t *)&v54, 0x16u);
    }

    sub_100091890((id *)&v5->super.isa);
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
LABEL_41:
  objc_sync_exit(v5);

}

- (void)handleAppUninstallation:(id)a3
{
  id v4;
  NSPPrivacyProxyPolicyHandler *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NEPolicySession *session;
  NEPolicySession *v30;
  int v31;
  NSPPrivacyProxyPolicyHandler *v32;
  __int16 v33;
  const __CFString *v34;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.SafariTechnologyPreview"));
  v9 = (int)v6;
  if ((_DWORD)v6)
  {
    v10 = nplog_obj(v6, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v31 = 138412546;
      v32 = v5;
      v33 = 2112;
      v34 = CFSTR("com.apple.SafariTechnologyPreview");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ removing policies for '%@'", (uint8_t *)&v31, 0x16u);
    }

    sub_100091890((id *)&v5->super.isa);
  }
  if (objc_msgSend(v4, "containsObject:", CFSTR("com.apple.mobilesafari")))
  {
    v12 = sub_1000919BC((id *)&v5->super.isa);
    v15 = nplog_obj(v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v31 = 138412290;
      v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ adding policies for Safari Bundles", (uint8_t *)&v31, 0xCu);
    }

    v17 = sub_1000926D0((uint64_t)v5);
    if ((v17 & 1) != 0)
    {
      v20 = nplog_obj(v17, v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v31 = 138412290;
        v32 = v5;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ successfully added policies for Safari Bundles", (uint8_t *)&v31, 0xCu);
      }

      v9 = 1;
    }
    else
    {
      v22 = nplog_obj(v17, v18, v19);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v31 = 138412290;
        v32 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@ failed to add policies for Safari Bundles", (uint8_t *)&v31, 0xCu);
      }

      sub_1000919BC((id *)&v5->super.isa);
    }
  }
  v24 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.mobilemail"));
  if (!(_DWORD)v24)
  {
    if (!v9)
      goto LABEL_24;
    goto LABEL_21;
  }
  v27 = nplog_obj(v24, v25, v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v31 = 138412546;
    v32 = v5;
    v33 = 2112;
    v34 = CFSTR("com.apple.mobilemail");
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%@ '%@' was uninstalled", (uint8_t *)&v31, 0x16u);
  }

  if (((sub_100091AE8((uint64_t)v5) | v9) & 1) != 0)
  {
LABEL_21:
    if (v5)
      session = v5->_session;
    else
      session = 0;
    v30 = session;
    -[NEPolicySession apply](v30, "apply");

  }
LABEL_24:
  objc_sync_exit(v5);

}

- (BOOL)addPoliciesForMPTCPConverterProxy:(id)a3
{
  id v4;
  NSMutableArray *mptcpProxyPolicyIDs;
  unsigned __int8 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NEPolicySession *session;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  void *v27;
  NEPolicySession *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  NSPPrivacyProxyPolicyHandler *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];

  v4 = a3;
  if (self)
    mptcpProxyPolicyIDs = self->_mptcpProxyPolicyIDs;
  else
    mptcpProxyPolicyIDs = 0;
  if (-[NSMutableArray count](mptcpProxyPolicyIDs, "count"))
  {
    v6 = 0;
  }
  else
  {
    v30 = v4;
    v7 = sub_1000838F0((uint64_t)NSPPrivacyProxyPolicySerialization, v4);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v32;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v14);
          v16 = nplog_obj(v9, v10, v11);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v36 = self;
            v37 = 2112;
            v38 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ adding MPTCP converter proxy policy %@", buf, 0x16u);
          }

          if (self)
            session = self->_session;
          else
            session = 0;
          v19 = -[NEPolicySession addPolicy:](session, "addPolicy:", v15);
          v22 = nplog_obj(v19, v20, v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          v24 = v23;
          if (!v19)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v36 = self;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@ failed to add MPTCP converter proxy policy", buf, 0xCu);
            }

            v6 = 0;
            goto LABEL_30;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v36 = self;
            v37 = 2048;
            v38 = v19;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ added MPTCP converter proxy policy %lu", buf, 0x16u);
          }

          if (self)
            v25 = self->_mptcpProxyPolicyIDs;
          else
            v25 = 0;
          v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
          -[NSMutableArray addObject:](v26, "addObject:", v27);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        v12 = v9;
        if (v9)
          continue;
        break;
      }
    }

    if (self)
      v28 = self->_session;
    else
      v28 = 0;
    v6 = -[NEPolicySession apply](v28, "apply");
LABEL_30:
    v4 = v30;

  }
  return v6;
}

- (void)removePoliciesForMPTCPConverterProxy:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *mptcpProxyPolicyIDs;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NEPolicySession *session;
  NEPolicySession *v13;
  id v14;
  NEPolicySession *v15;
  NSMutableArray *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (self)
    mptcpProxyPolicyIDs = self->_mptcpProxyPolicyIDs;
  else
    mptcpProxyPolicyIDs = 0;
  v6 = mptcpProxyPolicyIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        if (self)
          session = self->_session;
        else
          session = 0;
        v13 = session;
        -[NEPolicySession removePolicyWithID:](v13, "removePolicyWithID:", objc_msgSend(v11, "unsignedIntegerValue", (_QWORD)v17));

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v14;
    }
    while (v14);
  }

  if (v3)
  {
    if (self)
      v15 = self->_session;
    else
      v15 = 0;
    -[NEPolicySession apply](v15, "apply", (_QWORD)v17);
  }
  if (self)
    v16 = self->_mptcpProxyPolicyIDs;
  else
    v16 = 0;
  -[NSMutableArray removeAllObjects](v16, "removeAllObjects", (_QWORD)v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkToolProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_mptcpProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_proxiedContentNotifyFlags, 0);
  objc_storeStrong((id *)&self->_networkSpecificProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_proxiedContentPolicyIDs, 0);
  objc_storeStrong((id *)&self->_obliviousAgentPolicyIDs, 0);
  objc_storeStrong((id *)&self->_domainFilterIDs, 0);
  objc_storeStrong((id *)&self->_domainFilterPolicyIDs, 0);
  objc_storeStrong((id *)&self->_probePolicyIDs, 0);
  objc_storeStrong((id *)&self->_mailAppPolicyIDs, 0);
  objc_storeStrong((id *)&self->_safariBundlePolicyIDs, 0);
  objc_storeStrong((id *)&self->_safariTechnologyPreviewPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfacePolicyIDs, 0);
  objc_storeStrong((id *)&self->_captiveNetworkExceptionHostname, 0);
  objc_storeStrong((id *)&self->_disabledInterfaces, 0);
  objc_storeStrong((id *)&self->_mainPolicyIDs, 0);
  objc_storeStrong((id *)&self->_exceptionProcessPaths, 0);
  objc_storeStrong((id *)&self->_exceptionBundleIDs, 0);
  objc_storeStrong((id *)&self->_ingressFallbackProxyURL, 0);
  objc_storeStrong((id *)&self->_ingressProxyURL, 0);
  objc_storeStrong((id *)&self->_flowDivertHandle, 0);
  objc_storeStrong((id *)&self->_controlSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

@end
