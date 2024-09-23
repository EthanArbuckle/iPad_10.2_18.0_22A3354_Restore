@implementation ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS

_QWORD *___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2(_QWORD *result, mach_o::ChainedFixupPointerOnDisk *this, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;

  v3 = result[7];
  if (v3 <= (unint64_t)this)
  {
    v4 = result;
    if (result[8] > (unint64_t)this)
    {
      v5 = (uint64_t)this - v3;
      v6 = (v5 >> 3) / 2;
      if ((((v5 >> 3) + (v5 >> 3 < 0)) & 0xFFFFFFFFFFFFFFFELL) == v5 >> 3)
      {
        v19 = 0;
        result = (_QWORD *)mach_o::ChainedFixupPointerOnDisk::isRebase(this, *(unsigned __int16 *)(a3 + 6), result[9], &v19);
        if ((_DWORD)result)
        {
          v9 = *(_QWORD *)(v4[4] + 8);
          if (*(_QWORD *)(v9 + 56) <= v6)
            ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)result, v7, v8);
          *(_QWORD *)(*(_QWORD *)(v9 + 40) + 32 * v6 + 8) = v19 + v4[10];
          v10 = *(_QWORD *)(v4[4] + 8);
          if (*(_QWORD *)(v10 + 56) <= v6)
            ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)result, v7, v8);
          *(_QWORD *)(*(_QWORD *)(v10 + 40) + 32 * v6) = v4[11];
        }
      }
      else
      {
        v18 = 0;
        v19 = 0;
        result = (_QWORD *)mach_o::ChainedFixupPointerOnDisk::isBind(this, *(unsigned __int16 *)(a3 + 6), &v18, &v19);
        if ((_DWORD)result)
        {
          v11 = (_QWORD *)dyld3::OverflowSafeArray<void const*,4294967295ull>::operator[]((_QWORD *)(*(_QWORD *)(v4[5] + 8) + 40), v18);
          v14 = *(_QWORD *)(v4[4] + 8);
          if (*(_QWORD *)(v14 + 56) <= v6)
            ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)v11, v12, v13);
          *(_QWORD *)(*(_QWORD *)(v14 + 40) + 32 * v6 + 16) = *v11;
          result = (_QWORD *)dyld3::OverflowSafeArray<void const*,4294967295ull>::operator[]((_QWORD *)(*(_QWORD *)(v4[6] + 8) + 40), v18);
          v17 = *(_QWORD *)(v4[4] + 8);
          if (*(_QWORD *)(v17 + 56) <= v6)
            ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)result, v15, v16);
          *(_QWORD *)(*(_QWORD *)(v17 + 40) + 32 * v6 + 24) = *result;
        }
      }
    }
  }
  return result;
}

_QWORD *___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_3(_QWORD *result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = result[6];
  v4 = (_QWORD *)(result[5] + a2);
  if (v3 <= (unint64_t)v4 && result[7] > (unint64_t)v4)
  {
    v5 = (uint64_t)((uint64_t)v4 - v3) >> 3;
    v6 = *(_QWORD *)(result[4] + 8);
    if (*(_QWORD *)(v6 + 56) <= (unint64_t)(v5 / 2))
      ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)result, a2, a3);
    *(_QWORD *)(*(_QWORD *)(v6 + 40) + 32 * (v5 / 2) + 8) = result[8] + *v4;
    v7 = *(_QWORD *)(result[4] + 8);
    if (*(_QWORD *)(v7 + 56) <= (unint64_t)(v5 / 2))
      ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)result, a2, a3);
    *(_QWORD *)(*(_QWORD *)(v7 + 40) + 32 * (v5 / 2)) = result[9];
  }
  return result;
}

dyld3::MachOFile *___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_4(dyld3::MachOFile *result, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  _QWORD *v9;
  dyld4::RuntimeState *v12;
  uint64_t v13;
  uint64_t v14;
  const dyld4::RuntimeState *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;

  v8 = *((_QWORD *)result + 8) + a2;
  if (*((_QWORD *)result + 9) <= v8)
  {
    v9 = result;
    if (*((_QWORD *)result + 10) > v8)
    {
      v12 = (dyld4::RuntimeState *)*((_QWORD *)result + 7);
      v22 = 0;
      memset(v21, 0, sizeof(v21));
      dyld4::Loader::resolveSymbol(*((dyld4::Loader **)result + 11), v12, (vm_address_t *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 40), a3, a5, a6, a7, 0, (uint64_t)v21);
      result = (dyld3::MachOFile *)Diagnostics::noError((Diagnostics *)(*(_QWORD *)(v9[4] + 8) + 40));
      if ((_DWORD)result)
      {
        v13 = (uint64_t)(v8 - v9[9]) >> 3;
        if (v13 >= 0)
          v14 = (uint64_t)(v8 - v9[9]) >> 3;
        else
          v14 = v13 + 1;
        v15 = dyld4::Loader::resolvedAddress(v12, (uint64_t)v21);
        v18 = *(_QWORD *)(v9[5] + 8);
        if (*(_QWORD *)(v18 + 56) <= (unint64_t)(v14 >> 1))
          ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)v15, v16, v17);
        v19 = (uint64_t)v15 + a8;
        *(_QWORD *)(*(_QWORD *)(v18 + 40) + 32 * (v14 >> 1) + 16) = (char *)v15 + a8;
        v20 = *(_QWORD *)(v9[5] + 8);
        if (*(_QWORD *)(v20 + 56) <= (unint64_t)(v14 >> 1))
          ___ZN5dyld412RuntimeState23appendInterposingTuplesEPKNS_6LoaderEPKhj_block_invoke_2_cold_1((uint64_t)v15, v16, v19);
        *(_QWORD *)(*(_QWORD *)(v20 + 40) + 32 * (v14 >> 1) + 24) = a5;
        return dyld4::RuntimeState::checkHiddenCacheAddr(v12, *(uint64_t *)&v21[0], v19, (const unsigned __int8 *)a5, (uint64_t *)(*(_QWORD *)(v9[6] + 8) + 40));
      }
    }
  }
  return result;
}

@end
