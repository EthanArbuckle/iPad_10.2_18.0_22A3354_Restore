@implementation PKAnimatedNavigationBarTitleView

- (PKAnimatedNavigationBarTitleView)init
{
  return -[PKAnimatedNavigationBarTitleView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKAnimatedNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  PKAnimatedNavigationBarTitleView *v3;
  PKAnimatedNavigationBarTitleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAnimatedNavigationBarTitleView;
  v3 = -[PKAnimatedNavigationBarTitleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKAnimatedNavigationBarTitleView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (void)setTitleView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  UIView **p_titleView;
  UIView *titleView;
  UIView *v10;
  UIView *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  PKAnimatedNavigationBarTitleView *v15;
  UIView *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  UIView *v19;
  PKAnimatedNavigationBarTitleView *v20;
  _QWORD v21[4];
  UIView *v22;
  PKAnimatedNavigationBarTitleView *v23;

  v4 = a4;
  v7 = (UIView *)a3;
  p_titleView = &self->_titleView;
  titleView = self->_titleView;
  if (titleView != v7)
  {
    v10 = titleView;
    v11 = v10;
    if (v10)
      v12 = !v4;
    else
      v12 = 1;
    if (v12)
    {
      -[UIView removeFromSuperview](v10, "removeFromSuperview");
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v14 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke;
      v21[3] = &unk_1E3E61388;
      v22 = v10;
      v23 = self;
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_2;
      v18[3] = &unk_1E3E619E0;
      v19 = v22;
      v20 = self;
      objc_msgSend(v13, "pkui_animateUsingOptions:animations:completion:", 4, v21, v18);

    }
    objc_storeStrong((id *)&self->_titleView, a3);
    if (*p_titleView)
    {
      -[UIView superview](*p_titleView, "superview");
      v15 = (PKAnimatedNavigationBarTitleView *)objc_claimAutoreleasedReturnValue();

      if (v15 != self)
        -[PKAnimatedNavigationBarTitleView addSubview:](self, "addSubview:", *p_titleView);
      -[PKAnimatedNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
      self->_viewState = !v4;
      -[PKAnimatedNavigationBarTitleView layoutIfNeeded](self, "layoutIfNeeded");
      v16 = *p_titleView;
      if (v4)
      {
        -[UIView setAlpha:](v16, "setAlpha:", 0.0);
        self->_viewState = 1;
        -[PKAnimatedNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_3;
        v17[3] = &unk_1E3E612E8;
        v17[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "pkui_animateUsingOptions:animations:completion:", 4, v17, 0);
      }
      else
      {
        -[UIView setAlpha:](v16, "setAlpha:", 1.0);
      }
    }

  }
}

uint64_t __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "frame");
  PKSizeAlignedInRect();
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

void *__58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_2(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result != *(void **)(*(_QWORD *)(a1 + 40) + 416))
    return (void *)objc_msgSend(result, "removeFromSuperview");
  return result;
}

uint64_t __58__PKAnimatedNavigationBarTitleView_setTitleView_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

- (void)setTitleView:(id)a3 alpha:(double)a4
{
  UIView *v7;
  id *p_titleView;
  UIView *titleView;
  id v10;
  PKAnimatedNavigationBarTitleView *v11;
  double v12;
  UIView *v13;

  v7 = (UIView *)a3;
  p_titleView = (id *)&self->_titleView;
  titleView = self->_titleView;
  v10 = v7;
  v13 = v7;
  if (titleView != v7)
  {
    -[UIView removeFromSuperview](titleView, "removeFromSuperview", v7);
    objc_storeStrong((id *)&self->_titleView, a3);
    if (!*p_titleView)
      goto LABEL_7;
    objc_msgSend(*p_titleView, "superview");
    v11 = (PKAnimatedNavigationBarTitleView *)objc_claimAutoreleasedReturnValue();

    v10 = *p_titleView;
    if (v11 != self)
    {
      -[PKAnimatedNavigationBarTitleView addSubview:](self, "addSubview:", v10);
      -[PKAnimatedNavigationBarTitleView setNeedsLayout](self, "setNeedsLayout");
      -[PKAnimatedNavigationBarTitleView layoutIfNeeded](self, "layoutIfNeeded");
      v10 = *p_titleView;
    }
  }
  objc_msgSend(v10, "alpha");
  if (v12 != a4)
    objc_msgSend(*p_titleView, "setAlpha:", a4);
LABEL_7:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAnimatedNavigationBarTitleView;
  -[PKAnimatedNavigationBarTitleView layoutSubviews](&v5, sel_layoutSubviews);
  -[PKAnimatedNavigationBarTitleView bounds](self, "bounds");
  -[UIView sizeThatFits:](self->_titleView, "sizeThatFits:", v4, v3 + -10.0);
  PKSizeAspectFit();
  PKSizeAlignedInRect();
  -[UIView setFrame:](self->_titleView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
