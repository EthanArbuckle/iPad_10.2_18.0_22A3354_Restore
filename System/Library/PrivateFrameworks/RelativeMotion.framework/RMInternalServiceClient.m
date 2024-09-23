@implementation RMInternalServiceClient

- (RMInternalServiceClient)initWithQueue:(id)a3
{
  NSObject *v4;
  RMInternalServiceClient *v5;
  RMInternalServiceClient *v6;
  RMConnectionClient *v7;
  void *v8;
  uint64_t v9;
  RMInternalServiceClient *v10;
  id *v11;
  _QWORD v13[4];
  RMInternalServiceClient *v14;
  _QWORD v15[4];
  RMInternalServiceClient *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RMInternalServiceClient;
  v5 = -[RMInternalServiceClient init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[RMInternalServiceClient setQueue:](v5, "setQueue:", v4);
    v7 = [RMConnectionClient alloc];
    -[RMInternalServiceClient queue](v6, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __41__RMInternalServiceClient_initWithQueue___block_invoke;
    v15[3] = &unk_24F0D42E0;
    v10 = v6;
    v16 = v10;
    v11 = -[RMConnectionClient initWithQueue:serviceName:messageHandler:]((id *)&v7->super.isa, v8, CFSTR("com.apple.relatived.internal"), v15);
    -[RMInternalServiceClient setSpiClient:](v10, "setSpiClient:", v11);

    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __41__RMInternalServiceClient_initWithQueue___block_invoke_2;
    v13[3] = &unk_24F0D3F68;
    v14 = v10;
    dispatch_async(v4, v13);

  }
  return v6;
}

uint64_t __41__RMInternalServiceClient_initWithQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSpiIncomingMessage:data:replyBlock:", a2, a3, a4);
}

void __41__RMInternalServiceClient_initWithQueue___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "spiClient");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  -[RMConnectionClient connect]((uint64_t)v1);

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;

  -[RMInternalServiceClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[RMInternalServiceClient spiClient](self, "spiClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMConnectionClient invalidate]((uint64_t)v4);

  -[RMInternalServiceClient setSpiClient:](self, "setSpiClient:", 0);
}

- (void)handleSpiIncomingMessage:(id)a3 data:(id)a4 replyBlock:(id)a5
{
  NSObject *v5;

  -[RMInternalServiceClient queue](self, "queue", a3, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

}

- (void)parseSpiErrorReply:(id)a3 forMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v7)
    {
      if (onceToken_InternalService_Default != -1)
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      v9 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_228261000, v9, OS_LOG_TYPE_ERROR, "Error recived to SPI %@: %@", buf, 0x16u);
      }

      goto LABEL_13;
    }
  }
  else
  {
    v8 = 0;
  }
  if (onceToken_InternalService_Default != -1)
    dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
  v10 = logObject_InternalService_Default;
  if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_228261000, v10, OS_LOG_TYPE_ERROR, "Can't unarchive the SPI error data: %@", buf, 0xCu);
  }
LABEL_13:

}

- (void)getNumClientsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RMInternalServiceClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke;
  v7[3] = &unk_24F0D4330;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "spiClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke_2;
  v4[3] = &unk_24F0D4308;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, CFSTR("RMSpiGetNumClients"), 0, v4);

}

void __50__RMInternalServiceClient_getNumClientsWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("RMSpiError")))
  {
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "parseSpiErrorReply:forMessage:", v5, CFSTR("RMSpiGetNumClients"));
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1)
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    v9 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228261000, v9, OS_LOG_TYPE_ERROR, "No data in getNumClients reply", buf, 2u);
    }
    goto LABEL_11;
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v6, "integerValue"));
  }
  else
  {
    if (v7)
    {
      if (onceToken_InternalService_Default != -1)
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      v10 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl(&dword_228261000, v10, OS_LOG_TYPE_ERROR, "Error received from GetNumClients: %@", buf, 0xCu);
      }
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), -1);
  }

LABEL_19:
}

- (void)disconnectAllClientsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RMInternalServiceClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke;
  v7[3] = &unk_24F0D4330;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "spiClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke_2;
  v4[3] = &unk_24F0D4308;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, CFSTR("RMSpiDisconnectAllClients"), 0, v4);

}

void __57__RMInternalServiceClient_disconnectAllClientsWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("RMSpiError")))
  {
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "parseSpiErrorReply:forMessage:", v5, CFSTR("RMSpiDisconnectAllClients"));
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1)
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    v9 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228261000, v9, OS_LOG_TYPE_ERROR, "No data in disconnectAllClients reply", buf, 2u);
    }
    goto LABEL_11;
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v6, "integerValue"));
  }
  else
  {
    if (v7)
    {
      if (onceToken_InternalService_Default != -1)
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      v10 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl(&dword_228261000, v10, OS_LOG_TYPE_ERROR, "Error received from disconnectClient: %@", buf, 0xCu);
      }
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), -1);
  }

LABEL_19:
}

- (void)disconnectClient:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RMInternalServiceClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke;
  block[3] = &unk_24F0D4358;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "spiClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 40), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke_2;
  v4[3] = &unk_24F0D4308;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, CFSTR("RMSpiDisconnectClient"), v3, v4);

}

void __54__RMInternalServiceClient_disconnectClient_withReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("RMSpiError")))
  {
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "parseSpiErrorReply:forMessage:", v5, CFSTR("RMSpiGetNumClients"));
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1)
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    v9 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228261000, v9, OS_LOG_TYPE_ERROR, "No data in disconnectClient reply", buf, 2u);
    }
    goto LABEL_11;
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v6, "integerValue"));
  }
  else
  {
    if (v7)
    {
      if (onceToken_InternalService_Default != -1)
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      v10 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl(&dword_228261000, v10, OS_LOG_TYPE_ERROR, "Error received from disconnectClient: %@", buf, 0xCu);
      }
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), -1);
  }

LABEL_19:
}

- (void)listClientsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RMInternalServiceClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__RMInternalServiceClient_listClientsWithReply___block_invoke;
  v7[3] = &unk_24F0D4330;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__RMInternalServiceClient_listClientsWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "spiClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__RMInternalServiceClient_listClientsWithReply___block_invoke_2;
  v4[3] = &unk_24F0D4308;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v2, CFSTR("RMSpiListClients"), 0, v4);

}

void __48__RMInternalServiceClient_listClientsWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void (*v12)(void);
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("RMSpiError")))
  {
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "parseSpiErrorReply:forMessage:", v5, CFSTR("RMSpiGetNumClients"));
LABEL_11:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if (!v5)
  {
    if (onceToken_InternalService_Default != -1)
      dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
    v13 = logObject_InternalService_Default;
    if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228261000, v13, OS_LOG_TYPE_ERROR, "No data in listClientsWithReply reply", buf, 2u);
    }
    goto LABEL_11;
  }
  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v10)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v11)
    {
      if (onceToken_InternalService_Default != -1)
        dispatch_once(&onceToken_InternalService_Default, &__block_literal_global_4);
      v14 = logObject_InternalService_Default;
      if (os_log_type_enabled((os_log_t)logObject_InternalService_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_228261000, v14, OS_LOG_TYPE_ERROR, "Error received from listClientsWithReply: %@", buf, 0xCu);
      }
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();

LABEL_19:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RMConnectionClient)spiClient
{
  return self->_spiClient;
}

- (void)setSpiClient:(id)a3
{
  objc_storeStrong((id *)&self->_spiClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spiClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
