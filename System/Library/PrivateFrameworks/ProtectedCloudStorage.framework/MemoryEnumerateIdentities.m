@implementation MemoryEnumerateIdentities

uint64_t __MemoryEnumerateIdentities_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v5;
  CFTypeID v6;
  uint64_t result;
  const void *v8;

  v5 = *(const void **)(a1 + 40);
  if (!v5)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = CFGetTypeID(v5);
  if (v6 != CFStringGetTypeID())
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = PCSIdentityGetServiceName(a3);
  v8 = *(const void **)(a1 + 40);
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
