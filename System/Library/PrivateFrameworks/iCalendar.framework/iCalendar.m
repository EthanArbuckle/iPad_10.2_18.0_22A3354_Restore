uint64_t OUTLINED_FUNCTION_3_0()
{
  void *v0;

  return objc_msgSend(v0, "lineNumber");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id logHandle()
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_101);
  return (id)logHandle_handle;
}

const void *symbolicColorForLegacyRGB(CFStringRef theString)
{
  const void *Value;
  CFRange v4;

  if (symbolicColorForLegacyRGB_onceToken != -1)
    dispatch_once(&symbolicColorForLegacyRGB_onceToken, &__block_literal_global_0);
  if (CFStringGetLength(theString) == 9)
  {
    v4.location = 0;
    v4.length = 7;
    theString = CFStringCreateWithSubstring(0, theString, v4);
  }
  else
  {
    CFRetain(theString);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, theString);
  CFRelease(theString);
  return Value;
}

void __symbolicColorForLegacyRGB_block_invoke()
{
  symbolicColorForLegacyRGB_legacyColorMapping = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#0252D4"), CFSTR("blue"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#492BA1"), CFSTR("purple"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#F57802"), CFSTR("orange"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#2CA10B"), CFSTR("green"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#E51717"), CFSTR("red"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#0F4D8C"), CFSTR("blue"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#670A6C"), CFSTR("purple"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#E56200"), CFSTR("orange"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#2F8D00"), CFSTR("green"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#B5000D"), CFSTR("red"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#0E61B9"), CFSTR("blue"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#711A76"), CFSTR("purple"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#EC4400"), CFSTR("orange"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#44A703"), CFSTR("green"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#B90E28"), CFSTR("red"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#0E61B9"), CFSTR("blue"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#711A76"), CFSTR("purple"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#F64F00"), CFSTR("orange"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#44A703"), CFSTR("green"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#B90E28"), CFSTR("red"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#E6C800"), CFSTR("yellow"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#882F00"), CFSTR("brown"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#1BADF8"), CFSTR("blue"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#CC73E1"), CFSTR("purple"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#FF9500"), CFSTR("orange"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#63DA38"), CFSTR("green"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#FF2968"), CFSTR("red"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#FFCC00"), CFSTR("yellow"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#A2845E"), CFSTR("brown"));
  CFDictionarySetValue((CFMutableDictionaryRef)symbolicColorForLegacyRGB_legacyColorMapping, CFSTR("#EABB00"), CFSTR("yellow"));
}

void sub_1D345E988(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3461B90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void iCalendarAppendStringToStringWithOptions(void *a1, void *a2, char a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a1;
  v5 = a2;
  if (v7)
  {
    if ((a3 & 0x20) != 0)
    {
      ICSRedactString(v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v6);

    }
    else
    {
      objc_msgSend(v5, "appendString:", v7);
    }
  }

}

const __CFString *iCalendarRepresentationForCALDay(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("ERROR");
  else
    return off_1E953B070[a1 - 1];
}

void sub_1D3468B88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D346CA40(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("AddressParsing"));
  _Unwind_Resume(a1);
}

id VCSLogHandle()
{
  if (VCSLogHandle_onceToken != -1)
    dispatch_once(&VCSLogHandle_onceToken, &__block_literal_global_5);
  return (id)VCSLogHandle_handle;
}

id ICSRedactString(void *a1)
{
  id v1;
  void *v2;
  _WORD v4[10];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ICSRedactBytes((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), v4);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v4, 20, 4);

  return v2;
}

void ICSRedactBytes(const void *a1, CC_LONG a2, _WORD *a3)
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  CC_SHA256_CTX v13;
  unsigned __int8 md[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)_testModeSalt;
  if (!_testModeSalt)
  {
    if (_uniqueSaltForThisMachine_onceToken != -1)
      dispatch_once(&_uniqueSaltForThisMachine_onceToken, &__block_literal_global_6);
    v6 = (void *)_uniqueSaltForThisMachine_saltData;
  }
  v7 = v6;
  memset(&v13, 0, sizeof(v13));
  CC_SHA256_Init(&v13);
  v8 = objc_retainAutorelease(v7);
  CC_SHA256_Update(&v13, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  CC_SHA256_Update(&v13, a1, a2);
  CC_SHA256_Final(md, &v13);
  v9 = 0;
  v10 = md[8];
  *a3 = -24592;
  a3[1] = _pictureForByte_table[v10];
  v11 = (char *)a3 + 5;
  do
  {
    v12 = md[v9];
    *(v11 - 1) = _nibbleToChar_byteMap[v12 >> 4];
    *v11 = _nibbleToChar_byteMap[v12 & 0xF];
    v11 += 2;
    ++v9;
  }
  while (v9 != 8);

}

uint64_t _pictureForByte(uint64_t result, _WORD *a2)
{
  *a2 = -24592;
  a2[1] = _pictureForByte_table[result];
  return result;
}

id ICSAppendEmoji(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _WORD v5[2];

  v1 = a1;
  v5[0] = -24592;
  v5[1] = _pictureForByte_table[objc_msgSend(v1, "hash")];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v5, 4, 4);
  objc_msgSend(v1, "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ICSRedactionSetTestModeEnabled(int a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;

  if (a1)
  {
    v4 = 4;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_testModeSalt;
    _testModeSalt = v1;

  }
  else
  {
    v3 = (void *)_testModeSalt;
    _testModeSalt = 0;

  }
}

void ___uniqueSaltForThisMachine_block_invoke()
{
  void *v0;
  const __CFUUID *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CFAllocatorRef alloc;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("icaluuid"));
  alloc = (CFAllocatorRef)objc_claimAutoreleasedReturnValue();

  if (!alloc)
  {
    v1 = CFUUIDCreate(0);
    alloc = (CFAllocatorRef)CFUUIDCreateString(0, v1);
    CFRelease(v1);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", alloc, CFSTR("icaluuid"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronize");

  }
  -[__CFAllocator dataUsingEncoding:](alloc, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)_uniqueSaltForThisMachine_saltData;
  _uniqueSaltForThisMachine_saltData = v5;

}

_QWORD *VCSByteBufferWithCapacity(NSUInteger a1)
{
  _QWORD *v2;
  void *v3;

  v2 = NSZoneMalloc(0, 0x18uLL);
  if (a1 <= 1)
    a1 = 1;
  v3 = NSZoneMalloc(0, a1);
  v2[1] = 0;
  v2[2] = a1;
  *v2 = v3;
  return v2;
}

void VCSByteBufferAppendByte(uint64_t a1, char a2)
{
  uint64_t v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BYTE *v10;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 && v5 <= 0x7FFFFFFE)
  {
    v5 = 2 * v4;
    v7 = NSZoneRealloc(0, *(void **)a1, 2 * v4);
    if (v7)
    {
      *(_QWORD *)a1 = v7;
      *(_QWORD *)(a1 + 16) = v5;
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 16);
    }
  }
  v8 = *(_QWORD *)(a1 + 8);
  if (v8 == v5)
  {
    VCSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      VCSByteBufferAppendByte_cold_1(a1, v9);

  }
  else
  {
    v10 = *(_BYTE **)a1;
    *(_QWORD *)(a1 + 8) = v8 + 1;
    v10[v8] = a2;
  }
}

void VCSByteBufferAppendCString(uint64_t a1, char *a2)
{
  char v2;
  unsigned __int8 *v4;
  int v5;

  v2 = *a2;
  if (*a2)
  {
    v4 = (unsigned __int8 *)(a2 + 1);
    do
    {
      VCSByteBufferAppendByte(a1, v2);
      v5 = *v4++;
      v2 = v5;
    }
    while (v5);
  }
}

id VCSByteBufferData(_QWORD *a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", *a1, a1[1]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSZoneFree(0, a1);
  return v2;
}

id ICSDefaultPRODID()
{
  if (ICSDefaultPRODID_onceToken != -1)
    dispatch_once(&ICSDefaultPRODID_onceToken, &__block_literal_global_8);
  return (id)ICSDefaultPRODID_defaultPRODID;
}

void sub_1D3472880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.iCalendar", "ICSTimeZoneTranslator");
  v1 = (void *)logHandle_handle;
  logHandle_handle = (uint64_t)v0;

}

CFDataRef ICSDecodeBase64(const __CFAllocator *a1, CFStringRef theString)
{
  const char *CStringPtr;
  const UniChar *CharactersPtr;
  CFIndex Length;
  const UInt8 *v8;
  int v9;
  CFIndex v10;
  unint64_t v11;
  uint64_t v12;
  CFIndex v13;
  int CharacterAtIndex;
  int v15;
  int v16;
  int v17;
  CFIndex v18;
  const __CFAllocator *bytesDeallocator;

  if (!theString)
    return (CFDataRef)objc_alloc_init(MEMORY[0x1E0C99D50]);
  CStringPtr = CFStringGetCStringPtr(theString, 0x201u);
  if (CStringPtr)
    CharactersPtr = 0;
  else
    CharactersPtr = CFStringGetCharactersPtr(theString);
  Length = CFStringGetLength(theString);
  bytesDeallocator = a1;
  v8 = (const UInt8 *)CFAllocatorAllocate(a1, 3 * Length / 4 + 1, 0);
  if (Length < 1)
  {
    v13 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      if (CStringPtr)
      {
        v15 = *(unsigned __int8 *)CStringPtr++;
        CharacterAtIndex = v15;
      }
      else
      {
        CStringPtr = 0;
        if (CharactersPtr)
        {
          v16 = *(unsigned __int8 *)CharactersPtr++;
          CharacterAtIndex = v16;
        }
        else
        {
          CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v10);
        }
      }
      if (CharacterAtIndex == 61)
        ++v11;
      v17 = __CFPLDataDecodeTable[CharacterAtIndex & 0x7F];
      if ((v17 & 0x80000000) == 0)
      {
        ++v12;
        v9 = v17 + (v9 << 6);
        if ((v12 & 3) == 0)
        {
          v8[v13] = BYTE2(v9);
          if (v11 > 1)
          {
            ++v13;
          }
          else
          {
            v18 = v13 + 2;
            v8[v13 + 1] = BYTE1(v9);
            if (v11)
            {
              v13 += 2;
            }
            else
            {
              v13 += 3;
              v8[v18] = v9;
            }
          }
        }
      }
      ++v10;
    }
    while (Length != v10);
  }
  return CFDataCreateWithBytesNoCopy(bytesDeallocator, v8, v13, bytesDeallocator);
}

CFStringRef ICSEncodeBase64(const __CFAllocator *a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  const char *v6;
  int v7;
  unint64_t v8;
  CFIndex v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  unsigned int v17;
  uint64_t v18;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v6 = (const char *)CFAllocatorAllocate(a1, 2 * (4 * Length / 3) + 4, 0);
  if (Length < 1)
  {
    v7 = 0;
    goto LABEL_18;
  }
  v7 = 0;
  v8 = 0;
  v9 = Length;
  do
  {
    v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      v12 = v7 + 1;
      v6[v7] = __CFPLDataEncodeTable[((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 6) & 0x3F];
      v11 = *BytePtr & 0x3F;
      v13 = 2;
    }
    else
    {
      if (v10 == 1)
      {
        v11 = ((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v10)
          goto LABEL_11;
        v11 = (unint64_t)*BytePtr >> 2;
      }
      v13 = 1;
      v12 = v7;
    }
    v7 += v13;
    v6[v12] = __CFPLDataEncodeTable[v11];
LABEL_11:
    ++v8;
    ++BytePtr;
    --v9;
  }
  while (v9);
  if (Length % 3uLL == 2)
  {
    v16 = __CFPLDataEncodeTable[4 * (*(BytePtr - 1) & 0xF)];
    v15 = 2;
    v17 = 1;
    v14 = v7;
LABEL_17:
    v18 = v17 + (uint64_t)v7;
    v6[v14] = v16;
    v7 += v15;
    v6[v18] = 61;
  }
  else if (Length % 3uLL == 1)
  {
    v14 = v7 + 1;
    v6[v7] = __CFPLDataEncodeTable[16 * (*(BytePtr - 1) & 3)];
    v15 = 3;
    v16 = 61;
    v17 = 2;
    goto LABEL_17;
  }
LABEL_18:
  v6[v7] = 0;
  return CFStringCreateWithCStringNoCopy(a1, v6, 0x600u, a1);
}

__CFString *stringForEntityStatus(unint64_t a1)
{
  if (a1 < 9)
    return off_1E953B400[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid(%lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForEntityTransparency(unint64_t a1)
{
  if (a1 < 5)
    return off_1E953B448[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid(%lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForEntityClassification(unint64_t a1)
{
  if (a1 < 3)
    return off_1E953B470[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid(%lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t strncmp_s(const char *a1, const char *a2, size_t a3)
{
  size_t v6;

  if (a1 && (v6 = strlen(a1), a2) && v6 >= a3 && strlen(a2) >= a3)
    return strncmp(a1, a2, a3);
  else
    return 0xFFFFFFFFLL;
}

uint64_t vcsTokenCompare(const char *a1, uint64_t a2)
{
  return strcasecmp(a1, *(const char **)(a2 + 8));
}

uint64_t vcsPropertyCompare(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void VCSByteBufferAppendByte_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D3456000, a2, OS_LOG_TYPE_ERROR, "Cannot append any more bytes to buffer at %p.", (uint8_t *)&v2, 0xCu);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C98F40](theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1E0C99168]();
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3468](zone, size);
}

void *__cdecl NSZoneRealloc(NSZone *zone, void *ptr, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3470](zone, ptr, size);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92E0](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

