@implementation PKPerformActionBackdropView

- (PKPerformActionBackdropView)init
{
  return -[PKPerformActionBackdropView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKPerformActionBackdropView)initWithFrame:(CGRect)a3
{
  PKPerformActionBackdropView *v3;
  UIView *v4;
  UIView *backdropView;
  UIView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPerformActionBackdropView;
  v3 = -[PKPerformActionBackdropView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backdropView = v3->_backdropView;
    v3->_backdropView = v4;

    v6 = v3->_backdropView;
    PKProvisioningBackgroundColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[PKPerformActionBackdropView addSubview:](v3, "addSubview:", v3->_backdropView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPerformActionBackdropView;
  -[PKPerformActionBackdropView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPerformActionBackdropView bounds](self, "bounds");
  -[UIView setFrame:](self->_backdropView, "setFrame:", 0.0, 0.0);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 88.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
