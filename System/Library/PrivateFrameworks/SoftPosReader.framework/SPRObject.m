@implementation SPRObject

- (SPRObject)initWithConnector:(id)a3
{
  void *v4;
  id connector;
  NSXPCProxyCreating *connection;

  v4 = (void *)MEMORY[0x2199E992C](a3, a2);
  connector = self->_connector;
  self->_connector = v4;

  connection = self->_connection;
  self->_connection = 0;

  return self;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  if (self->_connection)
  {
    objc_msgSend_xpcClient(SPRLogger, a2, v2, v3, v4, v5);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      sub_2159989B8(self, v7, v8, v9, v10, v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)SPRObject;
  -[SPRObject dealloc](&v12, sel_dealloc);
}

- (NSString)proxyDescription
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = (void *)objc_opt_class();
  objc_msgSend_description(v2, v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v8, v9, (uint64_t)CFSTR("SPR"), (uint64_t)CFSTR("Remote"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)connectAndReturnError:(id *)a3
{
  NSXPCProxyCreating *connection;
  NSXPCProxyCreating *v5;
  NSXPCProxyCreating *v6;
  SPRObject *v7;

  connection = self->_connection;
  if (!connection)
  {
    (*((void (**)(void))self->_connector + 2))();
    v5 = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue();
    v6 = self->_connection;
    self->_connection = v5;

    connection = self->_connection;
  }
  if (connection)
    v7 = self;
  else
    v7 = 0;
  return v7;
}

- (id)syncProxyWithErrorHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  objc_msgSend_connectionWithErrorHandler_(self, v5, (uint64_t)v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215978D94;
  v17[3] = &unk_24D3CD538;
  v17[4] = self;
  v18 = v4;
  v10 = v4;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v17, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)asyncProxyWithErrorHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  objc_msgSend_connectionWithErrorHandler_(self, v5, (uint64_t)v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215978E84;
  v17[3] = &unk_24D3CD538;
  v17[4] = self;
  v18 = v4;
  v10 = v4;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v17, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)mapXPCConnectionError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int isEqualToString;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SPRObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSXPCProxyCreating *connection;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  _QWORD v53[4];

  v53[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_domain(v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v10, v11, *MEMORY[0x24BDD0B88], v12, v13, v14);

  if (isEqualToString && (objc_msgSend_code(v4, v16, v17, v18, v19, v20) | 2) == 0x1003)
  {
    v21 = self;
    objc_sync_enter(v21);
    if (v21->_connection)
    {
      objc_msgSend_xpcClient(SPRLogger, v22, v23, v24, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_proxyDescription(v21, v28, v29, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        sub_215998AAC(v33, (uint64_t)v53, v27);
      }

      connection = v21->_connection;
      v21->_connection = 0;

      objc_msgSend_onDisconnect(v21, v35, v36, v37, v38, v39);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v40, (uint64_t)CFSTR("SoftPosReader"), 14001, 0, v41);
    }
    else
    {
      objc_msgSend_xpcClient(SPRLogger, v22, v23, v24, v25, v26);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_proxyDescription(v21, v44, v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        sub_215998A64(v49, (uint64_t)v53, v43);
      }

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v50, (uint64_t)CFSTR("SoftPosReader"), 14002, 0, v51);
    }
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v21);

  }
  else
  {
    v42 = v4;
  }

  return v42;
}

- (id)connectionWithErrorHandler:(id)a3
{
  void (**v4)(id, id);
  SPRObject *v5;
  NSXPCProxyCreating *connection;
  uint64_t i;
  uint64_t v8;
  id v9;
  NSXPCProxyCreating *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSXPCProxyCreating *v23;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  connection = v5->_connection;
  if (!connection)
  {
    for (i = 1; ; ++i)
    {
      (*((void (**)(void))v5->_connector + 2))();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v10 = v5->_connection;
      v5->_connection = (NSXPCProxyCreating *)v8;

      if (v5->_connection)
        break;
      if (i == 3)
      {
        v4[2](v4, v9);
        goto LABEL_10;
      }
      objc_msgSend_sleepForTimeInterval_(MEMORY[0x24BDD17F0], v11, v12, v13, v14, v15, (double)i * 0.1);

    }
    objc_msgSend_xpcClient(SPRLogger, v11, v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_proxyDescription(v5, v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_impl(&dword_215968000, v16, OS_LOG_TYPE_INFO, "%@ connected", buf, 0xCu);

    }
LABEL_10:

    connection = v5->_connection;
  }
  v23 = connection;
  objc_sync_exit(v5);

  return v23;
}

- (void)invalidate
{
  NSXPCProxyCreating *connection;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SPRObject *obj;

  obj = self;
  objc_sync_enter(obj);
  connection = obj->_connection;
  obj->_connection = 0;

  objc_msgSend_onDisconnect(obj, v3, v4, v5, v6, v7);
  objc_sync_exit(obj);

}

- (NSXPCProxyCreating)connection
{
  return (NSXPCProxyCreating *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_connector, 0);
}

@end
