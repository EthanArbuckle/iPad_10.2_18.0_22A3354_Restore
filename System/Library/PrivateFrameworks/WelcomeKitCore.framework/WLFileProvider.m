@implementation WLFileProvider

- (id)fetchRootPath
{
  NSString *rootPath;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  rootPath = self->_rootPath;
  if (rootPath)
    return rootPath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.FileProvider.LocalStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("File Provider Storage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WLLog();
    v7 = 0;
  }
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if ((v10 & 1) == 0)
    {
      _WLLog();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 0, 0, &v14);
      v12 = v14;

      if (v12)
      {
        objc_msgSend(v12, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _WLLog();

      }
      else
      {
        _WLLog();
      }

    }
    -[WLFileProvider setRootPath:](self, "setRootPath:", v8, v13);
  }
  else
  {
    _WLLog();
  }

  return v8;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
}

@end
