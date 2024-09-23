@implementation TUISeparatedVariantCell

- (TUISeparatedVariantCell)initWithFrame:(CGRect)a3 string:(id)a4 annotation:(id)a5 traits:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedVariantCell;
  return -[TUIVariantCell initWithFrame:string:annotation:traits:](&v7, sel_initWithFrame_string_annotation_traits_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

- (UIEdgeInsets)annotationLabelInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 10.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = -10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)highlightColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (void)transitionToHighlighted:(BOOL)a3
{
  double v5;
  uint64_t v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  if (a3)
    v5 = 0.05;
  else
    v5 = 0.2;
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke;
  v9[3] = &unk_1E24FC1D0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v9, &__block_literal_global_2549, v5, 0.0);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke_3;
  v7[3] = &unk_1E24FC1D0;
  v7[4] = self;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v7, &__block_literal_global_34_2550, v5, 0.0);
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

void __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke(uint64_t a1)
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

uint64_t __51__TUISeparatedVariantCell_transitionToHighlighted___block_invoke_3(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;

  if (*(_BYTE *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v6, 0.9, 0.9);
  }
  else
  {
    v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v6.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v6.c = v2;
    *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v3 = *(void **)(a1 + 32);
  v5 = v6;
  return objc_msgSend(v3, "setTransform:", &v5);
}

@end
