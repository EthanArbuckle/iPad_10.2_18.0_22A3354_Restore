@implementation _UIStatistics

- (void)_recordDistributionValue:(double)a3
{
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[_UIStatistics _shouldSample](self, "_shouldSample"))
  {
    +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordDistributionValue:forKey:", self->_key, a3);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_children;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_recordDistributionValue:", a3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

+ (id)maxForce
{
  if (qword_1ECD82090 != -1)
    dispatch_once(&qword_1ECD82090, &__block_literal_global_127_1);
  return (id)qword_1ECD82088;
}

+ (id)previewInteractionTapCount
{
  if (qword_1ECD82050 != -1)
    dispatch_once(&qword_1ECD82050, &__block_literal_global_109_2);
  return (id)qword_1ECD82048;
}

- (void)_incrementValueBy:(int64_t)a3
{
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[_UIStatistics _shouldSample](self, "_shouldSample"))
  {
    +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "incrementValueBy:forKey:", a3, self->_key);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_children;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_incrementValueBy:", a3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)_shouldSample
{
  double v2;
  double v3;

  v2 = self->_sampleRate + self->_sampleValue;
  v3 = trunc(v2);
  if (v2 < 1.0)
    v3 = 0.0;
  self->_sampleValue = v2 - v3;
  return v2 >= 1.0;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = fmax(fmin(a3, 1.0), 0.0);
}

+ (id)feedbackGeneratorPreparationCountWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("behaviorPreparationCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)feedbackEngineActivationDurationWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("engineActivationDuration"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)feedbackEngineActivationCountWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("engineActivationCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)feedbackEnginePrewarmDurationWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("enginePrewarmDuration"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)feedbackEnginePrewarmCountWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("enginePrewarmCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)feedbackGeneratorPlayCountWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("behaviorPlayCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unint64_t)currentTime
{
  return 0;
}

+ (id)feedbackGeneratorActivationCountWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("behaviorActivationCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)feedbackGeneratorActivationDurationWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("behaviorActivationDuration"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_sharedStatisticWithDomain:(id)a3 statisticsClass:(Class)a4 identifierReporting:(int64_t)a5
{
  id v7;
  void *v8;

  v7 = a3;
  if (qword_1ECD820B8 != -1)
    dispatch_once(&qword_1ECD820B8, &__block_literal_global_200_3);
  objc_msgSend((id)qword_1ECD820C0, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend([a4 alloc], "initWithDomain:identifierReporting:", v7, a5);
    objc_msgSend((id)qword_1ECD820C0, "setObject:forKey:", v8, v7);
  }

  return v8;
}

- (_UIStatistics)initWithDomain:(id)a3 identifierReporting:(int64_t)a4
{
  id v7;
  _UIStatistics *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *key;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v7 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatistics.m"), 93, CFSTR("You cannot construct a _UIStatistic instance with an empty or nil string"));

  }
  v17.receiver = self;
  v17.super_class = (Class)_UIStatistics;
  v8 = -[_UIStatistics init](&v17, sel_init);
  if (v8)
  {
    _UIStatisticsBundleIdentifier(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
      v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("com.apple.%@.%@"), v7, v9);
    else
      v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("com.apple.%@"), v7, v16);
    key = v8->_key;
    v8->_key = (NSString *)v12;

    v8->_sampleRate = 1.0;
    v8->_sampleValue = 0.0;

  }
  return v8;
}

- (void)_recordDistributionTime:(unint64_t)a3
{
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[_UIStatistics _shouldSample](self, "_shouldSample"))
  {
    +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordDistributionTime:forKey:", a3, self->_key);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_children;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_recordDistributionTime:", a3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (_UIStatistics)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s should not be called"), "-[_UIStatistics init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise");

  return 0;
}

- (id)_key
{
  return self->_key;
}

- (_UIStatistics)initWithDomain:(id)a3
{
  return -[_UIStatistics initWithDomain:identifierReporting:](self, "initWithDomain:identifierReporting:", a3, 0);
}

- (void)_addChildStatistic:(id)a3
{
  NSMutableSet *children;
  NSMutableSet *v5;
  NSMutableSet *v6;

  children = self->_children;
  if (children)
  {
    -[NSMutableSet addObject:](children, "addObject:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", a3);
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_children;
    self->_children = v5;

  }
}

- (void)_removeChildStatistic:(id)a3
{
  unint64_t v4;
  NSMutableSet *children;
  id v6;

  v6 = a3;
  v4 = -[NSMutableSet count](self->_children, "count");
  children = self->_children;
  if (v4 > 1)
  {
    -[NSMutableSet removeObject:](children, "removeObject:", v6);
  }
  else
  {
    self->_children = 0;

  }
}

- (void)randomizeSampleValue
{
  self->_sampleValue = (double)arc4random_uniform(0x2710u) / 10000.0;
}

- (void)_resetDistribution
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetDistributionForKey:", self->_key);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_children;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_resetDistribution", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_resetDistributionToValue:(double)a3
{
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[_UIStatistics _shouldSample](self, "_shouldSample"))
  {
    +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetDistributionToValue:forKey:", self->_key, a3);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_children;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_resetDistributionToValue:", a3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  else
  {
    -[_UIStatistics _resetValue](self, "_resetValue");
  }
}

- (void)_resetValue
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetValueForKey:", self->_key);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_children;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_resetValue", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setValue:(int64_t)a3
{
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[_UIStatistics _shouldSample](self, "_shouldSample"))
  {
    +[_UIStatisticsIntegrator sharedInstance](_UIStatisticsIntegrator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", a3, self->_key);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_children;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_setValue:", a3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)description
{
  void *v3;
  void *v4;
  double sampleRate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatistics;
  -[_UIStatistics description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" key=%@"), self->_key);
  sampleRate = self->_sampleRate;
  if (sampleRate < 1.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sampled (progress=%f, rate=%f)"), *(_QWORD *)&self->_sampleValue, *(_QWORD *)&sampleRate);
  return v4;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)previewInteractionPeekCount
{
  if (qword_1ECD82020 != -1)
    dispatch_once(&qword_1ECD82020, &__block_literal_global_92_2);
  return (id)qword_1ECD82018;
}

+ (id)previewInteractionPeekDuration
{
  if (qword_1ECD82030 != -1)
    dispatch_once(&qword_1ECD82030, &__block_literal_global_98_3);
  return (id)qword_1ECD82028;
}

+ (id)previewInteractionPopCount
{
  if (qword_1ECD82040 != -1)
    dispatch_once(&qword_1ECD82040, &__block_literal_global_104_1);
  return (id)qword_1ECD82038;
}

+ (id)previewInteractionAlertPresentationCount
{
  if (qword_1ECD82060 != -1)
    dispatch_once(&qword_1ECD82060, &__block_literal_global_112_2);
  return (id)qword_1ECD82058;
}

+ (id)previewInteractionPeekForce
{
  if (qword_1ECD82070 != -1)
    dispatch_once(&qword_1ECD82070, &__block_literal_global_117_1);
  return (id)qword_1ECD82068;
}

+ (id)previewInteractionPopForce
{
  if (qword_1ECD82080 != -1)
    dispatch_once(&qword_1ECD82080, &__block_literal_global_122_1);
  return (id)qword_1ECD82078;
}

+ (id)scrubberUsageCount
{
  if (qword_1ECD820A0 != -1)
    dispatch_once(&qword_1ECD820A0, &__block_literal_global_132_1);
  return (id)qword_1ECD82098;
}

+ (id)scrubberUsageTime
{
  if (qword_1ECD820B0 != -1)
    dispatch_once(&qword_1ECD820B0, &__block_literal_global_135_0);
  return (id)qword_1ECD820A8;
}

+ (id)controlTapCountWithCategory:(id)a3 suffix:(id)a4
{
  void *v4;
  void *v5;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.eventCount.tap"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v4, objc_opt_class(), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)controlValueChangeEmittedCountWithCategory:(id)a3 suffix:(id)a4
{
  void *v4;
  void *v5;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.eventCount.valueChange"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v4, objc_opt_class(), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)controlInteractionDurationDistributionWithCategory:(id)a3 suffix:(id)a4
{
  void *v4;
  void *v5;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.interactionDistribution"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v4, objc_opt_class(), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)alertButtonTapCount
{
  return (id)objc_msgSend(a1, "controlTapCountWithCategory:suffix:", CFSTR("button.alert"), 0);
}

+ (id)pinchGestureCount
{
  void *v2;
  void *v3;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.eventCount"), CFSTR("pinch"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v2, objc_opt_class(), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)zoomGestureCount
{
  void *v2;
  void *v3;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.eventCount"), CFSTR("zoom"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v2, objc_opt_class(), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)scrollBounceCount
{
  void *v2;
  void *v3;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.eventCount"), CFSTR("scrollBounce"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v2, objc_opt_class(), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)feedbackEngineOutOfChannelsCountWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("engineOutOfChannelsCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)feedbackGeneratorActivationTimeOutCountWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.feedback"), CFSTR("behaviorActivationTimeOutCount"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)recentsInputViewPresentationCount
{
  void *v2;
  void *v3;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.recentsInputView"), CFSTR("presentationCount"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)recentsInputViewNumberOfItems
{
  void *v2;
  void *v3;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.recentsInputView"), CFSTR("numberOfItems"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)recentsInputViewItemSelectedCount
{
  void *v2;
  void *v3;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.recentsInputView"), CFSTR("itemSelectedCount"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)recentsInputViewNewEntryCount
{
  void *v2;
  void *v3;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.recentsInputView"), CFSTR("newEntryCount"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)coverSheetButtonInteractionCountWithActivation:(BOOL)a3 category:(id)a4
{
  __CFString *v4;
  void *v5;
  void *v6;

  if (a3)
    v4 = CFSTR("didActivate.count");
  else
    v4 = CFSTR("didNotActivate.count");
  _domainWithCategoryAndSuffix(CFSTR("UIKit.coverSheetButton"), a4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v5, objc_opt_class(), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)coverSheetButtonInteractionDurationWithCategory:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.coverSheetButton"), a3, CFSTR("interactionDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)coverSheetButtonFirstActivationDurationWithCategory:(id)a3
{
  void *v3;
  void *v4;

  _domainWithCategoryAndSuffix(CFSTR("UIKit.coverSheetButton"), a3, CFSTR("firstActivationDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v3, objc_opt_class(), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)coverSheetButtonMaximumForceWithActivation:(BOOL)a3 category:(id)a4
{
  __CFString *v4;
  void *v5;
  void *v6;

  if (a3)
    v4 = CFSTR("didActivate.maxForce");
  else
    v4 = CFSTR("didNotActivate.maxForce");
  _domainWithCategoryAndSuffix(CFSTR("UIKit.coverSheetButton"), a4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatistics _sharedStatisticWithDomain:statisticsClass:identifierReporting:](_UIStatistics, "_sharedStatisticWithDomain:statisticsClass:identifierReporting:", v5, objc_opt_class(), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
