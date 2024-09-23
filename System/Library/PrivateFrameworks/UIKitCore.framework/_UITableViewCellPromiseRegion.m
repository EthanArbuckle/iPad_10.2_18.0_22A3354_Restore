@implementation _UITableViewCellPromiseRegion

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  CGRect v14;

  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewCellPromiseRegion indexPath](self, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewCellPromiseRegion indexPath](self, "indexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_rectForRowAtIndexPath:usingPresentationValues:", v8, 1);
  NSStringFromCGRect(v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; Represents index path %@ with frame %@ in %@: %p>"),
    v6,
    self,
    v7,
    v9,
    v11,
    v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)_focusRegionFocusSystem
{
  void *v2;
  void *v3;

  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_focusRegionFrame
{
  void *v3;
  double v4;
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
  double v15;
  CGRect result;

  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewCellPromiseRegion frame](self, "frame");
  objc_msgSend(v3, "convertRect:toView:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

- (BOOL)_isPromiseFocusRegion
{
  return 1;
}

- (id)_fulfillPromisedFocusRegion
{
  void *v3;
  void *v4;

  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fulfillPromisedFocusRegionForCell:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isTransparentFocusRegion
{
  return 0;
}

- (id)_focusRegionView
{
  return 0;
}

- (id)_focusRegionGuides
{
  return 0;
}

- (id)_focusDebugOverlayParentView
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGRect)frame
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITableViewCellPromiseRegion indexPath](self, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tableViewRectForRowAtIndexPath:canGuess:", v4, 1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 1;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[_UITableViewCellPromiseRegion _fulfillPromisedFocusRegion](self, "_fulfillPromisedFocusRegion", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v2;
  void *v3;

  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v3;
}

- (BOOL)_isLazyFocusItemContainer
{
  return 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _UIFocusPromiseRegion *v16;
  void *v17;
  _UIFocusPromiseRegion *v18;
  _QWORD v19[5];

  v4 = a3;
  -[_UITableViewCellPromiseRegion tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dyld_program_sdk_at_least();
  -[_UITableViewCellPromiseRegion indexPath](self, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
    objc_msgSend(v5, "_tableViewRectForRowAtIndexPath:canGuess:", v7, 1);
  else
    objc_msgSend(v5, "_rectForRowAtIndexPath:usingPresentationValues:", v7, 1);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;

  v16 = [_UIFocusPromiseRegion alloc];
  -[_UITableViewCellPromiseRegion indexPath](self, "indexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[_UIFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](v16, "initWithFrame:coordinateSpace:identifier:", v5, v17, v12, v13, v14, v15);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65___UITableViewCellPromiseRegion__searchForFocusRegionsInContext___block_invoke;
  v19[3] = &unk_1E16BDB20;
  v19[4] = self;
  -[_UIFocusPromiseRegion setContentFulfillmentHandler:](v18, "setContentFulfillmentHandler:", v19);
  objc_msgSend(v4, "addRegion:", v18);

}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
