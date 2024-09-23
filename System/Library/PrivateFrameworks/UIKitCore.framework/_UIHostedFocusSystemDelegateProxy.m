@implementation _UIHostedFocusSystemDelegateProxy

- (_UIHostedFocusSystemDelegateProxy)initWithFocusSystem:(id)a3 delegate:(id)a4
{
  id v6;
  _UIHostedFocusSystemDelegateProxy *v7;
  _UIHostedFocusSystemDelegateProxy *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIHostedFocusSystemDelegateProxy;
  v7 = -[_UIHostedFocusSystemDelegateProxy init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_focusSystem = (_UIHostedFocusSystem *)a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  char v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[_UIHostedFocusSystem _hostFocusSystem](self->_focusSystem, "_hostFocusSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  _UIHostedFocusSystemDelegate **p_delegate;
  id WeakRetained;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIHostedFocusSystem _hostFocusSystem](self->_focusSystem, "_hostFocusSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "methodSignatureForSelector:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _UIHostedFocusSystemDelegate **p_delegate;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
  }
  else
  {
    -[_UIHostedFocusSystem _hostFocusSystem](self->_focusSystem, "_hostFocusSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (_UIHostedFocusSystemDelegate)delegate
{
  return (_UIHostedFocusSystemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
