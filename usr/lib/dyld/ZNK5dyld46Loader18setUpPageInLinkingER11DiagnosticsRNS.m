@implementation ZNK5dyld46Loader18setUpPageInLinkingER11DiagnosticsRNS

_QWORD *___ZNK5dyld46Loader18setUpPageInLinkingER11DiagnosticsRNS_12RuntimeStateEmyRKN5dyld35ArrayIPKvEE_block_invoke_2(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  _QWORD *v8;
  unsigned __int16 *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = (unsigned __int16)*(_DWORD *)(a2 + 56) >> 4;
  v4 = (_DWORD *)result[9];
  if (v3 < *v4)
  {
    v5 = v4[v3 + 1];
    if ((_DWORD)v5)
    {
      v8 = result;
      v9 = (unsigned __int16 *)((char *)v4 + v5);
      v10 = *(_QWORD *)(result[4] + 8);
      v11 = v9[3];
      if (*(_WORD *)(v10 + 24))
      {
        if (*(unsigned __int16 *)(v10 + 24) != v11)
        {
          Diagnostics::error((vm_address_t *)result[10], "pointer_format is different in different segments");
          *a3 = 1;
        }
      }
      else
      {
        *(_WORD *)(v10 + 24) = v11;
      }
      v12 = *(_QWORD *)(v8[5] + 8);
      v13 = v9[2];
      if (*(_WORD *)(v12 + 24))
      {
        if (*(unsigned __int16 *)(v12 + 24) != v13)
        {
          Diagnostics::error((vm_address_t *)v8[10], "page_size is different in different segments");
          *a3 = 1;
        }
      }
      else
      {
        *(_WORD *)(v12 + 24) = v13;
      }
      v14 = *((_DWORD *)v8 + 26);
      v15 = *(_DWORD *)(a2 + 52);
      v16 = v8[11] + *(_QWORD *)a2;
      v17 = v8[12] + *(_QWORD *)(a2 + 16);
      v18 = v9[10] * (unint64_t)*(unsigned __int16 *)(*(_QWORD *)(v8[5] + 8) + 24);
      v19 = *(_QWORD *)(a2 + 40);
      if (*((_BYTE *)v8 + 108)
        && ((v20 = *(_DWORD *)(a2 + 56), (v20 & 2) != 0) || v9[10] >= 2u)
        && (v21 = *(_QWORD *)(v8[6] + 8), *(_QWORD *)(v21 + 56) <= 4uLL))
      {
        v22 = (_QWORD *)(v21 + 40);
        v23 = (v20 & 2) << 8;
        if (!*((_BYTE *)v8 + 109))
          v23 = 0;
        v15 |= v23;
      }
      else
      {
        v21 = *(_QWORD *)(v8[7] + 8);
        v22 = (_QWORD *)(v21 + 40);
      }
      result = dyld3::OverflowSafeArray<dyld3::MultiMapBase<SwiftForeignTypeProtocolConformanceDiskLocationKey,SwiftForeignTypeProtocolConformanceDiskLocation,dyld4::HashForeignConformanceKey,dyld4::EqualForeignConformanceKey>::NodeEntryT,4294967295ull>::verifySpace(v22, 1);
      v24 = *(_QWORD *)(v21 + 40);
      v25 = *(_QWORD *)(v21 + 56);
      *(_QWORD *)(v21 + 56) = v25 + 1;
      v26 = v24 + 48 * v25;
      *(_DWORD *)v26 = v14;
      *(_DWORD *)(v26 + 4) = v15;
      *(_QWORD *)(v26 + 8) = v16;
      *(_QWORD *)(v26 + 16) = v17;
      *(_QWORD *)(v26 + 24) = v18;
      *(_QWORD *)(v26 + 32) = v19;
      *(_QWORD *)(v26 + 40) = v9;
      *(_QWORD *)(*(_QWORD *)(v8[8] + 8) + 24) = v9;
    }
  }
  return result;
}

@end
