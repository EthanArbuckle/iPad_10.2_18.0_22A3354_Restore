@implementation SRSTCallState

+ (SRSTCallState)noCall
{
  SRSTCallState *v2;
  void *v3;
  SRSTCallState *v4;

  v2 = [SRSTCallState alloc];
  +[_SRSTCallState noCall](_SRSTCallState, "noCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTCallState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTCallState)micMutedCall
{
  SRSTCallState *v2;
  void *v3;
  SRSTCallState *v4;

  v2 = [SRSTCallState alloc];
  +[_SRSTCallState micMutedCall](_SRSTCallState, "micMutedCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTCallState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

- (SRSTCallState)init
{
  SRSTCallState *v2;
  uint64_t v3;
  _SRSTCallState *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTCallState;
  v2 = -[SRSTCallState init](&v6, sel_init);
  v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTCallState *)v3;

  return v2;
}

- (NSString)name
{
  return -[_SRSTCallState name](self->_underlyingObject, "name");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "hash");
  return v4 == -[SRSTCallState hash](self, "hash");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_SRSTCallState name](self->_underlyingObject, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)makeProxy
{
  return -[SRSTCallStateProxy initWithState:]([SRSTCallStateProxy alloc], "initWithState:", self);
}

+ (id)new
{
  return objc_alloc_init(SRSTCallState);
}

- (SRSTCallState)initWithUnderlyingObject:(id)a3
{
  _SRSTCallState *v4;
  SRSTCallState *v5;
  _SRSTCallState *underlyingObject;
  objc_super v8;

  v4 = (_SRSTCallState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SRSTCallState;
  v5 = -[SRSTCallState init](&v8, sel_init);
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (_SRSTCallState)underlyingObject
{
  return (_SRSTCallState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

+ (SRSTCallState)onHoldCall
{
  SRSTCallState *v2;
  void *v3;
  SRSTCallState *v4;

  v2 = [SRSTCallState alloc];
  +[_SRSTCallState onHoldCall](_SRSTCallState, "onHoldCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTCallState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTCallState)ongoingCall
{
  SRSTCallState *v2;
  void *v3;
  SRSTCallState *v4;

  v2 = [SRSTCallState alloc];
  +[_SRSTCallState ongoingCall](_SRSTCallState, "ongoingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTCallState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

@end
