@implementation SRSTClient

- (SRSTClient)init
{
  SRSTClient *v2;
  uint64_t v3;
  _SRSTClient *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTClient;
  v2 = -[SRSTClient init](&v6, sel_init);
  v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTClient *)v3;

  -[_SRSTClient setDelegate:](v2->_underlyingObject, "setDelegate:", v2);
  return v2;
}

- (SRSTState)currentState
{
  SRSTState *v3;
  void *v4;
  SRSTState *v5;

  v3 = [SRSTState alloc];
  -[_SRSTClient currentState](self->_underlyingObject, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRSTState initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (NSString)mostRecentEventName
{
  return -[_SRSTClient mostRecentEventName](self->_underlyingObject, "mostRecentEventName");
}

- (void)dispatchEvent:(int64_t)a3
{
  -[_SRSTClient dispatchEvent:](self->_underlyingObject, "dispatchEvent:", a3);
}

- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[SRSTClient delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SRSTClient delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stateMachineWithClient:didReceiveEvent:", self, a4);

  }
}

- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4
{
  id v5;
  SRSTState *v6;
  id v7;

  v5 = a4;
  -[SRSTClient delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[SRSTState initWithUnderlyingObject:]([SRSTState alloc], "initWithUnderlyingObject:", v5);

  objc_msgSend(v7, "stateMachineWithClient:didTransitionToState:", self, v6);
}

- (void)stopClient
{
  -[_SRSTClient stopClient](self->_underlyingObject, "stopClient");
}

- (SRSTClientDelegate)delegate
{
  return (SRSTClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SRSTClient)underlyingObject
{
  return (_SRSTClient *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
