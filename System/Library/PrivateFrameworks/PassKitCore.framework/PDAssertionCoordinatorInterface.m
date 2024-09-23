@implementation PDAssertionCoordinatorInterface

void __PDAssertionCoordinatorInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE25D320);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_218;
  _MergedGlobals_218 = v0;

}

@end
