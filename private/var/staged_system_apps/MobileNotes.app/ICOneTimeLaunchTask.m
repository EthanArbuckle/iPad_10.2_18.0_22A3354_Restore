@implementation ICOneTimeLaunchTask

- (void)runLaunchTask
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimeLaunchTask taskIdentifier](self, "taskIdentifier"));
  v4 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100405130((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", v3);

  v13 = os_log_create("com.apple.notes", "LaunchTask");
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if ((v12 & 1) != 0)
  {
    if (v14)
      sub_100405068((uint64_t)v3, v13, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    if (v14)
      sub_1004050CC((uint64_t)v3, v13, v15, v16, v17, v18, v19, v20);

    -[ICOneTimeLaunchTask runOneTimeLaunchTask](self, "runOneTimeLaunchTask");
    v13 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[NSObject setBool:forKey:](v13, "setBool:forKey:", 1, v3);
  }

}

- (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

@end
