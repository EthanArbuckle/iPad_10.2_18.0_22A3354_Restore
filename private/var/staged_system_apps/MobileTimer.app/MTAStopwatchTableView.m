@implementation MTAStopwatchTableView

- (MTAStopwatchTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  MTAStopwatchTableView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTAStopwatchTableView;
  v4 = -[MTAStopwatchTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_opt_new(UIView);
    -[MTAStopwatchTableView setTopKeylineView:](v4, "setTopKeylineView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellSeparatorColor](UIColor, "mtui_cellSeparatorColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchTableView topKeylineView](v4, "topKeylineView"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchTableView topKeylineView](v4, "topKeylineView"));
    -[MTAStopwatchTableView addSubview:](v4, "addSubview:", v8);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)MTAStopwatchTableView;
  -[MTAStopwatchTableView layoutSubviews](&v18, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchTableView topKeylineView](self, "topKeylineView"));
  -[MTAStopwatchTableView bringSubviewToFront:](self, "bringSubviewToFront:", v3);

  LODWORD(v3) = -[MTAStopwatchTableView mtui_isRTL](self, "mtui_isRTL");
  -[MTAStopwatchTableView separatorInset](self, "separatorInset");
  if ((_DWORD)v3)
    v6 = v5;
  else
    v6 = v4;
  -[MTAStopwatchTableView contentOffset](self, "contentOffset");
  v8 = fmax(v7, 0.0);
  -[MTAStopwatchTableView bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  -[MTAStopwatchTableView separatorInset](self, "separatorInset");
  v11 = Width - v10;
  v12 = -[MTAStopwatchTableView separatorInset](self, "separatorInset");
  v14 = v11 - v13;
  v16 = 1.0 / MTUIMainScreenScale(v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAStopwatchTableView topKeylineView](self, "topKeylineView"));
  objc_msgSend(v17, "setFrame:", v6, v8, v14, v16);

}

- (UIView)topKeylineView
{
  return self->_topKeylineView;
}

- (void)setTopKeylineView:(id)a3
{
  objc_storeStrong((id *)&self->_topKeylineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topKeylineView, 0);
}

@end
