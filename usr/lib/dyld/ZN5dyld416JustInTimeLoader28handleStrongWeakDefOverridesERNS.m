@implementation ZN5dyld416JustInTimeLoader28handleStrongWeakDefOverridesERNS

dyld3::MachOFile *___ZN5dyld416JustInTimeLoader28handleStrongWeakDefOverridesERNS_12RuntimeStateERNS_34DyldCacheDataConstLazyScopedWriterE_block_invoke(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
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

@end
