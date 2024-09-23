@implementation CADisplay(SBDisplayReferenceModeMonitor)

- (id)sb_referenceModeObserverUniqueIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "uniqueId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "displayId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
