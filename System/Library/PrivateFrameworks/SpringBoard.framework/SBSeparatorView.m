@implementation SBSeparatorView

- (SBSeparatorView)initWithFrame:(CGRect)a3
{
  SBSeparatorView *v3;
  SBSeparatorView *v4;
  SBSeparatorNubView *v5;
  uint64_t v6;
  SBSeparatorNubView *nubView;
  SBSeparatorNubView *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSeparatorView;
  v3 = -[SBSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_nubStyle = 0;
    v5 = [SBSeparatorNubView alloc];
    v6 = -[SBSeparatorNubView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    nubView = v4->_nubView;
    v4->_nubView = (SBSeparatorNubView *)v6;

    -[SBSeparatorNubView _setCornerRadius:](v4->_nubView, "_setCornerRadius:", 2.0);
    -[SBSeparatorNubView setAlpha:](v4->_nubView, "setAlpha:", 1.0);
    v8 = v4->_nubView;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSeparatorNubView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[SBSeparatorNubView setUserInteractionEnabled:](v4->_nubView, "setUserInteractionEnabled:", 0);
    -[SBSeparatorView addSubview:](v4, "addSubview:", v4->_nubView);
    -[SBSeparatorView _updateNubViewFrame](v4, "_updateNubViewFrame");
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSeparatorView;
  -[SBSeparatorView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBSeparatorView _updateNubViewFrame](self, "_updateNubViewFrame");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSeparatorView;
  -[SBSeparatorView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBSeparatorView _updateNubViewFrame](self, "_updateNubViewFrame");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSeparatorView;
  -[SBSeparatorView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBSeparatorView _updateNubViewFrame](self, "_updateNubViewFrame");
}

- (void)setNubStyle:(unint64_t)a3
{
  double v4;
  id v5;

  if (self->_nubStyle != a3)
  {
    self->_nubStyle = a3;
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v4 = 0.0;
    }
    else
    {
      if (a3 == 1)
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v4 = 1.0;
    }
    -[SBSeparatorNubView setAlpha:](self->_nubView, "setAlpha:", v4);
    -[SBSeparatorNubView setBackgroundColor:](self->_nubView, "setBackgroundColor:", v5);

  }
}

- (void)setKeyboardHeight:(double)a3
{
  if (self->_keyboardHeight != a3)
  {
    self->_keyboardHeight = a3;
    -[SBSeparatorView _updateNubViewFrame](self, "_updateNubViewFrame");
  }
}

- (CGRect)nubRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBSeparatorNubView frame](self->_nubView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (CGSize)nubHitTestSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  SBRectWithSize();
  v3 = v2 + 40.0;
  v5 = v4 + 40.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)_updateNubViewFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  SBSeparatorNubView *nubView;
  CGRect v14;

  -[SBSeparatorView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBSeparatorView frame](self, "frame");
  v12 = (v11 - self->_keyboardHeight) * 0.5;
  nubView = self->_nubView;
  SBRectWithSize();
  -[SBSeparatorNubView setFrame:](nubView, "setFrame:");
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  -[SBSeparatorNubView setCenter:](self->_nubView, "setCenter:", CGRectGetMidX(v14), v12);
}

- (unint64_t)nubStyle
{
  return self->_nubStyle;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (SBSeparatorNubView)nubView
{
  return self->_nubView;
}

- (void)setNubView:(id)a3
{
  objc_storeStrong((id *)&self->_nubView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nubView, 0);
}

@end
