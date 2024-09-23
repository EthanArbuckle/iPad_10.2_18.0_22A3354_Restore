@implementation SRSTState

+ (SRSTState)analyzing
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState analyzing](_SRSTState, "analyzing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTState)resting
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState resting](_SRSTState, "resting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTState)available
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState available](_SRSTState, "available");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

- (SRSTState)init
{
  SRSTState *v2;
  uint64_t v3;
  _SRSTState *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTState;
  v2 = -[SRSTState init](&v6, sel_init);
  v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTState *)v3;

  return v2;
}

- (NSString)name
{
  return -[_SRSTState name](self->_underlyingObject, "name");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "hash");
  return v4 == -[SRSTState hash](self, "hash");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_SRSTState name](self->_underlyingObject, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)makeProxy
{
  return -[SRSTStateProxy initWithState:]([SRSTStateProxy alloc], "initWithState:", self);
}

+ (id)new
{
  return objc_alloc_init(SRSTState);
}

- (SRSTState)initWithUnderlyingObject:(id)a3
{
  _SRSTState *v4;
  SRSTState *v5;
  _SRSTState *underlyingObject;
  objc_super v8;

  v4 = (_SRSTState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SRSTState;
  v5 = -[SRSTState init](&v8, sel_init);
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (_SRSTState)underlyingObject
{
  return (_SRSTState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

+ (SRSTState)postResponse
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState postResponse](_SRSTState, "postResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTState)understanding
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState understanding](_SRSTState, "understanding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTState)responding
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState responding](_SRSTState, "responding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTState)disabled
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState disabled](_SRSTState, "disabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTState)processing
{
  SRSTState *v2;
  void *v3;
  SRSTState *v4;

  v2 = [SRSTState alloc];
  +[_SRSTState processing](_SRSTState, "processing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

@end
