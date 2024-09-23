@implementation ICQInternetPrivacyRestrictions

+ (BOOL)isCloudPrivateRelayAllowed
{
  void *v2;
  char v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudPrivateRelayAllowed");

  if ((v3 & 1) == 0)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Privacy proxy prohibited by profile", v6, 2u);
    }

  }
  return v3;
}

@end
