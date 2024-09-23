@implementation PFPosterRolesKnownIncomingCall

void __PFPosterRolesKnownIncomingCall_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251549FA0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFPosterRolesKnownIncomingCall_knownBundleIdentifiers;
  PFPosterRolesKnownIncomingCall_knownBundleIdentifiers = v0;

}

@end
