@implementation SFChangePublisher

- (SFChangePublisher)init
{
  SFChangePublisher *v2;
  uint64_t v3;
  NSPointerArray *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFChangePublisher;
  v2 = -[SFChangePublisher init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

  }
  return v2;
}

- (void)registerChangeObserver:(id)a3
{
  -[NSPointerArray addPointer:](self->_observers, "addPointer:", a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SFChangePublisher observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[SFChangePublisher observers](self, "observers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "pointerAtIndex:", v6);

      if ((id)v8 == v10)
        break;
      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[SFChangePublisher observers](self, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePointerAtIndex:", v6);

  }
LABEL_7:

}

- (void)publishChangeDescriptor:(unint64_t)a3 forObservable:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[SFChangePublisher observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      -[SFChangePublisher observers](self, "observers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pointerAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "observable:didChange:", v11, a3);
    }
  }

}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
