@implementation PDPaymentServiceInterface

void __PDPaymentServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE288A10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_295;
  _MergedGlobals_295 = v0;

  _ConfigurePDPaymentServiceInterface((void *)_MergedGlobals_295);
}

@end
