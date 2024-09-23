@implementation SFOpenCalculationCommand(SearchUICompletion)

- (id)_searchui_completionImage
{
  void *v0;
  void *v1;

  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v0, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (__CFString)_searchui_overriddenBridgeStringWithCompletion:()SearchUICompletion
{
  void *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "typedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SearchUIUtilities stringHasRegexMatch:regex:](SearchUIUtilities, "stringHasRegexMatch:regex:", v3, CFSTR("[=＝]\\s*$")))
  {
    v4 = &stru_1EA1FB118;
  }
  else
  {
    v4 = CFSTR(" = ");
  }
  v5 = v4;

  return v5;
}

@end
