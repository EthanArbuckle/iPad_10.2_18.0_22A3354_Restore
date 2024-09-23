@implementation _UIStatusBarRegionAxesLayout

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
    -[_UIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = obj;
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
    -[_UIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = v6;
  }

}

- (void)setHorizontalLayout:(id)a3
{
  _UIStatusBarRegionAxisLayout *v5;
  _UIStatusBarRegionAxisLayout *v6;

  v5 = (_UIStatusBarRegionAxisLayout *)a3;
  if (self->_horizontalLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_horizontalLayout, a3);
    -[_UIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = v6;
  }

}

- (void)setVerticalLayout:(id)a3
{
  _UIStatusBarRegionAxisLayout *v5;
  _UIStatusBarRegionAxisLayout *v6;

  v5 = (_UIStatusBarRegionAxisLayout *)a3;
  if (self->_verticalLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_verticalLayout, a3);
    -[_UIStatusBarRegionAxesLayout _updateConstraints](self, "_updateConstraints");
    v5 = v6;
  }

}

- (void)_updateConstraints
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *displayItems;
  id v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *horizontalConstraints;
  NSArray *v24;
  NSArray *verticalConstraints;
  NSArray *v26;
  NSArray *layoutGuides;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_horizontalConstraints, "count"))
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_horizontalConstraints);
  if (-[NSArray count](self->_verticalConstraints, "count"))
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_verticalConstraints);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = self->_layoutGuides;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v8++), "_ui_removeFromParentLayoutItem");
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v6);
  }

  -[_UIStatusBarRegionAxesLayout region](self, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v10 && -[NSArray count](self->_displayItems, "count"))
  {
    displayItems = self->_displayItems;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __50___UIStatusBarRegionAxesLayout__updateConstraints__block_invoke;
    v34[3] = &unk_1E16E05E0;
    v15 = v10;
    v35 = v15;
    -[NSArray enumerateObjectsUsingBlock:](displayItems, "enumerateObjectsUsingBlock:", v34);
    if (!self->_horizontalLayout)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarRegionAxesLayout.m"), 94, CFSTR("%@ has no horizontal layout"), self);

    }
    if (!self->_verticalLayout)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarRegionAxesLayout.m"), 95, CFSTR("%@ has no vertical layout"), self);

    }
    -[_UIStatusBarRegionAxisLayout constraintsForDisplayItems:layoutGuides:inContainerItem:axis:](self->_horizontalLayout, "constraintsForDisplayItems:layoutGuides:inContainerItem:axis:", self->_displayItems, v11, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v12, "addObjectsFromArray:", v16);

    -[_UIStatusBarRegionAxisLayout constraintsForDisplayItems:layoutGuides:inContainerItem:axis:](self->_verticalLayout, "constraintsForDisplayItems:layoutGuides:inContainerItem:axis:", self->_displayItems, v11, v15, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v13, "addObjectsFromArray:", v17);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = v11;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v15, "_ui_addSubLayoutItem:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22++));
        }
        while (v20 != v22);
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v20);
    }

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v12);
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v13);

  }
  horizontalConstraints = self->_horizontalConstraints;
  self->_horizontalConstraints = v12;
  v24 = v12;

  verticalConstraints = self->_verticalConstraints;
  self->_verticalConstraints = v13;
  v26 = v13;

  layoutGuides = self->_layoutGuides;
  self->_layoutGuides = v11;

}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = ((objc_opt_respondsToSelector() & 1) == 0
     || -[_UIStatusBarRegionAxisLayout mayFitDisplayItems:inContainerItem:axis:](self->_horizontalLayout, "mayFitDisplayItems:inContainerItem:axis:", v6, v7, 0))&& ((objc_opt_respondsToSelector() & 1) == 0|| -[_UIStatusBarRegionAxisLayout mayFitDisplayItems:inContainerItem:axis:](self->_verticalLayout, "mayFitDisplayItems:inContainerItem:axis:", v6, v7, 1));

  return v8;
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

  -[_UIStatusBarRegionAxesLayout displayItems](self, "displayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 1;
  -[_UIStatusBarRegionAxesLayout region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ui_bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (-[_UIStatusBarRegionAxisLayout canOverflowItems](self->_horizontalLayout, "canOverflowItems"))
    v15 = -0.001;
  else
    v15 = -1000000.0;
  if (-[_UIStatusBarRegionAxisLayout canOverflowItems](self->_verticalLayout, "canOverflowItems"))
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
  -[_UIStatusBarRegionAxesLayout displayItems](self, "displayItems");
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
    -[_UIStatusBarRegionAxesLayout displayItems](self, "displayItems");
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

- (BOOL)canOverflowItems
{
  if ((-[_UIStatusBarRegionAxisLayout canOverflowItems](self->_horizontalLayout, "canOverflowItems") & 1) != 0)
    return 1;
  else
    return -[_UIStatusBarRegionAxisLayout canOverflowItems](self->_verticalLayout, "canOverflowItems");
}

- (_UIStatusBarRegion)region
{
  return (_UIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_region);
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (_UIStatusBarRegionAxisLayout)horizontalLayout
{
  return self->_horizontalLayout;
}

- (_UIStatusBarRegionAxisLayout)verticalLayout
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

@end
