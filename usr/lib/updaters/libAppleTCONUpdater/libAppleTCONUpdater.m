uint64_t AppleTCONDevice::getIORegPropertyValue(AppleTCONDevice *this, const __CFString *a2, unsigned __int8 *a3, int a4)
{
  uint64_t v4;
  io_registry_entry_t v5;
  const __CFData *CFProperty;
  const __CFData *v10;
  CFTypeID v11;
  CFIndex Length;
  size_t v13;
  const UInt8 *BytePtr;
  char CStringPtr;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = 3758097084;
  v5 = *((_DWORD *)this + 6);
  if (!v5)
    return 3758097088;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v5, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v10 = CFProperty;
  if (!CFProperty)
  {
    v4 = 3758097086;
LABEL_9:
    AMSupportSafeRelease();
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    AppleTCONLoggingLogMsg((uint64_t)"IOReg (%s) error: %s\n", v16, v17, v18, v19, v20, v21, v22, CStringPtr);
    return v4;
  }
  v11 = CFGetTypeID(CFProperty);
  if (v11 != CFDataGetTypeID())
    goto LABEL_9;
  Length = CFDataGetLength(v10);
  if (Length != a4)
    goto LABEL_9;
  v13 = Length;
  BytePtr = CFDataGetBytePtr(v10);
  if (!BytePtr)
    goto LABEL_9;
  memcpy(a3, BytePtr, v13);
  AMSupportSafeRelease();
  return 0;
}

uint64_t AppleTCONDP835Device::writeGPIO(AppleTCONDP835Device *this, uint64_t a2, unsigned int a3)
{
  io_service_t v3;
  uint64_t v4;
  io_connect_t v5;
  io_connect_t connect;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  connect = 0;
  input[0] = a2;
  input[1] = a3;
  v3 = *((_DWORD *)this + 10);
  if (!v3)
    return 3758097136;
  v4 = IOServiceOpen(v3, *MEMORY[0x24BDAEC58], 0, &connect);
  v5 = connect;
  if (!(_DWORD)v4)
  {
    if (!connect)
      return 3758097097;
    v4 = IOConnectCallScalarMethod(connect, 1u, input, 2u, 0, 0);
    v5 = connect;
  }
  if (v5)
    IOServiceClose(v5);
  return v4;
}

uint64_t AppleTCONDP835Device::eraseDeviceEEPROM(AppleTCONDP835Device *this, unsigned int a2, unsigned int a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;

  while (a3)
  {
    if (a3 >= 0x1000)
      v4 = 4096;
    else
      v4 = a3;
    v15 = v4;
    v5 = IOAVDisplayMemoryWrite();
    a3 -= v15;
    if ((_DWORD)v5)
    {
      v13 = v5;
      AppleTCONLoggingLogMsg((uint64_t)"erase eeprom error (0x%08x): %s", v6, v7, v8, v9, v10, v11, v12, v5);
      return v13;
    }
  }
  return 0;
}

uint64_t AppleTCONDP835Device::writeDeviceEEPROM(AppleTCONDP835Device *this, unsigned int a2, const unsigned __int8 *a3, unsigned int a4)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  while (a4)
  {
    if (a4 >= 0x1000)
      v5 = 4096;
    else
      v5 = a4;
    v6 = IOAVDisplayMemoryWrite();
    a4 -= v5;
    if ((_DWORD)v6)
    {
      v14 = v6;
      AppleTCONLoggingLogMsg((uint64_t)"write eeprom error (0x%08x): %s", v7, v8, v9, v10, v11, v12, v13, v6);
      return v14;
    }
  }
  return 0;
}

uint64_t AppleTCONDP835Device::waitForDeviceReady(AppleTCONDP835Device *this)
{
  uint64_t result;

  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t AppleTCONDP835Device::getChipID(AppleTCONDP835Device *this, unsigned int *a2)
{
  uint64_t result;

  if (!a2)
    return 3758097090;
  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
    *a2 = bswap32(0) >> 16;
  return result;
}

uint64_t AppleTCONDP835Device::getBoardID(AppleTCONDP835Device *this, unsigned int *a2)
{
  uint64_t result;

  if (!a2)
    return 3758097090;
  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
    return 3758096385;
  return result;
}

uint64_t AppleTCONDP835Device::getBundleVer(AppleTCONDP835Device *this, unsigned __int8 *a2, int a3)
{
  uint64_t result;
  int v5;

  v5 = 20;
  result = 3758097090;
  if (a2 && a3 == 3)
  {
    result = AppleTCONDP835Device::sendCmd(this, (uint64_t)&v5, 0, 0, 0);
    if (!(_DWORD)result)
      return IOAVDisplayMemoryRead();
  }
  return result;
}

uint64_t AppleTCONDP835Device::sendCmd(AppleTCONDP835Device *a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v9;
  uint64_t v10;

  v9 = AppleTCONDP835Device::waitForDeviceReady(a1);
  if ((_DWORD)v9)
    return v9;
  v10 = 3758097090;
  if (!a3 || !a4)
  {
LABEL_6:
    v9 = IOAVDisplayMemoryWrite();
    if (!(_DWORD)v9)
    {
      v9 = IOAVDisplayMemoryWrite();
      if (!(_DWORD)v9)
      {
        v9 = AppleTCONDP835Device::waitForDeviceReady(a1);
        if (!(_DWORD)v9)
        {
          v9 = IOAVDisplayMemoryRead();
          if (!(_DWORD)v9)
            return 0;
        }
      }
    }
    return v9;
  }
  if ((a5 + a4) <= 0x10)
  {
    v9 = IOAVDisplayMemoryWrite();
    if ((_DWORD)v9)
      return v9;
    goto LABEL_6;
  }
  return v10;
}

uint64_t AppleTCONDP835Device::dischargePanel(AppleTCONDP835Device *this)
{
  uint64_t result;

  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
  {
    result = IOAVDisplayMemoryWrite();
    if (!(_DWORD)result)
    {
      usleep(0x493E0u);
      return 0;
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::startFWUpdate(AppleTCONDP835Device *this)
{
  uint64_t result;

  result = AppleTCONDP835Device::dischargePanel(this);
  if (!(_DWORD)result)
  {
    result = IOAVDisplayMemoryRead();
    if (!(_DWORD)result)
    {
      result = IOAVDisplayMemoryWrite();
      if (!(_DWORD)result)
      {
        result = IOAVDisplayMemoryRead();
        if (!(_DWORD)result)
        {
          result = IOAVDisplayMemoryRead();
          if (!(_DWORD)result)
          {
            result = IOAVDisplayMemoryWrite();
            if (!(_DWORD)result)
            {
              result = IOAVDisplayMemoryRead();
              if (!(_DWORD)result)
              {
                IOAVDisplayMemoryWrite();
                usleep(0xC350u);
                result = IOAVDisplayMemoryRead();
                if (!(_DWORD)result)
                {
                  result = IOAVDisplayMemoryRead();
                  if (!(_DWORD)result)
                  {
                    result = IOAVDisplayMemoryRead();
                    if (!(_DWORD)result)
                    {
                      result = IOAVDisplayMemoryWrite();
                      if (!(_DWORD)result)
                      {
                        result = IOAVDisplayMemoryRead();
                        if (!(_DWORD)result)
                        {
                          result = IOAVDisplayMemoryWrite();
                          if (!(_DWORD)result)
                          {
                            result = IOAVDisplayMemoryRead();
                            if (!(_DWORD)result)
                            {
                              result = IOAVDisplayMemoryWrite();
                              if (!(_DWORD)result)
                                return AppleTCONDP835Device::writeGPIO(this, 0x746E766DuLL, 0);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::endFWUpdate(AppleTCONDP835Device *this)
{
  uint64_t v2;
  uint64_t v3;

  v2 = AppleTCONDP835Device::writeGPIO(this, 0x746E766DuLL, 1u);
  if ((_DWORD)v2)
    return v2;
  v2 = AppleTCONDP835Device::dischargePanel(this);
  if ((_DWORD)v2)
    return v2;
  v2 = IOAVDisplayMemoryRead();
  if ((_DWORD)v2)
    return v2;
  v2 = IOAVDisplayMemoryWrite();
  if ((_DWORD)v2)
    return v2;
  v2 = IOAVDisplayMemoryRead();
  if ((_DWORD)v2)
    return v2;
  v3 = 3758097129;
  IOAVDisplayMemoryWrite();
  usleep(0x493E0u);
  v2 = IOAVDisplayMemoryRead();
  if ((_DWORD)v2)
    return v2;
  return v3;
}

uint64_t AppleTCONDP835Device::getSDOMStatus(AppleTCONDP835Device *this, unsigned __int8 *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a2)
    return 3758097090;
  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
  {
    AppleTCONLoggingLogMsg((uint64_t)"SDOM status %s", v4, v5, v6, v7, v8, v9, v10, (char)"OTP_STATUS_UNPROGRAMMED");
    result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t AppleTCONDP835Device::getPRODStatus(AppleTCONDP835Device *this, unsigned __int8 *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a2)
    return 3758097090;
  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
  {
    AppleTCONLoggingLogMsg((uint64_t)"PROD status %s", v4, v5, v6, v7, v8, v9, v10, (char)"OTP_STATUS_UNPROGRAMMED");
    result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t AppleTCONDP835Device::setSdom(AppleTCONDP835Device *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  int v13;

  v13 = 16777315;
  v12 = 17;
  v1 = AppleTCONDP835Device::sendCmd(this, (uint64_t)&v13, (uint64_t)&v12, 1, 0);
  if ((_DWORD)v1)
  {
    v10 = v1;
LABEL_7:
    AppleTCONLoggingLogMsg((uint64_t)"setSdom: update failed:0x%x phase:%u", v2, v3, v4, v5, v6, v7, v8, v10);
    return v10;
  }
  v9 = IOAVDisplayMemoryRead();
  if ((_DWORD)v9)
  {
    v10 = v9;
    goto LABEL_7;
  }
  return 0;
}

uint64_t AppleTCONDP835Device::setProd(AppleTCONDP835Device *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  int v13;

  v13 = 33554531;
  v12 = 17;
  v1 = AppleTCONDP835Device::sendCmd(this, (uint64_t)&v13, (uint64_t)&v12, 1, 1);
  if ((_DWORD)v1)
  {
    v10 = v1;
LABEL_7:
    AppleTCONLoggingLogMsg((uint64_t)"setProd: update failed:0x%x phase:%u", v2, v3, v4, v5, v6, v7, v8, v10);
    return v10;
  }
  v9 = IOAVDisplayMemoryRead();
  if ((_DWORD)v9)
  {
    v10 = v9;
    goto LABEL_7;
  }
  return 0;
}

uint64_t AppleTCONDP835Device::getECID(AppleTCONDP835Device *this, unsigned __int8 *a2, int a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  result = 3758097090;
  if (a2)
  {
    if (a3 == 16)
    {
      result = IOAVDisplayMemoryRead();
      if (!(_DWORD)result)
      {
        v5 = 15;
        v6 = 8;
        do
        {
          v7 = a2[v6];
          a2[v6] = a2[v5];
          a2[v5--] = v7;
          ++v6;
        }
        while (v5 != 11);
        result = 0;
        *(_QWORD *)a2 = 0;
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::getOptionsValue(AppleTCONDP835Device *this, const __CFDictionary *a2, const __CFString *a3, uint64_t Value)
{
  CFStringRef v5;
  CFStringRef v6;
  const __CFBoolean *ValueForKeyPathInDict;
  const __CFBoolean *v8;
  CFTypeID v9;

  v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Options.%@"), a3);
  if (v5)
  {
    v6 = v5;
    ValueForKeyPathInDict = (const __CFBoolean *)AMSupportGetValueForKeyPathInDict();
    if (ValueForKeyPathInDict)
    {
      v8 = ValueForKeyPathInDict;
      v9 = CFGetTypeID(ValueForKeyPathInDict);
      if (v9 == CFBooleanGetTypeID())
        Value = CFBooleanGetValue(v8);
    }
    CFRelease(v6);
  }
  return Value;
}

uint64_t AppleTCONDP835Device::updateOTP(AppleTCONDP835Device *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  AppleTCONLoggingLogMsg((uint64_t)"Fuse Prod (%d:%d)", a2, a3, a4, a5, a6, a7, a8, *((_BYTE *)this + 9));
  if (!*((_BYTE *)this + 9) && *((_BYTE *)this + 65))
  {
    result = AppleTCONDP835Device::setProd(this);
    if ((_DWORD)result)
      return result;
    *((_BYTE *)this + 9) = 1;
  }
  result = AppleTCONDP835Device::setSdom(this);
  if (!(_DWORD)result)
    *((_BYTE *)this + 8) = 1;
  return result;
}

void AppleTCONDP835Device::AppleTCONDP835Device(AppleTCONDP835Device *this, int a2)
{
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  io_service_t MatchingService;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  char v21;
  int v22;

  *(_QWORD *)this = &off_24F7EA918;
  v22 = 0;
  *((_DWORD *)this + 2) = 257;
  *((_BYTE *)this + 69) = 0;
  *((_DWORD *)this + 6) = a2;
  v3 = IOServiceMatching("AppleTCONControl");
  if (!v3)
  {
    v20 = "Failed to create AppleTCONControl matching dictionary";
LABEL_22:
    AppleTCONLoggingLogMsg((uint64_t)v20, (uint64_t)v3, v4, v5, v6, v7, v8, v9, v21);
    goto LABEL_14;
  }
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v3);
  *((_DWORD *)this + 10) = MatchingService;
  if (!MatchingService)
  {
    v20 = "Failed to find AppleTCONControl service";
    goto LABEL_22;
  }
  v11 = IOAVDisplayMemoryCreateWithName();
  *((_QWORD *)this + 2) = v11;
  if (!v11)
  {
    v20 = "Failed to get memoryRef handle";
    goto LABEL_22;
  }
  v12 = IOAVDisplayMemoryCreateWithName();
  *((_QWORD *)this + 4) = v12;
  if (!v12)
  {
    v20 = "Failed to get eepromRef handle";
    goto LABEL_22;
  }
  if (AppleTCONDP835Device::getPRODStatus(this, (unsigned __int8 *)&v22 + 3))
  {
    v20 = "Failed to get Prod status";
    goto LABEL_22;
  }
  *((_BYTE *)this + 9) = HIBYTE(v22) == 1;
  if (AppleTCONDP835Device::getSDOMStatus(this, (unsigned __int8 *)&v22 + 3))
  {
    v20 = "Failed to get SDOM status";
    goto LABEL_22;
  }
  *((_BYTE *)this + 8) = HIBYTE(v22) == 1;
  if (IOAVDisplayMemoryRead())
  {
    v20 = "Failed to get boot status";
    goto LABEL_22;
  }
  *((_WORD *)this + 22) = 0;
  *((_BYTE *)this + 46) = 0;
  if ((~HIBYTE(v22) & 7) != 0)
  {
    AppleTCONLoggingLogMsg((uint64_t)"Unexpected boot status: 0x%02x", (uint64_t)v3, v4, v5, v6, v7, v8, v9, SHIBYTE(v22));
  }
  else if (AppleTCONDP835Device::getBundleVer(this, (unsigned __int8 *)&v22, 3))
  {
    AppleTCONLoggingLogMsg((uint64_t)"Failed to get bundle version", v13, v14, v15, v16, v17, v18, v19, v21);
  }
  else
  {
    *((_BYTE *)this + 44) = v22;
    *(_WORD *)((char *)this + 45) = *(_WORD *)((char *)&v22 + 1);
  }
  *(_WORD *)((char *)this + 47) = 0;
  *((_BYTE *)this + 49) = 0;
  *((_BYTE *)this + 11) = 1;
LABEL_14:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTconDev:(%d:%d:%d:0x%02x:0x%02x:0x%02x)", v13, v14, v15, v16, v17, v18, v19, *((_BYTE *)this + 11));
}

void sub_22CF01EB4(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = &off_24F7EA970;
  _Unwind_Resume(a1);
}

void AppleTCONDP835Device::~AppleTCONDP835Device(AppleTCONDP835Device *this)
{
  io_object_t v2;
  io_object_t v3;

  *(_QWORD *)this = &off_24F7EA918;
  v2 = *((_DWORD *)this + 6);
  if (v2)
    IOObjectRelease(v2);
  v3 = *((_DWORD *)this + 10);
  if (v3)
    IOObjectRelease(v3);
  *(_QWORD *)this = &off_24F7EA970;
}

{
  AppleTCONDP835Device::~AppleTCONDP835Device(this);
  JUMPOUT(0x22E309A4CLL);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t AppleTCONDP835Device::eventCmdQueryInfo(AppleTCONDP835Device *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  AppleTCONDP835Device *OptionsValue;
  AppleTCONDP835Device *v7;
  AppleTCONDP835Device *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  const __CFAllocator *v20;
  CFNumberRef v21;
  CFNumberRef v22;
  __CFString *v23;
  CFNumberRef v24;
  CFNumberRef v25;
  __CFString *v26;
  CFDataRef v27;
  CFDataRef v28;
  __CFString *v29;
  CFDataRef v30;
  CFDataRef v31;
  __CFString *v32;
  const char *v34;
  unsigned int valuePtr;
  unsigned int v36;
  unsigned __int16 v37;
  UInt8 bytes[24];
  UInt8 v39[8];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v39 = 0;
  v40 = 0;
  memset(bytes, 0, 16);
  valuePtr = 0;
  v36 = 0;
  OptionsValue = (AppleTCONDP835Device *)AppleTCONDP835Device::getOptionsValue(this, a2, CFSTR("FuseSDOM"), 0);
  *((_BYTE *)this + 64) = (_BYTE)OptionsValue;
  v7 = (AppleTCONDP835Device *)AppleTCONDP835Device::getOptionsValue(OptionsValue, a2, CFSTR("FusePROD"), 0);
  *((_BYTE *)this + 65) = (_BYTE)v7;
  v8 = (AppleTCONDP835Device *)AppleTCONDP835Device::getOptionsValue(v7, a2, CFSTR("RestoreInternal"), 0);
  *((_BYTE *)this + 66) = (_BYTE)v8;
  *((_BYTE *)this + 67) = AppleTCONDP835Device::getOptionsValue(v8, a2, CFSTR("SkipSameVersion"), 1);
  if (!*((_BYTE *)this + 11))
    return 0;
  if (AppleTCONDP835Device::getBoardID(this, &v36))
  {
    v34 = "getBoardID failed";
    goto LABEL_30;
  }
  *((_DWORD *)this + 15) = v36;
  v37 = 0;
  v16 = IOAVDisplayMemoryRead();
  if ((_DWORD)v16)
  {
    v19 = v16;
    v34 = "getHWCID failed";
    goto LABEL_31;
  }
  v17 = 1;
  if ((v37 > 0xDu || ((1 << v37) & 0x23FF) == 0) && v37 - 256 >= 6)
    v17 = 0;
  if (*((_BYTE *)this + 8))
  {
    v18 = 1;
  }
  else
  {
    v18 = v17 ^ 1;
    if (!*((_BYTE *)this + 64))
      v18 = 1;
  }
  v19 = 3758097085;
  *((_BYTE *)this + 69) |= v18;
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdQueryInfo: boardID=0x%08x HWCID=0x%08x personalize=%u", v9, v10, v11, v12, v13, v14, v15, *((_DWORD *)this + 15));
  v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, (char *)this + 60);
  if (!v21)
  {
    v34 = "boardID alloc failed";
    goto LABEL_31;
  }
  v22 = v21;
  v23 = AppleTCONDP835DeviceRestoreTagForBoardID(3, *((_DWORD *)this + 15));
  CFDictionaryAddValue(a3, v23, v22);
  CFRelease(v22);
  if (AppleTCONDP835Device::getChipID(this, &valuePtr))
  {
    v34 = "getChipID failed";
    goto LABEL_30;
  }
  v24 = CFNumberCreate(v20, kCFNumberIntType, &valuePtr);
  if (!v24)
  {
    v34 = "chipID alloc failed";
    goto LABEL_31;
  }
  v25 = v24;
  v26 = AppleTCONDP835DeviceRestoreTagForBoardID(2, *((_DWORD *)this + 15));
  CFDictionaryAddValue(a3, v26, v25);
  CFRelease(v25);
  if (*((_BYTE *)this + 69))
  {
    *(_OWORD *)bytes = AppleTCONDP835Device::getNonce(unsigned char *,unsigned int)::nonceData;
    v27 = CFDataCreate(v20, bytes, 16);
    if (!v27)
    {
      v34 = "nonce alloc failed";
      goto LABEL_31;
    }
    v28 = v27;
    v29 = AppleTCONDP835DeviceRestoreTagForBoardID(8, *((_DWORD *)this + 15));
    CFDictionaryAddValue(a3, v29, v28);
    CFRelease(v28);
    if (!AppleTCONDP835Device::getECID(this, v39, 16))
    {
      v30 = CFDataCreate(v20, v39, 16);
      if (v30)
      {
        v31 = v30;
        v32 = AppleTCONDP835DeviceRestoreTagForBoardID(10, *((_DWORD *)this + 15));
        CFDictionaryAddValue(a3, v32, v31);
        CFRelease(v31);
        goto LABEL_20;
      }
      v34 = "ecid alloc failed";
LABEL_31:
      AppleTCONLoggingLogMsg((uint64_t)"Dev:CmdQueryInfo failure %s", v9, v10, v11, v12, v13, v14, v15, (char)v34);
      return v19;
    }
    v34 = "getECID failed";
LABEL_30:
    v19 = 15;
    goto LABEL_31;
  }
LABEL_20:
  AppleTCONDP835DeviceRestoreTagForBoardID(5, *((_DWORD *)this + 15));
  AMSupportCFDictionarySetBoolean();
  AppleTCONDP835DeviceRestoreTagForBoardID(7, *((_DWORD *)this + 15));
  AMSupportCFDictionarySetInteger32();
  return 0;
}

uint64_t AppleTCONDP835Device::isFWComponentsUpdateRequired(AppleTCONDP835Device *this, CFDictionaryRef theDict)
{
  const __CFData *Value;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFData *v11;
  CFTypeID v12;
  const __CFAllocator *v13;
  CFPropertyListRef v14;
  CFTypeID v15;
  const __CFData *ValueForKeyPathInDict;
  const __CFData *v17;
  CFTypeID v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  UInt8 buffer[2];
  unsigned __int8 v34;
  CFRange v35;

  v34 = 0;
  *(_WORD *)buffer = 0;
  Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("FirmwareData"));
  v11 = Value;
  if (!Value || (v12 = CFGetTypeID(Value), v12 != CFDataGetTypeID()))
  {
    v29 = "firmware data type invalid ";
    goto LABEL_25;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v14 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0, 0, 0);
  if (!v14 || (v15 = CFGetTypeID(v14), v15 != CFDictionaryGetTypeID()))
  {
    v29 = "fw dict create failed";
    goto LABEL_25;
  }
  if (!CFStringCreateWithFormat(v13, 0, CFSTR("%u.%s.%s"), *((unsigned int *)this + 15), "nvm_image", "Payload"))
  {
    v29 = "nvm ver string create failed";
    goto LABEL_25;
  }
  ValueForKeyPathInDict = (const __CFData *)AMSupportGetValueForKeyPathInDict();
  if (!ValueForKeyPathInDict
    || (v17 = ValueForKeyPathInDict, v18 = CFGetTypeID(ValueForKeyPathInDict), v18 != CFDataGetTypeID()))
  {
    v29 = "bundle payload type invalid";
    goto LABEL_25;
  }
  v35.location = 3006464;
  v35.length = 3;
  CFDataGetBytes(v17, v35, buffer);
  *((_BYTE *)this + 49) = v34;
  *((_BYTE *)this + 47) = buffer[1];
  *((_BYTE *)this + 48) = buffer[0];
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::isFWComponentsUpdateRequired: internal:%u skipSameVersion:%u", v19, v20, v21, v22, v23, v24, v25, *((_BYTE *)this + 66));
  v26 = buffer[1] & 0x3E;
  v27 = *((_BYTE *)this + 44) & 0x3E;
  if (v26 < v27)
  {
    v29 = "bundle major ver < current major ver";
    goto LABEL_25;
  }
  if (v26 == v27)
  {
    v28 = *((unsigned __int8 *)this + 45);
    if (buffer[0] < v28)
    {
      v29 = "bundle minor ver < current minor ver";
      goto LABEL_25;
    }
    if (buffer[0] == v28)
    {
      if (*((_BYTE *)this + 66) && !*((_BYTE *)this + 67))
      {
        if (v34 < *((unsigned __int8 *)this + 46))
        {
          v29 = "bundle extent ver < current extent ver";
          goto LABEL_25;
        }
      }
      else if (v34 <= *((unsigned __int8 *)this + 46))
      {
        v29 = "bundle extent ver <= current extent ver";
LABEL_25:
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::isFWComponentsUpdateRequired: %s", v4, v5, v6, v7, v8, v9, v10, (char)v29);
        v31 = 0;
        v30 = "Skipping";
        goto LABEL_18;
      }
    }
  }
  v30 = "Performing";
  v31 = 1;
LABEL_18:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::isFWComponentsUpdateRequired: %s update to 0x%02x:0x%02x:0x%02x", v4, v5, v6, v7, v8, v9, v10, (char)v30);
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v31;
}

uint64_t AppleTCONDP835Device::updateFWComponents(AppleTCONDP835Device *this, const __CFDictionary *a2)
{
  uint64_t v4;
  const __CFAllocator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFData *v13;
  const __CFData *Value;
  const __CFData *v15;
  CFTypeID v16;
  CFPropertyListRef v17;
  CFTypeID v18;
  const unsigned __int8 *BytePtr;
  unsigned int Length;
  uint64_t v21;
  uint64_t v22;
  CFStringRef v23;
  const __CFData *v24;
  uint64_t updated;
  const char *v27;

  v4 = 3758097088;
  AppleTCONDP835DeviceRestoreTagForBoardID(1, *((_DWORD *)this + 15));
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  AMSupportGetValueForKeyPathInDict();
  v13 = (const __CFData *)AMSupportSafeRetain();
  if (!v13)
  {
    v27 = "ticket missing";
    goto LABEL_26;
  }
  Value = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("FirmwareData"));
  v15 = Value;
  if (!Value || (v16 = CFGetTypeID(Value), v16 != CFDataGetTypeID()))
  {
    v27 = "firmware missing";
    goto LABEL_26;
  }
  v17 = CFPropertyListCreateWithData(v5, v15, 0, 0, 0);
  if (!v17 || (v18 = CFGetTypeID(v17), v18 != CFDictionaryGetTypeID()))
  {
    v27 = "firmware dict: create failed";
    goto LABEL_26;
  }
  BytePtr = CFDataGetBytePtr(v13);
  v4 = 3758097090;
  if (BytePtr)
  {
    Length = CFDataGetLength(v13);
    if (Length <= 0x3000)
    {
      v21 = AppleTCONDP835Device::eraseDeviceEEPROM(this, *((_DWORD *)this + 14), 0x3000u);
      if ((_DWORD)v21)
      {
        v4 = v21;
        v27 = "failed to erase personalization manifest from EEPROM";
      }
      else
      {
        v22 = AppleTCONDP835Device::writeDeviceEEPROM(this, *((_DWORD *)this + 14), BytePtr, Length);
        if ((_DWORD)v22)
        {
          v4 = v22;
          v27 = "failed to write personalization manifest to EEPROM";
        }
        else
        {
          v23 = CFStringCreateWithFormat(v5, 0, CFSTR("%u.%s.Payload"), *((unsigned int *)this + 15), "nvm_image");
          if (v23)
          {
            AMSupportGetValueForKeyPathInDict();
            v24 = (const __CFData *)AMSupportSafeRetain();
            if (v24)
            {
              updated = AppleTCONDP835Device::updateFWComponent(this, 4, v24);
              if ((_DWORD)updated)
              {
                v4 = updated;
                v27 = "failed to update fw component";
              }
              else
              {
                v4 = doPCDSUpdate();
                if (!(_DWORD)v4)
                {
                  CFRelease(v23);
                  CFRelease(v24);
                  goto LABEL_15;
                }
                v27 = "failed to update pcds component";
              }
            }
            else
            {
              v4 = 0;
              v27 = "comp: data missing";
            }
          }
          else
          {
            v4 = 0;
            v27 = "comp: key create failed";
          }
        }
      }
LABEL_26:
      AppleTCONLoggingLogMsg((uint64_t)"update fw error:%s", v6, v7, v8, v9, v10, v11, v12, (char)v27);
    }
  }
LABEL_15:
  AMSupportSafeFree();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v4;
}

uint64_t AppleTCONDP835Device::updateFWComponent(AppleTCONDP835Device *this, int a2, CFDataRef theData)
{
  const UInt8 *BytePtr;
  unsigned int Length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  const char *v31;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::updateFWComponent: component=0x%02x, componentDataLength=0x%08x", v8, v9, v10, v11, v12, v13, v14, a2);
  v15 = 0;
  while (1)
  {
    if (a2 == 4)
    {
      v17 = *(_DWORD *)((char *)&tconEEPROMMap + v15 + 8);
      v16 = *(_DWORD *)((char *)&tconEEPROMMap + v15 + 12);
      v18 = v17 + *((_DWORD *)this + 14);
      v19 = AppleTCONDP835Device::eraseDeviceEEPROM(this, v18, v16);
      if ((_DWORD)v19)
      {
        v29 = v19;
        v31 = "eraseDeviceEEPROM failed";
        goto LABEL_13;
      }
      v27 = v16 >= Length ? Length : v16;
      v28 = AppleTCONDP835Device::writeDeviceEEPROM(this, *((_DWORD *)this + 14) + v17, &BytePtr[v18], v27);
      if ((_DWORD)v28)
        break;
    }
    v15 += 16;
    if (v15 == 400)
      return 0;
  }
  v29 = v28;
  v31 = "writeDeviceEEPROM failed";
LABEL_13:
  AppleTCONLoggingLogMsg((uint64_t)"update fw component error:%s", v20, v21, v22, v23, v24, v25, v26, (char)v31);
  return v29;
}

uint64_t AppleTCONDP835Device::readFWPointer(AppleTCONDP835Device *this, unint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;

  if (!(a2 | a3))
    return 3758097090;
  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
  {
    v13 = bswap32(0);
    if ((v13 & 0xFFDFFFFF) == 0x100000)
    {
      if (a2)
        *(_DWORD *)a2 = v13;
      if (a3)
        *(_DWORD *)a3 = 0x100000;
      if (a2)
        v14 = *(_DWORD *)a2;
      else
        LOBYTE(v14) = 0;
      AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::readFWPointer: activeFWPointer:0x%08x inactiveFWPointer:0x%08x", v6, v7, v8, v9, v10, v11, v12, v14);
      return 0;
    }
    else
    {
      return 3758096385;
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::writeFWPointer(AppleTCONDP835Device *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  uint64_t result;
  unsigned __int8 v11[4];

  v8 = a2;
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::writeFWPointer: fWPointer:0x%08x", a2, a3, a4, a5, a6, a7, a8, a2);
  if ((v8 & 0xFFDFFFFF) != 0x100000)
    return 3758097090;
  *(_DWORD *)v11 = bswap32(v8);
  result = AppleTCONDP835Device::eraseDeviceEEPROM(this, 0, 4u);
  if (!(_DWORD)result)
    return AppleTCONDP835Device::writeDeviceEEPROM(this, 0, v11, 4u);
  return result;
}

uint64_t AppleTCONDP835Device::writeAndVerifyFWPointer(AppleTCONDP835Device *this, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::writeAndVerifyFWPointer: fWPointer:0x%08x", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a2);
  result = AppleTCONDP835Device::writeFWPointer(this, a2, v12, v13, v14, v15, v16, v17);
  if (!(_DWORD)result)
  {
    result = AppleTCONDP835Device::readFWPointer(this, (unint64_t)a3, (unint64_t)a4);
    if (!(_DWORD)result)
    {
      if (*a3 == (_DWORD)a2)
        return 0;
      else
        return 3758097129;
    }
  }
  return result;
}

uint64_t AppleTCONDP835Device::eventCmdPerformNextStage(AppleTCONDP835Device *this, const __CFDictionary *a2, CFDictionaryRef theDict, unsigned __int8 *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int isFWComponentsUpdateRequired;
  BOOL v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  unsigned int v27;
  const char *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int started;
  unsigned int v46;
  const char *v47;
  char v48;
  unsigned __int8 v49;
  uint64_t v50;
  const char *v52;
  char v53;
  unsigned __int8 v54[4];
  unsigned int v55[2];
  size_t v56;
  char __s1[256];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v55 = 0;
  *(_DWORD *)v54 = 0;
  isFWComponentsUpdateRequired = AppleTCONDP835Device::isFWComponentsUpdateRequired(this, theDict);
  if (*((_BYTE *)this + 8))
    v15 = 1;
  else
    v15 = *((_BYTE *)this + 64) == 0;
  v16 = !v15;
  AppleTCONLoggingLogMsg((uint64_t)"Fuse SDOM (%d:%d)", v7, v8, v9, v10, v11, v12, v13, *((_BYTE *)this + 8));
  if (*((_BYTE *)this + 10))
  {
    v52 = "AppleTCONDP835Device::eventCmdPerformNextStage: update done";
LABEL_51:
    AppleTCONLoggingLogMsg((uint64_t)v52, v17, v18, v19, v20, v21, v22, v23, v53);
    v48 = 0;
    goto LABEL_46;
  }
  if (isFWComponentsUpdateRequired)
    v24 = 1;
  else
    v24 = v16;
  if ((v24 & 1) == 0)
  {
    v52 = "AppleTCONDP835Device::eventCmdPerformNextStage: update not required";
    goto LABEL_51;
  }
  if (*((_BYTE *)this + 8) || *((_BYTE *)this + 64))
  {
    v25 = v16 ^ 1;
    if (!*((_BYTE *)this + 69))
      v25 = 1;
    if ((v25 & 1) == 0 && AppleTCONDP835Device::updateOTP(this, v17, v18, v19, v20, v21, v22, v23))
    {
      v28 = "otp update failed";
    }
    else if (AppleTCONDP835Device::startFWUpdate(this))
    {
      v28 = "start update failed";
    }
    else
    {
      if (AppleTCONDP835Device::readFWPointer(this, (unint64_t)&v55[1], (unint64_t)v55))
      {
        v26 = 3145728;
        v27 = 0x100000;
        v55[0] = 0x100000;
        v55[1] = 3145728;
      }
      else
      {
        v27 = v55[0];
        v26 = v55[1];
      }
      *((_DWORD *)this + 13) = v26;
      *((_DWORD *)this + 14) = v27;
      if (!AppleTCONDevice::getIORegPropertyValue(this, CFSTR("enforce-pcds-valid"), v54, 4)
        && *(_DWORD *)v54
        && ((v56 = 256, sysctlbyname("kern.bootargs", __s1, &v56, 0, 0)) || !strstr(__s1, "enforce-pcds-valid=0")))
      {
        if (IOAVDisplayMemoryRead())
        {
          v28 = "failed to read PCDS 0 top-level header";
        }
        else
        {
          *((_BYTE *)this + 68) = 0;
          if (IOAVDisplayMemoryRead())
          {
            v28 = "failed to read PCDS 1 top-level header";
          }
          else
          {
            *((_BYTE *)this + 68) = 0;
            v28 = "PCDS must be generated and programmed before FW update can occur";
          }
        }
      }
      else if (AppleTCONDP835Device::updateFWComponents(this, theDict))
      {
        v28 = "updates failed";
      }
      else
      {
        if (!AppleTCONDP835Device::writeAndVerifyFWPointer(this, *((unsigned int *)this + 14), &v55[1], v55, v20, v21, v22, v23))
        {
          v29 = v55[0];
          *((_DWORD *)this + 13) = v55[1];
          *((_DWORD *)this + 14) = v29;
          if (AppleTCONDP835Device::endFWUpdate(this))
          {
            v37 = "end update failed";
            goto LABEL_37;
          }
          if (AppleTCONDP835Device::getBundleVer(this, (unsigned __int8 *)__s1, 3))
          {
            v37 = "failed to read bundle version after update";
            goto LABEL_37;
          }
          AppleTCONLoggingLogMsg((uint64_t)"expected bundle version: 0x%02x:0x%02x:0x%02x, actual bundle version: 0x%02x:0x%02x:0x%02x", v30, v31, v32, v33, v34, v35, v36, *((_BYTE *)this + 47));
          if (__s1[0] != *((unsigned __int8 *)this + 47)
            || __s1[1] != *((unsigned __int8 *)this + 48)
            || __s1[2] != *((unsigned __int8 *)this + 49))
          {
            v37 = "bundle version after update differs from update bundle version";
LABEL_37:
            AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: failure %s", v30, v31, v32, v33, v34, v35, v36, (char)v37);
            started = AppleTCONDP835Device::startFWUpdate(this);
            if (!started)
            {
              started = AppleTCONDP835Device::writeAndVerifyFWPointer(this, *((unsigned int *)this + 14), &v55[1], v55, v41, v42, v43, v44);
              if (!started)
              {
                v46 = v55[0];
                *((_DWORD *)this + 13) = v55[1];
                *((_DWORD *)this + 14) = v46;
              }
              AppleTCONDP835Device::endFWUpdate(this);
            }
            v47 = "failed";
            if (!started)
              v47 = "succeeded";
            AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: failure: attempt to revert FW pointer %s", v38, v39, v40, v41, v42, v43, v44, (char)v47);
            goto LABEL_44;
          }
          v49 = *((_BYTE *)this + 69);
          v48 = 1;
          if (!v49)
          {
            v50 = 0;
            *((_BYTE *)this + 69) = 1;
            goto LABEL_48;
          }
LABEL_46:
          v50 = 0;
          v49 = 1;
          goto LABEL_48;
        }
        v28 = "failed to set FW pointer to update bank";
      }
    }
  }
  else
  {
    v28 = "SDOM not fused; see rdar://84123825 for instructions";
  }
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: failure %s", v17, v18, v19, v20, v21, v22, v23, (char)v28);
LABEL_44:
  v48 = 0;
  v49 = 1;
  v50 = 11;
LABEL_48:
  *((_BYTE *)this + 10) = v49;
  *a4 = v49;
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP835Device::eventCmdPerformNextStage: didUpdate=%u personalize=%u updateDone=%u", v30, v31, v32, v33, v34, v35, v36, v48);
  return v50;
}

void AppleTCONDevice::~AppleTCONDevice(AppleTCONDevice *this)
{
  *(_QWORD *)this = &off_24F7EA970;
}

{
  *(_QWORD *)this = &off_24F7EA970;
  JUMPOUT(0x22E309A4CLL);
}

uint64_t AppleTCONDevice::eventCmdQueryInfo(AppleTCONDevice *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  return 0;
}

uint64_t AppleTCONDevice::eventCmdPerformNextStage(AppleTCONDevice *this, const __CFDictionary *a2, const __CFDictionary *a3, unsigned __int8 *a4)
{
  return *((unsigned __int8 *)this + 10);
}

uint64_t AppleTCONUpdaterCreate(const __CFDictionary *a1, const char *a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t Instance;
  uint64_t v11;
  AppleTCONUpdateController *v12;
  const __CFString *v13;
  const char *CStringPtr;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  __CFError *CFErrorWithDomain;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  CFErrorRef err;

  err = 0;
  AppleTCONLoggingRegisterLogSink(a2, a3, a3, (uint64_t)a4, a5, a6, a7, a8);
  if (AppleTCONUpdaterCreate::only_once != -1)
    dispatch_once(&AppleTCONUpdaterCreate::only_once, &__block_literal_global);
  if (!AppleTCONUpdaterTypeID)
  {
    CFErrorWithDomain = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"AppleTCONUpdaterCreate - failed to register kLibAppleTCONUpdaterClass", 3u, (uint64_t)a1, CFSTR("AppleTCONUpdaterErrorDomain"));
    v11 = 0;
LABEL_13:
    err = CFErrorWithDomain;
    goto LABEL_14;
  }
  Instance = _CFRuntimeCreateInstance();
  v11 = Instance;
  if (!Instance)
  {
    CFErrorWithDomain = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"AppleTCONUpdaterCreate - failed to create AppleTCONUpdater", 3u, (uint64_t)a1, CFSTR("AppleTCONUpdaterErrorDomain"));
    goto LABEL_13;
  }
  *(_QWORD *)(Instance + 32) = AppleTCONUpdaterTypeID;
  *(_QWORD *)(Instance + 16) = 0;
  v12 = (AppleTCONUpdateController *)operator new();
  AppleTCONUpdateController::AppleTCONUpdateController(v12);
  *(_QWORD *)(v11 + 24) = v12;
  v13 = AppleTCONUpdaterDescribe((CFStringRef)v11);
  CStringPtr = CFStringGetCStringPtr(v13, 0);
  AppleTCONLoggingLogMsg((uint64_t)CStringPtr, v15, v16, v17, v18, v19, v20, v21, v45);
  AMSupportSafeRelease();
  if (AppleTCONUpdateController::start(*(AppleTCONUpdateController **)(v11 + 24), a1, &err, v22, v23, v24, v25, v26))v34 = 0;
  else
    v34 = err == 0;
  if (v34)
    return v11;
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdaterCreate - AppleTCONUpdateController start error", v27, v28, v29, v30, v31, v32, v33, v46);
  CFErrorWithDomain = err;
LABEL_14:
  if (CFErrorWithDomain)
  {
    v37 = CFErrorCopyDescription(CFErrorWithDomain);
    CFStringGetCStringPtr(v37, 0);
    AppleTCONLoggingLogMsg((uint64_t)"%s [error]: %s\n", v38, v39, v40, v41, v42, v43, v44, (char)"AppleTCONUpdaterCreate");
    CFRelease(v37);
    if (a4)
      *a4 = AMSupportSafeRetain();
    AMSupportSafeRelease();
    AMSupportSafeRelease();
    return 0;
  }
  return v11;
}

void sub_22CF03164(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E309A4C](v1, 0x1070C4018F7BE2CLL);
  _Unwind_Resume(a1);
}

void AppleTCONUpdaterDestroy(uint64_t a1)
{
  void *v1;

  if (a1)
  {
    v1 = *(void **)(a1 + 24);
    if (v1)
      free(v1);
  }
}

CFStringRef AppleTCONUpdaterDescribe(CFStringRef result)
{
  CFStringRef v1;
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  if (result)
  {
    v1 = result;
    v2 = CFGetAllocator(result);
    v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, CFSTR("<libAppleTCONUpdater %p [%p]>{}"), v1, v3);
  }
  return result;
}

uint64_t AppleTCONUpdaterExecCommand(uint64_t a1, const __CFString *a2, const __CFDictionary *a3, const __CFDictionary **a4, uint64_t *a5)
{
  AppleTCONUpdateController *v6;
  unsigned int v8;
  const char *v10;
  unsigned int v11;
  uint64_t v12;
  __CFError *CFErrorWithDomain;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (!a1 || !a2)
  {
    v10 = "AppleTCONUpdaterExecCommand - invalid input";
    v11 = 2;
LABEL_8:
    v12 = 0;
    goto LABEL_10;
  }
  v6 = *(AppleTCONUpdateController **)(a1 + 24);
  if (!v6)
  {
    v10 = "AppleTCONUpdaterExecCommand - no AppleTCON controller instance";
    v11 = 16;
    goto LABEL_8;
  }
  v8 = AppleTCONUpdateController::execCommand(v6, a2, a3, a4);
  if (!v8)
    return 1;
  v11 = v8;
  v10 = "AppleTCONUpdaterExecCommand - execCommand error";
  v12 = (uint64_t)a3;
LABEL_10:
  CFErrorWithDomain = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)v10, v11, v12, CFSTR("AppleTCONUpdaterErrorDomain"));
  if (CFErrorWithDomain)
  {
    v14 = CFErrorCopyDescription(CFErrorWithDomain);
    CFStringGetCStringPtr(v14, 0);
    AppleTCONLoggingLogMsg((uint64_t)"%s [error]: %s\n", v15, v16, v17, v18, v19, v20, v21, (char)"AppleTCONUpdaterExecCommand");
    CFRelease(v14);
    if (a5)
      *a5 = AMSupportSafeRetain();
    AMSupportSafeRelease();
  }
  return 0;
}

CFErrorRef AppleTCONUpdaterIsDone(CFErrorRef result, uint64_t *a2)
{
  uint64_t v2;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    v2 = *((_QWORD *)result + 3);
    if (v2)
    {
      return (CFErrorRef)*(unsigned __int8 *)(v2 + 16);
    }
    else
    {
      result = AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"AppleTCONUpdaterIsDone - no controller instance", 0x10u, 0, CFSTR("AppleTCONUpdaterErrorDomain"));
      if (result)
      {
        v4 = CFErrorCopyDescription(result);
        CFStringGetCStringPtr(v4, 0);
        AppleTCONLoggingLogMsg((uint64_t)"%s [error]: %s\n", v5, v6, v7, v8, v9, v10, v11, (char)"AppleTCONUpdaterIsDone");
        CFRelease(v4);
        if (a2)
          *a2 = AMSupportSafeRetain();
        AMSupportSafeRelease();
        return 0;
      }
    }
  }
  return result;
}

CFErrorRef AppleTCONLoggingCreateCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  const __CFAllocator *v7;
  __CFDictionary *Mutable;
  CFStringRef v9;
  CFErrorRef v10;

  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v9 = CFStringCreateWithFormat(v7, 0, CFSTR("%@: %s"), a4, a1);
    if (v9)
    {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBD3A0], v9);
      v10 = CFErrorCreate(v7, a4, a2, Mutable);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v10;
}

const char *AppleTCONLoggingLogMsg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *result;
  char __str[4096];
  uint64_t v11;

  result = (const char *)MEMORY[0x24BDAC7A8]();
  v11 = *MEMORY[0x24BDAC8D0];
  if (logSinkFunc)
  {
    vsnprintf(__str, 0x1000uLL, result, &a9);
    return (const char *)logSinkFunc(logSinkContext, __str);
  }
  return result;
}

const char *AppleTCONLoggingRegisterLogSink(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logSinkFunc = (uint64_t (*)(_QWORD, _QWORD))result;
  logSinkContext = a2;
  if (result)
  {
    if ((AppleTCONPrintVersion(void)::version_displayed & 1) == 0)
    {
      result = AppleTCONLoggingLogMsg((uint64_t)"AppleTCONRestoreLib Version %d.%d\n", a2, a3, a4, a5, a6, a7, a8, 2);
      AppleTCONPrintVersion(void)::version_displayed = 1;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::computeCRC(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  unint64_t v3;
  uint64_t result;

  if (!a3)
    return 255;
  v3 = 0;
  LOBYTE(result) = -1;
  do
  {
    result = AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[a2[v3] ^ AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[a2[v3 + 1] ^ AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[a2[v3 + 2] ^ AppleTCONDP855Device::computeCRC(unsigned char const*,unsigned int)::crc8Table[(a2[v3 + 3] ^ result)]]]];
    v3 += 4;
  }
  while (v3 < a3);
  return result;
}

uint64_t AppleTCONDP855Device::waitForDeviceReady(AppleTCONDP855Device *this)
{
  uint64_t result;

  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t AppleTCONDP855Device::waitForCompletion(AppleTCONDP855Device *this)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = AppleTCONDP855Device::waitForDeviceReady(this);
  if (!(_DWORD)result)
  {
    result = IOAVDisplayMemoryRead();
    if (!(_DWORD)result)
    {
      IOAVDisplayMemoryRead();
      AppleTCONLoggingLogMsg((uint64_t)"Wait Code: 0x%02x 0x%02x", v2, v3, v4, v5, v6, v7, v8, 0);
      return 3758097084;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::getDeviceID(AppleTCONDP855Device *this, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result;

  if (a3 < 6)
    return 3758097090;
  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("device-id"), a2, 6);
  if ((_DWORD)result)
    return IOAVDisplayMemoryRead();
  return result;
}

uint64_t AppleTCONDP855Device::getBundleVer(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result;

  result = AppleTCONDP855Device::getBundleVerFromIOReg(this, a2);
  if ((_DWORD)result)
    return IOAVDisplayMemoryRead();
  return result;
}

uint64_t AppleTCONDP855Device::getBundleVerFromIOReg(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result;
  unsigned __int8 v4[4];

  *(_DWORD *)v4 = 0;
  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("bundle-ver"), v4, 4);
  if (!(_DWORD)result)
    *(_WORD *)a2 = *(_WORD *)v4;
  return result;
}

uint64_t AppleTCONDP855Device::getFirmwareVer(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result;

  result = AppleTCONDP855Device::getFirmwareVerFromIOReg(this, a2);
  if ((_DWORD)result)
    return IOAVDisplayMemoryRead();
  return result;
}

uint64_t AppleTCONDP855Device::getFirmwareVerFromIOReg(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result;
  unsigned __int8 v4[4];

  *(_DWORD *)v4 = 0;
  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("firmware-ver"), v4, 4);
  if (!(_DWORD)result)
    *(_WORD *)a2 = *(_WORD *)v4;
  return result;
}

uint64_t AppleTCONDP855Device::sendDataBuffer(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result;

  if (a3 > 0x10)
    return 3758097090;
  result = IOAVDisplayMemoryWrite();
  if (a3 >= 9 && !(_DWORD)result)
    return IOAVDisplayMemoryWrite();
  return result;
}

uint64_t AppleTCONDP855Device::readDataBuffer(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result;

  if (a3 > 0x10)
    return 3758097090;
  result = IOAVDisplayMemoryRead();
  if (!(_DWORD)result)
  {
    result = IOAVDisplayMemoryRead();
    if (a3 >= 9 && !(_DWORD)result)
      return IOAVDisplayMemoryRead();
  }
  return result;
}

uint64_t AppleTCONDP855Device::submitCmd(AppleTCONDP855Device *this)
{
  uint64_t result;

  usleep(0x1388u);
  result = IOAVDisplayMemoryWrite();
  if (!(_DWORD)result)
  {
    usleep(0x1388u);
    return AppleTCONDP855Device::waitForCompletion(this);
  }
  return result;
}

uint64_t AppleTCONDP855Device::sendCmd(AppleTCONDP855Device *a1, char *a2, const unsigned __int8 *a3, unsigned int a4)
{
  uint64_t result;

  result = AppleTCONDP855Device::waitForDeviceReady(a1);
  if (!(_DWORD)result)
  {
    result = IOAVDisplayMemoryWrite();
    if (!(_DWORD)result)
    {
      if (!a4
        || (*a2 & 0x80000000) == 0
        || (result = AppleTCONDP855Device::sendDataBuffer(a1, a3, a4), !(_DWORD)result))
      {
        result = IOAVDisplayMemoryWrite();
        if (!(_DWORD)result)
        {
          result = AppleTCONDP855Device::submitCmd(a1);
          if (!(_DWORD)result)
          {
            usleep(0x2710u);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::getSDOMStatus(AppleTCONDP855Device *this, BOOL *a2)
{
  uint64_t result;
  unsigned __int8 v5[4];

  *(_DWORD *)v5 = 0;
  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("sdom-status"), v5, 4);
  if ((_DWORD)result)
    return AppleTCONDP855Device::getSDOMStatusFromDevice(this, a2);
  *a2 = v5[0];
  return result;
}

uint64_t AppleTCONDP855Device::getSDOMStatusFromDevice(AppleTCONDP855Device *this, BOOL *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;

  v12 = 69378;
  result = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if (!(_DWORD)result)
  {
    result = IOAVDisplayMemoryRead();
    if (!(_DWORD)result)
    {
      if (*a2 == 32)
        v11 = "OTP_STATUS_PROGRAMMED";
      else
        v11 = "OTP_STATUS_UNPROGRAMMED";
      AppleTCONLoggingLogMsg((uint64_t)"SDOM status %s", v4, v5, v6, v7, v8, v9, v10, (char)v11);
      result = 0;
      *a2 = *a2 == 32;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::getPRODStatus(AppleTCONDP855Device *this, BOOL *a2)
{
  uint64_t result;
  unsigned __int8 v5[4];

  *(_DWORD *)v5 = 0;
  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("prod-status"), v5, 4);
  if ((_DWORD)result)
    return AppleTCONDP855Device::getPRODStatusFromDevice(this, a2);
  *a2 = v5[0];
  return result;
}

uint64_t AppleTCONDP855Device::getPRODStatusFromDevice(AppleTCONDP855Device *this, BOOL *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;

  v12 = 134914;
  result = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if (!(_DWORD)result)
  {
    result = IOAVDisplayMemoryRead();
    if (!(_DWORD)result)
    {
      if (*a2 == 32)
        v11 = "OTP_STATUS_PROGRAMMED";
      else
        v11 = "OTP_STATUS_UNPROGRAMMED";
      AppleTCONLoggingLogMsg((uint64_t)"PROD status %s", v4, v5, v6, v7, v8, v9, v10, (char)v11);
      result = 0;
      *a2 = *a2 == 32;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::setSdom(AppleTCONDP855Device *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;

  v12 = 1118083;
  v1 = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if ((_DWORD)v1)
  {
    v9 = v1;
  }
  else
  {
    v10 = IOAVDisplayMemoryRead();
    if ((_DWORD)v10)
    {
      v9 = v10;
    }
    else
    {
      AppleTCONLoggingLogMsg((uint64_t)"setSdom: update (getDeviceStatus) error:0x%x", v2, v3, v4, v5, v6, v7, v8, 0);
      v9 = 3758097098;
    }
  }
  AppleTCONLoggingLogMsg((uint64_t)"setSdom: update failed:0x%x phase:%d", v2, v3, v4, v5, v6, v7, v8, v9);
  return v9;
}

uint64_t AppleTCONDP855Device::setProd(AppleTCONDP855Device *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;

  v12 = 1183619;
  v1 = AppleTCONDP855Device::sendCmd(this, (char *)&v12, 0, 0);
  if ((_DWORD)v1)
  {
    v9 = v1;
  }
  else
  {
    v10 = IOAVDisplayMemoryRead();
    if ((_DWORD)v10)
    {
      v9 = v10;
    }
    else
    {
      AppleTCONLoggingLogMsg((uint64_t)"setProd: update (getDeviceStatus) error:0x%x", v2, v3, v4, v5, v6, v7, v8, 0);
      v9 = 3758097098;
    }
  }
  AppleTCONLoggingLogMsg((uint64_t)"setProd: update failed:0x%x phase:%d", v2, v3, v4, v5, v6, v7, v8, v9);
  return v9;
}

uint64_t AppleTCONDP855Device::getECID(AppleTCONDP855Device *this, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result;

  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("ecid"), a2, a3);
  if ((_DWORD)result)
    return AppleTCONDP855Device::getECIDFromDevice(this, a2, a3);
  return result;
}

uint64_t AppleTCONDP855Device::getECIDFromDevice(AppleTCONDP855Device *this, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result;
  int v7;

  v7 = 27;
  result = AppleTCONDP855Device::sendCmd(this, (char *)&v7, 0, 0);
  if (!(_DWORD)result)
    return AppleTCONDP855Device::readDataBuffer(this, a2, a3);
  return result;
}

uint64_t AppleTCONDP855Device::displayECID(AppleTCONDP855Device *this, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  _OWORD v15[4];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  memset(v15, 0, sizeof(v15));
  if (a3)
  {
    v8 = a3;
    v9 = a2;
    v10 = 0;
    v11 = 64;
    while (1)
    {
      v12 = snprintf((char *)v15 + v10, v11, "%02x", *v9);
      if (v12 < 0)
        break;
      v13 = __OFSUB__(v11, v12);
      v11 -= v12;
      if ((v11 < 0) ^ v13 | (v11 == 0))
        break;
      ++v9;
      v10 += v12;
      if (!--v8)
        goto LABEL_6;
    }
    AppleTCONLoggingLogMsg((uint64_t)"displayECID: Avoid buffer overflow %d\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v12);
    return 3758097084;
  }
  else
  {
LABEL_6:
    AppleTCONLoggingLogMsg((uint64_t)"AppleTconDev:ECID: 0x%s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)v15);
    return 0;
  }
}

uint64_t AppleTCONDP855Device::getNonce(AppleTCONDP855Device *this, unsigned __int8 *a2, int a3)
{
  uint64_t result;

  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("nonce"), a2, a3);
  if ((_DWORD)result)
    return AppleTCONDP855Device::getNonceFromDevice(this, a2, a3);
  return result;
}

uint64_t AppleTCONDP855Device::getNonceFromDevice(AppleTCONDP855Device *this, unsigned __int8 *a2, int a3)
{
  uint64_t result;
  int v7;

  v7 = 29;
  result = AppleTCONDP855Device::sendCmd(this, (char *)&v7, 0, 0);
  if (!(_DWORD)result)
    return AppleTCONDP855Device::readMultiPacketData(this, a2, a3);
  return result;
}

uint64_t AppleTCONDP855Device::readMultiPacketData(AppleTCONDP855Device *this, const unsigned __int8 *a2, int a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int i;

  if (a3)
  {
    result = IOAVDisplayMemoryRead();
    if ((_DWORD)result)
      return result;
    for (i = 0; i < 0x61A81; i += 100)
    {
      usleep(0x64u);
      result = IOAVDisplayMemoryRead();
      if ((_DWORD)result)
        return result;
    }
    AppleTCONLoggingLogMsg((uint64_t)"Timeout Error: out status : %x", v5, v6, v7, v8, v9, v10, v11, 0);
  }
  return AppleTCONDP855Device::waitForCompletion(this);
}

uint64_t AppleTCONDP855Device::getProdFuseValue(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result;
  unsigned __int8 v5[4];

  *(_DWORD *)v5 = 0;
  result = AppleTCONDevice::getIORegPropertyValue(this, CFSTR("prod-fuse-value"), v5, 4);
  if ((_DWORD)result)
    return AppleTCONDP855Device::getProdFuseValueFromDevice(this, a2);
  *a2 = v5[0];
  return result;
}

uint64_t AppleTCONDP855Device::getProdFuseValueFromDevice(AppleTCONDP855Device *this, unsigned __int8 *a2)
{
  uint64_t result;

  result = IOAVDisplayMemoryRead();
  *a2 = 0;
  return result;
}

uint64_t AppleTCONDP855Device::writeMultiPacketData(AppleTCONDP855Device *this, const unsigned __int8 *a2, unsigned int a3)
{
  unsigned int v4;
  uint64_t result;
  unsigned int v7;

  if (!a3)
    return AppleTCONDP855Device::waitForCompletion(this);
  v4 = a3;
  while (1)
  {
    result = AppleTCONDP855Device::waitForDeviceReady(this);
    if ((_DWORD)result)
      break;
    v7 = v4 >= 0x10 ? 16 : v4;
    result = AppleTCONDP855Device::sendDataBuffer(this, a2, v7);
    if ((_DWORD)result)
      break;
    result = IOAVDisplayMemoryWrite();
    if (!(_DWORD)result)
    {
      a2 += v7;
      v4 -= v7;
      if (v4)
        continue;
    }
    if ((_DWORD)result)
      return result;
    return AppleTCONDP855Device::waitForCompletion(this);
  }
  return result;
}

uint64_t AppleTCONDP855Device::downloadComponentBlock(AppleTCONDP855Device *a1, int a2, char a3, char a4, unsigned __int8 *a5, unsigned int a6)
{
  char v9;
  uint64_t result;
  int v11;

  v11 = 0;
  if (a2)
  {
    v9 = -104;
  }
  else
  {
    BYTE2(v11) = a3;
    v9 = -102;
  }
  LOBYTE(v11) = v9;
  BYTE1(v11) = a4;
  HIBYTE(v11) = AppleTCONDP855Device::computeCRC(a1, a5, a6);
  result = AppleTCONDP855Device::sendCmd(a1, (char *)&v11, 0, 0);
  if (!(_DWORD)result)
  {
    result = AppleTCONDP855Device::writeMultiPacketData(a1, a5, a6);
    if (!(_DWORD)result)
    {
      LODWORD(result) = IOAVDisplayMemoryRead();
      if ((_DWORD)result)
        return result;
      else
        return 3758097084;
    }
  }
  return result;
}

uint64_t AppleTCONDP855Device::downloadComponentImage(AppleTCONDP855Device *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  char v10;
  int v11;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  char v37;

  v8 = a5;
  v10 = a3;
  v11 = a2;
  v13 = a5 + 4095;
  v14 = (a5 + 4095) >> 12;
  AppleTCONLoggingLogMsg((uint64_t)"Download comp:0x%04x NumBlocks:%d", a2, a3, a4, a5, a6, a7, a8, a3);
  if (v13 < 0x1000)
    return 0;
  v15 = 0;
  v16 = 0;
  if (v14 <= 1)
    v17 = 1;
  else
    v17 = v14;
  while (1)
  {
    v18 = v8 >= 0x1000 ? 4096 : v8;
    v19 = AppleTCONDP855Device::downloadComponentBlock(a1, v11, v10, v15, (unsigned __int8 *)(a4 + v16), v18);
    if ((_DWORD)v19)
      break;
    v16 += v18;
    v8 -= v18;
    if (v17 == ++v15)
      return 0;
  }
  v27 = v19;
  AppleTCONLoggingLogMsg((uint64_t)"Component Download Failed:Block:%d:length:%d!", v20, v21, v22, v23, v24, v25, v26, v15);
  if (IOAVDisplayMemoryRead())
  {
    v35 = "Could not read error code";
  }
  else
  {
    v37 = 0;
    v35 = "Error code 0x%02x!";
  }
  AppleTCONLoggingLogMsg((uint64_t)v35, v28, v29, v30, v31, v32, v33, v34, v37);
  return v27;
}

uint64_t AppleTCONDP855Device::getLifeCycle(AppleTCONDP855Device *this, const __CFDictionary *a2, unsigned int *a3)
{
  const void *ValueForKeyPathInDict;
  CFTypeID v5;
  const char *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Options.LifeCycle")))
  {
    v6 = "memory alloc failed";
    v7 = 3;
LABEL_11:
    AMSupportSafeRelease();
    AppleTCONLoggingLogMsg((uint64_t)"getLifeCycle %s", v9, v10, v11, v12, v13, v14, v15, (char)v6);
    return v7;
  }
  ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
  if (ValueForKeyPathInDict)
  {
    v5 = CFGetTypeID(ValueForKeyPathInDict);
    if (v5 == CFNumberGetTypeID())
    {
      if (AMSupportGetUInt32())
      {
        v6 = "conversion error";
        v7 = 11;
      }
      else
      {
        v6 = "out of range";
        v7 = 2;
      }
    }
    else
    {
      v6 = "invalid type";
      v7 = 17;
    }
    goto LABEL_11;
  }
  *a3 = 15;
  AMSupportSafeRelease();
  return 0;
}

const __CFBoolean *AppleTCONDP855Device::getOptionsValue(AppleTCONDP855Device *this, const __CFDictionary *a2, const __CFString *a3)
{
  CFStringRef v3;
  CFStringRef v4;
  const __CFBoolean *ValueForKeyPathInDict;
  const __CFBoolean *Value;
  CFTypeID v7;

  v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Options.%@"), a3);
  if (!v3)
    return 0;
  v4 = v3;
  ValueForKeyPathInDict = (const __CFBoolean *)AMSupportGetValueForKeyPathInDict();
  Value = ValueForKeyPathInDict;
  if (ValueForKeyPathInDict)
  {
    v7 = CFGetTypeID(ValueForKeyPathInDict);
    if (v7 == CFBooleanGetTypeID())
      Value = (const __CFBoolean *)CFBooleanGetValue(Value);
    else
      Value = 0;
  }
  CFRelease(v4);
  return Value;
}

uint64_t AppleTCONDP855Device::isOTPUpdateRequired(AppleTCONDP855Device *this, const __CFDictionary *a2)
{
  unsigned int OptionsValue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  OptionsValue = AppleTCONDP855Device::getOptionsValue(this, a2, CFSTR("FuseSDOM"));
  v11 = *((unsigned __int8 *)this + 8);
  if (OptionsValue)
    v12 = v11 == 0;
  else
    v12 = 0;
  v13 = v12;
  AppleTCONLoggingLogMsg((uint64_t)"Fuse SDOM (%d:%d)", v4, v5, v6, v7, v8, v9, v10, v11);
  return v13;
}

uint64_t AppleTCONDP855Device::updateOTP(AppleTCONDP855Device *this, const __CFDictionary *a2)
{
  unsigned int OptionsValue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t result;

  OptionsValue = AppleTCONDP855Device::getOptionsValue(this, a2, CFSTR("FusePROD"));
  AppleTCONLoggingLogMsg((uint64_t)"Fuse Prod (%d:%d)", v4, v5, v6, v7, v8, v9, v10, *((_BYTE *)this + 9));
  if (OptionsValue)
    v11 = *((_BYTE *)this + 9) == 0;
  else
    v11 = 0;
  if (!v11)
    return AppleTCONDP855Device::setSdom(this);
  result = AppleTCONDP855Device::setProd(this);
  if (!(_DWORD)result)
    return AppleTCONDP855Device::setSdom(this);
  return result;
}

void AppleTCONDP855Device::AppleTCONDP855Device(AppleTCONDP855Device *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  BOOL v18;
  unsigned __int8 v19;
  char v20;
  unsigned __int8 v21[2];
  unsigned __int8 v22;

  *(_QWORD *)this = &off_24F7EABA0;
  v22 = 0;
  *(_WORD *)v21 = 0;
  *((_DWORD *)this + 2) = 257;
  *((_DWORD *)this + 6) = a2;
  if (!(_DWORD)a2)
    AppleTCONLoggingLogMsg((uint64_t)"Failed to getIORegRootNode. Will Attempt fallback.", a2, a3, a4, a5, a6, a7, a8, v20);
  v9 = IOAVDisplayMemoryCreateWithName();
  *((_QWORD *)this + 2) = v9;
  if (v9)
  {
    if (AppleTCONDP855Device::getPRODStatus(this, (BOOL *)&v22))
    {
      v17 = "Failed to get Prod status";
    }
    else
    {
      v18 = v22 == 1;
      *((_BYTE *)this + 9) = v18;
      if (v18)
      {
        if (AppleTCONDP855Device::getProdFuseValue(this, &v22))
        {
          v17 = "Failed to get Prod value";
          goto LABEL_18;
        }
        v19 = v22;
      }
      else
      {
        v19 = 0;
      }
      *((_BYTE *)this + 30) = v19;
      if (AppleTCONDP855Device::getSDOMStatus(this, (BOOL *)&v22))
      {
        v17 = "Failed to get SDOM status";
      }
      else
      {
        *((_BYTE *)this + 8) = v22 == 1;
        if (AppleTCONDP855Device::getBundleVer(this, v21))
        {
          v17 = "Failed to get bundle version";
        }
        else
        {
          *((_WORD *)this + 14) = *(_WORD *)v21;
          if (!AppleTCONDP855Device::getFirmwareVer(this, v21))
          {
            *((_BYTE *)this + 11) = __rev16(*(unsigned __int16 *)v21) > 0x10B;
            goto LABEL_19;
          }
          v17 = "Failed to get Firmware version";
        }
      }
    }
  }
  else
  {
    v17 = "Failed to get memoryRef handle";
  }
LABEL_18:
  AppleTCONLoggingLogMsg((uint64_t)v17, v10, v11, v12, v13, v14, v15, v16, v20);
LABEL_19:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTconDev(v2):(%d:%d:%d:%d:0x%02x:0x%02x(0x%04x))", v10, v11, v12, v13, v14, v15, v16, *((_BYTE *)this + 11));
}

void sub_22CF04A2C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = &off_24F7EA970;
  _Unwind_Resume(a1);
}

void AppleTCONDP855Device::~AppleTCONDP855Device(AppleTCONDP855Device *this)
{
  io_object_t v2;

  *(_QWORD *)this = &off_24F7EABA0;
  v2 = *((_DWORD *)this + 6);
  if (v2)
    IOObjectRelease(v2);
  *(_QWORD *)this = &off_24F7EA970;
}

{
  AppleTCONDP855Device::~AppleTCONDP855Device(this);
  JUMPOUT(0x22E309A4CLL);
}

uint64_t AppleTCONDP855Device::eventCmdQueryInfo(AppleTCONDP855Device *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  AppleTCONDP855Device *ECID;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFAllocator *v28;
  CFDataRef v29;
  CFDataRef v30;
  CFDataRef v31;
  CFDataRef v32;
  AppleTCONDP855Device *v33;
  AppleTCONDP855Device *v34;
  uint64_t LifeCycle;
  const char *v37;
  char v38;
  unsigned int v39;
  UInt8 bytes[16];
  __int128 v41;
  UInt8 v42[8];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v42 = 0;
  v43 = 0;
  *(_OWORD *)bytes = 0u;
  v41 = 0u;
  v39 = 0;
  ECID = (AppleTCONDP855Device *)AppleTCONDP855Device::getECID(this, v42, 0x10u);
  v12 = (int)ECID;
  if (!(_DWORD)ECID)
    ECID = (AppleTCONDP855Device *)AppleTCONDP855Device::displayECID(ECID, v42, 16, v7, v8, v9, v10, v11);
  if (!*((_BYTE *)this + 8) && !AppleTCONDP855Device::getOptionsValue(ECID, a2, CFSTR("FuseSDOM")))
  {
    AppleTCONLoggingLogMsg((uint64_t)"Dev:CmdQueryInfo SDOM not fused. No Fusing option. Bailing.", v13, v14, v15, v16, v17, v18, v19, v38);
    v27 = 0;
    *((_BYTE *)this + 10) = 1;
    return v27;
  }
  if (*((_BYTE *)this + 11))
  {
    if (AppleTCONDP855Device::getNonce(this, bytes, 32))
    {
      v37 = "getNonce failed";
    }
    else
    {
      v27 = 3758097085;
      v28 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v29 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 32);
      if (!v29)
      {
        v37 = "nonce alloc failed";
        goto LABEL_22;
      }
      v30 = v29;
      CFDictionaryAddValue(a3, CFSTR("Baobab,UpdateNonce"), v29);
      CFRelease(v30);
      if (!v12)
      {
        v31 = CFDataCreate(v28, v42, 16);
        if (v31)
        {
          v32 = v31;
          CFDictionaryAddValue(a3, CFSTR("Baobab,ECID"), v31);
          CFRelease(v32);
          AppleTCONDP855Device::getOptionsValue(v33, a2, CFSTR("FusePROD"));
          AMSupportCFDictionarySetBoolean();
          v34 = (AppleTCONDP855Device *)AMSupportCFDictionarySetInteger32();
          LifeCycle = AppleTCONDP855Device::getLifeCycle(v34, a2, &v39);
          v27 = LifeCycle;
          if (!(_DWORD)LifeCycle)
          {
            AMSupportCFDictionarySetInteger32();
            return v27;
          }
          v37 = "getLifeCycle failed";
        }
        else
        {
          v37 = "ecid alloc failed";
        }
LABEL_22:
        AppleTCONLoggingLogMsg((uint64_t)"Dev:CmdQueryInfo failure %s", v20, v21, v22, v23, v24, v25, v26, (char)v37);
        return v27;
      }
      v37 = "getECID failed";
    }
    v27 = 15;
    goto LABEL_22;
  }
  return 0;
}

uint64_t AppleTCONDP855Device::isFWComponentsUpdateRequired(AppleTCONDP855Device *this, const __CFDictionary *a2, CFDictionaryRef theDict, unsigned __int8 *a4)
{
  const __CFData *Value;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  CFTypeID v16;
  const __CFAllocator *v17;
  CFPropertyListRef v18;
  CFTypeID v19;
  const __CFNumber *ValueForKeyPathInDict;
  const __CFNumber *v21;
  CFTypeID v22;
  AppleTCONDP855Device *v23;
  AppleTCONDP855Device *OptionsValue;
  int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v43;
  __int16 valuePtr;

  valuePtr = 0;
  Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("FirmwareData"));
  v15 = Value;
  if (!Value || (v16 = CFGetTypeID(Value), v16 != CFDataGetTypeID()))
  {
    v43 = "firmware data type invalid ";
    goto LABEL_19;
  }
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v18 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v15, 0, 0, 0);
  if (!v18 || (v19 = CFGetTypeID(v18), v19 != CFDictionaryGetTypeID()))
  {
    v43 = "fw dict create failed";
LABEL_19:
    AppleTCONLoggingLogMsg((uint64_t)"FW component update :%s", v8, v9, v10, v11, v12, v13, v14, (char)v43);
    v41 = 0;
    goto LABEL_13;
  }
  if (!CFStringCreateWithFormat(v17, 0, CFSTR("1.%s.%s.%s.%s"), "device_id", a4, "NVM_IMAGE", "Version"))
  {
    v43 = "nvm ver string create failed";
    goto LABEL_19;
  }
  ValueForKeyPathInDict = (const __CFNumber *)AMSupportGetValueForKeyPathInDict();
  if (!ValueForKeyPathInDict
    || (v21 = ValueForKeyPathInDict, v22 = CFGetTypeID(ValueForKeyPathInDict), v22 != CFNumberGetTypeID()))
  {
    v43 = "bundle version type invalid";
    goto LABEL_19;
  }
  v23 = (AppleTCONDP855Device *)CFNumberGetValue(v21, kCFNumberSInt16Type, &valuePtr);
  if (!(_DWORD)v23)
  {
    v43 = "bundle ver: num: invalid";
    goto LABEL_19;
  }
  OptionsValue = AppleTCONDP855Device::getOptionsValue(v23, a2, CFSTR("RestoreInternal"));
  v25 = (int)OptionsValue;
  v26 = AppleTCONDP855Device::getOptionsValue(OptionsValue, a2, CFSTR("SkipSameVersion"));
  AppleTCONLoggingLogMsg((uint64_t)"FW Update Options I:%d S:%d", v27, v28, v29, v30, v31, v32, v33, v25);
  if (__PAIR64__(*((unsigned __int8 *)this + 29), *((unsigned __int8 *)this + 28)) != __PAIR64__(valuePtr, HIBYTE(valuePtr))|| (v41 = 0, v25) && !v26)
  {
    AppleTCONLoggingLogMsg((uint64_t)"Update to 0x%02x:0x%02x", v34, v35, v36, v37, v38, v39, v40, SHIBYTE(valuePtr));
    v41 = 1;
  }
LABEL_13:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v41;
}

uint64_t AppleTCONDP855Device::updateFWComponents(AppleTCONDP855Device *this, const __CFDictionary *a2, unsigned __int8 *a3)
{
  uint64_t v4;
  const __CFAllocator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFData *v13;
  const __CFData *Value;
  const __CFData *v15;
  CFTypeID v16;
  CFPropertyListRef v17;
  CFTypeID v18;
  const __CFData *v19;
  const __CFData *v20;
  size_t v21;
  UInt8 *v22;
  UInt8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFData *v28;
  const __CFData *v29;
  CFIndex Length;
  uint64_t v31;
  CFIndex v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v37;
  CFRange v40;
  CFRange v41;
  CFRange v42;

  v4 = 3758097088;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  AMSupportGetValueForKeyPathInDict();
  v13 = (const __CFData *)AMSupportSafeRetain();
  if (!v13)
  {
    v37 = "ticket missing";
    goto LABEL_26;
  }
  Value = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("FirmwareData"));
  if (!Value || (v15 = Value, v16 = CFGetTypeID(Value), v16 != CFDataGetTypeID()))
  {
    v37 = "firmware missing";
    goto LABEL_26;
  }
  v17 = CFPropertyListCreateWithData(v5, v15, 0, 0, 0);
  if (!v17 || (v18 = CFGetTypeID(v17), v18 != CFDictionaryGetTypeID()))
  {
    v37 = "firmware dict: create failed";
    goto LABEL_26;
  }
  if (!CFStringCreateWithFormat(v5, 0, CFSTR("1.firmware.Payload")))
  {
    v37 = "comp: key create failed";
    goto LABEL_26;
  }
  AMSupportGetValueForKeyPathInDict();
  v19 = (const __CFData *)AMSupportSafeRetain();
  v20 = v19;
  if (!v19)
  {
    v37 = "comp: data missing";
    goto LABEL_26;
  }
  v21 = CFDataGetLength(v19) + 4096;
  v22 = (UInt8 *)malloc_type_malloc(v21, 0x3249B97uLL);
  v23 = v22;
  if (!v22)
  {
    v4 = 3;
    v37 = "alloc: failed";
    goto LABEL_26;
  }
  memset(v22, 255, v21);
  v40.length = CFDataGetLength(v13);
  v40.location = 0;
  CFDataGetBytes(v13, v40, v23);
  v41.length = CFDataGetLength(v20);
  v41.location = 0;
  CFDataGetBytes(v20, v41, v23 + 4096);
  if (AppleTCONDP855Device::downloadComponentImage(this, 1, 0, (uint64_t)v23, v21, v24, v25, v26))
  {
    v4 = 11;
    v37 = "download fw failed";
    goto LABEL_26;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  v27 = 0;
  while (1)
  {
    if (!CFStringCreateWithFormat(v5, 0, CFSTR("1.%s.%s.%s.%s"), "device_id", a3, *(_QWORD *)((char *)&componentHdrmap + v27 + 8), "Payload"))
    {
      v4 = 0;
      v37 = "comp: string create failed";
      goto LABEL_26;
    }
    AMSupportGetValueForKeyPathInDict();
    v28 = (const __CFData *)AMSupportSafeRetain();
    if (!v28)
      goto LABEL_20;
    v29 = v28;
    Length = CFDataGetLength(v28);
    v31 = Length;
    if (v21 >= Length)
    {
      v32 = Length;
      goto LABEL_18;
    }
    free(v23);
    v32 = v31;
    v23 = (UInt8 *)malloc_type_calloc(1uLL, v31, 0x1E405118uLL);
    if (!v23)
      break;
    LODWORD(v21) = v31;
LABEL_18:
    v42.location = 0;
    v42.length = v32;
    CFDataGetBytes(v29, v42, v23);
    if (AppleTCONDP855Device::downloadComponentImage(this, 0, *(unsigned int *)((char *)&componentHdrmap + v27), (uint64_t)v23, v31, v33, v34, v35))
    {
      v4 = 11;
      v37 = "download comp: failed";
      goto LABEL_26;
    }
    AMSupportSafeRelease();
LABEL_20:
    AMSupportSafeRelease();
    v27 += 16;
    if (v27 == 176)
    {
      v4 = 0;
      goto LABEL_22;
    }
  }
  v4 = 3;
  v37 = "re alloc failed";
LABEL_26:
  AppleTCONLoggingLogMsg((uint64_t)"update fw error:%s", v6, v7, v8, v9, v10, v11, v12, (char)v37);
LABEL_22:
  AMSupportSafeFree();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v4;
}

uint64_t AppleTCONDP855Device::eventCmdPerformNextStage(AppleTCONDP855Device *this, const __CFDictionary *a2, const __CFDictionary *a3, unsigned __int8 *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int isFWComponentsUpdateRequired;
  char v16;
  uint64_t v17;
  const char *v19;
  char v20;
  unsigned __int8 v21[8];
  int v22;

  *(_DWORD *)&v21[3] = 0;
  *(_DWORD *)v21 = 0;
  if (AppleTCONDP855Device::getDeviceID(this, v21, 7u))
  {
    v19 = "get dev:id failed";
LABEL_20:
    *((_BYTE *)this + 10) = 1;
    *a4 = 1;
    AppleTCONLoggingLogMsg((uint64_t)"Dev:next stage failure %s", v8, v9, v10, v11, v12, v13, v14, (char)v19);
    v17 = 11;
    goto LABEL_13;
  }
  AppleTCONLoggingLogMsg((uint64_t)"Dev:deviceid %s", v8, v9, v10, v11, v12, v13, v14, (char)v21);
  isFWComponentsUpdateRequired = AppleTCONDP855Device::isFWComponentsUpdateRequired(this, a2, a3, v21);
  if (*((_BYTE *)this + 10) || !isFWComponentsUpdateRequired)
    goto LABEL_12;
  v22 = 156;
  if (AppleTCONDP855Device::sendCmd(this, (char *)&v22, v21, 6u))
  {
    v19 = "submit dev:id failed";
    goto LABEL_20;
  }
  v22 = 151;
  if (AppleTCONDP855Device::sendCmd(this, (char *)&v22, 0, 0))
  {
    v19 = "start update failed";
    goto LABEL_20;
  }
  if (AppleTCONDP855Device::updateFWComponents(this, a3, v21))
  {
    v19 = "updates failed";
    goto LABEL_20;
  }
  if (AppleTCONDP855Device::isOTPUpdateRequired(this, a2))
  {
    if (AppleTCONDP855Device::updateOTP(this, a2))
    {
      v19 = "otp update failed";
      goto LABEL_20;
    }
    v16 = 1;
  }
  else
  {
    v16 = 2;
  }
  v22 = 153;
  BYTE1(v22) = v16;
  AppleTCONLoggingLogMsg((uint64_t)"Reset option %d", v8, v9, v10, v11, v12, v13, v14, v16);
  if (AppleTCONDP855Device::sendCmd(this, (char *)&v22, 0, 0))
  {
    v19 = "end update failed";
    goto LABEL_20;
  }
LABEL_12:
  v17 = 0;
  *((_BYTE *)this + 10) = 1;
  *a4 = 1;
LABEL_13:
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONDP855Device::eventCmdPerformNextStage: Finished Personalization", v8, v9, v10, v11, v12, v13, v14, v20);
  return v17;
}

__CFString *AppleTCONDP835DeviceRestoreTagForBoardID(int a1, int a2)
{
  int v2;
  __CFString **v3;
  __CFString **v4;
  __CFString **v6;

  if (a2 == 2)
  {
    v2 = 0;
  }
  else
  {
    if (a2 != 3)
      return 0;
    v2 = 1;
  }
  switch(a1)
  {
    case 0:
      v3 = kAppleTCONCommonTagRequestTicket;
      v4 = kAppleTCON2CommonTagRequestTicket;
      break;
    case 1:
      v3 = kAppleTCONCommonTagResponseTicket;
      v4 = kAppleTCON2CommonTagResponseTicket;
      break;
    case 2:
      v3 = kAppleTCONCommonTagDeviceChipID;
      v4 = kAppleTCON2CommonTagDeviceChipID;
      break;
    case 3:
      v3 = kAppleTCONCommonTagDeviceBoardID;
      v4 = kAppleTCON2CommonTagDeviceBoardID;
      break;
    case 4:
      v3 = kAppleTCONCommonTagManifestEpoch;
      v4 = kAppleTCON2CommonTagManifestEpoch;
      break;
    case 5:
      v3 = kAppleTCONCommonTagDeviceProductionMode;
      v4 = kAppleTCON2CommonTagDeviceProductionMode;
      break;
    case 6:
      v3 = kAppleTCONCommonTagDeviceProv;
      v4 = kAppleTCON2CommonTagDeviceProv;
      break;
    case 7:
      v3 = kAppleTCONCommonTagDeviceSDOM;
      v4 = kAppleTCON2CommonTagDeviceSDOM;
      break;
    case 8:
      v3 = kAppleTCONCommonTagDeviceNonce;
      v4 = kAppleTCON2CommonTagDeviceNonce;
      break;
    case 9:
      v3 = kAppleTCONCommonTagDeviceUpdateNonce;
      v4 = kAppleTCON2CommonTagDeviceUpdateNonce;
      break;
    case 10:
      v3 = kAppleTCONCommonTagDeviceECID;
      v4 = kAppleTCON2CommonTagDeviceECID;
      break;
    case 11:
      v3 = kAppleTCONCommonTagDeviceInvariantFirmware;
      v4 = kAppleTCON2CommonTagDeviceInvariantFirmware;
      break;
    case 12:
      v3 = kAppleTCONCommonTagDeviceBacklightControllerFirmware;
      v4 = kAppleTCON2CommonTagDeviceBacklightControllerFirmware;
      break;
    case 13:
      v3 = kAppleTCONCommonTagDeviceCabalFirmware;
      v4 = kAppleTCON2CommonTagDeviceCabalFirmware;
      break;
    case 14:
      v3 = kAppleTCONCommonTagDeviceTrinityFirmware;
      v4 = kAppleTCON2CommonTagDeviceTrinityFirmware;
      break;
    default:
      return 0;
  }
  if (v2)
    v6 = v4;
  else
    v6 = v3;
  return *v6;
}

AppleTCONDP855Device *AppleTCONUpdateController::AppleTCONUpdateControllerGetDevice(AppleTCONUpdateController *this)
{
  mach_port_t v1;
  io_registry_entry_t v2;
  io_object_t v3;
  const __CFAllocator *v4;
  CFTypeRef CFProperty;
  CFTypeID v6;
  CFIndex Length;
  CFIndex v8;
  size_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  io_registry_entry_t v19;
  unsigned int v20;
  const __CFData *v21;
  const __CFData *v22;
  CFTypeID v23;
  AppleTCONDP855Device *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  UInt8 buffer[4];
  CFRange v35;
  CFRange v36;

  *(_DWORD *)buffer = 2133;
  v1 = *MEMORY[0x24BDD8B18];
  v2 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/product");
  if (v2)
  {
    v3 = v2;
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = IORegistryEntryCreateCFProperty(v2, CFSTR("tcon-path"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    IOObjectRelease(v3);
    if (CFProperty)
    {
      v6 = CFGetTypeID(CFProperty);
      if (v6 == CFDataGetTypeID())
      {
        Length = CFDataGetLength((CFDataRef)CFProperty);
        if (Length)
        {
          v8 = Length;
          v9 = Length + 14;
          v10 = (char *)malloc_type_malloc(Length + 14, 0x9E1EE67CuLL);
          v11 = v10;
          if (v10)
          {
            if (snprintf(v10, v9, "%s", "IODeviceTree:/") == 14)
            {
              v35.length = CFDataGetLength((CFDataRef)CFProperty);
              v35.location = 0;
              CFDataGetBytes((CFDataRef)CFProperty, v35, (UInt8 *)v11 + 14);
              v11[v8 + 13] = 0;
              AppleTCONLoggingLogMsg((uint64_t)"Looking for entry under %s\n", v12, v13, v14, v15, v16, v17, v18, (char)v11);
              v19 = IORegistryEntryFromPath(v1, v11);
              if (v19)
              {
                v20 = v19;
                v21 = (const __CFData *)IORegistryEntryCreateCFProperty(v19, CFSTR("chipid"), v4, 0);
                v22 = v21;
                if (!v21
                  || (v23 = CFGetTypeID(v21), v23 != CFDataGetTypeID())
                  || CFDataGetLength(v22) != 4
                  || (v36.location = 0, v36.length = 4, CFDataGetBytes(v22, v36, buffer), *(_DWORD *)buffer == 2133))
                {
                  v24 = (AppleTCONDP855Device *)operator new();
                  AppleTCONDP855Device::AppleTCONDP855Device(v24, v20);
                  goto LABEL_15;
                }
                if (*(_DWORD *)buffer == 2101)
                {
                  v24 = (AppleTCONDP855Device *)operator new();
                  AppleTCONDP835Device::AppleTCONDP835Device(v24, v20);
LABEL_15:
                  LOBYTE(v25) = 0;
                  goto LABEL_16;
                }
                LOBYTE(v25) = 0;
                v24 = 0;
              }
              else
              {
                v24 = 0;
                v25 = "tcon device not found";
              }
            }
            else
            {
              v24 = 0;
              v25 = "overflow";
            }
          }
          else
          {
            v24 = 0;
            v25 = "Unable to allocate memory";
          }
        }
        else
        {
          v24 = 0;
          v25 = "Invalid string";
        }
      }
      else
      {
        v24 = 0;
        v25 = "product path type mismatch";
      }
    }
    else
    {
      v24 = 0;
      v25 = "product path not found";
    }
  }
  else
  {
    v24 = 0;
    v25 = "product not found";
  }
LABEL_16:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeFree();
  if (!v24)
    AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateControllerGetDevice failed: %s", v26, v27, v28, v29, v30, v31, v32, (char)v25);
  return v24;
}

void sub_22CF05940(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E309A4C](v1, 0x10A1C408295CFC3);
  _Unwind_Resume(a1);
}

void AppleTCONUpdateController::AppleTCONUpdateController(AppleTCONUpdateController *this)
{
  AppleTCONDP855Device *Device;
  int v3;

  *((_QWORD *)this + 3) = 0;
  Device = AppleTCONUpdateController::AppleTCONUpdateControllerGetDevice(this);
  *((_QWORD *)this + 1) = Device;
  if (Device)
    v3 = *((unsigned __int8 *)Device + 11);
  else
    v3 = 0;
  *((_BYTE *)this + 17) = v3;
  *((_BYTE *)this + 16) = v3 == 0;
}

uint64_t AppleTCONUpdateController::start(AppleTCONUpdateController *this, const __CFDictionary *a2, __CFError **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFDictionary *v11;
  const void *Value;
  CFTypeID v13;

  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::start: Dev = (%p) - updateSupported = %d", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, *((_QWORD *)this + 1));
  if (*((_QWORD *)this + 1))
  {
    if (!a2)
      return 0;
    v11 = (const __CFDictionary *)AMSupportSafeRetain();
    *((_QWORD *)this + 3) = v11;
    Value = CFDictionaryGetValue(v11, CFSTR("Options"));
    if (Value)
    {
      v13 = CFGetTypeID(Value);
      if (v13 == CFDictionaryGetTypeID())
        return 0;
    }
  }
  if (AppleTCONLoggingCreateCFErrorWithDomain((uint64_t)"RestoreOptions not a dict?", 2u, (uint64_t)a2, CFSTR("AppleTCONUpdaterErrorDomain")))
  {
    if (a3)
      *a3 = (__CFError *)AMSupportSafeRetain();
    AMSupportSafeRelease();
  }
  return 19;
}

uint64_t AppleTCONUpdateController::execCmdQueryInfo(AppleTCONUpdateController *this, const __CFDictionary *a2, const __CFDictionary **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFMutableDictionaryRef Mutable;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFMutableDictionaryRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v37;
  char v38;

  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: Begin Personalization", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v37);
  if (a3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v26 = Mutable;
      if (a2)
      {
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: Input", v19, v20, v21, v22, v23, v24, v25, v38);
        AMSupportSafeRelease();
        v27 = AMSupportSafeRetain();
        *((_QWORD *)this + 3) = v27;
      }
      else
      {
        v27 = *((_QWORD *)this + 3);
      }
      v28 = (*(uint64_t (**)(_QWORD, uint64_t, CFMutableDictionaryRef))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), v27, v26);
      if ((_DWORD)v28)
      {
        CFRelease(v26);
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: device failure %d", v29, v30, v31, v32, v33, v34, v35, v28);
      }
      else
      {
        *a3 = v26;
      }
    }
    else
    {
      AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: create output dict: failed", v19, v20, v21, v22, v23, v24, v25, v38);
      return 3;
    }
  }
  else
  {
    AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCmdQueryInfo: Output param missing", v11, v12, v13, v14, v15, v16, v17, v38);
    return 2;
  }
  return v28;
}

uint64_t AppleTCONUpdateController::execPerformNextStage(AppleTCONUpdateController *this, const __CFDictionary *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (*(uint64_t (**)(_QWORD, _QWORD, const __CFDictionary *, char *))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), *((_QWORD *)this + 3), a2, (char *)this + 16);
  v10 = v2;
  if ((_DWORD)v2)
    AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: device failure %d", v3, v4, v5, v6, v7, v8, v9, v2);
  return v10;
}

uint64_t AppleTCONUpdateController::execCommand(AppleTCONUpdateController *this, CFStringRef theString, const __CFDictionary *a3, const __CFDictionary **a4)
{
  char CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t Stage;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (!theString)
    return 2;
  CStringPtr = CFStringGetCStringPtr(theString, 0);
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: Entering execCommand: command = %s", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
  v16 = 0;
  if (!*((_BYTE *)this + 16))
  {
    if (CFStringCompare(theString, CFSTR("queryInfo"), 0))
    {
      if (CFStringCompare(theString, CFSTR("performNextStage"), 0))
      {
        v22 = CFStringGetCStringPtr(theString, 0);
        AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: Unsupported command: %s", v23, v24, v25, v26, v27, v28, v29, v22);
        v16 = 2;
        goto LABEL_9;
      }
      Stage = AppleTCONUpdateController::execPerformNextStage(this, a3);
    }
    else
    {
      Stage = AppleTCONUpdateController::execCmdQueryInfo(this, a3, a4, v17, v18, v19, v20, v21);
    }
    v16 = Stage;
  }
LABEL_9:
  v31 = CFStringGetCStringPtr(theString, 0);
  AppleTCONLoggingLogMsg((uint64_t)"AppleTCONUpdateController::execCommand: Exiting execCommand: command = %s, result = 0x%X", v32, v33, v34, v35, v36, v37, v38, v31);
  return v16;
}

uint64_t AMSupportCFDictionarySetBoolean()
{
  return MEMORY[0x24BED9F50]();
}

uint64_t AMSupportCFDictionarySetInteger32()
{
  return MEMORY[0x24BED9F58]();
}

uint64_t AMSupportGetUInt32()
{
  return MEMORY[0x24BEDA028]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x24BEDA030]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x24BEDA0D8]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x24BEDA0E0]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x24BEDA0E8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
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

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

uint64_t IOAVDisplayMemoryCreateWithName()
{
  return MEMORY[0x24BDD7E80]();
}

uint64_t IOAVDisplayMemoryRead()
{
  return MEMORY[0x24BDD7E88]();
}

uint64_t IOAVDisplayMemoryWrite()
{
  return MEMORY[0x24BDD7E90]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
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

uint64_t operator delete()
{
  return off_24F7EA838();
}

uint64_t operator new()
{
  return off_24F7EA840();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t doPCDSUpdate()
{
  return MEMORY[0x24BED8A30]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

