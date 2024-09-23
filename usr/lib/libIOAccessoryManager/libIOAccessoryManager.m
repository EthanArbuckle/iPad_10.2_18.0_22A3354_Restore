uint64_t IOAccessoryManagerGetServiceWithPrimaryPort(int a1)
{
  __CFDictionary *v1;
  const __CFAllocator *v2;
  CFDictionaryRef v3;
  void *values;
  void *keys;
  int valuePtr;

  valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryManager");
  keys = CFSTR("IOAccessoryPrimaryDevicePort");
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v3 = CFDictionaryCreate(v2, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v1, CFSTR("IOPropertyMatch"), v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v1);
}

uint64_t IOAccessoryManagerGetServiceWithSupportedFeature(const char *a1)
{
  __CFDictionary *v2;
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFTypeRef cf;
  void *keys;

  v2 = IOServiceMatching("IOAccessoryManager");
  keys = CFSTR("FeaturesSupported");
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, 0x8000100u);
  v4 = CFDictionaryCreate(v3, (const void **)&keys, &cf, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v2, CFSTR("IOPropertyExistsMatch"), v4);
  CFRelease(v4);
  CFRelease(keys);
  CFRelease(cf);
  return IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v2);
}

const __CFNumber *IOAccessoryManagerGetPrimaryPort(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryPrimaryDevicePort"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *IOAccessoryManagerGetType(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryManagerType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

uint64_t IOAccessoryManagerGetUpstreamService(uint64_t a1)
{
  uint64_t v2;
  kern_return_t ParentEntry;
  kern_return_t v4;
  io_registry_entry_t v6;
  io_registry_entry_t parent;

  IOObjectRetain(a1);
  v2 = a1;
  while (!IORegistryEntryInPlane(v2, "IOAccessory"))
  {
    parent = -1431655766;
    ParentEntry = IORegistryEntryGetParentEntry(v2, "IOService", &parent);
    IOObjectRelease(v2);
    v2 = parent;
    if (ParentEntry)
      return 0;
  }
  while ((_DWORD)v2 == (_DWORD)a1 || !IOObjectConformsTo(v2, "IOAccessoryManager"))
  {
    v6 = -1431655766;
    v4 = IORegistryEntryGetParentEntry(v2, "IOAccessory", &v6);
    IOObjectRelease(v2);
    v2 = v6;
    if (v4)
      return 0;
  }
  return v2;
}

uint64_t IOAccessoryManagerGetUpstreamPrimaryPort(uint64_t a1)
{
  uint64_t result;
  io_object_t v2;
  const __CFNumber *PrimaryPort;

  result = IOAccessoryManagerGetUpstreamService(a1);
  if ((_DWORD)result)
  {
    v2 = result;
    PrimaryPort = IOAccessoryManagerGetPrimaryPort(result);
    IOObjectRelease(v2);
    return (uint64_t)PrimaryPort;
  }
  return result;
}

uint64_t IOAccessoryManagerGetAccessoryID(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  uint64_t result;
  unsigned int valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  result = 0xFFFFFFFFLL;
  valuePtr = -1;
  if (CFProperty)
  {
    if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr))
      valuePtr = -1;
    CFRelease(CFProperty);
    return valuePtr;
  }
  return result;
}

CFTypeRef IOAccessoryManagerCopyAccessoryDeviceUID(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryManagerAccessoryDeviceUID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t IOAccessoryManagerGetDigitalID(io_registry_entry_t a1, UInt8 *a2)
{
  const __CFAllocator *v4;
  const __CFData *CFProperty;
  uint64_t v6;
  const __CFData *v7;
  const __CFData *v8;
  CFRange v10;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryDigitalID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v8 = CFProperty;
    v10.location = 0;
    v10.length = 6;
    CFDataGetBytes(CFProperty, v10, a2);
    v6 = 0;
LABEL_7:
    CFRelease(v8);
    return v6;
  }
  v6 = 3758097095;
  if ((IOAccessoryManagerGetType(a1) & 0xF) != 0)
  {
    v7 = (const __CFData *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryDetect"), v4, 0);
    v8 = v7;
    v6 = v7 == (const __CFData *)*MEMORY[0x24BDBD270] ? 3758097112 : 3758097113;
    if (v7)
      goto LABEL_7;
  }
  return v6;
}

uint64_t IOAccesoryManagerGetDigitalIDInterfaceDeviceInfo(io_registry_entry_t a1, UInt8 *a2)
{
  const __CFData *CFProperty;
  const __CFData *v5;
  uint64_t result;
  unsigned int v7;
  int v8;
  __int16 v9;
  CFRange v10;

  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryInterfaceDeviceInfo"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v10.location = 0;
    v10.length = 4;
    CFDataGetBytes(CFProperty, v10, a2);
    CFRelease(v5);
    return 0;
  }
  else
  {
    v9 = -21846;
    v8 = -1431655766;
    LODWORD(result) = IOAccessoryManagerGetDigitalID(a1, (UInt8 *)&v8);
    if (v8 >= 0x40u)
      v7 = -536870194;
    else
      v7 = -536870160;
    if ((_DWORD)result)
      return result;
    else
      return v7;
  }
}

uint64_t checkIDBusAvailable(io_registry_entry_t a1, int a2)
{
  uint64_t result;
  int v4;
  __int16 v5;

  v5 = -21846;
  v4 = -1431655766;
  result = IOAccessoryManagerGetDigitalID(a1, (UInt8 *)&v4);
  if (!(_DWORD)result)
  {
    result = 3758097102;
    if (v4 <= 0x3Fu)
    {
      if (a2 && (v4 & 0x300) == 0)
        return 3758097126;
      else
        return 3758097136;
    }
  }
  return result;
}

uint64_t IOAccesoryManagerGetDigitalIDAccessoryVersionInfo(io_registry_entry_t a1, UInt8 *a2)
{
  const __CFData *CFProperty;
  const __CFData *v5;
  CFRange v7;

  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryAccessoryVersionInfo"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
    return checkIDBusAvailable(a1, 1);
  v5 = CFProperty;
  v7.location = 0;
  v7.length = 6;
  CFDataGetBytes(CFProperty, v7, a2);
  CFRelease(v5);
  return 0;
}

uint64_t IOAccessoryManagerCopyDeviceInfo(io_registry_entry_t entry, int a2, _QWORD *a3)
{
  int v3;
  int v6;
  const __CFString *v7;
  uint64_t result;
  CFTypeRef CFProperty;
  CFTypeRef v10;

  v3 = a2 - 1;
  v6 = 0;
  v7 = CFSTR("IOAccessoryInterfaceDeviceSerialNumber");
  switch(v3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      v6 = 0;
      v7 = CFSTR("IOAccessoryInterfaceModuleSerialNumber");
      goto LABEL_11;
    case 2:
      v6 = 0;
      v7 = CFSTR("IOAccessoryAccessorySerialNumber");
      goto LABEL_11;
    case 3:
      v6 = 1;
      v7 = CFSTR("IOAccessoryAccessoryManufacturer");
      goto LABEL_11;
    case 4:
      v6 = 1;
      v7 = CFSTR("IOAccessoryAccessoryName");
      goto LABEL_11;
    case 5:
      v6 = 1;
      v7 = CFSTR("IOAccessoryAccessoryModelNumber");
      goto LABEL_11;
    case 6:
      v6 = 1;
      v7 = CFSTR("IOAccessoryAccessoryFirmwareVersion");
      goto LABEL_11;
    case 7:
      v6 = 1;
      v7 = CFSTR("IOAccessoryAccessoryHardwareVersion");
      goto LABEL_11;
    case 8:
      v6 = 1;
      v7 = CFSTR("IOAccessoryAccessoryPPID");
LABEL_11:
      CFProperty = IORegistryEntryCreateCFProperty(entry, v7, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      if (CFProperty)
      {
        v10 = CFProperty;
        result = 0;
        *a3 = v10;
      }
      else
      {
        result = checkIDBusAvailable(entry, v6);
      }
      break;
    default:
      result = 3758097090;
      break;
  }
  return result;
}

const __CFNumber *IOAccessoryManagerGetPowerMode(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryPowerMode"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *IOAccessoryManagerGetActivePowerMode(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryActivePowerMode"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *IOAccessoryManagerGetSleepPowerCurrentLimit(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessorySleepPowerCurrentLimit"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (result)
  {
    v2 = result;
    valuePtr = -1431655766;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

BOOL IOAccessoryManagerGetPowerDuringSleep(io_registry_entry_t a1)
{
  CFTypeRef CFProperty;
  CFTypeRef v2;
  CFTypeRef v3;

  CFProperty = IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryManagerSleepPower"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v2 = CFProperty;
  v3 = (CFTypeRef)*MEMORY[0x24BDBD270];
  if (CFProperty)
    CFRelease(CFProperty);
  return v2 == v3;
}

uint64_t IOAccessoryManagerGetUSBConnectType(io_registry_entry_t a1, int *a2, BOOL *a3)
{
  uint64_t v5;
  const __CFNumber *Value;
  int v7;
  int v8;
  int valuePtr;
  CFMutableDictionaryRef properties;

  properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  v5 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!(_DWORD)v5)
  {
    if (a2)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, CFSTR("IOAccessoryUSBConnectType"));
      valuePtr = -1431655766;
      if (Value)
      {
        v7 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        v8 = valuePtr;
        if (!v7)
          v8 = -1;
      }
      else
      {
        v8 = -1;
      }
      *a2 = v8;
    }
    if (a3)
      *a3 = CFDictionaryGetValue(properties, CFSTR("IOAccessoryUSBActive")) == (const void *)*MEMORY[0x24BDBD270];
    CFRelease(properties);
  }
  return v5;
}

uint64_t IOAccessoryManagerGetUSBConnectTypePublished(io_registry_entry_t a1, int *a2, BOOL *a3)
{
  uint64_t v5;
  const __CFNumber *Value;
  int v7;
  int v8;
  int valuePtr;
  CFMutableDictionaryRef properties;

  properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  v5 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!(_DWORD)v5)
  {
    if (a2)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, CFSTR("IOAccessoryUSBConnectTypePublished"));
      valuePtr = -1431655766;
      if (Value)
      {
        v7 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        v8 = valuePtr;
        if (!v7)
          v8 = -1;
      }
      else
      {
        v8 = -1;
      }
      *a2 = v8;
    }
    if (a3)
      *a3 = CFDictionaryGetValue(properties, CFSTR("IOAccessoryUSBActive")) == (const void *)*MEMORY[0x24BDBD270];
    CFRelease(properties);
  }
  return v5;
}

uint64_t IOAccessoryManagerGetUSBChargingVoltage(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;

  v3 = 3758097113;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryUSBChargingVoltage"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2))
      v3 = 0;
    else
      *a2 = 0;
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerGetUSBCurrentLimit(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;

  v3 = 3758097113;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryUSBCurrentLimit"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2))
      v3 = 0;
    else
      *a2 = 0;
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitBase(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerRestoreUSBCurrentLimitBase(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 4u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitBase(io_registry_entry_t a1, void *a2)
{
  uint64_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;

  v3 = 3758097113;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryUSBCurrentLimitBase"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2))
      v3 = 0;
    else
      v3 = 3758097113;
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentOffset(mach_port_t a1, int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitOffset(io_registry_entry_t a1, void *a2)
{
  uint64_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;

  v3 = 3758097136;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryUSBCurrentLimitOffset"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2))
      v3 = 0;
    else
      v3 = 3758097136;
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitMaximum(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 6u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerClearUSBCurrentLimitMaximum(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 7u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitMaximum(io_registry_entry_t a1, void *a2)
{
  uint64_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;

  v3 = 3758097136;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryUSBCurrentLimitMaximum"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2))
      v3 = 0;
    else
      v3 = 3758097136;
    CFRelease(v5);
  }
  return v3;
}

uint64_t IOAccessoryManagerConfigurePower(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerConfigurePowerLowVoltageSelect(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0x11u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetPowerDuringSleep(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerRequestAccessoryPowerOff(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0x12u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerRevokeFeatures(mach_port_t a1, unsigned int a2)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = 0;
  input[1] = a2;
  return IOConnectCallScalarMethod(a1, 0xDu, input, 2u, 0, 0);
}

uint64_t IOAccessoryManagerAllowFeatures(mach_port_t a1, unsigned int a2)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = 0;
  return IOConnectCallScalarMethod(a1, 0xDu, input, 2u, 0, 0);
}

uint64_t IOAccessoryManagerRevokeHighCurrentPower(mach_port_t a1)
{
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2 = xmmword_20D647A80;
  return IOConnectCallScalarMethod(a1, 0xDu, (const uint64_t *)&v2, 2u, 0, 0);
}

uint64_t IOAccessoryManagerConfigureUSBMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerEnableUSBHostMode(mach_port_t a1, int a2)
{
  uint64_t input;

  input = 2 * (a2 != 0);
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetBatteryPackMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 9u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetGoldbondMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0x13u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerConfigureGoldbondMode(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 0x14u, input, 2u, 0, 0);
}

BOOL IOAccessoryManagerGetBatteryPackMode(io_registry_entry_t a1)
{
  CFTypeRef CFProperty;
  CFTypeRef v2;
  CFTypeRef v3;

  CFProperty = IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryBatteryPack"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v2 = CFProperty;
  v3 = (CFTypeRef)*MEMORY[0x24BDBD270];
  if (CFProperty)
    CFRelease(CFProperty);
  return v2 == v3;
}

uint64_t IOAccessoryManagerSetUSBPowerIgnore(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0xFu, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetUSBPreventSourceDetection(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0x1Au, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerSetAttachStyle(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0xCu, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDetect(mach_port_t a1, unsigned int a2, int a3)
{
  uint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v4[0] = 1;
  v4[1] = a2;
  v4[2] = a3;
  return IOConnectCallScalarMethod(a1, 0xAu, v4, 3u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDigitalID(mach_port_t a1, void *inputStruct)
{
  return IOConnectCallStructMethod(a1, 0xBu, inputStruct, 6uLL, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDPDNConfig(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = 0;
  input[3] = 0;
  return IOConnectCallScalarMethod(a1, 0xEu, input, 4u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDPDNBTConfig(mach_port_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  input[3] = a5;
  return IOConnectCallScalarMethod(a1, 0xEu, input, 4u, 0, 0);
}

uint64_t IOAccessoryManagerOverrideDetectClear(mach_port_t a1)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = xmmword_20D647A60;
  v3 = -1;
  return IOConnectCallScalarMethod(a1, 0xAu, (const uint64_t *)&v2, 3u, 0, 0);
}

uint64_t IOAccessoryManagerCheckPinVoltage(mach_port_t a1, unsigned int a2, unsigned int a3, uint64_t *output)
{
  uint32_t outputCnt;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x10u, input, 2u, output, &outputCnt);
}

uint64_t IOAccessoryManagerSelectEisPin(mach_port_t a1, unsigned int a2, unsigned int a3, uint64_t *output)
{
  uint32_t outputCnt;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x1Bu, input, 2u, output, &outputCnt);
}

uint64_t IOAccessoryManagerGetFreePinMask(mach_port_t a1, uint64_t *output)
{
  uint32_t outputCnt;

  outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x1Cu, 0, 0, output, &outputCnt);
}

uint64_t IOAccessoryManagerLDCMGetAvailablePins(mach_port_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  output = 0;
  v9 = 0;
  outputCnt = 2;
  result = IOConnectCallScalarMethod(a1, 0x1Du, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    v6 = v9;
    *a2 = output;
    *a3 = v6;
  }
  return result;
}

uint64_t IOAccessoryManagerSetLDCM(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v8;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t v11;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  output = 0;
  v11 = 0;
  outputCnt = 2;
  result = IOConnectCallScalarMethod(a1, 0x1Eu, input, 2u, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    v8 = v11;
    *a4 = output;
    *a5 = v8;
  }
  return result;
}

uint64_t IOAccessoryManagerLDCMSetLiquidDetected(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0x1Fu, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerLDCMEnableMitigations(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0x20u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerLDCMEnableUserOverride(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0x21u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerLDCMGetMeasurementStatus(mach_port_t a1, uint64_t *output)
{
  uint32_t outputCnt;

  outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x22u, 0, 0, output, &outputCnt);
}

uint64_t IOAccessoryManagerLDCMSetState(mach_port_t a1, uint64_t *input)
{
  return IOConnectCallScalarMethod(a1, 0x23u, input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerApplyMGIDWorkaround(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0x24u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerForcePowerGateEnable(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0x25u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryManagerForceUSBConnectActive(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 2u, 0, 0, 0, 0);
}

uint64_t IOAccessoryManagerPowerModeIsSupported(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v3;
  const __CFArray *CFProperty;
  const __CFArray *v5;
  CFNumberRef v6;
  uint64_t v7;
  int valuePtr;
  CFRange v10;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessorySupportedPowerModes"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
    return 0;
  v5 = CFProperty;
  valuePtr = a2;
  v6 = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  v10.length = CFArrayGetCount(v5);
  v10.location = 0;
  v7 = CFArrayContainsValue(v5, v10, v6);
  CFRelease(v6);
  CFRelease(v5);
  return v7;
}

const __CFArray *IOAccessoryManagerPowerModeCurrentLimit(io_registry_entry_t a1, int a2)
{
  const __CFArray *result;
  const __CFArray *v4;
  CFIndex v5;
  const __CFNumber *ValueAtIndex;
  unsigned int valuePtr;

  result = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryPowerCurrentLimits"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v4 = result;
    if (a2)
    {
      v5 = (a2 - 1);
      if (CFArrayGetCount(result) > v5)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v4, v5);
        if (ValueAtIndex)
          CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
      }
    }
    CFRelease(v4);
    return (const __CFArray *)valuePtr;
  }
  return result;
}

uint64_t IOAccessoryManagerSetAccessoryUsedCurrent()
{
  return 0;
}

uint64_t IOAccessoryManagerSetAccessoryRequestedCurrent()
{
  return 0;
}

uint64_t IOAccessoryManagerPowerDuringSleepIsSupported(io_registry_entry_t a1)
{
  uint64_t result;

  result = (uint64_t)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryManagerSleepPower"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (result)
  {
    CFRelease((CFTypeRef)result);
    return 1;
  }
  return result;
}

uint64_t IOAccessoryManagerRequestLdcmMeasurement(mach_port_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0x15u, v3, 1u, 0, 0);
}

uint64_t IOAccessoryManagerGetLdcmParams(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt;

  outputStructCnt = 126;
  return IOConnectCallStructMethod(a1, 0x16u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t IOAccessoryManagerSetVoltageDetected(mach_port_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0x17u, v3, 1u, 0, 0);
}

uint64_t IOAccessoryManagerChallengeCryptoDock9Pin(mach_port_t a1, int a2, void *inputStruct, void *outputStruct)
{
  size_t v5;
  uint32_t outputCnt;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  outputCnt = 0;
  v5 = 16;
  return IOConnectCallMethod(a1, 0x18u, input, 1u, inputStruct, 8uLL, 0, &outputCnt, outputStruct, &v5);
}

uint64_t IOAccessoryManagerChallengeCryptoDock(mach_port_t a1, int a2, void *inputStruct, uint64_t a4, void *outputStruct, uint64_t a6, uint64_t *a7)
{
  size_t v8;
  uint32_t outputCnt;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a4;
  input[2] = a6;
  outputCnt = 1;
  v8 = 16;
  return IOConnectCallMethod(a1, 0x19u, input, 3u, inputStruct, 0xFuLL, a7, &outputCnt, outputStruct, &v8);
}

uint64_t IOAccessoryManagerChallengeCryptoLength(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  io_object_t AuthCP;
  io_object_t v6;
  uint64_t v7;
  uint64_t v8;
  io_object_t ServiceWithPrimaryPort;
  BOOLean_t v10;

  result = 3758097090;
  if (a1 && a2)
  {
    AuthCP = __findAuthCP();
    if (AuthCP)
    {
      v6 = AuthCP;
      v7 = 64;
      v8 = 32;
    }
    else
    {
      ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1);
      if (!ServiceWithPrimaryPort)
        return 3758097084;
      v6 = ServiceWithPrimaryPort;
      v10 = IOObjectConformsTo(ServiceWithPrimaryPort, "IOAccessoryDock9Pin");
      v8 = 15;
      if (v10)
        v8 = 8;
      v7 = 16;
    }
    *a1 = v8;
    *a2 = v7;
    IOObjectRelease(v6);
    return 0;
  }
  return result;
}

uint64_t __findAuthCP()
{
  const __CFDictionary *v0;
  uint64_t v2;
  uint64_t v3;
  const __CFAllocator *v4;
  const __CFNumber *CFProperty;
  const __CFNumber *v6;
  uint64_t v8;
  io_iterator_t existing[2];

  *(_QWORD *)existing = 0;
  v0 = IOServiceMatching("AppleAuthCP");
  if (v0)
  {
    if (!IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], v0, &existing[1]) && existing[1] != 0)
    {
      v2 = IOIteratorNext(existing[1]);
      if ((_DWORD)v2)
      {
        v3 = v2;
        v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        do
        {
          CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("flags"), v4, 0);
          if (CFProperty)
          {
            v6 = CFProperty;
            if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, existing) && BYTE2(existing[0]) << 16 == 0x40000)
            {
              CFRelease(v6);
              IOObjectRelease(existing[1]);
              v8 = 0;
              IORegistryEntryGetRegistryEntryID(v3, &v8);
              return v3;
            }
            CFRelease(v6);
          }
          else
          {
            puts("numberref is NULL");
          }
          IOObjectRelease(v3);
          v3 = IOIteratorNext(existing[1]);
        }
        while ((_DWORD)v3);
      }
      IOObjectRelease(existing[1]);
    }
  }
  return 0;
}

uint64_t IOAccessoryManagerChallengeCryptoMLBChip4(const void *a1, uint64_t a2, UInt8 **a3, CFIndex *a4)
{
  CC_LONG v4;
  uint64_t v6;
  io_service_t AuthCP;
  io_object_t v10;
  uint64_t v11;
  const __CFAllocator *v12;
  const __CFData *v13;
  uint64_t v14;
  const __CFData *v15;
  int v16;
  char v17;
  UInt8 v18;
  uint64_t v19;
  UInt8 *v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  UInt8 *v24;
  const __CFData *v25;
  const __CFData *v26;
  CFIndex Length;
  UInt8 *v28;
  const char *v30;
  uint64_t v31;
  const char *v32;
  CFDataRef theData;
  io_connect_t connect;
  UInt8 buffer[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned __int8 md[16];
  __int128 v40;
  UInt8 bytes[4];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[28];
  uint64_t v49;
  CFRange v50;
  CFRange v51;

  v49 = *MEMORY[0x24BDAC8D0];
  connect = 0;
  theData = 0;
  *(_OWORD *)md = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  *(_OWORD *)buffer = 0u;
  v36 = 0u;
  if (!a1 || (v4 = a2, !a2))
  {
    v6 = 3758097085;
    v30 = "invalid inCmd";
LABEL_38:
    puts(v30);
    v26 = 0;
    goto LABEL_30;
  }
  v6 = 3758097085;
  if (!a3 || !a4)
  {
    v30 = "invalid outRsp";
    goto LABEL_38;
  }
  AuthCP = __findAuthCP();
  if (!AuthCP)
  {
    v26 = 0;
    v6 = 3758097084;
    goto LABEL_30;
  }
  v10 = AuthCP;
  v11 = IOServiceOpen(AuthCP, *MEMORY[0x24BDAEC58], 0, &connect);
  if ((_DWORD)v11)
  {
    v31 = v11;
    printf("IOServiceOpen failed: 0x%x\n", v11);
    v26 = 0;
    v13 = 0;
  }
  else
  {
    CC_SHA256(a1, v4, md);
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], md, 32);
    if (!v13)
    {
      v32 = "CFDataCreate failed";
LABEL_45:
      puts(v32);
      v26 = 0;
      goto LABEL_25;
    }
    v14 = _cpCreateSignature(connect, v13, &theData);
    if (!(_DWORD)v14)
    {
      v15 = theData;
      if (theData)
      {
        if (CFDataGetLength(theData) == 64)
        {
          v50.location = 0;
          v50.length = 64;
          CFDataGetBytes(v15, v50, buffer);
          v16 = (char)v37;
          if ((v37 & 0x80u) == 0)
            v17 = 32;
          else
            v17 = 33;
          *(_OWORD *)&v48[12] = 0u;
          if ((buffer[0] & 0x80u) == 0)
            v18 = 32;
          else
            v18 = 33;
          *(_OWORD *)v48 = 0uLL;
          v47 = 0uLL;
          v46 = 0uLL;
          v45 = 0uLL;
          v44 = 0uLL;
          v43 = 0uLL;
          v42 = 0uLL;
          bytes[0] = 48;
          bytes[1] = (v17 + v18) | 4;
          bytes[2] = 2;
          bytes[3] = v18;
          if ((buffer[0] & 0x80u) == 0)
            v19 = 4;
          else
            v19 = 5;
          v20 = &bytes[v19];
          v21 = v36;
          *(_OWORD *)v20 = *(_OWORD *)buffer;
          *((_OWORD *)v20 + 1) = v21;
          v20[32] = 2;
          v22 = v19 | 0x22;
          v20[33] = v17;
          if (v16 < 0)
          {
            bytes[v22] = 0;
            LODWORD(v22) = v19 + 35;
          }
          v23 = v38;
          v24 = &bytes[v22];
          *(_OWORD *)v24 = v37;
          *((_OWORD *)v24 + 1) = v23;
          v25 = CFDataCreate(v12, bytes, (v22 + 32));
          v26 = v25;
          if (v25 && CFDataGetLength(v25))
          {
            Length = CFDataGetLength(v26);
            v28 = (UInt8 *)malloc_type_calloc(1uLL, Length, 0xF34617AEuLL);
            *a3 = v28;
            v51.location = 0;
            v51.length = Length;
            CFDataGetBytes(v26, v51, v28);
            v6 = 0;
            *a4 = Length;
          }
          else
          {
            puts("outSignatureDer is empty");
          }
          goto LABEL_25;
        }
        v32 = "outSignature length is invalid";
      }
      else
      {
        v32 = "outSignature is NULL";
      }
      goto LABEL_45;
    }
    v31 = v14;
    printf("cpCreateSignature failed: 0x%x\n", v14);
    v26 = 0;
  }
  v6 = v31;
LABEL_25:
  IOObjectRelease(v10);
  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v13)
    CFRelease(v13);
LABEL_30:
  if (theData)
    CFRelease(theData);
  if (v26)
    CFRelease(v26);
  return v6;
}

uint64_t _cpCreateSignature(mach_port_t a1, CFDataRef theData, CFDataRef *a3)
{
  __int128 v6;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v9;
  size_t outputStructCnt;
  _OWORD outputStruct[8];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  outputStruct[6] = v6;
  outputStruct[7] = v6;
  outputStruct[4] = v6;
  outputStruct[5] = v6;
  outputStruct[2] = v6;
  outputStruct[3] = v6;
  outputStruct[0] = v6;
  outputStruct[1] = v6;
  outputStructCnt = 128;
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v9 = IOConnectCallStructMethod(a1, 0, BytePtr, Length, outputStruct, &outputStructCnt);
  if (!(_DWORD)v9)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)outputStruct, outputStructCnt);
  return v9;
}

uint64_t IOAccessoryManagerChallengeCryptoDockAuthChip(mach_port_t a1, int a2, const UInt8 *inputStruct, uint64_t a4, UInt8 *outputStruct, unint64_t a6, uint64_t *a7)
{
  uint64_t v10;
  uint64_t v11;
  io_service_t AuthCP;
  io_object_t v13;
  uint64_t v14;
  const __CFData *v15;
  const __CFData *v16;
  uint64_t v17;
  const __CFData *v18;
  unint64_t Length;
  CFRange v20;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  CFDataRef theData;
  io_connect_t connect;
  size_t v27;
  uint32_t outputCnt;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a4;
  v10 = 3758097085;
  input[2] = a6;
  connect = 0;
  outputCnt = 1;
  v27 = 16;
  if (!a1)
  {
    v11 = 3758097084;
LABEL_5:
    AuthCP = __findAuthCP();
    if (!AuthCP)
      goto LABEL_17;
    v13 = AuthCP;
    theData = 0;
    v14 = IOServiceOpen(AuthCP, *MEMORY[0x24BDAEC58], 0, &connect);
    if ((_DWORD)v14)
    {
      v22 = v14;
      printf("IOServiceOpen failed: 0x%x\n", v14);
      v10 = v22;
    }
    else
    {
      v15 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], inputStruct, 32);
      if (v15)
      {
        v16 = v15;
        v17 = _cpCreateSignature(connect, v15, &theData);
        if ((_DWORD)v17)
        {
          v23 = v17;
          printf("cpCreateSignature failed: 0x%x\n", v17);
          v10 = v23;
        }
        else
        {
          v18 = theData;
          if (theData)
          {
            Length = CFDataGetLength(theData);
            if (Length)
            {
              if (Length >= a6)
                v20.length = a6;
              else
                v20.length = Length;
              v20.location = 0;
              CFDataGetBytes(v18, v20, outputStruct);
              CFRelease(v18);
              v10 = 0;
              goto LABEL_15;
            }
            v24 = "outSignature is empty";
          }
          else
          {
            v24 = "outSignature is NULL";
          }
          puts(v24);
        }
LABEL_15:
        IOObjectRelease(v13);
        CFRelease(v16);
LABEL_16:
        v11 = v10;
        goto LABEL_17;
      }
      puts("CFDataCreate failed");
    }
    IOObjectRelease(v13);
    goto LABEL_16;
  }
  v11 = IOConnectCallMethod(a1, 0x19u, input, 3u, inputStruct, 0xFuLL, a7, &outputCnt, outputStruct, &v27);
  if ((_DWORD)v11)
    goto LABEL_5;
LABEL_17:
  if (connect)
    IOServiceClose(connect);
  return v11;
}

uint64_t IOAccessoryPortGetServiceWithPort(int a1)
{
  __CFDictionary *v1;
  const __CFAllocator *v2;
  CFDictionaryRef v3;
  void *values;
  void *keys;
  int valuePtr;

  valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryPort");
  keys = CFSTR("IOAccessoryDevicePort");
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v3 = CFDictionaryCreate(v2, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v1, CFSTR("IOPropertyMatch"), v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v1);
}

const __CFNumber *IOAccessoryPortGetPort(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryDevicePort"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *IOAccessoryPortGetTransportType(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryTransportType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *IOAccessoryPortGetStreamType(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryPortStreamType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

const __CFNumber *IOAccessoryPortGetManagerPrimaryPort(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryPortManagerPrimaryPort"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 0;
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

uint64_t IOAccessoryPortGetManagerService(io_registry_entry_t a1)
{
  kern_return_t ParentEntry;
  uint64_t result;
  BOOL v3;
  BOOLean_t v4;
  io_registry_entry_t parent;

  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(a1, "IOAccessory", &parent);
  result = parent;
  if (ParentEntry)
    v3 = 1;
  else
    v3 = parent == 0;
  if (!v3)
  {
    v4 = IOObjectConformsTo(parent, "IOAccessoryManager");
    result = parent;
    if (!v4)
    {
      IOObjectRelease(parent);
      return 0;
    }
  }
  return result;
}

uint64_t IOAccessoryPortTransmitData(mach_port_t a1, void *inputStruct, size_t inputStructCnt, unsigned int a4)
{
  uint64_t input;

  input = a4;
  return IOConnectCallMethod(a1, 0, &input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t IOAccessoryPortWaitSendDone(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryPortSetUSBRoleSwitchMask(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(a1, 2u, input, 2u, 0, 0, 0, 0, 0, 0);
}

CFRunLoopSourceRef IOAccessoryPortCreateRunLoopSource(uint64_t a1, UInt8 a2, uint64_t a3, uint64_t a4)
{
  const __CFAllocator *v8;
  __CFData *Mutable;
  __CFData *v10;
  UInt8 *MutableBytePtr;
  CFRunLoopSourceRef RunLoopSource;
  uint64_t NotificationPort;
  __CFMachPort *v15;
  mach_msg_return_t v16;
  mach_msg_return_t v17;
  mach_msg_header_t v18;
  Boolean shouldFreeInfo[17];
  CFMachPortContext context;

  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 40);
  if (!Mutable)
    return 0;
  v10 = Mutable;
  memset(&context, 0, sizeof(context));
  memset(shouldFreeInfo, 170, sizeof(shouldFreeInfo));
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((_QWORD *)MutableBytePtr + 2) = a3;
  MutableBytePtr[24] = a2;
  *((_QWORD *)MutableBytePtr + 4) = a4;
  if (MEMORY[0x212BA58CC](a1, 0, *MEMORY[0x24BDAEC58], &shouldFreeInfo[9], &shouldFreeInfo[1], 1)|| (*((_QWORD *)MutableBytePtr + 1) = *(_QWORD *)&shouldFreeInfo[9], NotificationPort = IODataQueueAllocateNotificationPort(), (*((_DWORD *)MutableBytePtr + 1) = NotificationPort) == 0)|| MEMORY[0x212BA58D8](a1, 0, NotificationPort, 0))
  {
    CFRelease(v10);
    return 0;
  }
  context.version = 0;
  context.info = v10;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x24BDBC2A8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x24BDBC298];
  context.copyDescription = 0;
  v15 = CFMachPortCreateWithPort(v8, *((_DWORD *)MutableBytePtr + 1), (CFMachPortCallBack)IOAccessoryPortMachPortCallBack, &context, shouldFreeInfo);
  if (shouldFreeInfo[0])
    CFRelease(v10);
  if (!v15)
    return 0;
  RunLoopSource = CFMachPortCreateRunLoopSource(v8, v15, 0);
  CFRelease(v15);
  if (RunLoopSource)
  {
    if (IODataQueueDataAvailable(*((IODataQueueMemory **)MutableBytePtr + 1)))
    {
      *(_QWORD *)&v18.msgh_bits = 0x1800000014;
      v18.msgh_remote_port = *((_DWORD *)MutableBytePtr + 1);
      v18.msgh_local_port = 0;
      *(_QWORD *)&v18.msgh_voucher_port = 0;
      v16 = mach_msg(&v18, 17, 0x18u, 0, 0, 0, 0);
      v17 = v16;
      if (v16 && v16 != 268435460)
        CFRelease(RunLoopSource);
      if (v17 != 268435460 && v17)
        return 0;
    }
  }
  return RunLoopSource;
}

void IOAccessoryPortMachPortCallBack(int a1, int a2, int a3, CFMutableDataRef theData)
{
  UInt8 *MutableBytePtr;
  UInt8 *v5;
  UInt8 *data;
  unsigned int v7;
  IODataQueueEntry *v8;

  if (theData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(theData);
    if (MutableBytePtr)
    {
      v5 = MutableBytePtr;
      if (MutableBytePtr[24])
      {
        (*((void (**)(_QWORD, _QWORD))MutableBytePtr + 2))(0, *((_QWORD *)MutableBytePtr + 4));
      }
      else
      {
        while (1)
        {
          v8 = IODataQueuePeek(*((IODataQueueMemory **)v5 + 1));
          if (!v8)
            break;
          v7 = *(unsigned __int16 *)v8->data;
          data = v8->data;
          if (v7 > 0x100)
            break;
          (*((void (**)(UInt8 *, _QWORD))v5 + 2))(data, *((_QWORD *)v5 + 4));
          IODataQueueDequeue(*((IODataQueueMemory **)v5 + 1), 0, 0);
        }
      }
    }
  }
}

uint64_t IOAccessoryIDBusGetServiceWithManagerPrimaryPort(int a1)
{
  __CFDictionary *v1;
  const __CFAllocator *v2;
  CFDictionaryRef v3;
  void *values;
  void *keys;
  int valuePtr;

  valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryIDBusTransport");
  keys = CFSTR("IOAccessoryPortManagerPrimaryPort");
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v3 = CFDictionaryCreate(v2, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v1, CFSTR("IOPropertyMatch"), v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v1);
}

uint64_t IOAccessoryIDBusTransferData(mach_port_t a1, void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t a5, unsigned int a6, double a7)
{
  size_t v8;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  input[0] = (unint64_t)(a7 * 1000000.0);
  input[1] = a6;
  return IOConnectCallMethod(a1, 0, input, 2u, inputStruct, inputStructCnt, 0, 0, outputStruct, &v8);
}

uint64_t IOAccessoryIDBusCancelTransfer(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 1u, 0, 0, 0, 0);
}

uint64_t IOAccessoryIDBusSendBreak(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 2u, 0, 0, 0, 0);
}

uint64_t IOAccessoryIDBusSendBusReset(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 3u, 0, 0, 0, 0);
}

uint64_t IOAccessoryIDBusAssertBusReset(mach_port_t a1, int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0, 0);
}

uint64_t IOAccessoryIDBusGetMaxTransfer(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v5;
  const __CFNumber *Value;
  const __CFNumber *v7;
  uint64_t v8;
  int valuePtr;
  CFMutableDictionaryRef properties;
  io_registry_entry_t entry;

  entry = -1431655766;
  v5 = MEMORY[0x212BA58C0](a1, &entry);
  if (!(_DWORD)v5)
  {
    properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    v5 = IORegistryEntryCreateCFProperties(entry, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!(_DWORD)v5)
    {
      v5 = 3758097084;
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, "IOAccessoryIDBusTransportMaxTransmit");
      v7 = (const __CFNumber *)CFDictionaryGetValue(properties, "IOAccessoryIDBusTransportMaxReceive");
      valuePtr = -1431655766;
      v8 = 3758097084;
      if (Value && CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
      {
        v8 = 0;
        *a2 = valuePtr;
      }
      if (v7 && CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr))
      {
        *a3 = valuePtr;
        v5 = v8;
      }
      CFRelease(properties);
    }
  }
  return v5;
}

const __CFNumber *IOAccessoryEAInterfaceGetTransportType(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  unsigned int valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("TransportType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = 0;
  if (result)
  {
    v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFTypeRef IOAccessoryEAInterfaceCopyProtocolString(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("ProtocolString"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceVendorName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceProductName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceModelNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceHardwareRevision"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceFirmwareRevision"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceSerialNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceDockType(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceDockType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t IOAccessoryEAInterfaceRegisterReceiveCallback(mach_port_t a1, IONotificationPortRef notify, uint64_t a3, unint64_t a4)
{
  mach_port_t MachPort;
  uint64_t reference[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  reference[0] = 0;
  v9 = 0u;
  v10 = 0u;
  reference[1] = a3;
  v8 = a4;
  MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 2u, MachPort, reference, 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAccessoryEAInterfaceReceiveData(mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 1u, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryEAInterfaceSendData(mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 0, inputStruct, inputStructCnt, 0, 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceVendorName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceProductName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceModelNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceHardwareRevision"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceFirmwareRevision"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceSerialNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceDockType(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceDockType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

const __CFNumber *IOAccessoryOOBPairingInterfaceCopyDevicePlatformID(io_registry_entry_t a1)
{
  const __CFNumber *result;
  unint64_t valuePtr;

  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("DevicePlatformID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (result)
  {
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    if (CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr))
      return (const __CFNumber *)valuePtr;
    else
      return 0;
  }
  return result;
}

CFTypeRef IOAccessoryOOBPairingInterfaceGetSupportedPairingTypes(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceSupportedOOBPairingTypes"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t IOAccessoryOOBPairingInterfaceGetActivePairingType(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  unsigned int valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceActiveOOBPairingType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = -1431655766;
  if (CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr))
    return valuePtr;
  else
    return 2;
}

uint64_t IOAccessoryOOBPairingInterfaceSupports2Way(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  int Value;
  unsigned __int8 v3;
  int valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceSupportsSupports2Way"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  valuePtr = -1431655766;
  Value = CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
  v3 = valuePtr;
  if (!Value)
    return 0;
  return v3;
}

uint64_t IOAccessoryOOBPairingInterfaceRegisterReceiveCallback(mach_port_t a1, IONotificationPortRef notify, uint64_t a3, unint64_t a4)
{
  mach_port_t MachPort;
  uint64_t reference[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  reference[0] = 0;
  v9 = 0u;
  v10 = 0u;
  reference[1] = a3;
  v8 = a4;
  MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 0, MachPort, reference, 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingInfo(mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 1u, inputStruct, inputStructCnt, 0, 0);
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingInfo(mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingData(mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 3u, inputStruct, inputStructCnt, 0, 0);
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingData(mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 4u, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategories(io_registry_entry_t a1, uint64_t a2, unsigned int *a3)
{
  NSObject *v6;
  unsigned int v7;
  const __CFArray *CFProperty;
  unsigned int Count;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  unsigned int v15;
  _QWORD v17[5];
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  io_registry_entry_t v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (__initLogging_onceToken != -1)
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    v7 = 0;
    if (a2 && a3)
      v7 = *a3;
    *(_DWORD *)buf = 136315650;
    v20 = "IOAccessoryConfigStreamInterfaceGetCategories";
    v21 = 1024;
    v22 = a1;
    v23 = 1024;
    v24 = v7;
    _os_log_impl(&dword_20D641000, v6, OS_LOG_TYPE_INFO, "%s: service %d, outDataCount %u", buf, 0x18u);
  }
  if (!a2 || !a3)
  {
    v14 = 3758097090;
    v13 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
      return v14;
    v15 = 0;
    goto LABEL_23;
  }
  if (!*a3)
    goto LABEL_26;
  CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryConfigStreamCategoryList"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    if (CFProperty)
      goto LABEL_13;
LABEL_26:
    v14 = 3758097090;
    v13 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
      return v14;
    goto LABEL_22;
  }
  IOAccessoryConfigStreamInterfaceGetCategories_cold_2();
  if (!CFProperty)
    goto LABEL_26;
LABEL_13:
  Count = CFArrayGetCount(CFProperty);
  v10 = *a3;
  if (Count < *a3)
    v10 = Count;
  if (v10 >= 8)
    v11 = 8;
  else
    v11 = v10;
  v12 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    IOAccessoryConfigStreamInterfaceGetCategories_cold_1(a1, v11, v12);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 0x40000000;
  v17[2] = __IOAccessoryConfigStreamInterfaceGetCategories_block_invoke;
  v17[3] = &__block_descriptor_tmp;
  v18 = v11;
  v17[4] = a2;
  __iterateDictionaryList(CFProperty, v11, (uint64_t)v17);
  *a3 = v11;
  CFRelease(CFProperty);
  v13 = gLogObject;
  v14 = 0;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 0;
LABEL_22:
    v15 = *a3;
LABEL_23:
    *(_DWORD *)buf = 136315906;
    v20 = "IOAccessoryConfigStreamInterfaceGetCategories";
    v21 = 1024;
    v22 = a1;
    v23 = 1024;
    v24 = v15;
    v25 = 1024;
    v26 = v14;
    _os_log_impl(&dword_20D641000, v13, OS_LOG_TYPE_DEFAULT, "%s: service %d, *outDataCount %u, ret %x", buf, 0x1Eu);
  }
  return v14;
}

void __iterateDictionaryList(const __CFArray *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  NSObject *v10;
  BOOL v11;
  CFIndex v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  CFIndex Count;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "__iterateDictionaryList";
    v15 = 2048;
    Count = CFArrayGetCount(a1);
    v17 = 2048;
    v18 = a2;
    v19 = 1024;
    v20 = a3 != 0;
    _os_log_debug_impl(&dword_20D641000, v6, OS_LOG_TYPE_DEBUG, "%s: array %ld values, upToCount %ld, handler %d", buf, 0x26u);
  }
  v7 = a2 - 1;
  if (a2 >= 1 && a1 && a3)
  {
    v8 = 0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
      v10 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        v12 = CFDictionaryGetCount(ValueAtIndex);
        *(_DWORD *)buf = 136315650;
        v14 = "__iterateDictionaryList";
        v15 = 2048;
        Count = v8;
        v17 = 2048;
        v18 = v12;
        _os_log_debug_impl(&dword_20D641000, v10, OS_LOG_TYPE_DEBUG, "%s: call handler, i %ld, item %ld values", buf, 0x20u);
      }
      if ((*(unsigned int (**)(uint64_t, CFIndex, const __CFDictionary *))(a3 + 16))(a3, v8, ValueAtIndex))
        v11 = v7 == v8;
      else
        v11 = 1;
      ++v8;
    }
    while (!v11);
  }
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategoryProperties(io_registry_entry_t a1, int a2, uint64_t a3, unsigned int *a4)
{
  NSObject *v8;
  unsigned int v9;
  const __CFArray *CFProperty;
  CFIndex Count;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const __CFArray *Value;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  io_registry_entry_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BYTE v46[10];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = &v35;
  v37 = 0x2000000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2000000000;
  v34 = -1;
  if (__initLogging_onceToken != -1)
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  v8 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    v9 = 0;
    if (a3 && a4)
      v9 = *a4;
    *(_DWORD *)buf = 136315906;
    v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    v41 = 1024;
    v42 = a1;
    v43 = 1024;
    v44 = a2;
    v45 = 1024;
    *(_DWORD *)v46 = v9;
    _os_log_impl(&dword_20D641000, v8, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, outDataCount %u", buf, 0x1Eu);
  }
  if (!a3 || !a4)
  {
    v14 = 3758097090;
    v21 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v26 = 0;
    goto LABEL_35;
  }
  if (!*a4)
    goto LABEL_26;
  CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryConfigStreamCategoryList"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    if (CFProperty)
      goto LABEL_13;
LABEL_26:
    v14 = 3758097090;
    v21 = gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    goto LABEL_34;
  }
  IOAccessoryConfigStreamInterfaceGetCategoryProperties_cold_1();
  if (!CFProperty)
    goto LABEL_26;
LABEL_13:
  Count = CFArrayGetCount(CFProperty);
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 0x40000000;
  v30[2] = __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke;
  v30[3] = &unk_24C74E4E0;
  v30[4] = &v31;
  v30[5] = &v35;
  __findCategoryEntry(CFProperty, a2, (uint64_t)v30);
  v13 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    v22 = 8;
    if (Count < 8)
      v22 = Count;
    v23 = v32[3];
    v24 = v36[3];
    *(_DWORD *)buf = 136316418;
    v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    v41 = 1024;
    v42 = a1;
    v43 = 1024;
    v44 = a2;
    v45 = 2048;
    *(_QWORD *)v46 = v23;
    *(_WORD *)&v46[8] = 2048;
    v47 = v22;
    v48 = 2112;
    v49 = v24;
    _os_log_debug_impl(&dword_20D641000, v13, OS_LOG_TYPE_DEBUG, "%s: service %d, categoryID 0x%x, found catIndex %ld, categoryCount %ld, categoryItem %@", buf, 0x36u);
  }
  v14 = 3758097090;
  if ((v32[3] & 0x8000000000000000) == 0)
  {
    Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v36[3], CFSTR("PropertyList"));
    v16 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      v25 = v32[3];
      *(_DWORD *)buf = 136316162;
      v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
      v41 = 1024;
      v42 = a1;
      v43 = 1024;
      v44 = a2;
      v45 = 2048;
      *(_QWORD *)v46 = v25;
      *(_WORD *)&v46[8] = 2112;
      v47 = (uint64_t)Value;
      _os_log_debug_impl(&dword_20D641000, v16, OS_LOG_TYPE_DEBUG, "%s: service %d, category 0x%x / %ld, found propertyList %@", buf, 0x2Cu);
      if (Value)
        goto LABEL_17;
    }
    else if (Value)
    {
LABEL_17:
      v17 = CFArrayGetCount(Value);
      v18 = *a4;
      if (v17 < *a4)
        v18 = v17;
      if (v18 >= 0x10)
        v19 = 16;
      else
        v19 = v18;
      v20 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        v28 = v32[3];
        *(_DWORD *)buf = 136316162;
        v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
        v41 = 1024;
        v42 = a1;
        v43 = 1024;
        v44 = a2;
        v45 = 2048;
        *(_QWORD *)v46 = v28;
        *(_WORD *)&v46[8] = 1024;
        LODWORD(v47) = v19;
        _os_log_debug_impl(&dword_20D641000, v20, OS_LOG_TYPE_DEBUG, "%s: service %d, category 0x%x / %ld, propertyCount %d", buf, 0x28u);
      }
      v29[0] = v12;
      v29[1] = 0x40000000;
      v29[2] = __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke_129;
      v29[3] = &__block_descriptor_tmp_132;
      v29[4] = a3;
      __iterateDictionaryList(Value, v19, (uint64_t)v29);
      v14 = 0;
      *a4 = v19;
      goto LABEL_33;
    }
    v14 = 3758097112;
  }
LABEL_33:
  CFRelease(CFProperty);
  v21 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
LABEL_34:
    v26 = *a4;
LABEL_35:
    *(_DWORD *)buf = 136316162;
    v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    v41 = 1024;
    v42 = a1;
    v43 = 1024;
    v44 = a2;
    v45 = 1024;
    *(_DWORD *)v46 = v26;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v14;
    _os_log_impl(&dword_20D641000, v21, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, outDataCount %u, ret %x", buf, 0x24u);
  }
LABEL_36:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v14;
}

void __findCategoryEntry(const __CFArray *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  CFIndex v7;
  CFIndex Count;
  _QWORD v9[6];
  __int16 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  CFIndex v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = -1;
  v6 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    Count = CFArrayGetCount(a1);
    *(_DWORD *)buf = 136315906;
    v20 = "__findCategoryEntry";
    v21 = 2048;
    v22 = Count;
    v23 = 1024;
    v24 = a2;
    v25 = 1024;
    v26 = a3 != 0;
    _os_log_debug_impl(&dword_20D641000, v6, OS_LOG_TYPE_DEBUG, "%s: categoryList %ld, categoryID %d, handler %d", buf, 0x22u);
    if (!a1)
      goto LABEL_7;
  }
  else if (!a1)
  {
    goto LABEL_7;
  }
  if (a3)
  {
    v7 = CFArrayGetCount(a1);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ____findCategoryEntry_block_invoke;
    v9[3] = &unk_24C74E568;
    v10 = a2;
    v9[4] = &v11;
    v9[5] = &v15;
    __iterateDictionaryList(a1, v7, (uint64_t)v9);
    if ((v12[3] & 0x8000000000000000) == 0)
    {
      if (v16[3])
        (*(void (**)(uint64_t))(a3 + 16))(a3);
    }
  }
LABEL_7:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t IOAccessoryConfigStreamInterfaceGetProperty(io_registry_entry_t a1, int a2, int a3, UInt8 *a4, CFIndex *a5)
{
  NSObject *v9;
  CFIndex v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  const __CFArray *CFProperty;
  NSObject *v15;
  CFIndex v16;
  uint64_t v17;
  const __CFArray *Value;
  const __CFArray *v19;
  CFIndex v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const __CFDictionary *v24;
  const __CFData *v25;
  NSObject *v26;
  unint64_t Length;
  CFIndex v28;
  CFIndex Count;
  uint64_t v30;
  uint64_t v31;
  const __CFData *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  CFIndex v36;
  char v38;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[6];
  __int16 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[6];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE buf[24];
  __int128 v72;
  _BYTE v73[10];
  __int16 v74;
  const __CFData *v75;
  uint64_t v76;
  CFRange v77;

  v76 = *MEMORY[0x24BDAC8D0];
  v48 = 0;
  v49 = &v48;
  v50 = 0x2000000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2000000000;
  v47 = -1;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2000000000;
  v43 = -1;
  if (__initLogging_onceToken != -1)
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  v9 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    v10 = 0;
    if (a4 && a5)
      v10 = *a5;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a1;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    LOWORD(v72) = 1024;
    *(_DWORD *)((char *)&v72 + 2) = a3;
    WORD3(v72) = 2048;
    *((_QWORD *)&v72 + 1) = v10;
    _os_log_impl(&dword_20D641000, v9, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, propertyID 0x%x, outDataSize %lu", buf, 0x28u);
  }
  v11 = 3758097090;
  if (a4)
    v12 = a5 == 0;
  else
    v12 = 1;
  v13 = v12;
  v38 = v13;
  if (!v12 && *a5)
  {
    CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOAccessoryConfigStreamCategoryList"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      if (!CFProperty)
        goto LABEL_40;
LABEL_18:
      v67 = 0;
      v68 = &v67;
      v69 = 0x2000000000;
      v70 = 0;
      v63 = 0;
      v64 = &v63;
      v65 = 0x2000000000;
      v66 = -1;
      v59 = 0;
      v60 = &v59;
      v61 = 0x2000000000;
      v62 = -1;
      v15 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        Count = CFArrayGetCount(CFProperty);
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "__findPropertyEntry";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = Count;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v72) = a2;
        WORD2(v72) = 1024;
        *(_DWORD *)((char *)&v72 + 6) = a3;
        WORD5(v72) = 1024;
        HIDWORD(v72) = 1;
        _os_log_debug_impl(&dword_20D641000, v15, OS_LOG_TYPE_DEBUG, "%s: categoryList %ld, categoryID %d, propertyID %d, handler %d", buf, 0x28u);
      }
      v16 = CFArrayGetCount(CFProperty);
      v17 = MEMORY[0x24BDAC760];
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 0x40000000;
      v58[2] = ____findPropertyEntry_block_invoke;
      v58[3] = &unk_24C74E590;
      v58[4] = &v63;
      v58[5] = &v67;
      __findCategoryEntry(CFProperty, a2, (uint64_t)v58);
      *(_QWORD *)buf = v17;
      *(_QWORD *)&buf[8] = 0x40000000;
      *(_QWORD *)&buf[16] = ____findPropertyEntry_block_invoke_2;
      *(_QWORD *)&v72 = &unk_24C74E5B8;
      *(_WORD *)&v73[8] = a2;
      *((_QWORD *)&v72 + 1) = &v63;
      *(_QWORD *)v73 = &v67;
      __iterateDictionaryList(CFProperty, v16, (uint64_t)buf);
      if ((v64[3] & 0x8000000000000000) == 0)
      {
        Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v68[3], CFSTR("PropertyList"));
        v54 = 0;
        v55 = &v54;
        v56 = 0x2000000000;
        v57 = 0;
        if (Value)
        {
          v19 = Value;
          v20 = CFArrayGetCount(Value);
          v52[0] = v17;
          v52[1] = 0x40000000;
          v52[2] = ____findPropertyEntry_block_invoke_3;
          v52[3] = &unk_24C74E5E0;
          v53 = a3;
          v52[4] = &v59;
          v52[5] = &v54;
          __iterateDictionaryList(v19, v20, (uint64_t)v52);
          v21 = v60[3];
          if ((v21 & 0x8000000000000000) == 0)
          {
            v22 = v55[3];
            if (v22)
            {
              v45[3] = v64[3];
              v41[3] = v21;
              v49[3] = v22;
            }
          }
        }
        _Block_object_dispose(&v54, 8);
      }
      _Block_object_dispose(&v59, 8);
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      v23 = gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        v30 = v45[3];
        v31 = v41[3];
        v32 = (const __CFData *)v49[3];
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = a1;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a2;
        LOWORD(v72) = 1024;
        *(_DWORD *)((char *)&v72 + 2) = a3;
        WORD3(v72) = 2048;
        *((_QWORD *)&v72 + 1) = v30;
        *(_WORD *)v73 = 2048;
        *(_QWORD *)&v73[2] = v31;
        v74 = 2112;
        v75 = v32;
        _os_log_debug_impl(&dword_20D641000, v23, OS_LOG_TYPE_DEBUG, "%s: service %d, categoryID 0x%x, propertyID 0x%x, found catIndex %ld, propIndex %ld, propertyItem %@", buf, 0x3Cu);
      }
      v24 = (const __CFDictionary *)v49[3];
      if (v24)
      {
        v25 = (const __CFData *)CFDictionaryGetValue(v24, CFSTR("PropertyData"));
        v26 = gLogObject;
        if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
        {
          v33 = v45[3];
          v34 = v41[3];
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = a1;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = a2;
          LOWORD(v72) = 2048;
          *(_QWORD *)((char *)&v72 + 2) = v33;
          WORD5(v72) = 1024;
          HIDWORD(v72) = a3;
          *(_WORD *)v73 = 2048;
          *(_QWORD *)&v73[2] = v34;
          v74 = 2112;
          v75 = v25;
          _os_log_debug_impl(&dword_20D641000, v26, OS_LOG_TYPE_DEBUG, "%s: service %d, category 0x%x / %ld, property 0x%x / %ld, found data %@", buf, 0x3Cu);
          if (v25)
            goto LABEL_31;
        }
        else if (v25)
        {
LABEL_31:
          Length = CFDataGetLength(v25);
          if (Length >= *a5)
            v28 = *a5;
          else
            v28 = Length;
          v77.location = 0;
          v77.length = v28;
          CFDataGetBytes(v25, v77, a4);
          v11 = 0;
          *a5 = v28;
          goto LABEL_39;
        }
      }
      v11 = 3758097112;
LABEL_39:
      CFRelease(CFProperty);
      goto LABEL_40;
    }
    IOAccessoryConfigStreamInterfaceGetProperty_cold_1();
    if (CFProperty)
      goto LABEL_18;
  }
LABEL_40:
  v35 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if ((v38 & 1) != 0)
      v36 = 0;
    else
      v36 = *a5;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a1;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    LOWORD(v72) = 1024;
    *(_DWORD *)((char *)&v72 + 2) = a3;
    WORD3(v72) = 2048;
    *((_QWORD *)&v72 + 1) = v36;
    *(_WORD *)v73 = 1024;
    *(_DWORD *)&v73[2] = v11;
    _os_log_impl(&dword_20D641000, v35, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, propertyID 0x%x, outDataSize %lu, ret %x", buf, 0x2Eu);
  }
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v11;
}

uint64_t IOAccessoryConfigStreamInterfaceRequestGetProperty(io_service_t a1, io_connect_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  kern_return_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  io_service_t v20;
  __int16 v21;
  io_connect_t v22;
  __int16 v23;
  _BYTE v24[10];
  uint64_t v25;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  input[0] = a2;
  input[1] = a3;
  if (__initLogging_onceToken != -1)
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  v8 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
    v19 = 1024;
    v20 = a1;
    v21 = 1024;
    v22 = a2;
    v23 = 1024;
    *(_DWORD *)v24 = a3;
    _os_log_impl(&dword_20D641000, v8, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, propertyID 0x%x", buf, 0x1Eu);
  }
  connect = 0;
  v9 = IOServiceOpen(a1, *MEMORY[0x24BDAEC58], 0, &connect);
  if (!(_DWORD)v9)
  {
    v10 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
      v19 = 1024;
      v20 = a1;
      v21 = 1024;
      v22 = connect;
      v23 = 2048;
      *(_QWORD *)v24 = v6;
      *(_WORD *)&v24[8] = 2048;
      v25 = v7;
      _os_log_debug_impl(&dword_20D641000, v10, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, arg [%llx  %llx]", buf, 0x2Cu);
    }
    v11 = IOConnectCallScalarMethod(connect, 0, input, 2u, 0, 0);
    v12 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
      v19 = 1024;
      v20 = a1;
      v21 = 1024;
      v22 = connect;
      v23 = 1024;
      *(_DWORD *)v24 = v11;
      _os_log_debug_impl(&dword_20D641000, v12, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, after call, ret %x", buf, 0x1Eu);
    }
    v9 = IOServiceClose(connect);
  }
  v13 = v9;
  v14 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
    v19 = 1024;
    v20 = a1;
    v21 = 1024;
    v22 = a2;
    v23 = 1024;
    *(_DWORD *)v24 = a3;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v13;
    _os_log_impl(&dword_20D641000, v14, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, propertyID 0x%x, ret %x", buf, 0x24u);
  }
  return v13;
}

uint64_t IOAccessoryConfigStreamInterfaceSetProperty(io_service_t a1, io_connect_t a2, unsigned int a3, const void *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  kern_return_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  io_service_t v24;
  __int16 v25;
  io_connect_t v26;
  __int16 v27;
  _BYTE v28[20];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  input[0] = a2;
  input[1] = a3;
  input[2] = a5;
  if (__initLogging_onceToken != -1)
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  v12 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
    v23 = 1024;
    v24 = a1;
    v25 = 1024;
    v26 = a2;
    v27 = 1024;
    *(_DWORD *)v28 = a3;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = a5;
    _os_log_impl(&dword_20D641000, v12, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, propertyID 0x%x, dataSize %zu", buf, 0x28u);
  }
  connect = 0;
  v13 = IOServiceOpen(a1, *MEMORY[0x24BDAEC58], 0, &connect);
  if ((_DWORD)v13)
    goto LABEL_12;
  if (a5 <= 0x400)
  {
    v14 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316930;
      v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
      v23 = 1024;
      v24 = a1;
      v25 = 1024;
      v26 = connect;
      v27 = 2048;
      *(_QWORD *)v28 = v10;
      *(_WORD *)&v28[8] = 2048;
      *(_QWORD *)&v28[10] = v11;
      *(_WORD *)&v28[18] = 2048;
      v29 = a5;
      v30 = 2048;
      v31 = a5;
      v32 = 1024;
      v33 = 1024;
      _os_log_debug_impl(&dword_20D641000, v14, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, arg [%llx  %llx  %llx], dataSize %zu / %d", buf, 0x46u);
    }
    v15 = IOConnectCallMethod(connect, 1u, input, 3u, a4, 0x400uLL, 0, 0, 0, 0);
    v16 = gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
      v23 = 1024;
      v24 = a1;
      v25 = 1024;
      v26 = connect;
      v27 = 1024;
      *(_DWORD *)v28 = v15;
      _os_log_debug_impl(&dword_20D641000, v16, OS_LOG_TYPE_DEBUG, "%s: service %d, connect %d, after call, ret %x", buf, 0x1Eu);
    }
    v13 = IOServiceClose(connect);
LABEL_12:
    v17 = v13;
    goto LABEL_13;
  }
  v17 = 52;
LABEL_13:
  v18 = gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
    v23 = 1024;
    v24 = a1;
    v25 = 1024;
    v26 = a2;
    v27 = 1024;
    *(_DWORD *)v28 = a3;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = a5;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = v17;
    _os_log_impl(&dword_20D641000, v18, OS_LOG_TYPE_DEFAULT, "%s: service %d, categoryID 0x%x, propertyID 0x%x, dataSize %zu, ret %x", buf, 0x2Eu);
  }
  return v17;
}

os_log_t ____initLogging_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.ioamlib", "ioamlib");
  gLogObject = (uint64_t)result;
  return result;
}

uint64_t ____findCategoryEntry_block_invoke(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  const __CFNumber *Value;
  uint64_t result;
  unint64_t valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("CategoryID"));
  if (!Value)
    return 1;
  valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (valuePtr != *(unsigned __int16 *)(a1 + 48))
    return 1;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = theDict;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke_2(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  const __CFNumber *Value;
  uint64_t result;
  unint64_t valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("CategoryID"));
  if (!Value)
    return 1;
  valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (valuePtr != *(unsigned __int16 *)(a1 + 48))
    return 1;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = theDict;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke_3(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  const __CFNumber *Value;
  uint64_t result;
  unint64_t valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("PropertyID"));
  if (!Value)
    return 1;
  valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (valuePtr != *(unsigned __int16 *)(a1 + 48))
    return 1;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = theDict;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void *ResourceArbiterClientNotifyEvent(void *result, uint64_t a2, int a3, int a4)
{
  void *v5;

  v5 = result;
  if (a3 == -469794814)
  {
    result = (void *)objc_msgSend(result, "clientPriority");
    if ((_DWORD)result == a4)
      return (void *)objc_msgSend(v5, "resourceAccessRevoked");
  }
  else if (a3 == -469794815)
  {
    result = (void *)objc_msgSend(result, "clientPriority");
    if ((_DWORD)result == a4)
      return (void *)objc_msgSend(v5, "resourceAccessGranted");
  }
  return result;
}

uint64_t requestResource(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 0, input, 2u, 0, 0);
}

uint64_t releaseResource(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0, 0);
}

void IOAccessoryConfigStreamInterfaceGetCategories_cold_1(int a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "IOAccessoryConfigStreamInterfaceGetCategories";
  v5 = 1024;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_debug_impl(&dword_20D641000, log, OS_LOG_TYPE_DEBUG, "%s: service %d, categoryCount %d", (uint8_t *)&v3, 0x18u);
}

void IOAccessoryConfigStreamInterfaceGetCategories_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20D641000, v0, v1, "%s: service %d, categoryList %@ ", v2);
  OUTLINED_FUNCTION_2();
}

void IOAccessoryConfigStreamInterfaceGetCategoryProperties_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20D641000, v0, v1, "%s: service %d, categoryList %@ ", v2);
  OUTLINED_FUNCTION_2();
}

void IOAccessoryConfigStreamInterfaceGetProperty_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20D641000, v0, v1, "%s: service %d, categoryList %@ ", v2);
  OUTLINED_FUNCTION_2();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x24BDD7F10](*(_QWORD *)&connect, service);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x24BDD7FA0]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x24BDD7FA8](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x24BDD7FB0](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x24BDD7FB8](dataQueue);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x24BDD8920](*(_QWORD *)&entry, plane);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

