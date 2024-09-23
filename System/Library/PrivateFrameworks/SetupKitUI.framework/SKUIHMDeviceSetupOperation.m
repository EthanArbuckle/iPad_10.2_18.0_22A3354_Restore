@implementation SKUIHMDeviceSetupOperation

- (SKUIHMDeviceSetupOperation)initWithDispatchQueue:(id)a3 messageSessionTemplate:(id)a4
{
  id v7;
  id v8;
  SKUIHMDeviceSetupOperation *v9;
  SKUIHMDeviceSetupOperation *v10;
  SKUIHMDeviceSetupOperation *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SKUIHMDeviceSetupOperation;
  v9 = -[SKUIHMDeviceSetupOperation init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_messageSessionTemplate, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_245DDF000, v3, OS_LOG_TYPE_DEBUG, "operation dealloc", buf, 2u);
  }

  -[SKUIHMDeviceSetupOperation _cleanup](self, "_cleanup");
  v4.receiver = self;
  v4.super_class = (Class)SKUIHMDeviceSetupOperation;
  -[SKUIHMDeviceSetupOperation dealloc](&v4, sel_dealloc);
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SKUIHMDeviceSetupOperation_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_251701C30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_performWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id completionHandler;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  TROperationQueue *v11;
  TROperationQueue *trOperationQueue;
  SKTRSession *v13;
  SKTRSession *trSession;
  id v15;
  SKTRSession *v16;
  void *v17;
  HMDeviceSetupOperation *v18;
  HMDeviceSetupOperation *hkDeviceSetupOperation;
  _QWORD v20[4];
  id v21;
  id buf[2];

  v4 = (void (**)(id, _QWORD, void *))a3;
  completionHandler = self->_completionHandler;
  logger();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (completionHandler)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_245DDF000, v7, OS_LOG_TYPE_ERROR, "### HomeSetup setup already running", (uint8_t *)buf, 2u);
    }

    NSErrorF_safe();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_245DDF000, v7, OS_LOG_TYPE_DEFAULT, "operation start", (uint8_t *)buf, 2u);
    }

    v9 = (void *)MEMORY[0x249549498](v4);
    v10 = self->_completionHandler;
    self->_completionHandler = v9;

    if (!self->_trOperationQueue)
    {
      v11 = (TROperationQueue *)objc_alloc_init(getTROperationQueueClass());
      trOperationQueue = self->_trOperationQueue;
      self->_trOperationQueue = v11;

      -[TROperationQueue setUnderlyingQueue:](self->_trOperationQueue, "setUnderlyingQueue:", self->_dispatchQueue);
    }
    if (!self->_trSession)
    {
      v13 = (SKTRSession *)objc_msgSend(objc_alloc(MEMORY[0x24BE85CB8]), "initWithDispatchQueue:messageSessionTemplate:", self->_dispatchQueue, self->_messageSessionTemplate);
      trSession = self->_trSession;
      self->_trSession = v13;

      -[SKTRSession start](self->_trSession, "start");
    }
    if (!self->_hkDeviceSetupOperation)
    {
      v15 = objc_alloc(MEMORY[0x24BDD7610]);
      v16 = self->_trSession;
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (HMDeviceSetupOperation *)objc_msgSend(v15, "initWithSession:sessionIdentifier:", v16, v17);
      hkDeviceSetupOperation = self->_hkDeviceSetupOperation;
      self->_hkDeviceSetupOperation = v18;

      -[HMDeviceSetupOperation setQualityOfService:](self->_hkDeviceSetupOperation, "setQualityOfService:", 33);
      objc_initWeak(buf, self);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __60__SKUIHMDeviceSetupOperation__performWithCompletionHandler___block_invoke;
      v20[3] = &unk_251701C58;
      objc_copyWeak(&v21, buf);
      -[HMDeviceSetupOperation setCompletionBlock:](self->_hkDeviceSetupOperation, "setCompletionBlock:", v20);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", self->_hkDeviceSetupOperation);
      objc_destroyWeak(&v21);
      objc_destroyWeak(buf);
    }
  }

}

- (void)cancel
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SKUIHMDeviceSetupOperation_cancel__block_invoke;
  block[3] = &unk_251701C80;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_cancel
{
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id completionHandler;
  void *v6;
  uint8_t v7[16];

  logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_245DDF000, v3, OS_LOG_TYPE_DEFAULT, "operation cancel", v7, 2u);
  }

  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x249549498](self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (v4)
  {
    NSErrorF_safe();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v6);

  }
  -[SKUIHMDeviceSetupOperation _cleanup](self, "_cleanup");

}

- (void)_cleanup
{
  HMDeviceSetupOperation *hkDeviceSetupOperation;
  TROperationQueue *trOperationQueue;
  SKTRSession *trSession;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id completionHandler;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  -[HMDeviceSetupOperation cancel](self->_hkDeviceSetupOperation, "cancel");
  -[HMDeviceSetupOperation setCompletionBlock:](self->_hkDeviceSetupOperation, "setCompletionBlock:", 0);
  hkDeviceSetupOperation = self->_hkDeviceSetupOperation;
  self->_hkDeviceSetupOperation = 0;

  -[TROperationQueue invalidate](self->_trOperationQueue, "invalidate");
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  -[SKTRSession cancel](self->_trSession, "cancel");
  trSession = self->_trSession;
  self->_trSession = 0;

  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x249549498](self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (v6)
  {
    logger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_245DDF000, v8, OS_LOG_TYPE_ERROR, "### dealloc without completion", v10, 2u);
    }

    NSErrorF_safe();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v9);

  }
}

- (void)_completed
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  id completionHandler;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x249549498](self->_completionHandler, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  -[HMDeviceSetupOperation accessory](self->_hkDeviceSetupOperation, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDeviceSetupOperation error](self->_hkDeviceSetupOperation, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  logger();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_245DDF000, v8, OS_LOG_TYPE_DEFAULT, "operation success: accessory=%@", (uint8_t *)&v12, 0xCu);

    }
    if (v3)
      ((void (**)(_QWORD, void *, _QWORD))v3)[2](v3, v5, 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_error_impl(&dword_245DDF000, v8, OS_LOG_TYPE_ERROR, "### operation failed: no accessory, error=%@", (uint8_t *)&v12, 0xCu);

    }
    if (v3)
    {
      if (v6)
      {
        ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v6);
      }
      else
      {
        NSErrorF_safe();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v10);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_hkDeviceSetupOperation, 0);
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __36__SKUIHMDeviceSetupOperation_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

void __60__SKUIHMDeviceSetupOperation__performWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_completed");

}

uint64_t __59__SKUIHMDeviceSetupOperation_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

@end
