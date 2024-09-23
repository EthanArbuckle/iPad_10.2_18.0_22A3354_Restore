@implementation FBSDisplayLayoutMonitorConfiguration(SBSContinuityDisplayLayout)

+ (id)configurationForContinuityDisplay
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D230D0], "serviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endpointForMachName:service:instance:", v1, v2, CFSTR("com.apple.SpringBoard.continuity-display"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D230D0], "serviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nullEndpointForService:instance:", v5, CFSTR("com.apple.SpringBoard.continuity-display"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D230E0], "configurationWithEndpoint:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
