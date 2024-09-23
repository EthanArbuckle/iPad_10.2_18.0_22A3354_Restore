@implementation UIInputSwitcherTableCell

- (UIInputSwitcherTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  UIInputSwitcherTableCell *v4;
  UIInputSwitcherTableCellBackgroundView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIInputSwitcherTableCell;
  v4 = -[UITableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(UIInputSwitcherTableCellBackgroundView);
    -[UIView setOpaque:](v5, "setOpaque:", 0);
    -[UITableViewCell setBackgroundView:](v4, "setBackgroundView:", v5);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  char isKindOfClass;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)UIInputSwitcherTableCell;
  -[UITableViewCell layoutSubviews](&v23, sel_layoutSubviews);
  -[UITableViewCell accessoryView](self, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[UITableViewCell _textLabel:](self, "_textLabel:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UITableViewCell frame](self, "frame");
    objc_msgSend(v5, "setFrame:", round(v13 + (v12 - v9) * 0.5), v7, v9, v11);
    -[UITableViewCell _detailTextLabel:](self, "_detailTextLabel:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[UITableViewCell frame](self, "frame");
    objc_msgSend(v14, "setFrame:", round(v22 + (v21 - v18) * 0.5), v16, v18, v20);

  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherTableCell;
  -[UITableViewCell setSelected:animated:](&v8, sel_setSelected_animated_, a3, a4);
  -[UITableViewCell backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", v4);

  -[UITableViewCell backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsDisplay");

}

- (void)_updateRoundedCorners
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (-[UIInputSwitcherTableCell usesStraightLeftEdge](self, "usesStraightLeftEdge"))
    v3 = 0;
  else
    v3 = 4;
  v4 = -[UIInputSwitcherTableCell usesStraightLeftEdge](self, "usesStraightLeftEdge") ^ 1;
  if (-[UIInputSwitcherTableCell isFirst](self, "isFirst") && -[UIInputSwitcherTableCell isLast](self, "isLast"))
  {
    v5 = v3 | v4 | 0xA;
  }
  else if (-[UIInputSwitcherTableCell isFirst](self, "isFirst"))
  {
    v5 = v4 | 2;
  }
  else if (-[UIInputSwitcherTableCell isLast](self, "isLast"))
  {
    v5 = v3 | 8;
  }
  else
  {
    v5 = 0;
  }
  v6 = -[UIInputSwitcherTableCell isFirst](self, "isFirst") ^ 1;
  -[UITableViewCell backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDrawsBorder:", v6);

  -[UITableViewCell backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRoundedCorners:", v5);

  -[UITableViewCell backgroundView](self, "backgroundView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsDisplay");

}

- (void)setFirst:(BOOL)a3
{
  self->_first = a3;
  -[UIInputSwitcherTableCell _updateRoundedCorners](self, "_updateRoundedCorners");
}

- (void)setLast:(BOOL)a3
{
  self->_last = a3;
  -[UIInputSwitcherTableCell _updateRoundedCorners](self, "_updateRoundedCorners");
}

- (void)setUsesStraightLeftEdge:(BOOL)a3
{
  self->_usesStraightLeftEdge = a3;
  -[UIInputSwitcherTableCell _updateRoundedCorners](self, "_updateRoundedCorners");
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_usesDarkTheme = a3;
  -[UITableViewCell backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsesDarkTheme:", v3);

  -[UITableViewCell backgroundView](self, "backgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDisplay");

}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (BOOL)usesStraightLeftEdge
{
  return self->_usesStraightLeftEdge;
}

- (BOOL)isFirst
{
  return self->_first;
}

- (BOOL)isLast
{
  return self->_last;
}

- (UIEdgeInsets)interactiveInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_interactiveInsets.top;
  left = self->_interactiveInsets.left;
  bottom = self->_interactiveInsets.bottom;
  right = self->_interactiveInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInteractiveInsets:(UIEdgeInsets)a3
{
  self->_interactiveInsets = a3;
}

@end
