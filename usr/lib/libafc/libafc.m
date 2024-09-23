char *AFCStringCopy(char *a1, size_t __size, char *__src, size_t a4)
{
  size_t v5;

  if (!a4)
    return (char *)strlcpy(a1, __src, __size);
  if (a4 >= __size)
    v5 = __size;
  else
    v5 = a4;
  return strncpy(a1, __src, v5);
}

uint64_t AFCValidateHeader(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  unint64_t v10;

  if (*a1 == 0x434641364C504141)
  {
    AFCLog(5, "Swapped packet\n");
    v9 = bswap64(a1[2]);
    a1[1] = bswap64(a1[1]);
    a1[2] = v9;
    a1[4] = bswap64(a1[4]);
  }
  else
  {
    if (*a1 != 0x4141504C36414643)
      return __AFCSetErrorResult(1, a2, 3892330498, a4, 116, "Bad packet signature 0x%qx", a7, a8, *a1);
    v9 = a1[2];
  }
  if (v9 < 0x28)
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 121, "Header length 0x%qx too small or exceeds packet length", a7, a8, v9);
  v10 = a1[1];
  if (v9 > v10)
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 121, "Header length 0x%qx too small or exceeds packet length", a7, a8, v9);
  if (HIDWORD(v10))
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 126, "Implausible packet length 0x%qx", a7, a8, a1[1]);
  if (HIDWORD(a1[4]))
    return __AFCSetErrorResult(1, a2, 3892330498, a4, 130, "Implausible packet type 0x%qx", a7, a8, a1[4]);
  return 0;
}

uint64_t __AFCSetErrorResult(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  AFCLog(5, "Setting error result %d, 0x%X, %s, %d\n", -1, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/afc.c", a5);
  return AFCSetErrorInfoWithArgs(a1, 0xFFFFFFFFLL, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/afc.c", a5, a6, &a9);
}

uint64_t AFCSwapHeader(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  if (*a1 != 0x434641364C504141)
    return 0;
  result = 3892330502;
  v3 = __gAFCHeaderSwapInfo;
  if (__gAFCHeaderSwapInfo)
  {
    v4 = &__gAFCHeaderSwapInfo;
    while (v3 != a1[4])
    {
      v5 = v4[9];
      v4 += 9;
      v3 = v5;
      if (!v5)
        return result;
    }
    v6 = 1;
    result = 3892330497;
    do
    {
      v7 = v4[v6];
      if (!v7)
        break;
      if (v7 > a1[2] - 8)
        return result;
      *(_QWORD *)((char *)a1 + (v7 & 0xFFFFFFFFFFFFFFF8)) = bswap64(*(_QWORD *)((char *)a1
                                                                                + (v7 & 0xFFFFFFFFFFFFFFF8)));
      ++v6;
    }
    while (v6 != 9);
    return 0;
  }
  return result;
}

_QWORD *AFCHeaderInit(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *result = 0x4141504C36414643;
  result[1] = a4 + a3;
  result[2] = a3;
  result[4] = a2;
  if (a5)
    v5 = *(_QWORD *)(a5 + 24);
  else
    v5 = -1;
  result[3] = v5;
  return result;
}

void AFCLogPacketInfo(int a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  const char *v6;
  const __CFString *v7;
  const __CFString *v8;
  char buffer[128];
  char __str[512];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a3 + 32);
  if ((unint64_t)(v5 - 1) > 0x27)
    v6 = "Unknown";
  else
    v6 = gAFCPacketTypeNames[v5];
  snprintf(__str, 0x200uLL, "%s: PacketType=%d PacketName=%s HeaderLength=%d PacketLength=%d PacketID=%d", a2, v5, v6, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 8), *(_QWORD *)(a3 + 24));
  switch(*(_QWORD *)(a3 + 32))
  {
    case 1:
      v7 = AFCCopyErrorString(*(unsigned int *)(a3 + 40));
      if (v7)
      {
        v8 = v7;
        CFStringGetCString(v7, buffer, 128, 0x8000100u);
        AFCLog(a1, "%s Status=0x%x StatusName=\"%s\"\n", __str, *(_QWORD *)(a3 + 40), buffer);
        CFRelease(v8);
      }
      else
      {
        strcpy(buffer, "Unknown");
        AFCLog(a1, "%s Status=0x%x StatusName=\"%s\"\n");
      }
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 0xALL:
    case 0xCLL:
    case 0xDLL:
    case 0x18:
    case 0x1CLL:
    case 0x1DLL:
    case 0x1ELL:
      AFCLog(a1, "%s Path=\"%s\"\n");
      break;
    case 7:
      AFCLog(a1, "PacketID=%d Path=\"%s\"\n");
      break;
    case 0xELL:
      AFCLog(a1, "%s FileRef=%d\n");
      break;
    case 0x1FLL:
      AFCLog(a1, "%s RangeStart=%lli RangeLength=%lli Path=\"%s\"\n");
      break;
    default:
      AFCLog(a1, "%s\n");
      break;
  }
}

uint64_t AFCErrnoToAFCDomainError(uint64_t result, uint64_t a2)
{
  if ((result & 0x80000000) != 0)
    return a2;
  if ((int)result > 59)
  {
    if ((int)result > 79)
    {
      if ((result - 80) < 2)
        return 3892330506;
    }
    else
    {
      switch((_DWORD)result)
      {
        case '<':
          return 3892330508;
        case '?':
          return 3892330503;
        case 'M':
          return 3892330499;
      }
    }
    return a2;
  }
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
    case 13:
      return 3892330506;
    case 2:
    case 3:
      return 3892330504;
    case 4:
      return 3892330517;
    case 5:
      return 3892330516;
    case 6:
    case 8:
    case 10:
    case 11:
    case 14:
    case 15:
    case 18:
    case 19:
    case 20:
    case 25:
    case 26:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
      return a2;
    case 7:
    case 12:
    case 23:
    case 24:
    case 27:
    case 31:
      return 3892330499;
    case 9:
      goto LABEL_15;
    case 16:
      return 3892330513;
    case 17:
      return 3892330512;
    case 21:
      return 3892330505;
    case 22:
      return 3892330503;
    case 28:
      return 3892330514;
    case 35:
      return 3892330515;
    case 36:
      return 3892330518;
    case 45:
      return 3892330511;
    default:
      if ((_DWORD)result != 57)
        return a2;
LABEL_15:
      result = 3892330507;
      break;
  }
  return result;
}

uint64_t AFCReadPacketHeader(uint64_t a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  CFAllocatorRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFAllocator *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  size_t v32;
  uint64_t v33;
  char v34;
  const char *v35;
  uint64_t v36;
  int v37;
  char v38;

  v8 = CFGetAllocator((CFTypeRef)a1);
  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  v15 = v8;
  if (a2 && a4)
  {
    if (a3 <= 0x27)
    {
      v35 = "Static buffer too small";
      LODWORD(v26) = 0;
      v36 = 3892330503;
      v37 = 499;
    }
    else
    {
      v16 = AFCReadData(a1, (char *)a2, 0x28uLL);
      if ((_DWORD)v16 || (v16 = AFCValidateHeader((_QWORD *)a2, v17, v18, v19, v20, v21, v22, v23), (_DWORD)v16))
      {
        v13 = v16;
LABEL_26:
        *a4 = 0;
        return v13;
      }
      v24 = *(_QWORD *)(a2 + 16);
      v25 = v24 + 1;
      if (v24 == -1)
      {
        v36 = 3892330498;
        v35 = "Packet Size Rollover";
        LODWORD(v26) = 0;
        v37 = 512;
      }
      else
      {
        if (v25 <= a3)
        {
          v27 = 0;
          v28 = *(_QWORD *)(a2 + 16);
          goto LABEL_16;
        }
        v26 = CFAllocatorAllocate(v15, v24 + 1, 0);
        if (v26)
        {
          v27 = v26;
          AFCLog(5, "Allocated %llu bytes\n", v25);
          v28 = *(_QWORD *)(a2 + 16);
          if (v27 != (_QWORD *)a2)
          {
            v29 = *(_OWORD *)a2;
            v30 = *(_OWORD *)(a2 + 16);
            v27[4] = *(_QWORD *)(a2 + 32);
            *(_OWORD *)v27 = v29;
            *((_OWORD *)v27 + 1) = v30;
            v24 = *(_QWORD *)(a2 + 16);
            v31 = (uint64_t)v27;
LABEL_17:
            *(_BYTE *)(v31 + v24) = 0;
            v32 = v28 - 40;
            if (v28 != 40
              && (AFCLog(5, "Expecting %u bytes\n", v28 - 40),
                  v33 = AFCReadData(a1, (char *)(v31 + 40), v32),
                  (_DWORD)v33))
            {
              v13 = v33;
            }
            else
            {
              AFCSwapHeader((_QWORD *)v31);
              v13 = 0;
              *a4 = v27;
            }
            AFCLogPacketInfo(4, "AFCReadPacketHeader", v31);
            v34 = 0;
            if (!(_DWORD)v13)
              return v13;
            goto LABEL_21;
          }
          v27 = 0;
          v24 = *(_QWORD *)(a2 + 16);
LABEL_16:
          v31 = a2;
          goto LABEL_17;
        }
        v36 = 3892330499;
        v35 = "CFAllocatorAllocate";
        v37 = 518;
      }
    }
  }
  else
  {
    v35 = "NULL buffer";
    LODWORD(v26) = 0;
    v36 = 3892330503;
    v37 = 498;
  }
  v13 = __AFCSetErrorResult((int)v26, v9, v36, v10, v37, v35, v11, v12, v38);
  v31 = 0;
  v34 = 1;
  if (!(_DWORD)v13)
    return v13;
LABEL_21:
  if (v31 == a2)
    v34 = 1;
  if ((v34 & 1) == 0)
    CFAllocatorDeallocate(v15, (void *)v31);
  if (a4)
    goto LABEL_26;
  return v13;
}

uint64_t AFCReadPacketBody(_BYTE *cf, uint64_t a2, char **a3, size_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  const __CFAllocator *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFAllocator *v25;

  if (cf[68])
    return *((unsigned int *)cf + 16);
  v13 = *(_QWORD *)(a2 + 8);
  v14 = *(_QWORD *)(a2 + 16);
  v15 = v13 - v14;
  if (v13 == v14)
  {
    v16 = 0;
LABEL_7:
    result = 0;
    *a3 = v16;
    *a4 = v15;
    return result;
  }
  v17 = CFGetAllocator(cf);
  v18 = (char *)CFAllocatorAllocate(v17, v15, 0);
  if (!v18)
    return __AFCSetErrorResult(0, v19, 3892330499, v20, 590, "CFAllocatorAllocate", v21, v22, a9);
  v16 = v18;
  v23 = AFCReadData((uint64_t)cf, v18, v15);
  if (!(_DWORD)v23)
    goto LABEL_7;
  v24 = v23;
  v25 = CFGetAllocator(cf);
  CFAllocatorDeallocate(v25, v16);
  return v24;
}

uint64_t AFCSendHeader(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  AFCLogPacketInfo(4, "AFCSendHeader", a2);
  return AFCSendData(a1, (char *)a2, *(_QWORD *)(a2 + 16));
}

uint64_t AFCSendPacket(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v8 = 3892330503;
  v9 = *(_QWORD *)(a2 + 16);
  AFCLockLock(*(_QWORD *)(a1 + 144));
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (a3 || !a4)
    {
      if (v9 + a4 <= 0x2000 && (v10 = (char *)malloc_type_malloc(0x2000uLL, 0xAEE7660CuLL)) != 0)
      {
        v11 = v10;
        __memcpy_chk();
        memcpy(&v11[v9], a3, a4);
        AFCLogPacketInfo(4, "AFCSendHeader", a2);
        v8 = AFCSendData(a1, v11, v9 + a4);
        free(v11);
      }
      else
      {
        v12 = AFCSendHeader(a1, a2);
        if (!(_DWORD)v12)
          v12 = AFCSendData(a1, (char *)a3, a4);
        v8 = v12;
      }
    }
  }
  else
  {
    v8 = 3892330507;
  }
  AFCLockUnlock(*(_QWORD *)(a1 + 144));
  return v8;
}

CFMutableDataRef __AFCCreateAFCDataWithDictionary(const __CFDictionary *a1)
{
  CFMutableDataRef Mutable;

  Mutable = CFDataCreateMutable(0, 0);
  if (Mutable)
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)__ConvertDictEntry, Mutable);
  return Mutable;
}

BOOL __ConvertDictEntry(_BOOL8 result, const __CFString *a2, __CFData *a3)
{
  if (result && a2)
  {
    result = __AppendValue((const __CFString *)result, a3);
    if (result)
      return __AppendValue(a2, a3);
  }
  return result;
}

uint64_t AFCSendStatusExtended(uint64_t a1, uint64_t a2, int a3, const __CFDictionary *a4)
{
  const __CFDictionary *v4;
  CFIndex v8;
  uint64_t v9;
  uint64_t v10;
  char *BytePtr;
  CFIndex Length;
  uint64_t v13;
  _QWORD v15[6];

  v4 = a4;
  AFCLog(5, "Writing status packet %d info %p\n", a3, a4);
  if (a3 && (a3 + 402636777) <= 0xFFFFFFEA)
    AFCLog(5, "Oh no!");
  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  if (!v4)
    goto LABEL_8;
  if ((*(_BYTE *)(a1 + 128) & 1) == 0)
  {
    v4 = 0;
LABEL_8:
    v8 = 48;
    goto LABEL_10;
  }
  v4 = __AFCCreateAFCDataWithDictionary(v4);
  v8 = CFDataGetLength(v4) + 48;
LABEL_10:
  v15[0] = 0x4141504C36414643;
  v15[1] = v8;
  v15[2] = 48;
  v15[4] = 1;
  if (a2)
    v9 = *(_QWORD *)(a2 + 24);
  else
    v9 = -1;
  v15[3] = v9;
  v15[5] = a3 & 0x1FFF;
  v10 = AFCSendHeader(a1, (uint64_t)v15);
  if ((_DWORD)v10)
  {
    v13 = v10;
    if (!v4)
      return v13;
  }
  else
  {
    if (!v4)
      return 0;
    BytePtr = (char *)CFDataGetBytePtr(v4);
    Length = CFDataGetLength(v4);
    v13 = AFCSendData(a1, BytePtr, Length);
  }
  CFRelease(v4);
  return v13;
}

uint64_t AFCSendStatus(uint64_t a1, uint64_t a2, int a3)
{
  const __CFDictionary *ErrorInfo;
  uint64_t v7;

  ErrorInfo = (const __CFDictionary *)AFCCopyAndClearLastErrorInfo();
  v7 = AFCSendStatusExtended(a1, a2, a3, ErrorInfo);
  if (ErrorInfo)
    CFRelease(ErrorInfo);
  return v7;
}

uint64_t AFCSendDataPacket(uint64_t a1, uint64_t a2, char *a3, unint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[5];

  AFCLog(5, "Writing data packet with data length %u\n", a4);
  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  v10[0] = 0x4141504C36414643;
  v10[1] = a4 + 40;
  v10[2] = 40;
  v10[4] = 2;
  if (a2)
    v9 = *(_QWORD *)(a2 + 24);
  else
    v9 = -1;
  v10[3] = v9;
  result = AFCSendHeader(a1, (uint64_t)v10);
  if (!(_DWORD)result)
    return AFCSendData(a1, a3, a4);
  return result;
}

uint64_t AFCDiscardData(uint64_t a1, size_t a2)
{
  size_t v2;
  uint64_t v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v13;
  BOOL v14;
  int *v15;
  char v16;
  char v17[64];
  uint64_t v18;

  v2 = a2;
  v18 = *MEMORY[0x24BDAC8D0];
  AFCLog(5, "Discard data length %u\n", a2);
  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  if (!v2)
    return 0;
  if (v2 <= 0x40)
  {
    v4 = AFCReadData(a1, v17, v2);
    if (!(_DWORD)v4)
      return v4;
LABEL_20:
    v15 = __error();
    AFCLog(2, "Error %d discarding data\n", *v15);
    AFCConnectionSetFatalError(a1, v4);
    return v4;
  }
  v6 = (char *)CFAllocatorAllocate(0, *(_QWORD *)(a1 + 96), 0);
  if (!v6)
  {
    v4 = 3892330499;
    __AFCSetErrorResult(0, v7, 3892330499, v8, 989, "CFAllocatorAllocate", v9, v10, v16);
    return v4;
  }
  v11 = v6;
  do
  {
    if (v2 >= *(_QWORD *)(a1 + 96))
      v12 = *(_QWORD *)(a1 + 96);
    else
      v12 = v2;
    v13 = AFCReadData(a1, v11, v12);
    v2 -= v12;
    if ((_DWORD)v13)
      v14 = 1;
    else
      v14 = v2 == 0;
  }
  while (!v14);
  v4 = v13;
  CFAllocatorDeallocate(0, v11);
  if ((_DWORD)v4)
    goto LABEL_20;
  return v4;
}

uint64_t AFCDiscardBodyData(uint64_t a1, uint64_t a2)
{
  return AFCDiscardData(a1, *(_QWORD *)(a2 + 8) - *(_QWORD *)(a2 + 16));
}

BOOL __AppendValue(const __CFString *a1, __CFData *a2)
{
  const __CFString *v3;
  CFTypeID v4;
  CFStringRef v5;
  CFIndex v6;
  UInt8 *v7;
  UInt8 *v8;
  CFIndex Length;
  CFIndex Bytes;
  _BOOL8 v11;
  CFIndex v12;
  CFIndex v13;
  CFIndex usedBufLen;
  uint64_t valuePtr;
  CFRange v17;

  v3 = a1;
  v4 = CFGetTypeID(a1);
  if (v4 != CFStringGetTypeID())
  {
    if (v4 == CFNumberGetTypeID())
    {
      if (CFNumberIsFloatType((CFNumberRef)v3))
      {
        valuePtr = 0;
        if (!CFNumberGetValue((CFNumberRef)v3, kCFNumberDoubleType, &valuePtr))
          return 0;
        v5 = CFStringCreateWithFormat(0, 0, CFSTR("%g"), valuePtr);
      }
      else
      {
        valuePtr = 0;
        if (!CFNumberGetValue((CFNumberRef)v3, kCFNumberSInt64Type, &valuePtr))
          return 0;
        v5 = CFStringCreateWithFormat(0, 0, CFSTR("%qi"), valuePtr);
      }
    }
    else
    {
      if (v4 == CFBooleanGetTypeID())
      {
        if ((const __CFString *)*MEMORY[0x24BDBD270] == v3)
          v3 = CFSTR("1");
        else
          v3 = CFSTR("0");
        goto LABEL_16;
      }
      v5 = CFCopyDescription(v3);
    }
    v3 = v5;
    if (v5)
      goto LABEL_16;
    return 0;
  }
  CFRetain(v3);
  if (!v3)
    return 0;
LABEL_16:
  v6 = 9 * CFStringGetLength(v3);
  v7 = (UInt8 *)CFAllocatorAllocate(0, v6 + 1, 0);
  if (!v7)
  {
    v11 = 0;
    if (!v3)
      return v11;
    goto LABEL_20;
  }
  v8 = v7;
  usedBufLen = 0;
  Length = CFStringGetLength(v3);
  v17.location = 0;
  v17.length = Length;
  Bytes = CFStringGetBytes(v3, v17, 0x8000100u, 0, 0, v8, v6, &usedBufLen);
  v11 = Length == Bytes;
  if (Length == Bytes)
  {
    v12 = usedBufLen++;
    v13 = usedBufLen;
    v8[v12] = 0;
    CFDataAppendBytes(a2, v8, v13);
  }
  CFAllocatorDeallocate(0, v8);
  if (v3)
LABEL_20:
    CFRelease(v3);
  return v11;
}

_QWORD *AFCIteratorCreate(const __CFAllocator *a1, const void *a2)
{
  uint64_t Instance;
  _QWORD *v5;
  _QWORD *v6;
  CFTypeID v7;
  CFIndex Count;
  CFIndex v9;
  const void **v10;
  const void **v11;
  CFArrayRef v12;
  CFTypeID v13;
  CFMutableDataRef Mutable;
  CFMutableDataRef v15;
  const void *v16;
  const void *v17;

  pthread_once(&AFCIteratorGetTypeID_typeIDInit, (void (*)(void))__AFCIteratorRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v5 = (_QWORD *)Instance;
  if (a2 && Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    v6 = (_QWORD *)(Instance + 16);
    *(_QWORD *)(Instance + 48) = 0;
    *(_OWORD *)(Instance + 32) = 0u;
    v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID())
    {
      Count = CFDictionaryGetCount((CFDictionaryRef)a2);
      if (Count)
      {
        v9 = Count;
        v10 = (const void **)CFAllocatorAllocate(0, 8 * Count, 0);
        if (!v10)
          goto LABEL_15;
        v11 = v10;
        CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v10, 0);
        v5[3] = CFArrayCreate(a1, v11, v9, MEMORY[0x24BDBD690]);
        CFAllocatorDeallocate(0, v11);
        v12 = (CFArrayRef)v5[3];
      }
      else
      {
        v12 = CFArrayCreate(a1, 0, 0, 0);
        v5[3] = v12;
      }
      if (v12)
        goto LABEL_11;
    }
    else
    {
      v13 = CFGetTypeID(a2);
      if (v13 == CFArrayGetTypeID())
      {
        v6 = v5 + 3;
LABEL_11:
        *v6 = a2;
        CFRetain(a2);
        Mutable = CFDataCreateMutable(a1, 0);
        v5[5] = Mutable;
        if (Mutable)
        {
          v15 = CFDataCreateMutable(a1, 0);
          v5[6] = v15;
          if (v15)
            return v5;
        }
      }
    }
LABEL_15:
    v16 = (const void *)v5[3];
    if (v16)
      CFRelease(v16);
    v17 = (const void *)v5[2];
    if (v17)
      CFRelease(v17);
    CFRelease(v5);
    goto LABEL_20;
  }
  if (Instance)
    goto LABEL_15;
LABEL_20:
  if (a2)
    CFRelease(a2);
  return 0;
}

const void *AFCIteratorNext(uint64_t a1)
{
  CFIndex v2;
  const __CFArray *v3;
  CFIndex v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= CFArrayGetCount(*(CFArrayRef *)(a1 + 24)))
    return 0;
  v3 = *(const __CFArray **)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4 + 1;
  return CFArrayGetValueAtIndex(v3, v4);
}

uint64_t AFCIteratorGetObject(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 16);
  if (!result)
    return *(_QWORD *)(a1 + 24);
  return result;
}

const UInt8 *AFCIteratorGetKeyBuffer(uint64_t a1, CFIndex a2)
{
  if (CFDataGetLength(*(CFDataRef *)(a1 + 40)) < a2)
    CFDataSetLength(*(CFMutableDataRef *)(a1 + 40), a2);
  return CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
}

const UInt8 *AFCIteratorGetValueBuffer(uint64_t a1, CFIndex a2)
{
  if (CFDataGetLength(*(CFDataRef *)(a1 + 48)) < a2)
    CFDataSetLength(*(CFMutableDataRef *)(a1 + 48), a2);
  return CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
}

const char *AFCGetClientVersionString()
{
  return "@(#)PROGRAM:afc  PROJECT:afc-279\n";
}

uint64_t __AFCIteratorRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __gAFCIteratorTypeID = result;
  return result;
}

void __AFCIteratorFinalize(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  v2 = (const void *)a1[2];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[3];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[5];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[6];
  if (v5)
    CFRelease(v5);
  a1[4] = 0;
}

__CFString *__AFCIteratorCopyDescription(_QWORD *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<AFCIterator %p [%p]> {\n"), a1, v2);
  CFStringAppendFormat(Mutable, 0, CFSTR("  Dictionary: %@\n"), a1[2]);
  CFStringAppendFormat(Mutable, 0, CFSTR("  Array: %@\n"), a1[3]);
  CFStringAppendFormat(Mutable, 0, CFSTR("  Index: %ld\n"), a1[4]);
  CFStringAppendFormat(Mutable, 0, CFSTR("}"));
  return Mutable;
}

CFStringRef AFCCopyErrorString(uint64_t a1)
{
  const __CFString **i;
  const __CFString *v2;
  int v3;
  CFStringRef v5;

  if ((_DWORD)a1)
  {
    for (i = (const __CFString **)&off_24D38A1D8; ; i += 2)
    {
      v2 = *i;
      if (!*i)
        break;
      v3 = *((_DWORD *)i - 2);
      if (v3 == (_DWORD)a1)
        return CFStringCreateCopy(0, v2);
    }
    v5 = CFStringCreateWithFormat(0, 0, CFSTR("Error 0x%x"), a1);
    CFRelease(CFSTR("Error 0x%x"));
    return v5;
  }
  else
  {
    v2 = CFSTR("Success");
    return CFStringCreateCopy(0, v2);
  }
}

CFDictionaryRef __AFCCreateErrorObject(const __CFAllocator *a1, uint64_t a2, uint64_t a3)
{
  CFIndex v6;
  CFDictionaryRef v7;
  uint64_t valuePtr;
  void *values;
  CFTypeRef cf;
  CFTypeRef v12;
  uint64_t v13;
  void *keys[2];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)keys = xmmword_24D38A350;
  v15 = *(_OWORD *)off_24D38A360;
  valuePtr = (int)a2;
  values = CFSTR("AFCErrorDomain");
  cf = CFNumberCreate(a1, kCFNumberLongType, &valuePtr);
  v12 = AFCCopyErrorString(a2);
  v13 = a3;
  if (a3)
    v6 = 4;
  else
    v6 = 3;
  v7 = CFDictionaryCreate(a1, (const void **)keys, (const void **)&values, v6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(cf);
  CFRelease(v12);
  return v7;
}

CFStringRef AFCCopyPacketTypeString(uint64_t a1)
{
  const __CFString *v1;
  const __CFString **v3;
  uint64_t v4;
  __CFBundle *MainBundle;
  __CFBundle *v7;
  const __CFString *v8;
  CFStringRef v9;

  if (a1 == 1)
  {
    v1 = CFSTR("Status");
LABEL_6:
    MainBundle = CFBundleGetMainBundle();
    return CFBundleCopyLocalizedString(MainBundle, v1, v1, CFSTR("AFCError"));
  }
  else
  {
    v3 = (const __CFString **)&off_24D38A390;
    while (1)
    {
      v1 = *v3;
      if (!*v3)
        break;
      v4 = (uint64_t)*(v3 - 1);
      v3 += 3;
      if (v4 == a1)
        goto LABEL_6;
    }
    v7 = CFBundleGetMainBundle();
    v8 = CFBundleCopyLocalizedString(v7, CFSTR("Packet Type %qu"), CFSTR("Packet Type %qu"), CFSTR("AFCError"));
    v9 = CFStringCreateWithFormat(0, 0, v8, a1);
    CFRelease(v8);
    return v9;
  }
}

uint64_t AFCOperationGetTypeID()
{
  pthread_once(&AFCOperationGetTypeID_typeIDInit, (void (*)(void))__AFCOperationRegisterClass);
  return __gAFCOperationTypeID;
}

uint64_t __AFCOperationRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __gAFCOperationTypeID = result;
  return result;
}

uint64_t AFCOperationCreate(const __CFAllocator *a1, CFIndex *a2, const void *a3, uint64_t a4, const void *a5, uint64_t a6)
{
  uint64_t Instance;
  uint64_t v13;
  size_t v14;
  void *v15;
  const __CFAllocator *v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;

  pthread_once(&AFCOperationGetTypeID_typeIDInit, (void (*)(void))__AFCOperationRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v13 = Instance;
  if (Instance)
  {
    if (a2)
    {
      v14 = a2[2];
      *(_QWORD *)(Instance + 256) = 0;
      *(_OWORD *)(Instance + 224) = 0u;
      *(_OWORD *)(Instance + 240) = 0u;
      *(_OWORD *)(Instance + 192) = 0u;
      *(_OWORD *)(Instance + 208) = 0u;
      *(_OWORD *)(Instance + 160) = 0u;
      *(_OWORD *)(Instance + 176) = 0u;
      *(_OWORD *)(Instance + 128) = 0u;
      *(_OWORD *)(Instance + 144) = 0u;
      *(_OWORD *)(Instance + 96) = 0u;
      *(_OWORD *)(Instance + 112) = 0u;
      *(_OWORD *)(Instance + 64) = 0u;
      *(_OWORD *)(Instance + 80) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(_OWORD *)(Instance + 48) = 0u;
      *(_OWORD *)(Instance + 16) = 0u;
      if (v14 > 0x80)
      {
        v15 = CFAllocatorAllocate(a1, a2[2], 0);
        *(_QWORD *)(v13 + 88) = v15;
        v16 = a1;
        v17 = v14;
        if (!v15)
          goto LABEL_14;
      }
      else
      {
        v15 = (void *)(Instance + 112);
        *(_QWORD *)(v13 + 88) = v13 + 112;
        v16 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
        v17 = 128;
      }
      *(_QWORD *)(v13 + 96) = v16;
      *(_QWORD *)(v13 + 104) = v17;
      memcpy(v15, a2, v14);
      *(_QWORD *)(v13 + 48) = a2[4];
      if (a3)
        CFRetain(a3);
      *(_QWORD *)(v13 + 64) = a3;
      *(_QWORD *)(v13 + 72) = a4;
      if (a5)
        CFRetain(a5);
      *(_QWORD *)(v13 + 80) = a5;
      v18 = AFCConditionCreate();
      *(_QWORD *)(v13 + 256) = v18;
      if (v18)
      {
        *(_QWORD *)(v13 + 16) = a6;
        *(_DWORD *)(v13 + 24) = 1;
        v19 = AFCLockCreate();
        *(_QWORD *)(v13 + 248) = v19;
        if (v19)
          goto LABEL_12;
      }
    }
LABEL_14:
    AFCLog(5, "AFCOperationCreate %p failed", (const void *)v13);
    CFRelease((CFTypeRef)v13);
    return 0;
  }
LABEL_12:
  AFCLog(5, "%s(%p)\n", "AFCOperationCreate", (const void *)v13);
  return v13;
}

uint64_t AFCOperationGetResultObject(uint64_t a1)
{
  return *(_QWORD *)(a1 + 240);
}

uint64_t AFCOperationGetState(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t AFCOperationGetResultStatus(uint64_t a1)
{
  uint64_t v2;

  AFCLockLock(*(_QWORD *)(a1 + 248));
  if (*(_DWORD *)(a1 + 24) == 5)
    v2 = *(unsigned int *)(a1 + 40);
  else
    v2 = 3892330518;
  AFCLockUnlock(*(_QWORD *)(a1 + 248));
  return v2;
}

uint64_t AFCOperationGetContext(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t AFCOperationSetContext(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t __AFCOperationGetDataLength(uint64_t a1)
{
  uint64_t v2;

  AFCLockLock(*(_QWORD *)(a1 + 248));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) - *(_QWORD *)(*(_QWORD *)(a1 + 88) + 16);
  AFCLockUnlock(*(_QWORD *)(a1 + 248));
  return v2;
}

uint64_t __AFCOperationSetClientErrorWithInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v6;
  void *v7;

  v6 = CFGetAllocator((CFTypeRef)a1);
  v7 = __AFCCreateErrorObject(v6, a2, a3);
  if (!v7)
    v7 = (void *)CFRetain((CFTypeRef)*MEMORY[0x24BDBD430]);
  AFCLockLock(*(_QWORD *)(a1 + 248));
  *(_DWORD *)(a1 + 24) = 5;
  *(_DWORD *)(a1 + 40) = a2;
  *(_QWORD *)(a1 + 240) = v7;
  return AFCLockUnlock(*(_QWORD *)(a1 + 248));
}

uint64_t __AFCOperationSetClientError(uint64_t a1, uint64_t a2, const char *a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  __CFDictionary *v12;

  v12 = 0;
  v10 = AFCErrorInfoCreateWithArgs(&v12, 0xFFFFFFFFLL, a2, a3, a4, a5, &a9);
  return __AFCOperationSetClientErrorWithInfo(a1, v10, (uint64_t)v12);
}

CFDictionaryRef AFCOperationCreatePacketHeaderDictionary(_QWORD *a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  uint64_t i;
  const void *v8[6];
  void *keys[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = a1[11];
  v3 = CFGetAllocator(a1);
  *(_OWORD *)keys = xmmword_24D38A748;
  v10 = *(_OWORD *)&off_24D38A758;
  v11 = xmmword_24D38A768;
  AFCLockLock(a1[31]);
  v8[0] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)v2);
  v8[1] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 8));
  v8[2] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 16));
  v8[3] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 24));
  v8[4] = CFNumberCreate(v3, kCFNumberSInt64Type, (const void *)(v2 + 32));
  v8[5] = CFDataCreate(v3, (const UInt8 *)v2, *(_QWORD *)(v2 + 16));
  AFCLockUnlock(a1[31]);
  v4 = CFGetAllocator(a1);
  v5 = CFDictionaryCreate(v4, (const void **)keys, v8, 6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  for (i = 0; i != 6; ++i)
    CFRelease(v8[i]);
  return v5;
}

CFDataRef AFCOperationCopyPacketData(_QWORD *a1)
{
  const __CFAllocator *v2;
  const UInt8 *v3;
  CFIndex v4;
  CFDataRef v5;

  AFCLockLock(a1[31]);
  v2 = CFGetAllocator(a1);
  v3 = (const UInt8 *)a1[9];
  AFCLockLock(a1[31]);
  v4 = *(_QWORD *)(a1[11] + 8) - *(_QWORD *)(a1[11] + 16);
  AFCLockUnlock(a1[31]);
  v5 = CFDataCreate(v2, v3, v4);
  AFCLockUnlock(a1[31]);
  return v5;
}

uint64_t AFCFileDescriptorGetTypeID()
{
  pthread_once(&AFCFileDescriptorGetTypeID_typeIDInit, (void (*)(void))__AFCFileDescriptorRegisterClass);
  return __gAFCFileDescriptorTypeID;
}

uint64_t __AFCFileDescriptorRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __gAFCFileDescriptorTypeID = result;
  return result;
}

uint64_t AFCFileDescriptorCreate(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t Instance;

  pthread_once(&AFCFileDescriptorGetTypeID_typeIDInit, (void (*)(void))__AFCFileDescriptorRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    CFRetain(a2);
    *(_QWORD *)(Instance + 16) = a2;
    *(_QWORD *)(Instance + 24) = a3;
    *(_DWORD *)(Instance + 32) = 1;
    __AFCConnectionAddFileDescriptor((uint64_t)a2, (const void *)Instance);
    *(_OWORD *)(Instance + 36) = 0u;
    *(_OWORD *)(Instance + 516) = 0u;
    *(_OWORD *)(Instance + 532) = 0u;
    *(_OWORD *)(Instance + 484) = 0u;
    *(_OWORD *)(Instance + 500) = 0u;
    *(_OWORD *)(Instance + 452) = 0u;
    *(_OWORD *)(Instance + 468) = 0u;
    *(_OWORD *)(Instance + 420) = 0u;
    *(_OWORD *)(Instance + 436) = 0u;
    *(_OWORD *)(Instance + 388) = 0u;
    *(_OWORD *)(Instance + 404) = 0u;
    *(_OWORD *)(Instance + 356) = 0u;
    *(_OWORD *)(Instance + 372) = 0u;
    *(_OWORD *)(Instance + 324) = 0u;
    *(_OWORD *)(Instance + 340) = 0u;
    *(_OWORD *)(Instance + 292) = 0u;
    *(_OWORD *)(Instance + 308) = 0u;
    *(_OWORD *)(Instance + 260) = 0u;
    *(_OWORD *)(Instance + 276) = 0u;
    *(_OWORD *)(Instance + 228) = 0u;
    *(_OWORD *)(Instance + 244) = 0u;
    *(_OWORD *)(Instance + 196) = 0u;
    *(_OWORD *)(Instance + 212) = 0u;
    *(_OWORD *)(Instance + 164) = 0u;
    *(_OWORD *)(Instance + 180) = 0u;
    *(_OWORD *)(Instance + 132) = 0u;
    *(_OWORD *)(Instance + 148) = 0u;
    *(_OWORD *)(Instance + 100) = 0u;
    *(_OWORD *)(Instance + 116) = 0u;
    *(_OWORD *)(Instance + 68) = 0u;
    *(_OWORD *)(Instance + 84) = 0u;
    *(_OWORD *)(Instance + 52) = 0u;
  }
  return Instance;
}

uint64_t AFCFileDescriptorSetRemoteName(uint64_t a1, char *__src)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  AFCStringCopy((char *)(a1 + 36), 0x200uLL, __src, 0);
  return 0;
}

uint64_t AFCFileDescriptorGetRemoteName(uint64_t a1)
{
  return a1 + 36;
}

uint64_t AFCFileDescriptorCreateReadOperation(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5)
{
  const __CFAllocator *v10;
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v14 = 0;
  v13 = 0u;
  memset(v12, 0, sizeof(v12));
  AFCHeaderInit(v12, 15, 56, 0, 0);
  *((_QWORD *)&v13 + 1) = *(_QWORD *)(a1 + 24);
  v14 = a4;
  v10 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v10, (CFIndex *)v12, 0, a2, a3, a5);
}

uint64_t AFCFileDescriptorCreateReadAtPositionOperation(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  const __CFAllocator *v12;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v15 = 0u;
  v16 = 0u;
  memset(v14, 0, sizeof(v14));
  AFCHeaderInit(v14, 39, 64, 0, 0);
  *((_QWORD *)&v15 + 1) = *(_QWORD *)(a1 + 24);
  *(_QWORD *)&v16 = a4;
  *((_QWORD *)&v16 + 1) = a5;
  v12 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v12, (CFIndex *)v14, 0, a2, a3, a6);
}

uint64_t AFCFileDescriptorCreateWriteOperation(uint64_t a1, CFDataRef theData, uint64_t a3)
{
  CFIndex Length;
  const __CFAllocator *v7;
  _OWORD v9[2];
  __int128 v10;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  if (theData)
    Length = CFDataGetLength(theData);
  else
    Length = 0;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  AFCHeaderInit(v9, 16, 48, Length, 0);
  *((_QWORD *)&v10 + 1) = *(_QWORD *)(a1 + 24);
  v7 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v7, (CFIndex *)v9, theData, 0, 0, a3);
}

uint64_t AFCFileDescriptorCreateWriteAtPositionOperation(uint64_t a1, CFDataRef theData, uint64_t a3, uint64_t a4)
{
  CFIndex Length;
  const __CFAllocator *v9;
  _OWORD v11[2];
  __int128 v12;
  uint64_t v13;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  if (theData)
    Length = CFDataGetLength(theData);
  else
    Length = 0;
  v13 = 0;
  v12 = 0u;
  memset(v11, 0, sizeof(v11));
  AFCHeaderInit(v11, 40, 56, Length, 0);
  *((_QWORD *)&v12 + 1) = *(_QWORD *)(a1 + 24);
  v13 = a3;
  v9 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v9, (CFIndex *)v11, theData, 0, 0, a4);
}

uint64_t AFCFileDescriptorCreateSetPositionOperation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const __CFAllocator *v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v11 = 0u;
  v12 = 0u;
  memset(v10, 0, sizeof(v10));
  AFCHeaderInit(v10, 17, 64, 0, 0);
  *((_QWORD *)&v11 + 1) = *(_QWORD *)(a1 + 24);
  *(_QWORD *)&v12 = a2;
  *((_QWORD *)&v12 + 1) = a3;
  v8 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v8, (CFIndex *)v10, 0, 0, 0, a4);
}

uint64_t AFCFileDescriptorCreateGetPositionOperation(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  _OWORD v6[2];
  __int128 v7;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  AFCHeaderInit(v6, 18, 48, 0, 0);
  *((_QWORD *)&v7 + 1) = *(_QWORD *)(a1 + 24);
  v4 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v4, (CFIndex *)v6, 0, 0, 0, a2);
}

uint64_t AFCFileDescriptorCreateSetSizeOperation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v6;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v10 = 0;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  AFCHeaderInit(v8, 21, 56, 0, 0);
  *((_QWORD *)&v9 + 1) = *(_QWORD *)(a1 + 24);
  v10 = a2;
  v6 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v6, (CFIndex *)v8, 0, 0, 0, a3);
}

uint64_t AFCFileDescriptorCreateLockOperation(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  const __CFAllocator *v7;
  _OWORD v9[2];
  __int128 v10;
  uint64_t v11;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v11 = 0;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  AFCHeaderInit(v9, 27, 56, 0, 0);
  v6 = 5;
  if (a2)
    v6 = 6;
  *((_QWORD *)&v10 + 1) = *(_QWORD *)(a1 + 24);
  v11 = v6;
  v7 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v7, (CFIndex *)v9, 0, 0, 0, a3);
}

uint64_t AFCFileDescriptorCreateUnlockOperation(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v8 = 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  AFCHeaderInit(v6, 27, 56, 0, 0);
  *((_QWORD *)&v7 + 1) = *(_QWORD *)(a1 + 24);
  v8 = 12;
  v4 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v4, (CFIndex *)v6, 0, 0, 0, a2);
}

const void *AFCFileDescriptorCreateCloseOperation(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  const __CFAllocator *v5;
  const void *v6;
  _OWORD v8[2];
  __int128 v9;

  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  v4 = (unsigned int *)(a1 + 32);
  AFCLog(5, "AFCFileDescriptorCreateCloseOperation(%p) [valid %d]", (const void *)a1, *(_DWORD *)(a1 + 32));
  if (AFCCompareAndSwap32(1, 0, v4)
    && (AFCHeaderInit(v8, 20, 48, 0, 0), (*((_QWORD *)&v9 + 1) = *(_QWORD *)(a1 + 24)) != 0))
  {
    v5 = CFGetAllocator((CFTypeRef)a1);
    v6 = (const void *)AFCOperationCreate(v5, (CFIndex *)v8, 0, 0, 0, a2);
    if (v6)
      *(_QWORD *)(a1 + 24) = 0;
  }
  else
  {
    v6 = 0;
  }
  AFCLog(5, "Close op for desc %p = %p", (const void *)a1, v6);
  return v6;
}

uint64_t AFCFileDescriptorCreateSetImmutableHintOperation(uint64_t a1, int a2, uint64_t a3)
{
  const __CFAllocator *v6;
  _OWORD v8[2];
  __int128 v9;
  _BOOL8 v10;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v10 = 0;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  AFCHeaderInit(v8, 32, 56, 0, 0);
  *((_QWORD *)&v9 + 1) = *(_QWORD *)(a1 + 24);
  v10 = a2 != 0;
  v6 = CFGetAllocator((CFTypeRef)a1);
  return AFCOperationCreate(v6, (CFIndex *)v8, 0, 0, 0, a3);
}

uint64_t AFCFileDescriptorInvalidate(uint64_t a1)
{
  uint64_t result;

  result = AFCCompareAndSwap32(1, 0, (unsigned int *)(a1 + 32));
  if ((_DWORD)result)
  {
    result = AFCLog(5, "AFCFileDescriptorInvalidate(%p)", (const void *)a1);
    *(_QWORD *)(a1 + 24) = 0;
  }
  return result;
}

BOOL AFCFileDescriptorIsValid(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) == 1;
}

uint64_t AFCOperationCreateGetDeviceInfo(const __CFAllocator *a1, uint64_t a2)
{
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  AFCHeaderInit(v5, 11, 40, 0, 0);
  return AFCOperationCreate(a1, (CFIndex *)v5, 0, 0, 0, a2);
}

uint64_t AFCOperationCreateGetConnectionInfo(const __CFAllocator *a1, uint64_t a2)
{
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  AFCHeaderInit(v5, 22, 40, 0, 0);
  return AFCOperationCreate(a1, (CFIndex *)v5, 0, 0, 0, a2);
}

uint64_t AFCOperationCreateSetConnectionOptions(const __CFAllocator *a1, const __CFDictionary *a2, uint64_t a3)
{
  const __CFData *v5;
  const __CFData *v6;
  CFIndex Length;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;

  if (!a2)
    return 0;
  v5 = __AFCCreateAFCDataWithDictionary(a2);
  if (!v5)
    return 0;
  v6 = v5;
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  Length = CFDataGetLength(v5);
  AFCHeaderInit(v10, 23, 40, Length, 0);
  v8 = AFCOperationCreate(a1, (CFIndex *)v10, v6, 0, 0, a3);
  CFRelease(v6);
  return v8;
}

uint64_t AFCOperationCreateGetFileInfo(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6;
  char *v7;
  CFIndex *v8;
  CFIndex v9;
  const char *v10;
  uint64_t CString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  char v21;

  v6 = 9 * CFStringGetLength(theString);
  v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7)
    return 0;
  v8 = (CFIndex *)v7;
  v9 = v6 + 1;
  v10 = v7 + 40;
  CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if ((_DWORD)CString)
  {
    v18 = strlen(v10);
    AFCHeaderInit(v8, 10, v18 + 41, 0, 0);
    v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1035, v15, v16, v17, v21);
    v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t __AFCSetErrorResult_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  AFCLog(5, "Setting error result %d, 0x%X, %s, %d\n", -1, -402636793, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/client-async.c", a5);
  return AFCSetErrorInfoWithArgs(0, 0xFFFFFFFFLL, 3892330503, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/client-async.c", a5, "CFStringGetCString failed", &a9);
}

uint64_t AFCOperationCreateRemovePath(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6;
  char *v7;
  CFIndex *v8;
  CFIndex v9;
  const char *v10;
  uint64_t CString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  char v21;

  v6 = 9 * CFStringGetLength(theString);
  v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7)
    return 0;
  v8 = (CFIndex *)v7;
  v9 = v6 + 1;
  v10 = v7 + 40;
  CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if ((_DWORD)CString)
  {
    v18 = strlen(v10);
    AFCHeaderInit(v8, 8, v18 + 41, 0, 0);
    v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1065, v15, v16, v17, v21);
    v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateRenamePath(const __CFAllocator *a1, CFStringRef theString, const __CFString *a3, uint64_t a4)
{
  CFIndex Length;
  CFIndex v9;
  char *v10;
  CFIndex *v11;
  const char *v12;
  uint64_t CString;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  size_t v21;
  size_t v22;
  uint64_t v23;
  int v25;
  char v26;

  Length = CFStringGetLength(theString);
  v9 = 9 * (CFStringGetLength(a3) + Length);
  v10 = (char *)CFAllocatorAllocate(0, v9 + 44, 0);
  if (!v10)
    return 0;
  v11 = (CFIndex *)v10;
  v12 = v10 + 40;
  CString = CFStringGetCString(theString, v10 + 40, v9 + 4, 0x8000100u);
  if (!(_DWORD)CString)
  {
    v25 = 1098;
LABEL_10:
    __AFCSetErrorResult_0(CString, v14, v15, v16, v25, v17, v18, v19, v26);
    v23 = 0;
    goto LABEL_5;
  }
  v20 = (char *)&v12[strlen(v12) + 1];
  CString = CFStringGetCString(a3, v20, (char *)v11 + v9 + 44 - v20, 0x8000100u);
  if (!(_DWORD)CString)
  {
    v25 = 1100;
    goto LABEL_10;
  }
  v21 = strlen(v12);
  v22 = strlen(v20);
  AFCHeaderInit(v11, 24, v21 + v22 + 42, 0, 0);
  v23 = AFCOperationCreate(a1, v11, 0, 0, 0, a4);
LABEL_5:
  CFAllocatorDeallocate(0, v11);
  return v23;
}

uint64_t AFCOperationCreateSetModTime(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4)
{
  CFIndex v8;
  char *v9;
  CFIndex *v10;
  const char *v11;
  uint64_t CString;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  char v22;

  v8 = 9 * CFStringGetLength(theString);
  v9 = (char *)CFAllocatorAllocate(0, v8 + 50, 0);
  if (!v9)
    return 0;
  v10 = (CFIndex *)v9;
  *((_QWORD *)v9 + 5) = a3;
  v11 = v9 + 48;
  CString = CFStringGetCString(theString, v9 + 48, v8 + 2, 0x8000100u);
  if ((_DWORD)CString)
  {
    v19 = strlen(v11);
    AFCHeaderInit(v10, 30, v19 + 49, 0, 0);
    v20 = AFCOperationCreate(a1, v10, 0, 0, 0, a4);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v13, v14, v15, 1132, v16, v17, v18, v22);
    v20 = 0;
  }
  CFAllocatorDeallocate(0, v10);
  return v20;
}

uint64_t AFCOperationCreateLinkPath(const __CFAllocator *a1, uint64_t a2, CFStringRef theString, const __CFString *a4, uint64_t a5)
{
  CFIndex Length;
  CFIndex v11;
  char *v12;
  CFIndex *v13;
  const char *v14;
  uint64_t CString;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  size_t v23;
  size_t v24;
  uint64_t v25;
  int v27;
  char v28;

  Length = CFStringGetLength(theString);
  v11 = 9 * (CFStringGetLength(a4) + Length);
  v12 = (char *)CFAllocatorAllocate(0, v11 + 52, 0);
  if (!v12)
    return 0;
  v13 = (CFIndex *)v12;
  *((_QWORD *)v12 + 5) = a2;
  v14 = v12 + 48;
  CString = CFStringGetCString(theString, v12 + 48, v11 + 12, 0x8000100u);
  if (!(_DWORD)CString)
  {
    v27 = 1165;
LABEL_10:
    __AFCSetErrorResult_0(CString, v16, v17, v18, v27, v19, v20, v21, v28);
    v25 = 0;
    goto LABEL_5;
  }
  v22 = (char *)&v14[strlen(v14) + 1];
  CString = CFStringGetCString(a4, v22, (char *)v13 + v11 + 52 - v22, 0x8000100u);
  if (!(_DWORD)CString)
  {
    v27 = 1168;
    goto LABEL_10;
  }
  v23 = strlen(v14);
  v24 = strlen(v22);
  AFCHeaderInit(v13, 28, v23 + v24 + 50, 0, 0);
  v25 = AFCOperationCreate(a1, v13, 0, 0, 0, a5);
LABEL_5:
  CFAllocatorDeallocate(0, v13);
  return v25;
}

uint64_t AFCOperationCreateReadDirectory(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6;
  char *v7;
  CFIndex *v8;
  CFIndex v9;
  const char *v10;
  uint64_t CString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  char v21;

  v6 = 9 * CFStringGetLength(theString);
  v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7)
    return 0;
  v8 = (CFIndex *)v7;
  v9 = v6 + 1;
  v10 = v7 + 40;
  CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if ((_DWORD)CString)
  {
    v18 = strlen(v10);
    AFCHeaderInit(v8, 3, v18 + 41, 0, 0);
    v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1200, v15, v16, v17, v21);
    v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateMakeDirectory(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6;
  char *v7;
  CFIndex *v8;
  CFIndex v9;
  const char *v10;
  uint64_t CString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  char v21;

  v6 = 9 * CFStringGetLength(theString);
  v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7)
    return 0;
  v8 = (CFIndex *)v7;
  v9 = v6 + 1;
  v10 = v7 + 40;
  CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if ((_DWORD)CString)
  {
    v18 = strlen(v10);
    AFCHeaderInit(v8, 9, v18 + 41, 0, 0);
    v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1232, v15, v16, v17, v21);
    v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateOpenFile(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4)
{
  CFIndex v8;
  char *v9;
  CFIndex *v10;
  const char *v11;
  uint64_t CString;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  char v22;

  v8 = 9 * CFStringGetLength(theString);
  v9 = (char *)CFAllocatorAllocate(0, v8 + 49, 0);
  if (!v9)
    return 0;
  v10 = (CFIndex *)v9;
  *((_QWORD *)v9 + 5) = a3;
  v11 = v9 + 48;
  CString = CFStringGetCString(theString, v9 + 48, v8 + 1, 0x8000100u);
  if ((_DWORD)CString)
  {
    v19 = strlen(v11);
    AFCHeaderInit(v10, 13, v19 + 49, 0, 0);
    v20 = AFCOperationCreate(a1, v10, 0, 0, 0, a4);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v13, v14, v15, 1265, v16, v17, v18, v22);
    v20 = 0;
  }
  CFAllocatorDeallocate(0, v10);
  return v20;
}

uint64_t AFCOperationCreateGetFileHash(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6;
  char *v7;
  CFIndex *v8;
  CFIndex v9;
  const char *v10;
  uint64_t CString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  char v21;

  v6 = 9 * CFStringGetLength(theString);
  v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7)
    return 0;
  v8 = (CFIndex *)v7;
  v9 = v6 + 1;
  v10 = v7 + 40;
  CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if ((_DWORD)CString)
  {
    v18 = strlen(v10);
    AFCHeaderInit(v8, 29, v18 + 41, 0, 0);
    v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1296, v15, v16, v17, v21);
    v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

uint64_t AFCOperationCreateGetFileHashWithRange(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFIndex v10;
  char *v11;
  CFIndex *v12;
  const char *v13;
  uint64_t CString;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  char v24;

  v10 = 9 * CFStringGetLength(theString);
  v11 = (char *)CFAllocatorAllocate(0, v10 + 57, 0);
  if (!v11)
    return 0;
  v12 = (CFIndex *)v11;
  *((_QWORD *)v11 + 5) = a3;
  *((_QWORD *)v11 + 6) = a4;
  v13 = v11 + 56;
  CString = CFStringGetCString(theString, v11 + 56, v10 + 1, 0x8000100u);
  if ((_DWORD)CString)
  {
    v21 = strlen(v13);
    AFCHeaderInit(v12, 31, v21 + 57, 0, 0);
    v22 = AFCOperationCreate(a1, v12, 0, 0, 0, a5);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v15, v16, v17, 1329, v18, v19, v20, v24);
    v22 = 0;
  }
  CFAllocatorDeallocate(0, v12);
  return v22;
}

uint64_t AFCOperationCreateGetSizeOfPathContents(const __CFAllocator *a1, CFStringRef theString, uint64_t a3, uint64_t a4)
{
  CFIndex v8;
  char *v9;
  CFIndex *v10;
  const char *v11;
  uint64_t CString;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  char v22;

  v8 = 9 * CFStringGetLength(theString);
  v9 = (char *)CFAllocatorAllocate(0, v8 + 49, 0);
  if (!v9)
    return 0;
  v10 = (CFIndex *)v9;
  *((_QWORD *)v9 + 5) = a3;
  v11 = v9 + 48;
  CString = CFStringGetCString(theString, v9 + 48, v8 + 1, 0x8000100u);
  if ((_DWORD)CString)
  {
    v19 = strlen(v11);
    AFCHeaderInit(v10, 33, v19 + 49, 0, 0);
    v20 = AFCOperationCreate(a1, v10, 0, 0, 0, a4);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v13, v14, v15, 1362, v16, v17, v18, v22);
    v20 = 0;
  }
  CFAllocatorDeallocate(0, v10);
  return v20;
}

uint64_t AFCOperationCreateRemovePathAndContents(const __CFAllocator *a1, CFStringRef theString, uint64_t a3)
{
  CFIndex v6;
  char *v7;
  CFIndex *v8;
  CFIndex v9;
  const char *v10;
  uint64_t CString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  char v21;

  v6 = 9 * CFStringGetLength(theString);
  v7 = (char *)CFAllocatorAllocate(0, v6 + 41, 0);
  if (!v7)
    return 0;
  v8 = (CFIndex *)v7;
  v9 = v6 + 1;
  v10 = v7 + 40;
  CString = CFStringGetCString(theString, v7 + 40, v9, 0x8000100u);
  if ((_DWORD)CString)
  {
    v18 = strlen(v10);
    AFCHeaderInit(v8, 34, v18 + 41, 0, 0);
    v19 = AFCOperationCreate(a1, v8, 0, 0, 0, a3);
  }
  else
  {
    __AFCSetErrorResult_0(CString, v12, v13, v14, 1393, v15, v16, v17, v21);
    v19 = 0;
  }
  CFAllocatorDeallocate(0, v8);
  return v19;
}

void __AFCOperationFinalize(uint64_t a1)
{
  const void *v2;
  void *v3;
  void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  AFCLog(5, "%s(%p)\n", "__AFCOperationFinalize", (const void *)a1);
  v2 = *(const void **)(a1 + 64);
  if (v2)
    CFRelease(v2);
  *(_QWORD *)(a1 + 64) = 0;
  v3 = *(void **)(a1 + 72);
  if (v3)
  {
    CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 80), v3);
    *(_QWORD *)(a1 + 72) = 0;
  }
  v4 = *(void **)(a1 + 88);
  if (v4)
  {
    CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 96), v4);
    *(_QWORD *)(a1 + 88) = 0;
  }
  v5 = *(const void **)(a1 + 240);
  if (v5)
    CFRelease(v5);
  *(_QWORD *)(a1 + 240) = 0;
  v6 = *(const void **)(a1 + 256);
  if (v6)
    CFRelease(v6);
  *(_QWORD *)(a1 + 256) = 0;
  v7 = *(const void **)(a1 + 248);
  if (v7)
    CFRelease(v7);
  *(_QWORD *)(a1 + 248) = 0;
}

__CFString *__AFCOperationCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  const __CFString *v4;
  CFStringRef v5;
  CFStringRef v6;
  __CFString *Mutable;

  v2 = CFGetAllocator((CFTypeRef)a1);
  v3 = *(unsigned int *)(a1 + 24);
  if (v3 <= 5)
    v4 = __OperationStates[v3];
  else
    v4 = CFSTR("Invalid");
  v5 = AFCCopyErrorString(*(unsigned int *)(a1 + 40));
  v6 = AFCCopyPacketTypeString(*(_QWORD *)(a1 + 48));
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<AFCOperation %p [%p]> { Packet '%@' (%qu), State '%@' (%d), Status '%@' (0x%x)"), a1, v2, v6, *(_QWORD *)(a1 + 48), v4, *(unsigned int *)(a1 + 24), v5, *(unsigned int *)(a1 + 40));
  if (*(_QWORD *)(a1 + 240))
    CFStringAppendFormat(Mutable, 0, CFSTR(" ResultObject '%@'"), *(_QWORD *)(a1 + 240));
  CFStringAppendFormat(Mutable, 0, CFSTR("}"));
  CFRelease(v5);
  CFRelease(v6);
  return Mutable;
}

void __AFCFileDescriptorFinalize(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;

  AFCLog(5, "__AFCFileDescriptorFinalize(%p)", a1);
  AFCFileDescriptorInvalidate((uint64_t)a1);
  v2 = a1[2];
  if (v2)
  {
    __AFCConnectionRemoveFileDescriptor(v2, a1);
    v3 = (const void *)a1[2];
    if (v3)
      CFRelease(v3);
  }
}

__CFString *__AFCFileDescriptorCopyDescription(_QWORD *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<AFCFileDescriptor %p [%p]> { Connection %p, FileRef %d }"), a1, v2, a1[2], a1[3]);
  return Mutable;
}

uint64_t AFCConnectionSetSocketBlockSize(uint64_t *a1, uint64_t a2)
{
  return __AFCConnectionSetBlockSize(a1, 26, a2, a1 + 12) & 0x1FFF;
}

uint64_t __AFCConnectionSetBlockSize(uint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _OWORD *v11;
  _OWORD *v12;
  int v13;
  uint64_t v14;
  char v15;
  const __CFAllocator *v16;
  void *ptr;
  _OWORD v19[2];
  __int128 v20;
  _OWORD v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  memset(v19, 0, sizeof(v19));
  memset(v21, 0, sizeof(v21));
  ptr = 0;
  v8 = AFCLockLock(a1[17]);
  if ((_DWORD)v8
    || (AFCHeaderInit(v19, a2, 48, 0, 0),
        *((_QWORD *)&v20 + 1) = a3,
        v8 = AFCSendHeader((uint64_t)a1, (uint64_t)v19),
        (_DWORD)v8))
  {
    v14 = v8;
LABEL_17:
    if ((_DWORD)v14)
      AFCConnectionSetFatalError((uint64_t)a1, v14);
    goto LABEL_19;
  }
  v9 = AFCReadPacketHeader((uint64_t)a1, (uint64_t)v21, 0x80uLL, &ptr);
  v10 = ptr;
  if ((_DWORD)v9)
  {
    v14 = v9;
    v15 = 0;
  }
  else
  {
    if (ptr)
      v11 = ptr;
    else
      v11 = v21;
    if (*((_QWORD *)v11 + 4) == 1)
    {
      v12 = v21;
      if (ptr)
        v12 = ptr;
      v13 = *((_DWORD *)v12 + 10);
      if (v13)
      {
        v14 = v13 | 0xE8004000;
      }
      else
      {
        v14 = 0;
        *a4 = a3;
      }
      v15 = 1;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
  }
  if (v10)
  {
    v16 = CFGetAllocator(a1);
    CFAllocatorDeallocate(v16, ptr);
  }
  if ((v15 & 1) == 0)
    goto LABEL_17;
LABEL_19:
  AFCLockUnlock(a1[17]);
  return v14;
}

uint64_t AFCConnectionGetFSBlockSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t AFCConnectionGetSocketBlockSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

uint64_t AFCConnectionSetFSBlockSize(uint64_t *a1, uint64_t a2)
{
  return __AFCConnectionSetBlockSize(a1, 25, a2, a1 + 11) & 0x1FFF;
}

uint64_t AFCConnectionOpen(CFSocketNativeHandle a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = AFCConnectionCreate(0, a1, 1, 0, a2);
  *a3 = v4;
  if (v4)
    return 0;
  else
    return 3;
}

uint64_t AFCConnectionClose(_QWORD *a1)
{
  AFCConnectionInvalidate(a1);
  CFRelease(a1);
  return 0;
}

uint64_t AFCDeviceInfoOpen(const void *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v11;
  uint64_t DeviceInfo;
  const void *v13;
  uint64_t IOTimeout;
  int ResultStatus;
  const void *ResultObject;
  const void *v17;
  CFTypeID v18;
  const __CFAllocator *v19;
  char v21;

  v8 = 16407;
  if (a1 && a2)
  {
    v11 = CFGetAllocator(a1);
    DeviceInfo = AFCOperationCreateGetDeviceInfo(v11, 0);
    if (DeviceInfo)
    {
      v13 = (const void *)DeviceInfo;
      IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
      ResultStatus = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v13, (double)IOTimeout);
      if (ResultStatus || (ResultStatus = AFCOperationGetResultStatus((uint64_t)v13)) != 0)
      {
        v8 = ResultStatus;
      }
      else
      {
        ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)v13);
        if (ResultObject)
        {
          v17 = ResultObject;
          v18 = CFGetTypeID(ResultObject);
          if (v18 == CFDictionaryGetTypeID())
          {
            v19 = CFGetAllocator(a1);
            v8 = 0;
            *a2 = AFCIteratorCreate(v19, v17);
          }
        }
      }
      CFRelease(v13);
    }
    else
    {
      v8 = 16387;
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 171, "NULL argument", a7, a8, v21);
  }
  return v8 & 0x1FFF;
}

uint64_t __AFCSetErrorResult_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  AFCLog(5, "Setting error result %d, 0x%X, %s, %d\n", -1, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/client-sync.c", a5);
  return AFCSetErrorInfoWithArgs(0, 0xFFFFFFFFLL, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/client-sync.c", a5, a6, &a9);
}

uint64_t AFCFileInfoOpen(CFTypeRef cf, const char *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v12;
  CFStringRef v13;
  const __CFString *v14;
  const __CFAllocator *v15;
  const void *FileInfo;
  uint64_t IOTimeout;
  int ResultStatus;
  const void *ResultObject;
  const void *v20;
  CFTypeID v21;
  const __CFAllocator *v22;
  _QWORD *v23;
  char v25;

  v8 = 16387;
  if (cf && a2 && a3)
  {
    v12 = CFGetAllocator(cf);
    v13 = CFStringCreateWithCString(v12, a2, 0x8000100u);
    if (v13)
    {
      v14 = v13;
      v15 = CFGetAllocator(cf);
      FileInfo = (const void *)AFCOperationCreateGetFileInfo(v15, v14, 0);
      CFRelease(v14);
      if (FileInfo)
      {
        IOTimeout = AFCConnectionGetIOTimeout((uint64_t)cf);
        ResultStatus = AFCConnectionProcessOperation((uint64_t)cf, (uint64_t)FileInfo, (double)IOTimeout);
        if (ResultStatus || (ResultStatus = AFCOperationGetResultStatus((uint64_t)FileInfo)) != 0)
        {
          v8 = ResultStatus;
        }
        else
        {
          ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)FileInfo);
          if (ResultObject && (v20 = ResultObject, v21 = CFGetTypeID(ResultObject), v21 == CFDictionaryGetTypeID()))
          {
            v22 = CFGetAllocator(cf);
            v23 = AFCIteratorCreate(v22, v20);
            if (v23)
            {
              *a3 = v23;
              v8 = 0;
            }
          }
          else
          {
            v8 = 16407;
          }
        }
        CFRelease(FileInfo);
      }
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1((uint64_t)cf, (uint64_t)a2, 3892330503, a4, 203, "NULL argument", a7, a8, v25);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCRemovePath(const void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v11;
  CFStringRef v12;
  const __CFString *v13;
  const __CFAllocator *v14;
  const void *v15;
  uint64_t IOTimeout;
  int v17;
  char v19;

  v8 = 16387;
  if (a1 && a2)
  {
    v11 = CFGetAllocator(a1);
    v12 = CFStringCreateWithCString(v11, a2, 0x8000100u);
    if (v12)
    {
      v13 = v12;
      v14 = CFGetAllocator(a1);
      v15 = (const void *)AFCOperationCreateRemovePath(v14, v13, 0);
      CFRelease(v13);
      if (v15)
      {
        IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        v17 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v15, (double)IOTimeout);
        if (!v17)
          LOWORD(v17) = AFCOperationGetResultStatus((uint64_t)v15);
        v8 = v17;
        CFRelease(v15);
      }
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 243, "NULL argument", a7, a8, v19);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCRenamePath(const void *a1, const char *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v12;
  const __CFString *v13;
  const __CFAllocator *v14;
  CFStringRef v15;
  const __CFString *v16;
  const __CFAllocator *v17;
  uint64_t RenamePath;
  const void *v19;
  uint64_t IOTimeout;
  int v21;
  char v23;

  v8 = 16387;
  if (!a1 || !a2 || !a3)
  {
    v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 270, "NULL argument", a7, a8, v23);
    return v8 & 0x1FFF;
  }
  v12 = CFGetAllocator(a1);
  v13 = CFStringCreateWithCString(v12, a2, 0x8000100u);
  v14 = CFGetAllocator(a1);
  v15 = CFStringCreateWithCString(v14, a3, 0x8000100u);
  v16 = v15;
  if (v13 && v15)
  {
    v17 = CFGetAllocator(a1);
    RenamePath = AFCOperationCreateRenamePath(v17, v13, v16, 0);
    if (RenamePath)
    {
      v19 = (const void *)RenamePath;
      IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
      v21 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v19, (double)IOTimeout);
      if (!v21)
        LOWORD(v21) = AFCOperationGetResultStatus((uint64_t)v19);
      v8 = v21;
      CFRelease(v19);
    }
    goto LABEL_10;
  }
  if (v13)
LABEL_10:
    CFRelease(v13);
  if (v16)
    CFRelease(v16);
  return v8 & 0x1FFF;
}

uint64_t AFCLinkPath(const void *a1, uint64_t a2, const char *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v13;
  const __CFString *v14;
  const __CFAllocator *v15;
  CFStringRef v16;
  const __CFString *v17;
  const __CFAllocator *v18;
  uint64_t LinkPath;
  const void *v20;
  uint64_t IOTimeout;
  int v22;
  char v24;

  v8 = 16387;
  if (!a1 || !a3 || !a4)
  {
    v8 = __AFCSetErrorResult_1((uint64_t)a1, a2, 3892330503, (uint64_t)a4, 299, "NULL argument", a7, a8, v24);
    return v8 & 0x1FFF;
  }
  v13 = CFGetAllocator(a1);
  v14 = CFStringCreateWithCString(v13, a3, 0x8000100u);
  v15 = CFGetAllocator(a1);
  v16 = CFStringCreateWithCString(v15, a4, 0x8000100u);
  v17 = v16;
  if (v14 && v16)
  {
    v18 = CFGetAllocator(a1);
    LinkPath = AFCOperationCreateLinkPath(v18, a2, v14, v17, 0);
    if (LinkPath)
    {
      v20 = (const void *)LinkPath;
      IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
      v22 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v20, (double)IOTimeout);
      if (!v22)
        LOWORD(v22) = AFCOperationGetResultStatus((uint64_t)v20);
      v8 = v22;
      CFRelease(v20);
    }
    goto LABEL_10;
  }
  if (v14)
LABEL_10:
    CFRelease(v14);
  if (v17)
    CFRelease(v17);
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefOpen(const void *a1, char *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v13;
  CFStringRef v14;
  const __CFString *v15;
  const __CFAllocator *v16;
  const void *OpenFile;
  uint64_t IOTimeout;
  int ResultStatus;
  const void *ResultObject;
  CFTypeID v21;
  char v23;

  v8 = 16387;
  if (a1 && a2 && a4)
  {
    v13 = CFGetAllocator(a1);
    v14 = CFStringCreateWithCString(v13, a2, 0x8000100u);
    if (v14)
    {
      v15 = v14;
      v16 = CFGetAllocator(a1);
      OpenFile = (const void *)AFCOperationCreateOpenFile(v16, v15, a3, 0);
      CFRelease(v15);
      if (OpenFile)
      {
        IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        ResultStatus = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)OpenFile, (double)IOTimeout);
        if (ResultStatus || (ResultStatus = AFCOperationGetResultStatus((uint64_t)OpenFile)) != 0)
        {
          v8 = ResultStatus;
        }
        else
        {
          ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)OpenFile);
          AFCFileDescriptorSetRemoteName((uint64_t)ResultObject, a2);
          v8 = 16407;
          if (ResultObject)
          {
            v21 = CFGetTypeID(ResultObject);
            if (v21 == AFCFileDescriptorGetTypeID())
            {
              CFRetain(ResultObject);
              *a4 = ResultObject;
              v8 = 0;
            }
          }
        }
        CFRelease(OpenFile);
      }
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, (uint64_t)a4, 373, "NULL argument", a7, a8, v23);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefRead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t Operation;
  const void *v14;
  uint64_t IOTimeout;
  int ResultStatus;
  const void *ResultObject;
  CFTypeID v18;
  char v20;

  v8 = 16387;
  if (a4 && a1 && a2 && a3)
  {
    AFCFileDescriptorGetRemoteName(a2);
    Operation = AFCFileDescriptorCreateReadOperation(a2, a3, (const void *)*MEMORY[0x24BDBD258], *a4, 0);
    if (Operation)
    {
      v14 = (const void *)Operation;
      IOTimeout = AFCConnectionGetIOTimeout(a1);
      ResultStatus = AFCConnectionProcessOperation(a1, (uint64_t)v14, (double)IOTimeout);
      if (ResultStatus || (ResultStatus = AFCOperationGetResultStatus((uint64_t)v14)) != 0)
      {
        v8 = ResultStatus;
      }
      else
      {
        ResultObject = (const void *)AFCOperationGetResultObject((uint64_t)v14);
        v18 = CFGetTypeID(ResultObject);
        if (v18 == CFDataGetTypeID())
        {
          *a4 = CFDataGetLength((CFDataRef)ResultObject);
          AFCFileDescriptorGetRemoteName(a2);
          v8 = 0;
        }
        else
        {
          v8 = 16407;
        }
      }
      CFRelease(v14);
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, (uint64_t)a4, 412, "NULL argument", a7, a8, v20);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefWrite(uint64_t a1, uint64_t a2, const UInt8 *a3, CFIndex a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 ResultStatus;
  const __CFData *v13;
  const __CFData *v14;
  uint64_t v15;
  const void *v16;
  uint64_t IOTimeout;
  int v18;
  char v20;

  ResultStatus = 16387;
  if (a1 && a2 && a3)
  {
    AFCFileDescriptorGetRemoteName(a2);
    v13 = CFDataCreateWithBytesNoCopy(0, a3, a4, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    if (v13)
    {
      v14 = v13;
      v15 = AFCFileDescriptorCreateWriteOperation(a2, v13, 0);
      if (v15)
      {
        v16 = (const void *)v15;
        IOTimeout = AFCConnectionGetIOTimeout(a1);
        v18 = AFCConnectionProcessOperation(a1, (uint64_t)v16, (double)IOTimeout);
        if (v18)
        {
          ResultStatus = v18;
        }
        else
        {
          ResultStatus = AFCOperationGetResultStatus((uint64_t)v16);
          AFCFileDescriptorGetRemoteName(a2);
        }
        CFRelease(v16);
      }
      CFRelease(v14);
    }
  }
  else
  {
    ResultStatus = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 446, "NULL argument", a7, a8, v20);
  }
  return ResultStatus & 0x1FFF;
}

uint64_t AFCFileRefClose(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 ResultStatus;
  const void *CloseOperation;
  const void *v12;
  uint64_t IOTimeout;
  int v14;
  char v16;

  ResultStatus = 16387;
  if (a1 && a2)
  {
    CloseOperation = AFCFileDescriptorCreateCloseOperation((uint64_t)a2, 0);
    if (CloseOperation)
    {
      v12 = CloseOperation;
      IOTimeout = AFCConnectionGetIOTimeout(a1);
      v14 = AFCConnectionProcessOperation(a1, (uint64_t)v12, (double)IOTimeout);
      if (v14)
      {
        ResultStatus = v14;
      }
      else
      {
        ResultStatus = AFCOperationGetResultStatus((uint64_t)v12);
        AFCFileDescriptorInvalidate((uint64_t)a2);
        CFRelease(a2);
      }
      CFRelease(v12);
    }
  }
  else
  {
    ResultStatus = __AFCSetErrorResult_1(a1, (uint64_t)a2, 3892330503, a4, 475, "NULL argument", a7, a8, v16);
  }
  return ResultStatus & 0x1FFF;
}

uint64_t AFCFileRefSeek(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t SetPositionOperation;
  const void *v11;
  uint64_t IOTimeout;
  int v13;
  char v15;

  v8 = 16387;
  if (a1 && a2)
  {
    SetPositionOperation = AFCFileDescriptorCreateSetPositionOperation(a2, a4, a3, 0);
    if (SetPositionOperation)
    {
      v11 = (const void *)SetPositionOperation;
      IOTimeout = AFCConnectionGetIOTimeout(a1);
      v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13)
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 502, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefTell(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t PositionOperation;
  const void *v12;
  uint64_t IOTimeout;
  int ResultStatus;
  const __CFNumber *ResultObject;
  const __CFNumber *v16;
  CFTypeID v17;
  char v19;

  v8 = 16407;
  if (a1 && a2 && a3)
  {
    PositionOperation = AFCFileDescriptorCreateGetPositionOperation(a2, 0);
    if (PositionOperation)
    {
      v12 = (const void *)PositionOperation;
      IOTimeout = AFCConnectionGetIOTimeout(a1);
      ResultStatus = AFCConnectionProcessOperation(a1, (uint64_t)v12, (double)IOTimeout);
      if (ResultStatus || (ResultStatus = AFCOperationGetResultStatus((uint64_t)v12)) != 0)
      {
        v8 = ResultStatus;
      }
      else
      {
        ResultObject = (const __CFNumber *)AFCOperationGetResultObject((uint64_t)v12);
        if (ResultObject)
        {
          v16 = ResultObject;
          v17 = CFGetTypeID(ResultObject);
          if (v17 == CFNumberGetTypeID())
          {
            if (CFNumberGetValue(v16, kCFNumberSInt64Type, a3))
              v8 = 0;
            else
              v8 = 16407;
          }
        }
      }
      CFRelease(v12);
    }
    else
    {
      v8 = 16387;
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 526, "NULL argument", a7, a8, v19);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefLock(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t LockOperation;
  const void *v11;
  uint64_t IOTimeout;
  int v13;
  char v15;

  v8 = 16387;
  if (a1 && a2)
  {
    LockOperation = AFCFileDescriptorCreateLockOperation(a2, a3, 0);
    if (LockOperation)
    {
      v11 = (const void *)LockOperation;
      IOTimeout = AFCConnectionGetIOTimeout(a1);
      v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13)
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 556, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefSetFileSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t SetSizeOperation;
  const void *v11;
  uint64_t IOTimeout;
  int v13;
  char v15;

  v8 = 16387;
  if (a1 && a2)
  {
    SetSizeOperation = AFCFileDescriptorCreateSetSizeOperation(a2, a3, 0);
    if (SetSizeOperation)
    {
      v11 = (const void *)SetSizeOperation;
      IOTimeout = AFCConnectionGetIOTimeout(a1);
      v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13)
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 580, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCFileRefUnlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t UnlockOperation;
  const void *v11;
  uint64_t IOTimeout;
  int v13;
  char v15;

  v8 = 16387;
  if (a1 && a2)
  {
    UnlockOperation = AFCFileDescriptorCreateUnlockOperation(a2, 0);
    if (UnlockOperation)
    {
      v11 = (const void *)UnlockOperation;
      IOTimeout = AFCConnectionGetIOTimeout(a1);
      v13 = AFCConnectionProcessOperation(a1, (uint64_t)v11, (double)IOTimeout);
      if (!v13)
        LOWORD(v13) = AFCOperationGetResultStatus((uint64_t)v11);
      v8 = v13;
      CFRelease(v11);
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 604, "NULL argument", a7, a8, v15);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCDirectoryOpen(const void *a1, const char *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v12;
  CFStringRef v13;
  const __CFString *v14;
  const __CFAllocator *v15;
  uint64_t Directory;
  uint64_t v17;
  uint64_t IOTimeout;
  int ResultStatus;
  const void *ResultObject;
  const void *v21;
  CFTypeID v22;
  const __CFAllocator *v23;
  const void *v24;
  char v26;

  v8 = 16387;
  if (a1 && a2 && a3)
  {
    v12 = CFGetAllocator(a1);
    v13 = CFStringCreateWithCString(v12, a2, 0x8000100u);
    if (v13)
    {
      v14 = v13;
      v15 = CFGetAllocator(a1);
      Directory = AFCOperationCreateReadDirectory(v15, v14, 0);
      if (Directory)
      {
        v17 = Directory;
        IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        ResultStatus = AFCConnectionProcessOperation((uint64_t)a1, v17, (double)IOTimeout);
        if (ResultStatus || (ResultStatus = AFCOperationGetResultStatus(v17)) != 0)
        {
          v8 = ResultStatus;
        }
        else
        {
          ResultObject = (const void *)AFCOperationGetResultObject(v17);
          v8 = 16407;
          if (ResultObject)
          {
            v21 = ResultObject;
            v22 = CFGetTypeID(ResultObject);
            if (v22 == CFArrayGetTypeID())
            {
              v23 = CFGetAllocator(a1);
              v8 = 0;
              *a3 = AFCIteratorCreate(v23, v21);
            }
          }
        }
        CFRelease(v14);
        v24 = (const void *)v17;
      }
      else
      {
        v24 = v14;
      }
      CFRelease(v24);
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 635, "NULL argument", a7, a8, v26);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCDirectoryRead(uint64_t a1, uint64_t a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  const __CFString *v11;
  CFTypeID v12;
  CFIndex v13;
  char *ValueBuffer;
  char v15;

  if (!a1 || !a2 || !a3)
    return __AFCSetErrorResult_1(a1, a2, 3892330503, a4, 675, "NULL argument", a7, a8, v15) & 0x1FFF;
  result = (uint64_t)AFCIteratorNext(a2);
  if (result)
  {
    v11 = (const __CFString *)result;
    v12 = CFGetTypeID((CFTypeRef)result);
    if (v12 == CFStringGetTypeID())
    {
      v13 = 9 * CFStringGetLength(v11) + 1;
      ValueBuffer = (char *)AFCIteratorGetValueBuffer(a2, v13);
      *a3 = ValueBuffer;
      if (CFStringGetCString(v11, ValueBuffer, v13, 0x8000100u))
        return 0;
      else
        return 23;
    }
    else
    {
      return 7;
    }
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

uint64_t AFCDirectoryClose(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1 || !cf)
    return __AFCSetErrorResult_1(a1, (uint64_t)cf, 3892330503, a4, 705, "NULL argument", a7, a8, vars0) & 0x1FFF;
  CFRelease(cf);
  return 0;
}

uint64_t AFCDirectoryCreate(const void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  const __CFAllocator *v11;
  CFStringRef v12;
  const __CFString *v13;
  const __CFAllocator *v14;
  uint64_t Directory;
  const void *v16;
  uint64_t IOTimeout;
  int v18;
  char v20;

  v8 = 16387;
  if (a1 && a2)
  {
    v11 = CFGetAllocator(a1);
    v12 = CFStringCreateWithCString(v11, a2, 0x8000100u);
    if (v12)
    {
      v13 = v12;
      v14 = CFGetAllocator(a1);
      Directory = AFCOperationCreateMakeDirectory(v14, v13, 0);
      if (Directory)
      {
        v16 = (const void *)Directory;
        IOTimeout = AFCConnectionGetIOTimeout((uint64_t)a1);
        v18 = AFCConnectionProcessOperation((uint64_t)a1, (uint64_t)v16, (double)IOTimeout);
        if (!v18)
          LOWORD(v18) = AFCOperationGetResultStatus((uint64_t)v16);
        v8 = v18;
        CFRelease(v16);
      }
      CFRelease(v13);
    }
  }
  else
  {
    v8 = __AFCSetErrorResult_1((uint64_t)a1, (uint64_t)a2, 3892330503, a4, 720, "NULL argument", a7, a8, v20);
  }
  return v8 & 0x1FFF;
}

uint64_t AFCKeyValueRead(uint64_t TypeID, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  CFTypeID v13;
  const void *Object;
  CFTypeID v15;
  const __CFDictionary *v16;
  const __CFString *Value;
  CFTypeID v18;
  CFIndex v19;
  CFIndex v20;
  const char *v22;
  uint64_t v23;
  int v24;
  char v25;

  if (TypeID && a2 && a3)
  {
    v10 = TypeID;
    v11 = (const __CFString *)AFCIteratorNext(TypeID);
    if (!v11)
    {
      *a2 = 0;
LABEL_14:
      *a3 = 0;
      return (unsigned __int16)v11 & 0x1FFF;
    }
    v12 = v11;
    v13 = CFGetTypeID(v11);
    TypeID = CFStringGetTypeID();
    if (v13 == TypeID)
    {
      Object = (const void *)AFCIteratorGetObject(v10);
      v15 = CFGetTypeID(Object);
      TypeID = CFDictionaryGetTypeID();
      if (v15 == TypeID)
      {
        v16 = (const __CFDictionary *)AFCIteratorGetObject(v10);
        Value = (const __CFString *)CFDictionaryGetValue(v16, v12);
        v18 = CFGetTypeID(Value);
        TypeID = CFStringGetTypeID();
        if (v18 == TypeID)
        {
          v19 = 9 * CFStringGetLength(v12) + 1;
          TypeID = (uint64_t)AFCIteratorGetKeyBuffer(v10, v19);
          *a2 = TypeID;
          if (TypeID)
          {
            TypeID = CFStringGetCString(v12, (char *)TypeID, v19, 0x8000100u);
            if ((_DWORD)TypeID)
            {
              v20 = 9 * CFStringGetLength(Value) + 1;
              TypeID = (uint64_t)AFCIteratorGetValueBuffer(v10, v20);
              *a3 = TypeID;
              if (TypeID)
              {
                TypeID = CFStringGetCString(Value, (char *)TypeID, v20, 0x8000100u);
                if ((_DWORD)TypeID)
                {
                  LOWORD(v11) = 0;
                  return (unsigned __int16)v11 & 0x1FFF;
                }
                v22 = "CString encoding of value failed";
                v23 = 3892330503;
                v24 = 781;
              }
              else
              {
                v23 = 3892330499;
                v22 = "NULL value buffer";
                v24 = 780;
              }
            }
            else
            {
              v22 = "CString encoding of key failed";
              v23 = 3892330503;
              v24 = 776;
            }
          }
          else
          {
            v23 = 3892330499;
            v22 = "NULL key buffer";
            v24 = 775;
          }
        }
        else
        {
          v22 = "value is not a string";
          v23 = 3892330503;
          v24 = 771;
        }
      }
      else
      {
        v22 = "iterator object is not a dictionary";
        v23 = 3892330503;
        v24 = 768;
      }
    }
    else
    {
      v22 = "key is not a string";
      v23 = 3892330503;
      v24 = 766;
    }
  }
  else
  {
    v22 = "NULL argument";
    v23 = 3892330503;
    v24 = 755;
  }
  LODWORD(v11) = __AFCSetErrorResult_1(TypeID, (uint64_t)a2, v23, a4, v24, v22, a7, a8, v25);
  if ((_DWORD)v11)
  {
    if (a2)
      *a2 = 0;
    if (a3)
      goto LABEL_14;
  }
  return (unsigned __int16)v11 & 0x1FFF;
}

uint64_t AFCKeyValueClose(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return __AFCSetErrorResult_1(0, a2, 3892330503, a4, 799, "NULL argument", a7, a8, vars0) & 0x1FFF;
  CFRelease(a1);
  return 0;
}

uint64_t __AFCCreateDictionaryOrArrayFromData(const __CFAllocator *a1, void *a2, uint64_t a3, int a4, CFArrayRef *a5)
{
  uint64_t v5;
  const CFArrayCallBacks *v10;
  const __CFArray *Mutable;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFArray *v17;
  BOOL v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  const void *v23;
  __CFArray *v25;
  CFIndex Count;
  CFIndex v27;
  const void **v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const void **v33;
  CFArrayRef Copy;
  const char *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  char v40;
  CFRange v42;
  CFRange v43;

  v5 = 3892330503;
  if (!a2 || !a5)
    return v5;
  v10 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v12 = (uint64_t)CFArrayCreateMutable(0, 0, v10);
  v17 = (const __CFArray *)v12;
  if (Mutable)
    v18 = v12 == 0;
  else
    v18 = 1;
  if (v18)
  {
    v37 = 3892330499;
    v36 = "CFArrayCreateMutable";
    v38 = 45;
LABEL_33:
    v39 = __AFCSetErrorResult_2(v12, v13, v37, v14, v38, v36, v15, v16, v40);
    goto LABEL_34;
  }
  if (a3 >= 1)
  {
    v19 = 0;
    v20 = 0;
    v21 = a2;
    while (1)
    {
      v12 = (uint64_t)memchr(v21, 0, a3 - v19);
      if (!v12)
      {
        v36 = "Last string is unterminated";
        v37 = 3892330503;
        v38 = 52;
        goto LABEL_33;
      }
      v22 = v12;
      v12 = (uint64_t)CFStringCreateWithBytes(a1, (const UInt8 *)v21, v12 - (_QWORD)v21, 0x8000100u, 0);
      if (!v12)
        break;
      v23 = (const void *)v12;
      if ((v20 & 1) != 0 || a4 == 0)
        v25 = v17;
      else
        v25 = Mutable;
      CFArrayAppendValue(v25, v23);
      CFRelease(v23);
      v21 = (void *)(v22 + 1);
      ++v20;
      v19 = v22 + 1 - (_QWORD)a2;
      if (v19 >= a3)
        goto LABEL_18;
    }
    v36 = "Could not create string object";
    v37 = 3892330503;
    v38 = 55;
    goto LABEL_33;
  }
LABEL_18:
  if (!a4)
  {
    Copy = CFArrayCreateCopy(0, v17);
    goto LABEL_26;
  }
  Count = CFArrayGetCount(Mutable);
  v12 = CFArrayGetCount(v17);
  if (Count != v12)
  {
    v36 = "Key without value";
    v37 = 3892330503;
    v38 = 71;
    goto LABEL_33;
  }
  if (!Count)
  {
    Copy = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
LABEL_26:
    v5 = 0;
    *a5 = Copy;
    if (!Mutable)
      goto LABEL_28;
    goto LABEL_27;
  }
  v27 = CFArrayGetCount(Mutable);
  v28 = (const void **)CFAllocatorAllocate(0, 16 * v27, 0);
  if (v28)
  {
    v33 = v28;
    v42.location = 0;
    v42.length = Count;
    CFArrayGetValues(Mutable, v42, v28);
    v43.length = CFArrayGetCount(v17);
    v43.location = 0;
    CFArrayGetValues(v17, v43, &v33[Count]);
    *a5 = CFDictionaryCreate(0, v33, &v33[Count], Count, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
    CFAllocatorDeallocate(0, v33);
    v5 = 0;
    if (!Mutable)
      goto LABEL_28;
LABEL_27:
    CFRelease(Mutable);
    goto LABEL_28;
  }
  v39 = __AFCSetErrorResult_2(0, v29, 3892330499, v30, 78, "CFAllocatorAllocate failed for %d keys", v31, v32, Count);
LABEL_34:
  v5 = v39;
  if (Mutable)
    goto LABEL_27;
LABEL_28:
  if (v17)
    CFRelease(v17);
  return v5;
}

uint64_t __AFCSetErrorResult_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  AFCLog(5, "Setting error result %d, 0x%X, %s, %d\n", -1, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/connection.c", a5);
  return AFCSetErrorInfoWithArgs(0, 0xFFFFFFFFLL, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/connection.c", a5, a6, &a9);
}

void __AFCConnectionPerformOperationCallBack(uint64_t a1)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;

  AFCLog(5, "%s(%p)\n", "__AFCConnectionPerformOperationCallBack", (const void *)a1);
  AFCLockLock(*(_QWORD *)(a1 + 136));
  CFRetain((CFTypeRef)a1);
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    while (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) < *(int *)(a1 + 112))
    {
      AFCLockUnlock(*(_QWORD *)(a1 + 136));
      v2 = __AFCDequeue(a1, *(const __CFArray **)(a1 + 152));
      if (!v2)
      {
        AFCLockLock(*(_QWORD *)(a1 + 136));
        break;
      }
      v3 = v2;
      if (__AFCConnectionSendOperation(a1, (uint64_t)v2))
      {
        __AFCConnectionNotifyOperationComplete(a1, v3);
        CFRelease(v3);
      }
      else
      {
        __AFCEnqueue(a1, *(__CFArray **)(a1 + 160), v3);
        v3[6] = 4;
      }
      AFCLockLock(*(_QWORD *)(a1 + 136));
      if (*(_DWORD *)(a1 + 16) != 1)
        break;
    }
  }
  v4 = *(unsigned __int8 *)(a1 + 32);
  if (*(_BYTE *)(a1 + 32))
  {
    *(_BYTE *)(a1 + 32) = 0;
    __AFCConnectionUnscheduleFromRunLoop(a1);
  }
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  if (*(_DWORD *)(a1 + 16) == 2)
    __AFCConnectionInvalidate((const void *)a1);
  if (v4)
    AFCConditionSignal(*(_QWORD *)(a1 + 40));
  CFRelease((CFTypeRef)a1);
}

const void *__AFCDequeue(uint64_t a1, const __CFArray *a2)
{
  const void *ValueAtIndex;

  AFCLockLock(*(_QWORD *)(a1 + 136));
  if (CFArrayGetCount(a2) < 1)
  {
    ValueAtIndex = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a2, 0);
    CFArrayRemoveValueAtIndex(a2, 0);
  }
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  return ValueAtIndex;
}

uint64_t __AFCConnectionSendOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t DataLength;
  const UInt8 *BytePtr;
  UInt8 *v11;
  uint64_t v12;
  uint64_t v13;
  void *ErrorInfo;

  v4 = *(_QWORD *)(a2 + 88);
  DataLength = __AFCOperationGetDataLength(a2);
  BytePtr = *(const UInt8 **)(a2 + 64);
  if (BytePtr)
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)BytePtr);
    v11 = (UInt8 *)BytePtr;
    if (!DataLength)
      goto LABEL_6;
  }
  else
  {
    v11 = 0;
    if (!DataLength)
      goto LABEL_6;
  }
  if (!v11)
    return __AFCSetErrorResult_2((uint64_t)BytePtr, v5, 3892330503, v6, 1231, "Invalid data buffer in operation (%p, %d)", v7, v8, 0);
LABEL_6:
  AFCLockLock(*(_QWORD *)(a1 + 136));
  v12 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v12 + 1;
  *(_QWORD *)(v4 + 24) = v12;
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  v13 = AFCSendPacket(a1, v4, v11, DataLength);
  if ((_DWORD)v13)
  {
    ErrorInfo = AFCCopyAndClearLastErrorInfo();
    __AFCOperationSetClientErrorWithInfo(a2, v13, (uint64_t)ErrorInfo);
    if (ErrorInfo)
      CFRelease(ErrorInfo);
  }
  return v13;
}

uint64_t __AFCConnectionNotifyOperationComplete(_QWORD *a1, uint64_t a2)
{
  void (*v4)(_QWORD *, uint64_t, uint64_t);

  AFCLog(5, "%s(%p, %p) [%lu]\n", "__AFCConnectionNotifyOperationComplete", a1, (const void *)a2, *(_QWORD *)(a2 + 32) & 1);
  *(_DWORD *)(a2 + 24) = 5;
  v4 = (void (*)(_QWORD *, uint64_t, uint64_t))a1[27];
  if (v4 && (*(_BYTE *)(a2 + 32) & 1) == 0)
    v4(a1, 1, a2);
  __AFCConnectionSignalIOLoop((uint64_t)a1);
  return AFCConditionSignal(*(_QWORD *)(a2 + 256));
}

uint64_t __AFCEnqueue(uint64_t a1, __CFArray *a2, const void *a3)
{
  AFCLockLock(*(_QWORD *)(a1 + 136));
  CFArrayAppendValue(a2, a3);
  CFArrayGetCount(a2);
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

void __AFCConnectionUnscheduleFromRunLoop(uint64_t a1)
{
  __CFRunLoop *v2;
  __CFRunLoopSource *v3;
  __CFRunLoopSource *v4;

  AFCLog(5, "__AFCConnectionUnscheduleFromRunLoop(%p)", (const void *)a1);
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) > 0 || CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) >= 1)
    AFCLog(1, "WARNING: unscheduling from run loop with outstanding requests!");
  v2 = *(__CFRunLoop **)(a1 + 192);
  if (v2)
  {
    v3 = *(__CFRunLoopSource **)(a1 + 176);
    if (v3)
    {
      CFRunLoopRemoveSource(v2, v3, *(CFRunLoopMode *)(a1 + 200));
      CFRelease(*(CFTypeRef *)(a1 + 176));
      *(_QWORD *)(a1 + 176) = 0;
      v2 = *(__CFRunLoop **)(a1 + 192);
    }
    v4 = *(__CFRunLoopSource **)(a1 + 184);
    if (v4)
    {
      CFRunLoopRemoveSource(v2, v4, *(CFRunLoopMode *)(a1 + 200));
      CFRelease(*(CFTypeRef *)(a1 + 184));
      *(_QWORD *)(a1 + 184) = 0;
      v2 = *(__CFRunLoop **)(a1 + 192);
    }
    CFRelease(v2);
    *(_QWORD *)(a1 + 192) = 0;
    CFRelease(*(CFTypeRef *)(a1 + 200));
    *(_QWORD *)(a1 + 200) = 0;
  }
}

void __AFCConnectionInvalidate(const void *a1)
{
  CFTypeRef v1;
  int v2;
  __CFSocket *v3;
  int v4;
  int v5;
  __CFRunLoopSource *v6;
  __CFRunLoopSource *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  void (*v19)(void);
  char v20;
  uint64_t __buf;

  v1 = a1;
  __buf = (uint64_t)a1;
  AFCLog(5, "__AFCConnectionInvalidate(%p)", a1);
  AFCLockLock(*((_QWORD *)v1 + 17));
  v2 = *((_DWORD *)v1 + 4);
  if (v2 == 1)
  {
    AFCLog(2, "Warning: connection %p state going from valid->invalid", v1);
  }
  else if (!v2)
  {
    AFCLockUnlock(*((_QWORD *)v1 + 17));
    return;
  }
  *((_DWORD *)v1 + 4) = 0;
  CFRetain(v1);
  v3 = (__CFSocket *)*((_QWORD *)v1 + 6);
  if (v3)
  {
    CFSocketInvalidate(v3);
    CFRelease(*((CFTypeRef *)v1 + 6));
    *((_QWORD *)v1 + 6) = 0;
  }
  v4 = *((_DWORD *)v1 + 14);
  if (v4 != -1 && *((_BYTE *)v1 + 60))
  {
    shutdown(v4, 2);
    close(*((_DWORD *)v1 + 14));
    *((_DWORD *)v1 + 14) = -1;
  }
  v5 = *((_DWORD *)v1 + 316);
  if (v5 != -1)
  {
    write(v5, &__buf, 1uLL);
    v1 = (CFTypeRef)__buf;
  }
  v6 = (__CFRunLoopSource *)*((_QWORD *)v1 + 22);
  if (v6)
  {
    CFRunLoopSourceInvalidate(v6);
    v1 = (CFTypeRef)__buf;
    *(_QWORD *)(__buf + 176) = 0;
  }
  v7 = (__CFRunLoopSource *)*((_QWORD *)v1 + 23);
  if (v7)
  {
    CFRunLoopSourceInvalidate(v7);
    v1 = (CFTypeRef)__buf;
    *(_QWORD *)(__buf + 184) = 0;
  }
  v8 = __AFCDequeue((uint64_t)v1, *((const __CFArray **)v1 + 19));
  if (v8)
  {
    v12 = v8;
    do
    {
      __AFCOperationSetClientError((uint64_t)v12, 3892330507, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/connection.c", 970, "Connection invalidated", v9, v10, v11, v20);
      __AFCConnectionNotifyOperationComplete(__buf, v12);
      CFRelease(v12);
      v12 = __AFCDequeue(__buf, *(const __CFArray **)(__buf + 152));
    }
    while (v12);
  }
  v13 = __AFCDequeue(__buf, *(const __CFArray **)(__buf + 160));
  if (v13)
  {
    v17 = v13;
    do
    {
      __AFCOperationSetClientError((uint64_t)v17, 3892330507, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/connection.c", 982, "Connection invalidated", v14, v15, v16, v20);
      __AFCConnectionNotifyOperationComplete(__buf, v17);
      CFRelease(v17);
      v17 = __AFCDequeue(__buf, *(const __CFArray **)(__buf + 160));
    }
    while (v17);
  }
  AFCConditionSignal(*(_QWORD *)(__buf + 24));
  v18 = __buf;
  v19 = *(void (**)(void))(__buf + 216);
  if (v19)
  {
    v19();
    v18 = __buf;
  }
  AFCLockUnlock(*(_QWORD *)(v18 + 136));
  CFRelease((CFTypeRef)__buf);
}

uint64_t __AFCConnectionProcessData(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v8;

  AFCLockLock(*(_QWORD *)(a1 + 136));
  CFRetain((CFTypeRef)a1);
  v2 = *(unsigned __int8 *)(a1 + 32);
  if (*(_BYTE *)(a1 + 32))
  {
    *(_BYTE *)(a1 + 32) = 0;
    __AFCConnectionUnscheduleFromRunLoop(a1);
  }
  v3 = 3892330507;
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  if (AFCSocketIsDisconnected(*(_DWORD *)(a1 + 56)))
  {
    AFCLog(5, "Socket closed for connection %p.");
  }
  else
  {
    v4 = __AFCDequeue(a1, *(const __CFArray **)(a1 + 160));
    if (v4)
    {
      v5 = v4;
      v6 = __AFCConnectionReceiveOperation((_QWORD *)a1, (uint64_t)v4);
      if ((_DWORD)v6 != -402636789)
      {
        v8 = v6;
        __AFCConnectionNotifyOperationComplete((_QWORD *)a1, (uint64_t)v5);
        CFRelease(v5);
        v3 = v8;
        if (!v2)
          goto LABEL_11;
        goto LABEL_10;
      }
      AFCLog(5, "Socket closed when reading on connection %p.", (const void *)a1);
      __AFCConnectionNotifyOperationComplete((_QWORD *)a1, (uint64_t)v5);
      CFRelease(v5);
    }
    else
    {
      AFCLog(1, "Data received on connection %p when no reply expected.");
    }
  }
  *(_DWORD *)(a1 + 16) = 2;
  __AFCConnectionInvalidate((const void *)a1);
  if (v2)
LABEL_10:
    AFCConditionSignal(*(_QWORD *)(a1 + 40));
LABEL_11:
  CFRelease((CFTypeRef)a1);
  return v3;
}

uint64_t __AFCConnectionReceiveOperation(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *ErrorInfo;
  uint64_t v10;

  v10 = 0;
  CFRetain(a1);
  v4 = AFCReadPacketHeader((uint64_t)a1, *(_QWORD *)(a2 + 88), *(_QWORD *)(a2 + 104), &v10);
  if ((_DWORD)v4 == -402636789)
  {
    AFCLog(5, "Socket closed when reading.\n");
    AFCConnectionInvalidate(a1);
    v5 = 3892330507;
  }
  else
  {
    v5 = v4;
    v6 = v10;
    if (v10)
    {
      v7 = *(void **)(a2 + 88);
      if (v7)
      {
        CFAllocatorDeallocate(*(CFAllocatorRef *)(a2 + 96), v7);
        v6 = v10;
      }
      *(_QWORD *)(a2 + 88) = v6;
      *(_QWORD *)(a2 + 96) = CFGetAllocator(a1);
    }
    if ((_DWORD)v5 || (v5 = __AFCConnectionDispatchReply((uint64_t)a1, a2), (_DWORD)v5))
    {
      ErrorInfo = AFCCopyAndClearLastErrorInfo();
      __AFCOperationSetClientErrorWithInfo(a2, v5, (uint64_t)ErrorInfo);
      if (ErrorInfo)
        CFRelease(ErrorInfo);
    }
  }
  CFRelease(a1);
  return v5;
}

uint64_t __AFCConnectionAddFileDescriptor(uint64_t a1, const void *a2)
{
  AFCLockLock(*(_QWORD *)(a1 + 136));
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 168), a2);
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

uint64_t __AFCConnectionRemoveFileDescriptor(uint64_t a1, const void *a2)
{
  AFCLockLock(*(_QWORD *)(a1 + 136));
  CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 168), a2);
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

size_t __AFCConnectionSetRoot(uint64_t a1, CFStringRef string)
{
  uint64_t v3;
  size_t result;
  uint64_t v5;

  *(_BYTE *)(a1 + 224) = 0;
  v3 = a1 + 224;
  CFStringGetFileSystemRepresentation(string, (char *)(a1 + 224), 1023);
  result = strlen((const char *)v3);
  *(_QWORD *)(v3 + 1024) = result;
  if (result)
  {
    if (*(_BYTE *)(result + a1 + 223) != 47)
    {
      *(_QWORD *)(a1 + 1248) = result + 1;
      v5 = a1 + 224;
      *(_BYTE *)(v5 + result) = 47;
      *(_BYTE *)(v5 + *(_QWORD *)(a1 + 1248)) = 0;
    }
  }
  return result;
}

uint64_t AFCConnectionCreate(const __CFAllocator *a1, CFSocketNativeHandle a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t Instance;
  uint64_t v11;
  __CFSocket *v12;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v14;
  CFMutableSetRef v15;
  const void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  CFSocketContext context;

  pthread_once(&AFCConnectionGetTypeID_typeIDInit, (void (*)(void))__AFCConnectionRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v11 = Instance;
  if (!Instance)
    goto LABEL_11;
  bzero((void *)(Instance + 16), 0x4E8uLL);
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = (void *)v11;
  v12 = CFSocketCreateWithNative(a1, a2, 1uLL, (CFSocketCallBack)__AFCConnectionSocketCallBack, &context);
  *(_QWORD *)(v11 + 48) = v12;
  if (v12)
  {
    CFSocketSetSocketFlags(v12, 1uLL);
    AFCSetSocketOptions((const void *)v11, a2);
    Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x24BDBD690]);
    *(_QWORD *)(v11 + 152) = Mutable;
    if (Mutable)
    {
      v14 = CFArrayCreateMutable(a1, 0, MEMORY[0x24BDBD690]);
      *(_QWORD *)(v11 + 160) = v14;
      if (v14)
      {
        v15 = CFSetCreateMutable(a1, 0, 0);
        *(_QWORD *)(v11 + 168) = v15;
        if (v15)
        {
          *(_DWORD *)(v11 + 56) = a2;
          *(_BYTE *)(v11 + 60) = a3 != 0;
          *(_QWORD *)(v11 + 216) = a4;
          *(_DWORD *)(v11 + 64) = 0;
          *(_BYTE *)(v11 + 68) = 0;
          *(_OWORD *)(v11 + 80) = xmmword_215810C00;
          *(_QWORD *)(v11 + 96) = 0x100000;
          *(_QWORD *)(v11 + 120) = a5;
          v16 = AFCLockCreate();
          *(_QWORD *)(v11 + 136) = v16;
          if (v16)
          {
            v17 = AFCLockCreate();
            *(_QWORD *)(v11 + 144) = v17;
            if (v17)
            {
              *(_QWORD *)(v11 + 104) = 60;
              *(_DWORD *)(v11 + 112) = 1;
              *(_DWORD *)(v11 + 1256) = kqueue();
              *(_DWORD *)(v11 + 16) = 1;
              v18 = AFCConditionCreate();
              *(_QWORD *)(v11 + 40) = v18;
              if (v18)
              {
                v19 = AFCConditionCreate();
                *(_QWORD *)(v11 + 24) = v19;
                if (v19)
                {
                  AFCCreateSignalFileDescriptors((int *)(v11 + 1260), (int *)(v11 + 1264));
LABEL_11:
                  AFCLog(5, "%s(%p)\n", "AFCConnectionCreate", (const void *)v11);
                  return v11;
                }
              }
            }
          }
        }
      }
    }
  }
  v21 = *(const void **)(v11 + 136);
  if (v21)
    CFRelease(v21);
  v22 = *(const void **)(v11 + 152);
  if (v22)
    CFRelease(v22);
  v23 = *(const void **)(v11 + 160);
  if (v23)
    CFRelease(v23);
  v24 = *(const void **)(v11 + 168);
  if (v24)
    CFRelease(v24);
  v25 = *(const void **)(v11 + 48);
  if (v25)
    CFRelease(v25);
  CFRelease((CFTypeRef)v11);
  return 0;
}

uint64_t AFCConnectionGetTypeID()
{
  pthread_once(&AFCConnectionGetTypeID_typeIDInit, (void (*)(void))__AFCConnectionRegisterClass);
  return __gAFCConnectionTypeID;
}

uint64_t __AFCConnectionSocketCallBack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a2 == 1)
    return __AFCConnectionProcessData(a5);
  return result;
}

uint64_t AFCConnectionSetCallBack(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(_QWORD *)(a1 + 136));
  *(_QWORD *)(a1 + 216) = a2;
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

uint64_t __AFCConnectionRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __gAFCConnectionTypeID = result;
  return result;
}

uint64_t AFCConnectionInvalidate(_QWORD *a1)
{
  uint64_t v1;
  int v2;
  _QWORD *__buf;

  v1 = (uint64_t)a1;
  __buf = a1;
  AFCLog(5, "AFCConnectionInvalidate(%p)", a1);
  AFCLockLock(*(_QWORD *)(v1 + 136));
  if (*(_DWORD *)(v1 + 16) != 1)
    return AFCLockUnlock(*(_QWORD *)(v1 + 136));
  *(_DWORD *)(v1 + 16) = 2;
  AFCLockUnlock(*(_QWORD *)(v1 + 136));
  v2 = *(_DWORD *)(v1 + 1264);
  if (v2 != -1)
  {
    write(v2, &__buf, 1uLL);
    v1 = (uint64_t)__buf;
  }
  __AFCConnectionSignalIOLoop(v1);
  AFCConditionWait(__buf[3], (double)(4 * __buf[13]));
  return AFCLog(5, "AFCConnectionInvalidate done");
}

void __AFCConnectionSignalIOLoop(uint64_t a1)
{
  const void *v2;
  CFRunLoopRef Current;

  if (*(_DWORD *)(a1 + 16))
  {
    v2 = *(const void **)(a1 + 192);
    if (v2 && *(_QWORD *)(a1 + 184) && (Current = CFRunLoopGetCurrent(), !CFEqual(v2, Current)))
    {
      CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 184));
      CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 192));
    }
    else
    {
      __AFCConnectionPerformOperationCallBack(a1);
    }
  }
  else
  {
    AFCLog(4, "SignalIOLoop on an invalid connection");
  }
}

uint64_t AFCConnectionGetIOTimeout(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

BOOL AFCConnectionIsValid(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) == 1;
}

uint64_t AFCConnectionScheduleWithRunLoop(uint64_t a1, void *a2, const __CFString *a3)
{
  uint64_t v6;
  const __CFAllocator *v7;
  __CFRunLoopSource *RunLoopSource;
  const __CFAllocator *v9;
  __CFRunLoopSource *v10;
  CFRunLoopSourceContext v12;

  AFCLockLock(*(_QWORD *)(a1 + 136));
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (*(_QWORD *)(a1 + 192))
    {
      v6 = 3892330503;
      AFCLog(2, "Trying to add to run loop when already on run loop");
    }
    else
    {
      *(_QWORD *)(a1 + 192) = CFRetain(a2);
      *(_QWORD *)(a1 + 200) = CFStringCreateCopy(0, a3);
      if (!*(_QWORD *)(a1 + 176))
      {
        v7 = CFGetAllocator((CFTypeRef)a1);
        RunLoopSource = CFSocketCreateRunLoopSource(v7, *(CFSocketRef *)(a1 + 48), 200);
        *(_QWORD *)(a1 + 176) = RunLoopSource;
        CFRunLoopAddSource((CFRunLoopRef)a2, RunLoopSource, a3);
        CFSocketEnableCallBacks(*(CFSocketRef *)(a1 + 48), 1uLL);
      }
      if (!*(_QWORD *)(a1 + 184))
      {
        v12.version = 0;
        memset(&v12.retain, 0, 56);
        v12.info = (void *)a1;
        v12.perform = (void (__cdecl *)(void *))__AFCConnectionPerformOperationCallBack;
        v9 = CFGetAllocator((CFTypeRef)a1);
        v10 = CFRunLoopSourceCreate(v9, 100, &v12);
        *(_QWORD *)(a1 + 184) = v10;
        CFRunLoopAddSource((CFRunLoopRef)a2, v10, a3);
      }
      AFCLockUnlock(*(_QWORD *)(a1 + 136));
      return 0;
    }
  }
  else
  {
    AFCLockUnlock(*(_QWORD *)(a1 + 136));
    return 3892330507;
  }
  return v6;
}

uint64_t AFCConnectionUnscheduleFromRunLoop(uint64_t a1, const void *a2)
{
  CFRunLoopRef Current;

  Current = CFRunLoopGetCurrent();
  AFCLog(5, "%s(%p, %p) [%p]", "AFCConnectionUnscheduleFromRunLoop", (const void *)a1, a2, Current);
  AFCConnectionInvalidate((_QWORD *)a1);
  AFCLockLock(*(_QWORD *)(a1 + 136));
  if (*(_QWORD *)(a1 + 192))
  {
    if (*(_DWORD *)(a1 + 16))
    {
      *(_BYTE *)(a1 + 32) = 1;
      AFCLockUnlock(*(_QWORD *)(a1 + 136));
      __AFCConnectionSignalIOLoop(a1);
      AFCConditionWait(*(_QWORD *)(a1 + 40), (double)(4 * *(_QWORD *)(a1 + 104)));
      return AFCLog(5, "%s(%p, %p) finished", "AFCConnectionUnscheduleFromRunLoop", (const void *)a1, a2);
    }
    AFCLog(5, "Connection %p already invalid, just unscheduling", (const void *)a1);
    __AFCConnectionUnscheduleFromRunLoop(a1);
  }
  else
  {
    AFCLog(5, "Connection %p already unscheduled", (const void *)a1);
  }
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

uint64_t __AFCConnectionDispatchReply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t *i;
  uint64_t v9;
  BOOL v10;
  uint64_t result;

  AFCLockLock(*(_QWORD *)(a2 + 248));
  v4 = *(_QWORD *)(a2 + 88);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 48);
    v6 = *(_QWORD *)(v4 + 32);
    AFCLockUnlock(*(_QWORD *)(a2 + 248));
    v7 = __AFCProcessStatusPacket;
    for (i = &qword_24D38A878; ; i += 3)
    {
      v9 = *(i - 1);
      v10 = !v9 || v9 == v5;
      if (v10 && *i == v6)
        break;
      v7 = (uint64_t (*)(uint64_t, uint64_t))i[4];
      if (!v7)
      {
        result = 3892330502;
        *(_DWORD *)(a2 + 24) = 5;
        return result;
      }
    }
    *(_DWORD *)(a2 + 24) = 5;
    return v7(a1, a2);
  }
  else
  {
    AFCLockUnlock(*(_QWORD *)(a2 + 248));
    return 3892330519;
  }
}

uint64_t AFCConnectionSubmitOperation(uint64_t a1, _DWORD *a2)
{
  AFCLog(5, "AFCConnectionSubmitOperation(%p, %p)", (const void *)a1, a2);
  if (*(_DWORD *)(a1 + 16) != 1)
    return 3892330507;
  CFRetain(a2);
  a2[6] = 2;
  __AFCEnqueue(a1, *(__CFArray **)(a1 + 152), a2);
  __AFCConnectionSignalIOLoop(a1);
  return 0;
}

uint64_t AFCConnectionProcessOperation(uint64_t a1, uint64_t a2, double a3)
{
  double v3;
  const void *v6;
  CFRunLoopRef Current;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *ErrorInfo;
  double v13;
  CFRunLoopRunResult v14;

  v3 = a3;
  AFCLog(5, "AFCConnectionProcessOperation(%p, %p, %g)", (const void *)a1, (const void *)a2, a3);
  AFCLockLock(*(_QWORD *)(a1 + 136));
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    CFRetain((CFTypeRef)a1);
    v6 = *(const void **)(a1 + 192);
    if (!v6)
    {
      AFCLockUnlock(*(_QWORD *)(a1 + 136));
      AFCLockLock(*(_QWORD *)(a1 + 144));
      v11 = __AFCConnectionSendOperation(a1, a2);
      if (!(_DWORD)v11)
      {
        *(_DWORD *)(a2 + 24) = 4;
        v11 = __AFCConnectionReceiveOperation((_QWORD *)a1, a2);
      }
      AFCLockUnlock(*(_QWORD *)(a1 + 144));
      if ((_DWORD)v11)
      {
        if ((_DWORD)v11 == -402636789)
        {
          AFCLog(5, "Socket closed when reading.\n");
          __AFCConnectionInvalidate((const void *)a1);
        }
        if (!*(_DWORD *)(a2 + 40))
        {
          ErrorInfo = AFCCopyAndClearLastErrorInfo();
          __AFCOperationSetClientErrorWithInfo(a2, v11, (uint64_t)ErrorInfo);
          if (ErrorInfo)
            CFRelease(ErrorInfo);
        }
      }
      __AFCConnectionNotifyOperationComplete((_QWORD *)a1, a2);
      goto LABEL_28;
    }
    Current = CFRunLoopGetCurrent();
    v8 = CFEqual(v6, Current);
    AFCLockUnlock(*(_QWORD *)(a1 + 136));
    v9 = AFCConnectionSubmitOperation(a1, (_DWORD *)a2);
    if ((_DWORD)v9)
    {
      v11 = v9;
      goto LABEL_28;
    }
    v10 = *(_QWORD *)(a2 + 256);
    if (v8)
    {
      if ((AFCConditionIsSignaled(v10) & 1) != 0)
      {
LABEL_6:
        v11 = 0;
LABEL_28:
        CFRelease((CFTypeRef)a1);
        AFCLog(5, "ProcessOperation(%p) = %x", (const void *)a2, v11);
        return v11;
      }
      v11 = 3892330507;
      while (1)
      {
        v13 = CFAbsoluteTimeGetCurrent();
        v14 = CFRunLoopRunInMode(CFSTR("AFCRunLoopMode"), v3, 1u);
        if (v14 != kCFRunLoopRunHandledSource)
          break;
        if (v3 != 0.0)
        {
          v3 = v3 - (CFAbsoluteTimeGetCurrent() - v13);
          if (v3 <= 0.0)
            goto LABEL_27;
        }
        if ((AFCConditionIsSignaled(*(_QWORD *)(a2 + 256)) & 1) != 0)
          goto LABEL_6;
      }
      if ((v14 - 1) < 2)
        goto LABEL_28;
      if (v14 != kCFRunLoopRunTimedOut)
      {
        v11 = 3892330497;
        goto LABEL_28;
      }
    }
    else
    {
      v11 = AFCConditionWait(v10, v3);
      if ((_DWORD)v11 != -402636788)
        goto LABEL_28;
    }
LABEL_27:
    AFCLog(1, "Operation %p timed out!", (const void *)a2);
    v11 = 3892330508;
    goto LABEL_28;
  }
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  return 3892330507;
}

uint64_t AFCConnectionProcessOperations(uint64_t a1, CFTimeInterval a2)
{
  if (*(_DWORD *)(a1 + 16) == 1)
    return __AFCConnectionProcessOperations(a1, a2);
  else
    return 3892330507;
}

uint64_t AFCConnectionGetStatus(uint64_t a1)
{
  if (!a1)
    return 3892330503;
  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  return 0;
}

uint64_t AFCConnectionCopyLastErrorInfo(uint64_t a1)
{
  uint64_t v2;

  AFCLockLock(*(_QWORD *)(a1 + 136));
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
    CFRetain(*(CFTypeRef *)(a1 + 72));
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  return v2;
}

uint64_t AFCConnectionGetContext(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

uint64_t AFCConnectionSetContext(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(_QWORD *)(a1 + 136));
  *(_QWORD *)(a1 + 120) = a2;
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

uint64_t AFCConnectionGetSecureContext(uint64_t a1)
{
  return *(_QWORD *)(a1 + 208);
}

uint64_t AFCConnectionSetSecureContext(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(_QWORD *)(a1 + 136));
  *(_QWORD *)(a1 + 208) = a2;
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

uint64_t AFCConnectionSetDisposeSecureContextOnInvalidate(uint64_t result, char a2)
{
  *(_BYTE *)(result + 61) = a2;
  return result;
}

uint64_t AFCConnectionSetIOTimeout(uint64_t a1, uint64_t a2)
{
  AFCLockLock(*(_QWORD *)(a1 + 136));
  *(_QWORD *)(a1 + 104) = a2;
  return AFCLockUnlock(*(_QWORD *)(a1 + 136));
}

uint64_t AFCConnectionSetFatalError(uint64_t a1, uint64_t a2)
{
  AFCLog(1, "Fatal connection error 0x%x", a2);
  AFCLockLock(*(_QWORD *)(a1 + 136));
  *(_DWORD *)(a1 + 64) = a2;
  *(_BYTE *)(a1 + 68) = 1;
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  return a2;
}

uint64_t __AFCConnectionGetRequestPath(uint64_t a1, char *__src, char *a3, size_t __size)
{
  size_t v4;
  size_t v8;
  uint64_t v9;

  v4 = __size;
  if (!*(_BYTE *)(a1 + 224))
    goto LABEL_4;
  v8 = *(_QWORD *)(a1 + 1248);
  if (v8 < __size)
  {
    memcpy(a3, (const void *)(a1 + 224), v8);
    v9 = *(_QWORD *)(a1 + 1248);
    a3 += v9;
    v4 -= v9;
LABEL_4:
    AFCStringCopy(a3, v4, __src, 0);
    return 1;
  }
  return 0;
}

void __AFCConnectionFinalize(uint64_t a1)
{
  const void *v2;
  int v3;
  const __CFSet *Copy;
  __CFSocket *v5;
  SSLContext *v6;
  const void *v7;
  int v8;
  int v9;
  int v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;

  v2 = *(const void **)(a1 + 136);
  AFCLog(5, "%s(%p)", "__AFCConnectionFinalize", (const void *)a1);
  AFCLockLock((uint64_t)v2);
  v3 = *(_DWORD *)(a1 + 16);
  if (v3 == 1)
  {
    AFCLog(1, "Finalizing connection %p which is still valid");
  }
  else if (v3 == 2)
  {
    AFCLog(1, "Finalizing connection %p which has requested invalidation");
  }
  Copy = CFSetCreateCopy(0, *(CFSetRef *)(a1 + 168));
  CFSetApplyFunction(Copy, (CFSetApplierFunction)__AFCConnectionInvalidateFileDescriptor, (void *)a1);
  CFRelease(Copy);
  v5 = *(__CFSocket **)(a1 + 48);
  if (v5)
  {
    CFSocketInvalidate(v5);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
  }
  v6 = *(SSLContext **)(a1 + 208);
  if (v6 && *(_BYTE *)(a1 + 60) && *(_BYTE *)(a1 + 61))
  {
    SSLClose(v6);
    CFRelease(*(CFTypeRef *)(a1 + 208));
  }
  *(_QWORD *)(a1 + 208) = 0;
  v7 = *(const void **)(a1 + 144);
  if (v7)
  {
    AFCLockLock(*(_QWORD *)(a1 + 144));
    *(_QWORD *)(a1 + 144) = 0;
    AFCLockUnlock((uint64_t)v7);
    AFCLockFree(v7);
  }
  v8 = *(_DWORD *)(a1 + 1256);
  if (v8 != -1)
  {
    close(v8);
    *(_DWORD *)(a1 + 1256) = -1;
  }
  v9 = *(_DWORD *)(a1 + 1260);
  if (v9 != -1)
  {
    close(v9);
    *(_DWORD *)(a1 + 1260) = -1;
  }
  v10 = *(_DWORD *)(a1 + 1264);
  if (v10 != -1)
  {
    close(v10);
    *(_DWORD *)(a1 + 1264) = -1;
  }
  v11 = *(const void **)(a1 + 160);
  if (v11)
    CFRelease(v11);
  v12 = *(const void **)(a1 + 152);
  if (v12)
    CFRelease(v12);
  v13 = *(const void **)(a1 + 168);
  if (v13)
    CFRelease(v13);
  v14 = *(const void **)(a1 + 184);
  if (v14)
    CFRelease(v14);
  v15 = *(const void **)(a1 + 176);
  if (v15)
    CFRelease(v15);
  v16 = *(const void **)(a1 + 192);
  if (v16)
    CFRelease(v16);
  v17 = *(const void **)(a1 + 200);
  if (v17)
    CFRelease(v17);
  v18 = *(const void **)(a1 + 72);
  if (v18)
    CFRelease(v18);
  v19 = *(const void **)(a1 + 40);
  if (v19)
    CFRelease(v19);
  v20 = *(const void **)(a1 + 24);
  if (v20)
    CFRelease(v20);
  *(_QWORD *)(a1 + 136) = 0;
  AFCLockUnlock((uint64_t)v2);
  AFCLockFree(v2);
}

__CFString *__AFCConnectionCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator((CFTypeRef)a1);
  AFCLockLock(*(_QWORD *)(a1 + 136));
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<AFCConnection %p [%p]> {\n"), a1, v2);
  CFStringAppendFormat(Mutable, 0, CFSTR("  FileDescriptor = %d\n"), *(unsigned int *)(a1 + 56));
  CFStringAppendFormat(Mutable, 0, CFSTR("  LastError = %d\n"), *(unsigned int *)(a1 + 64));
  CFStringAppendFormat(Mutable, 0, CFSTR("  FatalError = %d\n"), *(unsigned int *)(a1 + 64));
  CFStringAppendFormat(Mutable, 0, CFSTR("  MaxOperations = %d\n"), *(unsigned int *)(a1 + 112));
  CFStringAppendFormat(Mutable, 0, CFSTR("}"));
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  return Mutable;
}

uint64_t __AFCProcessStatusPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t DataLength;
  const __CFAllocator *v7;
  const __CFAllocator *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  const __CFAllocator *v12;
  int v13;
  unsigned int v14;
  const __CFAllocator *v15;
  CFDictionaryRef v16;
  const void *v17;
  const void *v18;
  CFTypeRef cf;

  v4 = 3892330499;
  v5 = *(_QWORD *)(a2 + 88);
  DataLength = __AFCOperationGetDataLength(a2);
  cf = 0;
  v7 = CFGetAllocator((CFTypeRef)a2);
  v8 = v7;
  if (DataLength < 1)
  {
    v10 = 0;
  }
  else
  {
    v9 = (char *)CFAllocatorAllocate(v7, DataLength, 0);
    if (!v9)
      goto LABEL_21;
    v10 = v9;
    v11 = AFCReadData(a1, v9, DataLength);
    if ((_DWORD)v11)
    {
      v4 = v11;
      goto LABEL_20;
    }
    v12 = CFGetAllocator((CFTypeRef)a2);
    if (__AFCCreateDictionaryOrArrayFromData(v12, v10, DataLength, 1, (CFArrayRef *)&cf))
      cf = 0;
  }
  v13 = *(_DWORD *)(v5 + 40);
  v14 = v13 | 0xE8004000;
  if (!v13)
    v14 = 0;
  *(_DWORD *)(a2 + 40) = v14;
  if (!v13)
  {
    v4 = 0;
    *(_QWORD *)(a2 + 240) = CFRetain((CFTypeRef)*MEMORY[0x24BDBD430]);
    if (!v10)
      goto LABEL_21;
    goto LABEL_20;
  }
  v15 = CFGetAllocator((CFTypeRef)a2);
  v16 = __AFCCreateErrorObject(v15, *(unsigned int *)(a2 + 40), (uint64_t)cf);
  *(_QWORD *)(a2 + 240) = v16;
  if (v16)
    v4 = 0;
  else
    v4 = 3892330499;
  AFCLockLock(*(_QWORD *)(a1 + 136));
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 40);
  v17 = *(const void **)(a1 + 72);
  if (v17)
    CFRelease(v17);
  v18 = *(const void **)(a2 + 240);
  *(_QWORD *)(a1 + 72) = v18;
  if (v18)
    CFRetain(v18);
  AFCLockUnlock(*(_QWORD *)(a1 + 136));
  if (v10)
LABEL_20:
    CFAllocatorDeallocate(v8, v10);
LABEL_21:
  if (cf)
    CFRelease(cf);
  return v4;
}

uint64_t __AFCProcessFileRefOpen(const void *a1, _QWORD *cf)
{
  uint64_t v4;
  CFAllocatorRef v5;
  uint64_t result;

  v4 = cf[11];
  v5 = CFGetAllocator(cf);
  cf[30] = AFCFileDescriptorCreate((uint64_t)v5, a1, *(_QWORD *)(v4 + 40));
  result = AFCDiscardBodyData((uint64_t)a1, v4);
  if (!(_DWORD)result)
  {
    if (cf[30])
      return 0;
    else
      return 3892330499;
  }
  return result;
}

uint64_t __AFCProcessDictReply(uint64_t a1, uint64_t a2)
{
  return __AFCProcessArrayOrDictReply(a1, a2, 1);
}

uint64_t __AFCProcessArrayReply(uint64_t a1, uint64_t a2)
{
  return __AFCProcessArrayOrDictReply(a1, a2, 0);
}

uint64_t __AFCProcessDataPacket(uint64_t a1, uint64_t a2)
{
  uint64_t DataLength;
  const __CFAllocator *v5;
  const __CFAllocator *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  CFDataRef v11;
  CFDataRef v12;

  DataLength = __AFCOperationGetDataLength(a2);
  v5 = CFGetAllocator((CFTypeRef)a2);
  v6 = v5;
  if (DataLength < 1)
  {
    v12 = CFDataCreate(v5, 0, 0);
    *(_QWORD *)(a2 + 240) = v12;
    if (v12)
      return 0;
    else
      return 3892330499;
  }
  else
  {
    v7 = 3892330499;
    v8 = *(char **)(a2 + 72);
    if (!v8)
    {
      v9 = CFAllocatorAllocate(v5, DataLength, 0);
      *(_QWORD *)(a2 + 72) = v9;
      if (!v9)
        return v7;
      *(_QWORD *)(a2 + 80) = v6;
      CFRetain(v6);
      v8 = *(char **)(a2 + 72);
    }
    v10 = AFCReadData(a1, v8, DataLength);
    if ((_DWORD)v10)
    {
      return v10;
    }
    else
    {
      v11 = CFDataCreateWithBytesNoCopy(v6, *(const UInt8 **)(a2 + 72), DataLength, *(CFAllocatorRef *)(a2 + 80));
      *(_QWORD *)(a2 + 240) = v11;
      if (v11)
      {
        *(_QWORD *)(a2 + 72) = 0;
        CFRelease(*(CFTypeRef *)(a2 + 80));
        v7 = 0;
        *(_QWORD *)(a2 + 80) = 0;
      }
    }
  }
  return v7;
}

uint64_t __AFCProcessFileRefTell(uint64_t a1, _QWORD *cf)
{
  uint64_t v4;
  const __CFAllocator *v5;
  uint64_t result;
  uint64_t valuePtr;

  v4 = cf[11];
  valuePtr = *(_QWORD *)(v4 + 40);
  v5 = CFGetAllocator(cf);
  cf[30] = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  result = AFCDiscardBodyData(a1, v4);
  if (!(_DWORD)result)
  {
    if (cf[30])
      return 0;
    else
      return 3892330499;
  }
  return result;
}

uint64_t __AFCProcessArrayOrDictReply(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t DataLength;
  const __CFAllocator *v8;
  const __CFAllocator *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;

  v6 = 3892330499;
  DataLength = __AFCOperationGetDataLength(a2);
  v8 = CFGetAllocator((CFTypeRef)a2);
  v9 = v8;
  v10 = *(char **)(a2 + 72);
  if (!v10)
  {
    v11 = CFAllocatorAllocate(v8, DataLength, 0);
    *(_QWORD *)(a2 + 72) = v11;
    if (!v11)
      return v6;
    *(_QWORD *)(a2 + 80) = v9;
    CFRetain(v9);
    v10 = *(char **)(a2 + 72);
  }
  v12 = AFCReadData(a1, v10, DataLength);
  if ((_DWORD)v12)
    return v12;
  v13 = __AFCCreateDictionaryOrArrayFromData(v9, *(void **)(a2 + 72), DataLength, a3, (CFArrayRef *)(a2 + 240));
  if (v13)
    v14 = 0;
  else
    v14 = *(_QWORD *)(a2 + 240) == 0;
  if (v14)
    return 3892330499;
  else
    return v13;
}

uint64_t AFCCompareAndSwap32(int a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldxr(a3);
    if (v3 != a1)
      break;
    if (!__stxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t __AFCLockRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __gAFCLockTypeID = result;
  return result;
}

const void *AFCLockCreate()
{
  uint64_t Instance;
  const void *v1;
  int v2;
  pthread_mutexattr_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4.__sig = 0;
  *(_QWORD *)v4.__opaque = 0;
  if (pthread_mutexattr_init(&v4)
    || (pthread_mutexattr_settype(&v4, 2),
        pthread_once(&AFCLockGetTypeID_typeIDInit, (void (*)(void))__AFCLockRegisterClass),
        (Instance = _CFRuntimeCreateInstance()) == 0))
  {
    pthread_mutexattr_destroy(&v4);
    return 0;
  }
  v1 = (const void *)Instance;
  v2 = pthread_mutex_init((pthread_mutex_t *)(Instance + 16), &v4);
  pthread_mutexattr_destroy(&v4);
  if (v2)
  {
    CFRelease(v1);
    return 0;
  }
  return v1;
}

uint64_t AFCLockLock(uint64_t a1)
{
  uint64_t v1;

  if (!a1)
    return 3892330503;
  v1 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  return AFCErrnoToAFCDomainError(v1, 3892330519);
}

uint64_t AFCLockUnlock(uint64_t a1)
{
  uint64_t v1;

  if (!a1)
    return 3892330503;
  v1 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return AFCErrnoToAFCDomainError(v1, 3892330519);
}

uint64_t AFCReadData(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v4;
  size_t v7;
  ssize_t v8;
  unint64_t SocketBlockSize;
  size_t v10;
  const timespec *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  ssize_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  char v32;
  char v33;
  _QWORD v34[2];
  SSLConnectionRef connection;

  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  if (!a3)
    return 0;
  v7 = 0;
  v8 = 0;
  v34[0] = AFCConnectionGetIOTimeout(a1);
  v34[1] = 0;
  while (1)
  {
    SocketBlockSize = AFCConnectionGetSocketBlockSize(a1);
    if (SocketBlockSize >= a3 - v7)
      v10 = a3 - v7;
    else
      v10 = SocketBlockSize;
    if (v34[0])
      v11 = (const timespec *)v34;
    else
      v11 = 0;
    if (!*(_QWORD *)(a1 + 208))
    {
      while (1)
      {
        v18 = __WaitForTimeoutOrEvent(a1, 1, v11);
        if ((_DWORD)v18)
          return v18;
        v19 = recv(*(_DWORD *)(a1 + 56), a2, v10, 0);
        if ((v19 & 0x8000000000000000) == 0)
          break;
        v23 = *__error();
        if ((_DWORD)v23 != 35 && (_DWORD)v23 != 4)
        {
          LODWORD(v19) = 1;
          v25 = 3892330500;
          v26 = 617;
          v27 = "recv";
LABEL_38:
          v4 = __AFCSetErrorResult_3(v19, v23, v25, v20, v26, v27, v21, v22, v32);
          goto LABEL_31;
        }
      }
      if (v19)
      {
        v4 = 0;
        v8 = v19;
        goto LABEL_31;
      }
      v25 = 3892330507;
      v23 = 0xFFFFFFFFLL;
      v26 = 619;
      v27 = "recv connection closed";
      goto LABEL_38;
    }
    AFCLog(5, "%s on ctx %p for %u bytes.", "__SecureRecvWithTimeout", *(const void **)(a1 + 208), v10);
    if (v10)
    {
      connection = 0;
      v12 = SSLGetConnection(*(SSLContextRef *)(a1 + 208), &connection);
      if ((_DWORD)v12)
      {
        v28 = v12;
        v29 = 505;
        v30 = "SSLGetConnection";
LABEL_42:
        v16 = __AFCSetErrorResult_3(1, v28, 3892330500, v13, v29, v30, v14, v15, v33);
      }
      else
      {
        AFCLog(5, "%s on ctx %p with fd %d.", "__SecureRecvWithTimeout", *(const void **)(a1 + 208), (_DWORD)connection);
        while (1)
        {
          v16 = __WaitForTimeoutOrEvent(a1, 1, v11);
          if ((_DWORD)v16)
            break;
          connection = 0;
          v17 = SSLRead(*(SSLContextRef *)(a1 + 208), a2, v10, (size_t *)&connection);
          if ((_DWORD)v17 != -9803)
          {
            v28 = v17;
            if (v17 >> 1 == 2147478745)
            {
              v8 = 0;
              v4 = 0;
              connection = 0;
              goto LABEL_30;
            }
            if (!(_DWORD)v17)
            {
              v4 = 0;
              v8 = (ssize_t)connection;
              goto LABEL_30;
            }
            v29 = 538;
            v30 = "SSLRead";
            goto LABEL_42;
          }
          AFCLog(4, "Reading %lu bytes gets SSL error %d, amount_sent %lu\n", v10, -9803, connection);
          if (connection)
          {
            v4 = 0;
            v8 = (ssize_t)connection;
            goto LABEL_30;
          }
        }
      }
      v4 = v16;
    }
    else
    {
      v8 = 0;
      v4 = 0;
    }
LABEL_30:
    AFCLog(5, "%s returned %d.", "__SecureRecvWithTimeout", v4);
LABEL_31:
    if ((_DWORD)v4 || !v8)
      break;
    v7 += v8;
    a2 += v8;
    if (v7 >= a3)
      goto LABEL_45;
  }
  if ((_DWORD)v4)
    return v4;
LABEL_45:
  if (v7)
  {
    if (v7 < v10)
    {
      v4 = __AFCSetErrorResult_3(1, 0xFFFFFFFFLL, 3892330500, v20, 808, "Read underrun (%d < %d)", v21, v22, v7);
      AFCConnectionSetFatalError(a1, v4);
      return v4;
    }
    return 0;
  }
  return __AFCSetErrorResult_3(0, 0xFFFFFFFFLL, 3892330507, v20, 804, "Read length 0", v21, v22, v32);
}

uint64_t __AFCSetErrorResult_3(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  AFCLog(5, "Setting error result %d, 0x%X, %s, %d\n", a2, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/platform.c", a5);
  return AFCSetErrorInfoWithArgs(a1, a2, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/platform.c", a5, a6, &a9);
}

uint64_t AFCSendData(uint64_t a1, char *a2, unint64_t a3)
{
  uint64_t v4;
  char *v7;
  unint64_t v8;
  unint64_t SocketBlockSize;
  size_t v10;
  const timespec *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  ssize_t v26;
  uint64_t v27;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD v40[2];
  SSLConnectionRef connection;
  size_t processed;

  if (*(_BYTE *)(a1 + 68))
    return *(unsigned int *)(a1 + 64);
  if (!a3)
    return 0;
  v7 = a2;
  if (!a2)
    return 3892330503;
  v8 = 0;
  v40[0] = AFCConnectionGetIOTimeout(a1);
  v40[1] = 0;
  while (1)
  {
    SocketBlockSize = AFCConnectionGetSocketBlockSize(a1);
    if (SocketBlockSize >= a3 - v8)
      v10 = a3 - v8;
    else
      v10 = SocketBlockSize;
    if (v40[0])
      v11 = (const timespec *)v40;
    else
      v11 = 0;
    v12 = *(const void **)(a1 + 208);
    if (!v12)
    {
      while (1)
      {
        v25 = __WaitForTimeoutOrEvent(a1, 2, v11);
        if ((_DWORD)v25)
          return v25;
        v26 = send(*(_DWORD *)(a1 + 56), v7, v10, 0);
        if ((v26 & 0x8000000000000000) == 0)
        {
          v19 = v26;
          v4 = 0;
          goto LABEL_32;
        }
        v20 = *__error();
        if ((_DWORD)v20 != 35 && (_DWORD)v20 != 4)
        {
          v4 = __AFCSetErrorResult_3(1, v20, 3892330501, v21, 753, "send", v22, v23, v38);
          goto LABEL_46;
        }
      }
    }
    processed = 0;
    AFCLog(5, "%s on ctx %p for %u bytes.", "__SecureSendWithTimeout", v12, v10);
    if (v10)
    {
      connection = 0;
      v13 = SSLGetConnection(*(SSLContextRef *)(a1 + 208), &connection);
      if ((_DWORD)v13)
      {
        v27 = v13;
        v29 = 650;
        v30 = "SSLGetConnection";
LABEL_42:
        v17 = __AFCSetErrorResult_3(1, v27, 3892330501, v14, v29, v30, v15, v16, v39);
      }
      else
      {
        AFCLog(5, "%s on ctx %p with fd %d.", "__SecureSendWithTimeout", *(const void **)(a1 + 208), (_DWORD)connection);
        while (1)
        {
          v17 = __WaitForTimeoutOrEvent(a1, 2, v11);
          if ((_DWORD)v17)
            break;
          v18 = SSLWrite(*(SSLContextRef *)(a1 + 208), v7, v10, &processed);
          if ((_DWORD)v18 != -9803)
          {
            v27 = v18;
            if (!(_DWORD)v18)
            {
              v4 = 0;
              v19 = processed;
              goto LABEL_31;
            }
            v29 = 676;
            v30 = "SSLWrite";
            goto LABEL_42;
          }
          AFCLog(4, "Writing %lu bytes gets SSL error %d, amount_sent %lu\n", v10, -9803, processed);
          v19 = processed;
          if (processed)
          {
            v4 = 0;
            goto LABEL_31;
          }
        }
      }
      v4 = v17;
      v19 = 0;
    }
    else
    {
      v19 = 0;
      v4 = 3892330503;
    }
LABEL_31:
    AFCLog(5, "%s returned %d.", "__SecureSendWithTimeout", v4);
LABEL_32:
    if (!v19 || (_DWORD)v4 != 0)
      break;
    v4 = 0;
    v8 += v19;
    v7 += v19;
    if (v8 >= a3)
      return v4;
  }
LABEL_46:
  if ((_DWORD)v4)
    return v4;
  if (v8)
  {
    v34 = __error();
    v4 = __AFCSetErrorResult_3(1, *v34, 3892330501, v35, 864, "Write underrun (%d < %d)", v36, v37, v8);
    AFCConnectionSetFatalError(a1, v4);
    return v4;
  }
  return __AFCSetErrorResult_3(1, 0xFFFFFFFFLL, 3892330507, v31, 862, "Write length 0", v32, v33, v38);
}

uint64_t AFCSetSocketOptions(const void *a1, int a2)
{
  int *v4;
  char *v5;
  int *v6;
  char *v7;
  int *v8;
  char *v9;
  uint64_t result;
  int *v11;
  char *v12;
  _QWORD v13[2];
  int v14;

  v14 = 1;
  v13[0] = AFCConnectionGetIOTimeout((uint64_t)a1);
  v13[1] = 0;
  if (setsockopt(a2, 6, 1, &v14, 4u) < 0)
  {
    v4 = __error();
    v5 = strerror(*v4);
    AFCLog(5, "Setting TCP_NODELAY on connection %p failed: %s", a1, v5);
  }
  if (fcntl(a2, 4, 4) < 0)
  {
    v6 = __error();
    v7 = strerror(*v6);
    AFCLog(5, "Setting O_NONBLOCK on connection %p failed: %s\n", a1, v7);
  }
  if (setsockopt(a2, 0xFFFF, 4101, v13, 0x10u) < 0)
  {
    v8 = __error();
    v9 = strerror(*v8);
    AFCLog(4, "Setting SO_SNDTIMEO on connection %p failed: %s", a1, v9);
  }
  result = setsockopt(a2, 0xFFFF, 4102, v13, 0x10u);
  if ((result & 0x80000000) != 0)
  {
    v11 = __error();
    v12 = strerror(*v11);
    return AFCLog(4, "Setting SO_RCVTIMEO on connection %p failed: %s", a1, v12);
  }
  return result;
}

uint64_t AFCLog(int a1, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  return AFCLogV(a1, a2, va);
}

BOOL AFCSocketIsDisconnected(int a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  int v5;
  int v7;
  timespec v9;
  kevent changelist;
  uint64_t v11;
  uint64_t v12;

  if (a1 == -1)
    return 1;
  v11 = v1;
  v12 = v2;
  v4 = kqueue();
  if (v4 < 0)
    return 0;
  v5 = v4;
  changelist.ident = a1;
  *(_DWORD *)&changelist.filter = 2490367;
  memset(&changelist.fflags, 0, 20);
  if (kevent(v4, &changelist, 1, 0, 0, 0))
  {
    close(v5);
    return 0;
  }
  v9.tv_sec = 0;
  v9.tv_nsec = 0;
  v7 = kevent(v5, 0, 0, &changelist, 1, &v9);
  close(v5);
  if (v7 < 0)
    return 0;
  return v7 == 1 && (changelist.flags & 0x8000u) != 0;
}

uint64_t AFCCreateSignalFileDescriptors(int *a1, int *a2)
{
  uint64_t result;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *a1 = -1;
  *a2 = -1;
  v6 = 1;
  result = socketpair(1, 1, 0, &v7);
  if (!(_DWORD)result)
  {
    if (setsockopt(v7, 0xFFFF, 4130, &v6, 4u) == -1
      || (result = setsockopt(v8, 0xFFFF, 4130, &v6, 4u), (_DWORD)result == -1))
    {
      close(v7);
      return close(v8);
    }
    else
    {
      v5 = v8;
      *a1 = v7;
      *a2 = v5;
    }
  }
  return result;
}

uint64_t AFCGetFilesystemInfo(const char *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t f_bsize;
  char v16;
  statfs v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  memset(&v17, 0, 512);
  if (statfs(a1, &v17))
  {
    v10 = __error();
    return __AFCSetErrorResult_3(0, *v10, 3892330497, v11, 1029, "statfs", v12, v13, v16);
  }
  else
  {
    f_bsize = v17.f_bsize;
    AFCLog(5, "Filesystem info for '%s': total %llu, free %llu, block size %lu, iosize %lu", a1, v17.f_blocks * v17.f_bsize, v17.f_bavail * v17.f_bsize, v17.f_bsize, v17.f_iosize);
    if (a4)
      *a4 = f_bsize;
    if (a2)
      *a2 = v17.f_blocks * f_bsize;
    if (a3)
      *a3 = v17.f_bavail * f_bsize;
    result = 0;
    if (a5)
      *a5 = v17.f_iosize;
  }
  return result;
}

uint64_t AFCPlatformInitialize()
{
  return pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
}

CFNumberRef __AFCPlatformInitialize()
{
  const char *v0;
  NSObject *v1;
  CFNumberRef result;

  __gAFCLogLock = (uint64_t)AFCLockCreate();
  v0 = getprogname();
  __gAFCASLClient = (uint64_t)asl_open(v0, "com.apple.afc", 2u);
  pthread_key_create((pthread_key_t *)&__gAFCErrorInfoKey, (void (__cdecl *)(void *))MEMORY[0x24BDBC298]);
  __AFCLogPreferencesChanged(0);
  v1 = MEMORY[0x24BDAC9B8];
  notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", (int *)&gAFCProfileNotificationToken, MEMORY[0x24BDAC9B8], &__block_literal_global);
  notify_register_dispatch("com.apple.afc.preferencesChanged", &gAFCLogLevelNotificationToken, v1, &__block_literal_global_50);
  result = CFNumberCreate(0, kCFNumberDoubleType, &AFCafcVersionNumber);
  __gAFCVersion = (uint64_t)result;
  return result;
}

uint64_t AFCSetLogLevel(uint64_t result)
{
  gAFCLogLevel = (int)result > 0;
  return result;
}

uint64_t AFCLogV(int a1, const char *a2, va_list a3)
{
  uint64_t result;
  FILE **v7;

  result = pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
  if (gAFCLogLevel == 6)
  {
    v7 = (FILE **)MEMORY[0x24BDAC8D8];
    vfprintf((FILE *)*MEMORY[0x24BDAC8D8], a2, a3);
    return fflush(*v7);
  }
  else if (gAFCLogLevel >= a1 || gAFCVerboseLogEnabled != 0)
  {
    AFCLockLock(__gAFCLogLock);
    asl_vlog((asl_object_t)__gAFCASLClient, 0, 3, a2, a3);
    return AFCLockUnlock(__gAFCLogLock);
  }
  return result;
}

uint64_t __AFCConditionRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __gAFCConditionTypeID = result;
  return result;
}

uint64_t AFCConditionCreate()
{
  uint64_t Instance;
  uint64_t v1;

  pthread_once(&AFCConditionGetTypeID_typeIDInit, (void (*)(void))__AFCConditionRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v1 = Instance;
  if (Instance)
  {
    if (!pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0))
    {
      if (!pthread_cond_init((pthread_cond_t *)(v1 + 80), 0))
      {
        *(_BYTE *)(v1 + 128) = 0;
        return v1;
      }
      pthread_mutex_destroy((pthread_mutex_t *)(v1 + 16));
    }
    CFRelease((CFTypeRef)v1);
    return 0;
  }
  return v1;
}

uint64_t AFCConditionIsSignaled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t AFCConditionSignal(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  int v4;

  v2 = (pthread_mutex_t *)(a1 + 16);
  v3 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (!(_DWORD)v3)
  {
    *(_BYTE *)(a1 + 128) = 1;
    v4 = pthread_cond_broadcast((pthread_cond_t *)(a1 + 80));
    v3 = (pthread_mutex_unlock(v2) | v4) != 0;
  }
  return AFCErrnoToAFCDomainError(v3, 3892330519);
}

uint64_t AFCConditionWait(uint64_t a1, double a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  BOOL v10;
  timespec v12;

  v4 = (pthread_mutex_t *)(a1 + 16);
  v5 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (!(_DWORD)v5)
  {
    v6 = (uint64_t)((a2 - floor(a2)) * 1000000000.0);
    while (1)
    {
      v7 = *(unsigned __int8 *)(a1 + 128);
      if (*(_BYTE *)(a1 + 128))
        break;
      if (a2 == 0.0)
      {
        v8 = pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
      }
      else
      {
        v12.tv_sec = 0;
        v12.tv_nsec = 0;
        v12.tv_sec = time(0) + (uint64_t)a2;
        v12.tv_nsec = v6;
        v8 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 80), v4, &v12);
      }
      v9 = v8;
      if (v8)
        goto LABEL_10;
    }
    v9 = 0;
    *(_BYTE *)(a1 + 128) = 0;
LABEL_10:
    LODWORD(v5) = pthread_mutex_unlock(v4);
    if ((_DWORD)v5)
      v10 = v7 == 0;
    else
      v10 = 1;
    if (v10)
      v5 = v9;
    else
      v5 = v5;
  }
  return AFCErrnoToAFCDomainError(v5, 3892330519);
}

uint64_t __AFCConnectionProcessOperations(uint64_t a1, CFTimeInterval a2)
{
  uint64_t v2;
  CFRunLoopRef Current;
  CFRunLoopRunResult v6;
  unsigned int v7;
  CFRunLoopRef v8;

  if (*(_QWORD *)(a1 + 192))
    return 3892330513;
  Current = CFRunLoopGetCurrent();
  AFCConnectionScheduleWithRunLoop(a1, Current, CFSTR("AFCRunLoopMode"));
  do
  {
    if (!AFCConnectionIsValid(a1))
    {
      v2 = 0;
      goto LABEL_12;
    }
    v6 = CFRunLoopRunInMode(CFSTR("AFCRunLoopMode"), a2, 0);
  }
  while (v6 == kCFRunLoopRunHandledSource);
  v7 = -402636788;
  if (v6 != kCFRunLoopRunTimedOut)
    v7 = -402636799;
  if ((v6 - 1) >= 2)
    v2 = v7;
  else
    v2 = 3892330507;
LABEL_12:
  v8 = CFRunLoopGetCurrent();
  AFCConnectionUnscheduleFromRunLoop(a1, v8);
  return v2;
}

const __CFDictionary *__AFCCopyErrorInfoDescription(CFDictionaryRef theDict)
{
  const __CFDictionary *Mutable;
  CFIndex Count;
  uint64_t v3;
  const void **v4;
  const void **v5;
  const void **v6;
  uint64_t v7;

  Mutable = theDict;
  if (theDict)
  {
    Count = CFDictionaryGetCount(theDict);
    if (Count && (v3 = Count, (v4 = (const void **)CFAllocatorAllocate(0, 16 * Count, 0)) != 0))
    {
      v5 = v4;
      CFDictionaryGetKeysAndValues(Mutable, v4, &v4[v3]);
      Mutable = (const __CFDictionary *)CFStringCreateMutable(0, 0);
      if (Mutable && v3 >= 1)
      {
        v6 = v5;
        v7 = v3;
        do
        {
          CFStringAppendFormat((CFMutableStringRef)Mutable, 0, CFSTR("%@=\"%@\" "), *v6, v6[v3]);
          ++v6;
          --v7;
        }
        while (v7);
      }
      CFAllocatorDeallocate(0, v5);
    }
    else
    {
      return 0;
    }
  }
  return Mutable;
}

uint64_t AFCErrorInfoCreateWithArgs(__CFDictionary **a1, uint64_t a2, uint64_t a3, const char *a4, int a5, const char *a6, va_list a7)
{
  int v10;
  __CFDictionary *Mutable;
  CFNumberRef v13;
  CFNumberRef v14;
  CFStringRef v15;
  CFStringRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  const __CFString *v19;
  const __CFString *v20;
  CFStringRef v21;
  CFStringRef v22;
  size_t v23;
  const __CFURL *v24;
  const __CFURL *v25;
  CFStringRef PathComponent;
  CFStringRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  unsigned int valuePtr;
  int v32;
  int v33;
  char __strerrbuf[128];
  uint64_t v35;

  v10 = a2;
  v35 = *MEMORY[0x24BDAC8D0];
  v32 = a5;
  v33 = a2;
  valuePtr = AFCErrnoToAFCDomainError(a2, a3);
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v13 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v13)
    {
      v14 = v13;
      CFDictionarySetValue(Mutable, CFSTR("AFCCode"), v13);
      CFRelease(v14);
    }
    if (v10 != -1)
    {
      strerror_r(v10, __strerrbuf, 0x80uLL);
      v15 = CFStringCreateWithCString(0, __strerrbuf, 0x8000100u);
      if (v15)
      {
        v16 = v15;
        CFDictionarySetValue(Mutable, CFSTR("NSDebugDescription"), v15);
        CFRelease(v16);
      }
      v17 = CFNumberCreate(0, kCFNumberIntType, &v33);
      if (v17)
      {
        v18 = v17;
        CFDictionarySetValue(Mutable, CFSTR("NSUnderlyingError"), v17);
        CFRelease(v18);
      }
    }
    v19 = CFStringCreateWithCStringNoCopy(0, a6, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    if (v19)
    {
      v20 = v19;
      v21 = CFStringCreateWithFormatAndArguments(0, 0, v19, a7);
      if (v21)
      {
        v22 = v21;
        CFDictionarySetValue(Mutable, CFSTR("NSDescription"), v21);
        CFRelease(v22);
      }
      CFRelease(v20);
    }
    if (a4)
    {
      v23 = strlen(a4);
      v24 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)a4, v23, 0);
      if (v24)
      {
        v25 = v24;
        PathComponent = CFURLCopyLastPathComponent(v24);
        if (PathComponent)
        {
          v27 = PathComponent;
          CFDictionarySetValue(Mutable, CFSTR("AFCFileName"), PathComponent);
          CFRelease(v27);
        }
        v28 = CFNumberCreate(0, kCFNumberIntType, &v32);
        if (v28)
        {
          v29 = v28;
          CFDictionarySetValue(Mutable, CFSTR("AFCFileLine"), v28);
          CFRelease(v29);
        }
        CFRelease(v25);
      }
    }
    if (__gAFCVersion)
      CFDictionarySetValue(Mutable, CFSTR("AFCVersion"), (const void *)__gAFCVersion);
  }
  *a1 = Mutable;
  return valuePtr;
}

uint64_t AFCSetErrorInfoWithArgs(int a1, uint64_t a2, uint64_t a3, const char *a4, int a5, const char *a6, va_list a7)
{
  uint64_t v14;
  const __CFDictionary *v15;
  const __CFString *v16;
  const __CFString *v17;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  char *v20;
  char *v21;
  void *v22;
  __CFDictionary *v24;

  v24 = 0;
  pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
  v14 = AFCErrorInfoCreateWithArgs(&v24, a2, a3, a4, a5, a6, a7);
  v15 = v24;
  AFCLog(5, "created error info %p", v24);
  if (v15)
  {
    if (a1 >= 1)
    {
      v16 = (const __CFString *)__AFCCopyErrorInfoDescription(v15);
      if (v16)
      {
        v17 = v16;
        Length = CFStringGetLength(v16);
        MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
        v20 = (char *)CFAllocatorAllocate(0, MaximumSizeForEncoding, 0);
        if (v20)
        {
          v21 = v20;
          if (CFStringGetCString(v17, v20, MaximumSizeForEncoding, 0x8000100u))
            AFCLog(a1, "%s", v21);
          CFAllocatorDeallocate(0, v21);
        }
        CFRelease(v17);
      }
    }
    v22 = pthread_getspecific(__gAFCErrorInfoKey);
    if (v22)
      CFRelease(v22);
    if (pthread_setspecific(__gAFCErrorInfoKey, v15))
    {
      AFCLog(5, "Error setting thread error info");
      CFRelease(v15);
    }
  }
  return v14;
}

void *AFCCopyAndClearLastErrorInfo()
{
  void *v0;

  pthread_once(&__gPlatformInit, (void (*)(void))__AFCPlatformInitialize);
  v0 = pthread_getspecific(__gAFCErrorInfoKey);
  pthread_setspecific(__gAFCErrorInfoKey, 0);
  return v0;
}

uint64_t __AFCLockFinalize(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
}

__CFString *__AFCLockCopyDescription(const void *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<AFCLock %p [%p]> {"), a1, v2);
  CFStringAppendFormat(Mutable, 0, CFSTR("}"));
  return Mutable;
}

uint64_t __WaitForTimeoutOrEvent(uint64_t a1, int a2, const timespec *a3)
{
  SSLContext *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int ident;
  int v13;
  uint64_t v14;
  int16_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  intptr_t *i;
  int v26;
  char v28;
  kevent bufferSize;
  kevent connection;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = *(SSLContext **)(a1 + 208);
  if (v6)
  {
    connection.ident = 0;
    if (a2 == 1)
    {
      bufferSize.ident = 0;
      if (SSLGetBufferedReadSize(v6, &bufferSize.ident))
        v7 = 1;
      else
        v7 = bufferSize.ident == 0;
      if (!v7)
        return 0;
      v6 = *(SSLContext **)(a1 + 208);
    }
    v8 = SSLGetConnection(v6, (SSLConnectionRef *)&connection);
    if ((_DWORD)v8)
    {
      v17 = v8;
      v18 = 3892330500;
      v19 = "SSLGetConnection";
      v20 = 1;
      v21 = 354;
      return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
    }
    ident = connection.ident;
  }
  else
  {
    ident = *(_DWORD *)(a1 + 56);
  }
  if (ident == -1)
    return 0;
  v13 = *(_DWORD *)(a1 + 1256);
  if (v13 == -1)
  {
    v17 = *__error();
    v18 = 3892330519;
    v19 = "kqueue";
    v20 = 1;
    v21 = 380;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  v14 = *(int *)(a1 + 1260);
  connection.ident = ident;
  if (a2 == 1)
    v15 = -1;
  else
    v15 = -2;
  connection.filter = v15;
  connection.flags = 37;
  memset(&connection.fflags, 0, 20);
  if ((_DWORD)v14 == -1)
  {
    v16 = 1;
  }
  else
  {
    v31 = v14;
    v34 = 0;
    v33 = 0;
    v16 = 2;
    v32 = 393215;
    v35 = 0;
  }
  v22 = kevent(v13, &connection, v16, &bufferSize, v16, a3);
  if (v22 == -1)
  {
    v17 = *__error();
    v18 = 3892330519;
    v19 = "kevent failed for kq %d, fd %d, signalFD %d";
    v28 = v13;
    v20 = 1;
    v21 = 407;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  if (!v22)
  {
    v18 = 3892330508;
    v19 = "kevent timeout";
    v20 = 1;
    v17 = 60;
    v21 = 411;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  if (v22 < 1)
    return 0;
  v24 = v22;
  for (i = &bufferSize.data; ; i += 4)
  {
    v26 = *((_DWORD *)i - 4);
    if ((_DWORD)v14 == v26)
    {
      AFCLog(4, "Woke up due to write to signal FD");
      v19 = "kevent connection close wakeup";
      v20 = 0;
      v17 = 0xFFFFFFFFLL;
      v18 = 3892330507;
      v21 = 423;
      return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
    }
    if (ident == v26)
      break;
    AFCLog(1, "Unknown kevent ident %d");
LABEL_38:
    if (!--v24)
      return 0;
  }
  if ((*((_WORD *)i - 3) & 0x4000) != 0)
  {
    v17 = *(unsigned int *)i;
    v19 = "kevent EV_ERROR";
    v20 = 0;
    v18 = 3892330507;
    v21 = 430;
    return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
  }
  if (a2 == 1 && *((__int16 *)i - 4) == -1 && *i)
  {
    if ((*((_WORD *)i - 3) & 0x8000) != 0)
      AFCLog(4, "EV_EOF but %ld bytes available anyway", *i);
    return 0;
  }
  if ((*((_WORD *)i - 3) & 0x8000) == 0)
  {
    if (a2 == 2)
      AFCLog(5, "kevent says ready to write %d bytes on conn %p.");
    goto LABEL_38;
  }
  v23 = 3892330507;
  AFCLog(4, "Woke up due to EOF");
  v17 = *((unsigned int *)i - 1);
  if (!(_DWORD)v17)
    return v23;
  v19 = "kevent EV_EOF";
  v20 = 0;
  v18 = 3892330507;
  v21 = 452;
  return __AFCSetErrorResult_3(v20, v17, v18, v9, v21, v19, v10, v11, v28);
}

uint64_t __AFCLogPreferencesChanged(int a1)
{
  int AppBooleanValue;
  int v3;
  uint64_t result;
  const char *v5;
  const char *v6;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (a1)
    AFCLog(1, "Checking for changed log settings");
  CFPreferencesSynchronize(CFSTR("com.apple.afc"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("VerboseLogging"), CFSTR("com.apple.afc"), &keyExistsAndHasValidFormat);
  v3 = AppBooleanValue;
  if (a1)
    AFCLog(1, "valid %d value %d", keyExistsAndHasValidFormat, AppBooleanValue);
  if (keyExistsAndHasValidFormat)
  {
    gAFCVerboseLogEnabled = v3 != 0;
    result = CFPreferencesAppValueIsForced(CFSTR("VerboseLogging"), CFSTR("com.apple.afc"));
    if (!a1)
      return result;
  }
  else
  {
    result = 0;
    if (!a1)
      return result;
  }
  if (gAFCVerboseLogEnabled)
    v5 = "enabled";
  else
    v5 = "disabled";
  v6 = " by profile";
  if (!(_DWORD)result)
    v6 = (const char *)&unk_21581217B;
  return AFCLog(1, "Verbose logging %s%s", v5, v6);
}

uint64_t __AFCConditionFinalize(uint64_t a1)
{
  *(_BYTE *)(a1 + 128) = 1;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
  return pthread_cond_destroy((pthread_cond_t *)(a1 + 80));
}

__CFString *__AFCConditionCopyDescription(unsigned __int8 *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;

  v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<AFCCondition %p [%p]> { Signaled %d"), a1, v2, a1[128]);
  CFStringAppendFormat(Mutable, 0, CFSTR("}"));
  return Mutable;
}

uint64_t AFCDeviceAppendDeviceInfo(uint64_t a1, CFMutableDataRef theData)
{
  size_t v4;
  size_t v5;
  size_t v6;
  size_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char __str[64];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CFDataAppendBytes(theData, (const UInt8 *)"Model", 6);
  pthread_once(&GetModelName_modelInitialized, (void (*)(void))InitModelName);
  v4 = strlen(gModelName);
  CFDataAppendBytes(theData, (const UInt8 *)gModelName, v4 + 1);
  v10 = 0;
  v11 = 0;
  v9 = 0;
  if (!AFCGetFilesystemInfo((const char *)(a1 + 224), &v9, &v10, &v11, 0))
  {
    CFDataAppendBytes(theData, (const UInt8 *)"FSTotalBytes", 13);
    snprintf(__str, 0x40uLL, "%llu", v9);
    v5 = strlen(__str);
    CFDataAppendBytes(theData, (const UInt8 *)__str, v5 + 1);
    CFDataAppendBytes(theData, (const UInt8 *)"FSFreeBytes", 12);
    snprintf(__str, 0x40uLL, "%llu", v10);
    v6 = strlen(__str);
    CFDataAppendBytes(theData, (const UInt8 *)__str, v6 + 1);
    CFDataAppendBytes(theData, (const UInt8 *)"FSBlockSize", 12);
    snprintf(__str, 0x40uLL, "%lu", v11);
    v7 = strlen(__str);
    CFDataAppendBytes(theData, (const UInt8 *)__str, v7 + 1);
  }
  return 0;
}

char *InitModelName()
{
  char *result;
  size_t v1;
  int *v2;
  size_t v3;

  v3 = 127;
  result = (char *)sysctlbyname("hw.machine", gModelName, &v3, 0, 0);
  if ((result & 0x80000000) != 0)
  {
    v2 = __error();
    AFCLog(1, "Getting model name failed: %d\n", *v2);
    result = AFCStringCopy(gModelName, 0x80uLL, "unknown", 0);
    v1 = 7u;
  }
  else
  {
    v1 = v3;
  }
  gModelName[v1] = 0;
  return result;
}

uint64_t AFCServerContextGetRootPath(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

CFTypeRef AFCServerContextSetRootPath(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 64);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 64) = cf;
  return CFRetain(cf);
}

uint64_t AFCServerContextGetLockdownConnection(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t AFCServerContextSetLockdownConnection(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 72) = a2;
  return result;
}

char *AFCCreateServerContext()
{
  size_t v0;
  char *v1;
  char *v2;
  unint64_t v3;
  char *v4;
  NSObject *v5;
  NSObject *global_queue;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD handler[5];

  pthread_once(&gAFCServerOnce, (void (*)(void))__AFCServerInit);
  v0 = 40 * gAFCMaxOpenFileCount + 80;
  v1 = (char *)malloc_type_malloc(v0, 0x22FD4ED9uLL);
  v2 = v1;
  if (v1)
  {
    bzero(v1, v0);
    if (gAFCMaxOpenFileCount)
    {
      v3 = 0;
      v4 = v2 + 80;
      do
      {
        *(_DWORD *)v4 = -1;
        v5 = dispatch_queue_create("com.apple.afc.fileio", 0);
        *((_QWORD *)v4 + 3) = v5;
        global_queue = dispatch_get_global_queue(gAFCIOPriority, 0);
        dispatch_set_target_queue(v5, global_queue);
        ++v3;
        v4 += 40;
      }
      while (v3 < gAFCMaxOpenFileCount);
    }
    *((_QWORD *)v2 + 7) = dispatch_group_create();
    *((_QWORD *)v2 + 6) = dispatch_semaphore_create(gAFCMaxIORequests);
    v7 = dispatch_queue_create("com.apple.afc.buffercache", 0);
    *((_QWORD *)v2 + 3) = v7;
    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v7);
    v9 = MEMORY[0x24BDAC760];
    *((_QWORD *)v2 + 4) = v8;
    handler[0] = v9;
    handler[1] = 0x40000000;
    handler[2] = __AFCCreateServerContext_block_invoke;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = v2;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 4));
  }
  return v2;
}

uint64_t __AFCServerInit()
{
  int *v0;
  unint64_t v1;
  unint64_t v2;
  size_t v4;
  unint64_t v5;

  v5 = 0;
  v4 = 8;
  if (sysctlbyname("kern.maxvnodes", &v5, &v4, 0, 0))
  {
    v0 = __error();
    AFCLog(1, "sysctl kern.maxvnodes failed: %d\n", *v0);
  }
  if (getdtablesize() >= 32)
    v1 = getdtablesize() - 16;
  else
    v1 = 16;
  v2 = v5 >> 4;
  if (v5 >> 4 >= v1)
    v2 = v1;
  if (v5)
    v1 = v2;
  gAFCMaxOpenFileCount = v1;
  return AFCLog(5, "Max open files: %u\n", v1);
}

void __AFCFlushServerBuffers(uint64_t a1)
{
  void **v2;

  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  while (*(_QWORD *)(a1 + 16))
  {
    v2 = *(void ***)(a1 + 16);
    *(_QWORD *)(a1 + 16) = *v2;
    free(v2[2]);
    free(v2);
  }
}

uint64_t AFCInitServerConnection(uint64_t a1)
{
  uint64_t Context;
  unint64_t v3;
  int v4;
  int v5;
  uint64_t result;
  uint64_t v7;

  Context = AFCConnectionGetContext(a1);
  v3 = gAFCFSBlocksizeDefault;
  if (!gAFCFSBlocksizeDefault)
  {
    v7 = 0x100000;
    v4 = AFCGetFilesystemInfo((const char *)(a1 + 224), 0, 0, 0, &v7);
    v3 = v7;
    if (v4)
      v3 = 0x100000;
  }
  *(_QWORD *)(a1 + 88) = v3;
  v5 = gAFCFSBlocksizeMax;
  if (v3 > gAFCFSBlocksizeMax)
  {
    *(_QWORD *)(a1 + 88) = gAFCFSBlocksizeMax;
    LODWORD(v3) = v5;
  }
  result = AFCLog(5, "Setting server FS blocksize to %u\n", v3);
  *(_QWORD *)(Context + 8) = *(_QWORD *)(a1 + 88);
  return result;
}

uint64_t AFCServerConnectionSetFileCoordinationEnabled(uint64_t result, char a2)
{
  *(_BYTE *)(result + 1268) = a2;
  return result;
}

uint64_t AFCServerConnectionGetFileCoordinationEnabled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1268);
}

uint64_t AFCServerConnectionSetRespectDataProtectionClass(uint64_t result, char a2)
{
  *(_BYTE *)(result + 1269) = a2;
  return result;
}

uint64_t AFCServerConnectionGetRespectDataProtectionClass(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1269);
}

void AFCFlushServerContext(uint64_t a1)
{
  unint64_t v2;
  const void **v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  if (gAFCMaxOpenFileCount)
  {
    v2 = 0;
    v3 = (const void **)(a1 + 112);
    do
    {
      v4 = *((_DWORD *)v3 - 8);
      if (v4 != -1)
      {
        close(v4);
        *((_DWORD *)v3 - 8) = -1;
      }
      if (*v3)
      {
        (*((void (**)(void))*v3 + 2))();
        _Block_release(*v3);
        *v3 = 0;
      }
      ++v2;
      v3 += 5;
    }
    while (v2 < gAFCMaxOpenFileCount);
  }
  v5 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __AFCFlushServerBuffers_block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = a1;
  dispatch_sync(v5, block);
}

void AFCFreeServerContext(uint64_t a1)
{
  unint64_t v2;
  NSObject **v3;
  NSObject *v4;
  const void *v5;

  AFCFlushServerContext(a1);
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  if (gAFCMaxOpenFileCount)
  {
    v2 = 0;
    v3 = (NSObject **)(a1 + 104);
    do
    {
      v4 = *v3;
      v3 += 5;
      dispatch_release(v4);
      ++v2;
    }
    while (v2 < gAFCMaxOpenFileCount);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  v5 = *(const void **)(a1 + 64);
  if (v5)
    CFRelease(v5);
  free((void *)a1);
}

uint64_t AFCProcessServerPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  CFIndex Count;
  CFIndex v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void **v17;
  uint64_t j;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t IntValue;
  int v22;
  const __CFAllocator *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t (*v27)(uint64_t, uint64_t, unint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __darwin_ino64_t st_ino;
  unint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  int v58;
  uint64_t Context;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  BOOL v81;
  off_t st_size;
  uint64_t st_blksize;
  __CFData *Mutable;
  FTSENT *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  FTSENT *v89;
  unsigned int v90;
  int v91;
  stat *fts_statp;
  stat *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  int v103;
  unsigned int v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  int v109;
  int v110;
  uint64_t v111;
  _QWORD *v112;
  int v113;
  std::__fs::filesystem::path *v114;
  std::__fs::filesystem::path *v115;
  uint64_t v116;
  size_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  FTS *v128;
  FTS *v129;
  FTSENT *v130;
  unsigned int fts_info;
  BOOL v132;
  int v133;
  const char *v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  CFURLRef v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unsigned int v144;
  FTS *v145;
  FTS *v146;
  FTSENT *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  unsigned int v154;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  _QWORD *v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const void *v167;
  int v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  unsigned int v178;
  size_t v179;
  _BOOL8 v180;
  unsigned int v181;
  size_t v182;
  int v183;
  char v184;
  int v185;
  uint64_t v186;
  int *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  unsigned int v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  DIR *v199;
  DIR *v200;
  dirent *v201;
  dirent *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  uint64_t v207;
  dirent *v208;
  dirent *v209;
  int v210;
  char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  unint64_t v221;
  int v222;
  _BOOL4 v223;
  NSObject *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  int v230;
  int v231;
  unint64_t v232;
  NSObject *v233;
  unsigned int v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const __CFData *v239;
  FILE *v240;
  FILE *v241;
  int v242;
  const char *v243;
  uint64_t v244;
  char *v245;
  const char *v246;
  int v247;
  int v248;
  const char *i;
  const char *v250;
  unsigned int v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  unsigned int v256;
  unsigned int v257;
  unint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  char *v262;
  int v263;
  unsigned int v264;
  size_t v265;
  size_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  size_t v273;
  size_t v274;
  size_t v275;
  const char *v276;
  ssize_t v277;
  CFIndex v278;
  const UInt8 *v279;
  __CFData *v280;
  CFStringRef v281;
  CFNumberRef v282;
  CFNumberRef v283;
  const __CFDictionary *v284;
  const __CFDictionary *v285;
  const __CFData *v286;
  const __CFData *v287;
  char *v288;
  CFIndex v289;
  const __CFData *v290;
  const __CFDictionary *v291;
  __CFData *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  unsigned int v298;
  unint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  int v303;
  NSObject *v304;
  uint64_t v305;
  uint64_t v306;
  const char *v307;
  int v308;
  int v309;
  unsigned int v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  unint64_t v316;
  uint64_t v317;
  int v318;
  unsigned int *v319;
  int v320;
  unsigned int v321;
  _BOOL4 v322;
  NSObject *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  const void *v329;
  char *v330;
  CFIndex v331;
  const void *v332;
  unsigned int v333;
  uint64_t appended;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  int v338;
  int v339;
  const void *v340;
  unsigned int v341;
  unsigned int v342;
  stat *p_valuePtr;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  std::error_code *v348;
  int v349;
  const __CFAllocator *v350;
  size_t v351;
  CFURLRef v352;
  size_t v353;
  CFURLRef v354;
  BOOL v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  int v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  size_t v364;
  size_t v365;
  uint64_t v366;
  int *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  __CFData *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  size_t v375;
  size_t v376;
  char *BytePtr;
  CFIndex Length;
  char *v379;
  CFIndex v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  int *v387;
  int *v388;
  int *v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  int v393;
  unsigned int v394;
  const void *v395;
  unsigned int v396;
  uint64_t v397;
  int *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  int *v406;
  char v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  const void *v411;
  const void *v412;
  unsigned int v413;
  uint64_t v414;
  int *v415;
  char *v416;
  uint64_t v417;
  uint64_t v418;
  int v419;
  uint64_t v420;
  int v421;
  uint64_t v422;
  int *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  const char *v429;
  int v430;
  uint64_t v431;
  const char *v432;
  uint64_t v433;
  int v434;
  uint64_t v435;
  const char *v436;
  int v437;
  uint64_t v438;
  const char *v439;
  int v440;
  uint64_t v441;
  int v442;
  uint64_t v443;
  const char *v444;
  int v445;
  uint64_t v446;
  int v447;
  uint64_t v448;
  const char *v449;
  int v450;
  uint64_t v451;
  int v452;
  uint64_t v453;
  const char *v454;
  int v455;
  uint64_t v456;
  const char *v457;
  int v458;
  uint64_t v459;
  const char *v460;
  int v461;
  int v462;
  uint64_t v463;
  uint64_t v464;
  unsigned int v465;
  uint64_t v466;
  const char *v467;
  int v468;
  uint64_t v469;
  int v470;
  int *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  int *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  statfs *p_theDict;
  char v480;
  stat *v481;
  char v482;
  char v483;
  stat *v484;
  __CFData *theData;
  uint64_t v486;
  char *v487;
  void (**v488)(_QWORD);
  char __str[16];
  __int128 v490;
  __int128 v491;
  statfs theDict;
  stat valuePtr;
  stat ptr[7];
  uint64_t v495;

  v2 = a2;
  v495 = *MEMORY[0x24BDAC8D0];
  AFCLog(5, "Header packet type %d", *(_QWORD *)(a2 + 32));
  AFCLog(5, "Header len %llu", *(_QWORD *)(v2 + 16));
  AFCLog(5, "Server received packet type 0x%X\n", *(_QWORD *)(v2 + 32));
  switch(*(_QWORD *)(v2 + 32))
  {
    case 1:
      AFCLog(5, "Processing status packet\n");
      v168 = AFCDiscardBodyData(a1, v2);
      AFCSendStatus(a1, v2, v168);
      return 0;
    case 3:
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Read directory '%s'\n", (const char *)&theDict);
        v198 = AFCDiscardBodyData(a1, v2);
        if ((_DWORD)v198)
        {
          v9 = v198;
          v207 = a1;
          v206 = 0;
          goto LABEL_348;
        }
        v199 = opendir((const char *)&theDict);
        if (v199)
        {
          v200 = v199;
          v201 = readdir(v199);
          if (v201)
          {
            v202 = v201;
            LODWORD(v9) = 0;
            do
            {
              AFCLog(5, "dir entry '%s' (%d)\n", v202->d_name, v202->d_namlen);
              v9 = v9 + v202->d_namlen + 1;
              v202 = readdir(v200);
            }
            while (v202);
            rewinddir(v200);
            if ((_DWORD)v9)
            {
              v206 = (char *)malloc_type_malloc(v9, 0x86EC7AF1uLL);
              if (v206)
              {
                v207 = a1;
                v208 = readdir(v200);
                if (v208)
                {
                  v209 = v208;
                  v210 = 0;
                  v211 = v206;
                  do
                  {
                    AFCLog(5, "dir entry '%s' (%d)\n", v209->d_name, v209->d_namlen);
                    if (v210 + v209->d_namlen > v9)
                      break;
                    strlcpy(v211, v209->d_name, (int)v9 - v210);
                    v212 = v209->d_namlen + 1;
                    v210 += v212;
                    v211 += v212;
                    v209 = readdir(v200);
                  }
                  while (v209);
                  v9 = 0;
LABEL_347:
                  closedir(v200);
                  if ((_DWORD)v9)
                  {
LABEL_348:
                    AFCSendStatus(v207, v2, v9);
                    goto LABEL_502;
                  }
LABEL_501:
                  AFCSendDataPacket(v207, v2, v206, v210);
LABEL_502:
                  if (v206)
                    free(v206);
                  return v9;
                }
                v9 = 0;
              }
              else
              {
                v207 = a1;
                v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v203, 1001, "malloc", v204, v205, v482);
              }
              v210 = 0;
              goto LABEL_347;
            }
            v207 = a1;
          }
          else
          {
            v207 = a1;
            rewinddir(v200);
            v9 = 0;
          }
          v210 = 0;
          v206 = 0;
          goto LABEL_347;
        }
        v207 = a1;
        v451 = *__error();
        v448 = 3892330500;
        v449 = "opendir";
        v450 = 0;
        v452 = 988;
      }
      else
      {
        v207 = a1;
        v448 = 3892330498;
        v449 = "AFCConnectionGetRequestPath";
        v450 = 1;
        v451 = 0xFFFFFFFFLL;
        v452 = 980;
      }
      v9 = __AFCSetErrorResult_4(v450, v451, v448, v195, v452, v449, v196, v197, (char)p_theDict);
      v206 = 0;
      v210 = 0;
      if ((_DWORD)v9)
        goto LABEL_348;
      goto LABEL_501;
    case 5:
    case 6:
    case 0xCLL:
      AFCProcessObsoletePacket(a1, v2);
      return 3892330511;
    case 7:
      *(_QWORD *)&ptr[0].st_dev = 0;
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        v336 = 3892330498;
        v337 = "AFCConnectionGetRequestPath";
        v338 = 1;
        v335 = 0xFFFFFFFFLL;
        v339 = 1295;
        goto LABEL_317;
      }
      v159 = AFCDiscardBodyData(a1, v2);
      if (v159)
        goto LABEL_318;
      v159 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 48));
      if (v159)
        goto LABEL_318;
      AFCLog(5, "Processing truncate '%s' %lld\n", (const char *)&theDict, *(_QWORD *)(v2 + 40));
      if (*(_BYTE *)(a1 + 1268))
      {
        v159 = __AFCCoordinateFileActivity((const char *)&theDict, 8, ptr);
        if (v159)
          goto LABEL_318;
      }
      if ((truncate((const char *)&theDict, *(_QWORD *)(v2 + 40)) & 0x80000000) == 0)
      {
        LODWORD(v9) = 0;
        goto LABEL_319;
      }
      v335 = *__error();
      v336 = 3892330497;
      v337 = "truncate";
      v338 = 0;
      v339 = 1312;
      goto LABEL_317;
    case 8:
      *(_QWORD *)&ptr[0].st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing remove path '%s'\n", (const char *)&theDict);
        v159 = AFCDiscardBodyData(a1, v2);
        if (!v159
          && (!*(_BYTE *)(a1 + 1268) || (v159 = __AFCCoordinateFileActivity((const char *)&theDict, 1, ptr)) == 0))
        {
          v159 = RemovePath((const char *)&theDict);
        }
      }
      else
      {
        v336 = 3892330498;
        v337 = "AFCConnectionGetRequestPath";
        v338 = 1;
        v335 = 0xFFFFFFFFLL;
        v339 = 1363;
LABEL_317:
        v159 = __AFCSetErrorResult_4(v338, v335, v336, v156, v339, v337, v157, v158, (char)p_theDict);
      }
LABEL_318:
      LODWORD(v9) = v159;
LABEL_319:
      v340 = *(const void **)&ptr[0].st_dev;
      if (*(_QWORD *)&ptr[0].st_dev)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)&ptr[0].st_dev + 16))(*(_QWORD *)&ptr[0].st_dev);
        _Block_release(v340);
      }
      goto LABEL_321;
    case 9:
      memset(&valuePtr, 0, sizeof(valuePtr));
      *(_QWORD *)__str = 0;
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)ptr, 0x400uLL))
      {
        v178 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330498, v175, 1561, "AFCConnectionGetRequestPath", v176, v177, (char)p_theDict);
        goto LABEL_462;
      }
      AFCLog(5, "Processing make directory '%s'\n", (const char *)ptr);
      v178 = AFCDiscardBodyData(a1, v2);
      if (v178)
      {
LABEL_462:
        v191 = v178;
        goto LABEL_428;
      }
      v179 = strlen((const char *)(a1 + 224));
      v180 = *((unsigned __int8 *)&ptr[0].st_dev + v179) == 47;
      if (*(_BYTE *)(a1 + 1268))
      {
        v181 = __AFCCoordinateFileActivity((const char *)ptr, 8, __str);
        if (v181)
          goto LABEL_370;
      }
      v182 = v179 + v180;
      v183 = -1;
      while (1)
      {
        if (*((_BYTE *)&ptr[0].st_dev + v182))
        {
          if (*((_BYTE *)&ptr[0].st_dev + v182) != 47)
            goto LABEL_174;
          v184 = 0;
        }
        else
        {
          v184 = 1;
        }
        *((_BYTE *)&ptr[0].st_dev + v182) = 0;
        AFCLog(5, "Make intermediate dir '%s'\n", (const char *)ptr);
        if (mkdir((const char *)ptr, 0x1EDu) < 0)
          break;
        if (!*(_BYTE *)(a1 + 1269))
        {
          v185 = open((const char *)ptr, 1048832);
          if (v185 < 0)
          {
            v366 = *__error();
            v367 = __error();
            strerror(*v367);
            v181 = __AFCSetErrorResult_4(1, v366, 3892330519, v368, 1607, "Failed to open %s : %s", v369, v370, (char)ptr);
LABEL_370:
            v191 = v181;
            goto LABEL_428;
          }
          v183 = v185;
          if (fcntl(v185, 64, 4))
          {
            v186 = *__error();
            __error();
            v187 = __error();
            strerror(*v187);
            v191 = __AFCSetErrorResult_4(1, v186, 3892330519, v188, 1612, "Failed to setclass(%d) on directory %s: (%d) %s", v189, v190, 4);
            if (*__error() != 45)
              goto LABEL_427;
            memset(&theDict, 0, 512);
            if (fstatfs(v183, &theDict) < 0)
            {
              v397 = *__error();
              v398 = __error();
              strerror(*v398);
              v191 = __AFCSetErrorResult_4(1, v397, 3892330519, v399, 1621, "Failed fstatfs on directory %s: %s", v400, v401, (char)ptr);
              goto LABEL_427;
            }
            if ((theDict.f_flags & 0x80) != 0)
            {
              AFCLog(3, "The path %s supports content protection, so this is an error", (const char *)ptr);
              goto LABEL_427;
            }
            AFCLog(3, "The path %s doesn't allow content protection, so this is not an error", (const char *)ptr);
          }
        }
LABEL_172:
        if ((v184 & 1) != 0)
        {
          v191 = 0;
          goto LABEL_299;
        }
        *((_BYTE *)&ptr[0].st_dev + v182) = 47;
LABEL_174:
        ++v182;
      }
      if (*__error() != 21 && *__error() != 17)
      {
        v390 = *__error();
        v391 = 3892330497;
        v392 = "mkdir %p";
        v481 = ptr;
        v393 = 1598;
        goto LABEL_406;
      }
      if (stat((const char *)ptr, &valuePtr))
      {
        v424 = *__error();
        v394 = __AFCSetErrorResult_4(1, v424, 3892330497, v425, 1592, "stat %p", v426, v427, (char)ptr);
        goto LABEL_407;
      }
      if ((valuePtr.st_mode & 0xF000) == 0x4000)
        goto LABEL_172;
      v391 = 3892330512;
      v392 = (const char *)ptr;
      v390 = 0xFFFFFFFFLL;
      v393 = 1596;
LABEL_406:
      v394 = __AFCSetErrorResult_4(1, v390, v391, v192, v393, v392, v193, v194, (char)v481);
LABEL_407:
      v191 = v394;
LABEL_299:
      if (v183 < 0)
        goto LABEL_428;
LABEL_427:
      close(v183);
LABEL_428:
      v412 = *(const void **)__str;
      if (*(_QWORD *)__str)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)__str + 16))(*(_QWORD *)__str);
        _Block_release(v412);
      }
      v413 = AFCSendStatus(a1, v2, v191);
      if (v191)
        return v191;
      else
        return v413;
    case 0xALL:
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "AFCProcessGetFileInfo(%s)\n", (const char *)&theDict);
        if ((__AFCPathDepthCheck((const char *)(v2 + 40)) & 1) != 0)
        {
          v75 = AFCDiscardBodyData(a1, v2);
          if ((_DWORD)v75)
            goto LABEL_447;
          AFCLog(5, "lstat(%s)", (const char *)&theDict);
          Mutable = CFDataCreateMutable(0, 0);
          if (Mutable)
          {
            if (!lstat((const char *)&theDict, &valuePtr))
            {
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_size", 8);
              snprintf(__str, 0x80uLL, "%lld", valuePtr.st_size);
              v273 = strlen(__str);
              CFDataAppendBytes(Mutable, (const UInt8 *)__str, v273 + 1);
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_blocks", 10);
              snprintf(__str, 0x80uLL, "%lld", valuePtr.st_blocks);
              v274 = strlen(__str);
              CFDataAppendBytes(Mutable, (const UInt8 *)__str, v274 + 1);
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_nlink", 9);
              snprintf(__str, 0x80uLL, "%d", valuePtr.st_nlink);
              v275 = strlen(__str);
              CFDataAppendBytes(Mutable, (const UInt8 *)__str, v275 + 1);
              CFDataAppendBytes(Mutable, (const UInt8 *)"st_ifmt", 8);
              v276 = "S_IFREG";
              switch((unsigned __int16)((valuePtr.st_mode & 0xF000) + 24576) >> 12)
              {
                case 0:
                  CFDataAppendBytes(Mutable, (const UInt8 *)"S_IFLNK", 8);
                  v277 = readlink((const char *)&theDict, (char *)ptr, 0x400uLL);
                  if ((v277 & 0x8000000000000000) == 0)
                  {
                    *((_BYTE *)&ptr[0].st_dev + v277) = 0;
                    CFDataAppendBytes(Mutable, (const UInt8 *)"LinkTarget", 11);
                    v278 = strlen((const char *)ptr) + 1;
                    v279 = (const UInt8 *)ptr;
                    v280 = Mutable;
                    goto LABEL_366;
                  }
                  goto LABEL_367;
                case 2:
                  v276 = "S_IFSOCK";
                  goto LABEL_365;
                case 7:
                  v276 = "S_IFIFO";
                  goto LABEL_365;
                case 8:
                  v276 = "S_IFCHR";
                  goto LABEL_365;
                case 10:
                  v276 = "S_IFDIR";
                  goto LABEL_365;
                case 12:
                  v276 = "S_IFBLK";
                  goto LABEL_365;
                default:
LABEL_365:
                  v278 = strlen(v276) + 1;
                  v280 = Mutable;
                  v279 = (const UInt8 *)v276;
LABEL_366:
                  CFDataAppendBytes(v280, v279, v278);
LABEL_367:
                  CFDataAppendBytes(Mutable, (const UInt8 *)"st_mtime", 9);
                  snprintf(__str, 0x80uLL, "%llu", valuePtr.st_mtimespec.tv_nsec + 1000000000 * valuePtr.st_mtimespec.tv_sec);
                  v364 = strlen(__str);
                  CFDataAppendBytes(Mutable, (const UInt8 *)__str, v364 + 1);
                  CFDataAppendBytes(Mutable, (const UInt8 *)"st_birthtime", 13);
                  snprintf(__str, 0x80uLL, "%llu", valuePtr.st_birthtimespec.tv_nsec + 1000000000 * valuePtr.st_birthtimespec.tv_sec);
                  v365 = strlen(__str);
                  CFDataAppendBytes(Mutable, (const UInt8 *)__str, v365 + 1);
                  break;
              }
LABEL_378:
              AFCLog(5, "Sending data buffer\n");
              BytePtr = (char *)CFDataGetBytePtr(Mutable);
              Length = CFDataGetLength(Mutable);
              AFCSendDataPacket(a1, v2, BytePtr, Length);
              v9 = 0;
              goto LABEL_379;
            }
            v469 = *__error();
            v466 = 3892330500;
            v467 = "lstat";
            v468 = 0;
            v470 = 1072;
          }
          else
          {
            v466 = 3892330499;
            v467 = "CFDataCreateMutable";
            v468 = 1;
            v469 = 0xFFFFFFFFLL;
            v470 = 1070;
          }
          v9 = __AFCSetErrorResult_4(v468, v469, v466, v270, v470, v467, v271, v272, v483);
LABEL_376:
          if (!(_DWORD)v9)
            goto LABEL_378;
LABEL_377:
          AFCSendStatus(a1, v2, v9);
LABEL_379:
          if (!Mutable)
            return v9;
          v292 = Mutable;
LABEL_381:
          CFRelease(v292);
          return v9;
        }
        v460 = "Request path is outside document root";
        v461 = 0;
        v459 = 3892330503;
        v462 = 1062;
      }
      else
      {
        v459 = 3892330498;
        v460 = "AFCConnectionGetRequestPath";
        v461 = 1;
        v462 = 1054;
      }
      v9 = __AFCSetErrorResult_4(v461, 0xFFFFFFFFLL, v459, v267, v462, v460, v268, v269, (char)p_theDict);
      Mutable = 0;
      goto LABEL_376;
    case 0xBLL:
      AFCLog(5, "Processing device info packet\n");
      v235 = AFCDiscardBodyData(a1, v2);
      if ((_DWORD)v235)
      {
        v9 = v235;
        v239 = 0;
      }
      else
      {
        v239 = CFDataCreateMutable(0, 0);
        if (v239)
        {
          v240 = fopen("/Library/Preferences/SystemConfiguration/com.apple.afc.DeviceInfo.plist", "r");
          if (v240)
          {
            v241 = v240;
            AFCLog(5, "Found info plist file.\n");
            v242 = feof(v241);
            AFCLog(5, "feof %d\n", v242);
            if (feof(v241))
              goto LABEL_383;
            v243 = "got line: '%s'\n";
            v244 = MEMORY[0x24BDAC740];
            theData = v239;
            while (1)
            {
              v245 = fgets((char *)&theDict, 128, v241);
              if (!v245)
              {
                AFCLog(5, "no more lines\n");
LABEL_383:
                AFCLog(5, "Sending data buffer\n");
                v379 = (char *)CFDataGetBytePtr(v239);
                v380 = CFDataGetLength(v239);
                AFCSendDataPacket(a1, v2, v379, v380);
                v9 = 0;
LABEL_384:
                if (v239)
                  CFRelease(v239);
                if (v241)
                  fclose(v241);
                return v9;
              }
              v246 = v245;
              AFCLog(5, v243, v245);
              v247 = *(unsigned __int8 *)v246;
              if (!*v246)
                goto LABEL_222;
              if (v247 != 35)
                break;
              AFCLog(5, "Comment line\n");
LABEL_247:
              if (feof(v241))
                goto LABEL_383;
            }
            do
            {
              if ((v247 & 0x80) != 0)
              {
                if (!__maskrune((char)v247, 0x4000uLL))
                  break;
              }
              else if ((*(_DWORD *)(v244 + 4 * (char)v247 + 60) & 0x4000) == 0)
              {
                break;
              }
              v248 = *(unsigned __int8 *)++v246;
              LOBYTE(v247) = v248;
            }
            while (v248);
LABEL_222:
            for (i = v246; ; ++i)
            {
              if (!*i)
                goto LABEL_247;
              if (*i == 61)
                break;
            }
            v250 = i;
            while (1)
            {
              *v250-- = 0;
              if (v250 <= (const char *)&theDict)
                break;
              v251 = *v250;
              if ((v251 & 0x80000000) != 0)
              {
                if (!__maskrune(v251, 0x4000uLL))
                  break;
              }
              else if ((*(_DWORD *)(v244 + 4 * v251 + 60) & 0x4000) == 0)
              {
                break;
              }
            }
            v252 = v243;
            v253 = v2;
            v254 = a1;
            AFCLog(5, "Key: '%s'\n", v246);
            while (1)
            {
              v255 = i;
              v257 = *++i;
              v256 = v257;
              if (!v257)
                break;
              if ((v256 & 0x80000000) != 0)
              {
                if (!__maskrune(v256, 0x4000uLL))
                  break;
              }
              else if ((*(_DWORD *)(v244 + 4 * v256 + 60) & 0x4000) == 0)
              {
                break;
              }
            }
            v258 = 0;
            v259 = v255;
            v260 = 2;
            do
            {
              v261 = v260;
              v262 = (char *)v259;
              v263 = v255[++v258];
              ++v260;
              ++v259;
            }
            while (v263);
            a1 = v254;
            v2 = v253;
            v243 = v252;
            if (v258 >= 3)
            {
              do
              {
                v264 = *v262;
                if ((v264 & 0x80000000) != 0)
                {
                  if (!__maskrune(v264, 0x4000uLL))
                    break;
                }
                else if ((*(_DWORD *)(v244 + 4 * v264 + 60) & 0x4000) == 0)
                {
                  break;
                }
                *v262-- = 0;
                --v261;
              }
              while (v261 > 3);
            }
            AFCLog(5, "Value: '%s'\n", i);
            v265 = strlen(v246);
            v239 = theData;
            CFDataAppendBytes(theData, (const UInt8 *)v246, v265 + 1);
            v266 = strlen(i);
            CFDataAppendBytes(theData, (const UInt8 *)i, v266 + 1);
            goto LABEL_247;
          }
          AFCLog(5, "No file found\n");
          appended = AFCDeviceAppendDeviceInfo(a1, v239);
        }
        else
        {
          appended = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v236, 1162, "CFDataCreateMutable", v237, v238, (char)p_theDict);
        }
        v9 = appended;
        if (!(_DWORD)appended)
        {
          v241 = 0;
          goto LABEL_383;
        }
      }
      AFCSendStatus(a1, v2, v9);
      v241 = 0;
      goto LABEL_384;
    case 0xDLL:
      Context = AFCConnectionGetContext(a1);
      v488 = 0;
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing FileRefOpen packet\n");
        if (Context)
        {
          v63 = AFCDiscardBodyData(a1, v2);
          if ((_DWORD)v63)
          {
            v9 = v63;
            v69 = 0;
            goto LABEL_422;
          }
          if (gAFCMaxOpenFileCount)
          {
            v67 = 0;
            v68 = Context + 80;
            while (*(_DWORD *)v68 != -1)
            {
              ++v67;
              v68 += 40;
              if (gAFCMaxOpenFileCount == v67)
                goto LABEL_50;
            }
            v487 = (char *)a1;
            if ((v67 & 0x8000000000000000) == 0)
            {
              v344 = *(_QWORD *)(v2 + 40);
              AFCLog(5, "AFCProcessFileRefOpen(%s) mode %d\n", (const char *)&theDict, v344);
              if ((unint64_t)(v344 - 1) >= 7)
              {
                v356 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v345, 2027, "Invalid file mode %d", v346, v347, v344);
                v69 = 0;
                if ((_DWORD)v356)
                {
                  v9 = v356;
                  goto LABEL_421;
                }
              }
              else
              {
                v69 = dword_215810C9C[v344 - 1];
              }
              if (!gAllowSpecialFiles)
                v69 |= 0x100u;
              v357 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 48));
              if ((_DWORD)v357)
              {
                v9 = v357;
                v69 = 0;
                goto LABEL_442;
              }
              if (v487[1268]
                && (!v69 ? (v358 = 1) : (v358 = 8),
                    v359 = __AFCCoordinateFileActivity((const char *)&theDict, v358, &v488),
                    (_DWORD)v359))
              {
                v9 = v359;
                v69 = 0;
              }
              else
              {
                LOBYTE(v484) = -92;
                if (v487[1269])
                  v360 = open((const char *)&theDict, v69);
                else
                  v360 = open_dprotected_np((const char *)&theDict, v69, 4, 0);
                v69 = v360;
                if (v360 == -1)
                {
                  v471 = __error();
                  v9 = __AFCSetErrorResult_4(0, *v471, 3892330497, v472, 2055, "open", v473, v474, 164);
                  v69 = -1;
                  goto LABEL_442;
                }
                if (v360 < 0)
                {
                  __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v361, 191, "file descriptor %d is invalid", v362, v363, v360);
                  v9 = 3892330503;
                }
                else
                {
                  if (gAllowSpecialFiles)
                    goto LABEL_392;
                  memset(ptr, 0, 144);
                  if (fstat(v360, ptr))
                  {
                    v405 = *__error();
                    v406 = __error();
                    v407 = strerror(*v406);
                    __AFCSetErrorResult_4(1, v405, 3892330519, v408, 206, "failed to retrieve file information (%s)", v409, v410, v407);
                    v9 = 23;
                  }
                  else
                  {
                    v421 = ptr[0].st_mode & 0xF000;
                    if (v421 == 0x4000 || v421 == 0x8000)
                    {
LABEL_392:
                      if (fstat(v69, &valuePtr) == -1)
                      {
                        v414 = *__error();
                        v415 = __error();
                        v416 = strerror(*v415);
                        v417 = v414;
                        v418 = 23;
                        v419 = 2062;
                      }
                      else
                      {
                        if (valuePtr.st_nlink != 1)
                        {
                          v420 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 1, v381, 2067, "Failed open operation as there are additional hard links (%d) to the file being opened.", v382, v383, valuePtr.st_nlink);
LABEL_441:
                          v9 = v420;
LABEL_442:
                          a1 = (uint64_t)v487;
                          goto LABEL_52;
                        }
                        v484 = ptr;
                        if (fcntl(v69, 50) == -1)
                        {
                          v422 = *__error();
                          v423 = __error();
                          v416 = strerror(*v423);
                          v417 = v422;
                          v418 = 23;
                          v419 = 2073;
                        }
                        else
                        {
                          if (__AFCHasPrefix((const char *)ptr, v487 + 224))
                          {
                            AFCLog(5, "Setting file descriptor index %d to %d\n", v67, v69);
                            *(_DWORD *)v68 = v69;
                            *(_QWORD *)(v68 + 8) = 0;
                            if (fcntl(v69, 76, 1) < 0)
                            {
                              v387 = __error();
                              AFCLog(5, "F_SINGLE_WRITER failed (%d)!\n", *v387);
                            }
                            if (fcntl(v69, 48, 1) < 0)
                            {
                              v388 = __error();
                              AFCLog(5, "F_NOCACHE failed (%d)!\n", *v388);
                            }
                            if (v344 == 7 && fcntl(v69, 68, 1) < 0)
                            {
                              v389 = __error();
                              AFCLog(5, "F_SETSTATICCONTENT failed (%d)!\n", *v389);
                            }
                            *(_DWORD *)(v68 + 16) = 0;
                            v70 = v67;
                            a1 = (uint64_t)v487;
                            goto LABEL_54;
                          }
                          v416 = "Path obtained by fcntl (%s) doesn't have the correct prefix: %s.";
                          v484 = ptr;
                          v417 = 0xFFFFFFFFLL;
                          v418 = 1;
                          v419 = 2078;
                        }
                      }
                      v420 = __AFCSetErrorResult_4(1, v417, v418, v384, v419, v416, v385, v386, (char)v484);
                      goto LABEL_441;
                    }
                    v9 = 3892330506;
                    __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330506, v402, 200, "file descriptor %d is special file", v403, v404, v69);
                  }
                }
              }
LABEL_421:
              a1 = (uint64_t)v487;
              goto LABEL_422;
            }
          }
          else
          {
LABEL_50:
            v67 = -1;
          }
          v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v64, 2000, "No file slots", v65, v66, (char)p_theDict);
          v69 = 0;
          goto LABEL_52;
        }
        v435 = 3892330499;
        v436 = "No server context";
        v437 = 1994;
      }
      else
      {
        v435 = 3892330498;
        v436 = "AFCConnectionGetRequestPath";
        v437 = 1990;
      }
      v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v435, v60, v437, v436, v61, v62, (char)p_theDict);
      v69 = 0;
      v67 = 0;
LABEL_52:
      if (!(_DWORD)v9)
      {
        v70 = v67;
LABEL_54:
        v490 = 0u;
        v491 = 0u;
        *(_OWORD *)__str = 0u;
        v71 = Context + 40 * v67;
        AFCLog(5, "Success, returning ref %d = fd %d\n", v70, *(_DWORD *)(v71 + 80));
        AFCHeaderInit(__str, 14, 48, 0, v2);
        *((_QWORD *)&v491 + 1) = v67 + 1;
        *(_QWORD *)(v71 + 112) = v488;
        return AFCSendHeader(a1, (uint64_t)__str);
      }
LABEL_422:
      AFCLog(5, "sending status %d\n", v9);
      AFCSendStatus(a1, v2, v9);
      v411 = v488;
      if (v488)
      {
        v488[2](v488);
        _Block_release(v411);
      }
      if (v69 != -1)
        close(v69);
      return v9;
    case 0xFLL:
      v160 = a1;
      v161 = (_QWORD *)v2;
      v162 = 0;
      return AFCProcessFileRefReadPacket(v160, v161, v162);
    case 0x10:
      v111 = a1;
      v112 = (_QWORD *)v2;
      v113 = 0;
      return AFCProcessFileRefWritePacket(v111, v112, v113);
    case 0x11:
      *(_QWORD *)&ptr[0].st_dev = 0;
      ptr[0].st_ino = (__darwin_ino64_t)ptr;
      *(_QWORD *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      v31 = AFCConnectionGetContext(a1);
      if (v31)
      {
        v35 = v31;
        v36 = AFCDiscardBodyData(a1, v2);
        *(_DWORD *)(ptr[0].st_ino + 24) = v36;
        if ((_DWORD)v36)
          goto LABEL_445;
        v37 = (*(_DWORD *)(v2 + 40) - 1);
        AFCLog(5, "Processing FileRefSeek ref %d offset %qd whence %d\n", *(_DWORD *)(v2 + 40) - 1, *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 48));
        if (gAFCMaxOpenFileCount > v37)
        {
          v41 = *(_DWORD *)(v35 + 40 * v37 + 80);
          if (v41 != -1)
          {
            v42 = __AFCAllowedToOperateOnFile(v41, (char *)(a1 + 224), v38, v32, v39, v40, v33, v34);
            st_ino = ptr[0].st_ino;
            *(_DWORD *)(ptr[0].st_ino + 24) = v42;
            if (v42)
            {
              v9 = 1;
              goto LABEL_509;
            }
            *(_DWORD *)(st_ino + 24) = 0;
            v47 = *(_QWORD *)(v2 + 48);
            if (v47 < 3)
            {
LABEL_33:
              v48 = *(NSObject **)(v35 + 40 * v37 + 104);
              *(_QWORD *)&theDict.f_bsize = MEMORY[0x24BDAC760];
              theDict.f_blocks = 0x40000000;
              theDict.f_bfree = (uint64_t)__AFCProcessFileRefSeekPacket_block_invoke;
              theDict.f_bavail = (uint64_t)&unk_24D38AC08;
              theDict.f_ffree = v35;
              theDict.f_fsid = (fsid_t)v2;
              theDict.f_owner = v37;
              theDict.f_type = v47;
              theDict.f_files = (uint64_t)ptr;
              dispatch_sync(v48, &theDict);
              goto LABEL_201;
            }
            v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v43, 2498, "Invalid whence argument", v44, v45, (char)p_theDict);
            *(_DWORD *)(ptr[0].st_ino + 24) = v36;
            if (!(_DWORD)v36)
            {
              LODWORD(v47) = 0;
              goto LABEL_33;
            }
LABEL_445:
            v9 = v36;
LABEL_509:
            AFCSendStatus(a1, v2, v9);
LABEL_205:
            *(_DWORD *)(ptr[0].st_ino + 24) = v9;
LABEL_328:
            p_valuePtr = ptr;
LABEL_329:
            _Block_object_dispose(p_valuePtr, 8);
            return v9;
          }
        }
        v429 = "Invalid file ref";
        v428 = 3892330503;
        v430 = 2480;
      }
      else
      {
        v428 = 3892330499;
        v429 = "No server context";
        v430 = 2471;
      }
      LODWORD(v9) = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v428, v32, v430, v429, v33, v34, (char)p_theDict);
      *(_DWORD *)(ptr[0].st_ino + 24) = v9;
LABEL_202:
      v234 = AFCSendStatus(a1, v2, v9);
      if ((_DWORD)v9)
        v9 = v9;
      else
        v9 = v234;
      goto LABEL_205;
    case 0x12:
      *(_QWORD *)&valuePtr.st_dev = 0;
      valuePtr.st_ino = (__darwin_ino64_t)&valuePtr;
      *(_QWORD *)&valuePtr.st_uid = 0x2000000000;
      valuePtr.st_rdev = -402636799;
      v213 = AFCConnectionGetContext(a1);
      *(_QWORD *)__str = 0;
      *(_QWORD *)&__str[8] = __str;
      v490 = 0x2000000000uLL;
      AFCLog(5, "Processing FileRefTell packet\n");
      if (v213)
      {
        v217 = AFCDiscardBodyData(a1, v2);
        *(_DWORD *)(valuePtr.st_ino + 24) = v217;
        if ((_DWORD)v217)
        {
          v9 = v217;
          goto LABEL_194;
        }
        v221 = (*(_DWORD *)(v2 + 40) - 1);
        if (gAFCMaxOpenFileCount > v221)
        {
          v222 = *(_DWORD *)(v213 + 40 * v221 + 80);
          if (v222 != -1)
          {
            v223 = __AFCAllowedToOperateOnFile(v222, (char *)(a1 + 224), v218, v214, v219, v220, v215, v216);
            *(_DWORD *)(valuePtr.st_ino + 24) = v223;
            if (v223)
            {
              v9 = 1;
              goto LABEL_194;
            }
            v224 = *(NSObject **)(v213 + 40 * v221 + 104);
            *(_QWORD *)&theDict.f_bsize = MEMORY[0x24BDAC760];
            theDict.f_blocks = 0x40000000;
            theDict.f_bfree = (uint64_t)__AFCProcessFileRefTellPacket_block_invoke;
            theDict.f_bavail = (uint64_t)&unk_24D38AC30;
            theDict.f_owner = v221;
            theDict.f_files = (uint64_t)__str;
            theDict.f_ffree = (uint64_t)&valuePtr;
            theDict.f_fsid = (fsid_t)v213;
            dispatch_sync(v224, &theDict);
            v9 = *(unsigned int *)(valuePtr.st_ino + 24);
            if ((_DWORD)v9)
            {
LABEL_194:
              AFCSendStatus(a1, v2, v9);
              *(_DWORD *)(valuePtr.st_ino + 24) = v9;
              goto LABEL_490;
            }
LABEL_489:
            memset(ptr, 0, 48);
            AFCHeaderInit(ptr, 19, 48, 0, v2);
            ptr[0].st_atimespec.tv_nsec = *(_QWORD *)(*(_QWORD *)&__str[8] + 24);
            v465 = AFCSendHeader(a1, (uint64_t)ptr);
            *(_DWORD *)(valuePtr.st_ino + 24) = v465;
            v9 = v465;
LABEL_490:
            _Block_object_dispose(__str, 8);
            p_valuePtr = &valuePtr;
            goto LABEL_329;
          }
        }
        v454 = "Invalid file ref";
        v453 = 3892330503;
        v455 = 2540;
      }
      else
      {
        v453 = 3892330499;
        v454 = "No server context";
        v455 = 2533;
      }
      v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v453, v214, v455, v454, v215, v216, (char)p_theDict);
      *(_DWORD *)(valuePtr.st_ino + 24) = v9;
      if ((_DWORD)v9)
        goto LABEL_194;
      goto LABEL_489;
    case 0x14:
      *(_QWORD *)&ptr[0].st_dev = 0;
      ptr[0].st_ino = (__darwin_ino64_t)ptr;
      *(_QWORD *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      v225 = AFCConnectionGetContext(a1);
      if (v225)
      {
        v229 = v225;
        v230 = AFCDiscardBodyData(a1, v2);
        *(_DWORD *)(ptr[0].st_ino + 24) = v230;
        if (v230)
          goto LABEL_200;
        v231 = *(_DWORD *)(v2 + 40);
        v232 = (v231 - 1);
        AFCLog(5, "Processing FileRefClose ref %d\n", v231 - 1);
        if (gAFCMaxOpenFileCount > v232 && *(_DWORD *)(v229 + 40 * v232 + 80) != -1)
        {
          v233 = *(NSObject **)(v229 + 40 * v232 + 104);
          *(_QWORD *)&theDict.f_bsize = MEMORY[0x24BDAC760];
          theDict.f_blocks = 0x40000000;
          theDict.f_bfree = (uint64_t)__AFCProcessFileRefClosePacket_block_invoke;
          theDict.f_bavail = (uint64_t)&unk_24D38AC58;
          theDict.f_fsid.val[0] = v232;
          theDict.f_files = (uint64_t)ptr;
          theDict.f_ffree = v229;
          dispatch_sync(v233, &theDict);
          v230 = *(_DWORD *)(ptr[0].st_ino + 24);
          goto LABEL_200;
        }
        v457 = "Invalid file ref";
        v456 = 3892330503;
        v458 = 2590;
      }
      else
      {
        v456 = 3892330499;
        v457 = "No server context";
        v458 = 2581;
      }
      v230 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v456, v226, v458, v457, v227, v228, (char)p_theDict);
      *(_DWORD *)(ptr[0].st_ino + 24) = v230;
LABEL_200:
      AFCLog(5, "FileRefClose returns %d (deferred %d)\n", v230, 0);
LABEL_201:
      LODWORD(v9) = *(_DWORD *)(ptr[0].st_ino + 24);
      goto LABEL_202;
    case 0x15:
      v293 = AFCConnectionGetContext(a1);
      *(_QWORD *)&ptr[0].st_dev = 0;
      ptr[0].st_ino = (__darwin_ino64_t)ptr;
      *(_QWORD *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      if (v293)
      {
        v297 = v293;
        v298 = AFCDiscardBodyData(a1, v2);
        if (v298)
        {
LABEL_277:
          v310 = v298;
          goto LABEL_325;
        }
        v299 = (*(_DWORD *)(v2 + 40) - 1);
        AFCLog(5, "Processing FileRefSetFileSize (ref %d, size %d)\n", *(_DWORD *)(v2 + 40) - 1, *(_QWORD *)(v2 + 48));
        if (gAFCMaxOpenFileCount <= v299 || (v303 = *(_DWORD *)(v297 + 40 * v299 + 80), v303 == -1))
        {
          v307 = "Invalid file ref";
          v308 = 1;
          v305 = 0xFFFFFFFFLL;
          v306 = 3892330503;
          v309 = 2978;
          goto LABEL_276;
        }
        if (__AFCAllowedToOperateOnFile(v303, (char *)(a1 + 224), v300, v294, v301, v302, v295, v296))
        {
          v310 = 1;
        }
        else
        {
          v304 = *(NSObject **)(v297 + 40 * v299 + 104);
          *(_QWORD *)&theDict.f_bsize = MEMORY[0x24BDAC760];
          theDict.f_blocks = 0x40000000;
          theDict.f_bfree = (uint64_t)__AFCProcessFileRefSetFileSizePacket_block_invoke;
          theDict.f_bavail = (uint64_t)&unk_24D38AC80;
          theDict.f_files = (uint64_t)ptr;
          theDict.f_ffree = v297;
          theDict.f_owner = v299;
          theDict.f_fsid = (fsid_t)v2;
          dispatch_sync(v304, &theDict);
          if (*(_DWORD *)(ptr[0].st_ino + 24))
          {
            v305 = *__error();
            v306 = 3892330501;
            v307 = "ftruncate";
            v308 = 0;
            v309 = 2991;
LABEL_276:
            v298 = __AFCSetErrorResult_4(v308, v305, v306, v294, v309, v307, v295, v296, (char)p_theDict);
            goto LABEL_277;
          }
          v310 = 0;
        }
LABEL_325:
        AFCLog(5, "FileRefSetFileSize returns %d\n", v310);
        v342 = AFCSendStatus(a1, v2, v310);
        if (v310)
          v9 = v310;
        else
          v9 = v342;
        goto LABEL_328;
      }
      v306 = 3892330499;
      v307 = "No server context";
      v308 = 1;
      v305 = 0xFFFFFFFFLL;
      v309 = 2969;
      goto LABEL_276;
    case 0x16:
      *(__CFString **)&theDict.f_bsize = kAFCConnectionOptionExtendedStatusKey[0];
      theDict.f_blocks = kAFCConnectionServerVersionKey;
      ptr[0].st_ino = 0;
      *(_QWORD *)&ptr[0].st_dev = 0;
      valuePtr.st_dev = *(_DWORD *)(a1 + 128) & 1;
      v281 = CFStringCreateWithCString(0, "@(#)PROGRAM:afc  PROJECT:afc-279\n", 0x8000100u);
      v282 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      v283 = v282;
      if (v281 && v282)
      {
        *(_QWORD *)&ptr[0].st_dev = v282;
        ptr[0].st_ino = (__darwin_ino64_t)v281;
        v284 = CFDictionaryCreate(0, (const void **)&theDict, (const void **)ptr, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        v285 = v284;
        if (v284 && (v286 = __AFCCreateAFCDataWithDictionary(v284)) != 0)
        {
          v287 = v286;
          v288 = (char *)CFDataGetBytePtr(v286);
          v289 = CFDataGetLength(v287);
          v9 = AFCSendDataPacket(a1, v2, v288, v289);
        }
        else
        {
          v9 = AFCSendStatus(a1, v2, 0);
          v287 = 0;
        }
      }
      else
      {
        v9 = AFCSendStatus(a1, v2, 0);
        v287 = 0;
        v285 = 0;
        v290 = 0;
        v291 = 0;
        if (!v281)
        {
LABEL_263:
          if (v283)
            CFRelease(v283);
          if (v291)
            CFRelease(v291);
          if (!v290)
            return v9;
          v292 = v290;
          goto LABEL_381;
        }
      }
      CFRelease(v281);
      v290 = v287;
      v291 = v285;
      goto LABEL_263;
    case 0x17:
      *(_QWORD *)&theDict.f_bsize = 0;
      *(_QWORD *)&ptr[0].st_dev = 0;
      *(_QWORD *)&valuePtr.st_dev = 0;
      v10 = AFCReadPacketBody((_BYTE *)a1, v2, (char **)ptr, (size_t *)&valuePtr, v5, v6, v7, v8, (char)p_theDict);
      if (v10
        || (v10 = __AFCCreateDictionaryOrArrayFromData(0, *(void **)&ptr[0].st_dev, *(uint64_t *)&valuePtr.st_dev, 1, (CFArrayRef *)&theDict)) != 0)
      {
        v22 = v10;
        v13 = (const void *)a1;
        v17 = 0;
      }
      else if (*(_QWORD *)&theDict.f_bsize
             && (Count = CFDictionaryGetCount(*(CFDictionaryRef *)&theDict.f_bsize), Count >= 1))
      {
        v12 = Count;
        v13 = (const void *)a1;
        v17 = (const void **)CFAllocatorAllocate(0, 16 * Count, 0);
        if (v17)
        {
          CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)&theDict.f_bsize, v17, &v17[v12]);
          for (j = 0; j != v12; ++j)
          {
            v19 = (const __CFString *)v17[j];
            v20 = (const __CFString *)*(&v17[v12] + j);
            if (CFStringCompare(v19, kAFCConnectionOptionServerDebugLevelKey, 0))
            {
              if (CFStringCompare(v19, kAFCConnectionOptionExtendedStatusKey[0], 0))
              {
                if (CFStringCompare(v19, kAFCConnectionOptionTrailingJunkKey[0], 0) == kCFCompareEqualTo)
                  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a1 + 128) & 0xFFFF7FFF | ((CFStringGetIntValue(v20) != 0) << 15);
              }
              else
              {
                *(_DWORD *)(a1 + 128) = *(_DWORD *)(a1 + 128) & 0xFFFFFFFE | (CFStringGetIntValue(v20) != 0);
              }
            }
            else
            {
              IntValue = CFStringGetIntValue(v20);
              AFCSetLogLevel(IntValue);
            }
          }
          v22 = 0;
        }
        else
        {
          v22 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v14, 3024, "malloc", v15, v16, v480);
        }
      }
      else
      {
        v13 = (const void *)a1;
        v17 = 0;
        v22 = 0;
      }
      if (*(_QWORD *)&ptr[0].st_dev)
      {
        v23 = CFGetAllocator(v13);
        CFAllocatorDeallocate(v23, *(void **)&ptr[0].st_dev);
      }
      if (v17)
        CFAllocatorDeallocate(0, v17);
      if (*(_QWORD *)&theDict.f_bsize)
        CFRelease(*(CFTypeRef *)&theDict.f_bsize);
      v24 = (uint64_t)v13;
      v25 = v2;
      v26 = v22;
      return AFCSendStatus(v24, v25, v26);
    case 0x18:
      *(_QWORD *)&valuePtr.st_dev = 0;
      v114 = (std::__fs::filesystem::path *)CFAllocatorAllocate(0, 1024, 0);
      if (!v114)
      {
        v56 = 3892330499;
        v57 = "CFAllocatorAllocate";
        v58 = 1465;
LABEL_42:
        LODWORD(v9) = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v56, v4, v58, v57, v7, v8, (char)p_theDict);
LABEL_321:
        v341 = AFCSendStatus(a1, v2, v9);
        if ((_DWORD)v9)
          return v9;
        else
          return v341;
      }
      v115 = v114;
      v116 = v2 + 40;
      v117 = strlen((const char *)(v2 + 40));
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        v138 = 3892330498;
        v135 = "AFCConnectionGetRequestPath";
        v136 = 1;
        v137 = 0xFFFFFFFFLL;
        v139 = 1470;
        goto LABEL_107;
      }
      if (!__AFCConnectionGetRequestPath(a1, (char *)(v117 + v116 + 1), (char *)v115, 0x400uLL))
      {
        v138 = 3892330498;
        v135 = "AFCConnectionGetRequestPath";
        v136 = 1;
        v137 = 0xFFFFFFFFLL;
        v139 = 1474;
        goto LABEL_107;
      }
      AFCLog(5, "Processing rename path '%s'->'%s'\n", (const char *)&theDict, (const char *)v115);
      v121 = AFCDiscardBodyData(a1, v2);
      if (v121)
        goto LABEL_108;
      if (__AFCPathContainsDots((const char *)&theDict))
      {
        v121 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v122, 1492, "Request path cannot contain dots : %s", v123, v124, (char)&theDict);
        goto LABEL_108;
      }
      if (__AFCPathContainsDots((const char *)v115))
      {
        v121 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v125, 1496, "Dest path cannot contain dots : %s", v126, v127, (char)v115);
        goto LABEL_108;
      }
      if ((__AFCPathDepthCheck((const char *)(v2 + 40)) & 1) == 0)
      {
        v135 = "Request path is outside document root";
        v136 = 0;
        v137 = 0xFFFFFFFFLL;
        v138 = 3892330503;
        v139 = 1501;
        goto LABEL_107;
      }
      if ((__AFCPathDepthCheck((const char *)(v117 + v116 + 1)) & 1) == 0)
      {
        v135 = "Request path is outside document root";
        v136 = 0;
        v137 = 0xFFFFFFFFLL;
        v138 = 3892330503;
        v139 = 1506;
        goto LABEL_107;
      }
      *(_QWORD *)&ptr[0].st_dev = &theDict;
      ptr[0].st_ino = 0;
      v128 = fts_open((char *const *)ptr, 20, 0);
      if (!v128)
        goto LABEL_106;
      v129 = v128;
      while (1)
      {
        v130 = fts_read(v129);
        if (!v130)
          break;
        fts_info = v130->fts_info;
        v132 = fts_info > 0xD;
        v133 = (1 << fts_info) & 0x3080;
        if (!v132 && v133 != 0)
        {
          fts_close(v129);
LABEL_106:
          v135 = "%s contains symlinks and cannot be renamed to %s";
          p_theDict = &theDict;
          v136 = 0;
          v137 = 0xFFFFFFFFLL;
          v138 = 3892330503;
          v139 = 1511;
LABEL_107:
          v121 = __AFCSetErrorResult_4(v136, v137, v138, v118, v139, v135, v119, v120, (char)p_theDict);
LABEL_108:
          LODWORD(v140) = v121;
LABEL_412:
          v395 = *(const void **)&valuePtr.st_dev;
          if (*(_QWORD *)&valuePtr.st_dev)
          {
            (*(void (**)(_QWORD))(*(_QWORD *)&valuePtr.st_dev + 16))(*(_QWORD *)&valuePtr.st_dev);
            _Block_release(v395);
          }
          v396 = AFCSendStatus(a1, v2, (int)v140);
          if ((_DWORD)v140)
            v9 = v140;
          else
            v9 = v396;
          CFAllocatorDeallocate(0, v115);
          return v9;
        }
      }
      fts_close(v129);
      if (*(_BYTE *)(a1 + 1268))
      {
        v121 = __AFCCoordinateFileActivity((const char *)&theDict, 2, &valuePtr);
        if (v121)
          goto LABEL_108;
      }
      rename((const std::__fs::filesystem::path *)&theDict, v115, v348);
      if (v349)
      {
        v137 = *__error();
        v138 = 3892330497;
        v135 = "rename";
        v136 = 0;
        v139 = 1521;
        goto LABEL_107;
      }
      if (!*(_BYTE *)(a1 + 1268))
        goto LABEL_411;
      v350 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v351 = strlen((const char *)&theDict);
      v352 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&theDict, v351, 0);
      v353 = strlen((const char *)v115);
      v354 = CFURLCreateFromFileSystemRepresentation(v350, (const UInt8 *)v115, v353, 0);
      v140 = v354;
      if (v352)
        v355 = v354 == 0;
      else
        v355 = 1;
      if (v355)
      {
        if (!v352)
          goto LABEL_409;
      }
      else
      {
        _CFFileDidMove2();
      }
      CFRelease(v352);
LABEL_409:
      if (!v140)
        goto LABEL_412;
      CFRelease(v140);
LABEL_411:
      LODWORD(v140) = 0;
      goto LABEL_412;
    case 0x19:
      v27 = _AFCSetFSBlockSize;
      v28 = a1;
      v29 = v2;
      v30 = 512;
      return AFCProcessSetBlockSize(v28, v29, v27, v30);
    case 0x1ALL:
      v27 = (uint64_t (*)(uint64_t, uint64_t, unint64_t))_AFCSetSocketBlockSize;
      v28 = a1;
      v29 = v2;
      v30 = 1;
      return AFCProcessSetBlockSize(v28, v29, v27, v30);
    case 0x1BLL:
      v94 = AFCConnectionGetContext(a1);
      *(_QWORD *)&ptr[0].st_dev = 0;
      ptr[0].st_ino = (__darwin_ino64_t)ptr;
      *(_QWORD *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      AFCLog(5, "Processing FileRefLock packet\n");
      if (!v94)
      {
        v107 = 3892330499;
        v108 = "No server context";
        v109 = 1;
        v106 = 0xFFFFFFFFLL;
        v110 = 2645;
        goto LABEL_309;
      }
      v98 = AFCDiscardBodyData(a1, v2);
      if ((_DWORD)v98)
      {
        v9 = v98;
      }
      else
      {
        v102 = (*(_DWORD *)(v2 + 40) - 1);
        if (gAFCMaxOpenFileCount <= v102 || (v103 = *(_DWORD *)(v94 + 40 * v102 + 80), v103 == -1))
        {
          v108 = "Invalid file ref";
          v109 = 1;
          v106 = 0xFFFFFFFFLL;
          v107 = 3892330503;
          v110 = 2652;
          goto LABEL_309;
        }
        if (!__AFCAllowedToOperateOnFile(v103, (char *)(a1 + 224), v99, v95, v100, v101, v96, v97))
        {
          v104 = *(_DWORD *)(v2 + 48);
          if (v104 >= 0x10)
          {
            v108 = "Invalid lock type";
            v109 = 1;
            v106 = 0xFFFFFFFFLL;
            v107 = 3892330503;
            v110 = 2663;
          }
          else
          {
            v105 = *(NSObject **)(v94 + 40 * v102 + 104);
            *(_QWORD *)&theDict.f_bsize = MEMORY[0x24BDAC760];
            theDict.f_blocks = 0x40000000;
            theDict.f_bfree = (uint64_t)__AFCProcessFileRefLockPacket_block_invoke;
            theDict.f_bavail = (uint64_t)&unk_24D38ACA8;
            theDict.f_files = (uint64_t)ptr;
            theDict.f_ffree = v94;
            theDict.f_fsid.val[0] = v102;
            theDict.f_fsid.val[1] = v104;
            dispatch_sync(v105, &theDict);
            if (!*(_DWORD *)(ptr[0].st_ino + 24))
              goto LABEL_286;
            v106 = *__error();
            v107 = 3892330497;
            v108 = "flock";
            v109 = 0;
            v110 = 2681;
          }
LABEL_309:
          v9 = __AFCSetErrorResult_4(v109, v106, v107, v95, v110, v108, v96, v97, (char)p_theDict);
          v324 = AFCSendStatus(a1, v2, v9);
          if (!(_DWORD)v9)
LABEL_287:
            v9 = v324;
          goto LABEL_328;
        }
        v9 = 1;
      }
      v464 = a1;
      v463 = v2;
      goto LABEL_520;
    case 0x1CLL:
      v56 = 3892330511;
      v57 = "Unsupported API.";
      v58 = 1668;
      goto LABEL_42;
    case 0x1DLL:
      *(_QWORD *)&ptr[0].st_dev = 0;
      *(_QWORD *)&valuePtr.st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        v166 = AFCDiscardBodyData(a1, v2);
        if (!(_DWORD)v166)
        {
          v166 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 40));
          if (!(_DWORD)v166)
          {
            if (!*(_BYTE *)(a1 + 1268)
              || (v166 = __AFCCoordinateFileActivity((const char *)&theDict, 1, &valuePtr), !(_DWORD)v166))
            {
              v166 = __AFCGetFileHash((const char *)&theDict, (CFDataRef *)ptr, 0, 0);
            }
          }
        }
      }
      else
      {
        v166 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330498, v163, 1895, "AFCConnectionGetRequestPath", v164, v165, (char)p_theDict);
      }
      v9 = v166;
      v167 = *(const void **)&valuePtr.st_dev;
      if (*(_QWORD *)&valuePtr.st_dev)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)&valuePtr.st_dev + 16))(*(_QWORD *)&valuePtr.st_dev);
        _Block_release(v167);
      }
      if ((_DWORD)v9)
        goto LABEL_142;
      goto LABEL_297;
    case 0x1ELL:
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "AFCProcessSetModTimePacket('%s', %lld)", (const char *)&theDict, *(_QWORD *)(v2 + 40));
        v52 = AFCDiscardBodyData(a1, v2);
        if ((_DWORD)v52)
        {
          v9 = v52;
          v173 = a1;
          v174 = v2;
          v172 = v9;
LABEL_145:
          AFCSendStatus(v173, v174, v172);
          return v9;
        }
        v53 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 48));
        if ((_DWORD)v53)
          goto LABEL_512;
        v54 = *(_QWORD *)(v2 + 40);
        *(_QWORD *)&ptr[0].st_uid = (v54 / 0x3B9ACA00);
        *(_QWORD *)&ptr[0].st_dev = *(_QWORD *)&ptr[0].st_uid;
        ptr[0].st_rdev = v54 % 0x3B9ACA00 / 0x3E8;
        LODWORD(ptr[0].st_ino) = ptr[0].st_rdev;
        if (!utimes((const char *)&theDict, (const timeval *)ptr))
        {
          v24 = a1;
          v25 = v2;
          v26 = 0;
          return AFCSendStatus(v24, v25, v26);
        }
        v433 = *__error();
        v431 = 3892330516;
        v432 = "utimes";
        v434 = 2760;
      }
      else
      {
        v431 = 3892330498;
        v432 = "AFCConnectionGetRequestPath";
        v433 = 0xFFFFFFFFLL;
        v434 = 2747;
      }
      v53 = __AFCSetErrorResult_4(1, v433, v431, v49, v434, v432, v50, v51, (char)p_theDict);
LABEL_512:
      v9 = v53;
      v55 = AFCSendStatus(a1, v2, v53);
      if ((_DWORD)v9)
        return v9;
      return v55;
    case 0x1FLL:
      *(_QWORD *)&ptr[0].st_dev = 0;
      *(_QWORD *)&valuePtr.st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 56), (char *)&theDict, 0x400uLL))
      {
        v328 = AFCDiscardBodyData(a1, v2);
        if (!(_DWORD)v328)
        {
          v328 = AFCCheckForSpecialFile((const char *)&theDict, (const char *)(v2 + 56));
          if (!(_DWORD)v328)
          {
            if (!*(_BYTE *)(a1 + 1268)
              || (v328 = __AFCCoordinateFileActivity((const char *)&theDict, 1, &valuePtr), !(_DWORD)v328))
            {
              v328 = __AFCGetFileHash((const char *)&theDict, (CFDataRef *)ptr, *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
            }
          }
        }
      }
      else
      {
        v328 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330498, v325, 1936, "AFCConnectionGetRequestPath", v326, v327, (char)p_theDict);
      }
      v9 = v328;
      v329 = *(const void **)&valuePtr.st_dev;
      if (*(_QWORD *)&valuePtr.st_dev)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)&valuePtr.st_dev + 16))(*(_QWORD *)&valuePtr.st_dev);
        _Block_release(v329);
      }
      if ((_DWORD)v9)
      {
LABEL_142:
        AFCSendStatus(a1, v2, v9);
        Mutable = *(__CFData **)&ptr[0].st_dev;
      }
      else
      {
LABEL_297:
        Mutable = *(__CFData **)&ptr[0].st_dev;
        v330 = (char *)CFDataGetBytePtr(*(CFDataRef *)&ptr[0].st_dev);
        v331 = CFDataGetLength(Mutable);
        v9 = AFCSendDataPacket(a1, v2, v330, v331);
      }
      goto LABEL_379;
    case 0x20:
      v311 = AFCConnectionGetContext(a1);
      *(_QWORD *)&ptr[0].st_dev = 0;
      ptr[0].st_ino = (__darwin_ino64_t)ptr;
      *(_QWORD *)&ptr[0].st_uid = 0x2000000000;
      ptr[0].st_rdev = 0;
      AFCLog(5, "Processing FileRefSetImmutableHint packet");
      if (!v311)
      {
        v107 = 3892330499;
        v108 = "No server context";
        v109 = 1;
        v106 = 0xFFFFFFFFLL;
        v110 = 2704;
        goto LABEL_309;
      }
      v312 = AFCDiscardBodyData(a1, v2);
      if ((_DWORD)v312)
      {
        v9 = v312;
        v463 = v2;
        v464 = a1;
      }
      else
      {
        v316 = (*(_DWORD *)(v2 + 40) - 1);
        if (gAFCMaxOpenFileCount <= v316
          || (v317 = v311 + 40 * v316,
              v320 = *(_DWORD *)(v317 + 80),
              v319 = (unsigned int *)(v317 + 80),
              v318 = v320,
              v320 == -1))
        {
          v108 = "Invalid file ref";
          v109 = 1;
          v106 = 0xFFFFFFFFLL;
          v107 = 3892330503;
          v110 = 2711;
          goto LABEL_309;
        }
        if (!__AFCAllowedToOperateOnFile(v318, (char *)(a1 + 224), v313, v95, v314, v315, v96, v97))
        {
          v321 = *v319;
          v322 = *(_QWORD *)(v2 + 48) != 0;
          v323 = *(NSObject **)(v311 + 40 * v316 + 104);
          *(_QWORD *)&theDict.f_bsize = MEMORY[0x24BDAC760];
          theDict.f_blocks = 0x40000000;
          theDict.f_bfree = (uint64_t)__AFCProcessFileRefSetImmutableHintPacket_block_invoke;
          theDict.f_bavail = (uint64_t)&unk_24D38ACD0;
          theDict.f_files = (uint64_t)ptr;
          theDict.f_ffree = __PAIR64__(v322, v321);
          dispatch_sync(v323, &theDict);
          if (!*(_DWORD *)(ptr[0].st_ino + 24))
          {
LABEL_286:
            v324 = AFCSendStatus(a1, v2, 0);
            goto LABEL_287;
          }
          v106 = *__error();
          v107 = 3892330497;
          v108 = "fcntl";
          v109 = 0;
          v110 = 2726;
          goto LABEL_309;
        }
        v463 = v2;
        v464 = a1;
        v9 = 1;
      }
LABEL_520:
      AFCSendStatus(v464, v463, v9);
      goto LABEL_328;
    case 0x21:
      memset(ptr, 0, 144);
      v486 = a1;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 48), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing remove path '%s'\n", (const char *)&theDict);
        v75 = AFCDiscardBodyData(a1, v2);
        if ((_DWORD)v75)
        {
LABEL_447:
          v9 = v75;
          Mutable = 0;
          goto LABEL_377;
        }
        if (!lstat((const char *)&theDict, ptr))
        {
          v9 = 0;
          v79 = *(_QWORD *)(v2 + 40);
          v80 = ptr[0].st_mode & 0xF000;
          v81 = v80 != 0x8000 && v79 == 1;
          if (v81)
            st_size = ptr[0].st_size;
          else
            st_size = 0;
          if (v81)
            st_blksize = ptr[0].st_blksize;
          else
            st_blksize = 0;
          if (v80 == 40960 || v80 == 0x8000)
            goto LABEL_373;
          if (v80 != 0x4000)
          {
            v9 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330506, v76, 2848, "Special files not allowed", v77, v78, (char)p_theDict);
            goto LABEL_373;
          }
          valuePtr.st_ino = 0;
          *(_QWORD *)&valuePtr.st_dev = &theDict;
          Mutable = (__CFData *)fts_open((char *const *)&valuePtr, 84, 0);
          if (!Mutable)
          {
            v475 = __error();
            v9 = __AFCSetErrorResult_4(0, *v475, 3892330497, v476, 2815, "Could not start directory walk", v477, v478, (char)p_theDict);
            goto LABEL_375;
          }
          while (1)
          {
            v85 = fts_read((FTS *)Mutable);
            if (!v85)
            {
              v9 = 0;
LABEL_372:
              fts_close((FTS *)Mutable);
LABEL_373:
              v371 = CFDataCreateMutable(0, 0);
              Mutable = v371;
              if (v371)
              {
                CFDataAppendBytes(v371, (const UInt8 *)"st_size", 8);
                snprintf((char *)&valuePtr, 0x80uLL, "%lld", st_size);
                v375 = strlen((const char *)&valuePtr);
                CFDataAppendBytes(Mutable, (const UInt8 *)&valuePtr, v375 + 1);
                CFDataAppendBytes(Mutable, (const UInt8 *)"st_blocks", 10);
                snprintf((char *)&valuePtr, 0x80uLL, "%lld", st_blksize);
                v376 = strlen((const char *)&valuePtr);
                CFDataAppendBytes(Mutable, (const UInt8 *)&valuePtr, v376 + 1);
              }
              else
              {
                v9 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v372, 2853, "CFDataCreateMutable", v373, v374, (char)p_theDict);
              }
LABEL_375:
              a1 = v486;
              goto LABEL_376;
            }
            v89 = v85;
            v90 = v85->fts_info;
            if (v90 > 0xA)
            {
LABEL_78:
              fts_statp = v85->fts_statp;
              if (v79 == 1 || (fts_statp->st_mode & 0xF000) == 0x8000)
              {
                AFCLog(5, "Summing file %s = %lld bytes\n", v85->fts_path, fts_statp->st_size);
                v93 = v89->fts_statp;
                st_size += v93->st_size;
                st_blksize += v93->st_blocks;
              }
            }
            else
            {
              v91 = 1 << v90;
              if ((v91 & 0x490) != 0)
              {
                v9 = __AFCSetErrorResult_4(0, v85->fts_errno, 3892330497, v86, 2829, "Error during file traversal", v87, v88, (char)p_theDict);
                if ((_DWORD)v9)
                  goto LABEL_372;
              }
              else if ((v91 & 0x22) == 0)
              {
                goto LABEL_78;
              }
            }
          }
        }
        v441 = *__error();
        v438 = 3892330500;
        v439 = "lstat";
        v440 = 0;
        v442 = 2792;
      }
      else
      {
        v438 = 3892330498;
        v439 = "AFCConnectionGetRequestPath";
        v440 = 1;
        v441 = 0xFFFFFFFFLL;
        v442 = 2785;
      }
      v9 = __AFCSetErrorResult_4(v440, v441, v438, v72, v442, v439, v73, v74, (char)p_theDict);
      Mutable = 0;
      goto LABEL_375;
    case 0x22:
      *(_QWORD *)&valuePtr.st_dev = 0;
      if (__AFCConnectionGetRequestPath(a1, (char *)(v2 + 40), (char *)&theDict, 0x400uLL))
      {
        AFCLog(5, "Processing remove path '%s'\n", (const char *)&theDict);
        v144 = AFCDiscardBodyData(a1, v2);
        if (v144
          || *(_BYTE *)(a1 + 1268) && (v144 = __AFCCoordinateFileActivity((const char *)&theDict, 1, &valuePtr)) != 0)
        {
LABEL_507:
          v154 = v144;
LABEL_303:
          v332 = *(const void **)&valuePtr.st_dev;
          if (*(_QWORD *)&valuePtr.st_dev)
          {
            (*(void (**)(_QWORD))(*(_QWORD *)&valuePtr.st_dev + 16))(*(_QWORD *)&valuePtr.st_dev);
            _Block_release(v332);
          }
          v333 = AFCSendStatus(a1, v2, v154);
          if (v154)
            return v154;
          else
            return v333;
        }
        ptr[0].st_ino = 0;
        *(_QWORD *)&ptr[0].st_dev = &theDict;
        v145 = fts_open((char *const *)ptr, 84, 0);
        if (v145)
        {
          v146 = v145;
          while (1)
          {
            v147 = fts_read(v146);
            if (!v147)
            {
              v154 = 0;
LABEL_302:
              fts_close(v146);
              goto LABEL_303;
            }
            v151 = v147->fts_info;
            if (v151 > 0xA)
              break;
            v152 = 1 << v151;
            if ((v152 & 0x490) != 0)
            {
              v153 = __AFCSetErrorResult_4(0, v147->fts_errno, 3892330497, v148, 1432, "Error during file traversal", v149, v150, (char)p_theDict);
LABEL_121:
              v154 = v153;
              if (v153)
                goto LABEL_302;
            }
            else if ((v152 & 0x22) == 0)
            {
              break;
            }
          }
          v153 = RemovePath(v147->fts_path);
          goto LABEL_121;
        }
        v446 = *__error();
        v443 = 3892330497;
        v444 = "Could not start directory walk";
        v445 = 0;
        v447 = 1418;
      }
      else
      {
        v443 = 3892330498;
        v444 = "AFCConnectionGetRequestPath";
        v445 = 1;
        v446 = 0xFFFFFFFFLL;
        v447 = 1400;
      }
      v144 = __AFCSetErrorResult_4(v445, v446, v443, v141, v447, v444, v142, v143, (char)p_theDict);
      goto LABEL_507;
    case 0x27:
      v160 = a1;
      v161 = (_QWORD *)v2;
      v162 = 1;
      return AFCProcessFileRefReadPacket(v160, v161, v162);
    case 0x28:
      v111 = a1;
      v112 = (_QWORD *)v2;
      v113 = 1;
      return AFCProcessFileRefWritePacket(v111, v112, v113);
    default:
      AFCLog(5, "Processing unknown packet %d\n", *(_QWORD *)(v2 + 32));
      AFCDiscardBodyData(a1, v2);
      v9 = 3892330502;
      v172 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330502, v169, 1265, "Unknown packet type %d", v170, v171, *(_QWORD *)(v2 + 32));
      v173 = a1;
      v174 = v2;
      goto LABEL_145;
  }
}

uint64_t AFCProcessObsoletePacket(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  AFCDiscardBodyData(a1, a2);
  v7 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330511, v4, 1279, "Obsolete packet type %d", v5, v6, *(_QWORD *)(a2 + 32));
  return AFCSendStatus(a1, a2, v7);
}

uint64_t AFCProcessFileRefReadPacket(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t Context;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  _QWORD block[12];
  int v33;
  unsigned int v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;

  v57 = 0;
  v58 = &v57;
  v59 = 0x2000000000;
  v60 = 0;
  Context = AFCConnectionGetContext(a1);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2000000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2000000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2000000000;
  v48 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2000000000;
  v44[3] = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2000000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 0;
  AFCLog(5, "Processing FileRefRead packet\n");
  if (!Context)
  {
    v27 = "No server context";
    v28 = 0xFFFFFFFFLL;
    v29 = 3892330499;
    v30 = 2223;
    goto LABEL_25;
  }
  v10 = v54;
  if (a3)
  {
    v11 = a2[5];
    v12 = a2[6];
    v54[3] = v12;
    if (v12 >= 0x400000)
      v12 = 0x400000;
    v46[3] = v12;
    v13 = a2[7];
    v14 = v37;
  }
  else
  {
    v11 = a2[5];
    v13 = a2[6];
    v54[3] = v13;
    v14 = v46;
    if (v13 >= 0x400000)
      v13 = 0x400000;
  }
  v14[3] = v13;
  v15 = v11 - 1;
  AFCLog(5, "AFCFileRefRead(%d, %d, %d)\n", v11 - 1, v10[3], a3);
  v16 = AFCDiscardBodyData(a1, (uint64_t)a2);
  *((_DWORD *)v58 + 6) = v16;
  if (!v16)
  {
    if (gAFCMaxOpenFileCount <= (unint64_t)v15
      || (v20 = Context + 40 * v15, v21 = *(_DWORD *)(v20 + 80), v21 == -1))
    {
      v29 = 3892330503;
      v27 = "Invalid file ref";
      v28 = 0xFFFFFFFFLL;
      v30 = 2255;
      goto LABEL_25;
    }
    v22 = __AFCAllowedToOperateOnFile(*(_DWORD *)(v20 + 80), (char *)(a1 + 224), v17, v7, v18, v19, v8, v9);
    *((_DWORD *)v58 + 6) = v22;
    if (!v22)
    {
      v23 = *(NSObject **)(Context + 40 * v15 + 104);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __AFCProcessFileRefReadPacket_block_invoke;
      block[3] = &unk_24D38AB70;
      block[4] = &v40;
      block[5] = &v45;
      block[6] = &v57;
      block[7] = v44;
      v35 = a3;
      block[8] = &v49;
      block[9] = &v53;
      block[10] = &v36;
      block[11] = Context;
      v33 = v21;
      v34 = v15;
      dispatch_sync(v23, block);
      v16 = *((_DWORD *)v58 + 6);
      if (v16)
        goto LABEL_16;
      if ((v54[3] & 0x8000000000000000) == 0)
      {
        v16 = AFCSendDataPacket(a1, (uint64_t)a2, *(char **)(v41[3] + 16), v50[3]);
LABEL_15:
        *((_DWORD *)v58 + 6) = v16;
        goto LABEL_16;
      }
      v28 = *__error();
      v29 = 3892330500;
      v27 = "read";
      v30 = 2301;
LABEL_25:
      v16 = __AFCSetErrorResult_4(1, v28, v29, v7, v30, v27, v8, v9, v31);
      goto LABEL_15;
    }
    v16 = 1;
  }
LABEL_16:
  AFCLog(5, "Sending result %d\n", v16);
  v24 = v41[3];
  if (v24)
    AFCReleaseBuffer(Context, v24);
  v25 = *((unsigned int *)v58 + 6);
  if ((_DWORD)v25)
  {
    AFCSendStatus(a1, (uint64_t)a2, *((_DWORD *)v58 + 6));
    *((_DWORD *)v58 + 6) = v25;
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v25;
}

uint64_t AFCProcessFileRefWritePacket(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t Context;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  _BOOL4 v18;
  int64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  dispatch_time_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  int v38;
  int v39;
  int v40;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  int v45;
  int v46;
  char v47;
  _QWORD *v48;
  _QWORD block[9];
  int v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;

  v56 = 0;
  v57 = &v56;
  v58 = 0x2000000000;
  v59 = 0;
  Context = AFCConnectionGetContext(a1);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2000000000;
  v55 = 0;
  AFCLog(5, "Processing FileRefWrite packet\n");
  if (Context)
  {
    v13 = a2[1];
    v14 = a2[2];
    v48 = a2;
    v15 = a2[5];
    if (a3)
      v53[3] = a2[6];
    v16 = (v15 - 1);
    if (gAFCMaxOpenFileCount <= v16 || (v17 = *(_DWORD *)(Context + 40 * v16 + 80), v17 == -1))
    {
      v46 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 2344, "Invalid file ref", v11, v12, (char)a2);
      *((_DWORD *)v57 + 6) = v46;
    }
    else
    {
      v18 = __AFCAllowedToOperateOnFile(v17, (char *)(a1 + 224), v7, v8, v9, v10, v11, v12);
      *((_DWORD *)v57 + 6) = v18;
      if (!v18)
      {
        v19 = v13 - v14;
        v20 = Context + 40 * v16;
        *(_DWORD *)(v20 + 96) = 0;
        v21 = (unsigned int *)(v20 + 96);
        if (v19 >= 1)
        {
          while (1)
          {
            if (v19 >= *(_QWORD *)(Context + 8))
              v22 = *(_QWORD *)(Context + 8);
            else
              v22 = v19;
            v23 = AFCGetBuffer(Context, v22);
            if (!v23)
            {
              v38 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v24, 2361, "AFCGetBuffer", v25, v26, (char)v48);
              *((_DWORD *)v57 + 6) = v38;
              AFCDiscardData(a1, v19);
              goto LABEL_21;
            }
            v27 = v23;
            v28 = AFCReadData(a1, *(char **)(v23 + 16), v22);
            *((_DWORD *)v57 + 6) = v28;
            if (v28)
              break;
            v29 = *(NSObject **)(Context + 48);
            v30 = *(_QWORD *)(a1 + 104);
            if (v30)
              v31 = dispatch_time(0, 1000000000 * v30 * gAFCMaxIORequests);
            else
              v31 = -1;
            v19 -= v22;
            if (dispatch_semaphore_wait(v29, v31))
            {
              v39 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330508, v32, 2378, "Dispatch queue timed out waiting for I/O", v33, v34, (char)v48);
              *((_DWORD *)v57 + 6) = v39;
              AFCDiscardData(a1, v19);
              break;
            }
            v35 = *v21;
            if ((_DWORD)v35)
            {
              v40 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, v35, v32, 2384, "Previous IO error", v33, v34, (char)v48);
              *((_DWORD *)v57 + 6) = v40;
              AFCDiscardData(a1, v19);
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(Context + 48));
              break;
            }
            v36 = *(NSObject **)(Context + 56);
            v37 = *(NSObject **)(Context + 40 * v16 + 104);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 0x40000000;
            block[2] = __AFCProcessFileRefWritePacket_block_invoke;
            block[3] = &unk_24D38ABE0;
            block[6] = v27;
            block[7] = v22;
            v51 = a3;
            block[8] = Context;
            v50 = v16;
            block[4] = &v52;
            block[5] = &v56;
            dispatch_group_async(v36, v37, block);
            if (v19 <= 0)
              goto LABEL_21;
          }
          dispatch_group_wait(*(dispatch_group_t *)(Context + 56), 0xFFFFFFFFFFFFFFFFLL);
          AFCReleaseBuffer(Context, v27);
          goto LABEL_25;
        }
      }
    }
LABEL_21:
    dispatch_group_wait(*(dispatch_group_t *)(Context + 56), 0xFFFFFFFFFFFFFFFFLL);
LABEL_25:
    a2 = v48;
    goto LABEL_26;
  }
  v45 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330499, v8, 2330, "No server context", v11, v12, v47);
  *((_DWORD *)v57 + 6) = v45;
LABEL_26:
  v41 = *((_DWORD *)v57 + 6);
  v42 = AFCSendStatus(a1, (uint64_t)a2, v41);
  if (v41)
    v43 = v41;
  else
    v43 = v42;
  *((_DWORD *)v57 + 6) = v43;
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  return v43;
}

uint64_t AFCServeWithRoot(uint64_t a1, const __CFString *a2)
{
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  const __CFAllocator *v6;
  int *v7;
  void *ptr;
  _OWORD v10[8];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
    __AFCConnectionSetRoot(a1, a2);
  memset(v10, 0, sizeof(v10));
  CFRetain((CFTypeRef)a1);
  do
  {
    ptr = 0;
    v3 = AFCReadPacketHeader(a1, (uint64_t)v10, 0x80uLL, &ptr);
    if ((_DWORD)v3)
    {
      v5 = v3;
      if ((_DWORD)v3 == -402636789)
      {
        AFCLog(5, "Disconnected during packet read");
        v5 = 3892330507;
      }
      else
      {
        v7 = __error();
        AFCLog(1, "packet read error %d, errno %d", v5, *v7);
      }
      goto LABEL_16;
    }
    if (ptr)
      v4 = ptr;
    else
      v4 = v10;
    __AFCSpinMonitorStart(*((_QWORD *)v4 + 4));
    v5 = AFCProcessServerPacket(a1, (uint64_t)v4);
    __AFCSpinMonitorStart(v5);
    if (ptr)
    {
      v6 = CFGetAllocator((CFTypeRef)a1);
      CFAllocatorDeallocate(v6, ptr);
    }
  }
  while (!*(_BYTE *)(a1 + 68));
  AFCLog(1, "fatal error 0x%x", *(_DWORD *)(a1 + 64));
  if (!(_DWORD)v5)
    v5 = *(unsigned int *)(a1 + 64);
LABEL_16:
  CFRelease((CFTypeRef)a1);
  return v5;
}

uint64_t AFCServe(uint64_t a1)
{
  return AFCServeWithRoot(a1, CFSTR("/private/var/mobile/Media"));
}

uint64_t __AFCSetErrorResult_4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  AFCLog(5, "Setting error result %d, 0x%X, %s, %d\n", a2, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/server.c", a5);
  return AFCSetErrorInfoWithArgs(a1, a2, a3, "/Library/Caches/com.apple.xbs/Sources/AppleFileConduit/server.c", a5, a6, &a9);
}

char *__AFCPathDepthCheck(const char *a1)
{
  char *result;
  char *v2;
  int v3;
  char *v4;
  char *__stringp;

  result = strndup(a1, 0x400uLL);
  __stringp = result;
  if (result)
  {
    v2 = result;
    v3 = 0;
    while (1)
    {
      v4 = strsep(&__stringp, "/");
      if (!v4)
      {
LABEL_13:
        free(v2);
        return (char *)(v3 >= 0);
      }
      if (!*v4)
        goto LABEL_10;
      if (*v4 != 46)
        goto LABEL_9;
      if (v4[1])
      {
        if (v4[1] != 46 || v4[2])
        {
LABEL_9:
          ++v3;
          goto LABEL_10;
        }
        if (--v3 < 0)
          goto LABEL_13;
      }
      else
      {
LABEL_10:
        if (v3 < 0)
          goto LABEL_13;
      }
    }
  }
  return result;
}

uint64_t AFCCheckForSpecialFile(const char *a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  int v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char *v25;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  stat v33;
  __int128 __s;
  _BYTE v35[14];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  memset(&v33, 0, sizeof(v33));
  if (a2 && (__AFCPathDepthCheck(a2) & 1) == 0)
  {
    v6 = 3892330503;
    __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v3, 228, "Request path is outside document root", v4, v5, v32);
  }
  else
  {
    v6 = 0;
    if (a1 && !gAllowSpecialFiles)
    {
      bzero(&__s, 0x400uLL);
      if (*a1 == 47)
      {
        v7 = strlen(a1);
        if (v7 >= 1)
        {
          for (i = 0; i != v7; ++i)
          {
            if (a1[i] == 47 && a1[i + 1] != 47)
              break;
          }
        }
      }
      __strcpy_chk();
      while (1)
      {
        v9 = strlen((const char *)&__s);
        if (v9 >= 2)
        {
          v10 = v9 + 1;
          do
          {
            v11 = (v10 - 2);
            if (v35[v11 - 16] != 47)
              break;
            v35[v11 - 16] = 0;
            --v10;
          }
          while (v10 > 2);
        }
        if (__s ^ 0x7261762F | BYTE4(__s)
          && __s ^ 0x6374652F | BYTE4(__s)
          && __s ^ 0x706D742F | BYTE4(__s))
        {
          if (!gInternalBuild)
            goto LABEL_67;
          if (((_QWORD)__s != 0x762F2F31746E6D2FLL || *(_QWORD *)((char *)&__s + 3) != 0x7261762F2F3174)
            && ((_QWORD)__s != 0x652F2F31746E6D2FLL || *(_QWORD *)((char *)&__s + 3) != 0x6374652F2F3174))
          {
            v14 = (_QWORD)__s == 0x742F2F31746E6D2FLL && *(_QWORD *)((char *)&__s + 3) == 0x706D742F2F3174;
            if (!v14
              && (unint64_t)__s ^ 0x626F6D2F7261762FLL | *((_QWORD *)&__s + 1) ^ 0x7262694C2F656C69 | *(_QWORD *)v35 ^ 0x73676F4C2F797261 | v35[8])
            {
              v15 = (_QWORD)__s == 0x7269772F7261762FLL && *((_QWORD *)&__s + 1) == 0x694C2F7373656C65;
              v16 = v15 && *(_QWORD *)v35 == 0x6F4C2F7972617262;
              if (!v16 || *(_QWORD *)&v35[3] != 0x73676F4C2F7972)
              {
                v18 = (_QWORD)__s == 0x626F6D2F7261762FLL && *((_QWORD *)&__s + 1) == 0x6964654D2F656C69;
                v19 = v18 && *(_QWORD *)v35 == 0x726F746361462F61;
                if (!v19 || *(_QWORD *)&v35[6] != 0x73676F4C79726FLL)
                {
LABEL_67:
                  if (lstat((const char *)&__s, &v33))
                  {
                    if (*__error() != 2)
                    {
                      v27 = *__error();
                      v28 = __error();
                      strerror(*v28);
                      __AFCSetErrorResult_4(1, v27, 3892330519, v29, 302, "failed to retrieve file information for %s (%s)", v30, v31, (char)&__s);
                      return 23;
                    }
                  }
                  else
                  {
                    v24 = v33.st_mode & 0xF000;
                    if (v24 != 0x4000 && v24 != 0x8000)
                    {
                      v6 = 3892330506;
                      __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330506, v21, 295, "%s is special file", v22, v23, (char)&__s);
                      return v6;
                    }
                  }
                }
              }
            }
          }
        }
        v25 = strrchr((char *)&__s, 47);
        if (v25)
        {
          *v25 = 0;
          if ((_BYTE)__s)
            continue;
        }
        return 0;
      }
    }
  }
  return v6;
}

uint64_t __AFCCoordinateFileActivity(const char *a1, uint64_t a2, _QWORD *a3)
{
  size_t v6;
  CFURLRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFURLRef v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  __CFError *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD buffer[16];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2000000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3002000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v6 = strlen(a1);
  v7 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)a1, v6, 0);
  if (v7)
  {
    v11 = v7;
    v12 = dispatch_semaphore_create(0);
    dispatch_retain(v12);
    if (a2 == 1)
      _CFFileCoordinateReadingItemAtURL2();
    else
      _CFFileCoordinateWritingItemAtURL2();
    v13 = dispatch_time(0, 25000000000);
    if (dispatch_semaphore_wait(v12, v13))
    {
      AFCLog(1, "Timeout waiting for File Coordination to release %s", a1);
      v14 = 0;
    }
    else
    {
      v15 = (__CFError *)v28[3];
      if (v15)
      {
        memset(buffer, 0, sizeof(buffer));
        v16 = CFErrorCopyDescription(v15);
        if (v16)
        {
          v17 = v16;
          CFStringGetCString(v16, (char *)buffer, 256, 0x8000100u);
          CFRelease(v17);
        }
        AFCLog(1, "File Coordination error for path %s: %s", a1, (const char *)buffer);
        CFRelease((CFTypeRef)v28[3]);
      }
      v14 = v22[5];
    }
    *a3 = v14;
    if (v12)
      dispatch_release(v12);
    CFRelease(v11);
    v18 = 0;
  }
  else
  {
    v18 = __AFCSetErrorResult_4(0, 0xFFFFFFFFLL, 3892330499, v8, 402, "Could not create request URL", v9, v10, v20);
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v18;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

uint64_t RemovePath(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  stat v11;

  memset(&v11, 0, sizeof(v11));
  if (lstat(a1, &v11))
  {
    v6 = *__error();
    v7 = "lstat";
    v8 = 3892330497;
    v9 = 1335;
    return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
  }
  v5 = v11.st_mode & 0xF000;
  if (v5 != 0x4000)
  {
    if (!gAllowSpecialFiles && (v5 | 0x2000) != 0xA000)
    {
      v8 = 3892330506;
      v7 = "Special files not allowed";
      v6 = 0xFFFFFFFFLL;
      v9 = 1348;
      return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
    }
    if (unlink(a1) < 0)
    {
      v6 = *__error();
      v7 = "unlink";
      v8 = 3892330497;
      v9 = 1345;
      return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
    }
    return 0;
  }
  if ((rmdir(a1) & 0x80000000) == 0)
    return 0;
  v6 = *__error();
  v7 = "rmdir";
  v8 = 3892330497;
  v9 = 1340;
  return __AFCSetErrorResult_4(0, v6, v8, v2, v9, v7, v3, v4, v11.st_dev);
}

BOOL __AFCHasPrefix(const char *a1, char *__s)
{
  _BOOL8 result;
  size_t v5;

  result = 0;
  if (a1 && __s)
  {
    v5 = strlen(__s);
    return strlen(a1) >= v5 && strncmp(__s, a1, v5) == 0;
  }
  return result;
}

BOOL __AFCAllowedToOperateOnFile(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  int *v22;
  char *v24;
  stat v25;
  char v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a1 < 0 || !a2)
  {
    v14 = "Invalid arg(s).";
    v15 = 0;
    v16 = 0xFFFFFFFFLL;
    v17 = 7;
    v18 = 2176;
LABEL_13:
    v13 = __AFCSetErrorResult_4(v15, v16, v17, a4, v18, v14, a7, a8, (char)v24);
    return v13 != 0;
  }
  memset(&v25, 0, sizeof(v25));
  v24 = v26;
  if (fcntl(a1, 50) == -1)
  {
    v19 = *__error();
    v20 = __error();
    v14 = strerror(*v20);
    v15 = 1;
    v16 = v19;
    v17 = 23;
    v18 = 2181;
    goto LABEL_13;
  }
  if (!__AFCHasPrefix(v26, a2))
  {
    v13 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 1, v10, 2186, "Requested path (%s) does not start with AFC root (%s)", v11, v12, (char)v26);
    return v13 != 0;
  }
  if (fstat(a1, &v25) == -1)
  {
    v21 = *__error();
    v22 = __error();
    v14 = strerror(*v22);
    v15 = 0;
    v16 = v21;
    v17 = 23;
    v18 = 2191;
    goto LABEL_13;
  }
  if (v25.st_nlink != 1)
  {
    v14 = "Can't operate on this file via AFC as there are additional hard links: %d";
    LOBYTE(v24) = v25.st_nlink;
    v15 = 0;
    v16 = 0xFFFFFFFFLL;
    v17 = 1;
    v18 = 2196;
    goto LABEL_13;
  }
  v13 = 0;
  return v13 != 0;
}

uint64_t AFCGetBuffer(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v3 = 0;
  if (a2 <= 0x400000)
  {
    v4 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __AFCGetBuffer_block_invoke;
    block[3] = &unk_24D38AB98;
    block[4] = &v7;
    block[5] = a1;
    block[6] = a2;
    dispatch_sync(v4, block);
    v3 = v8[3];
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

void AFCReleaseBuffer(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD v4[6];

  v3 = *(NSObject **)(a1 + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __AFCReleaseBuffer_block_invoke;
  v4[3] = &__block_descriptor_tmp_122;
  v4[4] = a2;
  v4[5] = a1;
  dispatch_sync(v3, v4);
}

uint64_t __AFCPathContainsDots(const char *a1)
{
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  char *__stringp;

  v1 = strndup(a1, 0x400uLL);
  __stringp = v1;
  if (!v1)
    return 0;
  v2 = v1;
  v3 = strsep(&__stringp, "/");
  if (v3)
  {
    while (*v3 != 46 || v3[1] != 46 || v3[2])
    {
      v3 = strsep(&__stringp, "/");
      if (!v3)
        goto LABEL_7;
    }
    v4 = 1;
  }
  else
  {
LABEL_7:
    v4 = 0;
  }
  free(v2);
  return v4;
}

uint64_t AFCProcessSetBlockSize(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD), unint64_t a4)
{
  uint64_t Context;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  dispatch_time_t v19;
  uint64_t v21;
  const char *v22;
  int v23;
  int v24;
  char v25;

  Context = AFCConnectionGetContext(a1);
  AFCLog(5, "Processing SetBlockSize packet\n");
  if (!Context)
  {
    v21 = 3892330499;
    v22 = "No server context";
    v23 = 1;
    v24 = 2922;
    goto LABEL_15;
  }
  v12 = AFCDiscardBodyData(a1, a2);
  if (!v12)
  {
    v16 = *(_QWORD *)(a2 + 40);
    if (v16 > 0x400000)
    {
      v12 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v13, 2929, "%llu block size larger than maximum %llu", v14, v15, *(_QWORD *)(a2 + 40));
      return AFCSendStatus(a1, a2, v12);
    }
    if (v16 <= a4)
    {
      v12 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v13, 2933, "%llu block size smaller than minimum %llu", v14, v15, *(_QWORD *)(a2 + 40));
      return AFCSendStatus(a1, a2, v12);
    }
    v17 = *(NSObject **)(Context + 56);
    v18 = *(_QWORD *)(a1 + 104);
    if (v18)
      v19 = dispatch_time(0, 1000000000 * v18 * gAFCMaxIORequests);
    else
      v19 = -1;
    if (!dispatch_group_wait(v17, v19))
    {
      v12 = a3(a1, Context, *(_QWORD *)(a2 + 40));
      return AFCSendStatus(a1, a2, v12);
    }
    v21 = 3892330508;
    v22 = "timeout waiting for all IO requests to complete";
    v23 = 0;
    v24 = 2937;
LABEL_15:
    v12 = __AFCSetErrorResult_4(v23, 0xFFFFFFFFLL, v21, v9, v24, v22, v10, v11, v25);
  }
  return AFCSendStatus(a1, a2, v12);
}

uint64_t _AFCSetFSBlockSize(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 88) == a3 && *(_QWORD *)(a1 + 96) == a3)
    return 0;
  AFCLog(5, "Setting block size to %llu", a3);
  if (a3 > 0x400000)
    return 3892330503;
  *(_QWORD *)(a1 + 88) = a3;
  *(_QWORD *)(a1 + 96) = a3;
  AFCFlushServerContext(a2);
  result = 0;
  *(_QWORD *)(a2 + 8) = a3;
  return result;
}

uint64_t __AFCGetFileHash(const char *a1, CFDataRef *a2, off_t a3, off_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFNumberRef v11;
  off_t st_size;
  int v13;
  int v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  off_t v21;
  size_t v22;
  ssize_t v23;
  CFDataRef v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  int v30;
  int v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  CC_SHA1_CTX c;
  double valuePtr;
  stat v40;
  unsigned __int8 md[20];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  memset(&v40, 0, sizeof(v40));
  if (stat(a1, &v40))
  {
    v32 = __error();
    return __AFCSetErrorResult_4(0, *v32, 3892330497, v33, 1753, "stat", v34, v35, v37);
  }
  valuePtr = (double)v40.st_mtimespec.tv_nsec / 1000000000.0 + (double)v40.st_mtimespec.tv_sec;
  v11 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  if (a4 | a3)
    st_size = a4;
  else
    st_size = v40.st_size;
  if (a3 < 0)
  {
    v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 1762, "Invalid starting offset %ld.", v9, v10, a3);
    goto LABEL_36;
  }
  if (st_size <= 0)
  {
    v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 1763, "Invalid length %ld.", v9, v10, st_size);
    goto LABEL_36;
  }
  if (st_size + a3 > v40.st_size)
  {
    v36 = __AFCSetErrorResult_4(1, 0xFFFFFFFFLL, 3892330503, v8, 1764, "File %s ain't that long!", v9, v10, (char)a1);
    goto LABEL_36;
  }
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  v13 = open(a1, 0);
  if (v13 < 0)
  {
    v27 = *__error();
    v28 = 3892330516;
    v29 = "open";
    v30 = 0;
    v31 = 1825;
LABEL_35:
    v36 = __AFCSetErrorResult_4(v30, v27, v28, v17, v31, v29, v18, v19, v37);
LABEL_36:
    v25 = v36;
    if (!v11)
      return v25;
    goto LABEL_24;
  }
  v14 = v13;
  if (st_size >= 0x80000)
    v15 = 0x80000;
  else
    v15 = st_size;
  v16 = CFAllocatorAllocate(0, v15, 0);
  if (!v16)
  {
    v28 = 3892330499;
    v29 = "CFAllocatorAlocate";
    v30 = 1;
    v27 = 0xFFFFFFFFLL;
    v31 = 1830;
    goto LABEL_35;
  }
  v20 = v16;
  if (lseek(v14, a3, 0) != a3)
  {
    v27 = *__error();
    v28 = 3892330516;
    v29 = "lseek";
    v30 = 0;
    v31 = 1832;
    goto LABEL_35;
  }
  v21 = 0;
  while (1)
  {
    v22 = st_size - v21 >= v15 ? v15 : st_size - v21;
    v23 = read(v14, v20, v22);
    if (v23 < 1)
      break;
    CC_SHA1_Update(&c, v20, v23);
    v21 += v23;
    if (v21 >= st_size)
    {
      CFAllocatorDeallocate(0, v20);
      goto LABEL_22;
    }
  }
  CFAllocatorDeallocate(0, v20);
  if (v23 < 0)
  {
    v27 = *__error();
    v28 = 3892330516;
    v29 = "read";
    v30 = 1;
    v31 = 1847;
    goto LABEL_35;
  }
LABEL_22:
  CC_SHA1_Final(md, &c);
  v24 = CFDataCreate(0, md, 20);
  if (!v24)
  {
    v28 = 3892330499;
    v29 = "CFDataCreate";
    v30 = 1;
    v27 = 0xFFFFFFFFLL;
    v31 = 1852;
    goto LABEL_35;
  }
  v25 = 0;
  *a2 = v24;
  if (!v11)
    return v25;
LABEL_24:
  CFRelease(v11);
  return v25;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x24BDBBA68](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
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

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x24BDBC138](number);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x24BDBC158](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x24BDBC3E0](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC450](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x24BDBC458](allocator, *(_QWORD *)&sock, callBackTypes, callout, context);
}

void CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
  MEMORY[0x24BDBC468](s, callBackTypes);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x24BDBC480](s);
}

void CFSocketSetSocketFlags(CFSocketRef s, CFOptionFlags flags)
{
  MEMORY[0x24BDBC488](s, flags);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x24BDE8658](context);
}

OSStatus SSLGetBufferedReadSize(SSLContextRef context, size_t *bufferSize)
{
  return MEMORY[0x24BDE8670](context, bufferSize);
}

OSStatus SSLGetConnection(SSLContextRef context, SSLConnectionRef *connection)
{
  return MEMORY[0x24BDE8680](context, connection);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE86E0](context, data, dataLength, processed);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE8750](context, data, dataLength, processed);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFFileCoordinateReadingItemAtURL2()
{
  return MEMORY[0x24BDBCFD0]();
}

uint64_t _CFFileCoordinateWritingItemAtURL2()
{
  return MEMORY[0x24BDBCFD8]();
}

uint64_t _CFFileDidMove2()
{
  return MEMORY[0x24BDBCFE0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x24BDAD1D0](ident, facility, *(_QWORD *)&opts);
}

int asl_vlog(asl_object_t obj, asl_object_t msg, int level, const char *format, va_list ap)
{
  return MEMORY[0x24BDAD1F8](obj, msg, *(_QWORD *)&level, format, ap);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

int flock(int a1, int a2)
{
  return MEMORY[0x24BDAE3B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x24BDAE518](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int getdtablesize(void)
{
  return MEMORY[0x24BDAE5E0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x24BDAE968](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x24BDAE998]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED90](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

void rewinddir(DIR *a1)
{
  MEMORY[0x24BDAFBA0](a1);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x24BDAFDB0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x24BDAFE58](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x24BDB0290](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x24BDB02F8](a1, a2);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

