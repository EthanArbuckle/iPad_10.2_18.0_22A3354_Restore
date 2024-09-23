@implementation _UIPhysicalButtonProxyInteractionBSActionDriver

- (_UIPhysicalButtonProxyInteractionBSActionDriver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonProxyInteractionBSActionDriver.m"), 28, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonProxyInteractionBSActionDriver init]", objc_opt_class());

  return 0;
}

- (_UIPhysicalButtonProxyInteractionBSActionDriver)initWithReceiver:(id)a3
{
  _UIPhysicalButtonProxyInteractionBSActionDriver *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIPhysicalButtonProxyInteractionBSActionDriver;
  v5 = -[_UIPhysicalButtonProxyInteractionBSActionDriver init](&v8, sel_init);
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_UIPhysicalButtonProxyInteractionBSActionDriver.m"), 38, CFSTR("Attempting to initialize %@ with a non-conforming receiver: %@"), objc_opt_class(), a3);

    }
    objc_storeWeak((id *)&v5->_proxyReceiver, a3);
  }
  return v5;
}

- (int64_t)_driverType
{
  return 0;
}

- (void)_handleBSAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyReceiver);
  objc_msgSend(WeakRetained, "_proxyDriver:didReceiveBSAction:", self, a3);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyReceiver);
}

@end
