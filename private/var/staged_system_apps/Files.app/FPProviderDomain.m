@implementation FPProviderDomain

- (BOOL)isSyncStateMessagingSupported
{
  FPProviderDomain *v2;
  unsigned __int8 v3;

  v2 = self;
  if ((-[FPProviderDomain isiCloudDriveProvider](v2, "isiCloudDriveProvider") & 1) != 0
    || -[FPProviderDomain isUsingFPFS](v2, "isUsingFPFS"))
  {
    v3 = 1;
  }
  else
  {
    v3 = -[FPProviderDomain isMainiCloudDriveDomain](v2, "isMainiCloudDriveDomain");
  }

  return v3;
}

- (BOOL)isProgressPausable
{
  FPProviderDomain *v2;
  char v3;

  v2 = self;
  v3 = FPProviderDomain.shouldUseDSEnumeration.getter();

  return v3 & 1;
}

@end
