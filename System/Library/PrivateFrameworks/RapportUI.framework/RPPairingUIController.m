@implementation RPPairingUIController

- (RPPairingUIController)init
{
  RPPairingUIController *v2;
  RPPairingUIController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPPairingUIController;
  v2 = -[RPPairingUIController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
  return v3;
}

- (void)_cleanup
{
  id invalidationHandler;
  UIViewController *presentingViewController;
  id tryPINHandler;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  tryPINHandler = self->_tryPINHandler;
  self->_tryPINHandler = 0;

}

- (void)activate
{
  if (gLogCategory_RPPairingUIController <= 30
    && (gLogCategory_RPPairingUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__RPPairingUIController_invalidate__block_invoke;
  block[3] = &unk_24FD32E38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPPairingUIController_invalidate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  if (gLogCategory_RPPairingUIController <= 30
    && (gLogCategory_RPPairingUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[2];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(v2[2]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_cleanup");
}

- (void)promptWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  NSObject *dispatchQueue;
  _QWORD block[4];
  unsigned int v6;
  int v7;

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__RPPairingUIController_promptWithFlags_throttleSeconds___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  v6 = a3;
  v7 = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __57__RPPairingUIController_promptWithFlags_throttleSeconds___block_invoke()
{
  uint64_t result;

  if (gLogCategory_RPPairingUIController <= 30)
  {
    if (gLogCategory_RPPairingUIController != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)retryHandler
{
  return self->_retryHandler;
}

- (void)setRetryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)tryPINHandler
{
  return self->_tryPINHandler;
}

- (void)setTryPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_tryPINHandler, 0);
  objc_storeStrong(&self->_retryHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
