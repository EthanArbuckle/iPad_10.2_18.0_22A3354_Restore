@implementation HDSPMacReadyProvider

- (HDSPMacReadyProvider)initWithEnvironment:(id)a3
{
  id v4;
  HDSPMacReadyProvider *v5;
  HDSPMacReadyProvider *v6;
  HDSPMacReadyProvider *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPMacReadyProvider;
  v5 = -[HDSPMacReadyProvider init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isInDemoMode
{
  return 0;
}

- (BOOL)isSystemReady
{
  return 1;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSystemReadyDelegate)delegate
{
  return (HDSPSystemReadyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
