@implementation TYLogger

+ (void)logToSTDERR:(BOOL)a3
{
  _logToSTDERR = a3;
}

+ (void)logToFile:(BOOL)a3
{
  _logToFile = a3;
}

+ (id)openLogFile:(id)a3 inDirectory:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v7;
  v12 = v11;
  if (!objc_msgSend(v11, "length"))
  {
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v12, "stringByAppendingPathComponent:", v6);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }

  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_Console-%@.log"), v6, v10);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Console-%@.log"), v10, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "openLogFile:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)openLogFile:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v3 = a3;
  if (!v3)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v3, &v14);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "createFileAtPath:contents:attributes:", v3, v8, 0);

  v10 = 0;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_logFileHandle;
    _logFileHandle = v11;

    if (_logFileHandle)
    {
      v10 = v3;
      goto LABEL_8;
    }
LABEL_7:
    v10 = 0;
  }
LABEL_8:

  return v10;
}

+ (void)closeLogFile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  if (_logFileHandle)
  {
    TYLog(CFSTR("Closing log file"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
    objc_msgSend((id)_logFileHandle, "closeFile");
    v8 = (void *)_logFileHandle;
    _logFileHandle = 0;

  }
}

@end
