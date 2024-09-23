@implementation SBDefaultUserInterfaceStyleProvider

- (SBDefaultUserInterfaceStyleProvider)init
{
  SBDefaultUserInterfaceStyleProvider *v2;
  NSHashTable *v3;
  NSHashTable *observers;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBDefaultUserInterfaceStyleProvider;
  v2 = -[SBDefaultUserInterfaceStyleProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSHashTable *)objc_alloc_init(MEMORY[0x1E0CB3690]);
    observers = v2->_observers;
    v2->_observers = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CEBDD0];
    objc_msgSend(MEMORY[0x1E0CEABA0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__notifyObserversCurrentStyleChanged, v6, v7);

  }
  return v2;
}

- (int64_t)currentStyle
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0CEABA0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentStyle");

  return v3;
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

- (void)_notifyObserversCurrentStyleChanged
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[SBDefaultUserInterfaceStyleProvider currentStyle](self, "currentStyle");
  objc_msgSend(MEMORY[0x1E0DAC280], "animationSettingsForTransitionToStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "userInterfaceStyleProvider:didUpdateStyle:preferredAnimationSettings:completion:", self, v3, v4, 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
