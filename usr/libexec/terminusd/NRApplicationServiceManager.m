@implementation NRApplicationServiceManager

- (NRApplicationServiceManager)init
{
  NRApplicationServiceManager *v2;
  NRApplicationServiceManager *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *asNameToListenRequest;
  NSMutableDictionary *v8;
  NSMutableDictionary *asNameToBrowseRequests;
  NSMutableDictionary *v10;
  NSMutableDictionary *asNameToResolveRequests;
  NSMutableDictionary *v12;
  NSMutableDictionary *asNamesToIncomingResolveRequestEndpoint;
  NSMutableArray *v14;
  NSMutableArray *asClients;
  objc_class *v16;
  NSString *v17;
  uint64_t v18;
  NSString *policyIdentifier;
  OS_nw_agent *v20;
  NSUUID *v21;
  NSUUID *resolverAgentUUID;
  OS_nw_agent *resolverAgent;
  OS_nw_agent *v24;
  OS_nw_agent *v25;
  NSUUID *v26;
  NSUUID *listenerAgentUUID;
  OS_nw_agent *listenerAgent;
  OS_nw_agent *v29;
  NSUUID *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  NRApplicationServiceManager *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  NSUUID *v47;
  void *v48;
  void *v49;
  id v50;
  void **v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v62;
  int IsLevelEnabled;
  id v64;
  uint64_t v65;
  char *v66;
  int *v67;
  uint64_t v68;
  id v69;
  objc_super v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  void **v75;
  uint64_t v76;
  void (*v77)(uint64_t, void *, void *);
  void *v78;
  NRApplicationServiceManager *v79;
  _QWORD v80[5];
  void **v81;
  uint64_t v82;
  void (*v83)(uint64_t, void *, void *);
  void *v84;
  NRApplicationServiceManager *v85;
  _QWORD v86[2];

  v70.receiver = self;
  v70.super_class = (Class)NRApplicationServiceManager;
  v3 = -[NRApplicationServiceManager init](&v70, "init");
  if (!v3)
  {
    v62 = sub_1000F4234();
    IsLevelEnabled = _NRLogIsLevelEnabled(v62, 16);

    if (IsLevelEnabled)
    {
      v64 = sub_1000F4234();
      _NRLogWithArgs(v64, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRApplicationServiceManager init]", 204);

    }
    v65 = _os_log_pack_size(12);
    v66 = (char *)&v70 - ((__chkstk_darwin(v65) + 15) & 0xFFFFFFFFFFFFFFF0);
    v67 = __error();
    v68 = _os_log_pack_fill(v66, v65, *v67, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v68 = 136446210;
    *(_QWORD *)(v68 + 4) = "-[NRApplicationServiceManager init]";
    v69 = sub_1000F4234();
    _NRLogAbortWithPack(v69, v66);
    goto LABEL_34;
  }
  v2 = v3;
  v4 = (OS_dispatch_queue *)sub_10014CFBC();
  queue = v2->_queue;
  v2->_queue = v4;

  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNameToListenRequest = v2->_asNameToListenRequest;
  v2->_asNameToListenRequest = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNameToBrowseRequests = v2->_asNameToBrowseRequests;
  v2->_asNameToBrowseRequests = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNameToResolveRequests = v2->_asNameToResolveRequests;
  v2->_asNameToResolveRequests = v10;

  v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  asNamesToIncomingResolveRequestEndpoint = v2->_asNamesToIncomingResolveRequestEndpoint;
  v2->_asNamesToIncomingResolveRequestEndpoint = v12;

  v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  asClients = v2->_asClients;
  v2->_asClients = v14;

  v16 = (objc_class *)objc_opt_class(v2);
  v17 = NSStringFromClass(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  policyIdentifier = v2->_policyIdentifier;
  v2->_policyIdentifier = (NSString *)v18;

  v20 = (OS_nw_agent *)nw_agent_create("com.apple.networkrelay", "ASResolver", "NetworkRelay appsvc resolver", v2->_queue);
  v86[0] = 0;
  v86[1] = 0;
  nw_agent_get_uuid(v20, v86);
  v21 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v86);
  resolverAgentUUID = v2->_resolverAgentUUID;
  v2->_resolverAgentUUID = v21;

  v75 = _NSConcreteStackBlock;
  v76 = 3221225472;
  v77 = sub_1000F5064;
  v78 = &unk_1001B7798;
  v79 = v2;
  *(_QWORD *)&v71 = _NSConcreteStackBlock;
  *((_QWORD *)&v71 + 1) = 3221225472;
  *(_QWORD *)&v72 = sub_1000F53E4;
  *((_QWORD *)&v72 + 1) = &unk_1001B77C0;
  *(_QWORD *)&v73 = v2;
  nw_agent_set_browse_handlers(v20, &v75, &v71);
  v81 = _NSConcreteStackBlock;
  v82 = 3221225472;
  v83 = sub_1000F5928;
  v84 = &unk_1001B7798;
  v85 = v2;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_1000F5E8C;
  v80[3] = &unk_1001B77C0;
  v80[4] = v2;
  nw_agent_add_resolve_handlers(v20, 6, 1, &v81, v80);
  nw_agent_change_state(v20, 1, 2, 0);
  resolverAgent = v2->_resolverAgent;
  v2->_resolverAgent = v20;
  v24 = v20;

  v25 = (OS_nw_agent *)nw_agent_create("com.apple.networkrelay", "ASListener", "NetworkRelay appsvc listener", v2->_queue);
  v81 = 0;
  v82 = 0;
  nw_agent_get_uuid(v25, &v81);
  v26 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v81);
  listenerAgentUUID = v2->_listenerAgentUUID;
  v2->_listenerAgentUUID = v26;

  v75 = _NSConcreteStackBlock;
  v76 = 3221225472;
  v77 = sub_1000F4424;
  v78 = &unk_1001B7798;
  v79 = v2;
  *(_QWORD *)&v71 = _NSConcreteStackBlock;
  *((_QWORD *)&v71 + 1) = 3221225472;
  *(_QWORD *)&v72 = sub_1000F46DC;
  *((_QWORD *)&v72 + 1) = &unk_1001B77C0;
  *(_QWORD *)&v73 = v2;
  nw_agent_set_browse_handlers(v25, &v75, &v71);
  nw_agent_change_state(v25, 1, 2, 0);
  listenerAgent = v2->_listenerAgent;
  v2->_listenerAgent = v25;
  v29 = v25;

  v30 = v2->_resolverAgentUUID;
  if (v30)
  {

  }
  else if (!v2->_listenerAgentUUID)
  {
    goto LABEL_20;
  }
  v31 = objc_alloc_init((Class)NSMutableArray);
  if (v2->_resolverAgentUUID)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult removeNetworkAgentUUID:](NEPolicyResult, "removeNetworkAgentUUID:"));
    objc_msgSend(v31, "addObject:", v32);

  }
  if (v2->_listenerAgentUUID)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult removeNetworkAgentUUID:](NEPolicyResult, "removeNetworkAgentUUID:"));
    objc_msgSend(v31, "addObject:", v33);

  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v34 = v31;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v71, &v75, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        v39 = v2;
        if (*(_QWORD *)v72 != v37)
          objc_enumerationMutation(v34);
        v40 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v41 = objc_alloc((Class)NEPolicy);
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
        v80[0] = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 1));
        v44 = objc_msgSend(v41, "initWithOrder:result:conditions:", 20, v40, v43);

        objc_opt_self(NRDPolicySessionManager);
        if (qword_1001E4A20 != -1)
          dispatch_once(&qword_1001E4A20, &stru_1001B8590);
        v2 = v39;
        v45 = (id)qword_1001E4A18;
        v46 = sub_100127310((uint64_t)v45, v39->_policyIdentifier, v44);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v71, &v75, 16);
    }
    while (v36);
  }

LABEL_20:
  v47 = v2->_resolverAgentUUID;
  if (v47)
  {

  }
  else if (!v2->_listenerAgentUUID)
  {
    goto LABEL_26;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult skipWithOrder:](NEPolicyResult, "skipWithOrder:", 21));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition customEntitlement:](NEPolicyCondition, "customEntitlement:", CFSTR("com.apple.private.application-service-browse")));
  v50 = objc_alloc((Class)NEPolicy);
  v51 = (void **)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
  v81 = v51;
  v82 = (uint64_t)v49;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 2));
  v53 = objc_msgSend(v50, "initWithOrder:result:conditions:", 15, v48, v52);

  objc_opt_self(NRDPolicySessionManager);
  if (qword_1001E4A20 != -1)
    dispatch_once(&qword_1001E4A20, &stru_1001B8590);
  v54 = (id)qword_1001E4A18;
  v55 = sub_100127310((uint64_t)v54, v2->_policyIdentifier, v53);

LABEL_26:
  objc_opt_self(NRDPolicySessionManager);
  if (qword_1001E4A20 != -1)
LABEL_34:
    dispatch_once(&qword_1001E4A20, &stru_1001B8590);
  v56 = (id)qword_1001E4A18;
  v57 = (id *)v56;
  if (v56)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v56 + 1));
    if ((objc_msgSend(v57[2], "apply") & 1) == 0)
      sub_100109270(CFSTR("NRPolicySessionManager"), CFSTR("ApplyPolicy Failed"), 0, 1, CFSTR("Failed to apply policies"), v58, v59, v60, (uint64_t)v70.receiver);
  }

  return v2;
}

- (id)description
{
  id v3;
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nName: NRApplicationServiceManager"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\nlisten: %@"), self->_asNameToListenRequest);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nbrowse: %@"), self->_asNameToBrowseRequests);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresolve: %@"), self->_asNameToResolveRequests);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nincoming: %@"), self->_asNamesToIncomingResolveRequestEndpoint);
  v14 = v3;
  objc_msgSend(v3, "appendFormat:", CFSTR("\nclients: %@"), self->_asClients);
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_asNameToResolveRequests;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = sub_1000F4064((uint64_t)self, v10);
        if (objc_msgSend(v11, "count"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count")));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v14, "appendFormat:", CFSTR("\nresolver keys: %@"), v4);
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerAgentUUID, 0);
  objc_storeStrong((id *)&self->_listenerAgent, 0);
  objc_storeStrong((id *)&self->_resolverAgentUUID, 0);
  objc_storeStrong((id *)&self->_resolverAgent, 0);
  objc_storeStrong((id *)&self->_asNamesToIncomingResolveRequestEndpoint, 0);
  objc_storeStrong((id *)&self->_asClients, 0);
  objc_storeStrong((id *)&self->_asNameToResolveRequests, 0);
  objc_storeStrong((id *)&self->_asNameToBrowseRequests, 0);
  objc_storeStrong((id *)&self->_asNameToListenRequest, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
