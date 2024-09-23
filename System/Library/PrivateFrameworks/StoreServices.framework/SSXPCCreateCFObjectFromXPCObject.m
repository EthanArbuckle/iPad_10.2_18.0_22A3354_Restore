@implementation SSXPCCreateCFObjectFromXPCObject

CFArrayRef __SSXPCCreateCFObjectFromXPCObject_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  return SSXPCCreateCFObjectFromXPCObject(a2);
}

uint64_t __SSXPCCreateCFObjectFromXPCObject_block_invoke_2(_QWORD *a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  const void *v6;
  CFStringRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = SSXPCCreateCFObjectFromXPCObject(a3);
  if (result)
  {
    v6 = (const void *)result;
    v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE30], a2, 0x8000100u);
    if (v7)
    {
      *(_QWORD *)(a1[5] + 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)) = v7;
      v9 = a1[5];
      v8 = a1[6];
      v10 = *(_QWORD *)(a1[4] + 8);
      v11 = *(_QWORD *)(v10 + 24);
      *(_QWORD *)(v10 + 24) = v11 + 1;
      *(_QWORD *)(v9 + 8 * (v11 + v8)) = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

@end
