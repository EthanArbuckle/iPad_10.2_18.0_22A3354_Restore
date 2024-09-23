@implementation PKDiscoveryEngagementMessage

- (PKDiscoveryEngagementMessage)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryEngagementMessage *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *titleKey;
  uint64_t v11;
  NSString *messageKey;
  uint64_t v13;
  NSDictionary *iconURLs;
  void *v15;
  PKDiscoveryEngagementMessageAction *v16;
  PKDiscoveryEngagementMessageAction *action;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryEngagementMessage;
  v5 = -[PKDiscoveryObject initWithDictionary:](&v19, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("promotion")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("feature")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("welcome")) & 1) != 0)
    {
      v7 = 0;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("accountStatus")))
    {
      v7 = 3;
    }
    else
    {
      v7 = 2;
    }

    v5->_type = v7;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("passQualifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_passQualifier = PKDiscoveryPassQualifierFromString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("titleKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("messageKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    messageKey = v5->_messageKey;
    v5->_messageKey = (NSString *)v11;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("iconURLs"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v13;

    v5->_reportIdentifierToAggd = objc_msgSend(v4, "PKBoolForKey:", CFSTR("canReportIdentifier"));
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("action"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = -[PKDiscoveryEngagementMessageAction initWithDictionary:]([PKDiscoveryEngagementMessageAction alloc], "initWithDictionary:", v15);
      action = v5->_action;
      v5->_action = v16;

    }
  }

  return v5;
}

- (void)localizeWithBundle:(id)a3
{
  NSString *titleKey;
  NSString *v5;
  NSString *localizedTitle;
  NSString *v7;
  NSString *localizedMessage;
  id v9;

  titleKey = self->_titleKey;
  v9 = a3;
  objc_msgSend(v9, "localizedStringForKey:value:table:", titleKey, &stru_1E2ADF4C0, CFSTR("localizable"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v5;

  objc_msgSend(v9, "localizedStringForKey:value:table:", self->_messageKey, &stru_1E2ADF4C0, CFSTR("localizable"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedMessage = self->_localizedMessage;
  self->_localizedMessage = v7;

  -[PKDiscoveryEngagementMessageAction localizeWithBundle:](self->_action, "localizeWithBundle:", v9);
}

- (void)updateWithDiscoveryEngagementMessage:(id)a3
{
  id v4;
  NSString *v5;
  NSString *titleKey;
  NSString *v7;
  NSString *messageKey;
  NSDictionary *v9;
  NSDictionary *iconURLs;
  PKDiscoveryEngagementMessageAction *v11;
  PKDiscoveryEngagementMessageAction *action;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryEngagementMessage;
  if (-[PKDiscoveryObject updateWithDiscoveryObject:](&v13, sel_updateWithDiscoveryObject_, v4))
  {
    self->_type = objc_msgSend(v4, "type");
    self->_passQualifier = objc_msgSend(v4, "passQualifier");
    objc_msgSend(v4, "titleKey");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    titleKey = self->_titleKey;
    self->_titleKey = v5;

    objc_msgSend(v4, "messageKey");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    messageKey = self->_messageKey;
    self->_messageKey = v7;

    objc_msgSend(v4, "iconURLs");
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    iconURLs = self->_iconURLs;
    self->_iconURLs = v9;

    objc_msgSend(v4, "action");
    v11 = (PKDiscoveryEngagementMessageAction *)objc_claimAutoreleasedReturnValue();
    action = self->_action;
    self->_action = v11;

    self->_reportIdentifierToAggd = objc_msgSend(v4, "canReportIdentifierToAggd");
  }

}

- (void)updateForRuleResult:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  const char *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (-[PKDiscoveryObject isTerminalStatus](self, "isTerminalStatus"))
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PKDiscoveryObject identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Discovery Message with identifier: %@ is in terminal state and won't be updated based on rule result", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (v3)
      v7 = 2;
    else
      v7 = 6;
    PKLogFacilityTypeGetObject(0x10uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PKDiscoveryObject identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKDiscoveryObject status](self, "status");
      v11 = "NO";
      v12 = 138413058;
      v13 = v9;
      v14 = 2048;
      if (v3)
        v11 = "YES";
      v15 = v10;
      v16 = 2048;
      v17 = v7;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Updating status of Discovery Message with identifier: %@ from %ld to %ld for result %s", (uint8_t *)&v12, 0x2Au);

    }
    -[PKDiscoveryObject setStatus:](self, "setStatus:", v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryEngagementMessage)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryEngagementMessage *v5;
  uint64_t v6;
  NSString *titleKey;
  uint64_t v8;
  NSString *messageKey;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *iconURLs;
  uint64_t v15;
  PKDiscoveryEngagementMessageAction *action;
  uint64_t v17;
  NSString *localizedTitle;
  uint64_t v19;
  NSString *localizedMessage;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDiscoveryEngagementMessage;
  v5 = -[PKDiscoveryObject initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_passQualifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("passQualifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    messageKey = v5->_messageKey;
    v5->_messageKey = (NSString *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("iconURLs"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconURLs = v5->_iconURLs;
    v5->_iconURLs = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v15 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (PKDiscoveryEngagementMessageAction *)v15;

    v5->_reportIdentifierToAggd = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canReportIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v17 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedMessage"));
    v19 = objc_claimAutoreleasedReturnValue();
    localizedMessage = v5->_localizedMessage;
    v5->_localizedMessage = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryEngagementMessage;
  v4 = a3;
  -[PKDiscoveryObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_passQualifier, CFSTR("passQualifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_titleKey, CFSTR("titleKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageKey, CFSTR("messageKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_iconURLs, CFSTR("iconURLs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_reportIdentifierToAggd, CFSTR("canReportIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedMessage, CFSTR("localizedMessage"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryEngagementMessage;
  v5 = -[PKDiscoveryObject copyWithZone:](&v19, sel_copyWithZone_);
  v5[13] = self->_type;
  v5[14] = self->_passQualifier;
  v6 = -[NSString copyWithZone:](self->_titleKey, "copyWithZone:", a3);
  v7 = (void *)v5[15];
  v5[15] = v6;

  v8 = -[NSString copyWithZone:](self->_messageKey, "copyWithZone:", a3);
  v9 = (void *)v5[16];
  v5[16] = v8;

  v10 = -[NSDictionary copyWithZone:](self->_iconURLs, "copyWithZone:", a3);
  v11 = (void *)v5[17];
  v5[17] = v10;

  v12 = -[PKDiscoveryEngagementMessageAction copyWithZone:](self->_action, "copyWithZone:", a3);
  v13 = (void *)v5[18];
  v5[18] = v12;

  *((_BYTE *)v5 + 96) = self->_reportIdentifierToAggd;
  v14 = -[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  v15 = (void *)v5[19];
  v5[19] = v14;

  v16 = -[NSString copyWithZone:](self->_localizedMessage, "copyWithZone:", a3);
  v17 = (void *)v5[20];
  v5[20] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *titleKey;
  NSString *v6;
  BOOL v7;
  NSString *messageKey;
  NSString *v9;
  NSDictionary *iconURLs;
  NSDictionary *v11;
  PKDiscoveryEngagementMessageAction *action;
  PKDiscoveryEngagementMessageAction *v13;
  NSString *localizedTitle;
  NSString *v15;
  NSString *localizedMessage;
  NSString *v17;
  char v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKDiscoveryEngagementMessage;
  if (!-[PKDiscoveryObject isEqual:](&v20, sel_isEqual_, v4))
    goto LABEL_36;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_type != v4[13] || self->_passQualifier != v4[14])
    goto LABEL_36;
  titleKey = self->_titleKey;
  v6 = (NSString *)v4[15];
  if (titleKey)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (titleKey != v6)
      goto LABEL_36;
  }
  else if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_36;
  }
  messageKey = self->_messageKey;
  v9 = (NSString *)v4[16];
  if (messageKey && v9)
  {
    if ((-[NSString isEqual:](messageKey, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (messageKey != v9)
  {
    goto LABEL_36;
  }
  iconURLs = self->_iconURLs;
  v11 = (NSDictionary *)v4[17];
  if (iconURLs && v11)
  {
    if ((-[NSDictionary isEqual:](iconURLs, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (iconURLs != v11)
  {
    goto LABEL_36;
  }
  action = self->_action;
  v13 = (PKDiscoveryEngagementMessageAction *)v4[18];
  if (action && v13)
  {
    if (!-[PKDiscoveryEngagementMessageAction isEqual:](action, "isEqual:"))
      goto LABEL_36;
  }
  else if (action != v13)
  {
    goto LABEL_36;
  }
  if (self->_reportIdentifierToAggd != *((unsigned __int8 *)v4 + 96))
    goto LABEL_36;
  localizedTitle = self->_localizedTitle;
  v15 = (NSString *)v4[19];
  if (!localizedTitle || !v15)
  {
    if (localizedTitle == v15)
      goto LABEL_32;
LABEL_36:
    v18 = 0;
    goto LABEL_37;
  }
  if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0)
    goto LABEL_36;
LABEL_32:
  localizedMessage = self->_localizedMessage;
  v17 = (NSString *)v4[20];
  if (localizedMessage && v17)
    v18 = -[NSString isEqual:](localizedMessage, "isEqual:");
  else
    v18 = localizedMessage == v17;
LABEL_37:

  return v18;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKDiscoveryEngagementMessage;
  v3 = -[PKDiscoveryObject hash](&v10, sel_hash);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelyAddObject:", self->_titleKey);
  objc_msgSend(v4, "safelyAddObject:", self->_messageKey);
  objc_msgSend(v4, "safelyAddObject:", self->_iconURLs);
  objc_msgSend(v4, "safelyAddObject:", self->_action);
  objc_msgSend(v4, "safelyAddObject:", self->_localizedTitle);
  objc_msgSend(v4, "safelyAddObject:", self->_localizedMessage);
  v5 = PKCombinedHash((uint64_t)v3, v4);
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_passQualifier - v6 + 32 * v6;
  v8 = self->_reportIdentifierToAggd - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryEngagementMessage;
  -[PKDiscoveryObject description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ "), v4);

  type = self->_type;
  if (type > 3)
    v6 = CFSTR("unkown");
  else
    v6 = off_1E2AC64B0[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("passQualifier: '%ld'; "), self->_passQualifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("titleKey: '%@'; "), self->_titleKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("messageKey: '%@'; "), self->_messageKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("iconURLs: '%@'; "), self->_iconURLs);
  objc_msgSend(v3, "appendFormat:", CFSTR("action: '%@'; "), self->_action);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_localizedTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("message: '%@'; "), self->_localizedMessage);
  if (self->_reportIdentifierToAggd)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("canReportIdentifier: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)passQualifier
{
  return self->_passQualifier;
}

- (void)setPassQualifier:(int64_t)a3
{
  self->_passQualifier = a3;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_storeStrong((id *)&self->_titleKey, a3);
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (void)setMessageKey:(id)a3
{
  objc_storeStrong((id *)&self->_messageKey, a3);
}

- (NSDictionary)iconURLs
{
  return self->_iconURLs;
}

- (void)setIconURLs:(id)a3
{
  objc_storeStrong((id *)&self->_iconURLs, a3);
}

- (PKDiscoveryEngagementMessageAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (BOOL)canReportIdentifierToAggd
{
  return self->_reportIdentifierToAggd;
}

- (void)setReportIdentifierToAggd:(BOOL)a3
{
  self->_reportIdentifierToAggd = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
}

@end
