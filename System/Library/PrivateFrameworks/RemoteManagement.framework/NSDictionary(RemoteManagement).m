@implementation NSDictionary(RemoteManagement)

- (uint64_t)rm_atomicWriteToURL:()RemoteManagement error:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  v6 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a1, 100, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    v9 = objc_msgSend(v7, "rm_atomicWriteToURL:error:", v6, a4);
  }
  else
  {
    +[RMLog nsdictionary_rm](RMLog, "nsdictionary_rm");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NSDictionary(RemoteManagement) rm_atomicWriteToURL:error:].cold.1((uint64_t)v8, v10);

    v9 = 0;
    if (a4 && v8)
    {
      v9 = 0;
      *a4 = objc_retainAutorelease(v8);
    }
  }

  return v9;
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21885E000, a2, OS_LOG_TYPE_ERROR, "Failed to convert to plist: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
