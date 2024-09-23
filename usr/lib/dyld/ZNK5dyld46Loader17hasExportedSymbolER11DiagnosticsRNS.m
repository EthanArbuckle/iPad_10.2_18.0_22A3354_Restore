@implementation ZNK5dyld46Loader17hasExportedSymbolER11DiagnosticsRNS

dyld4::RuntimeState *___ZNK5dyld46Loader17hasExportedSymbolER11DiagnosticsRNS_12RuntimeStateEPKcNS0_18ExportedSymbolModeENS0_12ResolverModeEPNS0_14ResolvedSymbolEPN5dyld35ArrayIPKS0_EE_block_invoke_2(dyld4::RuntimeState *result, char *__s1, uint64_t a3, int a4, uint64_t a5, char a6, _BYTE *a7)
{
  uint64_t v10;
  uint64_t v11;
  dyld3::MachOFile *v12;
  uint64_t Address;
  uint64_t v14;
  dyld4::RuntimeState *v15;
  const dyld4::Loader *v16;

  if ((~a4 & 0xF) == 0)
  {
    v10 = (uint64_t)result;
    v11 = *((_QWORD *)result + 5);
    result = (dyld4::RuntimeState *)_platform_strcmp(__s1, *((const char **)result + 6));
    if (!(_DWORD)result)
    {
      v12 = *(dyld3::MachOFile **)(v10 + 64);
      **(_QWORD **)(v10 + 56) = v11;
      *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8) = *(_QWORD *)(v10 + 48);
      Address = dyld3::MachOFile::preferredLoadAddress(v12);
      v14 = *(_QWORD *)(v10 + 56);
      *(_QWORD *)(v14 + 16) = a3 - Address;
      *(_DWORD *)(v14 + 32) = 1;
      *(_BYTE *)(v14 + 36) = 0;
      *(_BYTE *)(v14 + 37) = a6 < 0;
      *(_WORD *)(v14 + 38) = 0;
      v15 = dyld4::Loader::resolvedAddress(*(const dyld4::RuntimeState **)(v10 + 72), v14);
      *(_QWORD *)(*(_QWORD *)(v10 + 56) + 24) = v15;
      result = dyld4::Loader::interpose(*(dyld4::Loader **)(v10 + 72), v15, 0, v16);
      *(_QWORD *)(*(_QWORD *)(v10 + 56) + 24) = result;
      *a7 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v10 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

@end
