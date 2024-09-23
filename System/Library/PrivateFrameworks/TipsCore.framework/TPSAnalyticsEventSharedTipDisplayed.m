@implementation TPSAnalyticsEventSharedTipDisplayed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSharedTipDisplayed)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventSharedTipDisplayed *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *collectionID;
  uint64_t v12;
  NSString *variantID;
  uint64_t v14;
  NSString *eligibility;
  uint64_t v16;
  NSString *message;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventSharedTipDisplayed;
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collection_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip_variant_ID"));
    v12 = objc_claimAutoreleasedReturnValue();
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibility"));
    v14 = objc_claimAutoreleasedReturnValue();
    eligibility = v5->_eligibility;
    v5->_eligibility = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v16 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSharedTipDisplayed;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_collectionID, CFSTR("collection_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_variantID, CFSTR("tip_variant_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_eligibility, CFSTR("eligibility"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_message, CFSTR("message"));

}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 collectionID:(id)a5 variantID:(id)a6 eligibility:(id)a7 message:(id)a8
{
  id v15;
  id v16;
  void *v17;
  TPSAnalyticsEventSharedTipDisplayed *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)TPSAnalyticsEventSharedTipDisplayed;
  v18 = -[TPSAnalyticsEvent initWithDate:](&v24, sel_initWithDate_, v17);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_tipID, a3);
    objc_storeStrong((id *)&v18->_correlationID, a4);
    objc_storeStrong((id *)&v18->_collectionID, a5);
    objc_storeStrong((id *)&v18->_variantID, a6);
    objc_storeStrong((id *)&v18->_eligibility, a7);
    objc_storeStrong((id *)&v18->_message, a8);
  }

  return v18;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 collectionID:(id)a5 variantID:(id)a6 message:(id)a7 isEligible:(BOOL)a8
{
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  const __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;

  v14 = a3;
  v15 = a4;
  v16 = (__CFString *)a5;
  v17 = a6;
  v18 = (__CFString *)a7;
  v19 = v18;
  if (a8)
  {
    v20 = CFSTR("eligible");
  }
  else if (-[__CFString length](v18, "length"))
  {
    v20 = CFSTR("ineligible");
  }
  else
  {
    v20 = CFSTR("ineligible - with correlating tip");
  }
  if (-[__CFString length](v19, "length"))
    v21 = v19;
  else
    v21 = CFSTR("n/a");
  v22 = v21;
  if (-[__CFString length](v16, "length"))
    v23 = v16;
  else
    v23 = CFSTR("n/a");
  v24 = v23;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:collectionID:variantID:eligibility:message:", v14, v15, v24, v17, v20, v22);

  return v25;
}

+ (id)eventWithTipID:(id)a3 invalidVariantID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:collectionID:variantID:eligibility:message:", v7, CFSTR("n/a"), CFSTR("n/a"), v6, CFSTR("ineligible - invalid URL"), CFSTR("ineligible - invalid URL"));

  return v8;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("tip_shared"));
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAnalyticsEventSharedTipDisplayed tipID](self, "tipID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("tip_ID"));

  -[TPSAnalyticsEventSharedTipDisplayed correlationID](self, "correlationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("tip_correlation_ID"));

  -[TPSAnalyticsEventSharedTipDisplayed collectionID](self, "collectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("collection_ID"));

  -[TPSAnalyticsEventSharedTipDisplayed variantID](self, "variantID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("tip_variant_ID"));

  -[TPSAnalyticsEventSharedTipDisplayed eligibility](self, "eligibility");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eligibility"));

  -[TPSAnalyticsEventSharedTipDisplayed message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("message"));

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_eligibility, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
