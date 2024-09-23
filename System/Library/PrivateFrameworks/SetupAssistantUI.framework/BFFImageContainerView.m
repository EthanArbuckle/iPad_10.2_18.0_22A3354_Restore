@implementation BFFImageContainerView

- (BFFImageContainerView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  BFFImageContainerView *result;
  objc_super v6;

  height = a3.size.height;
  width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)BFFImageContainerView;
  result = -[BFFImageContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (result)
  {
    result->_preferredSize.width = width;
    result->_preferredSize.height = height;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  id v12;

  -[BFFImageContainerView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[BFFImageContainerView bounds](self, "bounds");
  if (v12)
  {
    v5 = v4;
    objc_msgSend(v12, "frame");
    v7 = v6;
    v9 = v8;
    -[BFFImageContainerView bounds](self, "bounds");
    v11 = (v10 - v7) * 0.5;
    objc_msgSend(v12, "setFrame:", floorf(v11), v5 - v9, v7, v9);
  }

}

@end
