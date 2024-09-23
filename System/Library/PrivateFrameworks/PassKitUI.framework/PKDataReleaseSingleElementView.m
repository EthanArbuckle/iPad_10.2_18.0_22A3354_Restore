@implementation PKDataReleaseSingleElementView

- (PKDataReleaseSingleElementView)initWithFrame:(CGRect)a3
{
  PKDataReleaseSingleElementView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UIImageView *v6;
  UIImageView *imageView;
  UIImageView *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKDataReleaseSingleElementView;
  v3 = -[PKDataReleaseSingleElementView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PKDataReleaseSingleElementView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v6;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    v8 = v3->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v8, "setTintColor:", v9);

    -[PKDataReleaseSingleElementView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)setTitle:(id)a3 titleFont:(id)a4 image:(id)a5
{
  UILabel *titleLabel;
  id v9;
  id v10;

  titleLabel = self->_titleLabel;
  v9 = a5;
  v10 = a4;
  -[UILabel setText:](titleLabel, "setText:", a3);
  -[UILabel setFont:](self->_titleLabel, "setFont:", v10);

  -[UIImageView setImage:](self->_imageView, "setImage:", v9);
  -[PKDataReleaseSingleElementView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDataReleaseSingleElementView;
  -[PKDataReleaseSingleElementView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDataReleaseSingleElementView bounds](self, "bounds");
  -[PKDataReleaseSingleElementView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKDataReleaseSingleElementView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGRectEdge v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect slice;
  CGSize result;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.size.width, a3.size.height);
  v10 = v9;
  if (!self->_isTemplateLayout)
  {
    v11 = v8;
    memset(&slice, 0, sizeof(slice));
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    if (-[PKDataReleaseSingleElementView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v12 = CGRectMaxXEdge;
    else
      v12 = CGRectMinXEdge;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    CGRectDivide(v18, &slice, &v15, v10, v12);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(v15, &slice, &v15, 10.0, v12);
    CGRectDivide(v15, &slice, &v15, v11, v12);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  v13 = width;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
