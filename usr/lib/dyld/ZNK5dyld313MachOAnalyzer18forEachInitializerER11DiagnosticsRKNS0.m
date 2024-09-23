@implementation ZNK5dyld313MachOAnalyzer18forEachInitializerER11DiagnosticsRKNS0

_QWORD *___ZNK5dyld313MachOAnalyzer18forEachInitializerER11DiagnosticsRKNS0_15VMAddrConverterEU13block_pointerFvjEPKv_block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)(a2 + 52) & 4) != 0)
  {
    v2 = *(_QWORD *)(result[4] + 8);
    v3 = *(_QWORD *)(a2 + 16);
    v4 = *(_QWORD *)(a2 + 8);
    v5 = *(_QWORD *)(a2 + 24) + v3;
    result = dyld3::OverflowSafeArray<dyld3::SegmentRanges::SegmentRange,4294967295ull>::verifySpace((_QWORD *)(v2 + 64), 1);
    v6 = *(_QWORD *)(v2 + 64);
    v7 = *(_QWORD *)(v2 + 80);
    *(_QWORD *)(v2 + 80) = v7 + 1;
    v8 = v6 + 24 * v7;
    *(_QWORD *)v8 = v3;
    *(_QWORD *)(v8 + 8) = v5;
    *(_DWORD *)(v8 + 16) = v4;
  }
  return result;
}

@end
