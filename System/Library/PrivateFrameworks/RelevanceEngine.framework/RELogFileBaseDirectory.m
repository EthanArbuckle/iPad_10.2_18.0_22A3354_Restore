@implementation RELogFileBaseDirectory

void __RELogFileBaseDirectory_block_invoke()
{
  int IsRelevanced;
  void *v1;
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  IsRelevanced = REProcessIsRelevanced();
  NSHomeDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (IsRelevanced)
    v3 = CFSTR("Library/Logs/CrashReporter/");
  else
    v3 = CFSTR("Library/Logs/CrashReporter/DiagnosticLogs/RelevanceEngine/");
  objc_msgSend(v1, "stringByAppendingPathComponent:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)RELogFileBaseDirectory_BaseDirectory;
  RELogFileBaseDirectory_BaseDirectory = v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", RELogFileBaseDirectory_BaseDirectory);

  if ((v7 & 1) != 0)
  {
    RELogFileBaseDirectory_ValidDirectory = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", RELogFileBaseDirectory_BaseDirectory);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      getpid();
      v10 = objc_retainAutorelease(v9);
      v16 = objc_msgSend(v10, "fileSystemRepresentation");
      v11 = sandbox_check();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", RELogFileBaseDirectory_BaseDirectory, 1, 0, &v17);
        v14 = v17;
        RELogFileBaseDirectory_ValidDirectory = v13;

        RELogForDomain(5);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v14;
          _os_log_impl(&dword_2132F7000, v15, OS_LOG_TYPE_DEFAULT, "Unable to write file %@", buf, 0xCu);
        }

      }
    }
  }
}

@end
