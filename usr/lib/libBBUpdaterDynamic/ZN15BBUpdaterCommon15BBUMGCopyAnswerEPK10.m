@implementation ZN15BBUpdaterCommon15BBUMGCopyAnswerEPK10

void *___ZN15BBUpdaterCommon15BBUMGCopyAnswerEPK10__CFString_block_invoke()
{
  void *result;

  result = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (result)
  {
    result = dlsym(result, "MGCopyAnswer");
    BBUpdaterCommon::BBUMGCopyAnswer(__CFString const*)::sCopyAnswer = result;
  }
  return result;
}

@end
