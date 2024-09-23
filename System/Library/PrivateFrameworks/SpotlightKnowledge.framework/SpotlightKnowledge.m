uint64_t v2_writeVInt64(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64x2_t v9;
  int16x8_t v10;
  uint64_t v11;
  uint64x2_t v12;
  int16x8_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64x2_t v16;
  int16x8_t v17;

  if (a3 > 0x7F)
  {
    if (a3 >> 14)
    {
      if (a3 >> 21)
      {
        if (a3 >> 28)
        {
          if (a3 >> 35)
          {
            if (a3 >> 42)
            {
              if (a3 >> 49)
              {
                v14 = a2 + 1;
                if (HIBYTE(a3))
                {
                  *(_BYTE *)(a1 + a2) = -1;
                  *(_QWORD *)(a1 + v14) = a3;
                  return a2 + 9;
                }
                else
                {
                  v15 = (_BYTE *)(a1 + a2);
                  *v15 = -2;
                  v16 = (uint64x2_t)vdupq_n_s64(a3);
                  v17 = (int16x8_t)vshlq_u64(v16, (uint64x2_t)xmmword_24796F4E0);
                  *(int32x2_t *)v16.i8 = vmovn_s64((int64x2_t)vshlq_u64(v16, (uint64x2_t)xmmword_24796F4F0));
                  *(int32x2_t *)v17.i8 = vmovn_s64((int64x2_t)v17);
                  v17.i16[1] = v17.i16[2];
                  v17.i16[2] = v16.i16[0];
                  v17.i16[3] = v16.i16[2];
                  *(_DWORD *)(a1 + v14) = vmovn_s16(v17).u32[0];
                  v15[5] = BYTE2(a3);
                  v15[6] = BYTE1(a3);
                  v3 = a2 + 8;
                  v15[7] = a3;
                }
              }
              else
              {
                v11 = a1 + a2;
                *(_BYTE *)v11 = BYTE6(a3) | 0xFC;
                v12 = (uint64x2_t)vdupq_n_s64(a3);
                v13 = (int16x8_t)vshlq_u64(v12, (uint64x2_t)xmmword_24796F500);
                *(int32x2_t *)v12.i8 = vmovn_s64((int64x2_t)vshlq_u64(v12, (uint64x2_t)xmmword_24796F510));
                *(int32x2_t *)v13.i8 = vmovn_s64((int64x2_t)v13);
                v13.i16[1] = v13.i16[2];
                v13.i16[2] = v12.i16[0];
                v13.i16[3] = v12.i16[2];
                *(_DWORD *)(v11 + 1) = vmovn_s16(v13).u32[0];
                *(_BYTE *)(v11 + 5) = BYTE1(a3);
                v3 = a2 + 7;
                *(_BYTE *)(v11 + 6) = a3;
              }
            }
            else
            {
              v8 = a1 + a2;
              v9 = (uint64x2_t)vdupq_n_s64(a3);
              *(_BYTE *)v8 = BYTE5(a3) | 0xF8;
              v10 = (int16x8_t)vshlq_u64(v9, (uint64x2_t)xmmword_24796F4F0);
              *(int32x2_t *)v9.i8 = vmovn_s64((int64x2_t)vshlq_u64(v9, (uint64x2_t)xmmword_24796F520));
              *(int32x2_t *)v10.i8 = vmovn_s64((int64x2_t)v10);
              v10.i16[1] = v10.i16[2];
              v10.i16[2] = v9.i16[0];
              v10.i16[3] = v9.i16[2];
              *(_DWORD *)(v8 + 1) = vmovn_s16(v10).u32[0];
              v3 = a2 + 6;
              *(_BYTE *)(v8 + 5) = a3;
            }
          }
          else
          {
            v7 = (_BYTE *)(a1 + a2);
            *v7 = BYTE4(a3) | 0xF0;
            v7[1] = BYTE3(a3);
            v7[2] = BYTE2(a3);
            v7[3] = BYTE1(a3);
            v3 = a2 + 5;
            v7[4] = a3;
          }
        }
        else
        {
          v6 = (_BYTE *)(a1 + a2);
          *v6 = BYTE3(a3) | 0xE0;
          v6[1] = BYTE2(a3);
          v6[2] = BYTE1(a3);
          v3 = a2 + 4;
          v6[3] = a3;
        }
      }
      else
      {
        v5 = (_BYTE *)(a1 + a2);
        *v5 = BYTE2(a3) | 0xC0;
        v5[1] = BYTE1(a3);
        v3 = a2 + 3;
        v5[2] = a3;
      }
    }
    else
    {
      v4 = (_BYTE *)(a1 + a2);
      *v4 = BYTE1(a3) | 0x80;
      v3 = a2 + 2;
      v4[1] = a3;
    }
  }
  else
  {
    v3 = a2 + 1;
    *(_BYTE *)(a1 + a2) = a3;
  }
  return v3;
}

unint64_t v2_readVInt64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t result;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v9;
  unsigned __int8 *v10;

  v3 = *a2;
  v4 = *a2 + 1;
  v5 = *(char *)(a1 + *a2);
  result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (v5 > 0xBFu)
    {
      if (v5 > 0xDFu)
      {
        if (v5 > 0xEFu)
        {
          if (v5 > 0xF7u)
          {
            if (v5 > 0xFBu)
            {
              if (v5 > 0xFDu)
              {
                if (v5 == 255)
                {
                  result = *(_QWORD *)(a1 + v4);
                  v4 = v3 + 9;
                }
                else
                {
                  v9 = (unint64_t)*(unsigned __int8 *)(a1 + v4) << 48;
                  v10 = (unsigned __int8 *)(v3 + a1);
                  result = v9 | ((unint64_t)v10[2] << 40) | ((unint64_t)v10[3] << 32) | ((unint64_t)v10[4] << 24) | ((unint64_t)v10[5] << 16) | ((unint64_t)v10[6] << 8) | v10[7];
                  v4 = v3 + 8;
                }
              }
              else
              {
                v7 = ((result & 1) << 48) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 40);
                v8 = (unsigned __int8 *)(v3 + a1);
                result = v7 | ((unint64_t)v8[2] << 32) | ((unint64_t)v8[3] << 24) | ((unint64_t)v8[4] << 16) | ((unint64_t)v8[5] << 8) | v8[6];
                v4 = v3 + 7;
              }
            }
            else
            {
              result = ((result & 3) << 40) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 32) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 4) << 8) | *(unsigned __int8 *)(v3 + a1 + 5);
              v4 = v3 + 6;
            }
          }
          else
          {
            result = ((result & 7) << 32) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 8) | *(unsigned __int8 *)(v3 + a1 + 4);
            v4 = v3 + 5;
          }
        }
        else
        {
          result = ((result & 0xF) << 24) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          v4 = v3 + 4;
        }
      }
      else
      {
        result = ((result & 0x1F) << 16) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        v4 = v3 + 3;
      }
    }
    else
    {
      result = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      v4 = v3 + 2;
    }
  }
  *a2 = v4;
  return result;
}

const char *typeToStr(int a1)
{
  if ((a1 - 1) > 0xD)
    return "Unknown";
  else
    return off_2518FF7B8[a1 - 1];
}

char *getDateString(__CFCalendar *a1, char *a2, CFAbsoluteTime a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v5 = 0;
  if (CFCalendarDecomposeAbsoluteTime(a1, a3, "yMdHms", (char *)&v7 + 4, &v7, (char *)&v6 + 4, &v6, (char *)&v5 + 4, &v5))
  {
    snprintf(a2, 0x100uLL, "%04d-%02d-%02d %02d:%02d:%02d", HIDWORD(v7), v7, HIDWORD(v6), v6, HIDWORD(v5), v5);
  }
  return a2;
}

const char *writeStrToBuf(const char *result, uint64_t a2, _DWORD *a3)
{
  const char *v5;
  uint64_t v6;

  if (a2)
  {
    v5 = result;
    v6 = *a3;
    result = (const char *)strlen(result);
    if ((unint64_t)&result[v6 + 1] <= 0x80)
    {
      memcpy((void *)(a2 + v6), v5, (size_t)(result + 1));
      result = (const char *)strlen(v5);
      *a3 += (_DWORD)result + 1;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

const __CFArray *getValueAtIndex(const __CFArray *result, CFIndex a2)
{
  const __CFArray *v3;

  if (result)
  {
    v3 = result;
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      result = (const __CFArray *)CFArrayGetValueAtIndex(v3, a2);
      if (result == (const __CFArray *)*MEMORY[0x24BDBD430])
        return 0;
    }
  }
  return result;
}

void *getValueForKey(CFDictionaryRef theDict, const void *a2)
{
  void *result;
  void *value;

  result = 0;
  value = 0;
  if (theDict && a2)
  {
    if (CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value))
    {
      if (value == (void *)*MEMORY[0x24BDBD430])
        return 0;
      else
        return value;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFDateRef copyDateValueForKey(CFDictionaryRef theDict, const void *a2)
{
  CFDateRef result;
  CFTypeID v4;
  CFAbsoluteTime v5;
  void *value;

  result = 0;
  value = 0;
  if (theDict && a2)
  {
    if (CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value)
      && value != (void *)*MEMORY[0x24BDBD430]
      && (v4 = CFGetTypeID(value), v4 == CFDateGetTypeID()))
    {
      v5 = MEMORY[0x2495855D8](value);
      return CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFStringRef copyStringValueForKey(CFDictionaryRef theDict, const void *a2)
{
  CFStringRef result;
  CFTypeID v4;
  void *value;

  result = 0;
  value = 0;
  if (theDict && a2)
  {
    if (CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value)
      && value != (void *)*MEMORY[0x24BDBD430]
      && (v4 = CFGetTypeID(value), v4 == CFStringGetTypeID()))
    {
      result = (CFStringRef)CFStringGetLength((CFStringRef)value);
      if (result)
        return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)value);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFArray *copyArrayValueForKey(const __CFDictionary *a1, const void *a2)
{
  __CFArray *Mutable;
  CFTypeID v3;
  CFIndex Count;
  uint64_t v5;
  const __CFAllocator *v6;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFStringRef Copy;
  CFStringRef v10;
  void *value;

  Mutable = 0;
  value = 0;
  if (a1 && a2)
  {
    if (CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value)
      && value != (void *)*MEMORY[0x24BDBD430]
      && (v3 = CFGetTypeID(value), v3 == CFArrayGetTypeID())
      && CFArrayGetCount((CFArrayRef)value)
      && (Count = CFArrayGetCount((CFArrayRef)value)) != 0)
    {
      v5 = Count;
      v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, MEMORY[0x24BDBD690]);
      if (v5 >= 1)
      {
        for (i = 0; i != v5; ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)value, i);
          Copy = CFStringCreateCopy(v6, ValueAtIndex);
          if (Copy)
          {
            v10 = Copy;
            CFArrayAppendValue(Mutable, Copy);
            CFRelease(v10);
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return Mutable;
}

uint64_t SKGBundleIsCalendar(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mobilecal"));
}

uint64_t SKGBundleIsFileProvider(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));
}

uint64_t SKGBundleIsMail(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.email.SearchIndexer"));

  return v2;
}

uint64_t SKGBundleIsMessages(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.MobileSMS"));
}

uint64_t SKGBundleIsSafari(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
}

uint64_t SKGBundleIsPommesCtl(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.pommesctl"));
}

id csimport_xpc_dictionary_decode_status_with_error(void *a1)
{
  id v1;
  void *v2;
  void *int64;
  const char *string;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = 1;
    goto LABEL_7;
  }
  int64 = (void *)xpc_dictionary_get_int64(v1, "status");
  if (int64)
  {
    string = xpc_dictionary_get_string(v2, "ed");
    v5 = (void *)MEMORY[0x24BDD1540];
    if (string)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", string, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, int64, 0);
      int64 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = -1;
LABEL_7:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("SKGAttributeProcessorErrorDomain"), v8, 0);
    int64 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return int64;
}

id indexPath()
{
  void *v0;
  void *v1;

  NSHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingFormat:", CFSTR("/%s/%s"), "Library/Spotlight/CoreSpotlight", "SpotlightKnowledgeEvents/index.V2");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id activityJournalPath()
{
  void *v0;
  void *v1;

  indexPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingFormat:", CFSTR("/%@"), CFSTR("activity_journal"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t languageIsCJK(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || (objc_msgSend(v1, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || (objc_msgSend(v1, "hasPrefix:", CFSTR("yue")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("ko"));
  }

  return v2;
}

CFLocaleRef currentSystemLocale()
{
  return copyCurrentLocale();
}

CFLocaleRef copyCurrentLocale()
{
  const __CFArray *v0;
  const __CFArray *v1;
  const __CFString *ValueAtIndex;
  CFLocaleRef v3;

  v0 = copyCurrentPreferredLanguages();
  if (!v0)
    return 0;
  v1 = v0;
  if (CFArrayGetCount(v0))
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, 0);
    v3 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], ValueAtIndex);
  }
  else
  {
    v3 = 0;
  }
  CFRelease(v1);
  return v3;
}

const __CFArray *currentSystemPreferredLanguages()
{
  return copyCurrentPreferredLanguages();
}

const __CFArray *copyCurrentPreferredLanguages()
{
  const __CFArray *v0;
  const __CFArray *v1;

  v0 = CFLocaleCopyPreferredLanguages();
  v1 = copyNormalizedLanguagesForIdentifiers(v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

uint64_t localeChangeCallback(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "updateLocale");
  return result;
}

void sub_24796B0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id localeKeyForLocale(void *a1)
{
  void *v1;
  uint64_t LanguageIDForIdentifier;
  void *v3;
  void *v4;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LanguageIDForIdentifier = SILanguagesGetLanguageIDForIdentifier();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", LanguageIDForIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

const __CFArray *copyNormalizedLanguagesForIdentifiers(const __CFArray *a1)
{
  CFIndex Count;
  const __CFArray *Mutable;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFLocale *v6;
  const __CFLocale *v7;
  const void *v8;
  CFLocaleRef v9;
  CFLocaleRef v10;
  const __CFString *v11;
  const __CFLocale *v12;
  const __CFLocale *v13;
  const void *v14;
  const __CFString *v16;
  const __CFLocale *v17;
  const void *v18;
  const void *v19;
  CFRange v20;
  CFRange v21;
  CFRange v22;

  if (a1)
  {
    Count = CFArrayGetCount(a1);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, i);
        v6 = copyNormalizedLocaleForIdentifier(ValueAtIndex);
        if (v6)
        {
          v7 = v6;
          v8 = (const void *)MEMORY[0x249585644]();
          v20.length = CFArrayGetCount(Mutable);
          v20.location = 0;
          if (!CFArrayContainsValue(Mutable, v20, v8))
            CFArrayAppendValue(Mutable, v8);
          CFRelease(v7);
        }
      }
    }
  }
  else
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  }
  if (!CFArrayGetCount(Mutable))
  {
    v9 = CFLocaleCopyCurrent();
    if (v9)
    {
      v10 = v9;
      v11 = (const __CFString *)MEMORY[0x249585644]();
      v12 = copyNormalizedLocaleForIdentifier(v11);
      if (v12)
      {
        v13 = v12;
        v14 = (const void *)MEMORY[0x249585644]();
        v21.length = CFArrayGetCount(Mutable);
        v21.location = 0;
        if (!CFArrayContainsValue(Mutable, v21, v14))
          CFArrayAppendValue(Mutable, v14);
        CFRelease(v13);
      }
    }
    else
    {
      if (!CFLocaleGetSystem()
        || (v16 = (const __CFString *)MEMORY[0x249585644](), (v17 = copyNormalizedLocaleForIdentifier(v16)) == 0))
      {
LABEL_18:
        if (!CFArrayGetCount(Mutable))
          CFArrayAppendValue(Mutable, CFSTR("en-US"));
        return Mutable;
      }
      v10 = v17;
      v18 = (const void *)MEMORY[0x249585644]();
      v22.length = CFArrayGetCount(Mutable);
      v22.location = 0;
      if (!CFArrayContainsValue(Mutable, v22, v18))
      {
        v19 = (const void *)MEMORY[0x249585644](v10);
        CFArrayAppendValue(Mutable, v19);
      }
    }
    CFRelease(v10);
    goto LABEL_18;
  }
  return Mutable;
}

const __CFLocale *copyNormalizedLocaleForIdentifier(CFLocaleIdentifier localeIdentifier)
{
  const __CFLocale *v1;
  const __CFLocale *v2;
  CFTypeRef Value;
  const void *v4;
  const __CFArray *v5;
  const __CFLocale *v6;
  CFTypeRef v7;
  BOOL v8;
  const __CFAllocator *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFRange v13;

  if (localeIdentifier)
    v1 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], localeIdentifier);
  else
    v1 = CFLocaleCopyCurrent();
  v2 = v1;
  if (v1)
  {
    Value = CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x24BDBD3D8]);
    if (Value)
    {
      v4 = Value;
      if (getValidRegions_onceToken != -1)
        dispatch_once(&getValidRegions_onceToken, &__block_literal_global_133);
      v5 = (const __CFArray *)getValidRegions_gRegions;
      v13.length = CFArrayGetCount((CFArrayRef)getValidRegions_gRegions);
      v13.location = 0;
      if (CFArrayContainsValue(v5, v13, v4))
      {
        v6 = v2;
LABEL_19:
        CFRelease(v2);
        return v6;
      }
    }
    v6 = (const __CFLocale *)CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x24BDBD418]);
    v7 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x24BDBD420]);
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      if (!v6)
        goto LABEL_19;
      v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@_US"), v6);
    }
    else
    {
      v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@-%@_US"), v6, v7);
    }
    v11 = v10;
    v6 = CFLocaleCreate(v9, v10);
    CFRelease(v11);
    goto LABEL_19;
  }
  return 0;
}

CFArrayRef __getValidRegions_block_invoke()
{
  CFArrayRef result;
  const void *v1[258];

  v1[257] = *(const void **)MEMORY[0x24BDAC8D0];
  memcpy(v1, off_2518FFA68, 0x808uLL);
  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, 257, MEMORY[0x24BDBD690]);
  getValidRegions_gRegions = (uint64_t)result;
  return result;
}

id SKGLogAgentInit()
{
  if (SKGLogAgentInit_sOnceAgent != -1)
    dispatch_once(&SKGLogAgentInit_sOnceAgent, &__block_literal_global_3);
  return (id)SKGLogAgentInit_sSKGAgentLog;
}

id SKGLogGraphInit()
{
  if (SKGLogGraphInit_sOnceGraph != -1)
    dispatch_once(&SKGLogGraphInit_sOnceGraph, &__block_literal_global_3);
  return (id)SKGLogGraphInit_sSKGGraphLog;
}

id SKGLogUpdaterInit()
{
  if (SKGLogUpdaterInit_sOnceUpdater != -1)
    dispatch_once(&SKGLogUpdaterInit_sOnceUpdater, &__block_literal_global_5);
  return (id)SKGLogUpdaterInit_sSKGUpdaterLog;
}

id SKGLogEventInit()
{
  if (SKGLogEventInit_sOnceEvent != -1)
    dispatch_once(&SKGLogEventInit_sOnceEvent, &__block_literal_global_7);
  return (id)SKGLogEventInit_sSKGEventLog;
}

id SKGLogEmbedInit()
{
  if (SKGLogEmbedInit_sOnceEmbed != -1)
    dispatch_once(&SKGLogEmbedInit_sOnceEmbed, &__block_literal_global_9);
  return (id)SKGLogEmbedInit_sSKGEmbedLog;
}

id SKGLogKeyphraseInit()
{
  if (SKGLogKeyphraseInit_sOnceKeyphrase != -1)
    dispatch_once(&SKGLogKeyphraseInit_sOnceKeyphrase, &__block_literal_global_11);
  return (id)SKGLogKeyphraseInit_sSKGKeyphraseLog;
}

id SKGLogJournalInit()
{
  if (SKGLogJournalInit_sOnceJournals != -1)
    dispatch_once(&SKGLogJournalInit_sOnceJournals, &__block_literal_global_13);
  return (id)SKGLogJournalInit_sSKGJournalLog;
}

id SKGLogInit()
{
  if (SKGLogInit_sOnce != -1)
    dispatch_once(&SKGLogInit_sOnce, &__block_literal_global_15);
  return (id)SKGLogInit_sSKGLog;
}

uint64_t stringComposedLengthForEmbeddingCheck(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = objc_msgSend(v1, "length");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __stringComposedLengthForEmbeddingCheck_block_invoke;
  v5[3] = &unk_251900378;
  v5[4] = &v6;
  objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_24796D340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __stringComposedLengthForEmbeddingCheck_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) >= 0xAuLL)
    *a7 = 1;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
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

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB98](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x24BDBBBA0](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x24BDBBBD8](calendar, tz);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x24BDBBF40]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF68](allocator, locale);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF88]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC760]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

uint64_t SILanguagesGetLanguage()
{
  return MEMORY[0x24BEB0140]();
}

uint64_t SILanguagesGetLanguageID()
{
  return MEMORY[0x24BEB0148]();
}

uint64_t SILanguagesGetLanguageIDForIdentifier()
{
  return MEMORY[0x24BEB0150]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x24BE66788]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t fd_create_protected()
{
  return MEMORY[0x24BE67658]();
}

uint64_t fd_lseek()
{
  return MEMORY[0x24BE67660]();
}

uint64_t fd_release()
{
  return MEMORY[0x24BE67668]();
}

uint64_t fd_write()
{
  return MEMORY[0x24BE67670]();
}

uint64_t fd_zero_truncate()
{
  return MEMORY[0x24BE67678]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t isAppleInternalInstall()
{
  return MEMORY[0x24BDC2520]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t si_compute_oid_for_identifier_bundle_id()
{
  return MEMORY[0x24BE67680]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

