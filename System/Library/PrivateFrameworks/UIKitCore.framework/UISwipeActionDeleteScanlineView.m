@implementation UISwipeActionDeleteScanlineView

+ (double)lineHeight
{
  return 1.0;
}

- (UISwipeActionDeleteScanlineView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  UISwipeActionDeleteScanlineView *v5;
  UIView *v6;
  UIView *topLine;
  UIView *v8;
  void *v9;
  UIView *v10;
  uint64_t v11;
  UIView *bottomLineWrapper;
  UIView *v13;
  UIView *bottomLine;
  UIView *v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  v18.receiver = self;
  v18.super_class = (Class)UISwipeActionDeleteScanlineView;
  v5 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, width, 1.0);
    topLine = v5->_topLine;
    v5->_topLine = v6;

    v8 = v5->_topLine;
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UIView addSubview:](v5, "addSubview:", v5->_topLine);
    v10 = [UIView alloc];
    -[UIView bounds](v5, "bounds");
    v11 = -[UIView initWithFrame:](v10, "initWithFrame:");
    bottomLineWrapper = v5->_bottomLineWrapper;
    v5->_bottomLineWrapper = (UIView *)v11;

    -[UIView setClipsToBounds:](v5->_bottomLineWrapper, "setClipsToBounds:", 1);
    -[UIView addSubview:](v5, "addSubview:", v5->_bottomLineWrapper);
    v13 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, height + -1.0, width, 1.0);
    bottomLine = v5->_bottomLine;
    v5->_bottomLine = v13;

    v15 = v5->_bottomLine;
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView addSubview:](v5->_bottomLineWrapper, "addSubview:", v5->_bottomLine);
  }
  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_bottomLineWrapper, "setFrame:");
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self->_topLine, "setFrame:", 0.0, 0.0);
  -[UIView frame](self, "frame");
  v4 = v3 + -1.0;
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self->_bottomLine, "setFrame:", 0.0, v4);
}

- (void)setDeleteLineColor:(id)a3
{
  UIView *topLine;
  id v5;

  topLine = self->_topLine;
  v5 = a3;
  -[UIView setBackgroundColor:](topLine, "setBackgroundColor:", v5);
  -[UIView setBackgroundColor:](self->_bottomLine, "setBackgroundColor:", v5);

}

- (UIColor)deleteLineColor
{
  return -[UIView backgroundColor](self->_topLine, "backgroundColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_bottomLineWrapper, 0);
}

@end
