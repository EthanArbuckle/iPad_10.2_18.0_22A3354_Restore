@implementation TPSAnalyticsEventTipTapped

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventTipTapped)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventTipTapped *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  void *v10;
  uint64_t v11;
  NSString *bundleID;
  uint64_t v13;
  NSString *context;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TPSAnalyticsEventTipTapped;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v16, sel_initWithCoder_, v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayType = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_ID"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v13 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v13;

  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4
{
  return -[TPSAnalyticsEventTipTapped _initWithTipID:correlationID:bundleID:context:](self, "_initWithTipID:correlationID:bundleID:context:", a3, a4, 0, 0);
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TPSAnalyticsEventTipTapped *v15;
  TPSAnalyticsEventTipTapped *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TPSAnalyticsEventTipTapped;
  v15 = -[TPSAnalyticsEvent initWithDate:](&v18, sel_initWithDate_, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_tipID, a3);
    objc_storeStrong((id *)&v16->_correlationID, a4);
    v16->_displayType = 2;
    objc_storeStrong((id *)&v16->_bundleID, a5);
    objc_storeStrong((id *)&v16->_context, a6);
  }

  return v16;
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

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6
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
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:bundleID:context:", v13, v12, v11, v10);

  return v14;
}

- (void)setDataProvider:(id)a3
{
  NSString *bundleID;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *correlationID;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *context;
  NSString *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventTipTapped;
  -[TPSAnalyticsEvent setDataProvider:](&v19, sel_setDataProvider_, a3);
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
  correlationID = self->_correlationID;
  if (correlationID)
  {
    v10 = correlationID;
    v11 = self->_correlationID;
    self->_correlationID = v10;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "correlationIDForIdentifier:", self->_tipID);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_correlationID;
    self->_correlationID = v12;

  }
  context = self->_context;
  if (context)
  {
    v15 = context;
    v16 = self->_context;
    self->_context = v15;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contextForIdentifier:", self->_tipID);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_context;
    self->_context = v17;

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsEventTipTapped;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("display_type"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("tip_tapped"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:](TPSAnalyticsCommonDefines, "displayTypeStringForDisplayType:", self->_displayType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("display_type"));

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

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
