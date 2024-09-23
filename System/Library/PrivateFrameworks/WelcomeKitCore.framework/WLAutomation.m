@implementation WLAutomation

- (void)writeCodeForTestAutomationIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", *MEMORY[0x24BEC28A0]) == 1)
  {
    self->_hasTestAutomationCaches = 1;
    _WLLog();
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", *MEMORY[0x24BEC2858]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v7);

    if ((v10 & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = 0,
          objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 0, 0, &v15),
          v12 = v15,
          v11,
          !v12))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataUsingEncoding:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createFileAtPath:contents:attributes:", v8, v14, 0);

      _WLLog();
    }
    else
    {
      _WLLog();

    }
  }

}

- (void)deleteTestAutomationCachesIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v9;

  if (self->_hasTestAutomationCaches)
  {
    _WLLog();
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", *MEMORY[0x24BEC2858]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      objc_msgSend(v7, "removeItemAtPath:error:", v4, &v9);

      _WLLog();
    }

  }
}

@end
