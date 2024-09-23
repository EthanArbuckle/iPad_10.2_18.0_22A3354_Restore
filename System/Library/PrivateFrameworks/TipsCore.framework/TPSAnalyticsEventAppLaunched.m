@implementation TPSAnalyticsEventAppLaunched

+ (id)_initialSessionEvent
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_currentSessionEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)log
{
  void *v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "_currentSessionEvents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);
  objc_msgSend((id)objc_opt_class(), "_initialSessionEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v3, sel__aggregateLog, 0);
  objc_msgSend(v3, "performSelector:withObject:afterDelay:", sel__aggregateLog, 0, 1.0);

}

+ (id)_currentSessionEvents
{
  if (_currentSessionEvents_predicate != -1)
    dispatch_once(&_currentSessionEvents_predicate, &__block_literal_global_0);
  return (id)_currentSessionEvents_gCurrentSessionEvents;
}

void __53__TPSAnalyticsEventAppLaunched__currentSessionEvents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)_currentSessionEvents_gCurrentSessionEvents;
  _currentSessionEvents_gCurrentSessionEvents = (uint64_t)v0;

}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 launchType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContentID:collectionID:correlationID:launchType:", v13, v12, v11, v10);

  return v14;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 launchType:(id)a6
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  TPSAnalyticsEventAppLaunched *v14;
  TPSAnalyticsEventAppLaunched *v15;
  uint64_t v16;
  NSString *userType;
  objc_super v19;

  v10 = (__CFString *)a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventAppLaunched;
  v14 = -[TPSAnalyticsEvent initWithDate:](&v19, sel_initWithDate_, 0);
  v15 = v14;
  if (v14)
  {
    -[TPSAnalyticsEventAppLaunched userTypeString](v14, "userTypeString");
    v16 = objc_claimAutoreleasedReturnValue();
    userType = v15->_userType;
    v15->_userType = (NSString *)v16;

    objc_storeStrong((id *)&v15->_launchType, a6);
    if (!v10)
      v10 = CFSTR("unspecified");
    if (!v11)
      v11 = CFSTR("unspecified");
    if (!v12)
      v12 = CFSTR("unspecified");
    objc_storeStrong((id *)&v15->_contentID, v10);
    objc_storeStrong((id *)&v15->_collectionID, v11);
    objc_storeStrong((id *)&v15->_correlationID, v12);
  }

  return v15;
}

- (id)userTypeString
{
  void *v2;
  unint64_t v3;

  +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userType");

  if (v3 > 2)
    return CFSTR("undefined");
  else
    return off_1E395B0C0[v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventAppLaunched)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventAppLaunched *v5;
  uint64_t v6;
  NSString *userType;
  uint64_t v8;
  NSString *launchType;
  uint64_t v10;
  NSString *contentID;
  uint64_t v12;
  NSString *collectionID;
  uint64_t v14;
  NSString *correlationID;
  uint64_t v16;
  NSNumber *launchNumber;
  void *v18;
  void *v19;
  int v20;
  objc_super v22;
  _QWORD v23[8];

  v23[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TPSAnalyticsEventAppLaunched;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user_type"));
    v6 = objc_claimAutoreleasedReturnValue();
    userType = v5->_userType;
    v5->_userType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launch_src"));
    v8 = objc_claimAutoreleasedReturnValue();
    launchType = v5->_launchType;
    v5->_launchType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_ID"));
    v12 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_ID"));
    v14 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seq_num"));
    v16 = objc_claimAutoreleasedReturnValue();
    launchNumber = v5->_launchNumber;
    v5->_launchNumber = (NSNumber *)v16;

    v23[0] = CFSTR("quick_action");
    v23[1] = CFSTR("universal_link");
    v23[2] = CFSTR("springboard");
    v23[3] = CFSTR("foreground");
    v23[4] = CFSTR("background");
    v23[5] = CFSTR("terminated");
    v23[6] = CFSTR("carousel");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session_reset"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "BOOLValue"))
    {
      v20 = objc_msgSend(v18, "containsObject:", v5->_launchType);

      if (v20)
        +[TPSAnalyticsEventContentViewed resetSessionViewNumber](TPSAnalyticsEventContentViewed, "resetSessionViewNumber");
    }
    else
    {

    }
  }

  return v5;
}

+ (void)resetLaunchNumber
{
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", &unk_1E3978110, CFSTR("seq_num"));
}

- (id)_initFirstLaunchEvent
{
  TPSAnalyticsEventAppLaunched *v2;
  uint64_t v3;
  NSString *userType;
  NSString *launchType;
  NSString *contentID;
  NSString *collectionID;
  NSString *correlationID;
  NSNumber *launchNumber;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPSAnalyticsEventAppLaunched;
  v2 = -[TPSAnalyticsEvent initWithDate:](&v11, sel_initWithDate_, 0);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "resetLaunchNumber");
    -[TPSAnalyticsEventAppLaunched userType](v2, "userType");
    v3 = objc_claimAutoreleasedReturnValue();
    userType = v2->_userType;
    v2->_userType = (NSString *)v3;

    launchType = v2->_launchType;
    v2->_launchType = (NSString *)CFSTR("first_launch");

    contentID = v2->_contentID;
    v2->_contentID = (NSString *)CFSTR("unspecified");

    collectionID = v2->_collectionID;
    v2->_collectionID = (NSString *)CFSTR("unspecified");

    correlationID = v2->_correlationID;
    v2->_correlationID = (NSString *)CFSTR("unspecified");

    launchNumber = v2->_launchNumber;
    v2->_launchNumber = (NSNumber *)&unk_1E3978128;

  }
  return v2;
}

+ (id)firstLaunchEvent
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initFirstLaunchEvent");
}

- (void)_updateLaunchCount
{
  void *v3;
  void *v4;
  NSNumber *v5;
  NSNumber *launchNumber;
  NSNumber *v7;
  BOOL v8;

  +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSAppLaunchCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "intValue") + 1);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (NSNumber *)&unk_1E3978128;
  }
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", v5, CFSTR("TPSAppLaunchCount"));
  launchNumber = self->_launchNumber;
  self->_launchNumber = v5;
  v7 = v5;

  v8 = +[TPSAnalyticsEventContentViewed updateSessionViewNumber](TPSAnalyticsEventContentViewed, "updateSessionViewNumber");
  self->_needsSessionReset = v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsEventAppLaunched;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSAnalyticsEventAppLaunched _updateLaunchCount](self, "_updateLaunchCount", v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userType, CFSTR("user_type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_launchType, CFSTR("launch_src"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, CFSTR("tip_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_launchNumber, CFSTR("seq_num"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsSessionReset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("session_reset"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("app_launch"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_userType, CFSTR("user_type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_launchNumber, CFSTR("seq_num"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_launchType, CFSTR("launch_src"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_contentID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("u65_flag"));

  return v3;
}

- (void)persistKeys
{
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", self->_launchNumber, CFSTR("TPSAppLaunchCount"));
}

+ (id)_latestSessionEvent
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_currentSessionEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)appSessionEndedWithType:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[TPSAnalyticsEventAppLaunched eventWithContentID:collectionID:correlationID:launchType:](TPSAnalyticsEventAppLaunched, "eventWithContentID:collectionID:correlationID:launchType:", 0, 0, 0, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_currentSessionEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);
  objc_msgSend((id)objc_opt_class(), "_initialSessionEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_aggregateLog");

}

- (void)_aggregateLog
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__aggregateLog, 0);
  objc_msgSend((id)objc_opt_class(), "_currentSessionEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "launchType");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_currentSessionEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  if (v3 != CFSTR("background") && v3 != CFSTR("terminated"))
  {
    +[TPSAnalyticsEventController sharedInstance](TPSAnalyticsEventController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logAnalyticsEvent:", v6);

  }
}

+ (id)lastRecordedLaunchType
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_latestSessionEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (NSNumber)launchNumber
{
  return self->_launchNumber;
}

- (NSString)userType
{
  return self->_userType;
}

- (NSString)launchType
{
  return self->_launchType;
}

- (void)setLaunchType:(id)a3
{
  objc_storeStrong((id *)&self->_launchType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchType, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_launchNumber, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
