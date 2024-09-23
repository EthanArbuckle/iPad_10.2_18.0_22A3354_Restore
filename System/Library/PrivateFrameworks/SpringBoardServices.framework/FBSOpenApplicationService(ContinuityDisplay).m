@implementation FBSOpenApplicationService(ContinuityDisplay)

+ (id)continuityDisplayEndpoint
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D23170], "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endpointForMachName:service:instance:", CFSTR("com.apple.frontboard.systemappservices"), v1, CFSTR("com.apple.SpringBoard.continuity-display"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)continuityDisplayService
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D23170], "continuityDisplayEndpoint");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0D23170], "serviceWithEndpoint:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
