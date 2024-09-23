@implementation NCEventTrackerNotificationMetadata

+ (id)metadataForNotificationRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "_initWithNotificationIdentifier:bundleIdentifier:date:", v6, v7, v8);
  return v9;
}

- (id)_initWithNotificationIdentifier:(id)a3 bundleIdentifier:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  NCEventTrackerNotificationMetadata *v11;
  uint64_t v12;
  NSString *notificationIdentifier;
  uint64_t v14;
  NSString *bundleIdentifier;
  uint64_t v16;
  NSDate *date;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NCEventTrackerNotificationMetadata;
  v11 = -[NCEventTrackerNotificationMetadata init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    notificationIdentifier = v11->_notificationIdentifier;
    v11->_notificationIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    date = v11->_date;
    v11->_date = (NSDate *)v16;

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCEventTrackerNotificationMetadata notificationIdentifier](self, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("notification identifier"));

  -[NCEventTrackerNotificationMetadata bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("bundle identifier"));

  -[NCEventTrackerNotificationMetadata date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("date"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCEventTrackerNotificationMetadata notificationIdentifier](self, "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[NCEventTrackerNotificationMetadata bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[NCEventTrackerNotificationMetadata date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NCEventTrackerNotificationMetadata *v4;
  NCEventTrackerNotificationMetadata *v5;
  NCEventTrackerNotificationMetadata *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (NCEventTrackerNotificationMetadata *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (v5 = v4) != 0)
    {
      v6 = v5;
      -[NCEventTrackerNotificationMetadata notificationIdentifier](self, "notificationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCEventTrackerNotificationMetadata notificationIdentifier](v6, "notificationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[NCEventTrackerNotificationMetadata bundleIdentifier](self, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCEventTrackerNotificationMetadata bundleIdentifier](v6, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[NCEventTrackerNotificationMetadata date](self, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCEventTrackerNotificationMetadata date](v6, "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = BSEqualObjects();

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (NSString)notificationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
}

@end
