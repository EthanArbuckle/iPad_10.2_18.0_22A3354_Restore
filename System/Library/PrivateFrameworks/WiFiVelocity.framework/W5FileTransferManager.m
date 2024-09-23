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
  v2 = -[W5FileTransferManager init](&v8, sel_init);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/run/com.apple.wifivelocity"), 1);
  v3 = objc_claimAutoreleasedReturnValue();
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
  objc_class *v4;
  RPFileTransferSession *v5;
  RPFileTransferSession *session;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BE7CC08];
  v7 = a3;
  v5 = (RPFileTransferSession *)objc_alloc_init(v4);
  session = self->_session;
  self->_session = v5;

  -[RPFileTransferSession setTemporaryDirectoryURL:](self->_session, "setTemporaryDirectoryURL:", self->_tempDirPath);
  -[RPFileTransferSession setDispatchQueue:](self->_session, "setDispatchQueue:", self->_queue);
  -[RPFileTransferSession setTargetID:](self->_session, "setTargetID:", v7);

}

- (void)initializeReceiverWithTargetID:(id)a3
{
  id v4;
  RPFileTransferSession *session;
  id v6;
  NSObject *v7;
  NSData *v8;
  NSData *publicKeySelf;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_session)
    -[W5FileTransferManager _stop](self, "_stop");
  -[W5FileTransferManager _setupWithTargetID:](self, "_setupWithTargetID:", v4);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", 0);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 1);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 0x10);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", -[RPFileTransferSession flags](self->_session, "flags") | 0x100);
  session = self->_session;
  v10 = 0;
  -[RPFileTransferSession prepareTemplateAndReturnError:](session, "prepareTemplateAndReturnError:", &v10);
  v6 = v10;
  W5GetOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136316162;
    v12 = "-[W5FileTransferManager initializeReceiverWithTargetID:]";
    v13 = 2080;
    v14 = "W5FileTransferManager.m";
    v15 = 1024;
    v16 = 71;
    v17 = 2114;
    v18 = v4;
    v19 = 2114;
    v20 = v6;
    _os_log_send_and_compose_impl();
  }

  -[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey");
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v8;

}

- (void)initializeSenderWithTargetID:(id)a3 peerPublicKey:(id)a4
{
  id v6;
  id v7;
  RPFileTransferSession *session;
  id v9;
  NSObject *v10;
  NSData *v11;
  NSData *publicKeySelf;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
  v13 = 0;
  -[RPFileTransferSession prepareTemplateAndReturnError:](session, "prepareTemplateAndReturnError:", &v13);
  v9 = v13;
  W5GetOSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136316162;
    v15 = "-[W5FileTransferManager initializeSenderWithTargetID:peerPublicKey:]";
    v16 = 2080;
    v17 = "W5FileTransferManager.m";
    v18 = 1024;
    v19 = 93;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v9;
    _os_log_send_and_compose_impl();
  }

  -[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey");
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v11;

}

- (void)startW5FileSenderForFile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  W5GetOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession peerPublicKey](self->_session, "peerPublicKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  -[RPFileTransferSession setCompletionHandler:](self->_session, "setCompletionHandler:", &__block_literal_global_3);
  -[RPFileTransferSession setProgressHandler:](self->_session, "setProgressHandler:", &__block_literal_global_7);
  -[RPFileTransferSession setReceivedItemHandler:](self->_session, "setReceivedItemHandler:", &__block_literal_global_10);
  -[RPFileTransferSession activate](self->_session, "activate");
  W5GetOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

  v8 = objc_alloc_init(MEMORY[0x24BE7CC00]);
  objc_msgSend(v8, "setItemURL:", v4);
  objc_msgSend(v4, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilename:", v10);

  objc_msgSend(v8, "setCompletionHandler:", &__block_literal_global_13);
  W5GetOSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

  -[RPFileTransferSession addItem:](self->_session, "addItem:", v8);
  -[RPFileTransferSession finish](self->_session, "finish");

}

void __50__W5FileTransferManager_startW5FileSenderForFile___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  W5GetOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

}

void __50__W5FileTransferManager_startW5FileSenderForFile___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  W5GetOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

}

void __50__W5FileTransferManager_startW5FileSenderForFile___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void (**v5)(id, _QWORD);
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  W5GetOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

  v5[2](v5, 0);
}

void __50__W5FileTransferManager_startW5FileSenderForFile___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  W5GetOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

}

- (void)startW5FileReceiverWithPeerPublicKey:(id)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[RPFileTransferSession setPeerPublicKey:](self->_session, "setPeerPublicKey:", a3);
  W5GetOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession peerPublicKey](self->_session, "peerPublicKey");
    v13 = 136316162;
    v14 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    v15 = 2080;
    v16 = "W5FileTransferManager.m";
    v17 = 1024;
    v18 = 147;
    v19 = 2114;
    v20 = v8;
    v21 = 2114;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  -[RPFileTransferSession setProgressHandler:](self->_session, "setProgressHandler:", &__block_literal_global_14_0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__W5FileTransferManager_startW5FileReceiverWithPeerPublicKey_reply___block_invoke_15;
  v11[3] = &unk_24C23D970;
  v9 = v6;
  v12 = v9;
  -[RPFileTransferSession setReceivedItemHandler:](self->_session, "setReceivedItemHandler:", v11);
  -[RPFileTransferSession activate](self->_session, "activate");
  W5GetOSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    v15 = 2080;
    v16 = "W5FileTransferManager.m";
    v17 = 1024;
    v18 = 179;
    _os_log_send_and_compose_impl();
  }

}

void __68__W5FileTransferManager_startW5FileReceiverWithPeerPublicKey_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  W5GetOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

}

void __68__W5FileTransferManager_startW5FileReceiverWithPeerPublicKey_reply___block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  char *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[18];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
  W5GetOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = v5;
    _os_log_send_and_compose_impl();
  }

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", 420);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x24BDD0CC8]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v12 = objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v7, v11, &v20);
  v13 = v20;

  W5GetOSLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v15)
      goto LABEL_9;
    objc_msgSend(v5, "itemURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136316162;
    v22 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    v23 = 2080;
    v24 = "W5FileTransferManager.m";
    v25 = 1024;
    v26 = 168;
    v27 = 1024;
    *(_DWORD *)v28 = 420;
    *(_WORD *)&v28[4] = 2114;
    *(_QWORD *)&v28[6] = v17;
  }
  else
  {
    if (!v15)
      goto LABEL_9;
    objc_msgSend(v5, "itemURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136316162;
    v22 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    v23 = 2080;
    v24 = "W5FileTransferManager.m";
    v25 = 1024;
    v26 = 171;
    v27 = 2114;
    *(_QWORD *)v28 = v13;
    *(_WORD *)&v28[8] = 2114;
    *(_QWORD *)&v28[10] = v17;
  }
  _os_log_send_and_compose_impl();

LABEL_9:
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
  {
    objc_msgSend(v5, "itemURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v13, v19);

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
