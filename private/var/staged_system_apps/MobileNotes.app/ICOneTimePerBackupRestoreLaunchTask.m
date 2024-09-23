@implementation ICOneTimePerBackupRestoreLaunchTask

- (void)runLaunchTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerBackupRestoreLaunchTask completionFileName](self, "completionFileName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICPaths applicationDocumentsURL](ICPaths, "applicationDocumentsURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v3, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  v9 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v23 = (void *)v22;
    v24 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v27 = v3;
    v28 = 2112;
    if (v8)
      v24 = CFSTR("YES");
    v29 = v22;
    v30 = 2112;
    v31 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Running %@ if necessary. Checking file at URL %@, File Exist ? %@", buf, 0x20u);

  }
  v10 = os_log_create("com.apple.notes", "LaunchTask");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v11)
      sub_100405068((uint64_t)v3, v10, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    if (v11)
      sub_1004050CC((uint64_t)v3, v10, v12, v13, v14, v15, v16, v17);

    -[ICOneTimePerBackupRestoreLaunchTask runOneTimePerBackupRestoreLaunchTask](self, "runOneTimePerBackupRestoreLaunchTask");
    v18 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    objc_msgSend((id)v18, "createFileAtPath:contents:attributes:", v19, v20, 0);

    v25 = 0;
    LOBYTE(v18) = objc_msgSend(v5, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, &v25);
    v10 = v25;
    if ((v18 & 1) == 0)
    {
      v21 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100405520((uint64_t)v5, (uint64_t)v10, v21);

    }
  }

}

- (id)completionFileName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerBackupRestoreLaunchTask taskIdentifier](self, "taskIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("completionOfPerBackupRestoreLaunchTask_%@"), v2));

  return v3;
}

- (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

@end
