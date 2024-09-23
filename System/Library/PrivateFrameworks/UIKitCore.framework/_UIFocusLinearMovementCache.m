@implementation _UIFocusLinearMovementCache

- (_UIFocusLinearMovementCache)initWithFocusBehavior:(id)a3
{
  id v4;
  _UIFocusLinearMovementCache *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusLinearMovementCache;
  v5 = -[_UIFocusLinearMovementCache init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stabilizedLinearFocusMovementTimeout");
    v5->_cooldownThreshold = v6;
  }

  return v5;
}

- (void)_invalidate
{
  *(_BYTE *)&self->_flags |= 1u;
}

- (void)_invalidateOnTimeout
{
  if (self->_cooldownThreshold <= 0.0)
    -[_UIFocusLinearMovementCache _invalidate](self, "_invalidate");
  else
    *(_BYTE *)&self->_flags |= 2u;
}

- (id)nextItemForRequest:(id)a3
{
  id v4;
  NSArray *linearItems;
  void *v6;
  void *v7;
  NSArray *v8;
  void *v9;
  __int16 v10;
  void *v11;
  void *v12;

  v4 = a3;
  linearItems = self->_linearItems;
  if (!linearItems || !-[NSArray count](linearItems, "count") || (*(_BYTE *)&self->_flags & 1) != 0)
    goto LABEL_8;
  if ((*(_BYTE *)&self->_flags & 2) != 0 && CFAbsoluteTimeGetCurrent() - self->_lastUpdate > self->_cooldownThreshold)
  {
    -[_UIFocusLinearMovementCache _invalidate](self, "_invalidate");
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "focusedItemInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = self->_linearItems;
  objc_msgSend(v4, "movementInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "heading");
  objc_msgSend(v4, "movementInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusGetNextItemFromList(v7, v8, v10, objc_msgSend(v11, "_isLooping"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

- (void)updateCacheWithContext:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSHashTable *parentEnvironments;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "_request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMovementRequest");

  if (!v5)
    goto LABEL_13;
  objc_msgSend(v17, "_request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "movementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_linearHeading");
  v9 = (objc_msgSend(v7, "heading") | v8) & 0x330;

  if (v9)
  {
    self->_lastUpdate = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v17, "_focusMapSearchInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "linearSortedFocusItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (objc_msgSend(v11, "hasOnlyStaticContent"))
          v13 = 0;
        else
          v13 = 2;
        *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | v13;
        objc_msgSend(v11, "linearSortedFocusItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!self->_linearItems || (objc_msgSend(v14, "isEqual:") & 1) == 0)
        {
          objc_storeStrong((id *)&self->_linearItems, v15);
          parentEnvironments = self->_parentEnvironments;
          self->_parentEnvironments = 0;

        }
      }
    }

  }
  else
  {
LABEL_13:
    -[_UIFocusLinearMovementCache _invalidate](self, "_invalidate");
  }

}

- (void)_updateParentEnvironmentIfNecessary
{
  NSHashTable *v3;
  NSHashTable *parentEnvironments;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_parentEnvironments)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    parentEnvironments = self->_parentEnvironments;
    self->_parentEnvironments = v3;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_linearItems;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v9);
          if (v10)
          {
            v11 = v10;
            do
            {
              if (-[NSHashTable containsObject:](self->_parentEnvironments, "containsObject:", v11, (_QWORD)v13))
                break;
              -[NSHashTable addObject:](self->_parentEnvironments, "addObject:", v11);
              objc_msgSend(v11, "parentFocusEnvironment");
              v12 = objc_claimAutoreleasedReturnValue();

              v11 = (void *)v12;
            }
            while (v12);

          }
          ++v9;
        }
        while (v9 != v7);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)environmentWillDisappear:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSArray *linearItems;

  v4 = a3;
  -[_UIFocusLinearMovementCache _updateParentEnvironmentIfNecessary](self, "_updateParentEnvironmentIfNecessary");
  v5 = -[NSHashTable containsObject:](self->_parentEnvironments, "containsObject:", v4);

  if (v5)
  {
    -[_UIFocusLinearMovementCache _invalidate](self, "_invalidate");
    linearItems = self->_linearItems;
    self->_linearItems = 0;

  }
}

- (void)environmentDidAppear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int IsFocusedOrFocusable;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "_isEnvironmentLocked:", v4))
  {
    _UIFocusItemSafeCast(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && _UIFocusItemIsFocusedOrFocusable(v6))
    {
      -[_UIFocusLinearMovementCache _invalidateOnTimeout](self, "_invalidateOnTimeout");
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v4, "parentFocusEnvironment");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      do
      {
        _UIFocusItemSafeCast(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
          IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v10);
        else
          IsFocusedOrFocusable = 0;
        objc_msgSend(v9, "parentFocusEnvironment");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          break;
        v9 = v13;
      }
      while (!IsFocusedOrFocusable);
      if ((IsFocusedOrFocusable & 1) != 0)
        goto LABEL_28;
      if (v7)
      {
LABEL_15:
        _UIParentCoordinateSpaceForFocusItem(v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "frame");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v23 = self->_linearItems;
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v29 != v26)
                objc_enumerationMutation(v23);
              v34.origin.x = _UIFocusItemFrameInCoordinateSpace(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v14);
              v35.origin.x = v16;
              v35.origin.y = v18;
              v35.size.width = v20;
              v35.size.height = v22;
              if (CGRectContainsRect(v34, v35))
              {

                -[_UIFocusLinearMovementCache _invalidateOnTimeout](self, "_invalidateOnTimeout", (_QWORD)v28);
                goto LABEL_27;
              }
            }
            v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v25)
              continue;
            break;
          }
        }

LABEL_27:
        goto LABEL_28;
      }
    }
    else
    {
      v13 = 0;
      if (v7)
        goto LABEL_15;
    }
    -[_UIFocusLinearMovementCache _invalidateOnTimeout](self, "_invalidateOnTimeout");
LABEL_28:

    goto LABEL_29;
  }
  -[_UIFocusLinearMovementCache _invalidateOnTimeout](self, "_invalidateOnTimeout");
LABEL_30:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentEnvironments, 0);
  objc_storeStrong((id *)&self->_linearItems, 0);
}

@end
