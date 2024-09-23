@implementation MCNewPasswordPolicyPayloadHandler

- (BOOL)isInstalled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = +[MCRestrictionManagerWriter restrictionsAlreadyInstalledFromPayload:](MCRestrictionManagerWriter, "restrictionsAlreadyInstalledFromPayload:", v2);

  return v3;
}

@end
