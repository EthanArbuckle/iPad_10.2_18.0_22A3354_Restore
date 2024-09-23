@implementation STRootGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCoordinator:", v3);

  return v4;
}

- (void)invalidate
{
  objc_super v3;

  -[STRootGroupSpecifierProvider setCoordinator:](self, "setCoordinator:", 0);
  v3.receiver = self;
  v3.super_class = (Class)STRootGroupSpecifierProvider;
  -[STGroupSpecifierProvider invalidate](&v3, sel_invalidate);
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
