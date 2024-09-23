@implementation NSMutableDictionary(SUCoreDictionary)

- (void)setSafeObject:()SUCoreDictionary forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(a1, "setObject:forKey:", v6, v7);
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v8;
        _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreDictionary] set of nil object for key '%{public}@', no change to dictionary", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[NSMutableDictionary(SUCoreDictionary) setSafeObject:forKey:].cold.1(v10);
    }

  }
}

- (void)setSafeObject:()SUCoreDictionary forKey:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B05B8000, log, OS_LOG_TYPE_ERROR, "[SUCoreDictionary] set with key = nil, no change to dictionary", v1, 2u);
}

@end
