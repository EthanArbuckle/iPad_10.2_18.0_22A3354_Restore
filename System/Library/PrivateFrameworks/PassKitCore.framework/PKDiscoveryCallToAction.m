@implementation PKDiscoveryCallToAction

- (PKDiscoveryCallToAction)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryCallToAction *v5;
  uint64_t v6;
  NSString *titleKey;
  uint64_t v8;
  NSString *subtitleKey;
  uint64_t v10;
  NSString *buttonTextKey;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *actionInfo;
  void *v16;
  PKDiscoveryMedia *v17;
  PKDiscoveryMedia *icon;
  void *v19;
  PKDiscoveryMedia *v20;
  PKDiscoveryMedia *wordmarkAsset;
  uint64_t v22;
  PKColor *backgroundColor;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDiscoveryCallToAction;
  v5 = -[PKDiscoveryCallToAction init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("titleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("subtitleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitleKey = v5->_subtitleKey;
    v5->_subtitleKey = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("buttonTextKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    buttonTextKey = v5->_buttonTextKey;
    v5->_buttonTextKey = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("action"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("transitDCI"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(CFSTR("featureApply"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(CFSTR("addCard"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(CFSTR("settingsExpressTransit"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(CFSTR("appleCashSetup"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 6;
    }
    else if ((objc_msgSend(CFSTR("appleCashFamilySetup"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 5;
    }
    else if ((objc_msgSend(CFSTR("accountUserCreateInvitation"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 7;
    }
    else if ((objc_msgSend(CFSTR("appLink"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 8;
    }
    else if ((objc_msgSend(CFSTR("provisionProduct"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 11;
    }
    else if ((objc_msgSend(CFSTR("featureApplyStandalone"), "isEqualToString:", v12) & 1) != 0)
    {
      v13 = 9;
    }
    else if (objc_msgSend(CFSTR("hideMyEmail"), "isEqualToString:", v12))
    {
      v13 = 10;
    }
    else
    {
      v13 = 0;
    }

    v5->_action = v13;
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("actionInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v14;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("icon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = -[PKDiscoveryMedia initWithDictionary:]([PKDiscoveryMedia alloc], "initWithDictionary:", v16);
      icon = v5->_icon;
      v5->_icon = v17;

      v5->_roundIcon = objc_msgSend(v4, "PKBoolForKey:", CFSTR("shouldRoundIcon"));
    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("wordmarkAsset"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = -[PKDiscoveryMedia initWithDictionary:]([PKDiscoveryMedia alloc], "initWithDictionary:", v19);
      wordmarkAsset = v5->_wordmarkAsset;
      v5->_wordmarkAsset = v20;

    }
    objc_msgSend(v4, "PKColorForKey:", CFSTR("backgroundColor"));
    v22 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v22;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("foregroundContentMode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v5->_foregroundContentModeIsSet = 1;
      v5->_foregroundContentMode = PKDiscoveryCardForegroundContentModeFromString(v24);
    }

  }
  return v5;
}

- (void)setForegroundContentMode:(int64_t)a3
{
  if (!self->_foregroundContentModeIsSet)
    self->_foregroundContentMode = a3;
}

- (void)setItem:(id)a3
{
  PKDiscoveryItem **p_item;
  id v5;
  NSString *v6;
  NSString *itemIdentifier;

  p_item = &self->_item;
  v5 = a3;
  objc_storeWeak((id *)p_item, v5);
  objc_msgSend(v5, "identifier");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  itemIdentifier = self->_itemIdentifier;
  self->_itemIdentifier = v6;

}

- (void)localizeWithBundle:(id)a3
{
  -[PKDiscoveryCallToAction localizeWithBundle:table:](self, "localizeWithBundle:table:", a3, CFSTR("localizable"));
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  id v6;
  NSString *titleKey;
  NSString *v8;
  NSString *localizedTitle;
  NSString *subtitleKey;
  NSString *v11;
  NSString *localizedSubtitle;
  NSString *buttonTextKey;
  NSString *v14;
  NSString *localizedButtonText;
  id v16;

  v16 = a3;
  v6 = a4;
  titleKey = self->_titleKey;
  if (titleKey)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", titleKey, &stru_1E2ADF4C0, v6);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedTitle = self->_localizedTitle;
    self->_localizedTitle = v8;

  }
  subtitleKey = self->_subtitleKey;
  if (subtitleKey)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", subtitleKey, &stru_1E2ADF4C0, v6);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedSubtitle = self->_localizedSubtitle;
    self->_localizedSubtitle = v11;

  }
  buttonTextKey = self->_buttonTextKey;
  if (buttonTextKey)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", buttonTextKey, &stru_1E2ADF4C0, v6);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedButtonText = self->_localizedButtonText;
    self->_localizedButtonText = v14;

  }
}

- (NSString)referrerIdentifier
{
  NSDictionary *referrerIdentifier;
  NSString *v4;
  NSString *v5;

  referrerIdentifier = (NSDictionary *)self->_referrerIdentifier;
  if (!referrerIdentifier)
  {
    referrerIdentifier = self->_actionInfo;
    if (referrerIdentifier)
    {
      -[NSDictionary objectForKeyedSubscript:](referrerIdentifier, "objectForKeyedSubscript:", CFSTR("referrerIdentifier"));
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_referrerIdentifier;
      self->_referrerIdentifier = v4;

      referrerIdentifier = (NSDictionary *)self->_referrerIdentifier;
    }
  }
  return (NSString *)referrerIdentifier;
}

- (int64_t)paymentSetupMode
{
  int64_t action;

  action = self->_action;
  switch(action)
  {
    case 11:
      return 3;
    case 2:
      return 4;
    case 1:
      return 3;
  }
  return 0;
}

- (NSArray)paymentNetworks
{
  NSDictionary *actionInfo;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *paymentNetworks;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  actionInfo = self->_actionInfo;
  if (actionInfo && !self->_paymentNetworks)
  {
    -[NSDictionary PKArrayForKey:](actionInfo, "PKArrayForKey:", CFSTR("paymentCredentials"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          v12 = v9;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v6);
            PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "integerValue", (_QWORD)v16));
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
              objc_msgSend(v5, "addObject:", v9);
            ++v11;
            v12 = v9;
          }
          while (v8 != v11);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);

      }
      v13 = (NSArray *)objc_msgSend(v5, "copy");
      paymentNetworks = self->_paymentNetworks;
      self->_paymentNetworks = v13;

    }
  }
  return self->_paymentNetworks;
}

- (NSSet)allowedFeatureIdentifiers
{
  void *allowedFeatureIdentifiers;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
  if (!allowedFeatureIdentifiers)
  {
    allowedFeatureIdentifiers = self->_actionInfo;
    if (allowedFeatureIdentifiers)
    {
      objc_msgSend(allowedFeatureIdentifiers, "objectForKeyedSubscript:", CFSTR("featureIdentifier"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (PKFeatureIdentifierFromString(v4))
      {
        v5 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, 0);
        v6 = self->_allowedFeatureIdentifiers;
        self->_allowedFeatureIdentifiers = v5;

      }
      allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
    }
  }
  return (NSSet *)allowedFeatureIdentifiers;
}

- (NSSet)transitNetworkIdentifiers
{
  void *transitNetworkIdentifiers;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  transitNetworkIdentifiers = self->_transitNetworkIdentifiers;
  if (!transitNetworkIdentifiers)
  {
    transitNetworkIdentifiers = self->_actionInfo;
    if (transitNetworkIdentifiers)
    {
      objc_msgSend(transitNetworkIdentifiers, "PKArrayForKey:", CFSTR("transitNetworkIdentifiers"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        v5 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
        v6 = self->_transitNetworkIdentifiers;
        self->_transitNetworkIdentifiers = v5;

      }
      transitNetworkIdentifiers = self->_transitNetworkIdentifiers;
    }
  }
  return (NSSet *)transitNetworkIdentifiers;
}

- (NSSet)productIdentifiers
{
  void *productIdentifiers;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  productIdentifiers = self->_productIdentifiers;
  if (!productIdentifiers)
  {
    productIdentifiers = self->_actionInfo;
    if (productIdentifiers)
    {
      objc_msgSend(productIdentifiers, "PKArrayForKey:", CFSTR("productIdentifiers"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        v5 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
        v6 = self->_productIdentifiers;
        self->_productIdentifiers = v5;

      }
      productIdentifiers = self->_productIdentifiers;
    }
  }
  return (NSSet *)productIdentifiers;
}

- (NSNumber)appStoreAppIdentifier
{
  void *appStoreAppIdentifier;
  NSNumber *v4;
  NSNumber *v5;

  appStoreAppIdentifier = self->_appStoreAppIdentifier;
  if (!appStoreAppIdentifier)
  {
    appStoreAppIdentifier = self->_actionInfo;
    if (appStoreAppIdentifier)
    {
      objc_msgSend(appStoreAppIdentifier, "PKNumberForKey:", CFSTR("appStoreAppIdentifier"));
      v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v5 = self->_appStoreAppIdentifier;
      self->_appStoreAppIdentifier = v4;

      appStoreAppIdentifier = self->_appStoreAppIdentifier;
    }
  }
  return (NSNumber *)appStoreAppIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSString *titleKey;
  NSString *v6;
  NSString *subtitleKey;
  NSString *v8;
  NSDictionary *actionInfo;
  NSDictionary *v10;
  PKDiscoveryMedia *icon;
  PKDiscoveryMedia *v12;
  PKDiscoveryMedia *wordmarkAsset;
  PKDiscoveryMedia *v14;
  NSString *localizedTitle;
  NSString *v16;
  NSString *localizedSubtitle;
  NSString *v18;
  NSString *localizedButtonText;
  NSString *v20;
  char v21;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_43;
  titleKey = self->_titleKey;
  v6 = (NSString *)*((_QWORD *)v4 + 8);
  if (titleKey && v6)
  {
    if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0)
      goto LABEL_43;
  }
  else if (titleKey != v6)
  {
    goto LABEL_43;
  }
  subtitleKey = self->_subtitleKey;
  v8 = (NSString *)*((_QWORD *)v4 + 9);
  if (subtitleKey && v8)
  {
    if ((-[NSString isEqual:](subtitleKey, "isEqual:") & 1) == 0)
      goto LABEL_43;
  }
  else if (subtitleKey != v8)
  {
    goto LABEL_43;
  }
  if (self->_action != *((_QWORD *)v4 + 11))
    goto LABEL_43;
  actionInfo = self->_actionInfo;
  v10 = (NSDictionary *)*((_QWORD *)v4 + 12);
  if (actionInfo && v10)
  {
    if ((-[NSDictionary isEqual:](actionInfo, "isEqual:") & 1) == 0)
      goto LABEL_43;
  }
  else if (actionInfo != v10)
  {
    goto LABEL_43;
  }
  icon = self->_icon;
  v12 = (PKDiscoveryMedia *)*((_QWORD *)v4 + 13);
  if (icon && v12)
  {
    if (!-[PKDiscoveryMedia isEqual:](icon, "isEqual:"))
      goto LABEL_43;
  }
  else if (icon != v12)
  {
    goto LABEL_43;
  }
  if (self->_roundIcon != v4[57])
    goto LABEL_43;
  wordmarkAsset = self->_wordmarkAsset;
  v14 = (PKDiscoveryMedia *)*((_QWORD *)v4 + 14);
  if (wordmarkAsset && v14)
  {
    if (!-[PKDiscoveryMedia isEqual:](wordmarkAsset, "isEqual:"))
      goto LABEL_43;
  }
  else if (wordmarkAsset != v14)
  {
    goto LABEL_43;
  }
  if (!CGColorEqualToColor(-[PKColor CGColor](self->_backgroundColor, "CGColor"), (CGColorRef)objc_msgSend(*((id *)v4 + 15), "CGColor"))|| self->_foregroundContentMode != *((_QWORD *)v4 + 16))
  {
    goto LABEL_43;
  }
  localizedTitle = self->_localizedTitle;
  v16 = (NSString *)*((_QWORD *)v4 + 17);
  if (localizedTitle && v16)
  {
    if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0)
      goto LABEL_43;
  }
  else if (localizedTitle != v16)
  {
    goto LABEL_43;
  }
  localizedSubtitle = self->_localizedSubtitle;
  v18 = (NSString *)*((_QWORD *)v4 + 18);
  if (!localizedSubtitle || !v18)
  {
    if (localizedSubtitle == v18)
      goto LABEL_39;
LABEL_43:
    v21 = 0;
    goto LABEL_44;
  }
  if ((-[NSString isEqual:](localizedSubtitle, "isEqual:") & 1) == 0)
    goto LABEL_43;
LABEL_39:
  localizedButtonText = self->_localizedButtonText;
  v20 = (NSString *)*((_QWORD *)v4 + 19);
  if (localizedButtonText && v20)
    v21 = -[NSString isEqual:](localizedButtonText, "isEqual:");
  else
    v21 = localizedButtonText == v20;
LABEL_44:

  return v21;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_titleKey);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitleKey);
  objc_msgSend(v3, "safelyAddObject:", self->_buttonTextKey);
  objc_msgSend(v3, "safelyAddObject:", self->_actionInfo);
  objc_msgSend(v3, "safelyAddObject:", self->_icon);
  objc_msgSend(v3, "safelyAddObject:", self->_wordmarkAsset);
  objc_msgSend(v3, "safelyAddObject:", self->_backgroundColor);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedSubtitle);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedButtonText);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_action - v4 + 32 * v4;
  v6 = self->_roundIcon - v5 + 32 * v5;
  v7 = self->_foregroundContentMode - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("titleKey"), self->_titleKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("subtitleKey"), self->_subtitleKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("buttonTextKey"), self->_buttonTextKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("action"), self->_action);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("actionInfo"), self->_actionInfo);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("icon"), self->_icon);
  if (self->_roundIcon)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("shouldRoundIcon"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("wordmarkAsset"), self->_wordmarkAsset);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("backgroundColor"), self->_backgroundColor);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("foregroundContentMode"), self->_foregroundContentMode);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedTitle"), self->_localizedTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedSubtitle"), self->_localizedSubtitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedButtonText"), self->_localizedButtonText);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("itemIdentifier"), self->_itemIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *titleKey;
  id v5;

  titleKey = self->_titleKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", titleKey, CFSTR("titleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleKey, CFSTR("subtitleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buttonTextKey, CFSTR("buttonTextKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionInfo, CFSTR("actionInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_roundIcon, CFSTR("shouldRoundIcon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wordmarkAsset, CFSTR("wordmarkAsset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_foregroundContentMode, CFSTR("foregroundContentMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedSubtitle, CFSTR("localizedSubtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedButtonText, CFSTR("localizedButtonText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("itemIdentifier"));

}

- (PKDiscoveryCallToAction)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryCallToAction *v5;
  uint64_t v6;
  NSString *titleKey;
  uint64_t v8;
  NSString *subtitleKey;
  uint64_t v10;
  NSString *buttonTextKey;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *actionInfo;
  uint64_t v19;
  PKDiscoveryMedia *icon;
  uint64_t v21;
  PKColor *backgroundColor;
  uint64_t v23;
  NSString *localizedTitle;
  uint64_t v25;
  NSString *localizedSubtitle;
  uint64_t v27;
  NSString *localizedButtonText;
  uint64_t v29;
  NSString *itemIdentifier;
  uint64_t v31;
  PKDiscoveryMedia *wordmarkAsset;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKDiscoveryCallToAction;
  v5 = -[PKDiscoveryCallToAction init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitleKey = v5->_subtitleKey;
    v5->_subtitleKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonTextKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    buttonTextKey = v5->_buttonTextKey;
    v5->_buttonTextKey = (NSString *)v10;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v12, "initWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("actionInfo"));
    v17 = objc_claimAutoreleasedReturnValue();
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v19 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (PKDiscoveryMedia *)v19;

    v5->_roundIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRoundIcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v21 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v21;

    v5->_foregroundContentMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("foregroundContentMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v23 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitle"));
    v25 = objc_claimAutoreleasedReturnValue();
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedButtonText"));
    v27 = objc_claimAutoreleasedReturnValue();
    localizedButtonText = v5->_localizedButtonText;
    v5->_localizedButtonText = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wordmarkAsset"));
    v31 = objc_claimAutoreleasedReturnValue();
    wordmarkAsset = v5->_wordmarkAsset;
    v5->_wordmarkAsset = (PKDiscoveryMedia *)v31;

  }
  return v5;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (NSString)buttonTextKey
{
  return self->_buttonTextKey;
}

- (int64_t)action
{
  return self->_action;
}

- (NSDictionary)actionInfo
{
  return self->_actionInfo;
}

- (PKDiscoveryMedia)icon
{
  return self->_icon;
}

- (BOOL)shouldRoundIcon
{
  return self->_roundIcon;
}

- (void)setRoundIcon:(BOOL)a3
{
  self->_roundIcon = a3;
}

- (PKDiscoveryMedia)wordmarkAsset
{
  return self->_wordmarkAsset;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)foregroundContentMode
{
  return self->_foregroundContentMode;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSubtitle, a3);
}

- (NSString)localizedButtonText
{
  return self->_localizedButtonText;
}

- (void)setLocalizedButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_localizedButtonText, a3);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (PKDiscoveryItem)item
{
  return (PKDiscoveryItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedButtonText, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_wordmarkAsset, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
  objc_storeStrong((id *)&self->_buttonTextKey, 0);
  objc_storeStrong((id *)&self->_subtitleKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_appStoreAppIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifiers, 0);
  objc_storeStrong((id *)&self->_transitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedFeatureIdentifiers, 0);
  objc_storeStrong((id *)&self->_paymentNetworks, 0);
}

@end
