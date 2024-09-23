@implementation SRSTSharedServer

- (SRSTSharedServer)init
{
  SRSTSharedServer *v2;
  _SRSTSharedServer *v3;
  _SRSTSharedServer *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTSharedServer;
  v2 = -[SRSTSharedServer init](&v6, sel_init);
  v3 = objc_alloc_init(_SRSTSharedServer);
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = v3;

  return v2;
}

- (SRSTSharedState)currentState
{
  SRSTSharedState *v3;
  void *v4;
  SRSTSharedState *v5;

  v3 = [SRSTSharedState alloc];
  -[_SRSTSharedServer currentState](self->_underlyingObject, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRSTSharedState initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (_SRSTSharedServer)underlyingObject
{
  return (_SRSTSharedServer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
