@implementation ZN5dyld46Reaper18finalizeDeadImagesEv

_QWORD *___ZN5dyld46Reaper18finalizeDeadImagesEv_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  if ((*(_BYTE *)(a2 + 52) & 4) != 0)
  {
    v3 = result;
    v4 = *(_QWORD *)(a2 + 16);
    v5 = dyld3::MachOLoaded::getSlide((dyld3::MachOLoaded *)result[5]) + v4;
    v6 = *(_QWORD *)(a2 + 24);
    v7 = *(_QWORD *)(v3[4] + 8);
    result = dyld3::OverflowSafeArray<dyld4::RuntimeState::HiddenCacheAddr,4294967295ull>::verifySpace((_QWORD *)(v7 + 40), 1);
    v8 = *(_QWORD *)(v7 + 40);
    v9 = *(_QWORD *)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v9 + 1;
    v10 = (_QWORD *)(v8 + 16 * v9);
    *v10 = v5;
    v10[1] = v6;
  }
  return result;
}

@end
