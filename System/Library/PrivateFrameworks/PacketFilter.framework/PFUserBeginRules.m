@implementation PFUserBeginRules

void __PFUserBeginRules_block_invoke(uint64_t a1)
{
  CFStringRef v2;
  CFStringRef v3;
  uint64_t v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%lld"), __pfDictIdentifier);
    if (v2)
    {
      v3 = v2;
      xpc_retain(*(xpc_object_t *)(a1 + 56));
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 48) + 48), v3, *(const void **)(a1 + 56));
      v4 = __pfDictIdentifier;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = __pfDictIdentifier;
      __pfDictIdentifier = v4 + 1;
      CFRelease(v3);
    }
  }
  else
  {
    PFManagerErrorLog();
  }
}

@end
