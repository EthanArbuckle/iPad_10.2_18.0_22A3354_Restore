@implementation ThunkEEPmE

_QWORD *___ZNK5dyld313MachOAnalyzer26forEachThreadLocalVariableER11DiagnosticsU13block_pointerFvPPFPvPNS0_9TLV_ThunkEEPmE_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  dyld3::MachOFile *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;

  v3 = result;
  v4 = *(unsigned __int8 *)(a2 + 92);
  if ((v4 - 17) >= 2)
  {
    if (v4 == 19)
    {
      v8 = (dyld3::MachOFile *)result[6];
      v9 = dyld3::MachOFile::is64(v8);
      v10 = v3[7];
      v11 = v3[4];
      if (v9)
        return (_QWORD *)dyld3::MachOAnalyzer::forEachThreadLocalVariableInSection<long long>(v8, v10, a2, v11);
      else
        return (_QWORD *)dyld3::MachOAnalyzer::forEachThreadLocalVariableInSection<int>(v8, v10, a2, v11);
    }
  }
  else
  {
    v5 = *(_QWORD *)(result[5] + 8);
    v6 = *(_QWORD *)(v5 + 40);
    v7 = *(_QWORD *)(a2 + 64);
    if (v6)
    {
      *(_QWORD *)(v5 + 48) = v7 + *(_QWORD *)(a2 + 72) - result[8] - v6;
    }
    else
    {
      *(_QWORD *)(v5 + 40) = v7 - result[8];
      *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 48) = *(_QWORD *)(a2 + 72);
    }
  }
  return result;
}

@end
