@implementation UVShellConnectionInterfaceTarget

- (UVShellConnectionInterfaceTarget)initWithMessageHandler:(id)a3 xpcEndpointHandler:(id)a4 bsEndpointHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  UVShellConnectionInterfaceTarget *v11;
  void *v12;
  id messageHandler;
  void *v14;
  id xpcEndpointHandler;
  void *v16;
  id bsEndpointHandler;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UVShellConnectionInterfaceTarget;
  v11 = -[UVShellConnectionInterfaceTarget init](&v19, sel_init);
  if (v11)
  {
    v12 = _Block_copy(v8);
    messageHandler = v11->_messageHandler;
    v11->_messageHandler = v12;

    v14 = _Block_copy(v9);
    xpcEndpointHandler = v11->_xpcEndpointHandler;
    v11->_xpcEndpointHandler = v14;

    v16 = _Block_copy(v10);
    bsEndpointHandler = v11->_bsEndpointHandler;
    v11->_bsEndpointHandler = v16;

  }
  return v11;
}

- (void)sendMessage:(id)a3
{
  if (a3)
    (*((void (**)(void))self->_messageHandler + 2))();
  else
    -[UVShellConnectionInterfaceTarget _handleNullArgument:replyHandler:](self, "_handleNullArgument:replyHandler:", CFSTR("message"), 0);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  if (a3)
    (*((void (**)(void))self->_messageHandler + 2))();
  else
    -[UVShellConnectionInterfaceTarget _handleNullArgument:replyHandler:](self, "_handleNullArgument:replyHandler:", CFSTR("message"), a4);
}

- (void)sendXPCEndpoint:(id)a3 context:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v12)
  {
    v11 = CFSTR("endpoint");
LABEL_6:
    -[UVShellConnectionInterfaceTarget _handleNullArgument:replyHandler:](self, "_handleNullArgument:replyHandler:", v11, v9);
    goto LABEL_7;
  }
  if (!v8)
  {
    v11 = CFSTR("context");
    goto LABEL_6;
  }
  (*((void (**)(void))self->_xpcEndpointHandler + 2))();
LABEL_7:

}

- (void)sendBSEndpoint:(id)a3 context:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v12)
  {
    v11 = CFSTR("endpoint");
LABEL_6:
    -[UVShellConnectionInterfaceTarget _handleNullArgument:replyHandler:](self, "_handleNullArgument:replyHandler:", v11, v9);
    goto LABEL_7;
  }
  if (!v8)
  {
    v11 = CFSTR("context");
    goto LABEL_6;
  }
  (*((void (**)(void))self->_bsEndpointHandler + 2))();
LABEL_7:

}

- (void)_handleNullArgument:(id)a3 replyHandler:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  NSObject *v7;

  v5 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x24BDD1540], "uv_errorWithFormat:", CFSTR("shell IPC invocation had a null '%@' parameter"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[2](v5, 0, v6);
  UVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[UVShellConnectionInterfaceTarget _handleNullArgument:replyHandler:].cold.1(v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bsEndpointHandler, 0);
  objc_storeStrong(&self->_xpcEndpointHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
}

- (void)_handleNullArgument:(void *)a1 replyHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_224D58000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);

}

@end
