@implementation UIPickerTableView

+ (BOOL)_isInternalTableView
{
  return 1;
}

- (UIPickerTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4 visibleRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIPickerTableView *v9;
  UIPickerTableView *v10;
  UIPickerTableView *v11;
  uint64_t v12;
  UIColor *textColor;
  NSMutableArray *v14;
  NSMutableArray *referencingCells;
  void *v16;
  _QWORD v18[4];
  UIPickerTableView *v19;
  objc_super v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)UIPickerTableView;
  v9 = -[UITableView initWithFrame:style:](&v20, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_selectionBarRow = -1;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__UIPickerTableView_initWithFrame_style_visibleRect___block_invoke;
    v18[3] = &unk_1E16B1B28;
    v11 = v9;
    v19 = v11;
    +[UIView _performForcedAppearanceModifications:](UIView, "_performForcedAppearanceModifications:", v18);
    *(_WORD *)&v11->_pickerTableFlags |= 0xC0u;
    v11->_lastClickedOffset = 2.22507386e-308;
    +[UIColor labelColor](UIColor, "labelColor");
    v12 = objc_claimAutoreleasedReturnValue();
    textColor = v11->_textColor;
    v11->_textColor = (UIColor *)v12;

    v11->_lastSelectedRow = 0;
    v11->_visibleRect.origin.x = x;
    v11->_visibleRect.origin.y = y;
    v11->_visibleRect.size.width = width;
    v11->_visibleRect.size.height = height;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    referencingCells = v11->_referencingCells;
    v11->_referencingCells = v14;

    -[UIScrollView _setShouldScrollAncestors:](v11, "_setShouldScrollAncestors:", 0);
    -[UITableView setEstimatedRowHeight:](v11, "setEstimatedRowHeight:", 0.0);
    -[UITableView setEstimatedSectionHeaderHeight:](v11, "setEstimatedSectionHeaderHeight:", 0.0);
    -[UITableView setEstimatedSectionFooterHeight:](v11, "setEstimatedSectionFooterHeight:", 0.0);
    -[UITableView setPrefetchingEnabled:](v11, "setPrefetchingEnabled:", 0);
    -[UITableView _scrollView](v11, "_scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setSupportsPointerDragScrolling:", 1);

  }
  return v10;
}

uint64_t __53__UIPickerTableView_initWithFrame_style_visibleRect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSeparatorStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setOpaque:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setScrollsToTop:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setAllowsSelection:", 0);
}

- (CGRect)_visibleBounds
{
  CGFloat x;
  double y;
  CGFloat height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  height = self->_visibleRect.size.height;
  -[UIScrollView contentOffset](self, "contentOffset");
  v7 = y + v6;
  v12.receiver = self;
  v12.super_class = (Class)UIPickerTableView;
  -[UITableView _visibleBounds](&v12, sel__visibleBounds);
  v9 = x;
  v10 = v7;
  v11 = height;
  result.size.height = v11;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)_pickerView
{
  void *v2;
  uint64_t v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_referencingCells;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setPickerTable:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)UIPickerTableView;
  -[UITableView dealloc](&v8, sel_dealloc);
}

- (void)setSelectionBarRect:(CGRect)a3
{
  self->_selectionBarRect = a3;
  -[UIPickerTableView _updateContentInsets](self, "_updateContentInsets");
}

- (CGRect)_selectionBarRectForBounds:(CGRect)a3
{
  CGRect *p_selectionBarRect;
  CGFloat MinY;

  p_selectionBarRect = &self->_selectionBarRect;
  MinY = CGRectGetMinY(a3);
  return CGRectOffset(*p_selectionBarRect, 0.0, MinY);
}

- (BOOL)_scrollRowAtIndexPathToSelectionBar:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "row");
  if (v7 >= -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", 0))
  {
    v14 = 0;
  }
  else
  {
    -[UIPickerTableView _setSelectionBarRow:](self, "_setSelectionBarRow:", objc_msgSend(v6, "row"));
    *(_WORD *)&self->_pickerTableFlags |= 0x100u;
    -[UIScrollView stopScrollingAndZooming](self, "stopScrollingAndZooming");
    *(_WORD *)&self->_pickerTableFlags &= ~0x100u;
    -[UIPickerTableView contentOffsetForRowAtIndexPath:](self, "contentOffsetForRowAtIndexPath:", v6);
    v9 = v8;
    v11 = v10;
    -[UIScrollView contentOffset](self, "contentOffset");
    v14 = v11 != v13 || v9 != v12;
    -[UIScrollView setContentOffset:animated:](self, "setContentOffset:animated:", v4, v9, v11);
    -[UIPickerTableView _notifyContentOffsetChange](self, "_notifyContentOffsetChange");
  }

  return v14;
}

- (id)_checkedRows
{
  NSMutableIndexSet *checkedRows;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *v5;

  checkedRows = self->_checkedRows;
  if (!checkedRows)
  {
    v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    v5 = self->_checkedRows;
    self->_checkedRows = v4;

    checkedRows = self->_checkedRows;
  }
  return checkedRows;
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  return -[UIPickerTableView selectRow:animated:notify:updateChecked:](self, "selectRow:animated:notify:updateChecked:", a3, a4, a5, 1);
}

- (BOOL)selectRow:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5 updateChecked:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL8 v8;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  __int16 v19;
  void *v20;
  _BOOL4 v21;
  __int16 pickerTableFlags;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  void *v26;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[5];
  id v36;
  int64_t v37;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  -[UIPickerTableView _checkedRows](self, "_checkedRows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerTableView _pickerView](self, "_pickerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UITableView allowsMultipleSelection](self, "allowsMultipleSelection");
  v14 = v13;
  v15 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    if (!v13)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke;
      v35[3] = &unk_1E16BAF70;
      v37 = a3;
      v35[4] = self;
      v36 = v12;
      objc_msgSend(v11, "enumerateIndexesUsingBlock:", v35);
      objc_msgSend(v11, "removeAllIndexes");

    }
    objc_msgSend(v11, "addIndex:", a3);
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__159;
  v33 = __Block_byref_object_dispose__159;
  v34 = 0;
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke_94;
  v28[3] = &unk_1E16DB6C8;
  v28[4] = self;
  v28[5] = &v29;
  v28[6] = a3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & v6) == 1)
  {
    objc_msgSend((id)v30[5], "wrappedView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v14 && (objc_msgSend(v16, "isChecked") & 1) != 0)
      {
        if (objc_msgSend(v16, "isChecked"))
          objc_msgSend(v11, "removeIndex:", a3);
        v17 = 0;
        v18 = 0;
      }
      else
      {
        v18 = objc_msgSend(v16, "isChecked") ^ 1;
        v17 = 1;
      }
      objc_msgSend(v16, "setChecked:", v17);
      objc_msgSend(v12, "_sendCheckedRow:inTableView:checked:", a3, self, v17);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  if (v7)
    v19 = 16;
  else
    v19 = 24;
  *(_WORD *)&self->_pickerTableFlags = *(_WORD *)&self->_pickerTableFlags & 0xFFE7 | v19;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[UIPickerTableView _scrollRowAtIndexPathToSelectionBar:animated:](self, "_scrollRowAtIndexPathToSelectionBar:animated:", v20, v8)&& v8;

  pickerTableFlags = (__int16)self->_pickerTableFlags;
  if (!v21)
  {
    pickerTableFlags &= ~0x10u;
    *(_WORD *)&self->_pickerTableFlags = pickerTableFlags;
  }
  if (v21)
    v23 = -33;
  else
    v23 = -41;
  v24 = pickerTableFlags & v23;
  if (v21)
    v25 = 32;
  else
    v25 = 0;
  *(_WORD *)&self->_pickerTableFlags = v24 | v25;
  if (!v21 && (v18 & objc_msgSend(v12, "_usesCheckSelection")) == 1)
  {
    -[UIPickerTableView _pickerView](self, "_pickerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_sendSelectionChangedFromTable:notify:", self, 1);

  }
  _Block_object_dispose(&v29, 8);

  return v21;
}

void __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;

  if (*(_QWORD *)(a1 + 48) != a2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "wrappedView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "setChecked:", 0);
        objc_msgSend(*(id *)(a1 + 40), "_sendCheckedRow:inTableView:checked:", a2, *(_QWORD *)(a1 + 32), 0);
      }

      v7 = v9;
    }

  }
}

void __61__UIPickerTableView_selectRow_animated_notify_updateChecked___block_invoke_94(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a1[6], 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)didSelectDisabled:(BOOL)a3
{
  $445D910803DD928BED433837BC470391 pickerTableFlags;

  pickerTableFlags = self->_pickerTableFlags;
  if (a3)
    *(_WORD *)&self->_pickerTableFlags = *(_WORD *)&pickerTableFlags & 0xFFF7;
  return (*(unsigned int *)&pickerTableFlags >> 3) & 1;
}

- (void)_rectChangedWithNewSize:(CGSize)a3 oldSize:(CGSize)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPickerTableView;
  -[UITableView _rectChangedWithNewSize:oldSize:](&v5, sel__rectChangedWithNewSize_oldSize_, a3.width, a3.height, a4.width, a4.height);
  -[UIPickerTableView _updateContentInsets](self, "_updateContentInsets");
}

- (void)_updateContentInsets
{
  CGRect *p_selectionBarRect;
  double MinY;
  double Height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  int64_t v12;
  id v13;
  CGRect v14;

  p_selectionBarRect = &self->_selectionBarRect;
  MinY = CGRectGetMinY(self->_selectionBarRect);
  -[UIView frame](self, "frame");
  Height = CGRectGetHeight(v14);
  v6 = Height - CGRectGetMaxY(*p_selectionBarRect);
  -[UIScrollView contentInset](self, "contentInset");
  v11 = v10 == 0.0 && MinY == v7;
  if (!v11 || v9 != 0.0 || v6 != v8)
  {
    v12 = -[UIPickerTableView selectionBarRow](self, "selectionBarRow");
    *(_WORD *)&self->_pickerTableFlags |= 0x200u;
    -[UITableView setContentInset:](self, "setContentInset:", MinY, 0.0, v6, 0.0);
    *(_WORD *)&self->_pickerTableFlags &= ~0x200u;
    if (v12 != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[UIPickerTableView selectionBarRow](self, "selectionBarRow"), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPickerTableView _scrollRowAtIndexPathToSelectionBar:animated:](self, "_scrollRowAtIndexPathToSelectionBar:animated:", v13, 0);

    }
  }
}

- (int64_t)_contentInsetAdjustmentBehavior
{
  return 2;
}

- (CATransform3D)_transformForCellAtY:(SEL)a3
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CATransform3D *result;
  id v19;

  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", objc_msgSend(v7, "userInterfaceIdiom"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UITableView rowHeight](self, "rowHeight");
  v17 = v19;
  if (v19)
  {
    objc_msgSend(v19, "transformForCellAtY:inBounds:rowHeight:selectionBarRect:", a4, v9, v11, v13, v15, v16, *(_QWORD *)&self->_selectionBarRect.origin.x, *(_QWORD *)&self->_selectionBarRect.origin.y, *(_QWORD *)&self->_selectionBarRect.size.width, *(_QWORD *)&self->_selectionBarRect.size.height);
    v17 = v19;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_notifyContentOffsetChange
{
  id v3;

  -[UIPickerTableView _containerView](self, "_containerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pickerTableViewDidChangeContentOffset:", self);

}

- (void)_setContentOffset:(CGPoint)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  __int16 v18;
  int v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int64_t v24;
  void *v25;
  objc_super v26;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[UIScrollView contentOffset](self, "contentOffset");
  v9 = v8;
  v26.receiver = self;
  v26.super_class = (Class)UIPickerTableView;
  -[UITableView setContentOffset:](&v26, sel_setContentOffset_, x, y);
  if (!-[UIScrollView isScrollAnimating](self, "isScrollAnimating")
    && (*(_WORD *)&self->_pickerTableFlags & 0x300) == 0)
  {
    if (v9 >= y)
    {
      if (v9 <= y)
        goto LABEL_21;
      v19 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      -[UITableView _sectionContentInset](self, "_sectionContentInset");
      if ((*(_QWORD *)&v19 & 0x80000) != 0)
        v22 = v21;
      else
        v22 = v20;
      -[UITableView indexPathForRowAtPoint:](self, "indexPathForRowAtPoint:", v22, y + CGRectGetMaxY(self->_selectionBarRect) + -1.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      if (!v23)
        goto LABEL_20;
      v24 = objc_msgSend(v23, "row");
      v17 = v24;
      if ((*(_WORD *)&self->_pickerTableFlags & 6) == 2 && v24 >= self->_selectionBarRow)
        goto LABEL_20;
      v18 = 4;
    }
    else
    {
      v10 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      -[UITableView _sectionContentInset](self, "_sectionContentInset");
      if ((*(_QWORD *)&v10 & 0x80000) != 0)
        v13 = v12;
      else
        v13 = v11;
      -[UITableView indexPathForRowAtPoint:](self, "indexPathForRowAtPoint:", v13, y + CGRectGetMinY(self->_selectionBarRect) + 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14)
        goto LABEL_20;
      v16 = objc_msgSend(v14, "row");
      v17 = v16;
      if ((*(_WORD *)&self->_pickerTableFlags & 6) == 4 && v16 <= self->_selectionBarRow)
        goto LABEL_20;
      v18 = 2;
    }
    -[UIPickerTableView _setSelectionBarRow:](self, "_setSelectionBarRow:", v17);
    *(_WORD *)&self->_pickerTableFlags = *(_WORD *)&self->_pickerTableFlags & 0xFFF9 | v18;
LABEL_20:

  }
LABEL_21:
  -[UIView window](self, "window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if (v4)
      -[UIPickerTableView _notifyContentOffsetChange](self, "_notifyContentOffsetChange");
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  -[UIPickerTableView _setContentOffset:notify:](self, "_setContentOffset:notify:", 1, a3.x, a3.y);
}

- (void)layoutSubviews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__UIPickerTableView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

void __35__UIPickerTableView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = *(id *)(a1 + 32);
  v28.super_class = (Class)UIPickerTableView;
  objc_msgSendSuper2(&v28, sel_layoutSubviews);
  objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  v3 = v2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "center");
        v11 = v10 - v3;
        if (v10 - v3 >= 0.0 && (objc_msgSend(*(id *)(a1 + 32), "bounds"), v11 <= v12))
        {
          objc_msgSend(v9, "layer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 32);
          if (v15)
          {
            objc_msgSend(v15, "_transformForCellAtY:", v11);
          }
          else
          {
            v22 = 0u;
            v23 = 0u;
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            v16 = 0u;
            v17 = 0u;
          }
          objc_msgSend(v14, "setTransform:", &v16);

          v13 = 0;
        }
        else
        {
          v13 = 1;
        }
        objc_msgSend(v9, "setHidden:", v13, v16, v17, v18, v19, v20, v21, v22, v23);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

}

- (id)_anyDateLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[UITableView visibleCells](self, "visibleCells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "_anyDateLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPickerTableView;
  -[UITableView _scrollViewAnimationEnded:finished:](&v5, sel__scrollViewAnimationEnded_finished_, a3, a4);
  *(_WORD *)&self->_pickerTableFlags &= 0xFFF9u;
}

- (id)_containerView
{
  void *v2;
  uint64_t v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EDF32A70) & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)_playClickIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  if (self->_playsFeedback && (*(_WORD *)&self->_pickerTableFlags & 0x10) == 0)
  {
    -[UIView window](self, "window");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[UIPickerTableView _pickerView](self, "_pickerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_soundsEnabled");

      if (v6)
      {
        -[UIScrollView contentOffset](self, "contentOffset");
        v8 = v7;
        v9 = self->_lastClickedOffset - v7;
        v10 = v9 >= 0.0 ? self->_lastClickedOffset - v7 : -v9;
        -[UITableView rowHeight](self, "rowHeight");
        if (v10 >= v11 * 0.5)
        {
          -[UIPickerTableView _pickerView](self, "_pickerView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_willPlayClickSound");

          -[UIPickerTableView _pickerView](self, "_pickerView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_selectionFeedbackGenerator");
          v19 = (id)objc_claimAutoreleasedReturnValue();

          if (self->_generatorActivated)
          {
            -[UIPickerTableView _containerView](self, "_containerView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "center");
            v16 = v15;
            v18 = v17;

            objc_msgSend(v19, "selectionChangedAtLocation:", v16, v18);
          }
          self->_lastClickedOffset = v8;

        }
      }
    }
  }
}

- (void)_setSelectionBarRow:(int64_t)a3
{
  int64_t selectionBarRow;
  $445D910803DD928BED433837BC470391 pickerTableFlags;
  void *v6;
  __int16 v7;
  void *v8;

  selectionBarRow = self->_selectionBarRow;
  if (selectionBarRow != a3)
  {
    self->_selectionBarRow = a3;
    pickerTableFlags = self->_pickerTableFlags;
    if ((~*(_DWORD *)&pickerTableFlags & 0xC0) == 0)
    {
      -[UIPickerTableView _containerView](self, "_containerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = 64;
        else
          v7 = 0;
        *(_WORD *)&self->_pickerTableFlags = *(_WORD *)&self->_pickerTableFlags & 0xFF3F | v7;
      }

      *(_WORD *)&pickerTableFlags = self->_pickerTableFlags;
    }
    if ((*(_BYTE *)&pickerTableFlags & 0xC0) == 0x40)
    {
      -[UIPickerTableView _containerView](self, "_containerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pickerTableView:didChangeSelectionBarRowFrom:to:", self, selectionBarRow, self->_selectionBarRow);

    }
    -[UIPickerTableView _playClickIfNecessary](self, "_playClickIfNecessary");
  }
}

- (int64_t)selectionBarRow
{
  return self->_selectionBarRow & ~(self->_selectionBarRow >> 63);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  void *v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v12 = -[UIPickerTableView selectionBarRow](self, "selectionBarRow");
  v15.receiver = self;
  v15.super_class = (Class)UIPickerTableView;
  -[UITableView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPickerTableView _scrollRowAtIndexPathToSelectionBar:animated:](self, "_scrollRowAtIndexPathToSelectionBar:animated:", v14, 0);

  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  void *v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v12 = -[UIPickerTableView selectionBarRow](self, "selectionBarRow");
  v15.receiver = self;
  v15.super_class = (Class)UIPickerTableView;
  -[UITableView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPickerTableView _scrollRowAtIndexPathToSelectionBar:animated:](self, "_scrollRowAtIndexPathToSelectionBar:animated:", v14, 0);

  }
}

- (BOOL)isRowChecked:(int64_t)a3
{
  return -[NSMutableIndexSet containsIndex:](self->_checkedRows, "containsIndex:", a3);
}

- (BOOL)_beginTrackingWithEvent:(id)a3
{
  BOOL result;
  objc_super v5;

  *(_WORD *)&self->_pickerTableFlags |= 0x100u;
  v5.receiver = self;
  v5.super_class = (Class)UIPickerTableView;
  result = -[UITableView _beginTrackingWithEvent:](&v5, sel__beginTrackingWithEvent_, a3);
  *(_WORD *)&self->_pickerTableFlags &= ~0x100u;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  CGRect v39;

  y = a5->y;
  -[UIPickerTableView selectionBarRect](self, "selectionBarRect", a3, a4.x, a4.y);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIPickerTableView selectionBarRect](self, "selectionBarRect");
  v15 = y + v14;
  -[UITableView indexPathsForRowsInRect:](self, "indexPathsForRowsInRect:", v9, v15, v11, v13);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPickerTableView selectionBarRect](self, "selectionBarRect");
  v17 = v16;
  v18 = objc_msgSend(v38, "count");
  if (v18 != 2)
  {
    if (v18)
    {
      objc_msgSend(v38, "objectAtIndex:", 0);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", 0);
      v20 = v19 - 1;
      if (v19 < 1)
      {
        v26 = *MEMORY[0x1E0C9D538];
        v28 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        goto LABEL_13;
      }
      -[UIView bounds](self, "bounds");
      if (CGRectGetMinY(v39) >= 0.0)
        v21 = v20;
      else
        v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)v22;
    -[UIPickerTableView contentOffsetForRowAtIndexPath:](self, "contentOffsetForRowAtIndexPath:", v22);
    v26 = v36;
    v28 = v37;

LABEL_13:
    v34 = v38;
    goto LABEL_14;
  }
  v23 = v15 - v17;
  objc_msgSend(v38, "objectAtIndex:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerTableView contentOffsetForRowAtIndexPath:](self, "contentOffsetForRowAtIndexPath:", v24);
  v26 = v25;
  v28 = v27;

  objc_msgSend(v38, "objectAtIndex:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerTableView contentOffsetForRowAtIndexPath:](self, "contentOffsetForRowAtIndexPath:", v29);
  v31 = v30;
  v33 = v32;

  v34 = v38;
  if (vabdd_f64(v23, v28) >= vabdd_f64(v23, v33))
  {
    v28 = v33;
    v26 = v31;
  }
LABEL_14:
  a5->x = v26;
  a5->y = v28;

}

- (CGPoint)contentOffsetForRowAtIndexPath:(id)a3
{
  CGFloat x;
  double MinY;
  double v6;
  double v7;
  CGPoint result;
  CGRect v9;
  CGRect v10;

  -[UITableView rectForRowAtIndexPath:](self, "rectForRowAtIndexPath:", a3);
  x = v9.origin.x;
  MinY = CGRectGetMinY(v9);
  -[UIPickerTableView selectionBarRect](self, "selectionBarRect");
  v6 = MinY - CGRectGetMinY(v10);
  v7 = x;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)_scrollingFinished
{
  uint64_t v3;
  void *v4;
  void *v5;
  __int16 pickerTableFlags;

  if ((*(_WORD *)&self->_pickerTableFlags & 0x100) == 0)
  {
    if (-[UIPickerTableView didSelectDisabled:](self, "didSelectDisabled:", 1))
    {
      v3 = 0;
    }
    else if ((*(_WORD *)&self->_pickerTableFlags & 0x20) != 0)
    {
      v3 = 1;
    }
    else
    {
      -[UIPickerTableView _pickerView](self, "_pickerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "_usesCheckSelection") ^ 1;

    }
    -[UIPickerTableView _pickerView](self, "_pickerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sendSelectionChangedFromTable:notify:", self, v3);

    pickerTableFlags = (__int16)self->_pickerTableFlags;
    *(_WORD *)&self->_pickerTableFlags = pickerTableFlags & 0xFFDF;
    if ((pickerTableFlags & 0x10) != 0)
    {
      *(_WORD *)&self->_pickerTableFlags = pickerTableFlags & 0xFFCF;
      -[UIPickerTableView _playClickIfNecessary](self, "_playClickIfNecessary");
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  __int16 pickerTableFlags;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  pickerTableFlags = (__int16)self->_pickerTableFlags;
  if ((pickerTableFlags & 8) != 0)
    *(_WORD *)&self->_pickerTableFlags = pickerTableFlags & 0xFFF7;
  if (!self->_generatorActivated)
  {
    -[UIPickerTableView _pickerView](self, "_pickerView", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_selectionFeedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateWithCompletionBlock:", 0);

    self->_generatorActivated = 1;
  }
  -[UIView window](self, "window", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setReachabilitySupported:forReason:", 0, CFSTR("UIPickerTableView scrollViewWillBeginDragging"));

}

- (void)_deactivateFeedbackGeneratorIfNeeded
{
  void *v3;
  id v4;

  -[UIPickerTableView _pickerView](self, "_pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_selectionFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_generatorActivated)
  {
    objc_msgSend(v4, "deactivate");
    self->_generatorActivated = 0;
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  void *v5;
  id v6;

  if (!a4)
  {
    -[UIPickerTableView _scrollingFinished](self, "_scrollingFinished", a3);
    -[UIPickerTableView _deactivateFeedbackGeneratorIfNeeded](self, "_deactivateFeedbackGeneratorIfNeeded");
  }
  -[UIView window](self, "window", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setReachabilitySupported:forReason:", 1, CFSTR("UIPickerTableView scrollViewDidEndDragging"));

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[UIPickerTableView _scrollingFinished](self, "_scrollingFinished", a3);
  -[UIPickerTableView _deactivateFeedbackGeneratorIfNeeded](self, "_deactivateFeedbackGeneratorIfNeeded");
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a4;
  -[UITableView deselectRowAtIndexPath:animated:](self, "deselectRowAtIndexPath:animated:", v5, 1);
  v6 = objc_msgSend(v5, "row");

  -[UIPickerTableView selectRow:animated:notify:](self, "selectRow:animated:notify:", v6, 1, 1);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  -[UIPickerTableView _pickerView](self, "_pickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "_usesCheckedSelection"))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v5, "row"), objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

LABEL_10:
    v11 = v5;
    goto LABEL_11;
  }
  objc_msgSend(v8, "wrappedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  if (objc_msgSend(v9, "_isSelectable"))
    v10 = v5;
  else
    v10 = 0;
  v11 = v10;

LABEL_11:
  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  id v7;

  v7 = a4;
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(v7, "setPickerTable:", self);
  -[NSMutableArray addObject:](self->_referencingCells, "addObject:", v7);

}

- (void)_setTextColor:(id)a3
{
  UIColor **p_textColor;
  id v5;

  p_textColor = &self->_textColor;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", *p_textColor) & 1) == 0)
    objc_storeStrong((id *)p_textColor, a3);

}

- (UIColor)_textColor
{
  return self->_textColor;
}

- (BOOL)_shouldWrapCells
{
  return 0;
}

- (CGRect)selectionBarRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_selectionBarRect.origin.x;
  y = self->_selectionBarRect.origin.y;
  width = self->_selectionBarRect.size.width;
  height = self->_selectionBarRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)lastSelectedRow
{
  return self->_lastSelectedRow;
}

- (void)setLastSelectedRow:(int64_t)a3
{
  self->_lastSelectedRow = a3;
}

- (BOOL)_playsFeedback
{
  return self->_playsFeedback;
}

- (void)_setPlaysFeedback:(BOOL)a3
{
  self->_playsFeedback = a3;
}

- (BOOL)generatorActivated
{
  return self->_generatorActivated;
}

- (void)setGeneratorActivated:(BOOL)a3
{
  self->_generatorActivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencingCells, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_checkedRows, 0);
}

@end
