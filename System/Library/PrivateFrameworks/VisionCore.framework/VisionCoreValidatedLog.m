@implementation VisionCoreValidatedLog

void __VisionCoreValidatedLog_block_invoke(uint64_t a1, CFStringRef format, va_list arguments)
{
  const __CFString *v4;
  const __CFString *v5;
  const char *CStringPtr;
  const char *v7;
  NSObject *v8;
  unsigned int v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, format, arguments);
  if (v4)
  {
    v5 = v4;
    CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
    if (CStringPtr)
    {
      v7 = CStringPtr;
      if (_VisionCoreLogger_onceToken != -1)
        dispatch_once(&_VisionCoreLogger_onceToken, &__block_literal_global_2723);
      v8 = (id)_VisionCoreLogger__visionLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_DWORD *)(a1 + 32) - 1;
        if (v9 > 3)
          v10 = "VisionCore: ";
        else
          v10 = off_24E1DBED8[v9];
        v11 = 136315394;
        v12 = v10;
        v13 = 2080;
        v14 = v7;
        _os_log_impl(&dword_21DED3000, v8, OS_LOG_TYPE_DEFAULT, "%s%s\n", (uint8_t *)&v11, 0x16u);
      }

      CFRelease(v5);
    }
  }
}

@end
