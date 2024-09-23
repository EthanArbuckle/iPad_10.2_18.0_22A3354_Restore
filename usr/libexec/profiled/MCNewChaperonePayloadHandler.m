@implementation MCNewChaperonePayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a6)
  {
    v7 = MCInstallationErrorDomain;
    v8 = MCErrorArray(CFSTR("ERROR_INVALID_SUPERVISION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v7, 4024, v9, MCErrorTypeFatal, 0));

  }
  return 0;
}

- (BOOL)isInstalled
{
  return 1;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  CFPreferencesSetAppValue(CFSTR("com.apple.purplebuddy"), kCFBooleanTrue, CFSTR("SetupDone"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy"));
}

@end
