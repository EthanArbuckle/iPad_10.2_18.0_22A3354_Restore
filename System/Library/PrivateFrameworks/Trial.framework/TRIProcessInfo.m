@implementation TRIProcessInfo

+ (BOOL)hostingProcessIsTriald
{
  if (qword_1ECED7E90 != -1)
    dispatch_once(&qword_1ECED7E90, &__block_literal_global_17);
  return _MergedGlobals_14;
}

void __40__TRIProcessInfo_hostingProcessIsTriald__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  +[TRIEntitlement applicationBundleIdentifierFromSelf](TRIEntitlement, "applicationBundleIdentifierFromSelf");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.triald"));
  else
    v3 = 0;

  _MergedGlobals_14 = v3;
  objc_autoreleasePoolPop(v0);
}

+ (BOOL)hostingProcessIsTrialdSystem
{
  if (qword_1ECED7E98 != -1)
    dispatch_once(&qword_1ECED7E98, &__block_literal_global_10);
  return byte_1ECED7E89;
}

void __46__TRIProcessInfo_hostingProcessIsTrialdSystem__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  +[TRIEntitlement applicationBundleIdentifierFromSelf](TRIEntitlement, "applicationBundleIdentifierFromSelf");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.triald.system"));
  else
    v3 = 0;

  byte_1ECED7E89 = v3;
  objc_autoreleasePoolPop(v0);
}

+ (BOOL)hostingProcessIsSystemProcess
{
  return getuid() < 0x12D;
}

+ (BOOL)hostingProcessIsCoreAnalytics
{
  if (qword_1ECED7EA0 != -1)
    dispatch_once(&qword_1ECED7EA0, &__block_literal_global_11);
  return byte_1ECED7E8A;
}

void __47__TRIProcessInfo_hostingProcessIsCoreAnalytics__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  +[TRIEntitlement applicationBundleIdentifierFromSelf](TRIEntitlement, "applicationBundleIdentifierFromSelf");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.analyticsd"));
  else
    v3 = 0;

  byte_1ECED7E8A = v3;
  objc_autoreleasePoolPop(v0);
}

@end
