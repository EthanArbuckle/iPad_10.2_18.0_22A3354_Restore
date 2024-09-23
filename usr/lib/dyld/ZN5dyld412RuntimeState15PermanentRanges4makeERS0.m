@implementation ZN5dyld412RuntimeState15PermanentRanges4makeERS0

_QWORD *___ZN5dyld412RuntimeState15PermanentRanges4makeERS0_RKN5dyld35ArrayIPKNS_6LoaderEEE_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v3 = result;
  v4 = result[7] + *(_QWORD *)(a2 + 16);
  v5 = v4 + *(_QWORD *)(a2 + 24);
  v6 = *(unsigned int *)(a2 + 52);
  if (v4 == *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24)
    && (_DWORD)v6 == *(unsigned __int8 *)(*(_QWORD *)(result[5] + 8) + 24)
    && (v7 = *(_QWORD *)(result[6] + 8), (v8 = *(_QWORD *)(v7 + 56)) != 0))
  {
    *(_QWORD *)(*(_QWORD *)(v7 + 40) + 32 * v8 - 24) = v5;
  }
  else if ((_DWORD)v6)
  {
    v9 = result[8];
    v10 = *(_QWORD *)(result[6] + 8);
    result = dyld3::OverflowSafeArray<dyld4::RuntimeState::PermanentRanges::Range,4294967295ull>::verifySpace((_QWORD *)(v10 + 40), 1);
    v11 = *(_QWORD *)(v10 + 40);
    v12 = *(_QWORD *)(v10 + 56);
    *(_QWORD *)(v10 + 56) = v12 + 1;
    v13 = (_QWORD *)(v11 + 32 * v12);
    *v13 = v4;
    v13[1] = v5;
    v13[2] = v9;
    v13[3] = v6;
    LODWORD(v6) = *(_DWORD *)(a2 + 52);
  }
  *(_QWORD *)(*(_QWORD *)(v3[4] + 8) + 24) = v5;
  *(_BYTE *)(*(_QWORD *)(v3[5] + 8) + 24) = v6;
  return result;
}

@end
