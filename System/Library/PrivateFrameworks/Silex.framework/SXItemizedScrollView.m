@implementation SXItemizedScrollView

- (void)commonInit
{
  NSArray *v3;
  NSArray *frames;
  NSIndexSet *v5;
  NSIndexSet *visibleIndices;
  NSMutableDictionary *v7;
  NSMutableDictionary *visibleViewsByIndex;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SXItemizedScrollView;
  -[SXItemizedScrollView setDelegate:](&v9, sel_setDelegate_, self);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  frames = self->_frames;
  self->_frames = v3;

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
  v5 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  visibleIndices = self->_visibleIndices;
  self->_visibleIndices = v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  visibleViewsByIndex = self->_visibleViewsByIndex;
  self->_visibleViewsByIndex = v7;

  self->_activeViewIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[SXItemizedScrollView setScrollsToTop:](self, "setScrollsToTop:", 0);
  -[SXItemizedScrollView setPagingEnabled:](self, "setPagingEnabled:", 1);
  -[SXItemizedScrollView setShowsHorizontalScrollIndicator:](self, "setShowsHorizontalScrollIndicator:", 0);
  -[SXItemizedScrollView setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", 0);
  -[SXItemizedScrollView setDelaysContentTouches:](self, "setDelaysContentTouches:", 0);
  -[SXItemizedScrollView setCanCancelContentTouches:](self, "setCanCancelContentTouches:", 1);
}

- (SXItemizedScrollView)initWithCoder:(id)a3
{
  SXItemizedScrollView *v3;
  SXItemizedScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXItemizedScrollView;
  v3 = -[SXItemizedScrollView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[SXItemizedScrollView commonInit](v3, "commonInit");
  return v4;
}

- (SXItemizedScrollView)initWithFrame:(CGRect)a3
{
  SXItemizedScrollView *v3;
  SXItemizedScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXItemizedScrollView;
  v3 = -[SXItemizedScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SXItemizedScrollView commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SXItemizedScrollView;
  -[SXItemizedScrollView layoutSubviews](&v9, sel_layoutSubviews);
  if ((-[SXItemizedScrollView isDragging](self, "isDragging") & 1) != 0
    || -[SXItemizedScrollView isTracking](self, "isTracking"))
  {
    self->_gotActiveViewIndexChange = 1;
  }
  -[SXItemizedScrollView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (-[SXItemizedScrollView dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "itemizedScrollViewWillReindex:", self),
        v5,
        v6))
  {
    -[SXItemizedScrollView determineNewVisibilityRange](self, "determineNewVisibilityRange");
    v7 = -[SXItemizedScrollView visibleRange](self, "visibleRange");
    -[SXItemizedScrollView viewManagementForRange:](self, "viewManagementForRange:", v7, v8);
  }
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  CGFloat v16;
  CGFloat v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)SXItemizedScrollView;
  -[SXItemizedScrollView setFrame:](&v46, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SXItemizedScrollView framesAreValidForSize](self, "framesAreValidForSize");
  v5 = v4;
  v7 = v6;
  -[SXItemizedScrollView bounds](self, "bounds");
  if (v5 != v9 || v7 != v8)
  {
    -[SXItemizedScrollView superview](self, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SXItemizedScrollView dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0
        || (-[SXItemizedScrollView dataSource](self, "dataSource"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "itemizedScrollViewWillReindex:", self),
            v14,
            v15))
      {
        -[SXItemizedScrollView bounds](self, "bounds");
        self->_framesAreValidForSize.width = v16;
        self->_framesAreValidForSize.height = v17;
        -[SXItemizedScrollView rebuildFramesArray](self, "rebuildFramesArray");
        v18 = -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex");
        self->_activeViewIndex = 0x7FFFFFFFFFFFFFFFLL;
        if (-[SXItemizedScrollView gotActiveViewIndexChange](self, "gotActiveViewIndexChange"))
          -[SXItemizedScrollView setActiveViewIndex:animated:](self, "setActiveViewIndex:animated:", v18, 0);
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        -[SXItemizedScrollView visibleViewsByIndex](self, "visibleViewsByIndex", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v43 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              v25 = objc_msgSend(v24, "integerValue");
              -[SXItemizedScrollView dataSource](self, "dataSource");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_opt_respondsToSelector();

              if ((v27 & 1) != 0)
              {
                -[SXItemizedScrollView dataSource](self, "dataSource");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "itemizedScrollView:isAllowedToAddViewInHierarchy:", self, v25);

                if (!v29)
                  continue;
              }
              -[SXItemizedScrollView visibleViewsByIndex](self, "visibleViewsByIndex");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v24);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              -[SXItemizedScrollView frames](self, "frames");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectAtIndexedSubscript:", v25);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "CGRectValue");
              v35 = v34;
              v37 = v36;
              v39 = v38;
              v41 = v40;

              objc_msgSend(v31, "setFrame:", v35, v37, v39, v41);
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          }
          while (v21);
        }

      }
    }
  }
}

- (void)forceCorrectFrames
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SXItemizedScrollView visibleViewsByIndex](self, "visibleViewsByIndex", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "unsignedIntegerValue");
        -[SXItemizedScrollView visibleViewsByIndex](self, "visibleViewsByIndex");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SXItemizedScrollView frames](self, "frames");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "CGRectValue");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;

        objc_msgSend(v11, "frame");
        v29.origin.x = v15;
        v29.origin.y = v17;
        v29.size.width = v19;
        v29.size.height = v21;
        if (!CGRectEqualToRect(v28, v29))
          objc_msgSend(v11, "setFrame:", v15, v17, v19, v21);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

}

- (void)reindexate
{
  -[SXItemizedScrollView setFramesAreValidForSize:](self, "setFramesAreValidForSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[SXItemizedScrollView frame](self, "frame");
  -[SXItemizedScrollView setFrame:](self, "setFrame:");
}

- (void)setActiveViewIndex:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t activeViewIndex;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
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
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  double MinX;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  activeViewIndex = self->_activeViewIndex;
  self->_activeViewIndex = a3;
  self->_gotActiveViewIndexChange = 1;
  if (activeViewIndex != a3)
  {
    v7 = -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex");
    -[SXItemizedScrollView frames](self, "frames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 >= v9)
      -[SXItemizedScrollView rebuildFramesArray](self, "rebuildFramesArray");
    v10 = -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex");
    -[SXItemizedScrollView frames](self, "frames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 < v12)
    {
      -[SXItemizedScrollView frames](self, "frames");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v13, "objectAtIndexedSubscript:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "CGRectValue");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      -[SXItemizedScrollView activeView](self, "activeView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v46.origin.x = v16;
      v46.origin.y = v18;
      v46.size.width = v20;
      v46.size.height = v22;
      LOBYTE(v13) = CGRectEqualToRect(v42, v46);

      if ((v13 & 1) == 0)
      {
        -[SXItemizedScrollView dataSource](self, "dataSource");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) == 0
          || (-[SXItemizedScrollView dataSource](self, "dataSource"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v26, "itemizedScrollView:isAllowedToAddViewInHierarchy:", self, -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex")), v26, v27))
        {
          -[SXItemizedScrollView activeView](self, "activeView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setFrame:", v16, v18, v20, v22);

        }
      }
      -[SXItemizedScrollView frame](self, "frame");
      v30 = v16 + v29;
      -[SXItemizedScrollView frame](self, "frame");
      v43.origin.y = v18 + v31;
      v43.origin.x = v30;
      v43.size.width = v20;
      v43.size.height = v22;
      MinX = CGRectGetMinX(v43);
      -[SXItemizedScrollView contentInset](self, "contentInset");
      v34 = v33;
      v35 = 0.0;
      if (!-[SXItemizedScrollView contentTooSmall](self, "contentTooSmall"))
      {
        v35 = MinX - v34;
        -[SXItemizedScrollView bounds](self, "bounds");
        v36 = MinX - v34 + CGRectGetWidth(v44);
        -[SXItemizedScrollView contentSize](self, "contentSize");
        if (v36 > v37)
        {
          -[SXItemizedScrollView contentSize](self, "contentSize");
          v39 = v38;
          -[SXItemizedScrollView bounds](self, "bounds");
          v40 = v39 - CGRectGetWidth(v45);
          -[SXItemizedScrollView frame](self, "frame");
          v35 = v40 - v41;
        }
      }
      -[SXItemizedScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v35, 0.0);
    }
  }
}

- (UIView)activeView
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[SXItemizedScrollView visibleViewsByIndex](self, "visibleViewsByIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex");
    -[SXItemizedScrollView frames](self, "frames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v6 >= v8)
    {
      v5 = 0;
    }
    else
    {
      -[SXItemizedScrollView determineNewVisibilityRange](self, "determineNewVisibilityRange");
      v9 = -[SXItemizedScrollView visibleRange](self, "visibleRange");
      -[SXItemizedScrollView viewManagementForRange:](self, "viewManagementForRange:", v9, v10);
      -[SXItemizedScrollView visibleViewsByIndex](self, "visibleViewsByIndex");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (UIView *)v5;
}

- (CGRect)frameForViewAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
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
  CGRect result;

  -[SXItemizedScrollView frames](self, "frames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v10 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    -[SXItemizedScrollView frames](self, "frames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGRectValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)determineNewVisibilityRange
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  double v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  _NSRange *p_visibleRange;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[SXItemizedScrollView frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = 0;
  if (v4)
  {
    v6 = 0;
    v7 = -1;
    do
    {
      -[SXItemizedScrollView frames](self, "frames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "CGRectValue");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      -[SXItemizedScrollView bounds](self, "bounds");
      v38.origin.x = v11;
      v38.origin.y = v13;
      v38.size.width = v15;
      v38.size.height = v17;
      v36 = CGRectIntersection(v35, v38);
      Width = CGRectGetWidth(v36);
      v37.origin.x = v11;
      v37.origin.y = v13;
      v37.size.width = v15;
      v37.size.height = v17;
      v19 = Width / CGRectGetWidth(v37);
      if (v7 >= v6)
        v20 = v6;
      else
        v20 = v7;
      if (v5 <= v6)
        v21 = v6;
      else
        v21 = v5;
      if (v19 > 0.0)
      {
        v5 = v21;
        v7 = v20;
      }
      ++v6;
      -[SXItemizedScrollView frames](self, "frames");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v6 < v23);
  }
  else
  {
    v7 = -1;
  }
  if ((-[SXItemizedScrollView isPagingEnabled](self, "isPagingEnabled") & 1) == 0
    || -[SXItemizedScrollView isDecelerating](self, "isDecelerating")
    && (-[SXItemizedScrollView _pageDecelerationTarget](self, "_pageDecelerationTarget"),
        v25 = v24,
        v27 = v26,
        -[SXItemizedScrollView contentOffset](self, "contentOffset"),
        v25 == v29)
    && v27 == v28)
  {
    v30 = 0;
  }
  else if ((-[SXItemizedScrollView isDecelerating](self, "isDecelerating") & 1) != 0
         || (-[SXItemizedScrollView isTracking](self, "isTracking") & 1) != 0)
  {
    v30 = 1;
  }
  else
  {
    v30 = -[SXItemizedScrollView _isAnimatingScrollTest](self, "_isAnimatingScrollTest");
  }
  if (v7 != -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex")
    && ((!-[SXItemizedScrollView gotActiveViewIndexChange](self, "gotActiveViewIndexChange") | v30) & 1) == 0)
  {
    self->_activeViewIndex = v7;
    -[SXItemizedScrollView delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_respondsToSelector();

    if ((v32 & 1) != 0)
    {
      -[SXItemizedScrollView delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "itemizedScrollView:didChangeToActiveViewIndex:", self, -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));

    }
  }
  p_visibleRange = &self->_visibleRange;
  if (v7 != -1 || v5)
  {
    p_visibleRange->location = v7;
    self->_visibleRange.length = v5 - v7 + 1;
  }
  else
  {
    p_visibleRange->location = 0;
    self->_visibleRange.length = 0;
  }
}

- (void)rebuildFramesArray
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  id v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double MaxX;
  double v38;
  double v39;
  double Height;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t i;
  double v51;
  void *v52;
  void *v53;
  double v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v80 = *MEMORY[0x24BDAC8D0];
  -[SXItemizedScrollView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfViewsInItemizedScrollView:", self);

  v5 = 0.0;
  if ((-[SXItemizedScrollView isPagingEnabled](self, "isPagingEnabled") & 1) == 0)
  {
    -[SXItemizedScrollView dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SXItemizedScrollView dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "gutterBetweenItemsInNotPagingItemizedScrollView:", self);
      v5 = v9;

    }
  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v4)
  {
    v11 = 0;
    v12 = 0.0;
    do
    {
      -[SXItemizedScrollView dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemizedScrollView:frameForViewAtIndex:", self, v11);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v22 = v12 + v15;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v22, v17, v19, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v23);
      if (-[SXItemizedScrollView isPagingEnabled](self, "isPagingEnabled"))
      {
        -[SXItemizedScrollView bounds](self, "bounds");
        v12 = v12 + CGRectGetWidth(v81);
      }
      else
      {
        v82.origin.x = v22;
        v82.origin.y = v17;
        v82.size.width = v19;
        v82.size.height = v21;
        v24 = v12 + CGRectGetWidth(v82);
        v25 = -0.0;
        if (v4 - 1 != v11)
          v25 = v5;
        v12 = v25 + v24;
      }

      ++v11;
    }
    while (v4 != v11);
  }
  v26 = (void *)objc_msgSend(v10, "copy");
  -[SXItemizedScrollView setFrames:](self, "setFrames:", v26);

  -[SXItemizedScrollView frames](self, "frames");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "CGRectValue");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v83.origin.x = v30;
  v83.origin.y = v32;
  v83.size.width = v34;
  v83.size.height = v36;
  MaxX = CGRectGetMaxX(v83);
  -[SXItemizedScrollView frame](self, "frame");
  v39 = MaxX - v38;
  -[SXItemizedScrollView bounds](self, "bounds");
  Height = CGRectGetHeight(v84);
  -[SXItemizedScrollView bounds](self, "bounds");
  if (v39 <= v41 + -20.0)
  {
    -[SXItemizedScrollView bounds](self, "bounds");
    v43 = v42;
    v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[SXItemizedScrollView frames](self, "frames", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    if (v46)
    {
      v47 = v46;
      v48 = v43 * 0.5 - v39 * 0.5;
      v49 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v76 != v49)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "CGRectValue");
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v48 + v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v52);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      }
      while (v47);
    }

    -[SXItemizedScrollView setContentTooSmall:](self, "setContentTooSmall:", 1);
    v53 = (void *)objc_msgSend(v44, "copy");
    -[SXItemizedScrollView setFrames:](self, "setFrames:", v53);

    -[SXItemizedScrollView bounds](self, "bounds");
    v39 = v54;

  }
  else
  {
    -[SXItemizedScrollView setContentTooSmall:](self, "setContentTooSmall:", 0);
  }
  -[SXItemizedScrollView setContentSize:](self, "setContentSize:", v39, Height);
  v55 = -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex");
  -[SXItemizedScrollView frames](self, "frames");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "count");

  if (v55 < v57)
  {
    -[SXItemizedScrollView frames](self, "frames");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "CGRectValue");
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;

    -[SXItemizedScrollView frame](self, "frame");
    v69 = v68;
    -[SXItemizedScrollView contentInset](self, "contentInset");
    v71 = v61 + v69 - v70;
    -[SXItemizedScrollView frame](self, "frame");
    v85.origin.y = v63 + v72;
    v85.origin.x = v71;
    v85.size.width = v65;
    v85.size.height = v67;
    -[SXItemizedScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, CGRectGetMinX(v85), 0.0);
  }
  -[SXItemizedScrollView determineNewVisibilityRange](self, "determineNewVisibilityRange");
  v73 = -[SXItemizedScrollView visibleRange](self, "visibleRange");
  -[SXItemizedScrollView viewManagementForRange:](self, "viewManagementForRange:", v73, v74);

}

- (void)viewManagementForRange:(_NSRange)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke;
  v14[3] = &unk_24D68BEC0;
  v14[4] = self;
  objc_msgSend(v4, "indexesWithOptions:passingTest:", 0, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXItemizedScrollView visibleIndices](self, "visibleIndices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke_2;
  v12[3] = &unk_24D68BEC0;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v7, "indexesWithOptions:passingTest:", 0, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke_3;
  v11[3] = &unk_24D68B550;
  v11[4] = self;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v11);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke_4;
  v10[3] = &unk_24D68B550;
  v10[4] = self;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v10);
  -[SXItemizedScrollView setVisibleIndices:](self, "setVisibleIndices:", v9);

}

uint64_t __47__SXItemizedScrollView_viewManagementForRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "visibleIndices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsIndex:", a2) ^ 1;

  return v4;
}

uint64_t __47__SXItemizedScrollView_viewManagementForRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2) ^ 1;
}

void __47__SXItemizedScrollView_viewManagementForRange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visibleViewsByIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "visibleViewsByIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v10);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemizedScrollView:didHideViewWithIndex:", *(_QWORD *)(a1 + 32), a2);

  }
}

void __47__SXItemizedScrollView_viewManagementForRange___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  void *v25;
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemizedScrollView:willShowViewWithIndex:", *(_QWORD *)(a1 + 32), a2);

  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemizedScrollView:viewAtIndex:", *(_QWORD *)(a1 + 32), a2);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visibleViewsByIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, v8);

  objc_msgSend(*(id *)(a1 + 32), "frames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a2);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "CGRectValue");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "dataSource"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "itemizedScrollView:isAllowedToAddViewInHierarchy:", *(_QWORD *)(a1 + 32), a2),
        v21,
        v22))
  {
    objc_msgSend(v26, "setFrame:", v13, v15, v17, v19);
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v26);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "itemizedScrollView:didShowViewWithIndex:", *(_QWORD *)(a1 + 32), a2);

  }
}

- (void)scrollToNext
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  -[SXItemizedScrollView frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex");

  if (v4 > v5)
    -[SXItemizedScrollView setActiveViewIndex:animated:](self, "setActiveViewIndex:animated:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex") + 1, 0);
}

- (void)scrollToPrevious
{
  if (-[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"))
    -[SXItemizedScrollView setActiveViewIndex:animated:](self, "setActiveViewIndex:animated:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex") - 1, 0);
}

- (SXItemizedScrollViewDataSource)dataSource
{
  return (SXItemizedScrollViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (_NSRange)visibleRange
{
  _NSRange *p_visibleRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_visibleRange = &self->_visibleRange;
  location = self->_visibleRange.location;
  length = p_visibleRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)activeViewIndex
{
  return self->_activeViewIndex;
}

- (CGSize)framesAreValidForSize
{
  double width;
  double height;
  CGSize result;

  width = self->_framesAreValidForSize.width;
  height = self->_framesAreValidForSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFramesAreValidForSize:(CGSize)a3
{
  self->_framesAreValidForSize = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (NSIndexSet)visibleIndices
{
  return self->_visibleIndices;
}

- (void)setVisibleIndices:(id)a3
{
  objc_storeStrong((id *)&self->_visibleIndices, a3);
}

- (BOOL)contentTooSmall
{
  return self->_contentTooSmall;
}

- (void)setContentTooSmall:(BOOL)a3
{
  self->_contentTooSmall = a3;
}

- (BOOL)gotActiveViewIndexChange
{
  return self->_gotActiveViewIndexChange;
}

- (void)setGotActiveViewIndexChange:(BOOL)a3
{
  self->_gotActiveViewIndexChange = a3;
}

- (NSMutableDictionary)visibleViewsByIndex
{
  return self->_visibleViewsByIndex;
}

- (void)setVisibleViewsByIndex:(id)a3
{
  objc_storeStrong((id *)&self->_visibleViewsByIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleViewsByIndex, 0);
  objc_storeStrong((id *)&self->_visibleIndices, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
