@implementation CoreTelephonyClient(TelephonyPreferences)

- (id)carrierBundleForSubscription:()TelephonyPreferences error:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(a1, "copyCarrierBundleLocation:error:", v6, a4);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)localizedCarrierBundleStringForKey:()TelephonyPreferences subscription:error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a1, "carrierBundleForSubscription:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_1EA2CE0A0, CFSTR("carrier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
