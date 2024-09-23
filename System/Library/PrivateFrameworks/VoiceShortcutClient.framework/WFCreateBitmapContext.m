@implementation WFCreateBitmapContext

uint64_t __WFCreateBitmapContext_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
    v4 = (a3 & 0x10000000000) == 0;
  else
    v4 = 1;
  if (v4)
    return 1;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    *(_QWORD *)(a4 + 56) = v5;
  v6 = *(_DWORD *)(a4 + 44) - 2;
  if (v6 > 2)
    return 1;
  result = 0;
  *(_DWORD *)(a4 + 44) = dword_1AF780A48[v6];
  *(_BYTE *)(a4 + 64) = 0;
  return result;
}

@end
