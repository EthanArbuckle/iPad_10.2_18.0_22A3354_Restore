@implementation PKView

- (PKView)init
{
  return -[PKView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKView;
  return -[PKView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToWindow
{
  NSHashTable *observers;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKView;
  -[PKView didMoveToWindow](&v15, sel_didMoveToWindow);
  observers = self->_observers;
  if (observers)
  {
    -[NSHashTable allObjects](observers, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[PKView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "observedView:didMoveToWindow:", self, v5, (_QWORD)v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        }
        while (v8);
      }

    }
  }
}

- (void)addWindowObserver:(id)a3
{
  id v4;
  id v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    observers = self->_observers;
    v9 = v5;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_observers;
      self->_observers = v7;

      v5 = v9;
      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)removeWindowObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
