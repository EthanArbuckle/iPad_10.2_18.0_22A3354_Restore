@implementation WBSafariPreferencesDomain

void __WBSafariPreferencesDomain_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  id v5;

  WBCurrentProcessContainerPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    v1 = (void *)WBSafariPreferencesDomain_domain;
    WBSafariPreferencesDomain_domain = (uint64_t)CFSTR("com.apple.mobilesafari");
  }
  else
  {
    WBSafariContainerPath();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2;
    if (v2)
    {
      objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Preferences/com.apple.mobilesafari"));
      v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("com.apple.mobilesafari");
    }
    v4 = (void *)WBSafariPreferencesDomain_domain;
    WBSafariPreferencesDomain_domain = (uint64_t)v3;

    v1 = v5;
  }

}

@end
