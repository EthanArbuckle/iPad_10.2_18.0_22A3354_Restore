@implementation STULogoutUserOperation

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
  v12.super_class = (Class)&OBJC_METACLASS___STULogoutUserOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(DMFLogOutUserRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKLogOutUserRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D3330);
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

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STULogoutUserOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STULogoutUserOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "logoutDidCompleteWithError:", 0, 0);
}

- (void)exclusivityRequestDidComplete:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  STULogoutUserOperation *v11;

  v4 = a3;
  if (-[STULogoutUserOperation isExecuting](self, "isExecuting"))
  {
    if (-[STULogoutUserOperation isCancelled](self, "isCancelled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STULogoutUserOperation endOperationWithError:](self, "endOperationWithError:", v6);
LABEL_9:

      goto LABEL_10;
    }
    if (!v4)
    {
      v7 = sub_10002B004();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Switching to login user", buf, 0xCu);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10002B044;
      v9[3] = &unk_1000CA240;
      v9[4] = self;
      objc_msgSend(v6, "switchToLoginUserWithCompletionHandler:", v9);
      goto LABEL_9;
    }
    -[STULogoutUserOperation endOperationWithError:](self, "endOperationWithError:", v4);
  }
LABEL_10:

}

- (void)logoutDidCompleteWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  STULogoutUserOperation *v10;

  v4 = a3;
  if (-[STULogoutUserOperation isExecuting](self, "isExecuting"))
  {
    if (-[STULogoutUserOperation isCanceled](self, "isCanceled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STULogoutUserOperation endOperationWithError:](self, "endOperationWithError:", v6);

    }
    else if (v4)
    {
      -[STULogoutUserOperation endOperationWithError:](self, "endOperationWithError:", v4);
    }
    else
    {
      v7 = sub_10002B004();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: User switch did start", (uint8_t *)&v9, 0xCu);
      }

      -[STULogoutUserOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

@end
