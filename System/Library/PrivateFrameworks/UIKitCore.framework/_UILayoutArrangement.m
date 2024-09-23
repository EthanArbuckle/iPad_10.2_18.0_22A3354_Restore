@implementation _UILayoutArrangement

- (void)_updateConfigurationHistory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id WeakRetained;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;

  -[_UILayoutArrangement _configurationHistory](self, "_configurationHistory");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_UILayoutArrangement _propertySource](self, "_propertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isInLayoutArrangementUpdateSection"))
  {
    objc_msgSend(v14, "setHasEstablishedBaseValues:", 1);
    objc_msgSend(v14, "setLayoutFillsCanvas:", objc_msgSend(v3, "layoutFillsCanvas"));
  }
  else
  {
    -[NSMutableSet removeAllObjects](self->_incomingItems, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_outgoingItems, "removeAllObjects");
    objc_msgSend(v14, "_newlyUnhiddenItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

    objc_msgSend(v14, "_newlyHiddenItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    objc_msgSend(v14, "invalidBaselineConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    objc_msgSend(v14, "setAxis:", objc_msgSend(v3, "axis"));
    objc_msgSend(v14, "setLayoutUsesCanvasMarginsWhenFilling:", objc_msgSend(v3, "layoutUsesCanvasMarginsWhenFilling"));
    if (self->_unanimatedConfigurationTarget
      || (v7 = objc_loadWeakRetained((id *)&self->_canvas),
          v8 = objc_msgSend(v7, "_isInAnimatedLayout"),
          v7,
          (v8 & 1) == 0))
    {
      -[_UILayoutArrangement _setUnanimatedConfigurationTarget:](self, "_setUnanimatedConfigurationTarget:", 0);
      if (self->_awaitingAnimationLayoutPass)
      {
        -[_UILayoutArrangement canvas](self, "canvas");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNeedsLayout");

      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      if (WeakRetained)
      {
        v10 = WeakRetained;
        v11 = objc_loadWeakRetained((id *)&self->_canvas);
        v12 = objc_msgSend(v11, "_isInAnimatedLayout");

        if (v12)
          self->_awaitingAnimationLayoutPass = 0;
      }
    }
    if (!self->_awaitingAnimationLayoutPass)
    {
      -[NSMutableSet removeAllObjects](self->_newlyHiddenItems, "removeAllObjects");
      -[NSMutableSet removeAllObjects](self->_newlyUnhiddenItems, "removeAllObjects");
      -[NSMutableSet removeAllObjects](self->_invalidBaselineConstraints, "removeAllObjects");
    }
  }

}

- (_UILAConfigurationHistory)_configurationHistory
{
  _UILAConfigurationHistory *configurationHistory;
  _UILAConfigurationHistory *v4;
  _UILAConfigurationHistory *v5;
  void *v6;
  void *v7;

  configurationHistory = self->_configurationHistory;
  if (!configurationHistory)
  {
    v4 = (_UILAConfigurationHistory *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_configurationHistoryClass"));
    v5 = self->_configurationHistory;
    self->_configurationHistory = v4;

    -[_UILAConfigurationHistory _newlyHiddenItems](self->_configurationHistory, "_newlyHiddenItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", self->_newlyHiddenItems);

    -[_UILAConfigurationHistory _newlyUnhiddenItems](self->_configurationHistory, "_newlyUnhiddenItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", self->_newlyUnhiddenItems);

    configurationHistory = self->_configurationHistory;
  }
  return configurationHistory;
}

- (BOOL)_itemWantsLayoutAsIfVisible:(id)a3
{
  id v4;
  _UILayoutArrangement *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  -[_UILayoutArrangement _propertySource](self, "_propertySource");
  v5 = (_UILayoutArrangement *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_la_isVisible");
  v7 = 0;
  v8 = v6 ^ 1;
  if (((v6 ^ 1) & 1) == 0 && v5 != self)
  {
    -[_UILayoutArrangement _newlyUnhiddenItems](v5, "_newlyUnhiddenItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v4) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      -[_UILayoutArrangement _newlyUnhiddenItems](self, "_newlyUnhiddenItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "containsObject:", v4);

    }
  }
  if (v5 == self)
    v11 = 1;
  else
    v11 = v6;
  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[_UILayoutArrangement _newlyHiddenItems](v5, "_newlyHiddenItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "containsObject:", v4) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      -[_UILayoutArrangement _newlyHiddenItems](self, "_newlyHiddenItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "containsObject:", v4);

    }
  }
  if ((v8 | v7) == 1)
    v15 = v8 & v12;
  else
    v15 = 1;

  return v15;
}

- (_UILAPropertySource)_propertySource
{
  UIView **p_canvas;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  void *unanimatedConfigurationTarget;

  p_canvas = &self->_canvas;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_canvas),
        v7 = objc_msgSend(v6, "_isInAnimatedLayout"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    unanimatedConfigurationTarget = self;
  }
  else
  {
    unanimatedConfigurationTarget = self->_unanimatedConfigurationTarget;
    if (!unanimatedConfigurationTarget)
      unanimatedConfigurationTarget = self->_configurationHistory;
  }
  return (_UILAPropertySource *)unanimatedConfigurationTarget;
}

- (NSSet)_newlyUnhiddenItems
{
  return (NSSet *)self->_newlyUnhiddenItems;
}

- (void)_setUnanimatedConfigurationTarget:(id)a3
{
  objc_storeStrong((id *)&self->_unanimatedConfigurationTarget, a3);
}

- (_UILayoutArrangement)initWithItems:(id)a3
{
  id v4;
  _UILayoutArrangement *v5;
  uint64_t v6;
  NSMutableArray *mutableItems;
  uint64_t v8;
  NSMutableSet *incomingItems;
  NSMutableSet *v10;
  NSMutableSet *outgoingItems;
  NSMutableSet *v12;
  NSMutableSet *hiddenItems;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSMutableSet *newlyHiddenItems;
  NSMutableSet *v24;
  NSMutableSet *newlyUnhiddenItems;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UILayoutArrangement;
  v5 = -[_UILayoutArrangement init](&v31, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    mutableItems = v5->_mutableItems;
    v5->_mutableItems = (NSMutableArray *)v6;

    v8 = -[NSMutableArray mutableCopy](v5->_mutableItems, "mutableCopy");
    incomingItems = v5->_incomingItems;
    v5->_incomingItems = (NSMutableSet *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    outgoingItems = v5->_outgoingItems;
    v5->_outgoingItems = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hiddenItems = v5->_hiddenItems;
    v5->_hiddenItems = v12;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
          v21 = v20;
          objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (_QWORD)v27);
          if ((objc_msgSend(v21, "_la_isVisible") & 1) == 0)
            -[NSMutableSet addObject:](v5->_hiddenItems, "addObject:", v19);
          objc_msgSend(v21, "_incrementHiddenManagedByLayoutArrangementCount");

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }

    v22 = -[NSMutableSet mutableCopy](v5->_hiddenItems, "mutableCopy");
    newlyHiddenItems = v5->_newlyHiddenItems;
    v5->_newlyHiddenItems = (NSMutableSet *)v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    newlyUnhiddenItems = v5->_newlyUnhiddenItems;
    v5->_newlyUnhiddenItems = v24;

  }
  return v5;
}

- (void)setCanvas:(id)a3
{
  _DWORD *v4;
  UIView **p_canvas;
  _DWORD *WeakRetained;
  _UILayoutArrangement *v7;
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_canvas = &self->_canvas;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);

  if (WeakRetained != v4)
  {
    v7 = self;
    v8 = objc_loadWeakRetained((id *)p_canvas);
    -[UIView _removeLayoutArrangement:](v8, v7);

    -[UIView _addLayoutArrangement:](v4, v7);
    objc_storeWeak((id *)p_canvas, v4);
    -[_UILayoutArrangement _clearAllConstraintsArrays](v7, "_clearAllConstraintsArrays");
    v9 = objc_loadWeakRetained((id *)p_canvas);

    if (v9)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v7->_mutableItems;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
            v16 = objc_loadWeakRetained((id *)p_canvas);
            v17 = objc_msgSend(v15, "isDescendantOfView:", v16, (_QWORD)v19);

            if ((v17 & 1) == 0)
            {
              v18 = objc_loadWeakRetained((id *)p_canvas);
              objc_msgSend(v18, "addSubview:", v15);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

    }
    -[_UILayoutArrangement _respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:](v7, "_respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:", 0, 0, 0, 0, (_QWORD)v19);

  }
}

- (_UILayoutArrangement)initWithItems:(id)a3 onAxis:(int64_t)a4
{
  _UILayoutArrangement *result;

  result = -[_UILayoutArrangement initWithItems:](self, "initWithItems:", a3);
  if (result)
    result->_axis = a4;
  return result;
}

- (void)_setLayoutFillsCanvas:(BOOL)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id WeakRetained;
  _QWORD v8[4];
  BOOL v9;

  if (self->_layoutFillsCanvas != a3)
  {
    v4 = a4;
    v6 = MEMORY[0x1E0C809B0];
    self->_layoutFillsCanvas = a3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __53___UILayoutArrangement__setLayoutFillsCanvas_notify___block_invoke;
    v8[3] = &__block_descriptor_33_e35_v16__0___UILAConfigurationHistory_8l;
    v9 = a3;
    -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", v8);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(WeakRetained);

    }
  }
}

- (BOOL)_monitorsSystemLayoutFittingSizeForItem:(id)a3
{
  return 0;
}

- (void)insertItem:(id)a3 atIndex:(unint64_t)a4
{
  void *v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  NSMutableArray **p_mutableItems;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || -[NSMutableArray count](self->_mutableItems, "count") < a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILayoutArrangement.m"), 462, CFSTR("index for item in layout arrangement is out of bounds"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v24;
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    if (WeakRetained
      && (v10 = WeakRetained,
          v11 = objc_loadWeakRetained((id *)&self->_canvas),
          v12 = objc_msgSend(v8, "isDescendantOfView:", v11),
          v11,
          v10,
          (v12 & 1) == 0))
    {
      p_mutableItems = &self->_mutableItems;
      -[NSMutableArray insertObject:atIndex:](self->_mutableItems, "insertObject:atIndex:", v8, a4);
      v19 = v8;
      v18 = v24;
      if (a4 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_18;
      v20 = -[NSMutableArray indexOfObject:](*p_mutableItems, "indexOfObject:", v19);
      v18 = v24;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_18;
      v15 = v20;
      v17 = 1;
      v18 = v24;
    }
    else
    {
      p_mutableItems = &self->_mutableItems;
      v14 = -[NSMutableArray indexOfObject:](self->_mutableItems, "indexOfObject:", v8);
      if (v14 == a4)
        goto LABEL_23;
      v15 = v14;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = v8;
        v17 = 0;
        v18 = v24;
        goto LABEL_17;
      }
      v18 = 0;
      v17 = 0;
    }
    -[NSMutableArray removeObjectAtIndex:](*p_mutableItems, "removeObjectAtIndex:", v15);
LABEL_17:
    -[NSMutableArray insertObject:atIndex:](*p_mutableItems, "insertObject:atIndex:", v8, (_QWORD)((__PAIR128__(a4, -[NSMutableArray count](*p_mutableItems, "count")) - a4) >> 64));
    if (!v17)
    {
LABEL_19:
      if (objc_msgSend(v18, "_la_isVisible"))
        v22 = 0;
      else
        v22 = v18;
      -[_UILayoutArrangement _respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:](self, "_respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:", v18, 0, v22, 0);

      goto LABEL_23;
    }
LABEL_18:
    v21 = objc_loadWeakRetained((id *)&self->_canvas);
    objc_msgSend(v21, "addSubview:", v8);

    goto LABEL_19;
  }
LABEL_23:

}

- (void)_trackChangesWithConfigBlock:(id)a3
{
  id WeakRetained;
  _BOOL4 v5;
  void (**v6)(id, _UILAConfigurationHistory *);

  v6 = (void (**)(id, _UILAConfigurationHistory *))a3;
  -[_UILayoutArrangement _createUnanimatedConfigurationTargetIfNecessary](self, "_createUnanimatedConfigurationTargetIfNecessary");
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  v5 = _UILAIsAnimatingOnCanvas(WeakRetained);

  if (v5)
    -[_UILayoutArrangement _registerAnimationRequest](self, "_registerAnimationRequest");
  else
    v6[2](v6, self->_unanimatedConfigurationTarget);
  -[_UILayoutArrangement _respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:](self, "_respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:", 0, 0, 0, 0);

}

- (void)_respondToChangesWithIncomingItem:(id)a3 outgoingItem:(id)a4 newlyHiddenItem:(id)a5 newlyUnhiddenItem:(id)a6
{
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  UIView **p_canvas;
  id WeakRetained;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = (unint64_t)a5;
  v13 = (unint64_t)a6;
  -[_UILayoutArrangement _createUnanimatedConfigurationTargetIfNecessary](self, "_createUnanimatedConfigurationTargetIfNecessary");
  p_canvas = &self->_canvas;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  v16 = _UILAIsAnimatingOnCanvas(WeakRetained);

  if (v11)
  {
    objc_msgSend(v11, "_decrementHiddenManagedByLayoutArrangementCount");
    -[NSMutableSet addObject:](self->_outgoingItems, "addObject:", v11);
    -[NSMutableSet removeObject:](self->_incomingItems, "removeObject:", v11);
    -[NSMutableSet removeObject:](self->_hiddenItems, "removeObject:", v11);
    -[_UILAConfigurationHistory _newlyHiddenItems](self->_unanimatedConfigurationTarget, "_newlyHiddenItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObject:", v11);

    -[NSMutableSet removeObject:](self->_newlyHiddenItems, "removeObject:", v11);
    if (-[_UILayoutArrangement _requiresNotificationForHasBaselinePropertyChanges](self, "_requiresNotificationForHasBaselinePropertyChanges"))
    {
      objc_msgSend(v11, "_viewForLoweringBaselineLayoutAttribute:", 11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObserver:name:object:", self, CFSTR("_UIViewHasBaselinePropertyChanged"), v18);

      }
    }
  }
  if (v10)
  {
    objc_msgSend(v10, "_incrementHiddenManagedByLayoutArrangementCount");
    -[NSMutableSet addObject:](self->_incomingItems, "addObject:", v10);
    -[NSMutableSet removeObject:](self->_outgoingItems, "removeObject:", v10);
    if ((objc_msgSend(v10, "_la_isVisible") & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_hiddenItems, "addObject:", v10);
      -[_UILAConfigurationHistory _newlyHiddenItems](self->_unanimatedConfigurationTarget, "_newlyHiddenItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v10);

      -[NSMutableSet addObject:](self->_newlyHiddenItems, "addObject:", v10);
    }
    if (-[_UILayoutArrangement _requiresNotificationForHasBaselinePropertyChanges](self, "_requiresNotificationForHasBaselinePropertyChanges"))
    {
      objc_msgSend(v10, "_viewForLoweringBaselineLayoutAttribute:", 11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "_isHasBaselinePropertyChangeable"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__hasBaselineChangedNotification_, CFSTR("_UIViewHasBaselinePropertyChanged"), v21);

      }
      objc_msgSend(v10, "_viewForLoweringBaselineLayoutAttribute:", 12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 != v21 && objc_msgSend(v23, "_isHasBaselinePropertyChangeable"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObserver:selector:name:object:", self, sel__hasBaselineChangedNotification_, CFSTR("_UIViewHasBaselinePropertyChanged"), v24);

      }
    }
  }
  if (v12 | v13)
  {
    if (v16)
      -[_UILayoutArrangement _registerAnimationRequest](self, "_registerAnimationRequest");
    if (v12)
    {
      -[NSMutableSet addObject:](self->_newlyHiddenItems, "addObject:", v12);
      -[NSMutableSet removeObject:](self->_newlyUnhiddenItems, "removeObject:", v12);
      if (v16)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __105___UILayoutArrangement__respondToChangesWithIncomingItem_outgoingItem_newlyHiddenItem_newlyUnhiddenItem___block_invoke;
        v32[3] = &unk_1E16B1B28;
        v33 = (id)v12;
        +[UIViewAnimationState _addSystemPostAnimationAction:](UIViewAnimationState, "_addSystemPostAnimationAction:", v32);

        goto LABEL_26;
      }
      -[_UILAConfigurationHistory _newlyHiddenItems](self->_unanimatedConfigurationTarget, "_newlyHiddenItems");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v12);

      -[_UILAConfigurationHistory _newlyUnhiddenItems](self->_unanimatedConfigurationTarget, "_newlyUnhiddenItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = v12;
    }
    else
    {
      -[NSMutableSet addObject:](self->_newlyUnhiddenItems, "addObject:", v13);
      -[NSMutableSet removeObject:](self->_newlyHiddenItems, "removeObject:", v13);
      if (v16)
        goto LABEL_26;
      -[_UILAConfigurationHistory _newlyUnhiddenItems](self->_unanimatedConfigurationTarget, "_newlyUnhiddenItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v13);

      -[_UILAConfigurationHistory _newlyHiddenItems](self->_unanimatedConfigurationTarget, "_newlyHiddenItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = v13;
    }
    objc_msgSend(v27, "removeObject:", v29);

  }
LABEL_26:
  v31 = objc_loadWeakRetained((id *)p_canvas);
  objc_msgSend(v31, "setNeedsUpdateConstraints");

}

- (void)_createUnanimatedConfigurationTargetIfNecessary
{
  _UILAConfigurationHistory *v3;
  _UILAConfigurationHistory *unanimatedConfigurationTarget;
  id v5;

  if (!self->_unanimatedConfigurationTarget)
  {
    -[_UILayoutArrangement _configurationHistory](self, "_configurationHistory");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (_UILAConfigurationHistory *)objc_msgSend(v5, "copy");
    unanimatedConfigurationTarget = self->_unanimatedConfigurationTarget;
    self->_unanimatedConfigurationTarget = v3;

  }
}

- (BOOL)_requiresNotificationForHasBaselinePropertyChanges
{
  return 0;
}

- (int64_t)_layoutRelationForCanvasConnectionForAttribute:(int64_t)a3
{
  return 0;
}

- (void)_createSpanningLayoutGuide
{
  _UILayoutSpacer *v3;
  _UILayoutSpacer *spanningLayoutGuide;
  void *v5;
  id WeakRetained;
  id v7;

  if (-[_UILayoutArrangement _axisForSpanningLayoutGuide](self, "_axisForSpanningLayoutGuide"))
    +[_UILayoutSpacer _verticalLayoutSpacer](_UILayoutSpacer, "_verticalLayoutSpacer");
  else
    +[_UILayoutSpacer _horizontalLayoutSpacer](_UILayoutSpacer, "_horizontalLayoutSpacer");
  v3 = (_UILayoutSpacer *)objc_claimAutoreleasedReturnValue();
  spanningLayoutGuide = self->_spanningLayoutGuide;
  self->_spanningLayoutGuide = v3;

  -[_UILayoutArrangement _identifierForSpanningLayoutGuide](self, "_identifierForSpanningLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide setIdentifier:](self->_spanningLayoutGuide, "setIdentifier:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_canvas);
    objc_msgSend(v7, "addLayoutGuide:", self->_spanningLayoutGuide);

    -[UILayoutGuide _setLockedToOwningView:](self->_spanningLayoutGuide, "_setLockedToOwningView:", 1);
  }
}

- (NSArray)items
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableItems, "copy");
}

- (void)addItem:(id)a3
{
  char isKindOfClass;
  void *v5;
  NSMutableArray *mutableItems;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v8;
  if (v8 && (isKindOfClass & 1) != 0)
  {
    mutableItems = self->_mutableItems;
    v7 = v8;
    -[_UILayoutArrangement insertItem:atIndex:](self, "insertItem:atIndex:", v7, -[NSMutableArray count](mutableItems, "count"));

    v5 = v8;
  }

}

- (NSSet)_outgoingItems
{
  return (NSSet *)self->_outgoingItems;
}

- (NSSet)_newlyHiddenItems
{
  return (NSSet *)self->_newlyHiddenItems;
}

- (unint64_t)_indexOfItemForLocationAttribute:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  BOOL v9;

  -[_UILayoutArrangement _mutableItems](self, "_mutableItems", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v8);

      if (v9)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSMutableArray)_mutableItems
{
  return self->_mutableItems;
}

- (NSSet)_hiddenItems
{
  return (NSSet *)self->_hiddenItems;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)removeItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_mutableItems, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
    v7 = v6;
    -[NSMutableArray removeObjectAtIndex:](self->_mutableItems, "removeObjectAtIndex:", v5);
    if (v7)
    {
      -[_UILayoutArrangement _respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:](self, "_respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:", 0, v7, 0, 0);

    }
  }

}

- (_UILAConfigurationHistory)_unanimatedConfigurationTarget
{
  return self->_unanimatedConfigurationTarget;
}

- (NSSet)_incomingItems
{
  return (NSSet *)self->_incomingItems;
}

- (void)_updateArrangementConstraints
{
  id v3;

  -[_UILayoutArrangement _configurationHistory](self, "_configurationHistory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInLayoutArrangementUpdateSection:", 1);
  -[_UILayoutArrangement _updateSpanningLayoutGuideConstraintsIfNecessary](self, "_updateSpanningLayoutGuideConstraintsIfNecessary");
  -[_UILayoutArrangement _updateCanvasConnectionConstraintsIfNecessary](self, "_updateCanvasConnectionConstraintsIfNecessary");
  -[_UILayoutArrangement _updateConfigurationHistory](self, "_updateConfigurationHistory");
  objc_msgSend(v3, "setInLayoutArrangementUpdateSection:", 0);

}

- (void)_updateSpanningLayoutGuideConstraintsIfNecessary
{
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(void *, void *, BOOL, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  void (**v49)(void);
  _BOOL4 v50;
  void *v51;
  id v52;
  void *v53;
  BOOL v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  id v69;
  _QWORD aBlock[5];
  id v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if (self->_spanningLayoutGuide
    && -[_UILayoutArrangement _spanningGuideConstraintsNeedUpdate](self, "_spanningGuideConstraintsNeedUpdate"))
  {
    v3 = -[_UILayoutSpacer _isHorizontal](self->_spanningLayoutGuide, "_isHorizontal");
    if (-[_UILayoutArrangement _axisForSpanningLayoutGuide](self, "_axisForSpanningLayoutGuide") == v3)
    {
      -[_UILayoutArrangement _removeSpanningLayoutGuide](self, "_removeSpanningLayoutGuide");
      -[_UILayoutArrangement _createSpanningLayoutGuide](self, "_createSpanningLayoutGuide");
    }
    -[UILayoutGuide _systemConstraints](self->_spanningLayoutGuide, "_systemConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_2;
    aBlock[3] = &unk_1E16E9700;
    aBlock[4] = self;
    v72 = &__block_literal_global_624;
    v7 = v5;
    v71 = v7;
    v8 = (void (**)(void *, void *, BOOL, _QWORD))_Block_copy(aBlock);
    v68[0] = v6;
    v68[1] = 3221225472;
    v68[2] = __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_3;
    v68[3] = &unk_1E16B1B50;
    v68[4] = self;
    v52 = v7;
    v69 = v52;
    v49 = (void (**)(void))_Block_copy(v68);
    -[_UILayoutArrangement _propertySource](self, "_propertySource");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v48, "axis");
    v10 = objc_msgSend(v4, "count");
    if (v9)
      v11 = 5;
    else
      v11 = 3;
    if (v9)
      v12 = 6;
    else
      v12 = 4;
    v13 = -[_UILayoutArrangement _usesInequalitySpanningConstraintForAttribute:](self, "_usesInequalitySpanningConstraintForAttribute:", v11);
    v14 = -[_UILayoutArrangement _usesInequalitySpanningConstraintForAttribute:](self, "_usesInequalitySpanningConstraintForAttribute:", v12);
    v15 = v14;
    v16 = 1;
    if (!v13 && !v14)
      v16 = -[_UILayoutArrangement _spanningLayoutGuideAlwaysUsesFittingConstraint](self, "_spanningLayoutGuideAlwaysUsesFittingConstraint");
    if (-[_UILAConfigurationHistory axis](self->_configurationHistory, "axis") == v9 && v10)
    {
      v53 = (void *)-[NSMutableSet mutableCopy](self->_incomingItems, "mutableCopy");
      if (objc_msgSend(v4, "count"))
      {
        v17 = 0;
        v18 = 0;
        v51 = v4;
        v50 = v16;
        while (1)
        {
          objc_msgSend(v4, "objectAtIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v18)
            goto LABEL_19;
          objc_msgSend(v19, "secondItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            break;
          if (v16)
            objc_msgSend(v52, "addObject:", v20);
          else
            objc_msgSend(v20, "setActive:", 0);
          v18 = 0;
          v17 = 1;
LABEL_37:

          if (++v18 >= (unint64_t)objc_msgSend(v4, "count"))
            goto LABEL_55;
        }
        if (v16)
          v49[2]();
LABEL_19:
        v55 = v17;
        objc_msgSend(v20, "secondItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSMutableSet containsObject:](self->_outgoingItems, "containsObject:", v21))
        {
          objc_msgSend(v4, "objectAtIndex:", ++v18);
          v22 = v4;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setActive:", 0);
          objc_msgSend(v23, "setActive:", 0);

          v4 = v22;
        }
        else
        {
          if ((v18 & 1) == v17)
            v24 = v13;
          else
            v24 = v15;
          v25 = -1;
          if ((v18 & 1) != v17)
            v25 = 1;
          v54 = v16 && v24;
          if (v16 && v24)
            v26 = v25;
          else
            v26 = 0;
          if (objc_msgSend(v20, "relation") == v26)
          {
            objc_msgSend(v52, "addObject:", v20);
          }
          else
          {
            objc_msgSend(v20, "setActive:", 0);
            ((void (**)(void *, void *, BOOL, BOOL))v8)[2](v8, v21, (v18 & 1) == v17, v54);
          }
          objc_msgSend(v53, "removeObject:", v21);
          v4 = v51;
          v16 = v50;
        }
        v17 = v55;

        goto LABEL_37;
      }
LABEL_55:
      v31 = v4;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v28 = v53;
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v61 != v37)
              objc_enumerationMutation(v28);
            v39 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            v8[2](v8, v39, 1, v13);
            v8[2](v8, v39, 0, v15);
          }
          v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
        }
        while (v36);
      }

    }
    else
    {
      if (objc_msgSend(v4, "count"))
        objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v4);
      if (v16)
        v49[2]();
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v28 = self->_mutableItems;
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      if (v29)
      {
        v30 = v29;
        v31 = v4;
        v32 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v65 != v32)
              objc_enumerationMutation(v28);
            v34 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            v8[2](v8, v34, 1, v13);
            v8[2](v8, v34, 0, v15);
          }
          v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        }
        while (v30);
      }
      else
      {
        v31 = v4;
      }
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v40 = v52;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
          objc_msgSend(v45, "secondItem");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v47 = (objc_opt_isKindOfClass() & 1) == 0
             || -[_UILayoutArrangement _itemWantsLayoutAsIfVisible:](self, "_itemWantsLayoutAsIfVisible:", v46);
          objc_msgSend(v45, "setActive:", v47);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
      }
      while (v42);
    }

    -[UILayoutGuide _setSystemConstraints:](self->_spanningLayoutGuide, "_setSystemConstraints:", v40);
  }
}

- (void)_updateCanvasConnectionConstraintsIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, void *, int64_t, void *);
  int64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  NSMutableArray *v18;
  NSMutableArray *canvasConnectionConstraints;
  _UILayoutSpacer *v20;
  _UILayoutSpacer *v21;
  BOOL v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  _UILayoutSpacer *v28;
  unint64_t v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  NSMutableArray *v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  BOOL v47;
  int64_t v48;
  unint64_t v49;
  _BOOL4 v50;
  _QWORD aBlock[5];
  id v52;

  if (!-[_UILayoutArrangement _canvasConnectionConstraintsNeedUpdatePass](self, "_canvasConnectionConstraintsNeedUpdatePass"))return;
  -[_UILayoutArrangement _propertySource](self, "_propertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutUsesCanvasMarginsWhenFilling");
  -[_UILayoutArrangement canvas](self, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "layoutMarginsGuide");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69___UILayoutArrangement__updateCanvasConnectionConstraintsIfNecessary__block_invoke;
  aBlock[3] = &unk_1E16E9728;
  aBlock[4] = self;
  v8 = v6;
  v52 = v8;
  v9 = (void (**)(void *, void *, int64_t, void *))_Block_copy(aBlock);
  v50 = -[_UILayoutArrangement _usesCenteringConnectionConstraint](self, "_usesCenteringConnectionConstraint");
  v10 = -[_UILayoutArrangement _minAttributeForCanvasConnections](self, "_minAttributeForCanvasConnections");
  v45 = v8;
  if ((unint64_t)(v10 - 3) > 9)
    v48 = 0;
  else
    v48 = qword_186685008[v10 - 3];
  v11 = objc_msgSend(v3, "layoutFillsCanvas");
  v12 = v11;
  if (v50)
    v13 = 3;
  else
    v13 = 2;
  if (v11)
    v14 = v13;
  else
    v14 = 0;
  v15 = -[NSMutableArray count](self->_canvasConnectionConstraints, "count");
  v16 = v15;
  if (v15 && v15 < v14)
  {
    -[_UILayoutArrangement _clearCanvasConnectionConstraints](self, "_clearCanvasConnectionConstraints");
    v16 = 0;
  }
  if (self->_canvasConnectionConstraints)
    v17 = 0;
  else
    v17 = v12;
  if (v17 == 1)
  {
    v18 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    canvasConnectionConstraints = self->_canvasConnectionConstraints;
    self->_canvasConnectionConstraints = v18;

  }
  v44 = v14;
  -[_UILayoutArrangement _viewOrGuideForLocationAttribute:](self, "_viewOrGuideForLocationAttribute:", v10);
  v20 = (_UILayoutSpacer *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    v47 = v20 == self->_spanningLayoutGuide;
  else
    v47 = 0;
  v22 = -[_UILayoutArrangement _configurationRequiresCanvasConnectionFittingConstraint](self, "_configurationRequiresCanvasConnectionFittingConstraint");
  v49 = v16;
  v46 = v3;
  if (v12)
  {
    v23 = 0;
    while (1)
    {
      if (v23 >= v16)
      {
        v24 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndex:](self->_canvasConnectionConstraints, "objectAtIndex:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9[2](v9, v24, v10, v21);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v24)
      {
        if ((void *)v25 != v24)
          -[NSMutableArray replaceObjectAtIndex:withObject:](self->_canvasConnectionConstraints, "replaceObjectAtIndex:withObject:", v23, v25);
        if (!v22)
        {
LABEL_35:
          v22 = objc_msgSend(v26, "relation") != 0;
          goto LABEL_36;
        }
      }
      else
      {
        -[NSMutableArray addObject:](self->_canvasConnectionConstraints, "addObject:", v25);
        if (!v22)
          goto LABEL_35;
      }
      v22 = 1;
LABEL_36:
      if (v23)
        v27 = v50;
      else
        v27 = 0;
      if (v23)
        v10 = 0;
      else
        v10 = v48;
      if (v27)
        v10 = -[_UILayoutArrangement _centerAttributeForCanvasConnections](self, "_centerAttributeForCanvasConnections");
      if (v10)
      {
        -[_UILayoutArrangement _viewOrGuideForLocationAttribute:](self, "_viewOrGuideForLocationAttribute:", v10);
        v28 = (_UILayoutSpacer *)objc_claimAutoreleasedReturnValue();

        if (!v47 && v28 != 0)
          v47 = v28 == self->_spanningLayoutGuide;
      }
      else
      {

        v28 = 0;
      }

      ++v23;
      v21 = v28;
      v16 = v49;
      if (v13 == v23)
        goto LABEL_51;
    }
  }
  v28 = v21;
LABEL_51:
  v29 = v44;
  if (v22)
  {
    v29 = v44 + 1;
    if (v16 == v44 + 1)
    {
      -[NSMutableArray lastObject](self->_canvasConnectionConstraints, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[_UILayoutArrangement _dimensionAttributeForCurrentAxis](self, "_dimensionAttributeForCurrentAxis");
      if (v30)
      {
        objc_msgSend(v30, "firstItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UILayoutArrangement canvas](self, "canvas");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32 == v33)
        {
          v35 = objc_msgSend(v30, "firstAttribute");

          if (v35 == v31)
          {
LABEL_64:

            goto LABEL_65;
          }
        }
        else
        {

        }
        v34 = 0;
LABEL_60:
        objc_msgSend(v30, "setActive:", 0);
        v36 = (void *)MEMORY[0x1E0D156E0];
        -[_UILayoutArrangement canvas](self, "canvas");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintWithItem:attribute:relatedBy:constant:", v37, v31, 0, 0.0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v39) = 1111752704;
        objc_msgSend(v38, "setPriority:", v39);
        objc_msgSend(v38, "setIdentifier:", CFSTR("UISV-canvas-fit"));
        objc_msgSend(v38, "setActive:", 1);
        v40 = self->_canvasConnectionConstraints;
        if (v34)
          -[NSMutableArray addObject:](v40, "addObject:", v38);
        else
          -[NSMutableArray replaceObjectAtIndex:withObject:](v40, "replaceObjectAtIndex:withObject:", v49 - 1, v38);

        goto LABEL_64;
      }
    }
    else
    {
      v31 = -[_UILayoutArrangement _dimensionAttributeForCurrentAxis](self, "_dimensionAttributeForCurrentAxis");
      v30 = 0;
    }
    v34 = 1;
    goto LABEL_60;
  }
LABEL_65:
  v41 = -[NSMutableArray count](self->_canvasConnectionConstraints, "count");
  if (v41 > v29)
  {
    v42 = v41;
    do
    {
      -[NSMutableArray lastObject](self->_canvasConnectionConstraints, "lastObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setActive:", 0);
      -[NSMutableArray removeObjectAtIndex:](self->_canvasConnectionConstraints, "removeObjectAtIndex:", --v42);

    }
    while (v42 > v29);
  }
  if (!v47)
    -[_UILayoutArrangement _removeSpanningLayoutGuide](self, "_removeSpanningLayoutGuide");

}

- (id)_viewOrGuideForLocationAttribute:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[_UILayoutArrangement _indexOfItemForLocationAttribute:](self, "_indexOfItemForLocationAttribute:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || ((-[NSMutableArray objectAtIndexedSubscript:](self->_mutableItems, "objectAtIndexedSubscript:", v5),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (objc_msgSend(v6, "_viewOrGuideForLocationAttribute:", a3), v7 = (id)objc_claimAutoreleasedReturnValue())
      : (v7 = v6),
        v8 = v7,
        v6,
        !v8))
  {
    -[_UILayoutArrangement _spanningLayoutGuideCreateIfNecessary](self, "_spanningLayoutGuideCreateIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (BOOL)_canvasConnectionConstraintsNeedUpdatePass
{
  void *v3;
  int v4;
  int v5;
  int64_t v6;
  BOOL v7;
  void *v9;
  void *v10;

  -[_UILayoutArrangement _propertySource](self, "_propertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UILAConfigurationHistory hasEstablishedBaseValues](self->_configurationHistory, "hasEstablishedBaseValues")
    && objc_msgSend(v3, "layoutFillsCanvas")
    && -[NSMutableArray count](self->_mutableItems, "count"))
  {
    goto LABEL_10;
  }
  if (!-[_UILAConfigurationHistory hasEstablishedBaseValues](self->_configurationHistory, "hasEstablishedBaseValues"))
  {
    v7 = 0;
    goto LABEL_12;
  }
  v4 = -[_UILAConfigurationHistory layoutFillsCanvas](self->_configurationHistory, "layoutFillsCanvas");
  if (v4 == objc_msgSend(v3, "layoutFillsCanvas")
    && (v5 = -[_UILAConfigurationHistory layoutUsesCanvasMarginsWhenFilling](self->_configurationHistory, "layoutUsesCanvasMarginsWhenFilling"), v5 == objc_msgSend(v3, "layoutUsesCanvasMarginsWhenFilling"))&& (v6 = -[_UILAConfigurationHistory axis](self->_configurationHistory, "axis"), v6 == objc_msgSend(v3, "axis"))&& !-[NSMutableSet count](self->_incomingItems, "count")&& !-[NSMutableSet count](self->_outgoingItems, "count"))
  {
    objc_msgSend(v3, "_newlyUnhiddenItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "_newlyHiddenItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "count") != 0;

    }
  }
  else
  {
LABEL_10:
    v7 = 1;
  }
LABEL_12:

  return v7;
}

- (BOOL)_hasStaleConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  -[_UILayoutArrangement _configurationHistory](self, "_configurationHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILayoutArrangement _propertySource](self, "_propertySource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSMutableSet count](self->_incomingItems, "count")
    && !-[NSMutableSet count](self->_outgoingItems, "count")
    && objc_msgSend(v3, "hasEstablishedBaseValues")
    && (v5 = objc_msgSend(v3, "axis"), v5 == objc_msgSend(v4, "axis"))
    && (v6 = objc_msgSend(v3, "layoutFillsCanvas"), v6 == objc_msgSend(v4, "layoutFillsCanvas"))
    && (!objc_msgSend(v4, "layoutFillsCanvas")
     || (v9 = objc_msgSend(v3, "layoutUsesCanvasMarginsWhenFilling"),
         v9 == objc_msgSend(v4, "layoutUsesCanvasMarginsWhenFilling"))))
  {
    objc_msgSend(v4, "_newlyHiddenItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v4, "_newlyUnhiddenItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "invalidBaselineConstraints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v12, "count") != 0;

      }
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (_UILayoutSpacer)_spanningLayoutGuide
{
  return self->_spanningLayoutGuide;
}

- (int64_t)_minAttributeForCanvasConnections
{
  if (-[_UILayoutArrangement _axisForSpanningLayoutGuide](self, "_axisForSpanningLayoutGuide"))
    return 3;
  else
    return 5;
}

- (int64_t)_dimensionAttributeForCurrentAxis
{
  if (-[_UILayoutArrangement _axisForSpanningLayoutGuide](self, "_axisForSpanningLayoutGuide"))
    return 8;
  else
    return 7;
}

- (void)_clearAllConstraintsArrays
{
  -[_UILayoutArrangement _removeSpanningLayoutGuide](self, "_removeSpanningLayoutGuide");
  -[_UILayoutArrangement _clearCanvasConnectionConstraints](self, "_clearCanvasConnectionConstraints");
}

- (void)_removeSpanningLayoutGuide
{
  _UILayoutSpacer *spanningLayoutGuide;
  id WeakRetained;
  _UILayoutSpacer *v5;

  spanningLayoutGuide = self->_spanningLayoutGuide;
  if (spanningLayoutGuide)
  {
    -[UILayoutGuide _setLockedToOwningView:](spanningLayoutGuide, "_setLockedToOwningView:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
    objc_msgSend(WeakRetained, "removeLayoutGuide:", self->_spanningLayoutGuide);

    v5 = self->_spanningLayoutGuide;
    self->_spanningLayoutGuide = 0;

  }
}

- (id)_spanningLayoutGuideCreateIfNecessary
{
  _UILayoutSpacer *spanningLayoutGuide;

  spanningLayoutGuide = self->_spanningLayoutGuide;
  if (!spanningLayoutGuide)
  {
    -[_UILayoutArrangement _createSpanningLayoutGuide](self, "_createSpanningLayoutGuide");
    -[_UILayoutArrangement _updateSpanningLayoutGuideConstraintsIfNecessary](self, "_updateSpanningLayoutGuideConstraintsIfNecessary");
    spanningLayoutGuide = self->_spanningLayoutGuide;
  }
  return spanningLayoutGuide;
}

- (int64_t)_axisForSpanningLayoutGuide
{
  void *v2;
  int64_t v3;

  -[_UILayoutArrangement _propertySource](self, "_propertySource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axis");

  return v3;
}

- (UIView)canvas
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_canvas);
}

- (BOOL)_usesCenteringConnectionConstraint
{
  return 0;
}

- (BOOL)_configurationRequiresCanvasConnectionFittingConstraint
{
  return 0;
}

- (int64_t)_centerAttributeForCanvasConnections
{
  if (-[_UILayoutArrangement _axisForSpanningLayoutGuide](self, "_axisForSpanningLayoutGuide"))
    return 10;
  else
    return 9;
}

- (BOOL)_usesInequalitySpanningConstraintForAttribute:(int64_t)a3
{
  return 0;
}

- (void)_setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id WeakRetained;
  _QWORD v8[4];
  BOOL v9;

  if (self->_layoutUsesCanvasMarginsWhenFilling != a3)
  {
    v4 = a4;
    v6 = MEMORY[0x1E0C809B0];
    self->_layoutUsesCanvasMarginsWhenFilling = a3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __70___UILayoutArrangement__setLayoutUsesCanvasMarginsWhenFilling_notify___block_invoke;
    v8[3] = &__block_descriptor_33_e35_v16__0___UILAConfigurationHistory_8l;
    v9 = a3;
    -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", v8);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(WeakRetained);

    }
  }
}

- (void)_clearCanvasConnectionConstraints
{
  NSMutableArray *canvasConnectionConstraints;

  if (self->_canvasConnectionConstraints)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    canvasConnectionConstraints = self->_canvasConnectionConstraints;
    self->_canvasConnectionConstraints = 0;

  }
}

- (void)_setAxis:(int64_t)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];

  if (self->_axis != a3)
  {
    v4 = a4;
    v6 = MEMORY[0x1E0C809B0];
    self->_axis = a3;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __40___UILayoutArrangement__setAxis_notify___block_invoke;
    v9[3] = &__block_descriptor_40_e35_v16__0___UILAConfigurationHistory_8l;
    v9[4] = a3;
    -[_UILayoutArrangement _trackChangesWithConfigBlock:](self, "_trackChangesWithConfigBlock:", v9);
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
      _UILANotifyCanvasesOfSizeInvalidationForItemIfNecessary(WeakRetained);

    }
    v8 = objc_loadWeakRetained((id *)&self->_canvas);
    objc_msgSend(v8, "_vendedBaselineViewParametersDidChange");

  }
}

- (float)_spanningLayoutGuideFittingPriority
{
  _BOOL4 v2;
  float result;

  v2 = -[_UILayoutArrangement _allItemsHidden](self, "_allItemsHidden");
  result = 51.0;
  if (v2)
    return 0.001;
  return result;
}

- (BOOL)_allItemsHidden
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  -[_UILayoutArrangement items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[_UILayoutArrangement items](self, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    -[_UILayoutArrangement _hiddenItems](self, "_hiddenItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_spanningGuideConstraintsNeedUpdate
{
  void *v3;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[_UILayoutArrangement _propertySource](self, "_propertySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet count](self->_incomingItems, "count") || -[NSMutableSet count](self->_outgoingItems, "count"))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "_newlyUnhiddenItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "_newlyHiddenItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        v4 = 1;
      }
      else
      {
        -[UILayoutGuide _systemConstraints](self->_spanningLayoutGuide, "_systemConstraints");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v9 = -[_UILAConfigurationHistory axis](self->_configurationHistory, "axis");
          v4 = v9 != objc_msgSend(v3, "axis");
        }
        else
        {
          v4 = 1;
        }

      }
    }

  }
  return v4;
}

- (void)_visibilityParameterChangedForItem:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v9 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_mutableItems, "indexOfObject:", v9);
  v5 = v9;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_msgSend(v9, "_la_isVisible");
    v7 = -[NSMutableSet containsObject:](self->_hiddenItems, "containsObject:", v9);
    v8 = v7;
    if (v6 && v7)
    {
      -[NSMutableSet removeObject:](self->_hiddenItems, "removeObject:", v9);
      -[_UILayoutArrangement _respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:](self, "_respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:", 0, 0, 0, v9);
    }
    v5 = v9;
    if (((v6 | v8) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_hiddenItems, "addObject:", v9);
      -[_UILayoutArrangement _respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:](self, "_respondToChangesWithIncomingItem:outgoingItem:newlyHiddenItem:newlyUnhiddenItem:", 0, 0, v9, 0);
      v5 = v9;
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_canvas);
  objc_storeStrong((id *)&self->_configurationHistory, 0);
  objc_storeStrong((id *)&self->_spanningLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mutableItems, 0);
  objc_storeStrong((id *)&self->_unanimatedConfigurationTarget, 0);
  objc_storeStrong((id *)&self->_canvasConnectionConstraints, 0);
  objc_storeStrong((id *)&self->_invalidBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_newlyUnhiddenItems, 0);
  objc_storeStrong((id *)&self->_newlyHiddenItems, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_outgoingItems, 0);
  objc_storeStrong((id *)&self->_incomingItems, 0);
}

- (void)_hasBaselineChangedNotificationRequirementDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[_UILayoutArrangement _requiresNotificationForHasBaselinePropertyChanges](self, "_requiresNotificationForHasBaselinePropertyChanges"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_UILayoutArrangement items](self, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v8, "_viewForLoweringBaselineLayoutAttribute:", 11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "_isHasBaselinePropertyChangeable"))
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__hasBaselineChangedNotification_, CFSTR("_UIViewHasBaselinePropertyChanged"), v9);

          }
          objc_msgSend(v8, "_viewForLoweringBaselineLayoutAttribute:", 12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11 != v9)
          {
            if (objc_msgSend(v11, "_isHasBaselinePropertyChangeable"))
            {
              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__hasBaselineChangedNotification_, CFSTR("_UIViewHasBaselinePropertyChanged"), v12);

            }
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObserver:name:object:", self, CFSTR("_UIViewHasBaselinePropertyChanged"), 0);

  }
}

+ (Class)_configurationHistoryClass
{
  return 0;
}

- (id)_identifierForSpanningLayoutGuide
{
  return CFSTR("UISV-arrangement");
}

- (void)_registerAnimationRequest
{
  UIView **p_canvas;
  id WeakRetained;
  id v5;

  p_canvas = &self->_canvas;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_canvas);
    +[UIViewAnimationState _addViewForConstraintBasedAnimation:](UIViewAnimationState, "_addViewForConstraintBasedAnimation:", v5);

    self->_awaitingAnimationLayoutPass = 1;
  }
}

- (void)setAxis:(int64_t)a3
{
  -[_UILayoutArrangement _setAxis:notify:](self, "_setAxis:notify:", a3, 1);
}

- (void)setLayoutFillsCanvas:(BOOL)a3
{
  -[_UILayoutArrangement _setLayoutFillsCanvas:notify:](self, "_setLayoutFillsCanvas:notify:", a3, 1);
}

- (void)setLayoutUsesCanvasMarginsWhenFilling:(BOOL)a3
{
  -[_UILayoutArrangement _setLayoutUsesCanvasMarginsWhenFilling:notify:](self, "_setLayoutUsesCanvasMarginsWhenFilling:notify:", a3, 1);
}

- (_UILayoutArrangement)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UILayoutArrangement init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (void)_invalidateBaselineConstraint:(id)a3
{
  id v4;
  NSMutableSet *invalidBaselineConstraints;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  invalidBaselineConstraints = self->_invalidBaselineConstraints;
  v8 = v4;
  if (!invalidBaselineConstraints)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_invalidBaselineConstraints;
    self->_invalidBaselineConstraints = v6;

    v4 = v8;
    invalidBaselineConstraints = self->_invalidBaselineConstraints;
  }
  -[NSMutableSet addObject:](invalidBaselineConstraints, "addObject:", v4);

}

- (void)_hasBaselineChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _UILayoutArrangement *v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[_UILayoutArrangement _requiresNotificationForHasBaselinePropertyChanges](self, "_requiresNotificationForHasBaselinePropertyChanges"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        goto LABEL_21;
      -[_UILayoutArrangement canvas](self, "canvas");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILayoutArrangement canvas](self, "canvas");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      v32 = 2112;
      v33 = v19;
      _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Layout arrangement received undesired -_hasBaselineChangedNotification for stackView. This is a UIStackView bug.\n UIStackView = %@,\n cosntraints = %@", buf, 0x16u);
    }
    else
    {
      v14 = _hasBaselineChangedNotification____s_category;
      if (!_hasBaselineChangedNotification____s_category)
      {
        v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&_hasBaselineChangedNotification____s_category);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      v16 = v15;
      -[_UILayoutArrangement canvas](self, "canvas");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILayoutArrangement canvas](self, "canvas");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Layout arrangement received undesired -_hasBaselineChangedNotification for stackView. This is a UIStackView bug.\n UIStackView = %@,\n cosntraints = %@", buf, 0x16u);
    }

LABEL_21:
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("_UIViewHasBaselinePropertyChanged"), 0);
    goto LABEL_14;
  }
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke;
  v26 = &unk_1E16E96B8;
  v6 = v5;
  v27 = v6;
  v28 = self;
  -[_UILayoutArrangement _baselineDependentConstraints](self, "_baselineDependentConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v11 |= v25((uint64_t)v24, *(void **)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v10);

      if ((v11 & 1) == 0)
        goto LABEL_13;
      -[_UILayoutArrangement canvas](self, "canvas", (_QWORD)v20);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNeedsUpdateConstraints");
    }

  }
LABEL_13:

LABEL_14:
}

- (id)_baselineDependentConstraints
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UILayoutArrangement;
  -[_UILayoutArrangement description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return (NSString *)v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvas);
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" stackView=%p"), WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableSet count](self->_incomingItems, "count"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" incomingItems=%p"), self->_incomingItems);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (-[NSMutableSet count](self->_outgoingItems, "count"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" outgoingItems=%p"), self->_outgoingItems);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (-[NSMutableSet count](self->_hiddenItems, "count"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" hiddenItems=%p"), self->_hiddenItems);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  if (-[NSMutableSet count](self->_newlyHiddenItems, "count"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" newlyHiddenItems=%p"), self->_newlyHiddenItems);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  if (-[NSMutableSet count](self->_newlyUnhiddenItems, "count"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" newlyUnhiddenItems=%p"), self->_newlyUnhiddenItems);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  if (-[NSMutableSet count](self->_invalidBaselineConstraints, "count"))
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" invalidBaselineConstraints=%p"), self->_invalidBaselineConstraints);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  if (!-[NSMutableArray count](self->_canvasConnectionConstraints, "count"))
    return (NSString *)v6;
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" canvasConnectionConstraints=%p"), self->_canvasConnectionConstraints);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)_awaitingAnimationLayoutPass
{
  return self->_awaitingAnimationLayoutPass;
}

- (void)_setMutableItems:(id)a3
{
  objc_storeStrong((id *)&self->_mutableItems, a3);
}

- (NSSet)invalidBaselineConstraints
{
  return &self->_invalidBaselineConstraints->super;
}

- (BOOL)layoutFillsCanvas
{
  return self->_layoutFillsCanvas;
}

- (BOOL)layoutUsesCanvasMarginsWhenFilling
{
  return self->_layoutUsesCanvasMarginsWhenFilling;
}

@end
