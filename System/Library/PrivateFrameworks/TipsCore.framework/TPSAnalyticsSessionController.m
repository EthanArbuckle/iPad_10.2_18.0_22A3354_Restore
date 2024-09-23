@implementation TPSAnalyticsSessionController

+ (void)trackSession
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[TPSDefaultsManager sessionTimeoutIntervalInSeconds](TPSDefaultsManager, "sessionTimeoutIntervalInSeconds");
  if (v3 == 0.0)
    v4 = 86400.0;
  else
    v4 = v3;
  +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("TPSSessionStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = v7;

    +[TPSLogger analytics](TPSLogger, "analytics");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = (unint64_t)v8;
      _os_log_impl(&dword_19A906000, v9, OS_LOG_TYPE_INFO, "Previous session has been active for %lu seconds.", (uint8_t *)&v13, 0xCu);
    }

    +[TPSLogger analytics](TPSLogger, "analytics");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v8 >= v4)
    {
      if (v11)
      {
        v13 = 134217984;
        v14 = (unint64_t)v4;
        _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_INFO, "Previous session will be reset now because it started more than %lu seconds ago.", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(a1, "endSession");
    }
    else
    {
      if (v11)
      {
        v13 = 134217984;
        v14 = (unint64_t)v4;
        _os_log_impl(&dword_19A906000, v10, OS_LOG_TYPE_INFO, "Previous session is still active because it is less than %lu seconds old.", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  else
  {
    +[TPSLogger analytics](TPSLogger, "analytics");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19A906000, v12, OS_LOG_TYPE_INFO, "Starting a new session and resetting content view counts.", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(a1, "_resetSession");
  }

}

+ (void)endSession
{
  objc_msgSend(a1, "_logSessionData");
  objc_msgSend(a1, "_resetSession");
}

+ (void)incrementCollectionsViewedCount
{
  objc_msgSend(a1, "_incrementSessionViewNumberForKey:", CFSTR("collections_viewed"));
}

+ (void)incrementTipsViewedCount
{
  objc_msgSend(a1, "_incrementSessionViewNumberForKey:", CFSTR("tips_viewed"));
}

+ (void)_logSessionData
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("collections_viewed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", CFSTR("tips_viewed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  +[TPSAnalyticsEventSession eventWithCollectionsViewed:tipsViewed:](TPSAnalyticsEventSession, "eventWithCollectionsViewed:tipsViewed:", v3, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "log");

}

+ (void)_resetSession
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", v2, CFSTR("TPSSessionStartTime"));

  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", &unk_1E3978488, CFSTR("collections_viewed"));
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", &unk_1E3978488, CFSTR("tips_viewed"));
}

+ (void)_incrementSessionViewNumberForKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  +[TPSAnalyticsPersistenceController persistedObjectForKey:](TPSAnalyticsPersistenceController, "persistedObjectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[TPSAnalyticsPersistenceController persistObject:forKey:](TPSAnalyticsPersistenceController, "persistObject:forKey:", v6, v3);

}

@end
