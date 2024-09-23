@implementation NSURL(WebPrivacyExtras)

- (id)_wp_urlByRemovingTrackingInformation
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSURL *v5;
  id v6;

  objc_msgSend(a1, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    +[WPResources sharedInstance](WPResources, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_waitForCachedLinkFilteringData");

    WebPrivacy::filterUsingCachedParameters((WebPrivacy *)a1, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (void)_wp_removeTrackingInformation:()WebPrivacyExtras
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAfterUpdates:", 0);
  +[WPResources sharedInstance](WPResources, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__NSURL_WebPrivacyExtras___wp_removeTrackingInformation___block_invoke;
  v8[3] = &unk_251BCEE18;
  v7 = v4;
  v8[4] = a1;
  v9 = v7;
  objc_msgSend(v6, "requestLinkFilteringData:completionHandler:", v5, v8);

}

@end
