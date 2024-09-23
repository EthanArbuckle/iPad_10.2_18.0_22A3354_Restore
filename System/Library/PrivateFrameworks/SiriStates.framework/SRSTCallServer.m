@implementation SRSTCallServer

- (SRSTCallServer)init
{
  SRSTCallServer *v2;
  _SRSTCallServer *v3;
  _SRSTCallServer *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTCallServer;
  v2 = -[SRSTCallServer init](&v6, sel_init);
  v3 = objc_alloc_init(_SRSTCallServer);
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = v3;

  return v2;
}

- (SRSTCallState)currentState
{
  SRSTCallState *v3;
  void *v4;
  SRSTCallState *v5;

  v3 = [SRSTCallState alloc];
  -[_SRSTCallServer currentState](self->_underlyingObject, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRSTCallState initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (_SRSTCallServer)underlyingObject
{
  return (_SRSTCallServer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
