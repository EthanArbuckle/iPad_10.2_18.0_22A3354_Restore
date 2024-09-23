@implementation ASKBuildTypeGetCurrent

void __ASKBuildTypeGetCurrent_block_invoke(id a1)
{
  __CFString *v1;

  if (+[PFClientUtil isRunningOnInternalOS](PFClientUtil, "isRunningOnInternalOS"))
    v1 = CFSTR("internal");
  else
    v1 = CFSTR("production");
  objc_storeStrong((id *)&ASKBuildTypeGetCurrent_buildType, v1);
}

@end
