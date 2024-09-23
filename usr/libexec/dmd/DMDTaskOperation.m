@implementation DMDTaskOperation

- (void)dealloc
{
  OS_os_transaction *v3;
  dispatch_time_t v4;
  OS_os_transaction *v5;
  objc_super v6;
  _QWORD block[4];
  OS_os_transaction *v8;

  v3 = self->_transaction;
  v4 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_4;
  block[3] = &unk_1000BA4B0;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)DMDTaskOperation;
  -[DMDTaskOperation dealloc](&v6, "dealloc");
}

- (DMDTaskOperation)initWithRequest:(id)a3
{
  DMDTaskOperation *v3;
  id v4;
  uint64_t v5;
  OS_os_transaction *transaction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMDTaskOperation;
  v3 = -[DMDTaskOperation initWithRequest:](&v8, "initWithRequest:", a3);
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v3)));
    v5 = os_transaction_create(objc_msgSend(v4, "UTF8String"));
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;

  }
  return v3;
}

- (void)operationWillStart
{
  objc_super v3;
  uint8_t buf[4];
  DMDTaskOperation *v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Operation will start: %{public}@", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)DMDTaskOperation;
  -[DMDTaskOperation operationWillStart](&v3, "operationWillStart");
}

- (void)operationWillFinish
{
  objc_super v3;
  uint8_t buf[4];
  DMDTaskOperation *v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Operation will finish: %{public}@", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)DMDTaskOperation;
  -[DMDTaskOperation operationWillFinish](&v3, "operationWillFinish");
  -[DMDTaskOperation setTransaction:](self, "setTransaction:", 0);
}

- (void)operationDidFinish
{
  objc_super v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_100079B14((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)DMDTaskOperation;
  -[DMDTaskOperation operationDidFinish](&v3, "operationDidFinish");
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  objc_super v12;
  uint64_t v13;
  const __CFString *v14;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___DMDTaskOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "whitelistedClassesForRequest"));
  v8 = objc_msgSend(v7, "containsObject:", objc_opt_class(v6));

  if ((v8 & 1) == 0)
  {
    if (!a4)
      goto LABEL_7;
    v13 = DMFInvalidParameterErrorKey;
    v14 = CFSTR("request");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v10 = DMFErrorWithCodeAndUserInfo(1, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v10);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  id v4;

  if (-[DMDTaskOperation runOnMainThread](self, "runOnMainThread")
    && !+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[DMDTaskOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, -[DMDTaskOperation isAsynchronous](self, "isAsynchronous") ^ 1);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation request](self, "request"));
    -[DMDTaskOperation runWithRequest:](self, "runWithRequest:", v4);

  }
}

+ (NSArray)requiredEntitlements
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSSet)whitelistedClassesForRequest
{
  return 0;
}

- (unint64_t)queueGroup
{
  return 0;
}

- (BOOL)runConcurrently
{
  return 0;
}

- (BOOL)runOnMainThread
{
  return 0;
}

- (void)runWithRequest:(id)a3
{
  -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 4);
}

- (void)endOperationWithDMFErrorCode:(int64_t)a3
{
  uint64_t v4;
  id v5;

  v4 = DMFErrorWithCodeAndUserInfo(a3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[DMDTaskOperation endOperationWithError:](self, "endOperationWithError:", v5);

}

- (DMDTaskOperationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (DMDConfigurationEngine)configurationEngine
{
  return self->_configurationEngine;
}

- (void)setConfigurationEngine:(id)a3
{
  objc_storeStrong((id *)&self->_configurationEngine, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_configurationEngine, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
