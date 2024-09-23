@implementation TPSAnalyticsEventContentRetrieved

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentRetrieved)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventContentRetrieved *v5;
  uint64_t v6;
  NSString *tipID;
  uint64_t v8;
  NSString *correlationID;
  uint64_t v10;
  NSString *context;
  uint64_t v12;
  NSString *bundleID;
  uint64_t v14;
  NSString *serviceError;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventContentRetrieved;
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v10 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_ID"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service_error"));
    v14 = objc_claimAutoreleasedReturnValue();
    serviceError = v5->_serviceError;
    v5->_serviceError = (NSString *)v14;

  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 serviceError:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TPSAnalyticsEventContentRetrieved *v17;
  id *p_isa;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentRetrieved;
  v17 = -[TPSAnalyticsEvent initWithDate:](&v21, sel_initWithDate_, 0);
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tipID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 7, a6);
    objc_storeStrong(p_isa + 8, a7);
  }

  return p_isa;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 serviceError:(id)a5
{
  return -[TPSAnalyticsEventContentRetrieved _initWithTipID:correlationID:bundleID:context:serviceError:](self, "_initWithTipID:correlationID:bundleID:context:serviceError:", a3, a4, 0, 0, a5);
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 serviceError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:serviceError:", v10, v9, v8);

  return v11;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 bundleID:(id)a5 context:(id)a6 serviceError:(id)a7
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
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTipID:correlationID:bundleID:context:serviceError:", v16, v15, v14, v13, v12);

  return v17;
}

- (void)setDataProvider:(id)a3
{
  NSString *correlationID;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *bundleID;
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
  v19.super_class = (Class)TPSAnalyticsEventContentRetrieved;
  -[TPSAnalyticsEvent setDataProvider:](&v19, sel_setDataProvider_, a3);
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
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v10 = bundleID;
    v11 = self->_bundleID;
    self->_bundleID = v10;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIDForIdentifier:", self->_tipID);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_bundleID;
    self->_bundleID = v12;

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
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentRetrieved;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, CFSTR("tip_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceError, CFSTR("service_error"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("content_retrieved"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_tipID, CFSTR("tip_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_correlationID, CFSTR("tip_correlation_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_context, CFSTR("context"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleID, CFSTR("bundle_ID"));
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

- (NSString)serviceError
{
  return self->_serviceError;
}

- (void)setServiceError:(id)a3
{
  objc_storeStrong((id *)&self->_serviceError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceError, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end
