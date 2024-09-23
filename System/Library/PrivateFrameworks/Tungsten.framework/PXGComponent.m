@implementation PXGComponent

- (void)performChanges:(id)a3
{
  id v4;
  int64_t nestedChanges;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  nestedChanges = self->_nestedChanges;
  v9 = v4;
  if (!nestedChanges)
  {
    -[PXGComponent observer](self, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentWillPerformChanges:", self);

    v4 = v9;
    nestedChanges = self->_nestedChanges;
  }
  self->_nestedChanges = nestedChanges + 1;
  (*((void (**)(id, PXGComponent *))v4 + 2))(v4, self);
  v7 = self->_nestedChanges - 1;
  self->_nestedChanges = v7;
  if (!v7)
  {
    -[PXGComponent observer](self, "observer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentDidPerformChanges:", self);

  }
}

- (PXGComponentObserver)observer
{
  return (PXGComponentObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (PXGComponentDataStore)dataStore
{
  return (PXGComponentDataStore *)self->_mutableDataStore;
}

- (PXGMutableComponentDataStore)previousDataStore
{
  return self->_previousDataStore;
}

- (PXGMutableComponentDataStore)mutableDataStore
{
  return self->_mutableDataStore;
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (PXGComponent)initWithDataStore:(id)a3
{
  id v6;
  PXGComponent *v7;
  uint64_t v8;
  uint64_t v9;
  PXGMutableComponentDataStore *previousDataStore;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGComponent;
  v7 = -[PXGComponent init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "elementSize");
    if (v8 != objc_msgSend((id)objc_opt_class(), "elementSize"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXGComponent.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataStore.elementSize == self.class.elementSize"));

    }
    objc_storeStrong((id *)&v7->_mutableDataStore, a3);
    if (objc_msgSend((id)objc_opt_class(), "shouldDiffForChanges"))
    {
      v9 = objc_msgSend(v6, "mutableCopy");
      previousDataStore = v7->_previousDataStore;
      v7->_previousDataStore = (PXGMutableComponentDataStore *)v9;

    }
  }

  return v7;
}

+ (BOOL)shouldDiffForChanges
{
  return 0;
}

- (PXGComponent)init
{
  return -[PXGComponent initWithDataStore:](self, "initWithDataStore:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDataStore, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_mutableDataStore, 0);
}

+ (id)createWithDefaultDataStore
{
  PXGMutableComponentDataStore *v4;
  void *v5;
  void *v7;

  if (!objc_msgSend(a1, "elementSize"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGComponent.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.elementSize != 0"));

  }
  v4 = -[PXGComponentDataStore initWithElementSize:]([PXGMutableComponentDataStore alloc], "initWithElementSize:", objc_msgSend(a1, "elementSize"));
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataStore:", v4);

  return v5;
}

+ (unint64_t)elementSize
{
  return 0;
}

@end
