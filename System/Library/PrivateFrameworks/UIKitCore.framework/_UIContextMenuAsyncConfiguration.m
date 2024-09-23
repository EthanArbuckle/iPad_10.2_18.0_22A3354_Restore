@implementation _UIContextMenuAsyncConfiguration

- (_UIContextMenuAsyncConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContextMenuAsyncConfiguration;
  return -[UIContextMenuConfiguration init](&v3, sel_init);
}

- (void)_prepareWithCompletion:(id)a3
{
  id v4;
  _UIBurnableBlock *v5;
  _UIBurnableBlock *deferredCompletion;

  v4 = a3;
  v5 = -[_UIBurnableBlock initWithTimeout:block:defaultInputProvider:]([_UIBurnableBlock alloc], "initWithTimeout:block:defaultInputProvider:", v4, 0, 0.5);

  deferredCompletion = self->_deferredCompletion;
  self->_deferredCompletion = v5;

}

- (BOOL)fulfillWithConfiguration:(id)a3
{
  BOOL v4;
  _UIBurnableBlock *deferredCompletion;

  v4 = -[_UIBurnableBlock performWithInput:](self->_deferredCompletion, "performWithInput:", a3);
  deferredCompletion = self->_deferredCompletion;
  self->_deferredCompletion = 0;

  return v4;
}

+ (id)configurationWithIdentifier:(id)a3 previewProvider:(id)a4 actionProvider:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIContextMenuAsyncConfiguration.m"), 48, CFSTR("configurationWithIdentifier:previewProvider:actionProvider: is not available; use -init instead."));

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredCompletion, 0);
}

@end
