@implementation TPSAnalyticsEventTipReadyToBeDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipReadyToBeDisplayed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventTipReadyToBeDisplayed *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *displayType;
  uint64_t v12;
  NSString *bundleID;
  uint64_t v14;
  NSString *context;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v17, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_type"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayType = v5->_displayType;
    v5->_displayType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_ID"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v14 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v14;

  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4
{
  return -[TPSAnalyticsEventTipReadyToBeDisplayed _initWithTipID:correlationID:bundleID:context:displayType:](self, "_initWithTipID:correlationID:bundleID:context:displayType:", a3, a4, 0, 0, 0);
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAnalyticsEventTipReadyToBeDisplayed *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v21, sel_initWithDate_, 0);
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tipID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 8, a7);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 7, a6);
  }

  return p_isa;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:", v7, v6);

  return v8;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:bundleID:context:displayType:", v16, v15, v14, v13, v12);

  return v17;
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
  v24.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
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
  v5.super_class = (Class)TPSAnalyticsEventTipReadyToBeDisplayed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("tip_ready_to_be_displayed"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayType, CFSTR("display_type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
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
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
