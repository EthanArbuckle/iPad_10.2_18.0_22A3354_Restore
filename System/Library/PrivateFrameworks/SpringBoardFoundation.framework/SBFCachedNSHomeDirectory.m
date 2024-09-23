@implementation SBFCachedNSHomeDirectory

void __SBFCachedNSHomeDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSHomeDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)SBFCachedNSHomeDirectory_sbf_once_object_0;
  SBFCachedNSHomeDirectory_sbf_once_object_0 = v0;

}

@end
