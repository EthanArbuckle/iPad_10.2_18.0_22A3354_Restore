@implementation PVDeviceCharacteristics

+ (void)Initialize
{
  if (+[PVDeviceCharacteristics Initialize]::onceToken != -1)
    dispatch_once(&+[PVDeviceCharacteristics Initialize]::onceToken, &__block_literal_global_9);
}

void __37__PVDeviceCharacteristics_Initialize__block_invoke()
{
  int v0;
  void *v1;
  id v2;
  uint64_t i;
  uint64_t v4;
  size_t v5;
  _OWORD v6[3];
  int v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v7 = 0x1800000006;
  v5 = 8;
  sysctl(v7, 2u, &s_actualMemory, &v5, 0, 0);
  if (s_actualMemory <= 0x20000000)
    s_isLowMem = 1;
  v4 = 0;
  v5 = 4;
  sysctlbyname("hw.cputype", (char *)&v4 + 4, &v5, 0, 0);
  v5 = 4;
  sysctlbyname("hw.cpusubtype", &v4, &v5, 0, 0);
  if (HIDWORD(v4) == 16777228)
  {
    v0 = 3;
  }
  else if (HIDWORD(v4) == 12)
  {
    if ((v4 - 9) >= 5)
      v0 = 1;
    else
      v0 = dword_1B304F360[(int)v4 - 9];
  }
  else
  {
    v0 = 5;
  }
  s_architectureType = v0;
  v6[0] = xmmword_1E64D5CF0;
  v6[1] = *(_OWORD *)&off_1E64D5D00;
  v6[2] = xmmword_1E64D5D10;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  s_hasExtendedColorDisplay = objc_msgSend(v1, "_supportsDeepColor");

  v2 = MTLCreateSystemDefaultDevice();
  s_colorSyncCapable = objc_msgSend(v2, "supportsFamily:", 1002);

  for (i = 40; i != -8; i -= 8)
}

+ (int64_t)actualMemory
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_actualMemory;
}

+ (BOOL)isLowMemDevice
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_isLowMem;
}

+ (int)architectureType
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_architectureType;
}

+ (BOOL)hasExtendedColorDisplay
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_hasExtendedColorDisplay;
}

+ (BOOL)colorSyncCapable
{
  objc_msgSend((id)objc_opt_class(), "Initialize");
  return s_colorSyncCapable;
}

@end
