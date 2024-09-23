@implementation _TVInfoHeaderView

+ (id)infoHeaderViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVInfoHeaderView *v7;
  _TVInfoHeaderView *v8;
  _TVInfoHeaderView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVInfoHeaderView *)v5;
  }
  else
  {
    v8 = [_TVInfoHeaderView alloc];
    v7 = -[_TVInfoHeaderView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVInfoHeaderView headerView](v9, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_viewFromElement:existingView:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVInfoHeaderView setHeaderView:](v9, "setHeaderView:", v14);
  return v9;
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  UIView *v7;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  v7 = v5;
  if (headerView != v5)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView)
      -[_TVInfoHeaderView addSubview:](self, "addSubview:");
  }
  -[_TVInfoHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *headerView;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  -[UIView tv_padding](self, "tv_padding", a3.width, a3.height);
  v8 = v7;
  v10 = v9;
  headerView = self->_headerView;
  if (headerView)
  {
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", width - v5 - v6, 0.0);
  }
  else
  {
    -[UIView tv_itemHeight](self, "tv_itemHeight");
    v12 = v13;
  }
  v14 = v10 + v8 + v12;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  -[_TVInfoHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v11);
  -[UIView tv_padding](self, "tv_padding");
  v5 = v4;
  v7 = v6;
  v9 = Width - v6 - v8;
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v9, 0.0);
  -[UIView setFrame:](self->_headerView, "setFrame:", v7, v5, v9, v10);
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NSObject tv_associatedIKViewElement](self, "tv_associatedIKViewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    -[_TVInfoHeaderView headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tv_impressionableElementsForDocument:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
