@implementation SBBacklightSignificantUserInteractionMonitor

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
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setCoverSheetViewController:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "unregisterExternalEventHandler:", self);
    objc_storeWeak((id *)&self->_coverSheetViewController, obj);
    objc_msgSend(obj, "registerExternalEventHandler:", self);
  }

}

- (void)_notifyObserversOfSignificantUserInteraction
{
  void *v3;
  void *v4;
  id v5;
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
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "significantUserInteractionMonitorDetectedSignificantUserInteraction:", self, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)participantState
{
  return 2;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "type");
  if (v4 == 21 || v4 == 12)
    -[SBBacklightSignificantUserInteractionMonitor _notifyObserversOfSignificantUserInteraction](self, "_notifyObserversOfSignificantUserInteraction");
  return 0;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return (CSCoverSheetViewController *)objc_loadWeakRetained((id *)&self->_coverSheetViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverSheetViewController);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
