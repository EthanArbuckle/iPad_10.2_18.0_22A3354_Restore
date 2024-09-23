@implementation SUPolicyApply

- (SUPolicyApply)initWithInstallOptions:(id)a3
{
  id v5;
  SUPolicyApply *v6;
  SUPolicyApply *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUPolicyApply;
  v6 = -[SUPolicyApply init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_installOptions, a3);

  return v7;
}

- (BOOL)checkAvailableSpace
{
  return 1;
}

- (int)cacheDeleteUrgency
{
  return 4;
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installOptions, 0);
}

@end
