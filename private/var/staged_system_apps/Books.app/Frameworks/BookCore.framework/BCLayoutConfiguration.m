@implementation BCLayoutConfiguration

- (BCLayoutConfiguration)initWithViewController:(id)a3 configurationEnvironment:(id)a4
{
  id v6;
  BCLayoutConfigurationEnvironment *v7;
  BCLayoutConfiguration *v8;
  BCLayoutConfiguration *v9;
  objc_super v11;

  v6 = a3;
  v7 = (BCLayoutConfigurationEnvironment *)a4;
  if (!v7)
    v7 = -[BCLayoutConfigurationEnvironment initWithViewController:]([BCLayoutConfigurationEnvironment alloc], "initWithViewController:", v6);
  v11.receiver = self;
  v11.super_class = (Class)BCLayoutConfiguration;
  v8 = -[BCLayoutConfiguration init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_environment, v7);
    objc_storeWeak((id *)&v9->_viewController, v6);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;

  v5 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  v8 = objc_msgSend(v7, "copyWithZone:", a3);
  v9 = objc_msgSend(v5, "initWithViewController:configurationEnvironment:", WeakRetained, v8);

  return v9;
}

- (BOOL)isEqualToLayoutConfiguration:(id)a3
{
  id *v4;
  id WeakRetained;
  id v6;
  unsigned __int8 v7;
  BCLayoutConfigurationEnvironment *environment;

  v4 = (id *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = objc_loadWeakRetained(v4 + 1);
  if (WeakRetained == v6)
  {
    environment = self->_environment;
    if (environment == v4[2])
      v7 = 1;
    else
      v7 = -[BCLayoutConfigurationEnvironment isEqual:](environment, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  BCLayoutConfiguration *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BCLayoutConfiguration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(BCLayoutConfiguration);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[BCLayoutConfiguration isEqualToLayoutConfiguration:](self, "isEqualToLayoutConfiguration:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCLayoutConfiguration environment](self, "environment"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p environment:%@, viewController:%@>"), v5, self, v6, WeakRetained));

  return v8;
}

- (BCLayoutConfigurationEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
