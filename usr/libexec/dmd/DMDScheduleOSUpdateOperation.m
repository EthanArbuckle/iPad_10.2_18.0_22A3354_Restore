@implementation DMDScheduleOSUpdateOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFScheduleOSUpdateRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C3030;
}

- (void)endOperationWithWrongProductKey:(id)a3 action:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = objc_alloc((Class)DMFScheduleOSUpdateResultObject);
  v8 = DMFErrorWithCodeAndUserInfo(2213, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "initWithAction:productKey:error:", a4, v6, v9);

  -[DMDScheduleOSUpdateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v10);
}

- (void)runWithRequest:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  unsigned __int8 v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  unsigned __int8 v29;
  void *v30;
  DMDScheduleOSUpdateOperation *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  DMDScheduleOSUpdateOperation *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;

  v5 = a3;
  v6 = DMFOSUpdateLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "schedule-os-update starting, request = %{public}@", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDSUManagerInstallTask sharedInstallTask](DMDSUManagerInstallTask, "sharedInstallTask"));
  v44 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentStatusWithError:", &v44));
  v10 = v44;
  v11 = (unint64_t)objc_msgSend(v5, "action");
  if (v11 == 2)
    v11 = objc_msgSend(v9, "isDownloadComplete");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productKey"));
  v13 = objc_msgSend((id)objc_opt_class(v8), "productKeyFromStatus:", v9);
  v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_msgSend((id)objc_opt_class(v8), "defaultProductKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (!v12
    || (objc_msgSend(v12, "isEqualToString:", v16) & 1) != 0
    || !v14
    || (v17 = objc_msgSend(v12, "isEqualToString:", v14), (v17 & 1) != 0))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productVersion", v16));
    v18 = objc_msgSend(v5, "useDelay");
    v38 = self;
    v39 = v9;
    if (v11 == 1)
    {
      v27 = DMFOSUpdateLog(v18);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "schedule-os-update install action", buf, 2u);
      }

      v41 = v10;
      v29 = objc_msgSend(v8, "startInstallWithError:", &v41);
      v26 = v41;

      v22 = 0;
      v23 = 0;
      v10 = v26;
      if ((v29 & 1) == 0)
        goto LABEL_26;
    }
    else if (v11)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v31 = self;
      v26 = v30;
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v31, CFSTR("DMDScheduleOSUpdateOperation.m"), 115, CFSTR("unexpected action value"));
      v22 = 0;
      v23 = v10;
    }
    else
    {
      v19 = v18;
      v20 = DMFOSUpdateLog(v18);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "schedule-os-update download action", buf, 2u);
      }

      v43 = v10;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "availableUpdateWithVersion:useDelay:error:", v40, v19, &v43));
      v23 = v43;

      if (v22)
      {
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "productKey"));

        v42 = v23;
        v25 = objc_msgSend(v8, "startDownloadWithError:", &v42);
        v26 = v42;

        if ((v25 & 1) == 0)
        {
          v14 = (id)v24;
          v10 = v26;
          goto LABEL_26;
        }
        v23 = 0;
        v14 = (id)v24;
      }
      else
      {
        v26 = v14;
        v14 = v12;
      }
    }

    v10 = v23;
LABEL_26:
    v34 = objc_msgSend(objc_alloc((Class)DMFScheduleOSUpdateResultObject), "initWithAction:productKey:error:", v11, v14, v10);
    v35 = DMFOSUpdateLog(-[DMDScheduleOSUpdateOperation endOperationWithResultObject:](v38, "endOperationWithResultObject:", v34));
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v34;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "schedule-os-update done, result = %{public}@", buf, 0xCu);
    }

    v9 = v39;
    v16 = v37;
    goto LABEL_29;
  }
  v32 = DMFOSUpdateLog(v17);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "schedule-os-update wrong product key", buf, 2u);
  }

  -[DMDScheduleOSUpdateOperation endOperationWithWrongProductKey:action:](self, "endOperationWithWrongProductKey:action:", v12, v11);
LABEL_29:

}

@end
