@implementation CEMLegacyRestrictionsAppsDeclaration(UIAdditions)

- (uint64_t)st_payloadAllowMail
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "payloadBlacklistedAppBundleIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", *MEMORY[0x24BE84748]) ^ 1;

  return v2;
}

- (void)setSt_payloadAllowMail:()UIAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a1, "payloadBlacklistedAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v10 = v8;

  v9 = *MEMORY[0x24BE84748];
  if (a3)
    objc_msgSend(v10, "removeObject:", v9);
  else
    objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(a1, "setPayloadBlacklistedAppBundleIDs:", v10);

}

- (uint64_t)st_payloadAllowWallet
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "payloadBlacklistedAppBundleIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", *MEMORY[0x24BE84790]) ^ 1;

  return v2;
}

- (void)setSt_payloadAllowWallet:()UIAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a1, "payloadBlacklistedAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v10 = v8;

  v9 = *MEMORY[0x24BE84790];
  if (a3)
    objc_msgSend(v10, "removeObject:", v9);
  else
    objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(a1, "setPayloadBlacklistedAppBundleIDs:", v10);

}

@end
