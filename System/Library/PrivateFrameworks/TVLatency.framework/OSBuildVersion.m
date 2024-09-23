@implementation OSBuildVersion

void __OSBuildVersion_block_invoke()
{
  void *v0;
  void *v1;
  CFTypeID v2;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
      objc_storeStrong((id *)&OSBuildVersion_build, v1);
  }
}

void __OSBuildVersion_block_invoke_0()
{
  void *v0;
  void *v1;
  CFTypeID v2;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
      objc_storeStrong((id *)&OSBuildVersion_build_0, v1);
  }
}

@end
