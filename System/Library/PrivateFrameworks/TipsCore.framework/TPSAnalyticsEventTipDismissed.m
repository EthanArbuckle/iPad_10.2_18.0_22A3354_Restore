@implementation TPSAnalyticsEventTipDismissed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipDismissed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventTipDismissed *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *context;
  uint64_t v14;
  NSString *dismissType;
  void *v16;
  void *v17;
  double v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventTipDismissed;
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dismiss_type"));
    v14 = objc_claimAutoreleasedReturnValue();
    dismissType = v5->_dismissType;
    v5->_dismissType = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayCount = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time_to_dismissal"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v5->_timeToDismissal = v18;

  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 dismissType:(id)a7 timeToDismissal:(double)a8 date:(id)a9
{
  id v17;
  id v18;
  id v19;
  TPSAnalyticsEventTipDismissed *v20;
  TPSAnalyticsEventTipDismissed *v21;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)TPSAnalyticsEventTipDismissed;
  v20 = -[TPSAnalyticsEvent initWithDate:](&v25, sel_initWithDate_, a9);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_tipID, a3);
    objc_storeStrong((id *)&v21->_correlationID, a4);
    objc_storeStrong((id *)&v21->_bundleID, a5);
    objc_storeStrong((id *)&v21->_context, a6);
    objc_storeStrong((id *)&v21->_dismissType, a7);
    v21->_timeToDismissal = a8;
  }

  return v21;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 dismissType:(id)a7 timeToDismissal:(double)a8 date:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:bundleID:context:dismissType:timeToDismissal:date:", v21, v20, v19, v18, v17, v16, a8);

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsEventTipDismissed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v7.receiver, v7.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dismissType, CFSTR("dismiss_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("display_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeToDismissal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("time_to_dismissal"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("tip_dismissed"));
}

- (void)setDataProvider:(id)a3
{
  NSString *bundleID;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *context;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  NSString *correlationID;
  NSString *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventTipDismissed;
  -[TPSAnalyticsEvent setDataProvider:](&v20, sel_setDataProvider_, a3);
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v5 = bundleID;
    v6 = self->_bundleID;
    self->_bundleID = v5;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIDForIdentifier:", self->_tipID);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_bundleID;
    self->_bundleID = v7;

  }
  context = self->_context;
  if (context)
  {
    v10 = context;
    v11 = self->_context;
    self->_context = v10;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextForIdentifier:", self->_tipID);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_context;
    self->_context = v12;

  }
  if (self->_displayCount)
  {
    self->_displayCount = 1;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_displayCount = objc_msgSend(v14, "hintDisplayedCountForIdentifier:", self->_tipID);

  }
  correlationID = self->_correlationID;
  if (correlationID)
  {
    v16 = correlationID;
    v17 = self->_correlationID;
    self->_correlationID = v16;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "correlationIDForIdentifier:", self->_tipID);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = self->_correlationID;
    self->_correlationID = v18;

  }
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_dismissType, CFSTR("dismiss_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("display_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(self->_timeToDismissal));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("time_to_dismissal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("u65_flag"));

  return v3;
}

- (double)timeToDismissal
{
  return self->_timeToDismissal;
}

- (void)setTimeToDismissal:(double)a3
{
  self->_timeToDismissal = a3;
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

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(unint64_t)a3
{
  self->_displayCount = a3;
}

- (NSString)dismissType
{
  return self->_dismissType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
