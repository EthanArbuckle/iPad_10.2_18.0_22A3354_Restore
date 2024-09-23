@implementation TelephonyBasebandControllerLoadConfig

uint64_t ___TelephonyBasebandControllerLoadConfig_block_invoke(uint64_t a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  CFTypeRef CFProperty;
  const void *v7;
  CFTypeID v8;
  uint64_t result;
  char v10;
  CFRange v11;

  _TelephonyUtilDebugPrint();
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceNameMatching("baseband");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService
    || (v5 = MatchingService,
        (CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("config"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0)) == 0))
  {
    result = _TelephonyUtilDebugPrintError();
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v7 = CFProperty;
  v8 = CFGetTypeID(CFProperty);
  if (v8 != CFDataGetTypeID())
  {
    _TelephonyUtilDebugPrintError();
    CFRelease(v7);
    result = IOObjectRelease(v5);
    goto LABEL_8;
  }
  if (CFDataGetLength((CFDataRef)v7) <= 23)
  {
    _TelephonyUtilDebugPrint();
  }
  else
  {
    v11.location = 0;
    v11.length = 24;
    CFDataGetBytes((CFDataRef)v7, v11, (UInt8 *)&sTelephonyBasebandControllerBasebandConfiguration);
  }
  CFRelease(v7);
  result = IOObjectRelease(v5);
  v10 = 1;
LABEL_9:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
  return result;
}

@end
