@implementation HomeOrthogonalSectionTableViewCell

- (HomeOrthogonalSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HomeOrthogonalSectionTableViewCell *v4;
  void *v5;
  id v6;
  UIView *v7;
  UIView *wrapperView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  v4 = -[HomeOrthogonalSectionTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[HomeOrthogonalSectionTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[HomeOrthogonalSectionTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("HomeOrthogonalSectionTableViewCell"));
    v6 = objc_alloc((Class)UIView);
    -[HomeOrthogonalSectionTableViewCell frame](v4, "frame");
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    wrapperView = v4->_wrapperView;
    v4->_wrapperView = v7;

    -[UIView setAccessibilityIdentifier:](v4->_wrapperView, "setAccessibilityIdentifier:", CFSTR("HomeOrthogonalSectionTableViewCellWrapperView"));
  }
  return v4;
}

- (void)setCell:(id)a3
{
  UITableViewCell *v5;
  UITableViewCell **p_cell;
  UITableViewCell *cell;
  UITableViewCell *v8;

  v5 = (UITableViewCell *)a3;
  p_cell = &self->_cell;
  cell = self->_cell;
  if (cell != v5)
  {
    v8 = v5;
    -[UITableViewCell removeFromSuperview](cell, "removeFromSuperview");
    objc_storeStrong((id *)&self->_cell, a3);
    if (*p_cell)
    {
      -[UIView bounds](self->_wrapperView, "bounds");
      -[UITableViewCell setFrame:](*p_cell, "setFrame:");
      -[UITableViewCell setAutoresizingMask:](*p_cell, "setAutoresizingMask:", 18);
      -[UIView addSubview:](self->_wrapperView, "addSubview:", *p_cell);
    }
    -[HomeOrthogonalSectionTableViewCell _updateWrapperSuperview](self, "_updateWrapperSuperview");
    v5 = v8;
  }

}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell didMoveToSuperview](&v3, "didMoveToSuperview");
  -[HomeOrthogonalSectionTableViewCell _updateWrapperSuperview](self, "_updateWrapperSuperview");
}

- (void)_updateWrapperSuperview
{
  void *v3;
  UITableViewCell *cell;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOrthogonalSectionTableViewCell superview](self, "superview"));
  if (v3 && (cell = self->_cell, v3, cell))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_wrapperView, "superview"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOrthogonalSectionTableViewCell _tableView](self, "_tableView"));

    if (v5 != v6)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[HomeOrthogonalSectionTableViewCell _tableView](self, "_tableView"));
      objc_msgSend(v7, "addSubview:", self->_wrapperView);

    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_wrapperView, "removeFromSuperview");
  }
}

- (void)updateHidden
{
  -[UITableViewCell setHidden:](self->_cell, "setHidden:", -[HomeOrthogonalSectionTableViewCell isHidden](self, "isHidden"));
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[UITableViewCell prepareForReuse](self->_cell, "prepareForReuse");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setFrame:](&v10, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOrthogonalSectionTableViewCell _tableView](self, "_tableView"));
  objc_msgSend(v7, "bounds");
  v9 = v8;

  -[UIView setFrame:](self->_wrapperView, "setFrame:", x, y, v9, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setBounds:](&v10, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOrthogonalSectionTableViewCell _tableView](self, "_tableView"));
  objc_msgSend(v7, "bounds");
  v9 = v8;

  -[UIView setBounds:](self->_wrapperView, "setBounds:", x, y, v9, height);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setHidden:](&v5, "setHidden:");
  -[UITableViewCell setHidden:](self->_cell, "setHidden:", v3);
}

- (void)setAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setAlpha:](&v5, "setAlpha:");
  -[UITableViewCell setAlpha:](self->_cell, "setAlpha:", a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[UITableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_cell, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
}

@end
