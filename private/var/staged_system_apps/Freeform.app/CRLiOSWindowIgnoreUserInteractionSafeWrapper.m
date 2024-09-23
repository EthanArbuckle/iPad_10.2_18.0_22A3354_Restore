@implementation CRLiOSWindowIgnoreUserInteractionSafeWrapper

- (CRLiOSWindowIgnoreUserInteractionSafeWrapper)initWithWindowWrapper:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v8;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSWindowIgnoreUserInteractionSafeWrapper;
  v8 = -[CRLiOSWindowIgnoreUserInteractionSafeWrapper init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowWrapper, v6);
    objc_storeStrong((id *)&v9->_token, a4);
  }

  return v9;
}

- (void)dealloc
{
  unint64_t v3;
  unint64_t v4;
  id WeakRetained;
  id v6;
  objc_super v7;
  _QWORD block[2];
  uint64_t (**(*v9)(uint64_t))(void);
  void *v10;
  CRLTraceableResourceToken *v11;
  id v12;
  id v13;

  v3 = self->_token;
  v4 = (unint64_t)objc_retainBlock(self->_operationCompletionHandler);
  if (v3 | v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowWrapper);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    v9 = sub_10047BDF4;
    v10 = &unk_101239130;
    v13 = (id)v4;
    v11 = (CRLTraceableResourceToken *)(id)v3;
    v12 = WeakRetained;
    v6 = WeakRetained;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
      v9((uint64_t)block);
    else
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSWindowIgnoreUserInteractionSafeWrapper;
  -[CRLiOSWindowIgnoreUserInteractionSafeWrapper dealloc](&v7, "dealloc");
}

- (void)endIgnoringUserInteractionSafely
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  CRLTraceableResourceToken *token;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260AE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38804();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260B00);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowIgnoreUserInteractionSafeWrapper endIgnoringUserInteractionSafely]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowIgnoreUserInteractionSafeWrapper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 50, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLiOSWindowIgnoreUserInteractionSafeWrapper resumeIgnoringUserInteractionSafely](self, "resumeIgnoringUserInteractionSafely");
  if (self->_token)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowWrapper);
    objc_msgSend(WeakRetained, "endIgnoringUserInteractionWithToken:", self->_token);
    objc_storeWeak((id *)&self->_windowWrapper, 0);
    token = self->_token;
    self->_token = 0;

  }
}

- (void)resumeIgnoringUserInteractionSafely
{
  void *v3;
  void *v4;
  void *v5;
  void (**operationCompletionHandler)(void);
  id v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260B20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38888();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260B40);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSWindowIgnoreUserInteractionSafeWrapper resumeIgnoringUserInteractionSafely]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSWindowIgnoreUserInteractionSafeWrapper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 63, 0, "This operation must only be performed on the main thread.");

  }
  operationCompletionHandler = (void (**)(void))self->_operationCompletionHandler;
  if (operationCompletionHandler)
  {
    operationCompletionHandler[2]();
    v7 = self->_operationCompletionHandler;
  }
  else
  {
    v7 = 0;
  }
  self->_operationCompletionHandler = 0;

}

- (NSString)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> token=%@"), v5, self, self->_token));

  return (NSString *)v6;
}

- (void)addBreadcrumb:(id)a3
{
  -[CRLTraceableResourceToken addBreadcrumb:](self->_token, "addBreadcrumb:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_windowWrapper);
}

@end
