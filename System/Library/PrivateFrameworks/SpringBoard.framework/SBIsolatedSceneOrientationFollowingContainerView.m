@implementation SBIsolatedSceneOrientationFollowingContainerView

- (SBIsolatedSceneOrientationFollowingContainerView)initWithFrame:(CGRect)a3 wrapperViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBIsolatedSceneOrientationFollowingContainerView *v10;
  SBIsolatedSceneOrientationFollowingContainerView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIsolatedSceneOrientationFollowingContainerView;
  v10 = -[SBIsolatedSceneOrientationFollowingContainerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_wrapperViewController, v9);
    v11->_shouldLayoutOverlayImmediatelyForContainerGeometryChange = 1;
  }

  return v11;
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  v7.receiver = self;
  v7.super_class = (Class)SBIsolatedSceneOrientationFollowingContainerView;
  -[SBIsolatedSceneOrientationFollowingContainerView setCenter:](&v7, sel_setCenter_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
  objc_msgSend(WeakRetained, "_containerViewDidSetCenter:", x, y);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)SBIsolatedSceneOrientationFollowingContainerView;
  -[SBIsolatedSceneOrientationFollowingContainerView setBounds:](&v9, sel_setBounds_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
  objc_msgSend(WeakRetained, "_containerViewDidSetBounds:", x, y, width, height);

}

- (void)setHostOrientation:(int64_t)a3
{
  id WeakRetained;

  self->_hostOrientation = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrapperViewController);
  objc_msgSend(WeakRetained, "_containerViewDidSetHostOrientation:", a3);

}

- (BOOL)needsCounterRotation
{
  return 1;
}

- (void)notifyObserversViewRotatedToOrientation:(int64_t)a3
{
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "overlayViewDidRotate:toInterfaceOrientation:", self, a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSUInteger v5;
  NSHashTable *observers;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    v5 = -[NSHashTable count](self->_observers, "count");
    v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      v4 = v7;
    }
  }

}

- (SBIsolatedSceneOrientationFollowingWrapperViewController)wrapperViewController
{
  return (SBIsolatedSceneOrientationFollowingWrapperViewController *)objc_loadWeakRetained((id *)&self->_wrapperViewController);
}

- (int64_t)hostOrientation
{
  return self->_hostOrientation;
}

- (BOOL)shouldLayoutOverlayImmediatelyForContainerGeometryChange
{
  return self->_shouldLayoutOverlayImmediatelyForContainerGeometryChange;
}

- (void)setShouldLayoutOverlayImmediatelyForContainerGeometryChange:(BOOL)a3
{
  self->_shouldLayoutOverlayImmediatelyForContainerGeometryChange = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wrapperViewController);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
