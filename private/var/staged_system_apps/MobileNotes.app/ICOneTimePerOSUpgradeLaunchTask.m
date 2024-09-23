@implementation ICOneTimePerOSUpgradeLaunchTask

- (void)runLaunchTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  char *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerOSUpgradeLaunchTask lastRunOSVersion](self, "lastRunOSVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerOSUpgradeLaunchTask taskKey](self, "taskKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_AttemptCounter"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (char *)objc_msgSend(v6, "integerForKey:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerOSUpgradeLaunchTask currentOSVersion](self, "currentOSVersion"));
  if ((objc_msgSend(v8, "isEqualToString:", v3) & 1) != 0)
  {
    v9 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v19 = objc_opt_class(self);
      v20 = 2112;
      v21 = v3;
      v22 = 2112;
      v23 = (uint64_t)v8;
      v24 = 2112;
      v25 = (uint64_t)v4;
      v10 = "Already ran one time per upgrade launch task %@ (last=%@ current=%@, taskKey=%@)";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, buf, 0x2Au);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
  v12 = (char *)objc_msgSend(v11, "launchTaskMaxRetries");

  if (v7 >= v12)
  {
    v9 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      v19 = (uint64_t)v7;
      v20 = 2048;
      v21 = v12;
      v22 = 2112;
      v23 = (uint64_t)v5;
      v24 = 2112;
      v25 = objc_opt_class(self);
      v10 = "Reached maximum attempts (%lu/%lu/%@) to run one time per upgrade launch task (%@)";
      goto LABEL_13;
    }
LABEL_16:

    goto LABEL_17;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v14 = v7 + 1;
  objc_msgSend(v13, "setInteger:forKey:", v14, v5);

  v15 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    v19 = (uint64_t)v14;
    v20 = 2048;
    v21 = v12;
    v22 = 2112;
    v23 = objc_opt_class(self);
    v24 = 2112;
    v25 = (uint64_t)v3;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Attempt %lu/%lu to run one time per upgrade launch task (%@) (last=%@ current=%@)", buf, 0x34u);
  }

  v16 = -[ICOneTimePerOSUpgradeLaunchTask runOneTimePerUpgradeLaunchTask](self, "runOneTimePerUpgradeLaunchTask");
  v17 = os_log_create("com.apple.notes", "LaunchTask");
  v9 = v17;
  if (!v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10040A848((uint64_t)self, v9);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_10040A7C8((uint64_t)self, v9);

  v9 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  -[NSObject setObject:forKey:](v9, "setObject:forKey:", v8, v4);
LABEL_17:

}

- (NSString)lastRunOSVersion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerOSUpgradeLaunchTask taskKey](self, "taskKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", v2));

  return (NSString *)v4;
}

- (NSString)currentOSVersion
{
  void *v2;
  void *v3;
  __int128 v5;

  v5 = 0uLL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");
  else
    v5 = 0uLL;

  return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld-%ld-%ld"), v5, 0));
}

- (id)taskKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerOSUpgradeLaunchTask taskIdentifier](self, "taskIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OSVersionStringOfLastRun_%@"), v2));

  return v3;
}

- (BOOL)runOneTimePerUpgradeLaunchTask
{
  return 0;
}

- (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

@end
