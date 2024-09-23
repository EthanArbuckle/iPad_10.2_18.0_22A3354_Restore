@implementation RPImageUtility

+ (id)getImageDataFromExtensionContainingAppBundleUrl:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CGImage *v8;
  __CFData *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v14;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)ISIcon), "initWithURL:", v3);

  v6 = (void *)objc_opt_new(ISImageDescriptor, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageForImageDescriptor:", v6));
  v8 = (CGImage *)objc_msgSend(v7, "CGImage");
  if (v8)
  {
    v14 = 0;
    v9 = sub_10003F358(v8, 0, CFSTR("public.png"), &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v14)
    {
      v12 = v10;
    }
    else
    {
      if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100051728();
      v12 = 0;
    }

  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000516B0();
    v12 = 0;
  }

  return v12;
}

@end
