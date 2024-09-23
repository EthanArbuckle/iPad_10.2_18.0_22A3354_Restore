@implementation ZZN5dyld412RuntimeState16setObjCNotifiersEPFvPKcPK11mach

_BYTE *___ZZN5dyld412RuntimeState16setObjCNotifiersEPFvPKcPK11mach_headerEPFvS5_PvS5_PKvEPFvjPK29_dyld_objc_notify_mapped_infoEPFvSF_EPFvjSF_U13block_pointerFvjEEENK3__0clEv_block_invoke_168(_BYTE *result, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*((_QWORD *)result + 4) + 8);
  if (*(_QWORD *)(v2 + 56) <= (unint64_t)a2)
    ___ZZN5dyld412RuntimeState16setObjCNotifiersEPFvPKcPK11mach_headerEPFvS5_PvS5_PKvEPFvjPK29_dyld_objc_notify_mapped_infoEPFvSF_EPFvjSF_U13block_pointerFvjEEENK3__0clEv_block_invoke_168_cold_1();
  if ((*(_WORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 32 * a2 + 16) + 4) & 2) != 0)
  {
    if (result[48])
      return dyld4::DyldCacheDataConstLazyScopedWriter::makeWriteable(*((_BYTE **)result + 5));
  }
  return result;
}

@end
