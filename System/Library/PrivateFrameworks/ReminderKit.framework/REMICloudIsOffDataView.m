@implementation REMICloudIsOffDataView

- (id)fetchICloudIsOffCloudConfigurationPropertiesWithError:(id *)a3
{
  REMICloudIsOffDataViewInvocation_fetchICCloudConfigurationProperties *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  _REMICloudIsOffCloudConfigurationStorage *v11;
  _REMICloudIsOffCloudConfigurationStorage *v12;

  v5 = objc_alloc_init(REMICloudIsOffDataViewInvocation_fetchICCloudConfigurationProperties);
  -[REMICloudIsOffDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceLastPrompt");
  if (v10 == 0.0)
  {
    if (a3 && !*a3)
    {
      +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("REMICloudIsOff: The ICCloudConfigurationProperty timeIntervalSinceLastPrompt is 0 and has not been set"));
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v11 = [_REMICloudIsOffCloudConfigurationStorage alloc];
    objc_msgSend(v9, "timeIntervalSinceLastPrompt");
    v12 = -[_REMICloudIsOffCloudConfigurationStorage initWithTimeIntervalSinceLastPrompt:](v11, "initWithTimeIntervalSinceLastPrompt:");
  }

  return v12;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (REMICloudIsOffDataView)initWithStore:(id)a3
{
  id v5;
  REMICloudIsOffDataView *v6;
  REMICloudIsOffDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMICloudIsOffDataView;
  v6 = -[REMICloudIsOffDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

@end
