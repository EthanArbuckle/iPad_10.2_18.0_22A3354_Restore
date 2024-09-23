@implementation _UIButtonBarItemGroupLayout

- (UIBarButtonItemGroup)group
{
  return self->_group;
}

- (void)setLeadingSpacerType:(int64_t)a3
{
  if (self->_leadingSpacerType != a3)
  {
    self->_leadingSpacerType = a3;
    -[_UIButtonBarLayout setDirty:](self, "setDirty:", 1);
  }
}

- (void)setSuppressSpacing:(BOOL)a3
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
  if (self->_suppressSpacing != a3)
  {
    self->_suppressSpacing = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_itemLayouts;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setSuppressSpacing:", self->_suppressSpacing, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[_UIButtonBarLayout setDirty:](self, "setDirty:", 1);
  }
}

- (void)setSuppressCustomSpacing:(BOOL)a3
{
  if (self->_suppressCustomSpacing != a3)
  {
    self->_suppressCustomSpacing = a3;
    -[_UIButtonBarLayout setDirty:](self, "setDirty:", 1);
  }
}

- (void)setFixed:(BOOL)a3
{
  self->_fixed = a3;
}

- (void)dirtyLayoutForPlainAppearanceChange:(BOOL)a3 doneAppearanceChanged:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[_UIButtonBarLayout dirtyLayoutForPlainAppearanceChange:doneAppearanceChanged:](self->_representativeLayout, "dirtyLayoutForPlainAppearanceChange:doneAppearanceChanged:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_itemLayouts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "dirtyLayoutForPlainAppearanceChange:doneAppearanceChanged:", v5, v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)setUseGroupSizing:(BOOL)a3
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
  if (self->_useGroupSizing != a3)
  {
    self->_useGroupSizing = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_itemLayouts;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setUseGroupSizing:", self->_useGroupSizing, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setItemViewGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)_addLayoutViews:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47___UIButtonBarItemGroupLayout__addLayoutViews___block_invoke;
  v6[3] = &unk_1E16B5948;
  v7 = v4;
  v5 = v4;
  -[_UIButtonBarItemGroupLayout _iterateConfiguredLayouts:](self, "_iterateConfiguredLayouts:", v6);

}

- (void)_iterateConfiguredLayouts:(id)a3
{
  void (**v4)(id, _UIButtonBarSpacerLayout *);
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
  v4 = (void (**)(id, _UIButtonBarSpacerLayout *))a3;
  if (self->_spilled)
    goto LABEL_16;
  if (self->_leadingSpacerType)
  {
    if (self->_compact)
    {
      if (!self->_representativeLayout)
        goto LABEL_6;
      goto LABEL_5;
    }
    if (-[NSMutableArray count](self->_configuredItemLayouts, "count"))
LABEL_5:
      v4[2](v4, self->_leadingSpacerLayout);
  }
LABEL_6:
  if (self->_compact)
  {
    v4[2](v4, (_UIButtonBarSpacerLayout *)self->_representativeLayout);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_configuredItemLayouts;
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
          v4[2](v4, *(_UIButtonBarSpacerLayout **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
LABEL_16:

}

- (void)recalculateLayoutWidthsGivenItemSpaceWidth:(double)a3
{
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  double v16;
  double v17;
  _UIButtonBarLayout *representativeLayout;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[_UIButtonBarLayout configure](self, "configure");
  if (self->_leadingSpacerType == 1)
  {
    -[_UIButtonBarSpacerLayout minimumLayoutWidthGivenMinimumSpaceWidth:](self->_leadingSpacerLayout, "minimumLayoutWidthGivenMinimumSpaceWidth:", a3);
    v6 = v5;
    v7 = -[NSMutableArray count](self->_configuredItemLayouts, "count");
    v8 = 0.0;
    if (v7)
      v9 = v6;
    else
      v9 = 0.0;
    self->_expandedWidth = v9;
    if (self->_representativeLayout)
      v8 = v6;
    self->_compactWidth = v8;
  }
  else
  {
    self->_expandedWidth = 0.0;
    self->_compactWidth = 0.0;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = self->_configuredItemLayouts;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "minimumLayoutWidthGivenMinimumSpaceWidth:", a3, (_QWORD)v20);
        self->_expandedWidth = v15 + self->_expandedWidth;
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[UIBarButtonItemGroup _contextualExpandedPadding](self->_group, "_contextualExpandedPadding");
  v17 = v16 + self->_expandedWidth;
  self->_expandedWidth = v17;
  representativeLayout = self->_representativeLayout;
  if (representativeLayout)
  {
    -[_UIButtonBarLayout minimumLayoutWidthGivenMinimumSpaceWidth:](representativeLayout, "minimumLayoutWidthGivenMinimumSpaceWidth:", a3);
    v17 = v19 + self->_compactWidth;
  }
  self->_compactWidth = v17;
}

- (void)_configure
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _UIButtonBarLayout *v7;
  _UIButtonBarLayout *representativeLayout;
  _UIButtonBarLayout *v9;
  _UIButtonBarLayout *v10;
  _UIButtonBarLayout *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _UIButtonBarSpacerLayout *leadingSpacerLayout;
  void *v29;
  _UIButtonBarSpacerLayout *v30;
  _UIButtonBarSpacerLayout *v31;
  void *v32;
  uint64_t v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = 32;
  -[NSMutableArray removeAllObjects](self->_itemLayouts, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_configuredItemLayouts, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIBarButtonItemGroup _canCollapse]((_BOOL8)self->_group)
    && (-[UIBarButtonItemGroup representativeItem](self->_group, "representativeItem"),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    -[NSMapTable objectForKey:](self->_itemLayoutMap, "objectForKey:", v5);
    v7 = (_UIButtonBarLayout *)objc_claimAutoreleasedReturnValue();
    representativeLayout = self->_representativeLayout;
    self->_representativeLayout = v7;

    if (!self->_representativeLayout)
    {
      v9 = -[_UIButtonBarItemGroupLayout _newLayoutForBarButtonItem:useGroupSizing:](self, "_newLayoutForBarButtonItem:useGroupSizing:", v6, 0);
      v10 = self->_representativeLayout;
      self->_representativeLayout = v9;

      objc_msgSend(v4, "setObject:forKey:", self->_representativeLayout, v6);
    }
  }
  else
  {
    v11 = self->_representativeLayout;
    self->_representativeLayout = 0;

    v6 = 0;
  }
  v32 = v6;
  -[UIBarButtonItemGroup _items]((id *)&self->_group->super.isa);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v12)
  {
    v35 = 0;
    v19 = 24;
    goto LABEL_31;
  }
  v13 = v12;
  v35 = 0;
  v14 = *(_QWORD *)v37;
  v15 = 0x1ECD45000uLL;
  v33 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v37 != v14)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v18 = objc_msgSend(v17, "isSpaceItem");
      v19 = *(int *)(v15 + 3688);
      if (v18)
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v19), "removeObjectForKey:", v17);
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v19), "objectForKey:", v17);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (!v20)
        v20 = -[_UIButtonBarItemGroupLayout _newLayoutForBarButtonItem:useGroupSizing:](self, "_newLayoutForBarButtonItem:useGroupSizing:", v17, self->_useGroupSizing);
      objc_msgSend(v4, "setObject:forKey:", v20, v17);
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "addObject:", v20);
      objc_msgSend(v20, "setDirty:", 1);
      if ((objc_msgSend(v17, "isHidden") & 1) == 0)
      {
        v21 = v15;
        v22 = v3;
        v23 = v4;
        if (self->_suppressSpacing || self->_suppressCustomSpacing)
        {
          if ((objc_msgSend(v17, "isSpaceItem") & 1) == 0)
          {
            v24 = v35;
            if (self->_suppressSpacing || !v35)
              goto LABEL_25;
            goto LABEL_23;
          }
        }
        else
        {
          v24 = v35;
          if (!v35)
            goto LABEL_25;
LABEL_23:
          -[_UIButtonBarLayoutMetricsData _upcastIfReadOnly](self->super._layoutMetrics, "_upcastIfReadOnly");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIButtonBarSpacerLayout spacerForLayoutMetrics:betweenLayout:andLayout:](_UIButtonBarSpacerLayout, "spacerForLayoutMetrics:betweenLayout:andLayout:", v25, v35, v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v35;
          if (v26)
          {
            -[NSMutableArray addObject:](self->_configuredItemLayouts, "addObject:", v26);

          }
LABEL_25:
          -[NSMutableArray addObject:](self->_configuredItemLayouts, "addObject:", v20);
          v27 = v20;

          v35 = v27;
        }
        v4 = v23;
        v3 = v22;
        v15 = v21;
        v14 = v33;
      }

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v13);
LABEL_31:
  objc_storeStrong((id *)((char *)&self->super.super.isa + v19), v4);
  if (self->_leadingSpacerType)
  {
    leadingSpacerLayout = self->_leadingSpacerLayout;
    -[_UIButtonBarLayoutMetricsData _upcastIfReadOnly](self->super._layoutMetrics, "_upcastIfReadOnly");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIButtonBarSpacerLayout _updateSpacer:layoutMetrics:spacerType:](_UIButtonBarSpacerLayout, "_updateSpacer:layoutMetrics:spacerType:", leadingSpacerLayout, v29, self->_leadingSpacerType);
    v30 = (_UIButtonBarSpacerLayout *)objc_claimAutoreleasedReturnValue();
    v31 = self->_leadingSpacerLayout;
    self->_leadingSpacerLayout = v30;

  }
}

- (id)_newLayoutForBarButtonItem:(id)a3 useGroupSizing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _UIButtonBarSpacerLayout *v7;
  void *v8;
  _UIButtonBarSpacerLayout *v9;
  _UIButtonBarItemLayout *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isSystemItem") && (unint64_t)(objc_msgSend(v6, "systemItem") - 5) <= 1)
  {
    v7 = [_UIButtonBarSpacerLayout alloc];
    -[_UIButtonBarLayoutMetricsData _upcastIfReadOnly](self->super._layoutMetrics, "_upcastIfReadOnly");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIButtonBarSpacerLayout initWithLayoutMetrics:barButtonItem:](v7, "initWithLayoutMetrics:barButtonItem:", v8, v6);

  }
  else
  {
    v10 = [_UIButtonBarItemLayout alloc];
    -[_UIButtonBarLayoutMetricsData _upcastIfReadOnly](self->super._layoutMetrics, "_upcastIfReadOnly");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIButtonBarItemLayout initWithLayoutMetrics:barButtonItem:](v10, "initWithLayoutMetrics:barButtonItem:", v11, v6);

    -[_UIButtonBarLayout setUseGroupSizing:](v9, "setUseGroupSizing:", v4);
    -[_UIButtonBarSpacerLayout setItemViewGenerator:](v9, "setItemViewGenerator:", self->_itemViewGenerator);
  }

  return v9;
}

- (BOOL)suppressSpacing
{
  return self->_suppressSpacing;
}

- (BOOL)isSpaceLayout
{
  _UIButtonBarLayout *v2;
  _UIButtonBarLayout *v3;
  BOOL v4;

  if (self->_compact)
  {
    v2 = self->_representativeLayout;
  }
  else
  {
    -[NSMutableArray lastObject](self->_configuredItemLayouts, "lastObject");
    v2 = (_UIButtonBarLayout *)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  v4 = -[_UIButtonBarLayout isSpaceLayout](v2, "isSpaceLayout");

  return v4;
}

- (id)layoutForBarButtonItem:(id)a3
{
  id v4;
  UIBarButtonItemGroup *v5;
  UIBarButtonItemGroup *group;
  id v7;
  NSMutableArray *v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isSpaceItem") & 1) == 0
    && (objc_msgSend(v4, "buttonGroup"),
        v5 = (UIBarButtonItemGroup *)objc_claimAutoreleasedReturnValue(),
        group = self->_group,
        v5,
        v5 == group))
  {
    -[NSMapTable objectForKey:](self->_itemLayoutMap, "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = self->_itemLayouts;
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v10 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v9);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v12, "barButtonItem", (_QWORD)v14);
            v13 = (id)objc_claimAutoreleasedReturnValue();

            if (v13 == v4)
            {
              v7 = v12;
              goto LABEL_16;
            }
          }
          v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UIButtonBarItemGroupLayout)initWithLayoutMetrics:(id)a3 barButtonItemGroup:(id)a4
{
  id v7;
  id v8;
  UILayoutGuide *v9;
  void *v10;
  UILayoutGuide *v11;
  void *v12;
  _UIButtonBarItemGroupLayout *v13;
  _UIButtonBarItemGroupLayout *v14;
  NSMutableArray *v15;
  NSMutableArray *itemLayouts;
  NSMutableArray *v17;
  NSMutableArray *configuredItemLayouts;
  objc_super v20;
  _QWORD v21[4];
  UILayoutGuide *v22;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(UILayoutGuide);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIButtonBar.sizingGuide.%p"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide setIdentifier:](v9, "setIdentifier:", v10);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72___UIButtonBarItemGroupLayout_initWithLayoutMetrics_barButtonItemGroup___block_invoke;
  v21[3] = &unk_1E16B5920;
  v11 = v9;
  v22 = v11;
  v12 = (void *)objc_msgSend(v8, "_copyWithModifications:", v21);

  v20.receiver = self;
  v20.super_class = (Class)_UIButtonBarItemGroupLayout;
  v13 = -[_UIButtonBarLayout initWithLayoutMetrics:](&v20, sel_initWithLayoutMetrics_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_group, a4);
    objc_storeStrong((id *)&v14->_groupSizeGuide, v9);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    itemLayouts = v14->_itemLayouts;
    v14->_itemLayouts = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    configuredItemLayouts = v14->_configuredItemLayouts;
    v14->_configuredItemLayouts = v17;

  }
  return v14;
}

- (double)compactWidth
{
  return self->_compactWidth;
}

- (BOOL)fixed
{
  return self->_fixed;
}

- (double)expandedWidth
{
  return self->_expandedWidth;
}

- (BOOL)shouldHorizontallyCenterView:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_itemLayouts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "shouldHorizontallyCenterView:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setSpilled:(BOOL)a3
{
  BOOL v3;

  v3 = a3 && !self->_fixed;
  self->_spilled = v3;
}

- (void)setCompact:(BOOL)a3
{
  BOOL v4;

  v4 = a3 && -[UIBarButtonItemGroup _canCollapse]((_BOOL8)self->_group);
  self->_compact = v4;
}

- (void)_addLayoutGuides:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_useGroupSizing && !self->_compact)
    objc_msgSend(v4, "addObject:", self->_groupSizeGuide);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___UIButtonBarItemGroupLayout__addLayoutGuides___block_invoke;
  v7[3] = &unk_1E16B5948;
  v8 = v5;
  v6 = v5;
  -[_UIButtonBarItemGroupLayout _iterateConfiguredLayouts:](self, "_iterateConfiguredLayouts:", v7);

}

- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70___UIButtonBarItemGroupLayout__addConstraintsToActivate_toDeactivate___block_invoke;
  v10[3] = &unk_1E16B5970;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_UIButtonBarItemGroupLayout _iterateConfiguredLayouts:](self, "_iterateConfiguredLayouts:", v10);

}

- (BOOL)critical
{
  return self->_critical;
}

- (id)subLayouts
{
  NSMutableArray *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_compact)
  {
    v4[0] = self->_representativeLayout;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_configuredItemLayouts;
  }
  return v2;
}

- (BOOL)isGroupLayout
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemViewGenerator, 0);
  objc_storeStrong((id *)&self->_groupSizeGuide, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_leadingSpacerLayout, 0);
  objc_storeStrong((id *)&self->_representativeLayout, 0);
  objc_storeStrong((id *)&self->_configuredItemLayouts, 0);
  objc_storeStrong((id *)&self->_itemLayouts, 0);
  objc_storeStrong((id *)&self->_itemLayoutMap, 0);
}

- (_UIButtonBarItemGroupLayout)initWithLayoutMetrics:(id)a3
{
  -[_UIButtonBarItemGroupLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)layoutsForSpacerItem:(id)a3
{
  id v4;
  UIBarButtonItemGroup *v5;
  UIBarButtonItemGroup *v6;
  id v7;
  UIBarButtonItemGroup *v9;
  UIBarButtonItemGroup *group;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isSpaceItem")
    && (objc_msgSend(v4, "buttonGroup"),
        v5 = (UIBarButtonItemGroup *)objc_claimAutoreleasedReturnValue(),
        v6 = self->_group,
        v5,
        v5 == v6))
  {
    objc_msgSend(v4, "_owningButtonGroup");
    v9 = (UIBarButtonItemGroup *)objc_claimAutoreleasedReturnValue();
    group = self->_group;

    if (v9 == group)
    {
      v23[0] = self->_representativeLayout;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = self->_itemLayouts;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v16, "barButtonItem", (_QWORD)v18);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            if (v17 == v4)
              objc_msgSend(v7, "addObject:", v16);
          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_UIButtonBarLayout configure](self, "configure");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_configuredItemLayouts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "minimumLayoutWidthGivenMinimumSpaceWidth:", a3, (_QWORD)v13);
        v9 = v9 + v11;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (id)_itemLayouts
{
  return self->_itemLayouts;
}

- (id)_representativeLayout
{
  return self->_representativeLayout;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)_UIButtonBarItemGroupLayout;
  -[_UIButtonBarLayout description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_useGroupSizing)
    objc_msgSend(v4, "appendString:", CFSTR(" useGroupSizing"));
  if (self->_compact)
    objc_msgSend(v4, "appendString:", CFSTR(" compact"));
  if (self->_spilled)
    objc_msgSend(v4, "appendString:", CFSTR(" spilled"));
  objc_msgSend(v4, "appendFormat:", CFSTR(" group=%p groupSizingGuide=%p\n"), self->_group, self->_groupSizeGuide);
  if (self->_leadingSpacerType && self->_leadingSpacerLayout)
    objc_msgSend(v4, "appendFormat:", CFSTR("\tleadingSpacer=%@\n"), self->_leadingSpacerLayout);
  if (-[UIBarButtonItemGroup _canCollapse]((_BOOL8)self->_group))
  {
    -[UIBarButtonItemGroup representativeItem](self->_group, "representativeItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "appendFormat:", CFSTR("\trepresentativeLayout=%@\n"), self->_representativeLayout);
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("\titemLayouts=%p"), self->_itemLayouts);
  if (self->_configuredItemLayouts)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" configuredItemLayouts={\n"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_configuredItemLayouts;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
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
          objc_msgSend(v4, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "appendString:", CFSTR("}"));
  }
  return v4;
}

- (UILayoutGuide)groupSizeGuide
{
  return self->_groupSizeGuide;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (BOOL)compact
{
  return self->_compact;
}

- (BOOL)spilled
{
  return self->_spilled;
}

- (BOOL)useGroupSizing
{
  return self->_useGroupSizing;
}

- (BOOL)suppressCustomSpacing
{
  return self->_suppressCustomSpacing;
}

- (int64_t)leadingSpacerType
{
  return self->_leadingSpacerType;
}

- (id)itemViewGenerator
{
  return self->_itemViewGenerator;
}

@end
