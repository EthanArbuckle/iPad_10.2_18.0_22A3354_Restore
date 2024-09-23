@implementation TPSAnalyticsEventNotificationPosted

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventNotificationPosted)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventNotificationPosted *v5;
  uint64_t v6;
  NSNumber *posted;
  uint64_t v8;
  NSString *contentID;
  uint64_t v10;
  NSString *collectionID;
  uint64_t v12;
  NSString *correlationID;
  uint64_t v14;
  NSString *errorCode;
  uint64_t v16;
  NSNumber *remaining;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventNotificationPosted;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seq_num"));
    v6 = objc_claimAutoreleasedReturnValue();
    posted = v5->_posted;
    v5->_posted = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v8 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_ID"));
    v12 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error_code"));
    v14 = objc_claimAutoreleasedReturnValue();
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remaining"));
    v16 = objc_claimAutoreleasedReturnValue();
    remaining = v5->_remaining;
    v5->_remaining = (NSNumber *)v16;

  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 remainingNotificationsCount:(id)a6 errorCode:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAnalyticsEventNotificationPosted *v17;
  TPSAnalyticsEventNotificationPosted *v18;
  _BOOL4 v19;
  id v21;
  objc_super v22;

  v13 = a3;
  v21 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)TPSAnalyticsEventNotificationPosted;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v22, sel_initWithDate_, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentID, a3);
    objc_storeStrong((id *)&v18->_collectionID, a4);
    objc_storeStrong((id *)&v18->_correlationID, a5);
    objc_storeStrong((id *)&v18->_errorCode, a7);
    objc_storeStrong((id *)&v18->_remaining, a6);
    v19 = -[NSString isEqualToString:](v18->_contentID, "isEqualToString:", CFSTR("collection"));
    if (v19)
      LOBYTE(v19) = -[NSString isEqualToString:](v18->_collectionID, "isEqualToString:", CFSTR("collection"));
    v18->_landingPage = v19;
  }

  return v18;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 remainingNotificationsCount:(id)a6 errorCode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContentID:collectionID:correlationID:remainingNotificationsCount:errorCode:", v16, v15, v14, v13, v12);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSAnalyticsEventNotificationPosted;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[TPSAnalyticsEventNotificationPosted notificationsPosted](self, "notificationsPosted", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("seq_num"));

  -[TPSAnalyticsEventNotificationPosted contentID](self, "contentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tip_ID"));

  -[TPSAnalyticsEventNotificationPosted collectionID](self, "collectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("collection_ID"));

  -[TPSAnalyticsEventNotificationPosted correlationID](self, "correlationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("tip_correlation_ID"));

  -[TPSAnalyticsEventNotificationPosted errorCode](self, "errorCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("error_code"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_remaining, CFSTR("remaining"));
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("notification_posted"));
}

- (NSNumber)notificationsPosted
{
  NSNumber *posted;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  NSNumber *v7;

  posted = self->_posted;
  if (!posted)
  {
    +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSNotificationCount"));
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_posted;
    self->_posted = v4;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSNumber intValue](self->_posted, "intValue") + 1);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_posted;
    self->_posted = v6;

    +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", self->_posted, CFSTR("TPSNotificationCount"));
    posted = self->_posted;
  }
  return posted;
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAnalyticsEventNotificationPosted notificationsPosted](self, "notificationsPosted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("seq_num"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_remaining, CFSTR("num_until_optout"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_contentID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_errorCode, CFSTR("error_code"));
  v5 = (void *)MEMORY[0x1E0CB37E8];
  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "daysSinceLastMajorVersionUpdate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("time_since_os_install"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("u65_flag"));

  return v3;
}

- (void)persistKeys
{
  void *v2;
  id v3;

  -[TPSAnalyticsEventNotificationPosted notificationsPosted](self, "notificationsPosted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", v2, CFSTR("TPSNotificationCount"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", v3, CFSTR("TPSLastNotificationTime"));

}

- (BOOL)landingPage
{
  return self->_landingPage;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_storeStrong((id *)&self->_correlationID, a3);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_remaining, 0);
  objc_storeStrong((id *)&self->_posted, 0);
}

@end
