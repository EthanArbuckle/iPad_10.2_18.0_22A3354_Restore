@implementation SBOverridableUserInterfaceStyleProvider

- (SBOverridableUserInterfaceStyleProvider)init
{
  SBOverridableUserInterfaceStyleProvider *v2;
  NSHashTable *v3;
  NSHashTable *observers;
  SBDefaultUserInterfaceStyleProvider *v5;
  SBDefaultUserInterfaceStyleProvider *defaultUserInterfaceStyleProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBOverridableUserInterfaceStyleProvider;
  v2 = -[SBOverridableUserInterfaceStyleProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSHashTable *)objc_alloc_init(MEMORY[0x1E0CB3690]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = objc_alloc_init(SBDefaultUserInterfaceStyleProvider);
    defaultUserInterfaceStyleProvider = v2->_defaultUserInterfaceStyleProvider;
    v2->_defaultUserInterfaceStyleProvider = v5;

    -[SBDefaultUserInterfaceStyleProvider addObserver:](v2->_defaultUserInterfaceStyleProvider, "addObserver:", v2);
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (int64_t)currentStyle
{
  if (self->_overrideStyle)
    return self->_overrideStyle;
  else
    return -[SBDefaultUserInterfaceStyleProvider currentStyle](self->_defaultUserInterfaceStyleProvider, "currentStyle");
}

- (void)setOverrideStyle:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  int64_t v7;
  void (**v8)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  if (self->_overrideStyle == a3)
  {
    if (v6)
    {
      v8 = v6;
      v6[2](v6);
LABEL_9:
      v6 = v8;
    }
  }
  else
  {
    v8 = v6;
    v7 = -[SBOverridableUserInterfaceStyleProvider currentStyle](self, "currentStyle");
    self->_overrideStyle = a3;
    if (v7 != -[SBOverridableUserInterfaceStyleProvider currentStyle](self, "currentStyle"))
    {
      -[SBOverridableUserInterfaceStyleProvider _notifyObserversCurrentStyleChangedWithCompletion:](self, "_notifyObserversCurrentStyleChangedWithCompletion:", v8);
      goto LABEL_9;
    }
    v6 = v8;
    if (v8)
    {
      v8[2](v8);
      goto LABEL_9;
    }
  }

}

- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6
{
  if (!self->_overrideStyle)
    -[SBOverridableUserInterfaceStyleProvider _notifyObserversCurrentStyleChangedWithCompletion:](self, "_notifyObserversCurrentStyleChangedWithCompletion:", a6, a4, a5);
}

- (void)_notifyObserversCurrentStyleChangedWithCompletion:(id)a3
{
  int64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v4 = -[SBOverridableUserInterfaceStyleProvider currentStyle](self, "currentStyle");
  v5 = dispatch_group_create();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        dispatch_group_enter(v5);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke;
        v16[3] = &unk_1E8E9DED8;
        v17 = v5;
        objc_msgSend(v11, "userInterfaceStyleProvider:didUpdateStyle:preferredAnimationSettings:completion:", self, v4, 0, v16);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke_2;
  block[3] = &unk_1E8E9E8D0;
  v15 = v13;
  v12 = v13;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);

}

void __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __93__SBOverridableUserInterfaceStyleProvider__notifyObserversCurrentStyleChangedWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultUserInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
