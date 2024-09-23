@implementation _DASActivityRateLimitConfiguration_Internal

- (_DASActivityRateLimitConfiguration_Internal)initWithRateLimit:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  _DASActivityRateLimitConfiguration_Internal *v8;
  _DASActivityRateLimitConfiguration_Internal *v9;
  uint64_t v10;
  NSString *configurationName;
  uint64_t v12;
  NSMutableArray *ratelimitTrackers;
  uint64_t v14;
  NSMutableSet *pendingActivities;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  _DASActivityRateLimitTracker *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_DASActivityRateLimitConfiguration_Internal;
  v8 = -[_DASActivityRateLimitConfiguration_Internal init](&v27, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uniqueGroupName, a4);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    configurationName = v9->_configurationName;
    v9->_configurationName = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    ratelimitTrackers = v9->_ratelimitTrackers;
    v9->_ratelimitTrackers = (NSMutableArray *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingActivities = v9->_pendingActivities;
    v9->_pendingActivities = (NSMutableSet *)v14;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rateLimits", 0));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_DASActivityRateLimitTracker initWithRateLimit:]([_DASActivityRateLimitTracker alloc], "initWithRateLimit:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20));
          -[NSMutableArray addObject:](v9->_ratelimitTrackers, "addObject:", v21);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v18);
    }

  }
  return v9;
}

- (_DASActivityRateLimitConfiguration_Internal)initWithConfigurationName:(id)a3 andIdentifier:(id)a4
{
  id v7;
  id v8;
  _DASActivityRateLimitConfiguration_Internal *v9;
  _DASActivityRateLimitConfiguration_Internal *v10;
  uint64_t v11;
  NSMutableArray *ratelimitTrackers;
  uint64_t v13;
  NSMutableSet *pendingActivities;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_DASActivityRateLimitConfiguration_Internal;
  v9 = -[_DASActivityRateLimitConfiguration_Internal init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueGroupName, a4);
    objc_storeStrong((id *)&v10->_configurationName, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    ratelimitTrackers = v10->_ratelimitTrackers;
    v10->_ratelimitTrackers = (NSMutableArray *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingActivities = v10->_pendingActivities;
    v10->_pendingActivities = (NSMutableSet *)v13;

  }
  return v10;
}

+ (id)rateLimitConfiguration:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithRateLimit:withIdentifier:", v7, v6);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal configurationName](self, "configurationName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal uniqueGroupName](self, "uniqueGroupName"));
  v7 = objc_msgSend(v4, "initWithConfigurationName:andIdentifier:", v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal ratelimitTrackers](self, "ratelimitTrackers"));
  objc_msgSend(v7, "setRatelimitTrackers:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal pendingActivities](self, "pendingActivities"));
  objc_msgSend(v7, "setPendingActivities:", v9);

  return v7;
}

- (id)description
{
  NSString *configurationName;
  NSString *uniqueGroupName;
  void *v4;
  void *v5;

  uniqueGroupName = self->_uniqueGroupName;
  configurationName = self->_configurationName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](self->_ratelimitTrackers, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unique Group Name: %@, Configuration Name %@, Rate Limits %@"), uniqueGroupName, configurationName, v4));

  return v5;
}

- (BOOL)isInactiveAtDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal pendingActivities](self, "pendingActivities"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal ratelimitTrackers](self, "ratelimitTrackers", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "onlyExpiredOccurrencesAtDate:", v4))
          {
            v7 = 0;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_13:

  }
  return v7;
}

- (void)replaceRateLimitConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *configurationName;
  NSMutableArray *v14;
  NSMutableArray *ratelimitTrackers;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  _DASActivityRateLimitTracker *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_ratelimitTrackers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v10), "occurrences"));
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  configurationName = self->_configurationName;
  self->_configurationName = v12;

  v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  ratelimitTrackers = self->_ratelimitTrackers;
  self->_ratelimitTrackers = v14;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rateLimits", 0));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = -[_DASActivityRateLimitTracker initWithRateLimit:andOccurrences:]([_DASActivityRateLimitTracker alloc], "initWithRateLimit:andOccurrences:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v20), v5);
        -[NSMutableArray addObject:](self->_ratelimitTrackers, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
  }

}

- (id)evaluationResultsWithLPMState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal ratelimitTrackers](self, "ratelimitTrackers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v9 = v6;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    v9 = v6;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "window");
        v15 = v14 == 900.0 && objc_msgSend(v13, "maximum") == (id)1;
        v16 = v15 & v3;
        if ((objc_msgSend(v13, "timewiseEligibleAtDate:withLPMWindowExtension:", v6, v16) & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextTimewiseEligibleDateFromDate:withLPMWindowExtension:", v6, v16));
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "laterDate:", v17));

          v9 = (void *)v18;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRateLimitEvaluationResults evaluationResultsWithMaxedRateLimits:withNextEvaluationDate:](_DASRateLimitEvaluationResults, "evaluationResultsWithMaxedRateLimits:withNextEvaluationDate:", v5, v9));
  return v19;
}

- (void)executeActivity:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal ratelimitTrackers](self, "ratelimitTrackers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "executeAtDate:", v7);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if (-[_DASActivityRateLimitConfiguration_Internal containsPendingActivity:](self, "containsPendingActivity:", v6))
    -[_DASActivityRateLimitConfiguration_Internal removePendingActivity:](self, "removePendingActivity:", v6);

}

- (void)addPendingActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal pendingActivities](self, "pendingActivities"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removePendingActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal pendingActivities](self, "pendingActivities"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)containsPendingActivity:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitConfiguration_Internal pendingActivities](self, "pendingActivities"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSMutableArray)ratelimitTrackers
{
  return self->_ratelimitTrackers;
}

- (void)setRatelimitTrackers:(id)a3
{
  objc_storeStrong((id *)&self->_ratelimitTrackers, a3);
}

- (NSString)uniqueGroupName
{
  return self->_uniqueGroupName;
}

- (void)setUniqueGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueGroupName, a3);
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (void)setConfigurationName:(id)a3
{
  objc_storeStrong((id *)&self->_configurationName, a3);
}

- (NSMutableSet)pendingActivities
{
  return self->_pendingActivities;
}

- (void)setPendingActivities:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActivities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActivities, 0);
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_storeStrong((id *)&self->_uniqueGroupName, 0);
  objc_storeStrong((id *)&self->_ratelimitTrackers, 0);
}

@end
