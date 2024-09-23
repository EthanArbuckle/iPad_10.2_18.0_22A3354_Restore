@implementation MTUuidQueryObserver

- (id)addResultsChangedHandler:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v4 = _Block_copy(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTUuidQueryObserver;
  -[MTBaseQueryObserver addResultsChangedHandler:](&v7, sel_addResultsChangedHandler_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)startObserving
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTUuidQueryObserver;
  -[MTBaseQueryObserver startObserving](&v3, sel_startObserving);
  -[MTUuidQueryObserver notifyObservers](self, "notifyObservers");
}

- (void)notifyObservers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v3 = MEMORY[0x24BDAC760];
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__MTUuidQueryObserver_notifyObservers__block_invoke;
  v14[3] = &unk_24FD62618;
  v14[4] = &v15;
  -[MTBaseQueryObserver results:](self, "results:", v14);
  -[MTUuidQueryObserver uuidOrder](self, "uuidOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  v6 = (void *)objc_msgSend(v5, "initWithArray:", v16[5]);
  -[MTUuidQueryObserver uuidSet](self, "uuidSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "minusSet:", v6);
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v9, "minusSet:", v7);
  -[MTUuidQueryObserver setUuidSet:](self, "setUuidSet:", v6);
  -[MTUuidQueryObserver setUuidOrder:](self, "setUuidOrder:", v16[5]);
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count") || (objc_msgSend(v4, "isEqual:", v16[5]) & 1) == 0)
  {
    -[MTBaseQueryObserver handlers](self, "handlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __38__MTUuidQueryObserver_notifyObservers__block_invoke_3;
    v11[3] = &unk_24FD62DF0;
    v12 = v8;
    v13 = v9;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  _Block_object_dispose(&v15, 8);

}

void __38__MTUuidQueryObserver_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "mt_compactMap:", &__block_literal_global_6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __38__MTUuidQueryObserver_notifyObservers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __38__MTUuidQueryObserver_notifyObservers__block_invoke_3(uint64_t a1, int a2, void *aBlock)
{
  id v4;

  v4 = _Block_copy(aBlock);
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;

  objc_msgSend(a3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MTUuidQueryObserver notifyObservers](self, "notifyObservers");
}

- (NSSet)uuidSet
{
  return self->_uuidSet;
}

- (void)setUuidSet:(id)a3
{
  objc_storeStrong((id *)&self->_uuidSet, a3);
}

- (NSArray)uuidOrder
{
  return self->_uuidOrder;
}

- (void)setUuidOrder:(id)a3
{
  objc_storeStrong((id *)&self->_uuidOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOrder, 0);
  objc_storeStrong((id *)&self->_uuidSet, 0);
}

@end
