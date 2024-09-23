@implementation SWLocalDatastoreSetupTask

- (SWLocalDatastoreSetupTask)initWithDatastoreManager:(id)a3 scriptsManager:(id)a4
{
  id v7;
  id v8;
  SWLocalDatastoreSetupTask *v9;
  SWLocalDatastoreSetupTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWLocalDatastoreSetupTask;
  v9 = -[SWLocalDatastoreSetupTask init](&v12, sel_init);
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
  return (NSString *)CFSTR("localDatastore");
}

- (void)performSetup
{
  SWLocalDatastoreSetupScript *v3;
  void *v4;
  void *v5;
  void *v6;
  SWLocalDatastoreSetupScript *v7;

  v3 = [SWLocalDatastoreSetupScript alloc];
  -[SWLocalDatastoreSetupTask datastoreManager](self, "datastoreManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datastore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SWLocalDatastoreSetupScript initWithDatastore:](v3, "initWithDatastore:", v5);

  -[SWLocalDatastoreSetupTask scriptsManager](self, "scriptsManager");
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
