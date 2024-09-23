@implementation TelephonyBasebandControllerIsBootStageDown

uint64_t __TelephonyBasebandControllerIsBootStageDown_block_invoke()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  uint64_t result;

  v0 = 0;
  v1 = *MEMORY[0x24BDD8B18];
  while (1)
  {
    v2 = IOServiceMatching((&_block_invoke_sVariantMap)[v0]);
    result = IOServiceGetMatchingService(v1, v2);
    if ((_DWORD)result)
      break;
    v0 += 2;
    if (v0 == 6)
      return result;
  }
  qword_253D92518 = (uint64_t)&(&_block_invoke_sVariantMap)[v0];
  return IOObjectRelease(result);
}

@end
