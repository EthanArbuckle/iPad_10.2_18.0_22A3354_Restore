@implementation SCLSingleGroupTableView

- (SCLSingleGroupTableView)initWithFrame:(CGRect)a3
{
  SCLSingleGroupTableView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCLSingleGroupTableView;
  v3 = -[SCLSingleGroupTableView initWithFrame:style:](&v7, sel_initWithFrame_style_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

    -[SCLSingleGroupTableView setScrollEnabled:](v3, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSingleGroupTableView setBackgroundColor:](v3, "setBackgroundColor:", v5);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v3 = -[SCLSingleGroupTableView numberOfRowsInSection:](self, "numberOfRowsInSection:", 0);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSingleGroupTableView rectForRowAtIndexPath:](self, "rectForRowAtIndexPath:", v4);
  x = v5;
  y = v7;
  width = v9;
  height = v11;

  if (v3 >= 2)
  {
    for (i = 1; i != v3; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLSingleGroupTableView rectForRowAtIndexPath:](self, "rectForRowAtIndexPath:", v14);
      v24.origin.x = v15;
      v24.origin.y = v16;
      v24.size.width = v17;
      v24.size.height = v18;
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v23 = CGRectUnion(v22, v24);
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;

    }
  }
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCLSingleGroupTableView;
  -[SCLSingleGroupTableView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  -[SCLSingleGroupTableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCLSingleGroupTableView;
  -[SCLSingleGroupTableView reloadData](&v3, sel_reloadData);
  -[SCLSingleGroupTableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[SCLSingleGroupTableView numberOfRowsInSection:](self, "numberOfRowsInSection:", 0) >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSingleGroupTableView rectForRowAtIndexPath:](self, "rectForRowAtIndexPath:", v8);
    y = v9;

  }
  v10.receiver = self;
  v10.super_class = (Class)SCLSingleGroupTableView;
  -[SCLSingleGroupTableView setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

@end
