@implementation SBSwitcherDemoFilteringController

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;

  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)setHiddenApplicationBundleIDs:(id)a3
{
  NSArray *v4;
  NSArray *hiddenApplicationBundleIDs;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  hiddenApplicationBundleIDs = self->_hiddenApplicationBundleIDs;
  if (hiddenApplicationBundleIDs != v4 && (-[NSArray isEqual:](hiddenApplicationBundleIDs, "isEqual:", v4) & 1) == 0)
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    v7 = self->_hiddenApplicationBundleIDs;
    self->_hiddenApplicationBundleIDs = v6;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "switcherDemoFilteringControllerDidChangeHiddenApplicationBundleIDs:", self);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (NSArray)hiddenApplicationBundleIDs
{
  return self->_hiddenApplicationBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenApplicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
