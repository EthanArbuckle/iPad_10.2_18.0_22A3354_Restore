@implementation DMDFetchOSUpdateStatusOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchOSUpdateStatusRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2CE8;
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23[2];
  id v24;
  NSErrorUserInfoKey v25;
  void *v26;

  v4 = DMFOSUpdateLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "fetch-os-update-status starting", (uint8_t *)v23, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDSUManagerInstallTask sharedInstallTask](DMDSUManagerInstallTask, "sharedInstallTask"));
  v24 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentStatusWithError:", &v24));
  v8 = v24;
  v9 = v8;
  if (v7)
  {
    v10 = objc_msgSend((id)objc_opt_class(v6), "productKeyOrDefaultFromStatus:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v23[0] = 0.0;
    v12 = -[DMDFetchOSUpdateStatusOperation _downloadStatusAndPercentComplete:fromStatus:](self, "_downloadStatusAndPercentComplete:fromStatus:", v23, v7);
    v13 = objc_alloc((Class)DMFFetchOSUpdateStatusResultObject);
    v14 = objc_msgSend(v13, "initWithProductKey:status:downloadPercentComplete:", v11, v12, v23[0]);
    -[DMDFetchOSUpdateStatusOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v14);

    v16 = DMFOSUpdateLog(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "fetch-os-update-status done", (uint8_t *)v23, 2u);
    }
  }
  else
  {
    v18 = DMFOSUpdateLog(v8);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000770F8((uint64_t)v9, v19);

    if (v9)
    {
      v25 = NSUnderlyingErrorKey;
      v26 = v9;
      v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v20 = DMFErrorWithCodeAndUserInfo(0, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[DMDFetchOSUpdateStatusOperation endOperationWithError:](self, "endOperationWithError:", v21);

    }
    else
    {
      v22 = DMFErrorWithCodeAndUserInfo(0, 0);
      v17 = objc_claimAutoreleasedReturnValue(v22);
      -[DMDFetchOSUpdateStatusOperation endOperationWithError:](self, "endOperationWithError:", v17);
    }
  }

}

- (unint64_t)_downloadStatusAndPercentComplete:(double *)a3 fromStatus:(id)a4
{
  id v5;
  double v6;
  unint64_t v7;
  double v8;

  v5 = a4;
  v6 = 1.0;
  if ((objc_msgSend(v5, "isInstalling") & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v5, "isDownloadComplete") & 1) != 0)
  {
    v7 = 0;
  }
  else if (objc_msgSend(v5, "isDownloading"))
  {
    objc_msgSend(v5, "downloadPercentComplete");
    v6 = v8;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v6 = 0.0;
  }
  *a3 = v6;

  return v7;
}

@end
