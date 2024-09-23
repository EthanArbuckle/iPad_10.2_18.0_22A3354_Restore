@implementation SIIsLanguagePreferred

uint64_t __SIIsLanguagePreferred_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  CFIndex v5;
  int v6;
  size_t v7;
  uint64_t v8;
  const __CFString *v9;
  UInt8 buffer[8];
  uint64_t v11;
  uint64_t v12;
  CFRange v13;

  v12 = *MEMORY[0x1E0C80C00];
  result = gAvailableLanguages;
  if (gAvailableLanguages)
  {
    *(_QWORD *)buffer = 0;
    v11 = 0;
    result = CFArrayGetCount((CFArrayRef)gAvailableLanguages);
    if ((int)result >= 1)
    {
      v3 = result;
      v4 = strlen(*(const char **)(a1 + 40));
      v5 = 0;
      if (v4 >= 8)
        v6 = 8;
      else
        v6 = v4;
      v7 = v6;
      if (v3 <= 1)
        v8 = 1;
      else
        v8 = v3;
      while (1)
      {
        result = (uint64_t)CFArrayGetValueAtIndex((CFArrayRef)gAvailableLanguages, v5);
        if (result)
        {
          v9 = (const __CFString *)result;
          v13.length = CFStringGetLength((CFStringRef)result);
          v13.location = 0;
          buffer[(int)CFStringGetBytes(v9, v13, 0x8000100u, 0x3Fu, 0, buffer, 16, 0)] = 0;
          result = strncmp((const char *)buffer, *(const char **)(a1 + 40), v7);
          if (!(_DWORD)result)
            break;
        }
        if (v8 == ++v5)
          return result;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

@end
