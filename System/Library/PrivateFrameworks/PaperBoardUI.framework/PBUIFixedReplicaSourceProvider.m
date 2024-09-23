@implementation PBUIFixedReplicaSourceProvider

- (PBUIFixedReplicaSourceProvider)init
{
  PBUIFixedReplicaSourceProvider *v2;
  PBUIReplicaSourceObserverBox *v3;
  PBUIReplicaSourceObserverBox *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIFixedReplicaSourceProvider;
  v2 = -[PBUIFixedReplicaSourceProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PBUIReplicaSourceObserverBox initWithIdentifier:]([PBUIReplicaSourceObserverBox alloc], "initWithIdentifier:", CFSTR("FixedSourceProvider"));
    observers = v2->_observers;
    v2->_observers = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PBUIFixedReplicaSourceProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBUIFixedReplicaSourceProvider;
  -[PBUIFixedReplicaSourceProvider dealloc](&v3, sel_dealloc);
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  return -[PBUIReplicaSourceObserverBox registerSourceObserver:](self->_observers, "registerSourceObserver:", a3);
}

- (id)registerPortalSourceObserver:(id)a3
{
  return -[PBUIReplicaSourceObserverBox registerSourceObserver:](self->_observers, "registerSourceObserver:", a3);
}

- (void)setPortalSource:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_portalSource, a3);
    -[PBUIReplicaSourceObserverBox setNeedsSourceUpdate](self->_observers, "setNeedsSourceUpdate");
  }

}

- (void)setSnapshotSource:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_snapshotSource, a3);
    -[PBUIReplicaSourceObserverBox setNeedsSourceUpdate](self->_observers, "setNeedsSourceUpdate");
  }

}

- (void)invalidate
{
  -[PBUIReplicaSourceObserverBox invalidate](self->_observers, "invalidate");
}

- (PBUIReplicaPortalSource)portalSource
{
  return self->_portalSource;
}

- (PBUIReplicaSnapshotSource)snapshotSource
{
  return self->_snapshotSource;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_snapshotSource, 0);
  objc_storeStrong((id *)&self->_portalSource, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
