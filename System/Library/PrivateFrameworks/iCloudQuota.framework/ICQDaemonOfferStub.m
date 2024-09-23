@implementation ICQDaemonOfferStub

- (ICQDaemonOfferStub)initWithServerDictionary:(id)a3
{
  id v4;
  ICQDaemonOfferStub *v5;
  uint64_t v6;
  NSDictionary *serverDict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQDaemonOfferStub;
  v5 = -[ICQDaemonOfferStub init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serverDict = v5->_serverDict;
    v5->_serverDict = (NSDictionary *)v6;

  }
  return v5;
}

- (NSDictionary)serverDictionary
{
  return self->_serverDict;
}

- (NSString)offerId
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_serverDict, "objectForKeyedSubscript:", CFSTR("offerId"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E8B3C468;
  v4 = v2;

  return v4;
}

- (BOOL)isBuddyOffer
{
  return _ICQIsBuddyOfferDictionary(self->_serverDict);
}

- (BOOL)isDefaultOffer
{
  return _ICQIsDefaultOfferDictionary(self->_serverDict);
}

- (BOOL)isPremiumOffer
{
  return _ICQIsPremiumOfferDictionary(self->_serverDict);
}

- (BOOL)isEventOffer
{
  return _ICQIsEventOfferDictionary(self->_serverDict);
}

- (ICQDaemonOfferCriteria)criteria
{
  void *v2;
  void *v3;
  ICQDaemonOfferCriteria *v4;

  -[ICQDaemonOfferStub serverDictionary](self, "serverDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("criteria"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[ICQDaemonOfferCriteria initWithServerDictionary:]([ICQDaemonOfferCriteria alloc], "initWithServerDictionary:", v3);
  return v4;
}

- (Class)offerClass
{
  if (!-[ICQDaemonOfferStub isBuddyOffer](self, "isBuddyOffer")
    && !-[ICQDaemonOfferStub isPremiumOffer](self, "isPremiumOffer")
    && !-[ICQDaemonOfferStub isDefaultOffer](self, "isDefaultOffer"))
  {
    -[ICQDaemonOfferStub isEventOffer](self, "isEventOffer");
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)persistedOffer
{
  return (id)-[objc_class persistedObject](-[ICQDaemonOfferStub offerClass](self, "offerClass"), "persistedObject");
}

- (int64_t)requestType
{
  if (-[ICQDaemonOfferStub isBuddyOffer](self, "isBuddyOffer"))
    return 4;
  if (-[ICQDaemonOfferStub isPremiumOffer](self, "isPremiumOffer"))
    return 2;
  if (-[ICQDaemonOfferStub isDefaultOffer](self, "isDefaultOffer"))
    return 1;
  if (-[ICQDaemonOfferStub isEventOffer](self, "isEventOffer"))
    return 5;
  return 3;
}

- (NSString)offerResetURL
{
  void *v2;
  id v3;
  NSObject *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_serverDict, "objectForKeyedSubscript:", CFSTR("offerResetURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ICQDaemonOfferStub offerResetURL].cold.1();

    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return (NSString *)v3;
}

- (NSDictionary)offerResetPayload
{
  void *v2;
  id v3;
  NSObject *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_serverDict, "objectForKeyedSubscript:", CFSTR("offerResetPayload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ICQDaemonOfferStub offerResetURL].cold.1();

    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return (NSDictionary *)v3;
}

- (ICQDaemonOfferConditions)conditionsWhenChosen
{
  return self->_conditionsWhenChosen;
}

- (void)setConditionsWhenChosen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionsWhenChosen, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

- (void)offerResetURL
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_0(v0);
  OUTLINED_FUNCTION_0_3(&dword_1CDEBD000, v2, v3, "Expected String for offerResetURL got %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_2();
}

@end
