@implementation IMTableView

- (void)initCommon
{
  -[IMTableView setQuickScrollerMinimumDisplayRowCount:](self, "setQuickScrollerMinimumDisplayRowCount:", 0x7FFFFFFFFFFFFFFFLL);
}

- (IMTableView)initWithCoder:(id)a3
{
  IMTableView *v3;
  IMTableView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMTableView;
  v3 = -[IMTableView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[IMTableView initCommon](v3, "initCommon");
  return v4;
}

- (IMTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  IMTableView *v4;
  IMTableView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMTableView;
  v4 = -[IMTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[IMTableView initCommon](v4, "initCommon");
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  IMQuickScroller *quickScroller;
  IMQuickScroller *v9;
  IMQuickScroller *v10;
  id v11;
  IMQuickScroller *v12;
  IMQuickScroller *v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  quickScroller = self->_quickScroller;
  -[IMQuickScroller convertPoint:fromView:](quickScroller, "convertPoint:fromView:", self, x, y);
  v9 = (IMQuickScroller *)objc_claimAutoreleasedReturnValue(-[IMQuickScroller hitTest:withEvent:](quickScroller, "hitTest:withEvent:", v7));
  v10 = v9;
  if (v9 && v9 == self->_quickScroller)
  {
    -[IMTableView setDelaysContentTouches:](self, "setDelaysContentTouches:", 0);
    v12 = v10;
  }
  else
  {
    -[IMTableView setDelaysContentTouches:](self, "setDelaysContentTouches:", 1);
    v15.receiver = self;
    v15.super_class = (Class)IMTableView;
    v11 = -[IMTableView hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
    v12 = (IMQuickScroller *)objc_claimAutoreleasedReturnValue(v11);
  }
  v13 = v12;

  return v13;
}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMTableView;
  -[IMTableView reloadData](&v3, "reloadData");
  -[IMTableView updateQuickScroller](self, "updateQuickScroller");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMTableView;
  -[IMTableView setEditing:animated:](&v5, "setEditing:animated:", a3, a4);
  -[IMTableView updateQuickScroller](self, "updateQuickScroller");
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMTableView;
  -[IMTableView setContentOffset:](&v4, "setContentOffset:", a3.x, a3.y);
  if (self->_quickScroller)
    -[IMTableView bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMTableView;
  -[IMTableView layoutSubviews](&v7, "layoutSubviews");
  if (self->_quickScroller)
  {
    -[IMTableView bounds](self, "bounds");
    v4 = v3 + -32.0;
    -[IMTableView contentOffset](self, "contentOffset");
    v6 = v5;
    -[IMTableView bounds](self, "bounds");
    -[IMQuickScroller setFrame:](self->_quickScroller, "setFrame:", v4, v6, 32.0);
    -[IMTableView bringSubviewToFront:](self, "bringSubviewToFront:", self->_quickScroller);
  }
}

- (int64_t)totalRowCount
{
  char *v3;
  char *v4;
  char *v5;
  int64_t v6;

  v3 = (char *)-[IMTableView numberOfSections](self, "numberOfSections");
  if ((uint64_t)v3 < 1)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  do
    v6 += (int64_t)-[IMTableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v5++);
  while (v4 != v5);
  return v6;
}

- (id)quickScroller
{
  IMQuickScroller *quickScroller;
  IMQuickScroller *v4;
  IMQuickScroller *v5;

  quickScroller = self->_quickScroller;
  if (!quickScroller)
  {
    v4 = -[IMQuickScroller initWithFrame:]([IMQuickScroller alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_quickScroller;
    self->_quickScroller = v4;

    -[IMQuickScroller setAutoresizingMask:](self->_quickScroller, "setAutoresizingMask:", 17);
    -[IMQuickScroller addTarget:action:forControlEvents:](self->_quickScroller, "addTarget:action:forControlEvents:", self, "quickScroll:", 4096);
    quickScroller = self->_quickScroller;
  }
  return quickScroller;
}

- (void)quickScroll:(id)a3
{
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a3, "value");
  v5 = v4;
  -[IMTableView contentOffset](self, "contentOffset");
  v7 = v6;
  -[IMTableView contentSize](self, "contentSize");
  v9 = v8;
  -[IMTableView bounds](self, "bounds");
  -[IMTableView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v7, (v9 - v10) * v5);
}

- (void)updateQuickScroller
{
  uint64_t v3;
  int64_t v4;
  IMTableView *v5;
  id v6;

  v3 = -[IMTableView totalRowCount](self, "totalRowCount");
  v4 = -[IMTableView quickScrollerMinimumDisplayRowCount](self, "quickScrollerMinimumDisplayRowCount");
  if (v3 < v4
    || v4 == 0x7FFFFFFFFFFFFFFFLL
    || (-[IMTableView isEditing](self, "isEditing") & 1) != 0
    || v3 > (uint64_t)-[IMTableView sectionIndexMinimumDisplayRowCount](self, "sectionIndexMinimumDisplayRowCount"))
  {
    -[IMQuickScroller removeFromSuperview](self->_quickScroller, "removeFromSuperview");
  }
  else
  {
    v5 = (IMTableView *)objc_claimAutoreleasedReturnValue(-[IMQuickScroller superview](self->_quickScroller, "superview"));

    if (v5 != self)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[IMTableView quickScroller](self, "quickScroller"));
      -[IMTableView addSubview:](self, "addSubview:", v6);

    }
  }
}

- (int64_t)quickScrollerMinimumDisplayRowCount
{
  return self->_quickScrollerMinimumDisplayRowCount;
}

- (void)setQuickScrollerMinimumDisplayRowCount:(int64_t)a3
{
  self->_quickScrollerMinimumDisplayRowCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickScroller, 0);
}

@end
