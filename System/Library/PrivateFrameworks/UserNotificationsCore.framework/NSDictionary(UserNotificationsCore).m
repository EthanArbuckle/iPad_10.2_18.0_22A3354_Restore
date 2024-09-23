@implementation NSDictionary(UserNotificationsCore)

- (id)unc_safeCastObjectForKey:()UserNotificationsCore class:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)unc_safeCastObjectForKey:()UserNotificationsCore classes:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCastAny();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)unc_nonEmptyCopy
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
    v2 = (void *)objc_msgSend(a1, "copy");
  return v2;
}

- (id)unc_nonNilArrayForKey:()UserNotificationsCore
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x24BDBD1A8];
  v3 = v1;

  return v3;
}

- (id)unc_nonNilDictionaryForKey:()UserNotificationsCore
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x24BDBD1B8];
  v3 = v1;

  return v3;
}

- (id)unc_nonNilSetForKey:()UserNotificationsCore
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (__CFString)unc_safeCastNonNilStringForKey:()UserNotificationsCore
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = a3;
  objc_msgSend(a1, "unc_safeCastObjectForKey:class:", v4, objc_opt_class());
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_251AE68F0;
  v7 = v6;

  return v7;
}

@end
