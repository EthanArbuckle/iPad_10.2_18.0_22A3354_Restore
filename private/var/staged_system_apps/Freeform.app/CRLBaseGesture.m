@implementation CRLBaseGesture

- (CRLBaseGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  id v7;
  CRLBaseGesture *v8;
  CRLBaseGesture *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLBaseGesture;
  v8 = -[CRLBaseGesture init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->mGestureState = 0;
    objc_storeStrong(&v8->mTarget, a3);
    v9->mAction = a4;
  }

  return v9;
}

- (CRLBaseGesture)initWithGestureDispatcher:(id)a3 gestureKind:(id)a4
{
  id v6;
  id v7;
  CRLBaseGesture *v8;
  CRLBaseGesture *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[CRLBaseGesture initWithTarget:action:](self, "initWithTarget:action:", v6, "handleGesture:");
  v9 = v8;
  if (v8)
  {
    -[CRLBaseGesture setGestureDelegate:](v8, "setGestureDelegate:", v6);
    -[CRLBaseGesture setGestureKind:](v9, "setGestureKind:", v7);
    -[CRLBaseGesture setInputType:](v9, "setInputType:", 1);
  }

  return v9;
}

- (CRLBaseGesture)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260598);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLBaseGesture init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBaseGesture.m";
    v17 = 1024;
    v18 = 72;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012605B8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBaseGesture init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBaseGesture.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 72, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLBaseGesture init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)setCachedGestureTarget:(id)a3
{
  objc_storeWeak((id *)&self->mWeaklyCachedGestureTarget, a3);
}

- (id)cachedGestureTarget
{
  return objc_loadWeakRetained((id *)&self->mWeaklyCachedGestureTarget);
}

- (void)gestureBeganAtLocation:(CGPoint)a3
{
  double y;
  double x;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unsigned int v17;

  y = a3.y;
  x = a3.x;
  if (-[CRLBaseGesture gestureState](self, "gestureState"))
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012605D8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38048(v7, self, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012605F8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBaseGesture gestureBeganAtLocation:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBaseGesture.m"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBaseGesture gestureKind](self, "gestureKind"));
    v12 = sub_1002FCE08(-[CRLBaseGesture gestureState](self, "gestureState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 85, 0, "Gesture %@ in invalid state %@", v11, v13);

  }
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBaseGesture gestureDelegate](self, "gestureDelegate"));
  v15 = objc_opt_respondsToSelector(v14, "gestureActionShouldBegin:");

  if ((v15 & 1) != 0
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBaseGesture gestureDelegate](self, "gestureDelegate")),
        v17 = objc_msgSend(v16, "gestureActionShouldBegin:", self),
        v16,
        v17))
  {
    -[CRLBaseGesture setGestureState:](self, "setGestureState:", 1);
    objc_msgSend(self->mTarget, self->mAction, self);
  }
  else
  {
    -[CRLBaseGesture setGestureState:](self, "setGestureState:", 5);
  }
}

- (void)gestureMovedToLocation:(CGPoint)a3
{
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  if (-[CRLBaseGesture isDone](self, "isDone"))
  {
    -[CRLBaseGesture setGestureState:](self, "setGestureState:", 5);
  }
  else
  {
    -[CRLBaseGesture setGestureState:](self, "setGestureState:", 2);
    objc_msgSend(self->mTarget, self->mAction, self);
  }
}

- (void)gestureEndedAtLocation:(CGPoint)a3
{
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  if (-[CRLBaseGesture isDone](self, "isDone"))
  {
    -[CRLBaseGesture setGestureState:](self, "setGestureState:", 5);
  }
  else
  {
    -[CRLBaseGesture setGestureState:](self, "setGestureState:", 3);
    objc_msgSend(self->mTarget, self->mAction, self);
  }
}

- (void)gestureRecognizedAtLocation:(CGPoint)a3
{
  void *v4;
  void *v5;
  unsigned int v6;

  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  if (!-[CRLBaseGesture isDone](self, "isDone"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBaseGesture gestureDelegate](self, "gestureDelegate"));
    if ((objc_opt_respondsToSelector(v4, "gestureActionShouldBegin:") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBaseGesture gestureDelegate](self, "gestureDelegate"));
      v6 = objc_msgSend(v5, "gestureActionShouldBegin:", self);

      if (v6)
      {
        -[CRLBaseGesture setGestureState:](self, "setGestureState:", 3);
        objc_msgSend(self->mTarget, self->mAction, self);
        return;
      }
    }
    else
    {

    }
  }
  -[CRLBaseGesture setGestureState:](self, "setGestureState:", 5);
}

- (void)gestureCancelledAtLocation:(CGPoint)a3
{
  -[CRLBaseGesture setUnscaledLocation:](self, "setUnscaledLocation:", a3.x, a3.y);
  -[CRLBaseGesture setGestureState:](self, "setGestureState:", 4);
  objc_msgSend(self->mTarget, self->mAction, self);
}

- (void)reset
{
  -[CRLBaseGesture setGestureState:](self, "setGestureState:", 0);
}

- (CGPoint)unscaledLocationForICC:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[CRLBaseGesture unscaledLocation](self, "unscaledLocation", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)isDone
{
  return -[CRLBaseGesture gestureState](self, "gestureState") - 3 < 3;
}

- (NSString)description
{
  NSString *mGestureKind;
  __CFString *v4;
  void *v5;
  id mTarget;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;

  mGestureKind = self->mGestureKind;
  v4 = sub_1002FCE08(self->mState);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  mTarget = self->mTarget;
  v7 = NSStringFromSelector(self->mAction);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLDescription descriptionWithObject:format:](CRLDescription, "descriptionWithObject:format:", self, CFSTR(" { gestureKind:%@ state:%@ target:%p action:%@ }"), mGestureKind, v5, mTarget, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "descriptionString"));
  return (NSString *)v10;
}

- (CRLGestureDelegate)gestureDelegate
{
  return (CRLGestureDelegate *)objc_loadWeakRetained((id *)&self->mGestureDelegate);
}

- (void)setGestureDelegate:(id)a3
{
  objc_storeWeak((id *)&self->mGestureDelegate, a3);
}

- (int)gestureState
{
  return self->mState;
}

- (void)setGestureState:(int)a3
{
  self->mState = a3;
}

- (NSString)gestureKind
{
  return self->mGestureKind;
}

- (void)setGestureKind:(id)a3
{
  objc_storeStrong((id *)&self->mGestureKind, a3);
}

- (CRLCanvasRep)targetRep
{
  return self->mTargetRep;
}

- (void)setTargetRep:(id)a3
{
  objc_storeStrong((id *)&self->mTargetRep, a3);
}

- (BOOL)gestureShouldEnd
{
  return self->mGestureShouldEnd;
}

- (void)setGestureShouldEnd:(BOOL)a3
{
  self->mGestureShouldEnd = a3;
}

- (int64_t)inputType
{
  return self->mInputType;
}

- (void)setInputType:(int64_t)a3
{
  self->mInputType = a3;
}

- (int64_t)tsdModifierFlags
{
  return self->mTSDModifierFlags;
}

- (void)setTsdModifierFlags:(int64_t)a3
{
  self->mTSDModifierFlags = a3;
}

- (CGPoint)unscaledLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->mUnscaledLocation.x;
  y = self->mUnscaledLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnscaledLocation:(CGPoint)a3
{
  self->mUnscaledLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetRep, 0);
  objc_storeStrong((id *)&self->mGestureKind, 0);
  objc_destroyWeak((id *)&self->mWeaklyCachedGestureTarget);
  objc_destroyWeak((id *)&self->mGestureDelegate);
  objc_storeStrong(&self->mTarget, 0);
}

@end
