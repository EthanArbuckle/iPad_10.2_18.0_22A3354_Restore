@implementation Version2

BOOL ___variantForNSSlice_Version2_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t (**v6)(id, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;

  v6 = a4;
  v7 = v6[2](v6, *(unsigned int *)(a1 + 32) + a2, 32);
  v9 = v7 && (v8 = v6[2](v6, *(_QWORD *)(v7 + 8), 24)) != 0 && *(_BYTE *)(v8 + 1) != 0;

  return v9;
}

@end
