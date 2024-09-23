@implementation REObservableSingleton

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REObservableSingleton;
  v2 = -[RESingleton _init](&v6, sel__init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)v2[1];
    v2[1] = v3;

  }
  return v2;
}

- (unint64_t)numberOfObservers
{
  return -[REObserverStore count](self->_store, "count");
}

- (void)addObserver:(id)a3
{
  -[REObserverStore addObserver:](self->_store, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[REObserverStore removeObserver:](self->_store, "removeObserver:", a3);
}

- (void)enumerateObservers:(id)a3
{
  -[REObserverStore enumerateObserversWithBlock:](self->_store, "enumerateObserversWithBlock:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
