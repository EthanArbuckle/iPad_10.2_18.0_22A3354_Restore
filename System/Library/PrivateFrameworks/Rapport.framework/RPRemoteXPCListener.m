@implementation RPRemoteXPCListener

- (RPRemoteXPCListener)init
{
  RPRemoteXPCListener *v2;
  RPRemoteXPCListener *v3;
  RPRemoteXPCListener *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPRemoteXPCListener;
  v2 = -[RPRemoteXPCListener init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__RPRemoteXPCListener_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __46__RPRemoteXPCListener_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  void (**v5)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  v5 = v3;
  if (gLogCategory_RPRemoteXPC <= 30)
  {
    if (gLogCategory_RPRemoteXPC != -1 || (v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }
  if (v3)
  {
    v3[2](v3, 0);
    v3 = v5;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__RPRemoteXPCListener_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__RPRemoteXPCListener_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPRemoteXPC <= 30 && (gLogCategory_RPRemoteXPC != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[RPRemoteXPCListener _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  uint64_t v3;
  void *v4;
  id acceptHandler;
  id interruptionHandler;
  id invalidationHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v3 = MEMORY[0x1AF45BE48](self->_invalidationHandler);
    v4 = (void *)v3;
    if (v3)
      (*(void (**)(uint64_t))(v3 + 16))(v3);

    acceptHandler = self->_acceptHandler;
    self->_acceptHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteXPC <= 30 && (gLogCategory_RPRemoteXPC != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (id)acceptHandler
{
  return self->_acceptHandler;
}

- (void)setAcceptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_acceptHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
