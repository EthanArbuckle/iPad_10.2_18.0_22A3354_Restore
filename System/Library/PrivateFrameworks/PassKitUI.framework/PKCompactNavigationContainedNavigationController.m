@implementation PKCompactNavigationContainedNavigationController

- (PKCompactNavigationContainedNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PKCompactNavigationContainedNavigationController initWithStyle:](self, "initWithStyle:", 0, a4);
}

- (PKCompactNavigationContainedNavigationController)initWithStyle:(unint64_t)a3
{
  PKCompactNavigationContainedNavigationController *v4;
  PKCompactNavigationContainedNavigationController *v5;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKCompactNavigationContainedNavigationController;
  v4 = -[PKCompactNavigationContainedNavigationController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v4->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

  }
  return v5;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCompactNavigationContainedNavigationController;
  -[PKCompactNavigationContainedNavigationController loadView](&v3, sel_loadView);
  if (self->_style - 1 <= 1)
    -[PKCompactNavigationContainedNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
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
  v8.super_class = (Class)PKCompactNavigationContainedNavigationController;
  -[PKCompactNavigationContainedNavigationController viewDidLoad](&v8, sel_viewDidLoad);
  if (!self->_style)
  {
    -[PKCompactNavigationContainedNavigationController _setBuiltinTransitionStyle:](self, "_setBuiltinTransitionStyle:", 1);
    v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
    backdropView = self->_backdropView;
    self->_backdropView = v5;

    -[PKCompactNavigationContainedNavigationController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", self->_backdropView, 0);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  UIVisualEffectView *backdropView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCompactNavigationContainedNavigationController;
  -[PKCompactNavigationContainedNavigationController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKCompactNavigationContainedNavigationController view](self, "view");
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
  v14.super_class = (Class)PKCompactNavigationContainedNavigationController;
  -[PKCompactNavigationContainedNavigationController preferredContentSizeDidChangeForChildContentContainer:](&v14, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKCompactNavigationContainedNavigationController _observers](self, "_observers", 0);
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

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  PKCompactNavigationWrapperViewController *v6;
  PKCompactNavigationWrapperViewController *v7;
  objc_super v8;

  v4 = a4;
  v6 = (PKCompactNavigationWrapperViewController *)a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = -[PKCompactNavigationWrapperViewController initWithWrappedViewController:parentNavigationController:]([PKCompactNavigationWrapperViewController alloc], "initWithWrappedViewController:parentNavigationController:", v6, self);

      v6 = v7;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PKCompactNavigationContainedNavigationController;
  -[PKCompactNavigationContainedNavigationController pushViewController:animated:](&v8, sel_pushViewController_animated_, v6, v4);

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

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
