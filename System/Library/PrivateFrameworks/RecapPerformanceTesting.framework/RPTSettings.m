@implementation RPTSettings

- (NSURL)recapOverrideFileURL
{
  return self->_recapOverrideFileURL;
}

+ (RPTSettings)processEnvironment
{
  if (processEnvironment_onceToken != -1)
    dispatch_once(&processEnvironment_onceToken, &__block_literal_global);
  return (RPTSettings *)(id)processEnvironment_currentEnvironment;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  RPTSettings *v5;
  uint64_t v6;
  NSURL *recapOverrideFileURL;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPTSettings;
  v5 = -[RPTSettings init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPT_OVERRIDE_RECAP_WITH_FILE"));
    v6 = objc_claimAutoreleasedReturnValue();
    recapOverrideFileURL = v5->_recapOverrideFileURL;
    v5->_recapOverrideFileURL = (NSURL *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RPT_ACTIVATION_ITERATION_COUNT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = (int)objc_msgSend(v8, "intValue");
    else
      v10 = -1;
    v5->_activationIterationCount = v10;

  }
  return v5;
}

void __33__RPTSettings_processEnvironment__block_invoke()
{
  RPTSettings *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [RPTSettings alloc];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[RPTSettings initFromDictionary:](v0, "initFromDictionary:", v1);
  v3 = (void *)processEnvironment_currentEnvironment;
  processEnvironment_currentEnvironment = v2;

}

- (RPTSettings)init
{
  RPTSettings *v2;
  RPTSettings *v3;
  NSURL *recapOverrideFileURL;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPTSettings;
  v2 = -[RPTSettings init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    recapOverrideFileURL = v2->_recapOverrideFileURL;
    v2->_recapOverrideFileURL = 0;

    v3->_activationIterationCount = -1;
  }
  return v3;
}

- (void)setRecapOverrideFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_recapOverrideFileURL, a3);
}

- (int64_t)activationIterationCount
{
  return self->_activationIterationCount;
}

- (void)setActivationIterationCount:(int64_t)a3
{
  self->_activationIterationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recapOverrideFileURL, 0);
}

@end
