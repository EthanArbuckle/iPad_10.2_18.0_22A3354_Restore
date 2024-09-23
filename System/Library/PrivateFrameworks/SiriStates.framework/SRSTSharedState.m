@implementation SRSTSharedState

+ (SRSTSharedState)preparingToServe
{
  SRSTSharedState *v2;
  void *v3;
  SRSTSharedState *v4;

  v2 = [SRSTSharedState alloc];
  +[_SRSTSharedState preparingToServe](_SRSTSharedState, "preparingToServe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTSharedState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTSharedState)serving
{
  SRSTSharedState *v2;
  void *v3;
  SRSTSharedState *v4;

  v2 = [SRSTSharedState alloc];
  +[_SRSTSharedState serving](_SRSTSharedState, "serving");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTSharedState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

- (SRSTSharedState)init
{
  SRSTSharedState *v2;
  uint64_t v3;
  _SRSTSharedState *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTSharedState;
  v2 = -[SRSTSharedState init](&v6, sel_init);
  v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (_SRSTSharedState *)v3;

  return v2;
}

- (NSString)name
{
  return -[_SRSTSharedState name](self->_underlyingObject, "name");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "hash");
  return v4 == -[SRSTSharedState hash](self, "hash");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_SRSTSharedState name](self->_underlyingObject, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)makeProxy
{
  return -[SRSTSharedStateProxy initWithState:]([SRSTSharedStateProxy alloc], "initWithState:", self);
}

+ (id)new
{
  return objc_alloc_init(SRSTSharedState);
}

- (SRSTSharedState)initWithUnderlyingObject:(id)a3
{
  _SRSTSharedState *v4;
  SRSTSharedState *v5;
  _SRSTSharedState *underlyingObject;
  objc_super v8;

  v4 = (_SRSTSharedState *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SRSTSharedState;
  v5 = -[SRSTSharedState init](&v8, sel_init);
  underlyingObject = v5->_underlyingObject;
  v5->_underlyingObject = v4;

  return v5;
}

- (_SRSTSharedState)underlyingObject
{
  return (_SRSTSharedState *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

+ (SRSTSharedState)unshared
{
  SRSTSharedState *v2;
  void *v3;
  SRSTSharedState *v4;

  v2 = [SRSTSharedState alloc];
  +[_SRSTSharedState unshared](_SRSTSharedState, "unshared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTSharedState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

+ (SRSTSharedState)passive
{
  SRSTSharedState *v2;
  void *v3;
  SRSTSharedState *v4;

  v2 = [SRSTSharedState alloc];
  +[_SRSTSharedState passive](_SRSTSharedState, "passive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRSTSharedState initWithUnderlyingObject:](v2, "initWithUnderlyingObject:", v3);

  return v4;
}

@end
