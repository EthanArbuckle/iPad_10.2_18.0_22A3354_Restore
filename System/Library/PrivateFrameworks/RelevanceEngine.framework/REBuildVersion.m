@implementation REBuildVersion

void __REBuildVersion_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGGetStringAnswer();
  v1 = (void *)REBuildVersion_BuildVersion;
  REBuildVersion_BuildVersion = v0;

}

@end
