@implementation NSURLRequest(SafariCoreExtras)

+ (id)safari_nonAppInitiatedRequestWithURL:()SafariCoreExtras
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "requestWithURL:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_requestBySettingIsUserInitiated:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_requestBySettingIsUserInitiated:()SafariCoreExtras
{
  id v5;

  if ((objc_msgSend(a1, "attribution") != 1) == a3)
  {
    v5 = (id)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "setAttribution:", a3);
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:()SafariCoreExtras
{
  void *v4;
  void *v5;
  id v6;

  v4 = a1;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(v5, "_useEnhancedPrivacyMode") != (_DWORD)a3)
  {
    objc_msgSend(v5, "_setUseEnhancedPrivacyMode:", a3);
    v4 = v5;
  }
  v6 = v4;

  return v6;
}

@end
