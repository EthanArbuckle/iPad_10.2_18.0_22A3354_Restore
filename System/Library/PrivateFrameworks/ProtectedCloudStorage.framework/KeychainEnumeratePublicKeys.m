@implementation KeychainEnumeratePublicKeys

void __KeychainEnumeratePublicKeys_block_invoke(uint64_t a1, int a2)
{
  const void **v3;
  CFNumberRef v4;
  uint64_t v5;
  CFTypeID v6;
  const __CFArray *v7;
  CFTypeRef v8;
  _QWORD context[4];
  id v10;
  CFTypeRef cf;
  int valuePtr;
  CFRange v13;

  valuePtr = a2;
  cf = 0;
  v3 = (const void **)MEMORY[0x1E0CD6BC8];
  if (a2)
  {
    v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), *v3, v4);
    if (v4)
      CFRelease(v4);
  }
  v5 = PCSMeasureRelativeNanoTime();
  ++qword_1ECED4FB8;
  _PCSKeychainForwardTable(*(_QWORD *)(a1 + 40), &cf);
  qword_1ECED4FC0 += PCSMeasureRelativeNanoTime() - v5;
  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID())
    {
      v7 = (const __CFArray *)cf;
      context[0] = MEMORY[0x1E0C809B0];
      context[1] = 3221225472;
      context[2] = __KeychainEnumeratePublicKeys_block_invoke_2;
      context[3] = &unk_1E553E480;
      v10 = *(id *)(a1 + 32);
      v13.length = CFArrayGetCount(v7);
      v13.location = 0;
      CFArrayApplyFunction(v7, v13, (CFArrayApplierFunction)apply_block_1_1, context);

    }
    v8 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v8);
    }
  }
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), *v3);
}

const void *__KeychainEnumeratePublicKeys_block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  const void *result;
  CFTypeID v4;

  result = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CD68F8]);
  if (result)
  {
    v4 = CFGetTypeID(result);
    result = (const void *)CFStringGetTypeID();
    if ((const void *)v4 == result)
      return (const void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

@end
