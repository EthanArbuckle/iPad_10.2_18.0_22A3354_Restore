@implementation RXGetSupportedNashvilleLocaleIdentifiers

void __RXGetSupportedNashvilleLocaleIdentifiers_block_invoke()
{
  __CFBundle *BundleWithIdentifier;
  const __CFAllocator *v1;
  const __CFArray *ValueForInfoDictionaryKey;
  const __CFArray *MutableCopy;
  CFIndex Count;
  unint64_t v5;
  const __CFString *ValueAtIndex;
  const __CFString *v7;
  NSObject *v8;
  uint8_t buf[4];
  char *v10;
  char buffer[16];
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.SpeechRecognitionCore"));
  if (BundleWithIdentifier)
  {
    v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    ValueForInfoDictionaryKey = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, CFSTR("SupportedNashvilleLocaleIdentifiers"));
    MutableCopy = CFArrayCreateMutableCopy(v1, 0, ValueForInfoDictionaryKey);
    RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers = (uint64_t)MutableCopy;
    if (!MutableCopy)
    {
      __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 247, (uint64_t)"supportedNashvilleLocaleIdentifiers", CFSTR("Framework Info Dictionary is corrupted"));
      MutableCopy = (const __CFArray *)RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers;
    }
    Count = CFArrayGetCount(MutableCopy);
    if (Count >= 1)
    {
      v5 = Count + 1;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers, v5 - 2);
        if (CFStringCompare(ValueAtIndex, CFSTR("ar"), 1uLL))
          v7 = ValueAtIndex;
        else
          v7 = CFSTR("ar_SA");
        *(_OWORD *)buffer = 0u;
        v12 = 0u;
        if (CFStringGetCString(v7, buffer, 32, 0x8000100u) && _os_feature_enabled_impl())
        {
          v8 = RXOSLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v10 = buffer;
            _os_log_impl(&dword_21EBE7000, v8, OS_LOG_TYPE_DEBUG, "Disabling Nashville locale support for Feature Flag %s", buf, 0xCu);
          }
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers, v5 - 2);
        }
        --v5;
      }
      while (v5 > 1);
    }
  }
}

@end
