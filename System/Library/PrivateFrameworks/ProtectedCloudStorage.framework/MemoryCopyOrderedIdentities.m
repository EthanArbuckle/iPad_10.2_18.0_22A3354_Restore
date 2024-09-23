@implementation MemoryCopyOrderedIdentities

void __MemoryCopyOrderedIdentities_block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  const void *ServiceName;
  const void *v6;

  ServiceName = (const void *)PCSIdentityGetServiceName((uint64_t)a3);
  v6 = *(const void **)(a1 + 48);
  if (ServiceName && v6)
  {
    if (!CFEqual(ServiceName, v6))
      return;
  }
  else if (ServiceName != v6)
  {
    return;
  }
  if (!CFEqual(a3, (CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "identity"))
    && _PCSIdentityValidate((uint64_t)a3, (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), a3);
  }
}

@end
