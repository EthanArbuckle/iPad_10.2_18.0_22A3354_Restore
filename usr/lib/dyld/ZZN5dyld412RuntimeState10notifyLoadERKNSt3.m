@implementation ZZN5dyld412RuntimeState10notifyLoadERKNSt3

_BYTE *___ZZN5dyld412RuntimeState10notifyLoadERKNSt3__14spanIPKNS_6LoaderELm18446744073709551615EEEENK3__0clEv_block_invoke(_BYTE *result, unsigned int a2)
{
  if (**((_DWORD **)result + 6) <= a2)
    ___ZZN5dyld412RuntimeState10notifyLoadERKNSt3__14spanIPKNS_6LoaderELm18446744073709551615EEEENK3__0clEv_block_invoke_cold_1();
  if ((*(_WORD *)(*(_QWORD *)(*((_QWORD *)result + 4) + 32 * a2 + 16) + 4) & 2) != 0)
  {
    if (**((_BYTE **)result + 7))
      return dyld4::DyldCacheDataConstLazyScopedWriter::makeWriteable(**((_BYTE ***)result + 5));
  }
  return result;
}

@end
