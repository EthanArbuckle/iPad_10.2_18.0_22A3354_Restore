@implementation PLGetCPUFamily

uint64_t __PLGetCPUFamily_block_invoke()
{
  size_t v1;

  v1 = 4;
  return sysctlbyname("hw.cpufamily", &PLGetCPUFamily_cpu_type, &v1, 0, 0);
}

@end
