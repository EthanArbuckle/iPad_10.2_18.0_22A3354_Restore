@implementation CTXPCServiceSubscriptionContext(TelephonyPreferences)

+ (id)telephonyClient
{
  if (telephonyClient_onceToken != -1)
    dispatch_once(&telephonyClient_onceToken, &__block_literal_global_2);
  return (id)telephonyClient_telephonyClient;
}

- (id)tps_isoCountryCode
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "telephonyClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "getMobileSubscriberHomeCountryList:error:", a1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;

  if (v3)
  {
    TPSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = a1;
      _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Retreived ISO country codes %@ for %@.", buf, 0x16u);
    }

    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      TPSLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = a1;
        _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Retreiving ISO country codes failed with error %@ for %@.", buf, 0x16u);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (id)tps_localizedLabel
{
  void *v2;

  objc_msgSend(a1, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "tps_localizedPhoneNumber");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)tps_localizedPhoneNumber
{
  void *v1;
  const void *v2;
  void *String;

  objc_msgSend(a1, "phoneNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (const void *)CFPhoneNumberCreate();

  if (v2)
  {
    String = (void *)CFPhoneNumberCreateString();
    CFRelease(v2);
  }
  else
  {
    String = 0;
  }
  return String;
}

- (id)tps_localizedShortLabel
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "telephonyClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "getShortLabel:error:", a1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  v5 = 0;
  if (!v4)
  {
    TPSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "-[CTXPCServiceSubscriptionContext(TelephonyPreferences) tps_localizedShortLabel]";
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = a1;
      _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "%s: Received shortLabel: %@ for Context: %@", buf, 0x20u);
    }

    v5 = v3;
  }

  return v5;
}

- (uint64_t)tps_isEquivalentToSubscriptionContext:()TelephonyPreferences
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_msgSend(a1, "slotID");
  if (v5 == objc_msgSend(v4, "slotID"))
  {
    objc_msgSend(a1, "labelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = (void *)v9;
    if (v8 | v9)
    {
      if (!v9)
      {
        v14 = 0;
        v12 = v8;
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      v11 = objc_msgSend((id)v8, "isEqualToString:", v9);

      if (!v11)
      {
        v14 = 0;
        goto LABEL_11;
      }
    }
    objc_msgSend(a1, "uuid");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (v12 | v13) == 0;
    if (v13)
      v14 = objc_msgSend((id)v12, "isEqual:", v13);

    goto LABEL_10;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

@end
