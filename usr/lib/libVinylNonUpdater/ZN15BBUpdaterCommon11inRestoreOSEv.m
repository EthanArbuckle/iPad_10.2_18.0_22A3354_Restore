@implementation ZN15BBUpdaterCommon11inRestoreOSEv

const void **___ZN15BBUpdaterCommon11inRestoreOSEv_block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  CFBooleanRef BOOLean;

  v7 = BBUpdaterCommon::BBUMGCopyAnswer((BBUpdaterCommon *)CFSTR("RestoreOSBuild"), a2);
  ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&BOOLean, (CFTypeRef *)&v7);
  v2 = ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::get;
  if (!BOOLean)
    v2 = 0;
  if (v2)
    BBUpdaterCommon::inRestoreOS(void)::restoreOS = CFBooleanGetValue(BOOLean) != 0;
  if ((*(_BYTE *)(gBBULogMaskGet() + 3) & 1) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(24, 0, "BBUCommon", ", "inRestoreOS: %d\n", v3, v4, v5, BBUpdaterCommon::inRestoreOS(void)::restoreOS);
  return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&BOOLean);
}

@end
