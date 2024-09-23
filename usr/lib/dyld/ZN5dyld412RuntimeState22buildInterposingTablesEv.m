@implementation ZN5dyld412RuntimeState22buildInterposingTablesEv

_QWORD *___ZN5dyld412RuntimeState22buildInterposingTablesEv_block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += a3 >> 4;
  v4 = *(_QWORD *)(a1[5] + 8);
  result = dyld3::OverflowSafeArray<dyld4::Loader *,4294967295ull>::verifySpace((_QWORD *)(v4 + 40), 1);
  v6 = a1[6];
  v7 = *(_QWORD *)(v4 + 40);
  v8 = *(_QWORD *)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v8 + 1;
  *(_QWORD *)(v7 + 8 * v8) = v6;
  return result;
}

@end
