@implementation UIInputSwitcherSegmentedTableCell

- (UIInputSwitcherSegmentedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  UIInputSwitcherSegmentedTableCell *v4;
  UIInputSwitcherSegmentControl *v5;
  uint64_t v6;
  UIInputSwitcherSegmentControl *segmentControl;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIInputSwitcherSegmentedTableCell;
  v4 = -[UIInputSwitcherTableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [UIInputSwitcherSegmentControl alloc];
    v6 = -[UIInputSwitcherSegmentControl initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    segmentControl = v4->_segmentControl;
    v4->_segmentControl = (UIInputSwitcherSegmentControl *)v6;

    -[UIInputSwitcherSegmentControl setSelectedSegmentIndex:](v4->_segmentControl, "setSelectedSegmentIndex:", -1);
    -[UIInputSwitcherSegmentControl setUsesDarkTheme:](v4->_segmentControl, "setUsesDarkTheme:", -[UIInputSwitcherTableCell usesDarkTheme](v4, "usesDarkTheme"));
    -[UIView addSubview:](v4, "addSubview:", v4->_segmentControl);
  }
  return v4;
}

+ (CGSize)preferredSizeWithSegmentCount:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = (double)a3 * 64.0 + (double)(a3 + 1) * 9.0;
  v4 = 51.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIInputSwitcherSegmentedTableCell;
  -[UIInputSwitcherTableCell setSelected:animated:](&v4, sel_setSelected_animated_, 0, a4);
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  -[UIInputSwitcherSegmentedTableCell setSelected:animated:](self, "setSelected:animated:", 1, 0);
  -[UIInputSwitcherSegmentedTableCell segmentControl](self, "segmentControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSelectionWithPoint:", x, y);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 + 9.0;
  v8 = v7 + -18.0;
  v10 = v9 + 0.0;
  -[UIInputSwitcherSegmentedTableCell segmentControl](self, "segmentControl");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v6, v10, v8, v4);

}

- (void)setUsesDarkTheme:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIInputSwitcherSegmentedTableCell;
  -[UIInputSwitcherTableCell setUsesDarkTheme:](&v6, sel_setUsesDarkTheme_);
  -[UIInputSwitcherSegmentedTableCell segmentControl](self, "segmentControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsesDarkTheme:", v3);

}

- (UIInputSwitcherSegmentControl)segmentControl
{
  return self->_segmentControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentControl, 0);
}

@end
