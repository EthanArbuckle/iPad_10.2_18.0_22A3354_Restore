@implementation SSDownloadSession

- (id)_initSSDownloadSession
{
  SSDownloadSession *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSDownloadSession;
  v2 = -[SSDownloadSession init](&v4, sel_init);
  if (v2)
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSDownloadSession", 0);
  return v2;
}

- (id)_initWithMessage:(id)a3 controlConnection:(id)a4
{
  _QWORD *v6;

  v6 = -[SSDownloadSession _initSSDownloadSession](self, "_initSSDownloadSession");
  if (v6)
  {
    v6[1] = a4;
    v6[4] = xpc_dictionary_get_int64(a3, "3");
    v6[5] = xpc_dictionary_get_int64(a3, "2");
    v6[3] = xpc_dictionary_get_int64(a3, "1");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadSession;
  -[SSDownloadSession dealloc](&v3, sel_dealloc);
}

- (SSDownload)download
{
  id value;
  id v4;
  void *v5;

  if (self->_downloadID)
  {
    value = -[SSEntity _initWithPersistentIdentifier:]([SSDownload alloc], "_initWithPersistentIdentifier:", self->_downloadID);
  }
  else
  {
    v4 = -[SSDownloadSession _copySessionPropertyWithKey:](self, "_copySessionPropertyWithKey:", "0");
    if (v4)
    {
      v5 = v4;
      value = (id)xpc_int64_get_value(v4);
      if (value)
        value = -[SSEntity _initWithPersistentIdentifier:]([SSDownload alloc], "_initWithPersistentIdentifier:", value);
      xpc_release(v5);
    }
    else
    {
      value = 0;
    }
  }
  objc_msgSend(value, "_becomeManagedOnConnection:", self->_controlConnection);
  return (SSDownload *)value;
}

- (SSDownloadAsset)downloadAsset
{
  id value;
  id v4;
  void *v5;

  if (self->_assetID)
  {
    value = -[SSEntity _initWithPersistentIdentifier:]([SSDownloadAsset alloc], "_initWithPersistentIdentifier:", self->_assetID);
  }
  else
  {
    v4 = -[SSDownloadSession _copySessionPropertyWithKey:](self, "_copySessionPropertyWithKey:", "1");
    if (v4)
    {
      v5 = v4;
      value = (id)xpc_int64_get_value(v4);
      if (value)
        value = -[SSEntity _initWithPersistentIdentifier:]([SSDownloadAsset alloc], "_initWithPersistentIdentifier:", value);
      xpc_release(v5);
    }
    else
    {
      value = 0;
    }
  }
  objc_msgSend(value, "_becomeManagedOnConnection:", self->_controlConnection);
  return (SSDownloadAsset *)value;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadSession;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: SessionID: %lld"), -[SSDownloadSession description](&v3, sel_description), self->_sessionID);
}

- (unint64_t)hash
{
  return self->_sessionID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class();
  return v5 == objc_opt_class() && self->_sessionID == *((_QWORD *)a3 + 3);
}

- (id)_copySessionPropertyWithKey:(const char *)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t v18;
  NSObject *v19;
  SSXPCConnection *controlConnection;
  void *v21;
  uint64_t v23;
  _QWORD v24[7];
  __int128 v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      LODWORD(v25) = 136446210;
      *(_QWORD *)((char *)&v25 + 4) = "-[SSDownloadSession _copySessionPropertyWithKey:]";
      LODWORD(v23) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v25, v23);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  *(_QWORD *)&v25 = 0;
  *((_QWORD *)&v25 + 1) = &v25;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__35;
  v28 = __Block_byref_object_dispose__35;
  v29 = 0;
  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 12);
  xpc_dictionary_set_int64(v18, "1", self->_sessionID);
  v19 = dispatch_semaphore_create(0);
  controlConnection = self->_controlConnection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __49__SSDownloadSession__copySessionPropertyWithKey___block_invoke;
  v24[3] = &unk_1E47BD450;
  v24[5] = &v25;
  v24[6] = a3;
  v24[4] = v19;
  -[SSXPCConnection sendMessage:withReply:](controlConnection, "sendMessage:withReply:", v18, v24);
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v19);
  xpc_release(v18);
  v21 = *(void **)(*((_QWORD *)&v25 + 1) + 40);
  _Block_object_dispose(&v25, 8);
  return v21;
}

intptr_t __49__SSDownloadSession__copySessionPropertyWithKey___block_invoke(uint64_t a1, void *a2)
{
  void *v4;

  if (a2)
  {
    if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = xpc_dictionary_get_value(a2, *(const char **)(a1 + 48));
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v4)
        xpc_retain(v4);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
