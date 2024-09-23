@implementation MISLaunchWarningDatabase

- (id)queryForBundle:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  MISLaunchWarningQueryResult *v9;
  const char *v10;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend_queryAppBundle_error_(v6, v7, (uint64_t)v5, (uint64_t)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = [MISLaunchWarningQueryResult alloc];
    v8 = (void *)objc_msgSend_initWithWarningState_withUserOverridden_withKBURL_(v9, v10, 0, 0, 0);
  }

  return v8;
}

- (id)queryForExecutableURL:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  MISLaunchWarningQueryResult *v9;
  const char *v10;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend_queryExecutableURL_error_(v6, v7, (uint64_t)v5, (uint64_t)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = [MISLaunchWarningQueryResult alloc];
    v8 = (void *)objc_msgSend_initWithWarningState_withUserOverridden_withKBURL_(v9, v10, 0, 0, 0);
  }

  return v8;
}

- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 withError:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v14;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    v8 = (void *)objc_opt_new();
    v14 = 0;
    objc_msgSend_setUserOverride_forBundle_error_(v8, v9, v6, (uint64_t)v7, &v14);
    v10 = v14;
    v11 = v10;
    v12 = v10 == 0;
    if (a5 && v10)
      *a5 = objc_retainAutorelease(v10);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

@end
