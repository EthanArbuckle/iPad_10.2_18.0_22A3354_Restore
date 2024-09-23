@implementation SSNewCFArrayFromXPCArray

BOOL ___SSNewCFArrayFromXPCArray_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (*(uint64_t (**)(void))(a1[4] + 16))();
  if (v2)
  {
    v3 = a1[6];
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v5 + 1;
    *(_QWORD *)(v3 + 8 * v5) = v2;
  }
  return v2 != 0;
}

@end
