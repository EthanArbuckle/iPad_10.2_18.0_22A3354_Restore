@implementation NSCoder

uint64_t __64__NSCoder__UIHyperCoding___ui_decodeVectorForKey_returnedCount___block_invoke(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    v3 = *(unint64_t **)(result + 40);
    do
    {
      v4 = *v3++;
      *a2++ = bswap64(v4);
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t __74__NSCoder__UIHyperCoding___ui_decodeNSUIntegerVectorForKey_returnedCount___block_invoke(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(result + 32))
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 40);
    do
    {
      *(_QWORD *)(a2 + 8 * v2) = *(_QWORD *)(v3 + 8 * v2);
      ++v2;
    }
    while (v2 < *(_QWORD *)(result + 32));
  }
  return result;
}

@end
