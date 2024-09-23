@implementation UIFocusRingManager

+ (void)updateRingForFocusItem:(id)a3
{
  objc_msgSend(a1, "updateRingForFocusItem:forClient:", a3, CFSTR("FocusEngineClient"));
}

+ (void)removeRingFromFocusItem:(id)a3
{
  objc_msgSend(a1, "removeRingFromFocusItem:forClient:", a3, CFSTR("FocusEngineClient"));
}

+ (void)updateRingForFocusItem:(id)a3 forClient:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v6 = a3;
  objc_msgSend(a1, "_currentFocusItemForClient:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(a1, "manager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updateFocusLayerFrames");

  }
}

+ (void)removeRingFromFocusItem:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusRingStateForClient");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_3;
  v10 = (void *)v9;
  objc_msgSend(v8, "focusRingStateForClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentFocusItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v6)
  {
    objc_msgSend(v8, "_removeActiveFocusLayersForClient:", v7);
  }
  else
  {
LABEL_3:
    objc_msgSend(v8, "activeFocusLayersForClient:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      objc_msgSend(v8, "activeFocusLayersForClient:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v22);
            objc_msgSend(v8, "activeFocusLayersToItemsForClient:", v7, (_QWORD)v27);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKey:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
            {
              objc_msgSend(v23, "removeFromSuperlayer");
              objc_msgSend(v8, "activeFocusLayersForClient:", v7);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "removeObject:", v23);

            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v20);
      }

    }
  }

}

+ (id)_currentFocusItemForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusRingStateForClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentFocusItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)manager
{
  if (_MergedGlobals_1167 != -1)
    dispatch_once(&_MergedGlobals_1167, &__block_literal_global_403);
  return (id)qword_1ECD7F4D8;
}

- (NSMutableDictionary)focusRingStateForClient
{
  return self->_focusRingStateForClient;
}

- (id)activeFocusLayersForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_focusRingStateForClient, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeFocusLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_focusRingStateForClient, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveFocusLayers:", v7);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_focusRingStateForClient, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeFocusLayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __29__UIFocusRingManager_manager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD7F4D8;
  qword_1ECD7F4D8 = v0;

}

- (void)_removeActiveFocusLayersForClient:(id)a3
{
  id v3;

  -[UIFocusRingManager activeFocusLayersForClient:](self, "activeFocusLayersForClient:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
    objc_msgSend(v3, "removeAllObjects");
  }

}

+ (BOOL)focusRingAvailable
{
  void *v2;
  BOOL v3;

  _UIFocusBehaviorForScene(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "focusRingVisibility") != 0;

  return v3;
}

+ (Class)shapeLayerClassForItem:(id)a3 client:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)activeFocusLayersToItemsForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_focusRingStateForClient, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeFocusLayersToItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_focusRingStateForClient, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveFocusLayersToItems:", v7);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_focusRingStateForClient, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeFocusLayersToItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)moveRingToFocusItem:(id)a3
{
  objc_msgSend(a1, "moveRingToFocusItem:forClient:", a3, CFSTR("FocusEngineClient"));
}

+ (void)moveRingToFocusItem:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIFocusRingClientState *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusRingStateForClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFocusRingStateForClient:", v10);

  }
  objc_msgSend(v8, "focusRingStateForClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v8, "focusRingStateForClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UIFocusRingClientState initWithClientID:]([UIFocusRingClientState alloc], "initWithClientID:", v7);
    objc_msgSend(v13, "setObject:forKey:", v14, v7);

  }
  objc_msgSend(v8, "focusRingStateForClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCurrentFocusItem:", v6);

  objc_msgSend(v8, "_removeActiveFocusLayersForClient:", v7);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  _UIFocusBehaviorForEnvironment((uint64_t)v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v17, "supportsParentFocusRings");

  if ((_DWORD)v16)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__UIFocusRingManager_moveRingToFocusItem_forClient___block_invoke;
    v18[3] = &unk_1E16D9AF0;
    v21 = &v22;
    v19 = v8;
    v20 = v7;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v6, v18);

  }
  if (*((_BYTE *)v23 + 24))
    objc_msgSend(v8, "addSelectedFocusRingForItem:forClient:", v6, v7);
  else
    objc_msgSend(v8, "addFocusRingForItem:forClient:", v6, v7);
  objc_msgSend(v8, "_updateFocusLayerFrames");
  _Block_object_dispose(&v22, 8);

}

void __52__UIFocusRingManager_moveRingToFocusItem_forClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "_drawsFocusRingWhenChildrenFocused"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "addSelectedParentFocusRingForItem:forClient:", v3, *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "canBecomeFocused"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addParentFocusRingForItem:forClient:", v3, *(_QWORD *)(a1 + 40));
  }

}

- (void)addFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIFocusRingManager _viewToAddFocusLayerForItem:forClient:](self, "_viewToAddFocusLayerForItem:forClient:", v13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend((id)objc_opt_class(), "shapeLayerClassForItem:client:", v13, v6);
    objc_msgSend(v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIFocusRingManager _addFocusLayer:toView:forItem:](self, "_addFocusLayer:toView:forItem:", v10, v7, v13);
    -[UIFocusRingManager activeFocusLayersToItemsForClient:](self, "activeFocusLayersToItemsForClient:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, v10);

    -[UIFocusRingManager activeFocusLayersForClient:](self, "activeFocusLayersForClient:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

  }
}

- (void)addParentFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIFocusRingManager _viewToAddFocusLayerForItem:forClient:](self, "_viewToAddFocusLayerForItem:forClient:", v13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend((id)objc_opt_class(), "shapeLayerClassForItem:client:", v13, v6);
    objc_msgSend(v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIFocusRingManager _addFocusLayer:toView:forItem:](self, "_addFocusLayer:toView:forItem:", v10, v7, v13);
    -[UIFocusRingManager activeFocusLayersToItemsForClient:](self, "activeFocusLayersToItemsForClient:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, v10);

    -[UIFocusRingManager activeFocusLayersForClient:](self, "activeFocusLayersForClient:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

  }
}

- (void)addSelectedFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[UIFocusRingManager _viewToAddFocusLayerForItem:forClient:](self, "_viewToAddFocusLayerForItem:forClient:", v14, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend((id)objc_opt_class(), "shapeLayerClassForItem:client:", v14, v6);
    objc_msgSend(v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v10);

    -[UIFocusRingManager activeFocusLayersToItemsForClient:](self, "activeFocusLayersToItemsForClient:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, v10);

    -[UIFocusRingManager activeFocusLayersForClient:](self, "activeFocusLayersForClient:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v10);

  }
}

- (void)addSelectedParentFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIFocusRingManager _viewToAddFocusLayerForItem:forClient:](self, "_viewToAddFocusLayerForItem:forClient:", v13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend((id)objc_opt_class(), "shapeLayerClassForItem:client:", v13, v6);
    objc_msgSend(v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedParentLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIFocusRingManager _addFocusLayer:toView:forItem:](self, "_addFocusLayer:toView:forItem:", v10, v7, v13);
    -[UIFocusRingManager activeFocusLayersToItemsForClient:](self, "activeFocusLayersToItemsForClient:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, v10);

    -[UIFocusRingManager activeFocusLayersForClient:](self, "activeFocusLayersForClient:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

  }
}

- (void)_addFocusLayer:(id)a3 toView:(id)a4 forItem:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_updateWithTintColor:", v10);

  }
  v11 = -[UIFocusRingManager _insertionIndexOfFocusLayerForFocusItem:](self, "_insertionIndexOfFocusLayerForFocusItem:", v9);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  v12 = v11;
  objc_msgSend(v8, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sublayers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 < v12)
  {
LABEL_5:
    objc_msgSend(v8, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v17);
  }
  else
  {
    objc_msgSend(v8, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSublayer:atIndex:", v17, v12);
  }

}

- (BOOL)_focusItemWantsFocusRing:(id)a3 forClient:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  _UIFocusBehaviorForEnvironment((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "focusRingVisibility");

  if ((unint64_t)(v6 - 2) >= 2)
  {
    v8 = v6 == 1;
  }
  else
  {
    _UIFocusItemHaloEffect(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  return v8;
}

- (id)_viewToAddFocusLayerForItem:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v10;

  v6 = a3;
  v7 = a4;
  if (v6
    && -[UIFocusRingManager _focusItemWantsFocusRing:forClient:](self, "_focusItemWantsFocusRing:forClient:", v6, v7))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "_viewToAddFocusLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _UIFocusEnvironmentContainingView(v6);
      v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      -[UIView _addGeometryChangeObserver:](v10, self);
      objc_msgSend(v10, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_insertionIndexOfFocusLayerForFocusItem:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_insertionIndexOfFocusLayerInView");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)_focusRingPathForItem:(id)a3 inView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  _UIFocusItemHaloEffect(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "coordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = _UIFocusItemFrameInCoordinateSpace(v5, v14);
    v17 = v16;
    v19 = v18;
    v21 = v20;

    +[UIFocusRingStyle cornerRadius](UIFocusRingStyle, "cornerRadius");
    v23 = v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v5, "layer");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v24;
    if (v24)
    {
      objc_msgSend(v24, "cornerRadius");
      if (v25 > 0.0)
      {
        objc_msgSend(v12, "cornerRadius");
        v23 = v26;
        objc_msgSend(v12, "cornerCurve");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CD2A68]);

        if (v28)
        {
          +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", v15, v17, v19, v21, v23);
          v29 = objc_claimAutoreleasedReturnValue();
LABEL_13:
          v13 = (void *)v29;
          goto LABEL_14;
        }
      }
    }
LABEL_12:
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v15, v17, v19, v21, v23);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v7, "_shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEnvironmentContainingView(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "shapeConvertedFromCoordinateSpace:toCoordinateSpace:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "outline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v13;
}

- (void)_updateFocusLayerFrames
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  float v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v32;
  void *v33;
  id obj;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[UIFocusRingManager focusRingStateForClient](self, "focusRingStateForClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v37 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v48;
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v7, "activeFocusLayersToItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "copy");

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v9, "keyEnumerator");
        v42 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (!v10)
        {
          v33 = v42;
          goto LABEL_35;
        }
        v11 = v10;
        v38 = v7;
        v39 = i;
        v40 = 0;
        v12 = *(_QWORD *)v44;
        while (2)
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v44 != v12)
              objc_enumerationMutation(v42);
            v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            objc_msgSend(v14, "superlayer");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
              continue;
            objc_msgSend(v9, "objectForKey:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            _UIFocusEnvironmentContainingView(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (!v16)
            {

              i = v39;
              goto LABEL_34;
            }
            objc_msgSend(v17, "alpha");
            if (v19 == 0.0)
            {
              objc_msgSend(v18, "alpha");
              *(float *)&v20 = v20;
            }
            else
            {
              objc_msgSend(v14, "opacity");
              v21 = *(float *)&v20;
              LODWORD(v20) = 1.0;
              if (v21 != 0.0)
                goto LABEL_17;
            }
            objc_msgSend(v14, "setOpacity:", v20);
LABEL_17:
            objc_msgSend(v14, "superlayer", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            CALayerGetDelegate();
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if ((_IsKindOfUIView((uint64_t)v23) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusRingManager.m"), 404, CFSTR("Internal inconsistency: the layer owning the focus ring is no longer associated with a UIView."));

            }
            v24 = v23;
            objc_msgSend(v24, "_window");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v26 = v11;
              v27 = v12;
              -[UIFocusRingManager _focusRingPathForItem:inView:](self, "_focusRingPathForItem:inView:", v16, v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "bounds");
              if (v4 != v30 || v5 != v29)
              {
                objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
                objc_msgSend(v14, "setPath:", objc_msgSend(objc_retainAutorelease(v28), "CGPath"));
                objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
              }

              v12 = v27;
              v11 = v26;
            }
            else
            {
              v40 = 1;
            }

            if (!v25)
              goto LABEL_30;
          }
          v11 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v11)
            continue;
          break;
        }
LABEL_30:

        i = v39;
        if ((v40 & 1) == 0)
          goto LABEL_36;
LABEL_34:
        objc_msgSend(v38, "clientID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIFocusRingManager _removeActiveFocusLayersForClient:](self, "_removeActiveFocusLayersForClient:", v33);
LABEL_35:

LABEL_36:
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v37);
  }

}

+ (void)_removeActiveFocusLayers
{
  id v2;

  objc_msgSend(a1, "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeActiveFocusLayersForClient:", CFSTR("FocusEngineClient"));

}

+ (void)_updateActiveFocusLayers
{
  void *v3;
  id v4;

  objc_msgSend(a1, "manager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_currentFocusItemForClient:", CFSTR("FocusEngineClient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(a1, "moveRingToFocusItem:", v3);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusRingManager focusRingStateForClient](self, "focusRingStateForClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, state: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setFocusRingStateForClient:(id)a3
{
  objc_storeStrong((id *)&self->_focusRingStateForClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRingStateForClient, 0);
}

@end
