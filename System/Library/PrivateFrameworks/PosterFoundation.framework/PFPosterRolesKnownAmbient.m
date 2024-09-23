@implementation PFPosterRolesKnownAmbient

void __PFPosterRolesKnownAmbient_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251549F88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFPosterRolesKnownAmbient_knownBundleIdentifiers;
  PFPosterRolesKnownAmbient_knownBundleIdentifiers = v0;

}

@end
