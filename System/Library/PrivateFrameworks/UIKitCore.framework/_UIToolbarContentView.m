@implementation _UIToolbarContentView

- (void)tintColorDidChange
{
  -[_UIButtonBar _appearanceChanged](self->_buttonBar, "_appearanceChanged");
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIToolbarContentView;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIToolbarContentView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UIToolbarContentView updateContent](self, "updateContent");
}

- (double)defaultEdgeSpacing
{
  double result;

  result = 0.0;
  if (self->_itemDistribution != 3)
    return self->_standardEdgeSpacing;
  return result;
}

- (int64_t)barType
{
  return 2;
}

- (void)reloadWithItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UIToolbarContentView _computeEdgeAbsorptionForItems:](self, "_computeEdgeAbsorptionForItems:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBar barButtonGroups](self->_buttonBar, "barButtonGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarButtonItems:", v6);

}

- (void)updateContent
{
  double top;
  double leading;
  double bottom;
  double trailing;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  double standardEdgeSpacing;
  id v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  top = self->_padding.top;
  leading = self->_padding.leading;
  bottom = self->_padding.bottom;
  trailing = self->_padding.trailing;
  -[_UIButtonBar view](self->_buttonBar, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);

  -[_UIButtonBar barButtonGroups](self->_buttonBar, "barButtonGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items](v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    -[_UIToolbarContentView _directionalSafeArea](self, "_directionalSafeArea");
    v12 = v11;
    v14 = v13;
    -[UIView superview](self, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_contentMargin");
    v17 = v16;

    v18 = v12 + v17;
    objc_msgSend(v10, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isSystemItem") && objc_msgSend(v19, "systemItem") == 6)
    {
      objc_msgSend(v19, "width");
      v22 = v18 + v21;
      if (v18 + v21 < 0.0)
        v22 = 0.0;
      if (v21 < 0.0)
        v18 = v22;
    }
    v23 = v14 + v17;
    if (objc_msgSend(v20, "isSystemItem") && objc_msgSend(v20, "systemItem") == 6)
    {
      objc_msgSend(v20, "width");
      v25 = v23 + v24;
      if (v23 + v24 < 0.0)
        v25 = 0.0;
      if (v24 < 0.0)
        v23 = v25;
    }
    v44 = v19;
    v47 = 0u;
    v48 = 0u;
    if (v18 - v12 >= v23 - v14)
      v26 = v23 - v14;
    else
      v26 = v18 - v12;
    v45 = 0uLL;
    v46 = 0uLL;
    v27 = v10;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = 0;
      v32 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v27);
          v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((objc_msgSend(v34, "isSpaceItem") & 1) == 0)
          {
            if (!v30)
              v30 = v34;
            v35 = v34;

            v31 = v35;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v29);
    }
    else
    {
      v30 = 0;
      v31 = 0;
    }

    if (v26 <= 0.0)
    {
      self->_standardEdgeSpacing = 0.0;
      -[_UIToolbarContentView _setButtonBarLeadingInset:trailingInset:](self, "_setButtonBarLeadingInset:trailingInset:", v18, v23);
      v39 = v44;
LABEL_48:

      goto LABEL_49;
    }
    standardEdgeSpacing = self->_standardEdgeSpacing;
    self->_standardEdgeSpacing = v26;
    if (objc_msgSend(v30, "isCustomViewItem"))
    {
      objc_msgSend(v27, "firstObject");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = v30 != v37;

    }
    else
    {
      v38 = 1;
    }
    if ((objc_msgSend(v31, "isCustomViewItem") & 1) != 0)
    {
      objc_msgSend(v27, "lastObject");
      v40 = (id)objc_claimAutoreleasedReturnValue();

      v41 = 0.0;
      if (v38)
        v41 = v26;
      v42 = v18 - v41;
      if (v31 == v40)
        goto LABEL_45;
    }
    else
    {
      v43 = 0.0;
      if (v38)
        v43 = v26;
      v42 = v18 - v43;
    }
    v23 = v23 - v26;
LABEL_45:
    v39 = v44;
    -[_UIToolbarContentView _setButtonBarLeadingInset:trailingInset:](self, "_setButtonBarLeadingInset:trailingInset:", v42, v23);
    if (standardEdgeSpacing != v26)
    {
      objc_msgSend(v30, "_updateView");
      if (v30 != v31)
        objc_msgSend(v31, "_updateView");
    }
    goto LABEL_48;
  }
  self->_standardEdgeSpacing = 0.0;
  -[_UIToolbarContentView _setButtonBarLeadingInset:trailingInset:](self, "_setButtonBarLeadingInset:trailingInset:", 0.0, 0.0);
LABEL_49:

}

- (BOOL)compactMetrics
{
  return self->_compactMetrics;
}

- (void)_setButtonBarLeadingInset:(double)a3 trailingInset:(double)a4
{
  -[NSLayoutConstraint setConstant:](self->_buttonBarLeadingConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_buttonBarTrailingConstraint, "setConstant:", a4);
  -[_UIButtonBar setHitTestDirectionalInsets:](self->_buttonBar, "setHitTestDirectionalInsets:", 0.0, -a3, 0.0, -a4);
}

- (NSDirectionalEdgeInsets)_directionalSafeArea
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSDirectionalEdgeInsets result;

  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v11)
    v12 = v6;
  else
    v12 = v10;
  if (v11)
    v13 = v10;
  else
    v13 = v6;
  v14 = v4;
  v15 = v8;
  result.trailing = v12;
  result.bottom = v15;
  result.leading = v13;
  result.top = v14;
  return result;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_itemDistribution)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v4, "_wantsThreeUp") & 1) != 0)
  {
    v6 = 15;
  }
  else
  {
    -[_UIButtonBar barButtonGroups](self->_buttonBar, "barButtonGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "barButtonItems");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isSpaceItem", (_QWORD)v26) & 1) == 0)
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    v17 = *((_DWORD *)&self->super.super._viewFlags + 4);
    objc_msgSend(v10, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (*(_QWORD *)&v17 & 0x80000) == 0;
    if ((*(_QWORD *)&v17 & 0x80000) != 0)
      v20 = 2;
    else
      v20 = 8;
    v21 = 7;
    if (v19)
      v21 = 13;
    if (v18 == v5)
      v22 = v21;
    else
      v22 = 15;
    objc_msgSend(v10, "lastObject", (_QWORD)v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 == v5)
      v24 = v20;
    else
      v24 = 0;
    v6 = v24 ^ v22;

  }
  return v6;
}

- (double)absorptionForItem:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMapTable objectForKey:](self->_absorptionTable, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)defaultTextPadding
{
  void *v2;
  double v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 5)
    v3 = 6.0;
  else
    v3 = 8.0;

  return v3;
}

- (id)_computeEdgeAbsorptionForItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  UIBarButtonItem *v12;
  void *v13;
  unint64_t v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  UIBarButtonItem *v46;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  id obj;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v52 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v10, "isSpaceItem"))
        {
          if (objc_msgSend(v10, "systemItem") != 6 || (objc_msgSend(v10, "width"), v11 != 0.0))
          {
            v12 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", objc_msgSend(v10, "systemItem"), 0, 0);
            if (objc_msgSend(v10, "systemItem") == 6)
            {
              objc_msgSend(v10, "width");
              -[UIBarButtonItem setWidth:](v12, "setWidth:");
            }
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        else
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v7);
  }

  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userInterfaceIdiom");

  if (objc_msgSend(v4, "count"))
  {
    v14 = 0;
    v15 = 0;
    v54 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((v15 & 1) == 0 && objc_msgSend(v16, "systemItem") == 5)
        break;
      if (!objc_msgSend(v17, "isCustomViewItem"))
        goto LABEL_22;
      ++v54;
LABEL_57:

      if (objc_msgSend(v4, "count") <= ++v14)
        goto LABEL_60;
    }
    v15 = 1;
LABEL_22:
    if (v14)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", (v14 - 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    if (objc_msgSend(v4, "count") - 1 <= v14)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v14 + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v17;
    v21 = v18;
    v22 = v19;
    objc_msgSend(v20, "_imageForState:compact:type:", 0, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0.0;
    if (!v23
      || (objc_msgSend(v20, "isCustomViewItem") & 1) != 0
      || (objc_msgSend(v20, "isSpaceItem") & 1) != 0
      || objc_msgSend(v21, "systemItem") == 5
      || objc_msgSend(v22, "systemItem") == 5
      || (objc_msgSend(v23, "size"), v26 = (34.0 - v25) * 0.5, v26 <= 0.0))
    {
LABEL_56:

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "setObject:forKey:", v40, v20);

      goto LABEL_57;
    }
    objc_msgSend(v21, "_viewOwner");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_viewOwner");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_viewOwner");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_setViewOwner:", 0);
    objc_msgSend(v20, "_setViewOwner:", 0);
    objc_msgSend(v22, "_setViewOwner:", 0);
    v49 = (void *)v27;
    if (objc_msgSend(v21, "isSpaceItem") && objc_msgSend(v22, "isSpaceItem"))
    {
      objc_msgSend(v22, "width");
      v29 = v28 * 0.5;
      objc_msgSend(v21, "width");
      v31 = v30 * 0.5;
      if (v29 < v31)
        v31 = v29;
      if (v31 >= v26)
        v24 = v26;
      else
        v24 = v31;
      objc_msgSend(v21, "width");
      objc_msgSend(v21, "setWidth:", v32 - v24);
    }
    else
    {
      if (v21 || !objc_msgSend(v22, "isSpaceItem"))
      {
        v36 = objc_msgSend(v21, "isSpaceItem");
        if (v22 || !v36)
          goto LABEL_55;
        objc_msgSend(v21, "width");
        v38 = v37 * 0.5;
        if (v38 >= v26)
          v24 = v26;
        else
          v24 = v38;
        v35 = v21;
LABEL_54:
        objc_msgSend(v35, "width");
        objc_msgSend(v35, "setWidth:", v39 - v24);
        v27 = (uint64_t)v49;
LABEL_55:
        objc_msgSend(v21, "_setViewOwner:", v27);
        objc_msgSend(v20, "_setViewOwner:", v50);
        objc_msgSend(v22, "_setViewOwner:", v48);

        goto LABEL_56;
      }
      objc_msgSend(v22, "width");
      v34 = v33 * 0.5;
      if (v34 >= v26)
        v24 = v26;
      else
        v24 = v34;
    }
    v35 = v22;
    goto LABEL_54;
  }
  v54 = 0;
  v15 = 0;
LABEL_60:
  if (objc_msgSend(v4, "count"))
  {
    v41 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "systemItem") == 6)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "width");
        v45 = v44;

        if (v45 == 0.0)
          objc_msgSend(v52, "addIndex:", v41);
      }
      else
      {

      }
      ++v41;
    }
    while (objc_msgSend(v4, "count") > v41);
  }
  objc_msgSend(v4, "removeObjectsAtIndexes:", v52);
  objc_storeStrong((id *)&self->_absorptionTable, obj);
  if ((v15 & 1) == 0 && v54 != objc_msgSend(v4, "count"))
  {
    v46 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(v4, "addObject:", v46);

  }
  return v4;
}

- (void)_ensureButtonBar
{
  _UIButtonBar *v3;
  _UIButtonBar *buttonBar;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItemGroup *v8;
  void *v9;
  double top;
  double leading;
  double bottom;
  double trailing;
  void *v14;
  _UIPointerInteractionAssistant *v15;
  _UIPointerInteractionAssistant *assistant;
  _UIPointerInteractionAssistant *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *buttonBarLeadingConstraint;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *buttonBarTrailingConstraint;
  NSLayoutConstraint *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  UIBarButtonItemGroup *v48;
  _QWORD v49[8];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  if (!self->_buttonBar)
  {
    v3 = objc_alloc_init(_UIButtonBar);
    buttonBar = self->_buttonBar;
    self->_buttonBar = v3;

    -[_UIButtonBar set_appearanceDelegate:](self->_buttonBar, "set_appearanceDelegate:", self);
    -[_UIButtonBar setAllowsViewWrappers:](self->_buttonBar, "setAllowsViewWrappers:", 1);
    -[_UIButtonBar setItemDistribution:](self->_buttonBar, "setItemDistribution:", self->_itemDistribution);
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    _UIButtonBarButtonMakerForVisualProvider();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBar setViewUpdater:](self->_buttonBar, "setViewUpdater:", v7);

    -[_UIButtonBar setMinimumInterItemSpace:](self->_buttonBar, "setMinimumInterItemSpace:", 0.0);
    v8 = [UIBarButtonItemGroup alloc];
    v48 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v8, "initWithBarButtonItems:representativeItem:", MEMORY[0x1E0C9AA60], 0);
    v50[0] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBar setBarButtonGroups:](self->_buttonBar, "setBarButtonGroups:", v9);

    top = self->_padding.top;
    leading = self->_padding.leading;
    bottom = self->_padding.bottom;
    trailing = self->_padding.trailing;
    -[_UIButtonBar view](self->_buttonBar, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);

    v15 = objc_alloc_init(_UIPointerInteractionAssistant);
    assistant = self->_assistant;
    self->_assistant = v15;

    -[UIView addInteraction:](self, "addInteraction:", self->_assistant);
    v17 = self->_assistant;
    -[_UIButtonBar assistantView](self->_buttonBar, "assistantView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerInteractionAssistant setAssistedView:identifier:](v17, "setAssistedView:identifier:", v18, CFSTR("ContentView.buttonBar"));

    -[_UIButtonBar setAssistant:](self->_buttonBar, "setAssistant:", self->_assistant);
    -[_UIButtonBar view](self->_buttonBar, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v19, 0);
    -[_UIPointerInteractionAssistant previewContainer](self->_assistant, "previewContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v20, 1);
    objc_msgSend(v19, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonBarLeadingConstraint = self->_buttonBarLeadingConstraint;
    self->_buttonBarLeadingConstraint = v23;

    -[UIView trailingAnchor](self, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    buttonBarTrailingConstraint = self->_buttonBarTrailingConstraint;
    self->_buttonBarTrailingConstraint = v27;

    v41 = (void *)MEMORY[0x1E0D156E0];
    v29 = self->_buttonBarTrailingConstraint;
    v49[0] = self->_buttonBarLeadingConstraint;
    v49[1] = v29;
    objc_msgSend(v19, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v45;
    objc_msgSend(v19, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v42;
    objc_msgSend(v20, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v38;
    objc_msgSend(v20, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[5] = v32;
    objc_msgSend(v20, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToConstant:", 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49[6] = v34;
    objc_msgSend(v20, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49[7] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v37);

  }
}

- (void)setItemDistribution:(int64_t)a3
{
  self->_itemDistribution = a3;
  -[_UIButtonBar setItemDistribution:](self->_buttonBar, "setItemDistribution:");
}

- (void)setCompactMetrics:(BOOL)a3
{
  void *v3;
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_compactMetrics != a3)
  {
    self->_compactMetrics = a3;
    -[_UIButtonBar barButtonGroups](self->_buttonBar, "barButtonGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItemGroup _items](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_updateView", (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
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
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5
    && (-[_UIButtonBar view](self->_buttonBar, "view"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "window"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    -[_UIButtonBar view](self->_buttonBar, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "snapshotViewAfterScreenUpdates:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[_UIToolbarContentView _computeEdgeAbsorptionForItems:](self, "_computeEdgeAbsorptionForItems:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIToolbarContentView _updateThreeUpFlagsForItems:](self, "_updateThreeUpFlagsForItems:", v14);
  -[_UIToolbarContentView _ensureButtonBar](self, "_ensureButtonBar");
  -[_UIButtonBar barButtonGroups](self->_buttonBar, "barButtonGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBarButtonItems:", v14);

  -[_UIToolbarContentView updateContent](self, "updateContent");
  -[_UIButtonBar view](self->_buttonBar, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v13)
  {
    objc_msgSend(v17, "frame");
    objc_msgSend(v13, "setFrame:");

    -[UIView addSubview:](self, "addSubview:", v13);
    -[_UIButtonBar view](self->_buttonBar, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", 0.0);

    v20 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62___UIToolbarContentView_updateWithItems_fromOldItems_animate___block_invoke;
    v23[3] = &unk_1E16B1B50;
    v23[4] = self;
    v24 = v13;
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __62___UIToolbarContentView_updateWithItems_fromOldItems_animate___block_invoke_2;
    v21[3] = &unk_1E16B3FD8;
    v22 = v24;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v23, v21, 0.2, 0.0);

  }
  else
  {
    objc_msgSend(v17, "setAlpha:", 1.0);

  }
}

- (void)_updateThreeUpFlagsForItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v13, "_setWantsThreeUp:", 0);
        if (objc_msgSend(v13, "isSpaceItem"))
        {
          if (objc_msgSend(v13, "systemItem") == 5)
            objc_msgSend(v4, "addObject:", v13);
          ++v9;
        }
        else if (objc_msgSend(v13, "_flexible"))
        {
          ++v10;
        }
        else if ((objc_msgSend(v13, "isCustomViewItem") & 1) == 0)
        {
          objc_msgSend(v13, "title");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            v16 = objc_msgSend(v13, "hasImage") ^ 1;

            v8 += v16;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }

  if (objc_msgSend(v4, "count") == 2 && v10 == 0 && v9 + v8 < (unint64_t)objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v18);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v20);

    if (v21 - v19 == 2)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v19 + 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_setWantsThreeUp:", 1);

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v23 = v4;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v29 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "_setWantsThreeUp:", 1, (_QWORD)v28);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v25);
      }

    }
  }

}

- (void)setPlainItemAppearance:(id)a3
{
  _UIBarButtonItemData *v4;
  _UIBarButtonItemData *plainItemAppearance;

  v4 = (_UIBarButtonItemData *)objc_msgSend(a3, "copy");
  plainItemAppearance = self->_plainItemAppearance;
  self->_plainItemAppearance = v4;

  -[_UIButtonBar setPlainItemAppearance:](self->_buttonBar, "setPlainItemAppearance:", self->_plainItemAppearance);
}

- (void)setDoneItemAppearance:(id)a3
{
  _UIBarButtonItemData *v4;
  _UIBarButtonItemData *doneItemAppearance;

  v4 = (_UIBarButtonItemData *)objc_msgSend(a3, "copy");
  doneItemAppearance = self->_doneItemAppearance;
  self->_doneItemAppearance = v4;

  -[_UIButtonBar setDoneItemAppearance:](self->_buttonBar, "setDoneItemAppearance:", self->_doneItemAppearance);
}

- (NSDirectionalEdgeInsets)padding
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_padding.top;
  leading = self->_padding.leading;
  bottom = self->_padding.bottom;
  trailing = self->_padding.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (int64_t)itemDistribution
{
  return self->_itemDistribution;
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return self->_plainItemAppearance;
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return self->_doneItemAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneItemAppearance, 0);
  objc_storeStrong((id *)&self->_plainItemAppearance, 0);
  objc_storeStrong((id *)&self->_absorptionTable, 0);
  objc_storeStrong((id *)&self->_buttonBarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_buttonBar, 0);
}

@end
