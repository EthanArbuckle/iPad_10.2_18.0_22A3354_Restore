@implementation W5FileTransferManager

- (W5FileTransferManager)init
{
  W5FileTransferManager *v2;
  uint64_t v3;
  NSURL *tempDirPath;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)W5FileTransferManager;
  v2 = -[W5FileTransferManager init](&v8, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/var/run/com.apple.wifivelocity"), 1));
  tempDirPath = v2->_tempDirPath;
  v2->_tempDirPath = (NSURL *)v3;

  v5 = dispatch_queue_create("com.apple.wifivelocity.file-transfer", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  if (!v2->_queue)
  {

    return 0;
  }
  return v2;
}

- (void)_setupWithTargetID:(id)a3
{
  RPFileTransferSession *v4;
  RPFileTransferSession *session;
  id v6;

  v6 = a3;
  v4 = (RPFileTransferSession *)objc_alloc_init((Class)RPFileTransferSession);
  session = self->_session;
  self->_session = v4;

  -[RPFileTransferSession setTemporaryDirectoryURL:](self->_session, "setTemporaryDirectoryURL:", self->_tempDirPath);
  -[RPFileTransferSession setDispatchQueue:](self->_session, "setDispatchQueue:", self->_queue);
  -[RPFileTransferSession setTargetID:](self->_session, "setTargetID:", v6);

}

- (void)initializeReceiverWithTargetID:(id)a3
{
  id v4;
  RPFileTransferSession *session;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSData *v9;
  NSData *publicKeySelf;
  int v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v4 = a3;
  if (self->_session)
    -[W5FileTransferManager _stop](self, "_stop");
  -[W5FileTransferManager _setupWithTargetID:](self, "_setupWithTargetID:", v4);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", 0);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 1);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 0x10);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 0x100);
  session = self->_session;
  v12 = 0;
  -[RPFileTransferSession prepareTemplateAndReturnError:](session, "prepareTemplateAndReturnError:", &v12);
  v6 = v12;
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136316162;
    v14 = "-[W5FileTransferManager initializeReceiverWithTargetID:]";
    v15 = 2080;
    v16 = "W5FileTransferManager.m";
    v17 = 1024;
    v18 = 71;
    v19 = 2114;
    v20 = v4;
    v21 = 2114;
    v22 = v6;
    v11 = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) File Receiver Init, targetID: %{public}@, prepareTemplateAndReturnError, error = %{public}@", &v13, v11);
  }

  v9 = (NSData *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v9;

}

- (void)initializeSenderWithTargetID:(id)a3 peerPublicKey:(id)a4
{
  id v6;
  id v7;
  RPFileTransferSession *session;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSData *v12;
  NSData *publicKeySelf;
  int v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = a4;
  if (self->_session)
    -[W5FileTransferManager _stop](self, "_stop");
  -[W5FileTransferManager _setupWithTargetID:](self, "_setupWithTargetID:", v6);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", 0);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 0x10);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 0x100);
  -[RPFileTransferSession setPeerPublicKey:](self->_session, "setPeerPublicKey:", v7);
  session = self->_session;
  v15 = 0;
  -[RPFileTransferSession prepareTemplateAndReturnError:](session, "prepareTemplateAndReturnError:", &v15);
  v9 = v15;
  v10 = sub_10008F56C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316162;
    v17 = "-[W5FileTransferManager initializeSenderWithTargetID:peerPublicKey:]";
    v18 = 2080;
    v19 = "W5FileTransferManager.m";
    v20 = 1024;
    v21 = 93;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v9;
    v14 = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v11, 0, "[wifivelocity] %s (%s:%u) File Sender Init, targetID: %{public}@, prepareTemplateAndReturnError, error = %{public}@", &v16, v14);
  }

  v12 = (NSData *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v12;

}

- (void)startW5FileSenderForFile:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  int v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;

  v4 = a3;
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession peerPublicKey](self->_session, "peerPublicKey"));
    v18 = 136316418;
    v19 = "-[W5FileTransferManager startW5FileSenderForFile:]";
    v20 = 2080;
    v21 = "W5FileTransferManager.m";
    v22 = 1024;
    v23 = 101;
    v24 = 2114;
    v25 = v7;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v4;
    v17 = 58;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Session Keys: self: %{public}@, peer: %{public}@, Filepath: %{public}@", &v18, v17);

  }
  -[RPFileTransferSession setCompletionHandler:](self->_session, "setCompletionHandler:", &stru_1000D5518);
  -[RPFileTransferSession setProgressHandler:](self->_session, "setProgressHandler:", &stru_1000D5558);
  -[RPFileTransferSession setReceivedItemHandler:](self->_session, "setReceivedItemHandler:", &stru_1000D5598);
  -[RPFileTransferSession activate](self->_session, "activate");
  v9 = sub_10008F56C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "-[W5FileTransferManager startW5FileSenderForFile:]";
    v20 = 2080;
    v21 = "W5FileTransferManager.m";
    v22 = 1024;
    v23 = 124;
    LODWORD(v16) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) File Sender: Session Activated", (const char *)&v18, v16);
  }

  v11 = objc_alloc_init((Class)RPFileTransferItem);
  objc_msgSend(v11, "setItemURL:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
  objc_msgSend(v11, "setFilename:", v13);

  objc_msgSend(v11, "setCompletionHandler:", &stru_1000D55B8);
  v14 = sub_10008F56C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315906;
    v19 = "-[W5FileTransferManager startW5FileSenderForFile:]";
    v20 = 2080;
    v21 = "W5FileTransferManager.m";
    v22 = 1024;
    v23 = 136;
    v24 = 2114;
    v25 = v11;
    LODWORD(v16) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) File Sender, Adding item: %{public}@", &v18, v16);
  }

  -[RPFileTransferSession addItem:](self->_session, "addItem:", v11);
  -[RPFileTransferSession finish](self->_session, "finish");

}

- (void)startW5FileReceiverWithPeerPublicKey:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int v15;
  int v16;
  _QWORD v17[4];
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v6 = a4;
  -[RPFileTransferSession setPeerPublicKey:](self->_session, "setPeerPublicKey:", a3);
  v7 = sub_10008F56C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession peerPublicKey](self->_session, "peerPublicKey"));
    v19 = 136316162;
    v20 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    v21 = 2080;
    v22 = "W5FileTransferManager.m";
    v23 = 1024;
    v24 = 147;
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    v15 = 48;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v8, 0, "[wifivelocity] %s (%s:%u) File Receiver, Session Keys: self: %{public}@, peer: %{public}@", &v19, v15);

  }
  -[RPFileTransferSession setProgressHandler:](self->_session, "setProgressHandler:", &stru_1000D55D8);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001480C;
  v17[3] = &unk_1000D5600;
  v11 = v6;
  v18 = v11;
  -[RPFileTransferSession setReceivedItemHandler:](self->_session, "setReceivedItemHandler:", v17);
  -[RPFileTransferSession activate](self->_session, "activate");
  v12 = sub_10008F56C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315650;
    v20 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    v21 = 2080;
    v22 = "W5FileTransferManager.m";
    v23 = 1024;
    v24 = 179;
    LODWORD(v14) = 28;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) File Receiver: Session Activated", (const char *)&v19, v14, v16);
  }

}

- (void)_stop
{
  RPFileTransferSession *session;

  -[RPFileTransferSession invalidate](self->_session, "invalidate");
  session = self->_session;
  self->_session = 0;

}

- (NSData)publicKeySelf
{
  return self->_publicKeySelf;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeySelf, 0);
  objc_storeStrong((id *)&self->_tempDirPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
