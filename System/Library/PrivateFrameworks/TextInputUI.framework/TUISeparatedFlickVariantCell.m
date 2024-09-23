@implementation TUISeparatedFlickVariantCell

- (TUISeparatedFlickVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedFlickVariantCell;
  return -[TUIVariantCell initWithFrame:string:annotation:traits:](&v7, sel_initWithFrame_string_annotation_traits_, a4, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIEdgeInsets)backgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)labelInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 4.0;
  v3 = 4.0;
  v4 = 4.0;
  v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  void *v2;
  double v3;
  CGRect v5;

  -[TUIVariantCell backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v3 = CGRectGetHeight(v5) * 0.5;

  return v3;
}

- (id)highlightColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (void)transitionToHighlighted:(BOOL)a3
{
  double v3;
  _QWORD v4[5];
  BOOL v5;

  v3 = 0.2;
  if (a3)
    v3 = 0.05;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__TUISeparatedFlickVariantCell_transitionToHighlighted___block_invoke;
  v4[3] = &unk_1E24FC1D0;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v4, &__block_literal_global, v3, 0.0);
}

- (unint64_t)cornerMaskForBackground
{
  return 15;
}

- (UIView)touchesForwardingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_touchesForwardingView);
}

- (void)setTouchesForwardingView:(id)a3
{
  objc_storeWeak((id *)&self->_touchesForwardingView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchesForwardingView);
}

void __56__TUISeparatedFlickVariantCell_transitionToHighlighted___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.2;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

@end
