@implementation TFFeedbackHandleConfiguration

- (TFFeedbackHandleConfiguration)initWithBundleURL:(id)a3
{
  void *v4;
  void *v5;
  TFFeedbackHandleConfiguration *v6;

  +[TFBundle bundleIdentifierForBundleURL:](TFBundle, "bundleIdentifierForBundleURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = -[TFFeedbackHandleConfiguration initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v5);
  return v6;
}

- (TFFeedbackHandleConfiguration)initWithBundleIdentifier:(id)a3
{
  id v4;
  TFFeedbackHandleConfiguration *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TFFeedbackHandleConfiguration;
  v5 = -[TFFeedbackHandleConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)encodedAsUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[TFFeedbackHandleConfiguration bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CONFIG_BUNDLE_ID"));

  -[TFFeedbackHandleConfiguration incidentId](self, "incidentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TFFeedbackHandleConfiguration incidentId](self, "incidentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CONFIG_INCIDENT_ID"));

  }
  return v3;
}

+ (id)configurationFromUserInfo:(id)a3
{
  id v3;
  void *v4;
  TFFeedbackHandleConfiguration *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONFIG_BUNDLE_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[TFFeedbackHandleConfiguration initWithBundleIdentifier:]([TFFeedbackHandleConfiguration alloc], "initWithBundleIdentifier:", v4);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONFIG_INCIDENT_ID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[TFFeedbackHandleConfiguration setIncidentId:](v5, "setIncidentId:", v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TFFeedbackHandleConfiguration *v4;
  void *v5;
  TFFeedbackHandleConfiguration *v6;
  void *v7;

  v4 = [TFFeedbackHandleConfiguration alloc];
  -[TFFeedbackHandleConfiguration bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TFFeedbackHandleConfiguration initWithBundleIdentifier:](v4, "initWithBundleIdentifier:", v5);

  -[TFFeedbackHandleConfiguration incidentId](self, "incidentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackHandleConfiguration setIncidentId:](v6, "setIncidentId:", v7);

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)incidentId
{
  return self->_incidentId;
}

- (void)setIncidentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
