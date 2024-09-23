@implementation RETokenizeString

void __RETokenizeString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RETokenizeString::TokenizedStringCache;
  RETokenizeString::TokenizedStringCache = v0;

  RETokenizeString::CacheLock = 0;
}

@end
