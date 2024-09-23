@implementation TUApplicationWorkspace

+ (id)shared
{
  if (shared_onceToken[0] != -1)
    dispatch_once(shared_onceToken, &__block_literal_global_1);
  return (id)shared_instance;
}

void __32__TUApplicationWorkspace_shared__block_invoke()
{
  TUApplicationWorkspace *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [TUApplicationWorkspace alloc];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[TUApplicationWorkspace initWithApplicationWorkspace:](v0, "initWithApplicationWorkspace:", v3);
  v2 = (void *)shared_instance;
  shared_instance = v1;

}

- (TUApplicationWorkspace)initWithApplicationWorkspace:(id)a3
{
  id v5;
  TUApplicationWorkspace *v6;
  TUApplicationWorkspace *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUApplicationWorkspace;
  v6 = -[TUApplicationWorkspace init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_applicationWorkspace, a3);

  return v7;
}

- (void)openSensitiveURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUApplicationWorkspace applicationWorkspace](self, "applicationWorkspace");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openURL:withOptions:", v7, v6);

}

- (LSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
}

@end
