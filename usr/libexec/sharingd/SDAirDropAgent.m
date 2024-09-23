@implementation SDAirDropAgent

- (SDAirDropAgent)initWithEndpointService:(id)a3
{
  id v5;
  SDAirDropAgent *v6;
  uint64_t v7;
  NSObject *v8;
  NSMutableSet *v9;
  NSMutableSet *clientTokens;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SDAirDropAgent;
  v6 = -[SDAirDropAgent init](&v15, "init");
  if (v6)
  {
    v7 = airdrop_nw_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initializing Sharing network agent", buf, 2u);
    }

    objc_storeStrong((id *)&v6->_dispatchQueue, &_dispatch_main_q);
    v9 = objc_opt_new(NSMutableSet);
    clientTokens = v6->_clientTokens;
    v6->_clientTokens = v9;

    objc_storeStrong((id *)&v6->_endpointService, a3);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v6);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100180E44;
    v12[3] = &unk_1007193F8;
    objc_copyWeak(&v13, (id *)buf);
    -[SDAirDropEndpointService setEndpointsChangedHandler:](v6->_endpointService, "setEndpointsChangedHandler:", v12);
    if (+[SFAirDropUserDefaults_objc privateContactDiscoveryEnabled](SFAirDropUserDefaults_objc, "privateContactDiscoveryEnabled"))-[SDAirDropAgent _createBrowseAgent](v6, "_createBrowseAgent");
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

  return v6;
}

- (void)_setupPolicy
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  _QWORD v34[3];

  v3 = airdrop_nw_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v32) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuring agent policies", (uint8_t *)&v32, 2u);
  }

  v5 = objc_alloc_init((Class)NEPolicySession);
  -[SDAirDropAgent setPolicySession:](self, "setPolicySession:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    objc_msgSend(v9, "setPriority:", 300);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    objc_msgSend(v10, "lockSessionToCurrentProcess");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
    v12 = objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](NEPolicyResult, "netAgentUUID:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](NEPolicyCondition, "allInterfaces"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.airdrop"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AirDropNetworkAgent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition requiredAgentDomain:agentType:](NEPolicyCondition, "requiredAgentDomain:agentType:", v14, v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition customEntitlement:](NEPolicyCondition, "customEntitlement:", CFSTR("com.apple.private.application-service-browse")));
    v34[0] = v13;
    v34[1] = v16;
    v34[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 3));
    v19 = objc_msgSend(objc_alloc((Class)NEPolicy), "initWithOrder:result:conditions:", 10, v12, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    v21 = objc_msgSend(v20, "addPolicy:", v19);

    if (!v21)
    {
      v24 = airdrop_nw_log(v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
        v32 = 138412290;
        v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to add entitlement allow policy for agent %@", (uint8_t *)&v32, 0xCu);

      }
    }
    v27 = airdrop_nw_log(v22, v23);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
      v32 = 138412290;
      v33 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Applying policies for agent %@", (uint8_t *)&v32, 0xCu);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent policySession](self, "policySession"));
    objc_msgSend(v30, "apply");

  }
  else
  {
    v31 = airdrop_nw_log(v7, v8);
    v12 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to create policy session", (uint8_t *)&v32, 2u);
    }
  }

}

- (void)_createBrowseAgent
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint8_t buf[8];
  uint64_t v35;

  v3 = airdrop_nw_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating browse agent", buf, 2u);
  }

  v5 = (void *)nw_agent_create("com.apple.airdrop", "AirDropNetworkAgent", "AirDrop Browse Agent", self->_dispatchQueue);
  -[SDAirDropAgent setBrowseAgent:](self, "setBrowseAgent:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent browseAgent](self, "browseAgent"));
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v35 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent browseAgent](self, "browseAgent"));
    nw_agent_get_uuid(v9, buf);

    v10 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", buf);
    -[SDAirDropAgent setIdentifier:](self, "setIdentifier:", v10);

    v13 = airdrop_nw_log(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent identifier](self, "identifier"));
      v32 = 138412290;
      v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Browse Agent UUID=%@", (uint8_t *)&v32, 0xCu);

    }
    -[SDAirDropAgent _setupPolicy](self, "_setupPolicy");
    -[SDAirDropAgent _setupBrowseHandlers](self, "_setupBrowseHandlers");
    v16 = -[SDAirDropAgent _setupAssertHandlers](self, "_setupAssertHandlers");
    v18 = airdrop_nw_log(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Activating browse agent", (uint8_t *)&v32, 2u);
    }

    v20 = nw_agent_change_state(self->_browseAgent, 1, 4, 0);
    v22 = airdrop_nw_log(v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Browse agent ready!", (uint8_t *)&v32, 2u);
    }
  }
  else
  {
    v24 = airdrop_nw_log(v7, v8);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100181EC4(v23, v25, v26, v27, v28, v29, v30, v31);
  }

}

- (void)_setupBrowseHandlers
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = airdrop_nw_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting Agent Browse handlers", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent browseAgent](self, "browseAgent"));
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100181548;
  v7[3] = &unk_100719420;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100181768;
  v6[3] = &unk_100719448;
  nw_agent_set_browse_handlers(v5, v7, v6);

}

- (id)_agentClientTokenForClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropAgent clientTokens](self, "clientTokens", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "agentClient"));
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "client"));

        if (v11 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)handleEndpointsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SDAirDropAgent *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAirDropAgent dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100181AC4;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_nw_agent)browseAgent
{
  return self->_browseAgent;
}

- (void)setBrowseAgent:(id)a3
{
  objc_storeStrong((id *)&self->_browseAgent, a3);
}

- (NEVirtualInterface_s)interface
{
  return self->_interface;
}

- (void)setInterface:(NEVirtualInterface_s *)a3
{
  self->_interface = a3;
}

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
  objc_storeStrong((id *)&self->_policySession, a3);
}

- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)endpointService
{
  return self->_endpointService;
}

- (void)setEndpointService:(id)a3
{
  objc_storeStrong((id *)&self->_endpointService, a3);
}

- (NSMutableSet)clientTokens
{
  return self->_clientTokens;
}

- (void)setClientTokens:(id)a3
{
  objc_storeStrong((id *)&self->_clientTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientTokens, 0);
  objc_storeStrong((id *)&self->_endpointService, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_browseAgent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
