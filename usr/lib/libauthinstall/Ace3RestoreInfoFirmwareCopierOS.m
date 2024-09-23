@implementation Ace3RestoreInfoFirmwareCopierOS

- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[Ace3SoCRestoreInfoHelperOS verboseLog:](self, "verboseLog:", CFSTR("%s"), "-[Ace3RestoreInfoFirmwareCopierOS firmwareKeyFromBuildIdentityDict:deviceInfo:]");
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ManifestPrefix"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyWithPrefix:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Error: Could not find device info dictionary"));
    v9 = 0;
  }

  return v9;
}

@end
