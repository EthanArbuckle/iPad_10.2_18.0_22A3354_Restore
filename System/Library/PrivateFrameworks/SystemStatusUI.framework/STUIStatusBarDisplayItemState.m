@implementation STUIStatusBarDisplayItemState

- (void)prepareForDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_currentPlacementStateIndex = 0;
  self->_enabilityStatus = 0;
  self->_visibilityStatus = 0;
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
  -[STUIStatusBarDisplayItemState setFloating:](self, "setFloating:", objc_msgSend(WeakRetained, "floating"));

  if (-[STUIStatusBarDisplayItemState isFloating](self, "isFloating"))
  {
    self->_currentPlacementStateIndex = -1;
LABEL_5:
    -[STUIStatusBarDisplayItemState _updateStatuses](self, "_updateStatuses");
    v7 = 1;
    goto LABEL_6;
  }
  -[STUIStatusBarDisplayItemState removingAnimation](self, "removingAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self->_currentPlacementStateIndex = self->_previousPlacementStateIndex;
    -[STUIStatusBarDisplayItemState _resolveDependentItemStatesWithBlock:](self, "_resolveDependentItemStatesWithBlock:", v4);
    goto LABEL_5;
  }
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_5;
  while (1)
  {
    -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canBeEnabled");

    if (v11)
    {
      if (!-[STUIStatusBarDisplayItemState _resolveDependentItemStatesWithBlock:](self, "_resolveDependentItemStatesWithBlock:", v4))break;
    }
    if (!-[STUIStatusBarDisplayItemState _updateToNextPlacementStateIfNeeded](self, "_updateToNextPlacementStateIfNeeded"))goto LABEL_5;
  }
  v7 = 0;
LABEL_6:

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
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "priority");
  v8 = objc_msgSend(v4, "priority");

  v9 = v7 == v8 && -[STUIStatusBarDisplayItemState isEnabled](self, "isEnabled");
  return v9;
}

- (STUIStatusBarDisplayItemPlacementState)currentPlacementState
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
  return (STUIStatusBarDisplayItemPlacementState *)v4;
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

  v3 = -[STUIStatusBarDisplayItemState isEnabledIgnoringAnimations](self, "isEnabledIgnoringAnimations");
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
  -[STUIStatusBarDisplayItemState setEnabilityStatus:](self, "setEnabilityStatus:", v5);
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
  -[STUIStatusBarDisplayItemState setVisibilityStatus:](self, "setVisibilityStatus:", v9);
}

- (BOOL)isEnabledIgnoringAnimations
{
  void *v3;
  void *v4;
  char v5;

  if (!self->_dataEnabled)
    return 0;
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  return v5;
}

- (void)setEnabilityStatus:(int64_t)a3
{
  self->_enabilityStatus = a3;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (BOOL)_updateToNextPlacementStateIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
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

- (STUIStatusBarAnimation)removingAnimation
{
  return self->_removingAnimation;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (id)updateWithData:(id)a3 styleAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id *location;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;

  v6 = a3;
  v7 = a4;
  if (self->_dataUpdateStatus != 2)
  {
    self->_dataUpdateStatus = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
    v11 = objc_msgSend(WeakRetained, "clearPreviousTokenDisablementIfNecessary");

    if (v11)
    {
      -[STUIStatusBarDisplayItemState setWasEnabled:](self, "setWasEnabled:", 0);
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)&self->_displayItem);
      -[STUIStatusBarDisplayItemState setWasEnabled:](self, "setWasEnabled:", objc_msgSend(v12, "isEnabled"));

    }
    v13 = objc_loadWeakRetained((id *)&self->_displayItem);
    -[STUIStatusBarDisplayItemState setWasVisible:](self, "setWasVisible:", objc_msgSend(v13, "visible"));

    -[STUIStatusBarDisplayItemState setPreviousPlacementStateIndex:](self, "setPreviousPlacementStateIndex:", -[STUIStatusBarDisplayItemState currentPlacementStateIndex](self, "currentPlacementStateIndex"));
    v14 = objc_loadWeakRetained((id *)&self->_displayItem);
    -[STUIStatusBarDisplayItemState setFloating:](self, "setFloating:", objc_msgSend(v14, "floating"));

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __64__STUIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke;
    v40[3] = &unk_1E8D62EA8;
    v15 = v6;
    v41 = v15;
    v16 = v7;
    v42 = v16;
    v17 = v9;
    v43 = v17;
    if (!-[STUIStatusBarDisplayItemState _updatePlacementWithRecursionBlock:](self, "_updatePlacementWithRecursionBlock:", v40))
    {
      self->_dataUpdateStatus = 0;
      v8 = (id)MEMORY[0x1E0C9AA60];
LABEL_22:

      goto LABEL_23;
    }
    v39 = v7;
    location = (id *)&self->_item;
    v18 = objc_loadWeakRetained((id *)&self->_item);
    v19 = objc_loadWeakRetained((id *)&self->_displayItem);
    v20 = objc_loadWeakRetained((id *)&self->_statusBar);
    objc_msgSend(v20, "currentAggregatedData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", objc_msgSend(v18, "canEnableDisplayItem:fromData:", v19, v21));

    -[STUIStatusBarDisplayItemState _updateStatuses](self, "_updateStatuses");
    v22 = -[STUIStatusBarDisplayItemState enabilityStatus](self, "enabilityStatus");
    switch(v22)
    {
      case 1:
        v23 = objc_loadWeakRetained(location);
        -[STUIStatusBarDisplayItemState _updateForItem:data:styleAttributes:](self, "_updateForItem:data:styleAttributes:", v23, v15, v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        -[STUIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](self, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", 0, 0, MEMORY[0x1E0C9AAA0], location);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v7 = v39;
        if (v27)
        {
          -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "placement");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "itemInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setPlacementInfo:", v30);

          v31 = objc_loadWeakRetained(location);
          v32 = objc_loadWeakRetained((id *)&self->_displayItem);
          objc_msgSend(v31, "_applyUpdate:toDisplayItem:", v27, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = objc_loadWeakRetained((id *)&self->_displayItem);
          -[STUIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", objc_msgSend(v34, "isEnabled"));

        }
        else
        {
          v33 = 0;
        }
        goto LABEL_19;
      case 2:
        v23 = objc_loadWeakRetained((id *)&self->_statusBar);
        objc_msgSend(v23, "currentAggregatedData", location);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_loadWeakRetained((id *)&self->_statusBar);
        objc_msgSend(v25, "styleAttributes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](self, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", v24, v26, MEMORY[0x1E0C9AAB0]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v27 = 0;
        v33 = 0;
        v7 = v39;
LABEL_19:
        -[STUIStatusBarDisplayItemState _updateStatuses](self, "_updateStatuses", location);
        -[STUIStatusBarDisplayItemState _cancelObsoleteAnimations](self, "_cancelObsoleteAnimations");
        -[STUIStatusBarDisplayItemState _animationWithUpdateAnimation:](self, "_animationWithUpdateAnimation:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          -[STUIStatusBarDisplayItemState identifier](self, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setDisplayItemIdentifier:", v36);

          objc_msgSend(v17, "addObject:", v35);
        }
        *(_OWORD *)&self->_dataUpdateStatus = xmmword_1CFEBEDC0;
        self->_preferredPlacementStateIndex = self->_currentPlacementStateIndex;
        v8 = v17;

        goto LABEL_22;
    }

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v8;
}

- (void)setVisibilityStatus:(int64_t)a3
{
  self->_visibilityStatus = a3;
}

- (BOOL)isEnabled
{
  return -[STUIStatusBarDisplayItemState hasRunningAnimations](self, "hasRunningAnimations")
      || self->_floating
      || -[STUIStatusBarDisplayItemState isEnabledIgnoringAnimations](self, "isEnabledIgnoringAnimations");
}

- (BOOL)hasRunningAnimations
{
  return self->_addingAnimation || self->_removingAnimation || -[NSMutableSet count](self->_animations, "count") != 0;
}

- (void)setDataEnabled:(BOOL)a3
{
  self->_dataEnabled = a3;
}

- (int64_t)enabilityStatus
{
  return self->_enabilityStatus;
}

- (void)setWasVisible:(BOOL)a3
{
  self->_wasVisible = a3;
}

- (void)setWasEnabled:(BOOL)a3
{
  self->_wasEnabled = a3;
}

- (void)setPreviousPlacementStateIndex:(int64_t)a3
{
  self->_previousPlacementStateIndex = a3;
}

- (int64_t)currentPlacementStateIndex
{
  return self->_currentPlacementStateIndex;
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

  v3 = -[STUIStatusBarDisplayItemState _animationType](self, "_animationType");
  if (v3 == 2)
  {
    -[STUIStatusBarDisplayItemState addingAnimation](self, "addingAnimation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[STUIStatusBarDisplayItemState addingAnimation](self, "addingAnimation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancel");

      -[STUIStatusBarDisplayItemState setAddingAnimation:](self, "setAddingAnimation:", 0);
    }
    -[STUIStatusBarDisplayItemState animations](self, "animations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[STUIStatusBarDisplayItemState animations](self, "animations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v10, "copy");

      objc_msgSend(v12, "makeObjectsPerformSelector:", sel_cancel);
      -[STUIStatusBarDisplayItemState animations](self, "animations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllObjects");

    }
  }
  else if (v3 == 1)
  {
    -[STUIStatusBarDisplayItemState removingAnimation](self, "removingAnimation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[STUIStatusBarDisplayItemState removingAnimation](self, "removingAnimation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancel");

      -[STUIStatusBarDisplayItemState setRemovingAnimation:](self, "setRemovingAnimation:", 0);
    }
  }
}

- (int64_t)_animationType
{
  int64_t result;

  result = -[STUIStatusBarDisplayItemState visibilityStatus](self, "visibilityStatus");
  if (result)
  {
    if (result == 3)
    {
      return 2;
    }
    else if (result == 2)
    {
      if (-[STUIStatusBarDisplayItemState enabilityStatus](self, "enabilityStatus") == 2)
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

- (int64_t)visibilityStatus
{
  return self->_visibilityStatus;
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
  v8 = -[STUIStatusBarDisplayItemState _animationType](self, "_animationType");
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
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
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

- (BOOL)updatePlacement
{
  int64_t placementUpdateStatus;

  placementUpdateStatus = self->_placementUpdateStatus;
  if (placementUpdateStatus == 2)
    return 1;
  if (placementUpdateStatus == 1)
    return 0;
  self->_placementUpdateStatus = 1;
  return -[STUIStatusBarDisplayItemState _updatePlacementWithRecursionBlock:](self, "_updatePlacementWithRecursionBlock:", &__block_literal_global_1);
}

uint64_t __64__STUIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "dataUpdateStatus");
  if (v4 != 2)
  {
    if (v4)
    {
      v6 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "updateWithData:styleAttributes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v5);

  }
  v6 = 1;
LABEL_6:

  return v6;
}

- (int64_t)dataUpdateStatus
{
  return self->_dataUpdateStatus;
}

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

  +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
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

uint64_t __48__STUIStatusBarDisplayItemState_updatePlacement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePlacement");
}

- (id)_updateForUpdatedData:(id)a3 updatedStyleAttributes:(id)a4 updatedEnability:(id)a5
{
  id v8;
  id v9;
  __objc2_class *WeakRetained;
  id v11;
  STUIStatusBarItemUpdate *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  WeakRetained = STUIStatusBarItemUpdate;
  v11 = a4;
  v12 = objc_alloc_init(STUIStatusBarItemUpdate);
  -[STUIStatusBarItemUpdate setDataChanged:](v12, "setDataChanged:", v8 != 0);
  if (v8)
  {
    -[STUIStatusBarItemUpdate setData:](v12, "setData:", v8);
  }
  else
  {
    WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    -[__objc2_class currentAggregatedData](WeakRetained, "currentAggregatedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarItemUpdate setData:](v12, "setData:", v13);

  }
  v19 = v11 != 0;
  v14 = v11;
  if (!v11)
  {
    WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    -[__objc2_class styleAttributes](WeakRetained, "styleAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[STUIStatusBarItemUpdate data](v12, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDisplayItemState _effectiveStyleAttributesFromStyleAttributes:data:styleAttributesChanged:](self, "_effectiveStyleAttributesFromStyleAttributes:data:styleAttributesChanged:", v14, v15, &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarItemUpdate setStyleAttributes:](v12, "setStyleAttributes:", v16);
  if (!v11)
  {

  }
  -[STUIStatusBarItemUpdate setStyleAttributesChanged:](v12, "setStyleAttributesChanged:", v19);
  -[STUIStatusBarItemUpdate setEnablementChanged:](v12, "setEnablementChanged:", v9 != 0);
  if (v9)
    v17 = objc_msgSend(v9, "BOOLValue");
  else
    v17 = 1;
  -[STUIStatusBarItemUpdate setEnabled:](v12, "setEnabled:", v17);

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
  STUIStatusBarStyleAttributes **p_overriddenStyleAttributes;
  void *v29;
  _QWORD v31[2];
  void (*v32)(uint64_t, void *);
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "region");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v32 = __106__STUIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke;
  v33 = &unk_1E8D62ED0;
  v34 = &v35;
  v13 = objc_msgSend(v12, "effectiveStyle");
  if (v13 != 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
    objc_msgSend(WeakRetained, "styleAttributesForStyle:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32((uint64_t)v31, v15);

  }
  objc_msgSend(v12, "overriddenStyleAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32((uint64_t)v31, v16);

  v17 = objc_loadWeakRetained((id *)&self->_displayItem);
  objc_msgSend(v17, "overriddenStyleAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32((uint64_t)v31, v18);

  v19 = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v19, "overriddenStyleAttributesForData:identifier:", v9, self->_identifier);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32((uint64_t)v31, v20);

  v21 = objc_loadWeakRetained((id *)&self->_statusBar);
  objc_msgSend(v21, "visualProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    v24 = objc_loadWeakRetained((id *)&self->_statusBar);
    objc_msgSend(v24, "visualProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarDisplayItemState identifier](self, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "overriddenStyleAttributesForDisplayItemWithIdentifier:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32((uint64_t)v31, v27);

  }
  p_overriddenStyleAttributes = &self->_overriddenStyleAttributes;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)p_overriddenStyleAttributes, (id)v36[5]);
    *a5 = 1;
  }
  objc_msgSend(v10, "styleAttributesWithOverrides:", v36[5]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v35, 8);
  return v29;
}

void __106__STUIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    v10 = v3;
    if (v5)
    {
      objc_msgSend(v5, "styleAttributesWithOverrides:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;
    }
    else
    {
      v9 = v3;
      v8 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v9;
    }

    v3 = v10;
  }

}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
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
  STUIStatusBarDisplayItemState *v18;
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
  -[STUIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](v18, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v21;
}

+ (void)setupRelationsBetweenDisplayItemStates:(id)a3 visualProvider:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__STUIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke;
  v9[3] = &unk_1E8D62E40;
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (void)resetToPreferredPlacement
{
  self->_currentPlacementStateIndex = self->_preferredPlacementStateIndex;
  self->_placementUpdateStatus = 0;
}

BOOL __55__STUIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "priority");
  return v3 <= objc_msgSend(*(id *)(a1 + 32), "priority");
}

- (void)addPlacement:(id)a3 inRegion:(id)a4
{
  void *v5;
  NSMutableArray *placementStates;
  uint64_t v7;
  NSMutableArray *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  +[STUIStatusBarDisplayItemPlacementState stateForDisplayItemPlacement:region:](STUIStatusBarDisplayItemPlacementState, "stateForDisplayItemPlacement:region:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  placementStates = self->_placementStates;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__STUIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke;
  v10[3] = &unk_1E8D62E18;
  v11 = v5;
  v9 = v5;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](placementStates, "indexOfObjectPassingTest:", v10);
  v8 = self->_placementStates;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](v8, "addObject:", v9);
  else
    -[NSMutableArray insertObject:atIndex:](v8, "insertObject:atIndex:", v9);

}

void __87__STUIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v3, "placementStates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v87;
    v59 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v87 != v57)
          objc_enumerationMutation(obj);
        v60 = v4;
        v63 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v4);
        objc_msgSend(v63, "placement");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "excludedPlacements");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allObjects");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v8);

        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(v5, "excludedRegionIdentifiers");
        v61 = (id)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
        if (v64)
        {
          v62 = *(_QWORD *)v83;
          do
          {
            for (i = 0; i != v64; ++i)
            {
              if (*(_QWORD *)v83 != v62)
                objc_enumerationMutation(v61);
              objc_msgSend(*(id *)(a1 + 32), "orderedDisplayItemPlacementsInRegionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              v81 = 0u;
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
              if (v11)
              {
                v12 = v11;
                v13 = *(_QWORD *)v79;
                do
                {
                  for (j = 0; j != v12; ++j)
                  {
                    if (*(_QWORD *)v79 != v13)
                      objc_enumerationMutation(v10);
                    v15 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
                    objc_msgSend(v5, "includedPlacements");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = objc_msgSend(v16, "containsObject:", v15);

                    if ((v17 & 1) == 0)
                      objc_msgSend(v6, "addObject:", v15);
                  }
                  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
                }
                while (v12);
              }

            }
            v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
          }
          while (v64);
        }

        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v18 = v6;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
        v3 = v59;
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v75;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v75 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
              +[STUIStatusBarDisplayItemRelation exclusionWithDisplayItemState:placement:](STUIStatusBarDisplayItemRelation, "exclusionWithDisplayItemState:placement:", v59, v5);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = *(void **)(a1 + 40);
              objc_msgSend(v23, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v27, "placementStateForPlacement:", v23);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "relations");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v24);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
          }
          while (v20);
        }

        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        objc_msgSend(v5, "allRequiredPlacements");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v71;
          do
          {
            for (m = 0; m != v32; ++m)
            {
              if (*(_QWORD *)v71 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
              v36 = *(void **)(a1 + 40);
              objc_msgSend(v35, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              +[STUIStatusBarDisplayItemRelation requirementWithDisplayItemState:placement:](STUIStatusBarDisplayItemRelation, "requirementWithDisplayItemState:placement:", v38, v35);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "relations");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v39);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
          }
          while (v32);
        }

        objc_msgSend(v5, "anyRequiredPlacements");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

        if (v42)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          objc_msgSend(v5, "anyRequiredPlacements");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v67;
            do
            {
              for (n = 0; n != v46; ++n)
              {
                if (*(_QWORD *)v67 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * n);
                v50 = *(void **)(a1 + 40);
                objc_msgSend(v49, "identifier");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "objectForKeyedSubscript:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                +[STUIStatusBarDisplayItemRelation requirementWithDisplayItemState:placement:](STUIStatusBarDisplayItemRelation, "requirementWithDisplayItemState:placement:", v52, v49);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "addObject:", v53);

              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
            }
            while (v46);
          }

          objc_msgSend(v63, "relations");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          +[STUIStatusBarDisplayItemRelation anyRelationWithRelations:](STUIStatusBarDisplayItemRelation, "anyRelationWithRelations:", v43);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v55);

          v3 = v59;
        }

        v4 = v60 + 1;
      }
      while (v60 + 1 != v58);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    }
    while (v58);
  }

}

- (NSMutableArray)placementStates
{
  return self->_placementStates;
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

void __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "animations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "removeObject:", WeakRetained);

}

uint64_t __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAddingAnimation:", 0);
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
  STUIStatusBarDisplayItemState *v20;
  id v21;
  id location;
  _QWORD v23[5];
  int v24;
  _QWORD v25[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  v6 = objc_msgSend(WeakRetained, "animationContextId");

  switch(-[STUIStatusBarDisplayItemState _animationType](self, "_animationType"))
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
      v25[2] = __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke;
      v25[3] = &unk_1E8D628C0;
      v25[4] = self;
      objc_msgSend(v4, "addCompletionHandler:", v25);
      -[STUIStatusBarDisplayItemState setAddingAnimation:](self, "setAddingAnimation:", v4);
      break;
    case 2:
      objc_msgSend(v4, "setType:", 2);
      v8 = objc_loadWeakRetained((id *)&self->_item);
      v9 = objc_loadWeakRetained((id *)&self->_displayItem);
      objc_msgSend(v8, "prepareAnimation:forDisplayItem:", v4, v9);

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_2;
      v23[3] = &unk_1E8D62EF8;
      v23[4] = self;
      v24 = v6;
      objc_msgSend(v4, "addCompletionHandler:", v23);
      -[STUIStatusBarDisplayItemState setRemovingAnimation:](self, "setRemovingAnimation:", v4);
      goto LABEL_6;
    case 3:
      objc_msgSend(v4, "setType:", 3);
      v10 = objc_loadWeakRetained((id *)&self->_item);
      v11 = objc_loadWeakRetained((id *)&self->_displayItem);
      objc_msgSend(v10, "prepareAnimation:forDisplayItem:", v4, v11);

      objc_initWeak(&location, v4);
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_3;
      v19 = &unk_1E8D62F20;
      v20 = self;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v4, "addCompletionHandler:", &v16);
      -[STUIStatusBarDisplayItemState animations](self, "animations", v16, v17, v18, v19, v20);
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

- (STUIStatusBarDisplayItem)displayItem
{
  return (STUIStatusBarDisplayItem *)objc_loadWeakRetained((id *)&self->_displayItem);
}

- (NSMutableSet)animations
{
  return self->_animations;
}

- (void)setAddingAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_addingAnimation, a3);
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
  STUIStatusBarGetPriorityComparator();
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

- (void)updateToNextEnabledPlacement
{
  ++self->_currentPlacementStateIndex;
  while (-[STUIStatusBarDisplayItemState _updateToNextPlacementStateIfNeeded](self, "_updateToNextPlacementStateIfNeeded"));
}

- (void)prepareForOverflowDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_visibilityStatus = 3;
}

void __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  int v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _OWORD v13[3];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v5 = objc_msgSend(WeakRetained, "animationContextId");

  if (a2 != 1 || !v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemovingAnimation:", 0);
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v8, "setFloating:", 0);

    goto LABEL_6;
  }
  v6 = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setRemovingAnimation:", 0);
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v7, "setFloating:", 0);

  if (v5 != v6)
  {
LABEL_6:
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v9, "setContainerView:", 0);

    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v10, "setAlpha:", 1.0);

    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13[0] = *MEMORY[0x1E0C9BAA8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v11, "setTransform:", v13);

  }
}

- (int64_t)priority
{
  void *v3;
  int64_t v4;

  if (!-[STUIStatusBarDisplayItemState isEnabled](self, "isEnabled"))
    return 0;
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "priority");

  return v4;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarDisplayItemState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarDisplayItemState debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarDisplayItemState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDisplayItemState identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemState isEnabled](self, "isEnabled"), CFSTR("enabled"));
  v7 = -[STUIStatusBarDisplayItemState enabilityStatus](self, "enabilityStatus");
  if (v7 > 3)
    v8 = CFSTR("(unknown)");
  else
    v8 = off_1E8D62F40[v7];
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("enabilityStatus"));
  v9 = -[STUIStatusBarDisplayItemState visibilityStatus](self, "visibilityStatus");
  if (v9 > 3)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E8D62F60[v9];
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("visibilityStatus"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemState isDataEnabled](self, "isDataEnabled"), CFSTR("dataEnabled"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemState isFloating](self, "isFloating"), CFSTR("floating"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemState _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarDisplayItemState _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  -[STUIStatusBarDisplayItemState succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDebugDescription:", v4);
  -[STUIStatusBarDisplayItemState currentPlacementState](self, "currentPlacementState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v7, CFSTR("currentPlacementState"), 1);

  return v6;
}

- (void)setDisplayItem:(id)a3
{
  objc_storeWeak((id *)&self->_displayItem, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (STUIStatusBar)statusBar
{
  return (STUIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

- (STUIStatusBarItem)item
{
  return (STUIStatusBarItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
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

- (void)setCurrentPlacementStateIndex:(int64_t)a3
{
  self->_currentPlacementStateIndex = a3;
}

- (STUIStatusBarStyleAttributes)overriddenStyleAttributes
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

- (BOOL)wasVisible
{
  return self->_wasVisible;
}

- (int64_t)previousPlacementStateIndex
{
  return self->_previousPlacementStateIndex;
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

- (BOOL)isDataEnabled
{
  return self->_dataEnabled;
}

- (STUIStatusBarAnimation)addingAnimation
{
  return self->_addingAnimation;
}

- (void)setRemovingAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_removingAnimation, a3);
}

@end
