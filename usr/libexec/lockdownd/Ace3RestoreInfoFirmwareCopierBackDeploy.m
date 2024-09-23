@implementation Ace3RestoreInfoFirmwareCopierBackDeploy

- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[Ace3SoCRestoreInfoHelperBackDeploy verboseLog:](self, "verboseLog:", CFSTR("%s"), "-[Ace3RestoreInfoFirmwareCopierBackDeploy firmwareKeyFromBuildIdentityDict:deviceInfo:]");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ManifestPrefix")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyWithPrefix:", v8));

  }
  else
  {
    -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Error: Could not find device info dictionary"));
    v9 = 0;
  }

  return v9;
}

@end
