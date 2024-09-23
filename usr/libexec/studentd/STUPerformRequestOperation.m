@implementation STUPerformRequestOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___STUPerformRequestOperation;
  if (objc_msgSendSuper2(&v9, "validateRequest:error:", v6, a4))
    v7 = objc_msgSend(objc_msgSend(a1, "validationClassForRequest:", v6), "validateRequest:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (STUPerformRequestOperation)initWithRequest:(id)a3 session:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUPerformRequestOperation *v12;
  STUPerformRequestOperation *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPerformRequestOperation.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPerformRequestOperation.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUPerformRequestOperation.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)STUPerformRequestOperation;
  v12 = -[STUPerformRequestOperation initWithRequest:](&v18, "initWithRequest:", v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mSession, a4);
    objc_storeStrong((id *)&v13->mContext, a5);
  }

  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUPerformRequestOperation;
  -[STUPerformRequestOperation cancel](&v4, "cancel");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000685F4;
  v3[3] = &unk_1000C97E8;
  v3[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v3);
}

- (void)main
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100068664;
  v2[3] = &unk_1000C97E8;
  v2[4] = self;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v2);
}

- (void)taskOperationDidProgress:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = -[STUPerformRequestOperation totalUnitCount](self, "totalUnitCount");
  if (v4 != objc_msgSend(v6, "totalUnitCount"))
    -[STUPerformRequestOperation setTotalUnitCount:](self, "setTotalUnitCount:", objc_msgSend(v6, "totalUnitCount"));
  v5 = -[STUPerformRequestOperation completedUnitCount](self, "completedUnitCount");
  if (v5 != objc_msgSend(v6, "completedUnitCount"))
    -[STUPerformRequestOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount"));

}

- (void)taskOperationDidFinish:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  CATTaskSession *mSession;
  void *v10;
  void *v11;
  void *v12;
  CATTaskSession *v13;
  void *v14;
  int v15;
  CATTaskSession *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  v6 = sub_100068820();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      mSession = self->mSession;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "verboseDescription"));
      v15 = 138543874;
      v16 = mSession;
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TASK SESSION OPERATION FAILED %{public}@ %{public}@ %{public}@", (uint8_t *)&v15, 0x20u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));
    -[STUPerformRequestOperation endOperationWithError:](self, "endOperationWithError:", v12);
  }
  else
  {
    if (v8)
    {
      v13 = self->mSession;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultObject"));
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TASK SESSION OPERATION FINISHED %{public}@ %{public}@ %{public}@", (uint8_t *)&v15, 0x20u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resultObject"));
    -[STUPerformRequestOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v12);
  }

}

- (id)enqueueOperationWithError:(id *)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v19;
  void *v20;

  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformRequestOperation request](self, "request"));
  v7 = (objc_class *)objc_msgSend(v5, "validationClassForRequest:", v6);

  v8 = [v7 alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformRequestOperation request](self, "request"));
  v10 = objc_msgSend(v8, "initWithRequest:context:delegate:", v9, self->mContext, self);

  if (v10)
  {
    -[CATTaskSession enqueueOperation:](self->mSession, "enqueueOperation:", v10);
    v11 = v10;
  }
  else if (a3)
  {
    v19 = CFSTR("kCATErrorRequestNameKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUPerformRequestOperation request](self, "request"));
    v13 = (objc_class *)objc_opt_class(v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v20 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v17 = CATErrorWithCodeAndUserInfo(403, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v17);

  }
  return v10;
}

+ (Class)validationClassForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  __objc2_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v11;
  NSString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSString *v18;
  Class v19;

  v3 = a3;
  v4 = objc_opt_class(CRKLockRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = STUManagementLockOperation;
LABEL_7:
    v8 = objc_opt_class(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    goto LABEL_8;
  }
  v6 = objc_opt_class(CRKUnlockRequest);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
  {
    v5 = STUManagementUnlockOperation;
    goto LABEL_7;
  }
  v7 = objc_opt_class(CRKLogOutUserRequest);
  if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0)
  {
    v5 = STULogoutUserOperation;
    goto LABEL_7;
  }
  v11 = (objc_class *)objc_opt_class(v3);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (objc_msgSend(v13, "hasSuffix:", CFSTR("Request"))
    && ((objc_msgSend(v13, "hasPrefix:", CFSTR("CRK")) & 1) != 0
     || objc_msgSend(v13, "hasPrefix:", CFSTR("DMF"))))
  {
    v14 = objc_msgSend(v13, "rangeOfString:options:", CFSTR("Request"), 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", v14, v15, CFSTR("Operation")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringFromIndex:", 3));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("STU%@"), v17));

    v19 = NSClassFromString(v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v19);

  }
  else
  {
    v9 = 0;
  }

LABEL_8:
  return (Class)v9;
}

- (void)processNotificationWithName:(id)a3 userInfo:(id)a4
{
  -[CATTaskOperation processNotificationWithName:userInfo:](self->mOperation, "processNotificationWithName:userInfo:", a3, a4);
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  -[STUPerformRequestOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", a4, a5);
}

- (void)taskOperation:(id)a3 needsToEnqueueOperation:(id)a4
{
  -[CATTaskSession enqueueOperation:](self->mSession, "enqueueOperation:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContext, 0);
  objc_storeStrong((id *)&self->mOperation, 0);
  objc_storeStrong((id *)&self->mSession, 0);
}

@end
