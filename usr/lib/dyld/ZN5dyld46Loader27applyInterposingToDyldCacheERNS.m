@implementation ZN5dyld46Loader27applyInterposingToDyldCacheERNS

dyld3::MachOFile *___ZN5dyld46Loader27applyInterposingToDyldCacheERNS_12RuntimeStateE_block_invoke(dyld3::MachOFile *result, unsigned int a2, uint64_t a3)
{
  dyld3::MachOFile *v4;
  uint64_t v5;
  unsigned int v6;
  _QWORD v7[8];

  if (*((_DWORD *)result + 14) == a2)
  {
    v4 = (dyld3::MachOFile *)*((_QWORD *)result + 5);
    v5 = **((_QWORD **)result + 4);
    v6 = *((_DWORD *)result + 15);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = ___ZN5dyld46Loader27applyInterposingToDyldCacheERNS_12RuntimeStateE_block_invoke_2;
    v7[3] = &__block_descriptor_tmp_150;
    v7[4] = v4;
    v7[5] = v5;
    v7[6] = *((_QWORD *)result + 6);
    v7[7] = a3;
    return DyldSharedCache::forEachPatchableUseOfExport(v4, v6, a2, (uint64_t)v7);
  }
  return result;
}

@end
