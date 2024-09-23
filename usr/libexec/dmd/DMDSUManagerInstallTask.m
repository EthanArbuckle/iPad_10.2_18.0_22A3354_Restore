@implementation DMDSUManagerInstallTask

+ (DMDSUManagerInstallTask)sharedInstallTask
{
  if (qword_1000EBAA0 != -1)
    dispatch_once(&qword_1000EBAA0, &stru_1000BBD20);
  return (DMDSUManagerInstallTask *)(id)qword_1000EBA98;
}

+ (NSString)defaultProductKey
{
  return (NSString *)CFSTR("OSUpdate");
}

+ (id)_dmfStatusErrorFromSUStatusError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSErrorUserInfoKey v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v10 = NSUnderlyingErrorKey;
    v11 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v6 = DMFErrorWithCodeAndUserInfo(0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v8 = DMFErrorWithCodeAndUserInfo(0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

+ (id)productKeyFromStatus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "productBuildVersion"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultProductKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)productKeyOrDefaultFromStatus:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "productKeyFromStatus:", a3));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultProductKey"));
  v7 = v6;

  return v7;
}

- (BOOL)removeUpdateWithError:(id *)a3
{
  return 0;
}

- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  return 0;
}

- (BOOL)startInstallWithError:(id *)a3
{
  return 0;
}

- (id)currentStatusWithError:(id *)a3
{
  return 0;
}

@end
