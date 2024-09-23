@implementation TPSAnalyticsEventContentIneligible

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentIneligible)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventContentIneligible *v5;
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
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TPSAnalyticsEventContentIneligible;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v18, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayCount = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reason = objc_msgSend(v16, "integerValue");

  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 reason:(int64_t)a8 date:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  TPSAnalyticsEventContentIneligible *v18;
  TPSAnalyticsEventContentIneligible *v19;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TPSAnalyticsEventContentIneligible;
  v18 = -[TPSAnalyticsEvent initWithDate:](&v23, sel_initWithDate_, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tipID, a3);
    objc_storeStrong((id *)&v19->_correlationID, a4);
    objc_storeStrong((id *)&v19->_bundleID, a5);
    objc_storeStrong((id *)&v19->_context, a6);
    v19->_displayType = a7;
    v19->_reason = a8;
  }

  return v19;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 displayType:(unint64_t)a7 reason:(int64_t)a8 date:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v16 = a9;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:bundleID:context:displayType:reason:date:", v20, v19, v18, v17, a7, a8, v16);

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSAnalyticsEventContentIneligible;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v8.receiver, v8.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("display_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("display_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("reason"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("content_ineligible"));
}

- (void)setDataProvider:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentIneligible;
  -[TPSAnalyticsEvent setDataProvider:](&v5, sel_setDataProvider_, a3);
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
  +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:](TPSAnalyticsCommonDefines, "displayTypeStringForDisplayType:", self->_displayType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("display_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_displayCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("display_count"));

  +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:](TPSAnalyticsCommonDefines, "ineligibleReasonStringForReason:", self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("reason"));

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

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(unint64_t)a3
{
  self->_displayCount = a3;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
