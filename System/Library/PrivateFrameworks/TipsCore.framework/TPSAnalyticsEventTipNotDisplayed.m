@implementation TPSAnalyticsEventTipNotDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventTipNotDisplayed *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *context;
  uint64_t v14;
  NSString *displayType;
  uint64_t v16;
  NSString *reason;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v19, sel_initWithCoder_, v4);
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
    v14 = objc_claimAutoreleasedReturnValue();
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v16 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v16;

  }
  return v5;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithReason:(id)a3 lastOfferedTipID:(id)a4 lastOfferedCorrelationID:(id)a5 lastOfferedBundleID:(id)a6 lastOfferedContext:(id)a7
{
  return -[TPSAnalyticsEventTipNotDisplayed initWithReason:lastOfferedTipID:lastOfferedCorrelationID:lastOfferedBundleID:lastOfferedContext:date:](self, "initWithReason:lastOfferedTipID:lastOfferedCorrelationID:lastOfferedBundleID:lastOfferedContext:date:", a3, a4, a5, a6, a7, 0);
}

- (TPSAnalyticsEventTipNotDisplayed)initWithReason:(id)a3 lastOfferedTipID:(id)a4 lastOfferedCorrelationID:(id)a5 lastOfferedBundleID:(id)a6 lastOfferedContext:(id)a7 date:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TPSAnalyticsEventTipNotDisplayed *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = -[TPSAnalyticsEventTipNotDisplayed initWithTipID:correlationID:bundleID:reason:context:date:displayType:](self, "initWithTipID:correlationID:bundleID:reason:context:date:displayType:", v15, v16, v17, v14, v18, v19, 0);

  return v20;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 reason:(int64_t)a5 context:(id)a6
{
  return -[TPSAnalyticsEventTipNotDisplayed initWithTipID:correlationID:bundleID:reason:context:date:](self, "initWithTipID:correlationID:bundleID:reason:context:date:", a3, a4, 0, a5, a6, 0);
}

- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 reason:(int64_t)a6 context:(id)a7 date:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  TPSAnalyticsEventTipNotDisplayed *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:](TPSAnalyticsCommonDefines, "ineligibleReasonStringForReason:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[TPSAnalyticsEventTipNotDisplayed initWithTipID:correlationID:bundleID:reason:context:date:displayType:](self, "initWithTipID:correlationID:bundleID:reason:context:date:displayType:", v14, v15, v16, v19, v17, v18, 0);

  return v20;
}

- (TPSAnalyticsEventTipNotDisplayed)initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 reason:(id)a6 context:(id)a7 date:(id)a8 displayType:(id)a9
{
  id v16;
  id v17;
  id v18;
  TPSAnalyticsEventTipNotDisplayed *v19;
  TPSAnalyticsEventTipNotDisplayed *v20;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v22 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v22, v24, v25, v26);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27.receiver = self;
  v27.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  v19 = -[TPSAnalyticsEvent initWithDate:](&v27, sel_initWithDate_, v17, v22);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_tipID, a3);
    objc_storeStrong((id *)&v20->_correlationID, a4);
    objc_storeStrong((id *)&v20->_bundleID, a5);
    objc_storeStrong((id *)&v20->_context, a7);
    objc_storeStrong((id *)&v20->_displayType, a9);
    objc_storeStrong((id *)&v20->_reason, a6);
  }

  return v20;
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
  NSString *correlationID;
  NSString *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *displayType;
  NSString *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  -[TPSAnalyticsEvent setDataProvider:](&v24, sel_setDataProvider_, a3);
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
  correlationID = self->_correlationID;
  if (correlationID)
  {
    v15 = correlationID;
    v16 = self->_correlationID;
    self->_correlationID = v15;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "correlationIDForIdentifier:", self->_tipID);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_correlationID;
    self->_correlationID = v17;

  }
  displayType = self->_displayType;
  if (displayType)
  {
    v20 = displayType;
    v21 = self->_displayType;
    self->_displayType = v20;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "displayTypeForIdentifier:", self->_tipID);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = self->_displayType;
    self->_displayType = v22;

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventTipNotDisplayed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reason, CFSTR("reason"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("tip_not_displayed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_reason, CFSTR("reason"));
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

- (NSString)displayType
{
  return self->_displayType;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
