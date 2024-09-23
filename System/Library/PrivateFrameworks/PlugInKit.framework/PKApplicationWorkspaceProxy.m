@implementation PKApplicationWorkspaceProxy

- (void)addObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1AF45AD14]();
  -[PKApplicationWorkspaceProxy lsObject](self, "lsObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v6);

  objc_autoreleasePoolPop(v4);
}

- (LSApplicationWorkspace)lsObject
{
  return self->_lsObject;
}

+ (id)defaultWorkspace
{
  if (qword_1ECDD6FE0 != -1)
    dispatch_once(&qword_1ECDD6FE0, &unk_1E5F40578);
  return (id)qword_1ECDD6FD8;
}

- (PKApplicationWorkspaceProxy)init
{
  PKApplicationWorkspaceProxy *v2;
  uint64_t v3;
  LSApplicationWorkspace *lsObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplicationWorkspaceProxy;
  v2 = -[PKApplicationWorkspaceProxy init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = objc_claimAutoreleasedReturnValue();
    lsObject = v2->_lsObject;
    v2->_lsObject = (LSApplicationWorkspace *)v3;

  }
  return v2;
}

- (id)installedPlugins
{
  void *v2;
  void *v3;

  -[PKApplicationWorkspaceProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedPlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKApplicationWorkspaceProxy lsObject](self, "lsObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (id)pluginsMatchingQuery:(id)a3 applyFilter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PKApplicationWorkspaceProxy lsObject](self, "lsObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginsMatchingQuery:applyFilter:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)registerPlugin:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKApplicationWorkspaceProxy lsObject](self, "lsObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "registerPlugin:", v4);

  return v6;
}

- (BOOL)unregisterPlugin:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKApplicationWorkspaceProxy lsObject](self, "lsObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unregisterPlugin:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsObject, 0);
}

@end
