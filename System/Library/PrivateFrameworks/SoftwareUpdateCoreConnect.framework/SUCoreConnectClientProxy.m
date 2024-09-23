@implementation SUCoreConnectClientProxy

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5
{
  return -[SUCoreConnectClientProxy initWithClientID:completionQueue:genericBlock:progressBlock:](self, "initWithClientID:completionQueue:genericBlock:progressBlock:", a3, a4, a5, 0);
}

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 progressBlock:(id)a5
{
  return -[SUCoreConnectClientProxy initWithClientID:completionQueue:genericBlock:progressBlock:](self, "initWithClientID:completionQueue:genericBlock:progressBlock:", a3, a4, 0, a5);
}

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5 progressBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SUCoreConnectClientProxy *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *clientID;
  void *v20;
  void **p_completionQueue;
  uint64_t v22;
  id genericBlock;
  uint64_t v24;
  id progressBlock;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  void *v31;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)SUCoreConnectClientProxy;
  v15 = -[SUCoreConnectClientProxy init](&v33, sel_init);
  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.<%d>"), v11, objc_msgSend(v17, "processIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    clientID = v15->_clientID;
    v15->_clientID = (NSString *)v18;

    objc_storeStrong((id *)&v15->_clientIDRaw, a3);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_clientProcessIdentifier = objc_msgSend(v20, "processIdentifier");

    p_completionQueue = (void **)&v15->_completionQueue;
    objc_storeStrong((id *)&v15->_completionQueue, a4);
    v22 = MEMORY[0x20BCFD0F8](v13);
    genericBlock = v15->_genericBlock;
    v15->_genericBlock = (id)v22;

    v24 = MEMORY[0x20BCFD0F8](v14);
    progressBlock = v15->_progressBlock;
    v15->_progressBlock = (id)v24;

    if (!v15->_completionQueue)
    {
      objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "oslog");
      v27 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreConnectClientProxy summary](v15, "summary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v28;
        _os_log_impl(&dword_2067B0000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] No completion queue was provided on initialization, creating new completion queue", buf, 0xCu);

      }
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = dispatch_queue_create("com.apple.SUCoreConnect.ClientProxyCompletionQueue", v29);
      v31 = *p_completionQueue;
      *p_completionQueue = v30;

    }
  }

  return v15;
}

- (void)executeGenericBlock:(id)a3
{
  -[SUCoreConnectClientProxy executeGenericBlock:disableVerboseLogging:](self, "executeGenericBlock:disableVerboseLogging:", a3, 0);
}

- (void)executeGenericBlock:(id)a3 disableVerboseLogging:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SUCoreConnectClientProxy genericBlock](self, "genericBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "oslog");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreConnectClientProxy summary](self, "summary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = (id)objc_opt_class();
        v11 = v20;
        _os_log_impl(&dword_2067B0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calling genericBlock on completion queue with object: %{public}@", buf, 0x16u);

      }
    }
    -[SUCoreConnectClientProxy completionQueue](self, "completionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__SUCoreConnectClientProxy_executeGenericBlock_disableVerboseLogging___block_invoke;
    v15[3] = &unk_24BFDC150;
    v15[4] = self;
    v16 = v6;
    dispatch_async(v12, v15);

  }
  else if (!a4)
  {
    objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectClientProxy executeGenericBlock:disableVerboseLogging:].cold.1(self);

  }
}

void __70__SUCoreConnectClientProxy_executeGenericBlock_disableVerboseLogging___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "genericBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)executeProgressBlock:(id)a3
{
  -[SUCoreConnectClientProxy executeProgressBlock:disableVerboseLogging:](self, "executeProgressBlock:disableVerboseLogging:", a3, 0);
}

- (void)executeProgressBlock:(id)a3 disableVerboseLogging:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SUCoreConnectClientProxy progressBlock](self, "progressBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "oslog");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreConnectClientProxy summary](self, "summary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "summary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v10;
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_2067B0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Calling progressBlock on completion queue with progress: %{public}@", buf, 0x16u);

      }
    }
    -[SUCoreConnectClientProxy completionQueue](self, "completionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __71__SUCoreConnectClientProxy_executeProgressBlock_disableVerboseLogging___block_invoke;
    v15[3] = &unk_24BFDC150;
    v15[4] = self;
    v16 = v6;
    dispatch_async(v12, v15);

  }
  else if (!a4)
  {
    objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SUCoreConnectClientProxy executeProgressBlock:disableVerboseLogging:].cold.1(self, v6);

  }
}

void __71__SUCoreConnectClientProxy_executeProgressBlock_disableVerboseLogging___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "progressBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCoreConnectClientProxy clientID](self, "clientID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SUCoreConnectClientProxyClientID"));

}

- (SUCoreConnectClientProxy)initWithCoder:(id)a3
{
  id v4;
  SUCoreConnectClientProxy *v5;
  uint64_t v6;
  NSString *clientID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCoreConnectClientProxy;
  v5 = -[SUCoreConnectClientProxy init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUCoreConnectClientProxyClientID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

  }
  return v5;
}

- (id)summary
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreConnectClientProxy clientID](self, "clientID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SUCoreConnectClientProxy(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreConnectClientProxy clientID](self, "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectClientProxy completionQueue](self, "completionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[SUCoreConnectClientProxy genericBlock](self, "genericBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[SUCoreConnectClientProxy progressBlock](self, "progressBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCoreConnectClientProxy(clientID:%@|completionQueue:%@|genericBlock:%@|progressBlock:%@)"), v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (id)genericBlock
{
  return self->_genericBlock;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_genericBlock, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_clientIDRaw, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

- (void)executeGenericBlock:(void *)a1 disableVerboseLogging:.cold.1(void *a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  v3 = v2;
  OUTLINED_FUNCTION_0(&dword_2067B0000, v4, v5, "[%{public}@] Unable to execute a nil generic block with object: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)executeProgressBlock:(void *)a1 disableVerboseLogging:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2067B0000, v5, v6, "[%{public}@] Unable to execute a nil progress block with progress: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
