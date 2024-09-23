@implementation TPSCloudAccountChecker

+ (BOOL)isiCloudAccountEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "_primaryCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)_primaryCloudAccount
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isiCloudDataClassEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(a1, "_primaryCloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledDataclasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

@end
