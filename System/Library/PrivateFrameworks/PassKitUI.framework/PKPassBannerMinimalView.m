@implementation PKPassBannerMinimalView

- (PKPassBannerMinimalView)init
{

  return 0;
}

- (PKPassBannerMinimalView)initWithCoder:(id)a3
{

  return 0;
}

- (id)_initWithStyle:(int64_t)a3 leadingView:(id)a4 trailingView:(id)a5
{
  void **v8;
  id result;
  id v10;
  PKPassBannerMinimalView *v11;
  PKPassBannerMinimalView *v12;
  id *v13;
  PKPassBannerLeadingView *leadingView;
  uint64_t v15;
  PKPassBannerTrailingView *trailingView;
  objc_super v17;

  v8 = (void **)a4;
  result = a5;
  if (v8 && (v10 = result) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKPassBannerMinimalView;
    v11 = -[PKPassBannerMinimalView init](&v17, sel_init);
    v12 = v11;
    if (v11)
    {
      v11->_style = a3;
      v13 = -[PKPassBannerLeadingView _initWithStyle:pass:]((id *)[PKPassBannerLeadingView alloc], v8[52], v8[53]);
      leadingView = v12->_leadingView;
      v12->_leadingView = (PKPassBannerLeadingView *)v13;

      v15 = -[PKPassBannerTrailingView _initWithStyle:configuration:]((uint64_t)[PKPassBannerTrailingView alloc], *((_QWORD *)v10 + 52), *((void **)v10 + 53));
      trailingView = v12->_trailingView;
      v12->_trailingView = (PKPassBannerTrailingView *)v15;

      -[PKPassBannerMinimalView addSubview:](v12, "addSubview:", v12->_leadingView);
      -[PKPassBannerMinimalView addSubview:](v12, "addSubview:", v12->_trailingView);
    }

    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPassBannerMinimalView _layoutWithBounds:commit:](self, "_layoutWithBounds:commit:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassBannerMinimalView;
  -[PKPassBannerMinimalView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPassBannerMinimalView bounds](self, "bounds");
  -[PKPassBannerMinimalView _layoutWithBounds:commit:](self, "_layoutWithBounds:commit:", 1);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 commit:(BOOL)a4
{
  _BOOL4 v4;
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
  _BOOL4 v16;
  PKPassBannerTrailingView *trailingView;
  UIImage *image;
  BOOL v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  PKPassBannerLeadingView *leadingView;
  PKPassBannerTrailingView *v27;
  double interitemPadding;
  PKPassBannerLeadingView *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGSize result;

  v4 = a4;
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PKPassBannerLeadingView sizeThatFits:](self->_leadingView, "sizeThatFits:", *MEMORY[0x1E0C9D820], v7);
  v9 = v8;
  v11 = v10;
  -[PKPassBannerTrailingView sizeThatFits:](self->_trailingView, "sizeThatFits:", v6, v7);
  v14 = v12;
  v15 = v13;
  v16 = v9 <= 0.0;
  if (v11 <= 0.0)
    v16 = 1;
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    v21 = 0;
    v22 = 1.0;
    v23 = 1.0;
    goto LABEL_20;
  }
  image = trailingView->_image;
  v20 = v12 > 0.0 && image != 0;
  v21 = v13 > 0.0 && v20;
  if (v16 || !v21)
  {
    if (v21)
      v22 = v13;
    else
      v22 = 1.0;
    if (v21)
      v23 = v14;
    else
      v23 = 1.0;
LABEL_20:
    if (v16)
      v24 = v22;
    else
      v24 = v11;
    if (v16)
      v25 = v23;
    else
      v25 = v9;
    if (v4)
    {
      v30 = v24;
      v32 = v25;
      leadingView = self->_leadingView;
      if (!v16)
        PKSizeAspectFit();
      PKSizeAlignedInRect();
      -[PKPassBannerLeadingView setFrame:](leadingView, "setFrame:");
      v27 = self->_trailingView;
      if (v21)
        PKSizeAspectFit();
      PKSizeAlignedInRect();
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  v25 = fmax(v9, v12);
  interitemPadding = self->_interitemPadding;
  v24 = v13 + v11 + interitemPadding;
  if (v4)
  {
    v30 = v15 + v11 + interitemPadding;
    v32 = v25;
    PKSizeAspectFit();
    PKSizeAspectFit();
    PKSizeAlignedInRect();
    v29 = self->_leadingView;
    PKRectRoundToPixel();
    -[PKPassBannerLeadingView setFrame:](v29, "setFrame:");
    PKSizeAlignedInRect();
    v27 = self->_trailingView;
    PKRectRoundToPixel();
LABEL_34:
    -[PKPassBannerTrailingView setFrame:](v27, "setFrame:", *(_QWORD *)&v30, *(_QWORD *)&v32);
    v24 = v31;
    v25 = v33;
  }
LABEL_37:
  result.height = v24;
  result.width = v25;
  return result;
}

- (void)_setInteritemPadding:(double)a3
{
  id WeakRetained;

  if (self->_interitemPadding != a3)
  {
    self->_interitemPadding = a3;
    -[PKPassBannerMinimalView setNeedsLayout](self, "setNeedsLayout");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "passBannerMinimalViewDidChangeSize:", self);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end
