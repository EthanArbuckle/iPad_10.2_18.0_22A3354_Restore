@implementation PKDiscoveryEngagementMessageAction

- (PKDiscoveryEngagementMessageAction)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryEngagementMessageAction *v5;
  uint64_t v6;
  NSString *titleKey;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSDictionary *actionInfo;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryEngagementMessageAction;
  v5 = -[PKDiscoveryEngagementMessageAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("titleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("passDetails"), "isEqualToString:", v8) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(CFSTR("openURL"), "isEqualToString:", v8) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(CFSTR("cardNumbers"), "isEqualToString:", v8) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(CFSTR("setDefaultWallet"), "isEqualToString:", v8) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(CFSTR("setDefaultApple"), "isEqualToString:", v8) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(CFSTR("setDefaultWalletAndApple"), "isEqualToString:", v8))
    {
      v9 = 6;
    }
    else
    {
      v9 = 0;
    }

    v5->_type = v9;
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("actionInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v10;

  }
  return v5;
}

- (void)localizeWithBundle:(id)a3
{
  NSString *v4;
  NSString *localizedTitle;

  objc_msgSend(a3, "localizedStringForKey:value:table:", self->_titleKey, &stru_1E2ADF4C0, CFSTR("localizable"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryEngagementMessageAction)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryEngagementMessageAction *v5;
  uint64_t v6;
  NSString *titleKey;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *actionInfo;
  uint64_t v13;
  NSString *localizedTitle;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryEngagementMessageAction;
  v5 = -[PKDiscoveryEngagementMessageAction init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("actionInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *titleKey;
  id v5;

  titleKey = self->_titleKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", titleKey, CFSTR("titleKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionInfo, CFSTR("actionInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDiscoveryEngagementMessageAction *v5;
  uint64_t v6;
  NSString *titleKey;
  uint64_t v8;
  NSDictionary *actionInfo;
  uint64_t v10;
  NSString *localizedTitle;

  v5 = -[PKDiscoveryEngagementMessageAction init](+[PKDiscoveryEngagementMessageAction allocWithZone:](PKDiscoveryEngagementMessageAction, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_titleKey, "copyWithZone:", a3);
  titleKey = v5->_titleKey;
  v5->_titleKey = (NSString *)v6;

  v5->_type = self->_type;
  v8 = -[NSDictionary copyWithZone:](self->_actionInfo, "copyWithZone:", a3);
  actionInfo = v5->_actionInfo;
  v5->_actionInfo = (NSDictionary *)v8;

  v10 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *titleKey;
  NSString *v6;
  NSDictionary *actionInfo;
  NSDictionary *v8;
  NSString *localizedTitle;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  titleKey = self->_titleKey;
  v6 = (NSString *)v4[1];
  if (titleKey && v6)
  {
    if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (titleKey != v6)
  {
    goto LABEL_15;
  }
  if (self->_type != v4[2])
    goto LABEL_15;
  actionInfo = self->_actionInfo;
  v8 = (NSDictionary *)v4[3];
  if (!actionInfo || !v8)
  {
    if (actionInfo == v8)
      goto LABEL_11;
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  if ((-[NSDictionary isEqual:](actionInfo, "isEqual:") & 1) == 0)
    goto LABEL_15;
LABEL_11:
  localizedTitle = self->_localizedTitle;
  v10 = (NSString *)v4[4];
  if (localizedTitle && v10)
    v11 = -[NSString isEqual:](localizedTitle, "isEqual:");
  else
    v11 = localizedTitle == v10;
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_titleKey);
  objc_msgSend(v3, "safelyAddObject:", self->_actionInfo);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitle);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("titleKey: '%@'; "), self->_titleKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%ld'; "), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("actionInfo: '%@'; "), self->_actionInfo);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_localizedTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_storeStrong((id *)&self->_titleKey, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)actionInfo
{
  return self->_actionInfo;
}

- (void)setActionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_actionInfo, a3);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
}

@end
