@implementation _UIStatusBarDisplayItemState

+ (id)stateForDisplayItemWithIdentifier:(id)a3 statusBar:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v6;
  v10 = v6;

  objc_storeWeak((id *)v8 + 4, v7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v8 + 6);
  *((_QWORD *)v8 + 6) = v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v8 + 17);
  *((_QWORD *)v8 + 17) = v13;

  +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)v8 + 5, v16);
  WeakRetained = objc_loadWeakRetained((id *)v8 + 5);
  objc_msgSend(WeakRetained, "displayItemForIdentifier:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)v8 + 2, v18);
  return v8;
}

- (BOOL)isEnabled
{
  void *v5;

  if (self->_dataUpdateStatus != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemState.m"), 199, CFSTR("%@ should have been updated before checking if it's enabled (instead of %ld)"), self, self->_dataUpdateStatus);

  }
  return -[_UIStatusBarDisplayItemState hasRunningAnimations](self, "hasRunningAnimations")
      || self->_floating
      || -[_UIStatusBarDisplayItemState isEnabledIgnoringAnimations](self, "isEnabledIgnoringAnimations");
}

- (BOOL)isEnabledIgnoringAnimations
{
  void *v3;
  void *v4;
  char v5;

  if (!self->_dataEnabled)
    return 0;
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  return v5;
}

- (BOOL)hasRunningAnimations
{
  return self->_addingAnimation || self->_removingAnimation || -[NSMutableSet count](self->_animations, "count") != 0;
}

- (_UIStatusBarDisplayItemPlacementState)currentPlacementState
{
  unint64_t currentPlacementStateIndex;
  void *v4;

  currentPlacementStateIndex = self->_currentPlacementStateIndex;
  if (currentPlacementStateIndex >= -[NSMutableArray count](self->_placementStates, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_placementStates, "objectAtIndexedSubscript:", self->_currentPlacementStateIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (_UIStatusBarDisplayItemPlacementState *)v4;
}

- (void)updateToNextEnabledPlacement
{
  ++self->_currentPlacementStateIndex;
  while (-[_UIStatusBarDisplayItemState _updateToNextPlacementStateIfNeeded](self, "_updateToNextPlacementStateIfNeeded"));
}

- (BOOL)_updateToNextPlacementStateIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEnabled");

    if ((v6 & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      ++self->_currentPlacementStateIndex;
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)addPlacement:(id)a3 inRegion:(id)a4
{
  void *v6;
  NSMutableArray *placementStates;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  +[_UIStatusBarDisplayItemPlacementState stateForDisplayItemPlacement:region:](_UIStatusBarDisplayItemPlacementState, "stateForDisplayItemPlacement:region:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  placementStates = self->_placementStates;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54___UIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke;
  v15[3] = &unk_1E16E2798;
  v14 = v6;
  v16 = v14;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](placementStates, "indexOfObjectPassingTest:", v15);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_placementStates, "addObject:", v14);
  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v14, "priority");
    -[NSMutableArray objectAtIndexedSubscript:](self->_placementStates, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "priority");

    if (v10 == v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemState.m"), 257, CFSTR("2 placements have the same priority for display item identifier %@"), self->_identifier);

    }
    -[NSMutableArray insertObject:atIndex:](self->_placementStates, "insertObject:atIndex:", v14, v9);
  }

}

- (id)placementStateForPlacement:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_placementStates;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "placement", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (void)setupRelationsBetweenDisplayItemStates:(id)a3 visualProvider:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86___UIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke;
  v11[3] = &unk_1E16E27C0;
  v14 = a2;
  v15 = a1;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (void)prepareForOverflowDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_visibilityStatus = 3;
}

- (void)prepareForDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_currentPlacementStateIndex = 0;
  self->_enabilityStatus = 0;
  self->_visibilityStatus = 0;
}

- (void)_updateStatuses
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  int v11;
  BOOL v12;
  uint64_t v13;

  v3 = -[_UIStatusBarDisplayItemState isEnabledIgnoringAnimations](self, "isEnabledIgnoringAnimations");
  v4 = v3;
  if (self->_wasEnabled || !v3)
  {
    v6 = !self->_wasEnabled || v3;
    v7 = self->_wasEnabled && v3;
    if (v6 == 1)
      v5 = v7;
    else
      v5 = 3;
  }
  else
  {
    v5 = 2;
  }
  -[_UIStatusBarDisplayItemState setEnabilityStatus:](self, "setEnabilityStatus:", v5);
  if (!self->_wasVisible && v4)
  {
    v9 = 1;
  }
  else
  {
    v10 = !v4;
    v11 = !self->_wasVisible || v4;
    if (!self->_wasVisible)
      v10 = 1;
    v12 = v10 == 0;
    v13 = 2;
    if (!v12)
      v13 = 0;
    if (v11 == 1)
      v9 = v13;
    else
      v9 = 3;
  }
  -[_UIStatusBarDisplayItemState setVisibilityStatus:](self, "setVisibilityStatus:", v9);
}

- (BOOL)_resolveDependentItemStatesWithBlock:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v11, "itemStates", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j)))
              {

                v17 = 0;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 1;
    }
    while (v8);
  }
  else
  {
    v17 = 1;
  }
LABEL_19:

  return v17;
}

- (BOOL)_updatePlacementWithRecursionBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
  -[_UIStatusBarDisplayItemState setFloating:](self, "setFloating:", objc_msgSend(WeakRetained, "floating"));

  if (-[_UIStatusBarDisplayItemState floating](self, "floating"))
  {
    self->_currentPlacementStateIndex = -1;
LABEL_5:
    -[_UIStatusBarDisplayItemState _updateStatuses](self, "_updateStatuses");
    v7 = 1;
    goto LABEL_6;
  }
  -[_UIStatusBarDisplayItemState removingAnimation](self, "removingAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self->_currentPlacementStateIndex = self->_previousPlacementStateIndex;
    -[_UIStatusBarDisplayItemState _resolveDependentItemStatesWithBlock:](self, "_resolveDependentItemStatesWithBlock:", v4);
    goto LABEL_5;
  }
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_5;
  while (1)
  {
    -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canBeEnabled");

    if (v11)
    {
      if (!-[_UIStatusBarDisplayItemState _resolveDependentItemStatesWithBlock:](self, "_resolveDependentItemStatesWithBlock:", v4))break;
    }
    if (!-[_UIStatusBarDisplayItemState _updateToNextPlacementStateIfNeeded](self, "_updateToNextPlacementStateIfNeeded"))goto LABEL_5;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)resetToPreferredPlacement
{
  self->_currentPlacementStateIndex = self->_preferredPlacementStateIndex;
  self->_placementUpdateStatus = 0;
}

- (BOOL)updatePlacement
{
  int64_t placementUpdateStatus;
  void *v6;

  if (self->_dataUpdateStatus != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemState.m"), 425, CFSTR("The item state should have been data updated before updating its placement"));

  }
  placementUpdateStatus = self->_placementUpdateStatus;
  if (placementUpdateStatus == 2)
    return 1;
  if (placementUpdateStatus == 1)
    return 0;
  self->_placementUpdateStatus = 1;
  return -[_UIStatusBarDisplayItemState _updatePlacementWithRecursionBlock:](self, "_updatePlacementWithRecursionBlock:", &__block_literal_global_494);
}

- (id)updateWithData:(id)a3 styleAttributes:(id)a4
{
  id v7;
  id v8;
  int64_t dataUpdateStatus;
  id v10;
  void *v11;
  id WeakRetained;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  int64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v40;
  id *location;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;

  v7 = a3;
  v8 = a4;
  dataUpdateStatus = self->_dataUpdateStatus;
  if ((dataUpdateStatus & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItemState.m"), 446, CFSTR("The update status must be needsUpdate or updated"));

    dataUpdateStatus = self->_dataUpdateStatus;
  }
  if (dataUpdateStatus != 2)
  {
    self->_dataUpdateStatus = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
    v13 = objc_msgSend(WeakRetained, "clearPreviousTokenDisablementIfNecessary");

    if (v13)
    {
      -[_UIStatusBarDisplayItemState setWasEnabled:](self, "setWasEnabled:", 0);
    }
    else
    {
      v14 = objc_loadWeakRetained((id *)&self->_displayItem);
      -[_UIStatusBarDisplayItemState setWasEnabled:](self, "setWasEnabled:", objc_msgSend(v14, "isEnabled"));

    }
    v15 = objc_loadWeakRetained((id *)&self->_displayItem);
    -[_UIStatusBarDisplayItemState setWasVisible:](self, "setWasVisible:", objc_msgSend(v15, "visible"));

    -[_UIStatusBarDisplayItemState setPreviousPlacementStateIndex:](self, "setPreviousPlacementStateIndex:", -[_UIStatusBarDisplayItemState currentPlacementStateIndex](self, "currentPlacementStateIndex"));
    v16 = objc_loadWeakRetained((id *)&self->_displayItem);
    -[_UIStatusBarDisplayItemState setFloating:](self, "setFloating:", objc_msgSend(v16, "floating"));

    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __63___UIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke;
    v43[3] = &unk_1E16E2808;
    v17 = v7;
    v44 = v17;
    v18 = v8;
    v45 = v18;
    v19 = v11;
    v46 = v19;
    if (!-[_UIStatusBarDisplayItemState _updatePlacementWithRecursionBlock:](self, "_updatePlacementWithRecursionBlock:", v43))
    {
      self->_dataUpdateStatus = 0;
      v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_24:

      goto LABEL_25;
    }
    v42 = v8;
    location = (id *)&self->_item;
    v20 = objc_loadWeakRetained((id *)&self->_item);
    v21 = objc_loadWeakRetained((id *)&self->_displayItem);
    v22 = objc_loadWeakRetained((id *)&self->_statusBar);
    objc_msgSend(v22, "currentAggregatedData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", objc_msgSend(v20, "canEnableDisplayItem:fromData:", v21, v23));

    -[_UIStatusBarDisplayItemState _updateStatuses](self, "_updateStatuses");
    v24 = -[_UIStatusBarDisplayItemState enabilityStatus](self, "enabilityStatus");
    switch(v24)
    {
      case 1:
        v25 = objc_loadWeakRetained(location);
        -[_UIStatusBarDisplayItemState _updateForItem:data:styleAttributes:](self, "_updateForItem:data:styleAttributes:", v25, v17, v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        -[_UIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](self, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", 0, 0, MEMORY[0x1E0C9AAA0], location);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
        if (v29)
        {
          -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "placement");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "itemInfo");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setPlacementInfo:", v32);

          v33 = objc_loadWeakRetained(location);
          v34 = objc_loadWeakRetained((id *)&self->_displayItem);
          objc_msgSend(v33, "_applyUpdate:toDisplayItem:", v29, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_loadWeakRetained((id *)&self->_displayItem);
          -[_UIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", objc_msgSend(v36, "isEnabled"));

        }
        else
        {
          v35 = 0;
        }
        goto LABEL_21;
      case 2:
        v25 = objc_loadWeakRetained((id *)&self->_statusBar);
        objc_msgSend(v25, "currentAggregatedData", location);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_loadWeakRetained((id *)&self->_statusBar);
        objc_msgSend(v27, "styleAttributes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](self, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", v26, v28, MEMORY[0x1E0C9AAB0]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v29 = 0;
        v35 = 0;
LABEL_21:
        v8 = v42;
        -[_UIStatusBarDisplayItemState _updateStatuses](self, "_updateStatuses", location);
        -[_UIStatusBarDisplayItemState _cancelObsoleteAnimations](self, "_cancelObsoleteAnimations");
        -[_UIStatusBarDisplayItemState _animationWithUpdateAnimation:](self, "_animationWithUpdateAnimation:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          -[_UIStatusBarDisplayItemState identifier](self, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setDisplayItemIdentifier:", v38);

          objc_msgSend(v19, "addObject:", v37);
        }
        *(_OWORD *)&self->_dataUpdateStatus = xmmword_18666E9B0;
        self->_preferredPlacementStateIndex = self->_currentPlacementStateIndex;
        v10 = v19;

        goto LABEL_24;
    }

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v10;
}

- (id)_updateForItem:(id)a3 data:(id)a4 styleAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _UIStatusBarDisplayItemState *v18;
  id v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "needsUpdate");
  if (v9)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v8, "dependentEntryKeys", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v9, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }

      v18 = self;
      v19 = v9;
      if (!v10)
        goto LABEL_17;
      goto LABEL_14;
    }
LABEL_10:

  }
  if (v10)
  {
    v18 = self;
    v19 = 0;
LABEL_14:
    v20 = v10;
    goto LABEL_18;
  }
  if (!v11)
  {
    v21 = 0;
    goto LABEL_19;
  }
  v18 = self;
  v19 = 0;
LABEL_17:
  v20 = 0;
LABEL_18:
  -[_UIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](v18, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v21;
}

- (id)_updateForUpdatedData:(id)a3 updatedStyleAttributes:(id)a4 updatedEnability:(id)a5
{
  id v8;
  id v9;
  __objc2_class *WeakRetained;
  id v11;
  _UIStatusBarItemUpdate *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  WeakRetained = _UIStatusBarItemUpdate;
  v11 = a4;
  v12 = objc_alloc_init(_UIStatusBarItemUpdate);
  -[_UIStatusBarItemUpdate setDataChanged:](v12, "setDataChanged:", v8 != 0);
  if (v8)
  {
    -[_UIStatusBarItemUpdate setData:](v12, "setData:", v8);
  }
  else
  {
    WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    -[__objc2_class currentAggregatedData](WeakRetained, "currentAggregatedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarItemUpdate setData:](v12, "setData:", v13);

  }
  v19 = v11 != 0;
  v14 = v11;
  if (!v11)
  {
    WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    -[__objc2_class styleAttributes](WeakRetained, "styleAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_UIStatusBarItemUpdate data](v12, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDisplayItemState _effectiveStyleAttributesFromStyleAttributes:data:styleAttributesChanged:](self, "_effectiveStyleAttributesFromStyleAttributes:data:styleAttributesChanged:", v14, v15, &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarItemUpdate setStyleAttributes:](v12, "setStyleAttributes:", v16);
  if (!v11)
  {

  }
  -[_UIStatusBarItemUpdate setStyleAttributesChanged:](v12, "setStyleAttributesChanged:", v19);
  -[_UIStatusBarItemUpdate setEnabilityChanged:](v12, "setEnabilityChanged:", v9 != 0);
  if (v9)
    v17 = objc_msgSend(v9, "BOOLValue");
  else
    v17 = 1;
  -[_UIStatusBarItemUpdate setEnabled:](v12, "setEnabled:", v17);

  return v12;
}

- (id)_effectiveStyleAttributesFromStyleAttributes:(id)a3 data:(id)a4 styleAttributesChanged:(BOOL *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _UIStatusBarStyleAttributes **p_overriddenStyleAttributes;
  _UIStatusBarStyleAttributes *overriddenStyleAttributes;
  _UIStatusBarStyleAttributes *v30;
  _UIStatusBarStyleAttributes *v31;
  _UIStatusBarStyleAttributes *v32;
  BOOL v33;
  void *v34;
  _QWORD v36[2];
  void (*v37)(uint64_t, void *);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "region");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__181;
  v44 = __Block_byref_object_dispose__181;
  v45 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __105___UIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke;
  v38 = &unk_1E16E2830;
  v39 = &v40;
  v13 = objc_msgSend(v12, "effectiveStyle");
  if (v13 != 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
    objc_msgSend(WeakRetained, "styleAttributesForStyle:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37((uint64_t)v36, v15);

  }
  objc_msgSend(v12, "overriddenStyleAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37((uint64_t)v36, v16);

  v17 = objc_loadWeakRetained((id *)&self->_displayItem);
  objc_msgSend(v17, "overriddenStyleAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37((uint64_t)v36, v18);

  v19 = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v19, "overriddenStyleAttributesForData:identifier:", v9, self->_identifier);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37((uint64_t)v36, v20);

  v21 = objc_loadWeakRetained((id *)&self->_statusBar);
  objc_msgSend(v21, "visualProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    v24 = objc_loadWeakRetained((id *)&self->_statusBar);
    objc_msgSend(v24, "visualProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDisplayItemState identifier](self, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "overriddenStyleAttributesForDisplayItemWithIdentifier:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37((uint64_t)v36, v27);

  }
  overriddenStyleAttributes = self->_overriddenStyleAttributes;
  p_overriddenStyleAttributes = &self->_overriddenStyleAttributes;
  v30 = (_UIStatusBarStyleAttributes *)(id)v41[5];
  v31 = overriddenStyleAttributes;
  if (v30 == v31)
  {

  }
  else
  {
    v32 = v31;
    if (v30 && v31)
    {
      v33 = -[_UIStatusBarStyleAttributes isEqual:](v30, "isEqual:", v31);

      if (v33)
        goto LABEL_13;
    }
    else
    {

    }
    objc_storeStrong((id *)p_overriddenStyleAttributes, (id)v41[5]);
    *a5 = 1;
  }
LABEL_13:
  objc_msgSend(v10, "styleAttributesWithOverrides:", v41[5]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v40, 8);
  return v34;
}

- (int64_t)_animationType
{
  int64_t result;

  result = -[_UIStatusBarDisplayItemState visibilityStatus](self, "visibilityStatus");
  if (result)
  {
    if (result == 3)
    {
      return 2;
    }
    else if (result == 2)
    {
      if (-[_UIStatusBarDisplayItemState enabilityStatus](self, "enabilityStatus") == 2)
        return 1;
      else
        return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)_cancelObsoleteAnimations
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[_UIStatusBarDisplayItemState _animationType](self, "_animationType");
  if (v3 == 2)
  {
    -[_UIStatusBarDisplayItemState addingAnimation](self, "addingAnimation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UIStatusBarDisplayItemState addingAnimation](self, "addingAnimation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancel");

      -[_UIStatusBarDisplayItemState setAddingAnimation:](self, "setAddingAnimation:", 0);
    }
    -[_UIStatusBarDisplayItemState animations](self, "animations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[_UIStatusBarDisplayItemState animations](self, "animations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v10, "copy");

      objc_msgSend(v12, "makeObjectsPerformSelector:", sel_cancel);
      -[_UIStatusBarDisplayItemState animations](self, "animations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllObjects");

    }
  }
  else if (v3 == 1)
  {
    -[_UIStatusBarDisplayItemState removingAnimation](self, "removingAnimation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIStatusBarDisplayItemState removingAnimation](self, "removingAnimation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancel");

      -[_UIStatusBarDisplayItemState setRemovingAnimation:](self, "setRemovingAnimation:", 0);
    }
  }
}

- (id)_animationWithUpdateAnimation:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  id v7;
  int64_t v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  v6 = objc_msgSend(WeakRetained, "areAnimationsEnabled");

  if (!v6)
    goto LABEL_7;
  v7 = v4;
  if (v7)
    goto LABEL_8;
  v8 = -[_UIStatusBarDisplayItemState _animationType](self, "_animationType");
  if (v8 != 2)
  {
    if (v8 == 1)
    {
      v9 = objc_loadWeakRetained((id *)&self->_item);
      objc_msgSend(v9, "additionAnimationForDisplayItemWithIdentifier:", self->_identifier);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v10 = objc_loadWeakRetained((id *)&self->_statusBar);
      objc_msgSend(v10, "visualProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)&self->_statusBar);
        objc_msgSend(v13, "visualProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "additionAnimationForDisplayItemWithIdentifier:itemAnimation:", self->_identifier, v7);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v21 = (void *)v15;

        v7 = v21;
        goto LABEL_8;
      }
      goto LABEL_8;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v17 = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v17, "removalAnimationForDisplayItemWithIdentifier:", self->_identifier);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v18 = objc_loadWeakRetained((id *)&self->_statusBar);
  objc_msgSend(v18, "visualProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_statusBar);
    objc_msgSend(v13, "visualProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removalAnimationForDisplayItemWithIdentifier:itemAnimation:", self->_identifier, v7);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_8:

  return v7;
}

- (BOOL)prepareAnimation:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  _UIStatusBarDisplayItemState *v20;
  id v21;
  id location;
  _QWORD v23[5];
  int v24;
  _QWORD v25[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  v6 = objc_msgSend(WeakRetained, "animationContextId");

  switch(-[_UIStatusBarDisplayItemState _animationType](self, "_animationType"))
  {
    case 0:
      objc_msgSend(v4, "cancel");
      goto LABEL_3;
    case 1:
      v7 = 1;
      objc_msgSend(v4, "setType:", 1);
      v13 = objc_loadWeakRetained((id *)&self->_item);
      v14 = objc_loadWeakRetained((id *)&self->_displayItem);
      objc_msgSend(v13, "prepareAnimation:forDisplayItem:", v4, v14);

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke;
      v25[3] = &unk_1E16B42D0;
      v25[4] = self;
      objc_msgSend(v4, "addCompletionHandler:", v25);
      -[_UIStatusBarDisplayItemState setAddingAnimation:](self, "setAddingAnimation:", v4);
      break;
    case 2:
      objc_msgSend(v4, "setType:", 2);
      v8 = objc_loadWeakRetained((id *)&self->_item);
      v9 = objc_loadWeakRetained((id *)&self->_displayItem);
      objc_msgSend(v8, "prepareAnimation:forDisplayItem:", v4, v9);

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_2;
      v23[3] = &unk_1E16E2858;
      v23[4] = self;
      v24 = v6;
      objc_msgSend(v4, "addCompletionHandler:", v23);
      -[_UIStatusBarDisplayItemState setRemovingAnimation:](self, "setRemovingAnimation:", v4);
      goto LABEL_6;
    case 3:
      objc_msgSend(v4, "setType:", 3);
      v10 = objc_loadWeakRetained((id *)&self->_item);
      v11 = objc_loadWeakRetained((id *)&self->_displayItem);
      objc_msgSend(v10, "prepareAnimation:forDisplayItem:", v4, v11);

      objc_initWeak(&location, v4);
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_3;
      v19 = &unk_1E16C2EB0;
      v20 = self;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v4, "addCompletionHandler:", &v16);
      -[_UIStatusBarDisplayItemState animations](self, "animations", v16, v17, v18, v19, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v4);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
LABEL_6:
      v7 = 1;
      break;
    default:
LABEL_3:
      v7 = 0;
      break;
  }

  return v7;
}

- (BOOL)isCurrentPlacement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "priority");
  v8 = objc_msgSend(v4, "priority");

  v9 = v7 == v8 && -[_UIStatusBarDisplayItemState isEnabled](self, "isEnabled");
  return v9;
}

- (NSArray)potentialPlacementRegionIdentifiers
{
  void *v3;
  NSMutableArray *placementStates;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  placementStates = self->_placementStates;
  _UIStatusBarGetPriorityComparator();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray sortedArrayUsingComparator:](placementStates, "sortedArrayUsingComparator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "region", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEnabled");

        if (v14)
        {
          objc_msgSend(v12, "region");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (int64_t)priority
{
  void *v3;
  int64_t v4;

  if (!-[_UIStatusBarDisplayItemState isEnabled](self, "isEnabled"))
    return 0;
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "priority");

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("identifier");
  -[_UIStatusBarDisplayItemState identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_UIStatusBarDisplayItemState isEnabled](self, "isEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("enabilityStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStatusBarDisplayItemState enabilityStatus](self, "enabilityStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("visibilityStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStatusBarDisplayItemState visibilityStatus](self, "visibilityStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = CFSTR("currentPlacementState");
  -[_UIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("none");
  if (v7)
    v9 = (const __CFString *)v7;
  v16[4] = v9;
  v15[5] = CFSTR("dataEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_UIStatusBarDisplayItemState dataEnabled](self, "dataEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v10;
  v15[6] = CFSTR("floating");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_UIStatusBarDisplayItemState floating](self, "floating"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (_UIStatusBarDisplayItem)displayItem
{
  return (_UIStatusBarDisplayItem *)objc_loadWeakRetained((id *)&self->_displayItem);
}

- (void)setDisplayItem:(id)a3
{
  objc_storeWeak((id *)&self->_displayItem, a3);
}

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_UIStatusBar)statusBar
{
  return (_UIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

- (_UIStatusBarItem)item
{
  return (_UIStatusBarItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (NSMutableArray)placementStates
{
  return self->_placementStates;
}

- (void)setPlacementStates:(id)a3
{
  objc_storeStrong((id *)&self->_placementStates, a3);
}

- (int64_t)preferredPlacementStateIndex
{
  return self->_preferredPlacementStateIndex;
}

- (void)setPreferredPlacementStateIndex:(int64_t)a3
{
  self->_preferredPlacementStateIndex = a3;
}

- (int64_t)currentPlacementStateIndex
{
  return self->_currentPlacementStateIndex;
}

- (void)setCurrentPlacementStateIndex:(int64_t)a3
{
  self->_currentPlacementStateIndex = a3;
}

- (_UIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
}

- (BOOL)wasEnabled
{
  return self->_wasEnabled;
}

- (void)setWasEnabled:(BOOL)a3
{
  self->_wasEnabled = a3;
}

- (BOOL)wasVisible
{
  return self->_wasVisible;
}

- (void)setWasVisible:(BOOL)a3
{
  self->_wasVisible = a3;
}

- (int64_t)previousPlacementStateIndex
{
  return self->_previousPlacementStateIndex;
}

- (void)setPreviousPlacementStateIndex:(int64_t)a3
{
  self->_previousPlacementStateIndex = a3;
}

- (int64_t)dataUpdateStatus
{
  return self->_dataUpdateStatus;
}

- (void)setDataUpdateStatus:(int64_t)a3
{
  self->_dataUpdateStatus = a3;
}

- (int64_t)placementUpdateStatus
{
  return self->_placementUpdateStatus;
}

- (void)setPlacementUpdateStatus:(int64_t)a3
{
  self->_placementUpdateStatus = a3;
}

- (BOOL)dataEnabled
{
  return self->_dataEnabled;
}

- (void)setDataEnabled:(BOOL)a3
{
  self->_dataEnabled = a3;
}

- (BOOL)floating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (int64_t)enabilityStatus
{
  return self->_enabilityStatus;
}

- (void)setEnabilityStatus:(int64_t)a3
{
  self->_enabilityStatus = a3;
}

- (int64_t)visibilityStatus
{
  return self->_visibilityStatus;
}

- (void)setVisibilityStatus:(int64_t)a3
{
  self->_visibilityStatus = a3;
}

- (_UIStatusBarAnimation)addingAnimation
{
  return self->_addingAnimation;
}

- (void)setAddingAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_addingAnimation, a3);
}

- (_UIStatusBarAnimation)removingAnimation
{
  return self->_removingAnimation;
}

- (void)setRemovingAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_removingAnimation, a3);
}

- (NSMutableSet)animations
{
  return self->_animations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_removingAnimation, 0);
  objc_storeStrong((id *)&self->_addingAnimation, 0);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_storeStrong((id *)&self->_placementStates, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_displayItem);
}

@end
