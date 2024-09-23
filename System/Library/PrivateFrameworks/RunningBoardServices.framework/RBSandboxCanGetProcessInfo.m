@implementation RBSandboxCanGetProcessInfo

uint64_t __RBSandboxCanGetProcessInfo_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  RBSandboxCanGetProcessInfo_allowed = (_DWORD)result == 0;
  return result;
}

@end
