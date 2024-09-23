@implementation CRLiOSWindowWrapper

- (CRLiOSWindowWrapper)initWithWindow:(id)a3
{
  id v4;
  CRLiOSWindowWrapper *v5;
  CRLiOSWindowWrapper *v6;
  CRLTraceableResource *v7;
  CRLTraceableResource *userInteractionIgnoredTraceableResource;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSWindowWrapper;
  v5 = -[CRLiOSWindowWrapper init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_window, v4);
    v7 = -[CRLTraceableResource initWithName:logContext:]([CRLTraceableResource alloc], "initWithName:logContext:", CFSTR("CRLiOSWindowWrapper.UserInteraction"), 0);
    userInteractionIgnoredTraceableResource = v6->_userInteractionIgnoredTraceableResource;
    v6->_userInteractionIgnoredTraceableResource = v7;

  }
  return v6;
}

+ (id)windowWrapperForView:(id)a3 assert:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLiOSWindowWrapper *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;

  v4 = a4;
  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012348E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5770();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234908);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSWindowWrapper windowWrapperForView:assert:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 33, 0, "This operation must only be performed on the main thread.");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  if (!v9)
  {
    v10 = 0;
LABEL_18:
    if (v4)
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234948);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
        sub_100DF5670((uint64_t)v5, v11, v12);

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234968);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLiOSWindowWrapper windowWrapperForView:assert:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"));
      if (v5)
      {
        v17 = (objc_class *)objc_opt_class(v5, v15);
        v18 = NSStringFromClass(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v16, 53, 0, "Could not find scene wrapper for view <%{public}@: %{public}p>", v19, v5);

      }
      else
      {
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v16, 53, 0, "Could not find scene wrapper for view <%{public}@: %{public}p>", CFSTR("Nil"), 0);
      }

      v10 = 0;
    }
    goto LABEL_31;
  }
  if (qword_101414D70 != -1)
    dispatch_once(&qword_101414D70, &stru_101234928);
  v10 = (CRLiOSWindowWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101414D68, "objectForKey:", v9));
  if (!v10)
  {
    v10 = -[CRLiOSWindowWrapper initWithWindow:]([CRLiOSWindowWrapper alloc], "initWithWindow:", v9);
    objc_msgSend((id)qword_101414D68, "setObject:forKey:", v10, v9);
    if (!v10)
      goto LABEL_18;
  }
LABEL_31:

  return v10;
}

- (id)beginIgnoringUserInteraction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t userInteractionIgnoredCount;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234988);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5870();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012349A8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper beginIgnoringUserInteraction]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 60, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTraceableResource willAcquireResourceWithIntent:timeout:parent:context:](self->_userInteractionIgnoredTraceableResource, "willAcquireResourceWithIntent:timeout:parent:context:", CFSTR("IgnoreUserInteraction"), 10, 0, 0));
  userInteractionIgnoredCount = self->_userInteractionIgnoredCount;
  if (!userInteractionIgnoredCount)
  {
    if (self->_suspendUserInteractionIgnoredCount)
    {
      userInteractionIgnoredCount = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowWrapper window](self, "window"));
      v9 = objc_msgSend(v8, "isUserInteractionEnabled");

      if ((v9 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012349C8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF57F0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012349E8);
        v10 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper beginIgnoringUserInteraction]"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 67, 0, "userInteraction should be enabled when _userInteractionEnabledCount = 0");

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowWrapper window](self, "window"));
      objc_msgSend(v13, "setUserInteractionEnabled:", 0);

      userInteractionIgnoredCount = self->_userInteractionIgnoredCount;
    }
  }
  self->_userInteractionIgnoredCount = userInteractionIgnoredCount + 1;
  -[CRLTraceableResource didAcquireResourceWithToken:](self->_userInteractionIgnoredTraceableResource, "didAcquireResourceWithToken:", v6);
  return v6;
}

- (void)endIgnoringUserInteractionWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t userInteractionIgnoredCount;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234A08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5970();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234A28);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper endIgnoringUserInteractionWithToken:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 80, 0, "This operation must only be performed on the main thread.");

  }
  userInteractionIgnoredCount = self->_userInteractionIgnoredCount;
  if (userInteractionIgnoredCount)
  {
    v9 = userInteractionIgnoredCount - 1;
    self->_userInteractionIgnoredCount = v9;
    if (!v9)
    {
LABEL_13:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowWrapper window](self, "window"));
      objc_msgSend(v10, "setUserInteractionEnabled:", 1);

    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234A48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF58F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234A68);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowWrapper endIgnoringUserInteractionWithToken:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowWrapper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 85, 0, "Called endIgnoringUserInteractionWithToken without matching beginIgnoringUserInteraction");

    if (!self->_userInteractionIgnoredCount)
      goto LABEL_13;
  }
  -[CRLTraceableResource didRelinquishResourceWithToken:](self->_userInteractionIgnoredTraceableResource, "didRelinquishResourceWithToken:", v4);

}

- (id)newWrapperBeginningIgnoringUserInteractionSafely
{
  void *v3;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowWrapper beginIgnoringUserInteraction](self, "beginIgnoringUserInteraction"));
  v4 = -[CRLiOSWindowIgnoreUserInteractionSafeWrapper initWithWindowWrapper:token:]([CRLiOSWindowIgnoreUserInteractionSafeWrapper alloc], "initWithWindowWrapper:token:", self, v3);

  return v4;
}

- (BOOL)isInSplitViewMode
{
  void *v3;
  void *v4;
  double Width;
  void *v6;
  double v7;
  CGRect v9;
  CGRect v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowWrapper window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v9);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowWrapper window](self, "window"));
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetWidth(v10);

  return Width - v7 >= 100.0;
}

- (int64_t)interfaceOrientation
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowWrapper window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 <= v7)
    return 1;
  else
    return 4;
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_userInteractionIgnoredTraceableResource, 0);
}

@end
