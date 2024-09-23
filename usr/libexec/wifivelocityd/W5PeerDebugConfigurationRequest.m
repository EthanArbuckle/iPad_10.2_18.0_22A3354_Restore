@implementation W5PeerDebugConfigurationRequest

- (W5PeerDebugConfigurationRequest)initWithPeer:(id)a3 type:(unint64_t)a4 debugConfiguration:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  W5PeerDebugConfigurationRequest *v14;
  W5PeerDebugConfigurationRequest *v15;
  id v16;
  id reply;
  NSString *identifier;
  W5PeerDebugRequestPayload *v19;
  W5PeerDebugRequestPayload *requestPayload;
  void *v21;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  objc_super v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)W5PeerDebugConfigurationRequest;
  v14 = -[W5PeerDebugConfigurationRequest init](&v26, "init");
  v15 = v14;
  if (v11 && v14 && (objc_storeStrong((id *)&v14->_peer, a3), v13))
  {
    v16 = objc_retainBlock(v13);
    reply = v15->_reply;
    v15->_reply = v16;

    v15->_type = a4;
    v15->_discoveryFlags = 1;
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)CFSTR("com.apple.wifi.peer.debugConfiguration");

    v19 = objc_alloc_init(W5PeerDebugRequestPayload);
    requestPayload = v15->_requestPayload;
    v15->_requestPayload = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest _currentVersion](v15, "_currentVersion"));
    -[W5PeerDebugRequestPayload setVersion:](v15->_requestPayload, "setVersion:", v21);

    -[W5PeerDebugRequestPayload setRequestType:](v15->_requestPayload, "setRequestType:", v15->_type);
    if (v12)
      -[W5PeerDebugRequestPayload setConfiguration:](v15->_requestPayload, "setConfiguration:", v12);
  }
  else
  {

    v23 = sub_10008F56C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315650;
      v28 = "-[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:]";
      v29 = 2080;
      v30 = "W5PeerDebugConfigurationRequest.m";
      v31 = 1024;
      v32 = 58;
      LODWORD(v25) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v24, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v27, v25, LODWORD(v26.receiver));
    }

    v15 = 0;
  }

  return v15;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));

  if (v9 || (id)-[W5PeerDebugConfigurationRequest type](self, "type") != (id)1)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest reply](self, "reply"));

  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest reply](self, "reply"));
    ((void (**)(_QWORD, id, void *))v8)[2](v8, v9, v6);

  }
}

- (id)_currentVersion
{
  return &off_1000E2E38;
}

- (int64_t)controlFlags
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugConfigurationRequest peer](self, "peer"));
  v3 = objc_msgSend(v2, "controlFlags");

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(W5PeerDebugResponsePayload, a2);
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

- (unint64_t)type
{
  return self->_type;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (W5PeerDebugRequestPayload)requestPayload
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
