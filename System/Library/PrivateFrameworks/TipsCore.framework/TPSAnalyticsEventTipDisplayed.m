@implementation TPSAnalyticsEventTipDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipDisplayed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventTipDisplayed *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *context;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  TPSExperiment *experiment;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v20, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayType = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usage_flags"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usageFlags = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayCount = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment"));
    v17 = objc_claimAutoreleasedReturnValue();
    experiment = v5->_experiment;
    v5->_experiment = (TPSExperiment *)v17;

    v5->_overrideHoldout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("override_holdout"));
  }

  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 usageFlags:(unint64_t)a8 experiment:(id)a9 overrideHoldout:(BOOL)a10 date:(id)a11
{
  id v16;
  id v17;
  id v18;
  TPSAnalyticsEventTipDisplayed *v19;
  TPSAnalyticsEventTipDisplayed *v20;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  v19 = -[TPSAnalyticsEvent initWithDate:](&v26, sel_initWithDate_, a11);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_tipID, a3);
    objc_storeStrong((id *)&v20->_correlationID, a4);
    objc_storeStrong((id *)&v20->_bundleID, a5);
    objc_storeStrong((id *)&v20->_context, a6);
    v20->_displayType = a7;
    v20->_usageFlags = a8;
    objc_storeStrong((id *)&v20->_experiment, a9);
    v20->_overrideHoldout = a10;
  }

  return v20;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 usageFlags:(unint64_t)a8 experiment:(id)a9 overrideHoldout:(BOOL)a10 date:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;

  v18 = a11;
  v19 = a9;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  LOBYTE(v26) = a10;
  v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:bundleID:context:displayType:usageFlags:experiment:overrideHoldout:date:", v23, v22, v21, v20, a7, a8, v19, v26, v18);

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v8.receiver, v8.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("display_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_usageFlags);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("usage_flags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("display_count"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_experiment, CFSTR("experiment"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_overrideHoldout, CFSTR("override_holdout"));

}

- (void)setDataProvider:(id)a3
{
  void *v4;
  NSString *correlationID;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSAnalyticsEventTipDisplayed;
  -[TPSAnalyticsEvent setDataProvider:](&v10, sel_setDataProvider_, a3);
  if (self->_displayCount)
  {
    self->_displayCount = 1;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_displayCount = objc_msgSend(v4, "hintDisplayedCountForIdentifier:", self->_tipID);

  }
  correlationID = self->_correlationID;
  if (correlationID)
  {
    v6 = correlationID;
    v7 = self->_correlationID;
    self->_correlationID = v6;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "correlationIDForIdentifier:", self->_tipID);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_correlationID;
    self->_correlationID = v8;

  }
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("tip_displayed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:](TPSAnalyticsCommonDefines, "displayTypeStringForDisplayType:", self->_displayType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("display_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("display_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TPSExperiment identifier](self->_experiment, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("experiment_ID"));

  if (self->_overrideHoldout)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("overrideHoldout"), CFSTR("experiment_camp_ID"));
  }
  else
  {
    +[TPSAnalyticsCommonDefines experimentCampIDStringForCamp:](TPSAnalyticsCommonDefines, "experimentCampIDStringForCamp:", -[TPSExperiment camp](self->_experiment, "camp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("experiment_camp_ID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("u65_flag"));

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)context
{
  return self->_context;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (unint64_t)usageFlags
{
  return self->_usageFlags;
}

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(unint64_t)a3
{
  self->_displayCount = a3;
}

- (BOOL)overrideHoldout
{
  return self->_overrideHoldout;
}

- (void)setOverrideHoldout:(BOOL)a3
{
  self->_overrideHoldout = a3;
}

- (TPSExperiment)experiment
{
  return self->_experiment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
