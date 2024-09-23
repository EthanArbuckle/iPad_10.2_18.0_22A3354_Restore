@implementation DebugUtil

+ (BOOL)isDebugEnabled
{
  if ((objc_msgSend(a1, "isInternalInstall") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "is17Net");
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global);
  return isInternalInstall_isInternalInstall;
}

void __30__DebugUtil_isInternalInstall__block_invoke(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  isInternalInstall_isInternalInstall = objc_msgSend(v1, "fileExistsAtPath:", CFSTR("/AppleInternal"));

}

+ (BOOL)is17Net
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getIPAddress"));
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("17.")))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(".")));
    v4 = objc_msgSend(v3, "count") == &dword_4;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)getIPAddress
{
  int v2;
  void *v3;
  ifaddrs *v4;
  void *v5;
  unsigned int v6;
  in_addr v7;
  NSString *v8;
  uint64_t v9;
  ifaddrs *v11;

  v11 = 0;
  v2 = getifaddrs(&v11);
  v3 = 0;
  v4 = v11;
  if (!v2 && v11)
  {
    v3 = 0;
    do
    {
      if (v4->ifa_addr->sa_family == 2)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4->ifa_name));
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("en0"));

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", inet_ntoa(v7));
          v9 = objc_claimAutoreleasedReturnValue(v8);

          v3 = (void *)v9;
        }
      }
      v4 = v4->ifa_next;
    }
    while (v4);
    v4 = v11;
  }
  freeifaddrs(v4);
  return v3;
}

+ (id)applicationDocumentsDirectory
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

+ (id)allViewControllers
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedApplicationIfPossible"));
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        objc_msgSend(v3, "addObject:", v7);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));

        v7 = (void *)v8;
      }
      while (v8);
    }

  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return v3;
}

+ (id)sharedApplicationIfPossible
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
