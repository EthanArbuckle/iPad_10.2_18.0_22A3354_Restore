@implementation _UIBarButtonItemActionBinding

- (_UIBarButtonItemActionBinding)initWithBarButtonItems:(id)a3 registerObservers:(id)a4 unregisterObservers:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIBarButtonItemActionBinding *v11;
  uint64_t v12;
  NSArray *barButtonItems;
  void *v14;
  id registerObservers;
  void *v16;
  id unregisterObservers;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIBarButtonItemActionBinding;
  v11 = -[_UIBarButtonItemActionBinding init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    barButtonItems = v11->_barButtonItems;
    v11->_barButtonItems = (NSArray *)v12;

    v14 = _Block_copy(v9);
    registerObservers = v11->_registerObservers;
    v11->_registerObservers = v14;

    v16 = _Block_copy(v10);
    unregisterObservers = v11->_unregisterObservers;
    v11->_unregisterObservers = v16;

  }
  return v11;
}

- (void)_update:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_barButtonItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "target", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "action");
        if (v9)
          v11 = v10 == 0;
        else
          v11 = 1;
        if (!v11)
          objc_msgSend(v8, "setEnabled:", objc_msgSend(v9, "canPerformAction:withSender:", v10, 0));

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)startMonitoring
{
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    *(_BYTE *)&self->_flags |= 1u;
    (*((void (**)(void))self->_registerObservers + 2))();
    -[_UIBarButtonItemActionBinding _update:](self, "_update:", 0);
  }
}

- (void)stopMonitoring
{
  void (**unregisterObservers)(id, _UIBarButtonItemActionBinding *, char *);

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags &= ~1u;
    unregisterObservers = (void (**)(id, _UIBarButtonItemActionBinding *, char *))self->_unregisterObservers;
    if (unregisterObservers)
      unregisterObservers[2](unregisterObservers, self, sel__update_);
  }
}

- (NSArray)barButtonItems
{
  return self->_barButtonItems;
}

- (void)setBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItems, a3);
}

- (id)registerObservers
{
  return self->_registerObservers;
}

- (void)setRegisterObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)unregisterObservers
{
  return self->_unregisterObservers;
}

- (void)setUnregisterObservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterObservers, 0);
  objc_storeStrong(&self->_registerObservers, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
}

@end
