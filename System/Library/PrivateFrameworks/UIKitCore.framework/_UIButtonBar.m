@implementation _UIButtonBar

- (void)_setNeedsVisualUpdate
{
  -[UIView setNeedsUpdateConstraints](self->_stackView, "setNeedsUpdateConstraints");
  -[UIView setNeedsLayout](self->_stackView, "setNeedsLayout");
  -[_UIButtonBar _disablePointerInteractions](self, "_disablePointerInteractions");
}

- ($1AB5FA073B851C12C2339EC22442E995)widthInfo
{
  double v3;
  double v4;
  double v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[_UIButtonBar _updateEffectiveLayout]((uint64_t)self);
  v3 = -[_UIButtonBar _widthInfoForLayout:]((uint64_t)self, self->_effectiveLayout);
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (NSArray)barButtonGroups
{
  return *(NSArray **)&self->_minimumInterItemSpace;
}

- (void)_updateEffectiveLayout
{
  BOOL v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = objc_msgSend(*(id *)(a1 + 8), "distribution") != 0;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __38___UIButtonBar__updateEffectiveLayout__block_invoke;
  v27[3] = &unk_1E16B5778;
  v27[4] = a1;
  v31 = v2;
  v21 = v3;
  v28 = v21;
  v22 = v4;
  v29 = v22;
  v30 = &v32;
  objc_msgSend((id)a1, "_enumerateLayoutGroups:", v27);
  objc_storeStrong((id *)(a1 + 64), v4);
  objc_storeStrong((id *)(a1 + 80), v3);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *(id *)(a1 + 64);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
  if (!v8)
  {

    v9 = 0;
    goto LABEL_22;
  }
  v9 = 0;
  v10 = *(_QWORD *)v24;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
      objc_msgSend(v12, "group", v21);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = *(_QWORD *)(v13 + 48);
        if (v14)
        {
          v15 = v14 == 1;

          if (v15)
            goto LABEL_15;
        }
        else
        {
          v16 = (*(_BYTE *)(v13 + 24) & 1) == 0;

          if (!v16)
            goto LABEL_15;
        }
      }
      objc_msgSend(v6, "addObject:", v12);
      objc_msgSend(v12, "dirtyLayoutForPlainAppearanceChange:doneAppearanceChanged:", (*(unsigned __int8 *)(a1 + 120) >> 2) & 1, (*(unsigned __int8 *)(a1 + 120) >> 3) & 1);
      if (v9)
      {
        objc_msgSend(v5, "addObject:", v9);
        objc_msgSend(v12, "setLeadingSpacerType:", +[_UIButtonBarSpacerLayout typeOfSpacerBetweenLayout:andLayout:](_UIButtonBarSpacerLayout, "typeOfSpacerBetweenLayout:andLayout:", v9, v12));
      }
      v17 = v12;

      v9 = v17;
LABEL_15:
      ++v11;
    }
    while (v8 != v11);
    v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    v8 = v18;
  }
  while (v18);

  if (v9)
    objc_msgSend(v5, "addObject:", v9);
LABEL_22:
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a1 + 120) & 0xDF | (32 * *((_BYTE *)v33 + 24));
  v19 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v5;
  v20 = v5;

  _Block_object_dispose(&v32, 8);
}

- (void)_enumerateLayoutGroups:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _UIButtonBarDelegate *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_fixedTrailingGroups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  -[_UIButtonBar groupRealizedOrder](self, "groupRealizedOrder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++), 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_delegate;
  v16 = -[_UIButtonBarDelegate countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), 1);
      }
      while (v17 != v19);
      v17 = -[_UIButtonBarDelegate countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (NSArray)groupRealizedOrder
{
  _QWORD *defaultActionFilter;
  id v4;

  defaultActionFilter = self->_defaultActionFilter;
  if (defaultActionFilter)
  {
    -[_UIButtonBarGroupOrderer orderedGroups](defaultActionFilter);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(id *)&self->_minimumInterItemSpace;
  }
  return (NSArray *)v4;
}

- (void)setNeedsHitTestUpdate
{
  -[UIView setNeedsLayout](self->_stackView, "setNeedsLayout");
}

- (UIBarButtonItem)trailingVisibleItem
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__15;
  v9 = __Block_byref_object_dispose__15;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35___UIButtonBar_trailingVisibleItem__block_invoke;
  v4[3] = &unk_1E16B5610;
  v4[4] = &v5;
  -[_UIButtonBar _reverseEnumerateVisibleItems:](self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (UIBarButtonItem *)v2;
}

- (void)_reverseEnumerateVisibleItems:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v6 = (void *)a1[20];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke;
    v16[3] = &unk_1E16B56B0;
    v18 = &v19;
    v7 = v3;
    v17 = v7;
    objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v16);
    if (!*((_BYTE *)v20 + 24))
    {
      v8 = (void *)a1[17];
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_2;
      v13[3] = &unk_1E16B56B0;
      v15 = &v19;
      v9 = v7;
      v14 = v9;
      objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v13);

      if (!*((_BYTE *)v20 + 24))
      {
        v10 = (void *)a1[19];
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_3;
        v11[3] = &unk_1E16B56D8;
        v12 = v9;
        objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v11);

      }
    }

    _Block_object_dispose(&v19, 8);
  }

}

- (void)setHitTestDirectionalInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  -[UIView hitTestDirectionalInsets](self->_stackView, "hitTestDirectionalInsets");
  if (v11 != leading || v8 != top || v10 != trailing || v9 != bottom)
  {
    -[UIView setHitTestDirectionalInsets:](self->_stackView, "setHitTestDirectionalInsets:", top, leading, bottom, trailing);
    -[_UIButtonBar setNeedsHitTestUpdate](self, "setNeedsHitTestUpdate");
  }
}

- (void)setAssistant:(id)a3
{
  objc_storeWeak((id *)&self->_popOverPresentingSourceItem, a3);
}

- (UIPointerInteractionDelegate)assistantView
{
  return (UIPointerInteractionDelegate *)self->_stackView;
}

- (void)setSupportsOverflow:(BOOL)a3
{
  if (BYTE2(self->_barButtonGroups) != a3)
  {
    BYTE2(self->_barButtonGroups) = a3;
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
}

- (void)setGroupOrderer:(id)a3
{
  id *v5;
  id *defaultActionFilter;
  id *p_defaultActionFilter;
  id *v8;

  v5 = (id *)a3;
  p_defaultActionFilter = &self->_defaultActionFilter;
  defaultActionFilter = (id *)self->_defaultActionFilter;
  if (defaultActionFilter != v5)
  {
    v8 = v5;
    if (defaultActionFilter)
      objc_storeWeak(defaultActionFilter + 5, 0);
    objc_storeStrong(&self->_defaultActionFilter, a3);
    if (*p_defaultActionFilter)
      objc_storeWeak((id *)*p_defaultActionFilter + 5, self);
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
    v5 = v8;
  }

}

- (void)setForceFixedSpacing:(BOOL)a3
{
  if (BYTE1(self->_barButtonGroups) != a3)
  {
    BYTE1(self->_barButtonGroups) = a3;
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_targetLayoutWidth, a3);
}

- (void)setFixedLeadingGroups:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *fixedTrailingGroups;
  NSArray *v10;

  v4 = a3;
  v5 = self->_fixedTrailingGroups;
  v6 = (NSArray *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSArray isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    _UIButtonBarClearOwners(self->_fixedTrailingGroups, self);
    v8 = (NSArray *)-[NSArray copy](v10, "copy");
    fixedTrailingGroups = self->_fixedTrailingGroups;
    self->_fixedTrailingGroups = v8;

    _UIButtonBarSetOwners(self->_fixedTrailingGroups, self);
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
LABEL_9:

}

- (void)_itemCustomViewDidChange:(id)a3 fromView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "buttonGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBar _layoutForGroup:](self, "_layoutForGroup:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "layoutForBarButtonItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDirty:", 1);
  -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");

}

- (id)_updatedViewForBarButtonItem:(id)a3 withView:(id)a4
{
  id v6;
  id v7;
  id v8;
  Class isa;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isCustomViewItem"))
  {
    objc_msgSend(v6, "customView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    isa = self[1].super.isa;
    if (isa)
    {
      (*((void (**)(Class, _UIButtonBar *, id, id))isa + 2))(isa, self, v6, v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
  }
  v10 = v8;

  return v10;
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return self->_doneItemAppearance;
}

- (BOOL)plainItemAppearanceNeedsUpdate
{
  return (*(_BYTE *)&self->_buttonBarFlags >> 2) & 1;
}

- (id)_targetActionForBarButtonItem:(id)a3
{
  id v4;
  _UIButtonBarTargetAction *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_senderActionMap, "objectForKey:", v4);
  v5 = (_UIButtonBarTargetAction *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[_UIButtonBarTargetAction initWithBarButtonItem:]([_UIButtonBarTargetAction alloc], "initWithBarButtonItem:", v4);
    -[_UIButtonBarTargetAction setActionFilter:](v5, "setActionFilter:", self->__appearanceDelegate);
    -[NSMapTable setObject:forKey:](self->_senderActionMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (_UIButtonBarAppearanceDelegate)_appearanceDelegate
{
  return (_UIButtonBarAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_plainItemAppearance);
}

- (void)setBarButtonGroups:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  double v8;
  double minimumInterItemSpace;
  _QWORD *defaultActionFilter;
  void *v11;
  id v12;

  v4 = a3;
  v5 = *(id *)&self->_minimumInterItemSpace;
  v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    _UIButtonBarClearOwners(*(void **)&self->_minimumInterItemSpace, self);
    v8 = COERCE_DOUBLE(objc_msgSend(v12, "copy"));
    minimumInterItemSpace = self->_minimumInterItemSpace;
    self->_minimumInterItemSpace = v8;

    _UIButtonBarSetOwners(*(void **)&self->_minimumInterItemSpace, self);
    defaultActionFilter = self->_defaultActionFilter;
    if (defaultActionFilter)
    {
      v11 = (void *)defaultActionFilter[3];
      defaultActionFilter[3] = 0;

    }
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
LABEL_11:

}

- (void)_disablePointerInteractions
{
  id WeakRetained;

  *(_BYTE *)&self->_buttonBarFlags |= 0x10u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)_confirmOwnershipOfFixedGroups
{
  _UIButtonBarSetOwners(self->_fixedTrailingGroups, self);
  _UIButtonBarSetOwners(self->_delegate, self);
}

- (BOOL)_itemDidUpdateMenu:(id)a3 fromMenu:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  _UIButtonBarButtonFromItem(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "updatePresentedMenuFrom:", v5);
  else
    v8 = 0;

  return v8;
}

- (BOOL)needsLeadingSpacer
{
  int v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (BYTE1(self->_barButtonGroups))
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__15;
    v10 = __Block_byref_object_dispose__15;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34___UIButtonBar_needsLeadingSpacer__block_invoke;
    v5[3] = &unk_1E16B5610;
    v5[4] = &v6;
    -[_UIButtonBar _forwardEnumerateVisibleItems:](self, v5);
    v3 = (void *)v7[5];
    if (v3)
      v2 = objc_msgSend(v3, "isSpaceItem") ^ 1;
    else
      LOBYTE(v2) = 0;
    _Block_object_dispose(&v6, 8);

  }
  return v2;
}

- (UIBarButtonItem)leadingVisibleItem
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__15;
  v9 = __Block_byref_object_dispose__15;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___UIButtonBar_leadingVisibleItem__block_invoke;
  v4[3] = &unk_1E16B5610;
  v4[4] = &v5;
  -[_UIButtonBar _forwardEnumerateVisibleItems:](self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (UIBarButtonItem *)v2;
}

- (void)_forwardEnumerateVisibleItems:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v6 = (void *)a1[19];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke;
    v16[3] = &unk_1E16B56B0;
    v18 = &v19;
    v7 = v3;
    v17 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);
    if (!*((_BYTE *)v20 + 24))
    {
      v8 = (void *)a1[17];
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_2;
      v13[3] = &unk_1E16B56B0;
      v15 = &v19;
      v9 = v7;
      v14 = v9;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

      if (!*((_BYTE *)v20 + 24))
      {
        v10 = (void *)a1[20];
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_3;
        v11[3] = &unk_1E16B56D8;
        v12 = v9;
        objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

      }
    }

    _Block_object_dispose(&v19, 8);
  }

}

- (UIView)view
{
  return (UIView *)self->_stackView;
}

- (void)setHitTestInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIView hitTestInsets](self->_stackView, "hitTestInsets");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    -[UIView setHitTestInsets:](self->_stackView, "setHitTestInsets:", top, left, bottom, right);
    -[_UIButtonBar setNeedsHitTestUpdate](self, "setNeedsHitTestUpdate");
  }
}

- (void)setTargetLayoutWidth:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  if (*(double *)&self->_groupOrderer != a3)
  {
    *(double *)&self->_groupOrderer = a3;
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
}

- (BOOL)needsTrailingSpacer
{
  int v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (BYTE1(self->_barButtonGroups))
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__15;
    v10 = __Block_byref_object_dispose__15;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35___UIButtonBar_needsTrailingSpacer__block_invoke;
    v5[3] = &unk_1E16B5610;
    v5[4] = &v6;
    -[_UIButtonBar _reverseEnumerateVisibleItems:](self, v5);
    v3 = (void *)v7[5];
    if (v3)
      v2 = objc_msgSend(v3, "isSpaceItem") ^ 1;
    else
      LOBYTE(v2) = 0;
    _Block_object_dispose(&v6, 8);

  }
  return v2;
}

- (void)_appearanceChanged
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_groupLayouts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setDirty:", 1, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
}

- (void)_groupDidUpdateItems:(id)a3 removedItems:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  _UIButtonBarClearOwnedItems(v7, self);
  -[UIBarButtonItemGroup _items](v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _UIButtonBarSetItemOwners(v8, self);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[NSMapTable removeObjectForKey:](self->_senderActionMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), (_QWORD)v15);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[_UIButtonBar _layoutForGroup:](self, "_layoutForGroup:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDirty:", 1);

  -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
}

- (void)_itemStandardViewNeedsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "buttonGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBar _layoutForGroup:](self, "_layoutForGroup:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layoutForBarButtonItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDirty:", 1);
  -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");

}

- (id)_layoutForGroup:(id)a3
{
  return -[NSMapTable objectForKey:](self->_groupLayoutMap, "objectForKey:", a3);
}

- (void)setPlainItemAppearance:(id)a3
{
  id v5;
  _UIBarButtonItemData *v6;
  _UIBarButtonItemData *v7;
  BOOL v8;
  _UIBarButtonItemData *v9;

  v5 = a3;
  v6 = self->_doneItemAppearance;
  v7 = (_UIBarButtonItemData *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UIBarAppearanceData isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_doneItemAppearance, a3);
    *(_BYTE *)&self->_buttonBarFlags |= 4u;
    -[_UIButtonBar _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
  }
LABEL_9:

}

- (void)setDoneItemAppearance:(id)a3
{
  id v5;
  _UIPointerInteractionAssistant *v6;
  _UIPointerInteractionAssistant *v7;
  char v8;
  _UIPointerInteractionAssistant *v9;

  v5 = a3;
  v6 = self->_assistant;
  v7 = (_UIPointerInteractionAssistant *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UIPointerInteractionAssistant isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_assistant, a3);
    *(_BYTE *)&self->_buttonBarFlags |= 8u;
    -[_UIButtonBar _setNeedsAppearanceUpdate](self, "_setNeedsAppearanceUpdate");
  }
LABEL_9:

}

- (void)set_appearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_plainItemAppearance, a3);
}

- (void)setViewUpdater:(id)a3
{
  Class v5;
  objc_class *v6;
  Class isa;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (Class)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButtonBar.m"), 613, CFSTR("viewUpdater is nil"));

  }
  if (self[1].super.isa != v5)
  {
    v6 = (objc_class *)-[objc_class copy](v5, "copy");
    isa = self[1].super.isa;
    self[1].super.isa = v6;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_groupLayouts;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setDirty:", 1, (_QWORD)v14);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }

}

- (void)setMinimumInterItemSpace:(double)a3
{
  if (*(double *)&self->_fixedLeadingGroups != a3)
  {
    *(double *)&self->_fixedLeadingGroups = a3;
    -[NSLayoutConstraint setConstant:](self->_minimumInterItemSpaceConstraint, "setConstant:");
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
}

- (void)setAllowsViewWrappers:(BOOL)a3
{
  -[_UIButtonBarLayoutMetrics setAllowsViewWrappers:](self->_layoutMetrics, "setAllowsViewWrappers:", a3);
}

- (_UIButtonBar)init
{
  _UIButtonBar *v2;
  _UIButtonBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBar;
  v2 = -[_UIButtonBar init](&v5, sel_init);
  v3 = v2;
  if (v2)
    _UIButtonBarCommonInit(v2);
  return v3;
}

- (void)_setNeedsAppearanceUpdate
{
  if ((*(_BYTE *)&self->_buttonBarFlags & 2) == 0)
  {
    *(_BYTE *)&self->_buttonBarFlags |= 2u;
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
}

- (void)_layoutBar
{
  unint64_t v3;
  double v4;
  double v5;
  _UIButtonBarGroupOrderer *groupOrderer;
  double v7;
  int v8;
  NSMutableArray *v9;
  _UIButtonBar *v10;
  NSMutableArray *v11;
  int v12;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  double v37;
  double v38;
  uint64_t j;
  void *v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  char v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  NSMutableArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t ii;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t jj;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t kk;
  void *v88;
  NSMutableArray *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t mm;
  NSMutableArray *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t nn;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSLayoutConstraint *v104;
  double v105;
  NSLayoutConstraint *centeringConstraint;
  NSLayoutConstraint *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  NSMutableArray *obj;
  id obja;
  _UIButtonBar *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_buttonBarFlags & 1) == 0)
  {
    *(_BYTE *)&self->_buttonBarFlags |= 1u;
    -[_UIButtonBar _updateEffectiveLayout]((uint64_t)self);
    v3 = 0x1E0C99000;
    v116 = self;
    if (BYTE2(self->_barButtonGroups))
    {
      -[_UIButtonBar _widthInfoForLayout:]((uint64_t)self, self->_effectiveLayout);
      v5 = v4;
      groupOrderer = self->_groupOrderer;
      v8 = (*(double *)&groupOrderer < v7) & (*(_BYTE *)&self->_buttonBarFlags >> 5);
      v9 = self->_effectiveLayout;
      v10 = self;
      v11 = v9;
      v12 = v8;
      if (*(double *)&groupOrderer >= v5 && v8 == 0)
        goto LABEL_44;
      v155 = 0u;
      v154 = 0u;
      v153 = 0u;
      v152 = 0u;
      v14 = v10->_effectiveLayout;
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v152, v160, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = *(_QWORD *)v153;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v153 != v20)
              objc_enumerationMutation(v14);
            v22 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * i);
            if (objc_msgSend(v22, "critical"))
            {
              v23 = v22;

              v17 = v23;
            }
            else
            {
              if (objc_msgSend(v22, "fixed"))
              {
                if (!v18)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v24 = v18;
              }
              else
              {
                if (!v19)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v24 = v19;
              }
              objc_msgSend(v24, "addObject:", v22);
            }
          }
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v152, v160, 16);
        }
        while (v16);

        if (*(double *)&groupOrderer < v5)
        {
          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v17);
            v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
LABEL_37:

            if (v18)
              -[NSMutableArray addObjectsFromArray:](v25, "addObjectsFromArray:", v18);
            if (!v19)
              goto LABEL_43;
            -[NSMutableArray addObjectsFromArray:](v25, "addObjectsFromArray:", v19);
LABEL_42:

LABEL_43:
            v11 = v25;
LABEL_44:
            v32 = *(double *)&v116->_groupOrderer;
            v148 = 0u;
            v149 = 0u;
            v150 = 0u;
            v151 = 0u;
            v26 = v11;
            v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v148, &v156, 16);
            if (!v33)
              goto LABEL_68;
            v34 = v33;
            v35 = *(_QWORD *)v149;
            v36 = 1;
            v37 = 0.0;
            v38 = 0.0;
            while (1)
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v149 != v35)
                  objc_enumerationMutation(v26);
                v40 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * j);
                if (objc_msgSend(v40, "fixed"))
                {
                  objc_msgSend(v40, "compactWidth");
                  v37 = v37 + v41;
                }
                objc_msgSend(v40, "compactWidth");
                v38 = v38 + v42;
                v43 = *(double *)&v116->_groupOrderer;
                if (v37 > v43)
                {
                  objc_msgSend(v40, "setCompact:", 1);
                  v44 = objc_msgSend(v40, "fixed") ^ 1;
                  v45 = v40;
LABEL_55:
                  objc_msgSend(v45, "setSpilled:", v44);
                  continue;
                }
                if (v38 > v43)
                {
                  objc_msgSend(v40, "setCompact:", 1);
                  v45 = v40;
                  v44 = 1;
                  goto LABEL_55;
                }
                objc_msgSend(v40, "compactWidth");
                v32 = v32 - v46;
                objc_msgSend(v40, "expandedWidth");
                v48 = v47;
                objc_msgSend(v40, "compactWidth");
                v50 = v48 - v49;
                if ((objc_msgSend(v40, "critical") & v12) == 1 && v50 > 0.0)
                {
                  v51 = 1;
                }
                else
                {
                  objc_msgSend(v40, "group");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v52, "_shouldAlwaysCollapse");

                  if (((v50 <= v32 + 0.00000011920929) & v36) != 0 && (v51 & 1) == 0)
                  {
                    objc_msgSend(v40, "setCompact:", 0);
                    objc_msgSend(v40, "setSpilled:", 0);
                    v32 = v32 - v50;
                    v38 = v38 + v50;
                    continue;
                  }
                }
                objc_msgSend(v40, "setCompact:", 1);
                if (v32 >= 0.0)
                  v53 = 0;
                else
                  v53 = objc_msgSend(v40, "fixed") ^ 1;
                objc_msgSend(v40, "setSpilled:", v53);
                v36 &= (v50 <= v32 + 0.00000011920929) & v51;
              }
              v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v148, &v156, 16);
              if (!v34)
              {
LABEL_68:

                v3 = 0x1E0C99000uLL;
                goto LABEL_69;
              }
            }
          }
LABEL_36:
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          goto LABEL_37;
        }
      }
      else
      {

        v18 = 0;
        v19 = 0;
        v17 = 0;
        if (*(double *)&groupOrderer < v5)
          goto LABEL_36;
      }
      v25 = (NSMutableArray *)-[NSMutableArray mutableCopy](v116->_effectiveLayout, "mutableCopy");

      -[NSMutableArray removeObject:](v25, "removeObject:", v17);
      -[NSMutableArray insertObject:atIndex:](v25, "insertObject:atIndex:", v17, 0);
      goto LABEL_42;
    }
    v159 = 0u;
    v158 = 0u;
    v157 = 0u;
    v156 = 0u;
    v26 = self->_effectiveLayout;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v156, v160, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v157;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v157 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * k);
          objc_msgSend(v31, "setCompact:", 0);
          objc_msgSend(v31, "setSpilled:", 0);
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v156, v160, 16);
      }
      while (v28);
    }
LABEL_69:

    v109 = (void *)-[NSMutableArray copy](v116->_layoutActiveConstraints, "copy");
    v108 = (void *)-[NSMutableArray copy](v116->_layoutViews, "copy");
    v110 = (void *)-[NSMutableArray copy](v116->_layoutGuides, "copy");
    v54 = objc_alloc_init(*(Class *)(v3 + 3560));
    v55 = objc_alloc_init(*(Class *)(v3 + 3560));
    -[NSMutableArray removeAllObjects](v116->_layoutViews, "removeAllObjects");
    -[NSMutableArray removeAllObjects](v116->_layoutGuides, "removeAllObjects");
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    obj = v116->_effectiveLayout;
    v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
    v112 = v55;
    v113 = v54;
    if (v56)
    {
      v57 = v56;
      v58 = 0;
      v59 = *(_QWORD *)v142;
      do
      {
        for (m = 0; m != v57; ++m)
        {
          if (*(_QWORD *)v142 != v59)
            objc_enumerationMutation(obj);
          v61 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * m);
          objc_msgSend(v61, "addLayoutViews:layoutGuides:constraintsToActivate:constraintsToDeactivate:", v116->_layoutViews, v116->_layoutGuides, v54, v55);
          if (!v58)
          {
            v139 = 0u;
            v140 = 0u;
            v137 = 0u;
            v138 = 0u;
            v62 = v116->_layoutViews;
            v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v137, &v156, 16);
            if (v63)
            {
              v64 = v63;
              v58 = 0;
              v65 = *(_QWORD *)v138;
              do
              {
                for (n = 0; n != v64; ++n)
                {
                  if (*(_QWORD *)v138 != v65)
                    objc_enumerationMutation(v62);
                  v67 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * n);
                  if (objc_msgSend(v61, "shouldHorizontallyCenterView:", v67))
                  {
                    v68 = v67;

                    v58 = v68;
                  }
                }
                v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v137, &v156, 16);
              }
              while (v64);
            }
            else
            {
              v58 = 0;
            }

            v55 = v112;
            v54 = v113;
          }
        }
        v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
      }
      while (v57);
    }
    else
    {
      v58 = 0;
    }

    *(_BYTE *)&v116->_buttonBarFlags &= 0xF1u;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v54);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v116->_layoutViews);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v116->_layoutGuides);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v72 = v108;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v133, &v152, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v134;
      do
      {
        for (ii = 0; ii != v74; ++ii)
        {
          if (*(_QWORD *)v134 != v75)
            objc_enumerationMutation(v72);
          v77 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * ii);
          if ((objc_msgSend(v70, "containsObject:", v77) & 1) == 0)
          {
            -[UIStackView removeArrangedSubview:](v116->_stackView, "removeArrangedSubview:", v77);
            objc_msgSend(v77, "removeFromSuperview");
          }
        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v133, &v152, 16);
      }
      while (v74);
    }

    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    obja = v110;
    v78 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, &v148, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v130;
      do
      {
        for (jj = 0; jj != v79; ++jj)
        {
          if (*(_QWORD *)v130 != v80)
            objc_enumerationMutation(obja);
          v82 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * jj);
          if ((objc_msgSend(v71, "containsObject:", v82) & 1) == 0)
            -[UIView removeLayoutGuide:](v116->_stackView, "removeLayoutGuide:", v82);
        }
        v79 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, &v148, 16);
      }
      while (v79);
    }
    v111 = v72;

    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v83 = v109;
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v125, v147, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v126;
      do
      {
        for (kk = 0; kk != v85; ++kk)
        {
          if (*(_QWORD *)v126 != v86)
            objc_enumerationMutation(v83);
          v88 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * kk);
          if ((objc_msgSend(v69, "containsObject:", v88) & 1) == 0)
            objc_msgSend(v88, "setActive:", 0);
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v125, v147, 16);
      }
      while (v85);
    }

    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v89 = v116->_layoutViews;
    v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v121, v146, 16);
    if (v90)
    {
      v91 = v90;
      v92 = 0;
      v93 = *(_QWORD *)v122;
      do
      {
        for (mm = 0; mm != v91; ++mm)
        {
          if (*(_QWORD *)v122 != v93)
            objc_enumerationMutation(v89);
          -[UIStackView insertArrangedSubview:atIndex:](v116->_stackView, "insertArrangedSubview:atIndex:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * mm), v92 + mm);
        }
        v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v121, v146, 16);
        v92 += mm;
      }
      while (v91);
    }

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v95 = v116->_layoutGuides;
    v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v117, v145, 16);
    if (v96)
    {
      v97 = v96;
      v98 = *(_QWORD *)v118;
      do
      {
        for (nn = 0; nn != v97; ++nn)
        {
          if (*(_QWORD *)v118 != v98)
            objc_enumerationMutation(v95);
          -[UIView addLayoutGuide:](v116->_stackView, "addLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * nn));
        }
        v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v117, v145, 16);
      }
      while (v97);
    }

    v100 = v113;
    objc_storeStrong((id *)&v116->_layoutActiveConstraints, v113);
    v101 = v112;
    if (v116->_centeredView)
      objc_msgSend(v112, "addObject:", v116->_centeringConstraint);
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v112);
    if (v58)
    {
      objc_msgSend(v58, "centerXAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](v116->_stackView, "centerXAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "constraintEqualToAnchor:", v103);
      v104 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      v100 = v113;
      LODWORD(v105) = 1144569856;
      -[NSLayoutConstraint setPriority:](v104, "setPriority:", v105);
      centeringConstraint = v116->_centeringConstraint;
      v116->_centeringConstraint = v104;
      v107 = v104;

      v101 = v112;
      objc_msgSend(v113, "addObject:", v116->_centeringConstraint);

    }
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v100);

    -[_UIButtonBar _enablePointerInteractions](v116, "_enablePointerInteractions");
    *(_BYTE *)&v116->_buttonBarFlags &= ~1u;
  }
}

- (double)_widthInfoForLayout:(uint64_t)a1
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0.0;
  if (a1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v7 = 0.0;
    v8 = 0.0;
    if (v6)
    {
      v9 = v6;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "recalculateLayoutWidthsGivenItemSpaceWidth:", *(double *)(a1 + 144));
          objc_msgSend(v12, "compactWidth");
          v14 = v13;
          objc_msgSend(v12, "group");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "_disabledExpansion");

          if (v16)
            objc_msgSend(v12, "compactWidth");
          else
            objc_msgSend(v12, "expandedWidth");
          v18 = v17;
          if (objc_msgSend(v12, "fixed"))
          {
            objc_msgSend(v12, "compactWidth");
            v8 = v8 + v19;
          }
          v7 = v7 + v14;
          v5 = v5 + v18;
        }
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (void)_enablePointerInteractions
{
  id WeakRetained;

  *(_BYTE *)&self->_buttonBarFlags &= ~0x10u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)_updateHitRects
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MinX;
  double MaxX;
  double v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v51 = (id)objc_opt_new();
  _addInteractiveLayouts(self->_effectiveLayout, v51, -[UIView _shouldReverseLayoutDirection](self->_stackView, "_shouldReverseLayoutDirection"));
  v3 = objc_msgSend(v51, "count");
  if (v3)
  {
    v4 = v3;
    -[UIView bounds](self->_stackView, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIView hitTestInsets](self->_stackView, "hitTestInsets");
    v14 = v6 + v13;
    v16 = v8 + v15;
    v18 = v10 - (v13 + v17);
    v20 = v12 - (v15 + v19);
    v52.origin.x = v14;
    v52.origin.y = v16;
    v52.size.width = v18;
    v52.size.height = v20;
    MinX = CGRectGetMinX(v52);
    v53.origin.x = v14;
    v53.origin.y = v16;
    v53.size.width = v18;
    v53.size.height = v20;
    MaxX = CGRectGetMaxX(v53);
    v23 = MaxX;
    if (v4 == 1)
    {
      objc_msgSend(v51, "firstObject");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isCustomViewItem") & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v24, "view");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      _configureInsets(v25, MinX, v23);
LABEL_13:

      goto LABEL_14;
    }
    if (v4 >= 2)
    {
      v49 = MaxX;
      objc_msgSend(v51, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _viewRepresentingItem(v26, self->_stackView);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v24 = 0;
      v28 = 1;
      do
      {
        v50 = MinX;
        objc_msgSend(v51, "objectAtIndexedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        _viewRepresentingItem(v29, self->_stackView);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "frame");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;
        objc_msgSend(v30, "frame");
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v54.origin.x = v32;
        v54.origin.y = v34;
        v54.size.width = v36;
        v54.size.height = v38;
        v47 = CGRectGetMaxX(v54);
        v55.origin.x = v40;
        v55.origin.y = v42;
        v55.size.width = v44;
        v55.size.height = v46;
        v48 = (v47 + CGRectGetMinX(v55)) * 0.5;
        if ((objc_msgSend(v26, "isCustomViewItem") & 1) == 0)
          _configureInsets(v27, v50, v48);
        v25 = v30;

        v24 = v29;
        ++v28;
        v27 = v25;
        v26 = v24;
        MinX = v48;
      }
      while (v4 != v28);
      if ((objc_msgSend(v24, "isCustomViewItem") & 1) == 0)
        _configureInsets(v25, v48, v49);

      goto LABEL_13;
    }
  }
LABEL_15:

}

- (void)_buttonBarStackViewDidLayoutSubviews:(id)a3
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needsLayout");

  if ((v5 & 1) == 0)
  {
    -[_UIButtonBar delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonBarDidLayout:", self);

  }
}

- (_UIButtonBarDelegate)delegate
{
  return (_UIButtonBarDelegate *)objc_loadWeakRetained((id *)&self->_targetLayoutWidth);
}

- (UIView)_viewForOverlayRects
{
  void *v3;
  _UIButtonBarStackView *stackView;
  UIView *v5;

  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  stackView = (_UIButtonBarStackView *)objc_msgSend(v3, "count");
  if (stackView)
    stackView = self->_stackView;
  v5 = stackView;

  return v5;
}

- (void)setItemDistribution:(int64_t)a3
{
  NSMutableArray *v5;
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
  if (-[UIStackView distribution](self->_stackView, "distribution") != a3)
  {
    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", a3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_groupLayouts;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setSuppressSpacing:", a3 != 0, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
}

- (void)setFixedTrailingGroups:(id)a3
{
  id v4;
  _UIButtonBarDelegate *v5;
  _UIButtonBarDelegate *v6;
  char v7;
  _UIButtonBarDelegate *v8;
  _UIButtonBarDelegate *delegate;
  _UIButtonBarDelegate *v10;

  v4 = a3;
  v5 = self->_delegate;
  v6 = (_UIButtonBarDelegate *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[_UIButtonBarDelegate isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    _UIButtonBarClearOwners(self->_delegate, self);
    v8 = (_UIButtonBarDelegate *)-[_UIButtonBarDelegate copy](v10, "copy");
    delegate = self->_delegate;
    self->_delegate = v8;

    _UIButtonBarSetOwners(self->_delegate, self);
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
LABEL_9:

}

- (void)dealloc
{
  objc_super v3;

  _UIButtonBarClearOwners(*(void **)&self->_minimumInterItemSpace, self);
  _UIButtonBarClearOwners(self->_fixedTrailingGroups, self);
  _UIButtonBarClearOwners(self->_delegate, self);
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_layoutActiveConstraints);
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBar;
  -[_UIButtonBar dealloc](&v3, sel_dealloc);
}

- (_UIButtonBar)initWithCoder:(id)a3
{
  id v4;
  _UIButtonBar *v5;
  _UIButtonBar *v6;
  void *v7;
  uint64_t v8;
  double minimumInterItemSpace;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIButtonBar;
  v5 = -[_UIButtonBar init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    _UIButtonBarCommonInit(v5);
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIButtonBarGroups"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    minimumInterItemSpace = v6->_minimumInterItemSpace;
    *(_QWORD *)&v6->_minimumInterItemSpace = v8;

    _UIButtonBarSetOwners(*(void **)&v6->_minimumInterItemSpace, v6);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double minimumInterItemSpace;

  minimumInterItemSpace = self->_minimumInterItemSpace;
  if (minimumInterItemSpace != 0.0)
    objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)&minimumInterItemSpace, CFSTR("UIButtonBarGroups"));
}

- (void)setItemsInGroupUseSameSize:(BOOL)a3
{
  NSMutableArray *v4;
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
  if (LOBYTE(self->_barButtonGroups) != a3)
  {
    LOBYTE(self->_barButtonGroups) = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_groupLayouts;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setUseGroupSizing:", LOBYTE(self->_barButtonGroups), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
}

- (BOOL)allowsViewWrappers
{
  return -[_UIButtonBarLayoutMetrics allowsViewWrappers](self->_layoutMetrics, "allowsViewWrappers");
}

- (int64_t)itemDistribution
{
  return -[UIStackView distribution](self->_stackView, "distribution");
}

- (UIEdgeInsets)hitTestInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIView hitTestInsets](self->_stackView, "hitTestInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)hitTestDirectionalInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[UIView hitTestDirectionalInsets](self->_stackView, "hitTestDirectionalInsets");
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (BOOL)hasVisibleContent
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  int v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_UIButtonBar groupRealizedOrder](self, "groupRealizedOrder");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    v5 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = 0;
        v12 = &v11;
        v13 = 0x2020000000;
        v14 = 0;
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __33___UIButtonBar_hasVisibleContent__block_invoke;
        v10[3] = &unk_1E16B5610;
        v10[4] = &v11;
        -[UIBarButtonItemGroup enumerateVisibleItems:](v7, v10);
        v8 = *((unsigned __int8 *)v12 + 24);
        _Block_object_dispose(&v11, 8);
        if (v8)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasAlwaysOverflowGroups
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!BYTE3(self->_barButtonGroups))
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39___UIButtonBar_hasAlwaysOverflowGroups__block_invoke;
  v4[3] = &unk_1E16B5638;
  v4[4] = &v5;
  -[_UIButtonBar _enumerateAllGroups:](self, "_enumerateAllGroups:", v4);
  v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSArray)elementsForOverflowMenu
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  char v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = self->_effectiveLayout;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "spilled") & 1) == 0)
        {
          objc_msgSend(v9, "group");
          v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            v12 = 0;
            goto LABEL_10;
          }
          v11 = v10[24];

          if ((v11 & 8) == 0)
            goto LABEL_11;
        }
        objc_msgSend(v9, "group");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);
LABEL_10:

LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v6 = v13;
    }
    while (v13);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __39___UIButtonBar_elementsForOverflowMenu__block_invoke;
  v27[3] = &unk_1E16B5660;
  v14 = v3;
  v28 = v14;
  -[_UIButtonBar _enumerateAllGroups:](self, "_enumerateAllGroups:", v27);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        -[UIBarButtonItemGroup _effectiveMenuRepresentation](*(_QWORD **)(*((_QWORD *)&v23 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21, (_QWORD)v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v18);
  }

  return (NSArray *)v15;
}

- (NSArray)elementsRepresentingOrderedGroups
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[_UIButtonBar groupRealizedOrder](self, "groupRealizedOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[UIBarButtonItemGroup _effectiveMenuRepresentation](*(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9, (_QWORD)v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)itemAtPoint:(CGPoint)a3 inView:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15;
  v20 = __Block_byref_object_dispose__15;
  v21 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35___UIButtonBar_itemAtPoint_inView___block_invoke;
  v11[3] = &unk_1E16B5688;
  v8 = v7;
  v14 = x;
  v15 = y;
  v12 = v8;
  v13 = &v16;
  -[_UIButtonBar _forwardEnumerateVisibleItems:](self, v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (UIBarButtonItem)trailingClippingItem
{
  id v2;
  _QWORD v4[6];
  _QWORD v5[3];
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36___UIButtonBar_trailingClippingItem__block_invoke;
  v4[3] = &unk_1E16B5700;
  v4[4] = &v7;
  v4[5] = v5;
  -[_UIButtonBar _reverseEnumerateVisibleItems:](self, v4);
  v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);

  return (UIBarButtonItem *)v2;
}

- (void)_enumerateAllGroups:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *defaultActionFilter;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _UIButtonBarDelegate *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  void (**v30)(id, _QWORD, uint64_t);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = self->_fixedTrailingGroups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  defaultActionFilter = (id *)self->_defaultActionFilter;
  if (defaultActionFilter)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __36___UIButtonBar__enumerateAllGroups___block_invoke;
    v29[3] = &unk_1E16B5728;
    v30 = v4;
    -[_UIButtonBarGroupOrderer enumerateSourceGroups:](defaultActionFilter, v29);
    v11 = v30;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = *(id *)&self->_minimumInterItemSpace;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15++), 0);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      }
      while (v13);
    }
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_delegate;
  v17 = -[_UIButtonBarDelegate countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), 1);
      }
      while (v18 != v20);
      v18 = -[_UIButtonBarDelegate countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    }
    while (v18);
  }

}

- (void)_validateAllItems
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)&self->_minimumInterItemSpace;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_validateAllItems", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)doneItemAppearanceNeedsUpdate
{
  return (*(_BYTE *)&self->_buttonBarFlags >> 3) & 1;
}

- (void)_itemDidChangeWidth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "buttonGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBar _layoutForGroup:](self, "_layoutForGroup:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutsForSpacerItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setDirty:", 1);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
  }
  else
  {
    objc_msgSend(v6, "layoutForBarButtonItem:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDirty:", 1);
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");

  }
}

- (void)_itemDidChangeSelectionState:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  _UIButtonBarButtonFromItem(v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "setSelected:", objc_msgSend(v4, "isSelected"));

}

- (void)_itemDidChangeHiddenState:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "buttonGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBar _layoutForGroup:](self, "_layoutForGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDirty:", 1);

  -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
}

- (BOOL)_item:(id)a3 addSymbolEffect:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  _UIButtonBarButtonFromItem(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "addSymbolEffect:options:animated:", v9, v10, v6);

  return v12 == 0;
}

- (BOOL)_item:(id)a3 removeSymbolEffectOfType:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  _UIButtonBarButtonFromItem(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "removeSymbolEffectOfType:options:animated:", v9, v10, v6);

  return v12 == 0;
}

- (BOOL)_item:(id)a3 removeAllSymbolEffectsWithOptions:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  _UIButtonBarButtonFromItem(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "removeAllSymbolEffectsWithOptions:animated:", v7, v5);

  return v9 == 0;
}

- (void)_item:(id)a3 applyContentTransition:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  _UIButtonBarButtonFromItem(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "applyContentTransition:options:", v10, v7);

}

- (id)_overflowFallbackItem
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  char v10;
  uint64_t v11;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_effectiveLayout;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "spilled", (_QWORD)v14) & 1) != 0
          || (objc_msgSend(v8, "group"), (v9 = (_BYTE *)objc_claimAutoreleasedReturnValue()) != 0)
          && (v10 = v9[24], v9, (v10 & 8) != 0))
        {
          WeakRetained = objc_loadWeakRetained(&self->_viewUpdater);
          goto LABEL_16;
        }
        ++v7;
      }
      while (v5 != v7);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v5 = v11;
      WeakRetained = 0;
    }
    while (v11);
  }
  else
  {
    WeakRetained = 0;
  }
LABEL_16:

  return WeakRetained;
}

- (void)_groupDidUpdateRepresentative:(id)a3 fromRepresentative:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "_relinquishOwnership:", self);
  objc_msgSend(v6, "representativeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setViewOwner:", self);

  -[_UIButtonBar _layoutForGroup:](self, "_layoutForGroup:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDirty:", 1);
  -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
}

- (id)_groupOrdererGroups:(id)a3
{
  if (self->_defaultActionFilter == a3)
    return *(id *)&self->_minimumInterItemSpace;
  else
    return 0;
}

- (void)_groupOrdererDidUpdate:(id)a3
{
  if (self->_defaultActionFilter == a3)
    -[_UIButtonBar _setNeedsVisualUpdate](self, "_setNeedsVisualUpdate");
}

- (void)_invalidateAssistant:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
  objc_msgSend(WeakRetained, "invalidate");

}

- (CGRect)_preferredRegionRectForButton:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "_buttonBarHitRect");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  _UIButtonBarStackView *v9;
  _UIButtonBarStackView *v10;
  _UIButtonBarStackView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v7 = a3;
  v8 = a4;
  if ((*(_BYTE *)&self->_buttonBarFlags & 0x10) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "request:locationInView:", v8, self->_stackView);
      -[UIView hitTest:withEvent:](self->_stackView, "hitTest:withEvent:", 0);
      v9 = (_UIButtonBarStackView *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        if (v9 != self->_stackView)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || -[UIView isEnabled](v10, "isEnabled"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = v10;
              -[_UIButtonBar _preferredRegionRectForButton:](self, "_preferredRegionRectForButton:", v11);
              objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v11, CFSTR("com.apple.UIKit.UIButtonBar._UIButtonBarButton"), -[_UIButtonBarStackView isSelected](v11, "isSelected"), v12, v13, v14, v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
              goto LABEL_14;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[UIView bounds](v10, "bounds");
              objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v10, CFSTR("com.apple.UIKit.UIButtonBar.UIButton"), -[_UIButtonBarStackView isSelected](v10, "isSelected"), v17, v18, v19, v20);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            }
          }
        }
      }
      v16 = 0;
      goto LABEL_13;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = (id *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIPointerAssistantRegion targetView](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "pointerInteraction:styleForRegion:", v5, v6);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v9 = (void *)v8;
LABEL_10:

        goto LABEL_11;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "createStyleForButton:shapeProvider:", v7, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v9 = 0;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  -[_UIPointerAssistantRegion targetView]((id *)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "visualProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = v7;
      objc_msgSend(v7, "pointerWillEnter:", v9);

      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "_visualProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  -[_UIPointerAssistantRegion targetView]((id *)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "visualProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = v7;
      objc_msgSend(v7, "pointerWillExit:", v9);

      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "_visualProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _UIBarButtonItemData *doneItemAppearance;
  const __CFString *v8;
  _UIPointerInteractionAssistant *assistant;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)_UIButtonBar;
  -[_UIButtonBar description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@\n"), v4, self->_stackView);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(_BYTE *)&self->_buttonBarFlags & 2) != 0)
    v6 = CFSTR(" needsAppearanceUpdate");
  else
    v6 = &stru_1E16EDF20;
  objc_msgSend(v5, "appendFormat:", CFSTR("metrics=%p layout=%p groupLayouts=%p views=%p guides=%p activeConstraints=%p minimumInterItemSpace=%.3f minimumInterItemSpaceAnchor=%p flexibleSpaceEqualSizeAnchor=%p %@\n"), self->_layoutMetrics, self->_effectiveLayout, self->_groupLayoutMap, self->_layoutViews, self->_layoutGuides, self->_layoutActiveConstraints, self->_fixedLeadingGroups, self->_minimumInterItemSpaceConstraint, self->_flexibleSpaceEqualSizeAnchor, v6);
  doneItemAppearance = self->_doneItemAppearance;
  if (doneItemAppearance)
  {
    if ((*(_BYTE *)&self->_buttonBarFlags & 4) != 0)
      v8 = CFSTR("needsUpdate ");
    else
      v8 = &stru_1E16EDF20;
    objc_msgSend(v5, "appendFormat:", CFSTR("%@plainItemAppearance=%@\n"), v8, doneItemAppearance);
  }
  assistant = self->_assistant;
  if (assistant)
  {
    if ((*(_BYTE *)&self->_buttonBarFlags & 8) != 0)
      v10 = CFSTR("needsUpdate ");
    else
      v10 = &stru_1E16EDF20;
    objc_msgSend(v5, "appendFormat:", CFSTR("%@doneItemAppearance=%@\n"), v10, assistant);
  }
  if (-[NSArray count](self->_fixedTrailingGroups, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_fixedTrailingGroups, "componentsJoinedByString:", CFSTR("\n"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("fixedLeadingGroups={\n%@\n} "), v11);

  }
  if (objc_msgSend(*(id *)&self->_minimumInterItemSpace, "count"))
  {
    objc_msgSend(*(id *)&self->_minimumInterItemSpace, "componentsJoinedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("barButtonGroups={\n%@\n} "), v12);

  }
  if (-[_UIButtonBarDelegate count](self->_delegate, "count"))
  {
    -[_UIButtonBarDelegate componentsJoinedByString:](self->_delegate, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("fixedTrailingGroups={\n%@\n} "), v13);

  }
  return (NSString *)v5;
}

- (double)minimumInterItemSpace
{
  return *(double *)&self->_fixedLeadingGroups;
}

- (NSArray)fixedLeadingGroups
{
  return self->_fixedTrailingGroups;
}

- (NSArray)fixedTrailingGroups
{
  return (NSArray *)self->_delegate;
}

- (double)targetLayoutWidth
{
  return *(double *)&self->_groupOrderer;
}

- (BOOL)itemsInGroupUseSameSize
{
  return (BOOL)self->_barButtonGroups;
}

- (BOOL)forceFixedSpacing
{
  return BYTE1(self->_barButtonGroups);
}

- (BOOL)supportsOverflow
{
  return BYTE2(self->_barButtonGroups);
}

- (_UIButtonBarGroupOrderer)groupOrderer
{
  return (_UIButtonBarGroupOrderer *)self->_defaultActionFilter;
}

- (BOOL)supportsAlwaysOverflowGroups
{
  return BYTE3(self->_barButtonGroups);
}

- (void)setSupportsAlwaysOverflowGroups:(BOOL)a3
{
  BYTE3(self->_barButtonGroups) = a3;
}

- (id)defaultActionFilter
{
  return self->__appearanceDelegate;
}

- (void)setDefaultActionFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return (_UIBarButtonItemData *)self->_assistant;
}

- (_UIPointerInteractionAssistant)assistant
{
  return (_UIPointerInteractionAssistant *)objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
}

- (UIBarButtonItem)popOverPresentingSourceItem
{
  return (UIBarButtonItem *)objc_loadWeakRetained(&self->_viewUpdater);
}

- (void)setPopOverPresentingSourceItem:(id)a3
{
  objc_storeWeak(&self->_viewUpdater, a3);
}

- (id)viewUpdater
{
  return self[1].super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_destroyWeak(&self->_viewUpdater);
  objc_destroyWeak((id *)&self->_popOverPresentingSourceItem);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_doneItemAppearance, 0);
  objc_destroyWeak((id *)&self->_plainItemAppearance);
  objc_storeStrong((id *)&self->__appearanceDelegate, 0);
  objc_storeStrong(&self->_defaultActionFilter, 0);
  objc_destroyWeak((id *)&self->_targetLayoutWidth);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_fixedTrailingGroups, 0);
  objc_storeStrong((id *)&self->_minimumInterItemSpace, 0);
  objc_storeStrong((id *)&self->_senderActionMap, 0);
  objc_storeStrong((id *)&self->_layoutActiveConstraints, 0);
  objc_storeStrong((id *)&self->_layoutGuides, 0);
  objc_storeStrong((id *)&self->_layoutViews, 0);
  objc_storeStrong((id *)&self->_groupLayoutMap, 0);
  objc_storeStrong((id *)&self->_effectiveLayout, 0);
  objc_storeStrong((id *)&self->_groupLayouts, 0);
  objc_storeStrong((id *)&self->_layoutMetrics, 0);
  objc_storeStrong((id *)&self->_centeringConstraint, 0);
  objc_storeStrong((id *)&self->_centeredView, 0);
  objc_storeStrong((id *)&self->_minimumInterItemSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_minimumInterItemSpaceAnchor, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceEqualSizeAnchor, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
