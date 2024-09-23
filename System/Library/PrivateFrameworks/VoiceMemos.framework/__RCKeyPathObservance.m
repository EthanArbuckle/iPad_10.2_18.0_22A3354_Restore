@implementation __RCKeyPathObservance

- (void)setObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (void)setKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_keyPaths, a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &__keyPathObserverContext)
    (*((void (**)(void))self->_observer + 2))();
}

- (void)remove
{
  id WeakRetained;
  NSArray *keyPaths;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  id observer;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  if (WeakRetained)
  {
    keyPaths = self->_keyPaths;
    if (keyPaths)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = keyPaths;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), &__keyPathObserverContext, (_QWORD)v12);
          }
          while (v7 != v9);
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      v10 = self->_keyPaths;
      self->_keyPaths = 0;

      observer = self->_observer;
      self->_observer = 0;

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[__RCKeyPathObservance remove](self, "remove");
  v3.receiver = self;
  v3.super_class = (Class)__RCKeyPathObservance;
  -[__RCKeyPathObservance dealloc](&v3, sel_dealloc);
}

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (id)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_destroyWeak((id *)&self->_object);
}

@end
