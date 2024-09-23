@implementation PBUIDynamicProviderWrapper

- (void)setRootObject:(id)a3
{
  BSInvalidatable *portalObserver;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  BSInvalidatable *snapshotObserver;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  id v13;

  v13 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong(&self->_rootObject, a3);
    portalObserver = self->_portalObserver;
    if (portalObserver)
    {
      -[BSInvalidatable invalidate](portalObserver, "invalidate");
      -[PBUIDynamicProviderWrapper _portalProvider](self, "_portalProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registerPortalSourceObserver:", self->_portalObservers);
      v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_portalObserver;
      self->_portalObserver = v7;

      -[PBUIReplicaSourceObserverBox setNeedsSourceUpdate](self->_portalObservers, "setNeedsSourceUpdate");
    }
    snapshotObserver = self->_snapshotObserver;
    if (snapshotObserver)
    {
      -[BSInvalidatable invalidate](snapshotObserver, "invalidate");
      -[PBUIDynamicProviderWrapper _snapshotProvider](self, "_snapshotProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerSnapshotSourceObserver:", self->_snapshotObservers);
      v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v12 = self->_snapshotObserver;
      self->_snapshotObserver = v11;

      -[PBUIReplicaSourceObserverBox setNeedsSourceUpdate](self->_snapshotObservers, "setNeedsSourceUpdate");
    }
  }

}

- (id)snapshotSourceForObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBUIDynamicProviderWrapper _snapshotProvider](self, "_snapshotProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotSourceForObserver:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_snapshotProvider
{
  void (**makeSnapshotProvider)(void);

  if (self->_rootObject)
  {
    makeSnapshotProvider = (void (**)(void))self->_makeSnapshotProvider;
    if (makeSnapshotProvider)
    {
      makeSnapshotProvider[2]();
      makeSnapshotProvider = (void (**)(void))objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    makeSnapshotProvider = 0;
  }
  return makeSnapshotProvider;
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  id v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *snapshotObserver;
  void *v8;

  v4 = a3;
  if (!self->_snapshotObserver)
  {
    -[PBUIDynamicProviderWrapper _snapshotProvider](self, "_snapshotProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerSnapshotSourceObserver:", self->_snapshotObservers);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    snapshotObserver = self->_snapshotObserver;
    self->_snapshotObserver = v6;

  }
  -[PBUIReplicaSourceObserverBox registerSourceObserver:](self->_snapshotObservers, "registerSourceObserver:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PBUIDynamicProviderWrapper)initWithRootObject:(id)a3 portalProvider:(id)a4 snapshotProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PBUIDynamicProviderWrapper *v12;
  PBUIDynamicProviderWrapper *v13;
  uint64_t v14;
  id makePortalProvider;
  uint64_t v16;
  id makeSnapshotProvider;
  PBUIReplicaSourceObserverBox *v18;
  PBUIReplicaSourceObserverBox *portalObservers;
  PBUIReplicaSourceObserverBox *v20;
  PBUIReplicaSourceObserverBox *snapshotObservers;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PBUIDynamicProviderWrapper;
  v12 = -[PBUIDynamicProviderWrapper init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_rootObject, a3);
    v14 = MEMORY[0x1BCCA5978](v10);
    makePortalProvider = v13->_makePortalProvider;
    v13->_makePortalProvider = (id)v14;

    v16 = MEMORY[0x1BCCA5978](v11);
    makeSnapshotProvider = v13->_makeSnapshotProvider;
    v13->_makeSnapshotProvider = (id)v16;

    v18 = -[PBUIReplicaSourceObserverBox initWithIdentifier:]([PBUIReplicaSourceObserverBox alloc], "initWithIdentifier:", CFSTR("DynamicPortalBox"));
    portalObservers = v13->_portalObservers;
    v13->_portalObservers = v18;

    v20 = -[PBUIReplicaSourceObserverBox initWithIdentifier:]([PBUIReplicaSourceObserverBox alloc], "initWithIdentifier:", CFSTR("DynamicSnapshotBox"));
    snapshotObservers = v13->_snapshotObservers;
    v13->_snapshotObservers = v20;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[PBUIDynamicProviderWrapper invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUIDynamicProviderWrapper;
  -[PBUIDynamicProviderWrapper dealloc](&v3, sel_dealloc);
}

- (id)_portalProvider
{
  void (**makePortalProvider)(void);

  if (self->_rootObject)
  {
    makePortalProvider = (void (**)(void))self->_makePortalProvider;
    if (makePortalProvider)
    {
      makePortalProvider[2]();
      makePortalProvider = (void (**)(void))objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    makePortalProvider = 0;
  }
  return makePortalProvider;
}

- (id)registerPortalSourceObserver:(id)a3
{
  id v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *portalObserver;
  void *v8;

  v4 = a3;
  if (!self->_portalObserver)
  {
    -[PBUIDynamicProviderWrapper _portalProvider](self, "_portalProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerPortalSourceObserver:", self->_portalObservers);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    portalObserver = self->_portalObserver;
    self->_portalObserver = v6;

  }
  -[PBUIReplicaSourceObserverBox registerSourceObserver:](self->_portalObservers, "registerSourceObserver:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)portalSourceForReplicaView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBUIDynamicProviderWrapper _portalProvider](self, "_portalProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "portalSourceForReplicaView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
  -[BSInvalidatable invalidate](self->_portalObserver, "invalidate");
  -[BSInvalidatable invalidate](self->_snapshotObserver, "invalidate");
  -[PBUIReplicaSourceObserverBox invalidate](self->_portalObservers, "invalidate");
  -[PBUIReplicaSourceObserverBox invalidate](self->_snapshotObservers, "invalidate");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)rootObject
{
  return self->_rootObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_snapshotObserver, 0);
  objc_storeStrong((id *)&self->_snapshotObservers, 0);
  objc_storeStrong(&self->_makeSnapshotProvider, 0);
  objc_storeStrong((id *)&self->_portalObserver, 0);
  objc_storeStrong((id *)&self->_portalObservers, 0);
  objc_storeStrong(&self->_makePortalProvider, 0);
}

@end
