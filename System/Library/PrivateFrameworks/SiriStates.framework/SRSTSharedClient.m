@implementation SRSTSharedClient

- (SRSTSharedClient)init
{
  SRSTSharedClient *v2;
  uint64_t v3;
  _SRSTSharedClient *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTSharedClient;
  v2 = -[SRSTSharedClient init](&v6, sel_init);
  v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTSharedClient *)v3;

  -[_SRSTSharedClient setDelegate:](v2->_underlyingObject, "setDelegate:", v2);
  return v2;
}

- (SRSTSharedState)currentState
{
  SRSTSharedState *v3;
  void *v4;
  SRSTSharedState *v5;

  v3 = [SRSTSharedState alloc];
  -[_SRSTSharedClient currentState](self->_underlyingObject, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRSTSharedState initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (NSString)mostRecentEventName
{
  return -[_SRSTSharedClient mostRecentEventName](self->_underlyingObject, "mostRecentEventName");
}

- (void)dispatchEvent:(int64_t)a3
{
  -[_SRSTSharedClient dispatchEvent:](self->_underlyingObject, "dispatchEvent:", a3);
}

- (void)stateMachineWithClient:(id)a3 didReceiveEvent:(int64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[SRSTSharedClient delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SRSTSharedClient delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stateMachineWithClient:didReceiveEvent:", self, a4);

  }
}

- (void)stateMachineWithClient:(id)a3 didTransitionToState:(id)a4
{
  id v5;
  SRSTSharedState *v6;
  id v7;

  v5 = a4;
  -[SRSTSharedClient delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[SRSTSharedState initWithUnderlyingObject:]([SRSTSharedState alloc], "initWithUnderlyingObject:", v5);

  objc_msgSend(v7, "stateMachineWithClient:didTransitionToState:", self, v6);
}

- (void)stopClient
{
  -[_SRSTSharedClient stopClient](self->_underlyingObject, "stopClient");
}

- (SRSTSharedClientDelegate)delegate
{
  return (SRSTSharedClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SRSTSharedClient)underlyingObject
{
  return (_SRSTSharedClient *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
