@implementation STUManagementUnlockOperation

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
  v12.super_class = (Class)&OBJC_METACLASS___STUManagementUnlockOperation;
  if (!objc_msgSendSuper2(&v12, "validateRequest:error:", v6, a4))
    goto LABEL_7;
  v7 = objc_opt_class(DMFManagementUnlockRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKUnlockRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v10 = CATErrorWithCodeAndUserInfo(2, &off_1000D31F0);
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
  STUManagementUnlockOperation *v7;

  v4 = sub_100025D70();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Unlocking by becoming exclusive", (uint8_t *)&v6, 0xCu);
  }

  -[STUTaskOperation requestToBecomeExclusive](self, "requestToBecomeExclusive");
}

- (void)exclusivityRequestDidComplete:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  STUManagementUnlockOperation *v10;

  v4 = a3;
  if (-[STUManagementUnlockOperation isExecuting](self, "isExecuting"))
  {
    if (-[STUManagementUnlockOperation isCancelled](self, "isCancelled"))
    {
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      -[STUManagementUnlockOperation endOperationWithError:](self, "endOperationWithError:", v6);

    }
    else if (v4)
    {
      -[STUManagementUnlockOperation endOperationWithError:](self, "endOperationWithError:", v4);
    }
    else
    {
      v7 = sub_100025D70();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@: Did become exclusive", (uint8_t *)&v9, 0xCu);
      }

      -[STUManagementUnlockOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

@end
