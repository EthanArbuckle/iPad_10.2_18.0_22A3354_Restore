@implementation W5RapportServer

- (W5RapportServer)initWithRequestListeners:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  objc_super v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;

  v5 = a3;
  if ((_os_feature_enabled_impl("WiFiVelocity", "RapportServer") & 1) != 0)
  {
    if (+[W5FeatureAvailability diagnosticsModeEnabled](W5FeatureAvailability, "diagnosticsModeEnabled"))
    {
      v17.receiver = self;
      v17.super_class = (Class)W5RapportServer;
      self = -[W5RapportServer init](&v17, "init");
      if (!self)
        goto LABEL_17;
      v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifi.W5RapportServer", 0);
      queue = self->_queue;
      self->_queue = v6;

      if (!self->_queue)
        goto LABEL_17;
      objc_storeStrong((id *)&self->_listeners, a3);
      if (self->_listeners)
      {
        if (-[W5RapportServer _configureCompaionLinkClient](self, "_configureCompaionLinkClient"))
          goto LABEL_7;
        v13 = sub_10008F56C();
        v10 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136315650;
          v19 = "-[W5RapportServer initWithRequestListeners:]";
          v20 = 2080;
          v21 = "W5RapportServer.m";
          v22 = 1024;
          v23 = 56;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to configure link client", &v18, 28);
        }
      }
      else
      {
        v12 = sub_10008F56C();
        v10 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136315650;
          v19 = "-[W5RapportServer initWithRequestListeners:]";
          v20 = 2080;
          v21 = "W5RapportServer.m";
          v22 = 1024;
          v23 = 54;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) rapport listeners is nil", &v18, 28);
        }
      }
    }
    else
    {
      v11 = sub_10008F56C();
      v10 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = "-[W5RapportServer initWithRequestListeners:]";
        v20 = 2080;
        v21 = "W5RapportServer.m";
        v22 = 1024;
        v23 = 44;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) rapport server is not available.", &v18, 28);
      }
    }
  }
  else
  {
    v9 = sub_10008F56C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = "-[W5RapportServer initWithRequestListeners:]";
      v20 = 2080;
      v21 = "W5RapportServer.m";
      v22 = 1024;
      v23 = 43;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) rapport server feature flag is off.", &v18, 28);
    }
  }

LABEL_17:
  v14 = sub_10008F56C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "-[W5RapportServer initWithRequestListeners:]";
    v20 = 2080;
    v21 = "W5RapportServer.m";
    v22 = 1024;
    v23 = 63;
    LODWORD(v16) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v18, v16, LODWORD(v17.receiver));
  }

  self = 0;
LABEL_7:

  return self;
}

- (BOOL)_configureCompaionLinkClient
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _BYTE v19[128];
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v3 = objc_alloc_init((Class)RPCompanionLinkClient);
  v4 = v3;
  if (v3)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000840C4;
    v18[3] = &unk_1000D5268;
    v18[4] = self;
    objc_msgSend(v3, "setInvalidationHandler:", v18);
    objc_msgSend(v4, "setDispatchQueue:", self->_queue);
    objc_msgSend(v4, "setServiceType:", CFSTR("com.apple.wifivelocityd.rapportWake"));
    v5 = sub_10008F56C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315650;
      v21 = "-[W5RapportServer _configureCompaionLinkClient]";
      v22 = 2080;
      v23 = "W5RapportServer.m";
      v24 = 1024;
      v25 = 87;
      LODWORD(v13) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) companion link client activated successfully", (const char *)&v20, v13, (_DWORD)v14);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5RapportServer listeners](self, "listeners"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
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
          -[W5RapportServer _registerRequestsForListener:rapportClient:](self, "_registerRequestsForListener:rapportClient:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), v4);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }

    -[W5RapportServer setRapportClient:](self, "setRapportClient:", v4);
  }

  return v4 != 0;
}

- (void)_registerRequestsForListener:(id)a3 rapportClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___W5PeerRequestListener);
      v10 = sub_10008F56C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if ((v9 & 1) != 0)
      {
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
          v19 = 138543618;
          v20 = v6;
          v21 = 2114;
          v22 = v13;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] Registering listener='%{public}@' for identifier='%{public}@'", &v19, 22);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10008441C;
        v17[3] = &unk_1000D7470;
        v18 = v6;
        objc_msgSend(v8, "registerRequestID:options:handler:", v14, 0, v17);

        -[RPCompanionLinkClient activateWithCompletion:](self->_rapportClient, "activateWithCompletion:", &stru_1000D7490);
        v11 = v18;
      }
      else if (v12)
      {
        v19 = 138543362;
        v20 = v6;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] listener='%{public}@' doesn't conform to protocol", &v19, 12);
      }
    }
    else
    {
      v16 = sub_10008F56C();
      v11 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] nil rapport client", &v19, 2);
      }
    }
  }
  else
  {
    v15 = sub_10008F56C();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] nil rapport listener", &v19, 2);
    }
  }

}

- (void)invalidateDiscoveryClient
{
  RPCompanionLinkClient *rapportClient;

  -[RPCompanionLinkClient invalidate](self->_rapportClient, "invalidate");
  rapportClient = self->_rapportClient;
  self->_rapportClient = 0;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RPCompanionLinkClient)rapportClient
{
  return self->_rapportClient;
}

- (void)setRapportClient:(id)a3
{
  objc_storeStrong((id *)&self->_rapportClient, a3);
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
