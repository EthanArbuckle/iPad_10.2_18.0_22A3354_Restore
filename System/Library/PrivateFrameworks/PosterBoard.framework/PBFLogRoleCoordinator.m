@implementation PBFLogRoleCoordinator

void __PBFLogRoleCoordinator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "RoleCoordinator");
  v1 = (void *)PBFLogRoleCoordinator___logObj;
  PBFLogRoleCoordinator___logObj = (uint64_t)v0;

}

@end
