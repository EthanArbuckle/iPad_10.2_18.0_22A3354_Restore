@implementation _SBUISystemApertureTextContainerView

- (id)initWithContentLabel:(id *)a1
{
  id v4;
  void *v5;
  id *v6;
  objc_super v8;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    objc_msgSend(v4, "bounds");
    v8.receiver = a1;
    v8.super_class = (Class)_SBUISystemApertureTextContainerView;
    v6 = (id *)objc_msgSendSuper2(&v8, sel_initWithFrame_);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 52, a2);
      objc_msgSend(a1, "addSubview:", v5);
    }
  }

  return a1;
}

- (void)setTransitionSize:(double)a3
{
  if (a1)
  {
    if (*((double *)a1 + 53) != a3 || *((double *)a1 + 54) != a4)
    {
      *((double *)a1 + 53) = a3;
      *((double *)a1 + 54) = a4;
      return (void *)objc_msgSend(a1, "setNeedsLayout");
    }
  }
  return a1;
}

- (void)layoutSubviews
{
  _SBUISystemApertureTextContainerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double height;
  double width;
  objc_super v13;

  v2 = self;
  v13.receiver = self;
  v13.super_class = (Class)_SBUISystemApertureTextContainerView;
  -[_SBUISystemApertureTextContainerView layoutSubviews](&v13, sel_layoutSubviews);
  -[_SBUISystemApertureTextContainerView bounds](v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!v2
    || (width = v2->_transitionSize.width,
        height = v2->_transitionSize.height,
        v2 = v2->_contentLabel,
        width == 0.0)
    && height == 0.0)
  {
    -[_SBUISystemApertureTextContainerView setBounds:](v2, "setBounds:", v4, v6, v8, v10);
  }
  UIRectGetCenter();
  -[_SBUISystemApertureTextContainerView setCenter:](v2, "setCenter:");

}

- (double)transitionSize
{
  if (a1)
    return *(double *)(a1 + 424);
  else
    return 0.0;
}

- (uint64_t)contentLabel
{
  if (result)
    return *(_QWORD *)(result + 416);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  if (self)
  {
    if (self->_transitionSize.width != 0.0 || self->_transitionSize.height != 0.0)
    {
      width = self->_transitionSize.width;
      height = self->_transitionSize.height;
      goto LABEL_7;
    }
    self = (_SBUISystemApertureTextContainerView *)self->_contentLabel;
  }
  -[_SBUISystemApertureTextContainerView sizeThatFits:](self, "sizeThatFits:", a3.width, a3.height);
LABEL_7:
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  if (!self)
    goto LABEL_5;
  width = self->_transitionSize.width;
  height = self->_transitionSize.height;
  if (width == 0.0 && height == 0.0)
  {
    self = (_SBUISystemApertureTextContainerView *)self->_contentLabel;
LABEL_5:
    -[_SBUISystemApertureTextContainerView intrinsicContentSize](self, "intrinsicContentSize");
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end
