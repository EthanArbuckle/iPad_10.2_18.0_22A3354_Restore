@implementation _UIPhysicalButtonInteractionBSActionDriver

- (_UIPhysicalButtonInteractionBSActionDriver)initWithReceiver:(id)a3
{
  _UIPhysicalButtonInteractionBSActionDriver *v4;
  _UIPhysicalButtonInteractionBSActionDriver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalButtonInteractionBSActionDriver;
  v4 = -[_UIPhysicalButtonInteractionBSActionDriver init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_receiver, a3);
  return v5;
}

- (_UIPhysicalButtonInteractionBSActionDriver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionBSActionDriver.m"), 28, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonInteractionBSActionDriver init]", objc_opt_class());

  return 0;
}

- (int64_t)_driverType
{
  return 0;
}

- (void)_handleBSAction:(id)a3
{
  id WeakRetained;
  id v5;

  +[_UIPhysicalButtonAction _actionFromPhysicalButtonBSAction:andDriver:]((uint64_t)_UIPhysicalButtonAction, a3, -[_UIPhysicalButtonInteractionBSActionDriver _driverType](self, "_driverType"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  objc_msgSend(WeakRetained, "_driver:didCreateProposedAction:", self, v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_receiver);
}

@end
