@implementation PDPassLibraryInterface

void __PDPassLibraryInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE286678);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_193;
  _MergedGlobals_193 = v0;

  _PDPassLibraryApplyBaseInterface((void *)_MergedGlobals_193);
}

@end
