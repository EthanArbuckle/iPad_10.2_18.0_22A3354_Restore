@implementation RBBundlePropertiesManager

- (id)propertiesForIdentity:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RBBundleProperties *v9;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "bundleProperties");
  v9 = (RBBundleProperties *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
    v9 = -[RBBundleProperties initWithLSProvider:xpcProvider:processIdentity:processIdentifier:]([RBBundleProperties alloc], "initWithLSProvider:xpcProvider:processIdentity:processIdentifier:", self->_lsProvider, self->_xpcProvider, v6, v7);

  return v9;
}

- (void)removeProcess:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  RBBundlePropertiesBSXPCProvider *xpcProvider;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[RBProcessIndex removeProcess:](self->_processIndex, "removeProcess:", v5);
  xpcProvider = self->_xpcProvider;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBBundlePropertiesBSXPCProvider removePropertiesForIdentifier:](xpcProvider, "removePropertiesForIdentifier:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (RBBundlePropertiesManager)init
{
  RBBundlePropertiesManager *v2;
  RBBundlePropertiesManager *v3;
  RBBundlePropertiesLSProvider *v4;
  RBBundlePropertiesLSProvider *lsProvider;
  RBProcessIndex *v6;
  RBProcessIndex *processIndex;
  RBBundlePropertiesBSXPCProvider *v8;
  RBBundlePropertiesBSXPCProvider *xpcProvider;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RBBundlePropertiesManager;
  v2 = -[RBBundlePropertiesManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(RBBundlePropertiesLSProvider);
    lsProvider = v3->_lsProvider;
    v3->_lsProvider = v4;

    -[RBBundlePropertiesLSProvider setDelegate:](v3->_lsProvider, "setDelegate:", v3);
    v6 = objc_alloc_init(RBProcessIndex);
    processIndex = v3->_processIndex;
    v3->_processIndex = v6;

    v8 = objc_alloc_init(RBBundlePropertiesBSXPCProvider);
    xpcProvider = v3->_xpcProvider;
    v3->_xpcProvider = v8;

  }
  return v3;
}

- (RBBundlePropertiesManagerDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  RBBundlePropertiesManagerDelegate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  RBBundlePropertiesManagerDelegate *v4;
  RBBundlePropertiesManagerDelegate *delegate;

  v4 = (RBBundlePropertiesManagerDelegate *)a3;
  os_unfair_lock_lock(&self->_lock);
  delegate = self->_delegate;
  self->_delegate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBBundlePropertiesLSProvider debugDescription](self->_lsProvider, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBBundlePropertiesBSXPCProvider debugDescription](self->_xpcProvider, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| lsProvider:%@\n\txpcProvider:%@>"), v4, v5, v6);

  return (NSString *)v7;
}

- (void)addProcess:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[RBProcessIndex addProcess:](self->_processIndex, "addProcess:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)bundlePropertiesProvider:(id)a3 didChangePropertiesForProcessIdentities:(id)a4
{
  -[RBBundlePropertiesManagerDelegate bundlePropertiesManager:didChangePropertiesForProcessIdentities:](self->_delegate, "bundlePropertiesManager:didChangePropertiesForProcessIdentities:", self, a4);
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_processIndex, 0);
  objc_storeStrong((id *)&self->_xpcProvider, 0);
  objc_storeStrong((id *)&self->_lsProvider, 0);
}

@end
