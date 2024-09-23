@implementation FBSDisplayConfiguration(SBDisplayReferenceModeMonitor)

- (id)sb_referenceModeObserverUniqueIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "caDisplay");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sb_referenceModeObserverUniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
