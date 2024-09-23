@implementation WLKAppProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (WLKAppProxy)initWithDictionary:(id)a3
{
  id v4;
  WLKAppProxy *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *version;
  uint64_t v10;
  NSString *subscriptionInfo;
  uint64_t v12;
  NSNumber *itemID;
  WLKAppProxy *v14;
  objc_super v16;

  v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)WLKAppProxy;
    v5 = -[WLKAppProxy init](&v16, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("WLKAppProxy.bundleIdentifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v6;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("WLKAppProxy.version"));
      v8 = objc_claimAutoreleasedReturnValue();
      version = v5->_version;
      v5->_version = (NSString *)v8;

      v5->_isEntitled = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("WLKAppProxy.isEntitled"), 0);
      v5->_isBetaApp = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("WLKAppProxy.isBeta"), 0);
      v5->_isAppStoreVendable = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("WLKAppProxy.isAppStoreVendable"), 0);
      v5->_isSystemApp = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("WLKAppProxy.isSystem"), 0);
      v5->_supportsTVApp = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", CFSTR("WLKAppProxy.supportsTVApp"), 0);
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("WLKAppProxy.subscriptionInfo"));
      v10 = objc_claimAutoreleasedReturnValue();
      subscriptionInfo = v5->_subscriptionInfo;
      v5->_subscriptionInfo = (NSString *)v10;

      objc_msgSend(v4, "wlk_numberForKey:", CFSTR("WLKAppProxy.itemID"));
      v12 = objc_claimAutoreleasedReturnValue();
      itemID = v5->_itemID;
      v5->_itemID = (NSNumber *)v12;

    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (BOOL)isTVApp
{
  void *v2;
  void *v3;
  char v4;

  -[WLKAppProxy bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WLKTVAppBundleID();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "isEqualToString:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isAppStoreVendable
{
  return self->_isAppStoreVendable;
}

- (BOOL)isSystemApp
{
  return self->_isSystemApp;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("WLKAppProxy.bundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_version, CFSTR("WLKAppProxy.version"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isEntitled, CFSTR("WLKAppProxy.isEntitled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBetaApp, CFSTR("WLKAppProxy.isBeta"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isAppStoreVendable, CFSTR("WLKAppProxy.isAppStoreVendable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSystemApp, CFSTR("WLKAppProxy.isSystem"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsTVApp, CFSTR("WLKAppProxy.supportsTVApp"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subscriptionInfo, CFSTR("WLKAppProxy.subscriptionInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemID, CFSTR("WLKAppProxy.itemID"));

}

- (WLKAppProxy)initWithCoder:(id)a3
{
  id v4;
  WLKAppProxy *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *version;
  uint64_t v10;
  NSString *subscriptionInfo;
  uint64_t v12;
  NSNumber *itemID;
  WLKAppProxy *v14;
  objc_super v16;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)WLKAppProxy;
    v5 = -[WLKAppProxy init](&v16, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKAppProxy.bundleIdentifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKAppProxy.version"));
      v8 = objc_claimAutoreleasedReturnValue();
      version = v5->_version;
      v5->_version = (NSString *)v8;

      v5->_isEntitled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKAppProxy.isEntitled"));
      v5->_isBetaApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKAppProxy.isBeta"));
      v5->_isAppStoreVendable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKAppProxy.isAppStoreVendable"));
      v5->_isSystemApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKAppProxy.isSystem"));
      v5->_supportsTVApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKAppProxy.supportsTVApp"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKAppProxy.subscriptionInfo"));
      v10 = objc_claimAutoreleasedReturnValue();
      subscriptionInfo = v5->_subscriptionInfo;
      v5->_subscriptionInfo = (NSString *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKAppProxy.itemID"));
      v12 = objc_claimAutoreleasedReturnValue();
      itemID = v5->_itemID;
      v5->_itemID = (NSNumber *)v12;

    }
    self = v5;
    v14 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleIdentifier, CFSTR("WLKAppProxy.bundleIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_version, CFSTR("WLKAppProxy.version"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEntitled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("WLKAppProxy.isEntitled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBetaApp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("WLKAppProxy.isBeta"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAppStoreVendable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("WLKAppProxy.isAppStoreVendable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSystemApp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("WLKAppProxy.isSystem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsTVApp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("WLKAppProxy.supportsTVApp"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_subscriptionInfo, CFSTR("WLKAppProxy.subscriptionInfo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemID, CFSTR("WLKAppProxy.itemID"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)WLKAppProxy;
  -[WLKAppProxy description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_bundleIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (BOOL)supportsTVApp
{
  return self->_supportsTVApp;
}

- (NSString)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

@end
