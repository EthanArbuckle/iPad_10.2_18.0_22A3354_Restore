@implementation PKIsSRD

uint64_t __PKIsSRD_block_invoke()
{
  uint64_t result;
  io_object_t v1;
  const __CFData *CFProperty;
  const __CFData *v3;
  CFTypeID v4;

  result = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/chosen");
  if ((_DWORD)result)
  {
    v1 = result;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(result, CFSTR("research-enabled"), 0, 0);
    if (CFProperty)
    {
      v3 = CFProperty;
      v4 = CFGetTypeID(CFProperty);
      if (v4 == CFDataGetTypeID() && CFDataGetLength(v3) == 4)
        byte_1ECF21C7D = *(_DWORD *)CFDataGetBytePtr(v3) == 1;
      CFRelease(v3);
    }
    return IOObjectRelease(v1);
  }
  return result;
}

@end
