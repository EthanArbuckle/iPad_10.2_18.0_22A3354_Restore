@implementation PSUsageBundleCategory

+ (id)categoryNamed:(id)a3 withIdentifier:(id)a4 forUsageBundleApp:(id)a5
{
  id v7;
  id v8;
  id v9;
  PSUsageBundleCategory *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PSUsageBundleCategory);
  -[PSUsageBundleCategory setIdentifier:](v10, "setIdentifier:", v8);

  -[PSUsageBundleCategory setName:](v10, "setName:", v9);
  -[PSUsageBundleCategory setUsageBundleApp:](v10, "setUsageBundleApp:", v7);

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PSUsageBundleCategory usageBundleApp](self, "usageBundleApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageBundleCategory identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUsageBundleCategory name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ (%@)"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PSUsageBundleApp)usageBundleApp
{
  return (PSUsageBundleApp *)objc_loadWeakRetained((id *)&self->_usageBundleApp);
}

- (void)setUsageBundleApp:(id)a3
{
  objc_storeWeak((id *)&self->_usageBundleApp, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_usageBundleApp);
}

@end
