@implementation DyldImageEnumerateSegments

void __DyldImageEnumerateSegments_block_invoke(_QWORD *a1, char *a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  uint64_t v9;

  if (qword_1ED1DD920 != -1)
    dispatch_once(&qword_1ED1DD920, &__block_literal_global_10);
  if (dword_1ED1DD914 >= 2)
  {
    v8 = DyldImagePath(a1[6]);
    printf("dyld %#18llx - %#18llx (%#10llx) %16s %s\n", a3, a4 + a3, a4, a2, v8);
  }
  if (a2 && !SAShouldIgnoreSegmentWithCName(a2))
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v9 = a1[4];
    if (v9)
      (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v9 + 16))(v9, a2, a3, a4);
  }
}

@end
