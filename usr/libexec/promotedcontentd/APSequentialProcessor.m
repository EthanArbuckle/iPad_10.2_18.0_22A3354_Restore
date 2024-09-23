@implementation APSequentialProcessor

- (void)_next:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSequentialProcessor lock](self, "lock"));
  objc_msgSend(v5, "lock");
  if (v3)
  {
    -[APSequentialProcessor setIsRunning:](self, "setIsRunning:", 0);
    -[APSequentialProcessor setCollection:](self, "setCollection:", 0);
    objc_msgSend(v5, "unlock");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSequentialProcessor collectionProviderLock](self, "collectionProviderLock"));
    objc_msgSend(v6, "lock");
    v7 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[APSequentialProcessor collectionProvider](self, "collectionProvider"));
    -[APSequentialProcessor setCollectionProvider:](self, "setCollectionProvider:", 0);
    objc_msgSend(v6, "unlock");
    if (v7)
    {
      v8 = v7[2](v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[APSequentialProcessor setCollection:](self, "setCollection:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSequentialProcessor collection](self, "collection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));

    if (v11)
    {
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APSequentialProcessor workBlock](self, "workBlock"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10012E128;
      v13[3] = &unk_10020E150;
      v13[4] = self;
      ((void (**)(_QWORD, void *, _QWORD *))v12)[2](v12, v11, v13);

    }
    else
    {
      -[APSequentialProcessor setCollection:](self, "setCollection:", 0);
      -[APSequentialProcessor setIsRunning:](self, "setIsRunning:", 0);
    }
    objc_msgSend(v5, "unlock");

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void)setWorkBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSEnumerator)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (id)collectionProvider
{
  return self->_collectionProvider;
}

- (void)setCollectionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSLocking)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSLocking)collectionProviderLock
{
  return self->_collectionProviderLock;
}

- (void)setCollectionProviderLock:(id)a3
{
  objc_storeStrong((id *)&self->_collectionProviderLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionProviderLock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_collectionProvider, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong(&self->_workBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
