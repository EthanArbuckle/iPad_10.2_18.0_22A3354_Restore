@implementation SWScriptsSetupTask

- (SWScriptsSetupTask)initWithScriptsManager:(id)a3
{
  id v5;
  SWScriptsSetupTask *v6;
  SWScriptsSetupTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWScriptsSetupTask;
  v6 = -[SWScriptsSetupTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scriptsManager, a3);

  return v7;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("scripts");
}

- (void)performSetup
{
  void *v3;
  SWSetupScript *v4;

  v4 = objc_alloc_init(SWSetupScript);
  -[SWScriptsSetupTask scriptsManager](self, "scriptsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addScript:", v4);

}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptsManager, 0);
}

@end
