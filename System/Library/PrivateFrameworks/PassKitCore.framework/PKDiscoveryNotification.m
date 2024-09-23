@implementation PKDiscoveryNotification

- (PKDiscoveryNotification)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryNotification *v5;
  PKDiscoveryNotification *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *titleKey;
  uint64_t v10;
  NSString *messageKey;
  uint64_t v12;
  NSString *actionTitleKey;
  uint64_t v14;
  NSDictionary *actionInfo;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PKDiscoveryNotification *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  PKDiscoveryNotification *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDiscoveryNotification;
  v5 = -[PKDiscoveryObject initWithDictionary:](&v27, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("action"));
  v6 = (PKDiscoveryNotification *)(id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("none"), "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(CFSTR("pass"), "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(CFSTR("passDetails"), "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(CFSTR("openURL"), "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 4;
  }
  else
  {
    if ((objc_msgSend(CFSTR("discoveryCard"), "isEqualToString:", v6) & 1) == 0)
    {

      v5->_actionType = 0;
      PKLogFacilityTypeGetObject(0x10uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v26;
      v30 = 2112;
      v31 = v6;
      v22 = v26;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "%@: Unknown action type in initWithDictionary: %@", buf, 0x16u);
LABEL_19:

LABEL_20:
      v21 = 0;
      goto LABEL_21;
    }
    v7 = 5;
  }

  v5->_actionType = v7;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("titleKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  titleKey = v5->_titleKey;
  v5->_titleKey = (NSString *)v8;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("messageKey"));
  v10 = objc_claimAutoreleasedReturnValue();
  messageKey = v5->_messageKey;
  v5->_messageKey = (NSString *)v10;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("actionTitleKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  actionTitleKey = v5->_actionTitleKey;
  v5->_actionTitleKey = (NSString *)v12;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("actionInfo"));
  v14 = objc_claimAutoreleasedReturnValue();
  actionInfo = v5->_actionInfo;
  v5->_actionInfo = (NSDictionary *)v14;

  -[PKDiscoveryObject relevantDateRange](v5, "relevantDateRange");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16
    || (-[NSObject startDate](v16, "startDate"), (v18 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v19 = (void *)v18,
        -[NSObject endDate](v17, "endDate"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v5;
      v24 = v23;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "%@: Invalid PKDiscoveryNotification doesn't have relevant date range: %@", buf, 0x16u);

    }
    goto LABEL_19;
  }

LABEL_16:
  v21 = v5;
LABEL_21:

  return v21;
}

- (int64_t)passQualifier
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary PKStringForKey:](self->_actionInfo, "PKStringForKey:", CFSTR("passQualifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = PKDiscoveryPassQualifierFromString(v2);
  else
    v4 = -1;

  return v4;
}

- (NSURL)url
{
  return (NSURL *)-[NSDictionary PKURLForKey:](self->_actionInfo, "PKURLForKey:", CFSTR("url"));
}

- (NSString)discoveryCardIdentifier
{
  return (NSString *)-[NSDictionary PKStringForKey:](self->_actionInfo, "PKStringForKey:", CFSTR("discoveryCardIdentifier"));
}

- (void)localizeWithBundle:(id)a3
{
  NSString *titleKey;
  id v5;
  NSString *v6;
  NSString *localizedTitle;
  NSString *v8;
  NSString *localizedMessage;
  NSString *v10;
  NSString *localizedActionTitle;

  titleKey = self->_titleKey;
  v5 = a3;
  objc_msgSend(v5, "localizedStringForKey:value:table:", titleKey, &stru_1E2ADF4C0, CFSTR("localizable"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v6;

  objc_msgSend(v5, "localizedStringForKey:value:table:", self->_messageKey, &stru_1E2ADF4C0, CFSTR("localizable"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedMessage = self->_localizedMessage;
  self->_localizedMessage = v8;

  objc_msgSend(v5, "localizedStringForKey:value:table:", self->_actionTitleKey, &stru_1E2ADF4C0, CFSTR("localizable"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  localizedActionTitle = self->_localizedActionTitle;
  self->_localizedActionTitle = v10;

}

- (void)updateWithNotification:(id)a3
{
  id v4;
  NSString *v5;
  NSString *titleKey;
  NSString *v7;
  NSString *messageKey;
  NSString *v9;
  NSString *actionTitleKey;
  void *v11;
  NSDictionary *v12;
  NSDictionary *actionInfo;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSDate *scheduledDeliveryDate;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  PKDiscoveryNotification *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKDiscoveryNotification;
  if (-[PKDiscoveryObject updateWithDiscoveryObject:](&v23, sel_updateWithDiscoveryObject_, v4))
  {
    self->_actionType = objc_msgSend(v4, "actionType");
    objc_msgSend(v4, "titleKey");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    titleKey = self->_titleKey;
    self->_titleKey = v5;

    objc_msgSend(v4, "messageKey");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    messageKey = self->_messageKey;
    self->_messageKey = v7;

    objc_msgSend(v4, "actionTitleKey");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    actionTitleKey = self->_actionTitleKey;
    self->_actionTitleKey = v9;

    objc_msgSend(v4, "actionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSDictionary *)objc_msgSend(v11, "copy");
    actionInfo = self->_actionInfo;
    self->_actionInfo = v12;

    -[PKDiscoveryObject relevantDateRange](self, "relevantDateRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14
      || (objc_msgSend(v14, "startDate"), (v16 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v17 = (void *)v16,
          objc_msgSend(v15, "endDate"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          !v18))
    {
      PKLogFacilityTypeGetObject(0x10uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v25 = v20;
        v26 = 2112;
        v27 = self;
        v21 = v20;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "%@: Invalid PKDiscoveryNotification doesn't have relevant date range: %@", buf, 0x16u);

      }
    }
    if (!self->_delivered && self->_scheduledDeliveryDate && (objc_msgSend(v15, "isValidForTime:") & 1) == 0)
    {
      scheduledDeliveryDate = self->_scheduledDeliveryDate;
      self->_scheduledDeliveryDate = 0;

    }
  }

}

- (void)scheduleDeliveryForCurrentDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSDate *v13;
  NSDate *scheduledDeliveryDate;
  id v15;

  v4 = a3;
  -[PKDiscoveryObject relevantDateRange](self, "relevantDateRange");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:", v5) == 1)
    v6 = v4;
  else
    v6 = v5;
  v7 = v6;
  objc_msgSend(v15, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v12 = v10 - v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v7, (double)arc4random_uniform(v12));
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();

  scheduledDeliveryDate = self->_scheduledDeliveryDate;
  self->_scheduledDeliveryDate = v13;

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
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Discovery Notification with identifier: %@ is in terminal state and won't be updated based on rule result", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (v3)
    {
      v7 = 2;
    }
    else
    {
      -[PKDiscoveryNotification setScheduledDeliveryDate:](self, "setScheduledDeliveryDate:", 0);
      v7 = 6;
    }
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
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Updating status of Discovery Notification with identifier: %@ from %ld to %ld for result %s", (uint8_t *)&v12, 0x2Au);

    }
    -[PKDiscoveryObject setStatus:](self, "setStatus:", v7);
  }
}

- (BOOL)isEqualForDisplayToNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t actionType;
  NSDictionary *actionInfo;
  void *v10;
  NSString *localizedTitle;
  void *v12;
  NSString *localizedMessage;
  void *v14;
  NSString *localizedActionTitle;
  void *v16;
  BOOL v17;

  v4 = a3;
  -[PKDiscoveryObject identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = -[PKDiscoveryObject version](self, "version"), v7 == objc_msgSend(v4, "version"))
    && (actionType = self->_actionType, actionType == objc_msgSend(v4, "actionType")))
  {
    actionInfo = self->_actionInfo;
    objc_msgSend(v4, "actionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDictionary isEqualToDictionary:](actionInfo, "isEqualToDictionary:", v10))
    {
      localizedTitle = self->_localizedTitle;
      objc_msgSend(v4, "localizedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](localizedTitle, "isEqualToString:", v12))
      {
        localizedMessage = self->_localizedMessage;
        objc_msgSend(v4, "localizedMessage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](localizedMessage, "isEqualToString:", v14))
        {
          localizedActionTitle = self->_localizedActionTitle;
          objc_msgSend(v4, "localizedActionTitle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[NSString isEqualToString:](localizedActionTitle, "isEqualToString:", v16);

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryNotification)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryNotification *v5;
  uint64_t v6;
  NSString *titleKey;
  uint64_t v8;
  NSString *messageKey;
  uint64_t v10;
  NSString *actionTitleKey;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *actionInfo;
  uint64_t v17;
  NSDate *scheduledDeliveryDate;
  uint64_t v19;
  NSString *localizedTitle;
  uint64_t v21;
  NSString *localizedMessage;
  uint64_t v23;
  NSString *localizedActionTitle;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKDiscoveryNotification;
  v5 = -[PKDiscoveryObject initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_actionType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("action"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    messageKey = v5->_messageKey;
    v5->_messageKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionTitleKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionTitleKey = v5->_actionTitleKey;
    v5->_actionTitleKey = (NSString *)v10;

    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("actionInfo"));
    v15 = objc_claimAutoreleasedReturnValue();
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduledDeliveryDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    scheduledDeliveryDate = v5->_scheduledDeliveryDate;
    v5->_scheduledDeliveryDate = (NSDate *)v17;

    v5->_delivered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("delivered"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v19 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedMessage"));
    v21 = objc_claimAutoreleasedReturnValue();
    localizedMessage = v5->_localizedMessage;
    v5->_localizedMessage = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedActionTitle"));
    v23 = objc_claimAutoreleasedReturnValue();
    localizedActionTitle = v5->_localizedActionTitle;
    v5->_localizedActionTitle = (NSString *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryNotification;
  v4 = a3;
  -[PKDiscoveryObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_actionType, CFSTR("action"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_titleKey, CFSTR("titleKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageKey, CFSTR("messageKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionTitleKey, CFSTR("actionTitleKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionInfo, CFSTR("actionInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scheduledDeliveryDate, CFSTR("delivered"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_delivered, CFSTR("delivered"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedMessage, CFSTR("localizedMessage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedActionTitle, CFSTR("localizedActionTitle"));

}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryNotification;
  -[PKDiscoveryObject description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ "), v4);

  v5 = self->_actionType - 1;
  if (v5 > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC39B8[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("action"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("titleKey"), self->_titleKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("messageKey"), self->_messageKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("actionTitleKey"), self->_actionTitleKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("actionInfo"), self->_actionInfo);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("scheduledDeliveryDate"), self->_scheduledDeliveryDate);
  if (self->_delivered)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("delivered"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedTitle"), self->_localizedTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedMessage"), self->_localizedMessage);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localizedActionTitle"), self->_localizedActionTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSDictionary)actionInfo
{
  return self->_actionInfo;
}

- (void)setActionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_actionInfo, a3);
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (void)setMessageKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)actionTitleKey
{
  return self->_actionTitleKey;
}

- (void)setActionTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (NSString)localizedActionTitle
{
  return self->_localizedActionTitle;
}

- (NSDate)scheduledDeliveryDate
{
  return self->_scheduledDeliveryDate;
}

- (void)setScheduledDeliveryDate:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledDeliveryDate, a3);
}

- (BOOL)isDelivered
{
  return self->_delivered;
}

- (void)setDelivered:(BOOL)a3
{
  self->_delivered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledDeliveryDate, 0);
  objc_storeStrong((id *)&self->_localizedActionTitle, 0);
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_actionTitleKey, 0);
  objc_storeStrong((id *)&self->_messageKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
}

@end
