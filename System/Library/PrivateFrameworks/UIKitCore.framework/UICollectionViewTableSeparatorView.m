@implementation UICollectionViewTableSeparatorView

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _UITableViewCellSeparatorView *v5;
  void *v6;
  void *v7;
  _UITableViewCellSeparatorView *v8;

  v4 = a3;
  -[UICollectionViewTableSeparatorView separatorView](self, "separatorView");
  v8 = (_UITableViewCellSeparatorView *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v5 = [_UITableViewCellSeparatorView alloc];
    -[UIView bounds](self, "bounds");
    v8 = -[_UITableViewCellSeparatorView initWithFrame:](v5, "initWithFrame:");
    -[UICollectionViewTableSeparatorView setSeparatorView:](self, "setSeparatorView:", v8);
    -[UIView addSubview:](self, "addSubview:", v8);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  objc_msgSend(v4, "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v6);

  objc_msgSend(v4, "separatorEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITableViewCellSeparatorView setSeparatorEffect:](v8, "setSeparatorEffect:", v7);
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
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UICollectionViewTableSeparatorView separatorView](self, "separatorView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (_UITableViewCellSeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
