@implementation CEIndexSizeForContext

unint64_t __CEIndexSizeForContext_block_invoke(_QWORD *a1, uint64_t a2)
{
  unint64_t result;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unint64_t v9;

  v8 = 0;
  v9 = 0;
  result = a1[5];
  if (result)
  {
    if (result >= a1[6] || result < a1[7])
    {
      __break(0x5519u);
      return result;
    }
    v6 = *(_OWORD *)(a2 + 96);
    if (!der_decode_key_value(result, &v8, &v7, &v6))
      goto LABEL_15;
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 96);
    if ((der_decode_key_value(0, &v8, &v7, &v6) & 1) == 0)
      goto LABEL_15;
  }
  if ((unint64_t)(v8 - *(_QWORD *)(a1[8] + 40)) <= 0xFFFFFFFE && v9 < 0xFFFFFFFF)
    return 1;
LABEL_15:
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = &unk_1EA97EC30;
  return result;
}

@end
