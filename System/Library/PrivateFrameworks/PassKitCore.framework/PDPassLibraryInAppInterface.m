@implementation PDPassLibraryInAppInterface

void __PDPassLibraryInAppInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2868A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22190;
  qword_1ECF22190 = v0;

  _PDPassLibraryApplyBaseInterface((void *)qword_1ECF22190);
  _PDPassLibraryApplyInAppInterface((void *)qword_1ECF22190);
}

@end
