@implementation CreateIdentityFromSet

void __CreateIdentityFromSet_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  CFNumberRef v5;
  CFNumberRef v6;

  if (_PCSIdentitySetIsCurrentIdentity(*(_QWORD *)(a1 + 32), (uint64_t)a3))
  {
    v5 = CFNumberCreate(0, kCFNumberSInt32Type, *(const void **)(a3[2] + 16));
    if (v5)
    {
      v6 = v5;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 64), v5, a3);
      CFRelease(v6);
    }
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 40), a3))
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 72), *(const void **)(a3[2] + 24), a3);
}

@end
