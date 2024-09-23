@implementation IMGridView

- (void)_setupGridViewCommon
{
  NSMutableArray *v3;
  NSMutableArray *visibleCells;
  NSMutableDictionary *v5;
  NSMutableDictionary *reusableCells;
  NSMutableArray *v7;
  NSMutableArray *cellsForReuse;
  void *v14;
  id v15;
  NSMutableSet *v16;
  NSMutableSet *draggedCellIDs;
  id v18;

  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  visibleCells = self->_visibleCells;
  self->_visibleCells = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  reusableCells = self->_reusableCells;
  self->_reusableCells = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  cellsForReuse = self->_cellsForReuse;
  self->_cellsForReuse = v7;

  *(_DWORD *)&self->_gridFlags |= 0x1000u;
  __asm { FMOV            V0.2D, #4.0 }
  self->_minimumGridSpacing = _Q0;
  self->_cellSize = (CGSize)vdupq_n_s64(0x4052C00000000000uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication jsa_sharedApplicationIfNotExtension](UIApplication, "jsa_sharedApplicationIfNotExtension"));
  -[IMGridView setLayoutDirection:](self, "setLayoutDirection:", objc_msgSend(v14, "userInterfaceLayoutDirection"));

  -[IMGridView setAlwaysBounceVertical:](self, "setAlwaysBounceVertical:", 1);
  v18 = objc_msgSend(objc_alloc((Class)UIDragInteraction), "initWithDelegate:", self);
  objc_msgSend(v18, "setEnabled:", 1);
  -[IMGridView addInteraction:](self, "addInteraction:", v18);
  v15 = objc_msgSend(objc_alloc((Class)UIDropInteraction), "initWithDelegate:", self);
  -[IMGridView addInteraction:](self, "addInteraction:", v15);
  v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  draggedCellIDs = self->_draggedCellIDs;
  self->_draggedCellIDs = v16;

}

- (IMGridView)init
{
  IMGridView *v2;
  IMGridView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMGridView;
  v2 = -[IMGridView init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[IMGridView setGrabTimerDelayEditing:](v2, "setGrabTimerDelayEditing:", 0.08);
    -[IMGridView setGrabTimerDelayNotEditing:](v3, "setGrabTimerDelayNotEditing:", 0.4);
  }
  return v3;
}

- (IMGridView)initWithFrame:(CGRect)a3
{
  IMGridView *v3;
  IMGridView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMGridView;
  v3 = -[IMGridView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[IMGridView _setupGridViewCommon](v3, "_setupGridViewCommon");
  return v4;
}

- (IMGridView)initWithCoder:(id)a3
{
  IMGridView *v3;
  IMGridView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMGridView;
  v3 = -[IMGridView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[IMGridView _setupGridViewCommon](v3, "_setupGridViewCommon");
  return v4;
}

- (void)dealloc
{
  NSTimer *autoscrollTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_autoscrollTimer, "invalidate");
  autoscrollTimer = self->_autoscrollTimer;
  self->_autoscrollTimer = 0;

  -[IMGridView _cancelCellHighlight](self, "_cancelCellHighlight");
  v4.receiver = self;
  v4.super_class = (Class)IMGridView;
  -[IMGridView dealloc](&v4, "dealloc");
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    v5 = obj;
    *(_DWORD *)&self->_gridFlags |= 0x1000u;
  }

}

- (IMGridViewDelegate)delegate
{
  IMGridViewDelegate *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMGridView;
  v2 = -[IMGridView delegate](&v4, "delegate");
  return (IMGridViewDelegate *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  objc_super v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));

  if (v5 != v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)IMGridView;
    -[IMGridView setDelegate:](&v17, "setDelegate:", v4);
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFFE | objc_opt_respondsToSelector(v4, "gridView:willDisplayCell:forItemAtIndex:") & 1);
    if ((objc_opt_respondsToSelector(v4, "gridView:willSelectItemAtIndex:") & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFFD | v6);
    if ((objc_opt_respondsToSelector(v4, "gridView:didSelectItemAtIndex:") & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFFB | v7);
    if ((objc_opt_respondsToSelector(v4, "gridView:updateSelectedCell:") & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFF7 | v8);
    if ((objc_opt_respondsToSelector(v4, "gridView:reorderCellAtIndex:toIndex:") & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFEF | v9);
    if ((objc_opt_respondsToSelector(v4, "gridView:willGrabCell:") & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFDF | v10);
    if ((objc_opt_respondsToSelector(v4, "gridViewDidReleaseGrabbedCell:") & 1) != 0)
      v11 = 64;
    else
      v11 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFFBF | v11);
    if ((objc_opt_respondsToSelector(v4, "gridView:shouldDeleteItemAtIndex:") & 1) != 0)
      v12 = 128;
    else
      v12 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFF7F | v12);
    if ((objc_opt_respondsToSelector(v4, "gridView:canDeleteCellAtIndex:") & 1) != 0)
      v13 = 256;
    else
      v13 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFEFF | v13);
    if ((objc_opt_respondsToSelector(v4, "gridView:canReorderCellAtIndex:") & 1) != 0)
      v14 = 512;
    else
      v14 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFDFF | v14);
    if ((objc_opt_respondsToSelector(v4, "gridView:canDragCellAtIndex:") & 1) != 0)
      v15 = 1024;
    else
      v15 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFFBFF | v15);
    if ((objc_opt_respondsToSelector(v4, "gridView:numberOfColumnsForSize:") & 1) != 0)
      v16 = 2048;
    else
      v16 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFF7FF | v16);
  }

}

- (void)setGridViewHeader:(id)a3
{
  UIView *v5;
  UIView *gridViewHeader;
  UIView *v7;

  v5 = (UIView *)a3;
  gridViewHeader = self->_gridViewHeader;
  if (gridViewHeader != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](gridViewHeader, "removeFromSuperview");
    objc_storeStrong((id *)&self->_gridViewHeader, a3);
    v5 = v7;
    if (v7)
    {
      -[IMGridView addSubview:](self, "addSubview:", v7);
      v5 = v7;
    }
  }

}

- (int64_t)numberOfColumnsForSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;

  width = a3.width;
  -[IMGridView gridInset](self, "gridInset", a3.width, a3.height);
  v6 = width - v5;
  -[IMGridView gridInset](self, "gridInset");
  return (uint64_t)((v6 - v7 + self->_minimumGridSpacing.width)
                 / (self->_minimumGridSpacing.width + self->_cellSize.width));
}

- (int64_t)numberOfRowsForSize:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t numberOfItems;

  height = a3.height;
  -[IMGridView contentOffset](self, "contentOffset", a3.width);
  v6 = v5 - self->_gridInset.top;
  -[IMGridView cellSpacing](self, "cellSpacing");
  v8 = v7 + self->_cellSize.height;
  numberOfItems = self->_numberOfItems;
  if (numberOfItems >= (int)((height + v6) / v8))
    numberOfItems = (int)((height + v6) / v8);
  return numberOfItems - ((int)(v6 / v8) & ~((int)(v6 / v8) >> 31));
}

- (int64_t)_calculateNumberOfColumns
{
  double v3;
  double v4;

  -[IMGridView bounds](self, "bounds");
  return -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", v3, v4);
}

- (unint64_t)numberOfColumns
{
  unint64_t result;

  if (self->_numberOfColumnsValid)
    return self->_numberOfColumns;
  result = -[IMGridView _calculateNumberOfColumns](self, "_calculateNumberOfColumns");
  self->_numberOfColumns = result;
  self->_numberOfColumnsValid = 1;
  return result;
}

- (void)invalidateNumberOfColumns
{
  if (self->_numberOfColumnsValid)
  {
    self->_numberOfColumnsValid = 0;
    -[IMGridView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)numberOfRows
{
  return vcvtps_s32_f32((float)self->_numberOfItems / (float)-[IMGridView numberOfColumns](self, "numberOfColumns"));
}

- (CGSize)cellSpacing
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double height;
  CGSize result;

  v3 = -[IMGridView numberOfColumns](self, "numberOfColumns");
  -[IMGridView bounds](self, "bounds");
  v5 = v4;
  -[IMGridView gridInset](self, "gridInset");
  v7 = v6;
  -[IMGridView gridInset](self, "gridInset");
  v9 = 0.0;
  if (v3 >= 2)
    v9 = (v5 - v7 - v8 - self->_cellSize.width * (double)v3) / (double)(v3 - 1);
  height = self->_minimumGridSpacing.height;
  result.height = height;
  result.width = v9;
  return result;
}

- (_NSRange)rangeOfVisibleCells
{
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  uint64_t v11;
  int v12;
  int64_t numberOfItems;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  BOOL v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_numberOfItems)
  {
    -[IMGridView bounds](self, "bounds");
    v6 = v4 + -30.0 - self->_gridInset.top;
    v7 = v5 + 60.0 + v6;
    -[IMGridView cellSpacing](self, "cellSpacing");
    v9 = v8 + self->_cellSize.height;
    v10 = (int)(v6 / v9);
    v11 = v10 & ~(v10 >> 31);
    v12 = (int)(v7 / v9);
    if (self->_numberOfItems >= v12)
      numberOfItems = v12;
    else
      numberOfItems = self->_numberOfItems;
    v14 = -[IMGridView numberOfColumns](self, "numberOfColumns");
    v15 = (uint64_t)(-(v6 - (double)(v11 + 1) * v9) / v9 * (double)v14);
    if (v10 <= 0)
      v15 = 0;
    v16 = v14 * v11 - v15;
    v17 = self->_numberOfItems;
    if (v17 >= (numberOfItems + 2) * v14)
      v17 = (numberOfItems + 2) * v14;
    v18 = v17 <= v16;
    v19 = v17 - v16;
    if (!v18)
      v2 = v16;
    v20 = v19 & ~(v19 >> 63);
  }
  else
  {
    v20 = 0;
  }
  v21 = v2;
  result.length = v20;
  result.location = v21;
  return result;
}

- (id)visibleCells
{
  return -[NSMutableArray copy](self->_visibleCells, "copy");
}

- (CGRect)rectForCellAtIndex:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double width;
  double x;
  double y;
  double height;
  CGRect v17;
  CGRect result;

  v5 = -[IMGridView numberOfColumns](self, "numberOfColumns");
  if (v5 < 1)
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  else
  {
    v6 = a3 / v5;
    v7 = a3 % v5;
    -[IMGridView cellSpacing](self, "cellSpacing");
    v9 = v8;
    v11 = v10;
    if (-[IMGridView layoutDirection](self, "layoutDirection"))
    {
      -[IMGridView bounds](self, "bounds");
      v12 = CGRectGetWidth(v17);
      width = self->_cellSize.width;
      x = v12 - self->_gridInset.right - round((v9 + width) * (double)v7) - width;
    }
    else
    {
      width = self->_cellSize.width;
      x = self->_gridInset.left + round((v9 + width) * (double)v7);
    }
    height = self->_cellSize.height;
    y = self->_gridInset.top + round((v11 + height) * (double)v6);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)visibleCellForIndex:(int64_t)a3
{
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_visibleCells;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (-[IMGridView indexForCell:](self, "indexForCell:", v10, (_QWORD)v13) == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)cellForIndex:(int64_t)a3
{
  void *v3;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    -[IMGridView layoutIfNeeded](self, "layoutIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView visibleCellForIndex:](self, "visibleCellForIndex:", a3));
  }
  return v3;
}

- (int64_t)indexForCell:(id)a3
{
  if (a3)
    return (int64_t)objc_msgSend(a3, "tag") - 10000;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  objc_super v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)IMGridView;
  -[IMGridView bounds](&v16, "bounds");
  v18.origin.x = v8;
  v18.origin.y = v9;
  v18.size.width = v10;
  v18.size.height = v11;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (!CGRectEqualToRect(v17, v18))
  {
    -[IMGridView bounds](self, "bounds");
    if (width != v13 || height != v12)
      -[IMGridView invalidateNumberOfColumns](self, "invalidateNumberOfColumns");
    v15.receiver = self;
    v15.super_class = (Class)IMGridView;
    -[IMGridView setBounds:](&v15, "setBounds:", x, y, width, height);
    *(_DWORD *)&self->_gridFlags |= 0x20000u;
    -[IMGridView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_DWORD *)&self->_gridFlags &= ~0x20000u;
  -[IMGridView frame](self, "frame");
  if (width != v9 || height != v8)
    -[IMGridView invalidateNumberOfColumns](self, "invalidateNumberOfColumns");
  v11.receiver = self;
  v11.super_class = (Class)IMGridView;
  -[IMGridView setFrame:](&v11, "setFrame:", x, y, width, height);
}

- (void)arrangeVisibleCells:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  unint64_t v12;
  unint64_t v14;
  id WeakRetained;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  CGRect v33;
  CGRect v34;

  length = a3.length;
  location = a3.location;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = self->_visibleCells;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v12 = -[IMGridView indexForCell:](self, "indexForCell:", v11, (_QWORD)v28);
        if (v12 >= location && v12 - location < length)
        {
          v14 = v12;
          WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

          if (v11 != WeakRetained)
          {
            -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:", v14);
            v17 = v16;
            v19 = v18;
            v21 = v20;
            v23 = v22;
            objc_msgSend(v11, "frame");
            v34.origin.x = v24;
            v34.origin.y = v25;
            v34.size.width = v26;
            v34.size.height = v27;
            v33.origin.x = v17;
            v33.origin.y = v19;
            v33.size.width = v21;
            v33.size.height = v23;
            if (!CGRectEqualToRect(v33, v34))
              objc_msgSend(v11, "setFrame:", v17, v19, v21, v23);
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

}

- (void)layoutSubviews
{
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  unint64_t v22;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  $5B90CFA202BF1D20308DC9D3199A23B1 v41;
  IMGridViewCell **p_grabbedCell;
  id WeakRetained;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v53.receiver = self;
  v53.super_class = (Class)IMGridView;
  -[IMGridView layoutSubviews](&v53, "layoutSubviews");
  gridFlags = self->_gridFlags;
  if ((*(_WORD *)&gridFlags & 0x2000) == 0)
  {
    if ((*(_WORD *)&gridFlags & 0x1000) != 0)
      -[IMGridView reloadData](self, "reloadData");
    v4 = -[NSMutableArray copy](self->_cellsForReuse, "copy");
    -[NSMutableArray removeAllObjects](self->_cellsForReuse, "removeAllObjects");
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "setIgnoreChangesToHidden:", 0);
          objc_msgSend(v10, "prepareForReuse");
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView _reuseArrayForCell:](self, "_reuseArrayForCell:", v10));
          objc_msgSend(v11, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v7);
    }

    v12 = (char *)-[IMGridView rangeOfVisibleCells](self, "rangeOfVisibleCells");
    v14 = v13;
    v15 = -[NSMutableArray copy](self->_visibleCells, "copy");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
          v22 = -[IMGridView indexForCell:](self, "indexForCell:", v21, (_QWORD)v45);
          if (v22 < (unint64_t)v12 || v22 - (unint64_t)v12 >= v14)
            -[IMGridView reuseCell:](self, "reuseCell:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v18);
    }

    if ((*((_BYTE *)&self->_gridFlags + 2) & 2) == 0)
      -[IMGridView arrangeVisibleCells:](self, "arrangeVisibleCells:", v12, v14);
    v24 = objc_autoreleasePoolPush();
    if ((uint64_t)v12 < (uint64_t)&v12[v14])
    {
      do
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView visibleCellForIndex:](self, "visibleCellForIndex:", v12, (_QWORD)v45));
        if (!v25)
          v26 = -[IMGridView _installNewCellAtIndex:](self, "_installNewCellAtIndex:", v12);

        ++v12;
        --v14;
      }
      while (v14);
    }
    objc_autoreleasePoolPop(v24);
    if ((*((_BYTE *)&self->_gridFlags + 2) & 2) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));

      if (v27)
      {
        v28 = (double)-[IMGridView numberOfRows](self, "numberOfRows");
        -[IMGridView cellSpacing](self, "cellSpacing");
        v30 = v29;
        -[IMGridView cellSize](self, "cellSize");
        v32 = v30 + v31;
        -[IMGridView gridInset](self, "gridInset");
        v34 = v33 + v28 * v32;
        -[IMGridView bounds](self, "bounds");
        v36 = v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));
        objc_msgSend(v37, "bounds");
        v39 = v38;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));
        objc_msgSend(v40, "setFrame:", 0.0, v34, v36, v39);

      }
    }
    v41 = self->_gridFlags;
    if ((*(_DWORD *)&v41 & 0x20000) == 0)
    {
      -[IMGridView updateContentSize](self, "updateContentSize");
      v41 = self->_gridFlags;
    }
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&v41 & 0xFFFDFFFF);
    if (self->_grabbedCellUniqueID)
    {
      p_grabbedCell = &self->_grabbedCell;
      WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

      if (!WeakRetained)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView _cellWithUniqueIdentifier:](self, "_cellWithUniqueIdentifier:", self->_grabbedCellUniqueID));
        objc_storeWeak((id *)p_grabbedCell, v44);

      }
    }

  }
}

- (void)updateContentSize
{
  double v3;
  double v4;
  uint64_t v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *footerView;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[IMGridView cellSpacing](self, "cellSpacing");
  v4 = v3;
  v5 = -[IMGridView numberOfRows](self, "numberOfRows");
  -[IMGridView bounds](self, "bounds");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  v10 = CGRectGetWidth(v17);
  v11 = self->_gridInset.top + self->_gridInset.bottom - (v4 - (double)v5 * (v4 + self->_cellSize.height));
  if (self->_gridViewHeader)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v12 = CGRectGetHeight(v18);
    -[UIView frame](self->_gridViewHeader, "frame");
    v13 = v12 + CGRectGetHeight(v19);
    if (v11 < v13)
      v11 = v13;
  }
  footerView = self->_footerView;
  if (footerView)
  {
    -[UIView frame](footerView, "frame");
    v15 = CGRectGetHeight(v20);
    -[IMGridView cellSpacing](self, "cellSpacing");
    v11 = v11 + v15 + v16;
  }
  -[IMGridView setContentSize:](self, "setContentSize:", v10, v11);
}

- (BOOL)canDeleteCellAtIndex:(int64_t)a3
{
  void *v6;
  unsigned __int8 v7;

  if ((*((_BYTE *)&self->_gridFlags + 1) & 1) == 0 || -[IMGridView tapToSelectMode](self, "tapToSelectMode"))
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
  v7 = objc_msgSend(v6, "gridView:canDeleteCellAtIndex:", self, a3);

  return v7;
}

- (id)_installNewCellAtIndex:(int64_t)a3
{
  id WeakRetained;
  int64_t v6;
  int64_t v7;
  int64_t grabIndex;
  _BOOL8 v10;
  void *v13;
  id v14;
  IMGridView *v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  v6 = a3;
  if (WeakRetained)
  {
    v7 = -[IMGridView indexForCell:](self, "indexForCell:", WeakRetained);
    grabIndex = self->_grabIndex;
    if (grabIndex <= v7)
    {
      if (grabIndex >= v7 || grabIndex > a3 || v7 <= a3)
        v6 = a3;
      else
        v6 = a3 + 1;
    }
    else
    {
      v10 = v7 < a3 && grabIndex >= a3;
      v6 = a3 - v10;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dataSource](self, "dataSource"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "gridView:cellForIndex:", self, v6));

  if (v14)
  {
    if (v14 != WeakRetained)
    {
      -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:", a3);
      objc_msgSend(v14, "setFrame:");
    }
    objc_msgSend(v14, "setCanDelete:", -[IMGridView canDeleteCellAtIndex:](self, "canDeleteCellAtIndex:", a3));
    objc_msgSend(v14, "setTag:", a3 + 10000);
    objc_msgSend(v14, "setEditing:", -[IMGridView isEditing](self, "isEditing"));
    -[NSMutableArray addObject:](self->_visibleCells, "addObject:", v14);
    v15 = (IMGridView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));

    if (v15 != self)
      -[IMGridView addSubview:](self, "addSubview:", v14);
  }

  return v14;
}

- (id)_reuseArrayForCell:(id)a3
{
  uint64_t v4;
  __CFString *v5;
  void *v6;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reuseIdentifier"));
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = &stru_296430;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView _reuseArrayForIdentifier:](self, "_reuseArrayForIdentifier:", v5));

  return v6;
}

- (id)_reuseArrayForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_reusableCells, "objectForKey:", v4));
    if (!v5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[NSMutableDictionary setObject:forKey:](self->_reusableCells, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)reuseCell:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

    v4 = v6;
    if (WeakRetained != v6)
    {
      -[NSMutableArray removeObject:](self->_visibleCells, "removeObject:", v6);
      -[NSMutableArray addObject:](self->_cellsForReuse, "addObject:", v6);
      -[IMGridView setNeedsLayout](self, "setNeedsLayout");
      v4 = v6;
    }
  }

}

- (id)dequeueReusableCell
{
  return -[IMGridView dequeueReusableCellWithIdentifier:](self, "dequeueReusableCellWithIdentifier:", 0);
}

- (id)dequeueReusableCellWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView _reuseArrayForIdentifier:](self, "_reuseArrayForIdentifier:", a3));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    objc_msgSend(v4, "removeObject:", v5);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "setIgnoreChangesToHidden:", 0);
  objc_msgSend(v5, "setHidden:", self->_hidingCells);
  objc_msgSend(v5, "setIgnoreChangesToHidden:", self->_hidingCells);

  return v5;
}

- (void)hideCells
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  self->_hidingCells = 1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_visibleCells;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "setHidden:", 1, (_QWORD)v8);
        objc_msgSend(v7, "setIgnoreChangesToHidden:", 1);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)showCells
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  self->_hidingCells = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_visibleCells;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "setIgnoreChangesToHidden:", 0, (_QWORD)v8);
        objc_msgSend(v7, "setHidden:", 0);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 hideFooterView;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  -[IMGridView _cancelAutoscrollTimer](self, "_cancelAutoscrollTimer");
  if (self->_tableReloadingSuspendedCount < 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));
    objc_msgSend(v3, "removeFromSuperview");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v4, "footerViewForGridView:") & 1) != 0)
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "footerViewForGridView:", self));
    else
      v5 = 0;
    -[IMGridView setFooterView:](self, "setFooterView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));
      -[IMGridView addSubview:](self, "addSubview:", v7);

      hideFooterView = self->_hideFooterView;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));
      objc_msgSend(v9, "setHidden:", hideFooterView);

    }
    -[IMGridView setGrabbedCell:](self, "setGrabbedCell:", 0);
    v10 = -[NSMutableArray copy](self->_visibleCells, "copy");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          -[IMGridView reuseCell:](self, "reuseCell:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), (_QWORD)v17);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    *(_DWORD *)&self->_gridFlags &= ~0x1000u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dataSource](self, "dataSource"));
    self->_numberOfItems = (int64_t)objc_msgSend(v16, "numberOfCellsInGridView:", self);

    -[IMGridView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    *(_DWORD *)&self->_gridFlags |= 0x8000u;
  }
}

- (void)_suspendReloads
{
  ++self->_tableReloadingSuspendedCount;
}

- (void)_resumeReloads
{
  int64_t v2;
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags;

  v2 = self->_tableReloadingSuspendedCount - 1;
  self->_tableReloadingSuspendedCount = v2;
  if (!v2)
  {
    gridFlags = self->_gridFlags;
    if ((*(_WORD *)&gridFlags & 0x8000) != 0)
    {
      self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&gridFlags & 0xFFFF7FFF);
      -[IMGridView reloadData](self, "reloadData");
    }
  }
}

- (void)scrollToCellAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a4;
    -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[IMGridView layoutIfNeeded](self, "layoutIfNeeded");
    -[IMGridView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v4, v7, v9, v11, v13);
  }
}

- (void)scrollMakingTopmostRowContainCellAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t v7;
  double v8;
  double v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a4;
    v7 = -[IMGridView numberOfColumns](self, "numberOfColumns");
    -[IMGridView bounds](self, "bounds");
    v10 = -[IMGridView numberOfRowsForSize:](self, "numberOfRowsForSize:", v8, v9);
    v11 = -[IMGridView numberOfRows](self, "numberOfRows");
    v12 = a3 / v7;
    if (v11 - a3 / v7 < v10)
      v12 = (v11 - v10) & ~((v11 - v10) >> 63);
    -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:", v12 * v7);
    v14 = v13;
    -[IMGridView contentOffset](self, "contentOffset");
    v16 = v15;
    -[IMGridView layoutIfNeeded](self, "layoutIfNeeded");
    -[IMGridView setContentOffset:animated:](self, "setContentOffset:animated:", v4, v16, v14);
  }
}

- (id)_arrayForUpdateAction:(int)a3
{
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a3 == 2)
  {
    v3 = 192;
  }
  else if (a3 == 1)
  {
    v3 = 184;
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      return v8;
    }
    v3 = 176;
  }
  v4 = (void **)((char *)&self->super.super.super.super.isa + v3);
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + v3);
  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = *v4;
    *v4 = v6;

    v5 = *v4;
  }
  v8 = v5;
  return v8;
}

- (void)_updateItemAtIndex:(unint64_t)a3 updateAction:(int)a4
{
  uint64_t v4;
  IMGridViewUpdateItem *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  -[IMGridView beginUpdates](self, "beginUpdates");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView _arrayForUpdateAction:](self, "_arrayForUpdateAction:", v4));
  v7 = -[IMGridViewUpdateItem initWithAction:forIndex:]([IMGridViewUpdateItem alloc], "initWithAction:forIndex:", v4, a3);
  objc_msgSend(v8, "addObject:", v7);
  -[IMGridView endUpdates](self, "endUpdates");

}

- (void)reloadCellAtIndex:(unint64_t)a3
{
  -[IMGridView _updateItemAtIndex:updateAction:](self, "_updateItemAtIndex:updateAction:", a3, 2);
}

- (void)insertCellAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  -[IMGridView _updateItemAtIndex:updateAction:](self, "_updateItemAtIndex:updateAction:", a3, 0);
}

- (void)deleteCellAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  -[IMGridView _updateItemAtIndex:updateAction:](self, "_updateItemAtIndex:updateAction:", a3, 1);
}

- (void)_refreshCells
{
  -[IMGridView reloadAllCells](self, "reloadAllCells");
  -[IMGridView setNeedsLayout](self, "setNeedsLayout");
}

- (void)reloadAllCells
{
  -[IMGridView beginUpdates](self, "beginUpdates");
  *(_DWORD *)&self->_gridFlags |= 0x1000u;
  -[IMGridView endUpdates](self, "endUpdates");
}

- (void)deleteCellDidAnimate
{
  int v3;
  void *v4;
  void *i;
  void *v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *j;
  void *v14;
  unint64_t v15;
  id v16;
  NSMutableArray *cellsToDelete;
  id obj;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
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

  v3 = self->_deleteAnimationCount - 1;
  self->_deleteAnimationCount = v3;
  if (v3)
  {
    -[IMGridView _resumeReloads](self, "_resumeReloads");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](self->_cellsToDelete, "sortedArrayUsingSelector:", "inverseCompareIndexes:"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v4;
    v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v20)
    {
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v7 = objc_msgSend(v6, "index");
          -[IMGridView rangeOfVisibleCells](self, "rangeOfVisibleCells");
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v8 = self->_visibleCells;
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v9)
          {
            v10 = v9;
            v21 = i;
            v11 = 0;
            v12 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(_QWORD *)v25 != v12)
                  objc_enumerationMutation(v8);
                v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
                if (-[IMGridView indexForCell:](self, "indexForCell:", v14) <= (uint64_t)v7)
                {
                  v15 = -[IMGridView indexForCell:](self, "indexForCell:", v14);
                  if (v15 >= (unint64_t)objc_msgSend(v6, "index"))
                  {
                    v16 = v14;

                    v11 = v16;
                  }
                }
                else
                {
                  objc_msgSend(v14, "setTag:", (char *)objc_msgSend(v14, "tag") - 1);
                }
              }
              v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v10);

            if (v11)
              -[IMGridView reuseCell:](self, "reuseCell:", v11);
            i = v21;
          }
          else
          {

            v11 = 0;
          }
          --self->_numberOfItems;

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v20);
    }
    cellsToDelete = self->_cellsToDelete;
    self->_cellsToDelete = 0;

    v22[4] = self;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_68BA0;
    v23[3] = &unk_28B960;
    v23[4] = self;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_68BD0;
    v22[3] = &unk_28D678;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v23, v22, 0.3);
    -[IMGridView layoutIfNeeded](self, "layoutIfNeeded");
    -[IMGridView layoutSubviews](self, "layoutSubviews");

  }
}

- (void)_setupCellAnimations
{
  -[IMGridView _suspendReloads](self, "_suspendReloads");
}

- (void)_endCellAnimations
{
  IMGridView *v2;
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags;
  NSMutableArray *deleteItems;
  NSMutableArray *insertItems;
  NSMutableArray *reloadItems;
  id v7;
  IMGridViewCell *selectedCell;
  int v9;
  void *v10;
  void *i;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  id v23;
  uint64_t v24;
  NSMutableArray *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  void *v31;
  NSMutableArray *v32;
  id v33;
  uint64_t v34;
  id v35;
  id obj;
  uint64_t v37;
  IMGridView *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];

  v2 = self;
  gridFlags = self->_gridFlags;
  if ((*(_WORD *)&gridFlags & 0x1000) != 0)
  {
    deleteItems = self->_deleteItems;
    self->_deleteItems = 0;

    insertItems = v2->_insertItems;
    v2->_insertItems = 0;

    reloadItems = v2->_reloadItems;
    v2->_reloadItems = 0;

  }
  v7 = -[NSMutableArray count](v2->_deleteItems, "count");
  if ((-[NSMutableArray count](v2->_deleteItems, "count") || -[NSMutableArray count](v2->_insertItems, "count"))
    && v2->_selectedCell)
  {
    -[IMGridView _cancelCellHighlight](v2, "_cancelCellHighlight");
    -[IMGridViewCell setHighlighted:](v2->_selectedCell, "setHighlighted:", 0);
    selectedCell = v2->_selectedCell;
    v2->_selectedCell = 0;

  }
  if (-[NSMutableArray count](v2->_deleteItems, "count"))
  {
    v52[4] = v2;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_69068;
    v53[3] = &unk_28B960;
    v53[4] = v2;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_69234;
    v52[3] = &unk_28D678;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v53, v52, 0.2);
    v9 = 1;
  }
  else
  {
    v9 = (*(unsigned int *)&gridFlags >> 12) & 1;
  }
  if (-[NSMutableArray count](v2->_insertItems, "count") && !v2->_deleteAnimationCount)
  {
    v35 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v2->_insertItems, "sortedArrayUsingSelector:", "compareIndexes:"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v10;
    v39 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v39)
    {
      v37 = *(_QWORD *)v49;
      v38 = v2;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v37)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v13 = v2->_visibleCells;
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(_QWORD *)v45 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
                v19 = (char *)objc_msgSend(v18, "tag") - 10000;
                v20 = (char *)objc_msgSend(v12, "index");
                v21 = (char *)objc_msgSend(v18, "tag");
                if (v19 < v20)
                  v22 = v21;
                else
                  v22 = v21 + 1;
                objc_msgSend(v18, "setTag:", v22);
              }
              v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
            }
            while (v15);
          }

          v2 = v38;
          ++v38->_numberOfItems;
          v23 = -[IMGridView rangeOfVisibleCells](v38, "rangeOfVisibleCells");
          -[IMGridView arrangeVisibleCells:](v38, "arrangeVisibleCells:", v23, v24);
        }
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v39);
    }
    v25 = v2->_insertItems;
    v2->_insertItems = 0;

    v9 = 1;
    v7 = v35;
  }
  if (-[NSMutableArray count](v2->_reloadItems, "count") && !v2->_deleteAnimationCount)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v2->_reloadItems, "sortedArrayUsingSelector:", "compareIndexes:"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v41;
      do
      {
        for (k = 0; k != v28; k = (char *)k + 1)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView visibleCellForIndex:](v2, "visibleCellForIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)k), "index")));
          -[IMGridView reuseCell:](v2, "reuseCell:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v28);
    }
    v32 = v2->_reloadItems;
    v2->_reloadItems = 0;

    v33 = -[IMGridView rangeOfVisibleCells](v2, "rangeOfVisibleCells");
    -[IMGridView arrangeVisibleCells:](v2, "arrangeVisibleCells:", v33, v34);

  }
  else if (!v9)
  {
    if (v7)
      return;
LABEL_44:
    -[IMGridView _resumeReloads](v2, "_resumeReloads");
    return;
  }
  -[IMGridView setNeedsLayout](v2, "setNeedsLayout");
  if (!v7)
    goto LABEL_44;
}

- (void)beginUpdates
{
  int64_t updateCount;

  updateCount = self->_updateCount;
  if (!updateCount)
  {
    -[IMGridView _setupCellAnimations](self, "_setupCellAnimations");
    updateCount = self->_updateCount;
  }
  self->_updateCount = updateCount + 1;
}

- (void)endUpdates
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t updateCount;

  updateCount = self->_updateCount;
  if (updateCount > 0
    || (BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/IMGridView.m", 1126, (uint64_t)"-[IMGridView endUpdates]", (uint64_t)"_updateCount > 0", CFSTR("Unbalanced endUpdates call. _updateCount: %ld"), v2, v3, v4, updateCount), updateCount = self->_updateCount, updateCount >= 1))
  {
    self->_updateCount = --updateCount;
  }
  if (!updateCount)
    -[IMGridView _endCellAnimations](self, "_endCellAnimations");
}

- (int64_t)cellColumnsForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;

  height = a3.height;
  width = a3.width;
  if ((*((_BYTE *)&self->_gridFlags + 1) & 8) == 0)
    return -[IMGridView numberOfColumnsForSize:](self, "numberOfColumnsForSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
  v7 = objc_msgSend(v6, "gridView:numberOfColumnsForSize:", self, width, height);

  return (int64_t)v7;
}

- (id)rotationCellContainersForSize:(CGSize)a3
{
  NSMutableArray *cellContainerMatrix;
  double height;
  double width;
  double v7;
  double v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int i;
  id v23;
  int64_t v24;
  IMCellRotationContainer *v25;

  cellContainerMatrix = self->_cellContainerMatrix;
  if (!cellContainerMatrix)
  {
    height = a3.height;
    width = a3.width;
    -[IMGridView bounds](self, "bounds");
    v9 = -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", v7, v8);
    v10 = -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", width, height);
    if (v9 <= v10)
      v11 = v10;
    else
      v11 = v9;
    v12 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 6);
    v13 = self->_cellContainerMatrix;
    self->_cellContainerMatrix = v12;

    -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:", 0);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    for (i = 0; i != 6; ++i)
    {
      v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v11 + 1);
      if ((v11 & 0x8000000000000000) == 0)
      {
        v24 = 0;
        do
        {
          v25 = -[IMCellRotationContainer initWithFrame:]([IMCellRotationContainer alloc], "initWithFrame:", v15, v17, v19, v21);
          objc_msgSend(v23, "addObject:", v25);

          ++v24;
        }
        while (v11 >= v24);
      }
      -[NSMutableArray addObject:](self->_cellContainerMatrix, "addObject:", v23);

    }
    cellContainerMatrix = self->_cellContainerMatrix;
  }
  return cellContainerMatrix;
}

- (int64_t)indexForX:(int64_t)a3 Y:(int64_t)a4
{
  double v7;
  double v8;
  int64_t v9;

  -[IMGridView bounds](self, "bounds");
  v9 = -[IMGridView cellColumnsForSize:](self, "cellColumnsForSize:", v7, v8);
  if (v9 <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a3 + v9 * a4;
}

- (CGPoint)originForCellAtX:(int64_t)a3 Y:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  CGPoint result;
  CGRect v19;

  -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:", 0);
  v8 = v7;
  v10 = v9;
  -[IMGridView cellSpacing](self, "cellSpacing");
  v12 = v11 + v8;
  -[IMGridView cellSpacing](self, "cellSpacing");
  v14 = v13;
  if (-[IMGridView layoutDirection](self, "layoutDirection"))
  {
    -[IMGridView bounds](self, "bounds");
    v15 = CGRectGetWidth(v19) - (v8 + self->_gridInset.right + (float)((float)a3 * v12));
  }
  else
  {
    v15 = self->_gridInset.left + (float)((float)a3 * v12);
  }
  v16 = v10 + v14;
  v17 = self->_gridInset.top + (float)((float)a4 * v16);
  result.y = v17;
  result.x = v15;
  return result;
}

- (int64_t)rowRangeStart
{
  double v3;
  double v4;
  double v5;
  int v6;

  -[IMGridView contentOffset](self, "contentOffset");
  v4 = v3 - self->_gridInset.top;
  -[IMGridView cellSpacing](self, "cellSpacing");
  v6 = (int)(v4 / (v5 + self->_cellSize.height));
  return v6 & ~(v6 >> 31);
}

- (BOOL)isRotating
{
  return (*((unsigned __int8 *)&self->_gridFlags + 1) >> 5) & 1;
}

- (void)prepareToRotateWithDestinationSize:(CGSize)a3
{
  double height;
  double width;
  CGFloat v6;
  CGFloat v7;
  char *i;
  void *v9;
  char *v10;
  char *v11;
  char *j;
  void *v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  id v19;

  height = a3.height;
  width = a3.width;
  if ((-[IMGridView isDecelerating](self, "isDecelerating") & 1) == 0)
  {
    -[IMGridView setHideFooterView:](self, "setHideFooterView:", 1);
    -[IMGridView contentOffset](self, "contentOffset");
    self->_oldContentOffset.x = v6;
    self->_oldContentOffset.y = v7;
    *(_DWORD *)&self->_gridFlags |= 0x2000u;
    v19 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView rotationCellContainersForSize:](self, "rotationCellContainersForSize:", width, height));
    v18 = (char *)objc_msgSend(v19, "count");
    if ((uint64_t)v18 >= 1)
    {
      for (i = 0; i != v18; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", i, v18));
        v10 = (char *)objc_msgSend(v9, "count");
        if ((uint64_t)v10 >= 1)
        {
          v11 = v10;
          for (j = 0; j != v11; ++j)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", j));
            v14 = -[IMGridView indexForX:Y:](self, "indexForX:Y:", j, &i[-[IMGridView rowRangeStart](self, "rowRangeStart")]);
            if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = v14;
              if (v14 < self->_numberOfItems)
              {
                v16 = objc_claimAutoreleasedReturnValue(-[IMGridView cellForIndex:](self, "cellForIndex:", v14));
                if (v16)
                {
                  v17 = (void *)v16;
                  objc_msgSend(v13, "setStartCell:", v16);
                  -[NSMutableArray removeObject:](self->_visibleCells, "removeObject:", v17);

                }
              }
            }
            -[IMGridView originForCellAtX:Y:](self, "originForCellAtX:Y:", j, &i[-[IMGridView rowRangeStart](self, "rowRangeStart", v15)]);
            objc_msgSend(v13, "setOrigin:");
            -[IMGridView addSubview:](self, "addSubview:", v13);

          }
        }

      }
    }

  }
}

- (void)performRotationWithDuration:(double)a3
{
  double y;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char *i;
  char *j;
  void *v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  char *v24;
  char *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[6];

  if ((*((_BYTE *)&self->_gridFlags + 1) & 0x20) != 0
    && (-[IMGridView isDecelerating](self, "isDecelerating") & 1) == 0)
  {
    -[IMGridView updateContentSize](self, "updateContentSize");
    y = self->_oldContentOffset.y;
    -[IMGridView contentSize](self, "contentSize");
    v7 = v6;
    -[IMGridView bounds](self, "bounds");
    if (y <= v7 - v8)
    {
      v12 = self->_oldContentOffset.y;
    }
    else
    {
      -[IMGridView contentSize](self, "contentSize");
      v10 = v9;
      -[IMGridView bounds](self, "bounds");
      v12 = v10 - v11;
      self->_oldContentOffset.y = v12;
    }
    -[IMGridView contentInset](self, "contentInset");
    if (v12 < -v13)
    {
      -[IMGridView contentInset](self, "contentInset");
      self->_oldContentOffset.y = -v14;
    }
    -[IMGridView setContentOffset:](self, "setContentOffset:", self->_oldContentOffset.x);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_69C34;
    v39[3] = &unk_28B960;
    v39[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v39);
    v24 = (char *)-[NSMutableArray count](self->_cellContainerMatrix, "count");
    if ((uint64_t)v24 >= 1)
    {
      for (i = 0; i != v24; ++i)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cellContainerMatrix, "objectAtIndex:", i, v24));
        v25 = (char *)objc_msgSend(v26, "count");
        if ((uint64_t)v25 >= 1)
        {
          for (j = 0; j != v25; ++j)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndex:", j));
            v18 = -[IMGridView indexForX:Y:](self, "indexForX:Y:", j, &i[-[IMGridView rowRangeStart](self, "rowRangeStart")]);
            v33 = 0;
            v34 = &v33;
            v35 = 0x3032000000;
            v36 = sub_69C5C;
            v37 = sub_69C6C;
            v38 = 0;
            if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v19 = v18;
              if (v18 < self->_numberOfItems)
              {
                v20 = objc_claimAutoreleasedReturnValue(-[IMGridView cellForIndex:](self, "cellForIndex:", v18));
                v21 = (void *)v34[5];
                v34[5] = v20;

                if (v34[5])
                  goto LABEL_16;
                v32[0] = _NSConcreteStackBlock;
                v32[1] = 3221225472;
                v32[2] = sub_69C74;
                v32[3] = &unk_28E3D0;
                v32[4] = self;
                v32[5] = &v33;
                v32[6] = v19;
                +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v32);
                objc_msgSend(v17, "setCellNotVisible:", 1);
                if (v34[5])
                {
LABEL_16:
                  v29[0] = _NSConcreteStackBlock;
                  v29[1] = 3221225472;
                  v29[2] = sub_69CD4;
                  v29[3] = &unk_28E468;
                  v22 = v17;
                  v30 = v22;
                  v31 = &v33;
                  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v29);
                  -[NSMutableArray removeObject:](self->_visibleCells, "removeObject:", v34[5]);
                  -[IMGridView originForCellAtX:Y:](self, "originForCellAtX:Y:", j, &i[-[IMGridView rowRangeStart](self, "rowRangeStart")]);
                  objc_msgSend(v22, "setOrigin:");

                }
              }
            }
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_69CE8;
            v27[3] = &unk_28B960;
            v23 = v17;
            v28 = v23;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v27);
            objc_msgSend(v23, "crossfadeWithDuration:", a3);

            _Block_object_dispose(&v33, 8);
          }
        }

      }
    }
  }
}

- (void)cleanupAfterRotation
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];
  _BYTE v28[128];

  if ((*((_BYTE *)&self->_gridFlags + 1) & 0x20) != 0
    && (-[IMGridView isDecelerating](self, "isDecelerating") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));
    objc_msgSend(v3, "setAlpha:", 0.0);

    -[IMGridView setHideFooterView:](self, "setHideFooterView:", 0);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_69F40;
    v26[3] = &unk_28B960;
    v26[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v26, &stru_28E488, 0.15);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = 96;
    v4 = self->_cellContainerMatrix;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v15, "didFinishRotation", v17);
                objc_msgSend(v15, "removeFromSuperview");
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
            }
            while (v12);
          }

        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v6);
    }

    v16 = *(Class *)((char *)&self->super.super.super.super.isa + v17);
    *(Class *)((char *)&self->super.super.super.super.isa + v17) = 0;

    *(_DWORD *)&self->_gridFlags &= ~0x2000u;
  }
}

- (void)setHideFooterView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hideFooterView = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView footerView](self, "footerView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)_highlightSelectedCell
{
  -[IMGridViewCell setHighlighted:](self->_selectedCell, "setHighlighted:", 1);
}

- (void)_cancelCellHighlight
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_highlightSelectedCell", 0);
}

- (id)cellAtPoint:(CGPoint)a3
{
  return -[IMGridView cellAtPoint:ensureSelectionRect:](self, "cellAtPoint:ensureSelectionRect:", 1, a3.x, a3.y);
}

- (id)cellAtPoint:(CGPoint)a3 ensureSelectionRect:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  unint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  CGPoint v33;
  CGPoint v34;
  CGRect v35;
  CGRect v36;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[IMGridView contentSize](self, "contentSize");
  v9 = v8;
  -[IMGridView contentSize](self, "contentSize");
  v11 = v10;
  -[IMGridView gridInset](self, "gridInset");
  v13 = v12 + 0.0;
  v16 = v9 - (v14 + v15);
  v35.size.height = v11 - (v12 + v17);
  v35.origin.x = v14 + 0.0;
  v35.origin.y = v13;
  v35.size.width = v16;
  v33.x = x;
  v33.y = y;
  if (CGRectContainsPoint(v35, v33))
  {
    v18 = -[IMGridView numberOfColumns](self, "numberOfColumns");
    -[IMGridView cellSpacing](self, "cellSpacing");
    v20 = (uint64_t)((v19 * 0.5 + y - self->_gridInset.top) / (v19 + self->_cellSize.height));
    v22 = (uint64_t)((v21 * 0.5 + x - self->_gridInset.left) / (v21 + self->_cellSize.width));
    v23 = -[IMGridView layoutDirection](self, "layoutDirection");
    v24 = v18 + ~v22;
    if (v23 != 1)
      v24 = v22;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView cellForIndex:](self, "cellForIndex:", v24 + v18 * v20));
    v26 = v25;
    if (v4)
    {
      -[IMGridView convertPoint:toView:](self, "convertPoint:toView:", v25, x, y);
      v28 = v27;
      v30 = v29;
      objc_msgSend(v25, "selectionFrame");
      v34.x = v28;
      v34.y = v30;
      if (CGRectContainsPoint(v36, v34))
        v26 = v25;
      else
        v26 = 0;
    }
    v31 = v26;

  }
  else
  {
    v31 = 0;
  }
  return v31;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  int64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if ((-[IMGridView isDecelerating](self, "isDecelerating") & 1) == 0
    && (-[IMGridView isDragging](self, "isDragging") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);

    if (!WeakRetained)
    {
      v17.receiver = self;
      v17.super_class = (Class)IMGridView;
      -[IMGridView touchesBegan:withEvent:](&v17, "touchesBegan:withEvent:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
      objc_msgSend(v9, "locationInView:", self);
      self->_grabPoint.x = v10;
      self->_grabPoint.y = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView cellAtPoint:](self, "cellAtPoint:"));
      if (v12)
      {
        if ((*(_BYTE *)&self->_gridFlags & 2) != 0)
        {
          v13 = -[IMGridView indexForCell:](self, "indexForCell:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
          v15 = objc_msgSend(v14, "gridView:willSelectItemAtIndex:", self, v13);

          if ((id)v13 != v15)
          {
            if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
              v16 = 0;
            else
              v16 = objc_claimAutoreleasedReturnValue(-[IMGridView cellForIndex:](self, "cellForIndex:", v15));

            v12 = (void *)v16;
          }
        }
      }
      -[IMGridView _cancelCellHighlight](self, "_cancelCellHighlight");
      objc_storeStrong((id *)&self->_selectedCell, v12);
      if (v12
        && (!-[IMGridView isEditing](self, "isEditing") || !-[IMGridView tapToSelectMode](self, "tapToSelectMode")))
      {
        -[IMGridView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_highlightSelectedCell", 0, 0.08);
      }

    }
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  id WeakRetained;
  IMGridViewCell *selectedCell;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  objc_msgSend(v8, "locationInView:", self);
  v10 = v9;
  v12 = v11;

  v13 = v10 - self->_grabPoint.x;
  v14 = -v13;
  if (v13 >= 0.0)
    v14 = v10 - self->_grabPoint.x;
  if (v14 <= 25.0)
  {
    v16 = v12 - self->_grabPoint.y;
    if (v16 < 0.0)
      v16 = -v16;
    v15 = v16 > 25.0;
  }
  else
  {
    v15 = 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained)
  {
    -[IMGridView _updateGrabbedCellLocation:](self, "_updateGrabbedCellLocation:", v10, v12);
    -[IMGridView _autoscrollForCell:](self, "_autoscrollForCell:", WeakRetained);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)IMGridView;
    -[IMGridView touchesMoved:withEvent:](&v19, "touchesMoved:withEvent:", v6, v7);
    if (v15)
    {
      -[IMGridView _cancelCellHighlight](self, "_cancelCellHighlight");
      -[IMGridViewCell setHighlighted:](self->_selectedCell, "setHighlighted:", 0);
      selectedCell = self->_selectedCell;
      self->_selectedCell = 0;

    }
  }

}

- (void)cleanupGrabbedCell
{
  NSString *grabbedCellUniqueID;

  grabbedCellUniqueID = self->_grabbedCellUniqueID;
  self->_grabbedCellUniqueID = 0;

  -[IMGridView setGrabbedCell:](self, "setGrabbedCell:", 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  int64_t v10;
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags;
  IMGridViewCell *selectedCell;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[IMGridView _cancelAutoscrollTimer](self, "_cancelAutoscrollTimer");
  -[IMGridView _cancelCellHighlight](self, "_cancelCellHighlight");
  -[IMGridViewCell setHighlighted:](self->_selectedCell, "setHighlighted:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
  if (WeakRetained)
  {
    v10 = -[IMGridView indexForCell:](self, "indexForCell:", WeakRetained);
    -[IMGridView cleanupGrabbedCell](self, "cleanupGrabbedCell");
    if (self->_grabIndex != v10 && (*(_BYTE *)&self->_gridFlags & 0x10) != 0)
      objc_msgSend(v9, "gridView:reorderCellAtIndex:toIndex:", self);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)IMGridView;
    -[IMGridView touchesEnded:withEvent:](&v13, "touchesEnded:withEvent:", v6, v7);
    if (self->_selectedCell)
    {
      gridFlags = self->_gridFlags;
      if ((*(_BYTE *)&gridFlags & 4) != 0)
      {
        if ((*(_BYTE *)&gridFlags & 8) != 0)
        {
          objc_msgSend(v9, "gridView:updateSelectedCell:", self);
        }
        else if (!-[IMGridView isEditing](self, "isEditing") || !-[IMGridView tapToSelectMode](self, "tapToSelectMode"))
        {
          -[IMGridViewCell setHighlighted:](self->_selectedCell, "setHighlighted:", 1);
        }
        objc_msgSend(v9, "gridView:didSelectItemAtIndex:", self, -[IMGridView indexForCell:](self, "indexForCell:", self->_selectedCell));
      }
    }
  }
  -[IMGridView _cancelCellHighlight](self, "_cancelCellHighlight");
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  IMGridViewCell *selectedCell;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMGridView;
  -[IMGridView touchesCancelled:withEvent:](&v6, "touchesCancelled:withEvent:", a3, a4);
  -[IMGridView _cancelCellHighlight](self, "_cancelCellHighlight");
  -[IMGridViewCell setHighlighted:](self->_selectedCell, "setHighlighted:", 0);
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;

}

- (void)animateDeletionOfCell:(id)a3
{
  int64_t v4;
  id v5;

  if ((*(_BYTE *)&self->_gridFlags & 0x80) != 0)
  {
    v4 = -[IMGridView indexForCell:](self, "indexForCell:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
    objc_msgSend(v5, "gridView:shouldDeleteItemAtIndex:", self, v4);

  }
}

- (void)_autoscrollForCell:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double y;
  float v17;
  double MaxY;
  float v19;
  float autoscrollDistance;
  float v21;
  NSTimer *autoscrollTimer;
  NSTimer *v23;
  NSTimer *v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  self->_autoscrollDistance = 0.0;
  objc_msgSend(a3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[IMGridView bounds](self, "bounds");
  v28.origin.x = v12;
  v28.origin.y = v13;
  v28.size.width = v14;
  v28.size.height = v15;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  if (!CGRectIntersectsRect(v25, v28))
    return;
  y = self->_grabPoint.y;
  -[IMGridView bounds](self, "bounds");
  v17 = y - CGRectGetMinY(v26);
  -[IMGridView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v27);
  if (v17 >= 84.0)
  {
    v21 = (MaxY - self->_grabPoint.y) * 0.5;
    if (v21 >= 84.0)
    {
      autoscrollDistance = self->_autoscrollDistance;
      goto LABEL_8;
    }
    -[IMGridView _autoscrollDistanceForProximityToEdge:](self, "_autoscrollDistanceForProximityToEdge:");
  }
  else
  {
    *(float *)&MaxY = v17;
    -[IMGridView _autoscrollDistanceForProximityToEdge:](self, "_autoscrollDistanceForProximityToEdge:", MaxY);
    autoscrollDistance = -v19;
  }
  self->_autoscrollDistance = autoscrollDistance;
LABEL_8:
  autoscrollTimer = self->_autoscrollTimer;
  if (autoscrollDistance == 0.0)
  {
    -[NSTimer invalidate](autoscrollTimer, "invalidate");
    v23 = 0;
LABEL_10:
    v24 = self->_autoscrollTimer;
    self->_autoscrollTimer = v23;

    return;
  }
  if (!autoscrollTimer)
  {
    v23 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_autoscrollTimerFired:", 0, 1, 0.0166666667));
    goto LABEL_10;
  }
}

- (float)_autoscrollDistanceForProximityToEdge:(float)a3
{
  return ceilf((float)(84.0 - a3) / 3.0);
}

- (void)_legalizeAutoscrollDistance
{
  double v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  uint64_t autoscrollDistance_low;

  -[IMGridView contentOffset](self, "contentOffset");
  v4 = v3;
  v5 = -v4;
  -[IMGridView contentSize](self, "contentSize");
  v7 = v6;
  -[IMGridView bounds](self, "bounds");
  v9 = v8;
  -[IMGridView contentOffset](self, "contentOffset");
  v11 = fmax(v7 - (v9 + v10), 0.0);
  autoscrollDistance_low = LODWORD(self->_autoscrollDistance);
  if (*(float *)&autoscrollDistance_low < v5)
    *(float *)&autoscrollDistance_low = v5;
  if (*(float *)&autoscrollDistance_low < v11)
    v11 = *(float *)&autoscrollDistance_low;
  self->_autoscrollDistance = v11;
}

- (void)_autoscrollTimerFired:(id)a3
{
  -[IMGridView _legalizeAutoscrollDistance](self, "_legalizeAutoscrollDistance", a3);
  -[IMGridView contentOffset](self, "contentOffset");
  -[IMGridView setContentOffset:](self, "setContentOffset:");
  -[IMGridView _updateGrabbedCellLocation:](self, "_updateGrabbedCellLocation:", self->_grabPoint.x, self->_grabPoint.y + self->_autoscrollDistance);
}

- (void)_cancelAutoscrollTimer
{
  NSTimer *autoscrollTimer;

  -[NSTimer invalidate](self->_autoscrollTimer, "invalidate");
  autoscrollTimer = self->_autoscrollTimer;
  self->_autoscrollTimer = 0;

}

- (BOOL)tapToSelectMode
{
  return *((_BYTE *)&self->_gridFlags + 2) & 1;
}

- (void)setTapToSelectMode:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  if (-[IMGridView tapToSelectMode](self, "tapToSelectMode") != a3)
  {
    if (v3)
      v5 = 0x10000;
    else
      v5 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFEFFFF | v5);
    -[IMGridView reloadData](self, "reloadData");
  }
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)&self->_gridFlags + 1) >> 6) & 1;
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (((((*(_DWORD *)&self->_gridFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    if (a3)
      v5 = 0x4000;
    else
      v5 = 0;
    self->_gridFlags = ($5B90CFA202BF1D20308DC9D3199A23B1)(*(_DWORD *)&self->_gridFlags & 0xFFFFBFFF | v5);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_visibleCells;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "setEditing:", v3, (_QWORD)v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[IMGridView reloadData](self, "reloadData");
  }
}

- (id)_cellWithUniqueIdentifier:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = (char *)-[IMGridView rangeOfVisibleCells](self, "rangeOfVisibleCells");
  if (v6 && (v7 = v5, v8 = v6, v5 < &v5[v6]))
  {
    v9 = 0;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifierForCellIndex:", v7));

      if (objc_msgSend(v4, "isEqualToString:", v11))
      {
        v12 = objc_claimAutoreleasedReturnValue(-[IMGridView cellForIndex:](self, "cellForIndex:", v7));

        v9 = (void *)v12;
      }

      ++v7;
      --v8;
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_dataSourceIndexFromReorderedIndex:(int64_t)a3
{
  id WeakRetained;
  int64_t v6;
  int64_t grabIndex;
  _BOOL8 v9;
  int64_t v10;
  int64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained)
  {
    v6 = -[IMGridView indexForCell:](self, "indexForCell:", WeakRetained);
    grabIndex = self->_grabIndex;
    if (v6 != a3)
    {
      v9 = v6 < a3 && grabIndex >= a3;
      v10 = a3 - v9;
      if (v6 > a3 && grabIndex <= a3)
        v12 = a3 + 1;
      else
        v12 = a3;
      if (v6 >= grabIndex)
        grabIndex = v12;
      else
        grabIndex = v10;
    }
  }
  else
  {
    grabIndex = a3;
  }

  return grabIndex;
}

- (id)_dragInteraction:(id)a3 itemsForSession:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  int64_t v12;
  id WeakRetained;
  BOOL v14;
  id v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  $5B90CFA202BF1D20308DC9D3199A23B1 gridFlags;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  unsigned int v38;
  char *v40;
  id v41;
  unsigned int v42;
  id v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView cellAtPoint:](self, "cellAtPoint:", x, y));
  if (!v11)
  {
    v15 = 0;
    goto LABEL_44;
  }
  v12 = -[IMGridView indexForCell:](self, "indexForCell:", v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  v45 = WeakRetained;
  if (WeakRetained)
    v14 = v12 == -[IMGridView indexForCell:](self, "indexForCell:", WeakRetained);
  else
    v14 = 0;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  v17 = -[IMGridView _dataSourceIndexFromReorderedIndex:](self, "_dataSourceIndexFromReorderedIndex:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueIdentifierForCellIndex:", v17));
  v15 = 0;
  if (!v18 || v14)
    goto LABEL_43;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView draggedCellIDs](self, "draggedCellIDs"));
  v20 = objc_msgSend(v19, "containsObject:", v18);

  if ((v20 & 1) != 0)
  {
    v15 = 0;
    goto LABEL_43;
  }
  gridFlags = self->_gridFlags;
  if ((*(_WORD *)&gridFlags & 0x200) != 0)
  {
    v22 = objc_msgSend(v44, "gridView:canReorderCellAtIndex:", self, v17);
    if ((*(_DWORD *)&self->_gridFlags & 0x400) == 0)
      goto LABEL_15;
  }
  else
  {
    v22 = 1;
    if ((*(_WORD *)&gridFlags & 0x400) == 0)
      goto LABEL_15;
  }
  if (!isPhone())
  {
    v23 = objc_msgSend(v44, "gridView:canDragCellAtIndex:", self, v17);
    goto LABEL_17;
  }
LABEL_15:
  v23 = 0;
LABEL_17:
  v42 = v22;
  v43 = v10;
  if ((v22 | v23) != 1)
  {
    v15 = 0;
    goto LABEL_36;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView draggedCellIDs](self, "draggedCellIDs"));
  v40 = (char *)objc_msgSend(v24, "count");

  v41 = v9;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dragItemsForDataSourceIndex:cellIndex:interaction:session:", v17, v12, v9, v10));
  v25 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v25)
    goto LABEL_31;
  v26 = v25;
  v27 = *(_QWORD *)v47;
  do
  {
    v28 = 0;
    do
    {
      if (*(_QWORD *)v47 != v27)
        objc_enumerationMutation(v15);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueIdentifierForDragItem:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v28), v40));
      if (objc_msgSend(v29, "length"))
      {
        if (!v29)
          goto LABEL_26;
LABEL_25:
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView draggedCellIDs](self, "draggedCellIDs"));
        objc_msgSend(v33, "addObject:", v29);

        goto LABEL_26;
      }
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/IMGridView.m", 1814, (uint64_t)"-[IMGridView _dragInteraction:itemsForSession:atPoint:]", (uint64_t)"assetID.length", CFSTR("UIDragItem with no assetID encountered"), v30, v31, v32, (uint64_t)v40);
      if (v29)
        goto LABEL_25;
LABEL_26:

      v28 = (char *)v28 + 1;
    }
    while (v26 != v28);
    v34 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    v26 = v34;
  }
  while (v34);
LABEL_31:

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView draggedCellIDs](self, "draggedCellIDs"));
  v36 = objc_msgSend(v35, "count");

  if (v40 == (_BYTE *)&dword_0 + 1 && (uint64_t)v36 >= 2)
    -[IMGridView _stopReordering:](self, "_stopReordering:", 1);
  v9 = v41;
  objc_msgSend(v16, "dragInteraction:session:willAddItems:forInteraction:", v41, v43, v15, 0, v40);
LABEL_36:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView draggedCellIDs](self, "draggedCellIDs"));
  if (objc_msgSend(v37, "count") == (char *)&dword_0 + 1)
    v38 = v42;
  else
    v38 = 0;

  if (!v45 && v38)
    -[IMGridView setGrabbedCell:](self, "setGrabbedCell:", v11);
  v10 = v43;
LABEL_43:

LABEL_44:
  return v15;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView pendingDropView](self, "pendingDropView"));
  if (v8)
  {
    -[IMGridView _showGrabbedCell](self, "_showGrabbedCell");
    objc_msgSend(v8, "setHidden:", 1);
    -[IMGridView setPendingDropView:](self, "setPendingDropView:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView pendingCancelView](self, "pendingCancelView"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setHidden:", 1);
    -[IMGridView setPendingCancelView:](self, "setPendingCancelView:", 0);
  }
  objc_msgSend(v6, "locationInView:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView _dragInteraction:itemsForSession:atPoint:](self, "_dragInteraction:itemsForSession:atPoint:", v7, v6));

  return v11;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  if (isPhone())
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView _dragInteraction:itemsForSession:atPoint:](self, "_dragInteraction:itemsForSession:atPoint:", v9, v10, x, y));

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6B32C;
  v9[3] = &unk_28E4B0;
  v9[4] = self;
  v10 = a3;
  v11 = a5;
  v7 = v11;
  v8 = v10;
  objc_msgSend(a4, "addCompletion:", v9);

}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dragInteraction:previewForLiftingItem:session:", v10, v9, v8));

  return v12;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  if (a5 < 2 || !self->_draggingInsideApp)
    -[IMGridView _stopReordering:](self, "_stopReordering:", 1, a4);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  if (a5 < 2 || !self->_draggingInsideApp)
    -[IMGridView _showGrabbedCell](self, "_showGrabbedCell");
  -[IMGridView _stopReordering:](self, "_stopReordering:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView draggedCellIDs](self, "draggedCellIDs"));
  objc_msgSend(v9, "removeAllObjects");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  objc_msgSend(v10, "dragInteraction:session:didEndWithOperation:", v11, v8, a5);

}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  objc_msgSend(v11, "dragInteraction:item:willAnimateCancelWithAnimator:", v10, v9, v8);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_6B598;
  v12[3] = &unk_28CBF0;
  v12[4] = self;
  objc_msgSend(v8, "addCompletion:", v12);

}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a4;
  v6 = BKMobileDragAndDropLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1B4A84(v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  return v8;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = BKMobileDragAndDropLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412802;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "interaction: %@ session: %@ willAddItems: %@", (uint8_t *)&v14, 0x20u);
  }

  -[IMGridView _showGrabbedCell](self, "_showGrabbedCell");
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dragInteraction:previewForLiftingItem:session:", v8, v7, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  -[IMGridView setPendingCancelView:](self, "setPendingCancelView:", v11);

  return v10;
}

- (id)_dropOperationForInteraction:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dropProposalForInteraction:session:", v7, v6));

  return v9;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  v9 = objc_msgSend(v8, "dropInteraction:canHandleSession:", v7, v6);

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;

  v5 = a4;
  self->_draggingInsideApp = 1;
  objc_msgSend(v5, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  v10 = BKMobileDragAndDropLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1B4B18(v7, v9);

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained)
  {
    -[IMGridView _updateGrabbedCellLocation:](self, "_updateGrabbedCellLocation:", v9, v11);
    -[IMGridView _autoscrollForCell:](self, "_autoscrollForCell:", WeakRetained);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView _dropOperationForInteraction:session:](self, "_dropOperationForInteraction:session:", v6, v7));
  objc_msgSend(v13, "setPrefersFullSizePreview:", 1);

  return v13;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;

  v5 = a4;
  objc_msgSend(v5, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  v10 = BKMobileDragAndDropLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1B4B98(v7, v9);

  -[IMGridView _cancelAutoscrollTimer](self, "_cancelAutoscrollTimer");
  self->_draggingInsideApp = 0;

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  id WeakRetained;
  int64_t v8;
  int64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (!WeakRetained)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
    objc_msgSend(v10, "performDropForInteraction:session:", v11, v6);
    goto LABEL_6;
  }
  v8 = -[IMGridView indexForCell:](self, "indexForCell:", WeakRetained);
  if (self->_grabIndex != v8 && (*(_BYTE *)&self->_gridFlags & 0x10) != 0)
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
    objc_msgSend(v10, "gridView:reorderCellAtIndex:toIndex:", self, self->_grabIndex, v9);
LABEL_6:

  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dropInteraction:previewForDroppingItem:withDefault:", v10, v9, v8));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  -[IMGridView setPendingDropView:](self, "setPendingDropView:", v13);

  return v12;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6BC18;
  v5[3] = &unk_28CBF0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

- (void)_hideGrabbedCell
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained && (*(_BYTE *)&self->_gridFlags & 0x20) != 0)
  {
    v5 = WeakRetained;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
    objc_msgSend(v4, "gridView:willGrabCell:", self, v5);

    WeakRetained = v5;
  }

}

- (void)_showGrabbedCell
{
  id v3;

  if ((*(_BYTE *)&self->_gridFlags & 0x40) != 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView delegate](self, "delegate"));
    objc_msgSend(v3, "gridViewDidReleaseGrabbedCell:", self);

  }
}

- (void)_stopReordering:(BOOL)a3
{
  _BOOL4 v3;
  int64_t grabIndex;
  IMGridViewCell *selectedCell;
  id WeakRetained;

  v3 = a3;
  -[IMGridView _cancelAutoscrollTimer](self, "_cancelAutoscrollTimer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  grabIndex = self->_grabIndex;
  -[IMGridView cleanupGrabbedCell](self, "cleanupGrabbedCell");
  if (v3)
    -[IMGridView _restoreGrabbedCell:toOriginalGrabIndex:](self, "_restoreGrabbedCell:toOriginalGrabIndex:", WeakRetained, grabIndex);
  -[IMGridView _cancelCellHighlight](self, "_cancelCellHighlight");
  -[IMGridViewCell setHighlighted:](self->_selectedCell, "setHighlighted:", 0);
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;

}

- (void)setGrabbedCell:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_grabbedCell, obj);
    if (obj)
    {
      -[IMGridView setScrollEnabled:](self, "setScrollEnabled:", 0);
      self->_grabIndex = -[IMGridView indexForCell:](self, "indexForCell:", obj);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView dragAndDropDelegate](self, "dragAndDropDelegate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifierForCellIndex:", self->_grabIndex));
      -[IMGridView setGrabbedCellUniqueID:](self, "setGrabbedCellUniqueID:", v6);

      objc_msgSend(obj, "setGrabbed:", 1);
    }
    else
    {
      -[IMGridView beginUpdates](self, "beginUpdates");
      objc_msgSend(WeakRetained, "setGrabbed:", 0);
      -[IMGridView setScrollEnabled:](self, "setScrollEnabled:", 1);
      -[IMGridView endUpdates](self, "endUpdates");
    }
  }

}

- (void)_swapGrabbedCell:(id)a3 withOtherCell:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  v8 = -[IMGridView indexForCell:](self, "indexForCell:", v6);
  v9 = -[IMGridView indexForCell:](self, "indexForCell:", v7);
  if (v8 != v9)
  {
    v10 = v9;
    if (v9 > v8)
      v11 = -1;
    else
      v11 = 1;
    if (v9 > v8)
      v12 = 1;
    else
      v12 = -1;
    v13 = v8 + v12;
    if (v13 != v9)
    {
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView visibleCellForIndex:](self, "visibleCellForIndex:", v13));
        objc_msgSend(v14, "setTag:", (char *)objc_msgSend(v14, "tag") + v11);

        v13 += v12;
      }
      while (v10 != v13);
    }
    objc_msgSend(v6, "setTag:", v10 + 10000);
    objc_msgSend(v7, "setTag:", (char *)objc_msgSend(v7, "tag") - v12);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_6C014;
    v15[3] = &unk_28B960;
    v15[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v15, 0.3);
  }

}

- (void)_restoreGrabbedCell:(id)a3 toOriginalGrabIndex:(int64_t)a4
{
  id v6;
  int64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  int64_t i;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  IMGridView *v17;
  BOOL v18;

  v6 = a3;
  v7 = -[IMGridView indexForCell:](self, "indexForCell:", v6);
  v8 = v7 != a4 && v6 != 0;
  if (v7 > a4)
    v9 = 1;
  else
    v9 = -1;
  if (v7 > a4)
    v10 = -1;
  else
    v10 = 1;
  if (v8)
  {
    for (i = v7 + v10; a4 != i; i += v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView visibleCellForIndex:](self, "visibleCellForIndex:", i));
      objc_msgSend(v12, "setTag:", (char *)objc_msgSend(v12, "tag") + v9);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridView visibleCellForIndex:](self, "visibleCellForIndex:", a4));
    objc_msgSend(v13, "setTag:", (char *)objc_msgSend(v13, "tag") + v9);
    objc_msgSend(v6, "setTag:", a4 + 10000);

  }
  -[IMGridView rectForCellAtIndex:](self, "rectForCellAtIndex:", a4);
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setAlpha:", 0.0);
  -[IMGridView _showGrabbedCell](self, "_showGrabbedCell");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_6C19C;
  v15[3] = &unk_28BDD0;
  v18 = v8;
  v16 = v6;
  v17 = self;
  v14 = v6;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v15, 0.3);

}

- (void)_updateGrabbedCellLocation:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  id v9;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_grabbedCell);
  objc_msgSend(WeakRetained, "frame");
  v8 = v7 + y - self->_grabPoint.y;
  objc_msgSend(WeakRetained, "setFrame:", v6 + x - self->_grabPoint.x, v8);
  self->_grabPoint.x = x;
  self->_grabPoint.y = y;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView cellAtPoint:ensureSelectionRect:](self, "cellAtPoint:ensureSelectionRect:", 0, x, y));
  if (!v9 && v8 > 0.0)
    v9 = (id)objc_claimAutoreleasedReturnValue(-[IMGridView visibleCellForIndex:](self, "visibleCellForIndex:", self->_numberOfItems - 1));
  if (v9 != WeakRetained && v9 != 0)
    -[IMGridView _swapGrabbedCell:withOtherCell:](self, "_swapGrabbedCell:withOtherCell:", WeakRetained, v9);

}

- (IMGridViewDataSource)dataSource
{
  return (IMGridViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BOOL)tapAndHoldToReorder
{
  return self->_tapAndHoldToReorder;
}

- (void)setTapAndHoldToReorder:(BOOL)a3
{
  self->_tapAndHoldToReorder = a3;
}

- (BOOL)jiggleWhenEditing
{
  return self->_jiggleWhenEditing;
}

- (void)setJiggleWhenEditing:(BOOL)a3
{
  self->_jiggleWhenEditing = a3;
}

- (double)grabTimerDelayEditing
{
  return self->_grabTimerDelayEditing;
}

- (void)setGrabTimerDelayEditing:(double)a3
{
  self->_grabTimerDelayEditing = a3;
}

- (double)grabTimerDelayNotEditing
{
  return self->_grabTimerDelayNotEditing;
}

- (void)setGrabTimerDelayNotEditing:(double)a3
{
  self->_grabTimerDelayNotEditing = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (UIView)gridViewHeader
{
  return self->_gridViewHeader;
}

- (CGSize)cellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cellSize.width;
  height = self->_cellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (CGSize)minimumGridSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumGridSpacing.width;
  height = self->_minimumGridSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumGridSpacing:(CGSize)a3
{
  self->_minimumGridSpacing = a3;
}

- (UIEdgeInsets)gridInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridInset.top;
  left = self->_gridInset.left;
  bottom = self->_gridInset.bottom;
  right = self->_gridInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridInset:(UIEdgeInsets)a3
{
  self->_gridInset = a3;
}

- (UIEdgeInsets)visibleRegionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_visibleRegionInsets.top;
  left = self->_visibleRegionInsets.left;
  bottom = self->_visibleRegionInsets.bottom;
  right = self->_visibleRegionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setVisibleRegionInsets:(UIEdgeInsets)a3
{
  self->_visibleRegionInsets = a3;
}

- (IMGridViewCell)grabbedCell
{
  return (IMGridViewCell *)objc_loadWeakRetained((id *)&self->_grabbedCell);
}

- (BKLibraryDragAndDropDelegate)dragAndDropDelegate
{
  return (BKLibraryDragAndDropDelegate *)objc_loadWeakRetained((id *)&self->_dragAndDropDelegate);
}

- (void)setDragAndDropDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dragAndDropDelegate, a3);
}

- (NSMutableSet)draggedCellIDs
{
  return self->_draggedCellIDs;
}

- (void)setDraggedCellIDs:(id)a3
{
  objc_storeStrong((id *)&self->_draggedCellIDs, a3);
}

- (BOOL)draggingInsideApp
{
  return self->_draggingInsideApp;
}

- (void)setDraggingInsideApp:(BOOL)a3
{
  self->_draggingInsideApp = a3;
}

- (NSString)grabbedCellUniqueID
{
  return self->_grabbedCellUniqueID;
}

- (void)setGrabbedCellUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (UIView)pendingDropView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_pendingDropView);
}

- (void)setPendingDropView:(id)a3
{
  objc_storeWeak((id *)&self->_pendingDropView, a3);
}

- (UIView)pendingCancelView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_pendingCancelView);
}

- (void)setPendingCancelView:(id)a3
{
  objc_storeWeak((id *)&self->_pendingCancelView, a3);
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (BOOL)hidingCells
{
  return self->_hidingCells;
}

- (void)setHidingCells:(BOOL)a3
{
  self->_hidingCells = a3;
}

- (BOOL)hideFooterView
{
  return self->_hideFooterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_pendingCancelView);
  objc_destroyWeak((id *)&self->_pendingDropView);
  objc_storeStrong((id *)&self->_grabbedCellUniqueID, 0);
  objc_storeStrong((id *)&self->_draggedCellIDs, 0);
  objc_destroyWeak((id *)&self->_dragAndDropDelegate);
  objc_destroyWeak((id *)&self->_grabbedCell);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cellsForReuse, 0);
  objc_storeStrong((id *)&self->_gridViewHeader, 0);
  objc_storeStrong((id *)&self->_cellsToDelete, 0);
  objc_storeStrong((id *)&self->_reloadItems, 0);
  objc_storeStrong((id *)&self->_deleteItems, 0);
  objc_storeStrong((id *)&self->_insertItems, 0);
  objc_storeStrong((id *)&self->_autoscrollTimer, 0);
  objc_storeStrong((id *)&self->_cellContainerMatrix, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_reusableCells, 0);
  objc_storeStrong((id *)&self->_visibleCells, 0);
}

@end
