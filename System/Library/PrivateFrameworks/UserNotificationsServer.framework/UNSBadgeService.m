@implementation UNSBadgeService

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BEBEC28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", v4);

  objc_opt_class();
  objc_msgSend(v5, "badgeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  v5 = (objc_class *)MEMORY[0x24BEBEC28];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:", v6);

  objc_msgSend(v8, "badgeValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBadgeValue:", v7);

  if (v7)
    v10 = 1;
  else
    v10 = v9 == 0;
  v11 = !v10;

  return v11;
}

@end
