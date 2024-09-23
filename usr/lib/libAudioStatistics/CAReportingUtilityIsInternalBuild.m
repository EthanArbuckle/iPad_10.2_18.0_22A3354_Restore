@implementation CAReportingUtilityIsInternalBuild

void __CAReportingUtilityIsInternalBuild_block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v0 = (const __CFBoolean *)MGCopyAnswer();
    if (v0)
    {
      v1 = v0;
      CAReportingUtilityIsInternalBuild::gCAReportingUtilityIsInternal = CFBooleanGetValue(v0) != 0;
      CFRelease(v1);
    }
  }
}

@end
