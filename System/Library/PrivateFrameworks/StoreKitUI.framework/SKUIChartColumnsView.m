@implementation SKUIChartColumnsView

- (SKUIChartColumnsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIChartColumnsView *v8;
  uint64_t v9;
  UIView *headerBackgroundView;
  id v11;
  void *v12;
  uint64_t v13;
  UIVisualEffectView *effectView;
  UIView *v15;
  UIView *borderView0;
  UIView *v17;
  void *v18;
  UIView *v19;
  UIView *borderView1;
  UIView *v21;
  void *v22;
  UIView *v23;
  UIView *headerBackgroundBottomBorder;
  UIView *v25;
  void *v26;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIChartColumnsView initWithFrame:].cold.1();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUIChartColumnsView;
  v8 = -[SKUIChartColumnsView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 0.0, 44.0);
    headerBackgroundView = v8->_headerBackgroundView;
    v8->_headerBackgroundView = (UIView *)v9;

    -[SKUIChartColumnsView addSubview:](v8, "addSubview:", v8->_headerBackgroundView);
    v11 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithEffect:", v12);
    effectView = v8->_effectView;
    v8->_effectView = (UIVisualEffectView *)v13;

    -[UIView addSubview:](v8->_headerBackgroundView, "addSubview:", v8->_effectView);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView0 = v8->_borderView0;
    v8->_borderView0 = v15;

    v17 = v8->_borderView0;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[SKUIChartColumnsView addSubview:](v8, "addSubview:", v8->_borderView0);
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView1 = v8->_borderView1;
    v8->_borderView1 = v19;

    v21 = v8->_borderView1;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SKUIChartColumnsView addSubview:](v8, "addSubview:", v8->_borderView1);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    headerBackgroundBottomBorder = v8->_headerBackgroundBottomBorder;
    v8->_headerBackgroundBottomBorder = v23;

    v25 = v8->_headerBackgroundBottomBorder;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UIView addSubview:](v8->_headerBackgroundView, "addSubview:", v8->_headerBackgroundBottomBorder);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIFlexibleSegmentedControl setDelegate:](self->_segmentedControl, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIChartColumnsView;
  -[SKUIChartColumnsView dealloc](&v3, sel_dealloc);
}

- (void)beginColumnChangeAnimationToNumberOfVisibleColumns:(int64_t)a3
{
  int64_t columnChangeAnimationCount;

  columnChangeAnimationCount = self->_columnChangeAnimationCount;
  self->_columnChangeAnimationCount = columnChangeAnimationCount + 1;
  if (!columnChangeAnimationCount)
  {
    self->_animatingToNumberOfVisibleColumns = a3;
    if (self->_numberOfVisibleColumns >= a3)
    {
      self->_numberOfVisibleColumns = a3;
      -[SKUIChartColumnsView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[SKUIChartColumnsView _reloadColumnViews](self, "_reloadColumnViews");
      -[SKUIChartColumnsView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
}

- (void)endColumnChangeAnimation
{
  int64_t columnChangeAnimationCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;

  columnChangeAnimationCount = self->_columnChangeAnimationCount;
  v3 = columnChangeAnimationCount == 1;
  v4 = columnChangeAnimationCount < 1;
  v5 = columnChangeAnimationCount - 1;
  if (!v4)
  {
    self->_columnChangeAnimationCount = v5;
    if (v3)
    {
      -[SKUIChartColumnsView _reloadColumnViews](self, "_reloadColumnViews");
      -[SKUIChartColumnsView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setChartViewControllers:(id)a3
{
  NSArray *v4;
  NSArray *allViewControllers;

  if (self->_allViewControllers != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    allViewControllers = self->_allViewControllers;
    self->_allViewControllers = v4;

    -[SKUIChartColumnsView _reloadColumnViews](self, "_reloadColumnViews");
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIChartColumnsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNumberOfVisibleColumns:(int64_t)a3
{
  if (self->_numberOfVisibleColumns != a3)
  {
    self->_numberOfVisibleColumns = a3;
    if (!self->_columnChangeAnimationCount)
      -[SKUIChartColumnsView _reloadColumnViews](self, "_reloadColumnViews");
    -[SKUIChartColumnsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  UIView *headerBackgroundBottomBorder;
  SKUIFlexibleSegmentedControl *segmentedControl;
  double v22;
  double v23;
  double v24;
  float v25;
  float v26;
  float v27;
  double v28;
  uint64_t v29;
  int64_t columnChangeAnimationCount;
  double v31;
  void *v32;
  void *v33;
  _BOOL8 v35;
  CGFloat v36;
  UIView *borderView1;
  _BOOL8 v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)SKUIChartColumnsView;
  -[SKUIChartColumnsView layoutSubviews](&v39, sel_layoutSubviews);
  -[SKUIChartColumnsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  v14 = -[NSArray count](self->_columnViews, "count");
  v15 = -[SKUIChartColumnsView numberOfVisibleColumns](self, "numberOfVisibleColumns");
  if (v14 >= v15)
    v16 = v15;
  else
    v16 = v14;
  -[UIView frame](self->_headerBackgroundView, "frame");
  v18 = v17;
  -[UIView setFrame:](self->_headerBackgroundView, "setFrame:");
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:", 0.0, 0.0, v8, v18);
  -[UIView setHidden:](self->_headerBackgroundBottomBorder, "setHidden:", v16 > 1);
  -[SKUIFlexibleSegmentedControl setHidden:](self->_segmentedControl, "setHidden:", v16 > 1);
  v19 = 1.0 / v13;
  if (v16 > 1)
    goto LABEL_13;
  headerBackgroundBottomBorder = self->_headerBackgroundBottomBorder;
  if (headerBackgroundBottomBorder)
    -[UIView setFrame:](headerBackgroundBottomBorder, "setFrame:", 0.0, v18 - v19, v8, v19);
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    -[SKUIFlexibleSegmentedControl frame](segmentedControl, "frame");
    -[SKUIFlexibleSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    if (v22 >= v8 + -30.0)
      v24 = v8 + -30.0;
    else
      v24 = v22;
    v25 = (v8 - v24) * 0.5;
    v26 = (v18 - v23) * 0.5;
    -[SKUIFlexibleSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", floorf(v25), floorf(v26));
  }
  if (v16)
  {
LABEL_13:
    v27 = v8 / (double)v16;
    v28 = floorf(v27);
    if (v14 >= 1)
    {
      v29 = 0;
      columnChangeAnimationCount = self->_columnChangeAnimationCount;
      v31 = 0.0;
      do
      {
        if (v16 > 1)
        {
          -[NSArray objectAtIndex:](self->_headerViews, "objectAtIndex:", v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "frame");
          SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v31, 0.0, v28, v18, v4, v6, v8, v10);
          objc_msgSend(v32, "setFrame:");

        }
        -[NSArray objectAtIndex:](self->_columnViews, "objectAtIndex:", v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "frame");
        SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v31, 0.0, v28, v10, v4, v6, v8, v10);
        objc_msgSend(v33, "setFrame:");
        v35 = columnChangeAnimationCount < 1 && v29 >= v16;
        objc_msgSend(v33, "setHidden:", v35);
        v31 = v31 + v28;

        ++v29;
      }
      while (v14 != v29);
    }
    v36 = v10 + -15.0;
    -[UIView setFrame:](self->_borderView0, "setFrame:", v28, self->_contentInset.top + 15.0, v19, v36);
    -[UIView setHidden:](self->_borderView0, "setHidden:", v16 < 2);
    -[UIView setFrame:](self->_borderView1, "setFrame:", v28 + v28, self->_contentInset.top + 15.0, v19, v36);
    borderView1 = self->_borderView1;
    v38 = v16 < 3;
  }
  else
  {
    -[UIView setHidden:](self->_borderView0, "setHidden:", 1);
    borderView1 = self->_borderView1;
    v38 = 1;
  }
  -[UIView setHidden:](borderView1, "setHidden:", v38);
}

- (void)_headerViewAction:(id)a3
{
  NSUInteger v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[NSArray indexOfObjectIdenticalTo:](self->_headerViews, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSArray objectAtIndex:](self->_columnViews, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedViewControllerIndex:", objc_msgSend(v6, "selectedTitleIndex"));

  }
}

- (void)segmentedControl:(id)a3 didSelectSegmentIndex:(int64_t)a4
{
  id v5;

  -[NSArray firstObject](self->_columnViews, "firstObject", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedViewControllerIndex:", a4);

}

- (id)_headerViewWithViewControllers:(id)a3
{
  id v4;
  SKUIChartColumnHeaderView *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(SKUIChartColumnHeaderView);
  -[SKUIChartColumnHeaderView addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, sel__headerViewAction_, 4096);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIChartColumnHeaderView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[SKUIChartColumnHeaderView sizeToFit](v5, "sizeToFit");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "title", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[SKUIChartColumnHeaderView setTitles:](v5, "setTitles:", v7);
  return v5;
}

- (void)_reloadColumnViews
{
  id v3;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SKUIFlexibleSegmentedControl *v19;
  SKUIChartColumnsView *v20;
  SKUIFlexibleSegmentedControl *segmentedControl;
  uint64_t v22;
  void *v23;
  SKUIChartColumnsView *v24;
  uint64_t k;
  void *v26;
  SKUIIPadChartsColumnView *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t ii;
  void *v46;
  NSArray *headerViews;
  NSArray **p_columnViews;
  NSArray *v49;
  id v50;
  id v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  SKUIChartColumnsView *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = self;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  p_columnViews = &self->_columnViews;
  v5 = self->_columnViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v75 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "selectedViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v57, "addObject:", v10);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    }
    while (v7);
  }
  v50 = v3;

  if (v56->_columnChangeAnimationCount <= 0)
    v11 = &OBJC_IVAR___SKUIChartColumnsView__numberOfVisibleColumns;
  else
    v11 = &OBJC_IVAR___SKUIChartColumnsView__animatingToNumberOfVisibleColumns;
  v55 = *(uint64_t *)((char *)&v56->super.super.super.isa + *v11);
  v12 = -[NSArray count](v56->_allViewControllers, "count");
  if (v12 >= 1)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
    {
      -[NSArray objectAtIndex:](v56->_allViewControllers, "objectAtIndex:", j);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count") <= (unint64_t)(j % v55))
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v15, 0);
        v16 = v4;
        v18 = v17;
      }
      else
      {
        objc_msgSend(v4, "objectAtIndex:", j % v55);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = v15;
      }
      objc_msgSend(v16, "addObject:", v18);

    }
  }
  if (v55 == 1 && !v56->_segmentedControl)
  {
    v19 = objc_alloc_init(SKUIFlexibleSegmentedControl);
    v20 = v56;
    segmentedControl = v56->_segmentedControl;
    v56->_segmentedControl = v19;

    -[SKUIFlexibleSegmentedControl setDelegate:](v20->_segmentedControl, "setDelegate:", v20);
    -[UIView addSubview:](v20->_headerBackgroundView, "addSubview:", v20->_segmentedControl);
  }
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v4;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  if (v54)
  {
    v53 = *(_QWORD *)v71;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    v23 = v50;
    v24 = v56;
    do
    {
      for (k = 0; k != v54; ++k)
      {
        if (*(_QWORD *)v71 != v53)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
        v27 = objc_alloc_init(SKUIIPadChartsColumnView);
        -[SKUIIPadChartsColumnView setContentInset:](v27, "setContentInset:", v24->_contentInset.top, v24->_contentInset.left, v24->_contentInset.bottom, v24->_contentInset.right);
        -[SKUIIPadChartsColumnView setContentViewControllers:](v27, "setContentViewControllers:", v26);
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v28 = v57;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v67;
          while (2)
          {
            for (m = 0; m != v30; ++m)
            {
              if (*(_QWORD *)v67 != v31)
                objc_enumerationMutation(v28);
              v33 = objc_msgSend(v26, "indexOfObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m));
              if (v33 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v22 = v33;
                -[SKUIIPadChartsColumnView setSelectedViewControllerIndex:](v27, "setSelectedViewControllerIndex:", v33);
                goto LABEL_37;
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
            if (v30)
              continue;
            break;
          }
          v22 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_37:
          v24 = v56;
        }

        if (v55 < 2)
        {
          v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v35 = v26;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v63;
            do
            {
              for (n = 0; n != v37; ++n)
              {
                if (*(_QWORD *)v63 != v38)
                  objc_enumerationMutation(v35);
                objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * n), "title");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "addObject:", v40);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
            }
            while (v37);
          }

          objc_msgSend(v51, "addObjectsFromArray:", v34);
          v23 = v50;
          v24 = v56;
        }
        else
        {
          -[SKUIChartColumnsView _headerViewWithViewControllers:](v24, "_headerViewWithViewControllers:", v26);
          v34 = (id)objc_claimAutoreleasedReturnValue();
          -[UIView addSubview:](v24->_headerBackgroundView, "addSubview:", v34);
          -[NSArray addObject:](v49, "addObject:", v34);
        }

        objc_msgSend(v23, "addObject:", v27);
        -[SKUIChartColumnsView insertSubview:belowSubview:](v24, "insertSubview:belowSubview:", v27, v24->_headerBackgroundView);

      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    }
    while (v54);
  }
  else
  {
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    v23 = v50;
    v24 = v56;
  }

  -[SKUIFlexibleSegmentedControl setItemTitles:](v24->_segmentedControl, "setItemTitles:", v51);
  if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    -[SKUIFlexibleSegmentedControl setSelectedSegmentIndex:](v24->_segmentedControl, "setSelectedSegmentIndex:", v22);
  -[NSArray makeObjectsPerformSelector:](*p_columnViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  objc_storeStrong((id *)p_columnViews, v23);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v41 = v24->_headerViews;
  v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v59;
    do
    {
      for (ii = 0; ii != v43; ++ii)
      {
        if (*(_QWORD *)v59 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * ii);
        objc_msgSend(v46, "removeTarget:action:forControlEvents:", v24, 0, 64);
        objc_msgSend(v46, "removeFromSuperview");
      }
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
    }
    while (v43);
  }

  headerViews = v24->_headerViews;
  v24->_headerViews = v49;

}

- (NSArray)chartViewControllers
{
  return self->_allViewControllers;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)numberOfVisibleColumns
{
  return self->_numberOfVisibleColumns;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_headerViews, 0);
  objc_storeStrong((id *)&self->_headerBackgroundBottomBorder, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_borderView1, 0);
  objc_storeStrong((id *)&self->_borderView0, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_allViewControllers, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIChartColumnsView initWithFrame:]";
}

@end
