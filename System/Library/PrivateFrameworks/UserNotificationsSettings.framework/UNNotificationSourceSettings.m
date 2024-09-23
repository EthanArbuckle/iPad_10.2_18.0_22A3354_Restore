@implementation UNNotificationSourceSettings

- (UNNotificationSourceSettings)initWithNotificationSettings:(id)a3 topicSettings:(id)a4 muteAssertion:(id)a5 isRestricted:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  UNNotificationSourceSettings *v13;
  uint64_t v14;
  UNNotificationSettings *notificationSettings;
  uint64_t v16;
  NSArray *topicSettings;
  uint64_t v18;
  UNNotificationMuteAssertion *muteAssertion;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UNNotificationSourceSettings;
  v13 = -[UNNotificationSourceSettings init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    notificationSettings = v13->_notificationSettings;
    v13->_notificationSettings = (UNNotificationSettings *)v14;

    v16 = objc_msgSend(v11, "copy");
    topicSettings = v13->_topicSettings;
    v13->_topicSettings = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    muteAssertion = v13->_muteAssertion;
    v13->_muteAssertion = (UNNotificationMuteAssertion *)v18;

    v13->_isRestricted = a6;
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[UNNotificationSourceSettings notificationSettings](self, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSourceSettings topicSettings](self, "topicSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSourceSettings muteAssertion](self, "muteAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UNNotificationSourceSettings isRestricted](self, "isRestricted");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; notification settings: %@ topic settings: %@, mute assertion: %@, isRestricted: %@"),
    v4,
    self,
    v5,
    v6,
    v7,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UNNotificationSourceSettings notificationSettings](self, "notificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("notificationSettings"));

  -[UNNotificationSourceSettings topicSettings](self, "topicSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("topicSettings"));

  -[UNNotificationSourceSettings muteAssertion](self, "muteAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("muteAssertion"));

  objc_msgSend(v7, "encodeBool:forKey:", -[UNNotificationSourceSettings isRestricted](self, "isRestricted"), CFSTR("restricted"));
}

- (UNNotificationSourceSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UNNotificationSourceSettings *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("topicSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("muteAssertion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restricted"));

  v12 = -[UNNotificationSourceSettings initWithNotificationSettings:topicSettings:muteAssertion:isRestricted:](self, "initWithNotificationSettings:topicSettings:muteAssertion:isRestricted:", v5, v9, v10, v11);
  return v12;
}

- (UNNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (NSArray)topicSettings
{
  return self->_topicSettings;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (UNNotificationMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_topicSettings, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
}

@end
