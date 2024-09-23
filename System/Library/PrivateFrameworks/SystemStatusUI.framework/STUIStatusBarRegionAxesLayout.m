@implementation STUIStatusBarRegionAxesLayout

- (void)_updateConstraints
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *displayItems;
  id v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *horizontalConstraints;
  NSArray *v23;
  NSArray *verticalConstraints;
  NSArray *v25;
  NSArray *layoutGuides;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_horizontalConstraints, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_horizontalConstraints);
  if (-[NSArray count](self->_verticalConstraints, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_verticalConstraints);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = self->_layoutGuides;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v7++), "_ui_removeFromParentLayoutItem");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v5);
  }

  -[STUIStatusBarRegionAxesLayout region](self, "region");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v9 && -[NSArray count](self->_displayItems, "count"))
  {
    displayItems = self->_displayItems;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __51__STUIStatusBarRegionAxesLayout__updateConstraints__block_invoke;
    v31[3] = &unk_1E8D629B0;
    v14 = v9;
    v32 = v14;
    -[NSArray enumerateObjectsUsingBlock:](displayItems, "enumerateObjectsUsingBlock:", v31);
    -[STUIStatusBarRegionAxisLayout constraintsForDisplayItems:layoutGuides:inContainerItem:axis:](self->_horizontalLayout, "constraintsForDisplayItems:layoutGuides:inContainerItem:axis:", self->_displayItems, v10, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v15);

    -[STUIStatusBarRegionAxisLayout constraintsForDisplayItems:layoutGuides:inContainerItem:axis:](self->_verticalLayout, "constraintsForDisplayItems:layoutGuides:inContainerItem:axis:", self->_displayItems, v10, v14, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v12, "addObjectsFromArray:", v16);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v10;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v14, "_ui_addSubLayoutItem:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21++), (_QWORD)v27);
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v11);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);

  }
  horizontalConstraints = self->_horizontalConstraints;
  self->_horizontalConstraints = v11;
  v23 = v11;

  verticalConstraints = self->_verticalConstraints;
  self->_verticalConstraints = v12;
  v25 = v12;

  layoutGuides = self->_layoutGuides;
  self->_layoutGuides = v10;

}

- (STUIStatusBarRegion)region
{
  return (STUIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_region);
}

- (STUIStatusBarRegionAxisLayout)horizontalLayout
{
  return self->_horizontalLayout;
}

- (BOOL)fitsAllItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v21;
  void *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  BOOL v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[STUIStatusBarRegionAxesLayout displayItems](self, "displayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 1;
  -[STUIStatusBarRegionAxesLayout region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ui_bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (-[STUIStatusBarRegionAxisLayout canOverflowItems](self->_horizontalLayout, "canOverflowItems"))
    v15 = -0.001;
  else
    v15 = -1000000.0;
  if (-[STUIStatusBarRegionAxisLayout canOverflowItems](self->_verticalLayout, "canOverflowItems"))
    v16 = -0.001;
  else
    v16 = -1000000.0;
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  v38 = CGRectInset(v37, v15, v16);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  -[STUIStatusBarRegionAxesLayout displayItems](self, "displayItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_ui_frame");
  v41.origin.x = v24;
  v41.origin.y = v25;
  v41.size.width = v26;
  v41.size.height = v27;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  if (CGRectContainsRect(v39, v41))
  {
    -[STUIStatusBarRegionAxesLayout displayItems](self, "displayItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_ui_frame");
    v42.origin.x = v31;
    v42.origin.y = v32;
    v42.size.width = v33;
    v42.size.height = v34;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v35 = CGRectContainsRect(v40, v42);

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setVerticalLayout:(id)a3
{
  STUIStatusBarRegionAxisLayout *v5;
  STUIStatusBarRegionAxisLayout *v6;

  v5 = (STUIStatusBarRegionAxisLayout *)a3;
  if (self->_verticalLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_verticalLayout, a3);
    -[STUIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = v6;
  }

}

- (void)setHorizontalLayout:(id)a3
{
  STUIStatusBarRegionAxisLayout *v5;
  STUIStatusBarRegionAxisLayout *v6;

  v5 = (STUIStatusBarRegionAxisLayout *)a3;
  if (self->_horizontalLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_horizontalLayout, a3);
    -[STUIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = v6;
  }

}

- (void)setDisplayItems:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_displayItems != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_displayItems, a3);
    -[STUIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = v6;
  }

}

- (void)setRegion:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_region);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_region, obj);
    -[STUIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = obj;
  }

}

void __51__STUIStatusBarRegionAxesLayout__updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "layoutItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set_ui_usesManualLayout:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_ui_addSubLayoutItem:", v3);

}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = ((objc_opt_respondsToSelector() & 1) == 0
     || -[STUIStatusBarRegionAxisLayout mayFitDisplayItems:inContainerItem:axis:](self->_horizontalLayout, "mayFitDisplayItems:inContainerItem:axis:", v6, v7, 0))&& ((objc_opt_respondsToSelector() & 1) == 0|| -[STUIStatusBarRegionAxisLayout mayFitDisplayItems:inContainerItem:axis:](self->_verticalLayout, "mayFitDisplayItems:inContainerItem:axis:", v6, v7, 1));

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuides, 0);
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLayout, 0);
  objc_storeStrong((id *)&self->_horizontalLayout, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_destroyWeak((id *)&self->_region);
}

- (BOOL)canOverflowItems
{
  if ((-[STUIStatusBarRegionAxisLayout canOverflowItems](self->_horizontalLayout, "canOverflowItems") & 1) != 0)
    return 1;
  else
    return -[STUIStatusBarRegionAxisLayout canOverflowItems](self->_verticalLayout, "canOverflowItems");
}

- (STUIStatusBarRegionAxisLayout)verticalLayout
{
  return self->_verticalLayout;
}

- (NSArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (void)setHorizontalConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)layoutGuides
{
  return self->_layoutGuides;
}

- (void)setLayoutGuides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
