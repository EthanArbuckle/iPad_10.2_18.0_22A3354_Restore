@implementation DMDFetchAvailableOSUpdatesOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchAvailableOSUpdatesRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2BE0;
}

- (void)runWithRequest:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;

  v5 = a3;
  v6 = ((uint64_t (*)(void))DMFOSUpdateLog)();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetch-available-os-updates starting", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDSUManagerInstallTask sharedInstallTask](DMDSUManagerInstallTask, "sharedInstallTask"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productVersion"));
  v10 = objc_msgSend(v5, "useDelay");

  v11 = ((uint64_t (*)(void))DMFOSUpdateLog)();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("default");
    v14 = CFSTR("NO");
    if (v9)
      v13 = v9;
    if ((_DWORD)v10)
      v14 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "fetch-available-os-updates: product version = %@, use delay = %@", buf, 0x16u);
  }

  v23 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "availableUpdateWithVersion:useDelay:error:", v9, v10, &v23));
  v16 = v23;
  v17 = v16;
  if (v15)
  {
    v18 = objc_msgSend(objc_alloc((Class)DMFFetchAvailableOSUpdatesResultObject), "initWithUpdate:", v15);
    -[DMDFetchAvailableOSUpdatesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v18);

  }
  else
  {
    if (!v16)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDFetchAvailableOSUpdatesOperation.m"), 45, CFSTR("DMDFetchAvailableOSUpdatesOperation: no update returned"));

    }
    v19 = -[DMDFetchAvailableOSUpdatesOperation endOperationWithError:](self, "endOperationWithError:", v17);
  }
  v20 = DMFOSUpdateLog(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "fetch-available-os-updates done", buf, 2u);
  }

}

@end
