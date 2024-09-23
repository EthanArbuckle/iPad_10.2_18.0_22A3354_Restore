@implementation ZN15BBUpdaterCommon14getEUICCChipIDEv

const void **___ZN15BBUpdaterCommon14getEUICCChipIDEv_block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v4;
  CFNumberRef number;

  v4 = BBUpdaterCommon::BBUMGCopyAnswer((BBUpdaterCommon *)CFSTR("EUICCChipID"), a2);
  ctu::cf::CFSharedRef<__CFNumber const>::CFSharedRef<void const,void>(&number, (CFTypeRef *)&v4);
  v2 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
  if (!number)
    v2 = 0;
  if (v2)
    CFNumberGetValue(number, kCFNumberSInt64Type, &BBUpdaterCommon::getEUICCChipID(void)::euiccChipID);
  return ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&number);
}

@end
