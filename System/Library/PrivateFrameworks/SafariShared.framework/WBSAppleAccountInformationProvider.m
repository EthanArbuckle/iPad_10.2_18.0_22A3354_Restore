@implementation WBSAppleAccountInformationProvider

- (BOOL)isSafariSyncEnabled
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2C0]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabledForDataclass:", *MEMORY[0x1E0C8EE28]);

  return v4;
}

- (int64_t)appleAccountSecurityState
{
  int64_t result;
  unint64_t v4;
  int64_t v5;

  result = (int64_t)NSClassFromString(CFSTR("AKAccountManager"));
  if (result)
  {
    v4 = -[WBSAppleAccountInformationProvider _primaryAppleAccountSecurityLevel](self, "_primaryAppleAccountSecurityLevel");
    v5 = 1;
    if (v4 == 4)
      v5 = 2;
    if (v4)
      return v5;
    else
      return 0;
  }
  return result;
}

- (unint64_t)_primaryAppleAccountSecurityLevel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2C0]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "securityLevelForAccount:", v6);

  return v7;
}

- (void)getAppleAccountSecurityStateWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, int64_t))a3 + 2))(v5, -[WBSAppleAccountInformationProvider appleAccountSecurityState](self, "appleAccountSecurityState"));

}

@end
