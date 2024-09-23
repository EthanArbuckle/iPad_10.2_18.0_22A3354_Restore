@implementation MemoryEnumeratePublicKeys

uint64_t __MemoryEnumeratePublicKeys_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;
  CFTypeID v6;
  uint64_t result;
  const void *v8;

  v4 = *(const void **)(*(_QWORD *)(a1 + 40) + 32);
  if (!v4)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = CFGetTypeID(v4);
  if (v6 != CFStringGetTypeID())
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = PCSIdentityGetServiceName(a3);
  v8 = *(const void **)(*(_QWORD *)(a1 + 40) + 32);
  if (result && v8)
  {
    result = CFEqual((CFTypeRef)result, v8);
    if (!(_DWORD)result)
      return result;
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  if ((const void *)result == v8)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

@end
