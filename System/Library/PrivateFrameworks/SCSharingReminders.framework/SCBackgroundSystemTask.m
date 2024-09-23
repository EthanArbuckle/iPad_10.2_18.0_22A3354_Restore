@implementation SCBackgroundSystemTask

- (SCBackgroundSystemTask)init
{
  SCBackgroundSystemTask *v2;
  SCBackgroundSystemTask *v3;
  SCBackgroundSystemTask *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCBackgroundSystemTask;
  v2 = -[SCBackgroundSystemTask init](&v7, sel_init);
  v3 = v2;
  if (v2 && !-[SCBackgroundSystemTask _conformsToTaskHandling](v2, "_conformsToTaskHandling"))
  {
    SCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCBackgroundSystemTask init].cold.1(v3, v5);

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
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[SCBackgroundSystemTask isRepeating](self, "isRepeating");
  objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SCBackgroundSystemTask identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SCBackgroundSystemTask repeatingTaskHandler](self, "repeatingTaskHandler");
  else
    -[SCBackgroundSystemTask nonRepeatingTaskHandler](self, "nonRepeatingTaskHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v6, v4, v7);

}

- (void)rejectAndCloseTask:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SCLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[SCBackgroundSystemTask identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_error_impl(&dword_2454C0000, v8, OS_LOG_TYPE_ERROR, "\"SC task %@ will not handle BGST task %@. Reason: %@\", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(v6, "setTaskCompleted");

}

- (BOOL)_conformsToTaskHandling
{
  void *v3;
  char v4;

  -[SCBackgroundSystemTask identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SCBackgroundSystemTask isRepeating](self, "isRepeating");
    v4 = objc_opt_respondsToSelector();
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)identifier
{
  return 0;
}

- (BOOL)isRepeating
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)init
{
  void *v4;
  int v5;
  const __CFString *v6;
  int v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "isRepeating");
  v6 = CFSTR("handleNonRepeatingTask");
  if (v5)
    v6 = CFSTR("handleRepeatingTask");
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_2454C0000, a2, OS_LOG_TYPE_ERROR, "\"Couldn't initialize task for identifier %@ and/or selector %@\", (uint8_t *)&v7, 0x16u);

}

@end
