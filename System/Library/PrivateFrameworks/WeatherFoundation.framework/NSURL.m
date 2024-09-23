@implementation NSURL

void __48__NSURL_StoreCacheAdditions__wf_inMemoryAddress__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("memory://"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)wf__inMemoryAddress;
  wf__inMemoryAddress = v0;

}

@end
