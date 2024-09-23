@implementation NFProductSupportsAC

uint64_t __NFProductSupportsAC_block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;

  v0 = *MEMORY[0x1E0CBBAA8];
  v1 = IOServiceNameMatching("AppleHammerfestSPMI");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
    byte_1ECFF698C = 1;
  return IOObjectRelease(MatchingService);
}

@end
