@implementation REScriptProcessorCache

void __REScriptProcessorCache_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REScriptProcessorCache_Cache;
  REScriptProcessorCache_Cache = v0;

}

@end
