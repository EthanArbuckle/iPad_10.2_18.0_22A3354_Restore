@implementation PLTitledPlatterView

- (void)setLargerHeaderMarginEnabled:(BOOL)a3
{
  if (self->_largerHeaderMarginEnabled != a3)
  {
    self->_largerHeaderMarginEnabled = a3;
    -[PLTitledPlatterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PLPlatterHeaderContentView *headerContentView;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PLTitledPlatterView;
  -[PLPlatterView setBackgroundView:](&v16, sel_setBackgroundView_, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PLPlatterHeaderContentView requiredVisualStyleCategories](self->_headerContentView, "requiredVisualStyleCategories", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "integerValue");
        headerContentView = self->_headerContentView;
        -[PLPlatterView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPlatterHeaderContentView setVisualStylingProvider:forCategory:](headerContentView, "setVisualStylingProvider:forCategory:", v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

}

- (int64_t)dateFormatStyle
{
  return -[PLPlatterHeaderContentView dateFormatStyle](self->_headerContentView, "dateFormatStyle");
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (-[PLPlatterHeaderContentView dateFormatStyle](self->_headerContentView, "dateFormatStyle") != a3)
  {
    -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setDateFormatStyle:](self->_headerContentView, "setDateFormatStyle:", a3);
  }
}

- (NSArray)icons
{
  return -[PLPlatterHeaderContentView icons](self->_headerContentView, "icons");
}

- (void)setIcons:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[PLTitledPlatterView iconButtons](self, "iconButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLPlatterHeaderContentView setIcons:](self->_headerContentView, "setIcons:", v4);

  -[PLTitledPlatterView iconButtons](self, "iconButtons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v6 && v8 || v6 && !v8)
    -[PLTitledPlatterView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return -[PLPlatterHeaderContentView title](self->_headerContentView, "title");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLPlatterHeaderContentView title](self->_headerContentView, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setTitle:](self->_headerContentView, "setTitle:", v6);
  }

}

- (NSDate)date
{
  return -[PLPlatterHeaderContentView date](self->_headerContentView, "date");
}

- (void)setDate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLPlatterHeaderContentView date](self->_headerContentView, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setDate:](self->_headerContentView, "setDate:", v6);
  }

}

- (NSTimeZone)timeZone
{
  return -[PLPlatterHeaderContentView timeZone](self->_headerContentView, "timeZone");
}

- (void)setTimeZone:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLPlatterHeaderContentView timeZone](self->_headerContentView, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setTimeZone:](self->_headerContentView, "setTimeZone:", v6);
  }

}

- (NSArray)iconButtons
{
  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  return -[PLPlatterHeaderContentView iconButtons](self->_headerContentView, "iconButtons");
}

- (UIButton)utilityButton
{
  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  return -[PLPlatterHeaderContentView utilityButton](self->_headerContentView, "utilityButton");
}

- (id)utilityView
{
  return -[PLPlatterHeaderContentView utilityView](self->_headerContentView, "utilityView");
}

- (void)setUtilityView:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[PLPlatterHeaderContentView utilityView](self->_headerContentView, "utilityView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setUtilityView:](self->_headerContentView, "setUtilityView:", v5);
  }

}

- (BOOL)isDateAllDay
{
  return -[PLPlatterHeaderContentView isDateAllDay](self->_headerContentView, "isDateAllDay");
}

- (void)setDateAllDay:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PLPlatterHeaderContentView isDateAllDay](self->_headerContentView, "isDateAllDay") != a3)
  {
    -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
    -[PLPlatterHeaderContentView setDateAllDay:](self->_headerContentView, "setDateAllDay:", v3);
  }
}

- (id)_headerContentView
{
  return self->_headerContentView;
}

- (BOOL)headerHeedsHorizontalLayoutMargins
{
  return -[PLPlatterHeaderContentView heedsHorizontalLayoutMargins](self->_headerContentView, "heedsHorizontalLayoutMargins");
}

- (void)setHeaderHeedsHorizontalLayoutMargins:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLPlatterHeaderContentView setHeedsHorizontalLayoutMargins:](self->_headerContentView, "setHeedsHorizontalLayoutMargins:", v3);
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  PLPlatterHeaderContentView *headerContentView;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[7];
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)PLTitledPlatterView;
  -[PLPlatterView sizeThatFitsContentWithSize:](&v14, sel_sizeThatFitsContentWithSize_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  headerContentView = self->_headerContentView;
  if (headerContentView)
  {
    if (self->_largerHeaderMarginEnabled)
    {
      -[PLPlatterHeaderContentView sizeThatFits:](headerContentView, "sizeThatFits:", v5, 0.0);
      v7 = v7 + v9;
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__PLTitledPlatterView_sizeThatFitsContentWithSize___block_invoke;
      v13[3] = &unk_1E91D3830;
      v13[4] = self;
      *(double *)&v13[5] = v5;
      v13[6] = 0;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v13);
      -[PLPlatterHeaderContentView contentBaseline](self->_headerContentView, "contentBaseline");
      v7 = v7 + v10;
    }
  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

uint64_t __51__PLTitledPlatterView_sizeThatFitsContentWithSize___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  objc_msgSend(v1, "sizeThatFits:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  BSRectWithSize();
  return objc_msgSend(v1, "setFrame:");
}

- (void)_configureHeaderContentViewIfNecessary
{
  if (!self->_headerContentView)
    -[PLTitledPlatterView _configureHeaderContentView](self, "_configureHeaderContentView");
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLTitledPlatterView;
  -[PLTitledPlatterView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[PLPlatterHeaderContentView setNeedsLayout](self->_headerContentView, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)PLTitledPlatterView;
  -[PLPlatterView layoutSubviews](&v7, sel_layoutSubviews);
  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLTitledPlatterView _layoutHeaderViews](self, "_layoutHeaderViews");
  -[PLTitledPlatterView _mainContentFrame](self, "_mainContentFrame");
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  if (!CGRectIsEmpty(v8))
    -[UIView setFrame:](self->super._customContentView, "setFrame:", x, y, width, height);
}

- (void)_layoutHeaderViews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  -[PLTitledPlatterView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (!CGRectIsEmpty(v11))
  {
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, height);
    BSRectWithSize();
    PLMainScreenScale();
    UIRectIntegralWithScale();
    x = v7;
    y = v8;
    width = v9;
    height = v10;
  }
  -[PLPlatterHeaderContentView setFrame:](self->_headerContentView, "setFrame:", x, y, width, height);
  -[PLPlatterHeaderContentView setNeedsLayout](self->_headerContentView, "setNeedsLayout");
}

- (CGRect)_mainContentFrame
{
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  PLPlatterHeaderContentView *headerContentView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[PLTitledPlatterView bounds](self, "bounds");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  if (!CGRectIsEmpty(v17))
  {
    -[PLTitledPlatterView _layoutHeaderViews](self, "_layoutHeaderViews");
    headerContentView = self->_headerContentView;
    if (self->_largerHeaderMarginEnabled)
    {
      -[PLPlatterHeaderContentView frame](headerContentView, "frame");
      v8 = CGRectGetHeight(v18);
    }
    else
    {
      -[PLPlatterHeaderContentView contentBaseline](headerContentView, "contentBaseline");
    }
    y = y + v8;
    height = height - v8;
  }
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (!CGRectIsEmpty(v19))
  {
    PLMainScreenScale();
    UIRectIntegralWithScale();
    x = v9;
    y = v10;
    width = v11;
    height = v12;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  return -[PLPlatterHeaderContentView adjustsFontForContentSizeCategory](self->_headerContentView, "adjustsFontForContentSizeCategory");
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  -[PLPlatterHeaderContentView setAdjustsFontForContentSizeCategory:](self->_headerContentView, "setAdjustsFontForContentSizeCategory:", v3);
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  -[PLTitledPlatterView _configureHeaderContentViewIfNecessary](self, "_configureHeaderContentViewIfNecessary");
  v3 = -[PLPlatterHeaderContentView adjustForContentSizeCategoryChange](self->_headerContentView, "adjustForContentSizeCategoryChange");
  if (v3)
    -[PLTitledPlatterView setNeedsLayout](self, "setNeedsLayout");
  return v3;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6;
  id v7;
  PLPlatterHeaderContentView *headerContentView;
  void *v9;
  objc_super v10;

  v6 = a3;
  -[PLPlatterView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLTitledPlatterView;
    -[PLPlatterView setVisualStylingProvider:forCategory:](&v10, sel_setVisualStylingProvider_forCategory_, v6, a4);
    headerContentView = self->_headerContentView;
    -[PLPlatterView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterHeaderContentView setVisualStylingProvider:forCategory:](headerContentView, "setVisualStylingProvider:forCategory:", v9, a4);

  }
}

- (BOOL)isLargerHeaderMarginEnabled
{
  return self->_largerHeaderMarginEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerContentView, 0);
}

- (void)_configureHeaderContentView
{
  PLPlatterHeaderContentView *v3;
  PLPlatterHeaderContentView *headerContentView;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PLPlatterHeaderContentView *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PLPlatterHeaderContentView);
  headerContentView = self->_headerContentView;
  self->_headerContentView = v3;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLPlatterHeaderContentView requiredVisualStyleCategories](self->_headerContentView, "requiredVisualStyleCategories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue");
        v11 = self->_headerContentView;
        -[PLPlatterView visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPlatterHeaderContentView setVisualStylingProvider:forCategory:](v11, "setVisualStylingProvider:forCategory:", v12, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[PLPlatterHeaderContentView setAutoresizesSubviews:](self->_headerContentView, "setAutoresizesSubviews:", 1);
  -[PLTitledPlatterView addSubview:](self, "addSubview:", self->_headerContentView);
  -[PLTitledPlatterView bringSubviewToFront:](self, "bringSubviewToFront:", self->_headerContentView);
}

- (BOOL)isSashHidden
{
  return 1;
}

@end
