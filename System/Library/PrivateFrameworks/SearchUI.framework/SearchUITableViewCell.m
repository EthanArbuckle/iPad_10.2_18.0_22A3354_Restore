@implementation SearchUITableViewCell

+ (BOOL)canCellExpandWithResults:(id)a3
{
  return 0;
}

+ (double)distanceToTopOfAppIconsForMultiResultCell
{
  _BOOL4 v2;
  double result;

  v2 = +[SearchUIUtilities isWideScreen](SearchUIUtilities, "isWideScreen");
  result = 8.0;
  if (v2)
    return 16.0;
  return result;
}

+ (id)cellViewForRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "cellViewClass")), "initWithRowModel:feedbackDelegate:", v6, v5);

  return v7;
}

+ (id)reuseIdentifierForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SearchUITableModel tableModelWithResult:](SearchUITableModel, "tableModelWithResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowModelForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (objc_msgSend(v3, "numberOfRowsForSection:", 0) == 1)
  {
    objc_msgSend(v5, "reuseIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (SearchUITableViewCell)init
{
  return -[SearchUITableViewCell initWithRowModel:feedbackDelegate:](self, "initWithRowModel:feedbackDelegate:", 0, 0);
}

- (SearchUITableViewCell)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SearchUITableViewCell *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SearchUITableViewCell;
  v9 = -[SearchUITableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, 0, v8);

  if (v9)
  {
    -[SearchUITableViewCell setDelegate:](v9, "setDelegate:", v7);
    -[SearchUITableViewCell setPreservesSuperviewLayoutMargins:](v9, "setPreservesSuperviewLayoutMargins:", 0);
    -[SearchUITableViewCell setLayoutMargins:](v9, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DBD9D0], "viewWithProminence:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUITableViewCell setSelectedBackgroundView:](v9, "setSelectedBackgroundView:", v10);

    -[SearchUITableViewCell setBackgroundColor:](v9, "setBackgroundColor:", 0);
    +[SearchUIDragSource dragSourceForView:dragObject:feedbackDelegate:](SearchUITableViewCellDragSource, "dragSourceForView:dragObject:feedbackDelegate:", v9, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUITableViewCell setDragSource:](v9, "setDragSource:", v11);

    -[SearchUITableViewCell updateWithRowModel:](v9, "updateWithRowModel:", v6);
  }

  return v9;
}

- (id)contextMenuActionProvider
{
  void *v2;
  void *v3;

  -[SearchUITableViewCell commandHandler](self, "commandHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)executeCommandWithTriggerEvent:(unint64_t)a3
{
  id v4;

  -[SearchUITableViewCell commandHandler](self, "commandHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeWithTriggerEvent:", a3);

}

- (id)commandHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[SearchUITableViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFeedbackDelegate:", v4);

  objc_msgSend(v3, "setSourceView:", self);
  objc_msgSend(v3, "setThreeDTouchEnabled:", 1);
  -[SearchUITableViewCell rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateWithResult:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  +[SearchUITableModel tableModelWithResult:](SearchUITableModel, "tableModelWithResult:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowModelForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUITableViewCell updateWithRowModel:](self, "updateWithRowModel:", v5);

}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SearchUITableViewCell setRowModel:](self, "setRowModel:", v4);
  -[SearchUITableViewCell dragSource](self, "dragSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDragObject:", v4);

  -[SearchUITableViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (NSArray)visibleResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SearchUITableViewCell rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SearchUITableViewCell rowModel](self, "rowModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifyingResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v7;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUITableViewCell;
  -[SearchUITableViewCell willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
    -[SearchUITableViewCell removeKeyboardHandler](self, "removeKeyboardHandler");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUITableViewCell;
  -[SearchUITableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUITableViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUITableViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUITableViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUITableViewCell;
  -[SearchUITableViewCell didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUITableViewCell tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SearchUITableViewCell;
  -[SearchUITableViewCell tlk_updateForAppearance:](&v11, sel_tlk_updateForAppearance_, a3);
  -[SearchUITableViewCell rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SearchUITableViewCell backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setDelegate:", self);
      -[SearchUITableViewCell setBackgroundView:](self, "setBackgroundView:", v7);

    }
  }
  -[SearchUITableViewCell backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v5);
  -[SearchUITableViewCell rowModel](self, "rowModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundImage:", v10);

  objc_msgSend(v8, "setHidden:", v5 == 0);
}

- (void)_setAnimating:(BOOL)a3 clippingAdjacentCells:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  -[SearchUITableViewCell layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsGroupBlending");

  if (_setAnimating_clippingAdjacentCells__onceToken != -1)
    dispatch_once(&_setAnimating_clippingAdjacentCells__onceToken, &__block_literal_global_9);
  if (_setAnimating_clippingAdjacentCells__respondsToSelector)
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUITableViewCell;
    -[SearchUITableViewCell _setAnimating:clippingAdjacentCells:](&v10, sel__setAnimating_clippingAdjacentCells_, v5, v4);
  }
  -[SearchUITableViewCell layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupBlending:", v8);

}

uint64_t __61__SearchUITableViewCell__setAnimating_clippingAdjacentCells___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC3D50], "instancesRespondToSelector:", sel__setAnimating_clippingAdjacentCells_);
  _setAnimating_clippingAdjacentCells__respondsToSelector = result;
  return result;
}

- (void)updateWithResults:(id)a3
{
  id v4;

  objc_msgSend(a3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUITableViewCell updateWithResult:](self, "updateWithResult:", v4);

}

- (BOOL)supportsRecycling
{
  return 1;
}

- (BOOL)isExpandable
{
  return 0;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  UIEdgeInsets *p_customEdgeInsets;
  void *v12;
  char isKindOfClass;
  void *v14;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_customEdgeInsets = &self->_customEdgeInsets;
  if (a3.left != self->_customEdgeInsets.left
    || a3.top != self->_customEdgeInsets.top
    || a3.right != self->_customEdgeInsets.right
    || a3.bottom != self->_customEdgeInsets.bottom)
  {
    -[SearchUITableViewCell dragSource](self, "dragSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SearchUITableViewCell dragSource](self, "dragSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCustomEdgeInsets:", top, left, bottom, right);

    }
    p_customEdgeInsets->top = top;
    p_customEdgeInsets->left = left;
    p_customEdgeInsets->bottom = bottom;
    p_customEdgeInsets->right = right;
    -[SearchUITableViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SearchUITableViewCell sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUITableViewCell;
    -[SearchUITableViewCell intrinsicContentSize](&v10, sel_intrinsicContentSize);
  }
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_customInsetSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = self->_customEdgeInsets.left + self->_customEdgeInsets.right;
  v3 = self->_customEdgeInsets.top + self->_customEdgeInsets.bottom;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SearchUITableViewCell _customInsetSize](self, "_customInsetSize");
  v11 = width - v10;
  if (v11 >= 0.0)
    v12 = v11;
  else
    v12 = 0.0;
  -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v17 = a4;
    *(float *)&v18 = a5;
    objc_msgSend(v16, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v12, height, v17, v18);
    v20 = v19;
    v22 = v21;

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SearchUITableViewCell;
    *(float *)&v14 = a4;
    *(float *)&v15 = a5;
    -[SearchUITableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v30, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v12, height, v14, v15);
    v20 = v23;
    v22 = v24;
  }

  -[SearchUITableViewCell _customInsetSize](self, "_customInsetSize");
  v26 = v20 + v25;
  -[SearchUITableViewCell _customInsetSize](self, "_customInsetSize");
  v28 = v22 + v27;
  v29 = v26;
  result.height = v28;
  result.width = v29;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SearchUITableViewCell _customInsetSize](self, "_customInsetSize");
  v7 = width - v6;
  -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeThatFits:", v7, height);
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SearchUITableViewCell;
    -[SearchUITableViewCell sizeThatFits:](&v21, sel_sizeThatFits_, v7, height);
    v11 = v14;
    v13 = v15;
  }

  -[SearchUITableViewCell _customInsetSize](self, "_customInsetSize");
  v17 = v11 + v16;
  -[SearchUITableViewCell _customInsetSize](self, "_customInsetSize");
  v19 = v13 + v18;
  v20 = v17;
  result.height = v19;
  result.width = v20;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)SearchUITableViewCell;
  -[SearchUITableViewCell layoutSubviews](&v36, sel_layoutSubviews);
  -[SearchUITableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  top = self->_customEdgeInsets.top;
  left = self->_customEdgeInsets.left;
  v7 = v6 + left;
  v9 = v8 + top;
  v11 = v10 - (left + self->_customEdgeInsets.right);
  v13 = v12 - (top + self->_customEdgeInsets.bottom);
  -[SearchUITableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[SearchUITableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  v25 = -[SearchUITableViewCell sfSeparatorStyle](self, "sfSeparatorStyle");
  if ((_DWORD)v25 != 1)
  {
    v26 = v25;
    -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutIfNeeded");

    -[SearchUITableViewCell leadingView](self, "leadingView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUITableViewCell leadingTextView](self, "leadingTextView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUICardSectionView separatorInsetsForStyle:cellView:leadingView:leadingTextView:](SearchUICardSectionView, "separatorInsetsForStyle:cellView:leadingView:leadingTextView:", v26, self, v28, v29);
    v31 = v30;
    v33 = v32;
    v35 = v34;

    -[SearchUITableViewCell setSeparatorInset:](self, "setSeparatorInset:", v31, v33, v35, 16.0);
  }
}

- (BOOL)canSetupKeyboardHandler
{
  return 0;
}

- (BOOL)navigateKeyboardLeft
{
  return 0;
}

- (BOOL)navigateKeyboardRight
{
  return 0;
}

- (BOOL)navigateKeyboardUp
{
  return 0;
}

- (BOOL)navigateKeyboardDown
{
  return 0;
}

- (id)keyboardResultForFocus
{
  void *v2;
  void *v3;

  -[SearchUITableViewCell rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keyboardCardSectionForFocus
{
  void *v2;
  void *v3;

  -[SearchUITableViewCell rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DBD9B0], "tappableControlViewForPoint:inView:withEvent:", self, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SearchUITableViewCell;
    -[SearchUITableViewCell hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_customEdgeInsets.top;
  left = self->_customEdgeInsets.left;
  bottom = self->_customEdgeInsets.bottom;
  right = self->_customEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
  objc_storeStrong((id *)&self->_rowModel, a3);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (SearchUIFeedbackDelegateInternal)delegate
{
  return (SearchUIFeedbackDelegateInternal *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)sizingContainer
{
  return self->_sizingContainer;
}

- (void)setSizingContainer:(id)a3
{
  objc_storeStrong((id *)&self->_sizingContainer, a3);
}

- (SearchUIDragSource)dragSource
{
  return self->_dragSource;
}

- (void)setDragSource:(id)a3
{
  objc_storeStrong((id *)&self->_dragSource, a3);
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)leadingTextView
{
  return self->_leadingTextView;
}

- (int)sfSeparatorStyle
{
  return self->_sfSeparatorStyle;
}

- (void)setSfSeparatorStyle:(int)a3
{
  self->_sfSeparatorStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_sizingContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end
