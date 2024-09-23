@implementation RXGetSupportedQuasarLocaleIdentifiers

void __RXGetSupportedQuasarLocaleIdentifiers_block_invoke()
{
  __CFBundle *BundleWithIdentifier;
  const __CFAllocator *v1;
  const __CFArray *ValueForInfoDictionaryKey;
  const __CFURL *v3;
  const __CFURL *v4;
  __CFReadStream *v5;
  __CFReadStream *v6;
  CFPropertyListRef v7;
  CFTypeID v8;
  CFIndex Count;
  const void **v10;
  const __CFString **v11;
  const __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  char *v15;
  char buffer[16];
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.SpeechRecognitionCore"));
  if (BundleWithIdentifier)
  {
    v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    ValueForInfoDictionaryKey = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, CFSTR("SupportedQuasarLocaleIdentifiers"));
    RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers = (uint64_t)CFArrayCreateMutableCopy(v1, 0, ValueForInfoDictionaryKey);
    if (!RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers)
      __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 198, (uint64_t)"supportedQuasarLocaleIdentifiers", CFSTR("Framework Info Dictionary is corrupted"));
    v3 = CFURLCreateWithFileSystemPath(v1, CFSTR("/System/Library/FeatureFlags/Domain/VoiceControlLocales.plist"), kCFURLPOSIXPathStyle, 0);
    if (v3)
    {
      v4 = v3;
      v5 = CFReadStreamCreateWithFile(v1, v3);
      if (v5)
      {
        v6 = v5;
        if (CFReadStreamOpen(v5))
        {
          v7 = CFPropertyListCreateWithStream(v1, v6, 0, 0, 0, 0);
          v8 = CFGetTypeID(v7);
          if (v8 == CFDictionaryGetTypeID())
          {
            Count = CFDictionaryGetCount((CFDictionaryRef)v7);
            v10 = (const void **)operator new[]();
            CFDictionaryGetKeysAndValues((CFDictionaryRef)v7, v10, 0);
            if (Count >= 1)
            {
              v11 = (const __CFString **)v10;
              do
              {
                v12 = *v11;
                *(_OWORD *)buffer = 0u;
                v17 = 0u;
                if (CFStringGetCString(v12, buffer, 32, 0x8000100u) && _os_feature_enabled_impl())
                {
                  v13 = RXOSLog();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315138;
                    v15 = buffer;
                    _os_log_impl(&dword_21EBE7000, v13, OS_LOG_TYPE_DEBUG, "Enabling Quasar locale support for Feature Flag %s", buf, 0xCu);
                  }
                  CFArrayAppendValue((CFMutableArrayRef)RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers, v12);
                }
                ++v11;
                --Count;
              }
              while (Count);
            }
            MEMORY[0x2207B89CC](v10, 0x60C8044C4A2DFLL);
          }
          if (v7)
            CFRelease(v7);
          CFReadStreamClose(v6);
        }
        CFRelease(v6);
      }
      CFRelease(v4);
    }
  }
}

@end
