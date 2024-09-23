@implementation SEMXPCClient

- (SEMXPCClient)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (SEMXPCClient)initWithServiceProtocol:(id)a3 machServiceName:(id)a4 clientId:(id)a5 interruptionCode:(unsigned __int16)a6 invalidationCode:(unsigned __int16)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  SEMXPCClient *v15;
  void **p_isa;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  SEMXPCClient *v36;
  objc_super v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v7 = a7;
  v8 = a6;
  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v38.receiver = self;
  v38.super_class = (Class)SEMXPCClient;
  v15 = -[SEMXPCClient init](&v38, sel_init);
  p_isa = (void **)&v15->super.isa;
  if (v15)
  {
    v15->_failureCode = 0;
    v15->_interruptionCode = v8;
    objc_storeStrong((id *)&v15->_clientId, a5);
    v17 = objc_alloc(MEMORY[0x24BDD1988]);
    v19 = objc_msgSend_initWithMachServiceName_options_(v17, v18, (uint64_t)v13, 0);
    v20 = p_isa[2];
    p_isa[2] = (void *)v19;

    if (!p_isa[2]
      || (objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v21, (uint64_t)v12),
          (v22 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v36 = 0;
      goto LABEL_9;
    }
    v24 = (void *)v22;
    objc_msgSend_setRemoteObjectInterface_(p_isa[2], v23, v22);
    v25 = p_isa[2];
    objc_msgSend__failureHandlerWithResponse_(p_isa, v26, v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterruptionHandler_(v25, v28, (uint64_t)v27);

    v29 = p_isa[2];
    objc_msgSend__failureHandlerWithResponse_(p_isa, v30, v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInvalidationHandler_(v29, v32, (uint64_t)v31);

    v33 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[SEMXPCClient initWithServiceProtocol:machServiceName:clientId:interruptionCode:invalidationCode:]";
      v41 = 2112;
      v42 = v14;
      _os_log_impl(&dword_2462C4000, v33, OS_LOG_TYPE_INFO, "%s Client %@ connecting to XPC service", buf, 0x16u);
    }
    objc_msgSend_resume(p_isa[2], v34, v35);

  }
  v36 = p_isa;
LABEL_9:

  return v36;
}

- (void)dealloc
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
  {
    v6 = v3;
    objc_msgSend_clientId(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v12 = "-[SEMXPCClient dealloc]";
    v13 = 2112;
    v14 = v9;
    _os_log_debug_impl(&dword_2462C4000, v6, OS_LOG_TYPE_DEBUG, "%s Invalidating XPC connection for client %@", buf, 0x16u);

  }
  objc_msgSend_invalidate(self->_connection, v4, v5);
  v10.receiver = self;
  v10.super_class = (Class)SEMXPCClient;
  -[SEMXPCClient dealloc](&v10, sel_dealloc);
}

- (id)_failureHandlerWithResponse:(unsigned __int16)a3
{
  void *v4;
  _QWORD v6[4];
  id v7;
  unsigned __int16 v8;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2462E9928;
  v6[3] = &unk_25175F338;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v4 = (void *)MEMORY[0x2495571C4](v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2462E9AFC;
  v8[3] = &unk_25175F360;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x2495571C4](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, void *, id);
  const char *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = (void (**)(id, void *, id))a5;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, v6, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v8[2](v8, v10, v11);

}

- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  const char *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2462E9D88;
  v13[3] = &unk_25175F220;
  v10 = v8;
  v14 = v10;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v9[2](v9, v12, v10);

}

- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  const char *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2462E9E60;
  v13[3] = &unk_25175F220;
  v10 = v8;
  v14 = v10;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v11, v6, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v9[2](v9, v12, v10);

}

- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  id v8;
  const char *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_2462E9F34;
  v11[3] = &unk_25175F220;
  v8 = v6;
  v12 = v8;
  objc_msgSend__remoteObjectProxy_errorCompletion_(self, v9, 1, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v7[2](v7, v10, v8);

}

- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend__errorHandlerWithCompletion_(self, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v4)
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v11, v12, (uint64_t)v8);
  else
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v11, v12, (uint64_t)v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !v14)
  {
    v17 = objc_msgSend_failureCode(self, v15, v16);
    v6[2](v6, v17);
  }

  return v14;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)failureCode
{
  return self->_failureCode;
}

- (void)setFailureCode:(unsigned __int16)a3
{
  self->_failureCode = a3;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (unsigned)interruptionCode
{
  return self->_interruptionCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
