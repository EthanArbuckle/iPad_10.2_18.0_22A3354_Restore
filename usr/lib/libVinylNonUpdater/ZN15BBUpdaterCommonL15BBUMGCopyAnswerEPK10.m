@implementation ZN15BBUpdaterCommonL15BBUMGCopyAnswerEPK10

void *___ZN15BBUpdaterCommonL15BBUMGCopyAnswerEPK10__CFString_block_invoke()
{
  void *result;

  result = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (result)
  {
    result = dlsym(result, "MGCopyAnswer");
    BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::sCopyAnswer = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

@end
