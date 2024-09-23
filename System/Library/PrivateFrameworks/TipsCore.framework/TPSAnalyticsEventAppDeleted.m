@implementation TPSAnalyticsEventAppDeleted

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("app_deleted"));
}

- (id)notificationsPosted
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSNotificationCount"));
}

- (id)appLaunches
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSAppLaunchCount"));
}

- (id)tipViewTotal
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSContentViews"));
}

- (id)desiredOutcomeTotal
{
  return +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSDesiredOutcomes"));
}

- (double)timeSinceLastNotification
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSLastNotificationTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v2);
    v5 = v4;

  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAnalyticsEventAppDeleted appLaunches](self, "appLaunches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("launches_count"));

  -[TPSAnalyticsEventAppDeleted tipViewTotal](self, "tipViewTotal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("content_views"));

  -[TPSAnalyticsEventAppDeleted desiredOutcomeTotal](self, "desiredOutcomeTotal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("desired_outcome_count"));

  -[TPSAnalyticsEventAppDeleted notificationsPosted](self, "notificationsPosted");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1E3978470;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("notifications_count"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "daysSinceLastMajorVersionUpdate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("time_since_os_install"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("u65_flag"));

  -[TPSAnalyticsEventAppDeleted notificationsPosted](self, "notificationsPosted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "intValue");

  if ((int)v11 >= 1)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSAnalyticsEventAppDeleted timeSinceLastNotification](self, "timeSinceLastNotification");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("time_since_last_notification"));

  }
  return v3;
}

+ (id)event
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDate:", 0);
}

@end
