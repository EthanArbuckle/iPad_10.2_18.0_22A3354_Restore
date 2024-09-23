@implementation SSHTTPServer

- (SSHTTPServer)init
{
  SSHTTPServer *v2;
  SSHTTPServer *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *definedResponses;
  dispatch_queue_t v6;
  OS_dispatch_queue *propertyQueue;
  NSMutableArray *v8;
  NSMutableArray *incomingRequests;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSHTTPServer;
  v2 = -[SSHTTPServer init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowsSecure = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    definedResponses = v3->_definedResponses;
    v3->_definedResponses = v4;

    v3->_downloadSpeed = 0;
    v3->_port = 8080;
    v6 = dispatch_queue_create("com.apple.StoreServices.HTTPServer", 0);
    propertyQueue = v3->_propertyQueue;
    v3->_propertyQueue = (OS_dispatch_queue *)v6;

    v3->_state = 1;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    incomingRequests = v3->_incomingRequests;
    v3->_incomingRequests = v8;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SSHTTPServer stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SSHTTPServer;
  -[SSHTTPServer dealloc](&v3, sel_dealloc);
}

- (signed)port
{
  NSObject *propertyQueue;
  signed __int16 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  __int16 v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__SSHTTPServer_port__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__SSHTTPServer_port__block_invoke(uint64_t result)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_WORD *)(*(_QWORD *)(result + 32) + 50);
  return result;
}

- (int64_t)responsesDelivered
{
  NSObject *propertyQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSHTTPServer_responsesDelivered__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSHTTPServer_responsesDelivered__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (void)setPort:(signed __int16)a3
{
  NSObject *propertyQueue;
  _QWORD v4[5];
  signed __int16 v5;

  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__SSHTTPServer_setPort___block_invoke;
  v4[3] = &unk_1E47B86A8;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(propertyQueue, v4);
}

void __24__SSHTTPServer_setPort___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 56) == 1)
  {
    *(_WORD *)(v1 + 50) = *(_WORD *)(a1 + 40);
    return;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    v4 &= 2u;
  if (!v4)
    goto LABEL_13;
  LODWORD(v15) = 138543362;
  *(_QWORD *)((char *)&v15 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v15, v14, v15);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_13:

  }
}

- (int)state
{
  NSObject *propertyQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__SSHTTPServer_state__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__SSHTTPServer_state__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (id)responseBlockForPath:(id)a3
{
  id v4;
  NSObject *propertyQueue;
  id v6;
  void *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSHTTPServer_responseBlockForPath___block_invoke;
  block[3] = &unk_1E47B86D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(propertyQueue, block);
  v7 = (void *)MEMORY[0x1A8585DF0](v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __37__SSHTTPServer_responseBlockForPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedServer
{
  if (sharedServer_onceToken != -1)
    dispatch_once(&sharedServer_onceToken, &__block_literal_global);
  return (id)sharedServer_instance;
}

void __28__SSHTTPServer_sharedServer__block_invoke()
{
  SSHTTPServer *v0;
  void *v1;

  v0 = objc_alloc_init(SSHTTPServer);
  v1 = (void *)sharedServer_instance;
  sharedServer_instance = (uint64_t)v0;

}

- (id)serverURL
{
  NSObject *propertyQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__SSHTTPServer_serverURL__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__SSHTTPServer_serverURL__block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
    v2 = CFSTR("https://");
  else
    v2 = CFSTR("http://");
  v9 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_ipAddress");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("error")))
  {

    v3 = CFSTR("localhost");
  }
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@:%d"), v9, v3, *(__int16 *)(*(_QWORD *)(a1 + 32) + 50));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)serverLocalhostURL
{
  NSObject *propertyQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SSHTTPServer_serverLocalhostURL__block_invoke;
  v5[3] = &unk_1E47B8718;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__SSHTTPServer_serverLocalhostURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
    v3 = CFSTR("https://");
  else
    v3 = CFSTR("http://");
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@localhost:%d"), v3, *(__int16 *)(v2 + 50));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)setResponseForPath:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *propertyQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SSHTTPServer_setResponseForPath_handler___block_invoke;
  block[3] = &unk_1E47B8740;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(propertyQueue, block);

}

void __43__SSHTTPServer_setResponseForPath_handler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (BOOL)start
{
  NSObject *propertyQueue;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__SSHTTPServer_start__block_invoke;
  block[3] = &unk_1E47B8718;
  block[4] = self;
  block[5] = &v22;
  dispatch_sync(propertyQueue, block);
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  v6 = objc_msgSend(v4, "shouldLogToDisk");
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v5 |= 2u;
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_10;
  v9 = (void *)objc_opt_class();
  v26 = 138543362;
  v27 = v9;
  v10 = v9;
  LODWORD(v20) = 12;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v26, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v8);
LABEL_10:

  }
  v18 = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v18;
}

void __21__SSHTTPServer_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  __CFSocket *v4;
  CFSocketNativeHandle Native;
  const __CFData *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_semaphore_t v25;
  void *v26;
  NSObject *v27;
  UInt8 *v28;
  uint64_t v29;
  _QWORD v30[5];
  dispatch_semaphore_t v31;
  int v32;
  int v33;
  void *v34;
  UInt8 bytes[4];
  _DWORD v36[7];

  *(_QWORD *)&v36[5] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56) != 1)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v15 &= 2u;
    if (!v15)
      goto LABEL_33;
LABEL_30:
    *(_DWORD *)bytes = 138543362;
    *(_QWORD *)v36 = objc_opt_class();
    v13 = *(id *)v36;
    LODWORD(v29) = 12;
    v28 = bytes;
    goto LABEL_31;
  }
  *(_DWORD *)(v2 + 56) = 2;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = CFSocketCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, 1, 6, 2uLL, (CFSocketCallBack)handleConnect, 0);
  v4 = *(__CFSocket **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v4)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v17 &= 2u;
    if (!v17)
      goto LABEL_33;
    goto LABEL_30;
  }
  v32 = 1;
  Native = CFSocketGetNative(v4);
  setsockopt(Native, 0xFFFF, 4, &v32, 4u);
  *(_QWORD *)&v36[1] = 0;
  *(_WORD *)bytes = 528;
  *(_WORD *)&bytes[2] = bswap32(*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 50)) >> 16;
  v36[0] = 0;
  v6 = CFDataCreate(v3, bytes, 16);
  v7 = CFSocketSetAddress(*(CFSocketRef *)(*(_QWORD *)(a1 + 32) + 32), v6);
  CFRelease(v6);
  if (v7)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (!v10)
      goto LABEL_33;
    v12 = (void *)objc_opt_class();
    v33 = 138543362;
    v34 = v12;
    v13 = v12;
    LODWORD(v29) = 12;
    v28 = (UInt8 *)&v33;
LABEL_31:
    v18 = (void *)_os_log_send_and_compose_impl();

    if (!v18)
    {
LABEL_34:

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, v28, v29);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog(v8, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v11);
LABEL_33:

    goto LABEL_34;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 3;
  v25 = dispatch_semaphore_create(0);
  v26 = (void *)MEMORY[0x1E0CB3978];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __21__SSHTTPServer_start__block_invoke_25;
  v30[3] = &unk_1E47B8768;
  v30[4] = *(_QWORD *)(a1 + 32);
  v31 = v25;
  v27 = v25;
  objc_msgSend(v26, "detachNewThreadWithBlock:", v30);
  dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

}

void __21__SSHTTPServer_start__block_invoke_25(uint64_t a1)
{
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  RunLoopSource = CFSocketCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFSocketRef *)(*(_QWORD *)(a1 + 32) + 32), 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v7 = *MEMORY[0x1E0C99748];
  do
  {
    if (objc_msgSend(*(id *)(a1 + 32), "state") != 3)
      break;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "runMode:beforeDate:", v7, v9);

  }
  while ((v8 & 1) != 0);
}

- (void)stop
{
  NSObject *propertyQueue;
  _QWORD block[5];

  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__SSHTTPServer_stop__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_sync(propertyQueue, block);
}

void __20__SSHTTPServer_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __CFSocket *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 4;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "setDelegate:", 0);
        objc_msgSend(v9, "close");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v10 = *(__CFSocket **)(*(_QWORD *)(a1 + 32) + 32);
  if (v10)
  {
    CFSocketInvalidate(v10);
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (!v13)
    goto LABEL_20;
  v15 = (void *)objc_opt_class();
  v29 = 138543362;
  v30 = v15;
  v16 = v15;
  LODWORD(v24) = 12;
  v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v29, v24, (_QWORD)v25);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog(v11, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v14);
LABEL_20:

  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 1;
}

- (void)_handleConnectWithType:(unint64_t)a3 handle:(int)a4
{
  BOOL v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  const void *v18;
  CFReadStreamRef v19;
  NSObject *propertyQueue;
  NSObject *v21;
  CFReadStreamRef v22;
  uint64_t v23;
  _QWORD block[4];
  CFReadStreamRef v25;
  CFWriteStreamRef v26;
  SSHTTPServer *v27;
  CFWriteStreamRef writeStream;
  CFReadStreamRef readStream;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    writeStream = 0;
    readStream = 0;
    CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, &readStream, &writeStream);
    if (readStream)
      v5 = writeStream == 0;
    else
      v5 = 1;
    if (v5)
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v22 = (CFReadStreamRef)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v22 = (CFReadStreamRef)objc_claimAutoreleasedReturnValue();
      }
      v6 = -[__CFReadStream shouldLog](v22, "shouldLog");
      if (-[__CFReadStream shouldLogToDisk](v22, "shouldLogToDisk"))
        v7 = v6 | 2;
      else
        v7 = v6;
      -[__CFReadStream OSLogObject](v22, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        v7 &= 2u;
      if (v7)
      {
        v8 = (void *)objc_opt_class();
        v30 = 138543362;
        v31 = v8;
        v9 = v8;
        LODWORD(v23) = 12;
        v10 = (void *)_os_log_send_and_compose_impl();

        if (!v10)
        {
LABEL_18:

          return;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v30, v23);
        v21 = objc_claimAutoreleasedReturnValue();
        free(v10);
        SSFileLog(v22, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v21);
      }
    }
    else
    {
      v17 = (const __CFString *)*MEMORY[0x1E0C9B2E8];
      v18 = (const void *)*MEMORY[0x1E0C9AE50];
      CFReadStreamSetProperty(readStream, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2E8], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
      CFWriteStreamSetProperty(writeStream, v17, v18);
      v19 = readStream;
      propertyQueue = self->_propertyQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__SSHTTPServer__handleConnectWithType_handle___block_invoke;
      block[3] = &unk_1E47B87B8;
      v25 = readStream;
      v26 = writeStream;
      v27 = self;
      v21 = writeStream;
      v22 = v19;
      dispatch_sync(propertyQueue, block);

    }
    goto LABEL_18;
  }
}

void __46__SSHTTPServer__handleConnectWithType_handle___block_invoke(_QWORD *a1)
{
  SSHTTPServerRequestHandler *v2;

  v2 = -[SSHTTPServerRequestHandler initWithReadStream:writeStream:runLoop:]([SSHTTPServerRequestHandler alloc], "initWithReadStream:writeStream:runLoop:", a1[4], a1[5], *(_QWORD *)(a1[6] + 40));
  -[SSHTTPServerRequestHandler setDelegate:](v2, "setDelegate:", a1[6]);
  -[SSHTTPServerRequestHandler setDownloadSpeed:](v2, "setDownloadSpeed:", *(unsigned int *)(a1[6] + 52));
  objc_msgSend(*(id *)(a1[6] + 16), "addObject:", v2);

}

- (void)requestDidFinish:(id)a3
{
  id v4;
  NSObject *propertyQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  propertyQueue = self->_propertyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSHTTPServer_requestDidFinish___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(propertyQueue, block);

}

uint64_t __33__SSHTTPServer_requestDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)_ipAddress
{
  int v2;
  ifaddrs *v3;
  __CFString *v4;
  void *v5;
  int v6;
  in_addr v7;
  uint64_t v8;
  ifaddrs *v10;

  v10 = 0;
  v2 = getifaddrs(&v10);
  v3 = v10;
  v4 = CFSTR("error");
  if (!v2 && v10)
  {
    do
    {
      if (v3->ifa_addr->sa_family == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3->ifa_name);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("en0"));

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v3->ifa_addr->sa_data[2];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", inet_ntoa(v7));
          v8 = objc_claimAutoreleasedReturnValue();

          v4 = (__CFString *)v8;
        }
      }
      v3 = v3->ifa_next;
    }
    while (v3);
    v3 = v10;
  }
  MEMORY[0x1A8585AD8](v3);
  return v4;
}

+ (BOOL)_isPortOccupied:(signed __int16)a3
{
  unsigned int v3;
  __CFSocket *v4;
  __CFSocket *v5;
  CFSocketNativeHandle Native;
  BOOL v7;
  const __CFData *v8;
  int v10;
  UInt8 bytes[2];
  unsigned int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = CFSocketCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, 1, 6, 0, 0, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v10 = 1;
  Native = CFSocketGetNative(v4);
  if (setsockopt(Native, 0xFFFF, 4, &v10, 4u))
  {
    v7 = 0;
  }
  else
  {
    v14 = 0;
    *(_WORD *)bytes = 528;
    v13 = 0;
    v12 = bswap32(v3) >> 16;
    v8 = CFDataCreate(0, bytes, 16);
    v7 = CFSocketSetAddress(v5, v8) != kCFSocketSuccess;
    CFRelease(v8);
  }
  CFSocketInvalidate(v5);
  CFRelease(v5);
  return v7;
}

- (BOOL)allowsSecure
{
  return self->_allowsSecure;
}

- (int)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(int)a3
{
  self->_downloadSpeed = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_incomingRequests, 0);
  objc_storeStrong((id *)&self->_definedResponses, 0);
}

@end
