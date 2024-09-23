@implementation ZN15BBUpdaterCommon7getECIDEv

const void **___ZN15BBUpdaterCommon7getECIDEv_block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  CFNumberRef number;

  v7 = BBUpdaterCommon::BBUMGCopyAnswer((BBUpdaterCommon *)CFSTR("UniqueChipID"), a2);
  ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&number, (CFTypeRef *)&v7);
  v2 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  if (!number)
    v2 = 0;
  if (v2)
  {
    CFNumberGetValue(number, kCFNumberSInt64Type, &BBUpdaterCommon::getECID(void)::ecid);
    if ((*(_BYTE *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
      _BBULog(24, 0, "BBUCommon", ", "ECID: 0x%llx\n", v3, v4, v5, BBUpdaterCommon::getECID(void)::ecid);
  }
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&number);
}

@end
