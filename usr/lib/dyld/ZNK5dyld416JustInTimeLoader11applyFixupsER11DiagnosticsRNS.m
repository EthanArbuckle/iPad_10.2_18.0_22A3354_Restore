@implementation ZNK5dyld416JustInTimeLoader11applyFixupsER11DiagnosticsRNS

dyld3::MachOFile *___ZNK5dyld416JustInTimeLoader11applyFixupsER11DiagnosticsRNS_12RuntimeStateERNS_34DyldCacheDataConstLazyScopedWriterEbPN3lsl6VectorINSt3__14pairIPKNS_6LoaderEPKcEEEE_block_invoke(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  dyld3::MachOFile *v6;
  _QWORD v8[8];

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(dyld3::MachOFile **)(*(_QWORD *)(v4 + 8) + 240);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = ___ZN5dyld416JustInTimeLoader17cacheWeakDefFixupERNS_12RuntimeStateERNS_34DyldCacheDataConstLazyScopedWriterEjjRKNS_6Loader14ResolvedSymbolE_block_invoke;
  v8[3] = &__block_descriptor_tmp_20;
  v8[4] = v6;
  v8[5] = v4;
  v8[6] = a4;
  v8[7] = v5;
  return DyldSharedCache::forEachPatchableUseOfExport(v6, a2, a3, (uint64_t)v8);
}

_QWORD *___ZNK5dyld416JustInTimeLoader11applyFixupsER11DiagnosticsRNS_12RuntimeStateERNS_34DyldCacheDataConstLazyScopedWriterEbPN3lsl6VectorINSt3__14pairIPKNS_6LoaderEPKcEEEE_block_invoke_26(uint64_t a1, uint64_t a2)
{
  const dyld4::RuntimeState *v4;
  dyld4::Loader *v5;
  dyld4::RuntimeState *v6;
  const dyld4::Loader *v7;
  dyld4::RuntimeState *v8;
  const dyld4::RuntimeState *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *result;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;

  v5 = *(dyld4::Loader **)(a1 + 48);
  v4 = *(const dyld4::RuntimeState **)(a1 + 56);
  v6 = dyld4::Loader::resolvedAddress(v4, a2);
  v8 = dyld4::Loader::interpose(v4, v6, v5, v7);
  v9 = *(const dyld4::RuntimeState **)(a1 + 56);
  if (*(_BYTE *)(*((_QWORD *)v9 + 1) + 202))
  {
    if (*(_QWORD *)a2)
    {
      v10 = dyld4::Loader::leafName(*(dyld4::Loader **)a2, *(const dyld4::RuntimeState **)(a1 + 56));
      v9 = *(const dyld4::RuntimeState **)(a1 + 56);
    }
    else
    {
      v10 = "<none>";
    }
    v11 = dyld4::Loader::leafName(v5, v9);
    dyld4::RuntimeState::log(v9, "<%s/bind#%llu> -> %p (%s/%s)\n", v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56), v8, v10, *(const char **)(a2 + 8));
  }
  if (*(_BYTE *)(a2 + 38))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(_QWORD *)(a2 + 8);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
    dyld3::OverflowSafeArray<dyld4::RuntimeState::HiddenCacheAddr,4294967295ull>::verifySpace((_QWORD *)(v12 + 40), 1);
    v15 = *(_QWORD *)(v12 + 40);
    v16 = *(_QWORD *)(v12 + 56);
    *(_QWORD *)(v12 + 56) = v16 + 1;
    v17 = v15 + 16 * v16;
    *(_QWORD *)v17 = v13;
    *(_DWORD *)(v17 + 8) = v14;
  }
  if (*(_BYTE *)(a2 + 39))
  {
    v18 = *(_QWORD *)(a1 + 64);
    if (v18)
    {
      v25 = *(_OWORD *)a2;
      lsl::Vector<dyld4::InterposeTupleAll>::reserve(v18, *(_QWORD *)(v18 + 16) + 1);
      v19 = *(_QWORD *)(v18 + 8);
      v20 = *(_QWORD *)(v18 + 16);
      *(_QWORD *)(v18 + 16) = v20 + 1;
      *(_OWORD *)(v19 + 16 * v20) = v25;
    }
  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = dyld3::OverflowSafeArray<dyld4::Loader *,4294967295ull>::verifySpace((_QWORD *)(v21 + 40), 1);
  v23 = *(_QWORD *)(v21 + 40);
  v24 = *(_QWORD *)(v21 + 56);
  *(_QWORD *)(v21 + 56) = v24 + 1;
  *(_QWORD *)(v23 + 8 * v24) = v8;
  return result;
}

_QWORD *___ZNK5dyld416JustInTimeLoader11applyFixupsER11DiagnosticsRNS_12RuntimeStateERNS_34DyldCacheDataConstLazyScopedWriterEbPN3lsl6VectorINSt3__14pairIPKNS_6LoaderEPKcEEEE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const dyld4::RuntimeState *v4;
  dyld4::Loader *v5;
  dyld4::RuntimeState *v7;
  const dyld4::Loader *v8;
  dyld4::RuntimeState *v9;
  const dyld4::RuntimeState *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *(dyld4::Loader **)(a1 + 48);
  v4 = *(const dyld4::RuntimeState **)(a1 + 56);
  if (*(_DWORD *)(a2 + 32) == 1 && *(_QWORD *)a2 == 0)
  {
    if (*(_BYTE *)(*((_QWORD *)v4 + 1) + 202))
    {
      v12 = dyld4::Loader::leafName(*(dyld4::Loader **)(a1 + 48), v4);
      dyld4::RuntimeState::log(v4, "<%s/bind#%llu> -> missing-weak-bind (%s)\n", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56), *(const char **)(a2 + 8));
    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = dyld3::OverflowSafeArray<dyld4::Loader *,4294967295ull>::verifySpace((_QWORD *)(v13 + 40), 1);
    v15 = *(_QWORD *)(v13 + 40);
    v16 = *(_QWORD *)(v13 + 56);
    *(_QWORD *)(v13 + 56) = v16 + 1;
    *(_QWORD *)(v15 + 8 * v16) = -1;
  }
  else
  {
    v7 = dyld4::Loader::resolvedAddress(*(const dyld4::RuntimeState **)(a1 + 56), a2);
    v9 = dyld4::Loader::interpose(v4, v7, v5, v8);
    v10 = *(const dyld4::RuntimeState **)(a1 + 56);
    if (*(_BYTE *)(*((_QWORD *)v10 + 1) + 202))
    {
      if (*(_QWORD *)a2)
      {
        v11 = dyld4::Loader::leafName(*(dyld4::Loader **)a2, *(const dyld4::RuntimeState **)(a1 + 56));
        v10 = *(const dyld4::RuntimeState **)(a1 + 56);
      }
      else
      {
        v11 = "<none>";
      }
      v17 = dyld4::Loader::leafName(v5, v10);
      dyld4::RuntimeState::log(v10, "<%s/bind#%llu> -> %p (%s/%s)\n", v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56), v9, v11, *(const char **)(a2 + 8));
    }
    if (*(_BYTE *)(a2 + 38))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(_QWORD *)(a2 + 8);
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
      dyld3::OverflowSafeArray<dyld4::RuntimeState::HiddenCacheAddr,4294967295ull>::verifySpace((_QWORD *)(v18 + 40), 1);
      v21 = *(_QWORD *)(v18 + 40);
      v22 = *(_QWORD *)(v18 + 56);
      *(_QWORD *)(v18 + 56) = v22 + 1;
      v23 = v21 + 16 * v22;
      *(_QWORD *)v23 = v19;
      *(_DWORD *)(v23 + 8) = v20;
    }
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = dyld3::OverflowSafeArray<dyld4::Loader *,4294967295ull>::verifySpace((_QWORD *)(v24 + 40), 1);
    v25 = *(_QWORD *)(v24 + 40);
    v26 = *(_QWORD *)(v24 + 56);
    *(_QWORD *)(v24 + 56) = v26 + 1;
    *(_QWORD *)(v25 + 8 * v26) = v9;
  }
  return result;
}

@end
