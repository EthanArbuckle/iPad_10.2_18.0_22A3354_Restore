@implementation LSBundleRecord

- (BOOL)swc_linkedOnOrAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LSBundleRecord SDKVersion](self, "SDKVersion"));
  v7 = objc_msgSend(v5, "isVersion:greaterThanOrEqualToVersion:", v6, v4);

  return v7;
}

- (BOOL)swc_isBuiltForDevelopment
{
  unsigned int v3;

  v3 = -[LSBundleRecord isProfileValidated](self, "isProfileValidated");
  if (v3)
  {
    if ((-[LSBundleRecord isUPPValidated](self, "isUPPValidated") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else if ((objc_opt_respondsToSelector(self, "isBeta") & 1) != 0)
    {
      LOBYTE(v3) = -[LSBundleRecord isBeta](self, "isBeta") ^ 1;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

@end
