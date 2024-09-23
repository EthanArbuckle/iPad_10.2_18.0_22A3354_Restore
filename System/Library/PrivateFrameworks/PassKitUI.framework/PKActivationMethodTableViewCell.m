@implementation PKActivationMethodTableViewCell

- (void)layoutSubviews
{
  int v3;
  void *v4;
  double Width;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double MaxY;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25.receiver = self;
  v25.super_class = (Class)PKActivationMethodTableViewCell;
  -[PKActivationMethodTableViewCell layoutSubviews](&v25, sel_layoutSubviews);
  v3 = -[PKActivationMethodTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKActivationMethodTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v26);

  v6 = Width + -30.0;
  -[PKActivationMethodTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v7, "frame");
  v11 = v10;
  if (Width + -30.0 >= v9)
    v12 = v9;
  else
    v12 = Width + -30.0;
  v13 = 15.0;
  v14 = 15.0;
  if (v3)
  {
    v15 = 10.0;
    v16 = v12;
    v14 = v6 - CGRectGetWidth(*(CGRect *)&v8);
  }
  objc_msgSend(v7, "setFrame:", v14, 10.0, v12, v11);
  -[PKActivationMethodTableViewCell detailTextLabel](self, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeToFit");
  objc_msgSend(v17, "frame");
  v20 = v19;
  v22 = v21;
  if (v6 >= v18)
    v23 = v18;
  else
    v23 = v6;
  v27.origin.y = 10.0;
  v27.origin.x = v14;
  v27.size.width = v12;
  v27.size.height = v11;
  MaxY = CGRectGetMaxY(v27);
  if (v3)
  {
    v28.origin.x = v20;
    v28.origin.y = MaxY;
    v28.size.width = v23;
    v28.size.height = v22;
    v13 = v6 - CGRectGetWidth(v28);
  }
  objc_msgSend(v17, "setFrame:", v13, MaxY, v23, v22);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  -[PKActivationMethodTableViewCell detailTextLabel](self, "detailTextLabel", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  v8 = v7 + 20.0;

  -[PKActivationMethodTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v8 + v11;

  if (v12 >= 60.0)
    v13 = v12;
  else
    v13 = 60.0;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

@end
