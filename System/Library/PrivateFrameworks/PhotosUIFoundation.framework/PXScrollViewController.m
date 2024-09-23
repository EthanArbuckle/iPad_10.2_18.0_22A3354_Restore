@implementation PXScrollViewController

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isAnimatingScroll
{
  return -[PXScrollViewController activeScrollAnimations](self, "activeScrollAnimations") > 0;
}

- (int64_t)activeScrollAnimations
{
  return self->_activeScrollAnimations;
}

- (PXScrollViewController)initWithFrame:(CGRect)a3
{
  PXScrollViewController *v3;
  uint64_t v4;
  NSHashTable *observers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXScrollViewController;
  v3 = -[PXScrollViewController init](&v7, sel_init, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->__observers;
    v3->__observers = (NSHashTable *)v4;

    *(_OWORD *)&v3->_contentInsetAdjustmentBehavior = xmmword_24438A5B0;
    v3->_transfersScrollToContainer = 1;
  }
  return v3;
}

- (void)scrollViewContentBoundsDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "scrollViewControllerContentBoundsDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3.left == self->_contentInset.left && a3.top == self->_contentInset.top && a3.right == self->_contentInset.right;
  if (!v5 || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PXScrollViewController _observers](self, "_observers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "scrollViewControllerContentInsetDidChange:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[PXScrollViewController setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)registerObserver:(id)a3
{
  void *v4;
  NSHashTable *willLayoutSubviewsObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  NSHashTable *didLayoutSubviewsObservers;
  NSHashTable *v9;
  NSHashTable *v10;
  NSHashTable *didScrollObservers;
  NSHashTable *v12;
  NSHashTable *v13;
  id v14;

  v14 = a3;
  -[PXScrollViewController _observers](self, "_observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    willLayoutSubviewsObservers = self->_willLayoutSubviewsObservers;
    if (!willLayoutSubviewsObservers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_willLayoutSubviewsObservers;
      self->_willLayoutSubviewsObservers = v6;

      willLayoutSubviewsObservers = self->_willLayoutSubviewsObservers;
    }
    -[NSHashTable addObject:](willLayoutSubviewsObservers, "addObject:", v14);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    didLayoutSubviewsObservers = self->_didLayoutSubviewsObservers;
    if (!didLayoutSubviewsObservers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v10 = self->_didLayoutSubviewsObservers;
      self->_didLayoutSubviewsObservers = v9;

      didLayoutSubviewsObservers = self->_didLayoutSubviewsObservers;
    }
    -[NSHashTable addObject:](didLayoutSubviewsObservers, "addObject:", v14);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    didScrollObservers = self->_didScrollObservers;
    if (!didScrollObservers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v13 = self->_didScrollObservers;
      self->_didScrollObservers = v12;

      didScrollObservers = self->_didScrollObservers;
    }
    -[NSHashTable addObject:](didScrollObservers, "addObject:", v14);
  }

}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)scrollViewDidScroll
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[PXScheduler sharedScheduler](PXScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewDidScroll");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_didScrollObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "scrollViewControllerDidScroll:", self, (_QWORD)v12);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[PXScrollViewController updateDelegate](self, "updateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PXScrollViewController updateDelegate](self, "updateDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_scrollControllerDidScroll:", self);

  }
}

- (void)scrollViewWillLayout
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[PXScheduler sharedScheduler](PXScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewWillLayoutSubviews");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_willLayoutSubviewsObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "scrollViewControllerWillLayoutSubviews:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)scrollViewDidLayout
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PXScrollViewController updateDelegate](self, "updateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_scrollControllerDidUpdate:", self);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_didLayoutSubviewsObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "scrollViewControllerDidLayoutSubviews:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (PXScrollControllerUpdateDelegate)updateDelegate
{
  return (PXScrollControllerUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (BOOL)isManuallyChanging
{
  return self->_isManuallyChanging;
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (void)setUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelegate, a3);
}

- (void)performManualChange:(id)a3
{
  BOOL isManuallyChanging;

  isManuallyChanging = self->_isManuallyChanging;
  self->_isManuallyChanging = 1;
  (*((void (**)(id, PXScrollViewController *))a3 + 2))(a3, self);
  self->_isManuallyChanging = isManuallyChanging;
}

- (PXScrollViewController)init
{
  return -[PXScrollViewController initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)unregisterObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXScrollViewController _observers](self, "_observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  -[NSHashTable removeObject:](self->_willLayoutSubviewsObservers, "removeObject:", v5);
  -[NSHashTable removeObject:](self->_didLayoutSubviewsObservers, "removeObject:", v5);
  -[NSHashTable removeObject:](self->_didScrollObservers, "removeObject:", v5);

}

- (void)setActiveScrollAnimations:(int64_t)a3
{
  if (self->_activeScrollAnimations != a3)
  {
    self->_activeScrollAnimations = a3;
    -[PXScrollViewController isAnimatingScroll](self, "isAnimatingScroll");
    kdebug_trace();
  }
}

- (BOOL)hasWindow
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 81, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController hasWindow]", v6);

  abort();
}

- (BOOL)scrollViewShouldBeginScrollingWithPanAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4 velocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  y = a5.y;
  x = a5.x;
  v7 = a3.y;
  v8 = a3.x;
  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "scrollViewController:shouldBeginScrollingWithPanAtLocation:inCoordinateSpace:velocity:", self, v10, v8, v7, x, y))
        {
          v17 = 0;
          goto LABEL_12;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_12:

  return v17;
}

- (void)scrollViewWillBeginScrolling
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "scrollViewControllerWillBeginScrolling:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)willEndScrollingWithVelocity:(CGPoint)a3 targetContentOffset:(CGPoint *)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x24BDAC8D0];
  -[PXScrollViewController visibleRect](self, "visibleRect");
  v9 = v8;
  v11 = v10;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "scrollViewControllerWillEndScrolling:withVelocity:targetContentOffset:currentContentOffset:", self, a4, x, y, v9, v11);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)scrollViewDidEndScrolling
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "scrollViewControllerDidEndScrolling:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)scrollViewShouldScrollToTop
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v8, "scrollViewControllerShouldScrollToTop:", self))
        {
          v9 = 0;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_12:

  return v9;
}

- (void)scrollViewWillBeginScrollingAnimationTowardsContentEdges:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PXScrollViewController setActiveScrollAnimations:](self, "setActiveScrollAnimations:", -[PXScrollViewController activeScrollAnimations](self, "activeScrollAnimations") + 1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "scrollViewControllerWillBeginScrollingAnimation:towardsContentEdges:", self, a3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)scrollViewDidEndScrollingAnimation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PXScrollViewController setActiveScrollAnimations:](self, "setActiveScrollAnimations:", -[PXScrollViewController activeScrollAnimations](self, "activeScrollAnimations") - 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "scrollViewControllerDidEndScrollingAnimation:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)scrollViewDidBeginFocusFastScrolling
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "scrollViewControllerDidBeginFocusFastScrolling:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)scrollViewDidEndFocusFastScrolling
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PXScrollViewController _observers](self, "_observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "scrollViewControllerDidEndFocusFastScrolling:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)addSubview:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 204, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController addSubview:]", v8);

  abort();
}

- (BOOL)isSubview:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 208, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController isSubview:]", v8);

  abort();
}

- (void)addFloatingSublayer:(id)a3 forAxis:(int64_t)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 212, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController addFloatingSublayer:forAxis:]", v9);

  abort();
}

- (BOOL)isFloatingSublayer:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 216, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController isFloatingSublayer:]", v8);

  abort();
}

- (void)addSubviewToScrollView:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 220, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController addSubviewToScrollView:]", v8);

  abort();
}

- (void)scrollToEdge:(unsigned int)a3 animated:(BOOL)a4
{
  -[PXScrollViewController scrollToEdge:animated:completionHandler:](self, "scrollToEdge:animated:completionHandler:", *(_QWORD *)&a3, a4, 0);
}

- (void)scrollToEdge:(unsigned int)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  -[PXScrollViewController scrollToEdge:padding:animated:completionHandler:](self, "scrollToEdge:padding:animated:completionHandler:", *(_QWORD *)&a3, a4, a5, 0.0, 0.0, 0.0, 0.0);
}

- (void)scrollToEdge:(unsigned int)a3 padding:(UIEdgeInsets)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v8 = a6;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 232, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollToEdge:padding:animated:completionHandler:]", v11);

  abort();
}

- (BOOL)isScrolledAtEdge:(unsigned int)a3 tolerance:(double)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 236, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController isScrolledAtEdge:tolerance:]", v8);

  abort();
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  -[PXScrollViewController scrollRectToVisible:avoidingContentInsetEdges:animated:](self, "scrollRectToVisible:avoidingContentInsetEdges:animated:", 15, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)scrollRectToVisible:(CGRect)a3 avoidingContentInsetEdges:(unint64_t)a4 animated:(BOOL)a5
{
  void *v7;
  objc_class *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 244, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollRectToVisible:avoidingContentInsetEdges:animated:]", v9);

  abort();
}

- (void)stopScrollingAndZoomingAnimations
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 248, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController stopScrollingAndZoomingAnimations]", v6);

  abort();
}

- (void)setScrollViewNeedsLayout
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 252, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController setScrollViewNeedsLayout]", v6);

  abort();
}

- (void)scrollViewLayoutIfNeeded
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 256, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewLayoutIfNeeded]", v6);

  abort();
}

- (CGSize)scrollViewReferenceSize
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 260, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewReferenceSize]", v6);

  abort();
}

- (CGRect)scrollViewActiveRect
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 264, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewActiveRect]", v6);

  abort();
}

- (CGRect)scrollViewVisibleRect
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 268, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewVisibleRect]", v6);

  abort();
}

- (CGRect)scrollViewVisibleRectOutsideBounds
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 272, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewVisibleRectOutsideBounds]", v6);

  abort();
}

- (CGRect)scrollViewConstrainedVisibleRect
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 276, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewConstrainedVisibleRect]", v6);

  abort();
}

- (CGRect)scrollViewTargetRect
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 280, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewTargetRect]", v6);

  abort();
}

- (CGRect)scrollViewContentBounds
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 284, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollViewContentBounds]", v6);

  abort();
}

- (void)setScrollViewContentBounds:(CGRect)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 289, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController setScrollViewContentBounds:]", v7);

  abort();
}

- (void)applyScrollInfo:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 293, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController applyScrollInfo:]", v8);

  abort();
}

- (CGRect)scrollIndicatorFrameForAxis:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 297, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController scrollIndicatorFrameForAxis:]", v7);

  abort();
}

- (BOOL)shouldScrollSimultaneouslyWithDescendantScrollView
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 301, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController shouldScrollSimultaneouslyWithDescendantScrollView]", v6);

  abort();
}

- (void)setShouldScrollSimultaneouslyWithDescendantScrollView:(BOOL)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 305, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController setShouldScrollSimultaneouslyWithDescendantScrollView:]", v7);

  abort();
}

- (BOOL)isInterruptingScrollWithDirection:(CGPoint *)a3
{
  return 0;
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 371, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController setVisibleOrigin:]", v7);

  abort();
}

- (void)setDecelerationRate:(int64_t)a3
{
  if (self->_decelerationRate != a3)
  {
    self->_decelerationRate = a3;
    -[PXScrollViewController decelerationRateDidChange](self, "decelerationRateDidChange");
  }
}

- (void)decelerationRateDidChange
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 407, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController decelerationRateDidChange]", v6);

  abort();
}

- (void)setIndicatorStyle:(int64_t)a3
{
  if (self->_indicatorStyle != a3)
  {
    self->_indicatorStyle = a3;
    -[PXScrollViewController indicatorStyleDidChange](self, "indicatorStyleDidChange");
  }
}

- (void)indicatorStyleDidChange
{
  NSObject *v2;
  uint8_t v3[16];

  PXAssertGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_24430E000, v2, OS_LOG_TYPE_FAULT, "not implemented on the current platform", v3, 2u);
  }

}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  if (self->_contentInsetAdjustmentBehavior != a3)
  {
    self->_contentInsetAdjustmentBehavior = a3;
    -[PXScrollViewController contentInsetAdjustmentBehaviorDidChange](self, "contentInsetAdjustmentBehaviorDidChange");
  }
}

- (void)contentInsetAdjustmentBehaviorDidChange
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollViewController.m"), 431, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXScrollViewController contentInsetAdjustmentBehaviorDidChange]", v6);

  abort();
}

- (void)setDraggingPerformsScroll:(BOOL)a3
{
  if (self->_draggingPerformsScroll != a3)
  {
    self->_draggingPerformsScroll = a3;
    -[PXScrollViewController draggingPerformsScrollDidChange](self, "draggingPerformsScrollDidChange");
  }
}

- (void)setTransfersScrollToContainer:(BOOL)a3
{
  if (self->_transfersScrollToContainer != a3)
  {
    self->_transfersScrollToContainer = a3;
    -[PXScrollViewController transfersScrollToContainerDidChange](self, "transfersScrollToContainerDidChange");
  }
}

- (void)setScrollInfo:(id)a3
{
  PXScrollInfo *v4;
  PXScrollInfo *v5;
  BOOL v6;
  PXScrollInfo *v7;
  PXScrollInfo *scrollInfo;
  PXScrollInfo *v9;

  v4 = (PXScrollInfo *)a3;
  v5 = v4;
  if (self->_scrollInfo != v4)
  {
    v9 = v4;
    v6 = -[PXScrollInfo isEqual:](v4, "isEqual:");
    v5 = v9;
    if (!v6)
    {
      v7 = (PXScrollInfo *)-[PXScrollInfo copy](v9, "copy");
      scrollInfo = self->_scrollInfo;
      self->_scrollInfo = v7;

      -[PXScrollViewController applyScrollInfo:](self, "applyScrollInfo:", self->_scrollInfo);
      v5 = v9;
    }
  }

}

- (CGSize)presentedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->presentedContentSize.width;
  height = self->presentedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPresentedContentSize:(CGSize)a3
{
  self->presentedContentSize = a3;
}

- (PXScrollInfo)scrollInfo
{
  return self->_scrollInfo;
}

- (BOOL)respectsContentZOrder
{
  return self->_respectsContentZOrder;
}

- (void)setRespectsContentZOrder:(BOOL)a3
{
  self->_respectsContentZOrder = a3;
}

- (PXAnonymousScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)isDecelerating
{
  return self->_isDecelerating;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (BOOL)isBouncing
{
  return self->_isBouncing;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (UICoordinateSpace)contentCoordinateSpace
{
  return self->_contentCoordinateSpace;
}

- (int64_t)decelerationRate
{
  return self->_decelerationRate;
}

- (BOOL)clipsToBounds
{
  return self->_clipsToBounds;
}

- (void)setClipsToBounds:(BOOL)a3
{
  self->_clipsToBounds = a3;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  self->_showsHorizontalScrollIndicator = a3;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  self->_showsVerticalScrollIndicator = a3;
}

- (int64_t)indicatorStyle
{
  return self->_indicatorStyle;
}

- (BOOL)alwaysBounceHorizontal
{
  return self->_alwaysBounceHorizontal;
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  self->_alwaysBounceHorizontal = a3;
}

- (BOOL)alwaysBounceVertical
{
  return self->_alwaysBounceVertical;
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  self->_alwaysBounceVertical = a3;
}

- (BOOL)allowsKeyboardScrolling
{
  return self->_allowsKeyboardScrolling;
}

- (void)setAllowsKeyboardScrolling:(BOOL)a3
{
  self->_allowsKeyboardScrolling = a3;
}

- (BOOL)isScrollEnabled
{
  return self->_isScrollEnabled;
}

- (void)setIsScrollEnabled:(BOOL)a3
{
  self->_isScrollEnabled = a3;
}

- (BOOL)adjustsContentInsetWhenScrollDisabled
{
  return self->_adjustsContentInsetWhenScrollDisabled;
}

- (void)setAdjustsContentInsetWhenScrollDisabled:(BOOL)a3
{
  self->_adjustsContentInsetWhenScrollDisabled = a3;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_horizontalScrollIndicatorInsets.top;
  left = self->_horizontalScrollIndicatorInsets.left;
  bottom = self->_horizontalScrollIndicatorInsets.bottom;
  right = self->_horizontalScrollIndicatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHorizontalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  self->_horizontalScrollIndicatorInsets = a3;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_verticalScrollIndicatorInsets.top;
  left = self->_verticalScrollIndicatorInsets.left;
  bottom = self->_verticalScrollIndicatorInsets.bottom;
  right = self->_verticalScrollIndicatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setVerticalScrollIndicatorInsets:(UIEdgeInsets)a3
{
  self->_verticalScrollIndicatorInsets = a3;
}

- (UIEdgeInsets)hitTestContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestContentInsets.top;
  left = self->_hitTestContentInsets.left;
  bottom = self->_hitTestContentInsets.bottom;
  right = self->_hitTestContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitTestContentInsets:(UIEdgeInsets)a3
{
  self->_hitTestContentInsets = a3;
}

- (BOOL)draggingPerformsScroll
{
  return self->_draggingPerformsScroll;
}

- (BOOL)transfersScrollToContainer
{
  return self->_transfersScrollToContainer;
}

- (double)horizontalInterPageSpacing
{
  return self->_horizontalInterPageSpacing;
}

- (void)setHorizontalInterPageSpacing:(double)a3
{
  self->_horizontalInterPageSpacing = a3;
}

- (BOOL)deferContentOffsetUpdates
{
  return self->_deferContentOffsetUpdates;
}

- (void)setDeferContentOffsetUpdates:(BOOL)a3
{
  self->_deferContentOffsetUpdates = a3;
}

- (CGSize)scrollViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scrollViewContentSize.width;
  height = self->_scrollViewContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_contentCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_scrollInfo, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->_didScrollObservers, 0);
  objc_storeStrong((id *)&self->_didLayoutSubviewsObservers, 0);
  objc_storeStrong((id *)&self->_willLayoutSubviewsObservers, 0);
}

@end
