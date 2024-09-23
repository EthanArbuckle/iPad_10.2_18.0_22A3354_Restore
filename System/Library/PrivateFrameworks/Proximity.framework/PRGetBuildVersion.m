@implementation PRGetBuildVersion

void __PRGetBuildVersion_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswerWithError();
  v1 = (void *)PRGetBuildVersion::result;
  PRGetBuildVersion::result = v0;

}

@end
