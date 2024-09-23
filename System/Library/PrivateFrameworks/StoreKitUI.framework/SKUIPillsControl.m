@implementation SKUIPillsControl

- (SKUIPillsControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIPillsControl *v8;
  SKUISegmentedControl *v9;
  uint64_t v10;
  SKUISegmentedControl *segmentedControl;
  SKUISegmentedControl *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPillsControl initWithFrame:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPillsControl;
  v8 = -[SKUIPillsControl initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUISegmentedControl alloc];
    v10 = -[SKUISegmentedControl initWithItems:](v9, "initWithItems:", MEMORY[0x1E0C9AA60]);
    segmentedControl = v8->_segmentedControl;
    v8->_segmentedControl = (SKUISegmentedControl *)v10;

    -[SKUISegmentedControl addTarget:action:forControlEvents:](v8->_segmentedControl, "addTarget:action:forControlEvents:", v8, sel__segmentedControlAction_, 4096);
    v12 = v8->_segmentedControl;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.588235294, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISegmentedControl setTintColor:](v12, "setTintColor:", v13);

    -[SKUIPillsControl addSubview:](v8, "addSubview:", v8->_segmentedControl);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPillsControl setBackgroundColor:](v8, "setBackgroundColor:", v14);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUISegmentedControl removeTarget:action:forControlEvents:](self->_segmentedControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIPillsControl;
  -[SKUIPillsControl dealloc](&v3, sel_dealloc);
}

- (void)reloadPills
{
  int64_t v3;
  int64_t v4;
  int64_t maximumNumberOfVisiblePills;
  uint64_t v7;
  uint64_t i;
  SKUISegmentedControl *segmentedControl;
  void *v10;
  BOOL v11;

  -[SKUISegmentedControl removeAllSegments](self->_segmentedControl, "removeAllSegments");
  v3 = -[NSArray count](self->_titles, "count");
  v4 = v3;
  maximumNumberOfVisiblePills = self->_maximumNumberOfVisiblePills;
  if (maximumNumberOfVisiblePills >= v3 || maximumNumberOfVisiblePills <= 0)
    v7 = v3;
  else
    v7 = maximumNumberOfVisiblePills - 1;
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      segmentedControl = self->_segmentedControl;
      -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISegmentedControl insertSegmentWithTitle:atIndex:animated:](segmentedControl, "insertSegmentWithTitle:atIndex:animated:", v10, i, 0);

    }
    maximumNumberOfVisiblePills = self->_maximumNumberOfVisiblePills;
  }
  if (maximumNumberOfVisiblePills)
    v11 = maximumNumberOfVisiblePills < v4;
  else
    v11 = 0;
  if (v11)
    -[SKUISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", self->_moreListTitle, v7, 0);
  -[SKUIPillsControl setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)selectedIndex
{
  return -[SKUISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");
}

- (CGRect)selectedPillFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SKUISegmentedControl frameForSegmentAtIndex:](self->_segmentedControl, "frameForSegmentAtIndex:", -[SKUIPillsControl selectedIndex](self, "selectedIndex"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v4;
  SKUIColorScheme *v5;
  SKUIColorScheme *colorScheme;
  SKUISegmentedControl *segmentedControl;
  void *v8;
  void *v9;
  void *v10;
  SKUIColorScheme *v11;

  v4 = (SKUIColorScheme *)a3;
  if (self->_colorScheme != v4)
  {
    v11 = v4;
    v5 = (SKUIColorScheme *)-[SKUIColorScheme copy](v4, "copy");
    colorScheme = self->_colorScheme;
    self->_colorScheme = v5;

    segmentedControl = self->_segmentedControl;
    if (self->_colorScheme)
    {
      -[SKUIColorScheme secondaryTextColor](v11, "secondaryTextColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISegmentedControl setTintColor:](segmentedControl, "setTintColor:", v8);

      -[SKUIColorScheme backgroundColor](v11, "backgroundColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.588235294, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUISegmentedControl setTintColor:](segmentedControl, "setTintColor:", v9);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIPillsControl setBackgroundColor:](self, "setBackgroundColor:", v10);

    v4 = v11;
  }

}

- (void)setSelectedIndex:(int64_t)a3
{
  -[SKUISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SKUIPillsControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3 - self->_contentInset.left - self->_contentInset.right;
  -[SKUISegmentedControl frame](self->_segmentedControl, "frame");
  -[SKUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v4, v6);
  -[SKUISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", self->_contentInset.left, self->_contentInset.top, v7, v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SKUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_segmentedControlAction:(id)a3
{
  -[SKUIPillsControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
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

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (int64_t)maximumNumberOfVisiblePills
{
  return self->_maximumNumberOfVisiblePills;
}

- (void)setMaximumNumberOfVisiblePills:(int64_t)a3
{
  self->_maximumNumberOfVisiblePills = a3;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (void)setMoreListTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_moreListTitle, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPillsControl initWithFrame:]";
}

@end
