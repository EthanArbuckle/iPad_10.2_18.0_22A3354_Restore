@implementation SBDeviceApplicationSceneOverlayBasicWrapperView

- (SBDeviceApplicationSceneOverlayBasicWrapperView)initWithCounterRotationRequirement:(BOOL)a3
{
  SBDeviceApplicationSceneOverlayBasicWrapperView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneOverlayBasicWrapperView;
  result = -[SBDeviceApplicationSceneOverlayBasicWrapperView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
    result->_needsCounterRotation = a3;
  return result;
}

- (BOOL)needsCounterRotation
{
  return self->_needsCounterRotation;
}

- (void)setNeedsCounterRotation:(BOOL)a3
{
  void *v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_needsCounterRotation != a3)
  {
    self->_needsCounterRotation = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "overlayViewDidChangeCounterRotationRequirement:", self);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

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

- (int64_t)hostOrientation
{
  return self->_hostOrientation;
}

- (void)setHostOrientation:(int64_t)a3
{
  self->_hostOrientation = a3;
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
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
