@implementation BKPagingScrollView

- (BKPagingScrollView)initWithFrame:(CGRect)a3
{
  BKPagingScrollView *v3;
  BKPagingScrollView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKPagingScrollView;
  v3 = -[BKPagingScrollView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKPagingScrollView setPagingEnabled:](v3, "setPagingEnabled:", 1);
    -[BKPagingScrollView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[BKPagingScrollView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
    v4->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
    v4->_pageCount = 0x7FFFFFFFFFFFFFFFLL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "didReceiveMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKPagingScrollView;
  -[BKPagingScrollView dealloc](&v4, "dealloc");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  uint64_t v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int64_t v50;
  uint64_t v51;
  double v53;
  double v55;
  int64_t v56;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  objc_super v64;
  _BYTE v65[128];
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v64.receiver = self;
  v64.super_class = (Class)BKPagingScrollView;
  -[BKPagingScrollView frame](&v64, "frame");
  v71.origin.x = v8;
  v71.origin.y = v9;
  v71.size.width = v10;
  v71.size.height = v11;
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  if (!CGRectEqualToRect(v66, v71))
  {
    v12 = -[BKPagingScrollView navigationOrientation](self, "navigationOrientation");
    -[BKPagingScrollView contentOffset](self, "contentOffset");
    v14 = v13;
    v16 = v15;
    -[BKPagingScrollView bounds](self, "bounds");
    if (v12)
      v19 = v18;
    else
      v19 = v17;
    if (v12)
      v20 = v16;
    else
      v20 = v14;
    v21 = 0.0;
    if (v19 <= 0.0)
    {
      v22 = 0.0;
    }
    else
    {
      v22 = v20 / v19;
      if (v20 >= 0.0)
      {
        v23 = v22;
        v21 = (double)(int)vcvtms_s32_f32(v23);
        v22 = (v20 - v21 * v19) / v19;
      }
    }
    v63.receiver = self;
    v63.super_class = (Class)BKPagingScrollView;
    -[BKPagingScrollView setFrame:](&v63, "setFrame:", x, y, width, height);
    -[BKPagingScrollView bounds](self, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    if (-[BKPagingScrollView navigationOrientation](self, "navigationOrientation"))
    {
      v67.origin.x = v25;
      v67.origin.y = v27;
      v67.size.width = v29;
      v67.size.height = v31;
      v32 = CGRectGetWidth(v67);
      v33 = (double)-[BKPagingScrollView pageCount](self, "pageCount");
      v68.origin.x = v25;
      v68.origin.y = v27;
      v68.size.width = v29;
      v68.size.height = v31;
      v34 = CGRectGetHeight(v68) * v33;
    }
    else
    {
      v35 = (double)-[BKPagingScrollView pageCount](self, "pageCount");
      v69.origin.x = v25;
      v69.origin.y = v27;
      v69.size.width = v29;
      v69.size.height = v31;
      v32 = CGRectGetWidth(v69) * v35;
      v70.origin.x = v25;
      v70.origin.y = v27;
      v70.size.width = v29;
      v70.size.height = v31;
      v34 = CGRectGetHeight(v70);
    }
    -[BKPagingScrollView setContentSize:](self, "setContentSize:", v32, v34);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView subviews](self, "subviews", 0));
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          if (-[BKPagingScrollView _indexForView:](self, "_indexForView:", v41) != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_opt_class(BKZoomingScrollView);
            if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
            {
              v43 = v41;
              objc_msgSend(v43, "pointToCenterAfterRotation");
              v45 = v44;
              v47 = v46;
              objc_msgSend(v43, "scaleToRestoreAfterRotation");
              v49 = v48;
              -[BKPagingScrollView _frameForPageAtIndex:](self, "_frameForPageAtIndex:", -[BKPagingScrollView _indexForView:](self, "_indexForView:", v43));
              objc_msgSend(v43, "setFrame:");
              objc_msgSend(v43, "configureForNewBoundsAndRestoreCenterPoint:andScale:", v45, v47, v49);

            }
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v38);
    }

    v50 = -[BKPagingScrollView navigationOrientation](self, "navigationOrientation");
    -[BKPagingScrollView bounds](self, "bounds");
    if (v50)
      v53 = CGRectGetHeight(*(CGRect *)&v51);
    v55 = v22 * v53 + v21 * v53;
    v56 = -[BKPagingScrollView navigationOrientation](self, "navigationOrientation");
    v57 = 0.0;
    if (v56)
      v58 = 0.0;
    else
      v58 = v55;
    if (v56)
      v57 = v55;
    -[BKPagingScrollView setContentOffset:](self, "setContentOffset:", v58, v57);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  uint64_t v8;
  double v10;
  double v12;
  int64_t v13;
  int64_t v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  unint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BKPagingScrollView;
  -[BKPagingScrollView layoutSubviews](&v20, "layoutSubviews");
  -[BKPagingScrollView contentOffset](self, "contentOffset");
  v4 = v3;
  v6 = v5;
  v7 = -[BKPagingScrollView navigationOrientation](self, "navigationOrientation");
  -[BKPagingScrollView bounds](self, "bounds");
  if (v7)
    v12 = v6 / CGRectGetHeight(*(CGRect *)&v8);
  else
    v12 = v4 / v10;
  v13 = -[BKPagingScrollView pageCount](self, "pageCount");
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_pageOffset != 0x7FFFFFFFFFFFFFFFLL)
      -[BKPagingScrollView _installViewAtIndex:](self, "_installViewAtIndex:");
  }
  else
  {
    v14 = v13;
    if ((char *)-[BKPagingScrollView layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
      v12 = (double)-[BKPagingScrollView pageCount](self, "pageCount") - v12 + -1.0;
    v15 = floor(v12);
    if (v15 < 0.0)
      v15 = 0.0;
    v16 = (unint64_t)v15;
    v17 = (double)(unint64_t)(v14 - 1);
    v18 = ceil(v12);
    if (v18 < v17)
      v17 = v18;
    v19 = (unint64_t)v17;
    while (v16 <= v19)
      -[BKPagingScrollView _installViewAtIndex:](self, "_installViewAtIndex:", v16++);
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  uint64_t v15;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  objc_super v25;

  y = a3.y;
  x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)BKPagingScrollView;
  -[BKPagingScrollView contentOffset](&v25, "contentOffset");
  if (x != v7 || y != v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)BKPagingScrollView;
    -[BKPagingScrollView setContentOffset:](&v24, "setContentOffset:", x, y);
    if (-[BKPagingScrollView isDecelerating](self, "isDecelerating"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView valueForKey:](self, "valueForKey:", CFSTR("_pageDecelerationTarget")));
      objc_msgSend(v9, "CGPointValue");
      v11 = v10;
      v13 = v12;

      v14 = -[BKPagingScrollView navigationOrientation](self, "navigationOrientation");
      -[BKPagingScrollView bounds](self, "bounds");
      if (v14)
        v19 = v13 / CGRectGetHeight(*(CGRect *)&v15);
      else
        v19 = v11 / CGRectGetWidth(*(CGRect *)&v15);
      if ((char *)-[BKPagingScrollView layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
        v19 = (double)-[BKPagingScrollView pageCount](self, "pageCount") - v19 + -1.0;
      if (v19 != (double)self->_pageOffset)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView delegate](self, "delegate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:", self->_pageOffset));
        objc_msgSend(v20, "pagingScrollView:viewDidDisappear:atIndex:", self, v21, self->_pageOffset);

        self->_pageOffset = (uint64_t)v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView delegate](self, "delegate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:", self->_pageOffset));
        objc_msgSend(v22, "pagingScrollView:viewDidAppear:atIndex:", self, v23, self->_pageOffset);

      }
    }
  }
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  int64_t pageOffset;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  pageOffset = self->_pageOffset;
  if (pageOffset != a3)
  {
    if (pageOffset != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView delegate](self, "delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:", self->_pageOffset));
      objc_msgSend(v6, "pagingScrollView:viewDidDisappear:atIndex:", self, v7, self->_pageOffset);

    }
    self->_pageOffset = a3;
    -[BKPagingScrollView _updateContentOffset](self, "_updateContentOffset");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:", self->_pageOffset));
    objc_msgSend(v8, "pagingScrollView:viewDidAppear:atIndex:", self, v9, self->_pageOffset);

    -[BKPagingScrollView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPageCount:(int64_t)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  double v13;
  double Height;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  if (self->_pageCount != a3)
  {
    self->_pageCount = a3;
    -[BKPagingScrollView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if (-[BKPagingScrollView navigationOrientation](self, "navigationOrientation"))
    {
      v16.origin.x = v5;
      v16.origin.y = v7;
      v16.size.width = v9;
      v16.size.height = v11;
      Width = CGRectGetWidth(v16);
      v13 = (double)-[BKPagingScrollView pageCount](self, "pageCount");
      v17.origin.x = v5;
      v17.origin.y = v7;
      v17.size.width = v9;
      v17.size.height = v11;
      Height = CGRectGetHeight(v17) * v13;
    }
    else
    {
      v15 = (double)-[BKPagingScrollView pageCount](self, "pageCount");
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      Width = CGRectGetWidth(v18) * v15;
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      Height = CGRectGetHeight(v19);
    }
    -[BKPagingScrollView setContentSize:](self, "setContentSize:", Width, Height);
    -[BKPagingScrollView _updateContentOffset](self, "_updateContentOffset");
    -[BKPagingScrollView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;

  if (-[BKPagingScrollView pageOffset](self, "pageOffset") != 0x7FFFFFFFFFFFFFFFLL
    && -[BKPagingScrollView pageCount](self, "pageCount") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BKPagingScrollView _frameForPageAtIndex:](self, "_frameForPageAtIndex:", -[BKPagingScrollView pageOffset](self, "pageOffset"));
    v4 = v3;
    v6 = v5;
    v7 = -[BKPagingScrollView navigationOrientation](self, "navigationOrientation");
    if (v7)
      v8 = v6 + -20.0;
    else
      v8 = v6;
    if (v7)
      v9 = v4;
    else
      v9 = v4 + -20.0;
    -[BKPagingScrollView setContentOffset:](self, "setContentOffset:", v9, v8, v4 + -20.0);
  }
}

- (CGRect)_frameForPageAtIndex:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double Width;
  double Height;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  -[BKPagingScrollView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[BKPagingScrollView navigationOrientation](self, "navigationOrientation"))
  {
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    v13 = (double)a3 * CGRectGetHeight(v21) + 20.0;
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    Width = CGRectGetWidth(v22);
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.width = v10;
    v23.size.height = v12;
    Height = CGRectGetHeight(v23) + -40.0;
    v16 = 0.0;
  }
  else
  {
    v17 = -[BKPagingScrollView layoutDirection](self, "layoutDirection");
    if (-[BKPagingScrollView pageCount](self, "pageCount") != 0x7FFFFFFFFFFFFFFFLL && v17 == 1)
      a3 = -[BKPagingScrollView pageCount](self, "pageCount") + ~a3;
    v24.origin.x = v6;
    v24.origin.y = v8;
    v24.size.width = v10;
    v24.size.height = v12;
    v16 = (double)a3 * CGRectGetWidth(v24) + 20.0;
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    Width = CGRectGetWidth(v25) + -40.0;
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    Height = CGRectGetHeight(v26);
    v13 = 0.0;
  }
  v18 = v16;
  v19 = v13;
  v20 = Width;
  result.size.height = Height;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (int64_t)_indexForView:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "tag");
  if ((uint64_t)v3 <= 999999)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return (int64_t)v3 - 1000000;
}

- (id)viewAtIndex:(int64_t)a3
{
  return -[BKPagingScrollView viewWithTag:](self, "viewWithTag:", a3 + 1000000);
}

- (UIView)currentView
{
  return (UIView *)-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:", -[BKPagingScrollView pageOffset](self, "pageOffset"));
}

- (NSArray)surroundingViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView subviews](self, "subviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = -[BKPagingScrollView _indexForView:](self, "_indexForView:", v9);
        if (v10 != (void *)0x7FFFFFFFFFFFFFFFLL && v10 != (void *)-[BKPagingScrollView pageOffset](self, "pageOffset"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)allViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView subviews](self, "subviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (-[BKPagingScrollView _indexForView:](self, "_indexForView:", v9) != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)_installViewAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:"));
  if (v5)
  {
    -[BKPagingScrollView _frameForPageAtIndex:](self, "_frameForPageAtIndex:", a3);
    objc_msgSend(v5, "setFrame:");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pagingScrollView:viewAtIndex:", self, a3));

    objc_msgSend(v7, "setTag:", a3 + 1000000);
    -[BKPagingScrollView _frameForPageAtIndex:](self, "_frameForPageAtIndex:", a3);
    objc_msgSend(v7, "setFrame:");
    -[BKPagingScrollView addSubview:](self, "addSubview:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView delegate](self, "delegate"));
    objc_msgSend(v8, "pagingScrollView:didAddView:atIndex:", self, v7, a3);

  }
  return v5 == 0;
}

- (void)removeSubview:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "removeFromSuperview");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView delegate](self, "delegate"));
  objc_msgSend(v7, "pagingScrollView:didRemoveView:atIndex:", self, v6, a4);

}

- (void)updateCachedPages
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  unsigned __int8 v14;
  int64_t v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView subviews](self, "subviews", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = -[BKPagingScrollView _indexForView:](self, "_indexForView:", v8);
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = v9;
          v11 = -[BKPagingScrollView pageOffset](self, "pageOffset");
          if (v10 < (uint64_t)(v11
                             + ~(unint64_t)-[BKPagingScrollView pageCacheDistance](self, "pageCacheDistance"))
            || (v12 = -[BKPagingScrollView pageOffset](self, "pageOffset"),
                v10 > -[BKPagingScrollView pageCacheDistance](self, "pageCacheDistance") + v12 + 1))
          {
            -[BKPagingScrollView removeSubview:atIndex:](self, "removeSubview:atIndex:", v8, v10);
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  v13 = -[BKPagingScrollView pageOffset](self, "pageOffset");
  if (v13 + 1 >= -[BKPagingScrollView pageCount](self, "pageCount"))
  {
    v14 = 0;
  }
  else
  {
    v14 = 0;
    do
    {
      v15 = -[BKPagingScrollView pageOffset](self, "pageOffset");
      if (v13 >= -[BKPagingScrollView pageCacheDistance](self, "pageCacheDistance") + v15)
        break;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:", v13 + 1));
      if (!((v16 != 0) | v14 & 1))
        v14 = -[BKPagingScrollView _installViewAtIndex:](self, "_installViewAtIndex:", v13 + 1);

      v17 = -[BKPagingScrollView pageCount](self, "pageCount");
      v18 = v13 + 2;
      ++v13;
    }
    while (v18 < v17);
  }
  v19 = -[BKPagingScrollView pageOffset](self, "pageOffset");
  if (v19 >= 1)
  {
    v20 = v19;
    do
    {
      v21 = -[BKPagingScrollView pageOffset](self, "pageOffset");
      if (v20 <= v21 - -[BKPagingScrollView pageCacheDistance](self, "pageCacheDistance"))
        break;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:", --v20));
      if (!((v22 != 0) | v14 & 1))
        v14 = -[BKPagingScrollView _installViewAtIndex:](self, "_installViewAtIndex:", v20);

    }
    while ((unint64_t)(v20 + 1) > 1);
  }
}

- (void)purgeCachedPages
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  int64_t v9;
  int64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;
  CGRect v29;

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPagingScrollView subviews](self, "subviews", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v9 = -[BKPagingScrollView _indexForView:](self, "_indexForView:", v8);
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = v9;
          objc_msgSend(v8, "frame");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;
          -[BKPagingScrollView bounds](self, "bounds");
          v29.origin.x = v19;
          v29.origin.y = v20;
          v29.size.width = v21;
          v29.size.height = v22;
          v28.origin.x = v12;
          v28.origin.y = v14;
          v28.size.width = v16;
          v28.size.height = v18;
          if (!CGRectIntersectsRect(v28, v29))
            -[BKPagingScrollView removeSubview:atIndex:](self, "removeSubview:atIndex:", v8, v10);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

}

- (void)didReceiveMemoryWarning:(id)a3
{
  -[BKPagingScrollView purgeCachedPages](self, "purgeCachedPages", a3);
}

- (int64_t)navigationOrientation
{
  return self->_navigationOrientation;
}

- (void)setNavigationOrientation:(int64_t)a3
{
  self->_navigationOrientation = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (int64_t)pageCacheDistance
{
  return self->_pageCacheDistance;
}

- (void)setPageCacheDistance:(int64_t)a3
{
  self->_pageCacheDistance = a3;
}

@end
