@implementation ZN5dyld44APIs17findImageMappedAtEPKvPPKN5dyld311MachOLoadedEPbPPKcPS2

_QWORD *___ZN5dyld44APIs17findImageMappedAtEPKvPPKN5dyld311MachOLoadedEPbPPKcPS2_PyPhPPKNS_6LoaderE_block_invoke_2(_QWORD *result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  unint64_t v6;
  _QWORD *v8;
  _BYTE *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _BYTE *v13;
  _QWORD *v14;

  v6 = result[5];
  if (v6 >= a2 && v6 < a3 + a2)
  {
    v8 = (_QWORD *)result[6];
    if (v8)
      *v8 = result[7] + a2;
    v9 = (_BYTE *)result[8];
    if (v9)
      *v9 = 1;
    v10 = (_QWORD *)result[9];
    if (v10)
      *v10 = a5;
    v11 = (_QWORD *)result[10];
    if (v11)
      *v11 = result[7] + a2;
    v12 = (_QWORD *)result[11];
    if (v12)
      *v12 = a3;
    v13 = (_BYTE *)result[12];
    if (v13)
      *v13 = 5;
    v14 = (_QWORD *)result[13];
    if (v14)
      *v14 = 0;
    *a6 = 1;
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  }
  return result;
}

@end
