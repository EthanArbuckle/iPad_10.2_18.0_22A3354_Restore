@implementation SSUIServiceServer

- (SSUIServiceServer)initWithDelegate:(id)a3
{
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  SSUIServiceServer *v8;
  objc_super v10;

  v4 = SSUIServiceIdentifier;
  v5 = (void *)MEMORY[0x24BE384E8];
  v6 = a3;
  objc_msgSend(v5, "queueWithDispatchQueue:", MEMORY[0x24BDAC9B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SSUIServiceServer;
  v8 = -[FBSServiceFacility initWithIdentifier:queue:](&v10, sel_initWithIdentifier_queue_, v4, v7);

  -[SSUIServiceServer setDelegate:](v8, "setDelegate:", v6);
  return v8;
}

- (BOOL)_handleHasAnySSUIServiceEntitlement:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasEntitlement:", SSUIShowScreenshotUIEntitlement) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasEntitlement:", SSUIRunPPTEntitlement);

  return v4;
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;

  v7 = a3;
  objc_msgSend(a5, "processHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SSUIServiceServer _handleHasAnySSUIServiceEntitlement:](self, "_handleHasAnySSUIServiceEntitlement:", v8))
  {
    objc_msgSend(v7, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v9, "SSUIServiceRequest");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSUIServiceRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "entitlement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "hasEntitlement:", v13);

    if (v14)
    {
      -[SSUIServiceServer delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __63__SSUIServiceServer_noteDidReceiveMessage_withType_fromClient___block_invoke;
      v17[3] = &unk_24D06BE08;
      v18 = v7;
      objc_msgSend(v15, "server:handleRequest:withCompletion:", self, v12, v17);

      v16 = v18;
    }
    else
    {
      v16 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SSUIServiceServer noteDidReceiveMessage:withType:fromClient:].cold.1(v8, (uint64_t)v12, v16);

    }
  }
  else
  {
    v10 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SSUIServiceServer noteDidReceiveMessage:withType:fromClient:].cold.2(v8, v10);
    v9 = v10;
  }

}

uint64_t __63__SSUIServiceServer_noteDidReceiveMessage_withType_fromClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyMessageWithPacker:", &__block_literal_global_6);
}

- (SSUIServiceServerDelegate)delegate
{
  return (SSUIServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)noteDidReceiveMessage:(void *)a1 withType:(uint64_t)a2 fromClient:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  objc_class *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "pid");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = v4;
  v8 = 2112;
  v9 = v6;
  _os_log_error_impl(&dword_213892000, a3, OS_LOG_TYPE_ERROR, "Client at pid %d attempted to send invalid request %@ for its entitlements, ignoring", (uint8_t *)v7, 0x12u);

}

- (void)noteDidReceiveMessage:(void *)a1 withType:(NSObject *)a2 fromClient:.cold.2(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "pid");
  _os_log_error_impl(&dword_213892000, a2, OS_LOG_TYPE_ERROR, "Unauthorized client at pid %d attempted connection to SSUIService, ignoring", (uint8_t *)v3, 8u);
}

@end
