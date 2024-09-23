@implementation NETRBClientGetDynamicStoreKey

uint64_t ___NETRBClientGetDynamicStoreKey_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = __NETRBClientValidateClient(*(_BYTE **)(a1 + 40));
  if ((_DWORD)result)
    return NETRBErrorLog();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

@end
