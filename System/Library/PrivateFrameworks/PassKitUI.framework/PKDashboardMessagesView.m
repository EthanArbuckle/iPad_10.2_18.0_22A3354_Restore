@implementation PKDashboardMessagesView

- (PKDashboardMessagesView)initWithInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  PKDashboardMessagesView *v7;
  PKDashboardMessagesView *v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = -[PKDashboardMessagesView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_insets.top = top;
    v7->_insets.left = left;
    v7->_insets.bottom = bottom;
    v7->_insets.right = right;
    -[UIScrollView setContentInset:](v7->_scrollView, "setContentInset:", top, left, bottom, right);
  }
  return v8;
}

- (PKDashboardMessagesView)initWithFrame:(CGRect)a3
{
  char *v3;
  PKDashboardMessagesView *v4;
  double *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIScrollView *scrollView;
  uint64_t v13;
  UIPageControl *pageControl;
  void *v15;
  UIPageControl *v16;
  void *v17;
  void *v18;
  double v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *tablesViews;
  PKDashboardMessageActionCell *v22;
  PKDashboardMessageActionCell *sampleButtonCell;
  PKDashboardMessageCell *v24;
  PKDashboardMessageCell *sampleMessageCell;
  PKAMSEnagementMessageCell *v26;
  PKAMSEnagementMessageCell *sampleEngagementCell;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PKDashboardMessagesView;
  v3 = -[PKDashboardMessagesView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (PKDashboardMessagesView *)v3;
  if (v3)
  {
    *((_QWORD *)v3 + 60) = 0x7FFFFFFFFFFFFFFFLL;
    v5 = (double *)(v3 + 488);
    *(_OWORD *)(v3 + 488) = xmmword_19DEF67E0;
    *(_OWORD *)(v3 + 504) = xmmword_19DEF67E0;
    v6 = objc_alloc(MEMORY[0x1E0DC3C28]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v11;

    -[UIScrollView setDelegate:](v4->_scrollView, "setDelegate:", v4);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v4->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setDirectionalLockEnabled:](v4->_scrollView, "setDirectionalLockEnabled:", 1);
    -[UIScrollView setDecelerationRate:](v4->_scrollView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
    -[UIScrollView setContentInset:](v4->_scrollView, "setContentInset:", *v5, v4->_insets.left, v4->_insets.bottom, v4->_insets.right);
    -[PKDashboardMessagesView addSubview:](v4, "addSubview:", v4->_scrollView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A88]), "initWithFrame:", v7, v8, v9, v10);
    pageControl = v4->_pageControl;
    v4->_pageControl = (UIPageControl *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setCurrentPageIndicatorTintColor:](v4->_pageControl, "setCurrentPageIndicatorTintColor:", v15);
    v16 = v4->_pageControl;
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setPageIndicatorTintColor:](v16, "setPageIndicatorTintColor:", v17);

    -[UIPageControl layer](v4->_pageControl, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 0;
    objc_msgSend(v18, "setOpacity:", v19);

    -[UIPageControl addTarget:action:forControlEvents:](v4->_pageControl, "addTarget:action:forControlEvents:", v4, sel__pageControlChanged_, 4096);
    -[PKDashboardMessagesView addSubview:](v4, "addSubview:", v4->_pageControl);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tablesViews = v4->_tablesViews;
    v4->_tablesViews = v20;

    v4->_maxTableViewHeight = 0.0;
    v22 = -[PKDashboardMessageActionCell initWithStyle:reuseIdentifier:]([PKDashboardMessageActionCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("actionCellIdentifier"));
    sampleButtonCell = v4->_sampleButtonCell;
    v4->_sampleButtonCell = v22;

    v24 = -[PKDashboardMessageCell initWithStyle:reuseIdentifier:]([PKDashboardMessageCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("messageCellIdentifier"));
    sampleMessageCell = v4->_sampleMessageCell;
    v4->_sampleMessageCell = v24;

    v26 = -[PKAMSEnagementMessageCell initWithStyle:reuseIdentifier:]([PKAMSEnagementMessageCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("engagementCellIdentifier"));
    sampleEngagementCell = v4->_sampleEngagementCell;
    v4->_sampleEngagementCell = v26;

    -[PKDashboardMessagesView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AA8]);
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSOrderedSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  NSMutableDictionary *tablesViews;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSUInteger v26;
  UIScrollView *scrollView;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PKDashboardMessagesView;
  -[PKDashboardMessagesView layoutSubviews](&v35, sel_layoutSubviews);
  v3 = -[PKDashboardMessagesView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  self->_currentWidth = v8;
  v12 = (void *)MEMORY[0x1A1AE621C](v3);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = self->_messages;
  v14 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v14)
  {
    v15 = v14;
    v29 = v7;
    v30 = v5;
    v16 = *(_QWORD *)v32;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        tablesViews = self->_tablesViews;
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "identifier", *(_QWORD *)&v29, *(_QWORD *)&v30, (_QWORD)v31);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](tablesViews, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "reloadData");
        v22 = v9 - self->_insets.left - self->_insets.right;
        v23 = v11 - self->_insets.top - self->_insets.bottom;
        if (-[NSOrderedSet count](self->_messages, "count") <= 1)
          v24 = 0.0;
        else
          v24 = 39.0;
        objc_msgSend(v21, "setFrame:", v17, 0.0, v22, v23 - v24);
        v17 = v9 + -24.0 + v17;

      }
      v15 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v15);
    v25 = v17 + 24.0;
    v7 = v29;
    v5 = v30;
  }
  else
  {
    v25 = 24.0;
  }

  objc_autoreleasePoolPop(v12);
  v26 = -[NSOrderedSet count](self->_messages, "count");
  scrollView = self->_scrollView;
  if (v26 < 2)
  {
    -[UIScrollView setFrame:](scrollView, "setFrame:", v5, v7, v9, v11);
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v11);
    v28 = v7 + v11;
  }
  else
  {
    -[UIScrollView setFrame:](scrollView, "setFrame:", v5, v7, v9, v11 + -39.0);
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v11 + -39.0);
    v28 = v7 + v11 + -44.0;
  }
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:", v5, v28, v9, 44.0);
  -[PKDashboardMessagesView _updateSizeCacheIfNecessary](self, "_updateSizeCacheIfNecessary");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[PKDashboardMessagesView _maxHeightForSize:](self, "_maxHeightForSize:", a3.width, a3.height);
  v6 = v5;
  if (-[NSOrderedSet count](self->_messages, "count") <= 1)
    v7 = v6;
  else
    v7 = v6 + 39.0;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_updateSizeCacheIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PKDashboardMessagesView bounds](self, "bounds");
  if (self->_widthForLastSizeCache != v3)
  {
    v4 = v3;
    self->_widthForLastSizeCache = v3;
    -[PKDashboardMessagesView _actionCellHeightForSize:](self, "_actionCellHeightForSize:", v3, 1.79769313e308);
    self->_actionCellHeight = v5;
    -[PKDashboardMessagesView _maxHeightForSize:](self, "_maxHeightForSize:", v4, 1.79769313e308);
    self->_maxTableViewHeight = v6;
  }
}

- (double)_actionCellHeightForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSOrderedSet *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1A1AE621C](self, a2);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_messages;
  v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v9 = 0.0;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[PKDashboardMessagesView isActionPresentedAsButtonCellForMessage:](self, "isActionPresentedAsButtonCellForMessage:", v13, (_QWORD)v16))
        {
          -[PKDashboardMessagesView _configureActionCell:withMessage:](self, "_configureActionCell:withMessage:", self->_sampleButtonCell, v13);
          -[PKDashboardMessageActionCell sizeThatFits:](self->_sampleButtonCell, "sizeThatFits:", width, height);
          v9 = v14;
          goto LABEL_11;
        }
      }
      v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  objc_autoreleasePoolPop(v6);
  return v9;
}

- (double)_maxHeightForSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  double left;
  double right;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  NSMutableDictionary *tablesViews;
  void *v18;
  void *v19;
  PKDashboardMessageCell *sampleMessageCell;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double top;
  double bottom;
  void *v29;
  NSOrderedSet *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1A1AE621C](self, a2);
  left = self->_insets.left;
  v29 = (void *)v6;
  right = self->_insets.right;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_messages;
  v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = width - (left + right);
    v12 = *(_QWORD *)v32;
    v13 = 0.0;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v16, "type") == 2)
        {
          -[PKDashboardMessagesView _configureEngagementCell:withMessage:](self, "_configureEngagementCell:withMessage:", self->_sampleEngagementCell, v16);
        }
        else
        {
          tablesViews = self->_tablesViews;
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](tablesViews, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          sampleMessageCell = self->_sampleMessageCell;
          objc_msgSend(v19, "separatorInset");
          -[PKDashboardMessagesView _configureMessageCell:withMessage:leftContentInset:](self, "_configureMessageCell:withMessage:leftContentInset:", sampleMessageCell, v16, v21);

        }
        v22 = 0.0;
        if (-[PKDashboardMessagesView isActionPresentedAsButtonCellForMessage:](self, "isActionPresentedAsButtonCellForMessage:", v16))
        {
          if (v13 == 0.0)
          {
            -[PKDashboardMessagesView _configureActionCell:withMessage:](self, "_configureActionCell:withMessage:", self->_sampleButtonCell, v16);
            -[PKDashboardMessageActionCell sizeThatFits:](self->_sampleButtonCell, "sizeThatFits:", v11, height);
            v13 = v23;
          }
          v22 = v13 + 0.0;
        }
        if (objc_msgSend(v16, "type") == 2)
          v24 = 33;
        else
          v24 = 32;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKDashboardMessageView__smallDevice[v24]), "sizeThatFits:", v11, height);
        if (v22 + v25 > v14)
          v14 = v22 + v25;
      }
      v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }
  else
  {
    v14 = 0.0;
  }

  top = self->_insets.top;
  bottom = self->_insets.bottom;
  objc_autoreleasePoolPop(v29);
  return v14 + top + bottom;
}

- (void)updateWithMessages:(id)a3 currentIndex:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  UIScrollView *scrollView;
  NSOrderedSet **p_messages;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_widthForLastSizeCache = 0.0;
  -[PKDashboardMessagesView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  p_messages = &self->_messages;
  objc_storeStrong((id *)&self->_messages, a3);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v54;
    v20 = *MEMORY[0x1E0DC53D8];
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "identifier", p_messages);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v22);
        -[NSMutableDictionary objectForKey:](self->_tablesViews, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 0, v8, v10, v12, v14);
          objc_msgSend(v23, "pkui_setMaskType:", 3);
          -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v23);
          -[NSMutableDictionary setObject:forKey:](self->_tablesViews, "setObject:forKey:", v23, v22);
          objc_msgSend(v23, "setScrollEnabled:", 0);
          objc_msgSend(v23, "setDelegate:", self);
          objc_msgSend(v23, "setDataSource:", self);
          objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setBackgroundColor:", v24);

          objc_msgSend(v23, "setRowHeight:", v20);
          objc_msgSend(v23, "setEstimatedRowHeight:", 60.0);
          objc_msgSend(v23, "setContentInsetAdjustmentBehavior:", 2);
          objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("messageCellIdentifier"));
          objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("actionCellIdentifier"));
          objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("engagementCellIdentifier"));
          objc_msgSend(v23, "_setDrawsSeparatorAtTopOfSections:", 0);
        }
        objc_msgSend(v23, "reloadData");

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v18);
  }

  -[NSMutableDictionary allKeys](self->_tablesViews, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB3880];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __59__PKDashboardMessagesView_updateWithMessages_currentIndex___block_invoke;
  v51[3] = &unk_1E3E68CA0;
  v27 = v15;
  v52 = v27;
  objc_msgSend(v26, "predicateWithBlock:", v51);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filteredArrayUsingPredicate:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v48 != v33)
          objc_enumerationMutation(v30);
        -[NSMutableDictionary objectForKey:](self->_tablesViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j), p_messages);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "removeFromSuperview");

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v32);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_tablesViews, "removeObjectsForKeys:", v30);
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", (unint64_t)objc_msgSend(v16, "count") > 1);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    v36 = 0;
  else
    v36 = a4;
  self->_primaryIndex = v36;
  v37 = -[NSOrderedSet count](*p_messages, "count", p_messages);
  if (self->_primaryIndex >= v37)
    self->_primaryIndex = 0;
  -[PKDashboardMessagesView _reportCurrentMessageViewed](self, "_reportCurrentMessageViewed");
  -[UIPageControl layer](self->_pageControl, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "opacity");
  v40 = *(float *)&v39;
  v41 = 0.0;
  if (v37 >= 2)
  {
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", v37);
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", self->_primaryIndex);
    v41 = 1.0;
  }
  if (v41 != v40)
  {
    objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v40, v41);
    v43 = (id)objc_msgSend(v38, "pkui_addAdditiveAnimation:", v42);

  }
  *(float *)&v39 = v41;
  objc_msgSend(v38, "setOpacity:", v39);
  -[PKDashboardMessagesView setNeedsLayout](self, "setNeedsLayout");
  -[PKDashboardMessagesView layoutIfNeeded](self, "layoutIfNeeded");
  scrollView = self->_scrollView;
  -[PKDashboardMessagesView _startOfItemAtIndex:](self, "_startOfItemAtIndex:", self->_primaryIndex);
  -[UIScrollView setContentOffset:](scrollView, "setContentOffset:");

}

uint64_t __59__PKDashboardMessagesView_updateWithMessages_currentIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)_messageForTableView:(id)a3
{
  id v4;
  NSOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *tablesViews;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_messages;
  v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        tablesViews = self->_tablesViews;
        objc_msgSend(v10, "identifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](tablesViews, "objectForKey:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          v14 = v10;

          goto LABEL_11;
        }

      }
      v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)_reportCurrentMessageViewed
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSOrderedSet count](self->_messages, "count");
  if (v3 >= 1 && self->_primaryIndex < v3)
  {
    -[NSOrderedSet objectAtIndex:](self->_messages, "objectAtIndex:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardMessagesView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_msgSend(WeakRetained, "messagesView:shouldEnqueueEventForView:", self, v4);

      if (v8)
      {
        v12 = *MEMORY[0x1E0D68AA0];
        v13[0] = *MEMORY[0x1E0D68B30];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _ReportAnalyticsEventForMessage(v9, v4);

        objc_msgSend(v4, "actionOnViewed");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          (*(void (**)(uint64_t))(v10 + 16))(v10);

      }
    }
    else
    {

    }
  }
}

- (BOOL)isActionPresentedAsButtonCellForMessage:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "actionOnButtonPress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "type") != 2;
  else
    v5 = 0;

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PKDashboardMessagesView _messageForTableView:](self, "_messageForTableView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PKDashboardMessagesView _messageForTableView:](self, "_messageForTableView:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[PKDashboardMessagesView isActionPresentedAsButtonCellForMessage:](self, "isActionPresentedAsButtonCellForMessage:", v5))
    {
      v6 = 2;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[PKDashboardMessagesView _messageForTableView:](self, "_messageForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "type") == 2)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("engagementCellIdentifier"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardMessagesView _configureEngagementCell:withMessage:](self, "_configureEngagementCell:withMessage:", v9, v8);
  }
  else
  {
    v10 = objc_msgSend(v7, "row");
    if (v10 == 1)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("actionCellIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardMessagesView _configureActionCell:withMessage:](self, "_configureActionCell:withMessage:", v9, v8);
    }
    else if (v10)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("messageCellIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("messageCellIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "separatorInset");
      -[PKDashboardMessagesView _configureMessageCell:withMessage:leftContentInset:](self, "_configureMessageCell:withMessage:leftContentInset:", v9, v8, v11);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v12);

  return v9;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  -[PKDashboardMessagesView _messageForTableView:](self, "_messageForTableView:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKDashboardMessagesView isActionPresentedAsButtonCellForMessage:](self, "isActionPresentedAsButtonCellForMessage:", v7);
  v9 = objc_msgSend(v6, "row");

  if (v8)
  {
    LOBYTE(v9) = v9 > 0;
  }
  else if (v9)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    objc_msgSend(v7, "actionOnMessagePress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 != 0;

  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PKDashboardMessagesView _messageForTableView:](self, "_messageForTableView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "row") < 1)
  {
    objc_msgSend(v8, "actionOnMessagePress");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();

    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
    v19 = *MEMORY[0x1E0D68B18];
    v20 = *MEMORY[0x1E0D68858];
    v22[0] = *MEMORY[0x1E0D68AA0];
    v22[1] = v20;
    v21 = *MEMORY[0x1E0D689D8];
    v23[0] = v19;
    v23[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v8, "actionOnButtonPress");
  v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v9[2]();

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v10 = *MEMORY[0x1E0D68B18];
  v11 = *MEMORY[0x1E0D68858];
  v24[0] = *MEMORY[0x1E0D68AA0];
  v24[1] = v11;
  v12 = *MEMORY[0x1E0D689C0];
  v25[0] = v10;
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additionalEventAnalyticsOnButtonPress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v8, "additionalEventAnalyticsOnButtonPress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addEntriesFromDictionary:", v16);

    v17 = objc_msgSend(v15, "copy");
    v13 = (void *)v17;
  }
  if (v13)
LABEL_5:
    _ReportAnalyticsEventForMessage(v13, v8);
LABEL_6:

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double actionCellHeight;
  void *v9;
  _BOOL4 v10;

  v6 = a3;
  v7 = a4;
  -[PKDashboardMessagesView _updateSizeCacheIfNecessary](self, "_updateSizeCacheIfNecessary");
  if (objc_msgSend(v7, "row"))
  {
    if (objc_msgSend(v7, "row") == 1)
      actionCellHeight = self->_actionCellHeight;
    else
      actionCellHeight = *MEMORY[0x1E0DC53D8];
  }
  else
  {
    -[PKDashboardMessagesView _messageForTableView:](self, "_messageForTableView:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKDashboardMessagesView isActionPresentedAsButtonCellForMessage:](self, "isActionPresentedAsButtonCellForMessage:", v9);
    actionCellHeight = self->_maxTableViewHeight;
    if (v10)
      actionCellHeight = actionCellHeight - self->_actionCellHeight;

  }
  return actionCellHeight;
}

- (void)_configureEngagementCell:(id)a3 withMessage:(id)a4
{
  objc_msgSend(a3, "setMessage:", a4);
}

- (void)_configureMessageCell:(id)a3 withMessage:(id)a4 leftContentInset:(double)a5
{
  id v7;
  id v8;

  v7 = a4;
  objc_msgSend(a3, "dashboardMessageView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftContentInset:", a5);
  objc_msgSend(v8, "updateWithMessage:", v7);

}

- (void)_configureActionCell:(id)a3 withMessage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "actionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithMessage:", v5);

}

- (void)_switchPrimaryIndexToIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  if (self->_primaryIndex != a3)
  {
    self->_primaryIndex = a3;
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      -[NSOrderedSet objectAtIndex:](self->_messages, "objectAtIndex:", self->_primaryIndex);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "messagesView:scrolledToMessageWithIdentifier:", self, v5);

    }
    -[PKDashboardMessagesView _reportCurrentMessageViewed](self, "_reportCurrentMessageViewed");

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL8 v13;
  CGFloat v14;

  x = a4.x;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset", a3, a4.x, a4.y);
  v9 = -[PKDashboardMessagesView _indexAtContentOffset:](self, "_indexAtContentOffset:", v8 + self->_currentWidth * 0.5);
  v10 = v9;
  if (v9 == self->_primaryIndex)
  {
    v11 = v9;
    if (x <= 0.0 || (v10 = v9 + 1, v9 + 1 >= -[NSMutableDictionary count](self->_tablesViews, "count")))
    {
      v13 = x < 0.0 && v11 != 0;
      v10 = v11 - v13;
    }
  }
  -[PKDashboardMessagesView _startOfItemAtIndex:](self, "_startOfItemAtIndex:", v10);
  a5->x = v14;
  a5->y = 0.0;
  -[PKDashboardMessagesView _switchPrimaryIndexToIndex:](self, "_switchPrimaryIndexToIndex:", v10);
}

- (unint64_t)_indexAtContentOffset:(CGPoint)a3
{
  float v3;

  v3 = a3.x / (self->_currentWidth + -24.0);
  return vcvtms_u32_f32(v3);
}

- (double)_startOfItemAtIndex:(unint64_t)a3
{
  return -(self->_insets.left - (double)a3 * (self->_currentWidth + -24.0));
}

- (double)_endOfItemAtIndex:(unint64_t)a3
{
  double v4;

  -[PKDashboardMessagesView _startOfItemAtIndex:](self, "_startOfItemAtIndex:", a3);
  return v4 + self->_currentWidth;
}

- (unint64_t)_primaryIndexAtOffset:(CGPoint)a3
{
  return -[PKDashboardMessagesView _indexAtContentOffset:](self, "_indexAtContentOffset:", a3.x + self->_currentWidth * 0.5, a3.y);
}

- (void)_pageControlChanged:(id)a3
{
  unint64_t v4;
  UIScrollView *scrollView;

  v4 = -[UIPageControl currentPage](self->_pageControl, "currentPage", a3);
  if (v4 < -[NSOrderedSet count](self->_messages, "count"))
  {
    scrollView = self->_scrollView;
    -[PKDashboardMessagesView _startOfItemAtIndex:](self, "_startOfItemAtIndex:", v4);
    -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 1);
    -[PKDashboardMessagesView _switchPrimaryIndexToIndex:](self, "_switchPrimaryIndexToIndex:", v4);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardMessagesView;
  -[PKDashboardMessagesView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  self->_maxTableViewHeight = 0.0;
  self->_actionCellHeight = 0.0;
  self->_widthForLastSizeCache = 0.0;
  -[PKDashboardMessagesView setNeedsLayout](self, "setNeedsLayout");
}

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (PKDashboardMessagesViewDelegate)delegate
{
  return (PKDashboardMessagesViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_dismissImage, 0);
  objc_storeStrong((id *)&self->_sampleEngagementCell, 0);
  objc_storeStrong((id *)&self->_sampleMessageCell, 0);
  objc_storeStrong((id *)&self->_sampleButtonCell, 0);
  objc_storeStrong((id *)&self->_tablesViews, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
