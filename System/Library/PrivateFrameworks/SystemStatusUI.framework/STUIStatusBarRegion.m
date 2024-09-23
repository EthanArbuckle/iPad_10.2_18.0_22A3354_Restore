@implementation STUIStatusBarRegion

- (BOOL)isEnabled
{
  STUIStatusBarRegion **p_enabilityRegion;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  BOOL result;

  p_enabilityRegion = &self->_enabilityRegion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_enabilityRegion);
  result = (!WeakRetained
         || (v5 = WeakRetained,
             v6 = objc_loadWeakRetained((id *)p_enabilityRegion),
             v7 = objc_msgSend(v6, "isEnabled"),
             v6,
             v5,
             v7))
        && -[NSMutableIndexSet count](self->_disablingTokens, "count") == 0;
  return result;
}

- (NSOrderedSet)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *displayItems;
  _BOOL4 needsReLayout;
  NSOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSOrderedSet *v14;
  uint64_t v15;
  NSOrderedSet *v16;
  NSOrderedSet *v17;
  NSOrderedSet *v18;
  void *v19;
  STUIStatusBarRegionLayout *v20;
  void *v21;
  void *v22;
  NSOrderedSet *v23;
  uint64_t v24;
  void *v25;
  STUIStatusBarRegionLayout *layout;
  void *v27;
  NSOrderedSet *v28;
  UIView *contentView;
  UIView *v30;
  UIView *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  UIView *v37;
  STUIStatusBarRegion *v38;
  _QWORD v39[4];
  NSOrderedSet *v40;
  STUIStatusBarRegion *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = (NSOrderedSet *)a3;
  displayItems = self->_displayItems;
  if (displayItems != v4 && (-[NSOrderedSet isEqual:](displayItems, "isEqual:", v4) & 1) == 0)
  {
    self->_needsReLayout = 0;
    goto LABEL_16;
  }
  needsReLayout = self->_needsReLayout;
  self->_needsReLayout = 0;
  if (needsReLayout)
    goto LABEL_16;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v4;
  v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v8)
  {
LABEL_27:

    goto LABEL_28;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v43 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if (objc_msgSend(v13, "needsAddingToLayout"))
      {
        objc_msgSend(v13, "setNeedsAddingToLayout:", 0);
        v10 = 1;
      }
    }
    v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v9);

  if ((v10 & 1) != 0)
  {
LABEL_16:
    v14 = self->_displayItems;
    v15 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __39__STUIStatusBarRegion_setDisplayItems___block_invoke;
    v39[3] = &unk_1E8D63720;
    v16 = v4;
    v40 = v16;
    v41 = self;
    -[NSOrderedSet enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v39);
    v17 = (NSOrderedSet *)-[NSOrderedSet copy](v16, "copy");
    v18 = self->_displayItems;
    self->_displayItems = v17;

    -[STUIStatusBarRegion enabledDisplayItems](self, "enabledDisplayItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v20 = self->_layout,
          -[STUIStatusBarRegion containerItem](self, "containerItem"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v20) = -[STUIStatusBarRegionLayout mayFitDisplayItems:inContainerItem:](v20, "mayFitDisplayItems:inContainerItem:", v19, v21), v21, (v20 & 1) == 0))
    {
      v23 = (NSOrderedSet *)-[NSOrderedSet mutableCopy](self->_displayItems, "mutableCopy");
      v22 = (void *)objc_msgSend(v19, "mutableCopy");
      do
      {
        STUIStatusBarGetLowestPrioritizedItem(v22);
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          break;
        v25 = (void *)v24;
        objc_msgSend(v22, "removeObject:", v24);
        -[NSOrderedSet removeObject:](v23, "removeObject:", v25);
        objc_msgSend(v25, "setContainerView:", 0);
        objc_msgSend(v25, "setRegion:", 0);

        layout = self->_layout;
        -[STUIStatusBarRegion containerItem](self, "containerItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(layout) = -[STUIStatusBarRegionLayout mayFitDisplayItems:inContainerItem:](layout, "mayFitDisplayItems:inContainerItem:", v22, v27);

      }
      while (!(_DWORD)layout);
      v28 = self->_displayItems;
      self->_displayItems = v23;

    }
    else
    {
      v22 = v19;
    }
    contentView = self->_contentView;
    if (contentView)
    {
      v30 = contentView;
    }
    else
    {
      -[UILayoutGuide owningView](self->_layoutGuide, "owningView");
      v30 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    v33 = v15;
    v34 = 3221225472;
    v35 = __39__STUIStatusBarRegion_setDisplayItems___block_invoke_2;
    v36 = &unk_1E8D63720;
    v37 = v30;
    v38 = self;
    v31 = v30;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", &v33);
    -[STUIStatusBarRegion enabledDisplayItems](self, "enabledDisplayItems", v33, v34, v35, v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarRegionLayout setDisplayItems:](self->_layout, "setDisplayItems:", v32);

    v7 = v40;
    goto LABEL_27;
  }
LABEL_28:

}

- (STUIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (int64_t)effectiveStyle
{
  int64_t result;
  void *v4;
  int v5;
  uint64_t v6;

  result = self->_overriddenStyle;
  if (result == 4)
  {
    result = self->_style;
    if (result == 4)
    {
      -[STUIStatusBarRegion statusBar](self, "statusBar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_useAutomaticStyle");

      v6 = 80;
      if (v5)
        v6 = 88;
      return *(int64_t *)((char *)&self->super.isa + v6);
    }
  }
  return result;
}

- (STUIStatusBar)statusBar
{
  return (STUIStatusBar *)objc_loadWeakRetained((id *)&self->_statusBar);
}

- (UILayoutItem)containerItem
{
  void *layoutGuide;

  if (self->_offsetable || (layoutGuide = self->_contentView) == 0)
    layoutGuide = self->_layoutGuide;
  return (UILayoutItem *)layoutGuide;
}

- (void)setNeedsReLayout:(BOOL)a3
{
  self->_needsReLayout = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)disableItemFrameBasedOverflow
{
  return self->_disableItemFrameBasedOverflow;
}

- (STUIStatusBarDisplayItem)overflowedDisplayItem
{
  void *v3;

  if ((-[STUIStatusBarRegionLayout fitsAllItems](self->_layout, "fitsAllItems") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    STUIStatusBarGetLowestPrioritizedItem(self->_displayItems);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (STUIStatusBarDisplayItem *)v3;
}

uint64_t __42__STUIStatusBarRegion_enabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
    v3 = objc_msgSend(v2, "floating") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (UILayoutItem)layoutItem
{
  void *contentView;

  contentView = self->_contentView;
  if (!contentView)
    contentView = self->_layoutGuide;
  return (UILayoutItem *)contentView;
}

- (void)setLayout:(id)a3
{
  STUIStatusBarRegionLayout *v5;
  STUIStatusBarRegionLayout *layout;
  STUIStatusBarRegionLayout **p_layout;
  void *v8;
  STUIStatusBarRegionLayout *v9;

  v5 = (STUIStatusBarRegionLayout *)a3;
  p_layout = &self->_layout;
  layout = self->_layout;
  v9 = v5;
  if (layout != v5)
  {
    if (layout)
    {
      -[STUIStatusBarRegionLayout setRegion:](layout, "setRegion:", 0);
      -[STUIStatusBarRegionLayout setDisplayItems:](*p_layout, "setDisplayItems:", MEMORY[0x1E0C9AA60]);
    }
    objc_storeStrong((id *)&self->_layout, a3);
    if (*p_layout)
    {
      -[STUIStatusBarRegionLayout setRegion:](*p_layout, "setRegion:", self);
      -[STUIStatusBarRegion currentEnabledDisplayItems](self, "currentEnabledDisplayItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarRegionLayout setDisplayItems:](self->_layout, "setDisplayItems:", v8);

    }
  }

}

- (STUIStatusBarRegion)initWithIdentifier:(id)a3
{
  NSString *v4;
  STUIStatusBarRegion *v5;
  NSString *identifier;
  NSString *v7;
  UILayoutGuide *v8;
  UILayoutGuide *layoutGuide;
  NSOrderedSet *v10;
  NSOrderedSet *displayItems;
  uint64_t v12;
  NSMutableIndexSet *disablingTokens;
  objc_super v15;

  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)STUIStatusBarRegion;
  v5 = -[STUIStatusBarRegion init](&v15, sel_init);
  identifier = v5->_identifier;
  v5->_identifier = v4;
  v7 = v4;

  v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  layoutGuide = v5->_layoutGuide;
  v5->_layoutGuide = v8;

  v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  displayItems = v5->_displayItems;
  v5->_displayItems = v10;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = objc_claimAutoreleasedReturnValue();
  disablingTokens = v5->_disablingTokens;
  v5->_disablingTokens = (NSMutableIndexSet *)v12;

  v5->_style = 4;
  v5->_overriddenStyle = 4;
  return v5;
}

- (NSArray)enabledDisplayItems
{
  NSOrderedSet *displayItems;
  void *v3;
  void *v4;

  displayItems = self->_displayItems;
  -[NSOrderedSet indexesOfObjectsPassingTest:](displayItems, "indexesOfObjectsPassingTest:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet objectsAtIndexes:](displayItems, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)currentEnabledDisplayItems
{
  NSOrderedSet *displayItems;
  void *v3;
  void *v4;
  _QWORD v6[5];

  displayItems = self->_displayItems;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__STUIStatusBarRegion_currentEnabledDisplayItems__block_invoke;
  v6[3] = &unk_1E8D62DC8;
  v6[4] = self;
  -[NSOrderedSet indexesOfObjectsPassingTest:](displayItems, "indexesOfObjectsPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet objectsAtIndexes:](displayItems, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setOffsetable:(BOOL)a3
{
  id v4;
  UILayoutGuide *v5;
  UILayoutGuide *layoutGuide;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *centerXConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *centerYConstraint;
  void *v15;
  NSLayoutConstraint *v16;
  UILayoutGuide *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  if (self->_offsetable != a3)
  {
    self->_offsetable = a3;
    if (a3)
    {
      if (!self->_contentView)
      {
        v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        -[STUIStatusBarRegion setContentView:](self, "setContentView:", v4);

      }
      v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v5;

      -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_layoutGuide);
      -[UILayoutGuide centerXAnchor](self->_layoutGuide, "centerXAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      centerXConstraint = self->_centerXConstraint;
      self->_centerXConstraint = v9;

      -[UILayoutGuide centerYAnchor](self->_layoutGuide, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      centerYConstraint = self->_centerYConstraint;
      self->_centerYConstraint = v13;

      v15 = (void *)MEMORY[0x1E0CB3718];
      v16 = self->_centerYConstraint;
      v17 = self->_layoutGuide;
      v25[0] = self->_centerXConstraint;
      v25[1] = v16;
      -[UILayoutGuide widthAnchor](v17, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_contentView, "widthAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2] = v20;
      -[UILayoutGuide heightAnchor](self->_layoutGuide, "heightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView heightAnchor](self->_contentView, "heightAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[3] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activateConstraints:", v24);

    }
  }
}

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
    -[STUIStatusBarRegion _overriddenStyleAttributesChanged](self, "_overriddenStyleAttributesChanged");
  }

}

- (void)_overriddenStyleAttributesChanged
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  -[STUIStatusBarRegion currentEnabledDisplayItems](self, "currentEnabledDisplayItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "item");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setNeedsUpdate");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setDisableItemFrameBasedOverflow:(BOOL)a3
{
  self->_disableItemFrameBasedOverflow = a3;
}

- (STUIStatusBarAction)action
{
  return self->_action;
}

- (BOOL)disableWithToken:(unint64_t)a3
{
  char v5;

  v5 = -[NSMutableIndexSet containsIndex:](self->_disablingTokens, "containsIndex:");
  if ((v5 & 1) == 0)
    -[NSMutableIndexSet addIndex:](self->_disablingTokens, "addIndex:", a3);
  return v5 ^ 1;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  void **p_contentView;
  void *v7;
  UILayoutGuide *v8;
  UILayoutGuide *layoutGuide;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_contentView = (void **)&self->_contentView;
  if (self->_contentView != v5)
  {
    v11 = v5;
    -[STUIStatusBarRegion layoutItem](self, "layoutItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ui_removeFromParentLayoutItem");

    if (v11)
    {
      objc_storeStrong((id *)&self->_contentView, a3);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      p_contentView = (void **)&self->_layoutGuide;
    }
    else
    {
      v8 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v8;

    }
    v10 = *p_contentView;
    *p_contentView = 0;

    v5 = v11;
  }

}

- (BOOL)enableWithToken:(unint64_t)a3
{
  int v5;

  v5 = -[NSMutableIndexSet containsIndex:](self->_disablingTokens, "containsIndex:");
  if (v5)
    -[NSMutableIndexSet removeIndex:](self->_disablingTokens, "removeIndex:", a3);
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setStatusBar:(id)a3
{
  objc_storeWeak((id *)&self->_statusBar, a3);
}

BOOL __49__STUIStatusBarRegion_currentEnabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled") && (objc_msgSend(v3, "floating") & 1) == 0)
  {
    objc_msgSend(v3, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == *(void **)(a1 + 32);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __39__STUIStatusBarRegion_setDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8);
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v8, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 != *(void **)(a1 + 40))
    {

LABEL_6:
      v4 = v8;
      goto LABEL_7;
    }
    v7 = objc_msgSend(v8, "floating");

    v4 = v8;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v8, "setContainerView:", 0);
      objc_msgSend(v8, "setRegion:", 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __39__STUIStatusBarRegion_setDisplayItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setContainerView:", v3);
  objc_msgSend(v4, "setRegion:", *(_QWORD *)(a1 + 40));

}

void __60__STUIStatusBarRegion_displayItemAbsolutePresentationFrames__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v9, "absolutePresentationFrame");
    objc_msgSend(v5, "valueWithCGRect:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (void)setAutomaticStyle:(int64_t)a3
{
  int64_t style;
  id v5;

  if (self->_automaticStyle != a3)
  {
    self->_automaticStyle = a3;
    if (self->_overriddenStyle == 4)
    {
      -[STUIStatusBarRegion statusBar](self, "statusBar");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "style"))
      {

      }
      else
      {
        style = self->_style;

        if (style == 4)
          -[STUIStatusBarRegion _overriddenStyleAttributesChanged](self, "_overriddenStyleAttributesChanged");
      }
    }
  }
}

- (NSDictionary)displayItemAbsolutePresentationFrames
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__STUIStatusBarRegion_displayItemAbsolutePresentationFrames__block_invoke;
  v8[3] = &unk_1E8D629B0;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return (NSDictionary *)v6;
}

- (STUIStatusBarRegionLayout)layout
{
  return self->_layout;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_destroyWeak((id *)&self->_enabilityRegion);
  objc_storeStrong((id *)&self->_dependentRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarRegion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarRegion debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (UIView)hoverView
{
  UIView *contentView;

  contentView = self->_contentView;
  if (!contentView)
    contentView = self->_backgroundView;
  return contentView;
}

- (BOOL)hoverHighlightsAsRegion
{
  return 1;
}

- (CGRect)absoluteHoverFrame
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v32 = *MEMORY[0x1E0C80C00];
  -[STUIStatusBarRegion layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = 1.79769313e308;
    v9 = 2.22507386e-308;
    v10 = 2.22507386e-308;
    v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "absoluteFrame", (_QWORD)v27);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        MinX = CGRectGetMinX(v33);
        if (v11 >= MinX)
          v11 = MinX;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        MinY = CGRectGetMinY(v34);
        if (v8 >= MinY)
          v8 = MinY;
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        MaxX = CGRectGetMaxX(v35);
        if (v10 < MaxX)
          v10 = MaxX;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        MaxY = CGRectGetMaxY(v36);
        if (v9 < MaxY)
          v9 = MaxY;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1.79769313e308;
    v9 = 2.22507386e-308;
    v10 = 2.22507386e-308;
    v11 = 1.79769313e308;
  }

  if (objc_msgSend(v4, "count"))
  {
    v21 = v10 - v11;
    v22 = v9 - v8;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v23 = v11;
  v24 = v8;
  v25 = v21;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)setIdentifier:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_identifier != v6)
  {
    objc_storeStrong((id *)&self->_identifier, a3);
    -[STUIStatusBarRegion layoutGuide](self, "layoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

  }
}

- (void)setOffset:(UIOffset)a3
{
  double vertical;

  if (self->_offsetable)
  {
    vertical = a3.vertical;
    if (a3.horizontal != self->_offset.horizontal || a3.vertical != self->_offset.vertical)
    {
      self->_offset = a3;
      -[NSLayoutConstraint setConstant:](self->_centerXConstraint, "setConstant:");
      -[NSLayoutConstraint setConstant:](self->_centerYConstraint, "setConstant:", vertical);
    }
  }
}

- (void)_addSubview:(id)a3 atBack:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v4 = a4;
  v23[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STUIStatusBarRegion layoutItem](self, "layoutItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ui_superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v8;
  if (v4)
  {
    objc_msgSend(v8, "insertSubview:atIndex:", v6, 0);
  }
  else if (self->_contentView)
  {
    objc_msgSend(v8, "insertSubview:aboveSubview:", v6);
  }
  else
  {
    objc_msgSend(v8, "addSubview:", v6);
  }
  objc_msgSend(v6, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(v6, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(v6, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(v6, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v7 = v5;
    if (v5)
    {
      -[STUIStatusBarRegion _addSubview:atBack:](self, "_addSubview:atBack:", v5, 1);
      backgroundView = self->_backgroundView;
    }
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v5 = v7;
  }

}

- (void)setHighlightView:(id)a3
{
  UIView *v5;
  UIView *highlightView;
  UIView *v7;

  v5 = (UIView *)a3;
  highlightView = self->_highlightView;
  if (highlightView != v5)
  {
    v7 = v5;
    if (v5)
    {
      -[STUIStatusBarRegion _addSubview:atBack:](self, "_addSubview:atBack:", v5, 0);
      highlightView = self->_highlightView;
    }
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_highlightView, a3);
    v5 = v7;
  }

}

- (void)setFrozen:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[3];
  CGRect v25;
  CGRect v26;

  v3 = a3;
  v24[2] = *MEMORY[0x1E0C80C00];
  if (-[STUIStatusBarRegion isFrozen](self, "isFrozen") != a3)
  {
    if (v3)
    {
      -[UIView bounds](self->_contentView, "bounds");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[UIView alpha](self->_contentView, "alpha");
      v14 = v13;
      -[UIView setAlpha:](self->_contentView, "setAlpha:", 1.0);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C88]), "initWithFrame:", v6, v8, v10, v12);
      objc_msgSend(v15, "captureSnapshotRect:fromView:withSnapshotType:", self->_contentView, 0, v6, v8, v10, v12);
      -[STUIStatusBarRegion setFrozenView:](self, "setFrozenView:", v15);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_frozenView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setAlpha:](self->_frozenView, "setAlpha:", v14);
      -[STUIStatusBarRegion _addSubview:atBack:](self, "_addSubview:atBack:", self->_frozenView, 1);
      -[UIView widthAnchor](self->_frozenView, "widthAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25.origin.x = v6;
      v25.origin.y = v8;
      v25.size.width = v10;
      v25.size.height = v12;
      objc_msgSend(v16, "constraintEqualToConstant:", CGRectGetWidth(v25));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v17;
      -[UIView heightAnchor](self->_frozenView, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26.origin.x = v6;
      v26.origin.y = v8;
      v26.size.width = v10;
      v26.size.height = v12;
      objc_msgSend(v18, "constraintEqualToConstant:", CGRectGetHeight(v26));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
      -[UIView setAlpha:](self->_contentView, "setAlpha:", 0.0);

    }
    else
    {
      -[UIView alpha](self->_frozenView, "alpha");
      v22 = v21;
      -[STUIStatusBarRegion containerView](self, "containerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAlpha:", v22);

      -[UIView removeFromSuperview](self->_frozenView, "removeFromSuperview");
      -[STUIStatusBarRegion setFrozenView:](self, "setFrozenView:", 0);
    }
  }
}

- (BOOL)isFrozen
{
  return self->_frozenView != 0;
}

- (void)setAlpha:(double)a3
{
  _BOOL4 v5;
  uint64_t v6;

  v5 = -[STUIStatusBarRegion isFrozen](self, "isFrozen");
  v6 = 112;
  if (v5)
    v6 = 184;
  objc_msgSend(*(id *)((char *)&self->super.isa + v6), "setAlpha:", a3);
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (self->_overriddenStyle == 4)
      -[STUIStatusBarRegion _overriddenStyleAttributesChanged](self, "_overriddenStyleAttributesChanged");
  }
}

- (void)setOverriddenStyle:(int64_t)a3
{
  if (self->_overriddenStyle != a3)
  {
    self->_overriddenStyle = a3;
    -[STUIStatusBarRegion _overriddenStyleAttributesChanged](self, "_overriddenStyleAttributesChanged");
  }
}

- (NSDictionary)displayItemAbsoluteFrames
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__STUIStatusBarRegion_displayItemAbsoluteFrames__block_invoke;
  v8[3] = &unk_1E8D629B0;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return (NSDictionary *)v6;
}

void __48__STUIStatusBarRegion_displayItemAbsoluteFrames__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v9, "absoluteFrame");
    objc_msgSend(v5, "valueWithCGRect:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (id)displayItemForHUDAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double MinX;
  uint64_t v20;
  double v24;
  id v26;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[STUIStatusBarRegion layout](self, "layout", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    v12 = 1.79769313e308;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      if (CGRectIsEmpty(v35))
        goto LABEL_18;
      -[STUIStatusBarRegion statusBar](self, "statusBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "convertPoint:toView:", v15, x, y);
      v18 = v17;

      objc_msgSend(v15, "bounds");
      if ((objc_msgSend(v15, "pointInside:withEvent:", 0, v18, CGRectGetMidY(v36)) & 1) != 0)
      {
        v27 = v14;

        goto LABEL_24;
      }
      objc_msgSend(v15, "bounds");
      MinX = CGRectGetMinX(v37);
      objc_msgSend(v15, "bounds");
      if (v18 <= MinX)
        break;
      if (v18 >= CGRectGetMaxX(*(CGRect *)&v20))
      {
        objc_msgSend(v15, "bounds");
        v24 = v18 - CGRectGetMaxX(v38);
LABEL_12:
        if (v24 < 6.0 && v24 < v12)
        {
          v26 = v14;

          v10 = v26;
          v12 = v24;
        }
      }
LABEL_18:

      if (v9 == ++v13)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_23;
      }
    }
    v24 = CGRectGetMinX(*(CGRect *)&v20) - v18;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_23:

  v10 = v10;
  v27 = v10;
LABEL_24:

  return v27;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarRegion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarRegion identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarRegion isEnabled](self, "isEnabled"), CFSTR("enabled"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarRegion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarRegion _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarRegion _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarRegion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  -[STUIStatusBarRegion displayItems](self, "displayItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("displayItems"), 1);

  return v7;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (UIEdgeInsets)actionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_actionInsets.top;
  left = self->_actionInsets.left;
  bottom = self->_actionInsets.bottom;
  right = self->_actionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (STUIStatusBarAction)hoverAction
{
  return self->_hoverAction;
}

- (void)setHoverAction:(id)a3
{
  objc_storeStrong((id *)&self->_hoverAction, a3);
}

- (NSDirectionalEdgeInsets)extendedHoverInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_extendedHoverInsets.top;
  leading = self->_extendedHoverInsets.leading;
  bottom = self->_extendedHoverInsets.bottom;
  trailing = self->_extendedHoverInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3
{
  self->_extendedHoverInsets = a3;
}

- (NSSet)dependentRegionIdentifiers
{
  return self->_dependentRegionIdentifiers;
}

- (void)setDependentRegionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_dependentRegionIdentifiers, a3);
}

- (STUIStatusBarRegion)enabilityRegion
{
  return (STUIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_enabilityRegion);
}

- (void)setEnabilityRegion:(id)a3
{
  objc_storeWeak((id *)&self->_enabilityRegion, a3);
}

- (BOOL)offsetable
{
  return self->_offsetable;
}

- (UIOffset)offset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_offset.horizontal;
  vertical = self->_offset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (double)alpha
{
  return self->_alpha;
}

- (int64_t)automaticStyle
{
  return self->_automaticStyle;
}

- (int64_t)overriddenStyle
{
  return self->_overriddenStyle;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (BOOL)needsReLayout
{
  return self->_needsReLayout;
}

- (NSMutableIndexSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void)setDisablingTokens:(id)a3
{
  objc_storeStrong((id *)&self->_disablingTokens, a3);
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (NSLayoutConstraint)centerXConstraint
{
  return self->_centerXConstraint;
}

- (void)setCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerXConstraint, a3);
}

- (NSLayoutConstraint)centerYConstraint
{
  return self->_centerYConstraint;
}

- (void)setCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerYConstraint, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)frozenView
{
  return self->_frozenView;
}

- (void)setFrozenView:(id)a3
{
  objc_storeStrong((id *)&self->_frozenView, a3);
}

@end
