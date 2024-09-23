@implementation W5PeerDiagnosticsRequest

- (W5PeerDiagnosticsRequest)initWithPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  W5PeerDiagnosticsRequest *v18;
  W5PeerDiagnosticsRequest *v19;
  id v20;
  id reply;
  NSString *identifier;
  W5PeerDiagnosticsRequestPayload *v23;
  W5PeerDiagnosticsRequestPayload *requestPayload;
  void *v25;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  objc_super v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)W5PeerDiagnosticsRequest;
  v18 = -[W5PeerDiagnosticsRequest init](&v30, "init");
  v19 = v18;
  if (v18
    && (objc_storeStrong((id *)&v18->_peer, a3), v13)
    && (v20 = objc_retainBlock(v17), reply = v19->_reply, v19->_reply = v20, reply, v17))
  {
    identifier = v19->_identifier;
    v19->_discoveryFlags = 1;
    v19->_identifier = (NSString *)CFSTR("com.apple.wifi.peer.peerDiagnostics");

    v23 = objc_alloc_init(W5PeerDiagnosticsRequestPayload);
    requestPayload = v19->_requestPayload;
    v19->_requestPayload = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest _currentVersion](v19, "_currentVersion"));
    -[W5PeerDiagnosticsRequestPayload setVersion:](v19->_requestPayload, "setVersion:", v25);

    -[W5PeerDiagnosticsRequestPayload setConfiguration:](v19->_requestPayload, "setConfiguration:", v15);
    -[W5PeerDiagnosticsRequestPayload setTests:](v19->_requestPayload, "setTests:", v14);
    -[W5PeerDiagnosticsRequestPayload setUuid:](v19->_requestPayload, "setUuid:", v16);
  }
  else
  {

    v27 = sub_10008F56C();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315650;
      v32 = "-[W5PeerDiagnosticsRequest initWithPeer:diagnostics:configuration:uuid:reply:]";
      v33 = 2080;
      v34 = "W5PeerDiagnosticsRequest.m";
      v35 = 1024;
      v36 = 53;
      LODWORD(v29) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v28, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v31, v29, LODWORD(v30.receiver));
    }

    v19 = 0;
  }

  return v19;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void (**v15)(_QWORD, _QWORD, _QWORD);
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest reply](self, "reply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
    ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v7, 0);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
    if (!v9)
    {
      v10 = sub_10008F56C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
        v16 = 136315906;
        v17 = "-[W5PeerDiagnosticsRequest handleResponse:]";
        v18 = 2080;
        v19 = "W5PeerDiagnosticsRequest.m";
        v20 = 1024;
        v21 = 66;
        v22 = 2114;
        v23 = v12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) results data is not in payload:%{public}@", &v16, 38);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest reply](self, "reply"));
      ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v13, 0);

    }
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest reply](self, "reply"));
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v9);

  }
}

- (id)_currentVersion
{
  return &off_1000E3A20;
}

- (int64_t)controlFlags
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequest peer](self, "peer"));
  v3 = objc_msgSend(v2, "controlFlags");

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(W5PeerDiagnosticsResponsePayload, a2);
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (W5PeerDiagnosticsRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (void)setRequestPayload:(id)a3
{
  objc_storeStrong((id *)&self->_requestPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestPayload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
