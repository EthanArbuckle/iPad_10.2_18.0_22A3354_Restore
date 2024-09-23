@implementation GetBundle

void __GetBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/WebSheet.framework"));
  v1 = (void *)GetBundle_bundle;
  GetBundle_bundle = v0;

}

@end
