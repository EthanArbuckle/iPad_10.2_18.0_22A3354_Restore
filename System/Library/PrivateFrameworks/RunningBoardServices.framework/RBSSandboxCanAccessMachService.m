@implementation RBSSandboxCanAccessMachService

uint64_t __RBSSandboxCanAccessMachService_block_invoke()
{
  uint64_t result;

  getpid();
  objc_msgSend(CFSTR("com.apple.runningboard"), "UTF8String");
  result = sandbox_check();
  RBSSandboxCanAccessMachService_canAccess = (_DWORD)result == 0;
  return result;
}

@end
