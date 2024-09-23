@implementation SRSTServer

- (SRSTServer)init
{
  SRSTServer *v2;
  _SRSTServer *v3;
  _SRSTServer *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTServer;
  v2 = -[SRSTServer init](&v6, sel_init);
  v3 = objc_alloc_init(_SRSTServer);
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = v3;

  return v2;
}

- (SRSTState)currentState
{
  SRSTState *v3;
  void *v4;
  SRSTState *v5;

  v3 = [SRSTState alloc];
  -[_SRSTServer currentState](self->_underlyingObject, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRSTState initWithUnderlyingObject:](v3, "initWithUnderlyingObject:", v4);

  return v5;
}

- (_SRSTServer)underlyingObject
{
  return (_SRSTServer *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
