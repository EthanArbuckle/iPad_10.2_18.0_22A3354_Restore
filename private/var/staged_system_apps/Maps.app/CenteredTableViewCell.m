@implementation CenteredTableViewCell

- (CenteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CenteredTableViewCell *v5;
  void *v6;
  CenteredTableViewCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CenteredTableViewCell;
  v5 = -[CenteredTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CenteringCellLayoutManager layoutManagerForTableViewCellStyle:](CenteringCellLayoutManager, "layoutManagerForTableViewCellStyle:", a3));
    -[CenteredTableViewCell setLayoutManager:](v5, "setLayoutManager:", v6);

    -[CenteredTableViewCell setMaximumContentWidth:](v5, "setMaximumContentWidth:", 1.79769313e308);
    v7 = v5;
  }

  return v5;
}

- (CenteringCellLayoutManager)centeringLayoutManager
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CenteredTableViewCell layoutManager](self, "layoutManager"));
  v4 = objc_opt_class(CenteringCellLayoutManager);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CenteredTableViewCell layoutManager](self, "layoutManager"));
  else
    v6 = 0;
  return (CenteringCellLayoutManager *)v6;
}

- (void)setMaximumContentWidth:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CenteredTableViewCell centeringLayoutManager](self, "centeringLayoutManager"));
  objc_msgSend(v4, "setMaximumCellContentWidth:", a3);

}

- (double)maximumContentWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CenteredTableViewCell centeringLayoutManager](self, "centeringLayoutManager"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "maximumCellContentWidth");
    v5 = v4;
  }
  else
  {
    v5 = 1.79769313e308;
  }

  return v5;
}

- (void)setMinimumHorizontalMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CenteredTableViewCell centeringLayoutManager](self, "centeringLayoutManager"));
  objc_msgSend(v7, "setMinimumHorizontalMargins:", top, left, bottom, right);

}

- (UIEdgeInsets)minimumHorizontalMargins
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CenteredTableViewCell centeringLayoutManager](self, "centeringLayoutManager"));
  objc_msgSend(v2, "minimumHorizontalMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

@end
