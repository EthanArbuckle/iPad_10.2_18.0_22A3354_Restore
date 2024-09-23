@implementation SCBackgroundSystemTask

- (SCBackgroundSystemTask)init
{
  SCBackgroundSystemTask *v2;
  SCBackgroundSystemTask *v3;
  SCBackgroundSystemTask *v4;
  id v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCBackgroundSystemTask;
  v2 = -[SCBackgroundSystemTask init](&v8, "init");
  v3 = v2;
  if (v2 && !-[SCBackgroundSystemTask _conformsToTaskHandling](v2, "_conformsToTaskHandling"))
  {
    v5 = sub_100002998();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100002A08(v3, v6);

    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)registerForTaskUsingQueue:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = -[SCBackgroundSystemTask isRepeating](self, "isRepeating");
  v9 = (id)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCBackgroundSystemTask identifier](self, "identifier"));
  if (v5)
    v7 = objc_claimAutoreleasedReturnValue(-[SCBackgroundSystemTask repeatingTaskHandler](self, "repeatingTaskHandler"));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[SCBackgroundSystemTask nonRepeatingTaskHandler](self, "nonRepeatingTaskHandler"));
  v8 = (void *)v7;
  objc_msgSend(v9, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v6, v4, v7);

}

- (void)rejectAndCloseTask:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = sub_100002998();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCBackgroundSystemTask identifier](self, "identifier"));
    v11 = 138412802;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "\"SC task %@ will not handle BGST task %@. Reason: %@\", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v6, "setTaskCompleted");

}

- (BOOL)_conformsToTaskHandling
{
  void *v3;
  unsigned int v4;
  char **v5;
  char v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCBackgroundSystemTask identifier](self, "identifier"));

  if (v3)
  {
    v4 = -[SCBackgroundSystemTask isRepeating](self, "isRepeating");
    v5 = &selRef_repeatingTaskHandler;
    if (!v4)
      v5 = &selRef_nonRepeatingTaskHandler;
    v6 = objc_opt_respondsToSelector(self, *v5);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (id)identifier
{
  return 0;
}

- (BOOL)isRepeating
{
  return objc_opt_respondsToSelector(self, "repeatingTaskHandler") & 1;
}

@end
