@implementation VSJSSubscription

- (VSJSSubscription)init
{
  void *v3;
  VSJSSubscription *v4;
  NSString *bundleId;
  uint64_t v6;
  NSDate *expirationDate;
  NSString *billingIdentifier;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BE51928], "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)VSJSSubscription;
  v4 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, v3);

  if (v4)
  {
    bundleId = v4->_bundleId;
    v4->_bundleId = (NSString *)&stru_24FE1B848;

    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v4->_expirationDate;
    v4->_expirationDate = (NSDate *)v6;

    v4->_accessLevel = 0;
    billingIdentifier = v4->_billingIdentifier;
    v4->_billingIdentifier = (NSString *)&stru_24FE1B848;

  }
  return v4;
}

- (id)toVSSubscription
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDF8C90]);
  v4 = objc_alloc_init(MEMORY[0x24BDF8CA0]);
  objc_msgSend(v4, "setValue:forKey:", &unk_24FE3CE50, CFSTR("kind"));
  -[VSJSSubscription bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v3, "setSource:", v4);
  objc_msgSend(v3, "setAccessLevel:", -[VSJSSubscription accessLevel](self, "accessLevel"));
  -[VSJSSubscription tierIdentifiers](self, "tierIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "setTierIdentifiers:", v7);

  -[VSJSSubscription billingIdentifier](self, "billingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v3, "setBillingIdentifier:", v9);

  return v3;
}

+ (id)toVSSubscriptions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "toVSSubscription", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "accessLevel"))
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSJSSubscription *v4;
  void *v5;
  VSJSSubscription *v6;
  uint64_t v7;
  NSString *bundleId;
  uint64_t v9;
  NSArray *tierIdentifiers;
  uint64_t v11;
  NSString *billingIdentifier;

  v4 = +[VSJSSubscription allocWithZone:](VSJSSubscription, "allocWithZone:", a3);
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  v7 = -[NSString copy](self->_bundleId, "copy");
  bundleId = v6->_bundleId;
  v6->_bundleId = (NSString *)v7;

  v6->_accessLevel = self->_accessLevel;
  v9 = -[NSArray copy](self->_tierIdentifiers, "copy");
  tierIdentifiers = v6->_tierIdentifiers;
  v6->_tierIdentifiers = (NSArray *)v9;

  v11 = -[NSString copy](self->_billingIdentifier, "copy");
  billingIdentifier = v6->_billingIdentifier;
  v6->_billingIdentifier = (NSString *)v11;

  return v6;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(int64_t)a3
{
  self->_accessLevel = a3;
}

- (NSArray)tierIdentifiers
{
  return self->_tierIdentifiers;
}

- (void)setTierIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)billingIdentifier
{
  return self->_billingIdentifier;
}

- (void)setBillingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_billingIdentifier, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
