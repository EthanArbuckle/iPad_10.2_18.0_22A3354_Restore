@implementation W5PeerSnifferRequest

- (W5PeerSnifferRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 duration:(double)a5 uuid:(id)a6 channels:(id)a7 config:(id)a8 reply:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  W5PeerSnifferRequest *v22;
  W5PeerSnifferRequest *v23;
  id v24;
  id reply;
  NSString *identifier;
  W5PeerSnifferRequestPayload *v27;
  W5PeerSnifferRequestPayload *requestPayload;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  const char *v34;
  objc_super v35;
  int v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;

  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v35.receiver = self;
  v35.super_class = (Class)W5PeerSnifferRequest;
  v22 = -[W5PeerSnifferRequest init](&v35, "init");
  v23 = v22;
  if (!v17
    || !v22
    || (objc_storeStrong((id *)&v22->_peer, a3), !v21)
    || (v24 = objc_retainBlock(v21), reply = v23->_reply, v23->_reply = v24, reply, a4 == 1)
    && (!v19 || (unint64_t)objc_msgSend(v19, "count") > 2))
  {

    v33 = sub_10008F56C();
    v31 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 136315650;
      v37 = "-[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]";
      v38 = 2080;
      v39 = "W5PeerSnifferRequest.m";
      v40 = 1024;
      v41 = 63;
      LODWORD(v34) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v31, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v36, v34, LODWORD(v35.receiver));
    }
    v23 = 0;
    goto LABEL_9;
  }
  identifier = v23->_identifier;
  v23->_discoveryFlags = 1;
  v23->_identifier = (NSString *)CFSTR("com.apple.wifi.peer.runSniffer");

  v27 = objc_alloc_init(W5PeerSnifferRequestPayload);
  requestPayload = v23->_requestPayload;
  v23->_requestPayload = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest _currentVersion](v23, "_currentVersion"));
  -[W5PeerSnifferRequestPayload setVersion:](v23->_requestPayload, "setVersion:", v29);

  -[W5PeerSnifferRequestPayload setChannels:](v23->_requestPayload, "setChannels:", v19);
  -[W5PeerSnifferRequestPayload setDuration:](v23->_requestPayload, "setDuration:", a5);
  -[W5PeerSnifferRequestPayload setUuid:](v23->_requestPayload, "setUuid:", v18);
  -[W5PeerSnifferRequestPayload setType:](v23->_requestPayload, "setType:", a4);
  -[W5PeerSnifferRequestPayload setNoAutoStop:](v23->_requestPayload, "setNoAutoStop:", 0);
  if (v20)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("noAutoStop")));
    -[W5PeerSnifferRequestPayload setNoAutoStop:](v23->_requestPayload, "setNoAutoStop:", objc_msgSend(v30, "BOOLValue"));

    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("rotationInterval")));
    -[W5PeerSnifferRequestPayload setRotationInterval:](v23->_requestPayload, "setRotationInterval:", -[NSObject integerValue](v31, "integerValue"));
LABEL_9:

  }
  return v23;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  void *v22;
  void *v23;
  const char *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest reply](self, "reply"));
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
    v6[2](v6, v7, 0, 0, 0);
  }
  else
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
    v8 = sub_10008F56C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315906;
      v28 = "-[W5PeerSnifferRequest handleResponse:]";
      v29 = 2080;
      v30 = "W5PeerSnifferRequest.m";
      v31 = 1024;
      v32 = 76;
      v33 = 2048;
      v34 = objc_msgSend(v6, "status");
      LODWORD(v24) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) Response Status: %ld", (const char *)&v27, v24, (_DWORD)v25, v26);
    }

    if (objc_msgSend(v6, "status") == (id)1)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filePaths"));
      if (v10
        && (v11 = (void *)v10,
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid")),
            v12,
            v11,
            v12))
      {
        v13 = sub_10008F56C();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filePaths"));
          v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
          v27 = 138543618;
          v28 = v15;
          v29 = 2114;
          v30 = v16;
          LODWORD(v24) = 22;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v14, 0, "[wifivelocity] Sniffer File Path(s) on Remote Peer: %{public}@, UUID: %{public}@", &v27, v24);

        }
        v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest reply](self, "reply"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filePaths"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
        ((void (**)(_QWORD, _QWORD, _QWORD, void *, void *))v7)[2](v7, 0, 0, v17, v18);

      }
      else
      {
        v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest reply](self, "reply"));
        v7[2](v7, 0, 0, 0, 0);
      }
    }
    else
    {
      v19 = sub_10008F56C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (char *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest peer](self, "peer"));
        v27 = 138543362;
        v28 = v21;
        LODWORD(v24) = 12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v20, 0, "[wifivelocity] Error on Remote Peer: %{public}@", &v27, v24);

      }
      v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest reply](self, "reply"));
      v25 = NSLocalizedFailureReasonErrorKey;
      v26 = CFSTR("W5PeerSnifferResponseUndefinedError");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 13, v22));
      ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD))v7)[2](v7, v23, 0, 0, 0);

    }
  }

}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(W5PeerSnifferResponsePayload, a2);
}

- (id)_currentVersion
{
  return &off_1000E2E20;
}

- (int64_t)controlFlags
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferRequest peer](self, "peer"));
  v3 = objc_msgSend(v2, "controlFlags");

  return (int64_t)v3;
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

- (W5PeerSnifferRequestPayload)requestPayload
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
