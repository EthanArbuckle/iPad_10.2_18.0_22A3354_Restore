@implementation XBCachedNSHomeDirectory

void __XBCachedNSHomeDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSHomeDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)XBCachedNSHomeDirectory_sHomeDir;
  XBCachedNSHomeDirectory_sHomeDir = v0;

}

@end
