@implementation ZN5dyld4L19getObjCPatchClassesEPKN5dyld313MachOAnalyzerERNS0

_QWORD *___ZN5dyld4L19getObjCPatchClassesEPKN5dyld313MachOAnalyzerERNS0_3MapIPKvbNS_11HashPointerENS_12EqualPointerEEE_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *result;
  uint64_t v7;
  int hasExportedSymbol;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  result = (_QWORD *)Diagnostics::hasError((Diagnostics *)(a1 + 40));
  if ((_DWORD)result)
  {
    *a3 = 1;
    return result;
  }
  if (*(_DWORD *)(a2 + 4))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = dyld3::OverflowSafeArray<dyld4::Loader *,4294967295ull>::verifySpace((_QWORD *)(v7 + 40), 1);
  }
  else
  {
    v15 = 0;
    v14 = 0;
    hasExportedSymbol = dyld3::MachOLoaded::hasExportedSymbol(*(dyld3::MachOFile **)(a1 + 48), *(const unsigned __int8 **)(a2 + 8), 0, &v15, &v14);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = dyld3::OverflowSafeArray<dyld4::Loader *,4294967295ull>::verifySpace((_QWORD *)(v7 + 40), 1);
    if (hasExportedSymbol)
    {
      v9 = v15;
      v10 = *(_QWORD *)(v7 + 40);
      v11 = *(_QWORD *)(v7 + 56);
      *(_QWORD *)(v7 + 56) = v11 + 1;
      *(_QWORD *)(v10 + 8 * v11) = v9;
      return result;
    }
  }
  v12 = *(_QWORD *)(v7 + 40);
  v13 = *(_QWORD *)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v13 + 1;
  *(_QWORD *)(v12 + 8 * v13) = 0;
  return result;
}

@end
