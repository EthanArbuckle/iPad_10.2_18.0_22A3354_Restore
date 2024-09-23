@implementation SUPolicyGlobal

- (SUPolicyGlobal)init
{
  return -[SUPolicyGlobal initWithGlobalOptions:](self, "initWithGlobalOptions:", 0);
}

- (SUPolicyGlobal)initWithGlobalOptions:(id)a3
{
  id v4;
  SUPolicyGlobal *v5;
  SUPolicyGlobal *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUPolicyGlobal;
  v5 = -[SUPolicyGlobal init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SUPolicyGlobal setGlobalOptions:](v5, "setGlobalOptions:", v4);

  return v6;
}

- (int)cacheDeleteUrgency
{
  return 4;
}

- (BOOL)checkAvailableSpace
{
  return 0;
}

- (NSDictionary)updateMetricEventFields
{
  void *v2;
  void *v3;

  -[SUPolicyGlobal globalOptions](self, "globalOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMetricEventFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)updateMetricContext
{
  return (NSString *)CFSTR("SUS-2.0");
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUPolicyGlobal _stringForBool:](self, "_stringForBool:", -[SUPolicyGlobal cacheDeleteUrgency](self, "cacheDeleteUrgency") != 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyGlobal _stringForBool:](self, "_stringForBool:", -[SUPolicyGlobal checkAvailableSpace](self, "checkAvailableSpace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyGlobal updateMetricContext](self, "updateMetricContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyGlobal updateMetricEventFields](self, "updateMetricEventFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            cacheDeleteUrgency: %@\n            checkAvailableSpace: %@\n            updateMetricContext: %@\n            updateMetricEventFields: %@\n"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SUPolicyGlobalOptions)globalOptions
{
  return self->_globalOptions;
}

- (void)setGlobalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_globalOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalOptions, 0);
}

@end
