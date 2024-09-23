@implementation UNNotificationSource

- (UNNotificationSource)initWithIdentifier:(id)a3 isHidden:(BOOL)a4 displayName:(id)a5 icon:(id)a6 settings:(id)a7 bundlePath:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UNNotificationSource *v19;
  uint64_t v20;
  NSString *sourceIdentifier;
  uint64_t v22;
  NSString *displayName;
  uint64_t v24;
  UNNotificationIcon *icon;
  uint64_t v26;
  UNNotificationSourceSettings *sourceSettings;
  uint64_t v28;
  NSString *bundlePath;
  objc_super v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)UNNotificationSource;
  v19 = -[UNNotificationSource init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    sourceIdentifier = v19->_sourceIdentifier;
    v19->_sourceIdentifier = (NSString *)v20;

    v19->_isHiddenFromSettings = a4;
    v22 = objc_msgSend(v15, "copy");
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    icon = v19->_icon;
    v19->_icon = (UNNotificationIcon *)v24;

    v26 = objc_msgSend(v17, "copy");
    sourceSettings = v19->_sourceSettings;
    v19->_sourceSettings = (UNNotificationSourceSettings *)v26;

    v28 = objc_msgSend(v18, "copy");
    bundlePath = v19->_bundlePath;
    v19->_bundlePath = (NSString *)v28;

  }
  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[UNNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UNNotificationSource isHiddenFromSettings](self, "isHiddenFromSettings"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[UNNotificationSource displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSource icon](self, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSource sourceSettings](self, "sourceSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationSource bundlePath](self, "bundlePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@ isHidden: %@, displayName: %@, icon: %@, source settings: %@, bundlePath: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[UNNotificationSource sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSource isHiddenFromSettings](self, "isHiddenFromSettings"), CFSTR("isHidden"));
  -[UNNotificationSource displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[UNNotificationSource icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("icon"));

  -[UNNotificationSource sourceSettings](self, "sourceSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sourceSettings"));

  -[UNNotificationSource bundlePath](self, "bundlePath");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("bundlePath"));

}

- (UNNotificationSource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UNNotificationSource *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHidden"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[UNNotificationSource initWithIdentifier:isHidden:displayName:icon:settings:bundlePath:](self, "initWithIdentifier:isHidden:displayName:icon:settings:bundlePath:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (BOOL)isHiddenFromSettings
{
  return self->_isHiddenFromSettings;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UNNotificationIcon)icon
{
  return self->_icon;
}

- (UNNotificationSourceSettings)sourceSettings
{
  return self->_sourceSettings;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_sourceSettings, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end
