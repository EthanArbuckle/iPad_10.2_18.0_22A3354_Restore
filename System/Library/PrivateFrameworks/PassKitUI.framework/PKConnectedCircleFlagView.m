@implementation PKConnectedCircleFlagView

- (PKConnectedCircleFlagView)init
{

  return 0;
}

- (PKConnectedCircleFlagView)initWithFlagBackgroundColor:(id)a3
{
  id v5;
  PKConnectedCircleFlagView *v6;
  PKConnectedCircleFlagView *v7;
  UIView *v8;
  UIView *backgroundView;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIImageView *imageView;

  v5 = a3;
  v6 = -[PKConnectedCircleFlagView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flagBackgroundColor, a3);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v8;

    -[UIView setBackgroundColor:](v7->_backgroundView, "setBackgroundColor:", v7->_flagBackgroundColor);
    -[PKConnectedCircleFlagView addSubview:](v7, "addSubview:", v7->_backgroundView);
    v10 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterDisputeFlagIconImageWithConfiguration();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithImage:", v12);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v13;

    -[PKConnectedCircleFlagView addSubview:](v7, "addSubview:", v7->_imageView);
  }

  return v7;
}

- (void)setBackgroundColor:(id)a3
{
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", a3);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKConnectedCircleFlagView;
  -[PKConnectedCircleFlagView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKConnectedCircleFlagView bounds](self, "bounds");
  -[PKConnectedCircleFlagView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKConnectedCircleFlagView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  PKRectCenteredIntegralRect();
  v23 = v7;
  v24 = v6;
  v9 = v8;
  v11 = v10;
  PKRectCenteredIntegralRect();
  if (!a4)
  {
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = v15;
    -[UIView layer](self->_backgroundView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", 10.0);

    -[UIView setFrame:](self->_backgroundView, "setFrame:", v24, v23, v9, v11);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v16, v17, v18, v19);
  }
  v21 = 24.0;
  v22 = 24.0;
  result.height = v22;
  result.width = v21;
  return result;
}

- (UIColor)flagBackgroundColor
{
  return self->_flagBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
