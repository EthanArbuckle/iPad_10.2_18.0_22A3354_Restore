@implementation SIAssetManagerGetResourceURLsForLocaleOfType

void __SIAssetManagerGetResourceURLsForLocaleOfType_block_invoke(uint64_t a1)
{
  const __CFString *Value;
  const __CFLocale *v3;
  const __CFString *v4;
  __CFDictionary *v5;
  char v6;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v8;
  _BOOL4 v9;
  const __CFAllocator *v10;
  CFLocaleRef v11;
  CFLocaleRef v12;
  CFLocaleRef v13;
  CFLocaleRef v14;

  Value = (const __CFString *)CFLocaleGetValue(*(CFLocaleRef *)(a1 + 40), (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  v3 = CFLocaleCopyNormalizedLocaleIdentifier(*(const __CFLocale **)(a1 + 40), 0);
  if (v3)
  {
    v4 = (const __CFString *)v3;
    if (getAssetResourcePaths_resourcePathsOnceToken != -1)
      dispatch_once(&getAssetResourcePaths_resourcePathsOnceToken, &__block_literal_global_19);
    v5 = (__CFDictionary *)getAssetResourcePaths_gAssetResourcePaths;
    v6 = gHasUpdatedAssetResources;
    if (!CFDictionaryContainsKey((CFDictionaryRef)getAssetResourcePaths_gAssetResourcePaths, v4))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(v5, v4, Mutable);
      CFRelease(Mutable);
    }
    v8 = (__CFDictionary *)CFDictionaryGetValue(v5, v4);
    if (!CFDictionaryContainsKey(v8, *(const void **)(a1 + 48)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      CFDictionarySetValue(v8, *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      v6 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(v8, *(const void **)(a1 + 48));
    if ((v6 & 1) == 0)
    {
      CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      v9 = CFStringsAreEqual(Value, v4);
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (!v9)
      {
        v11 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
        if (v11)
        {
          v12 = v11;
          LDEnumerateAssetDataItems();
          CFRelease(v12);
        }
      }
      v13 = CFLocaleCreate(v10, Value);
      if (v13)
      {
        v14 = v13;
        LDEnumerateAssetDataItems();
        CFRelease(v14);
      }
    }
    CFRelease(v4);
  }
}

void __SIAssetManagerGetResourceURLsForLocaleOfType_block_invoke_2(uint64_t a1, const __CFURL *a2, uint64_t a3, uint64_t a4, const __CFString *a5)
{
  const __CFString *PathComponent;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFArray *v11;
  CFRange v12;

  if (CFStringsAreEqual(a5, *(const __CFString **)(a1 + 40)))
  {
    PathComponent = CFURLCopyLastPathComponent(a2);
    if (PathComponent)
    {
      v8 = PathComponent;
      v9 = *(const __CFString **)(a1 + 48);
      if (!v9 || CFStringHasPrefix(PathComponent, v9))
      {
        v10 = *(const __CFString **)(a1 + 56);
        if (!v10 || CFStringHasSuffix(v8, v10))
        {
          v11 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          v12.length = CFArrayGetCount(v11);
          v12.location = 0;
          if (!CFArrayContainsValue(v11, v12, a2))
            CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, a2);
        }
      }
      CFRelease(v8);
    }
  }
}

void __SIAssetManagerGetResourceURLsForLocaleOfType_block_invoke_3(uint64_t a1, const __CFURL *a2, uint64_t a3, uint64_t a4, const __CFString *a5)
{
  const __CFString *PathComponent;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFArray *v11;
  CFRange v12;

  if (CFStringsAreEqual(a5, *(const __CFString **)(a1 + 40)))
  {
    PathComponent = CFURLCopyLastPathComponent(a2);
    if (PathComponent)
    {
      v8 = PathComponent;
      v9 = *(const __CFString **)(a1 + 48);
      if (!v9 || CFStringHasPrefix(PathComponent, v9))
      {
        v10 = *(const __CFString **)(a1 + 56);
        if (!v10 || CFStringHasSuffix(v8, v10))
        {
          v11 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          v12.length = CFArrayGetCount(v11);
          v12.location = 0;
          if (!CFArrayContainsValue(v11, v12, a2))
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a2);
        }
      }
      CFRelease(v8);
    }
  }
}

@end
