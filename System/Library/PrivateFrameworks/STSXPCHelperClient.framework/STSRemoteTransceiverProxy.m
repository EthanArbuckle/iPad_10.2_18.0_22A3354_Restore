@implementation STSRemoteTransceiverProxy

- (STSRemoteTransceiverProxy)initWithListenerEndpoint:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  STSRemoteTransceiverProxy *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  NSXPCConnection *xpc;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxy initWithListenerEndpoint:]", 24, self, CFSTR("endpoint=%@"), v5, v6, (uint64_t)v4);
  v21.receiver = self;
  v21.super_class = (Class)STSRemoteTransceiverProxy;
  v7 = -[STSRemoteTransceiverProxy init](&v21, sel_init);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1988]);
    v10 = objc_msgSend_initWithListenerEndpoint_(v8, v9, (uint64_t)v4);
    xpc = v7->_xpc;
    v7->_xpc = (NSXPCConnection *)v10;

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v12, (uint64_t)&unk_2545C9F90);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v7->_xpc, v14, (uint64_t)v13);

    objc_msgSend_setExportedObject_(v7->_xpc, v15, (uint64_t)v7);
    objc_msgSend_setInterruptionHandler_(v7->_xpc, v16, (uint64_t)&unk_24C2B30B0);
    objc_msgSend_setInvalidationHandler_(v7->_xpc, v17, (uint64_t)&unk_24C2B3478);
    objc_msgSend_resume(v7->_xpc, v18, v19);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  objc_msgSend_xpc(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v4, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)STSRemoteTransceiverProxy;
  -[STSRemoteTransceiverProxy dealloc](&v7, sel_dealloc);
}

- (id)transceive:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_20A02BFF0;
  v28 = sub_20A02C000;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_20A02BFF0;
  v22 = sub_20A02C000;
  v23 = 0;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_20A02C008;
  v17[3] = &unk_24C2B3108;
  v17[4] = self;
  v17[5] = &v24;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v8, (uint64_t)v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = sub_20A02C06C;
  v16[3] = &unk_24C2B34A0;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend_transceive_completion_(v9, v10, (uint64_t)v6, v16);

  if (v25[5])
  {
    sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxy transceive:outError:]", 64, self, CFSTR("error=%@"), v11, v12, v25[5]);
    v13 = (void *)v25[5];
  }
  else
  {
    v13 = 0;
  }
  *a4 = objc_retainAutorelease(v13);
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_xpc(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_xpc(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSXPCConnection)xpc
{
  return self->_xpc;
}

- (void)setXpc:(id)a3
{
  objc_storeStrong((id *)&self->_xpc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpc, 0);
}

@end
