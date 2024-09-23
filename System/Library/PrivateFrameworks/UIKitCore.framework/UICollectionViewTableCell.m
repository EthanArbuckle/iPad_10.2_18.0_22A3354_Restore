@implementation UICollectionViewTableCell

- (BOOL)isInTableLayout
{
  void *v2;
  char isKindOfClass;

  -[UICollectionViewTableCell currentLayout](self, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)allowsMultipleSelection
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsMultipleSelection");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)_rawSeparatorInset
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
  UIEdgeInsets result;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_rawSeparatorInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v12 = 0.0;
    v10 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (BOOL)_shouldDrawThickSeparators
{
  void *v2;
  char v3;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldDrawThickSeparators");

  return v3;
}

- (UICollectionViewTableLayout)_tableLayout
{
  void *v2;
  id v3;

  -[UICollectionViewTableCell currentLayout](self, "currentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (UICollectionViewTableLayout *)v3;
}

- (UICollectionViewLayout)currentLayout
{
  return (UICollectionViewLayout *)objc_loadWeakRetained((id *)&self->_currentLayout);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._collectionView);
  objc_msgSend(WeakRetained, "collectionViewLayout");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_6:
    v15 = v4;
    goto LABEL_7;
  }
  v7 = (void *)v6;
  v8 = objc_loadWeakRetained((id *)&self->super.super._collectionView);
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_estimatesSizes");

  if (!v10)
    goto LABEL_6;
  v11 = objc_loadWeakRetained((id *)&self->super.super._collectionView);
  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_cellsShouldConferWithAutolayoutEngineForSizingInfo");

  if (!v13)
    goto LABEL_6;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _preferredAttributesFittingAttributesWithInnerView(self, v4, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v15;
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsMultipleSelectionDuringEditing");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setSelectedBackgroundView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedBackgroundView:", v4);

}

- (void)setBackgroundView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundView:", v4);

}

- (BOOL)showsReorderControl
{
  void *v2;
  char v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsReorderControl");

  return v3;
}

- (void)applyLayoutAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UICollectionViewTableCell;
  -[UICollectionReusableView applyLayoutAttributes:](&v13, sel_applyLayoutAttributes_, a3);
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableCell _tableAttributes](self, "_tableAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableCell currentLayout](self, "currentLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewTableCell setCurrentLayout:](self, "setCurrentLayout:", v8);

    -[UICollectionViewTableCell _updateInternalCellForTableLayout:animated:](self, "_updateInternalCellForTableLayout:animated:", -[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout"), 0);
    -[UICollectionViewTableCell updateCellForTableLayout:](self, "updateCellForTableLayout:", -[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout"));
  }
  if (v5)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(v9, "applyValuesFromAttributes:toAttributes:valueOptions:", v5, v4, objc_msgSend((id)objc_opt_class(), "automaticValueOptionsForRepresentedElementCategory:", objc_msgSend(v5, "representedElementCategory")));
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "_constants");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultLayoutMarginsForCell:inTableView:", v4, v11);
      objc_msgSend(v4, "setLayoutMargins:");

    }
  }
  if (qword_1ECD7AE80 != -1)
    dispatch_once(&qword_1ECD7AE80, &__block_literal_global_107);
  if (!_MergedGlobals_11_3)
    -[UICollectionViewTableCell _updateEditing](self, "_updateEditing");
  if (-[UICollectionViewTableCell transitioningLayouts](self, "transitioningLayouts"))
  {
    -[UICollectionViewTableCell updateCellForTableLayout:](self, "updateCellForTableLayout:", -[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout"));
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (BOOL)transitioningLayouts
{
  return self->_transitioningLayouts;
}

- (void)setCurrentLayout:(id)a3
{
  objc_storeWeak((id *)&self->_currentLayout, a3);
}

- (void)_updateInternalCellForTableLayout:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  UICollectionViewTableCell *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;
  _QWORD v34[4];

  v4 = a4;
  v5 = a3;
  v34[3] = *MEMORY[0x1E0C80C00];
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v5)
    {
      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke;
      aBlock[3] = &unk_1E16B6288;
      v9 = v7;
      v33 = v9;
      v10 = _Block_copy(aBlock);
      v34[0] = v10;
      v30[0] = v8;
      v30[1] = 3221225472;
      v30[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_2;
      v30[3] = &unk_1E16B6288;
      v11 = v9;
      v31 = v11;
      v12 = _Block_copy(v30);
      v34[1] = v12;
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_3;
      v28[3] = &unk_1E16BC8C0;
      v13 = v11;
      v29 = v13;
      v14 = _Block_copy(v28);
      v34[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_4;
      v23[3] = &unk_1E16B51E8;
      v24 = v13;
      v25 = self;
      v26 = v15;
      v17 = v16;
      v27 = v17;
      v18 = v15;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
      if (v4)
        v19 = 0.25;
      else
        v19 = 0.0;
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_5;
      v21[3] = &unk_1E16B1B28;
      v22 = v17;
      v20 = v17;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v21, v19);

    }
    else
    {
      objc_msgSend(v7, "setAccessoryType:", 0);
      objc_msgSend(v7, "_setSeparatorHidden:", 1);
      objc_msgSend(v7, "_setAccessoryViewsHidden:", 1);
    }
  }

}

- (void)_updateEditing
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[UICollectionViewTableCell _tableAttributes](self, "_tableAttributes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout"))
    goto LABEL_7;
  if (-[UICollectionViewTableCell isEditing](self, "isEditing")
    || !-[UICollectionViewTableCell allowsMultipleSelection](self, "allowsMultipleSelection"))
  {
    if (-[UICollectionViewTableCell isEditing](self, "isEditing"))
    {
      v3 = -[UICollectionViewTableCell allowsMultipleSelectionDuringEditing](self, "allowsMultipleSelectionDuringEditing");
      goto LABEL_8;
    }
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v3 = 1;
LABEL_8:
  v4 = -[UICollectionViewTableCell isEditing](self, "isEditing");
  objc_msgSend(v7, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 1;
  -[UICollectionViewTableCell _setupForEditing:atIndexPath:multiselect:editingStyle:shouldIndentWhileEditing:showsReorderControl:accessoryType:updateSeparators:](self, "_setupForEditing:atIndexPath:multiselect:editingStyle:shouldIndentWhileEditing:showsReorderControl:accessoryType:updateSeparators:", v4, v5, v3, objc_msgSend(v7, "editingStyle"), objc_msgSend(v7, "shouldIndentWhileEditing"), objc_msgSend(v7, "showsReorderControl"), objc_msgSend(v7, "accessoryType"), v6);

}

- (UICollectionViewTableLayoutAttributes)_tableAttributes
{
  void *v2;
  id v3;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (UICollectionViewTableLayoutAttributes *)v3;
}

- (void)_setupForEditing:(BOOL)a3 atIndexPath:(id)a4 multiselect:(BOOL)a5 editingStyle:(int64_t)a6 shouldIndentWhileEditing:(BOOL)a7 showsReorderControl:(BOOL)a8 accessoryType:(int64_t)a9 updateSeparators:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v13;
  _BOOL4 v14;
  id v16;

  v10 = a8;
  v11 = a7;
  v13 = a5;
  v14 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell", a3, a4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v16, "_setShowsReorderControl:", v10);
    objc_msgSend(v16, "_setEditingStyle:", a6);
    objc_msgSend(v16, "_setShouldIndentWhileEditing:", v11);
    objc_msgSend(v16, "_setEditing:animated:cellOrAncestorViewForAnimatedLayout:", 1, 1, self);
  }
  else
  {
    objc_msgSend(v16, "_setShowsReorderControl:", 0);
    objc_msgSend(v16, "_setEditing:animated:cellOrAncestorViewForAnimatedLayout:", 0, 1, self);
    objc_msgSend(v16, "_setEditingStyle:", 0);
    objc_msgSend(v16, "_setShouldIndentWhileEditing:", 0);
    objc_msgSend(v16, "setWasSwiped:", 0);
    objc_msgSend(v16, "_setShowingDeleteConfirmation:", 0);
  }
  objc_msgSend(v16, "_setMultiselecting:", v13);

}

- (UICollectionViewTableCell)initWithFrame:(CGRect)a3
{
  UICollectionViewTableCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewTableCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UICollectionViewTableCell _commonSetupTableCell](v3, "_commonSetupTableCell");
  return v3;
}

- (void)_commonSetupTableCell
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *v6;
  UIView *swipeableView;
  void *v8;
  uint64_t v9;
  UITableViewCollectionCell *v10;

  v10 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCollectionCell alloc], "initWithStyle:reuseIdentifier:", 0, &stru_1E16EDF20);
  -[UIView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  -[UITableViewCell _setTableView:](v10, "_setTableView:", self);
  -[UICollectionViewTableCell setTableViewCell:](self, "setTableViewCell:", v10);
  -[UICollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell contentView](v10, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [UIView alloc];
  -[UIView bounds](v10, "bounds");
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  swipeableView = self->_swipeableView;
  self->_swipeableView = v6;

  -[UIView setAutoresizingMask:](self->_swipeableView, "setAutoresizingMask:", 18);
  -[UIView setEdgesPreservingSuperviewLayoutMargins:](self->_swipeableView, "setEdgesPreservingSuperviewLayoutMargins:", 10);
  -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](self->_swipeableView, "setEdgesInsettingLayoutMarginsFromSafeArea:", -[UIView edgesInsettingLayoutMarginsFromSafeArea](self->_swipeableView, "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
  -[UIView addSubview:](v10, "addSubview:", self->_swipeableView);
  objc_msgSend(v4, "removeFromSuperview");
  -[UIView addSubview:](self->_swipeableView, "addSubview:", v4);
  objc_msgSend(v3, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");
    objc_msgSend(v3, "setAutoresizingMask:", 18);
    objc_msgSend(v4, "addSubview:", v3);
  }
  else
  {
    objc_msgSend(v3, "removeFromSuperview");
  }
  -[UIView setEdgesPreservingSuperviewLayoutMargins:](self, "setEdgesPreservingSuperviewLayoutMargins:", 10);
  -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](self, "setEdgesInsettingLayoutMarginsFromSafeArea:", -[UIView edgesInsettingLayoutMarginsFromSafeArea](self, "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
  -[UIView addSubview:](self, "addSubview:", v10);
  -[UICollectionViewCell _setContentView:addToHierarchy:](self, "_setContentView:addToHierarchy:", v4, 0);

}

- (void)setTableViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCell, a3);
}

- (void)setSeparatorInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSeparatorInset:", top, left, bottom, right);

}

- (UIEdgeInsets)_contentViewInset
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat MinY;
  CGFloat MinX;
  double Height;
  double v17;
  double Width;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  UIEdgeInsets result;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentStateMask") & 1;
  objc_msgSend(v3, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentEndingRectForCell:forNewEditingState:", v3, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  MinX = CGRectGetMinX(v25);
  -[UIView bounds](self, "bounds");
  Height = CGRectGetHeight(v26);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  v17 = Height - CGRectGetMaxY(v27);
  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v28);
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  v19 = Width - CGRectGetMaxX(v29);

  v20 = MinY;
  v21 = MinX;
  v22 = v17;
  v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  -[UICollectionViewTableCell _layoutTableViewCell](self, "_layoutTableViewCell");
  -[UICollectionViewTableCell _layoutInteractiveMoveShadow](self, "_layoutInteractiveMoveShadow");
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTableCell;
  -[UICollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
}

- (void)_layoutTableViewCell
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_layoutInteractiveMoveShadow
{
  _BOOL4 v3;

  v3 = -[UICollectionViewTableCell borderShadowVisible](self, "borderShadowVisible");
  if (v3 != -[UICollectionViewTableCell _isInteractiveMoveShadowInstalled](self, "_isInteractiveMoveShadowInstalled"))
  {
    if (v3)
      -[UICollectionViewTableCell _insertInteractiveMoveShadowViews](self, "_insertInteractiveMoveShadowViews");
    else
      -[UICollectionViewTableCell _removeInteractiveMoveShadowViews](self, "_removeInteractiveMoveShadowViews");
  }
}

- (BOOL)borderShadowVisible
{
  return self->_borderShadowVisible;
}

- (BOOL)_isInteractiveMoveShadowInstalled
{
  void *v2;
  BOOL v3;

  -[UIView superview](self->_borderShadowTopView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setSelectionStyle:(int64_t)a3
{
  id v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectionStyle:", a3);

}

- (UIEdgeInsets)separatorInset
{
  void *v2;
  double v3;
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
  UIEdgeInsets result;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "separatorInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (BOOL)isSelected
{
  void *v2;
  char v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelected");

  return v3;
}

- (UITableViewCollectionCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[UICollectionViewTableCell _updateEditing](self, "_updateEditing");
  }
}

- (BOOL)canBeEdited
{
  return 1;
}

void __51__UICollectionViewTableCell_applyLayoutAttributes___block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_11_3 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Music"));

}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTableCell;
  -[NSObject awakeFromNib](&v3, sel_awakeFromNib);
  -[UICollectionViewTableCell _commonSetupTableCell](self, "_commonSetupTableCell");
}

- (UIView)swipeableView
{
  return self->_swipeableView;
}

- (void)_insertInteractiveMoveShadowViews
{
  UIShadowView *borderShadowTopView;
  UIShadowView *v4;
  UIShadowView *v5;
  UIShadowView *v6;
  UIShadowView *v7;
  void *v8;
  void *v9;
  UIShadowView *borderShadowBottomView;
  UIShadowView *v11;
  UIShadowView *v12;
  UIShadowView *v13;
  UIShadowView *v14;
  void *v15;
  id v16;

  borderShadowTopView = self->_borderShadowTopView;
  if (!borderShadowTopView)
  {
    v4 = [UIShadowView alloc];
    -[UIView bounds](self, "bounds");
    v5 = -[UIShadowView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_borderShadowTopView;
    self->_borderShadowTopView = v5;

    v7 = self->_borderShadowTopView;
    +[UIShadowView topShadowImage](UIShadowView, "topShadowImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShadowView setShadowImage:forEdge:inside:](v7, "setShadowImage:forEdge:inside:", v8, 1, 0);

    borderShadowTopView = self->_borderShadowTopView;
  }
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", borderShadowTopView, v9);

  borderShadowBottomView = self->_borderShadowBottomView;
  if (!borderShadowBottomView)
  {
    v11 = [UIShadowView alloc];
    -[UIView bounds](self, "bounds");
    v12 = -[UIShadowView initWithFrame:](v11, "initWithFrame:");
    v13 = self->_borderShadowBottomView;
    self->_borderShadowBottomView = v12;

    v14 = self->_borderShadowBottomView;
    +[UIShadowView bottomShadowImage](UIShadowView, "bottomShadowImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShadowView setShadowImage:forEdge:inside:](v14, "setShadowImage:forEdge:inside:", v15, 4, 0);

    borderShadowBottomView = self->_borderShadowBottomView;
  }
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", borderShadowBottomView, v16);

}

- (void)_removeInteractiveMoveShadowViews
{
  UIShadowView *borderShadowTopView;
  UIShadowView *borderShadowBottomView;

  -[UIView removeFromSuperview](self->_borderShadowTopView, "removeFromSuperview");
  borderShadowTopView = self->_borderShadowTopView;
  self->_borderShadowTopView = 0;

  -[UIView removeFromSuperview](self->_borderShadowBottomView, "removeFromSuperview");
  borderShadowBottomView = self->_borderShadowBottomView;
  self->_borderShadowBottomView = 0;

}

- (void)setInteractiveMoveEffectsVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  UIView *v7;
  _BOOL4 interactiveMoveEffectsVisible;
  void *v9;
  UIView *v10;

  if (self->_interactiveMoveEffectsVisible != a3)
  {
    self->_interactiveMoveEffectsVisible = a3;
    if (a3)
    {
      -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_constants");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "reorderingCellWantsShadows");

    }
    else
    {
      v6 = 0;
    }
    -[UICollectionViewTableCell setBorderShadowVisible:](self, "setBorderShadowVisible:", v6);
    if (self->_interactiveMoveEffectsVisible)
      v7 = (UIView *)objc_opt_new();
    else
      v7 = self->_selectedBackgroundViewToRestoreWhenInteractiveMoveEnds;
    v10 = v7;
    interactiveMoveEffectsVisible = self->_interactiveMoveEffectsVisible;
    if (self->_interactiveMoveEffectsVisible)
    {
      -[UICollectionViewTableCell selectedBackgroundView](self, "selectedBackgroundView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_storeStrong((id *)&self->_selectedBackgroundViewToRestoreWhenInteractiveMoveEnds, v9);
    if (interactiveMoveEffectsVisible)

    -[UICollectionViewTableCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v10);
  }
}

- (void)setBorderShadowVisible:(BOOL)a3
{
  if (self->_borderShadowVisible != a3)
  {
    self->_borderShadowVisible = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessoryView:", 0);
}

uint64_t __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_separatorView:", 0);
}

id __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "editingData:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "editControl:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAccessoryType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 680));
  objc_msgSend(*(id *)(a1 + 32), "_setSeparatorHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setAccessoryViewsHidden:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = *(void **)(a1 + 56);
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "alpha", (_QWORD)v12);
          objc_msgSend(v10, "numberWithDouble:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v11, v8);

        }
        objc_msgSend(v8, "setAlpha:", 0.0, (_QWORD)v12);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __72__UICollectionViewTableCell__updateInternalCellForTableLayout_animated___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = v9;

        objc_msgSend(v7, "setAlpha:", v10);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v6;
  void *v7;
  int v8;
  char isKindOfClass;
  char v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  v6 = a4;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass() & 1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v8 != (isKindOfClass & 1))
  {
    v10 = isKindOfClass;
    objc_msgSend(v7, "removeEditingData");
    -[UICollectionViewTableCell setTransitioningLayouts:](self, "setTransitioningLayouts:", 1);
    -[UICollectionViewTableCell setCurrentLayout:](self, "setCurrentLayout:", v6);
    -[UICollectionViewTableCell _updateEditing](self, "_updateEditing");
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v7, "_setAccessoryViewsHidden:", 1);
    }
    else
    {
      -[UICollectionViewTableCell _updateInternalCellForTableLayout:animated:](self, "_updateInternalCellForTableLayout:animated:", 0, 0);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63__UICollectionViewTableCell_willTransitionFromLayout_toLayout___block_invoke;
      v12[3] = &unk_1E16B1B28;
      v13 = v11;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);

    }
  }

}

uint64_t __63__UICollectionViewTableCell_willTransitionFromLayout_toLayout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetSwipedRowWithCompletion:", 0);
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  if (-[UICollectionViewTableCell transitioningLayouts](self, "transitioningLayouts", a3, a4))
  {
    if (-[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout"))
      -[UICollectionViewTableCell _updateInternalCellForTableLayout:animated:](self, "_updateInternalCellForTableLayout:animated:", 1, 1);
    -[UICollectionViewTableCell setTransitioningLayouts:](self, "setTransitioningLayouts:", 0);
  }
}

- (void)_trackAnimator:(id)a3
{
  id v4;
  NSMutableSet *trackedAnimators;
  NSMutableSet *v6;
  NSMutableSet *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  trackedAnimators = self->_trackedAnimators;
  if (trackedAnimators)
  {
    -[NSMutableSet addObject:](trackedAnimators, "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trackedAnimators;
    self->_trackedAnimators = v6;

  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__UICollectionViewTableCell__trackAnimator___block_invoke;
  v8[3] = &unk_1E16B3F18;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  objc_msgSend(v4, "addCompletion:", v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __44__UICollectionViewTableCell__trackAnimator___block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained[86], "removeObject:", v2);

}

- (void)prepareForReuse
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int has_internal_diagnostics;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  objc_super v27;
  _QWORD v28[5];
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_trackedAnimators, "copy");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "stopAnimation:", 0);
        if (objc_msgSend(v10, "state") == 5)
          ++v7;
        else
          objc_msgSend(v10, "finishAnimationAtPosition:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v12 = -[NSMutableSet count](self->_trackedAnimators, "count");
  if (has_internal_diagnostics)
  {
    if (v12 != v7)
    {
      __UIFaultDebugAssertLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "Animations pending while being reused. This is a UIKit issue.", buf, 2u);
      }

    }
  }
  else if (v12 != v7)
  {
    v25 = prepareForReuse___s_category;
    if (!prepareForReuse___s_category)
    {
      v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v25, (unint64_t *)&prepareForReuse___s_category);
    }
    v26 = *(NSObject **)(v25 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "Animations pending while being reused. This is a UIKit issue.", buf, 2u);
    }
  }
  -[UICollectionViewTableCell swipeableView](self, "swipeableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UICollectionViewTableCell swipeableView](self, "swipeableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[UICollectionViewTableCell _setOffsetForRevealingDeleteConfirmationButton:](self, "_setOffsetForRevealingDeleteConfirmationButton:", 0.0);
  -[UITableViewCell prepareForReuse](self->_tableViewCell, "prepareForReuse");
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __44__UICollectionViewTableCell_prepareForReuse__block_invoke;
  v28[3] = &unk_1E16B1B28;
  v28[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
  -[UICollectionViewTableCell setCurrentLayout:](self, "setCurrentLayout:", 0);
  v27.receiver = self;
  v27.super_class = (Class)UICollectionViewTableCell;
  -[UICollectionViewCell prepareForReuse](&v27, sel_prepareForReuse);

}

uint64_t __44__UICollectionViewTableCell_prepareForReuse__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLayoutAttributes:", 0);
}

- (double)_selectionAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionFadeDuration");
  v4 = v3;

  return v4;
}

- (int64_t)_popoverControllerStyle
{
  return 0;
}

- (BOOL)_isInModalViewController
{
  return 0;
}

- (BOOL)_wasEditing
{
  return 0;
}

- (BOOL)_canFocusCell:(id)a3
{
  return 1;
}

- (BOOL)_shouldShowMenuForCell:(id)a3
{
  return 0;
}

- (BOOL)_canPerformAction:(SEL)a3 forCell:(id)a4 sender:(id)a5
{
  return 0;
}

- (CGRect)_calloutTargetRectForCell:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_swipeToDeleteCell:(id)a3
{
  id v4;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_swipeToDeleteCell:", self);

}

- (BOOL)_isEditingForSwipeDeletion
{
  return 0;
}

- (id)_reorderingCell
{
  return 0;
}

- (BOOL)_isCellReorderable:(id)a3
{
  return 0;
}

- (BOOL)_isReorderControlActiveForCell:(id)a3
{
  return 1;
}

- (BOOL)_beginReorderingForCell:(id)a3 touch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "beginInteractiveMovementForItemAtIndexPath:", v8);

  if (v9)
  {
    -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "center");
    self->_reorderingCenterX = v11;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v5;
    objc_msgSend(v5, "gestureRecognizers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (_UISheetInteractionGestureIsForInteractiveDismiss(v17))
          {
            v18 = (void *)UIApp;
            v26 = v17;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_cancelGestureRecognizers:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    -[UICollectionViewTableCell setInteractiveMoveEffectsVisible:](self, "setInteractiveMoveEffectsVisible:", 1);
    v5 = v21;
    -[UICollectionViewTableCell _updateCollectionViewInteractiveMovementTargetPositionForTouch:](self, "_updateCollectionViewInteractiveMovementTargetPositionForTouch:", v21);
  }

  return v9;
}

- (void)_draggingReorderingCell:(id)a3 yDelta:(double)a4 touch:(id)a5
{
  -[UICollectionViewTableCell _updateCollectionViewInteractiveMovementTargetPositionForTouch:](self, "_updateCollectionViewInteractiveMovementTargetPositionForTouch:", a5, a4);
}

- (void)_updateCollectionViewInteractiveMovementTargetPositionForTouch:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v4);
  }
  else
  {
    -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
  }
  v6 = v5;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateInteractiveMovementTargetPosition:", self->_reorderingCenterX, v6);

}

- (void)_endReorderingForCell:(id)a3 wasCancelled:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;

  v5 = a4;
  -[UICollectionViewTableCell setInteractiveMoveEffectsVisible:](self, "setInteractiveMoveEffectsVisible:", 0, a4, a5);
  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "cancelInteractiveMovement");
  else
    objc_msgSend(v7, "endInteractiveMovement");

  self->_reorderingCenterX = 0.0;
}

- (void)_didInsertRowForTableCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UICollectionReusableView _collectionView](self, "_collectionView", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:tableLayout:commitEditingStyle:forRowAtIndexPath:", v8, v5, 2, v7);

  }
}

- (id)_titleForDeleteConfirmationButton:(id)a3
{
  return 0;
}

- (void)_animateDeletionOfRowAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:tableLayout:commitEditingStyle:forRowAtIndexPath:", v4, v6, 1, v7);

  }
}

- (void)_animateDeletionOfRowWithCell:(id)a3
{
  void *v4;
  id v5;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewTableCell _animateDeletionOfRowAtIndexPath:](self, "_animateDeletionOfRowAtIndexPath:", v4);

}

- (void)_accessoryButtonAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UICollectionReusableView _layoutAttributes](self, "_layoutAttributes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cellAccessoryButtonTappedAtIndexPath:", v6);

}

- (BOOL)selectionFollowsFocus
{
  void *v2;
  char v3;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectionFollowsFocus");

  return v3;
}

- (BOOL)_effectiveDefaultAllowsFocus
{
  void *v2;
  char v3;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_effectiveDefaultAllowsFocus");

  return v3;
}

- (double)_rowSpacing
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_rowSpacing");
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (int64_t)_tableStyle
{
  return 0;
}

- (UIScrollView)_scrollView
{
  void *v3;
  void *v4;
  void *v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIScrollView *)v5;
}

- (int64_t)_numberOfSections
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_numberOfSections");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)rowHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rowHeight");
    v6 = v5;

  }
  else
  {
    v6 = 44.0;
  }

  return v6;
}

- (double)sectionHeaderHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionHeaderHeight");
    v6 = v5;

  }
  else
  {
    v6 = 44.0;
  }

  return v6;
}

- (double)sectionFooterHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionFooterHeight");
    v6 = v5;

  }
  else
  {
    v6 = 44.0;
  }

  return v6;
}

- (double)estimatedRowHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "estimatedRowHeight");
    v6 = v5;

  }
  else
  {
    v6 = 44.0;
  }

  return v6;
}

- (double)estimatedSectionHeaderHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "estimatedSectionHeaderHeight");
    v6 = v5;

  }
  else
  {
    v6 = 44.0;
  }

  return v6;
}

- (double)estimatedSectionFooterHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "estimatedSectionFooterHeight");
    v6 = v5;

  }
  else
  {
    v6 = 44.0;
  }

  return v6;
}

- (BOOL)_separatorInsetIsRelativeToCellEdges
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_separatorInsetIsRelativeToCellEdges");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)usesVariableMargins
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "usesVariableMargins");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)overlapsSectionHeaderViews
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "overlapsSectionHeaderViews");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_backgroundInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_backgroundInset");
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (UIEdgeInsets)_cellSafeAreaInsets
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
  UIEdgeInsets result;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cellSafeAreaInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v12 = 0.0;
    v10 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (BOOL)cellLayoutMarginsFollowReadableWidth
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cellLayoutMarginsFollowReadableWidth");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)insetsContentViewsToSafeArea
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "insetsContentViewsToSafeArea");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (double)_topPadding
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_topPadding");
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)_bottomPadding
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_bottomPadding");
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)_isShowingIndex
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isShowingIndex");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGRect)_indexFrame
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

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_indexFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

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

- (double)_indexBarExtentFromEdge
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_indexBarExtentFromEdge");
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (UIEdgeInsets)_sectionContentInset
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
  UIEdgeInsets result;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sectionContentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v12 = 0.0;
    v10 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_rawSectionContentInset
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
  UIEdgeInsets result;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_rawSectionContentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v12 = 0.0;
    v10 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (double)_sectionCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sectionCornerRadius");
    v6 = v5;

  }
  else
  {
    v6 = -1.0;
  }

  return v6;
}

- (BOOL)_sectionContentInsetFollowsLayoutMargins
{
  void *v3;
  void *v4;
  char v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_sectionContentInsetFollowsLayoutMargins");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIColor)_accessoryBaseColor
{
  void *v3;
  void *v4;
  void *v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessoryBaseColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)_multiselectCheckmarkColor
{
  void *v3;
  void *v4;
  void *v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_multiselectCheckmarkColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (UIColor *)v5;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_numberOfRowsInSection:", a3);

  return v5;
}

- (BOOL)_shouldHaveHeaderViewForSection:(int64_t)a3
{
  void *v4;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "_shouldHaveHeaderViewForSection:", a3);

  return a3;
}

- (BOOL)_shouldHaveFooterViewForSection:(int64_t)a3
{
  void *v4;

  -[UICollectionViewTableCell _tableLayout](self, "_tableLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "_shouldHaveFooterViewForSection:", a3);

  return a3;
}

- (UIImageView)imageView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageView *)v3;
}

- (UILabel)textLabel
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (UILabel)detailTextLabel
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (id)backgroundView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)selectedBackgroundView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIView)multipleSelectionBackgroundView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "multipleSelectionBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setMultipleSelectionBackgroundView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMultipleSelectionBackgroundView:", v4);

}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)selectionStyle
{
  void *v2;
  int64_t v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectionStyle");

  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:animated:", v3, +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:animated:", v3, +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));

}

- (int64_t)editingStyle
{
  void *v2;
  int64_t v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "editingStyle");

  return v3;
}

- (void)setShowsReorderControl:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsReorderControl:", v3);

}

- (BOOL)shouldIndentWhileEditing
{
  void *v2;
  char v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldIndentWhileEditing");

  return v3;
}

- (void)setShouldIndentWhileEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldIndentWhileEditing:", v3);

}

- (int64_t)accessoryType
{
  void *v2;
  int64_t v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessoryType");

  return v3;
}

- (void)setAccessoryType:(int64_t)a3
{
  id v5;

  self->_accessoryType = a3;
  if (-[UICollectionViewTableCell isInTableLayout](self, "isInTableLayout"))
  {
    -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessoryType:", a3);

  }
}

- (UIView)accessoryView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setAccessoryView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", v4);

}

- (int64_t)editingAccessoryType
{
  void *v2;
  int64_t v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "editingAccessoryType");

  return v3;
}

- (void)setEditingAccessoryType:(int64_t)a3
{
  id v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditingAccessoryType:", a3);

}

- (UIView)editingAccessoryView
{
  void *v2;
  void *v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editingAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setEditingAccessoryView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditingAccessoryView:", v4);

}

- (int64_t)indentationLevel
{
  void *v2;
  int64_t v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indentationLevel");

  return v3;
}

- (void)setIndentationLevel:(int64_t)a3
{
  id v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIndentationLevel:", a3);

}

- (double)indentationWidth
{
  void *v2;
  double v3;
  double v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indentationWidth");
  v4 = v3;

  return v4;
}

- (void)setIndentationWidth:(double)a3
{
  id v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIndentationWidth:", a3);

}

- (BOOL)showingDeleteConfirmation
{
  void *v2;
  char v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showingDeleteConfirmation");

  return v3;
}

- (int64_t)focusStyle
{
  void *v2;
  int64_t v3;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "focusStyle");

  return v3;
}

- (void)setFocusStyle:(int64_t)a3
{
  id v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFocusStyle:", a3);

}

- (void)willTransitionToState:(unint64_t)a3
{
  id v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willTransitionToState:", a3);

}

- (void)didTransitionToState:(unint64_t)a3
{
  id v4;

  -[UICollectionViewTableCell tableViewCell](self, "tableViewCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTransitionToState:", a3);

}

- (UITableViewCell)_swipeToDeleteCell
{
  return self->_swipeToDeleteCell;
}

- (void)_setSwipeToDeleteCell:(id)a3
{
  objc_storeStrong((id *)&self->_swipeToDeleteCell, a3);
}

- (BOOL)interactiveMoveEffectsVisible
{
  return self->_interactiveMoveEffectsVisible;
}

- (void)setTransitioningLayouts:(BOOL)a3
{
  self->_transitioningLayouts = a3;
}

- (double)_offsetForRevealingDeleteConfirmationButton
{
  return self->_offsetForRevealingDeleteConfirmationButton;
}

- (void)_setOffsetForRevealingDeleteConfirmationButton:(double)a3
{
  self->_offsetForRevealingDeleteConfirmationButton = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentLayout);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_storeStrong((id *)&self->_swipeToDeleteCell, 0);
  objc_storeStrong((id *)&self->_trackedAnimators, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundViewToRestoreWhenInteractiveMoveEnds, 0);
  objc_storeStrong((id *)&self->_borderShadowBottomView, 0);
  objc_storeStrong((id *)&self->_borderShadowTopView, 0);
  objc_storeStrong((id *)&self->_swipeableView, 0);
}

@end
