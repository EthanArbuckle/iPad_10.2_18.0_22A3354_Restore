@implementation STUConnectWithoutBeaconAssertionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUConnectWithoutBeaconAssertionOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKConnectWithoutBeaconAssertionRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D33F8);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUConnectWithoutBeaconAssertionOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUConnectWithoutBeaconAssertionOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "endOperationIfNeeded", 0, 0);
}

- (void)endOperationIfNeeded
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  STUConnectWithoutBeaconAssertionOperation *v14;
  __int16 v15;
  void *v16;

  if (-[STUConnectWithoutBeaconAssertionOperation isExecuting](self, "isExecuting"))
  {
    v3 = sub_100031440();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionIdentifier"));
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: Releasing connect without beacon assertion for %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessionIdentifier"));
    objc_msgSend(v8, "releaseConnectWithoutBeaconAssertionForSessionIdentifier:", v10);

    v11 = CATErrorWithCodeAndUserInfo(404, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[STUConnectWithoutBeaconAssertionOperation endOperationWithError:](self, "endOperationWithError:", v12);

  }
}

- (void)runWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  STUConnectWithoutBeaconAssertionOperation *v13;
  __int16 v14;
  void *v15;

  v4 = sub_100031440();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionIdentifier"));
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: Acquiring connect without beacon assertion for %{public}@", (uint8_t *)&v12, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sessionIdentifier"));
  objc_msgSend(v9, "acquireConnectWithoutBeaconAssertionForSessionIdentifier:", v11);

}

@end
