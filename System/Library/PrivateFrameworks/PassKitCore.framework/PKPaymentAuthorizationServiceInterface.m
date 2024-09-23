@implementation PKPaymentAuthorizationServiceInterface

void __PKPaymentAuthorizationServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE24C948);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_197;
  _MergedGlobals_197 = v0;

  PKPaymentAuthorizationServiceInterfaceSet((void *)_MergedGlobals_197);
}

@end
