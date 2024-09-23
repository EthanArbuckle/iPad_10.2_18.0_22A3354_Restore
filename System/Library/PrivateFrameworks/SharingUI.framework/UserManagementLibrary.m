@implementation UserManagementLibrary

void *__UserManagementLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  UserManagementLibrary_sLib = (uint64_t)result;
  return result;
}

@end
