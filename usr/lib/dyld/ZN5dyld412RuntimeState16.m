@implementation ZN5dyld412RuntimeState16

_QWORD *___ZN5dyld412RuntimeState16_instantiateTLVsEm_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;

  v1 = result[6];
  v2 = *(_QWORD *)(v1 + 872);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 864);
    v4 = 24 * v2;
    v5 = (unsigned int *)(v3 + 16);
    do
    {
      if (result[7] == *(v5 - 2))
      {
        *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *((_QWORD *)v5 - 2) + *(v5 - 1);
        *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *v5;
      }
      v5 += 6;
      v4 -= 24;
    }
    while (v4);
  }
  return result;
}

@end
