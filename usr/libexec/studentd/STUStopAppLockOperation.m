@implementation STUStopAppLockOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___STUStopAppLockOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(DMFStopAppLockRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKStopAppLockRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D3740);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v10);
        goto LABEL_8;
      }
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)requireLoggedInUser
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  STUStopAppLockOperation *v7;

  v4 = a3;
  if (qword_1000FC348 != -1)
    dispatch_once(&qword_1000FC348, &stru_1000CAB00);
  v5 = qword_1000FC340;
  if (os_log_type_enabled((os_log_t)qword_1000FC340, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Stopping app lock by becoming exclusive", (uint8_t *)&v6, 0xCu);
  }
  -[STUTaskOperation requestToBecomeExclusive](self, "requestToBecomeExclusive");

}

- (void)exclusivityRequestDidComplete:(id)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[STUStopAppLockOperation isExecuting](self, "isExecuting");
  v5 = v8;
  if (v4)
  {
    if (-[STUStopAppLockOperation isCancelled](self, "isCancelled"))
    {
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[STUStopAppLockOperation endOperationWithError:](self, "endOperationWithError:", v7);

    }
    else if (v8)
    {
      -[STUStopAppLockOperation endOperationWithError:](self, "endOperationWithError:", v8);
    }
    else
    {
      -[STUStopAppLockOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
    v5 = v8;
  }

}

@end
