@implementation SKAISSetupController

- (SKAISSetupController)init
{
  return -[SKAISSetupController initWithQueue:](self, "initWithQueue:", 0);
}

- (SKAISSetupController)initWithQueue:(id)a3
{
  id v4;
  SKAISSetupController *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v8;
  id v9;
  SKAISSetupController *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKAISSetupController;
  v5 = -[SKAISSetupController init](&v12, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      dispatchQueue = v5->_dispatchQueue;
      v5->_dispatchQueue = v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v9 = MEMORY[0x24BDAC9B8];
      dispatchQueue = v5->_dispatchQueue;
      v5->_dispatchQueue = v8;
    }

    v10 = v5;
  }

  return v5;
}

- (void)setupWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double mockDelay;
  dispatch_time_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id *v15;
  NSObject *v16;
  NSObject *dispatchQueue;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD block[5];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_OWORD *)&self->_mockError == 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(getAISSetupControllerClass()), "initWithQueue:", self->_dispatchQueue);
    if (v12)
    {
      objc_msgSend(v6, "underlyingObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_storeStrong((id *)&self->_underlyingObject, v12);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_5;
        v18[3] = &unk_24D229A88;
        v15 = &v19;
        v19 = v8;
        objc_msgSend(v12, "setupWithContext:completionHandler:", v14, v18);
      }
      else
      {
        dispatchQueue = self->_dispatchQueue;
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_4;
        v20[3] = &unk_24D229A60;
        v15 = &v21;
        v21 = v8;
        dispatch_async(dispatchQueue, v20);
      }

    }
    else
    {
      v16 = self->_dispatchQueue;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_3;
      v22[3] = &unk_24D229A60;
      v23 = v8;
      dispatch_async(v16, v22);
      v14 = v23;
    }

  }
  else
  {
    mockDelay = self->_mockDelay;
    if (mockDelay <= 0.0)
    {
      v13 = self->_dispatchQueue;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_2;
      v24[3] = &unk_24D22A928;
      v24[4] = self;
      v25 = v7;
      dispatch_async(v13, v24);
      v12 = v25;
    }
    else
    {
      v10 = dispatch_time(0, (uint64_t)(mockDelay * 1000000000.0));
      v11 = self->_dispatchQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke;
      block[3] = &unk_24D22A928;
      block[4] = self;
      v27 = v8;
      dispatch_after(v10, v11, block);
      v12 = v27;
    }
  }

}

- (double)mockDelay
{
  return self->_mockDelay;
}

- (void)setMockDelay:(double)a3
{
  self->_mockDelay = a3;
}

- (NSError)mockError
{
  return self->_mockError;
}

- (void)setMockError:(id)a3
{
  objc_storeStrong((id *)&self->_mockError, a3);
}

- (SKAISSetupReport)mockReport
{
  return self->_mockReport;
}

- (void)setMockReport:(id)a3
{
  objc_storeStrong((id *)&self->_mockReport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockReport, 0);
  objc_storeStrong((id *)&self->_mockError, 0);
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

uint64_t __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

void __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  NSErrorF_safe();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  NSErrorF_safe();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __59__SKAISSetupController_setupWithContext_completionHandler___block_invoke_5(uint64_t a1, SKAISSetupReport *a2, void *a3)
{
  SKAISSetupReport *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = objc_alloc_init(SKAISSetupReport);
    -[SKAISSetupReport setUnderlyingObject:](a2, "setUnderlyingObject:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
