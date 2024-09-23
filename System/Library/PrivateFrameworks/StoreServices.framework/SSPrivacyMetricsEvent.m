@implementation SSPrivacyMetricsEvent

- (SSPrivacyMetricsEvent)init
{
  SSPrivacyMetricsEvent *v2;
  SSPrivacyMetricsEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSPrivacyMetricsEvent;
  v2 = -[SSMetricsMutableEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSMetricsMutableEvent setTopic:](v2, "setTopic:", CFSTR("xp_amp_gdpr"));
  return v3;
}

- (BOOL)acknowledged
{
  void *v2;
  BOOL v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("acknowledged"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)acknowledgmentIdentifier
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("acknowledgmentGroup"));
}

- (NSNumber)acknowledgmentVersion
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("displayed"));
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("displayed"));
}

- (BOOL)displayed
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("displayed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAcknowledged:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("acknowledged"));

}

- (void)setAcknowledgmentIdentifier:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  SSPrivacyMetricsEvent *v8;
  __CFString *v9;

  v9 = (__CFString *)a3;
  +[SSPrivacyController storePrivacyIdentifiers](SSPrivacyController, "storePrivacyIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v9))
  {

  }
  else
  {
    +[SSPrivacyController appStorePrivacyIdentifiers](SSPrivacyController, "appStorePrivacyIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v9);

    if (!v6)
    {
      v8 = self;
      v7 = v9;
      goto LABEL_6;
    }
  }
  v7 = CFSTR("Store");
  v8 = self;
LABEL_6:
  -[SSMetricsMutableEvent setProperty:forBodyKey:](v8, "setProperty:forBodyKey:", v7, CFSTR("acknowledgmentGroup"));

}

- (void)setAcknowledgmentVersion:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("acknowledgmentVersion"));
}

- (void)setBundleIdentifier:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("bundleIdentifier"));
}

- (void)setDisplayed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("displayed"));

}

@end
