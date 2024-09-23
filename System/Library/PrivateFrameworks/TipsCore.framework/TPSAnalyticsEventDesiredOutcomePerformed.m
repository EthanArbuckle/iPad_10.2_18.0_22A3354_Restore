@implementation TPSAnalyticsEventDesiredOutcomePerformed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 displayType:(id)a5 overrideHoldout:(BOOL)a6 lastDisplayedContext:(id)a7 lastHintDisplayedDate:(id)a8 desiredOutcomePerformedDate:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v11 = a6;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[TPSAnalyticsEventDesiredOutcomePerformed _initWithTipID:correlationID:displayType:overrideHoldout:context:lastHintDisplayedDate:desiredOutcomePerformedDate:]([TPSAnalyticsEventDesiredOutcomePerformed alloc], "_initWithTipID:correlationID:displayType:overrideHoldout:context:lastHintDisplayedDate:desiredOutcomePerformedDate:", v20, v19, v18, v11, v17, v16, v15);

  return v21;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 displayType:(id)a5 overrideHoldout:(BOOL)a6 context:(id)a7 lastHintDisplayedDate:(id)a8 desiredOutcomePerformedDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TPSAnalyticsEventDesiredOutcomePerformed *v20;
  TPSAnalyticsEventDesiredOutcomePerformed *v21;
  double v22;
  _BOOL4 v24;
  id v25;
  objc_super v26;

  v24 = a6;
  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  v20 = -[TPSAnalyticsEvent initWithDate:](&v26, sel_initWithDate_, 0);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_tipID, a3);
    objc_storeStrong((id *)&v21->_correlationID, a4);
    objc_storeStrong((id *)&v21->_context, a7);
    objc_storeStrong((id *)&v21->_displayType, a5);
    v22 = -1.0;
    if (v18 && v19)
      objc_msgSend(v19, "timeIntervalSinceDate:", v18, -1.0);
    v21->_timeToDesiredOutcome = v22;
    if (v24)
      objc_storeStrong((id *)&v21->_experimentCampID, CFSTR("overrideHoldout"));
  }

  return v21;
}

- (TPSAnalyticsEventDesiredOutcomePerformed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventDesiredOutcomePerformed *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *context;
  uint64_t v14;
  NSString *experimentID;
  uint64_t v16;
  NSString *experimentCampID;
  uint64_t v18;
  NSString *displayType;
  double v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_correlation_ID"));
    v8 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v12 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment_ID"));
    v14 = objc_claimAutoreleasedReturnValue();
    experimentID = v5->_experimentID;
    v5->_experimentID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment_camp_ID"));
    v16 = objc_claimAutoreleasedReturnValue();
    experimentCampID = v5->_experimentCampID;
    v5->_experimentCampID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_type"));
    v18 = objc_claimAutoreleasedReturnValue();
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v18;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("time_to_desired_outcome"));
    v5->_timeToDesiredOutcome = v20;
    v5->_displayCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("display_count"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentID, CFSTR("experiment_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentCampID, CFSTR("experiment_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("time_to_desired_outcome"), self->_timeToDesiredOutcome);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_displayCount, CFSTR("display_count"));

}

- (void)setDataProvider:(id)a3
{
  NSString *correlationID;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *bundleID;
  NSString *v11;
  void *v12;
  NSString *v13;
  NSString *v14;
  NSString *experimentID;
  NSString *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSString *experimentCampID;
  NSString *v21;
  void *v22;
  NSString *v23;
  NSString *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)TPSAnalyticsEventDesiredOutcomePerformed;
  -[TPSAnalyticsEvent setDataProvider:](&v25, sel_setDataProvider_, a3);
  correlationID = self->_correlationID;
  if (correlationID)
  {
    v5 = correlationID;
    v6 = self->_correlationID;
    self->_correlationID = v5;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "correlationIDForIdentifier:", self->_tipID);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_correlationID;
    self->_correlationID = v7;

  }
  if (self->_displayCount)
  {
    self->_displayCount = 1;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_displayCount = objc_msgSend(v9, "hintDisplayedCountForIdentifier:", self->_tipID);

  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v11 = bundleID;
    v12 = self->_bundleID;
    self->_bundleID = v11;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIDForIdentifier:", self->_tipID);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = self->_bundleID;
    self->_bundleID = v13;

  }
  experimentID = self->_experimentID;
  if (experimentID)
  {
    v16 = experimentID;
    v17 = self->_experimentID;
    self->_experimentID = v16;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "experimentID");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = self->_experimentID;
    self->_experimentID = v18;

  }
  experimentCampID = self->_experimentCampID;
  if (experimentCampID)
  {
    v21 = experimentCampID;
    v22 = self->_experimentCampID;
    self->_experimentCampID = v21;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "experimentCampID");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    v24 = self->_experimentCampID;
    self->_experimentCampID = v23;

  }
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("desired_outcome_performed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  double timeToDesiredOutcome;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_experimentID, CFSTR("experiment_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_experimentCampID, CFSTR("experiment_camp_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_displayCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("display_count"));

  timeToDesiredOutcome = self->_timeToDesiredOutcome;
  if (timeToDesiredOutcome == -1.0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("time_to_desired_outcome"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)timeToDesiredOutcome);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("time_to_desired_outcome"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("u65_flag"));

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
  objc_storeStrong((id *)&self->_tipID, a3);
}

- (double)timeToDesiredOutcome
{
  return self->_timeToDesiredOutcome;
}

- (void)setTimeToDesiredOutcome:(double)a3
{
  self->_timeToDesiredOutcome = a3;
}

- (int64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(int64_t)a3
{
  self->_displayCount = a3;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
  objc_storeStrong((id *)&self->_correlationID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_experimentID, a3);
}

- (NSString)experimentCampID
{
  return self->_experimentCampID;
}

- (void)setExperimentCampID:(id)a3
{
  objc_storeStrong((id *)&self->_experimentCampID, a3);
}

- (NSString)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_experimentCampID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
