@implementation CNContactStoreConfiguration(TelephonyUtilities)

+ (id)tu_contactStoreConfigurationForBundleIdentifier:()TelephonyUtilities
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "tu_assumedIdentityForBundleIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "setAssumedIdentity:", v5);

  return v4;
}

+ (id)tu_contactStoreConfigurationForCall:()TelephonyUtilities
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(v3, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemProvider");

  if (v6)
  {
    objc_msgSend(v3, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assumedIdentity");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tu_assumedIdentity");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAssumedIdentity:", v8);
  return v4;
}

@end
