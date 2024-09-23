@implementation RMSandbox

+ (BOOL)configureSandbox
{
  void *v2;
  id v3;
  char v4;
  NSObject *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");

  v4 = _set_user_dir_suffix();
  if ((v4 & 1) == 0)
  {
    +[RMLog sandbox](RMLog, "sandbox");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[RMSandbox configureSandbox].cold.1(v5);

  }
  return v4;
}

+ (id)tokenForURL:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v3 = sandbox_extension_issue_file();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    free(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (int64_t)consumeToken:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  return sandbox_extension_consume();
}

+ (void)releaseToken:(int64_t)a3
{
  sandbox_extension_release();
}

+ (void)configureSandbox
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_21885E000, a1, OS_LOG_TYPE_FAULT, "Failed to initialize sandbox: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

@end
