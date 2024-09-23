@implementation ZN5dyld44APIs25

_QWORD *___ZN5dyld44APIs25_dyld_is_memory_immutableEPKvm_block_invoke_2(_QWORD *result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  unint64_t v6;

  v6 = result[5];
  if (v6 > a2 && (a6 & 2) == 0 && v6 + result[6] < a2 + a4)
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  return result;
}

@end
