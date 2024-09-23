@implementation CTPhoneNumberInfo(TelephonyPreferences)

- (id)tps_localizedNumber
{
  void *v1;
  void *active;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "number");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  active = (void *)CPPhoneNumberCopyActiveCountryCode();
  v3 = active;
  v4 = 0;
  if (v1 && active)
  {
    TPSLocalizedPhoneNumberString(v1, active);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v1;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Telephone number was localized to %@ using digits %@ and ISO country code %@.", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

- (id)tps_normalizedNumber
{
  void *v1;
  void *active;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "number");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  active = (void *)CPPhoneNumberCopyActiveCountryCode();
  v3 = active;
  v4 = 0;
  if (v1 && active)
  {
    TPSNormalizedPhoneNumberString(v1, active);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  TPSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v1;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1DB4B7000, v5, OS_LOG_TYPE_DEFAULT, "Telephone number was normalized to %@ using digits %@ and ISO country code %@.", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

@end
