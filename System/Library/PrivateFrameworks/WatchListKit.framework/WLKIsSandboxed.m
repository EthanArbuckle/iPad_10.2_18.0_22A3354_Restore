@implementation WLKIsSandboxed

uint64_t __WLKIsSandboxed_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  WLKIsSandboxed_retVal = (_DWORD)result != 0;
  return result;
}

@end
