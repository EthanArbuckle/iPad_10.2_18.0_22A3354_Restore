@implementation Version1

_BYTE *___variantForNSSlice_Version1_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *result;

  result = (_BYTE *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2 + *(unsigned int *)(a1 + 32) + *(unsigned int *)(a1 + 36) + 1, 1);
  if (result)
    return (_BYTE *)(*result != 0);
  return result;
}

@end
