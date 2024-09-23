@implementation CRLPlatformControlState

+ (id)stateWithValue:(unint64_t)a3
{
  return -[CRLPlatformControlState initWithValue:]([CRLPlatformControlState alloc], "initWithValue:", a3);
}

- (CRLPlatformControlState)initWithValue:(unint64_t)a3
{
  CRLPlatformControlState *v3;

  v3 = self;
  if (a3 <= 2)
    v3 = -[CRLPlatformControlState initWithUIMenuElementState:](self, "initWithUIMenuElementState:");

  return v3;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t *p_mStateValue;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  p_mStateValue = &self->mStateValue;
  result = self->mStateValue;
  if (result >= 3)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E6D0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA5E0(p_mStateValue, v4, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E6F0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPlatformControlState hash]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLPlatformControlState.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 65, 0, "Bad value: %zd", *p_mStateValue);

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  BOOL v9;

  v4 = a3;
  v6 = objc_opt_class(CRLPlatformControlState, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = self->mStateValue == v8[1];
  else
    v9 = 0;

  return v9;
}

+ (id)stateWithUIMenuElementState:(int64_t)a3
{
  return -[CRLPlatformControlState initWithUIMenuElementState:]([CRLPlatformControlState alloc], "initWithUIMenuElementState:", a3);
}

- (CRLPlatformControlState)initWithUIMenuElementState:(int64_t)a3
{
  CRLPlatformControlState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLPlatformControlState;
  result = -[CRLPlatformControlState init](&v5, "init");
  if (result)
    result->mStateValue = a3;
  return result;
}

- (int64_t)stateValue
{
  return self->mStateValue;
}

@end
