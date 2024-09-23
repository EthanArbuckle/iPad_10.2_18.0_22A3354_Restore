@implementation PLCaptureSessionState

- (PLCaptureSessionState)init
{
  PLCaptureSessionState *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PLCaptureSessionState)initWithType:(unint64_t)a3
{
  PLCaptureSessionState *v4;
  PLCaptureSessionState *v5;
  PLCaptureSessionState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCaptureSessionState;
  v4 = -[PLCaptureSessionState init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = v4;
  }

  return v5;
}

- (id)description
{
  PLCaptureSessionState *v2;
  id v3;

  v2 = self;
  PFAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (unint64_t)type
{
  return self->_type;
}

+ (id)none
{
  pl_dispatch_once(&none_pl_once_token_15, &__block_literal_global_10562);
  return (id)none_pl_once_object_15;
}

+ (id)lockedWithSessionIdentifier:(id)a3
{
  id v3;
  PLCaptureSessionStateLocked *v4;

  v3 = a3;
  v4 = -[PLCaptureSessionStateLocked initWithSessionIdentifier:]([PLCaptureSessionStateLocked alloc], "initWithSessionIdentifier:", v3);

  return v4;
}

+ (id)unlockedWithSessionIdentifier:(id)a3
{
  id v3;
  PLCaptureSessionStateUnlocked *v4;

  v3 = a3;
  v4 = -[PLCaptureSessionStateUnlocked initWithSessionIdentifier:]([PLCaptureSessionStateUnlocked alloc], "initWithSessionIdentifier:", v3);

  return v4;
}

+ (id)unknown
{
  pl_dispatch_once(&unknown_pl_once_token_16, &__block_literal_global_46_10561);
  return (id)unknown_pl_once_object_16;
}

void __42__PLCaptureSessionState_Creation__unknown__block_invoke()
{
  PLCaptureSessionStateUnknown *v0;
  void *v1;

  v0 = objc_alloc_init(PLCaptureSessionStateUnknown);
  v1 = (void *)unknown_pl_once_object_16;
  unknown_pl_once_object_16 = (uint64_t)v0;

}

void __39__PLCaptureSessionState_Creation__none__block_invoke()
{
  PLCaptureSessionStateNone *v0;
  void *v1;

  v0 = objc_alloc_init(PLCaptureSessionStateNone);
  v1 = (void *)none_pl_once_object_15;
  none_pl_once_object_15 = (uint64_t)v0;

}

@end
