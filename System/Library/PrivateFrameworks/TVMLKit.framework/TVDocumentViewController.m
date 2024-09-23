@implementation TVDocumentViewController

- (id)tvdvc_initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVDocumentViewController;
  return -[TVDocumentViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
}

+ (id)viewControllerWithContext:(id)a3 forAppController:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _TVAppDocumentRequestController *v12;

  v5 = (objc_class *)MEMORY[0x24BE519E0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithContextDictionary:element:", v7, 0);
  v9 = objc_alloc(MEMORY[0x24BE51998]);
  objc_msgSend(v6, "_appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithAppContext:serviceContext:", v10, v8);
  v12 = -[_TVAppDocumentRequestController initWithDocumentServiceRequest:]([_TVAppDocumentRequestController alloc], "initWithDocumentServiceRequest:", v11);
  -[TVDocumentViewController setDocumentContext:](v12, "setDocumentContext:", v7);

  return v12;
}

- (void)setDelegate:(id)a3
{
  TVDocumentViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  $E6CA0F0C94808B489AD285D7DA58C093 *p_delegateFlags;
  id v9;
  id v10;
  id v11;
  id v12;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_msgSend(obj, "conformsToProtocol:", &unk_2557DFD48) & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      p_delegateFlags = &self->_delegateFlags;
      self->_delegateFlags.respondsToWillUpdate = objc_opt_respondsToSelector() & 1;

      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      p_delegateFlags->respondsToDidUpdate = objc_opt_respondsToSelector() & 1;

      v10 = objc_loadWeakRetained((id *)p_delegate);
      p_delegateFlags->respondsToHandleEvent = objc_opt_respondsToSelector() & 1;

      v11 = objc_loadWeakRetained((id *)p_delegate);
      p_delegateFlags->respondsToDidFailWithError = objc_opt_respondsToSelector() & 1;

      v12 = objc_loadWeakRetained((id *)p_delegate);
      p_delegateFlags->respondsToDidUpdateWithContext = objc_opt_respondsToSelector() & 1;

    }
    else
    {
      *(_DWORD *)&self->_delegateFlags.respondsToWillUpdate = 0;
      self->_delegateFlags.respondsToDidUpdateWithContext = 0;
    }
    v6 = obj;
  }

}

- (void)updateUsingContext:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[TVDocumentViewController documentContext](self, "documentContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVDocumentViewController setDocumentContext:](self, "setDocumentContext:", v4);

  -[TVDocumentViewController documentContext](self, "documentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
    -[TVDocumentViewController didChangeDocumentContext](self, "didChangeDocumentContext");

}

- (void)willUpdateDocument
{
  id v3;

  if (self->_delegateFlags.respondsToWillUpdate)
  {
    -[TVDocumentViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentViewControllerWillUpdate:", self);

  }
}

- (void)didUpdateDocument
{
  id v3;

  if (self->_delegateFlags.respondsToDidUpdate)
  {
    -[TVDocumentViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentViewControllerDidUpdate:", self);

  }
}

- (void)didUpdateWithContext:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateFlags.respondsToDidUpdateWithContext)
  {
    v4 = a3;
    -[TVDocumentViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentViewController:didUpdateWithContext:", self, v4);

  }
}

- (void)didFailUpdateWithError:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateFlags.respondsToDidFailWithError)
  {
    v4 = a3;
    -[TVDocumentViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentViewController:didFailUpdateWithError:", self, v4);

  }
}

- (BOOL)handleEvent:(id)a3 withElement:(id)a4 targetResponder:(id)a5
{
  TVDocumentViewController *v6;
  id v7;
  id v8;
  void *v9;

  if (!self->_delegateFlags.respondsToHandleEvent)
    return 0;
  v6 = self;
  v7 = a4;
  v8 = a3;
  -[TVDocumentViewController delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "documentViewController:handleEvent:withElement:", v6, v8, v7);

  return (char)v6;
}

- (NSDictionary)documentContext
{
  return self->_documentContext;
}

- (void)setDocumentContext:(id)a3
{
  objc_storeStrong((id *)&self->_documentContext, a3);
}

- (TVApplicationController)appController
{
  return (TVApplicationController *)objc_loadWeakRetained((id *)&self->_appController);
}

- (TVDocumentViewControllerDelegate)delegate
{
  return (TVDocumentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appController);
  objc_storeStrong((id *)&self->_documentContext, 0);
}

@end
