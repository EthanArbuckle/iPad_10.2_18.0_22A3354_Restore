@implementation PencilPairingUIBundle

void __PencilPairingUIBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PencilPairingUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__PencilPairingUIBundle;
  __PencilPairingUIBundle = v0;

}

@end
