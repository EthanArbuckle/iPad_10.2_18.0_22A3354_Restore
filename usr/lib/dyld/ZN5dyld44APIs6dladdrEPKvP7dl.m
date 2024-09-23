@implementation ZN5dyld44APIs6dladdrEPKvP7dl

_QWORD *___ZN5dyld44APIs6dladdrEPKvP7dl_info_block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = result[6];
  v4 = result[5] + *(_QWORD *)(a2 + 16);
  if (v4 <= v3 && v3 < *(_QWORD *)(a2 + 24) + v4)
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
