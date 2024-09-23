@implementation PFPosterRolesKnownLockScreen

void __PFPosterRolesKnownLockScreen_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251549FB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFPosterRolesKnownLockScreen_knownBundleIdentifiers;
  PFPosterRolesKnownLockScreen_knownBundleIdentifiers = v0;

}

@end
