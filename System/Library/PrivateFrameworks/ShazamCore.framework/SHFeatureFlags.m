@implementation SHFeatureFlags

- (SHFeatureFlags)initWithConfiguration:(id)a3
{
  id v5;
  SHFeatureFlags *v6;
  SHFeatureFlags *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHFeatureFlags;
  v6 = -[SHFeatureFlags init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featureFlags, a3);

  return v7;
}

- (BOOL)shouldDisplayShazamUpsell
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("nativeTrackPage"), CFSTR("displayShazamUpsell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHFeatureFlags featureFlags](self, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (NSDictionary)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end
