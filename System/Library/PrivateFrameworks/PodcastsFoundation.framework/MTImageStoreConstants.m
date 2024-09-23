@implementation MTImageStoreConstants

+ (id)fileExtension
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(a1, "fileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEC530]);

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("jpg");
  }
  else
  {
    objc_msgSend(a1, "fileType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFilenameExtension");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)fileType
{
  return (id)*MEMORY[0x1E0CEC580];
}

+ (id)defaultImageStoreURL
{
  void *v2;
  void *v3;

  +[MTConstants sharedCacheDirectory](MTConstants, "sharedCacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("IMImageStore-Default"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)deprecatedImageStoreURL
{
  void *v2;
  void *v3;

  +[MTConstants sharedContainerURL](MTConstants, "sharedContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("IMImageStore-Default"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)imagePathForPodcastUuid:(id)a3 relativeToURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("jpg"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
