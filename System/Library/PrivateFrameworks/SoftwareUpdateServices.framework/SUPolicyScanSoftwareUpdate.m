@implementation SUPolicyScanSoftwareUpdate

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.SoftwareUpdate");
}

- (BOOL)discretionary
{
  return 0;
}

- (BOOL)restrictToIncremental
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SUPolicyScan scanOptions](self, "scanOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsType:", 1))
  {
    -[SUPolicyScan scanOptions](self, "scanOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "types");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)restrictToFull
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "forceFullReplacement") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SUPolicyScan scanOptions](self, "scanOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsType:", 2))
    {
      -[SUPolicyScan scanOptions](self, "scanOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "types");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "count") == 1;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)isSplatOnlyScan
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SUPolicyScan scanOptions](self, "scanOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsType:", 4))
  {
    -[SUPolicyScan scanOptions](self, "scanOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "types");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)allowSameVersion
{
  void *v2;
  char v3;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowSameBuildUpdates");

  return v3;
}

@end
