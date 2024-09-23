@implementation UIInputViewControllerInterface

- (UIInputViewControllerInterface)init
{
  UIInputViewControllerInterface *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIInputViewControllerInterface;
  v2 = -[UIInputViewControllerInterface init](&v5, sel_init);
  if (v2)
  {
    sharedInputManagerMux_0();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addClient:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  sharedInputManagerMux_0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)UIInputViewControllerInterface;
  -[UIInputViewControllerInterface dealloc](&v4, sel_dealloc);
}

- (void)setForwardingInterface:(id)a3
{
  _UIIVCInterface *v4;
  _UIIVCInterface *forwardingInterface;
  _UIIVCInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (_UIIVCInterface *)a3;
  -[_UIIVCInterface setResponseDelegate:](self->_forwardingInterface, "setResponseDelegate:", 0);
  forwardingInterface = self->_forwardingInterface;
  self->_forwardingInterface = v4;
  v6 = v4;

  -[UIInputViewControllerInterface responseDelegate](self, "responseDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIIVCInterface setResponseDelegate:](self->_forwardingInterface, "setResponseDelegate:", v7);

  -[UIInputViewControllerInterface _cachedState](self, "_cachedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIInputViewControllerInterface forwardingInterface](self, "forwardingInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewControllerInterface _cachedState](self, "_cachedState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleInputViewControllerState:", v10);

    -[UIInputViewControllerInterface _setCachedState:](self, "_setCachedState:", 0);
  }
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  +[_UIInputViewControllerState stateForKeyboardState:](_UIInputViewControllerState, "stateForKeyboardState:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewControllerInterface forwardingInterface](self, "forwardingInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIInputViewControllerInterface forwardingInterface](self, "forwardingInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_handleInputViewControllerState:", v6);

  }
  else
  {
    -[UIInputViewControllerInterface _setCachedState:](self, "_setCachedState:", v6);
    -[UIInputViewControllerInterface _handleInputViewControllerState:](self, "_handleInputViewControllerState:", v6);
  }
  if (v9)
    v9[2](v9, 0);

}

- (_UIIVCResponseDelegate)responseDelegate
{
  return self->_responseDelegate;
}

- (void)setResponseDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_responseDelegate, a3);
}

- (_UIIVCInterface)forwardingInterface
{
  return self->_forwardingInterface;
}

- (_UIInputViewControllerState)_cachedState
{
  return self->_cachedState;
}

- (void)_setCachedState:(id)a3
{
  objc_storeStrong((id *)&self->_cachedState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedState, 0);
  objc_storeStrong((id *)&self->_forwardingInterface, 0);
  objc_storeStrong((id *)&self->_responseDelegate, 0);
}

@end
