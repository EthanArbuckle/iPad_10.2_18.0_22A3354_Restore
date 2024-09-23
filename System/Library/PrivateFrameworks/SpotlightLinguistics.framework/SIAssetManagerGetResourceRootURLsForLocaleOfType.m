@implementation SIAssetManagerGetResourceRootURLsForLocaleOfType

void __SIAssetManagerGetResourceRootURLsForLocaleOfType_block_invoke(uint64_t a1)
{
  const __CFString *Value;
  const __CFLocale *v3;
  const __CFString *v4;
  __CFDictionary *v5;
  char v6;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v8;
  const __CFAllocator *v9;
  CFLocaleRef v10;
  CFLocaleRef v11;
  CFLocaleRef v12;
  CFLocaleRef v13;

  Value = (const __CFString *)CFLocaleGetValue(*(CFLocaleRef *)(a1 + 40), (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  v3 = CFLocaleCopyNormalizedLocaleIdentifier(*(const __CFLocale **)(a1 + 40), 0);
  if (v3)
  {
    v4 = (const __CFString *)v3;
    if (getAssetResourceRoots_resourceRootsOnceToken != -1)
      dispatch_once(&getAssetResourceRoots_resourceRootsOnceToken, &__block_literal_global_5);
    v5 = (__CFDictionary *)getAssetResourceRoots_gAssetResourceRoots;
    v6 = gHasUpdatedAssetResources;
    if (!CFDictionaryContainsKey((CFDictionaryRef)getAssetResourceRoots_gAssetResourceRoots, v4))
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
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v10 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Value);
      if (v10)
      {
        v11 = v10;
        LDEnumerateAssetDataItems();
        CFRelease(v11);
      }
      if (!CFStringsAreEqual(Value, v4))
      {
        v12 = CFLocaleCreate(v9, v4);
        if (v12)
        {
          v13 = v12;
          LDEnumerateAssetDataItems();
          CFRelease(v13);
        }
      }
      gHasUpdatedAssetResources = 1;
    }
    CFRelease(v4);
  }
}

void __SIAssetManagerGetResourceRootURLsForLocaleOfType_block_invoke_2(uint64_t a1, const __CFURL *a2, int a3, uint64_t a4, const __CFString *a5)
{
  CFURLRef PathComponent;
  CFURLRef v9;
  const __CFArray *v10;
  __CFArray *v11;
  CFRange v12;

  if (CFStringsAreEqual(a5, *(const __CFString **)(a1 + 40)))
  {
    PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    if (PathComponent)
    {
      v9 = PathComponent;
      v10 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v12.length = CFArrayGetCount(v10);
      v12.location = 0;
      if (!CFArrayContainsValue(v10, v12, v9))
      {
        v11 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        if (a3)
          CFArrayAppendValue(v11, v9);
        else
          CFArrayInsertValueAtIndex(v11, 0, v9);
      }
      CFRelease(v9);
    }
  }
}

void __SIAssetManagerGetResourceRootURLsForLocaleOfType_block_invoke_3(uint64_t a1, const __CFURL *a2, int a3, uint64_t a4, const __CFString *a5)
{
  CFURLRef PathComponent;
  CFURLRef v9;
  const __CFArray *v10;
  __CFArray *v11;
  CFRange v12;

  if (CFStringsAreEqual(a5, *(const __CFString **)(a1 + 40)))
  {
    PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    if (PathComponent)
    {
      v9 = PathComponent;
      v10 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v12.length = CFArrayGetCount(v10);
      v12.location = 0;
      if (!CFArrayContainsValue(v10, v12, v9))
      {
        v11 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        if (a3)
          CFArrayAppendValue(v11, v9);
        else
          CFArrayInsertValueAtIndex(v11, 0, v9);
      }
      CFRelease(v9);
    }
  }
}

@end
