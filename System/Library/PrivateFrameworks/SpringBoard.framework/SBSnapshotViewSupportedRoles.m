@implementation SBSnapshotViewSupportedRoles

void __SBSnapshotViewSupportedRoles_block_invoke()
{
  void *v0;
  int v1;

  SBSnapshotViewSupportedRoles___result = 2;
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isMedusaCapable");

  if (v1)
    SBSnapshotViewSupportedRoles___result = SBLayoutRoleMaskAppLayout();
}

@end
