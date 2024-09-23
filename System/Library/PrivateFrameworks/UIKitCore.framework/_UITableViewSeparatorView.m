@implementation _UITableViewSeparatorView

- (_UITableViewSeparatorView)initWithTableCell:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _UITableViewSeparatorView *v11;
  _UITableViewSeparatorView *v12;
  objc_super v14;

  v5 = a3;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  objc_msgSend(v5, "frame");
  v14.receiver = self;
  v14.super_class = (Class)_UITableViewSeparatorView;
  v11 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, 0.0, v9 + v10 + -1.0, v8, 1.0);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_tableCell, a3);

  return v12;
}

- (_UITableViewSeparatorView)initWithFrame:(CGRect)a3 withTable:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UITableViewSeparatorView *v10;
  _UITableViewSeparatorView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITableViewSeparatorView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_table, v9);
    -[UIView setOpaque:](v11, "setOpaque:", 0);
  }

  return v11;
}

- (void)drawRect:(CGRect)a3
{
  UITableViewCell *tableCell;
  UITableViewCell *v5;
  UITableViewCell *WeakRetained;

  tableCell = self->_tableCell;
  if (tableCell)
  {
    -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[UITableViewCell _drawSeparatorInRect:](tableCell, "_drawSeparatorInRect:");
    v5 = self->_tableCell;
    self->_tableCell = 0;
  }
  else
  {
    WeakRetained = (UITableViewCell *)objc_loadWeakRetained((id *)&self->_table);
    -[UIView bounds](self, "bounds");
    -[UITableViewCell _drawExtraSeparator:](WeakRetained, "_drawExtraSeparator:");
    v5 = WeakRetained;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_table);
  objc_storeStrong((id *)&self->_tableCell, 0);
}

@end
