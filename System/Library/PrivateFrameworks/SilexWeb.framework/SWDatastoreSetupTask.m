@implementation SWDatastoreSetupTask

- (SWDatastoreSetupTask)initWithDatastoreManager:(id)a3 scriptsManager:(id)a4
{
  id v7;
  id v8;
  SWDatastoreSetupTask *v9;
  SWDatastoreSetupTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWDatastoreSetupTask;
  v9 = -[SWDatastoreSetupTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_datastoreManager, a3);
    objc_storeStrong((id *)&v10->_scriptsManager, a4);
  }

  return v10;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("datastore");
}

- (void)performSetup
{
  SWDatastoreSetupScript *v3;
  void *v4;
  void *v5;
  void *v6;
  SWDatastoreSetupScript *v7;

  v3 = [SWDatastoreSetupScript alloc];
  -[SWDatastoreSetupTask datastoreManager](self, "datastoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datastore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SWDatastoreSetupScript initWithDatastore:](v3, "initWithDatastore:", v5);

  -[SWDatastoreSetupTask scriptsManager](self, "scriptsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addScript:", v7);

}

- (SWDatastoreManager)datastoreManager
{
  return self->_datastoreManager;
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptsManager, 0);
  objc_storeStrong((id *)&self->_datastoreManager, 0);
}

@end
