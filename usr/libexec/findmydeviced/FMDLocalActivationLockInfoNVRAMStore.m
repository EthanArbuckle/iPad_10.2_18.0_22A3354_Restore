@implementation FMDLocalActivationLockInfoNVRAMStore

- (void)updateMaskedAppleID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  objc_msgSend(v4, "setStringPropertyWithKey:value:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-account-masked"), v3);

}

- (id)retrieveMaskedAppleID
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringValueForKey:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-account-masked")));

  if (v3 && !objc_msgSend(v3, "length"))
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)clearMaskedAppleID
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  objc_msgSend(v2, "clearPropertyWithKey:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-account-masked"));

}

- (void)updateActivationLockStatus:(id)a3
{
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  id v6;

  v3 = objc_msgSend(a3, "BOOLValue");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  objc_msgSend(v6, "setStringPropertyWithKey:value:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-activation-locked"), v5);

}

- (id)retrieveActivationLockStatus
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValueForKey:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-activation-locked")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoNVRAMStore _statusFromStringValue:](self, "_statusFromStringValue:", v4));
  return v5;
}

- (void)updateOfflineFindingStatus:(id)a3
{
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  id v6;

  v3 = objc_msgSend(a3, "BOOLValue");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  objc_msgSend(v6, "setStringPropertyWithKey:value:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spstatus"), v5);

}

- (id)retrieveOfflineFindingStatus
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValueForKey:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spstatus")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocalActivationLockInfoNVRAMStore _statusFromStringValue:](self, "_statusFromStringValue:", v4));
  return v5;
}

- (void)updateOfflineFindingInfo:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  objc_msgSend(v4, "setDataPropertyWithKey:value:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spkeys"), v3);

}

- (id)retrieveOfflineFindingInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataValueForKey:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spkeys")));

  return v3;
}

- (void)clearOfflineFindingInfo
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMDNVRAMUtil sharedInstance](FMDNVRAMUtil, "sharedInstance"));
  objc_msgSend(v2, "clearPropertyWithKey:", CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spkeys"));

}

- (id)_statusFromStringValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t v10[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "status Key not found in nvram", v10, 2u);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YES")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("NO")) & 1) != 0)
    {
      v5 = &__kCFBooleanFalse;
      goto LABEL_11;
    }
    v8 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100226930((uint64_t)v4, v7);
LABEL_10:

    v5 = 0;
    goto LABEL_11;
  }
  v5 = &__kCFBooleanTrue;
LABEL_11:

  return v5;
}

@end
