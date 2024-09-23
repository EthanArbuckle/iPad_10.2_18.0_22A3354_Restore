@implementation ZN6mach

_QWORD *___ZN6mach_o5Image15makeExportsTrieEv_block_invoke(_QWORD *result, int *a2)
{
  _QWORD *v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  const unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (_QWORD *)result[4];
  v3 = *a2;
  if (*a2 == -2147483614 || v3 == 34)
  {
    v8 = a2[10];
    if (!(_DWORD)v8)
      return result;
    v5 = v2 + 14;
    v6 = (const unsigned __int8 *)(v2[2] + v8);
    v7 = a2[11];
    goto LABEL_8;
  }
  if (v3 == -2147483597)
  {
    v4 = a2[2];
    if ((_DWORD)v4)
    {
      v5 = v2 + 14;
      v6 = (const unsigned __int8 *)(v2[2] + v4);
      v7 = a2[3];
LABEL_8:
      result = mach_o::FunctionStarts::FunctionStarts(v5, v6, v7);
      v2[4] = result;
    }
  }
  return result;
}

_QWORD *___ZN6mach_o5Image17makeChainedFixupsEv_block_invoke(_QWORD *result, _DWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (*a2 == -2147483596)
  {
    v2 = a2[3];
    if ((_DWORD)v2)
    {
      v3 = (_QWORD *)result[4];
      result = mach_o::ChainedFixups::ChainedFixups(v3 + 38, (const dyld_chained_fixups_header *)(v3[2] + a2[2]), v2);
      v3[10] = result;
    }
  }
  return result;
}

_QWORD *___ZN6mach_o5Image18makeFunctionStartsEv_block_invoke(_QWORD *result, _DWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (*a2 == 38)
  {
    v2 = a2[3];
    if ((_DWORD)v2)
    {
      v3 = (_QWORD *)result[4];
      result = mach_o::FunctionStarts::FunctionStarts(v3 + 40, (const unsigned __int8 *)(v3[2] + a2[2]), v2);
      v3[11] = result;
    }
  }
  return result;
}

_QWORD *___ZN6mach_o5Image16makeSplitSegInfoEv_block_invoke(_QWORD *result, _DWORD *a2, _BYTE *a3)
{
  _QWORD *v4;

  if (*a2 == 30)
  {
    v4 = (_QWORD *)result[4];
    result = mach_o::FunctionStarts::FunctionStarts(v4 + 45, (const unsigned __int8 *)(v4[2] + a2[2]), a2[3]);
    v4[13] = result;
    *a3 = 1;
  }
  return result;
}

@end
