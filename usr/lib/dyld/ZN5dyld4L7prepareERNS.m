@implementation ZN5dyld4L7prepareERNS

void *___ZN5dyld4L7prepareERNS_4APIsEPKN5dyld313MachOAnalyzerE_block_invoke_28(uint64_t a1, const char *a2)
{
  return dyld4::MissingPaths::addPath((dyld4::MissingPaths *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

dyld3::MachOFile *___ZN5dyld4L7prepareERNS_4APIsEPKN5dyld313MachOAnalyzerE_block_invoke_2(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  dyld3::MachOFile *v8;
  unsigned int v9;
  unsigned int v10;
  _QWORD v12[7];

  v5 = dyld4::PrebuiltLoader::BindTargetRef::value((dyld4::PrebuiltLoader::BindTargetRef *)(a2 + 2), *(dyld4::RuntimeState **)(a1 + 32), a3);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(dyld3::MachOFile **)(*(_QWORD *)(v6 + 8) + 240);
  v9 = *a2;
  v10 = a2[1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 0x40000000;
  v12[2] = ___ZN5dyld4L7prepareERNS_4APIsEPKN5dyld313MachOAnalyzerE_block_invoke_3;
  v12[3] = &__block_descriptor_tmp_33;
  v12[4] = v6;
  v12[5] = v5;
  v12[6] = v7;
  return DyldSharedCache::forEachPatchableUseOfExport(v8, v9, v10, (uint64_t)v12);
}

@end
