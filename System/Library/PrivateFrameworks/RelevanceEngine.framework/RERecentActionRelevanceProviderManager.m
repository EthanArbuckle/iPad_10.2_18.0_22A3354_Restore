@implementation RERecentActionRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  +[REFeature recentSiriActionFeature](REFeature, "recentSiriActionFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[REFeature siriActionPerformedCountFeature](REFeature, "siriActionPerformedCountFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (RERecentActionRelevanceProviderManager)initWithQueue:(id)a3
{
  RERecentActionRelevanceProviderManager *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *relevanceProviderMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RERecentActionRelevanceProviderManager;
  v3 = -[RERelevanceProviderManager initWithQueue:](&v8, sel_initWithQueue_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleActionPerformedNotifiction_, CFSTR("RERecentActionManagerDidUpdateAction"), 0);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    relevanceProviderMap = v3->_relevanceProviderMap;
    v3->_relevanceProviderMap = (NSMutableDictionary *)v5;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RERecentActionRelevanceProviderManager;
  -[RERelevanceProviderManager dealloc](&v4, sel_dealloc);
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  +[REFeature recentSiriActionFeature](REFeature, "recentSiriActionFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  +[RESingleton sharedInstance](RERecentActionManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v9, "lastPerformedDateForAction:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v16 = v15;
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      *(float *)&v14 = REPercentThroughRange(v14, v16, v17 + 21600.0);

      v18 = *(float *)&v14;
    }
    else
    {
      v18 = 0.0;
    }
    +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = objc_msgSend(v9, "actionNumberOfTimesPeformedToday:", v10);

    +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (BOOL)_supportsHistoricProviders
{
  return 1;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  +[RESingleton sharedInstance](RERecentActionManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "actionWasPerformedLocally:", v5);

  if (v6)
  {
    +[RESingleton sharedInstance](RERecentActionManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recentAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPerformedDateForAction:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v9, 900.0);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsDate:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (float)_relevanceForHistoricProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;

  v4 = a3;
  +[RESingleton sharedInstance](RERecentActionManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPerformedDateForAction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 1.0 - REPercentBetweenDates(self->_lastDateUpdate, v9);
  }
  else
  {
    v10 = 1.0;
  }

  return v10;
}

- (void)_handleActionPerformedNotifiction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RERecentActionManagerUpdatedActionKey"));
  v8 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v8;
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_relevanceProviderMap, "objectForKeyedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v7);

      -[RERecentActionRelevanceProviderManager _scheduleUpdatesForActionProvider:](self, "_scheduleUpdatesForActionProvider:", v6);
    }

    v5 = (void *)v8;
  }

}

- (void)_addedProvider:(id)a3
{
  id v4;
  NSMutableDictionary *relevanceProviderMap;
  id v6;

  v4 = a3;
  -[RERecentActionRelevanceProviderManager _scheduleUpdatesForActionProvider:](self, "_scheduleUpdatesForActionProvider:", v4);
  relevanceProviderMap = self->_relevanceProviderMap;
  objc_msgSend(v4, "recentAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](relevanceProviderMap, "setObject:forKeyedSubscript:", v4, v6);

}

- (void)_removeProvider:(id)a3
{
  NSMutableDictionary *relevanceProviderMap;
  id v4;

  relevanceProviderMap = self->_relevanceProviderMap;
  objc_msgSend(a3, "recentAction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](relevanceProviderMap, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)_scheduleUpdatesForActionProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  unint64_t i;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  +[RESingleton sharedInstance](RERecentActionManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recentAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPerformedDateForAction:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "dateByAddingTimeInterval:", 900.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "laterDate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      +[RERelevanceProviderManagerUpdate scheduledUpdateForAllProvidersAtDate:](RERelevanceProviderManagerUpdate, "scheduledUpdateForAllProvidersAtDate:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v11);

      for (i = 1; i != 13; ++i)
      {
        objc_msgSend(v6, "dateByAddingTimeInterval:", (double)i * 1800.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[RERelevanceProviderManagerUpdate scheduledUpdateForProvider:atDate:](RERelevanceProviderManagerUpdate, "scheduledUpdateForProvider:atDate:", v15, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v14);

      }
    }

  }
}

- (void)resume
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleSignificantTimeChange, v3, 0);

}

- (void)pause
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

}

- (void)_handleSignificantTimeChange
{
  void *v3;
  _QWORD v4[5];

  -[RERelevanceProviderManager _removeAllPendingUpdates](self, "_removeAllPendingUpdates");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__RERecentActionRelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  v4[3] = &unk_24CF8ACE8;
  v4[4] = self;
  -[RERelevanceProviderManager _enumerateProviders:](self, "_enumerateProviders:", v4);
  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v3);

}

uint64_t __70__RERecentActionRelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleUpdatesForActionProvider:", a2);
}

- (void)_prepareForUpdate
{
  NSDate *v3;
  NSDate *lastDateUpdate;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastDateUpdate = self->_lastDateUpdate;
  self->_lastDateUpdate = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDateUpdate, 0);
  objc_storeStrong((id *)&self->_relevanceProviderMap, 0);
}

@end
