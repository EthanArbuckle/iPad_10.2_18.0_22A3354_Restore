@implementation RBSSandboxCanGetMachTaskName

uint64_t ___RBSSandboxCanGetMachTaskName_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  _RBSSandboxCanGetMachTaskName_allowed = (_DWORD)result == 0;
  return result;
}

@end
