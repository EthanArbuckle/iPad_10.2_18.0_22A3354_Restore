@implementation SBSystemShellExternalDisplayPolicyAggregator

- (SBSystemShellExternalDisplayPolicyAggregator)initWithDefaults:(id)a3 displayIdentity:(id)a4 policyDataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSystemShellExternalDisplayPolicyAggregator *v12;
  SBSystemShellExternalDisplayPolicyAggregator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBSystemShellExternalDisplayPolicyAggregator;
  v12 = -[SBSystemShellExternalDisplayPolicyAggregator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_defaults, a3);
    objc_storeStrong((id *)&v13->_displayIdentity, a4);
    objc_storeWeak((id *)&v13->_policyDataSource, v11);
  }

  return v13;
}

- (BOOL)allowsCapability:(int64_t)a3
{
  return -[SBSystemShellExternalDisplayPolicyAggregator allowsCapability:explanation:](self, "allowsCapability:explanation:", a3, 0);
}

- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_policyDataSource);
  LOBYTE(a4) = objc_msgSend(WeakRetained, "allowsCapability:explanation:", a3, a4);

  return (char)a4;
}

- (BOOL)allowsTransitionRequest:(id)a3
{
  SBPolicyAggregatorCapabilityQuerying **p_policyDataSource;
  id v4;
  id WeakRetained;
  char v6;

  p_policyDataSource = &self->_policyDataSource;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_policyDataSource);
  v6 = objc_msgSend(WeakRetained, "allowsTransitionRequest:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_policyDataSource);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
