@implementation NSURL(RCAdditions)

- (id)rc_URLByAppendingStringToLastComponentBasename:()RCAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)rc_URLByReplacingPathExtensionWithExtension:()RCAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "URLByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathExtension:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rc_URLByStandardizingResolvedPath
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v3, 0);

  if (v4)
  {
    objc_msgSend(a1, "URLByResolvingSymlinksInPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByStandardizingPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByResolvingSymlinksInPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByStandardizingPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
