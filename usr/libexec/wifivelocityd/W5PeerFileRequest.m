@implementation W5PeerFileRequest

- (W5PeerFileRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 remotePath:(id)a5 transferManager:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  NSString *targetID;
  W5PeerFileRequest *v22;
  W5PeerFileRequest *v23;
  id v24;
  id reply;
  NSString *identifier;
  W5PeerFileTransferRequestPayload *v27;
  W5PeerFileTransferRequestPayload *requestPayload;
  void *v29;
  void *v30;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  int v35;
  objc_super v37;
  int v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = NSRandomData(6, 0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v16));
  v18 = v13;
  v19 = NSPrintF("%.3H", objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"), objc_msgSend(v17, "length"));
  v20 = (NSString *)objc_claimAutoreleasedReturnValue(v19);
  targetID = self->_targetID;
  self->_targetID = v20;

  v37.receiver = self;
  v37.super_class = (Class)W5PeerFileRequest;
  v22 = -[W5PeerFileRequest init](&v37, "init");
  v23 = v22;
  if (v12
    && v22
    && (objc_storeStrong((id *)&v22->_peer, a3), v15)
    && (v24 = objc_retainBlock(v15), reply = v23->_reply, v23->_reply = v24, reply, v13)
    && v14
    && (objc_storeStrong((id *)&v23->_transferManager, a6), v23->_targetID))
  {
    identifier = v23->_identifier;
    v23->_discoveryFlags = 1;
    v23->_identifier = (NSString *)CFSTR("com.apple.wifi.peer.fileTransfer");

    v27 = objc_alloc_init(W5PeerFileTransferRequestPayload);
    requestPayload = v23->_requestPayload;
    v23->_requestPayload = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest _currentVersion](v23, "_currentVersion"));
    -[W5PeerFileTransferRequestPayload setVersion:](v23->_requestPayload, "setVersion:", v29);

    -[W5PeerFileTransferRequestPayload setRemotePath:](v23->_requestPayload, "setRemotePath:", v13);
    -[W5PeerFileTransferRequestPayload setType:](v23->_requestPayload, "setType:", a4);
    if (a4 == 1)
    {
      -[W5PeerFileTransferRequestPayload setTargetID:](v23->_requestPayload, "setTargetID:", v23->_targetID);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[W5FileTransferManager publicKeySelf](v23->_transferManager, "publicKeySelf"));
      -[W5PeerFileTransferRequestPayload setPublicKey:](v23->_requestPayload, "setPublicKey:", v30);

      -[W5FileTransferManager initializeReceiverWithTargetID:](v23->_transferManager, "initializeReceiverWithTargetID:", v23->_targetID);
    }
  }
  else
  {

    v32 = sub_10008F56C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 136315650;
      v39 = "-[W5PeerFileRequest initWithPeer:requestType:remotePath:transferManager:reply:]";
      v40 = 2080;
      v41 = "W5PeerFileRequest.m";
      v42 = 1024;
      v43 = 69;
      LODWORD(v34) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v33, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v38, v34, v35);
    }

    v23 = 0;
  }

  return v23;
}

- (void)handleResponse:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  W5FileTransferManager *transferManager;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest reply](self, "reply"));
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
    v6[2](v6, v7, 0);
LABEL_12:

    goto LABEL_13;
  }
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
  if (objc_msgSend(v6, "status") != (id)1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));

    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest reply](self, "reply"));
    if (!v16)
    {
      v20 = NSLocalizedFailureReasonErrorKey;
      v21 = CFSTR("W5PeerFileResponseUndefinedError");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 12, v17));
      ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v18, 0);

      goto LABEL_12;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v15, 0);
    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKey"));

  if (v8)
  {
    transferManager = self->_transferManager;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publicKey"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100015160;
    v19[3] = &unk_1000D5628;
    v19[4] = self;
    -[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:](transferManager, "startW5FileReceiverWithPeerPublicKey:reply:", v10, v19);

    v11 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", CFSTR("/var/run/com.apple.wifivelocity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.rpftd"), self->_targetID));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v12, 1));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "files"));

  if (v14)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest reply](self, "reply"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "files"));
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v15);
LABEL_10:

    goto LABEL_12;
  }
LABEL_13:

}

- (id)_currentVersion
{
  return &off_1000E2DF0;
}

- (int64_t)controlFlags
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest peer](self, "peer"));
  v3 = objc_msgSend(v2, "controlFlags");

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(W5PeerFileTransferResponsePayload, a2);
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

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
  objc_storeStrong((id *)&self->_targetID, a3);
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

- (W5PeerFileTransferRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (void)setRequestPayload:(id)a3
{
  objc_storeStrong((id *)&self->_requestPayload, a3);
}

- (W5FileTransferManager)transferManager
{
  return self->_transferManager;
}

- (void)setTransferManager:(id)a3
{
  objc_storeStrong((id *)&self->_transferManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferManager, 0);
  objc_storeStrong((id *)&self->_requestPayload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetID, 0);
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
