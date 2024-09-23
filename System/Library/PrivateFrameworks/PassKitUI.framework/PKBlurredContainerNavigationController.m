@implementation PKBlurredContainerNavigationController

- (PKBlurredContainerNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  PKBlurredContainerNavigationController *v4;
  PKBlurredContainerNavigationController *v5;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKBlurredContainerNavigationController;
  v4 = -[PKBlurredContainerNavigationController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backdropView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKBlurredContainerNavigationController;
  -[PKBlurredContainerNavigationController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKBlurredContainerNavigationController _setBuiltinTransitionStyle:](self, "_setBuiltinTransitionStyle:", 1);
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1200);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  -[PKBlurredContainerNavigationController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:atIndex:", self->_backdropView, 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  UIVisualEffectView *backdropView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKBlurredContainerNavigationController;
  -[PKBlurredContainerNavigationController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKBlurredContainerNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backdropView = self->_backdropView;
  objc_msgSend(v3, "bounds");
  -[UIVisualEffectView setFrame:](backdropView, "setFrame:");

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKBlurredContainerNavigationController;
  -[PKBlurredContainerNavigationController preferredContentSizeDidChangeForChildContentContainer:](&v14, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKBlurredContainerNavigationController _observers](self, "_observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "contentContainer:preferredContentSizeDidChangeForChildContentContainer:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)addContentContainerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }

}

- (void)removeContentContainerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_observersLock);
  }

}

- (id)_observers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observersLock);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
