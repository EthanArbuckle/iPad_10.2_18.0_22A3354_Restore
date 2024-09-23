@implementation SBIndirectTouchLifecycleMonitor

- (SBIndirectTouchLifecycleMonitor)initWithSystemGestureManager:(id)a3
{
  id v4;
  SBIndirectTouchLifecycleMonitor *v5;
  uint64_t v6;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIndirectTouchLifecycleMonitor;
  v5 = -[SBIndirectTouchLifecycleMonitor init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v5, sel_handleHoverEvent_);
    hoverGestureRecognizer = v5->_hoverGestureRecognizer;
    v5->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v6;

    -[UIHoverGestureRecognizer setDelegate:](v5->_hoverGestureRecognizer, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    objc_msgSend(v4, "addGestureRecognizer:withType:", v5->_hoverGestureRecognizer, 109);
  }

  return v5;
}

- (void)handleHoverEvent:(id)a3
{
  void *v4;
  void *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "_activeEventOfType:", 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_hidEvent");
  if (SBPointerHIDSubEventFromEvent())
  {
    BKSHIDEventGetPointerAttributes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (SBPointerEventRepresentsTrackpadTouchUp(v5))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "trackpadDidTouchUpWithEvent:", v4, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (CGPoint)systemGestureHoverLocationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  _UISystemGestureLocationInView();
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)addObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:"))
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:"))
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
}

@end
