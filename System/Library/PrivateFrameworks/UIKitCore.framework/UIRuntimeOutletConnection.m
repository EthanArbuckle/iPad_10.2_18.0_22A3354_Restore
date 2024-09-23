@implementation UIRuntimeOutletConnection

- (void)connect
{
  void *v3;
  void *v4;
  id v5;

  -[UIRuntimeConnection source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v3, v4);

}

- (void)connectForSimulator
{
  void *v3;
  void *v4;
  id v5;

  -[UIRuntimeConnection source](self, "source");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v3, v4);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIRuntimeConnection source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Outlet connection with source %@, value %@, and variable name %@."), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
