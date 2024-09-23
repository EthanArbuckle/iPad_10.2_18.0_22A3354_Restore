CFTypeRef SavageSafeRetain(CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  return cf;
}

void SavageCFDictionarySetInteger32(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  if (!v5)
    SavageCFDictionarySetInteger32_cold_1();
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void SavageCFDictionarySetBoolean(__CFDictionary *a1, const void *a2, int a3)
{
  const void **v3;

  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(a1, a2, *v3);
}

void SavageCFDictionarySetData(__CFDictionary *a1, const void *a2, UInt8 *bytes, CFIndex length)
{
  CFDataRef v6;
  CFDataRef v7;

  v6 = CFDataCreate(0, bytes, length);
  if (!v6)
    SavageCFDictionarySetData_cold_1();
  v7 = v6;
  CFDictionarySetValue(a1, a2, v6);
  CFRelease(v7);
}

uint64_t SavageCFStringToUInt32(const __CFString *a1, _DWORD *a2, int a3)
{
  uint64_t result;
  char buffer[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if ((_DWORD)result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, a3);
    return *__error() == 0;
  }
  return result;
}

CFErrorRef createCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  const __CFAllocator *v7;
  CFStringRef v8;
  const void *v9;
  CFStringRef v10;
  CFStringRef v11;
  __CFDictionary *Mutable;
  CFErrorRef v13;

  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@: %s"), a4, a1);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = CFStringCreateWithFormat(v7, 0, CFSTR("%@: Input Options: %@"), v8, a3);
  if (!v10)
  {
    v13 = 0;
    goto LABEL_4;
  }
  v11 = v10;
  Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBD3A0], v9);
  v13 = CFErrorCreate(v7, a4, a2, Mutable);
  CFRelease(v11);
  CFRelease(v9);
  v9 = Mutable;
  if (Mutable)
LABEL_4:
    CFRelease(v9);
  return v13;
}

uint64_t GetRelevantMeasurementTags(CFDictionaryRef theDict, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  int v10;
  const __CFData *v11;
  const __CFData *v12;
  CFTypeID v13;
  const UInt8 *BytePtr;
  unsigned int v15;
  int v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;

  result = 2;
  if (theDict && a2 && a3)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BEE7AC0]);
    if (!Value)
      return 17;
    v8 = Value;
    v9 = CFGetTypeID(Value);
    if (v9 != CFBooleanGetTypeID())
      return 17;
    v10 = CFBooleanGetValue(v8);
    v11 = (const __CFData *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BEE7AC8]);
    if (!v11)
      return 17;
    v12 = v11;
    v13 = CFGetTypeID(v11);
    if (v13 != CFDataGetTypeID())
      return 17;
    BytePtr = CFDataGetBytePtr(v12);
    if (BytePtr)
    {
      v15 = *BytePtr;
      v16 = ((v15 & 0xF0) + 96) >> 4;
      if ((v16 - 8) < 2)
      {
        v19 = (_QWORD *)MEMORY[0x24BEE7AF0];
        v20 = (_QWORD *)MEMORY[0x24BEE7AE8];
LABEL_23:
        v22 = v10 == 0;
        if (!v10)
          v19 = v20;
        *a2 = *v19;
        v23 = (uint64_t *)MEMORY[0x24BEE7B20];
        v24 = (uint64_t *)MEMORY[0x24BEE7B18];
LABEL_26:
        if (v22)
          v23 = v24;
        v25 = *v23;
        goto LABEL_29;
      }
      if (!(((v15 & 0xF0) + 96) >> 4))
      {
        v21 = (_QWORD *)MEMORY[0x24BEE7B00];
        v22 = v10 == 0;
        if (!v10)
          v21 = (_QWORD *)MEMORY[0x24BEE7AF8];
        *a2 = *v21;
        v23 = (uint64_t *)MEMORY[0x24BEE7B10];
        v24 = (uint64_t *)MEMORY[0x24BEE7B08];
        goto LABEL_26;
      }
      if (v16 == 4)
      {
        v17 = (uint64_t *)MEMORY[0x24BEE7B10];
        v18 = (uint64_t *)MEMORY[0x24BEE7B08];
LABEL_19:
        if (!v10)
          v17 = v18;
        v25 = *v17;
        *a2 = v25;
LABEL_29:
        result = 0;
        *a3 = v25;
        return result;
      }
      if (v15 >= 0xF0)
      {
        v17 = (uint64_t *)MEMORY[0x24BEE7B20];
        v18 = (uint64_t *)MEMORY[0x24BEE7B18];
        goto LABEL_19;
      }
    }
    v19 = (_QWORD *)MEMORY[0x24BEE7AE0];
    v20 = (_QWORD *)MEMORY[0x24BEE7AD8];
    goto LABEL_23;
  }
  return result;
}

uint64_t GetYonkersMeasurementTags(CFDictionaryRef theDict, CFTypeRef *a2, CFTypeRef *a3)
{
  uint64_t result;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  _BOOL4 v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  int valuePtr;

  valuePtr = 0;
  result = 2;
  if (theDict && a2)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BEE7BE8]);
    if (Value
      && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID())
      && (v10 = CFBooleanGetValue(v8) != 0,
          (v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BEE7BD8])) != 0)
      && (v12 = v11, v13 = CFGetTypeID(v11), v13 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      return GetYonkersFabRevisionTags(valuePtr, v10, a2, a3);
    }
    else
    {
      return 17;
    }
  }
  return result;
}

uint64_t GetYonkersFabRevisionTags(int a1, int a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v8;
  uint64_t v9;
  CFStringRef v10;
  CFStringRef v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  const __CFAllocator *v15;
  uint64_t v16;
  int *v17;
  int v18;
  _BOOL8 v19;
  int v20;
  uint64_t v21;
  const __CFAllocator *v22;

  v8 = 0;
  v9 = 0;
  while (dword_2218EBFA0[v9] != a1)
  {
    ++v9;
    v8 -= 2;
    if (v9 == 6)
    {
      v10 = 0;
      v11 = 0;
      v12 = 2;
      goto LABEL_6;
    }
  }
  v13 = a2 != 0;
  v14 = v13 | (8 * (v9 < 4));
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Yonkers,SysTopPatch%X"), (v13 - v8));
  v11 = CFStringCreateWithFormat(v15, 0, CFSTR("Yonkers,SysTopPatch%X"), v14);
  v12 = 0;
LABEL_6:
  v16 = 0;
  v17 = &dword_2218EBFB8;
  while (1)
  {
    v18 = *v17++;
    if (v18 == a1)
      break;
    v16 -= 2;
    if (v16 == -16)
    {
      if (!a3)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  v19 = a2 != 0;
  if ((v19 - v16) < 8)
    v20 = 8;
  else
    v20 = -8;
  v21 = (v20 | v19) - v16;
  v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Yonkers,SysTopPatch%X"), v19 - v16);
  v11 = CFStringCreateWithFormat(v22, 0, CFSTR("Yonkers,SysTopPatch%X"), v21);
  v12 = 0;
  if (!a3)
    goto LABEL_17;
LABEL_15:
  if (v10)
    *a3 = CFRetain(v10);
LABEL_17:
  if (a4 && v11)
    *a4 = CFRetain(v11);
  if (v10)
    CFRelease(v10);
  if (v11)
    CFRelease(v11);
  return v12;
}

uint64_t _hexStringToBytes(_BYTE *a1, uint64_t *a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  char v13;
  char v14;
  char v15;
  unsigned int v16;
  unsigned int v17;
  char v18;
  char v19;

  v4 = 2;
  if ((a4 & 1) == 0 && *a2 >= a4 >> 1 && a1 && a3)
  {
    v5 = 0;
    *a2 = 0;
    if (a4 < 2)
    {
LABEL_27:
      v4 = 0;
      *a2 = v5;
      a1[v5] = 0;
    }
    else
    {
      if (a4 >> 1 <= 1)
        v5 = 1;
      else
        v5 = a4 >> 1;
      v6 = MEMORY[0x24BDAC740];
      v7 = a1;
      v8 = v5;
      while (1)
      {
        v9 = *a3;
        if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x10000) == 0)
          return 2;
        v10 = a3[1];
        if ((*(_DWORD *)(v6 + 4 * v10 + 60) & 0x10000) == 0)
          return 2;
        v11 = v9 - 48;
        v12 = v9 - 97;
        if ((v9 - 65) >= 6)
          v13 = -1;
        else
          v13 = v9 - 55;
        v14 = v9 - 87;
        if (v12 > 5)
          v14 = v13;
        if (v11 < 0xA)
          v14 = v11;
        v15 = 16 * v14;
        v16 = v10 - 48;
        v17 = v10 - 97;
        if ((v10 - 65) >= 6)
          v18 = -1;
        else
          v18 = v10 - 55;
        v19 = v10 - 87;
        if (v17 > 5)
          v19 = v18;
        if (v16 < 0xA)
          v19 = v16;
        *v7++ = v19 | v15;
        a3 += 2;
        if (!--v8)
          goto LABEL_27;
      }
    }
  }
  return v4;
}

_QWORD *YonkersDevice::getInstance(YonkersDevice *this)
{
  _QWORD *v1;

  v1 = operator new(0x38uLL);
  *(_WORD *)v1 = 0;
  v1[1] = 0;
  v1[2] = 0;
  *((_DWORD *)v1 + 6) = 0x10000;
  *(_QWORD *)((char *)v1 + 44) = 0;
  *(_QWORD *)((char *)v1 + 36) = 0;
  *((_DWORD *)v1 + 13) = 0;
  *((_BYTE *)v1 + 28) = 0;
  YonkersDevice::SetupDevice((io_iterator_t *)v1);
  YonkersDevice::CheckProvisioningStatus((YonkersDevice *)v1);
  YonkersDevice::myInstance = (uint64_t)v1;
  return v1;
}

void sub_2218D3048(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void YonkersDevice::YonkersDevice(YonkersDevice *this)
{
  *(_WORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0x10000;
  *(_QWORD *)((char *)this + 44) = 0;
  *(_QWORD *)((char *)this + 36) = 0;
  *((_DWORD *)this + 13) = 0;
  *((_BYTE *)this + 28) = 0;
  YonkersDevice::SetupDevice((io_iterator_t *)this);
  YonkersDevice::CheckProvisioningStatus(this);
}

void YonkersDevice::destroyInstance(YonkersDevice *this)
{
  void *v1;

  if (YonkersDevice::myInstance)
  {
    YonkersDevice::~YonkersDevice((YonkersDevice *)YonkersDevice::myInstance);
    operator delete(v1);
    YonkersDevice::myInstance = 0;
  }
}

uint64_t YonkersDevice::SetupDevice(io_iterator_t *this)
{
  mach_port_t v2;
  io_registry_entry_t v3;
  uint64_t v4;
  io_iterator_t *v5;
  const __CFDictionary *v6;
  uint64_t MatchingServices;
  const __CFAllocator **v8;
  const __CFData *CFProperty;
  const __CFData *v10;
  CFTypeID v11;
  io_object_t v12;
  io_registry_entry_t v13;
  const __CFAllocator *v14;
  CFMutableDictionaryRef properties;

  properties = 0;
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  v4 = 0;
  v5 = this + 9;
  while (1)
  {
    v6 = IOServiceMatching(off_24E75A8B8[v4]);
    MatchingServices = IOServiceGetMatchingServices(v2, v6, this + 9);
    if (!(_DWORD)MatchingServices)
    {
      if (*v5)
        break;
    }
    *v5 = 0;
    if (++v4 == 3)
    {
      LODWORD(v4) = 1;
      goto LABEL_6;
    }
  }
  if ((v4 - 1) < 2)
    *((_BYTE *)this + 27) = 1;
LABEL_6:
  v8 = (const __CFAllocator **)MEMORY[0x24BDBD240];
  if (v3)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("development-cert"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v10 = CFProperty;
      v11 = CFGetTypeID(CFProperty);
      if (v11 == CFDataGetTypeID())
        *((_BYTE *)this + 26) = *CFDataGetBytePtr(v10) == 0;
      CFRelease(v10);
    }
  }
  v12 = IOIteratorNext(*v5);
  if (v12)
  {
    v13 = v12;
    v14 = *v8;
    while (1)
    {
      MatchingServices = IORegistryEntryCreateCFProperties(v13, &properties, v14, 0);
      if (!(_DWORD)MatchingServices)
      {
        if (this[10])
        {
          MatchingServices = 0;
        }
        else
        {
          this[10] = v13;
          if (!(_DWORD)v4)
            YonkersDevice::ReadSensorType((YonkersDevice *)this);
          MatchingServices = YonkersDevice::YonkersDeviceOpen((YonkersDevice *)this);
          if (!(_DWORD)MatchingServices)
          {
LABEL_23:
            if (properties)
              CFRelease(properties);
            return MatchingServices;
          }
          YonkersDevice::YonkersDeviceClose((YonkersDevice *)this);
          if (properties)
          {
            CFRelease(properties);
            properties = 0;
          }
          IOObjectRelease(this[10]);
          this[10] = 0;
        }
      }
      v13 = IOIteratorNext(*v5);
      if (!v13)
        goto LABEL_23;
    }
  }
  return MatchingServices;
}

uint64_t YonkersDevice::CheckProvisioningStatus(YonkersDevice *this)
{
  uint64_t v2;
  const __CFAllocator *v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  CFTypeID v6;
  const __CFData *v7;
  CFTypeID v8;
  const UInt8 *BytePtr;
  unsigned int v10;
  uint64_t i;
  uint64_t v12;
  const __CFData *v13;
  CFTypeID v14;
  _OWORD v16[2];
  UInt8 buffer[8];
  uint64_t v18;
  uint64_t v19;
  CFRange v20;
  CFRange v21;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097136;
  *(_QWORD *)buffer = 0;
  v18 = 0;
  memset(v16, 0, sizeof(v16));
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersUID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFGetTypeID(CFProperty);
    if (v6 != CFDataGetTypeID())
      goto LABEL_24;
    v20.location = 0;
    v20.length = 16;
    CFDataGetBytes(v5, v20, buffer);
    CFRelease(v5);
    *((_QWORD *)this + 1) = bswap64(*(unint64_t *)buffer);
    v7 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersFabRevision"), v3, 0);
    if (!v7)
      return 0;
    v5 = v7;
    v8 = CFGetTypeID(v7);
    if (v8 != CFDataGetTypeID())
    {
      v2 = 0;
      goto LABEL_24;
    }
    BytePtr = CFDataGetBytePtr(v5);
    if (BytePtr)
      v10 = __rev16(*(unsigned __int16 *)BytePtr);
    else
      v10 = 0;
    CFRelease(v5);
    for (i = 0; i != 5; ++i)
    {
      if (v10 == dword_2218EBFD8[i])
      {
        *(_BYTE *)this = 0;
        goto LABEL_18;
      }
    }
    if (*(_BYTE *)this)
    {
      v12 = 0;
      while (v10 != dword_2218EBFEC[v12])
      {
        if (++v12 == 10)
          goto LABEL_18;
      }
      *((_BYTE *)this + 1) = 1;
    }
LABEL_18:
    v13 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersPubKeyHmac"), v3, 0);
    if (v13)
    {
      v5 = v13;
      v14 = CFGetTypeID(v13);
      if (v14 == CFDataGetTypeID())
      {
        v21.location = 0;
        v21.length = 32;
        CFDataGetBytes(v5, v21, (UInt8 *)v16);
        CFRelease(v5);
        v2 = 0;
        *((_QWORD *)this + 2) = bswap64(*(unint64_t *)&v16[0]);
        return v2;
      }
LABEL_24:
      CFRelease(v5);
    }
  }
  return v2;
}

void YonkersDevice::~YonkersDevice(YonkersDevice *this)
{
  io_object_t v2;
  io_object_t v3;

  v2 = *((_DWORD *)this + 9);
  if (v2)
    IOObjectRelease(v2);
  v3 = *((_DWORD *)this + 10);
  if (v3)
    IOObjectRelease(v3);
  YonkersDevice::YonkersDeviceClose(this);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t YonkersDevice::YonkersDeviceClose(YonkersDevice *this)
{
  uint64_t result;
  mach_port_t v3;
  uint64_t v4;

  if (*((_BYTE *)this + 27))
  {
    SavageCamInterfaceClose();
    result = 0;
    *((_QWORD *)this + 6) = 0;
  }
  else
  {
    v3 = *((_DWORD *)this + 11);
    if (v3)
    {
      v4 = IOConnectCallScalarMethod(v3, 4u, 0, 0, 0, 0);
      IOServiceClose(*((_DWORD *)this + 11));
      *((_DWORD *)this + 11) = 0;
      return v4;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

void YonkersDevice::ReadSensorType(YonkersDevice *this)
{
  const __CFData *v2;
  const __CFData *v3;
  CFTypeID v4;
  UInt8 buffer[4];
  CFRange v6;

  v2 = (const __CFData *)IORegistryEntrySearchCFProperty(*((_DWORD *)this + 10), "IOService", CFSTR("sensor-type"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  *(_DWORD *)buffer = 0;
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFDataGetTypeID())
    {
      v6.location = 0;
      v6.length = 4;
      CFDataGetBytes(v3, v6, buffer);
      if ((*(_DWORD *)buffer - 167) <= 0x1D && ((1 << (buffer[0] + 89)) & 0x3800000F) != 0)
      {
        *(_BYTE *)this = 1;
        *((_DWORD *)this + 8) = 2;
      }
      else
      {
        *(_BYTE *)this = 0;
      }
    }
    CFRelease(v3);
  }
}

uint64_t YonkersDevice::YonkersDeviceOpen(YonkersDevice *this)
{
  uint64_t *v2;
  uint64_t result;
  int v4;
  mach_port_t v5;
  uint64_t v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 27) == 1)
  {
    v6[0] = 0;
    v2 = (uint64_t *)((char *)this + 48);
    result = SavageCamInterfaceOpen();
    if ((_DWORD)result)
      return result;
    result = *v2;
    if (!*v2)
      return result;
    result = SavageCamInterfaceGetSensorInfo();
    if ((_DWORD)result)
      return result;
    *((_DWORD *)this + 8) = v6[0];
    v4 = BYTE4(v6[0]);
    *((_BYTE *)this + 28) = BYTE4(v6[0]);
    *(_BYTE *)this = BYTE5(v6[0]);
    if (!v4)
      YonkersDevice::YonkersDeviceClose(this);
  }
  if (*((_BYTE *)this + 28))
    return 0;
  if (*((_DWORD *)this + 11))
    return 3758097093;
  LODWORD(result) = IOServiceOpen(*((_DWORD *)this + 10), *MEMORY[0x24BDAEC58], 0x2Au, (io_connect_t *)this + 11);
  v5 = *((_DWORD *)this + 11);
  if (v5)
    result = result;
  else
    result = 3758097084;
  if (!(_DWORD)result)
  {
    v6[0] = 0;
    return IOConnectCallScalarMethod(v5, 3u, v6, 1u, 0, 0);
  }
  return result;
}

uint64_t YonkersDevice::CreateCertInfoBlob(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const __CFAllocator *v5;
  const __CFData *CFProperty;
  const __CFData *v7;
  CFTypeID v8;
  const UInt8 *BytePtr;
  int v10;
  const __CFData *v11;
  CFTypeID v12;
  unsigned int *v13;
  const __CFData *v14;
  CFTypeID v15;
  const __CFData *v16;
  CFTypeID v17;
  const __CFData *v18;
  CFTypeID v19;
  CFRange v21;
  CFRange v22;
  CFRange v23;

  v4 = 3758097136;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), CFSTR("YonkersMNS"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
    return v4;
  v7 = CFProperty;
  v8 = CFGetTypeID(CFProperty);
  if (v8 != CFDataGetTypeID())
    goto LABEL_19;
  BytePtr = CFDataGetBytePtr(v7);
  if (BytePtr)
  {
    v10 = *BytePtr;
    if (v10 == 4)
    {
      *(_DWORD *)a2 = 0;
      v10 = *BytePtr;
    }
    if (v10 == 8)
      *(_DWORD *)a2 = 1;
  }
  CFRelease(v7);
  v11 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), CFSTR("YonkersChipID"), v5, 0);
  if (!v11)
    return v4;
  v7 = v11;
  v12 = CFGetTypeID(v11);
  if (v12 != CFDataGetTypeID())
    goto LABEL_19;
  v13 = (unsigned int *)CFDataGetBytePtr(v7);
  if (v13)
    *(_DWORD *)(a2 + 4) = bswap32(*v13);
  CFRelease(v7);
  v14 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), CFSTR("YonkersUID"), v5, 0);
  if (!v14)
    return v4;
  v7 = v14;
  v15 = CFGetTypeID(v14);
  if (v15 != CFDataGetTypeID())
    goto LABEL_19;
  v21.location = 0;
  v21.length = 16;
  CFDataGetBytes(v7, v21, (UInt8 *)(a2 + 8));
  CFRelease(v7);
  v16 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), CFSTR("YonkersPubKey"), v5, 0);
  if (!v16)
    return v4;
  v7 = v16;
  v17 = CFGetTypeID(v16);
  if (v17 != CFDataGetTypeID())
  {
LABEL_19:
    CFRelease(v7);
    return v4;
  }
  v22.location = 0;
  v22.length = 64;
  CFDataGetBytes(v7, v22, (UInt8 *)(a2 + 24));
  CFRelease(v7);
  v18 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 40), CFSTR("YonkersPubKeyHmac"), v5, 0);
  if (v18)
  {
    v7 = v18;
    v19 = CFGetTypeID(v18);
    if (v19 == CFDataGetTypeID())
    {
      v23.location = 0;
      v23.length = 32;
      CFDataGetBytes(v7, v23, (UInt8 *)(a2 + 88));
      v4 = 0;
    }
    goto LABEL_19;
  }
  return v4;
}

uint64_t YonkersDevice::CreateDeviceInfoDict(YonkersDevice *this, __CFDictionary *a2)
{
  uint64_t v4;
  const __CFAllocator *v5;
  CFTypeRef CFProperty;
  const void *v7;
  CFTypeID v8;
  CFTypeRef v9;
  CFTypeID v10;
  CFTypeRef v11;
  CFTypeID v12;
  const UInt8 *BytePtr;
  int v14;
  char v15;
  BOOL v16;
  int v17;
  CFTypeRef v19;
  CFTypeID v20;
  unsigned int *v21;
  CFTypeRef v22;
  CFTypeID v23;
  const UInt8 *v24;
  int v25;

  v4 = 3758097136;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersUID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
    return v4;
  v7 = CFProperty;
  v8 = CFGetTypeID(CFProperty);
  if (v8 != CFDataGetTypeID())
    goto LABEL_29;
  CFDictionaryAddValue(a2, (const void *)*MEMORY[0x24BEE7BD0], v7);
  CFRelease(v7);
  v9 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersNonce"), v5, 0);
  if (!v9)
    return v4;
  v7 = v9;
  v10 = CFGetTypeID(v9);
  if (v10 != CFDataGetTypeID())
    goto LABEL_29;
  CFDictionaryAddValue(a2, (const void *)*MEMORY[0x24BEE7BE0], v7);
  CFRelease(v7);
  v11 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersFabRevision"), v5, 0);
  if (!v11)
    return v4;
  v7 = v11;
  v12 = CFGetTypeID(v11);
  if (v12 != CFDataGetTypeID())
    goto LABEL_29;
  BytePtr = CFDataGetBytePtr((CFDataRef)v7);
  if (BytePtr)
  {
    v14 = __rev16(*(unsigned __int16 *)BytePtr);
    v15 = 1;
    if (v14 > 59904)
    {
      v16 = v14 == 59905;
      v17 = 61953;
    }
    else
    {
      v16 = v14 == 54529;
      v17 = 56577;
    }
    if (!v16 && v14 != v17)
      v15 = 0;
    *((_BYTE *)this + 24) = v15;
    SavageCFDictionarySetInteger32(a2, (const void *)*MEMORY[0x24BEE7BD8], v14);
  }
  CFRelease(v7);
  v19 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersChipID"), v5, 0);
  if (!v19)
    return v4;
  v7 = v19;
  v20 = CFGetTypeID(v19);
  if (v20 != CFDataGetTypeID())
  {
LABEL_29:
    CFRelease(v7);
    return v4;
  }
  v21 = (unsigned int *)CFDataGetBytePtr((CFDataRef)v7);
  if (v21)
    SavageCFDictionarySetInteger32(a2, (const void *)*MEMORY[0x24BEE7BC8], bswap32(*v21));
  CFRelease(v7);
  v22 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 10), CFSTR("YonkersMNS"), v5, 0);
  if (v22)
  {
    v7 = v22;
    v23 = CFGetTypeID(v22);
    if (v23 == CFDataGetTypeID())
    {
      v24 = CFDataGetBytePtr((CFDataRef)v7);
      if (v24)
      {
        v25 = *v24;
        if (v25 == 4)
        {
          *((_BYTE *)this + 25) = 0;
          v25 = *v24;
        }
        if (v25 == 8)
          *((_BYTE *)this + 25) = 1;
      }
      SavageCFDictionarySetBoolean(a2, CFSTR("YonkersIsProvisioned"), *((unsigned __int8 *)this + 8));
      v4 = 0;
    }
    goto LABEL_29;
  }
  return v4;
}

uint64_t YonkersDevice::PrePersonalize(YonkersDevice *this, unsigned int a2)
{
  mach_port_t v3;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 28))
    return SavageCamInterfaceSensorPrePersonalize();
  v3 = *((_DWORD *)this + 11);
  if (!v3)
    return 3758097084;
  v4[0] = a2;
  return IOConnectCallScalarMethod(v3, 0x43u, v4, 1u, 0, 0);
}

uint64_t YonkersDevice::PreFusing(YonkersDevice *this, unsigned int a2)
{
  mach_port_t v3;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 28))
    return SavageCamInterfaceSensorPreFusing();
  v3 = *((_DWORD *)this + 11);
  if (!v3)
    return 3758097084;
  v4[0] = a2;
  return IOConnectCallScalarMethod(v3, 0x44u, v4, 1u, 0, 0);
}

uint64_t YonkersDevice::Fusing(YonkersDevice *this, unsigned int a2, const unsigned __int8 *a3, unsigned int a4)
{
  uint64_t v5;
  uint64_t v6;
  mach_port_t v8;
  uint64_t v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 28))
  {
    v5 = SavageCamInterfaceSensorFusing();
LABEL_3:
    v6 = v5;
    goto LABEL_4;
  }
  v8 = *((_DWORD *)this + 11);
  v9[2] = a2;
  v6 = 3758097090;
  if (a3 && a4)
  {
    v9[0] = (uint64_t)a3;
    v9[1] = a4;
    if (!v8)
    {
      v6 = 3758097084;
      goto LABEL_4;
    }
    v5 = IOConnectCallScalarMethod(v8, 0x45u, v9, 3u, 0, 0);
    goto LABEL_3;
  }
LABEL_4:
  *((_QWORD *)this + 1) = 0;
  YonkersDevice::CheckProvisioningStatus(this);
  return v6;
}

uint64_t YonkersUpdateController::getInstance(YonkersUpdateController *this, const __CFDictionary *a2, void *a3, void *a4)
{
  YonkersUpdateController *v7;

  v7 = (YonkersUpdateController *)operator new(0xA0uLL);
  YonkersUpdateController::YonkersUpdateController(v7);
  YonkersUpdateController::myInstance = (uint64_t)v7;
  *(_QWORD *)v7 = a3;
  *((_QWORD *)v7 + 1) = a2;
  YonkersUpdateController::YonkersLog(v7, "%s - %p (%p) - UpdaterIsSupported = %d; YonkersIsPresent = %d \n",
    "getInstance",
    v7,
    *((const void **)v7 + 3),
    *((unsigned __int8 *)v7 + 34),
    *(unsigned __int8 *)(*((_QWORD *)v7 + 3) + 1));
  YonkersUpdateController::start((YonkersUpdateController *)YonkersUpdateController::myInstance, this);
  return YonkersUpdateController::myInstance;
}

void sub_2218D3EA0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void YonkersUpdateController::YonkersLog(YonkersUpdateController *this, const char *a2, ...)
{
  uint64_t v2;
  const char *v3;
  uint8_t buf[4];
  char *v5;
  char __str[4096];
  uint64_t v7;
  va_list va;

  va_start(va, a2);
  v2 = MEMORY[0x24BDAC7A8](this, a2);
  v7 = *MEMORY[0x24BDAC8D0];
  vsnprintf(__str, 0x1000uLL, v3, va);
  if (*(_QWORD *)v2)
  {
    (*(void (**)(_QWORD, char *))v2)(*(_QWORD *)(v2 + 8), __str);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v5 = __str;
    _os_log_impl(&dword_2218D1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "YonkersLog: %s \n", buf, 0xCu);
  }
}

uint64_t YonkersUpdateController::start(YonkersUpdateController *this, const __CFDictionary *a2)
{
  const void *Value;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFTypeID v7;
  const char *CStringPtr;
  const char *v9;
  const char *v10;
  const void *v11;
  CFTypeID v12;
  const __CFString *v13;
  const __CFString *v14;
  CFTypeID v15;
  CFMutableStringRef *v16;
  const __CFString *v17;
  const __CFString *v18;
  CFTypeID v19;
  const __CFBoolean *v20;
  const __CFBoolean *v21;
  CFTypeID v22;
  const __CFBoolean *v23;
  const __CFBoolean *v24;
  CFTypeID v25;
  BOOL v26;
  const __CFBoolean *v27;
  const __CFBoolean *v28;
  CFTypeID v29;
  uint64_t v30;
  int v31;
  const __CFDictionary *v32;
  const __CFDictionary *v33;
  const __CFBoolean *v34;
  const __CFBoolean *v35;
  CFTypeID v36;
  BOOL v37;
  const __CFString *v38;
  const __CFString *v39;
  CFTypeID v40;
  const __CFBoolean *v42;
  const __CFBoolean *v43;
  CFTypeID v44;

  *((_BYTE *)this + 21) = 1;
  if (*((_BYTE *)this + 34))
    YonkersDevice::CheckProvisioningStatus(*((YonkersDevice **)this + 3));
  YonkersUpdateController::YonkersLog(this, "%s: isProvisioned=%d; isSocProdFused=%d; persoLoop = %d\n",
    "start",
    *(_QWORD *)(*((_QWORD *)this + 3) + 8),
    *(unsigned __int8 *)(*((_QWORD *)this + 3) + 26),
    *((_DWORD *)this + 39));
  if (a2)
  {
    Value = CFDictionaryGetValue(a2, CFSTR("Options"));
    v5 = (const __CFDictionary *)SavageSafeRetain(Value);
    if (!v5 || (v6 = v5, v7 = CFGetTypeID(v5), v7 != CFDictionaryGetTypeID()))
    {
      YonkersUpdateController::YonkersLog(this, "Yonkers: restoreOptions missing or not a dictionary\n");
      a2 = 0;
      goto LABEL_47;
    }
    if (!CFDictionaryGetCount(v6))
    {
      a2 = 0;
      *((_BYTE *)this + 32) = 1;
      goto LABEL_47;
    }
    a2 = (const __CFDictionary *)CFCopyDescription(v6);
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a2, 0);
    v9 = CFStringGetCStringPtr(CFSTR("Options"), 0);
    v10 = "No C string description available.";
    if (CStringPtr)
      v10 = CStringPtr;
    YonkersUpdateController::YonkersLog(this, "%s [input]: %s %s \n", "start", v9, v10);
    v11 = CFDictionaryGetValue(v6, (const void *)*MEMORY[0x24BEE7BA0]);
    if (v11)
    {
      v12 = CFGetTypeID(v11);
      if (v12 == CFBooleanGetTypeID())
        *((_BYTE *)this + 32) = 1;
    }
    v13 = (const __CFString *)CFDictionaryGetValue(v6, CFSTR("PersonalizedFirmwareRootPath"));
    if (v13 && (v14 = v13, v15 = CFGetTypeID(v13), v15 == CFStringGetTypeID()))
    {
      v16 = (CFMutableStringRef *)((char *)this + 56);
    }
    else
    {
      v17 = (const __CFString *)CFDictionaryGetValue(v6, CFSTR("RestoreSystemPartition"));
      if (!v17)
        goto LABEL_19;
      v18 = v17;
      v19 = CFGetTypeID(v17);
      if (v19 != CFStringGetTypeID())
        goto LABEL_19;
      v16 = (CFMutableStringRef *)((char *)this + 56);
      CFStringAppend(*((CFMutableStringRef *)this + 7), v18);
      v14 = CFSTR("/usr/standalone/firmware/Yonkers/");
    }
    CFStringAppend(*v16, v14);
LABEL_19:
    v20 = (const __CFBoolean *)CFDictionaryGetValue(v6, CFSTR("RestoreInternal"));
    if (v20)
    {
      v21 = v20;
      v22 = CFGetTypeID(v20);
      if (v22 == CFBooleanGetTypeID())
        *((_BYTE *)this + 35) = CFBooleanGetValue(v21);
    }
    v23 = (const __CFBoolean *)CFDictionaryGetValue(v6, CFSTR("PostFDRSealing"));
    if (v23)
    {
      v24 = v23;
      v25 = CFGetTypeID(v23);
      if (v25 == CFBooleanGetTypeID())
      {
        if (*((_BYTE *)this + 33))
          v26 = 1;
        else
          v26 = CFBooleanGetValue(v24) != 0;
        *((_BYTE *)this + 33) = v26;
      }
    }
    v27 = (const __CFBoolean *)CFDictionaryGetValue(v6, CFSTR("FlipFusingState"));
    if (v27)
    {
      v28 = v27;
      v29 = CFGetTypeID(v27);
      if (v29 == CFBooleanGetTypeID() && CFBooleanGetValue(v28) == 1)
      {
        v30 = *((_QWORD *)this + 3);
        if (!*(_QWORD *)(v30 + 8))
        {
          if (*(_BYTE *)(v30 + 26))
            v31 = 2;
          else
            v31 = 4;
          *((_DWORD *)this + 39) = v31;
        }
      }
    }
    v32 = (const __CFDictionary *)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x24BEE7B98]);
    if (v32)
    {
      v33 = v32;
      v34 = (const __CFBoolean *)CFDictionaryGetValue(v32, (const void *)*MEMORY[0x24BEE7BB0]);
      if (v34)
      {
        v35 = v34;
        v36 = CFGetTypeID(v34);
        if (v36 == CFBooleanGetTypeID())
        {
          if (*((_BYTE *)this + 33))
            v37 = 1;
          else
            v37 = CFBooleanGetValue(v35) != 0;
          *((_BYTE *)this + 33) = v37;
        }
      }
      if (!*(_QWORD *)(*((_QWORD *)this + 3) + 8))
      {
        v42 = (const __CFBoolean *)CFDictionaryGetValue(v33, CFSTR("FusingOption"));
        if (v42)
        {
          v43 = v42;
          v44 = CFGetTypeID(v42);
          if (v44 == CFBooleanGetTypeID())
            *((_BYTE *)this + 17) = CFBooleanGetValue(v43);
        }
      }
      v38 = (const __CFString *)CFDictionaryGetValue(v33, CFSTR("CertificationURL"));
      if (v38)
      {
        v39 = v38;
        v40 = CFGetTypeID(v38);
        if (v40 == CFStringGetTypeID())
          *((_BYTE *)this + 19) = CFStringGetLength(v39) != 0;
      }
    }
    else
    {
      YonkersUpdateController::YonkersLog(this, "Yonkers: No YonkersOptions \n");
    }
  }
LABEL_47:
  if (*((_BYTE *)this + 35))
  {
    if (*(_QWORD *)(*((_QWORD *)this + 3) + 8)
      || *((_BYTE *)this + 17)
      || *((_BYTE *)this + 19)
      || *((_BYTE *)this + 16))
    {
      *((_DWORD *)this + 39) = 1;
    }
  }
  else
  {
    *((_DWORD *)this + 39) = 1;
    if (!*(_BYTE *)(*((_QWORD *)this + 3) + 1))
      *((_BYTE *)this + 33) = 1;
  }
  if (a2)
    CFRelease(a2);
  return 0;
}

void YonkersUpdateController::destroyInstance(YonkersUpdateController *this)
{
  YonkersDevice *v1;
  void *v2;

  if (YonkersUpdateController::myInstance)
  {
    YonkersUpdateController::YonkersLog((YonkersUpdateController *)YonkersUpdateController::myInstance, "%s - %p (%p) - UpdaterIsSupported = %d; YonkersIsPresent = %d \n",
      "destroyInstance",
      (const void *)YonkersUpdateController::myInstance,
      *(const void **)(YonkersUpdateController::myInstance + 24),
      *(unsigned __int8 *)(YonkersUpdateController::myInstance + 34),
      *(unsigned __int8 *)(*(_QWORD *)(YonkersUpdateController::myInstance + 24) + 1));
    YonkersDevice::destroyInstance(v1);
    if (YonkersUpdateController::myInstance)
    {
      YonkersUpdateController::~YonkersUpdateController((YonkersUpdateController *)YonkersUpdateController::myInstance);
      operator delete(v2);
    }
    YonkersUpdateController::myInstance = 0;
  }
}

void YonkersUpdateController::YonkersUpdateController(YonkersUpdateController *this)
{
  YonkersDevice *Mutable;
  _QWORD *Instance;
  int v4;
  int v5;

  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = 0;
  *((_DWORD *)this + 38) = 2;
  *((_DWORD *)this + 22) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 16) = 0;
  Mutable = (YonkersDevice *)CFStringCreateMutable(0, 0);
  *((_QWORD *)this + 7) = Mutable;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_BYTE *)this + 32) = 0;
  Instance = YonkersDevice::getInstance(Mutable);
  *((_QWORD *)this + 3) = Instance;
  v4 = *((_DWORD *)Instance + 8);
  v5 = *(unsigned __int8 *)Instance;
  *((_BYTE *)this + 34) = v5;
  *((_BYTE *)this + 33) = v5 == 0;
  *((_DWORD *)this + 4) = 0x10000;
  *((_WORD *)this + 10) = 1;
  *((_DWORD *)this + 38) = v4;
  *((_DWORD *)this + 39) = 1;
  *((_BYTE *)this + 35) = 0;
}

void YonkersUpdateController::~YonkersUpdateController(YonkersUpdateController *this)
{
  const void *v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (const void *)*((_QWORD *)this + 5);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 5) = 0;
  }
  v3 = (const void *)*((_QWORD *)this + 7);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)this + 7) = 0;
  }
  v4 = (void *)*((_QWORD *)this + 10);
  if (v4)
  {
    free(v4);
    *((_QWORD *)this + 10) = 0;
  }
  v5 = (void *)*((_QWORD *)this + 14);
  if (v5)
  {
    free(v5);
    *((_QWORD *)this + 14) = 0;
  }
  v6 = (void *)*((_QWORD *)this + 18);
  if (v6)
  {
    free(v6);
    *((_QWORD *)this + 18) = 0;
  }
}

uint64_t YonkersUpdateController::execCommand(YonkersUpdateController *this, CFStringRef theString, const __CFDictionary *a3, const __CFDictionary **a4)
{
  const char *CStringPtr;
  const void *v9;
  const char *v10;
  uint64_t Info;
  uint64_t v12;
  const __CFString *v13;
  uint64_t Stage;
  const __CFDictionary *v15;
  const void *v16;
  const void *Value;
  const char *v18;
  const char *v19;
  const void *v20;
  const char *v21;

  if (!theString)
    goto LABEL_26;
  CStringPtr = CFStringGetCStringPtr(theString, 0);
  YonkersUpdateController::YonkersLog(this, "%s: Entering execCommand: command = %s, persoLoop = %d \n", "execCommand", CStringPtr, *((_DWORD *)this + 39));
  if (*((_BYTE *)this + 33))
    goto LABEL_26;
  if (a3)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Input specified to the processing command\n", "execCommand");
    v9 = (const void *)*((_QWORD *)this + 5);
    if (v9)
    {
      CFRelease(v9);
      *((_QWORD *)this + 5) = 0;
    }
    *((_QWORD *)this + 5) = CFRetain(a3);
  }
  if (CFStringCompare(theString, CFSTR("queryInfo"), 0))
  {
    if (CFStringCompare(theString, CFSTR("performNextStage"), 0))
    {
      v10 = CFStringGetCStringPtr(theString, 0);
      YonkersUpdateController::YonkersLog(this, "%s: Unsupported command: %s\n", "execCommand", v10);
      goto LABEL_26;
    }
    if (YonkersUpdateController::getFirmware(this, (unsigned __int8 **)this + 10, (unsigned int *)this + 22, (const __CFString *)*MEMORY[0x24BEE7B80])|| YonkersUpdateController::getFirmware(this, (unsigned __int8 **)this + 12, (unsigned int *)this + 26, (const __CFString *)*MEMORY[0x24BEE7B88])|| YonkersUpdateController::getTSSResponse(this))
    {
      goto LABEL_26;
    }
    Stage = YonkersUpdateController::eventCmdPerformNextStage(this);
    if (!(_DWORD)Stage)
    {
      if (!*((_BYTE *)this + 17) && !*((_BYTE *)this + 21) && !*((_BYTE *)this + 19) && !*((_BYTE *)this + 16))
        *((_BYTE *)this + 33) = 1;
      YonkersUpdateController::YonkersLog(this, "%s: isProvisioned=%d \n", "execCommand", *(_QWORD *)(*((_QWORD *)this + 3) + 8));
      if (!a4)
        goto LABEL_26;
      goto LABEL_23;
    }
    v12 = Stage;
    v13 = 0;
  }
  else
  {
    Info = YonkersUpdateController::eventCmdQueryInfo(this);
    v12 = Info;
    v13 = 0;
    if (a4 && !(_DWORD)Info)
    {
LABEL_23:
      v15 = (const __CFDictionary *)*((_QWORD *)this + 6);
      if (v15)
      {
        if (*a4)
        {
          v16 = (const void *)*MEMORY[0x24BEE7B78];
          Value = CFDictionaryGetValue(v15, (const void *)*MEMORY[0x24BEE7B78]);
          CFDictionarySetValue(*a4, v16, Value);
          YonkersUpdateController::YonkersLog(this, "%s: Add the results of the command processed to the output \n");
        }
        else
        {
          *a4 = (const __CFDictionary *)SavageSafeRetain(v15);
          YonkersUpdateController::YonkersLog(this, "%s: Send out the results in fOutput of the command processed\n");
        }
        v13 = CFCopyDescription(*a4);
        v18 = CFStringGetCStringPtr(v13, 0);
        if (v18)
          v19 = v18;
        else
          v19 = "No C string description available.";
        YonkersUpdateController::YonkersLog(this, "%s [output]: %s %s \n", "execCommand", "output dictionary of execCommand", v19);
        goto LABEL_32;
      }
LABEL_26:
      v13 = 0;
LABEL_32:
      v12 = 0;
    }
  }
  v20 = (const void *)*((_QWORD *)this + 6);
  if (v20)
  {
    CFRelease(v20);
    *((_QWORD *)this + 6) = 0;
  }
  if (v13)
    CFRelease(v13);
  v21 = CFStringGetCStringPtr(theString, 0);
  YonkersUpdateController::YonkersLog(this, "%s: Exiting execCommand: command = %s, result = 0x%X, persoLoop = %d \n", "execCommand", v21, v12, *((_DWORD *)this + 39));
  return v12;
}

uint64_t YonkersUpdateController::eventCmdQueryInfo(YonkersUpdateController *this)
{
  const __CFAllocator *v2;
  const CFDictionaryKeyCallBacks *v3;
  const CFDictionaryValueCallBacks *v4;
  __CFDictionary *Mutable;
  uint64_t DeviceInfoDict;
  uint64_t v7;
  int v8;
  BOOL v9;
  int v10;
  uint64_t YonkersMeasurementTags;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *((_QWORD *)this + 6) = CFDictionaryCreateMutable(v2, 0, v3, v4);
  if (*((_BYTE *)this + 17) == 1)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Begin Fusing \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7C28], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7C20], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7C08], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7BF8], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7C00], 1);
    DeviceInfoDict = YonkersDevice::PreFusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38));
    if ((_DWORD)DeviceInfoDict)
      goto LABEL_28;
    YonkersUpdateController::YonkersLog(this, "%s: Finished pre-fusing \n");
  }
  else if (*((_BYTE *)this + 19) == 1)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Begin Certification \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7BF8], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7C00], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7C08], 1);
    DeviceInfoDict = YonkersDevice::PreFusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38));
    if ((_DWORD)DeviceInfoDict)
      goto LABEL_28;
    YonkersUpdateController::YonkersLog(this, "%s: Finished pre-certification \n");
  }
  else if (*((_BYTE *)this + 21) == 1)
  {
    YonkersUpdateController::YonkersLog(this, "%s: Begin Personalization \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7C00], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7BB8], 1);
    SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7BF8], 1);
    YonkersUpdateController::YonkersLog(this, "%s: Finished pre-personalizing \n");
  }
  DeviceInfoDict = YonkersDevice::CreateDeviceInfoDict(*((YonkersDevice **)this + 3), Mutable);
  if ((_DWORD)DeviceInfoDict)
  {
LABEL_28:
    YonkersMeasurementTags = DeviceInfoDict;
    if (!Mutable)
      return YonkersMeasurementTags;
    goto LABEL_26;
  }
  v7 = *((_QWORD *)this + 3);
  if (*((_BYTE *)this + 35) == 1
    && !*(_QWORD *)(v7 + 8)
    && !*((_BYTE *)this + 17)
    && !*((_BYTE *)this + 19)
    && *((_BYTE *)this + 21) == 1)
  {
    v8 = *((_DWORD *)this + 39);
    if (v8 == 4 || v8 == 2)
    {
      v9 = *(_BYTE *)(v7 + 24) == 0;
      *(_BYTE *)(v7 + 24) = *(_BYTE *)(v7 + 24) == 0;
      if (v9)
        v10 = 59905;
      else
        v10 = 6657;
      SavageCFDictionarySetInteger32(Mutable, (const void *)*MEMORY[0x24BEE7BD8], v10);
      v8 = *((_DWORD *)this + 39);
      v7 = *((_QWORD *)this + 3);
    }
    if (v8 >= 3)
      *(_BYTE *)(v7 + 25) = *(_BYTE *)(v7 + 25) == 0;
  }
  SavageCFDictionarySetBoolean(Mutable, CFSTR("YonkersIsYmgt"), *(unsigned __int8 *)(v7 + 24));
  SavageCFDictionarySetBoolean(Mutable, (const void *)*MEMORY[0x24BEE7BE8], *(unsigned __int8 *)(*((_QWORD *)this + 3) + 25));
  YonkersMeasurementTags = GetYonkersMeasurementTags(Mutable, (CFTypeRef *)this + 8, (CFTypeRef *)this + 9);
  if (!(_DWORD)YonkersMeasurementTags)
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 6), (const void *)*MEMORY[0x24BEE7B78], Mutable);
  if (Mutable)
LABEL_26:
    CFRelease(Mutable);
  return YonkersMeasurementTags;
}

uint64_t YonkersUpdateController::getFirmware(YonkersUpdateController *this, unsigned __int8 **a2, unsigned int *a3, const __CFString *a4)
{
  const __CFDictionary *v5;
  const __CFDictionary *Value;
  const __CFDictionary *v10;
  CFTypeID v11;
  const __CFData *v12;
  const __CFData *v13;
  CFTypeID v14;
  unsigned int Length;
  unsigned __int8 *v16;
  CFRange v18;

  v5 = (const __CFDictionary *)*((_QWORD *)this + 5);
  if (!v5)
    return 2;
  Value = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("FirmwareData"));
  if (!Value)
    return 10;
  v10 = Value;
  v11 = CFGetTypeID(Value);
  if (v11 != CFDictionaryGetTypeID())
    return 10;
  v12 = (const __CFData *)CFDictionaryGetValue(v10, a4);
  if (!v12)
    return 10;
  v13 = v12;
  v14 = CFGetTypeID(v12);
  if (v14 != CFDataGetTypeID())
    return 10;
  Length = CFDataGetLength(v13);
  *a3 = Length;
  if (!*((_DWORD *)this + 22))
    return 4;
  v16 = (unsigned __int8 *)calloc(Length, 1uLL);
  *a2 = v16;
  if (!*((_QWORD *)this + 10))
    return 3;
  v18.length = *a3;
  v18.location = 0;
  CFDataGetBytes(v13, v18, v16);
  return 0;
}

uint64_t YonkersUpdateController::getTSSResponse(YonkersUpdateController *this)
{
  const __CFDictionary *v2;
  const __CFData *Value;
  const __CFData *v4;
  CFTypeID v5;
  unsigned __int8 *BytePtr;
  int Length;

  v2 = (const __CFDictionary *)*((_QWORD *)this + 5);
  if (!v2)
    return 2;
  Value = (const __CFData *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x24BEE7C18]);
  if (!Value)
    return 10;
  v4 = Value;
  v5 = CFGetTypeID(Value);
  if (v5 != CFDataGetTypeID())
    return 10;
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v4);
  Length = CFDataGetLength(v4);
  YonkersUpdateController::getSignedCertificate(this, BytePtr);
  if (!*((_QWORD *)this + 14))
    return 3;
  YonkersUpdateController::YonkersLog(this, "%s - %d bytes\n", "getTSSResponse", Length);
  return 0;
}

uint64_t YonkersUpdateController::eventCmdPerformNextStage(YonkersUpdateController *this)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t result;

  if (*((_BYTE *)this + 17) != 1)
  {
    if (*((_BYTE *)this + 19) != 1)
    {
      if (*((_BYTE *)this + 21) == 1)
      {
        YonkersUpdateController::formatAndStitchFiles(this);
        YonkersUpdateController::writeFilesToFileSystem(this);
        v8 = *((_DWORD *)this + 39) - 1;
        *((_DWORD *)this + 39) = v8;
        if (!v8)
        {
          *((_BYTE *)this + 21) = 0;
          YonkersUpdateController::YonkersLog(this, "%s: Finished Personalization \n", "eventCmdPerformNextStage");
        }
      }
      return 0;
    }
    YonkersUpdateController::YonkersLog(this, "%s: Begin reading info needed for certification \n", "eventCmdPerformNextStage");
    YonkersUpdateController::formatAndStitchFiles(this);
    YonkersDevice::Fusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38), *((const unsigned __int8 **)this + 18), *((_DWORD *)this + 35));
    v5 = *(_QWORD *)(*((_QWORD *)this + 3) + 16);
    v6 = -536870167;
    if (v5)
      v6 = 0;
    YonkersUpdateController::YonkersLog(this, "%s: Extracting certification data is done with result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v6, *((unsigned __int8 *)this + 20));
    v7 = *((unsigned __int8 *)this + 20);
    if (v5)
    {
      *((_BYTE *)this + 19) = 0;
      if (!v7)
        return 0;
    }
    else if (!*((_BYTE *)this + 20))
    {
      result = 3758097129;
      *((_BYTE *)this + 19) = 0;
      return result;
    }
    result = 0;
    *((_BYTE *)this + 20) = 0;
    return result;
  }
  YonkersUpdateController::YonkersLog(this, "%s: Begin actual Fusing \n", "eventCmdPerformNextStage");
  YonkersUpdateController::formatAndStitchFiles(this);
  YonkersDevice::Fusing(*((YonkersDevice **)this + 3), *((_DWORD *)this + 38), *((const unsigned __int8 **)this + 18), *((_DWORD *)this + 35));
  v2 = *(_QWORD *)(*((_QWORD *)this + 3) + 8);
  v3 = -536870167;
  if (v2)
    v3 = 0;
  YonkersUpdateController::YonkersLog(this, "%s: Finished fusing with result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v3, *((unsigned __int8 *)this + 18));
  v4 = *((unsigned __int8 *)this + 18);
  if (v2)
  {
    *((_BYTE *)this + 17) = 0;
    if (!v4)
      return 0;
    goto LABEL_18;
  }
  if (*((_BYTE *)this + 18))
  {
LABEL_18:
    result = 0;
    *((_BYTE *)this + 18) = 0;
    return result;
  }
  result = 3758097129;
  *((_BYTE *)this + 17) = 0;
  return result;
}

void YonkersUpdateController::formatAndStitchFiles(YonkersUpdateController *this)
{
  int v1;
  int v2;
  int v4;
  int v5;
  size_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  int v10;
  unint64_t v11;
  char v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = *((_DWORD *)this + 22);
  v2 = *((_DWORD *)this + 30);
  HIBYTE(v23) = 0;
  if (*((_QWORD *)this + 10) && *((_QWORD *)this + 14))
  {
    v4 = 3 * v2;
    if (*((_BYTE *)this + 17) == 1 || *((_BYTE *)this + 19) == 1)
      v5 = 3 * v1 + 6;
    else
      v5 = 3 * v1;
    v6 = (v4 + v5 + 80);
    *((_DWORD *)this + 35) = v6;
    v7 = (char *)calloc(v6, 1uLL);
    *((_QWORD *)this + 18) = v7;
    if (v7)
    {
      *(_DWORD *)v7 = 0;
      *((_DWORD *)v7 + 1) = v4 + 48;
      *((_DWORD *)v7 + 2) = v5;
      *(_QWORD *)(v7 + 20) = 0;
      *(_QWORD *)(v7 + 12) = 0;
      *((_DWORD *)v7 + 7) = 0;
      YonkersUpdateController::YonkersLog(this, "%s -  theCompletePatchFileLen=%d, signedCertificateLen=%d, firmwareDataLen=%d \n", "formatAndStitchFiles", *((_DWORD *)this + 35), *((_DWORD *)this + 30), *((_DWORD *)this + 22));
      v8 = 0;
      v9 = (char *)&v23 + 3;
      v10 = 4608;
      while (1)
      {
        v11 = *((unsigned int *)this + 35);
        if (v8 + 35 > v11)
          break;
        *(_BYTE *)(*((_QWORD *)this + 18) + v8 + 32) = BYTE1(v10);
        *(_BYTE *)(*((_QWORD *)this + 18) + v8 + 33) = v10;
        v12 = *v9--;
        *(_BYTE *)(*((_QWORD *)this + 18) + v8 + 34) = v12;
        ++v10;
        v8 += 3;
        if (v8 == 48)
        {
          LODWORD(v11) = *((_DWORD *)this + 35);
          v13 = 80;
          goto LABEL_13;
        }
      }
      v13 = v8 + 32;
LABEL_13:
      v14 = v13 + 3;
      if (v13 + 3 <= v11)
      {
        if (*((_DWORD *)this + 30))
        {
          v15 = 0;
          v16 = v13;
          v17 = 0x2000;
          while (1)
          {
            v13 = v16 + 3;
            if (v16 + 3 > (unint64_t)*((unsigned int *)this + 35))
              break;
            *(_BYTE *)(*((_QWORD *)this + 18) + v16) = BYTE1(v17);
            *(_BYTE *)(*((_QWORD *)this + 18) + v16 + 1) = v17;
            *(_BYTE *)(*((_QWORD *)this + 18) + v16 + 2) = *(_BYTE *)(*((_QWORD *)this + 14) + v15++);
            ++v17;
            v16 += 3;
            if (v15 >= *((unsigned int *)this + 30))
            {
              LODWORD(v11) = *((_DWORD *)this + 35);
              goto LABEL_20;
            }
          }
          LODWORD(v11) = *((_DWORD *)this + 35);
          v13 = v16;
LABEL_20:
          v14 = v13 + 3;
        }
        if (v14 <= v11)
        {
          if (*((_DWORD *)this + 22))
          {
            v18 = 0;
            v19 = 0;
            v20 = 9568;
            do
            {
              v21 = v13 + v18;
              if (v21 + 3 > (unint64_t)*((unsigned int *)this + 35))
                break;
              *(_BYTE *)(*((_QWORD *)this + 18) + v13 + v18) = BYTE1(v20);
              *(_BYTE *)(*((_QWORD *)this + 18) + v21 + 1) = v20;
              *(_BYTE *)(*((_QWORD *)this + 18) + v21 + 2) = *(_BYTE *)(*((_QWORD *)this + 10) + v19++);
              ++v20;
              v18 += 3;
            }
            while (v19 < *((unsigned int *)this + 22));
            v13 += v18;
          }
          if (*((_BYTE *)this + 17) == 1 || *((_BYTE *)this + 19) == 1)
          {
            v22 = v13 + 3;
            if (v22 <= *((_DWORD *)this + 35))
            {
              *(_BYTE *)(*((_QWORD *)this + 18) + v13) = 17;
              *(_BYTE *)(*((_QWORD *)this + 18) + v13 + 1) = 3;
              *(_BYTE *)(*((_QWORD *)this + 18) + v13 + 2) = 1;
              if (v13 + 6 <= *((_DWORD *)this + 35))
              {
                *(_BYTE *)(*((_QWORD *)this + 18) + v22) = 17;
                *(_BYTE *)(*((_QWORD *)this + 18) + v13 + 4) = 19;
                *(_BYTE *)(*((_QWORD *)this + 18) + v13 + 5) = 1;
              }
            }
          }
        }
      }
    }
  }
}

void YonkersUpdateController::writeFilesToFileSystem(YonkersUpdateController *this)
{
  const __CFAllocator *v2;
  const CFArrayCallBacks *v3;
  __CFArray *Mutable;
  __CFArray *v5;
  __CFArray *v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const char *CStringPtr;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  CFStringRef v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  CFStringRef v21;

  YonkersUpdateController::YonkersLog(this, "Yonkers: YonkersUpdateController::writeFilesToFileSystem: persoLoop=%d, isProd=%d, isYmgt=%d\n", *((_DWORD *)this + 39), *(unsigned __int8 *)(*((_QWORD *)this + 3) + 25), *(unsigned __int8 *)(*((_QWORD *)this + 3) + 24));
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  CFArrayAppendValue(Mutable, *((const void **)this + 7));
  v5 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v5, *((const void **)this + 7));
  v6 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v6, *((const void **)this + 7));
  CFArrayAppendValue(v6, CFSTR("/YonkersPatchBinaryPlusHeader.FW"));
  if (*((_BYTE *)this + 17) == 1)
  {
    CFArrayAppendValue(Mutable, CFSTR("/YonkersPatchFusing.DAT"));
    v7 = CFSTR("/YonkersPatchFusing.DER");
LABEL_8:
    CFArrayAppendValue(v5, v7);
    goto LABEL_9;
  }
  if (*((_BYTE *)this + 19) == 1)
  {
    CFArrayAppendValue(Mutable, CFSTR("/YonkersPatchCertification.DAT"));
    v7 = CFSTR("/YonkersPatchCertification.DER");
    goto LABEL_8;
  }
  if (*((_BYTE *)this + 21) != 1)
    goto LABEL_9;
  v8 = *((_QWORD *)this + 3);
  if (*(_QWORD *)(v8 + 8))
  {
    CFArrayAppendValue(Mutable, CFSTR("/YonkersPatch.DAT"));
    v7 = CFSTR("/YonkersPatch.DER");
    goto LABEL_8;
  }
  if (*(_BYTE *)(v8 + 24))
    v15 = "Ymgt";
  else
    v15 = "Ngsk";
  if (*(_BYTE *)(v8 + 25))
    v16 = "Prod";
  else
    v16 = "Dev";
  v17 = CFStringCreateWithFormat(v2, 0, CFSTR("/YonkersPatch%s%s.DAT"), v15, v16);
  CFArrayAppendValue(Mutable, v17);
  if (v17)
    CFRelease(v17);
  v18 = *((_QWORD *)this + 3);
  if (*(_BYTE *)(v18 + 24))
    v19 = "Ymgt";
  else
    v19 = "Ngsk";
  if (*(_BYTE *)(v18 + 25))
    v20 = "Prod";
  else
    v20 = "Dev";
  v21 = CFStringCreateWithFormat(v2, 0, CFSTR("/YonkersPatch%s%s.DER"), v19, v20);
  CFArrayAppendValue(v5, v21);
  if (v21)
    CFRelease(v21);
LABEL_9:
  v9 = CFStringCreateByCombiningStrings(v2, Mutable, &stru_24E75AD68);
  v10 = CFStringCreateByCombiningStrings(v2, v5, &stru_24E75AD68);
  v11 = CFStringCreateByCombiningStrings(v2, v6, &stru_24E75AD68);
  CStringPtr = CFStringGetCStringPtr(v11, 0);
  YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", CStringPtr, *((_DWORD *)this + 22));
  YonkersUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 10), *((unsigned int *)this + 22), v11);
  YonkersUpdateController::writeFWFilesToFileSystem(this);
  v13 = CFStringGetCStringPtr(v10, 0);
  YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v13, *((_DWORD *)this + 30));
  YonkersUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 14), *((unsigned int *)this + 30), v10);
  v14 = CFStringGetCStringPtr(v9, 0);
  YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v14, *((_DWORD *)this + 35));
  YonkersUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 18), *((unsigned int *)this + 35), v9);
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
  if (v11)
    CFRelease(v11);
  if (Mutable)
    CFRelease(Mutable);
  if (v5)
    CFRelease(v5);
  if (v6)
    CFRelease(v6);
}

void YonkersUpdateController::getSignedCertificate(YonkersUpdateController *this, unsigned __int8 *a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  uint64_t v22;
  size_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unsigned int v41;
  int v42;
  uint64_t v43;
  size_t v44;
  size_t v45;
  int v46;
  int v47;
  size_t v48;
  size_t v49;
  int v50;
  int v51;
  size_t v52;
  int v53;
  int v54;
  size_t v55;
  size_t v56;
  int v57;
  int v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  unsigned int v65;
  int v66;
  unsigned int v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  int32x2_t v72;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  unsigned int v82;
  int v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  size_t __n;
  unsigned __int8 *__dst;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93[2];
  char v94[4096];
  uint64_t v95;

  v2 = MEMORY[0x24BDAC7A8](this, a2);
  v4 = v3;
  v6 = v5;
  v7 = v2;
  v95 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v93 = 0;
  v8 = (unsigned __int8 *)calloc(0x4AuLL, 1uLL);
  __dst = (unsigned __int8 *)calloc(0x4AuLL, 1uLL);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: TSS Response:--------------Total Length = %d \n", v4);
  if (v4)
  {
    LODWORD(v9) = 0;
    do
    {
      bzero(v94, 0x1000uLL);
      v10 = 0;
      v9 = v9;
      do
      {
        v11 = snprintf(&v94[v10], 5uLL, " %02X ", v6[v9++]);
        if (v9 >= v4)
          break;
        v10 += v11;
      }
      while ((v10 + 5) < 0x1000);
      YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: %s \n", v94);
    }
    while (v9 < v4);
  }
  v12 = v6[1];
  if ((char)v6[1] < 0)
  {
    v14 = v12 & 0x7F;
    if (v14 > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v12 & 0x7F) != 0)
    {
      v12 = v6[2];
      if (v14 != 1)
        v12 = v6[3] | (v12 << 8);
    }
    else
    {
      v12 = 0;
    }
    v13 = v14 + 11;
  }
  else
  {
    v13 = 11;
  }
  if ((char)v6[v13 + 1] < 0)
  {
    v16 = v6[v13 + 1] & 0x7F;
    if (v16 > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v6[v13 + 1] & 0x7F) != 0)
    {
      v17 = 0;
      v18 = 0;
      v19 = &v6[v13 + 2];
      do
      {
        v20 = *v19++;
        v18 = (v18 << v17) | v20;
        v17 += 8;
      }
      while (8 * v16 != v17);
    }
    else
    {
      v18 = 0;
    }
    v15 = v16 + v18;
  }
  else
  {
    v15 = v6[v13 + 1];
  }
  v21 = v15 + 2;
  v22 = v6[v15 + 3 + v13];
  v23 = v22 + 2;
  v92 = v22 + 2;
  __n = v15 + 2 + v13;
  v24 = v22 + 2 + v15 + 2 + v13;
  v25 = v6[v24 + 1];
  if ((v25 & 0x80) != 0)
  {
    v28 = v25 & 0x7F;
    if ((v25 & 0x7Fu) > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v25 & 0x7F) != 0)
    {
      v29 = 0;
      v25 = 0;
      v30 = v21 + v13 + v22 + 4;
      do
      {
        v25 = (v25 << v29) | v6[v30++];
        v29 += 8;
      }
      while (8 * v28 != v29);
    }
    else
    {
      v25 = 0;
    }
    v27 = v28 + 2;
    v26 = v24 + 9 + v28 + 2;
  }
  else
  {
    v26 = v24 + 11;
    v27 = 2;
  }
  if ((char)v6[v27 + v24 + 1] < 0)
  {
    v33 = v6[v27 + v24 + 1] & 0x7F;
    if (v33 > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v6[v27 + v24 + 1] & 0x7F) != 0)
    {
      v34 = 0;
      v31 = 0;
      v35 = v21 + v13 + v27 + v22 + 4;
      do
      {
        v31 = (v31 << v34) | v6[v35++];
        v34 += 8;
      }
      while (8 * v33 != v34);
    }
    else
    {
      v31 = 0;
    }
    v32 = v33 + 2;
  }
  else
  {
    v31 = v6[v27 + v24 + 1];
    v32 = 2;
  }
  v36 = v32 + v26;
  v84 = v12;
  v81 = v21;
  v82 = v13;
  v80 = v22;
  v86 = (v27 + v24 + 1);
  v87 = (v24 + 1);
  v85 = v25;
  v79 = v27;
  if ((char)v6[v32 + v26 + 1] < 0)
  {
    v38 = v6[v32 + v26 + 1] & 0x7F;
    if (v38 > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v6[v32 + v26 + 1] & 0x7F) != 0)
    {
      v39 = 0;
      v40 = 0;
      v41 = v26 + v32 + 2;
      do
      {
        v40 = (v40 << v39) | v6[v41++];
        v39 += 8;
      }
      while (8 * v38 != v39);
    }
    else
    {
      v40 = 0;
    }
    v37 = v38 + v40;
  }
  else
  {
    v37 = v6[v32 + v26 + 1];
  }
  v42 = v37 + 2 + v36;
  v43 = v6[v42 + 1];
  v44 = v43 + 2;
  v91 = v43 + 2;
  v88 = v42;
  v83 = v24;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: fwSigOffset = 0x%02X, fwSigEncapLen = 0x%02X, lfManifestStartOffset = 0x%02X, im4cSeqStartOffset = 0x%02X, im4cStartOffset = 0x%02X, lfSigOffset = 0x%02X, lfSigEncapLen = 0x%02X \n", __n, v22 + 2, v24, v27 + v24, v36, v42, v43 + 2);
  memcpy(v8, &v6[__n], v23);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "FirmwareSignature (Pre-validation):--------------offset = %d (%d)\n", __n, v23);
  bzero(v94, 0x1000uLL);
  v45 = 0;
  v46 = 0;
  do
  {
    v47 = snprintf(&v94[v46], 5uLL, " %02X ", v8[v45++]);
    if (v45 >= v23)
      break;
    v46 += v47;
  }
  while ((v46 + 5) < 0x1000);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  YonkersUpdateController::validateSignatureLen((YonkersUpdateController *)v7, v8, &v92, &v93[1]);
  v48 = v92;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "FirmwareSignature (Post-validation):--------------offset = %d (%d)\n", __n, v92);
  bzero(v94, 0x1000uLL);
  if ((_DWORD)v48)
  {
    v49 = 0;
    v50 = 0;
    do
    {
      v51 = snprintf(&v94[v50], 5uLL, " %02X ", v8[v49++]);
      if (v49 >= v48)
        break;
      v50 += v51;
    }
    while ((v50 + 5) < 0x1000);
  }
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  memcpy(__dst, &v6[v88], v44);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "LeafSignature (Pre-validation):--------------offset = %d (%d)\n", v88, v44);
  bzero(v94, 0x1000uLL);
  v52 = 0;
  v53 = 0;
  do
  {
    v54 = snprintf(&v94[v53], 5uLL, " %02X ", __dst[v52++]);
    if (v52 >= v44)
      break;
    v53 += v54;
  }
  while ((v53 + 5) < 0x1000);
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  YonkersUpdateController::validateSignatureLen((YonkersUpdateController *)v7, __dst, &v91, v93);
  v55 = v91;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "LeafSignature (Post-validation):--------------offset = %d (%d)\n", v88, v91);
  bzero(v94, 0x1000uLL);
  if ((_DWORD)v55)
  {
    v56 = 0;
    v57 = 0;
    do
    {
      v58 = snprintf(&v94[v57], 5uLL, " %02X ", __dst[v56++]);
      if (v56 >= v55)
        break;
      v57 += v58;
    }
    while ((v57 + 5) < 0x1000);
  }
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "%s \n", v94);
  v59 = v93[0];
  v60 = v93[0] + v31;
  v61 = (char)v6[v86];
  if (v61 < 0)
  {
    v62 = v87;
    if ((v61 & 0x7Fu) > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v6[v86] & 0x7F) != 0)
    {
      v63 = v81 + v82 + v79 + v80 + 4;
      v64 = 8 * (v6[v86] & 0x7F);
      do
      {
        v64 -= 8;
        v6[v63++] = v60 >> v64;
      }
      while (v64);
    }
  }
  else
  {
    v6[v86] = v60;
    v62 = v87;
  }
  v65 = v59 + v85;
  v66 = (char)v6[v62];
  if (v66 < 0)
  {
    if ((v66 & 0x7Fu) > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v6[v62] & 0x7F) != 0)
    {
      v67 = v81 + v82 + v80 + 4;
      v68 = 8 * (v6[v62] & 0x7F);
      do
      {
        v68 -= 8;
        v6[v67++] = v65 >> v68;
      }
      while (v68);
    }
  }
  else
  {
    v6[v62] = v65;
  }
  v69 = v59 + v84 + v93[1];
  if ((char)v6[1] < 0)
  {
    v71 = v6[1] & 0x7F;
    if (v71 > 2)
      YonkersUpdateController::getSignedCertificate();
    if ((v6[1] & 0x7F) != 0)
    {
      v72 = vmovn_s64((int64x2_t)vcgeq_u64((uint64x2_t)vdupq_n_s64(v71 - 1), (uint64x2_t)xmmword_2218EC020));
      if ((v72.i8[0] & 1) != 0)
        v6[2] = v69 >> (8 * v71 - 8);
      if ((v72.i8[4] & 1) != 0)
        v6[3] = v69 >> (8 * v71 - 16);
    }
    v70 = v69 + v71 + 2;
  }
  else
  {
    v6[1] = v69;
    v70 = v69 + 2;
  }
  *(_DWORD *)(v7 + 120) = v70;
  YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: signedCertLen = 0x%02X, totalManifestLen = 0x%02X, lfManifestLen = 0x%02X, im4cSeqLen = 0x%02X \n", v70, v69, v65, v60);
  v73 = calloc(*(unsigned int *)(v7 + 120), 1uLL);
  *(_QWORD *)(v7 + 112) = v73;
  if (v73)
  {
    memcpy(v73, v6, __n);
    memcpy((void *)(*(_QWORD *)(v7 + 112) + __n), v8, v48);
    memcpy((void *)(*(_QWORD *)(v7 + 112) + __n + v48), &v6[v83], (v88 - v83));
    memcpy((void *)(*(_QWORD *)(v7 + 112) + __n + v48 + (v88 - v83)), __dst, v55);
    YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: Signed Certificate:-------------- Length = %d \n", *(_DWORD *)(v7 + 120));
    v74 = *(unsigned int *)(v7 + 120);
    if ((_DWORD)v74)
    {
      v75 = 0;
      do
      {
        bzero(v94, 0x1000uLL);
        if (v75 < v74)
        {
          v76 = 0;
          v77 = 0;
          do
          {
            v78 = snprintf(&v94[v77], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v7 + 112) + v75 + v76++));
            if (v76 + v75 >= *(unsigned int *)(v7 + 120))
              break;
            v77 += v78;
          }
          while ((v77 + 5) < 0x1000);
          v75 = (v75 + v76);
        }
        YonkersUpdateController::YonkersLog((YonkersUpdateController *)v7, "Yonkers: %s \n", v94);
        v74 = *(unsigned int *)(v7 + 120);
      }
      while (v75 < v74);
    }
  }
}

void YonkersUpdateController::validateSignatureLen(YonkersUpdateController *this, unsigned __int8 *a2, unsigned int *a3, unsigned int *a4)
{
  unsigned __int8 v8;
  unsigned __int8 v9;
  uint64_t v10;
  size_t v11;
  unsigned __int8 v12;
  unsigned __int8 *v13;
  uint64_t v14;
  size_t v15;

  v8 = a2[1];
  v9 = a2[3];
  v10 = a2[5];
  YonkersUpdateController::YonkersLog(this, "\n %s -- r length = %d \n", "validateSignatureLen", a2[5]);
  if ((v10 - 34) <= 0xDEu)
    YonkersUpdateController::validateSignatureLen();
  if (v10 <= 0x1F)
  {
    v11 = 32 - v10;
    YonkersUpdateController::YonkersLog(this, "\n %s -- Padding the r value with %d zero bytes \n", "validateSignatureLen", v11);
    memmove(&a2[v11 + 6], a2 + 6, *a3 - 6);
    bzero(a2 + 6, v11);
    a2[5] = 32;
    v9 += v11;
    v8 += v11;
    *a3 += v11;
  }
  v12 = a2[5] + 7;
  v13 = &a2[v12];
  v14 = *v13;
  YonkersUpdateController::YonkersLog(this, "\n %s -- s length = %d \n", "validateSignatureLen", *v13);
  if ((v14 - 34) <= 0xDEu)
    YonkersUpdateController::validateSignatureLen();
  if (v14 <= 0x1F)
  {
    v15 = 32 - v14;
    YonkersUpdateController::YonkersLog(this, "\n %s -- Padding the s value with %d zero bytes \n", "validateSignatureLen", v15);
    memmove(&v13[v15 + 1], v13 + 1, *a3 + ~v12);
    bzero(&a2[v12 + 1], v15);
    a2[v12] = 32;
    v9 += v15;
    v8 += v15;
    *a3 += v15;
  }
  *a4 = v8 - a2[1];
  a2[3] = v9;
  a2[1] = v8;
}

void YonkersUpdateController::writeDataToFileURL(YonkersUpdateController *this, unsigned __int8 *a2, CFIndex length, const __CFString *a4)
{
  CFDataRef v6;
  CFURLRef v7;

  v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, length);
  v7 = CFURLCreateWithFileSystemPath(0, a4, kCFURLPOSIXPathStyle, 0);
  if (MEMORY[0x227672D74]())
    YonkersUpdateController::YonkersLog(this, "%s: AMSupportMakeDirectory failed with fileNameFS \n", "writeDataToFileURL");
  if (AMSupportWriteDataToFileURL())
    YonkersUpdateController::YonkersLog(this, "%s: AMSupportWriteDataToFileURL failed with fileNameFS \n", "writeDataToFileURL");
  AMSupportPlatformFileURLExists();
  YonkersUpdateController::YonkersLog(this, "%s: File does not exist\n", "writeDataToFileURL");
  if (v6)
    CFRelease(v6);
  if (v7)
    CFRelease(v7);
}

void YonkersUpdateController::writeFWFilesToFileSystem(YonkersUpdateController *this)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFIndex v7;
  CFIndex v8;
  const __CFAllocator *v9;
  __CFArray *Mutable;
  uint64_t v11;
  CFStringRef v12;
  const __CFString *v13;
  const char *CStringPtr;
  YonkersUpdateController *v15;
  unsigned __int8 *v16;
  CFIndex v17;
  BOOL v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;

  v2 = 0;
  v3 = 104;
  if (*(_BYTE *)(*((_QWORD *)this + 3) + 24))
    v4 = 104;
  else
    v4 = 88;
  if (*(_BYTE *)(*((_QWORD *)this + 3) + 24))
    v3 = 88;
  v5 = 96;
  if (*(_BYTE *)(*((_QWORD *)this + 3) + 24))
    v6 = 96;
  else
    v6 = 80;
  if (*(_BYTE *)(*((_QWORD *)this + 3) + 24))
    v5 = 80;
  v19 = *(unsigned __int8 **)((char *)this + v6);
  v20 = *(unsigned __int8 **)((char *)this + v5);
  v7 = *(unsigned int *)((char *)this + v3);
  v8 = *(unsigned int *)((char *)this + v4);
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  do
  {
    Mutable = CFArrayCreateMutable(v9, 0, MEMORY[0x24BDBD690]);
    if (*(_BYTE *)(*((_QWORD *)this + 3) + 25))
      v11 = v2 + 1;
    else
      v11 = v2;
    v12 = CFStringCreateWithFormat(v9, 0, CFSTR("Yonkers,SysTopPatch%X"), v11);
    CFArrayAppendValue(Mutable, *((const void **)this + 7));
    CFArrayAppendValue(Mutable, v12);
    v13 = CFStringCreateByCombiningStrings(v9, Mutable, &stru_24E75AD68);
    CStringPtr = CFStringGetCStringPtr(v13, 0);
    if (v2 > 7)
    {
      YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFWFilesToFileSystem", CStringPtr, v7);
      v15 = this;
      v16 = v20;
      v17 = v7;
    }
    else
    {
      YonkersUpdateController::YonkersLog(this, "%s: %s (%d)\n", "writeFWFilesToFileSystem", CStringPtr, v8);
      v15 = this;
      v16 = v19;
      v17 = v8;
    }
    YonkersUpdateController::writeDataToFileURL(v15, v16, v17, v13);
    if (v12)
      CFRelease(v12);
    if (v13)
      CFRelease(v13);
    if (Mutable)
      CFRelease(Mutable);
    v18 = v2 >= 0xE;
    v2 += 2;
  }
  while (!v18);
}

SavageDevice *SavageDevice::getInstance(SavageDevice *this)
{
  SavageDevice *v1;

  v1 = (SavageDevice *)operator new(0x88uLL);
  SavageDevice::SavageDevice(v1);
  SavageDevice::myInstance = (uint64_t)v1;
  return v1;
}

void sub_2218D631C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void SavageDevice::destroyInstance(SavageDevice *this)
{
  void *v1;

  if (SavageDevice::myInstance)
  {
    SavageDevice::~SavageDevice((SavageDevice *)SavageDevice::myInstance);
    operator delete(v1);
    SavageDevice::myInstance = 0;
  }
}

void SavageDevice::SavageDevice(SavageDevice *this)
{
  *((_WORD *)this + 8) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_DWORD *)this + 16) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_BYTE *)this + 70) = 1;
  *((_WORD *)this + 52) = 0;
  SavageDevice::SetupDevice((io_iterator_t *)this);
  SavageDevice::CheckProvisioningStatus(this);
  *((_WORD *)this + 34) = 0;
  *((_BYTE *)this + 18) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
}

uint64_t SavageDevice::SetupDevice(io_iterator_t *this)
{
  mach_port_t v2;
  io_registry_entry_t v3;
  uint64_t v4;
  io_iterator_t *v5;
  const __CFDictionary *v6;
  uint64_t MatchingServices;
  const __CFAllocator **v8;
  const __CFData *CFProperty;
  const __CFData *v10;
  CFTypeID v11;
  io_object_t v12;
  io_registry_entry_t v13;
  const __CFAllocator *v14;
  CFMutableDictionaryRef properties;

  properties = 0;
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  v4 = 0;
  v5 = this + 29;
  while (1)
  {
    v6 = IOServiceMatching(off_24E75A8D0[v4]);
    MatchingServices = IOServiceGetMatchingServices(v2, v6, this + 29);
    if (!(_DWORD)MatchingServices)
    {
      if (*v5)
        break;
    }
    *v5 = 0;
    if (++v4 == 3)
    {
      LODWORD(v4) = 1;
      goto LABEL_6;
    }
  }
  if ((v4 - 1) < 2)
    *((_BYTE *)this + 104) = 1;
LABEL_6:
  v8 = (const __CFAllocator **)MEMORY[0x24BDBD240];
  if (v3)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("development-cert"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v10 = CFProperty;
      v11 = CFGetTypeID(CFProperty);
      if (v11 == CFDataGetTypeID())
        *((_BYTE *)this + 70) = *CFDataGetBytePtr(v10) == 0;
      CFRelease(v10);
    }
  }
  v12 = IOIteratorNext(*v5);
  if (v12)
  {
    v13 = v12;
    v14 = *v8;
    while (1)
    {
      MatchingServices = IORegistryEntryCreateCFProperties(v13, &properties, v14, 0);
      if (!(_DWORD)MatchingServices)
      {
        if (this[30])
        {
          MatchingServices = 0;
        }
        else
        {
          this[30] = v13;
          if (!(_DWORD)v4)
            SavageDevice::ReadSensorType((SavageDevice *)this);
          MatchingServices = SavageDevice::SavageDeviceOpen((SavageDevice *)this);
          if (!(_DWORD)MatchingServices)
          {
LABEL_23:
            if (properties)
              CFRelease(properties);
            return MatchingServices;
          }
          SavageDevice::SavageDeviceClose((SavageDevice *)this);
          if (properties)
          {
            CFRelease(properties);
            properties = 0;
          }
          IOObjectRelease(this[30]);
          this[30] = 0;
        }
      }
      v13 = IOIteratorNext(*v5);
      if (!v13)
        goto LABEL_23;
    }
  }
  return MatchingServices;
}

uint64_t SavageDevice::CheckProvisioningStatus(SavageDevice *this)
{
  uint64_t v2;
  const __CFAllocator *v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  CFTypeID v6;
  const __CFData *v7;
  CFTypeID v8;
  const UInt8 *BytePtr;
  int v10;
  const __CFData *v12;
  CFTypeID v13;
  const __CFData *v14;
  CFTypeID v15;
  const __CFData *v16;
  const __CFData *v17;
  CFTypeID v18;
  unint64_t v19;
  const __CFData *v20;
  const __CFData *v21;
  CFTypeID v22;
  unint64_t v23;
  const __CFData *v24;
  CFTypeID v25;
  const __CFData *v26;
  CFTypeID v27;
  const __CFData *v28;
  CFTypeID v29;
  const __CFData *v30;
  CFTypeID v31;
  unint64_t v33[2];
  UInt8 v34[16];
  __int128 v35;
  UInt8 v36[16];
  __int128 v37;
  UInt8 buffer[8];
  uint64_t v39;
  uint64_t v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;
  CFRange v44;
  CFRange v45;
  CFRange v46;
  CFRange v47;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097136;
  *(_QWORD *)buffer = 0;
  v39 = 0;
  *(_OWORD *)v36 = 0u;
  v37 = 0u;
  *(_OWORD *)v34 = 0u;
  v35 = 0u;
  v33[0] = 0;
  v33[1] = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageUID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFGetTypeID(CFProperty);
    if (v6 != CFDataGetTypeID())
      goto LABEL_36;
    v41.location = 0;
    v41.length = 16;
    CFDataGetBytes(v5, v41, buffer);
    CFRelease(v5);
    *((_QWORD *)this + 7) = bswap64(*(unint64_t *)buffer);
    v7 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageMNS"), v3, 0);
    if (v7)
    {
      v5 = v7;
      v8 = CFGetTypeID(v7);
      if (v8 != CFDataGetTypeID())
        goto LABEL_36;
      BytePtr = CFDataGetBytePtr(v5);
      if (BytePtr)
      {
        v10 = *BytePtr;
        if (v10 == 10 || v10 == 6)
          *((_BYTE *)this + 17) = 1;
      }
      CFRelease(v5);
      v12 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageChipID"), v3, 0);
      if (v12)
      {
        v5 = v12;
        v13 = CFGetTypeID(v12);
        if (v13 != CFDataGetTypeID())
          goto LABEL_36;
        v42.location = 0;
        v42.length = 4;
        CFDataGetBytes(v5, v42, (UInt8 *)this + 112);
        *((_DWORD *)this + 28) = bswap32(*((_DWORD *)this + 28));
        CFRelease(v5);
        v14 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageKCV"), v3, 0);
        if (v14)
        {
          v5 = v14;
          v15 = CFGetTypeID(v14);
          if (v15 != CFDataGetTypeID())
            goto LABEL_36;
          v43.location = 0;
          v43.length = 3;
          CFDataGetBytes(v5, v43, (UInt8 *)this + 64);
          CFRelease(v5);
          v16 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageWrapOutputKey"), v3, 0);
          if (v16)
          {
            v17 = v16;
            v18 = CFGetTypeID(v16);
            if (v18 == CFDataGetTypeID())
            {
              v44.location = 0;
              v44.length = 32;
              CFDataGetBytes(v17, v44, v34);
            }
            CFRelease(v17);
            v19 = bswap64(*(unint64_t *)v34);
          }
          else
          {
            v19 = 0;
          }
          *((_QWORD *)this + 12) = v19;
          v20 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavagePubKeyHmac"), v3, 0);
          if (v20)
          {
            v21 = v20;
            v22 = CFGetTypeID(v20);
            if (v22 == CFDataGetTypeID())
            {
              v45.location = 0;
              v45.length = 32;
              CFDataGetBytes(v21, v45, v36);
            }
            CFRelease(v21);
            v23 = bswap64(*(unint64_t *)v36);
          }
          else
          {
            v23 = 0;
          }
          *((_QWORD *)this + 9) = v23;
          v24 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageAuthPubKey"), v3, 0);
          if (v24)
          {
            v5 = v24;
            v25 = CFGetTypeID(v24);
            if (v25 != CFDataGetTypeID())
              goto LABEL_36;
            *(_QWORD *)this = SavageSafeRetain(v5);
            CFRelease(v5);
            v26 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageAuthSalt"), v3, 0);
            if (v26)
            {
              v5 = v26;
              v27 = CFGetTypeID(v26);
              if (v27 != CFDataGetTypeID())
                goto LABEL_36;
              v46.location = 0;
              v46.length = 16;
              CFDataGetBytes(v5, v46, (UInt8 *)v33);
              CFRelease(v5);
              *((_QWORD *)this + 11) = bswap64(v33[0]);
              v28 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageAuthResponse"), v3, 0);
              if (v28)
              {
                v5 = v28;
                v29 = CFGetTypeID(v28);
                if (v29 != CFDataGetTypeID())
                  goto LABEL_36;
                *((_QWORD *)this + 1) = SavageSafeRetain(v5);
                CFRelease(v5);
                v30 = (const __CFData *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageAuthPubKeyHmac"), v3, 0);
                if (v30)
                {
                  v5 = v30;
                  v31 = CFGetTypeID(v30);
                  if (v31 == CFDataGetTypeID())
                  {
                    v47.location = 0;
                    v47.length = 32;
                    CFDataGetBytes(v5, v47, v36);
                    CFRelease(v5);
                    v2 = 0;
                    *((_QWORD *)this + 10) = bswap64(*(unint64_t *)v36);
                    return v2;
                  }
LABEL_36:
                  CFRelease(v5);
                }
              }
            }
          }
        }
      }
    }
  }
  return v2;
}

void SavageDevice::~SavageDevice(SavageDevice *this)
{
  io_object_t v2;
  io_object_t v3;

  v2 = *((_DWORD *)this + 29);
  if (v2)
    IOObjectRelease(v2);
  v3 = *((_DWORD *)this + 30);
  if (v3)
    IOObjectRelease(v3);
  SavageDevice::SavageDeviceClose(this);
}

uint64_t SavageDevice::SavageDeviceClose(SavageDevice *this)
{
  uint64_t result;
  mach_port_t v3;
  uint64_t v4;

  if (*((_BYTE *)this + 104))
  {
    SavageCamInterfaceClose();
    result = 0;
    *((_QWORD *)this + 16) = 0;
  }
  else
  {
    v3 = *((_DWORD *)this + 31);
    if (v3)
    {
      v4 = IOConnectCallScalarMethod(v3, 4u, 0, 0, 0, 0);
      IOServiceClose(*((_DWORD *)this + 31));
      *((_DWORD *)this + 31) = 0;
      return v4;
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t SavageDevice::UnallowedList(SavageDevice *this)
{
  io_registry_entry_t v2;
  const __CFData *CFProperty;
  const __CFData *v4;
  UInt8 v5;
  int v6;
  UInt8 *v7;
  uint64_t result;
  int v9;
  UInt8 *v10;
  __int16 v11;
  char *v12;
  char __s2[8];
  __int16 v14;
  UInt8 buffer[8];
  __int16 v16;
  uint64_t v17;
  CFRange v18;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/");
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v2, CFSTR("target-type"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v16 = 0;
  *(_QWORD *)buffer = 0;
  v14 = 0;
  *(_QWORD *)__s2 = 0x3132313355;
  if (CFProperty)
  {
    v4 = CFProperty;
    v18.length = CFDataGetLength(CFProperty);
    v18.location = 0;
    CFDataGetBytes(v4, v18, buffer);
    v5 = buffer[0];
    if (buffer[0])
    {
      v6 = 1;
      v7 = buffer;
      do
      {
        *v7 = v5 ^ 1;
        v7 = &buffer[v6];
        v5 = *v7;
        ++v6;
      }
      while (*v7);
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = buffer;
    v11 = 2080;
    v12 = __s2;
    _os_log_impl(&dword_2218D1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "SavageDeviceLog: target-type = %s; unallowedTarget = %s \n",
      (uint8_t *)&v9,
      0x16u);
  }
  result = strncmp((const char *)buffer, __s2, 0xAuLL);
  if (!(_DWORD)result)
    *((_BYTE *)this + 16) = 0;
  return result;
}

void SavageDevice::ReadSensorType(SavageDevice *this)
{
  CFTypeRef v2;
  const void *v3;
  CFTypeID v4;
  UInt8 buffer[4];
  CFRange v6;

  v2 = IORegistryEntrySearchCFProperty(*((_DWORD *)this + 30), "IOService", CFSTR("sensor-type"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  *(_DWORD *)buffer = 0;
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 != CFDataGetTypeID())
    {
LABEL_13:
      CFRelease(v3);
      return;
    }
    v6.location = 0;
    v6.length = 4;
    CFDataGetBytes((CFDataRef)v3, v6, buffer);
    if (*(int *)buffer <= 352)
    {
      if (((*(_DWORD *)buffer - 162) > 0x22 || ((1 << (buffer[0] + 94)) & 0x700002DE5) == 0)
        && ((*(_DWORD *)buffer - 80) > 0x10 || ((1 << (buffer[0] - 80)) & 0x1000F) == 0))
      {
        goto LABEL_7;
      }
    }
    else if (*(_DWORD *)buffer != 353 && *(_DWORD *)buffer != 1701 && *(_DWORD *)buffer != 1445)
    {
LABEL_7:
      *((_BYTE *)this + 16) = 0;
      goto LABEL_13;
    }
    *((_BYTE *)this + 16) = 1;
    *((_DWORD *)this + 27) = 3;
    goto LABEL_13;
  }
}

uint64_t SavageDevice::SavageDeviceOpen(SavageDevice *this)
{
  _QWORD *v2;
  uint64_t SensorInfo;
  int v4;
  uint64_t v5;
  unsigned int v7;
  mach_port_t v8;
  uint64_t v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 104) == 1)
  {
    v9[0] = 0;
    v2 = (_QWORD *)((char *)this + 128);
    SensorInfo = SavageCamInterfaceOpen();
    if ((_DWORD)SensorInfo)
      return SensorInfo;
    if (!*v2)
      return 0;
    SensorInfo = SavageCamInterfaceGetSensorInfo();
    if ((_DWORD)SensorInfo)
      return SensorInfo;
    *((_DWORD *)this + 27) = v9[0];
    v4 = BYTE4(v9[0]);
    *((_BYTE *)this + 105) = BYTE4(v9[0]);
    *((_BYTE *)this + 16) = BYTE5(v9[0]);
    if (!v4)
      SavageDevice::SavageDeviceClose(this);
  }
  if (*((_BYTE *)this + 105))
  {
    v5 = 0;
  }
  else
  {
    if (*((_DWORD *)this + 31))
      return 3758097093;
    v7 = IOServiceOpen(*((_DWORD *)this + 30), *MEMORY[0x24BDAEC58], 0x2Au, (io_connect_t *)this + 31);
    v8 = *((_DWORD *)this + 31);
    if (v8)
      v5 = v7;
    else
      v5 = 3758097084;
    if (!(_DWORD)v5)
    {
      v9[0] = 0;
      v5 = IOConnectCallScalarMethod(v8, 3u, v9, 1u, 0, 0);
    }
  }
  SavageDevice::UnallowedList(this);
  return v5;
}

uint64_t SavageDevice::CreateNGIDProvBlob(uint64_t a1, UInt8 *a2)
{
  uint64_t v4;
  const __CFAllocator *v5;
  const __CFData *CFProperty;
  const __CFData *v7;
  CFTypeID v8;
  const __CFData *v9;
  CFTypeID v10;
  const __CFData *v11;
  CFTypeID v12;
  CFRange v14;
  CFRange v15;
  CFRange v16;

  v4 = 3758097136;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 120), CFSTR("SavageUID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v7 = CFProperty;
    v8 = CFGetTypeID(CFProperty);
    if (v8 != CFDataGetTypeID())
      goto LABEL_8;
    v14.location = 0;
    v14.length = 16;
    CFDataGetBytes(v7, v14, a2);
    CFRelease(v7);
    v9 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 120), CFSTR("SavagePubKey"), v5, 0);
    if (!v9)
      return v4;
    v7 = v9;
    v10 = CFGetTypeID(v9);
    if (v10 != CFDataGetTypeID())
    {
LABEL_8:
      CFRelease(v7);
      return v4;
    }
    v15.location = 0;
    v15.length = 56;
    CFDataGetBytes(v7, v15, a2 + 16);
    CFRelease(v7);
    v11 = (const __CFData *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 120), CFSTR("SavageKCV"), v5, 0);
    if (v11)
    {
      v7 = v11;
      v12 = CFGetTypeID(v11);
      if (v12 == CFDataGetTypeID())
      {
        v16.location = 0;
        v16.length = 3;
        CFDataGetBytes(v7, v16, a2 + 144);
        v4 = 0;
      }
      goto LABEL_8;
    }
  }
  return v4;
}

uint64_t SavageDevice::CreateDeviceInfoDict(SavageDevice *this, __CFDictionary *a2)
{
  uint64_t v4;
  const __CFAllocator *v5;
  CFTypeRef CFProperty;
  const void *v7;
  CFTypeID v8;
  CFTypeRef v9;
  CFTypeID v10;
  CFTypeRef v11;
  CFTypeID v12;
  CFTypeRef v13;
  CFTypeID v14;
  const UInt8 *BytePtr;
  CFTypeRef v16;
  CFTypeID v17;
  const UInt8 *v18;
  int v19;
  mach_port_t v20;
  const __CFDictionary *v21;
  uint64_t MatchingService;
  CFTypeRef v23;
  CFTypeID v24;
  CFRange v26;

  v4 = 3758097136;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageUID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v7 = CFProperty;
    v8 = CFGetTypeID(CFProperty);
    if (v8 != CFDataGetTypeID())
      goto LABEL_24;
    CFDictionaryAddValue(a2, (const void *)*MEMORY[0x24BEE7AD0], v7);
    CFRelease(v7);
    v9 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageNonce"), v5, 0);
    if (v9)
    {
      v7 = v9;
      v10 = CFGetTypeID(v9);
      if (v10 != CFDataGetTypeID())
        goto LABEL_24;
      CFDictionaryAddValue(a2, (const void *)*MEMORY[0x24BEE7AB8], v7);
      CFRelease(v7);
      v11 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageChipID"), v5, 0);
      if (v11)
      {
        v7 = v11;
        v12 = CFGetTypeID(v11);
        if (v12 != CFDataGetTypeID())
          goto LABEL_24;
        CFDictionaryAddValue(a2, (const void *)*MEMORY[0x24BEE7AA8], v7);
        CFRelease(v7);
        v13 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageDeviceRev"), v5, 0);
        if (v13)
        {
          v7 = v13;
          v14 = CFGetTypeID(v13);
          if (v14 != CFDataGetTypeID())
            goto LABEL_24;
          CFDictionaryAddValue(a2, (const void *)*MEMORY[0x24BEE7AC8], v7);
          BytePtr = CFDataGetBytePtr((CFDataRef)v7);
          if (BytePtr)
            *((_BYTE *)this + 68) = (*BytePtr & 0xF0) == 160;
          CFRelease(v7);
          v16 = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 30), CFSTR("SavageMNS"), v5, 0);
          if (v16)
          {
            v7 = v16;
            v17 = CFGetTypeID(v16);
            if (v17 != CFDataGetTypeID())
              goto LABEL_24;
            v18 = CFDataGetBytePtr((CFDataRef)v7);
            if (v18)
            {
              v19 = *v18;
              if (v19 == 6)
              {
                *((_BYTE *)this + 69) = 0;
                v19 = *v18;
              }
              if (v19 == 10)
                *((_BYTE *)this + 69) = 1;
            }
            CFRelease(v7);
            v20 = *MEMORY[0x24BDD8B20];
            v21 = IOServiceNameMatching("ApplePearlSEPDriver");
            MatchingService = IOServiceGetMatchingService(v20, v21);
            v4 = MatchingService;
            if ((_DWORD)MatchingService)
            {
              v23 = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("FDRDataEncryptionKey"), v5, 0);
              if (!v23)
              {
LABEL_22:
                IOObjectRelease(v4);
                return 0;
              }
              v7 = v23;
              v24 = CFGetTypeID(v23);
              if (v24 == CFDataGetTypeID())
              {
                v26.location = 0;
                v26.length = 32;
                CFDataGetBytes((CFDataRef)v7, v26, (UInt8 *)this + 19);
                *((_BYTE *)this + 18) = 1;
                CFRelease(v7);
                goto LABEL_22;
              }
              IOObjectRelease(v4);
              v4 = 0;
LABEL_24:
              CFRelease(v7);
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t SavageDevice::PrePersonalize(SavageDevice *this, unsigned int a2)
{
  mach_port_t v3;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 105))
    return SavageCamInterfaceSensorPrePersonalize();
  v3 = *((_DWORD *)this + 31);
  if (!v3)
    return 3758097084;
  v4[0] = a2;
  return IOConnectCallScalarMethod(v3, 0, v4, 1u, 0, 0);
}

uint64_t SavageDevice::PreFusing(SavageDevice *this, unsigned int a2)
{
  mach_port_t v3;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 105))
    return SavageCamInterfaceSensorPreFusing();
  v3 = *((_DWORD *)this + 31);
  if (!v3)
    return 3758097084;
  v4[0] = a2;
  return IOConnectCallScalarMethod(v3, 1u, v4, 1u, 0, 0);
}

uint64_t SavageDevice::Fusing(SavageDevice *this, unsigned int a2, const unsigned __int8 *a3, unsigned int a4)
{
  uint64_t v5;
  uint64_t v6;
  mach_port_t v8;
  uint64_t v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 105))
  {
    v5 = SavageCamInterfaceSensorFusing();
LABEL_3:
    v6 = v5;
    goto LABEL_4;
  }
  v8 = *((_DWORD *)this + 31);
  v9[2] = a2;
  v6 = 3758097090;
  if (a3 && a4)
  {
    v9[0] = (uint64_t)a3;
    v9[1] = a4;
    if (!v8)
    {
      v6 = 3758097084;
      goto LABEL_4;
    }
    v5 = IOConnectCallScalarMethod(v8, 2u, v9, 3u, 0, 0);
    goto LABEL_3;
  }
LABEL_4:
  *((_QWORD *)this + 7) = 0;
  SavageDevice::CheckProvisioningStatus(this);
  return v6;
}

uint64_t SavageDevice::AuthFlow(SavageDevice *this, unsigned int a2, const unsigned __int8 *a3)
{
  uint64_t v4;

  v4 = SavageCamInterfaceSensorAuth();
  SavageDevice::CheckProvisioningStatus(this);
  return v4;
}

uint64_t SavageDevice::PublishToRegistry(SavageDevice *this, const __CFString *a2, const __CFData *a3)
{
  return SavageCamInterfacePublishToRegistry();
}

uint64_t SavageUpdateController::getInstance(SavageUpdateController *this, const __CFDictionary *a2, void *a3, void *a4)
{
  SavageUpdateController *v7;

  v7 = (SavageUpdateController *)operator new(0x1B8uLL);
  SavageUpdateController::SavageUpdateController(v7);
  SavageUpdateController::myInstance = (uint64_t)v7;
  *(_QWORD *)v7 = a3;
  *((_QWORD *)v7 + 1) = a2;
  SavageUpdateController::SavageLog(v7, "%s - %p (%p) - UpdaterIsSupported = %d; SavageIsPresent = %d \n",
    "getInstance",
    v7,
    *((const void **)v7 + 8),
    *((unsigned __int8 *)v7 + 250),
    *(unsigned __int8 *)(*((_QWORD *)v7 + 8) + 17));
  SavageUpdateController::start((SavageUpdateController *)SavageUpdateController::myInstance, this);
  return SavageUpdateController::myInstance;
}

void sub_2218D752C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void SavageUpdateController::SavageLog(SavageUpdateController *this, const char *a2, ...)
{
  uint64_t v2;
  const char *v3;
  uint8_t buf[4];
  char *v5;
  char __str[4096];
  uint64_t v7;
  va_list va;

  va_start(va, a2);
  v2 = MEMORY[0x24BDAC7A8](this, a2);
  v7 = *MEMORY[0x24BDAC8D0];
  vsnprintf(__str, 0x1000uLL, v3, va);
  if (*(_QWORD *)v2)
  {
    (*(void (**)(_QWORD, char *))v2)(*(_QWORD *)(v2 + 8), __str);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v5 = __str;
    _os_log_impl(&dword_2218D1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "SavageLog: %s \n", buf, 0xCu);
  }
}

uint64_t SavageUpdateController::start(SavageUpdateController *this, const __CFDictionary *a2)
{
  const __CFString *v4;
  const void *Value;
  CFTypeRef v6;
  const void *v7;
  CFTypeID v8;
  const char *CStringPtr;
  const char *v10;
  const char *v11;
  const void *v12;
  CFTypeID v13;
  const __CFBoolean *v14;
  const __CFBoolean *v15;
  CFTypeID v16;
  const __CFBoolean *v17;
  const __CFBoolean *v18;
  CFTypeID v19;
  uint64_t v20;
  int v21;
  const __CFBoolean *v22;
  const __CFBoolean *v23;
  CFTypeID v24;
  const __CFBoolean *v25;
  const __CFBoolean *v26;
  CFTypeID v27;
  const __CFBoolean *v28;
  const __CFBoolean *v29;
  CFTypeID v30;
  const __CFBoolean *v31;
  const __CFBoolean *v32;
  CFTypeID v33;
  const __CFBoolean *v34;
  const __CFBoolean *v35;
  CFTypeID v36;
  const __CFData *v37;
  const __CFData *v38;
  CFTypeID v39;
  UInt8 *v40;
  const __CFBoolean *v41;
  const __CFBoolean *v42;
  CFTypeID v43;
  const __CFString *v44;
  const __CFString *v45;
  CFTypeID v46;
  const __CFString *v47;
  const __CFString *v48;
  CFTypeID v49;
  __CFString *Mutable;
  const __CFString *v51;
  const __CFString *v52;
  CFTypeID v53;
  __CFString *v54;
  __CFString *v55;
  const __CFBoolean *v56;
  const __CFBoolean *v57;
  CFTypeID v58;
  uint64_t v59;
  int v60;
  CFRange v62;

  *((_BYTE *)this + 25) = 1;
  if (*((_BYTE *)this + 250))
    SavageDevice::CheckProvisioningStatus(*((SavageDevice **)this + 8));
  SavageUpdateController::SavageLog(this, "%s: isProvisioned=0x%llX; isNGIDProvisioned=0x%X; isSocProdfused=%d; persoLoop = %d\n",
    "start",
    *(_QWORD *)(*((_QWORD *)this + 8) + 56),
    *(_DWORD *)(*((_QWORD *)this + 8) + 64),
    *(unsigned __int8 *)(*((_QWORD *)this + 8) + 70),
    *((_DWORD *)this + 107));
  if (a2)
  {
    *((_QWORD *)this + 32) = SavageSafeRetain(a2);
    v4 = (const __CFString *)*MEMORY[0x24BEE7A40];
    Value = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BEE7A40]);
    v6 = SavageSafeRetain(Value);
    if (v6 && (v7 = v6, v8 = CFGetTypeID(v6), v8 == CFDictionaryGetTypeID()))
    {
      if (CFDictionaryGetCount((CFDictionaryRef)v7))
      {
        a2 = (const __CFDictionary *)CFCopyDescription(v7);
        CStringPtr = CFStringGetCStringPtr((CFStringRef)a2, 0);
        v10 = CFStringGetCStringPtr(v4, 0);
        v11 = "No C string description available.";
        if (CStringPtr)
          v11 = CStringPtr;
        SavageUpdateController::SavageLog(this, "%s [input]: %s %s \n", "start", v10, v11);
        v12 = CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A68]);
        if (v12)
        {
          v13 = CFGetTypeID(v12);
          if (v13 == CFBooleanGetTypeID())
            *((_BYTE *)this + 248) = 1;
        }
        v14 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A98]);
        if (v14)
        {
          v15 = v14;
          v16 = CFGetTypeID(v14);
          if (v16 == CFBooleanGetTypeID())
            *((_BYTE *)this + 249) = CFBooleanGetValue(v15);
        }
        v17 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A28]);
        if (v17)
        {
          v18 = v17;
          v19 = CFGetTypeID(v17);
          if (v19 == CFBooleanGetTypeID() && CFBooleanGetValue(v18) == 1)
          {
            v20 = *((_QWORD *)this + 8);
            if (!*(_QWORD *)(v20 + 56))
            {
              if (*(_BYTE *)(v20 + 70))
                v21 = 1;
              else
                v21 = 2;
              *((_DWORD *)this + 107) = v21;
            }
          }
        }
        v22 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A88]);
        if (v22)
        {
          v23 = v22;
          v24 = CFGetTypeID(v22);
          if (v24 == CFBooleanGetTypeID())
            *((_BYTE *)this + 253) = CFBooleanGetValue(v23);
        }
        v25 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A90]);
        if (v25)
        {
          v26 = v25;
          v27 = CFGetTypeID(v25);
          if (v27 == CFBooleanGetTypeID())
            *((_BYTE *)this + 252) = CFBooleanGetValue(v26);
        }
        v28 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A60]);
        if (v28)
        {
          v29 = v28;
          v30 = CFGetTypeID(v28);
          if (v30 == CFBooleanGetTypeID())
            *((_BYTE *)this + 16) = CFBooleanGetValue(v29);
        }
        v31 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A30]);
        if (v31)
        {
          v32 = v31;
          v33 = CFGetTypeID(v31);
          if (v33 == CFBooleanGetTypeID())
            *((_BYTE *)this + 17) = CFBooleanGetValue(v32);
        }
        v34 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A08]);
        if (v34)
        {
          v35 = v34;
          v36 = CFGetTypeID(v34);
          if (v36 == CFBooleanGetTypeID())
          {
            *((_BYTE *)this + 21) = CFBooleanGetValue(v35);
            *((_DWORD *)this + 108) = 2;
          }
        }
        v37 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A10]);
        if (v37)
        {
          v38 = v37;
          v39 = CFGetTypeID(v37);
          if (v39 == CFDataGetTypeID())
          {
            v40 = (UInt8 *)calloc(0x10uLL, 1uLL);
            *((_QWORD *)this + 4) = v40;
            v62.location = 0;
            v62.length = 16;
            CFDataGetBytes(v38, v62, v40);
            *((_BYTE *)this + 254) = 1;
            *((_BYTE *)this + 21) = 1;
            *((_BYTE *)this + 25) = 0;
          }
        }
        v41 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7B70]);
        if (v41)
        {
          v42 = v41;
          v43 = CFGetTypeID(v41);
          if (v43 == CFBooleanGetTypeID())
            *((_BYTE *)this + 23) = CFBooleanGetValue(v42);
        }
        v44 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A18]);
        if (v44)
        {
          v45 = v44;
          v46 = CFGetTypeID(v44);
          if (v46 == CFStringGetTypeID())
            *((_BYTE *)this + 19) = CFStringGetLength(v45) != 0;
        }
        v47 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("PersonalizedFirmwareRootPath"));
        if (v47)
        {
          v48 = v47;
          v49 = CFGetTypeID(v47);
          if (v49 == CFStringGetTypeID())
          {
            Mutable = CFStringCreateMutable(0, 0);
            *((_QWORD *)this + 34) = Mutable;
            CFStringAppend(Mutable, v48);
          }
        }
        v51 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A78]);
        if (v51)
        {
          v52 = v51;
          v53 = CFGetTypeID(v51);
          if (v53 == CFStringGetTypeID())
          {
            v54 = CFStringCreateMutable(0, 0);
            *((_QWORD *)this + 35) = v54;
            CFStringAppend(v54, v52);
            if (!*((_QWORD *)this + 34))
            {
              v55 = CFStringCreateMutable(0, 0);
              *((_QWORD *)this + 34) = v55;
              CFStringAppend(v55, v52);
              CFStringAppend(*((CFMutableStringRef *)this + 34), CFSTR("/usr/standalone/firmware/Savage/"));
            }
          }
        }
        v56 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v7, (const void *)*MEMORY[0x24BEE7A70]);
        if (v56)
        {
          v57 = v56;
          v58 = CFGetTypeID(v56);
          if (v58 == CFBooleanGetTypeID())
            *((_BYTE *)this + 251) = CFBooleanGetValue(v57);
        }
      }
      else
      {
        a2 = 0;
        *((_BYTE *)this + 248) = 1;
      }
    }
    else
    {
      SavageUpdateController::SavageLog(this, "%s: restoreOptions missing or not a dictionary\n", "start");
      a2 = 0;
    }
  }
  v59 = *((_QWORD *)this + 8);
  if (!*(_BYTE *)(v59 + 17) && !*((_BYTE *)this + 251))
    *((_BYTE *)this + 249) = 1;
  v60 = *((unsigned __int8 *)this + 16);
  if (*((_BYTE *)this + 16))
  {
    if (*((_BYTE *)this + 19))
    {
      if (v60 == 1)
      {
        *((_BYTE *)this + 25) = 0;
        *((_BYTE *)this + 23) = 0;
        *((_BYTE *)this + 21) = 0;
        *((_BYTE *)this + 19) = 0;
        *((_BYTE *)this + 17) = 0;
      }
    }
    else
    {
      v60 = 0;
      *((_BYTE *)this + 16) = 0;
      *((_BYTE *)this + 249) = 1;
    }
  }
  if (*((_BYTE *)this + 252) == 1 && !*((_BYTE *)this + 17) && !*((_BYTE *)this + 19))
    *((_BYTE *)this + 26) = 1;
  if (!*((_BYTE *)this + 251)
    || *(_QWORD *)(v59 + 56)
    || *((_BYTE *)this + 17)
    || *((_BYTE *)this + 19)
    || *((_BYTE *)this + 21)
    || *((unsigned __int8 *)this + 23) | v60)
  {
    *((_DWORD *)this + 107) = 1;
  }
  if (a2)
    CFRelease(a2);
  return 0;
}

void SavageUpdateController::destroyInstance(SavageUpdateController *this)
{
  SavageDevice *v1;
  void *v2;

  if (SavageUpdateController::myInstance)
  {
    SavageUpdateController::SavageLog((SavageUpdateController *)SavageUpdateController::myInstance, "%s - %p (%p) - UpdaterIsSupported = %d; SavageIsPresent = %d \n",
      "destroyInstance",
      (const void *)SavageUpdateController::myInstance,
      *(const void **)(SavageUpdateController::myInstance + 64),
      *(unsigned __int8 *)(SavageUpdateController::myInstance + 250),
      *(unsigned __int8 *)(*(_QWORD *)(SavageUpdateController::myInstance + 64) + 17));
    SavageDevice::destroyInstance(v1);
    if (SavageUpdateController::myInstance)
    {
      SavageUpdateController::~SavageUpdateController((SavageUpdateController *)SavageUpdateController::myInstance);
      operator delete(v2);
    }
    SavageUpdateController::myInstance = 0;
  }
}

void SavageUpdateController::SavageUpdateController(SavageUpdateController *this)
{
  SavageDevice *Instance;
  int v3;

  *((_QWORD *)this + 32) = 0;
  *((_QWORD *)this + 52) = 0;
  *((_QWORD *)this + 38) = 0;
  *((_QWORD *)this + 39) = 0;
  *((_DWORD *)this + 106) = 3;
  *((_BYTE *)this + 248) = 0;
  *((_WORD *)this + 126) = 0;
  *((_BYTE *)this + 254) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 37) = 0;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *((_DWORD *)this + 103) = 0;
  *(_QWORD *)((char *)this + 404) = 0;
  *(_QWORD *)((char *)this + 396) = 0;
  Instance = SavageDevice::getInstance(this);
  *((_QWORD *)this + 8) = Instance;
  *((_DWORD *)this + 106) = *((_DWORD *)Instance + 27);
  v3 = *((unsigned __int8 *)Instance + 16);
  *((_BYTE *)this + 250) = v3;
  *((_BYTE *)this + 249) = v3 == 0;
  *((_BYTE *)this + 26) = 0;
  *((_QWORD *)this + 2) = 0x1000100010000;
  *((_WORD *)this + 12) = 1;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 30) = 56;
  *((_OWORD *)this + 14) = xmmword_2218EC050;
  *((_QWORD *)this + 48) = 0;
  *((_DWORD *)this + 98) = 0;
  *((_QWORD *)this + 40) = 0;
  *((_DWORD *)this + 82) = 0;
  *((_QWORD *)this + 42) = 0;
  *((_DWORD *)this + 86) = 0;
  *((_QWORD *)this + 46) = 0;
  *((_DWORD *)this + 94) = 0;
  *((_QWORD *)this + 44) = 0;
  *((_DWORD *)this + 90) = 0;
  *(_QWORD *)((char *)this + 428) = 0x100000001;
  *((_QWORD *)this + 4) = 0;
  *((_BYTE *)this + 251) = 0;
}

void SavageUpdateController::~SavageUpdateController(SavageUpdateController *this)
{
  const void *v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;

  v2 = (const void *)*((_QWORD *)this + 32);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 32) = 0;
  }
  v3 = (const void *)*((_QWORD *)this + 34);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)this + 34) = 0;
  }
  v4 = (void *)*((_QWORD *)this + 38);
  if (v4)
  {
    free(v4);
    *((_QWORD *)this + 38) = 0;
  }
  v5 = (void *)*((_QWORD *)this + 39);
  if (v5)
  {
    free(v5);
    *((_QWORD *)this + 39) = 0;
  }
  v6 = (void *)*((_QWORD *)this + 40);
  if (v6)
  {
    free(v6);
    *((_QWORD *)this + 40) = 0;
  }
  v7 = (void *)*((_QWORD *)this + 42);
  if (v7)
  {
    free(v7);
    *((_QWORD *)this + 42) = 0;
  }
  v8 = (void *)*((_QWORD *)this + 46);
  if (v8)
  {
    free(v8);
    *((_QWORD *)this + 46) = 0;
  }
  v9 = (void *)*((_QWORD *)this + 44);
  if (v9)
  {
    free(v9);
    *((_QWORD *)this + 44) = 0;
  }
  v10 = (void *)*((_QWORD *)this + 48);
  if (v10)
  {
    free(v10);
    *((_QWORD *)this + 48) = 0;
  }
  v11 = (void *)*((_QWORD *)this + 52);
  if (v11)
  {
    free(v11);
    *((_QWORD *)this + 52) = 0;
  }
  v12 = (void *)*((_QWORD *)this + 4);
  if (v12)
  {
    free(v12);
    *((_QWORD *)this + 4) = 0;
  }
  v13 = (const void *)*((_QWORD *)this + 33);
  if (v13)
  {
    CFRelease(v13);
    *((_QWORD *)this + 33) = 0;
  }
}

uint64_t SavageUpdateController::libFDRCallback(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  const __CFData *v4;
  const __CFData *v5;
  UInt8 *v6;
  unint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  uint64_t result;
  char v13[4096];
  uint64_t v14;
  CFRange v15;

  MEMORY[0x24BDAC7A8](a1, a2);
  v3 = v2;
  v5 = v4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (UInt8 *)calloc(0x10uLL, 1uLL);
  *(_QWORD *)(SavageUpdateController::myInstance + 32) = v6;
  v15.location = 0;
  v15.length = 16;
  CFDataGetBytes(v5, v15, v6);
  SavageUpdateController::SavageLog((SavageUpdateController *)SavageUpdateController::myInstance, "Auth challenge received from libFDR:--------------\n");
  bzero(v13, 0x1000uLL);
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = snprintf(&v13[v8], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(SavageUpdateController::myInstance + 32) + v7));
    if (v7 > 0xE)
      break;
    v8 += v9;
    ++v7;
  }
  while (v8 < 4091);
  SavageUpdateController::SavageLog((SavageUpdateController *)SavageUpdateController::myInstance, "%s \n", v13);
  SavageUpdateController::formatAndStitchFiles((SavageUpdateController *)SavageUpdateController::myInstance);
  SavageDevice::Fusing(*(SavageDevice **)(SavageUpdateController::myInstance + 64), *(_DWORD *)(SavageUpdateController::myInstance + 424), *(const unsigned __int8 **)(SavageUpdateController::myInstance + 416), *(_DWORD *)(SavageUpdateController::myInstance + 412));
  v10 = *(_QWORD *)(*(_QWORD *)(SavageUpdateController::myInstance + 64) + 8);
  if (v3)
    v11 = v10 == 0;
  else
    v11 = 1;
  result = !v11;
  if (!v11)
    *v3 = v10;
  return result;
}

void SavageUpdateController::formatAndStitchFiles(SavageUpdateController *this)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  char *v19;
  int v20;
  unsigned int v21;
  char v22;
  uint64_t v23;
  char *v24;
  int v25;
  int v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  int v30;
  char *v31;
  int v32;
  unsigned int v33;
  char v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  int v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;

  if (!*((_QWORD *)this + 38) || !*((_QWORD *)this + 48))
    return;
  v2 = 3 * *((_DWORD *)this + 98);
  v3 = v2 + 3;
  v4 = 3 * *((_DWORD *)this + 100);
  if (*((_BYTE *)this + 16))
    v5 = 231;
  else
    v5 = 0;
  if (!*((_BYTE *)this + 17) && !*((_BYTE *)this + 19))
  {
    if (*((_BYTE *)this + 21) == 1)
      v3 = v2 + 51;
    if (!*((_BYTE *)this + 21))
    {
      v6 = v2 + 99;
      if (*((_BYTE *)this + 23) == 1)
        v3 = v6;
    }
  }
  v7 = (v4 + v5 + v3 + 35);
  *((_DWORD *)this + 103) = v7;
  v8 = (char *)calloc(v7, 1uLL);
  *((_QWORD *)this + 52) = v8;
  if (!v8)
    return;
  *(_DWORD *)v8 = 0;
  *((_DWORD *)v8 + 1) = v3;
  *((_DWORD *)v8 + 2) = v4 + 3;
  *((_DWORD *)v8 + 3) = 0;
  *((_DWORD *)v8 + 4) = v5;
  *(_QWORD *)(v8 + 20) = 0;
  *((_DWORD *)v8 + 7) = 0;
  if (*((_BYTE *)this + 17) || *((_BYTE *)this + 19))
  {
    LODWORD(v9) = 32;
  }
  else
  {
    if (*((_BYTE *)this + 21) == 1)
    {
      v36 = (char *)*((_QWORD *)this + 4);
      if (!v36)
      {
        SavageUpdateController::SavageLog(this, "%s: Using dummy auth challenge key \n", "formatAndStitchFiles");
        v36 = &byte_2218EC060;
      }
      v37 = 0;
      v38 = 736;
      while (v37 + 35 <= (unint64_t)*((unsigned int *)this + 103))
      {
        *(_BYTE *)(*((_QWORD *)this + 52) + v37 + 32) = BYTE1(v38);
        *(_BYTE *)(*((_QWORD *)this + 52) + v37 + 33) = v38;
        v39 = *v36++;
        *(_BYTE *)(*((_QWORD *)this + 52) + v37 + 34) = v39;
        ++v38;
        v37 += 3;
        if (v37 == 48)
        {
          LODWORD(v9) = 80;
          goto LABEL_60;
        }
      }
      LODWORD(v9) = v37 + 32;
LABEL_60:
      if (*((_BYTE *)this + 17))
        goto LABEL_17;
    }
    else
    {
      LODWORD(v9) = 32;
    }
    if (!*((_BYTE *)this + 19) && !*((_BYTE *)this + 21) && *((_BYTE *)this + 23) == 1)
    {
      if (!*(_BYTE *)(*((_QWORD *)this + 8) + 18))
        SavageUpdateController::formatAndStitchFiles();
      v40 = 0;
      v41 = v9;
      LODWORD(v9) = v9 + 96;
      v42 = 544;
      v43 = 19;
      while (1)
      {
        v44 = v41 + v40;
        if (v41 + v40 + 3 > (unint64_t)*((unsigned int *)this + 103))
          break;
        *(_BYTE *)(*((_QWORD *)this + 52) + v41 + v40) = BYTE1(v42);
        *(_BYTE *)(*((_QWORD *)this + 52) + v44 + 1) = v42;
        *(_BYTE *)(*((_QWORD *)this + 52) + v44 + 2) = *(_BYTE *)(*((_QWORD *)this + 8) + v43);
        ++v42;
        ++v43;
        v40 += 3;
        if (v40 == 96)
          goto LABEL_17;
      }
      LODWORD(v9) = v41 + v40;
    }
  }
LABEL_17:
  if (*((_DWORD *)this + 98))
  {
    v10 = 0;
    v9 = v9;
    v11 = 2304;
    while (1)
    {
      v12 = v9 + 3;
      if (v9 + 3 > (unint64_t)*((unsigned int *)this + 103))
        break;
      *(_BYTE *)(*((_QWORD *)this + 52) + v9) = BYTE1(v11);
      *(_BYTE *)(*((_QWORD *)this + 52) + v9 + 1) = v11;
      *(_BYTE *)(*((_QWORD *)this + 52) + v9 + 2) = *(_BYTE *)(*((_QWORD *)this + 48) + v10++);
      ++v11;
      v9 += 3;
      if (v10 >= *((unsigned int *)this + 98))
      {
        LODWORD(v9) = v12;
        break;
      }
    }
  }
  v13 = v9 + 3;
  if ((v9 + 3) <= *((_DWORD *)this + 103))
  {
    *(_BYTE *)(*((_QWORD *)this + 52) + (int)v9) = 1;
    *(_BYTE *)(*((_QWORD *)this + 52) + (int)v9 + 1) = 0;
    *(_BYTE *)(*((_QWORD *)this + 52) + (int)v9 + 2) = 4;
    if (*((_DWORD *)this + 100))
    {
      v14 = 0;
      v15 = 0;
      v16 = 3072;
      do
      {
        if (*((_DWORD *)this + 103) < (v9 + v14 + 6))
          break;
        *(_BYTE *)(*((_QWORD *)this + 52) + v9 + v14 + 3) = BYTE1(v16);
        *(_BYTE *)(*((_QWORD *)this + 52) + v9 + v14 + 4) = v16;
        *(_BYTE *)(*((_QWORD *)this + 52) + v9 + v14 + 5) = *(_BYTE *)(*((_QWORD *)this + 38) + v15++);
        ++v16;
        v14 += 3;
      }
      while (v15 < *((unsigned int *)this + 100));
      v13 = v9 + v14 + 3;
    }
    if ((v13 + 3) <= *((_DWORD *)this + 103))
    {
      *(_BYTE *)(*((_QWORD *)this + 52) + v13) = 1;
      *(_BYTE *)(*((_QWORD *)this + 52) + v13 + 1) = 0;
      *(_BYTE *)(*((_QWORD *)this + 52) + v13 + 2) = 8;
      if (*((_BYTE *)this + 16) == 1)
      {
        v17 = 0;
        v18 = v13 + 51;
        v19 = (char *)this + 200;
        v20 = 1906;
        while (1)
        {
          v21 = *((_DWORD *)this + 103);
          if (v21 < v13 + (int)v17 + 6)
            break;
          *(_BYTE *)(*((_QWORD *)this + 52) + v13 + v17 + 3) = BYTE1(v20);
          *(_BYTE *)(*((_QWORD *)this + 52) + v13 + v17 + 4) = v20;
          v22 = *v19++;
          *(_BYTE *)(*((_QWORD *)this + 52) + v13 + v17 + 5) = v22;
          ++v20;
          v17 += 3;
          if (v17 == 48)
          {
            v21 = *((_DWORD *)this + 103);
            goto LABEL_35;
          }
        }
        v18 = v13 + 3 + v17;
LABEL_35:
        if (v18 + 3 <= v21)
        {
          v23 = 0;
          v24 = (char *)this + 216;
          v25 = v18 + 9;
          v26 = 1922;
          while (1)
          {
            v27 = *((_DWORD *)this + 103);
            if (v27 < v18 + (int)v23 + 3)
              break;
            *(_BYTE *)(*((_QWORD *)this + 52) + v18 + v23) = BYTE1(v26);
            *(_BYTE *)(*((_QWORD *)this + 52) + v18 + v23 + 1) = v26;
            v28 = *v24++;
            *(_BYTE *)(*((_QWORD *)this + 52) + v18 + v23 + 2) = v28;
            ++v26;
            v23 += 3;
            if (v23 == 9)
            {
              v27 = *((_DWORD *)this + 103);
              goto LABEL_41;
            }
          }
          v25 = v18 + v23;
LABEL_41:
          if (v25 + 3 <= v27)
          {
            v29 = 0;
            v30 = v25 + 168;
            v31 = (char *)this + 144;
            v32 = 1834;
            while (1)
            {
              v33 = *((_DWORD *)this + 103);
              if (v33 < v25 + (int)v29 + 3)
                break;
              *(_BYTE *)(*((_QWORD *)this + 52) + v25 + v29) = BYTE1(v32);
              *(_BYTE *)(*((_QWORD *)this + 52) + v25 + v29 + 1) = v32;
              v34 = *v31++;
              *(_BYTE *)(*((_QWORD *)this + 52) + v25 + v29 + 2) = v34;
              ++v32;
              v29 += 3;
              if (v29 == 168)
              {
                v33 = *((_DWORD *)this + 103);
                goto LABEL_47;
              }
            }
            v30 = v25 + v29;
LABEL_47:
            v35 = v30 + 3;
            if (v35 <= v33)
            {
              *(_BYTE *)(*((_QWORD *)this + 52) + v30) = 1;
              *(_BYTE *)(v30 + *((_QWORD *)this + 52) + 1) = 0;
              *(_BYTE *)(v30 + *((_QWORD *)this + 52) + 2) = 64;
              if ((v30 + 6) <= *((_DWORD *)this + 103))
              {
                *(_BYTE *)(*((_QWORD *)this + 52) + v35) = 1;
                *(_BYTE *)(v30 + *((_QWORD *)this + 52) + 4) = 0;
                *(_BYTE *)(v30 + *((_QWORD *)this + 52) + 5) = 0x80;
              }
            }
          }
        }
      }
    }
  }
}

void SavageUpdateController::getAuthChallenge(CFDictionaryRef *this)
{
  const __CFAllocator *v2;
  const void *v3;
  const void *v4;
  const void *Value;
  const void *v6;
  __CFDictionary *Mutable;
  const char *CStringPtr;
  CFErrorRef *v9;
  const __CFData *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  int CString;
  const char *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  const char *v19;
  const __CFString *v20;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x24BEE7AA8]);
  v3 = (const void *)AMFDRCreateInstanceString();
  CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x24BEE7AD0]);
  v4 = (const void *)AMFDRCreateInstanceString();
  Value = CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x24BEE7AC0]);
  v6 = (const void *)*MEMORY[0x24BDBD270];
  Mutable = CFDictionaryCreateMutable(v2, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("CertifyRawPublicKey"), v6);
  CFDictionarySetValue(Mutable, CFSTR("CertifyChallengeSupport128b"), v6);
  CFDictionarySetValue(Mutable, CFSTR("CertifyRawECDSASignature"), v6);
  CFDictionarySetValue(Mutable, CFSTR("CertifyComponentAttributesCriticalProductionMode"), Value);
  v20 = CFStringCreateWithFormat(v2, 0, CFSTR("%@-%@"), v3, v4);
  CStringPtr = CFStringGetCStringPtr(v20, 0x600u);
  SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s moduleDataInstanceStr: %s \n", "getAuthChallenge", CStringPtr);
  v9 = this + 5;
  AMFDRModuleCreateSignedCSR();
  v10 = this[6];
  if (v10)
  {
    v11 = SavageDevice::PublishToRegistry(this[8], CFSTR("SavageAuthCSR"), v10);
    v12 = CFCopyDescription(this[6]);
    if (v12)
    {
      v13 = v12;
      CString = CFStringGetCString(v12, logString, 4096, 0);
      v15 = "No C string description available.";
      if (CString)
        v15 = logString;
      SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [CSR]: %s (status = 0x%08X) \n", "getAuthChallenge", v15, v11);
      CFRelease(v13);
    }
    else
    {
      SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [CSR]: %s (status = 0x%08X) \n", "getAuthChallenge", "No C string description available.", v11);
    }
  }
  if (!*v9)
  {
LABEL_12:
    if (!v4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v16 = CFErrorCopyDescription(*v9);
  if (v16)
  {
    v17 = v16;
    v18 = CFStringGetCString(v16, logString, 4096, 0);
    v19 = "No C string description available.";
    if (v18)
      v19 = logString;
    SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [error]: %s \n", "getAuthChallenge", v19);
    CFRelease(v17);
    goto LABEL_12;
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s [error]: %s \n", "getAuthChallenge", "No C string description available.");
  if (v4)
LABEL_13:
    CFRelease(v4);
LABEL_14:
  if (v3)
    CFRelease(v3);
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t SavageUpdateController::execCommand(SavageUpdateController *this, CFStringRef theString, const __CFDictionary *a3, const __CFDictionary **a4)
{
  const char *CStringPtr;
  const void *v9;
  const char *v10;
  uint64_t Info;
  int FirmwareDigest;
  uint64_t Stage;
  uint64_t v14;
  const void *v15;
  const void *v16;
  const __CFDictionary *v17;
  const __CFString *v18;
  const char *v19;
  const char *v20;
  const char *v21;

  if (!theString)
    goto LABEL_36;
  CStringPtr = CFStringGetCStringPtr(theString, 0);
  SavageUpdateController::SavageLog(this, "%s: Entering execCommand: command = %s, persoLoop = %d  \n", "execCommand", CStringPtr, *((_DWORD *)this + 107));
  if (*((_BYTE *)this + 249))
    goto LABEL_36;
  if (a3)
  {
    SavageUpdateController::SavageLog(this, "%s: Input specified to the processing command\n", "execCommand");
    v9 = (const void *)*((_QWORD *)this + 32);
    if (v9)
    {
      CFRelease(v9);
      *((_QWORD *)this + 32) = 0;
    }
    *((_QWORD *)this + 32) = SavageSafeRetain(a3);
  }
  if (CFStringCompare(theString, CFSTR("queryInfo"), 0))
  {
    if (CFStringCompare(theString, CFSTR("performNextStage"), 0))
    {
      v10 = CFStringGetCStringPtr(theString, 0);
      SavageUpdateController::SavageLog(this, "%s: Unsupported command: %s\n", "execCommand", v10);
LABEL_36:
      Stage = 0;
      goto LABEL_37;
    }
    if (SavageUpdateController::getFirmware(this)
      || SavageUpdateController::getTSSResponse((CFDictionaryRef *)this))
    {
      goto LABEL_36;
    }
    Stage = SavageUpdateController::eventCmdPerformNextStage(this, v14);
    v15 = (const void *)*((_QWORD *)this + 33);
    if (v15)
    {
      CFRelease(v15);
      *((_QWORD *)this + 33) = 0;
    }
    if (!(_DWORD)Stage)
    {
      if (!*((_BYTE *)this + 17)
        && !*((_BYTE *)this + 25)
        && !*((_BYTE *)this + 19)
        && !*((_BYTE *)this + 21)
        && !*((_BYTE *)this + 23)
        && !*((_BYTE *)this + 16))
      {
        *((_BYTE *)this + 249) = 1;
      }
      SavageUpdateController::SavageLog(this, "%s: isProvisioned=0x%llX; isNGIDProvisioned=0x%X \n",
        "execCommand",
        *(_QWORD *)(*((_QWORD *)this + 8) + 56),
        *(_DWORD *)(*((_QWORD *)this + 8) + 64));
      goto LABEL_29;
    }
  }
  else
  {
    Info = SavageUpdateController::eventCmdQueryInfo(this);
    if ((_DWORD)Info)
    {
      Stage = Info;
      goto LABEL_37;
    }
    if (*((_BYTE *)this + 253) != 1)
    {
LABEL_29:
      if (!a4)
        goto LABEL_36;
      goto LABEL_30;
    }
    SavageUpdateController::SavageLog(this, "%s: Fetching digest during SeaCookie pairing\n", "execCommand");
    if (SavageUpdateController::getTSSResponse((CFDictionaryRef *)this))
      goto LABEL_36;
    FirmwareDigest = SavageUpdateController::getFirmwareDigest(this);
    Stage = 0;
    if (a4 && !FirmwareDigest)
    {
LABEL_30:
      v16 = (const void *)*((_QWORD *)this + 33);
      if (v16)
      {
        v17 = (const __CFDictionary *)SavageSafeRetain(v16);
        *a4 = v17;
        v18 = CFCopyDescription(v17);
        v19 = CFStringGetCStringPtr(v18, 0);
        if (v19)
          v20 = v19;
        else
          v20 = "No C string description available.";
        SavageUpdateController::SavageLog(this, "%s [output]: %s %s \n", "execCommand", "output dictionary of execCommand", v20);
        if (v18)
          CFRelease(v18);
      }
      goto LABEL_36;
    }
  }
LABEL_37:
  v21 = CFStringGetCStringPtr(theString, 0);
  SavageUpdateController::SavageLog(this, "%s: Exiting execCommand: command = %s, result = 0x%X, persoLoop = %d \n", "execCommand", v21, Stage, *((_DWORD *)this + 107));
  return Stage;
}

uint64_t SavageUpdateController::eventCmdQueryInfo(SavageUpdateController *this)
{
  const __CFAllocator *v2;
  uint64_t DeviceInfoDict;
  __CFDictionary *v4;
  const char *v5;
  const void **v6;
  uint64_t v7;
  uint64_t v8;
  UInt8 v9;
  CFDataRef v10;
  uint64_t v11;
  uint64_t RelevantMeasurementTags;
  UInt8 bytes;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  *((_QWORD *)this + 33) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (*((_BYTE *)this + 16) == 1)
  {
    SavageUpdateController::SavageLog(this, "%s: Begin NGID Provisioning \n", "eventCmdQueryInfo");
    SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B38], 1);
    SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B40], 1);
    DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
    if (!(_DWORD)DeviceInfoDict)
    {
      SavageUpdateController::SavageLog(this, "%s: Finished pre NGID Provisioning \n");
      goto LABEL_25;
    }
    return DeviceInfoDict;
  }
  if (*((_BYTE *)this + 17) != 1)
  {
    if (*((_BYTE *)this + 19) == 1)
    {
      SavageUpdateController::SavageLog(this, "%s: Begin Certification \n", "eventCmdQueryInfo");
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B38], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B40], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B48], 1);
      DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
      if ((_DWORD)DeviceInfoDict)
        return DeviceInfoDict;
      SavageUpdateController::SavageLog(this, "%s: Finished pre-certification \n");
      goto LABEL_25;
    }
    if (*((_BYTE *)this + 21) == 1)
    {
      SavageUpdateController::SavageLog(this, "%s: Begin Auth Flow \n", "eventCmdQueryInfo");
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B38], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B40], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE79E0], 1);
      v4 = (__CFDictionary *)*((_QWORD *)this + 33);
      if (!*((_BYTE *)this + 254))
      {
        SavageCFDictionarySetBoolean(v4, (const void *)*MEMORY[0x24BEE7B48], 1);
        DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
        if ((_DWORD)DeviceInfoDict)
          return DeviceInfoDict;
        SavageUpdateController::SavageLog(this, "%s: Finished pre-auth-flow \n");
        goto LABEL_25;
      }
      v5 = "%s: Finished pre-auth-flow \n";
      v6 = (const void **)MEMORY[0x24BEE7AA0];
    }
    else
    {
      if (*((_BYTE *)this + 23) == 1)
      {
        SavageUpdateController::SavageLog(this, "%s: Begin Wrapping \n", "eventCmdQueryInfo");
        SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B40], 1);
        SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7A00], 1);
        SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B38], 1);
        DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
        if ((_DWORD)DeviceInfoDict)
          return DeviceInfoDict;
        SavageUpdateController::SavageLog(this, "%s: Finished pre-wrapping \n");
        goto LABEL_25;
      }
      if (*((_BYTE *)this + 25) != 1)
        goto LABEL_25;
      SavageUpdateController::SavageLog(this, "%s: Begin Personalization \n", "eventCmdQueryInfo");
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B40], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7AA0], 1);
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B38], 1);
      v7 = *((_QWORD *)this + 8);
      if (*(_DWORD *)(v7 + 112) < 0x5065u || !*(_QWORD *)(v7 + 56))
      {
        v5 = "%s: Finished pre-personalizing \n";
        goto LABEL_24;
      }
      SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE79F8], 1);
      v4 = (__CFDictionary *)*((_QWORD *)this + 33);
      v5 = "%s: Finished pre-personalizing \n";
      v6 = (const void **)MEMORY[0x24BEE79E0];
    }
    SavageCFDictionarySetBoolean(v4, *v6, 1);
LABEL_24:
    SavageUpdateController::SavageLog(this, v5, "eventCmdQueryInfo");
    goto LABEL_25;
  }
  SavageUpdateController::SavageLog(this, "%s: Begin Fusing \n", "eventCmdQueryInfo");
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B60], 1);
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B68], 1);
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B40], 1);
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7B38], 1);
  DeviceInfoDict = SavageDevice::PreFusing(*((SavageDevice **)this + 8), *((_DWORD *)this + 106));
  if ((_DWORD)DeviceInfoDict)
    return DeviceInfoDict;
  SavageUpdateController::SavageLog(this, "%s: Finished pre-fusing \n");
LABEL_25:
  DeviceInfoDict = SavageDevice::CreateDeviceInfoDict(*((SavageDevice **)this + 8), *((__CFDictionary **)this + 33));
  if ((_DWORD)DeviceInfoDict)
    return DeviceInfoDict;
  if (*((_BYTE *)this + 252) != 1
    || *((_BYTE *)this + 251) != 1
    || (v8 = *((_QWORD *)this + 8), !*(_QWORD *)(v8 + 56))
    || *((_BYTE *)this + 17)
    || *((_BYTE *)this + 19)
    || *((_BYTE *)this + 21)
    || *((_BYTE *)this + 23)
    || *((_BYTE *)this + 25) != 1)
  {
    v10 = 0;
  }
  else
  {
    if (*(_BYTE *)(v8 + 68))
      v9 = -32;
    else
      v9 = -16;
    bytes = v9;
    v10 = CFDataCreate(v2, &bytes, 1);
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 33), (const void *)*MEMORY[0x24BEE7AC8], v10);
  }
  v11 = *((_QWORD *)this + 8);
  if (*((_BYTE *)this + 251) == 1
    && !*(_QWORD *)(v11 + 56)
    && !*((_BYTE *)this + 17)
    && !*((_BYTE *)this + 19)
    && !*((_BYTE *)this + 21)
    && !*((_BYTE *)this + 23)
    && *((_BYTE *)this + 25) == 1
    && *((_DWORD *)this + 107) == 2)
  {
    *(_BYTE *)(v11 + 69) = *(_BYTE *)(v11 + 69) == 0;
  }
  SavageCFDictionarySetBoolean(*((__CFDictionary **)this + 33), (const void *)*MEMORY[0x24BEE7AC0], *(unsigned __int8 *)(v11 + 69));
  RelevantMeasurementTags = GetRelevantMeasurementTags(*((CFDictionaryRef *)this + 33), (_QWORD *)this + 37, (_QWORD *)this + 36);
  if (v10)
    CFRelease(v10);
  return RelevantMeasurementTags;
}

uint64_t SavageUpdateController::getTSSResponse(CFDictionaryRef *this)
{
  const __CFString *v2;
  const __CFDictionary *v3;
  const void **v4;
  const __CFData *Value;
  const __CFData *v6;
  CFTypeID v7;
  const unsigned __int8 *BytePtr;
  uint64_t v9;
  unsigned int v11;

  v11 = 0;
  CFDictionaryGetValue(this[33], (const void *)*MEMORY[0x24BEE7AA8]);
  v2 = (const __CFString *)AMFDRCreateInstanceString();
  if (SavageCFStringToUInt32(v2, &v11, 16))
  {
    v3 = this[32];
    if (v3)
    {
      if (v11 <= 0x5064)
        v4 = (const void **)MEMORY[0x24BEE7B58];
      else
        v4 = (const void **)MEMORY[0x24BEE79E8];
      Value = (const __CFData *)CFDictionaryGetValue(v3, *v4);
      if (Value && (v6 = Value, v7 = CFGetTypeID(Value), v7 == CFDataGetTypeID()))
      {
        BytePtr = CFDataGetBytePtr(v6);
        CFDataGetLength(v6);
        SavageUpdateController::getSignedCertificate((SavageUpdateController *)this, BytePtr);
        if (this[48])
          v9 = 0;
        else
          v9 = 3;
      }
      else
      {
        v9 = 10;
      }
    }
    else
    {
      v9 = 2;
    }
  }
  else
  {
    v9 = 11;
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)this, "%s: - result = 0x%08X (chipID = 0x%08X) \n", "getTSSResponse", v9, v11);
  if (v2)
    CFRelease(v2);
  return v9;
}

uint64_t SavageUpdateController::getFirmwareDigest(SavageUpdateController *this)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;
  CFDataRef v10;
  CFDataRef v11;
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 46);
  v3 = *(char *)(v2 + 1);
  if (v3 < 0)
  {
    v5 = v3 & 0x7F;
    if (v5 >= 5)
      SavageUpdateController::getFirmwareDigest();
    v4 = v5 + 29;
  }
  else
  {
    v4 = 29;
  }
  if (*(unsigned __int8 *)(v2 + v4) != 135)
    return 8;
  if (*(_BYTE *)(v2 + v4 + 1) != 32)
    return 8;
  SavageUpdateController::SavageLog(this, "%s: Digest offset and length are correctly calculated \n", "getFirmwareDigest");
  MEMORY[0x24BDAC7A8](v6, v7);
  v8 = (_OWORD *)(*((_QWORD *)this + 46) + v4 + 2);
  v9 = v8[1];
  v13[0] = *v8;
  v13[1] = v9;
  v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v13, 32);
  if (!v10)
    return 8;
  v11 = v10;
  CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 33), (const void *)*MEMORY[0x24BEE7B28], v10);
  CFRelease(v11);
  return 0;
}

size_t SavageUpdateController::getFirmware(SavageUpdateController *this)
{
  const __CFDictionary *v2;
  const void *Value;
  const void *v4;
  CFTypeID v5;
  CFTypeID v6;
  CFTypeID v7;
  unsigned int Length;
  UInt8 *v9;
  UInt8 *v10;
  const __CFData *v11;
  CFRange v12;
  size_t result;
  size_t v14;
  UInt8 *v15;
  UInt8 *v16;
  CFRange v17;
  CFRange v18;

  v2 = (const __CFDictionary *)*((_QWORD *)this + 32);
  if (!v2)
    return 2;
  Value = CFDictionaryGetValue(v2, (const void *)*MEMORY[0x24BEE7A38]);
  if (!Value)
    return 10;
  v4 = Value;
  v5 = CFGetTypeID(Value);
  if (v5 != CFDictionaryGetTypeID())
  {
    v6 = CFGetTypeID(v4);
    if (v6 == CFDataGetTypeID())
    {
      SavageUpdateController::SavageLog(this, "%s: Savage firmware passed in as a data ref \n", "getFirmware");
      goto LABEL_8;
    }
    return 10;
  }
  SavageUpdateController::SavageLog(this, "%s: Savage firmware passed in as a dictionary \n", "getFirmware");
  v4 = CFDictionaryGetValue((CFDictionaryRef)v4, (const void *)*MEMORY[0x24BEE7A20]);
  if (!v4)
    return 10;
LABEL_8:
  v7 = CFGetTypeID(v4);
  if (v7 != CFDataGetTypeID())
    return 10;
  v17.location = 0;
  v17.length = 16;
  CFDataGetBytes((CFDataRef)v4, v17, (UInt8 *)this + 396);
  if (!*((_DWORD *)this + 99))
  {
    v14 = *((unsigned int *)this + 100);
    if (!(_DWORD)v14)
      return 4;
    v15 = (UInt8 *)calloc(v14, 1uLL);
    *((_QWORD *)this + 38) = v15;
    if (v15)
    {
      v18.length = *((unsigned int *)this + 100);
      v18.location = 16;
      CFDataGetBytes((CFDataRef)v4, v18, v15);
      result = *((unsigned int *)this + 101);
      if (!(_DWORD)result)
        return result;
      v16 = (UInt8 *)calloc(result, 1uLL);
      *((_QWORD *)this + 39) = v16;
      if (v16)
      {
        v10 = v16;
        v12.location = *((unsigned int *)this + 100) + 16;
        v12.length = *((unsigned int *)this + 101);
        v11 = (const __CFData *)v4;
        goto LABEL_18;
      }
    }
    return 3;
  }
  *(_QWORD *)((char *)this + 396) = 0;
  *(_QWORD *)((char *)this + 404) = 0;
  Length = CFDataGetLength((CFDataRef)v4);
  *((_DWORD *)this + 100) = Length;
  v9 = (UInt8 *)calloc(Length, 1uLL);
  *((_QWORD *)this + 38) = v9;
  if (!v9)
    return 3;
  v10 = v9;
  v12.length = *((unsigned int *)this + 100);
  v11 = (const __CFData *)v4;
  v12.location = 0;
LABEL_18:
  CFDataGetBytes(v11, v12, v10);
  return 0;
}

uint64_t SavageUpdateController::eventCmdPerformNextStage(SavageUpdateController *this, uint64_t a2)
{
  SavageUpdateController *v2;
  SavageUpdateController *v3;
  const char *CStringPtr;
  int SavageProvisioningData;
  unint64_t v6;
  int v7;
  int v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  SavageDevice *v21;
  unsigned int v22;
  const unsigned __int8 *v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  _BYTE *v28;
  int v30;
  char v31[4096];
  uint64_t v32;

  v2 = (SavageUpdateController *)MEMORY[0x24BDAC7A8](this, a2);
  v3 = v2;
  v32 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  if (*((_BYTE *)v2 + 16) == 1)
  {
    SavageUpdateController::SavageLog(v2, "%s: Begin actual NGID Provisioning \n", "eventCmdPerformNextStage");
    SavageDevice::CreateNGIDProvBlob(*((_QWORD *)v3 + 8), (UInt8 *)v3 + 72);
    CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)v3 + 35), 0);
    SavageProvisioningData = getSavageProvisioningData((uint64_t)CStringPtr, (__int128 *)((char *)v3 + 88), 56, (SavageUpdateController *)((char *)v3 + 72), 16, *((const void **)v3 + 46), *((unsigned int *)v3 + 94), (uint64_t)v3 + 144, (_QWORD *)v3 + 30, (SavageUpdateController *)((char *)v3 + 200), (_QWORD *)v3 + 28, (uint64_t)v3 + 216, (_QWORD *)v3 + 29);
    SavageUpdateController::SavageLog(v3, "%s: PearlStatus=%d, KCV=0x%x \n", "eventCmdPerformNextStage", SavageProvisioningData, *((_DWORD *)v3 + 54));
    SavageUpdateController::SavageLog(v3, "%s: NGID_d_e: \n", "eventCmdPerformNextStage");
    bzero(v31, 0x1000uLL);
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = snprintf(&v31[v7], 5uLL, " %02X ", *((unsigned __int8 *)v3 + v6 + 200));
      if (v6 > 0xE)
        break;
      v7 += v8;
      ++v6;
    }
    while (v7 < 4091);
    SavageUpdateController::SavageLog(v3, "%s \n", v31);
    SavageUpdateController::SavageLog(v3, "%s: KCV: \n", "eventCmdPerformNextStage");
    bzero(v31, 0x1000uLL);
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = snprintf(&v31[v10], 5uLL, " %02X ", *((unsigned __int8 *)v3 + v9 + 216));
      if (v9 > 1)
        break;
      v10 += v11;
      ++v9;
    }
    while (v10 < 4091);
    SavageUpdateController::SavageLog(v3, "%s \n", v31);
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    checkSavageProvisioning(&v30);
    v12 = v30;
    if (v30 == 1 || v30 == 4)
      v14 = 0;
    else
      v14 = 7;
    *((_BYTE *)v3 + 16) = 0;
    SavageUpdateController::SavageLog(v3, "%s Tried NGID Provisioning...look for valid KCV in the ioreg (NGIDProvStatus = %d) \n", "eventCmdPerformNextStage", v12);
    return v14;
  }
  if (*((_BYTE *)v2 + 17) == 1)
  {
    SavageUpdateController::SavageLog(v2, "%s: Begin actual Fusing \n", "eventCmdPerformNextStage");
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    v15 = *(_QWORD *)(*((_QWORD *)v3 + 8) + 56);
    v16 = -536870167;
    if (v15)
      v16 = 0;
    SavageUpdateController::SavageLog(v3, "%s: Finished fusing with result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v16, *((unsigned __int8 *)v3 + 18));
    v17 = *((unsigned __int8 *)v3 + 18);
    if (v15)
    {
      *((_BYTE *)v3 + 17) = 0;
      if (!v17)
        return 0;
    }
    else if (!*((_BYTE *)v3 + 18))
    {
      v14 = 3758097129;
      *((_BYTE *)v3 + 17) = 0;
      return v14;
    }
    v14 = 0;
    *((_BYTE *)v3 + 18) = 0;
    return v14;
  }
  if (*((_BYTE *)v2 + 19) == 1)
  {
    SavageUpdateController::SavageLog(v2, "%s Begin reading info needed for certification \n", "eventCmdPerformNextStage");
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    v18 = *(_QWORD *)(*((_QWORD *)v3 + 8) + 72);
    v19 = -536870167;
    if (v18)
      v19 = 0;
    SavageUpdateController::SavageLog(v3, "%s: Extracting certification data is done with result = 0x%02X (tryAgain = %d) \n", "eventCmdPerformNextStage", v19, *((unsigned __int8 *)v3 + 20));
    v20 = *((unsigned __int8 *)v3 + 20);
    if (v18)
    {
      *((_BYTE *)v3 + 19) = 0;
      if (!v20)
        return 0;
    }
    else if (!*((_BYTE *)v3 + 20))
    {
      v14 = 3758097129;
      *((_BYTE *)v3 + 19) = 0;
      return v14;
    }
    v14 = 0;
    *((_BYTE *)v3 + 20) = 0;
    return v14;
  }
  if (*((_BYTE *)v2 + 21) != 1)
  {
    if (*((_BYTE *)v2 + 23) != 1)
    {
      if (*((_BYTE *)v2 + 25) == 1)
      {
        SavageUpdateController::formatAndStitchFiles(v2);
        SavageUpdateController::writeFilesToFileSystem(v3);
        if (*((_BYTE *)v3 + 26) == 1)
        {
          *((_BYTE *)v3 + 26) = 0;
        }
        else if (!*((_BYTE *)v3 + 26))
        {
          --*((_DWORD *)v3 + 107);
        }
        if (!*((_DWORD *)v3 + 107))
        {
          *((_BYTE *)v3 + 25) = 0;
          SavageUpdateController::SavageLog(v3, "%s: Finished Personalization \n", "eventCmdPerformNextStage");
        }
      }
      return 0;
    }
    SavageUpdateController::SavageLog(v2, "SavageUpdateController::eventCmdPerformNextStage: Begin actual wrapping live nonce boot \n");
    if (!*(_BYTE *)(*((_QWORD *)v3 + 8) + 18))
    {
      SavageUpdateController::SavageLog(v3, "%s: Missing FDRDataEncryptionKey in ioreg \n", "eventCmdPerformNextStage");
      return 3758097136;
    }
    SavageUpdateController::SavageLog(v3, "%s: Picked up FDRDataEncryptionKey as wrap input key \n", "eventCmdPerformNextStage");
    SavageUpdateController::formatAndStitchFiles(v3);
    SavageDevice::Fusing(*((SavageDevice **)v3 + 8), *((_DWORD *)v3 + 106), *((const unsigned __int8 **)v3 + 52), *((_DWORD *)v3 + 103));
    v24 = *(_QWORD *)(*((_QWORD *)v3 + 8) + 96);
    v25 = -536870167;
    if (v24)
      v25 = 0;
    SavageUpdateController::SavageLog(v3, "%s: Finished wrapping: 0x%02llx (result = 0x%02X; tryAgain = %d) \n",
      "eventCmdPerformNextStage",
      v24,
      v25,
      *((unsigned __int8 *)v3 + 24));
    v26 = *((unsigned __int8 *)v3 + 24);
    if (v24)
    {
      *((_BYTE *)v3 + 23) = 0;
      if (!v26)
        return 0;
    }
    else if (!*((_BYTE *)v3 + 24))
    {
      v14 = 3758097129;
      *((_BYTE *)v3 + 23) = 0;
      return v14;
    }
    v14 = 0;
    *((_BYTE *)v3 + 24) = 0;
    return v14;
  }
  SavageUpdateController::SavageLog(v2, "%s: Begin reading info needed for auth flow \n", "eventCmdPerformNextStage");
  if (*((_BYTE *)v3 + 254) || !*(_QWORD *)(*((_QWORD *)v3 + 8) + 80))
  {
    SavageUpdateController::formatAndStitchFiles(v3);
    v21 = (SavageDevice *)*((_QWORD *)v3 + 8);
    v22 = *((_DWORD *)v3 + 106);
    v23 = (const unsigned __int8 *)*((_QWORD *)v3 + 52);
    if (*((_BYTE *)v3 + 254))
      SavageDevice::AuthFlow(v21, v22, v23);
    else
      SavageDevice::Fusing(v21, v22, v23, *((_DWORD *)v3 + 103));
  }
  else
  {
    SavageUpdateController::getAuthChallenge((CFDictionaryRef *)v3);
  }
  if (*(_QWORD *)(*((_QWORD *)v3 + 8) + 88))
  {
    v28 = (char *)v3 + 22;
    v27 = *((unsigned __int8 *)v3 + 22);
    if (*((_DWORD *)v3 + 108) == 1)
    {
      SavageUpdateController::SavageLog(v3, "%s: Extracting auth certification data is done with result = 0x%02X (authFlowLoop = %d, tryAgain = %d) \n", "eventCmdPerformNextStage", 0, 1, v27);
      v14 = 0;
LABEL_55:
      *((_BYTE *)v3 + 21) = 0;
      goto LABEL_56;
    }
  }
  else
  {
    v28 = (char *)v3 + 22;
    v27 = *((unsigned __int8 *)v3 + 22);
  }
  v14 = 3758097129;
  SavageUpdateController::SavageLog(v3, "%s: Extracting auth certification data is done with result = 0x%02X (authFlowLoop = %d, tryAgain = %d) \n", "eventCmdPerformNextStage", -536870167, *((_DWORD *)v3 + 108), v27);
  if (!*((_DWORD *)v3 + 108))
    goto LABEL_55;
LABEL_56:
  if (*(_QWORD *)(*((_QWORD *)v3 + 8) + 88))
    --*((_DWORD *)v3 + 108);
  if (*v28)
  {
    v14 = 0;
    *v28 = 0;
  }
  return v14;
}

void SavageUpdateController::writeFilesToFileSystem(SavageUpdateController *this)
{
  const __CFAllocator *v2;
  const CFArrayCallBacks *v3;
  __CFArray *Mutable;
  __CFArray *v5;
  __CFArray *v6;
  __CFArray *v7;
  __CFArray *v8;
  __CFArray *v9;
  __CFArray *v10;
  __CFArray *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  const __CFString *v14;
  __CFArray *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const char *CStringPtr;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  CFStringRef v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  CFStringRef v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  CFStringRef v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  CFStringRef v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  CFStringRef v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  CFStringRef v54;
  CFStringRef v55;
  const __CFString *theString;
  const __CFArray *v57;
  const __CFArray *v58;
  __CFArray *v59;
  __CFArray *v60;
  __CFArray *cf;
  __CFArray *v62;
  const __CFArray *v63;
  const __CFArray *v64;

  SavageUpdateController::SavageLog(this, "%s: persoLoop=%d, isProd=%d, isBalan=%d\n", "writeFilesToFileSystem", *((_DWORD *)this + 107), *(unsigned __int8 *)(*((_QWORD *)this + 8) + 69), *(unsigned __int8 *)(*((_QWORD *)this + 8) + 68));
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  CFArrayAppendValue(Mutable, *((const void **)this + 34));
  v5 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v5, *((const void **)this + 34));
  v6 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v6, *((const void **)this + 34));
  v7 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v7, *((const void **)this + 34));
  v8 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v8, *((const void **)this + 34));
  v9 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v9, *((const void **)this + 34));
  v10 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v10, *((const void **)this + 34));
  CFArrayAppendValue(v10, *((const void **)this + 37));
  v11 = CFArrayCreateMutable(v2, 0, v3);
  CFArrayAppendValue(v11, *((const void **)this + 34));
  CFArrayAppendValue(v11, *((const void **)this + 36));
  cf = Mutable;
  v63 = v11;
  v64 = v10;
  v62 = v8;
  if (*((_BYTE *)this + 17) == 1)
  {
    CFArrayAppendValue(Mutable, CFSTR("/SavagePatchFusing.DAT"));
    CFArrayAppendValue(v5, CFSTR("/SavageLeafCertFusing.DER"));
    CFArrayAppendValue(v6, CFSTR("/SavageLeafSigFusing.DER"));
    CFArrayAppendValue(v7, CFSTR("/SavagePatchFusing.DER"));
    CFArrayAppendValue(v8, CFSTR("/SavageFirmwareSigFusing.DER"));
    CFArrayAppendValue(v9, CFSTR("/SavageFullCertFusing.DER"));
    v12 = v9;
    v13 = v7;
    goto LABEL_11;
  }
  if (*((_BYTE *)this + 19) == 1)
  {
    CFArrayAppendValue(Mutable, CFSTR("/SavagePatchCertification.DAT"));
    CFArrayAppendValue(v5, CFSTR("/SavageLeafCertCertification.DER"));
    CFArrayAppendValue(v6, CFSTR("/SavageLeafSigCertification.DER"));
    v13 = v7;
    CFArrayAppendValue(v7, CFSTR("/SavagePatchCertification.DER"));
    CFArrayAppendValue(v8, CFSTR("/SavageFirmwareSigCertification.DER"));
    v14 = CFSTR("/SavageFullCertCertification.DER");
LABEL_9:
    v12 = v9;
    v15 = v9;
LABEL_10:
    CFArrayAppendValue(v15, v14);
    goto LABEL_11;
  }
  if (*((_BYTE *)this + 21) == 1)
  {
    CFArrayAppendValue(Mutable, CFSTR("/SavagePatchAuthCertification.DAT"));
    CFArrayAppendValue(v5, CFSTR("/SavageLeafCertAuthCertification.DER"));
    CFArrayAppendValue(v6, CFSTR("/SavageLeafSigAuthCertification.DER"));
    v13 = v7;
    CFArrayAppendValue(v7, CFSTR("/SavagePatchAuthCertification.DER"));
    CFArrayAppendValue(v8, CFSTR("/SavageFirmwareSigAuthCertification.DER"));
    v14 = CFSTR("/SavageFullCertAuthCertification.DER");
    goto LABEL_9;
  }
  if (*((_BYTE *)this + 23) == 1)
  {
    CFArrayAppendValue(Mutable, CFSTR("/SavagePatchWrap.DAT"));
    CFArrayAppendValue(v5, CFSTR("/SavageLeafCertWrap.DER"));
    CFArrayAppendValue(v6, CFSTR("/SavageLeafSigWrap.DER"));
    v13 = v7;
    CFArrayAppendValue(v7, CFSTR("/SavagePatchWrap.DER"));
    CFArrayAppendValue(v8, CFSTR("/SavageFirmwareSigWrap.DER"));
    v14 = CFSTR("/SavageFullCertWrap.DER");
    goto LABEL_9;
  }
  v12 = v9;
  v13 = v7;
  if (*((_BYTE *)this + 25) == 1)
  {
    v31 = *((_QWORD *)this + 8);
    if (*(_QWORD *)(v31 + 56))
    {
      CFArrayAppendValue(Mutable, CFSTR("/SavagePatch.DAT"));
      CFArrayAppendValue(v5, CFSTR("/SavageLeafCert.DER"));
      CFArrayAppendValue(v6, CFSTR("/SavageLeafSig.DER"));
      v13 = v7;
      CFArrayAppendValue(v7, CFSTR("/SavagePatch.DER"));
      CFArrayAppendValue(v8, CFSTR("/SavageFirmwareSig.DER"));
      v14 = CFSTR("/SavageFullCert.DER");
      v15 = v9;
      goto LABEL_10;
    }
    if (*(_BYTE *)(v31 + 68))
      v32 = "BA";
    else
      v32 = "B3";
    if (*(_BYTE *)(v31 + 69))
      v33 = "Prod";
    else
      v33 = "Dev";
    v34 = CFStringCreateWithFormat(v2, 0, CFSTR("/SavagePatch%s%s.DAT"), v32, v33);
    CFArrayAppendValue(Mutable, v34);
    if (v34)
      CFRelease(v34);
    v35 = *((_QWORD *)this + 8);
    v36 = "B3";
    if (*(_BYTE *)(v35 + 68))
      v36 = "BA";
    if (*(_BYTE *)(v35 + 69))
      v37 = "Prod";
    else
      v37 = "Dev";
    v38 = CFStringCreateWithFormat(v2, 0, CFSTR("/SavageLeafCert%s%s.DER"), v36, v37);
    CFArrayAppendValue(v5, v38);
    if (v38)
      CFRelease(v38);
    v39 = *((_QWORD *)this + 8);
    v40 = "B3";
    if (*(_BYTE *)(v39 + 68))
      v40 = "BA";
    if (*(_BYTE *)(v39 + 69))
      v41 = "Prod";
    else
      v41 = "Dev";
    v42 = CFStringCreateWithFormat(v2, 0, CFSTR("/SavageLeafSig%s%s.DER"), v40, v41);
    CFArrayAppendValue(v6, v42);
    if (v42)
      CFRelease(v42);
    v43 = *((_QWORD *)this + 8);
    v44 = "B3";
    if (*(_BYTE *)(v43 + 68))
      v44 = "BA";
    if (*(_BYTE *)(v43 + 69))
      v45 = "Prod";
    else
      v45 = "Dev";
    v46 = CFStringCreateWithFormat(v2, 0, CFSTR("/SavagePatch%s%s.DER"), v44, v45);
    CFArrayAppendValue(v7, v46);
    if (v46)
      CFRelease(v46);
    v47 = *((_QWORD *)this + 8);
    v48 = "B3";
    if (*(_BYTE *)(v47 + 68))
      v48 = "BA";
    if (*(_BYTE *)(v47 + 69))
      v49 = "Prod";
    else
      v49 = "Dev";
    v50 = CFStringCreateWithFormat(v2, 0, CFSTR("/SavageFirmwareSig%s%s.DER"), v48, v49);
    CFArrayAppendValue(v8, v50);
    if (v50)
      CFRelease(v50);
    v51 = *((_QWORD *)this + 8);
    v52 = "B3";
    if (*(_BYTE *)(v51 + 68))
      v52 = "BA";
    if (*(_BYTE *)(v51 + 69))
      v53 = "Prod";
    else
      v53 = "Dev";
    v54 = CFStringCreateWithFormat(v2, 0, CFSTR("/SavageFullCert%s%s.DER"), v52, v53);
    v12 = v9;
    CFArrayAppendValue(v9, v54);
    v55 = v54;
    v13 = v7;
    if (v55)
      CFRelease(v55);
  }
LABEL_11:
  theString = CFStringCreateByCombiningStrings(v2, Mutable, &stru_24E75AD68);
  v59 = v5;
  v16 = CFStringCreateByCombiningStrings(v2, v5, &stru_24E75AD68);
  v60 = v6;
  v17 = CFStringCreateByCombiningStrings(v2, v6, &stru_24E75AD68);
  v57 = v13;
  v18 = CFStringCreateByCombiningStrings(v2, v13, &stru_24E75AD68);
  v19 = CFStringCreateByCombiningStrings(v2, v8, &stru_24E75AD68);
  v58 = v12;
  v20 = CFStringCreateByCombiningStrings(v2, v12, &stru_24E75AD68);
  v21 = CFStringCreateByCombiningStrings(v2, v64, &stru_24E75AD68);
  v22 = CFStringCreateByCombiningStrings(v2, v63, &stru_24E75AD68);
  CStringPtr = CFStringGetCStringPtr(v21, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", CStringPtr, *((_DWORD *)this + 100));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 38), *((unsigned int *)this + 100), v21);
  v24 = CFStringGetCStringPtr(v22, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v24, *((_DWORD *)this + 101));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 39), *((unsigned int *)this + 101), v22);
  v25 = CFStringGetCStringPtr(v16, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v25, *((_DWORD *)this + 82));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 40), *((unsigned int *)this + 82), v16);
  v26 = CFStringGetCStringPtr(v17, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v26, *((_DWORD *)this + 86));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 42), *((unsigned int *)this + 86), v17);
  v27 = CFStringGetCStringPtr(v19, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v27, *((_DWORD *)this + 90));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 44), *((unsigned int *)this + 90), v19);
  v28 = CFStringGetCStringPtr(v18, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v28, *((_DWORD *)this + 94));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 46), *((unsigned int *)this + 94), v18);
  v29 = CFStringGetCStringPtr(v20, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v29, *((_DWORD *)this + 103));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 48), *((unsigned int *)this + 98), v20);
  v30 = CFStringGetCStringPtr(theString, 0);
  SavageUpdateController::SavageLog(this, "%s: %s (%d)\n", "writeFilesToFileSystem", v30, *((_DWORD *)this + 103));
  SavageUpdateController::writeDataToFileURL(this, *((unsigned __int8 **)this + 52), *((unsigned int *)this + 103), theString);
  if (theString)
    CFRelease(theString);
  if (cf)
    CFRelease(cf);
  if (v18)
    CFRelease(v18);
  if (v57)
    CFRelease(v57);
  if (v16)
    CFRelease(v16);
  if (v59)
    CFRelease(v59);
  if (v17)
    CFRelease(v17);
  if (v60)
    CFRelease(v60);
  if (v19)
    CFRelease(v19);
  if (v62)
    CFRelease(v62);
  if (v20)
    CFRelease(v20);
  if (v58)
    CFRelease(v58);
  if (v21)
    CFRelease(v21);
  if (v64)
    CFRelease(v64);
  if (v22)
    CFRelease(v22);
  if (v63)
    CFRelease(v63);
}

void SavageUpdateController::getSignedCertificate(SavageUpdateController *this, const unsigned __int8 *a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned __int8 *v10;
  int v11;
  unsigned int v12;
  void *v13;
  unint64_t v14;
  int i;
  int v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  int j;
  int v21;
  unint64_t v22;
  int k;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  void *v33;
  unint64_t v34;
  int m;
  int v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  int n;
  int v41;
  unint64_t v42;
  int ii;
  int v44;
  size_t v45;
  void *v46;
  unint64_t v47;
  int jj;
  int v49;
  char v50[4096];
  uint64_t v51;

  v2 = MEMORY[0x24BDAC7A8](this, a2);
  v4 = v3;
  v5 = v2;
  v51 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v2 + 384) = 0;
  *(_DWORD *)(v2 + 392) = 0;
  *(_QWORD *)(v2 + 320) = 0;
  *(_DWORD *)(v2 + 328) = 0;
  *(_QWORD *)(v2 + 336) = 0;
  *(_DWORD *)(v2 + 344) = 0;
  *(_QWORD *)(v2 + 368) = 0;
  *(_DWORD *)(v2 + 376) = 0;
  *(_QWORD *)(v2 + 352) = 0;
  *(_DWORD *)(v2 + 360) = 0;
  if ((char)v3[1] < 0)
  {
    v7 = v3[1] & 0x7F;
    if (v7 > 4)
      SavageUpdateController::getSignedCertificate();
    if ((v3[1] & 0x7F) != 0)
    {
      v8 = 0;
      v9 = 0;
      v10 = v3 + 2;
      do
      {
        v11 = *v10++;
        v9 = (v9 << v8) | v11;
        *(_DWORD *)(v2 + 328) = v9;
        v8 += 8;
      }
      while (8 * v7 != v8);
    }
    else
    {
      v9 = 0;
    }
    v6 = v7 + v9;
  }
  else
  {
    v6 = v3[1];
  }
  v12 = v6 + 2;
  *(_DWORD *)(v2 + 328) = v12;
  v13 = calloc(v12, 1uLL);
  *(_QWORD *)(v5 + 320) = v13;
  memcpy(v13, v4, *(unsigned int *)(v5 + 328));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "LeafCertificate:--------------offset = %d (%d)\n", 0, *(_DWORD *)(v5 + 328));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 328))
  {
    v14 = 0;
    for (i = 0; i < 4091; i += v16)
    {
      v16 = snprintf(&v50[i], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v5 + 320) + v14++));
      if (v14 >= *(unsigned int *)(v5 + 328))
        break;
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  v17 = *(unsigned int *)(v5 + 328);
  *(_DWORD *)(v5 + 344) = v4[(v17 + 1)] + 2;
  v18 = calloc(0x40uLL, 1uLL);
  *(_QWORD *)(v5 + 336) = v18;
  memcpy(v18, &v4[v17], *(unsigned int *)(v5 + 344));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "LeafSignature(Pre-validation):--------------offset = %d (%d)\n", v17, *(_DWORD *)(v5 + 344));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 344))
  {
    v19 = 0;
    for (j = 0; j < 4091; j += v21)
    {
      v21 = snprintf(&v50[j], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v5 + 336) + v19++));
      if (v19 >= *(unsigned int *)(v5 + 344))
        break;
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  SavageUpdateController::validateSignatureLen((SavageUpdateController *)v5, *(unsigned __int8 **)(v5 + 336), (unsigned int *)(v5 + 344));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "LeafSignature(Post-validation):--------------offset = %d (%d)\n", v17, *(_DWORD *)(v5 + 344));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 344))
  {
    v22 = 0;
    for (k = 0; k < 4091; k += v24)
    {
      v24 = snprintf(&v50[k], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v5 + 336) + v22++));
      if (v22 >= *(unsigned int *)(v5 + 344))
        break;
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  v25 = *(_DWORD *)(v5 + 344);
  v26 = v25 + v17;
  if ((char)v4[(v25 + v17 + 1)] < 0)
  {
    v28 = v4[(v25 + v17 + 1)] & 0x7F;
    if (v28 >= 5)
      SavageUpdateController::getSignedCertificate();
    *(_DWORD *)(v5 + 376) = 0;
    if ((_DWORD)v28)
    {
      v29 = 0;
      v30 = 0;
      v31 = v25 + v17 + 2;
      do
      {
        v30 = (v30 << v29) | v4[v31];
        *(_DWORD *)(v5 + 376) = v30;
        ++v31;
        v29 += 8;
      }
      while (8 * v28 != v29);
    }
    else
    {
      v30 = 0;
    }
    v27 = v28 + v30;
  }
  else
  {
    v27 = v4[(v25 + v17 + 1)];
  }
  v32 = v27 + 2;
  *(_DWORD *)(v5 + 376) = v32;
  v33 = calloc(v32, 1uLL);
  *(_QWORD *)(v5 + 368) = v33;
  memcpy(v33, &v4[v26], *(unsigned int *)(v5 + 376));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "FirmwareCertificate:--------------offset = %d (%d)\n", v26, *(_DWORD *)(v5 + 376));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 376))
  {
    v34 = 0;
    for (m = 0; m < 4091; m += v36)
    {
      v36 = snprintf(&v50[m], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v5 + 368) + v34++));
      if (v34 >= *(unsigned int *)(v5 + 376))
        break;
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  v37 = (*(_DWORD *)(v5 + 376) + v26);
  *(_DWORD *)(v5 + 360) = v4[(v37 + 1)] + 2;
  v38 = calloc(0x40uLL, 1uLL);
  *(_QWORD *)(v5 + 352) = v38;
  memcpy(v38, &v4[v37], *(unsigned int *)(v5 + 360));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "FirmwareSignature (Pre-validation):--------------offset = %d (%d)\n", v37, *(_DWORD *)(v5 + 360));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 360))
  {
    v39 = 0;
    for (n = 0; n < 4091; n += v41)
    {
      v41 = snprintf(&v50[n], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v5 + 352) + v39++));
      if (v39 >= *(unsigned int *)(v5 + 360))
        break;
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  SavageUpdateController::validateSignatureLen((SavageUpdateController *)v5, *(unsigned __int8 **)(v5 + 352), (unsigned int *)(v5 + 360));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "FirmwareSignature (Post-validation):--------------offset = %d (%d)\n", v37, *(_DWORD *)(v5 + 360));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 360))
  {
    v42 = 0;
    for (ii = 0; ii < 4091; ii += v44)
    {
      v44 = snprintf(&v50[ii], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v5 + 352) + v42++));
      if (v42 >= *(unsigned int *)(v5 + 360))
        break;
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
  v45 = (*(_DWORD *)(v5 + 344) + *(_DWORD *)(v5 + 328) + *(_DWORD *)(v5 + 376) + *(_DWORD *)(v5 + 360));
  *(_DWORD *)(v5 + 392) = v45;
  v46 = calloc(v45, 1uLL);
  *(_QWORD *)(v5 + 384) = v46;
  memcpy(v46, *(const void **)(v5 + 320), *(unsigned int *)(v5 + 328));
  memcpy((void *)(*(_QWORD *)(v5 + 384) + *(unsigned int *)(v5 + 328)), *(const void **)(v5 + 336), *(unsigned int *)(v5 + 344));
  memcpy((void *)(*(_QWORD *)(v5 + 384) + *(unsigned int *)(v5 + 328) + *(unsigned int *)(v5 + 344)), *(const void **)(v5 + 368), *(unsigned int *)(v5 + 376));
  memcpy((void *)(*(_QWORD *)(v5 + 384)+ *(unsigned int *)(v5 + 328)+ *(unsigned int *)(v5 + 344)+ (unint64_t)*(unsigned int *)(v5 + 376)), *(const void **)(v5 + 352), *(unsigned int *)(v5 + 360));
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "Complete Signed Savage Certificate:--------------Length = %d \n", *(_DWORD *)(v5 + 392));
  bzero(v50, 0x1000uLL);
  if (*(_DWORD *)(v5 + 392))
  {
    v47 = 0;
    for (jj = 0; jj < 4091; jj += v49)
    {
      v49 = snprintf(&v50[jj], 5uLL, " %02X ", *(unsigned __int8 *)(*(_QWORD *)(v5 + 384) + v47++));
      if (v47 >= *(unsigned int *)(v5 + 392))
        break;
    }
  }
  SavageUpdateController::SavageLog((SavageUpdateController *)v5, "%s \n", v50);
}

void SavageUpdateController::validateSignatureLen(SavageUpdateController *this, unsigned __int8 *a2, unsigned int *a3)
{
  unsigned __int8 v6;
  uint64_t v7;
  size_t v8;
  unsigned __int8 v9;
  unsigned __int8 *v10;
  uint64_t v11;
  size_t v12;

  v6 = a2[1];
  v7 = a2[3];
  SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- r length = %d \n", a2[3]);
  if ((v7 - 30) <= 0xE2u)
    SavageUpdateController::validateSignatureLen();
  if (v7 <= 0x1B)
  {
    v8 = 28 - v7;
    SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- Padding the r value with %d zero bytes \n", v8);
    memmove(&a2[v8 + 4], a2 + 4, *a3 - 4);
    bzero(a2 + 4, v8);
    a2[3] = 28;
    v6 += v8;
    *a3 += v8;
  }
  v9 = a2[3] + 5;
  v10 = &a2[v9];
  v11 = *v10;
  SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- s length = %d \n", *v10);
  if ((v11 - 30) <= 0xE2u)
    SavageUpdateController::validateSignatureLen();
  if (v11 <= 0x1B)
  {
    v12 = 28 - v11;
    SavageUpdateController::SavageLog(this, "\n SavageUpdateController::validateSignatureLen -- Padding the s value with %d zero bytes \n", v12);
    memmove(&v10[v12 + 1], v10 + 1, *a3 + ~v9);
    bzero(&a2[v9 + 1], v12);
    a2[v9] = 28;
    v6 += v12;
    *a3 += v12;
  }
  a2[1] = v6;
}

void SavageUpdateController::writeDataToFileURL(SavageUpdateController *this, unsigned __int8 *a2, CFIndex length, const __CFString *a4)
{
  CFDataRef v6;
  CFURLRef v7;

  v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, length);
  v7 = CFURLCreateWithFileSystemPath(0, a4, kCFURLPOSIXPathStyle, 0);
  if (MEMORY[0x227672D74]())
    SavageUpdateController::SavageLog(this, "%s: AMSupportMakeDirectory failed with fileNameFS \n", "writeDataToFileURL");
  if (AMSupportWriteDataToFileURL())
    SavageUpdateController::SavageLog(this, "%s: AMSupportWriteDataToFileURL failed with fileNameFS \n", "writeDataToFileURL");
  AMSupportPlatformFileURLExists();
  SavageUpdateController::SavageLog(this, "%s: File does not exist\n", "writeDataToFileURL");
  if (v6)
    CFRelease(v6);
  if (v7)
    CFRelease(v7);
}

const __CFString *SavageUpdaterCreate(SavageUpdateController *a1, void *a2, const __CFDictionary *a3, CFTypeRef *a4)
{
  uint64_t Instance;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *CFErrorWithDomain;
  const char *CStringPtr;
  const char *v18;
  const char *v19;
  const __CFString **v20;
  CFErrorRef v21;

  if (SavageUpdaterCreate::only_once != -1)
    dispatch_once(&SavageUpdaterCreate::only_once, &__block_literal_global);
  if (!SavageUpdaterTypeID)
  {
    v18 = "SavageUpdaterCreate - failed to register kLibSavageUpdaterClass";
    goto LABEL_13;
  }
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    v18 = "SavageUpdaterCreate - failed to create SavageUpdaterObj";
LABEL_13:
    CFErrorWithDomain = (const __CFString *)createCFErrorWithDomain((uint64_t)v18, 3u, (uint64_t)a1, CFSTR("SavageErrorDomain"));
    if (!CFErrorWithDomain)
      return 0;
    goto LABEL_19;
  }
  v10 = (const __CFString *)Instance;
  v11 = SavageUpdaterTypeID;
  *(_QWORD *)(Instance + 16) = 0;
  *(_QWORD *)(Instance + 24) = v11;
  v12 = SavageUpdateController::getInstance(a1, a3, a2, v9);
  v10[1].isa = (void *)v12;
  if (!v12)
  {
    v19 = "SavageUpdaterCreate - no savage controller instance";
    v20 = (const __CFString **)&kSavageErrorDomain;
LABEL_17:
    v21 = createCFErrorWithDomain((uint64_t)v19, 0x10u, (uint64_t)a1, *v20);
    if (!v21)
      return v10;
    CFErrorWithDomain = (const __CFString *)v21;
    CFRelease(v10);
LABEL_19:
    v10 = 0;
    if (a4)
      *a4 = SavageSafeRetain(CFErrorWithDomain);
    goto LABEL_9;
  }
  v14 = YonkersUpdateController::getInstance(a1, a3, a2, v13);
  v10[1].info = v14;
  if (!v14)
  {
    v19 = "SavageUpdaterCreate - no yonkers controller instance";
    v20 = (const __CFString **)&kYonkersErrorDomain;
    goto LABEL_17;
  }
  if (a2)
  {
    CFErrorWithDomain = SavageUpdaterCreateDescription(v10);
    CStringPtr = CFStringGetCStringPtr(CFErrorWithDomain, 0);
    ((void (*)(const __CFDictionary *, const char *))a2)(a3, CStringPtr);
    if (CFErrorWithDomain)
LABEL_9:
      CFRelease(CFErrorWithDomain);
  }
  return v10;
}

void SavageUpdaterDestroy(SavageUpdateController *a1)
{
  if (a1)
  {
    if (*((_QWORD *)a1 + 4))
    {
      SavageUpdateController::destroyInstance(a1);
      *((_QWORD *)a1 + 4) = 0;
    }
    if (*((_QWORD *)a1 + 5))
    {
      YonkersUpdateController::destroyInstance(a1);
      *((_QWORD *)a1 + 5) = 0;
    }
  }
}

CFStringRef SavageUpdaterCreateDescription(CFStringRef result)
{
  CFStringRef v1;
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  if (result)
  {
    v1 = result;
    v2 = CFGetAllocator(result);
    v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, CFSTR("<libSavageUpdater %p [%p]>{} \n"), v1, v3);
  }
  return result;
}

uint64_t SavageUpdaterExecCommand(uint64_t a1, CFStringRef theString, __CFDictionary *a3, __CFDictionary **a4, CFTypeRef *a5)
{
  SavageUpdateController *v8;
  YonkersUpdateController *v9;
  unsigned int v12;
  unsigned int v13;
  const __CFString *v14;
  const char *v15;
  __CFDictionary *v16;
  CFErrorRef CFErrorWithDomain;
  CFErrorRef v18;
  unsigned int v19;

  if (!a1 || !theString)
  {
    v14 = CFSTR("SavageErrorDomain");
    v15 = "SavageUpdaterExecCommand - invalid input to SavageUpdaterExecCommand";
    v13 = 2;
LABEL_29:
    v16 = 0;
    goto LABEL_15;
  }
  v8 = *(SavageUpdateController **)(a1 + 32);
  if (!v8)
  {
    v14 = CFSTR("SavageErrorDomain");
    v15 = "SavageUpdaterExecCommand - no savage controller instance";
LABEL_28:
    v13 = 16;
    goto LABEL_29;
  }
  v9 = *(YonkersUpdateController **)(a1 + 40);
  if (!v9)
  {
    v14 = CFSTR("YonkersErrorDomain");
    v15 = "SavageUpdaterExecCommand - no yonkers controller instance";
    goto LABEL_28;
  }
  if (!*((_BYTE *)v8 + 248) || !*((_BYTE *)v9 + 32))
  {
    if (*((_BYTE *)v8 + 249))
    {
      if (*((_BYTE *)v9 + 33))
      {
        v13 = 2;
        goto LABEL_13;
      }
      v19 = YonkersUpdateController::execCommand(v9, theString, a3, a4);
    }
    else
    {
      v19 = SavageUpdateController::execCommand(v8, theString, a3, a4);
    }
    v13 = v19;
    if (!v19)
      return 1;
LABEL_13:
    v14 = CFSTR("SavageErrorDomain");
    v15 = "SavageUpdaterExecCommand - No-preflight - controller exec command error";
    goto LABEL_14;
  }
  v12 = SavageUpdateController::execCommand(v8, theString, a3, a4);
  if (!v12)
  {
    v12 = YonkersUpdateController::execCommand(v9, theString, a3, a4);
    if (!v12)
      return 1;
  }
  v13 = v12;
  v14 = CFSTR("SavageErrorDomain");
  v15 = "SavageUpdaterExecCommand - Preflighting - controller exec command error";
LABEL_14:
  v16 = a3;
LABEL_15:
  CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v15, v13, (uint64_t)v16, v14);
  v18 = CFErrorWithDomain;
  if (a5 && CFErrorWithDomain)
  {
    *a5 = SavageSafeRetain(CFErrorWithDomain);
LABEL_23:
    CFRelease(v18);
    return 0;
  }
  if (CFErrorWithDomain)
    goto LABEL_23;
  return 0;
}

uint64_t SavageUpdaterExecCmd()
{
  return 0;
}

uint64_t SavageUpdaterIsDone(uint64_t result, CFTypeRef *a2)
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  const __CFString **v6;
  CFErrorRef CFErrorWithDomain;
  CFErrorRef v8;

  if (result)
  {
    v3 = *(_QWORD *)(result + 32);
    if (v3)
    {
      v4 = *(_QWORD *)(result + 40);
      if (v4)
        return *(_BYTE *)(v3 + 249) && *(unsigned __int8 *)(v4 + 33) != 0;
      v5 = "SavageUpdaterIsDone - no yonkers controller instance";
      v6 = (const __CFString **)&kYonkersErrorDomain;
    }
    else
    {
      v5 = "SavageUpdaterIsDone - no savage controller instance";
      v6 = (const __CFString **)&kSavageErrorDomain;
    }
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v5, 0x10u, 0, *v6);
    v8 = CFErrorWithDomain;
    if (a2 && CFErrorWithDomain)
    {
      *a2 = SavageSafeRetain(CFErrorWithDomain);
    }
    else if (!CFErrorWithDomain)
    {
      return 1;
    }
    CFRelease(v8);
    return 1;
  }
  return result;
}

uint64_t SavageUpdaterSupported()
{
  return 1;
}

uint64_t encryptFDRData(const char *a1, size_t a2, char *a3, char *a4)
{
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  size_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v8 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v9 = __osLogPearlLibTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v18 = a1;
    v19 = 2048;
    v20 = a2;
    v21 = 2048;
    v22 = a3;
    v23 = 2048;
    v24 = a4;
    _os_log_impl(&dword_2218D1000, v9, OS_LOG_TYPE_DEFAULT, "encryptFDRData %p %zu %p %p\n", buf, 0x2Au);
  }
  v10 = encryptFDRDataInternal(a1, a2, a3, a4, 0);
  if ((_DWORD)v10)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 161);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v15 = __osLogPearlLib;
    else
      v15 = v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = (int)v10;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v25 = 1024;
      v26 = 161;
      _os_log_impl(&dword_2218D1000, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v16 = __osLogPearlLibTrace;
    else
      v16 = v8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v10;
      v12 = v16;
      v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v11 = __osLogPearlLibTrace;
    else
      v11 = v8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      v12 = v11;
      v13 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_2218D1000, v12, v13, "encryptFDRData -> %d\n", buf, 8u);
    }
  }
  return v10;
}

uint64_t encryptFDRDataInternal(const char *a1, size_t a2, char *a3, char *a4, int a5)
{
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  size_t v22;
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  size_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v10 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v11 = __osLogPearlLibTrace;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v25 = a1;
    v26 = 2048;
    v27 = a2;
    v28 = 2048;
    v29 = a3;
    v30 = 2048;
    v31 = a4;
    v32 = 1024;
    v33 = a5;
    _os_log_impl(&dword_2218D1000, v11, OS_LOG_TYPE_DEFAULT, "encryptFDRDataInternal %p %zu %p %p %d\n", buf, 0x30u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 209);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = v10;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v25 = "data";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 209;
LABEL_77:
    v21 = v19;
LABEL_78:
    _os_log_impl(&dword_2218D1000, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_79:
    v13 = 258;
    goto LABEL_16;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 210);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = v10;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v25 = "dataLength > 0";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 210;
    goto LABEL_77;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "encryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 211);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = v10;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v25 = "encryptedDataBuffer";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 211;
    goto LABEL_77;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 212);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = v10;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v25 = "outLength";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 212;
    goto LABEL_77;
  }
  if (a2 >= 0xFFFFFFFFFFFFFFACLL)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encryptedData)), (&minimalOutputBufferLength))) == 0 ", a2 >= 0xFFFFFFFFFFFFFFACLL, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 215);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v10;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v25 = "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encrypted"
          "Data)), (&minimalOutputBufferLength))) == 0 ";
    v26 = 2048;
    v27 = a2 >= 0xFFFFFFFFFFFFFFACLL;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 215;
    v21 = v20;
    goto LABEL_78;
  }
  if (*(_QWORD *)a4 < a2 + 84)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*outLength >= minimalOutputBufferLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 217);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = v10;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v25 = "*outLength >= minimalOutputBufferLength";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 217;
    goto LABEL_77;
  }
  v12 = initialize();
  if ((_DWORD)v12)
  {
    v13 = v12;
    v22 = (int)v12;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 220);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v23 = __osLogPearlLib;
    else
      v23 = v10;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "err == 0 ";
      v26 = 2048;
      v27 = v22;
      v28 = 2080;
      v29 = "";
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v32 = 1024;
      v33 = 220;
LABEL_94:
      _os_log_impl(&dword_2218D1000, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v13 = performCommand(_connect, 9, a5, a1, a2, a3, a4);
    if ((_DWORD)v13)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v13, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 223);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v23 = (__osLogPearlLib ? __osLogPearlLib : v10);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "err == 0 ";
        v26 = 2048;
        v27 = (int)v13;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v32 = 1024;
        v33 = 223;
        goto LABEL_94;
      }
    }
  }
LABEL_16:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v13)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v14 = __osLogPearlLibTrace;
    else
      v14 = v10;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v13;
      v15 = v14;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_33:
      _os_log_impl(&dword_2218D1000, v15, v16, "encryptFDRDataInternal -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v17 = __osLogPearlLibTrace;
    else
      v17 = v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 0;
      v15 = v17;
      v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_33;
    }
  }
  return v13;
}

uint64_t verifyFDRData(const char *a1, size_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  size_t v16;
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  size_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v4 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v5 = __osLogPearlLibTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v19 = a1;
    v20 = 2048;
    v21 = a2;
    _os_log_impl(&dword_2218D1000, v5, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v13 = __osLogPearlLib;
    else
      v13 = v4;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v19 = "data";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v26 = 1024;
    v27 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v13 = __osLogPearlLib;
    else
      v13 = v4;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v19 = "dataLength > 0";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v26 = 1024;
    v27 = 180;
LABEL_45:
    _os_log_impl(&dword_2218D1000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    v6 = 258;
    goto LABEL_12;
  }
  v6 = initialize();
  if ((_DWORD)v6)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v14 = __osLogPearlLib;
    else
      v14 = v4;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "err == 0 ";
      v20 = 2048;
      v21 = (int)v6;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v26 = 1024;
      v27 = 183;
      _os_log_impl(&dword_2218D1000, v14, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v7 = performCommand(_connect, 10, 0, a1, a2, 0, 0);
    if ((_DWORD)v7)
    {
      v15 = v7;
      v16 = (int)v7;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v7, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v17 = __osLogPearlLib;
      else
        v17 = v4;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = "err == 0 ";
        v20 = 2048;
        v21 = v16;
        v22 = 2080;
        v23 = "";
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v26 = 1024;
        v27 = 186;
        _os_log_impl(&dword_2218D1000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v6 = v15;
    }
  }
LABEL_12:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v6)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v8 = __osLogPearlLibTrace;
    else
      v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v6;
      v9 = v8;
      v10 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl(&dword_2218D1000, v9, v10, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v11 = __osLogPearlLibTrace;
    else
      v11 = v4;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = 0;
      v9 = v11;
      v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v6;
}

uint64_t initialize()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B20];
  v1 = IOServiceMatching("ApplePearlSEPDriver");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    v4 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&_connect);
    if ((_DWORD)v4)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v7 = __osLogPearlLib;
      else
        v7 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v9 = "err == 0 ";
        v10 = 2048;
        v11 = (int)v4;
        v12 = 2080;
        v13 = "";
        v14 = 2080;
        v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v16 = 1024;
        v17 = 129;
        _os_log_impl(&dword_2218D1000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v3);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v4 = 3758097084;
    if (__osLogPearlLib)
      v6 = __osLogPearlLib;
    else
      v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v9 = "service";
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v16 = 1024;
      v17 = 126;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

uint64_t performCommand(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v14;
  _WORD *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  _BYTE outputStructCnt[12];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v14 = a5 + 8;
  v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    v16 = v15;
    *v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
    v15[3] = a3;
    if (a5)
      memmove(v15 + 4, a4, a5);
    if (a7)
    {
      *(_QWORD *)outputStructCnt = *a7;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(_QWORD *)outputStructCnt;
    }
    else
    {
      *(_QWORD *)outputStructCnt = 0;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(_QWORD *)&outputStructCnt[4] = "cmd";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v27 = 1024;
      v28 = 99;
      _os_log_impl(&dword_2218D1000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t decryptFDRData(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 241);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "data";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 241;
    goto LABEL_46;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 242);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "dataLength > 0";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 242;
    goto LABEL_46;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "decryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 243);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "decryptedDataBuffer";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 243;
    goto LABEL_46;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 244);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "outLength";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 244;
    goto LABEL_46;
  }
  if (*a4 < a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(*outLength > 0) && (*outLength >= dataLength)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 245);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "(*outLength > 0) && (*outLength >= dataLength)";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 245;
LABEL_46:
    _os_log_impl(&dword_2218D1000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_47:
    v8 = 258;
    goto LABEL_8;
  }
  v8 = initialize();
  if ((_DWORD)v8)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 248);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v12 = __osLogPearlLib;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = (int)v8;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v24 = 1024;
      v25 = 248;
      _os_log_impl(&dword_2218D1000, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v9 = performCommand(_connect, 30, 0, a1, a2, a3, a4);
    if ((_DWORD)v9)
    {
      v13 = v9;
      v14 = (int)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 251);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v15 = __osLogPearlLib;
      else
        v15 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "err == 0 ";
        v18 = 2048;
        v19 = v14;
        v20 = 2080;
        v21 = "";
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v24 = 1024;
        v25 = 251;
        _os_log_impl(&dword_2218D1000, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v8 = v13;
    }
  }
LABEL_8:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v8;
}

uint64_t overridePCECalibration(const void *a1, size_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    v4 = initialize();
    if ((_DWORD)v4)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 269);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v8 = __osLogPearlLib;
      else
        v8 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = "err == 0 ";
        v14 = 2048;
        v15 = (int)v4;
        v16 = 2080;
        v17 = "";
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v20 = 1024;
        v21 = 269;
        _os_log_impl(&dword_2218D1000, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      v5 = performCommand(_connect, 34, 0, a1, a2, 0, 0);
      if ((_DWORD)v5)
      {
        v9 = v5;
        v10 = (int)v5;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 272);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v11 = __osLogPearlLib;
        else
          v11 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v13 = "err == 0 ";
          v14 = 2048;
          v15 = v10;
          v16 = 2080;
          v17 = "";
          v18 = 2080;
          v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v20 = 1024;
          v21 = 272;
          _os_log_impl(&dword_2218D1000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v4 = v9;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "calibration && (calibrationSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 266);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v7 = __osLogPearlLib;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v13 = "calibration && (calibrationSize > 0)";
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v20 = 1024;
      v21 = 266;
      _os_log_impl(&dword_2218D1000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v4 = 258;
  }
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v4;
}

uint64_t decompressReferenceFrames(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  FILE *v13;
  NSObject *v14;
  int v15;
  id v16;
  FILE *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  int v24;
  id v25;
  int v26;
  NSObject *v27;
  id v28;
  char v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  char *v36;
  int *v37;
  int v38;
  NSObject *v39;
  int v40;
  unsigned int v41;
  int v42;
  uint64_t v43;
  id v44;
  id v45;
  unsigned int v46;
  unsigned int *v47;
  unsigned int *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  char v58;
  FILE *v59;
  double v60;
  unsigned int v61;
  int v62;
  NSObject *v63;
  unsigned int v64;
  int v65;
  double v66;
  id v67;
  NSObject *v68;
  uint64_t v69;
  char v70;
  FILE *v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  io_connect_t v89;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  NSObject *v99;
  NSObject *v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  unsigned int *v111;
  uint64_t v112;
  id v113;
  unsigned int *v114;
  uint64_t v115;
  unsigned int *v116;
  id v117;
  int *v118;
  id v119;
  id v120;
  id v121;
  int v122;
  _DWORD v123[2];
  size_t v124;
  uint64_t v125;
  void *v126;
  uint8_t buf[4];
  _BYTE v128[10];
  uint64_t v129;
  _BYTE v130[26];
  char __str[16];
  __int128 v132;
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v124 = 0;
  *(_OWORD *)__str = 0u;
  v132 = 0u;
  if (!a1 || !a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v100 = __osLogPearlLib;
    else
      v100 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v128 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v128[8] = 2048;
    v129 = 0;
    *(_WORD *)v130 = 2080;
    *(_QWORD *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v100 = __osLogPearlLib;
    else
      v100 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v128 = "systemRootPath";
    *(_WORD *)&v128[8] = 2048;
    v129 = 0;
    *(_WORD *)v130 = 2080;
    *(_QWORD *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 310;
LABEL_190:
    _os_log_impl(&dword_2218D1000, v100, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    v12 = 258;
LABEL_263:
    v36 = logString + 1288;
    goto LABEL_124;
  }
  v6 = initialize();
  if ((_DWORD)v6)
  {
    v12 = v6;
    v101 = (int)v6;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v102 = __osLogPearlLib;
    else
      v102 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      v129 = v101;
      *(_WORD *)v130 = 2080;
      *(_QWORD *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 313;
      _os_log_impl(&dword_2218D1000, v102, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v103 = __osLogPearlLib;
    else
      v103 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v128 = "fdrInput";
    *(_WORD *)&v128[8] = 2048;
    v129 = 0;
    *(_WORD *)v130 = 2080;
    *(_QWORD *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 317;
    goto LABEL_221;
  }
  v8 = v7;
  *(_DWORD *)v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  v9 = performCommand(_connect, 36, 0, v8, a2 + 9, 0, 0);
  if ((_DWORD)v9)
  {
    v12 = v9;
    v104 = (int)v9;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v105 = __osLogPearlLib;
    else
      v105 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      v129 = v104;
      *(_WORD *)v130 = 2080;
      *(_QWORD *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 327;
      _os_log_impl(&dword_2218D1000, v105, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  v124 = 52;
  v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v103 = __osLogPearlLib;
    else
      v103 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v128 = "dataInfo";
    *(_WORD *)&v128[8] = 2048;
    v129 = 0;
    *(_WORD *)v130 = 2080;
    *(_QWORD *)&v130[2] = "";
    *(_WORD *)&v130[10] = 2080;
    *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v130[20] = 1024;
    *(_DWORD *)&v130[22] = 334;
LABEL_221:
    _os_log_impl(&dword_2218D1000, v103, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    v12 = 260;
    goto LABEL_263;
  }
  v11 = v10;
  v12 = performCommand(_connect, 45, 0, 0, 0, v10, &v124);
  v13 = (FILE *)*MEMORY[0x24BDAC8D8];
  if ((_DWORD)v12)
  {
    fprintf(v13, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v106 = __osLogPearlLib;
    else
      v106 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      v129 = (int)v12;
      *(_WORD *)v130 = 2080;
      *(_QWORD *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 338;
      _os_log_impl(&dword_2218D1000, v106, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(v13, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v14 = __osLogPearlLib;
  else
    v14 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v128 = v15;
    _os_log_impl(&dword_2218D1000, v14, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v107 = __osLogPearlLib;
    else
      v107 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v128 = "dataInfo->setCount > 0";
      *(_WORD *)&v128[8] = 2048;
      v129 = 0;
      *(_WORD *)v130 = 2080;
      *(_QWORD *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 342;
      _os_log_impl(&dword_2218D1000, v107, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 259;
    goto LABEL_262;
  }
  v16 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s"), a3, "/System/Library/Pearl/ReferenceFrames");
  v17 = (FILE *)*MEMORY[0x24BDAC8D8];
  if (!v16)
  {
    fprintf(v17, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v108 = __osLogPearlLib;
    else
      v108 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v128 = "path";
      *(_WORD *)&v128[8] = 2048;
      v129 = 0;
      *(_WORD *)v130 = 2080;
      *(_QWORD *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 345;
      _os_log_impl(&dword_2218D1000, v108, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 261;
    goto LABEL_262;
  }
  v18 = objc_retainAutorelease(v16);
  fprintf(v17, "ReferenceFramesPath: %s\n", (const char *)objc_msgSend(v18, "UTF8String"));
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v19 = __osLogPearlLib;
  else
    v19 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v18);
    v21 = v19;
    v22 = objc_msgSend(v20, "UTF8String");
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v128 = v22;
    _os_log_impl(&dword_2218D1000, v21, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);

  }
  v23 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v24 = objc_msgSend(v23, "fileExistsAtPath:", v18);

  if (v24)
  {
    v25 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v26 = objc_msgSend(v25, "removeItemAtPath:error:", v18, 0);

    if ((v26 & 1) == 0)
    {
      v12 = v26 ^ 1u;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v109 = __osLogPearlLib;
      else
        v109 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v128 = "err == 0 ";
        *(_WORD *)&v128[8] = 2048;
        v129 = v12;
        *(_WORD *)v130 = 2080;
        *(_QWORD *)&v130[2] = "";
        *(_WORD *)&v130[10] = 2080;
        *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v130[20] = 1024;
        *(_DWORD *)&v130[22] = 353;
        _os_log_impl(&dword_2218D1000, v109, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v27 = __osLogPearlLib;
    else
      v27 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v128 = v18;
      _os_log_impl(&dword_2218D1000, v27, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  v28 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v29 = objc_msgSend(v28, "fileExistsAtPath:", v18);

  if ((v29 & 1) != 0)
    goto LABEL_37;
  v125 = *MEMORY[0x24BDD0CC8];
  v126 = &unk_24E75B8B0;
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
  v31 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = objc_msgSend(v31, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, v30, 0) ^ 1;

  if ((v12 & 1) != 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v110 = __osLogPearlLib;
    else
      v110 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v128 = "err == 0 ";
      *(_WORD *)&v128[8] = 2048;
      v129 = v12;
      *(_WORD *)v130 = 2080;
      *(_QWORD *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 362;
      _os_log_impl(&dword_2218D1000, v110, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    v32 = 0;
    v120 = 0;
    v121 = 0;
    v115 = 0;
    v33 = 0;
    v34 = 0;
    v117 = 0;
    v35 = 0;
    v36 = &logString[1288];
    v111 = v11;
    while (1)
    {
      v37 = &v11[3 * v32];
      v38 = v37[1];
      v116 = (unsigned int *)(++v37 + 1);
      v118 = v37;
      v114 = (unsigned int *)(v37 + 2);
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v32, v38, v37[1], v37[2]);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v122 = v32;
      if (__osLogPearlLib)
        v39 = __osLogPearlLib;
      else
        v39 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *v118;
        v41 = *v116;
        v42 = *v114;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v128 = v32;
        *(_WORD *)&v128[4] = 1024;
        *(_DWORD *)&v128[6] = v40;
        LOWORD(v129) = 1024;
        *(_DWORD *)((char *)&v129 + 2) = v41;
        HIWORD(v129) = 1024;
        *(_DWORD *)v130 = v42;
        _os_log_impl(&dword_2218D1000, v39, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      v43 = *v118;
      if (v43 <= 3)
        v115 = (uint64_t)*(&off_24E75A9C8 + v43);
      v44 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");

      if (!v44)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        v94 = v33;
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v95 = __osLogPearlLib;
        else
          v95 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "setDictionary";
          *(_WORD *)&v128[8] = 2048;
          v129 = 0;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 383;
          _os_log_impl(&dword_2218D1000, v95, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v11 = v111;
        v78 = v120;
        v33 = v94;
        v77 = v34;
        goto LABEL_79;
      }
      v112 = v32;
      v117 = v44;
      objc_msgSend(v44, "setObject:forKeyedSubscript:", &unk_24E75B8C8, CFSTR("FormatDR"));
      v45 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/reference-%@.plist"), v18, v115);

      if (!v45)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        v78 = v120;
        v96 = v33;
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v97 = __osLogPearlLib;
        else
          v97 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "dictFileName";
          *(_WORD *)&v128[8] = 2048;
          v129 = 0;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 388;
          _os_log_impl(&dword_2218D1000, v97, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v77 = v44;
        v11 = v111;
        v33 = v96;
        goto LABEL_79;
      }
      v113 = v45;
      if (*v116)
        break;
LABEL_68:
      v70 = objc_msgSend(v117, "writeToFile:atomically:", v113, 0);
      v71 = (FILE *)*MEMORY[0x24BDAC8D8];
      if ((v70 & 1) == 0)
      {
        fprintf(v71, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        v98 = v33;
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        v78 = v120;
        if (__osLogPearlLib)
          v99 = __osLogPearlLib;
        else
          v99 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "err == 0 ";
          *(_WORD *)&v128[8] = 2048;
          v129 = 1;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 438;
          _os_log_impl(&dword_2218D1000, v99, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v12 = 1;
        v11 = v111;
        v33 = v98;
        v77 = v113;
        goto LABEL_79;
      }
      v34 = objc_retainAutorelease(v113);
      fprintf(v71, "Reference set dictionary written to %s\n", (const char *)objc_msgSend(v34, "UTF8String"));
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v11 = v111;
      if (__osLogPearlLib)
        v72 = __osLogPearlLib;
      else
        v72 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = objc_retainAutorelease(v34);
        v74 = v72;
        v75 = objc_msgSend(v73, "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v128 = v75;
        _os_log_impl(&dword_2218D1000, v74, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);

      }
      v32 = v112 + 1;
      if (v112 + 1 >= (unint64_t)*v111)
      {

        v12 = 0;
        v77 = v34;
        v78 = v120;
LABEL_79:

        v76 = v121;
        goto LABEL_80;
      }
    }
    v46 = 0;
    while (1)
    {
      v123[0] = v122;
      v123[1] = v46;
      v124 = *v114 + 524;
      v47 = (unsigned int *)calloc(v124, 1uLL);
      if (!v47)
        break;
      v48 = v47;
      v49 = performCommand(*((_DWORD *)v36 + 712), 46, 0, v123, 8uLL, v47, &v124);
      if ((_DWORD)v49)
      {
        v12 = v49;
        v82 = v35;
        v83 = (int)v49;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v49, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        v119 = v33;
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v84 = __osLogPearlLib;
        else
          v84 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "err == 0 ";
          *(_WORD *)&v128[8] = 2048;
          v129 = v83;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 403;
          _os_log_impl(&dword_2218D1000, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v48) - 32) <= 0xFFFFFFE0)
      {
        v82 = v35;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        v119 = v33;
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v85 = __osLogPearlLib;
        else
          v85 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v128[8] = 2048;
          v129 = 0;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 406;
          _os_log_impl(&dword_2218D1000, v85, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
LABEL_104:
        v86 = v111;
        v51 = v82;
LABEL_121:
        v54 = v121;
LABEL_122:
        free(v86);
        free(v48);

        v79 = v120;
        goto LABEL_123;
      }
      v50 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", __str);

      if (!v50)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        v119 = v33;
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        v86 = v111;
        if (__osLogPearlLib)
          v87 = __osLogPearlLib;
        else
          v87 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "tempString";
          *(_WORD *)&v128[8] = 2048;
          v129 = 0;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 409;
          _os_log_impl(&dword_2218D1000, v87, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v51 = 0;
        v12 = 261;
        v36 = logString + 1288;
        goto LABEL_121;
      }
      v51 = v50;
      v52 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("reference-%@__T_%@.bin"), v115, v50);

      if (!v52)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        v86 = v111;
        if (__osLogPearlLib)
          v88 = __osLogPearlLib;
        else
          v88 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "refFileName";
          *(_WORD *)&v128[8] = 2048;
          v129 = 0;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 412;
          _os_log_impl(&dword_2218D1000, v88, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v119 = 0;
        v12 = 261;
        goto LABEL_121;
      }
      v53 = v52;
      v54 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v18, v52);

      v119 = v53;
      if (!v54)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v91 = __osLogPearlLib;
        else
          v91 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "refPath";
          *(_WORD *)&v128[8] = 2048;
          v129 = 0;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 415;
          _os_log_impl(&dword_2218D1000, v91, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v54 = 0;
        v12 = 261;
        v86 = v111;
        goto LABEL_122;
      }
      v55 = v18;
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v53, v51);
      v56 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v48 + 3, v48[2], 0);

      if (!v56)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        v18 = v55;
        if (__osLogPearlLib)
          v92 = __osLogPearlLib;
        else
          v92 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "refFrameData";
          *(_WORD *)&v128[8] = 2048;
          v129 = 0;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 423;
          _os_log_impl(&dword_2218D1000, v92, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v120 = 0;
        v12 = 261;
        v86 = v111;
        goto LABEL_122;
      }
      v57 = v51;
      v120 = v56;
      v58 = objc_msgSend(v56, "writeToFile:atomically:", v54, 0);
      v59 = (FILE *)*MEMORY[0x24BDAC8D8];
      if ((v58 & 1) == 0)
      {
        fprintf(v59, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        v18 = v55;
        if (__osLogPearlLib)
          v93 = __osLogPearlLib;
        else
          v93 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v128 = "err == 0 ";
          *(_WORD *)&v128[8] = 2048;
          v12 = 1;
          v129 = 1;
          *(_WORD *)v130 = 2080;
          *(_QWORD *)&v130[2] = "";
          *(_WORD *)&v130[10] = 2080;
          *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v130[20] = 1024;
          *(_DWORD *)&v130[22] = 426;
          _os_log_impl(&dword_2218D1000, v93, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          v12 = 1;
        }
        v86 = v111;
        goto LABEL_122;
      }
      v60 = *(double *)v48;
      v61 = v48[2];
      v62 = *v118;
      v121 = objc_retainAutorelease(v54);
      fprintf(v59, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v122, v46, v61, v62, v60, (const char *)objc_msgSend(v121, "UTF8String"));
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v63 = __osLogPearlLib;
      else
        v63 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = v48[2];
        v65 = *v118;
        v66 = *(double *)v48;
        v67 = objc_retainAutorelease(v121);
        v68 = v63;
        v69 = objc_msgSend(v67, "UTF8String");
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v128 = v122;
        *(_WORD *)&v128[4] = 1024;
        *(_DWORD *)&v128[6] = v46;
        LOWORD(v129) = 1024;
        *(_DWORD *)((char *)&v129 + 2) = v64;
        HIWORD(v129) = 1024;
        *(_DWORD *)v130 = v65;
        *(_WORD *)&v130[4] = 2048;
        *(double *)&v130[6] = v66;
        v36 = logString + 1288;
        *(_WORD *)&v130[14] = 2080;
        *(_QWORD *)&v130[16] = v69;
        _os_log_impl(&dword_2218D1000, v68, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);

      }
      free(v48);
      ++v46;
      v18 = v55;
      v35 = v57;
      v33 = v119;
      if (v46 >= *v116)
        goto LABEL_68;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    v80 = v33;
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v81 = __osLogPearlLib;
    else
      v81 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v128 = "refFrame";
      *(_WORD *)&v128[8] = 2048;
      v129 = 0;
      *(_WORD *)v130 = 2080;
      *(_QWORD *)&v130[2] = "";
      *(_WORD *)&v130[10] = 2080;
      *(_QWORD *)&v130[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v130[20] = 1024;
      *(_DWORD *)&v130[22] = 400;
      _os_log_impl(&dword_2218D1000, v81, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v111);

    v12 = 260;
  }
  else
  {
    v76 = 0;
    v33 = 0;
    v35 = 0;
    v78 = 0;
    v12 = 0;
    v36 = logString + 1288;
LABEL_80:
    free(v11);

    v79 = v78;
LABEL_123:

  }
LABEL_124:
  v89 = *((_DWORD *)v36 + 712);
  if (v89)
  {
    IOServiceClose(v89);
    *((_DWORD *)v36 + 712) = 0;
  }
  return v12;
}

uint64_t getSavageProvisioningData(uint64_t a1, __int128 *a2, uint64_t a3, _OWORD *a4, uint64_t a5, const void *a6, size_t a7, uint64_t a8, _QWORD *a9, _OWORD *a10, _QWORD *a11, uint64_t a12, _QWORD *a13)
{
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  FILE *v28;
  NSObject *v29;
  size_t v30;
  char *v31;
  char *v32;
  id v33;
  uint64_t v34;
  FILE *v35;
  NSObject *v36;
  char *v37;
  _DWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char *v42;
  uint64_t v43;
  NSObject *v44;
  __int128 v45;
  NSObject *v46;
  io_connect_t v47;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  const void *v63;
  uint64_t v65;
  _QWORD v66[3];
  _QWORD v67[3];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[2];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v80 = 0u;
  memset(v81, 0, 27);
  v78 = 0u;
  v79 = 0u;
  v65 = 75;
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savagePubKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 480);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v50 = __osLogPearlLib;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v69 = "savagePubKey";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 480;
    goto LABEL_125;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageUID", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 482);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v50 = __osLogPearlLib;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v69 = "savageUID";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 482;
    goto LABEL_125;
  }
  if (!a6 || !a7)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageFWCert && savageFWCertLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 484);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v50 = __osLogPearlLib;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v69 = "savageFWCert && savageFWCertLength";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 484;
    goto LABEL_125;
  }
  if (!a8)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "hostPubKeyBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 485);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v50 = __osLogPearlLib;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v69 = "hostPubKeyBuffer";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 485;
    goto LABEL_125;
  }
  if (!a9 || *a9 <= 0x37uLL)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 486);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v49 = __osLogPearlLib;
    else
      v49 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    *(_DWORD *)buf = 136316162;
    v69 = "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 486;
    goto LABEL_81;
  }
  if (!a10)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ngidDEBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 487);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v50 = __osLogPearlLib;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v69 = "ngidDEBuffer";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 487;
    goto LABEL_125;
  }
  if (!a11 || *a11 <= 0xFuLL)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outNGIDDELength && (*outNGIDDELength >= 16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 488);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v49 = __osLogPearlLib;
    else
      v49 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    *(_DWORD *)buf = 136316162;
    v69 = "outNGIDDELength && (*outNGIDDELength >= 16)";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 488;
    goto LABEL_81;
  }
  if (!a12)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "kcvBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 489);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v50 = __osLogPearlLib;
    else
      v50 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v69 = "kcvBuffer";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 489;
LABEL_125:
    _os_log_impl(&dword_2218D1000, v50, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_126:
    v34 = 258;
    goto LABEL_57;
  }
  if (!a13 || *a13 <= 2uLL)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outKCVLength && (*outKCVLength >= 3)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 490);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v49 = __osLogPearlLib;
    else
      v49 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    *(_DWORD *)buf = 136316162;
    v69 = "outKCVLength && (*outKCVLength >= 3)";
    v70 = 2048;
    v71 = 0;
    v72 = 2080;
    v73 = "";
    v74 = 2080;
    v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v76 = 1024;
    v77 = 490;
LABEL_81:
    _os_log_impl(&dword_2218D1000, v49, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_82:
    v34 = 265;
    goto LABEL_57;
  }
  v18 = initialize();
  if ((_DWORD)v18)
  {
    v34 = v18;
    v51 = (int)v18;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v18, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 494);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v52 = __osLogPearlLib;
    else
      v52 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v69 = "err == 0 ";
      v70 = 2048;
      v71 = v51;
      v72 = 2080;
      v73 = "";
      v74 = 2080;
      v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v76 = 1024;
      v77 = 494;
      _os_log_impl(&dword_2218D1000, v52, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_57;
  }
  v63 = a6;
  v19 = (void *)MEMORY[0x24BDBCED8];
  v66[0] = CFSTR("GetCombined");
  v66[1] = CFSTR("StripImg4");
  v67[0] = MEMORY[0x24BDBD1C8];
  v67[1] = MEMORY[0x24BDBD1C0];
  v66[2] = CFSTR("VerifyData");
  v67[2] = MEMORY[0x24BDBD1C0];
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
  v21 = (id)objc_msgSend(v19, "dictionaryWithDictionary:", v20);

  if (a1)
  {
    v22 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/%@"), a1, CFSTR("/System/Library/Caches/com.apple.factorydata"));
    if (v22)
    {
      v23 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v22);
      if (v23)
      {
        v24 = v23;
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("DataDirectory"));

        goto LABEL_19;
      }
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fileURL", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 511);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v42 = logString + 1288;
      if (__osLogPearlLib)
        v61 = __osLogPearlLib;
      else
        v61 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
LABEL_203:

        v34 = 261;
        goto LABEL_57;
      }
      *(_DWORD *)buf = 136316162;
      v69 = "fileURL";
      v70 = 2048;
      v71 = 0;
      v72 = 2080;
      v73 = "";
      v74 = 2080;
      v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v76 = 1024;
      v77 = 511;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pathString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 509);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v42 = logString + 1288;
      if (__osLogPearlLib)
        v61 = __osLogPearlLib;
      else
        v61 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        goto LABEL_203;
      *(_DWORD *)buf = 136316162;
      v69 = "pathString";
      v70 = 2048;
      v71 = 0;
      v72 = 2080;
      v73 = "";
      v74 = 2080;
      v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v76 = 1024;
      v77 = 509;
    }
    _os_log_impl(&dword_2218D1000, v61, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_203;
  }
LABEL_19:
  v25 = (void *)AMFDRSealingMapCopyLocalDataForClass();
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s: Loading PSPC from FDR.\n", "getSavageProvisioningData");
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v26 = MEMORY[0x24BDACB70];
  if (__osLogPearlLib)
    v27 = __osLogPearlLib;
  else
    v27 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v69 = "getSavageProvisioningData";
    _os_log_impl(&dword_2218D1000, v27, OS_LOG_TYPE_DEFAULT, "%s: Loading PSPC from FDR.\n", buf, 0xCu);
  }
  v28 = (FILE *)*MEMORY[0x24BDAC8D8];
  if (v25)
  {
    fprintf(v28, "%s: PSPC data found.\n", "getSavageProvisioningData");
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v29 = __osLogPearlLib;
    else
      v29 = v26;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "getSavageProvisioningData";
      _os_log_impl(&dword_2218D1000, v29, OS_LOG_TYPE_DEFAULT, "%s: PSPC data found.\n", buf, 0xCu);
    }
    v30 = objc_msgSend(v25, "length") + 9;
    v31 = (char *)calloc(v30, 1uLL);
    if (v31)
    {
      v32 = v31;
      v62 = v21;
      bzero(v31, v30);
      *(_DWORD *)v32 = 1048579;
      v32[4] = 0;
      *(_DWORD *)(v32 + 5) = objc_msgSend(v25, "length");
      v33 = objc_retainAutorelease(v25);
      memcpy(v32 + 9, (const void *)objc_msgSend(v33, "bytes"), *(unsigned int *)(v32 + 5));
      v34 = performCommand(_connect, 36, 0, v32, v30, 0, 0);
      v35 = (FILE *)*MEMORY[0x24BDAC8D8];
      if ((_DWORD)v34)
      {
        fprintf(v35, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v34, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 535);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        v42 = logString + 1288;
        if (__osLogPearlLib)
          v55 = __osLogPearlLib;
        else
          v55 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v69 = "err == 0 ";
          v70 = 2048;
          v71 = (int)v34;
          v72 = 2080;
          v73 = "";
          v74 = 2080;
          v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v76 = 1024;
          v77 = 535;
          _os_log_impl(&dword_2218D1000, v55, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_56;
      }
      fprintf(v35, "%s: PSPC data loaded to SEP.\n", "getSavageProvisioningData");
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v36 = __osLogPearlLib;
      else
        v36 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v69 = "getSavageProvisioningData";
        _os_log_impl(&dword_2218D1000, v36, OS_LOG_TYPE_DEFAULT, "%s: PSPC data loaded to SEP.\n", buf, 0xCu);
      }
      if (a7 >= 0xFFFFFFFFFFFFFFB4)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a7 >= 0xFFFFFFFFFFFFFFB4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 541);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        v42 = logString + 1288;
        if (__osLogPearlLib)
          v56 = __osLogPearlLib;
        else
          v56 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v69 = "err == 0 ";
          v70 = 2048;
          v71 = a7 >= 0xFFFFFFFFFFFFFFB4;
          v72 = 2080;
          v73 = "";
          v74 = 2080;
          v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v76 = 1024;
          v77 = 541;
          _os_log_impl(&dword_2218D1000, v56, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v34 = 1;
      }
      else
      {
        v37 = (char *)calloc(a7 + 76, 1uLL);
        if (!v37)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 544);
          if (OSLogInit_onceToken != -1)
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          v42 = logString + 1288;
          if (__osLogPearlLib)
            v57 = __osLogPearlLib;
          else
            v57 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v69 = "inData";
            v70 = 2048;
            v71 = 0;
            v72 = 2080;
            v73 = "";
            v74 = 2080;
            v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v76 = 1024;
            v77 = 544;
            _os_log_impl(&dword_2218D1000, v57, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v34 = 260;
          goto LABEL_56;
        }
        v38 = v37;
        v39 = *a2;
        v40 = a2[1];
        v41 = a2[2];
        *((_QWORD *)v37 + 6) = *((_QWORD *)a2 + 6);
        *((_OWORD *)v37 + 1) = v40;
        *((_OWORD *)v37 + 2) = v41;
        *(_OWORD *)v37 = v39;
        *(_OWORD *)(v37 + 56) = *a4;
        memcpy(v37 + 76, v63, a7);
        v38[18] = a7;
        v42 = &logString[1288];
        v43 = performCommand(_connect, 2, 0, v38, a7 + 76, &v78, &v65);
        if ((_DWORD)v43)
        {
          v34 = v43;
          v58 = (int)v43;
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v43, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 556);
          if (OSLogInit_onceToken != -1)
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          if (__osLogPearlLib)
            v59 = __osLogPearlLib;
          else
            v59 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v69 = "err == 0 ";
            v70 = 2048;
            v71 = v58;
            v72 = 2080;
            v73 = "";
            v74 = 2080;
            v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v76 = 1024;
            v77 = 556;
            _os_log_impl(&dword_2218D1000, v59, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        else
        {
          v44 = MEMORY[0x24BDACB70];
          if (v65 == 75)
          {
            *a9 = 56;
            v45 = v79;
            *(_OWORD *)a8 = v78;
            *(_OWORD *)(a8 + 16) = v45;
            *(_OWORD *)(a8 + 32) = v80;
            *(_QWORD *)(a8 + 48) = *(_QWORD *)&v81[0];
            *a11 = 16;
            *a10 = *(_OWORD *)((char *)v81 + 8);
            *a13 = 3;
            *(_WORD *)a12 = WORD4(v81[1]);
            *(_BYTE *)(a12 + 2) = BYTE10(v81[1]);
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s: Successfully got provisioning data.\n", "getSavageProvisioningData");
            if (OSLogInit_onceToken != -1)
              dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
            if (__osLogPearlLib)
              v46 = __osLogPearlLib;
            else
              v46 = v44;
            v34 = 0;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v69 = "getSavageProvisioningData";
              _os_log_impl(&dword_2218D1000, v46, OS_LOG_TYPE_DEFAULT, "%s: Successfully got provisioning data.\n", buf, 0xCu);
              v34 = 0;
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(outData)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 557);
            if (OSLogInit_onceToken != -1)
              dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
            if (__osLogPearlLib)
              v60 = __osLogPearlLib;
            else
              v60 = v44;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v69 = "replySize == sizeof(outData)";
              v70 = 2048;
              v71 = 0;
              v72 = 2080;
              v73 = "";
              v74 = 2080;
              v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
              v76 = 1024;
              v77 = 557;
              _os_log_impl(&dword_2218D1000, v60, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }
            v34 = 261;
          }
        }
        free(v38);
      }
      v21 = v62;
LABEL_56:
      free(v32);

      goto LABEL_57;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 525);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v54 = __osLogPearlLib;
    else
      v54 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v69 = "fdrInput";
      v70 = 2048;
      v71 = 0;
      v72 = 2080;
      v73 = "";
      v74 = 2080;
      v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v76 = 1024;
      v77 = 525;
      _os_log_impl(&dword_2218D1000, v54, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    v34 = 260;
  }
  else
  {
    fprintf(v28, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pspcData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 519);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v42 = logString + 1288;
    if (__osLogPearlLib)
      v53 = __osLogPearlLib;
    else
      v53 = v26;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v69 = "pspcData";
      v70 = 2048;
      v71 = 0;
      v72 = 2080;
      v73 = "";
      v74 = 2080;
      v75 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v76 = 1024;
      v77 = 519;
      _os_log_impl(&dword_2218D1000, v53, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    v34 = 259;
  }
LABEL_57:
  v47 = *((_DWORD *)v42 + 712);
  if (v47)
  {
    IOServiceClose(v47);
    *((_DWORD *)v42 + 712) = 0;
  }
  return v34;
}

uint64_t checkSavageProvisioning(_DWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v2 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v3 = __osLogPearlLibTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v3, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning\n", buf, 2u);
  }
  v16 = 0;
  v15 = 1;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "provisioningStatus", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 598);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = v2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "provisioningStatus";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v25 = 1024;
      v26 = 598;
      _os_log_impl(&dword_2218D1000, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v7 = 258;
    goto LABEL_53;
  }
  v4 = initialize();
  if ((_DWORD)v4)
  {
    v7 = v4;
    v10 = (int)v4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 601);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = v2;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v18 = "err == 0 ";
    v19 = 2048;
    v20 = v10;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 601;
LABEL_44:
    _os_log_impl(&dword_2218D1000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  v5 = performCommand(_connect, 11, 0, 0, 0, &v16, &v15);
  if ((_DWORD)v5)
  {
    v7 = v5;
    v12 = (int)v5;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 604);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = v2;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v18 = "err == 0 ";
    v19 = 2048;
    v20 = v12;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 604;
    goto LABEL_44;
  }
  if (v15 == 1)
  {
    *a1 = v16;
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = v2;
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning -> %d\n", buf, 8u);
      v7 = 0;
    }
    goto LABEL_19;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(status)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 605);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v13 = __osLogPearlLib;
  else
    v13 = v2;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v18 = "replySize == sizeof(status)";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 605;
    _os_log_impl(&dword_2218D1000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v7 = 261;
LABEL_53:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v14 = __osLogPearlLibTrace;
  else
    v14 = v2;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v7;
    _os_log_impl(&dword_2218D1000, v14, OS_LOG_TYPE_ERROR, "checkSavageProvisioning -> %d\n", buf, 8u);
  }
LABEL_19:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t getPearlSelfTestResult(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v2 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v3 = __osLogPearlLibTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v3, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult\n", buf, 2u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outResult", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 626);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = v2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "outResult";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v25 = 1024;
      v26 = 626;
      _os_log_impl(&dword_2218D1000, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v7 = 258;
    goto LABEL_53;
  }
  v4 = initialize();
  if ((_DWORD)v4)
  {
    v7 = v4;
    v10 = (int)v4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 629);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = v2;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v18 = "err == 0 ";
    v19 = 2048;
    v20 = v10;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 629;
LABEL_44:
    _os_log_impl(&dword_2218D1000, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  v15 = 8;
  v16 = 0;
  v5 = performCommand(_connect, 58, 0, 0, 0, &v16, &v15);
  if ((_DWORD)v5)
  {
    v7 = v5;
    v12 = (int)v5;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 635);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = v2;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v18 = "err == 0 ";
    v19 = 2048;
    v20 = v12;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 635;
    goto LABEL_44;
  }
  if (v15 == 8)
  {
    *a1 = v16;
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = v2;
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult -> %d\n", buf, 8u);
      v7 = 0;
    }
    goto LABEL_19;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "size == sizeof(response)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 636);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v13 = __osLogPearlLib;
  else
    v13 = v2;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v18 = "size == sizeof(response)";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 636;
    _os_log_impl(&dword_2218D1000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v7 = 263;
LABEL_53:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v14 = __osLogPearlLibTrace;
  else
    v14 = v2;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v7;
    _os_log_impl(&dword_2218D1000, v14, OS_LOG_TYPE_ERROR, "getPearlSelfTestResult -> %d\n", buf, 8u);
  }
LABEL_19:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t simulateSelfTestFailure(int a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[2];
  int v14;
  int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v2 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v3 = __osLogPearlLibTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v3, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure\n", buf, 2u);
  }
  v4 = initialize();
  if ((_DWORD)v4)
  {
    v7 = v4;
    v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 658);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = v2;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v9;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 658;
    goto LABEL_34;
  }
  v13[0] = -1;
  v13[1] = -1;
  v14 = -1;
  v15 = a1;
  v5 = performCommand(_connect, 44, 0, v13, 0x18uLL, 0, 0);
  if (!(_DWORD)v5)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = v2;
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure -> %d\n", buf, 8u);
      v7 = 0;
    }
    goto LABEL_17;
  }
  v7 = v5;
  v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 664);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v10 = __osLogPearlLib;
  else
    v10 = v2;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v11;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 664;
LABEL_34:
    _os_log_impl(&dword_2218D1000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = v2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v7;
    _os_log_impl(&dword_2218D1000, v12, OS_LOG_TYPE_ERROR, "simulateSelfTestFailure -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t checkSecureStreaming()
{
  NSObject *v0;
  NSObject *v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v0 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v1 = __osLogPearlLibTrace;
  else
    v1 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v1, OS_LOG_TYPE_DEFAULT, "checkSecureStreaming\n", buf, 2u);
  }
  v2 = checkSecureStreamingAndVerifySignatures(0);
  if ((_DWORD)v2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v2, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 684);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v7 = __osLogPearlLib;
    else
      v7 = v0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = "err == 0 ";
      v11 = 2048;
      v12 = (int)v2;
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v17 = 1024;
      v18 = 684;
      _os_log_impl(&dword_2218D1000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v8 = __osLogPearlLibTrace;
    else
      v8 = v0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v2;
      v4 = v8;
      v5 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v3 = __osLogPearlLibTrace;
    else
      v3 = v0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = 0;
      v4 = v3;
      v5 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_2218D1000, v4, v5, "checkSecureStreaming -> %d\n", buf, 8u);
    }
  }
  return v2;
}

uint64_t checkSecureStreamingAndVerifySignatures(int a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v2 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v3 = __osLogPearlLibTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = a1;
    _os_log_impl(&dword_2218D1000, v3, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures (%u)\n", buf, 8u);
  }
  v4 = initialize();
  if ((_DWORD)v4)
  {
    v7 = v4;
    v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 703);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = v2;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v9;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 703;
    goto LABEL_34;
  }
  v5 = performCommand(_connect, 59, a1, 0, 0, 0, 0);
  if (!(_DWORD)v5)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = v2;
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
      v7 = 0;
    }
    goto LABEL_17;
  }
  v7 = v5;
  v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 706);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v10 = __osLogPearlLib;
  else
    v10 = v2;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v11;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 706;
LABEL_34:
    _os_log_impl(&dword_2218D1000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = v2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_2218D1000, v12, OS_LOG_TYPE_ERROR, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t prewarmCamera(int a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v2 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v3 = __osLogPearlLibTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = a1;
    _os_log_impl(&dword_2218D1000, v3, OS_LOG_TYPE_DEFAULT, "prewarmCamera (%u)\n", buf, 8u);
  }
  v4 = initialize();
  if ((_DWORD)v4)
  {
    v7 = v4;
    v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 726);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = v2;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v9;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 726;
    goto LABEL_34;
  }
  v5 = performCommand(_connect, 43, a1, 0, 0, 0, 0);
  if (!(_DWORD)v5)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = v2;
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "prewarmCamera -> %d\n", buf, 8u);
      v7 = 0;
    }
    goto LABEL_17;
  }
  v7 = v5;
  v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 729);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v10 = __osLogPearlLib;
  else
    v10 = v2;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v11;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 729;
LABEL_34:
    _os_log_impl(&dword_2218D1000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = v2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_2218D1000, v12, OS_LOG_TYPE_ERROR, "prewarmCamera -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t setEntitlementOverride(int a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v2 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v3 = __osLogPearlLibTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = a1;
    _os_log_impl(&dword_2218D1000, v3, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig (0x%x)\n", buf, 8u);
  }
  v4 = initialize();
  if ((_DWORD)v4)
  {
    v7 = v4;
    v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 749);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = v2;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v15 = "err == 0 ";
    v16 = 2048;
    v17 = v9;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v22 = 1024;
    v23 = 749;
    goto LABEL_34;
  }
  v5 = performCommand(_connect, 64, 0, &v13, 4uLL, 0, 0);
  if (!(_DWORD)v5)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = v2;
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = 0;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
      v7 = 0;
    }
    goto LABEL_17;
  }
  v7 = v5;
  v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 752);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v10 = __osLogPearlLib;
  else
    v10 = v2;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v15 = "err == 0 ";
    v16 = 2048;
    v17 = v11;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v22 = 1024;
    v23 = 752;
LABEL_34:
    _os_log_impl(&dword_2218D1000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = v2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v7;
    _os_log_impl(&dword_2218D1000, v12, OS_LOG_TYPE_ERROR, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t pearlSeaCookieHandleMessage(int a1, const void *a2, size_t a3, void *a4, _QWORD *a5, id a6)
{
  char *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  char *v17;
  _BYTE *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  io_connect_t v28;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  uint8_t buf[4];
  _BYTE v44[44];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = a6;
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v11 = &logString[1288];
  v12 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v13 = __osLogPearlLibTrace;
  else
    v13 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v44 = a1;
    *(_WORD *)&v44[4] = 2048;
    *(_QWORD *)&v44[6] = a2;
    *(_WORD *)&v44[14] = 2048;
    *(_QWORD *)&v44[16] = a3;
    *(_WORD *)&v44[24] = 2048;
    *(_QWORD *)&v44[26] = a4;
    *(_WORD *)&v44[34] = 2048;
    *(_QWORD *)&v44[36] = a5;
    _os_log_impl(&dword_2218D1000, v13, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  if (a1 && a1 != 7)
  {
    if (!a2)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 776);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v19 = logString + 1288;
      v21 = v42;
      if (__osLogPearlLib)
        v30 = __osLogPearlLib;
      else
        v30 = v12;
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        goto LABEL_110;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v44 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message";
      *(_WORD *)&v44[8] = 2048;
      *(_QWORD *)&v44[10] = 0;
      *(_WORD *)&v44[18] = 2080;
      *(_QWORD *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 776;
      goto LABEL_109;
    }
    if (!a3)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 777);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v41 = __osLogPearlLib;
      else
        v41 = v12;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v44 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize";
        *(_WORD *)&v44[8] = 2048;
        *(_QWORD *)&v44[10] = 0;
        *(_WORD *)&v44[18] = 2080;
        *(_QWORD *)&v44[20] = "";
        *(_WORD *)&v44[28] = 2080;
        *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v44[38] = 1024;
        *(_DWORD *)&v44[40] = 777;
        _os_log_impl(&dword_2218D1000, v41, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v18 = 0;
      v27 = 258;
      goto LABEL_71;
    }
  }
  if (a1 != 8 && !a4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 778);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v19 = logString + 1288;
    v21 = v42;
    if (__osLogPearlLib)
      v30 = __osLogPearlLib;
    else
      v30 = v12;
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v44 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v44[8] = 2048;
    *(_QWORD *)&v44[10] = 0;
    *(_WORD *)&v44[18] = 2080;
    *(_QWORD *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 778;
    goto LABEL_109;
  }
  if (a1 != 8 && !a5)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 779);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v19 = logString + 1288;
    v21 = v42;
    if (__osLogPearlLib)
      v30 = __osLogPearlLib;
    else
      v30 = v12;
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v44 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v44[8] = 2048;
    *(_QWORD *)&v44[10] = 0;
    *(_WORD *)&v44[18] = 2080;
    *(_QWORD *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 779;
LABEL_109:
    _os_log_impl(&dword_2218D1000, v30, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_110:
    v18 = 0;
    v27 = 258;
    goto LABEL_129;
  }
  if (a5)
    v14 = *a5;
  else
    v14 = 0;
  v15 = initialize();
  if ((_DWORD)v15)
  {
    v27 = v15;
    v31 = (int)v15;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v15, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 786);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v32 = __osLogPearlLib;
    else
      v32 = v12;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v44 = "err == 0 ";
      *(_WORD *)&v44[8] = 2048;
      *(_QWORD *)&v44[10] = v31;
      *(_WORD *)&v44[18] = 2080;
      *(_QWORD *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 786;
      _os_log_impl(&dword_2218D1000, v32, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v18 = 0;
LABEL_71:
    v19 = logString + 1288;
LABEL_119:
    v21 = v42;
    goto LABEL_129;
  }
  v16 = a3 + 13;
  if (a3 >= 0xFFFFFFFFFFFFFFF3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a3 >= 0xFFFFFFFFFFFFFFF3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 789);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v19 = logString + 1288;
    v11 = logString + 1288;
    if (__osLogPearlLib)
      v33 = __osLogPearlLib;
    else
      v33 = v12;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v44 = "err == 0 ";
      *(_WORD *)&v44[8] = 2048;
      *(_QWORD *)&v44[10] = a3 >= 0xFFFFFFFFFFFFFFF3;
      *(_WORD *)&v44[18] = 2080;
      *(_QWORD *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 789;
      _os_log_impl(&dword_2218D1000, v33, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v18 = 0;
    v27 = 1;
    goto LABEL_119;
  }
  v17 = (char *)malloc(a3 + 13);
  if (!v17)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 792);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v19 = logString + 1288;
    v11 = logString + 1288;
    v27 = 3758097085;
    if (__osLogPearlLib)
      v34 = __osLogPearlLib;
    else
      v34 = v12;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v44 = "inData";
      *(_WORD *)&v44[8] = 2048;
      *(_QWORD *)&v44[10] = 0;
      *(_WORD *)&v44[18] = 2080;
      *(_QWORD *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 792;
      _os_log_impl(&dword_2218D1000, v34, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v18 = 0;
    goto LABEL_119;
  }
  v18 = v17;
  *(_DWORD *)v17 = a1;
  v17[4] = 1;
  *(_QWORD *)(v17 + 5) = a3;
  memcpy(v17 + 13, a2, a3);
  v19 = &logString[1288];
  v20 = performCommand(_connect, 70, 0, v18, a3 + 13, a4, a5);
  if ((_DWORD)v20)
  {
    v27 = v20;
    v35 = (int)v20;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v20, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 800);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v36 = __osLogPearlLib;
    else
      v36 = v12;
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_128;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v44 = "err == 0 ";
    *(_WORD *)&v44[8] = 2048;
    *(_QWORD *)&v44[10] = v35;
    *(_WORD *)&v44[18] = 2080;
    *(_QWORD *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 800;
    goto LABEL_127;
  }
  v21 = v42;
  if (a1 == 2)
    goto LABEL_27;
  if (a1 != 5)
    goto LABEL_28;
  if (!v42)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "callback", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 804);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    v11 = logString + 1288;
    if (__osLogPearlLib)
      v38 = __osLogPearlLib;
    else
      v38 = v12;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v44 = "callback";
      *(_WORD *)&v44[8] = 2048;
      *(_QWORD *)&v44[10] = 0;
      *(_WORD *)&v44[18] = 2080;
      *(_QWORD *)&v44[20] = "";
      *(_WORD *)&v44[28] = 2080;
      *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v44[38] = 1024;
      *(_DWORD *)&v44[40] = 804;
      _os_log_impl(&dword_2218D1000, v38, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v27 = 258;
    goto LABEL_119;
  }
  v22 = (*((uint64_t (**)(id, _QWORD, void *, _QWORD))v42 + 2))(v42, 0, a4, *a5);
  if (!(_DWORD)v22)
  {
LABEL_27:
    v18[4] = 0;
    *a5 = v14;
    v23 = performCommand(_connect, 70, 0, v18, v16, a4, a5);
    if (!(_DWORD)v23)
    {
LABEL_28:
      if (a4 && a5)
      {
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v24 = __osLogPearlLib;
        else
          v24 = v12;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *a5;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v44 = a1;
          *(_WORD *)&v44[4] = 2048;
          *(_QWORD *)&v44[6] = v25;
          *(_WORD *)&v44[14] = 1040;
          *(_DWORD *)&v44[16] = v25;
          *(_WORD *)&v44[20] = 2096;
          *(_QWORD *)&v44[22] = a4;
          _os_log_impl(&dword_2218D1000, v24, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
        }
      }
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLibTrace)
        v26 = __osLogPearlLibTrace;
      else
        v26 = v12;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v44 = a1;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = 0;
        _os_log_impl(&dword_2218D1000, v26, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
      }
      v27 = 0;
LABEL_45:
      free(v18);
      goto LABEL_46;
    }
    v27 = v23;
    v37 = (int)v23;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v23, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 814);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v36 = __osLogPearlLib;
    else
      v36 = v12;
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_128;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v44 = "err == 0 ";
    *(_WORD *)&v44[8] = 2048;
    *(_QWORD *)&v44[10] = v37;
    *(_WORD *)&v44[18] = 2080;
    *(_QWORD *)&v44[20] = "";
    *(_WORD *)&v44[28] = 2080;
    *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v44[38] = 1024;
    *(_DWORD *)&v44[40] = 814;
    goto LABEL_127;
  }
  v27 = v22;
  v39 = (int)v22;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v22, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 807);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v36 = __osLogPearlLib;
  else
    v36 = v12;
  if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    goto LABEL_128;
  *(_DWORD *)buf = 136316162;
  *(_QWORD *)v44 = "err == 0 ";
  *(_WORD *)&v44[8] = 2048;
  *(_QWORD *)&v44[10] = v39;
  *(_WORD *)&v44[18] = 2080;
  *(_QWORD *)&v44[20] = "";
  *(_WORD *)&v44[28] = 2080;
  *(_QWORD *)&v44[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
  *(_WORD *)&v44[38] = 1024;
  *(_DWORD *)&v44[40] = 807;
LABEL_127:
  _os_log_impl(&dword_2218D1000, v36, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_128:
  v19 = logString + 1288;
  v21 = v42;
  v11 = &logString[1288];
LABEL_129:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (*((_QWORD *)v11 + 352))
    v40 = *((_QWORD *)v11 + 352);
  else
    v40 = v12;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v44 = a1;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v27;
    _os_log_impl(&dword_2218D1000, v40, OS_LOG_TYPE_ERROR, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
  }
  if (v18)
    goto LABEL_45;
LABEL_46:
  v28 = *((_DWORD *)v19 + 712);
  if (v28)
  {
    IOServiceClose(v28);
    *((_DWORD *)v19 + 712) = 0;
  }

  return v27;
}

uint64_t mapScheme3ObjectToISPANE(int *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  char v14;
  uint8_t buf[4];
  _BYTE v16[18];
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v2 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v3 = __osLogPearlLibTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)v16 = 4;
    *(_WORD *)&v16[4] = 2080;
    *(_QWORD *)&v16[6] = a1;
    _os_log_impl(&dword_2218D1000, v3, OS_LOG_TYPE_DEFAULT, "mapScheme3Object: fourcc:%.4s\n\n", buf, 0x12u);
  }
  v13 = *a1;
  v14 = *((_BYTE *)a1 + 4);
  v4 = initialize();
  if ((_DWORD)v4)
  {
    v7 = v4;
    v9 = (int)v4;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 842);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = v2;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v16 = "err == 0 ";
    *(_WORD *)&v16[8] = 2048;
    *(_QWORD *)&v16[10] = v9;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 842;
    goto LABEL_34;
  }
  v5 = performCommand(_connect, 72, 0, &v13, 5uLL, 0, 0);
  if (!(_DWORD)v5)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = v2;
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v16 = 0;
      _os_log_impl(&dword_2218D1000, v6, OS_LOG_TYPE_DEFAULT, "mapScheme3Object -> 0x%x\n", buf, 8u);
      v7 = 0;
    }
    goto LABEL_17;
  }
  v7 = v5;
  v11 = (int)v5;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 845);
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLib)
    v10 = __osLogPearlLib;
  else
    v10 = v2;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v16 = "err == 0 ";
    *(_WORD *)&v16[8] = 2048;
    *(_QWORD *)&v16[10] = v11;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 845;
LABEL_34:
    _os_log_impl(&dword_2218D1000, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = v2;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v16 = v7;
    _os_log_impl(&dword_2218D1000, v12, OS_LOG_TYPE_ERROR, "mapScheme3Object -> 0x%x\n", buf, 8u);
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  return v7;
}

uint64_t allocateAndMapObjectS3C1(int *a1, int a2, int a3)
{
  char *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  FILE **v14;
  FILE *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  const char *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  const char *v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  const char *v54;
  NSObject *v55;
  NSObject *v56;
  const char *v57;
  const char *v58;
  NSObject *v59;
  NSObject *v60;
  const char *v61;
  const char *v62;
  NSObject *v63;
  NSObject *v64;
  const char *v65;
  NSObject *v66;
  NSObject *v67;
  BOOL v68;
  BOOL v71;
  int v72;
  BOOL v73;
  BOOL v76;
  char v77;
  NSObject *v78;
  io_connect_t v79;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  unint64_t v86;
  int v87;
  char v88;
  char v89;
  char v90;
  _BYTE v91[19];
  uint8_t buf[4];
  _BYTE v93[20];
  const char *v94;
  __int16 v95;
  const char *v96;
  __int16 v97;
  int v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v6 = &logString[1288];
  v7 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v8 = (void *)__osLogPearlLibTrace;
  else
    v8 = (void *)MEMORY[0x24BDACB70];
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68158466;
    *(_DWORD *)v93 = 4;
    *(_WORD *)&v93[4] = 2080;
    *(_QWORD *)&v93[6] = a1;
    *(_WORD *)&v93[14] = 1024;
    *(_DWORD *)&v93[16] = a2;
    LOWORD(v94) = 1024;
    *(_DWORD *)((char *)&v94 + 2) = a3;
    _os_log_impl(&dword_2218D1000, v9, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1: fourcc:%.4s mapObj:%d unmapObj:%d\n\n", buf, 0x1Eu);
  }

  *(_QWORD *)v91 = 0;
  *(_QWORD *)&v91[8] = 0;
  *(_DWORD *)&v91[15] = 0;
  v87 = *a1;
  v88 = *((_BYTE *)a1 + 4);
  v89 = a2;
  v90 = a3;
  v86 = 19;
  v10 = initialize();
  v11 = &logString[1288];
  if ((_DWORD)v10)
  {
    v13 = v10;
    v81 = (int)v10;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 873);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v82 = __osLogPearlLib;
    else
      v82 = v7;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v93 = "err == 0 ";
      *(_WORD *)&v93[8] = 2048;
      *(_QWORD *)&v93[10] = v81;
      *(_WORD *)&v93[18] = 2080;
      v94 = "";
      v95 = 2080;
      v96 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v97 = 1024;
      v98 = 873;
      _os_log_impl(&dword_2218D1000, v82, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_177;
  }
  v12 = performCommand(_connect, 82, 0, &v87, 7uLL, v91, &v86);
  if ((_DWORD)v12 != -536870201)
  {
    v13 = v12;
    if ((_DWORD)v12)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 877);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v83 = __osLogPearlLib;
      else
        v83 = v7;
      v84 = v83;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v93 = "err == 0 ";
        *(_WORD *)&v93[8] = 2048;
        *(_QWORD *)&v93[10] = (int)v13;
        *(_WORD *)&v93[18] = 2080;
        v94 = "";
        v95 = 2080;
        v96 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v97 = 1024;
        v98 = 877;
        _os_log_impl(&dword_2218D1000, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      v6 = logString + 1288;
    }
    v14 = (FILE **)MEMORY[0x24BDAC8D8];
    v15 = (FILE *)*MEMORY[0x24BDAC8D8];
    if (v86 <= 0x12)
    {
      fprintf(v15, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 879);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v11 = logString + 1288;
      if (__osLogPearlLib)
        v85 = __osLogPearlLib;
      else
        v85 = v7;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v93 = "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)";
        *(_WORD *)&v93[8] = 2048;
        *(_QWORD *)&v93[10] = 0;
        *(_WORD *)&v93[18] = 2080;
        v94 = "";
        v95 = 2080;
        v96 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v97 = 1024;
        v98 = 879;
        _os_log_impl(&dword_2218D1000, v85, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v13 = 3758097090;
    }
    else
    {
      fwrite("Results of Allocation and Mapping Object Scheme3 Context1:\n", 0x3BuLL, 1uLL, v15);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v16 = __osLogPearlLib;
      else
        v16 = v7;
      v17 = v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2218D1000, v17, OS_LOG_TYPE_DEFAULT, "Results of Allocation and Mapping Object Scheme3 Context1:\n", buf, 2u);
      }

      if (v91[0])
        v18 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v18 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "objectFound:\t\t%s\n", v18);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v19 = __osLogPearlLib;
      else
        v19 = v7;
      v20 = v19;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[0])
          v21 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v21 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v21;
        _os_log_impl(&dword_2218D1000, v20, OS_LOG_TYPE_DEFAULT, "objectFound:\t\t%s\n", buf, 0xCu);
      }

      fprintf(*v14, "dvaOffset:\t\t0x%X\n", *(_DWORD *)&v91[1]);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v22 = __osLogPearlLib;
      else
        v22 = v7;
      v23 = v22;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v93 = *(_DWORD *)&v91[1];
        _os_log_impl(&dword_2218D1000, v23, OS_LOG_TYPE_DEFAULT, "dvaOffset:\t\t0x%X\n", buf, 8u);
      }

      fprintf(*v14, "objectSize:\t\t%d\n", *(_DWORD *)&v91[5]);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v24 = __osLogPearlLib;
      else
        v24 = v7;
      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v93 = *(_DWORD *)&v91[5];
        _os_log_impl(&dword_2218D1000, v25, OS_LOG_TYPE_DEFAULT, "objectSize:\t\t%d\n", buf, 8u);
      }

      if (v91[9])
        v26 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v26 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "aneMapFunction:\t\t%s\n", v26);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v27 = __osLogPearlLib;
      else
        v27 = v7;
      v28 = v27;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[9])
          v29 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v29 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v29;
        _os_log_impl(&dword_2218D1000, v28, OS_LOG_TYPE_DEFAULT, "aneMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v91[10])
        v30 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v30 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "ispMapFunction:\t\t%s\n", v30);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v31 = __osLogPearlLib;
      else
        v31 = v7;
      v32 = v31;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[10])
          v33 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v33 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v33;
        _os_log_impl(&dword_2218D1000, v32, OS_LOG_TYPE_DEFAULT, "ispMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v91[11])
        v34 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v34 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "aneUnmapFunction:\t%s\n", v34);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v35 = __osLogPearlLib;
      else
        v35 = v7;
      v36 = v35;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[11])
          v37 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v37 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v37;
        _os_log_impl(&dword_2218D1000, v36, OS_LOG_TYPE_DEFAULT, "aneUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v91[12])
        v38 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v38 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "ispUnmapFunction:\t%s\n", v38);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v39 = __osLogPearlLib;
      else
        v39 = v7;
      v40 = v39;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[12])
          v41 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v41 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v41;
        _os_log_impl(&dword_2218D1000, v40, OS_LOG_TYPE_DEFAULT, "ispUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v91[13])
        v42 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v42 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "mappedToSEP:\t\t%s\n", v42);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v43 = __osLogPearlLib;
      else
        v43 = v7;
      v44 = v43;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[13])
          v45 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v45 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v45;
        _os_log_impl(&dword_2218D1000, v44, OS_LOG_TYPE_DEFAULT, "mappedToSEP:\t\t%s\n", buf, 0xCu);
      }

      if (v91[14])
        v46 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v46 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "mappedToANE:\t\t%s\n", v46);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v47 = __osLogPearlLib;
      else
        v47 = v7;
      v48 = v47;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[14])
          v49 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v49 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v49;
        _os_log_impl(&dword_2218D1000, v48, OS_LOG_TYPE_DEFAULT, "mappedToANE:\t\t%s\n", buf, 0xCu);
      }

      if (v91[15])
        v50 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v50 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "mappedToISP:\t\t%s\n", v50);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v51 = __osLogPearlLib;
      else
        v51 = v7;
      v52 = v51;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[15])
          v53 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v53 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v53;
        _os_log_impl(&dword_2218D1000, v52, OS_LOG_TYPE_DEFAULT, "mappedToISP:\t\t%s\n", buf, 0xCu);
      }

      if (v91[18])
        v54 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v54 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "unmappedFromISP:\t%s\n", v54);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v55 = __osLogPearlLib;
      else
        v55 = v7;
      v56 = v55;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[18])
          v57 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v57 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v57;
        _os_log_impl(&dword_2218D1000, v56, OS_LOG_TYPE_DEFAULT, "unmappedFromISP:\t%s\n", buf, 0xCu);
      }

      if (v91[17])
        v58 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v58 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "unmappedFromANE:\t%s\n", v58);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v59 = __osLogPearlLib;
      else
        v59 = v7;
      v60 = v59;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[17])
          v61 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v61 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v61;
        _os_log_impl(&dword_2218D1000, v60, OS_LOG_TYPE_DEFAULT, "unmappedFromANE:\t%s\n", buf, 0xCu);
      }

      if (v91[16])
        v62 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v62 = "\x1B[31mFAIL\x1B[0m";
      fprintf(*v14, "unmappedFromSEP:\t%s\n", v62);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      v11 = &logString[1288];
      if (__osLogPearlLib)
        v63 = __osLogPearlLib;
      else
        v63 = v7;
      v64 = v63;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        if (v91[16])
          v65 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v65 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v93 = v65;
        _os_log_impl(&dword_2218D1000, v64, OS_LOG_TYPE_DEFAULT, "unmappedFromSEP:\t%s\n", buf, 0xCu);
      }

      v6 = &logString[1288];
      if (!(_DWORD)v13)
      {
        if (v91[9])
          v68 = v91[10] == 0;
        else
          v68 = 1;
        v71 = v68 || v91[13] == 0 || v91[14] == 0 || v91[15] == 0;
        v72 = a2 ^ 1;
        if (!v71)
          v72 = 1;
        if (v91[11])
          v73 = v91[12] == 0;
        else
          v73 = 1;
        v76 = v73 || v91[16] == 0 || v91[17] == 0 || v91[18] == 0;
        v77 = a3 ^ 1;
        if (!v76)
          v77 = 1;
        v13 = 261;
        if (v72 == 1 && (v77 & 1) != 0)
          goto LABEL_214;
      }
    }
LABEL_177:
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (*((_QWORD *)v6 + 352))
      v66 = *((_QWORD *)v6 + 352);
    else
      v66 = v7;
    v67 = v66;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v93 = v13;
      _os_log_impl(&dword_2218D1000, v67, OS_LOG_TYPE_ERROR, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
    }
    goto LABEL_222;
  }
LABEL_214:
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  if (__osLogPearlLibTrace)
    v78 = __osLogPearlLibTrace;
  else
    v78 = v7;
  v67 = v78;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v93 = 0;
    _os_log_impl(&dword_2218D1000, v67, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
  }
  v13 = 0;
LABEL_222:

  v79 = *((_DWORD *)v11 + 712);
  if (v79)
  {
    IOServiceClose(v79);
    *((_DWORD *)v11 + 712) = 0;
  }
  return v13;
}

uint64_t getBrunorCollectionKey(_QWORD *a1, _QWORD *a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v4 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v5 = __osLogPearlLibTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v5, OS_LOG_TYPE_DEFAULT, "getBrunorCollectionKey\n", buf, 2u);
  }
  v23 = 65;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 928);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v16 = __osLogPearlLib;
    else
      v16 = v4;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v25 = "collectionKey";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 928;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 929);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v16 = __osLogPearlLib;
    else
      v16 = v4;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v25 = "collectionKeyLength";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 929;
LABEL_48:
    _os_log_impl(&dword_2218D1000, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    v10 = 258;
    goto LABEL_15;
  }
  v6 = initialize();
  if ((_DWORD)v6)
  {
    v10 = v6;
    v17 = (int)v6;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 932);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = v4;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "err == 0 ";
      v26 = 2048;
      v27 = v17;
      v28 = 2080;
      v29 = "";
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v32 = 1024;
      v33 = 932;
      _os_log_impl(&dword_2218D1000, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v7 = calloc(1uLL, 0x41uLL);
    if (v7)
    {
      v8 = v7;
      v9 = performCommand(_connect, 73, 0, 0, 0, v7, &v23);
      if ((_DWORD)v9)
      {
        v10 = v9;
        v20 = (int)v9;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 938);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v21 = __osLogPearlLib;
        else
          v21 = v4;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v25 = "err == 0 ";
          v26 = 2048;
          v27 = v20;
          v28 = 2080;
          v29 = "";
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v32 = 1024;
          v33 = 938;
          _os_log_impl(&dword_2218D1000, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        if (v23 == 65)
        {
          v10 = 0;
          *a1 = v8;
          *a2 = 65;
          goto LABEL_15;
        }
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 939);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v22 = __osLogPearlLib;
        else
          v22 = v4;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v25 = "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)";
          v26 = 2048;
          v27 = 0;
          v28 = 2080;
          v29 = "";
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v32 = 1024;
          v33 = 939;
          _os_log_impl(&dword_2218D1000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v10 = 261;
      }
      free(v8);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 935);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v19 = __osLogPearlLib;
      else
        v19 = v4;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "reply";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v32 = 1024;
        v33 = 935;
        _os_log_impl(&dword_2218D1000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v10 = 260;
    }
  }
LABEL_15:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v10)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v11 = __osLogPearlLibTrace;
    else
      v11 = v4;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v10;
      v12 = v11;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl(&dword_2218D1000, v12, v13, "getBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v14 = __osLogPearlLibTrace;
    else
      v14 = v4;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 0;
      v12 = v14;
      v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v10;
}

uint64_t getAttestationToBrunorCollectionKey(_QWORD *a1, size_t *a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  size_t __size;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v4 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v5 = __osLogPearlLibTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v5, OS_LOG_TYPE_DEFAULT, "getAttestationToBrunorCollectionKey\n", buf, 2u);
  }
  __size = 0x4000;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 966);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v17 = __osLogPearlLib;
    else
      v17 = v4;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    *(_DWORD *)buf = 136316162;
    v27 = "attestation";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 966;
    goto LABEL_50;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestationLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 967);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v17 = __osLogPearlLib;
    else
      v17 = v4;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    *(_DWORD *)buf = 136316162;
    v27 = "attestationLength";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 967;
LABEL_50:
    _os_log_impl(&dword_2218D1000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_51:
    v11 = 258;
    goto LABEL_17;
  }
  v6 = initialize();
  if ((_DWORD)v6)
  {
    v11 = v6;
    v18 = (int)v6;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 970);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = v4;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = v18;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v34 = 1024;
      v35 = 970;
      _os_log_impl(&dword_2218D1000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v7 = calloc(1uLL, 0x4000uLL);
    if (v7)
    {
      v8 = v7;
      v9 = performCommand(_connect, 74, 0, 0, 0, v7, &__size);
      if ((_DWORD)v9)
      {
        v11 = v9;
        v21 = (int)v9;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 976);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v22 = __osLogPearlLib;
        else
          v22 = v4;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v27 = "err == 0 ";
          v28 = 2048;
          v29 = v21;
          v30 = 2080;
          v31 = "";
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v34 = 1024;
          v35 = 976;
          _os_log_impl(&dword_2218D1000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else if (__size > 0x4000)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= (16 * 1024)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 977);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v23 = __osLogPearlLib;
        else
          v23 = v4;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v27 = "replySize <= (16 * 1024)";
          v28 = 2048;
          v29 = 0;
          v30 = 2080;
          v31 = "";
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v34 = 1024;
          v35 = 977;
          _os_log_impl(&dword_2218D1000, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v11 = 261;
      }
      else
      {
        v10 = calloc(1uLL, __size);
        *a1 = v10;
        if (v10)
        {
          memcpy(v10, v8, __size);
          v11 = 0;
          *a2 = __size;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 980);
          if (OSLogInit_onceToken != -1)
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          if (__osLogPearlLib)
            v24 = __osLogPearlLib;
          else
            v24 = v4;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v27 = "*attestation";
            v28 = 2048;
            v29 = 0;
            v30 = 2080;
            v31 = "";
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v34 = 1024;
            v35 = 980;
            _os_log_impl(&dword_2218D1000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v11 = 260;
        }
      }
      free(v8);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 973);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v20 = __osLogPearlLib;
      else
        v20 = v4;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v27 = "reply";
        v28 = 2048;
        v29 = 0;
        v30 = 2080;
        v31 = "";
        v32 = 2080;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v34 = 1024;
        v35 = 973;
        _os_log_impl(&dword_2218D1000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v11 = 260;
    }
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v11)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v12 = __osLogPearlLibTrace;
    else
      v12 = v4;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v11;
      v13 = v12;
      v14 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl(&dword_2218D1000, v13, v14, "getAttestationToBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v15 = __osLogPearlLibTrace;
    else
      v15 = v4;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = 0;
      v13 = v15;
      v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v11;
}

uint64_t signDataWithBrunorCollectionKey(const void *a1, size_t a2, _QWORD *a3, size_t *a4)
{
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  size_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  size_t __size;
  uint8_t v27[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v8 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v9 = __osLogPearlLibTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v9, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorCollectionKey\n", buf, 2u);
  }
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)buf = 0u;
  __size = 128;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1005);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "data";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1005;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1006);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "dataLength";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1006;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1007);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "signature";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1007;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1008);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "signatureLength";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1008;
LABEL_64:
    _os_log_impl(&dword_2218D1000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
LABEL_65:
    v14 = 258;
    goto LABEL_17;
  }
  v10 = initialize();
  if ((_DWORD)v10)
  {
    v14 = v10;
    v21 = (int)v10;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1011);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136316162;
      v28 = "err == 0 ";
      v29 = 2048;
      v30 = v21;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v35 = 1024;
      v36 = 1011;
LABEL_80:
      _os_log_impl(&dword_2218D1000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
    }
  }
  else
  {
    v11 = performCommand(_connect, 75, 0, a1, a2, buf, &__size);
    if (!(_DWORD)v11)
    {
      if (__size >= 0x81)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1015);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v24 = __osLogPearlLib;
        else
          v24 = v8;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v27 = 136316162;
          v28 = "replySize <= sizeof(reply)";
          v29 = 2048;
          v30 = 0;
          v31 = 2080;
          v32 = "";
          v33 = 2080;
          v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v35 = 1024;
          v36 = 1015;
          _os_log_impl(&dword_2218D1000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
        }
        v14 = 261;
      }
      else
      {
        v12 = calloc(1uLL, __size);
        *a3 = v12;
        if (v12)
        {
          v13 = __size;
          *a4 = __size;
          memcpy(v12, buf, v13);
          v14 = 0;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1018);
          if (OSLogInit_onceToken != -1)
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          if (__osLogPearlLib)
            v25 = __osLogPearlLib;
          else
            v25 = v8;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v27 = 136316162;
            v28 = "*signature";
            v29 = 2048;
            v30 = 0;
            v31 = 2080;
            v32 = "";
            v33 = 2080;
            v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v35 = 1024;
            v36 = 1018;
            _os_log_impl(&dword_2218D1000, v25, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
          }
          v14 = 260;
        }
      }
      goto LABEL_17;
    }
    v14 = v11;
    v23 = (int)v11;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1014);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136316162;
      v28 = "err == 0 ";
      v29 = 2048;
      v30 = v23;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v35 = 1024;
      v36 = 1014;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v14)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v15 = __osLogPearlLibTrace;
    else
      v15 = v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 67109120;
      LODWORD(v28) = v14;
      v16 = v15;
      v17 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl(&dword_2218D1000, v16, v17, "signDataWithBrunorCollectionKey -> %d\n", v27, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v18 = __osLogPearlLibTrace;
    else
      v18 = v8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 67109120;
      LODWORD(v28) = 0;
      v16 = v18;
      v17 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v14;
}

uint64_t getBrunorPermanentKey(_QWORD *a1, unint64_t *a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v4 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v5 = __osLogPearlLibTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v5, OS_LOG_TYPE_DEFAULT, "getBrunorPermanentKey\n", buf, 2u);
  }
  v24 = 57;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1040);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v17 = __osLogPearlLib;
    else
      v17 = v4;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v26 = "permanentKey";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    v34 = 1040;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1041);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v17 = __osLogPearlLib;
    else
      v17 = v4;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v26 = "permanentKeyLength";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    v34 = 1041;
LABEL_48:
    _os_log_impl(&dword_2218D1000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    v11 = 258;
    goto LABEL_15;
  }
  v6 = initialize();
  if ((_DWORD)v6)
  {
    v11 = v6;
    v18 = (int)v6;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1044);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = v4;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "err == 0 ";
      v27 = 2048;
      v28 = v18;
      v29 = 2080;
      v30 = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v33 = 1024;
      v34 = 1044;
      _os_log_impl(&dword_2218D1000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v7 = calloc(1uLL, 0x39uLL);
    if (v7)
    {
      v8 = v7;
      v9 = performCommand(_connect, 76, 0, 0, 0, v7, &v24);
      if ((_DWORD)v9)
      {
        v11 = v9;
        v21 = (int)v9;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1050);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v22 = __osLogPearlLib;
        else
          v22 = v4;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v26 = "err == 0 ";
          v27 = 2048;
          v28 = v21;
          v29 = 2080;
          v30 = "";
          v31 = 2080;
          v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v33 = 1024;
          v34 = 1050;
          _os_log_impl(&dword_2218D1000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        v10 = v24;
        if (v24 < 0x3A)
        {
          v11 = 0;
          *a1 = v8;
          *a2 = v10;
          goto LABEL_15;
        }
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1051);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v23 = __osLogPearlLib;
        else
          v23 = v4;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v26 = "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)";
          v27 = 2048;
          v28 = 0;
          v29 = 2080;
          v30 = "";
          v31 = 2080;
          v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v33 = 1024;
          v34 = 1051;
          _os_log_impl(&dword_2218D1000, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v11 = 261;
      }
      free(v8);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1047);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v20 = __osLogPearlLib;
      else
        v20 = v4;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v26 = "reply";
        v27 = 2048;
        v28 = 0;
        v29 = 2080;
        v30 = "";
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v33 = 1024;
        v34 = 1047;
        _os_log_impl(&dword_2218D1000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v11 = 260;
    }
  }
LABEL_15:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v11)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v12 = __osLogPearlLibTrace;
    else
      v12 = v4;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v11;
      v13 = v12;
      v14 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl(&dword_2218D1000, v13, v14, "getBrunorPermanentKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v15 = __osLogPearlLibTrace;
    else
      v15 = v4;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 0;
      v13 = v15;
      v14 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v11;
}

uint64_t signDataWithBrunorPermanentKey(const void *a1, size_t a2, _QWORD *a3, size_t *a4)
{
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  size_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  size_t __size;
  uint8_t v27[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v8 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v9 = __osLogPearlLibTrace;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v9, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorPermanentKey\n", buf, 2u);
  }
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  *(_OWORD *)buf = 0u;
  v38 = 0u;
  __size = 65;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1079);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "data";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1079;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1080);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "dataLength";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1080;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1081);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "signature";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1081;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1082);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v20 = __osLogPearlLib;
    else
      v20 = v8;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v27 = 136316162;
    v28 = "signatureLength";
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = "";
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v35 = 1024;
    v36 = 1082;
LABEL_64:
    _os_log_impl(&dword_2218D1000, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
LABEL_65:
    v14 = 258;
    goto LABEL_17;
  }
  v10 = initialize();
  if ((_DWORD)v10)
  {
    v14 = v10;
    v21 = (int)v10;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1085);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136316162;
      v28 = "err == 0 ";
      v29 = 2048;
      v30 = v21;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v35 = 1024;
      v36 = 1085;
LABEL_80:
      _os_log_impl(&dword_2218D1000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
    }
  }
  else
  {
    v11 = performCommand(_connect, 77, 0, a1, a2, buf, &__size);
    if (!(_DWORD)v11)
    {
      if (__size >= 0x42)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1089);
        if (OSLogInit_onceToken != -1)
          dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
        if (__osLogPearlLib)
          v24 = __osLogPearlLib;
        else
          v24 = v8;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v27 = 136316162;
          v28 = "replySize <= sizeof(reply)";
          v29 = 2048;
          v30 = 0;
          v31 = 2080;
          v32 = "";
          v33 = 2080;
          v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v35 = 1024;
          v36 = 1089;
          _os_log_impl(&dword_2218D1000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
        }
        v14 = 261;
      }
      else
      {
        v12 = calloc(1uLL, __size);
        *a3 = v12;
        if (v12)
        {
          v13 = __size;
          *a4 = __size;
          memcpy(v12, buf, v13);
          v14 = 0;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1092);
          if (OSLogInit_onceToken != -1)
            dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
          if (__osLogPearlLib)
            v25 = __osLogPearlLib;
          else
            v25 = v8;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v27 = 136316162;
            v28 = "*signature";
            v29 = 2048;
            v30 = 0;
            v31 = 2080;
            v32 = "";
            v33 = 2080;
            v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v35 = 1024;
            v36 = 1092;
            _os_log_impl(&dword_2218D1000, v25, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v27, 0x30u);
          }
          v14 = 260;
        }
      }
      goto LABEL_17;
    }
    v14 = v11;
    v23 = (int)v11;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1088);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136316162;
      v28 = "err == 0 ";
      v29 = 2048;
      v30 = v23;
      v31 = 2080;
      v32 = "";
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v35 = 1024;
      v36 = 1088;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v14)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v15 = __osLogPearlLibTrace;
    else
      v15 = v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 67109120;
      LODWORD(v28) = v14;
      v16 = v15;
      v17 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl(&dword_2218D1000, v16, v17, "signDataWithBrunorPermanentKey -> %d\n", v27, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v18 = __osLogPearlLibTrace;
    else
      v18 = v8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 67109120;
      LODWORD(v28) = 0;
      v16 = v18;
      v17 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v14;
}

uint64_t prepareFDRDataEncryptionKey()
{
  NSObject *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v0 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v1 = __osLogPearlLibTrace;
  else
    v1 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v1, OS_LOG_TYPE_DEFAULT, "prepareFDRDataEncryptionKey\n", buf, 2u);
  }
  v2 = initialize();
  if ((_DWORD)v2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v2, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1112);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = v0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = (int)v2;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v21 = 1024;
      v22 = 1112;
      _os_log_impl(&dword_2218D1000, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v3 = performCommand(_connect, 78, 0, 0, 0, 0, 0);
    if ((_DWORD)v3)
    {
      v10 = v3;
      v11 = (int)v3;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1115);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v12 = __osLogPearlLib;
      else
        v12 = v0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v14 = "err == 0 ";
        v15 = 2048;
        v16 = v11;
        v17 = 2080;
        v18 = "";
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v21 = 1024;
        v22 = 1115;
        _os_log_impl(&dword_2218D1000, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v2 = v10;
    }
  }
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v2)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v4 = __osLogPearlLibTrace;
    else
      v4 = v0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v2;
      v5 = v4;
      v6 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl(&dword_2218D1000, v5, v6, "prepareFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v7 = __osLogPearlLibTrace;
    else
      v7 = v0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      v5 = v7;
      v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v2;
}

uint64_t setDummyWrappedFDRDataEncryptionKey(const void *a1, size_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v4 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v5 = __osLogPearlLibTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2218D1000, v5, OS_LOG_TYPE_DEFAULT, "setDummyWrappedFDRDataEncryptionKey\n", buf, 2u);
  }
  v6 = initialize();
  if ((_DWORD)v6)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1132);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v13 = __osLogPearlLib;
    else
      v13 = v4;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = (int)v6;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v25 = 1024;
      v26 = 1132;
      _os_log_impl(&dword_2218D1000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v7 = performCommand(_connect, 79, 0, a1, a2, 0, 0);
    if ((_DWORD)v7)
    {
      v14 = v7;
      v15 = (int)v7;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v7, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1135);
      if (OSLogInit_onceToken != -1)
        dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
      if (__osLogPearlLib)
        v16 = __osLogPearlLib;
      else
        v16 = v4;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "err == 0 ";
        v19 = 2048;
        v20 = v15;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v25 = 1024;
        v26 = 1135;
        _os_log_impl(&dword_2218D1000, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v6 = v14;
    }
  }
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v6)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v8 = __osLogPearlLibTrace;
    else
      v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v6;
      v9 = v8;
      v10 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl(&dword_2218D1000, v9, v10, "setDummyWrappedFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v11 = __osLogPearlLibTrace;
    else
      v11 = v4;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      v9 = v11;
      v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v6;
}

uint64_t encryptFDRDataForBrunor(const char *a1, size_t a2, uint64_t a3, char *a4, _OWORD *a5, uint64_t a6)
{
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  NSObject *v20;
  NSObject *v22;
  size_t v23;
  NSObject *v24;
  size_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  size_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _OWORD *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (OSLogInit_onceToken != -1)
    dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
  v12 = MEMORY[0x24BDACB70];
  if (__osLogPearlLibTrace)
    v13 = __osLogPearlLibTrace;
  else
    v13 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    v27 = a1;
    v28 = 2048;
    v29 = a2;
    v30 = 2048;
    v31 = (const char *)a3;
    v32 = 2048;
    v33 = a4;
    v34 = 2048;
    v35 = a5;
    v36 = 2048;
    v37 = a6;
    _os_log_impl(&dword_2218D1000, v13, OS_LOG_TYPE_DEFAULT, "encryptFDRDataForBrunor %p %zu %p %p %p %zu\n", buf, 0x3Eu);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1152);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v12;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v27 = "PSD2";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    LODWORD(v35) = 1152;
    goto LABEL_87;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1153);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v12;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v27 = "PSD2Length";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    LODWORD(v35) = 1153;
    goto LABEL_87;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1154);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v12;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v27 = "PSD3";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    LODWORD(v35) = 1154;
    goto LABEL_87;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outPSD3Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1155);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v12;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v27 = "outPSD3Length";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    LODWORD(v35) = 1155;
    goto LABEL_87;
  }
  if (a5 && a6 != 16)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3MACLength == (16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1160);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = v12;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v27 = "PSD3MACLength == (16)";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    LODWORD(v35) = 1160;
LABEL_87:
    _os_log_impl(&dword_2218D1000, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_88:
    v16 = 258;
    goto LABEL_18;
  }
  v14 = initialize();
  if ((_DWORD)v14)
  {
    v16 = v14;
    v23 = (int)v14;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1164);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v24 = __osLogPearlLib;
    else
      v24 = v12;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = v23;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v34 = 1024;
      LODWORD(v35) = 1164;
LABEL_79:
      _os_log_impl(&dword_2218D1000, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v15 = performCommand(_connect, 80, 0, a1, a2, (void *)a3, a4);
    if (!(_DWORD)v15)
    {
      v16 = 0;
      if (a5)
        *a5 = *(_OWORD *)(a3 + 108);
      goto LABEL_18;
    }
    v16 = v15;
    v25 = (int)v15;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v15, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1167);
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLib)
      v24 = __osLogPearlLib;
    else
      v24 = v12;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = v25;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v34 = 1024;
      LODWORD(v35) = 1167;
      goto LABEL_79;
    }
  }
LABEL_18:
  if (_connect)
  {
    IOServiceClose(_connect);
    _connect = 0;
  }
  if ((_DWORD)v16)
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v17 = __osLogPearlLibTrace;
    else
      v17 = v12;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v16;
      v18 = v17;
      v19 = OS_LOG_TYPE_ERROR;
LABEL_35:
      _os_log_impl(&dword_2218D1000, v18, v19, "encryptFDRDataForBrunor -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (OSLogInit_onceToken != -1)
      dispatch_once(&OSLogInit_onceToken, &__block_literal_global_0);
    if (__osLogPearlLibTrace)
      v20 = __osLogPearlLibTrace;
    else
      v20 = v12;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = 0;
      v18 = v20;
      v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_35;
    }
  }
  return v16;
}

void SavageCFDictionarySetInteger32_cold_1()
{
  __assert_rtn("SavageCFDictionarySetInteger32", "SavagePrivateHelper.cpp", 35, "num != NULL");
}

void SavageCFDictionarySetData_cold_1()
{
  __assert_rtn("SavageCFDictionarySetData", "SavagePrivateHelper.cpp", 48, "tmpData");
}

void YonkersUpdateController::getSignedCertificate()
{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 747, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 728, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 709, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 642, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 624, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 604, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 573, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "YonkersUpdateController.cpp", 555, "numLenOctets <= MAX_LEN_OCTETS");
}

void YonkersUpdateController::validateSignatureLen()
{
  __assert_rtn("validateSignatureLen", "YonkersUpdateController.cpp", 806, "sigRLen >= MIN_SIG_LEN && sigRLen <= MAX_ACCEPTED_SIG_LEN");
}

{
  __assert_rtn("validateSignatureLen", "YonkersUpdateController.cpp", 829, "sigSLen >= MIN_SIG_LEN && sigSLen <= MAX_ACCEPTED_SIG_LEN");
}

void SavageUpdateController::formatAndStitchFiles()
{
  __assert_rtn("formatAndStitchFiles", "SavageUpdateController.cpp", 1244, "pSavageDevice->fdrDataEncryptionKeyPresent");
}

void SavageUpdateController::getFirmwareDigest()
{
  __assert_rtn("getFirmwareDigest", "SavageUpdateController.cpp", 955, "numLenOctets <= MAX_LEN_OCTETS");
}

void SavageUpdateController::getSignedCertificate()
{
  __assert_rtn("getSignedCertificate", "SavageUpdateController.cpp", 1056, "numLenOctets <= MAX_LEN_OCTETS");
}

{
  __assert_rtn("getSignedCertificate", "SavageUpdateController.cpp", 1004, "numLenOctets <= MAX_LEN_OCTETS");
}

void SavageUpdateController::validateSignatureLen()
{
  __assert_rtn("validateSignatureLen", "SavageUpdateController.cpp", 1132, "sigRLen >= MIN_SIG_LEN && sigRLen <= MAX_ACCEPTED_SIG_LEN");
}

{
  __assert_rtn("validateSignatureLen", "SavageUpdateController.cpp", 1154, "sigSLen >= MIN_SIG_LEN && sigSLen <= MAX_ACCEPTED_SIG_LEN");
}

uint64_t AMFDRCreateInstanceString()
{
  return MEMORY[0x24BED4140]();
}

uint64_t AMFDRModuleCreateSignedCSR()
{
  return MEMORY[0x24BED4248]();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x24BED4328]();
}

uint64_t AMSupportMakeDirectory()
{
  return MEMORY[0x24BEDA070]();
}

uint64_t AMSupportPlatformFileURLExists()
{
  return MEMORY[0x24BEDA080]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x24BEDA0F0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
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

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x24BDBC518](alloc, theArray, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
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

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t SavageCamInterfaceClose()
{
  return MEMORY[0x24BE84168]();
}

uint64_t SavageCamInterfaceGetSensorInfo()
{
  return MEMORY[0x24BE84178]();
}

uint64_t SavageCamInterfaceOpen()
{
  return MEMORY[0x24BE84180]();
}

uint64_t SavageCamInterfacePublishToRegistry()
{
  return MEMORY[0x24BE84188]();
}

uint64_t SavageCamInterfaceSensorAuth()
{
  return MEMORY[0x24BE84190]();
}

uint64_t SavageCamInterfaceSensorFusing()
{
  return MEMORY[0x24BE84198]();
}

uint64_t SavageCamInterfaceSensorPreFusing()
{
  return MEMORY[0x24BE841A0]();
}

uint64_t SavageCamInterfaceSensorPrePersonalize()
{
  return MEMORY[0x24BE841A8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24E75A548(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E75A550(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

