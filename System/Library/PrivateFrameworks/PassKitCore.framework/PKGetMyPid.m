@implementation PKGetMyPid

uint64_t __PKGetMyPid_block_invoke()
{
  uint64_t result;

  result = getpid();
  dword_1ECF21C90 = result;
  return result;
}

@end
