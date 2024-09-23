@implementation NSProcessInfo

void __46__NSProcessInfo_ICAdditions__ic_isCloudDaemon__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  ic_isCloudDaemon_sIsCloudDaemon = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.itunescloudd"));

}

@end
