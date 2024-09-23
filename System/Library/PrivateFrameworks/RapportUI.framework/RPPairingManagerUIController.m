@implementation RPPairingManagerUIController

- (RPPairingManagerUIController)init
{
  RPPairingManagerUIController *v2;
  RPPairingManagerUIController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPPairingManagerUIController;
  v2 = -[RPPairingManagerUIController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
  return v3;
}

- (void)_cleanup
{
  id invalidationHandler;
  UIViewController *presentingViewController;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

}

- (void)activate
{
  dispatch_async((dispatch_queue_t)self->_dispatchQueue, &__block_literal_global);
}

void __40__RPPairingManagerUIController_activate__block_invoke()
{
  if (gLogCategory_RPPairingManagerUIController <= 30
    && (gLogCategory_RPPairingManagerUIController != -1 || _LogCategory_Initialize()))
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
  block[2] = __42__RPPairingManagerUIController_invalidate__block_invoke;
  block[3] = &unk_24FD32E38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__RPPairingManagerUIController_invalidate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  if (gLogCategory_RPPairingManagerUIController <= 30
    && (gLogCategory_RPPairingManagerUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[5];
  if (v3)
  {
    (*(void (**)(_QWORD))(v3 + 16))(v2[5]);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_cleanup");
}

- (BOOL)allowManualIP
{
  return self->_allowManualIP;
}

- (void)setAllowManualIP:(BOOL)a3
{
  self->_allowManualIP = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (BOOL)runInProcess
{
  return self->_runInProcess;
}

- (void)setRunInProcess:(BOOL)a3
{
  self->_runInProcess = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
