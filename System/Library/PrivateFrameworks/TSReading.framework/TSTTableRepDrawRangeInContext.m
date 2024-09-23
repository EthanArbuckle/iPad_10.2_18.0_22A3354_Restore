@implementation TSTTableRepDrawRangeInContext

uint64_t __TSTTableRepDrawRangeInContext_block_invoke(uint64_t a1, TSTLayoutSpace *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  unint64_t v11;

  if (!-[TSTLayoutSpace isFrozen](a2, "isFrozen"))
  {
    v4 = TSTLayoutSpaceIntersectionGridRange(a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    if (HIDWORD(v4) == -1 || HIDWORD(v5) == -1 || HIDWORD(v4) > HIDWORD(v5))
      v8 = 0;
    else
      v8 = ((v5 - (v4 & 0xFFFFFFFF00000000)) & 0xFFFFFFFF00000000 | (v5 - v4 + 1)) + 0x100000000;
    if ((_DWORD)v4 == -1 || (_DWORD)v5 == -1 || v4 > v5)
      v8 = 0;
    v11 = (unint64_t)v4 << 16;
    if ((_DWORD)v4 == -1)
      v11 = 16711680;
    TSTTableRepDrawSpaceRangeInContext(*(TSTTableRep **)(a1 + 32), a2, v11 & 0xFFFFFFFFFFFF0000 | WORD2(v4) | (((v8 >> 16) & 0xFFFF0000 | v8) << 32), *(CGContext **)(a1 + 40));
  }
  return 0;
}

@end
