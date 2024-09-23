@implementation DMDRemoveOSUpdateOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRemoveOSUpdateRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2FA0;
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[8];
  id v17;
  uint8_t buf[16];

  v4 = DMFOSUpdateLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove-os-update starting", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDSUManagerInstallTask sharedInstallTask](DMDSUManagerInstallTask, "sharedInstallTask"));
  v17 = 0;
  v7 = objc_msgSend(v6, "removeUpdateWithError:", &v17);
  v8 = v17;
  v9 = DMFOSUpdateLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "remove-os-update successful", v16, 2u);
    }

    v12 = -[DMDRemoveOSUpdateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100079704((uint64_t)v8, v11);

    v12 = -[DMDRemoveOSUpdateOperation endOperationWithError:](self, "endOperationWithError:", v8);
  }
  v13 = DMFOSUpdateLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "remove-os-update done", v15, 2u);
  }

}

@end
