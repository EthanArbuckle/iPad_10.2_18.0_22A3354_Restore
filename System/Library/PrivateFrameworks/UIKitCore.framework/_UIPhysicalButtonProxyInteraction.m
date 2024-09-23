@implementation _UIPhysicalButtonProxyInteraction

- (_UIPhysicalButtonProxyInteraction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonProxyInteraction.m"), 27, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonProxyInteraction init]", objc_opt_class());

  return 0;
}

- (id)initWithConfigurations:(void *)a3 proxyDelegate:
{
  id *v6;
  id *v7;
  void *v9;
  objc_super v10;

  if (!a1)
    return 0;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithConfigurations_proxyDelegate_, a1, CFSTR("_UIPhysicalButtonProxyInteraction.m"), 35, CFSTR("Attempting to initialize %@ with a non-conforming delegate: %@"), objc_opt_class(), a3);

  }
  v10.receiver = a1;
  v10.super_class = (Class)_UIPhysicalButtonProxyInteraction;
  v6 = (id *)objc_msgSendSuper2(&v10, sel_initWithConfigurations_delegate_, a2, a3);
  v7 = v6;
  if (v6)
    objc_storeWeak(v6 + 11, a3);
  return v7;
}

- (BOOL)_isProxyInteraction
{
  return 1;
}

- (id)_driverClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_driver:(id)a3 didCreateProposedAction:(id)a4
{
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonProxyInteraction.m"), 58, CFSTR("Unexpected request for a proxy interaction to handle a proposed action: self: %@; driver: %@; proposedAction: %@"),
    self,
    a3,
    a4);

}

- (void)_proxyDriver:(id)a3 didReceiveBSAction:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyDelegate);
  objc_msgSend(WeakRetained, "_physicalButtonProxyInteraction:didReceiveBSAction:", self, a4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyDelegate);
}

@end
