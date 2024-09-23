@implementation PVAppIdentityLogSystem

void ___PVAppIdentityLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.devicecheck", "pvappidentity");
  v1 = (void *)_PVAppIdentityLogSystem_log;
  _PVAppIdentityLogSystem_log = (uint64_t)v0;

}

@end
