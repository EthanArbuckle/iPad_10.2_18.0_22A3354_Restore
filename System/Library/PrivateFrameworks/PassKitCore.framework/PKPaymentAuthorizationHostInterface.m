@implementation PKPaymentAuthorizationHostInterface

void __PKPaymentAuthorizationHostInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1FD590);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_277;
  _MergedGlobals_277 = v0;

}

@end
