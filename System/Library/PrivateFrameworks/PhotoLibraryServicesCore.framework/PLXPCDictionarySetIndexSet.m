@implementation PLXPCDictionarySetIndexSet

void __PLXPCDictionarySetIndexSet_block_invoke(uint64_t a1, uint64_t value, uint64_t a3, _BYTE *a4)
{
  xpc_array_set_uint64(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, value);
  xpc_array_set_uint64(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, a3);
  *a4 = 0;
}

@end
