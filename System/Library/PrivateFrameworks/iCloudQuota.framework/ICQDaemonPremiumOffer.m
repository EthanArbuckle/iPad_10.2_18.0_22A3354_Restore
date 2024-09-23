@implementation ICQDaemonPremiumOffer

+ (id)persistenceKey
{
  return CFSTR("_ICQCachedPremiumOfferInternal");
}

+ (id)_mutablePlaceholderPersistanceDictionary
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ICQDaemonPremiumOffer;
  objc_msgSendSuper2(&v4, sel__mutablePlaceholderPersistanceDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", &unk_1E8B516C0, CFSTR("isPremiumOffer"));
  return v2;
}

- (id)_initWithAccount:(id)a3 error:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICQDaemonPremiumOffer;
  v4 = -[ICQDaemonOffer _initWithAccount:error:](&v11, sel__initWithAccount_error_, a3, a4);
  if (v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Creating premium offer placeholder", v10, 2u);
    }

    objc_msgSend(v4, "serverDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isPremiumOffer"));
    objc_msgSend(v7, "setObject:forKey:", CFSTR("PremiumJourneys"), CFSTR("offerType"));
    objc_msgSend(v7, "setObject:forKey:", CFSTR("PremiumJourneys"), CFSTR("type"));
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setServerDictionary:", v8);

  }
  return v4;
}

@end
