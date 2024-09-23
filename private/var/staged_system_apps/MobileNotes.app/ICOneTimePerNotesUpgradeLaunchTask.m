@implementation ICOneTimePerNotesUpgradeLaunchTask

- (ICOneTimePerNotesUpgradeLaunchTask)init
{
  ICOneTimePerNotesUpgradeLaunchTask *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICOneTimePerNotesUpgradeLaunchTask;
  v2 = -[ICOneTimePerNotesUpgradeLaunchTask init](&v4, "init");
  if (v2)
    v2->_currentNotesVersion = (int64_t)+[ICCloudSyncingObject currentNotesVersion](ICCloudSyncingObject, "currentNotesVersion");
  return v2;
}

- (NSString)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (NSString)lastRunNotesVersionKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerNotesUpgradeLaunchTask taskIdentifier](self, "taskIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NotesVersionOfLastRun_%@"), v2));

  return (NSString *)v3;
}

- (int64_t)lastRunNotesVersion
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerNotesUpgradeLaunchTask lastRunNotesVersionKey](self, "lastRunNotesVersionKey"));
  v5 = objc_msgSend(v3, "integerForKey:", v4);

  return (int64_t)v5;
}

- (void)setLastRunNotesVersion:(int64_t)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerNotesUpgradeLaunchTask lastRunNotesVersionKey](self, "lastRunNotesVersionKey"));
  objc_msgSend(v6, "setInteger:forKey:", a3, v5);

}

- (void)runLaunchTask
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v3 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerNotesUpgradeLaunchTask taskIdentifier](self, "taskIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[ICOneTimePerNotesUpgradeLaunchTask lastRunNotesVersion](self, "lastRunNotesVersion")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[ICOneTimePerNotesUpgradeLaunchTask currentNotesVersion](self, "currentNotesVersion")));
    *(_DWORD *)buf = 138413314;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v23 = 2080;
    v22 = v6;
    v24 = "-[ICOneTimePerNotesUpgradeLaunchTask runLaunchTask]";
    v25 = 1024;
    v26 = 49;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Running launch tasks for Notes versions… {taskIdentifier: %@, lastRunNotesVersion: %@, currentNotesVersion: %@}%s:%d", buf, 0x30u);

  }
  if (-[ICOneTimePerNotesUpgradeLaunchTask lastRunNotesVersion](self, "lastRunNotesVersion") <= 7)
  {
    v7 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100404EB4(self);

    -[ICOneTimePerNotesUpgradeLaunchTask setLastRunNotesVersion:](self, "setLastRunNotesVersion:", 8);
  }
  v8 = -[ICOneTimePerNotesUpgradeLaunchTask lastRunNotesVersion](self, "lastRunNotesVersion");
  v9 = -[ICOneTimePerNotesUpgradeLaunchTask currentNotesVersion](self, "currentNotesVersion");
  v10 = -[ICOneTimePerNotesUpgradeLaunchTask lastRunNotesVersion](self, "lastRunNotesVersion");
  v11 = -[ICOneTimePerNotesUpgradeLaunchTask currentNotesVersion](self, "currentNotesVersion");
  if (v8 >= v9)
  {
    if (v10 == v11)
    {
      v15 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_100404DAC(self);
    }
    else
    {
      v16 = -[ICOneTimePerNotesUpgradeLaunchTask lastRunNotesVersion](self, "lastRunNotesVersion");
      if (v16 <= -[ICOneTimePerNotesUpgradeLaunchTask currentNotesVersion](self, "currentNotesVersion"))
        return;
      v15 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100404E28(self, v15);
    }

  }
  else if (v10 < v11)
  {
    do
    {
      ++v10;
      v12 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICOneTimePerNotesUpgradeLaunchTask taskIdentifier](self, "taskIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Running launch task for Notes version… {taskIdentifier: %@, notesVersion: %@}", buf, 0x16u);

      }
      -[ICOneTimePerNotesUpgradeLaunchTask runTaskForNotesVersion:](self, "runTaskForNotesVersion:", v10);
      -[ICOneTimePerNotesUpgradeLaunchTask setLastRunNotesVersion:](self, "setLastRunNotesVersion:", v10);
    }
    while (v10 < -[ICOneTimePerNotesUpgradeLaunchTask currentNotesVersion](self, "currentNotesVersion"));
  }
}

- (int64_t)currentNotesVersion
{
  return self->_currentNotesVersion;
}

- (void)setCurrentNotesVersion:(int64_t)a3
{
  self->_currentNotesVersion = a3;
}

@end
